----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:20:38 10/25/2012 
-- Design Name: 
-- Module Name:    scrod_top_A5_KLM_9UMB - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;
Library UNIMACRO;
use UNIMACRO.vcomponents.all;

use work.all;

use work.readout_definitions.all;
use work.tdc_pkg.all;
use work.time_order_pkg.all;
use work.conc_intfc_pkg.all;
use work.klm_scrod_pkg.all;
--use work.asic_definitions_irs2_carrier_revA.all;
--use work.CarrierRevA_DAC_definitions.all;

entity scrod_top_A5_KLM_9UMB is
    generic(
        NUM_GTS                 : integer := 1;
        DAQ_IFACE				: string :="Ethernet";  --main readout interface is ethernet -- still gets clock from FTSW for testing
--	      DAQ_IFACE				: string :="KEKDAQ"; --ain readout interface is KEK DAQ system
	 	 -- uncomment one of these lines only to comiple with the given configuration
--        HW_CONF				: string :="SA4_MBA_DCA_RB_I" --SCROD A4, MB A, TXDC A, RHIC B, with Interconnect board
--	      HW_CONF				: string :="SA4_MBSF_TX" --SCROD A4, MB SciFi, TX SificDC 
--	      HW_CONF				: string :="SA3_MBA_DCA_RB" 	 --SCROD A3, MB A, TXDC A, RHIC B
--	      HW_CONF				: string :="SA4_MBB_DCB_RB" 	 --SCROD A4, MB B, TXDC A, RHIC B
        HW_CONF					: string :="SA5_MBC_DCC_RC" 	 --SCROD A5, MB C, TXDC C, RHIC C
        );
    Port(
		--BUS A Specific Signals
		BUS_REGCLR                    : out STD_LOGIC;
		BUSA_WR_ADDRCLR               : out STD_LOGIC;
		BUSA_RD_ENA					  : out STD_LOGIC;
		BUSA_RD_ROWSEL_S			  : out STD_LOGIC_VECTOR(2 downto 0);
		BUSA_RD_COLSEL_S			  : out STD_LOGIC_VECTOR(5 downto 0);
		BUSA_CLR					  : out STD_LOGIC;
		BUSA_RAMP					  : out STD_LOGIC;
		BUSA_SAMPLESEL_S			  : out STD_LOGIC_VECTOR(4 downto 0);
		BUSA_SR_CLEAR			      : out STD_LOGIC;
		BUSA_SR_SEL				      : out STD_LOGIC;
		BUSA_DO					      : in STD_LOGIC_VECTOR(15 downto 0);
		
		--ASIC DAC Update Signals
		SIN							  : out STD_LOGIC;
		PCLK						  : out STD_LOGIC;
		SHOUT						  : in STD_LOGIC;
		SCLK					      : out STD_LOGIC;

		--Digitization and sampling Signals
		WL_CLK_N					  : out STD_LOGIC;
		WL_CLK_P					  : out STD_LOGIC;
		WR1_ENA						  : out STD_LOGIC;
		WR2_ENA						  : out STD_LOGIC;

		SSTIN_N						  : out STD_LOGIC;
		SSTIN_P						  : out STD_LOGIC;
		
		--Serial Readout Signals
		SR_CLOCK					  : out STD_LOGIC;
		SAMPLESEL_ANY 				  : out STD_LOGIC;
		
		--Trigger Signals
		TDC1_TRG					  : in STD_LOGIC_VECTOR(4 downto 0);
		
		--DAC signals
		DAC_SCL                       : out std_logic;
		DAC_SDA                       : inout std_logic;
		
		--Ethernet Signals
	    glbl_rst                      : in  std_logic;   
        clk_in_p                      : in  std_logic; -- 200MHz clock input from board
        clk_in_n                      : in  std_logic;
        gtx_clk_bufg_out              : out std_logic; -- 125 MHz clock output from MMCM
        phy_resetn                    : out std_logic;
        rgmii_txd                     : out std_logic_vector(3 downto 0); -- RGMII 
        rgmii_tx_ctl                  : out std_logic;
        rgmii_txc                     : out std_logic;
        rgmii_rxd                     : in  std_logic_vector(3 downto 0);
        rgmii_rx_ctl                  : in  std_logic;
        rgmii_rxc                     : in  std_logic;
        mdio                          : inout std_logic; -- Management signals
        mdc                           : out std_logic;   
        tx_statistics_s               : out std_logic;
        rx_statistics_s               : out std_logic;
        pause_req_s                   : in  std_logic; 
        mac_speed                     : in  std_logic_vector(1 downto 0);
        update_speed                  : in  std_logic;
        config_board                  : in  std_logic;
        serial_response               : out std_logic;
        gen_tx_data                   : in  std_logic;
        chk_tx_data                   : in  std_logic;
        reset_error                   : in  std_logic;
        activity_flash                : out std_logic;
        activity_flashn               : out std_logic;

        SMP_EXTSYNC           : out std_logic
	);
end scrod_top_A5_KLM_9UMB;

architecture Behavioral of scrod_top_A5_KLM_9UMB is
	signal internal_BOARD_CLOCK_OUT        : std_logic;
	signal internal_CLOCK_FPGA_LOGIC       : std_logic;
	signal internal_CLOCK_MPPC_DAC         : std_logic;
	
	signal internal_CLOCK_ASIC_CTRL_WILK   : std_logic;
	signal internal_CLOCK_B2TT_SYS	       : std_logic;	
	signal internal_CLOCK_MPPC_ADC         : std_logic;
	signal internal_CLOCK_TRIG_SCALER      : std_logic;
    signal gtx_clk_bufg_out_i              : std_logic;

	signal internal_OUTPUT_REGISTERS       : GPR;
	signal internal_INPUT_REGISTERS        : RR;
	signal i_register_update               : RWT;
	signal internal_STATREG_REGISTERS	   : STATREG;
	
	--Trigger readout
	signal internal_SOFTWARE_TRIGGER       : std_logic;
	signal internal_HARDWARE_TRIGGER       : std_logic;
	signal internal_TRIGGER                : std_logic;
	signal internal_TRIGGER_OUT            : std_logic;
	
	--Vetoes for the triggers
	signal internal_SOFTWARE_TRIGGER_VETO      : std_logic;
	signal internal_HARDWARE_TRIGGER_ENABLE    : std_logic;
	
	--SCROD ID and REVISION Number
	signal internal_SCROD_REV_AND_ID_WORD       : STD_LOGIC_VECTOR(31 downto 0);
    signal internal_EVENT_NUMBER_TO_SET         : STD_LOGIC_VECTOR(31 downto 0) := (others => '0'); --This is what event number will be set to when set event number is enabled
    signal internal_SET_EVENT_NUMBER            : STD_LOGIC;
    signal internal_EVENT_NUMBER                : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

	--Event builder + readout interface waveform data flow related
	signal internal_WAVEFORM_FIFO_DATA_OUT       : std_logic_vector(31 downto 0) := (others => '0');
	signal internal_WAVEFORM_FIFO_EMPTY          : std_logic := '0';
	signal internal_WAVEFORM_FIFO_DATA_VALID     : std_logic := '0';
	signal internal_WAVEFORM_FIFO_READ_CLOCK     : std_logic := '0';
	signal internal_WAVEFORM_FIFO_READ_ENABLE    : std_logic := '0';
	signal internal_WAVEFORM_PACKET_BUILDER_BUSY : std_logic := '0';
	signal internal_WAVEFORM_PACKET_BUILDER_VETO : std_logic := '0';
	signal internal_USB_FIFO_CLOCK				 : std_logic:='0';
	
	signal internal_EVTBUILD_FIFO_DATA_OUT		 : std_logic_vector(31 downto 0) := (others => '0');
	signal internal_EVTBUILD_FIFO_EMPTY          : std_logic := '0';
	signal internal_EVTBUILD_FIFO_DATA_VALID     : std_logic := '0';
	signal internal_EVTBUILD_FIFO_READ_CLOCK     : std_logic := '0';
	signal internal_EVTBUILD_FIFO_READ_ENABLE    : std_logic := '0';
	
	signal internal_READOUT_DATA_OUT			    : std_logic_vector(31 downto 0) := (others => '0');
	signal internal_READOUT_DATA_VALID				: std_logic := '0';
	signal internal_READOUT_EMPTY					: std_logic := '0';
	signal internal_READOUT_READ_CLOCK              : std_logic := '0';
	signal internal_READOUT_READ_ENABLE				: std_logic := '0';
	
	signal internal_EVTBUILD_DATA_OUT              : std_logic_vector(31 downto 0) := (others => '0');
	signal internal_EVTBUILD_EMPTY                 : std_logic := '0';
	signal internal_EVTBUILD_DATA_VALID            : std_logic := '0';
	signal internal_EVTBUILD_READ_CLOCK            : std_logic := '0';
	signal internal_EVTBUILD_READ_ENABLE           : std_logic := '0';
	signal internal_EVTBUILD_PACKET_BUILDER_BUSY   : std_logic := '0';
	signal internal_EVTBUILD_PACKET_BUILDER_VETO   : std_logic := '0';
	signal internal_EVTBUILD_START_BUILDING_EVENT  : std_logic := '0';
	signal internal_EVTBUILD_DONE_SENDING_EVENT    : std_logic := '0';
	
	--External Trig Control:
--	signal internal_EX_TRIGGER_MB	   : std_logic:='0';
	signal internal_EX_TRIGGER_SCROD   : STD_LOGIC:='0';
		
	--ASIC TRIGGER CONTROL
	signal internal_TRIGGER_ALL                : std_logic := '0';
	signal internal_TRIGGER_ASIC               : std_logic_vector(9 downto 0) := "0000000000";
	signal internal_TRIGGER_ASIC_control_word  : std_logic_vector(9 downto 0) := "0000000000";
	signal internal_TRIGCOUNT_ena              : std_logic := '0';
	signal internal_TRIGCOUNT_rst              : std_logic := '0';
	constant TRIGGER_SCALER_BIT_WIDTH          : integer := 32;
	
	type TARGETX_TRIGGER_SCALERS is array(9 downto 0) of std_logic_vector(TRIGGER_SCALER_BIT_WIDTH-1 downto 0);	
	
	signal internal_TRIGCOUNT_scaler           : TARGETX_TRIGGER_SCALERS;
	signal internal_TRIGCOUNT_scaler_main      : std_logic_vector(TRIGGER_SCALER_BIT_WIDTH-1 downto 0);
	signal internal_READ_ENABLE_TIMER          : std_logic_vector (9 downto 0);
	signal internal_TXDCTRIG                   : tb_vec_type;-- All triger bits from all ASICs
	signal internal_ext_TXDCTRIG               : tb_vec_type;-- All triger bits from all ASICs
	signal internal_ext_TRIGDEC_TXDCTRIG       : tb_vec_type;-- All triger bits from all ASICs- they will be extended even more
	
	signal internal_TXDCTRIG16                 : std_logic_vector(1 to TDC_NUM_CHAN);-- All triger bits from all ASICs
--	signal internal_TXDCTRIG_buf               : tb_vec_type;-- All triger bits from all ASICs
--	signal internal_TXDCTRIG16_buf             : std_logic_vector(1 to TDC_NUM_CHAN);-- All triger bits from all ASICs
	
	signal internal_SMP_EXTSYNC	               : std_logic:='0';
	
	signal internal_TRIG_BRAM_WE	          :	std_logic := '0';
	signal internal_TRIG_BRAM_WEA	          : std_logic_vector(0 downto 0) := "0";
    signal internal_TRIG_BRAM_ADDR            : std_logic_vector(8 downto 0) := (others=> '0');
	signal internal_TRIG_BRAM_PEDSUB_ADDR     : std_logic_vector(8 downto 0) := (others=> '0'); 
	signal internal_TRIG_BRAM_LKBK_ADDR       : std_logic_vector(8 downto 0) := (others=> '0'); 
	signal internal_TRIG_BRAM_DATA            : std_logic_vector(49 downto 0) := (others=> '0');
	signal internal_TRIG_BRAM_PEDSUB_SEL      : std_logic := '0';
	signal internal_alltb                     : std_logic_vector(49 downto 0) := (others=> '0');
	signal internal_TRIG_BRAM_DINA            : std_logic_vector(49 downto 0) := (others=> '0');
	
	--ASIC DAC CONTROL
	signal internal_DAC_CONTROL_UPDATE         : std_logic := '0';
	signal internal_DAC_CONTROL_busy           : std_logic := '0';
	signal internal_DAC_CONTROL_REG_DATA       : std_logic_vector(18 downto 0) := (others => '0');
	signal internal_DAC_CONTROL_TDCNUM         : std_logic;
	signal internal_DAC_CONTROL_SIN            : std_logic := '0';
	signal internal_DAC_CONTROL_SCLK           : std_logic := '0';
	signal internal_DAC_CONTROL_PCLK           : std_logic := '0';
	signal internal_DAC_CONTROL_LOAD_PERIOD    : std_logic_vector(15 downto 0) := (others => '0');
	signal internal_DAC_CONTROL_LATCH_PERIOD   : std_logic_vector(15 downto 0) := (others => '0');
	signal internal_TDC_CS_DAC                 : std_logic_vector(9 downto 0);
	signal internal_WL_CLK_N				   : std_logic := '0';

	--READOUT CONTROL
	signal internal_READCTRL_trigger               : std_logic := '0';
	signal internal_READCTRL_trig_delay            : std_logic_vector(11 downto 0) := (others => '0');
	signal internal_READCTRL_dig_offset            : std_logic_vector(8 downto 0) := (others => '0');
	signal internal_READCTRL_win_num_to_read       : std_logic_vector(8 downto 0) := (others => '0');
	signal internal_READCTRL_asic_enable_bits      : std_logic_vector(9 downto 0) := (others => '0');
	signal internal_READCTRL_readout_reset         : std_logic := '0';
	signal internal_READCTRL_readout_continue      : std_logic := '0';
	signal internal_READCTRL_busy_status           : std_logic := '0';
	signal internal_READCTRL_smp_stop              : std_logic := '0';
	signal internal_READCTRL_dig_start             : std_logic := '0';
	signal internal_READCTRL_DIG_RD_ROWSEL         : std_logic_vector(2 downto 0) := (others => '0');
	signal internal_READCTRL_DIG_RD_COLSEL         : std_logic_vector(5 downto 0) := (others => '0');
	signal internal_READCTRL_srout_start           : std_logic := '0';
	signal internal_READCTRL_srout_restart         : std_logic := '0';
	signal internal_PEDMAN_calc_peds_en	           : std_logic := '0';
	signal internal_READCTRL_evtbuild_start        : std_logic := '0';
	signal internal_READCTRL_evtbuild_make_ready   : std_logic := '0';
	signal internal_READCTRL_LATCH_SMP_MAIN_CNT    : std_logic_vector(8 downto 0) := (others => '0');
	signal internal_READCTRL_LATCH_DONE            : std_logic := '0';
	signal internal_READCTRL_ASIC_NUM              : std_logic_vector(3 downto 0) := (others => '0');
	signal internal_READCTRL_RESET_EVENT_NUM       : std_logic := '0';
	signal internal_READCTRL_EVENT_NUM             : std_logic_vector(31 downto 0) := x"00000000";
	signal internal_READCTRL_READOUT_DONE          : std_logic := '0';
	signal internal_READCTRL_dig_win_start         : std_logic_vector(8 downto 0) := (others => '0');
	signal internal_ASIC_TRIG                      : std_logic := '0';
	signal internal_PEDSUB_start                   : std_logic := '0';
	signal internal_PEDSUB_busy                    : std_logic := '0';
	signal internal_ped_sub_busy                   : std_logic := '0';
	
	----readout trigger modes and signals
	signal internal_TRIG_SW			: std_logic := '0';
	signal internal_TRIG_KLM1		: std_logic := '0';
	signal internal_TRIG_KLM2		: std_logic := '0';
	signal internal_TRIG_HW1		: std_logic := '0';
	signal internal_TRIG_PEDMAN	    : std_logic := '0';
	
	signal internal_CMDREG_RESET_SAMPLIG_LOGIC                 : std_logic :='0';
	signal internal_CMDREG_SAMPLIG_LOGIC_RESET_PARAMS          : std_logic_vector(15 downto 0) := (others => '0');
	signal internal_CMDREG_SOFTWARE_trigger                    : std_logic := '0';
	signal internal_CMDREG_SOFTWARE_TRIGGER_VETO               : std_logic := '0';
	signal internal_CMDREG_HARDWARE_TRIGGER_ENABLE             : std_logic := '0';
	signal internal_CMDREG_READCTRL_trig_delay                 : std_logic_vector(11 downto 0) := (others => '0');
	signal internal_CMDREG_READCTRL_dig_offset                 : std_logic_vector(8 downto 0) := (others => '0');
	signal internal_CMDREG_READCTRL_win_num_to_read            : std_logic_vector(8 downto 0) := (others => '0');
	signal internal_CMDREG_READCTRL_asic_enable_bits           : std_logic_vector(9 downto 0) := (others => '0');
	signal internal_CMDREG_READCTRL_readout_reset              : std_logic := '0';
	signal internal_CMDREG_READCTRL_readout_continue           : std_logic := '0';
	signal internal_CMDREG_WAVEFORM_FIFO_RST                   : std_logic := '0';
	signal internal_CMDREG_EVTBUILD_START_BUILDING_EVENT       : std_logic := '0';
	signal internal_CMDREG_EVTBUILD_MAKE_READY                 : std_logic := '0';
	signal internal_CMDREG_EVTBUILD_DONE_SENDING_EVENT         : std_logic := '0';
	signal internal_CMDREG_EVTBUILD_PACKET_BUILDER_BUSY        : std_logic := '0';
	signal internal_CMDREG_READCTRL_RESET_EVENT_NUM            : std_logic := '0';
	signal internal_CMDREG_readctrl_ramp_length                : std_logic_vector(15 downto 0) := (others => '0');
	signal internal_cmdreg_readctrl_use_fixed_dig_start_win    : std_logic_vector(15 downto 0):= (others => '0');
	signal internal_CMDREG_SW_STATUS_READ                      : std_logic;

	--pedestal handling unit using command regs
	signal internal_CMDREG_PedCalcReset			       : std_logic := '0';
	signal internal_CMDREG_PedmanEnable			       : std_logic := '0';
	signal internal_PedSubEnable			           : std_logic := '0';
	signal internal_CMDREG_PedCalcNAVG			       : std_logic_vector(3 downto 0) := x"3";-- 2**3=8 averages for calculating peds
	signal internal_CMDREG_PedDemuxFifoEnable		   : std_logic := '1';-- this out put will replace the common readout fifo from the SRreadout module
	signal internal_CMDREG_PedDemuxFifoOutputSelect    : std_logic_vector(1 downto 0);
	signal internal_CMDREG_PedStatSelect               : std_logic; --select between mean and mean deviation
	signal internal_CMDREG_PedSubCalcMode              : std_logic_vector(3 downto 0);
	signal internal_CMDREG_USE_KLMTRIG                 : std_logic := '0';
	signal internal_CMDREG_KLMTRIG_CAL_READOUT_MODE    : std_logic := '0';
	signal internal_CMDREG_USE_SCRODLINK               : std_logic := '0';
	signal internal_SCRODLINK_RX_TRIG                  : std_logic := '0';
--	signal internal_SCRODLINK_TX_TRIG                  : std_logic := '0';
	signal internal_PedCalcNiter                       : std_logic_vector(15 downto 0) := (others=>'0');
	signal internal_KLM_SCINT_MISSED_TRG               : std_logic_vector(15 downto 0) := (others=>'0');
	signal internal_waveformpedsub_reset               : std_logic := '0';
	
	--ASIC SAMPLING CONTROL
	signal internal_SMP_MAIN_CNT 			: std_logic_vector(8 downto 0) := (others => '0');
	signal internal_SSTIN 					: std_logic := '0';
	signal internal_SSPIN 					: std_logic := '0';
	signal internal_WR_STRB 				: std_logic := '0';
	signal internal_WR_ADVCLK 				: std_logic := '0';
	signal internal_WR_ENA 					: std_logic := '1';
	signal internal_WR_ADDRCLR 			    : std_logic := '0';
	signal internal_samplinglgc_reset       : std_logic := '0';
	signal internal_dig_idle_statusn        : std_logic := '1';
	
	--ASIC DIGITIZATION CONTROL
	signal internal_DIG_STARTDIG 			: std_logic := '0';
	signal internal_DIG_IDLE_status 		: std_logic := '0';
	signal internal_DIG_RD_ENA 			    : std_logic := '0';
	signal internal_DIG_CLR 				: std_logic := '0';

	signal internal_DIG_RD_ROWSEL_S 		: STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
	signal internal_DIG_RD_COLSEL_S 		: STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
	signal internal_DIG_START 				: STD_LOGIC := '0';
	signal internal_DIG_RAMP 				: STD_LOGIC := '0';
	
	--ASIC SERIAL READOUT
	signal internal_SROUT_START 			: std_logic := '0';
	signal internal_SROUT_IDLE_status 	    : std_logic := '0';
	signal internal_SROUT_SAMP_DONE 		: std_logic := '0';
	signal internal_SROUT_SR_CLR 			: std_logic := '0';

	signal internal_SROUT_SR_CLK 			: std_logic := '0';
	signal internal_SROUT_SR_SEL 			: std_logic := '0';

	signal internal_SROUT_SAMPLESEL 		: std_logic_vector(4 downto 0) := (others => '0');
	signal internal_SROUT_SAMPLESEL_ANY     : std_logic := '0';

	signal internal_SROUT_FIFO_WR_CLK                  : std_logic := '0';
	signal internal_SROUT_FIFO_WR_EN                   : std_logic := '0';
	signal internal_SROUT_FIFO_DATA_OUT                : std_logic_vector(31 downto 0) := (others => '0');
	signal internal_SROUT_FIFO_WR_CLK_waveformfifo     : std_logic := '0';
	signal internal_SROUT_FIFO_WR_EN_waveformfifo      : std_logic := '0';
	signal internal_SROUT_FIFO_DATA_OUT_waveformfifo   : std_logic_vector(31 downto 0) := (others => '0');
	signal internal_SROUT_dout 		  	               : std_logic_vector(15 downto 0) := (others => '0');
	signal internal_SROUT_ASIC_CONTROL_WORD            : std_logic_vector(9 downto 0) := (others => '0');
	signal internal_CMDREG_SROUT_TPG                   : std_logic := '0';
	signal internal_SROUT_ALLWIN_DONE                  : std_logic := '0';
    
    signal internal_win_addr                           : std_logic_vector(8 downto 0);
	
	--WAVEFORM DATA FIFO
	signal internal_WAVEFORM_FIFO_RST 	        : std_logic := '0';
	signal internal_EVTBUILD_MAKE_READY         : std_logic := '0';
	
	--BUFFER CONTROL
	signal internal_BUFFERCTRL_FIFO_RESET	        : std_logic := '0';
	signal internal_BUFFERCTRL_FIFO_WR_CLK          : std_logic := '0';
	signal internal_BUFFERCTRL_FIFO_WR_EN 	        : std_logic := '0';
	signal internal_BUFFERCTRL_FIFO_DIN 	        : std_logic_vector(31 downto 0) := (others => '0');
	
	--MPPC Current Read ADCs
	signal internal_CurrentADC_reset			: std_logic;
	signal internal_SDA							: std_logic;
	signal internal_SCL							: std_logic;
	signal internal_runADC						: std_logic;
	signal internal_enOutput					: std_logic;
	signal internal_ADCOutput 					: std_logic_vector(11 downto 0);
	signal internal_AMUX_S						: std_logic_vector(7 downto 0);
	signal internal_MCP_ADC_counter			    : std_logic_vector(23 downto 0);
	signal internal_TEST_MUX					: std_logic_vector(26 downto 0);
	
	-- MPPC DAC
	signal i_dac_number            : std_logic_vector(3 downto 0);
	signal i_dac_addr              : std_logic_vector(3 downto 0);
	signal i_dac_value             : std_logic_vector(7 downto 0);
	signal i_dac_update            : std_logic;
	signal i_dac_update_extended   : std_logic;
	signal i_dac_busy              : std_logic:='0';
	signal i_hv_sck_dac            : std_logic;
	signal i_hv_din_dac            : std_logic;

	signal internal_DAC_PATGEN_ADDR    : std_logic_vector(3 downto 0);
	signal internal_DAC_PATGEN_VAL     : std_logic_vector(7 downto 0);
	signal internal_DAC_PATGEN_UPDATE  : std_logic;
	signal internal_DAC_BUSY           : std_logic;

	signal internal_TDC_MON_TIMING_buf         : std_logic_vector(9 downto 0);
	signal internal_CMDREG_UPDATE_STATUS_REGS  : std_logic;

----------------SRAM  Signals
	signal internal_CMDREG_RAMADDR         : std_logic_vector (21 downto 0);
	signal internal_CMDREG_RAMDATAWR       : std_logic_vector(7 downto 0);
	signal internal_CMDREG_RAMUPDATE       : std_logic;
	signal internal_CMDREG_RAMDATARD       : std_logic_vector(7 downto 0);
	signal internal_CMDREG_RAMRW           : std_logic;
	signal internal_CMDREG_RAMBUSY         : std_logic;
    -- Mutlti port RAM driver channels: ch 0: USB, ch 1: Run Control pedestal write, ch 2: waveform demux+ped subtraction, ch 3: waveform demux + ped calculation  
    signal internal_ram_Ain                : AddrArray;--:= (others => '0');
    signal internal_ram_DWin               : DataArray;-- := (others => '0');
    signal internal_ram_rw                 : std_logic_vector(NRAMCH-1 downto 0) := (others => '0');
    signal internal_ram_update             : std_logic_vector(NRAMCH-1 downto 0) := (others => '0');
    signal internal_ram_DRout              : DataArray;
    signal internal_ram_busy               : std_logic_vector(NRAMCH-1 downto 0);
	signal RAM_IOw_i                       : std_logic_vector(7 downto 0);
	signal RAM_IOr_i                       : std_logic_vector(7 downto 0);
	signal RAM_IO_bs_i                     : std_logic;
	signal RAM_A                           : std_logic_vector(21 downto 0);
	signal RAM_A1                          : std_logic_vector(21 downto 0);
	signal RAM_WEn                         : std_logic_vector(0 downto 0);
-------------------------------------
	signal internal_pswfifo_d              : std_logic_vector(31 downto 0);
	signal internal_pswfifo_clk            : std_logic;
	signal internal_pswfifo_en             : std_logic;
	signal internal_bram_rd_data           : STD_LOGIC_VECTOR(19 DOWNTO 0) := x"00000";
	signal internal_bram_rd_addr           : std_logic_vector(10 downto 0) := "00000000000";
    signal internal_bram2_rd_data          : std_logic_vector(19 downto 0) := (others => '0');
	signal internal_bram2_rd_addr          : std_logic_vector(10 downto 0) := (others => '0');
	signal internal_bram_addrb			   : std_logic_vector(10 downto 0) := "00000000000";
	signal internal_pedsub_bram_addr       : std_logic_vector(10 downto 0) := "00000000000";
	signal internal_pedcalc_bram_addr      : std_logic_vector(10 downto 0) := "00000000000";
	signal internal_pedcalc_bram2_addr     : std_logic_vector(10 downto 0) := (others => '0');
	signal internal_qt_fifo_d		       : STD_LOGIC_VECTOR(17 DOWNTO 0) := "00" & x"0000";
	signal internal_qt_fifo_empty	       : std_logic;
	signal internal_qt_fifo_almost_empty   : std_logic;
	signal internal_qt_fifo_rd_clk	       : std_logic := '0';
	signal internal_qt_fifo_rd_en	       : std_logic := '0';
	signal internal_qt_fifo_evt_rdy	       : std_logic;
	signal internal_trig_ctime		       : std_logic_vector(26 downto 0) := (others => '0');
	signal internal_TRIG_EVENT_NO		   : std_logic_vector(15 downto 0) := x"0000";
	signal internal_scint_b2tt_runreset    : std_logic := '0';
	signal internal_scint_b2tt_runreset_i  : std_logic := '0';


    signal internal_rcl_fifo_rd_clk	        : std_logic := '0';
    signal internal_rcl_fifo_rd_en 	        : std_logic := '0';
    signal internal_rcl_fifo_data		    : std_logic_vector(31 downto 0);
    signal internal_rcl_fifo_empty	        : std_logic := '0';
    signal internal_CTRL_MODE			    : std_logic_vector(3 downto 0);

----------Internal Trig_decision Logic
    signal internal_TRIGDEC_ax					: std_logic_vector(2 downto 0):= "000";
    signal internal_TRIGDEC_ay					: std_logic_vector(2 downto 0):= "000";
    signal internal_TRIGDEC_asic_enable_bits	: std_logic_vector(9 downto 0):= "0000000000";
    signal internal_CMDREG_USE_TRIGDEC			: std_logic := '0';	
    signal internal_TRIGDEC_trig				: std_logic := '0';
    signal internal_CMDREG_TRIGDEC_TRIGMASK	    : std_logic_vector(14 downto 0) := "000001111111111";
    signal internal_CMDREG_PDAQ_DATA_MODE       : std_logic_vector(3 downto 0) := x"0";
    signal internal_CMDREG_PDAQ_DATA_CHMASK     : std_logic_vector(15 downto 0) := x"0000";
    
    signal internal_LKBK_READCTRL_ASIC_ENABLE_BITS  : std_logic_vector(9 downto 0) := "0000000000";
    signal internal_LKBK_ALL_ASIC_ENABLE_BITS       : std_logic_vector(9 downto 0) := "0000000000";
    signal internal_LKBK_ASIC_ENABLE_BITS           : std_logic_vector(9 downto 0) := "0000000000";
    signal internal_TRIG_BRAM_LKBK                  : integer := 0;
    
    signal internal_CMGREG_TRIG_SCALER_CLK_MAX			: std_logic_vector(15 downto 0) := x"0010";--scaler counter max values
    signal internal_CMGREG_TRIG_SCALER_CLK_MAX_TRIGDEC	: std_logic_vector(15 downto 0) := x"0010";
    	
    ---------------Pedestal management--------------
    signal internal_CMDREG_PedCalcStart                 : std_logic := '0';
    signal internal_CMDREG_PedCalcWinLen                : std_logic_vector(15 downto 0) := (others=>'0');
    signal internal_CMDREG_PedCalcASICen                : std_logic_vector(9 downto 0) := (others=>'0');
    signal internal_PEDMAN_ReadoutTrig                  : std_logic := '0';
    signal internal_CMDREG_PedManBusy                   : std_logic := '0';
    signal internal_PEDMAN_CurWin		                : std_logic_vector(8 downto 0) := (others=>'0');
    signal internal_PEDMAN_CurASICen                    : std_logic_vector(9 downto 0) := (others=>'0'); 
    signal internal_PEDMAN_readout_reset                : std_logic := '0';
    signal internal_READCTRL_use_fixed_dig_start_win    : std_logic_vector(15 downto 0) := (others=>'0');	
    signal internal_PEDCALC_PedCalcBusy                 : std_logic := '0';
    signal internal_PEDMAN_readout_continue             : std_logic := '0';
    signal internal_klm_trig_ctime	                    : std_logic_vector(26 downto 0) := (others => '0');
    signal internal_klm_trig			                : std_logic;
    signal CONTROL0						                : std_logic_vector(35 DOWNTO 0);
    signal vio_ASYNC_IN                                 : STD_LOGIC_VECTOR(47 DOWNTO 0);
    signal vio_ASYNC_OUT                                : STD_LOGIC_VECTOR(47 DOWNTO 0);
    
    signal internal_EXTRIG                                  : std_logic := '0';
    signal internal_cmdreg_use_extrig                       : std_logic_vector(2 downto 0) := "000";
    signal internal_auto_EXT_TRIG_counter                   : std_logic_vector(31 downto 0);
    signal internal_CMDREG_READCTRL_inc_asic_enable_bits    : std_logic_vector(9 downto 0);
    signal internal_auto_EXT_TRIG_inc_asic_counter          : std_logic_vector(3 downto 0);
    signal internal_CMDREG_USE_EXTRIG_PERIOD                : std_logic_vector(4 downto 0);
    
    signal internal_EXTRIG_counter_trig : std_logic;--_vector(31 downto 0);
    signal internal_CMDREG_HVEN         : std_logic := '0';
    signal trg_l_1                      : tb_vec_type;
    signal trg_l_2                      : tb_vec_type;
    signal trg_l_3                      : tb_vec_type;
    signal trg_l_4                      : tb_vec_type;
    signal trg_l_5                      : tb_vec_type;

	signal internal_klm_status_regs        : stat_reg_type;
	signal internal_tx_udp_data            : std_logic_vector(7 downto 0);
	signal internal_tx_udp_valid           : std_logic;
	signal internal_tx_udp_valid_lo        : std_logic;	
	signal internal_tx_udp_valid_hi        : std_logic;	
	signal internal_tx_udp_ready           : std_logic;
	signal internal_udp_clk                : std_logic;
	signal internal_udp_wavtx_fifo_empty   : std_logic;

	signal kpp_tx_fifo_clk				: std_logic;
	signal kpp_tx_fifo_re				: std_logic;
	signal kpp_tx_fifo_do				: std_logic_vector(7 downto 0);
	signal kpp_tx_fifo_epty				: std_logic;
	signal kpp_tx_fifo_aepty			: std_logic;

	signal internal_CMDREG_EXTTB_FORMAT	         : std_logic_vector(3 downto 0);
	signal trigasic_bram_rd_addr		         : std_logic_vector(8 downto 0);
	signal trigasic_bram_rd_data		         : std_logic_vector(3 downto 0) := (others => '0');

    
	signal internal_auto_EXT_TRIG_counter_temp : std_logic_vector(31 downto 0):= (others => '0'); --added to get rid of error

    signal internal_ped_dac_reg1 : std_logic_vector(15 downto 0) := (others => '0');
    signal internal_ped_dac_reg2 : std_logic_vector(15 downto 0) := (others => '0');
    
    signal DAC_SDA_i : std_logic;
    signal DAC_SCL_i : std_logic;
    signal locked : std_logic;
   
    signal external_SMP_EXTSYNC : std_logic;
    
    signal test1_12 : std_logic_vector(11 downto 0);
    
    attribute keep : string;
    attribute keep of internal_srout_dout :signal  is "true";
    attribute keep of internal_srout_samplesel :signal  is "true";
    attribute keep of internal_srout_sr_sel :signal  is "true";
    attribute keep of internal_srout_sr_clr :signal  is "true";
    attribute keep of internal_dig_rd_ena :signal  is "true";
    attribute keep of internal_readctrl_dig_rd_rowsel :signal  is "true";
    attribute keep of internal_readctrl_dig_rd_colsel :signal  is "true";
    attribute keep of internal_dig_clr :signal  is "true";
    attribute keep of internal_cmdreg_srout_tpg :signal  is "true";
    attribute keep of internal_dig_ramp :signal  is "true";
    attribute keep of internal_wr_addrclr :signal  is "true";
    attribute keep of internal_clock_asic_ctrl_wilk :signal  is "true";
    attribute keep of internal_srout_samplesel_any :signal  is "true";
    attribute keep of internal_srout_asic_control_word :signal  is "true";
    attribute keep of internal_txdctrig :signal  is "true";
	
	component clkgen
    port
    (
        clk_in1           : in     std_logic;
        clk_out1          : out    std_logic;
        reset             : in     std_logic;
        locked            : out    std_logic
     );
    end component;

    component blk_mem_gen_0
    port (
        clka    : IN STD_LOGIC;
        ena     : IN STD_LOGIC;
        wea     : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra   : IN STD_LOGIC_VECTOR(19 DOWNTO 0);
        dina    : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        douta   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
     );
    end component;

begin

--	extrig_OBUF_inst : OBUF
--   generic map (
--      DRIVE => 12,
--      IOSTANDARD => "DEFAULT",
--      SLEW => "SLOW")
--   port map (
--      O => EX_TRIGGER_MB,     -- Buffer output (connect directly to top-level port)
--      I => internal_EX_TRIGGER_MB      -- Buffer input
--   );

--internal_EX_TRIGGER_MB<=internal_TRIGGER_ALL;

--internal_EX_TRIGGER2_MB<=internal_READCTRL_LATCH_DONE;
u_COUNTER_auto_EXT_TRIG : COUNTER_LOAD_MACRO
   generic map (
      COUNT_BY => X"000000000001", -- Count by value
      DEVICE => "7SERIES",         -- Target Device: "VIRTEX5", "7SERIES", "SPARTAN6" 
      WIDTH_DATA => 32)            -- Counter output bus width, 1-48
   port map (
      Q => internal_auto_EXT_TRIG_counter,                 -- Counter output, width determined by WIDTH_DATA generic 
      CLK => internal_CLOCK_FPGA_LOGIC,             -- 1-bit clock input,
      CE => '1',               -- 1-bit clock enable input
      DIRECTION => '1', -- 1-bit up/down count direction input, high is count up
      LOAD => '0',           -- 1-bit active high load input
      LOAD_DATA => x"00000000", -- Counter load data, width determined by WIDTH_DATA generic 
      RST => '0'              -- 1-bit active high synchronous reset
   );
	
	
------------------------------------------------------------------------
--the internet said to try this, because of the variable range error
process(internal_CMDREG_USE_EXTRIG_PERIOD, internal_auto_EXT_TRIG_counter) begin
    case(internal_CMDREG_USE_EXTRIG_PERIOD) is
        when "00000" => internal_auto_EXT_TRIG_counter_temp(0 downto 0) <= internal_auto_EXT_TRIG_counter(0 downto 0);
        when "00001" => internal_auto_EXT_TRIG_counter_temp(1 downto 0) <= internal_auto_EXT_TRIG_counter(1 downto 0);
        when "00010" => internal_auto_EXT_TRIG_counter_temp(2 downto 0) <= internal_auto_EXT_TRIG_counter(2 downto 0);
        when "00011" => internal_auto_EXT_TRIG_counter_temp(3 downto 0) <= internal_auto_EXT_TRIG_counter(3 downto 0);
        when "00100" => internal_auto_EXT_TRIG_counter_temp(4 downto 0) <= internal_auto_EXT_TRIG_counter(4 downto 0);
        when "00101" => internal_auto_EXT_TRIG_counter_temp(5 downto 0) <= internal_auto_EXT_TRIG_counter(5 downto 0);
        when "00110" => internal_auto_EXT_TRIG_counter_temp(6 downto 0) <= internal_auto_EXT_TRIG_counter(6 downto 0);
        when "00111" => internal_auto_EXT_TRIG_counter_temp(7 downto 0) <= internal_auto_EXT_TRIG_counter(7 downto 0);
        when "01000" => internal_auto_EXT_TRIG_counter_temp(8 downto 0) <= internal_auto_EXT_TRIG_counter(8 downto 0);
        when "01001" => internal_auto_EXT_TRIG_counter_temp(9 downto 0) <= internal_auto_EXT_TRIG_counter(9 downto 0);
        when "01010" => internal_auto_EXT_TRIG_counter_temp(10 downto 0) <= internal_auto_EXT_TRIG_counter(10 downto 0);
        when "01011" => internal_auto_EXT_TRIG_counter_temp(11 downto 0) <= internal_auto_EXT_TRIG_counter(11 downto 0);
        when "01100" => internal_auto_EXT_TRIG_counter_temp(12 downto 0) <= internal_auto_EXT_TRIG_counter(12 downto 0);
        when "01101" => internal_auto_EXT_TRIG_counter_temp(13 downto 0) <= internal_auto_EXT_TRIG_counter(13 downto 0);
        when "01110" => internal_auto_EXT_TRIG_counter_temp(14 downto 0) <= internal_auto_EXT_TRIG_counter(14 downto 0);
        when "01111" => internal_auto_EXT_TRIG_counter_temp(15 downto 0) <= internal_auto_EXT_TRIG_counter(15 downto 0);
        when "10000" => internal_auto_EXT_TRIG_counter_temp(16 downto 0) <= internal_auto_EXT_TRIG_counter(16 downto 0);
        when "10001" => internal_auto_EXT_TRIG_counter_temp(17 downto 0) <= internal_auto_EXT_TRIG_counter(17 downto 0);
        when "10010" => internal_auto_EXT_TRIG_counter_temp(18 downto 0) <= internal_auto_EXT_TRIG_counter(18 downto 0);
        when "10011" => internal_auto_EXT_TRIG_counter_temp(19 downto 0) <= internal_auto_EXT_TRIG_counter(19 downto 0);
        when "10100" => internal_auto_EXT_TRIG_counter_temp(20 downto 0) <= internal_auto_EXT_TRIG_counter(20 downto 0);
        when "10101" => internal_auto_EXT_TRIG_counter_temp(21 downto 0) <= internal_auto_EXT_TRIG_counter(21 downto 0);
        when "10110" => internal_auto_EXT_TRIG_counter_temp(22 downto 0) <= internal_auto_EXT_TRIG_counter(22 downto 0);
        when "10111" => internal_auto_EXT_TRIG_counter_temp(23 downto 0) <= internal_auto_EXT_TRIG_counter(23 downto 0);
        when "11000" => internal_auto_EXT_TRIG_counter_temp(24 downto 0) <= internal_auto_EXT_TRIG_counter(24 downto 0);
        when "11001" => internal_auto_EXT_TRIG_counter_temp(25 downto 0) <= internal_auto_EXT_TRIG_counter(25 downto 0);
        when "11010" => internal_auto_EXT_TRIG_counter_temp(26 downto 0) <= internal_auto_EXT_TRIG_counter(26 downto 0);
        when "11011" => internal_auto_EXT_TRIG_counter_temp(27 downto 0) <= internal_auto_EXT_TRIG_counter(27 downto 0);
        when "11100" => internal_auto_EXT_TRIG_counter_temp(28 downto 0) <= internal_auto_EXT_TRIG_counter(28 downto 0);
        when "11101" => internal_auto_EXT_TRIG_counter_temp(29 downto 0) <= internal_auto_EXT_TRIG_counter(29 downto 0);
        when "11110" => internal_auto_EXT_TRIG_counter_temp(30 downto 0) <= internal_auto_EXT_TRIG_counter(30 downto 0);
        when "11111" => internal_auto_EXT_TRIG_counter_temp(31 downto 0) <= internal_auto_EXT_TRIG_counter(31 downto 0);
    end case;
end process;

internal_EXTRIG_counter_trig <='1'	when internal_auto_EXT_TRIG_counter(to_integer(unsigned(internal_CMDREG_USE_EXTRIG_PERIOD)))='1'
										and to_integer(unsigned(internal_auto_EXT_TRIG_counter_temp))<20 	
										else '0';

internal_EXTRIG<=(internal_EXTRIG_counter_trig and internal_READCTRL_busy_status) when internal_CMDREG_USE_EXTRIG(1)='1' else (internal_EX_TRIGGER_SCROD and internal_READCTRL_busy_status);

--u_COUNTER_auto_inc_asic : COUNTER_LOAD_MACRO
--   generic map (
--      COUNT_BY => X"000000000001", -- Count by value
--      DEVICE => "SPARTAN6",         -- Target Device: "VIRTEX5", "VIRTEX6", "SPARTAN6" 
--      WIDTH_DATA => 4)            -- Counter output bus width, 1-48
--   port map (
--      Q => internal_auto_EXT_TRIG_inc_asic_counter,                 -- Counter output, width determined by WIDTH_DATA generic 
--      CLK => internal_EXTRIG,             -- 1-bit clock input
--      CE => '1',               -- 1-bit clock enable input
--      DIRECTION => '1', -- 1-bit up/down count direction input, high is count up
--      LOAD => '0',           -- 1-bit active high load input
--      LOAD_DATA => x"0", -- Counter load data, width determined by WIDTH_DATA generic 
--      RST => '0'              -- 1-bit active high synchronous reset
--   );
	
--	internal_CMDREG_READCTRL_inc_asic_enable_bits<= "0000000001" when internal_auto_EXT_TRIG_inc_asic_counter=x"0" else
--																	"0000000010" when internal_auto_EXT_TRIG_inc_asic_counter=x"1" else
--																	"0000000100" when internal_auto_EXT_TRIG_inc_asic_counter=x"2" else
--																	"0000001000" when internal_auto_EXT_TRIG_inc_asic_counter=x"3" else
--																	"0000010000" when internal_auto_EXT_TRIG_inc_asic_counter=x"4" else
--																	"0000100000" when internal_auto_EXT_TRIG_inc_asic_counter=x"5" else
--																	"0001000000" when internal_auto_EXT_TRIG_inc_asic_counter=x"6" else
--																	"0010000000" when internal_auto_EXT_TRIG_inc_asic_counter=x"7" else
--																	"0100000000" when internal_auto_EXT_TRIG_inc_asic_counter=x"8" else
--																	"1000000000" when internal_auto_EXT_TRIG_inc_asic_counter=x"9" else 
--																	"0000000000" ;
	
	--Overall Signal Routing

   internal_TXDCTRIG(1)(1) <=TDC1_TRG(0) ; internal_TXDCTRIG(1)(2)  <=TDC1_TRG(1);internal_TXDCTRIG(1)(3) <=TDC1_TRG(2);internal_TXDCTRIG(1)(4) <=TDC1_TRG(3);internal_TXDCTRIG(1)(5) <=TDC1_TRG(4);
--   internal_TXDCTRIG(2)(1) <=TDC2_TRG(0) ; internal_TXDCTRIG(2)(2)  <=TDC2_TRG(1);internal_TXDCTRIG(2)(3) <=TDC2_TRG(2);internal_TXDCTRIG(2)(4) <=TDC2_TRG(3);internal_TXDCTRIG(2)(5) <=TDC2_TRG(4);
--   internal_TXDCTRIG(3)(1) <=TDC3_TRG(0) ; internal_TXDCTRIG(3)(2)  <=TDC3_TRG(1);internal_TXDCTRIG(3)(3) <=TDC3_TRG(2);internal_TXDCTRIG(3)(4) <=TDC3_TRG(3);internal_TXDCTRIG(3)(5) <=TDC3_TRG(4);
--   internal_TXDCTRIG(4)(1) <=TDC4_TRG(0) ; internal_TXDCTRIG(4)(2)  <=TDC4_TRG(1);internal_TXDCTRIG(4)(3) <=TDC4_TRG(2);internal_TXDCTRIG(4)(4) <=TDC4_TRG(3);internal_TXDCTRIG(4)(5) <=TDC4_TRG(4);
--   internal_TXDCTRIG(5)(1) <=TDC5_TRG(0) ; internal_TXDCTRIG(5)(2)  <=TDC5_TRG(1);internal_TXDCTRIG(5)(3) <=TDC5_TRG(2);internal_TXDCTRIG(5)(4) <=TDC5_TRG(3);internal_TXDCTRIG(5)(5) <=TDC5_TRG(4);
--   internal_TXDCTRIG(6)(1) <=TDC6_TRG(0) ; internal_TXDCTRIG(6)(2)  <=TDC6_TRG(1);internal_TXDCTRIG(6)(3) <=TDC6_TRG(2);internal_TXDCTRIG(6)(4) <=TDC6_TRG(3);internal_TXDCTRIG(6)(5) <=TDC6_TRG(4);
--   internal_TXDCTRIG(7)(1) <=TDC7_TRG(0) ; internal_TXDCTRIG(7)(2)  <=TDC7_TRG(1);internal_TXDCTRIG(7)(3) <=TDC7_TRG(2);internal_TXDCTRIG(7)(4) <=TDC7_TRG(3);internal_TXDCTRIG(7)(5) <=TDC7_TRG(4);
--   internal_TXDCTRIG(8)(1) <=TDC8_TRG(0) ; internal_TXDCTRIG(8)(2)  <=TDC8_TRG(1);internal_TXDCTRIG(8)(3) <=TDC8_TRG(2);internal_TXDCTRIG(8)(4) <=TDC8_TRG(3);internal_TXDCTRIG(8)(5) <=TDC8_TRG(4);
--   internal_TXDCTRIG(9)(1) <=TDC9_TRG(0) ; internal_TXDCTRIG(9)(2)  <=TDC9_TRG(1);internal_TXDCTRIG(9)(3) <=TDC9_TRG(2);internal_TXDCTRIG(9)(4) <=TDC9_TRG(3);internal_TXDCTRIG(9)(5) <=TDC9_TRG(4);
--   internal_TXDCTRIG(10)(1)<=TDC10_TRG(0); internal_TXDCTRIG(10)(2) <=TDC10_TRG(1);internal_TXDCTRIG(10)(3) <=TDC10_TRG(2);internal_TXDCTRIG(10)(4) <=TDC10_TRG(3);internal_TXDCTRIG(10)(5) <=TDC10_TRG(4);
                                                                                                                                                                                                   
	
    internal_ext_TXDCTRIG <= internal_TXDCTRIG; --added

	internal_TRIGGER_ASIC(0) <= internal_ext_TXDCTRIG(1)(1)  OR internal_ext_TXDCTRIG(1)(2) OR internal_ext_TXDCTRIG(1)(3) OR internal_ext_TXDCTRIG(1)(4) OR internal_ext_TXDCTRIG(1)(5);
--	internal_TRIGGER_ASIC(1) <= internal_ext_TXDCTRIG(2)(1)  OR internal_ext_TXDCTRIG(2)(2) OR internal_ext_TXDCTRIG(2)(3) OR internal_ext_TXDCTRIG(2)(4) OR internal_ext_TXDCTRIG(2)(5);
--	internal_TRIGGER_ASIC(2) <= internal_ext_TXDCTRIG(3)(1)  OR internal_ext_TXDCTRIG(3)(2) OR internal_ext_TXDCTRIG(3)(3) OR internal_ext_TXDCTRIG(3)(4) OR internal_ext_TXDCTRIG(3)(5);
--	internal_TRIGGER_ASIC(3) <= internal_ext_TXDCTRIG(4)(1)  OR internal_ext_TXDCTRIG(4)(2) OR internal_ext_TXDCTRIG(4)(3) OR internal_ext_TXDCTRIG(4)(4) OR internal_ext_TXDCTRIG(4)(5);
--	internal_TRIGGER_ASIC(4) <= internal_ext_TXDCTRIG(5)(1)  OR internal_ext_TXDCTRIG(5)(2) OR internal_ext_TXDCTRIG(5)(3) OR internal_ext_TXDCTRIG(5)(4) OR internal_ext_TXDCTRIG(5)(5);
--	internal_TRIGGER_ASIC(5) <= internal_ext_TXDCTRIG(6)(1)  OR internal_ext_TXDCTRIG(6)(2) OR internal_ext_TXDCTRIG(6)(3) OR internal_ext_TXDCTRIG(6)(4) OR internal_ext_TXDCTRIG(6)(5);
--	internal_TRIGGER_ASIC(6) <= internal_ext_TXDCTRIG(7)(1)  OR internal_ext_TXDCTRIG(7)(2) OR internal_ext_TXDCTRIG(7)(3) OR internal_ext_TXDCTRIG(7)(4) OR internal_ext_TXDCTRIG(7)(5);
--	internal_TRIGGER_ASIC(7) <= internal_ext_TXDCTRIG(8)(1)  OR internal_ext_TXDCTRIG(8)(2) OR internal_ext_TXDCTRIG(8)(3) OR internal_ext_TXDCTRIG(8)(4) OR internal_ext_TXDCTRIG(8)(5);
--	internal_TRIGGER_ASIC(8) <= internal_ext_TXDCTRIG(9)(1)  OR internal_ext_TXDCTRIG(9)(2) OR internal_ext_TXDCTRIG(9)(3) OR internal_ext_TXDCTRIG(9)(4) OR internal_ext_TXDCTRIG(9)(5);
--	internal_TRIGGER_ASIC(9) <= internal_ext_TXDCTRIG(10)(1) OR internal_ext_TXDCTRIG(10)(2) OR internal_ext_TXDCTRIG(10)(3) OR internal_ext_TXDCTRIG(10)(4) OR internal_ext_TXDCTRIG(10)(5);
	
	internal_TRIGGER_ALL <= internal_TRIGGER_ASIC(0);-- OR internal_TRIGGER_ASIC(1) or internal_TRIGGER_ASIC(2) OR
--	internal_TRIGGER_ASIC(3) OR internal_TRIGGER_ASIC(4) OR internal_TRIGGER_ASIC(5) OR
--	internal_TRIGGER_ASIC(6) OR internal_TRIGGER_ASIC(7) OR internal_TRIGGER_ASIC(8) OR
--	internal_TRIGGER_ASIC(9);


	--RAM_A <=internal_RAM_A;
	--RAM_IO<=internal_RAM_IO;
	--connect ch.0 of SRAM access dedicated to the USB access
	internal_ram_Ain(0)<=internal_CMDREG_RAMADDR;
	internal_ram_DWin(0)<=internal_CMDREG_RAMDATAWR;
	internal_CMDREG_RAMDATARD<=internal_ram_DRout(0);
	internal_ram_update(0)<=internal_CMDREG_RAMUPDATE;
	internal_ram_rw(0)<=internal_CMDREG_RAMRW;
	internal_CMDREG_RAMBUSY<=internal_ram_busy(0);
	
	 uut_pedram: entity work.SRAMscheduler PORT MAP (
        clk         => internal_CLOCK_FPGA_LOGIC,
        Ain         => internal_ram_Ain,
        DWin        => internal_ram_DWin,
        DRout       => internal_ram_DRout,
        rw          => internal_ram_rw,
        update_req  => internal_ram_update,
        busy        => internal_ram_busy,
        A           => RAM_A,
        IOw         => RAM_IOw_i,
        IOr         => RAM_IOr_i,
        BS          => open,--RAM_IO_BS_i,
        WEb         => RAM_WEn(0),
        CE2         => open,--RAM_CE2,
        CE1b        => open,--RAM_CE1n,
        OEb         => open--RAM_OEn
        );
          
    SRAM_1: blk_mem_gen_0
        PORT MAP (
            clka    => internal_CLOCK_FPGA_LOGIC,
            ena     => '1',
            wea     => not RAM_WEn,
            addra   => RAM_A(19 downto 0),
            dina    => RAM_IOw_i,
            douta   => RAM_IOr_i
          );
   	  
-- gen_io_buf:  for i in 0 to 7 generate
--   IOBUF_inst : IOBUF
--   generic map (
--      DRIVE => 12,
--      IOSTANDARD => "DEFAULT",
--      SLEW => "SLOW")
--   port map (
--      O => RAM_IOr_i(i),     -- Buffer output
--      IO => RAM_IO(i),   -- Buffer inout port (connect directly to top-level port)
--      I => RAM_IOw_i(i),     -- Buffer input
--      T =>  RAM_IO_BS_i      -- 3-state enable input, high=input, low=output 
--   );
  
--  end generate;

------------------------------------------ removed		  
--	--Clock generation
--	map_clock_gen : entity work.clock_gen
--	generic map (
--		USE_LOCAL_CLOCK   => '0',	
--		HW_CONF => HW_CONF
--	)
--	port map ( 
--		--Raw boad clock input
--		BOARD_CLOCKP      => BOARD_CLOCKP,
--		BOARD_CLOCKN      => BOARD_CLOCKN,
--		BOARD_CLOCK_OUT	=>internal_BOARD_CLOCK_OUT,
		
--		B2TT_SYS_CLOCK		=>internal_CLOCK_B2TT_SYS,
--		--FTSW inputs
		
--		--Trigger outputs from FTSW
--		--Select signal between the two

--		--General output clocks
--		CLOCK_TRIG_SCALER =>internal_CLOCK_TRIG_SCALER,
--		CLOCK_FPGA_LOGIC  => internal_CLOCK_FPGA_LOGIC,
--		CLOCK_MPPC_DAC   => internal_CLOCK_MPPC_DAC,
--		CLOCK_MPPC_ADC   => internal_CLOCK_MPPC_ADC
--		--ASIC control clocks
----		CLOCK_ASIC_CTRL_WILK=>open,--internal_CLOCK_ASIC_CTRL_WILK,
----		CLOCK_ASIC_CTRL  => open--internal_CLOCK_ASIC_CTRL
		
--	);  

--internal_CLOCK_ASIC_CTRL<=internal_CLOCK_FPGA_LOGIC;
--internal_CLOCK_ASIC_CTRL_WILK<=internal_CLOCK_FPGA_LOGIC;

	--Interface to the DAQ devices: Ethernet and KLMSCROD
	u_ethernet_readout_interface: entity work.ethernet_readout_interface 
    generic map(DAQ_IFACE=>DAQ_IFACE)
    PORT MAP(
        clk                 => internal_CLOCK_FPGA_LOGIC,
        reset               => '0',
        OUTPUT_REGISTERS    => internal_OUTPUT_REGISTERS,
        INPUT_REGISTERS     => internal_INPUT_REGISTERS,
        REGISTER_UPDATED    => i_register_update,

        tx_dac_busy         => internal_DAC_CONTROL_busy,
        pedman_busy         => internal_CMDREG_PedManBusy,
        mppc_dac_busy       => i_dac_busy,

        wave_fifo_wr_en     => internal_pswfifo_en,
        wave_fifo_data      => internal_pswfifo_d,
        wave_fifo_reset     => '0',
        wave_fifo_event_rdy => internal_qt_fifo_evt_rdy,
        
        rcl_fifo_rd_en      => internal_rcl_fifo_rd_en,
        rcl_fifo_data       => (others => '0'),
        rcl_fifo_empty      => '0',
        
        glbl_rst            => glbl_rst,                
        clk_in_p            => clk_in_p,                
        clk_in_n            => clk_in_n,                
        gtx_clk_bufg_out    => gtx_clk_bufg_out_i,        
        phy_resetn          => phy_resetn,              
        rgmii_txd           => rgmii_txd,               
        rgmii_tx_ctl        => rgmii_tx_ctl,
        rgmii_txc           => rgmii_txc,               
        rgmii_rxd           => rgmii_rxd,               
        rgmii_rx_ctl        => rgmii_rx_ctl,            
        rgmii_rxc           => rgmii_rxc,               
        mdio                => mdio,                    
        mdc                 => mdc,                    
        tx_statistics_s     => tx_statistics_s,      
        rx_statistics_s     => rx_statistics_s,      
        pause_req_s         => pause_req_s,       
        mac_speed           => mac_speed ,      
        update_speed        => update_speed,     
        config_board        => config_board,     
        serial_response     => serial_response,     
        gen_tx_data         => gen_tx_data,      
        chk_tx_data         => chk_tx_data,      
        reset_error         => reset_error,      
        activity_flash      => activity_flash,      
        activity_flashn     => activity_flashn
    );
    
    
    gtx_clk_bufg_out <= gtx_clk_bufg_out_i;
    
    clkgen_1 : clkgen
       port map ( 
       clk_in1 => gtx_clk_bufg_out_i,
       clk_out1 => internal_CLOCK_FPGA_LOGIC,
       reset => glbl_rst,
       locked => locked            
     );
    

---------------------------------------------------------------
---------KLM_SCROD: interface for Trigger using FTSW-----------
---------------------------------------------------------------
--internal_RJ45_CLK_P<=RJ45_CLK_P;
--internal_RJ45_CLK_N<=RJ45_CLK_N;
--internal_RJ45_TRG_P<=RJ45_TRG_P;
--internal_RJ45_TRG_N<=RJ45_TRG_N;
--RJ45_RSV_P<= internal_RJ45_RSV_P; 
--RJ45_RSV_N<= internal_RJ45_RSV_N; 
--RJ45_ACK_P<= internal_RJ45_ACK_P; 
--RJ45_ACK_N<= internal_RJ45_ACK_N; 
 
--gen_eth_sigs: if (DAQ_IFACE="Ethernet") generate
--internal_mgttxfault_eth	<=mgttxfault;  
--internal_mgtmod0_eth	<=mgtmod0;               
--internal_mgtlos_eth		<=mgtlos;               
--mgttxdis<=internal_mgttxdis_eth;              
--mgtmod2<=internal_mgtmod2_eth;               
--mgtmod1<=internal_mgtmod1_eth;              
----internal_mgtclk0p_eth   <=mgtclk0p;
----internal_mgtclk0n_eth   <=mgtclk0n;
--internal_mgtclk1p_eth   <=mgtclk1p;
--internal_mgtclk1n_eth   <=mgtclk1n;
--internal_mgtrxp_eth    	<=mgtrxp;                
--internal_mgtrxn_eth   	<=mgtrxn;                
--mgttxp<=internal_mgttxp_eth;                
--mgttxn<=internal_mgttxn_eth;               
--end generate;
--internal_mgtclk0p   <=mgtclk0p;
--internal_mgtclk0n   <=mgtclk0n;

--gen_KLM_scrod_sigs: if (DAQ_IFACE="KEKDAQ") generate
--internal_mgttxfault	<=mgttxfault;  
--internal_mgtmod0	<=mgtmod0;               
--internal_mgtlos		<=mgtlos;               
--mgttxdis<=internal_mgttxdis;              
--mgtmod2<=internal_mgtmod2;               
--mgtmod1<=internal_mgtmod1;              

--internal_mgtclk1p   <=mgtclk1p;
--internal_mgtclk1n   <=mgtclk1n;
--internal_mgtrxp   	<=mgtrxp;                
--internal_mgtrxn  	<=mgtrxn;                
--mgttxp<=internal_mgttxp;                
--mgttxn<=internal_mgttxn;
               
--end generate;

--internal_scint_b2tt_runreset<=internal_scint_b2tt_runreset_i;



------------------------------------------ removed	
--	klm_scrod_trig_interface : entity work.KLM_SCROD
--	generic map(NUM_GTS=>1,DAQ_IFACE=>DAQ_IFACE)
--		port map ( 
	
			
----			    TTD/FTSW interface
--    ttdclkp  => internal_RJ45_CLK_P,
--    ttdclkn  => internal_RJ45_CLK_N,
--    ttdtrgp  => internal_RJ45_TRG_P,
--    ttdtrgn  => internal_RJ45_TRG_N,    
--    ttdrsvp  => internal_RJ45_RSV_P,  
--    ttdrsvn  => internal_RJ45_RSV_N,
--    ttdackp  => internal_RJ45_ACK_P,
--    ttdackn  => internal_RJ45_ACK_N,
----	 b2ttsysclk	=>internal_CLOCK_B2TT_SYS,
------     ASIC Interface
--    target_tb  => internal_TXDCTRIG,		--                 : in tb_vec_type; 
--    target_tb16 => internal_TXDCTRIG16,	--                : in std_logic_vector(1 to TDC_NUM_CHAN); 
--    -- SFP interface
--    mgttxfault	=>	internal_mgttxfault,  
--    mgtmod0		=>	internal_mgtmod0,               
--    mgtlos		=>	internal_mgtlos,               
--    mgttxdis	=>	internal_mgttxdis,              
--    mgtmod2   	=>	internal_mgtmod2,               
--    mgtmod1  	=>	internal_mgtmod1,              
--	 mgtclk0p   =>	internal_mgtclk0p,
--	 mgtclk0n   =>	internal_mgtclk0n,
--	 mgtclk1p   =>	internal_mgtclk1p,
--	 mgtclk1n   =>	internal_mgtclk1n,
--    mgtrxp    	=>	internal_mgtrxp,                
--    mgtrxn   	=>	internal_mgtrxn,                
--    mgttxp    	=>	internal_mgttxp,                
--    mgttxn   	=>	internal_mgttxn,              
--	ex_trig1    =>'1',
--    exttb       => internal_ext_TXDCTRIG,
--    ftsw_aux    => open,
--    status_fake =>	status_fake,          
--    control_fake => 	control_fake,
--	clk63p5=>internal_CLOCK_B2TT_SYS,
--	 scint_b2tt_runreset=>internal_scint_b2tt_runreset_i,

--	scint_missed_trg	=>internal_KLM_SCINT_MISSED_TRG,
	
--	 scint_trg	 			=> 	internal_klm_trig,
--	 scint_trg_ctime		=>	internal_trig_ctime,
--	 scint_trg_rdy			=> 	not internal_READCTRL_busy_status,
--	 qt_fifo_rd_clk			=>	internal_qt_fifo_rd_clk,
--	 qt_fifo_rd_en			=>	internal_qt_fifo_rd_en,
--	 qt_fifo_rd_d			=>	internal_qt_fifo_d,
--	 qt_fifo_almost_empty	=>	internal_qt_fifo_almost_empty,
--	 qt_fifo_empty			=>	internal_qt_fifo_empty,
--	 qt_fifo_evt_rdy		=> 	internal_qt_fifo_evt_rdy,

--	-- fine trig bram - for KPP testing:
--	exttb_format				=> internal_CMDREG_EXTTB_FORMAT,-- format of the exttb which is a copy that comes out of TDC
--	trigasic_select				=> internal_CMDREG_READCTRL_asic_enable_bits,-- theoretically only one ASIC should be enabled on this
--	trigasic_bram_we			=> internal_WR_ENA			,
--	trigasic_bram_rd_addr		=> trigasic_bram_rd_addr	,
--	trigasic_bram_rd_data		=> trigasic_bram_rd_data	,

	 
-- -- Aurora local ouptput local link (to Concentrator) -- this copy goes to ethernet interface for in lab testing of KPPs without the need to a full Belle II DAQ
--	kpp_trig			=>	internal_READCTRL_trigger	,
--	kpp_tx_fifo_clk		=>	kpp_tx_fifo_clk				,
-- 	kpp_tx_fifo_re		=>	kpp_tx_fifo_re         		,
--	kpp_tx_fifo_do		=>	kpp_tx_fifo_do          	,
--	kpp_tx_fifo_epty	=>	kpp_tx_fifo_epty        	,
--	kpp_tx_fifo_aepty	=>	kpp_tx_fifo_aepty       	,

--	--	conc_intfc_tx_dst_rdy_n   => conc_intfc_tx_dst_rdy_n      ,
----   conc_intfc_tx_sof_n       => conc_intfc_tx_sof_n             ,
----   conc_intfc_tx_eof_n       => conc_intfc_tx_eof_n             ,
----   conc_intfc_tx_src_rdy_n   => conc_intfc_tx_src_rdy_n         ,
----   conc_intfc_tx_data        => conc_intfc_tx_data              ,

	
--	klm_status_regs=>internal_klm_status_regs,
-- 	 rcl_fifo_rd_clk	=>	internal_CLOCK_FPGA_LOGIC,
--	 rcl_fifo_rd_en	=>	internal_rcl_fifo_rd_en,
--	 rcl_fifo_data		=>	internal_rcl_fifo_data,
--	 rcl_fifo_empty	=>	internal_rcl_fifo_empty,

--	zlt					=> internal_READCTRL_busy_status
	
--	);
	
	
--    STAT_GEN : for j in 0 to 59 generate

-- gen_FDSE_inst_statregs:  for i in 0 to 15 generate

--  FDSE_inst_status_regs : FDSE
--   generic map (
--      INIT => '0') -- Initial value of register ('0' or '1')  
--   port map (
--      Q => internal_klm_status_regs(j)(i),      -- Data output
--      C => --internal_CLOCK_MPPC_DAC,      -- Clock input,
--      CE => '1',    -- Clock enable input
--      S => '0',      -- Synchronous Set input
--      D => internal_INPUT_REGISTERS(N_GPR+j)(i)       -- Data input
--   );

----		internal_klm_status_regs(I)<=internal_INPUT_REGISTERS(N_GPR+I);
--    end generate;

--    end generate;

 
-- gen_FDSE_inst_trig_ctime:  for i in 0 to 26 generate
--   FDSE_inst_trig_ctime : FDSE
--   generic map (
--      INIT => '0') -- Initial value of register ('0' or '1')  
--   port map (
--      Q => internal_klm_trig_ctime(i),      -- Data output
--      C => internal_klm_trig,      -- Clock input, --connect
--      CE => '1',    -- Clock enable input
--      S => '0',      -- Synchronous Set input
--      D => internal_trig_ctime(i)       -- Data input, --connect
--   );
--  end generate;	

	--------------------------------------------------
	-------General registers interfaced to DAQ -------
	--------------------------------------------------

	--DAC CONTROL SIGNALS
	internal_DAC_CONTROL_UPDATE                 <= internal_OUTPUT_REGISTERS(1)(0);
	internal_DAC_CONTROL_REG_DATA               <= internal_OUTPUT_REGISTERS(2)(6 downto 0) & internal_OUTPUT_REGISTERS(3)(11 downto 0);
    internal_DAC_CONTROL_TDCNUM                 <= internal_OUTPUT_REGISTERS(4)(0);
	internal_DAC_CONTROL_LOAD_PERIOD            <= internal_OUTPUT_REGISTERS(5)(15 downto 0);
	internal_DAC_CONTROL_LATCH_PERIOD           <= internal_OUTPUT_REGISTERS(6)(15 downto 0);
	
	--Sampling Signals
	internal_CMDREG_RESET_SAMPLIG_LOGIC         <= internal_OUTPUT_REGISTERS(10)(0);
	internal_CMDREG_SAMPLIG_LOGIC_RESET_PARAMS  <= internal_OUTPUT_REGISTERS(11);

	--Serial Readout Signal
	internal_CMDREG_SROUT_TPG                   <= internal_OUTPUT_REGISTERS(31)(0); --'1': force test pattern to output. '0': regular operation

	--RAM Access from USB or anything:
	internal_CMDREG_RAMADDR(15 downto 0)        <= internal_OUTPUT_REGISTERS(32);
	internal_CMDREG_RAMADDR(21 downto 16)       <= internal_OUTPUT_REGISTERS(33)(5 downto 0);
	internal_CMDREG_RAMDATAWR                   <= internal_OUTPUT_REGISTERS(34)(7 downto 0);
	internal_CMDREG_RAMUPDATE                   <= internal_OUTPUT_REGISTERS(35)(0);
	internal_CMDREG_RAMRW                       <= internal_OUTPUT_REGISTERS(35)(1);

	---status regs: automaticly generated and fed to conc. or read via software?
	internal_CMDREG_USE_EXTRIG                  <= internal_OUTPUT_REGISTERS(37)(2 downto 0);
	--internal_CMDREG_USE_EXTRIG usuage:
	--"100": use ex trig and read from fixed asic
	--"101": use ex trig and increment asic number after each trigger
	--"110": use internal counter trig and read from fixed asic
	--"111": use internal counter trig and increment asic number after each trigger
	internal_CMDREG_USE_EXTRIG_PERIOD           <= internal_OUTPUT_REGISTERS(37)(15 downto 11);
	
	internal_CMDREG_PedCalcNAVG	                <= internal_OUTPUT_REGISTERS(38)(3 downto 0); -- 2**NAVG= number of averages for calculating peds
	internal_CMDREG_PedCalcReset 	            <= internal_OUTPUT_REGISTERS(38)(15);
	internal_CMDREG_PedmanEnable 	            <= internal_OUTPUT_REGISTERS(38)(14);
	internal_CMDREG_PedDemuxFifoOutputSelect    <= internal_OUTPUT_REGISTERS(38)(13 downto 12); --00: disable (regular waveform dump)--01: ped sub, 10: ped only, 11: waveform only, changing 00 to mean deviation values
	internal_WAVEFORM_FIFO_RST                  <= internal_OUTPUT_REGISTERS(38)(11);-- reset the waveform and buffer fifos
	internal_BUFFERCTRL_FIFO_RESET              <= internal_OUTPUT_REGISTERS(38)(11);
	internal_CMDREG_PedSubCalcMode              <= internal_OUTPUT_REGISTERS(38)(10 downto 7);	
	internal_CMDREG_USE_KLMTRIG                 <= internal_OUTPUT_REGISTERS(38)(5);
	internal_CMDREG_KLMTRIG_CAL_READOUT_MODE    <= internal_OUTPUT_REGISTERS(38)(6);-- calmode: force readout on a KLM trigger- do not use LKBK window, instead determine ASICs to read from internal_CMDREG_READCTRL_asic_enable_bits
	internal_CMDREG_USE_SCRODLINK               <= internal_OUTPUT_REGISTERS(38)(4);
	
	internal_CMDREG_USE_TRIGDEC	                <= internal_OUTPUT_REGISTERS(39)(15); --'1': only use trigger generated by internal trig dec logic , '0'= use trigger generated by HW or SW or anything
--	internal_CMDREG_TRIGDEC_TRIGMASK	        <= internal_OUTPUT_REGISTERS(39)(14 downto 0); --Mask the ASICS that we dont want to fire on- due to bad supply
	
	-------------------MAX clock counters for trigger scalers for the trigger scanning mode and the built in trigdec logic
	internal_CMGREG_TRIG_SCALER_CLK_MAX         <= internal_OUTPUT_REGISTERS(47);
	internal_CMGREG_TRIG_SCALER_CLK_MAX_TRIGDEC <= internal_OUTPUT_REGISTERS(48);

	internal_CMDREG_PedCalcStart                <= internal_OUTPUT_REGISTERS(41)(15);
	internal_CMDREG_PedCalcASICen               <= internal_OUTPUT_REGISTERS(41)(9 downto 0);
	internal_CMDREG_PedCalcWinLen               <= internal_OUTPUT_REGISTERS(42);

	--Event builder signals
	internal_CMDREG_WAVEFORM_FIFO_RST              <= internal_OUTPUT_REGISTERS(40)(0);
	internal_CMDREG_EVTBUILD_START_BUILDING_EVENT  <= internal_OUTPUT_REGISTERS(44)(0);
	internal_CMDREG_EVTBUILD_MAKE_READY            <= internal_OUTPUT_REGISTERS(45)(0);
	internal_CMDREG_EVTBUILD_PACKET_BUILDER_BUSY   <= internal_OUTPUT_REGISTERS(46)(0);
	
	--Readout control signals
	internal_CMDREG_SOFTWARE_trigger                   <= internal_OUTPUT_REGISTERS(50)(0);
	--internal_CMDREG_SOFTWARE_TRIGGER_VETO            <= internal_OUTPUT_REGISTERS(51)(0);
--	internal_CMDREG_READCTRL_asic_enable_bits          <= internal_OUTPUT_REGISTERS(51)(9 downto 0);
	internal_CMDREG_HARDWARE_TRIGGER_ENABLE            <= internal_OUTPUT_REGISTERS(52)(0);
	internal_CMDREG_READCTRL_trig_delay                <= internal_OUTPUT_REGISTERS(53)(11 downto 0);
	internal_CMDREG_READCTRL_dig_offset                <= vio_ASYNC_OUT(8 downto 0) when vio_ASYNC_OUT(47)='1' else internal_OUTPUT_REGISTERS(54)(8 downto 0) ;
	internal_CMDREG_READCTRL_readout_reset             <= internal_OUTPUT_REGISTERS(55)(0);
	internal_CMDREG_READCTRL_win_num_to_read           <= internal_OUTPUT_REGISTERS(57)(8 downto 0);
	internal_CMDREG_READCTRL_readout_continue          <= internal_OUTPUT_REGISTERS(58)(0);
	internal_CMDREG_READCTRL_RESET_EVENT_NUM           <= internal_OUTPUT_REGISTERS(59)(0);
	internal_CMDREG_READCTRL_ramp_length               <= internal_OUTPUT_REGISTERS(61);
	internal_CMDREG_READCTRL_use_fixed_dig_start_win   <= internal_OUTPUT_REGISTERS(62);-- bit 15: '1'=> use fixed start win and (8 downto 0) is the fixed start win

	internal_CMDREG_PDAQ_DATA_MODE                     <= internal_OUTPUT_REGISTERS(75)(3 downto 0);-- determines the pdaq's data mode, 0=qt, 1=full wavw
	internal_CMDREG_PDAQ_DATA_CHMASK                   <= internal_OUTPUT_REGISTERS(76);-- determines what channels for sending full waveforms to pdaq.
	
	internal_CMDREG_EXTTB_FORMAT                       <= internal_OUTPUT_REGISTERS(79)(3 downto 0);
	
    internal_ped_dac_reg1                              <= internal_OUTPUT_REGISTERS(85); --DAC voltage
--	internal_ped_dac_reg2                              <= internal_OUTPUT_REGISTERS(86); --DAC operation and selection, operation not changing

    internal_CMDREG_PedStatSelect                      <= internal_OUTPUT_REGISTERS(87)(0); -- used with registers(38)(13 downto 12), 0 = mean, 1 = mean deviation, if (38)(13downto12) = "10"
	
	--set DACs on targetx fmc board
	u_ped_dac_control: entity work.ped_dac_control
	port map(
	   fpga_clk    => internal_clock_fpga_logic,
	   dac_op_sel  => x"3F", --only the one operation
--	   dac_op_sel    => internal_ped_dac_reg2(7 downto 0),
	   dac_val     => internal_ped_dac_reg1,
	   SCL         => DAC_SCL_i,
	   SDA         => DAC_SDA_i
	);
	
	DAC_SCL <= DAC_SCL_i;
	DAC_SDA <= DAC_SDA_i;
	
	-- for scifi only here for the record
	--internal_CMDREG_HVDAC<=internal_OUTPUT_REGISTERS(77);-- Main HV DAC Control for the SciFi board
	--internal_CMDREG_HVEN<=internal_OUTPUT_REGISTERS(77)(14);
	--Internal current readout ADC connecitons:
--	internal_CurrentADC_reset	<= intenal_STATREG_CurrentADC_reset;--internal_OUTPUT_REGISTERS(63)(0) when internal_CMDREG_SW_STATUS_READ ='1' else '0' ;
--	internal_runADC	<= intenal_STATREG_runADC;--internal_OUTPUT_REGISTERS(63)(1);
--	internal_CMDREG_UPDATE_STATUS_REGS <=internal_OUTPUT_REGISTERS(63)(0);
--	internal_SDA  <=SDA_MON;
--	SCL_MON <= '0';--internal_SCL;
--	internal_enOutput	<= internal_OUTPUT_REGISTERS(63)(2);
--	internal_ADCOutput 	<= internal_OUTPUT_REGISTERS(64)(11 downto 0);
--	internal_INPUT_REGISTERS(N_GPR + 21)(11 downto 0) <= --internal_ADCOutput(11 downto 0);--no need any more
--	internal_INPUT_REGISTERS(N_GPR + 21)(12) <= --internal_enOutput;

--gen_TDC_AMUX_S : for i in 0 to 3 generate
--	TOP_TDC_AMUX_S : FDCE
--   generic map (
--      INIT => '0') -- Initial value of register ('0' or '1')  
--   port map (
--      Q => TDC_AMUX_S(i),      -- Data output
--      C => internal_CLOCK_FPGA_LOGIC,
--      CE => '1',    -- Clock enable input
--      CLR => '0',  -- Asynchronous clear input
--      D => internal_AMUX_S(i)       -- Data input
--   );
 
-- end generate;
--gen_TOP_AMUX_S : for i in 0 to 3 generate
--	TOP_AMUX_FDCE : FDCE
--   generic map (
--      INIT => '0') -- Initial value of register ('0' or '1')  
--   port map (
--      Q => TOP_AMUX_S(i),      -- Data output
--      C => internal_CLOCK_FPGA_LOGIC,   
--      CE => '1',    -- Clock enable input
--      CLR => '0',  -- Asynchronous clear input
--      D => internal_AMUX_S(i+4)       -- Data input
--   );
 
-- end generate;

----uncomment forTX KLM MB operation
--TDC_AMUX_S   <= internal_AMUX_S(3 downto 0);--internal_NCH_AMUX_S;--internal_OUTPUT_REGISTERS(62)(3 downto 0);--channel within a daughtercard
--TOP_AMUX_S   <= internal_AMUX_S(7 downto 4);--internal_NDC_AMUX_S;--internal_OUTPUT_REGISTERS(62)(7 downto 4);-- Daughter Card Number

--	internal_AMUX_S(3 downto 0)	<=internal_OUTPUT_REGISTERS(63)(3 downto 0);--channel within a daughtercard (TDC_AMUX_S)
--	internal_AMUX_S(7 downto 4)	<=internal_OUTPUT_REGISTERS(63)(7 downto 4);--channel within a daughtercard (TOP_AMUX_S)
--	TDC_AMUX_S   		<= internal_OUTPUT_REGISTERS(63)(3 downto 0);--channel within a daughtercard
--	TOP_AMUX_S  	 	<= internal_OUTPUT_REGISTERS(63)(7 downto 4);-- Daughter Card Number
	internal_runADC	                                   <= internal_OUTPUT_REGISTERS(63)(8);
	internal_CurrentADC_reset	                       <= internal_OUTPUT_REGISTERS(63)(9);

	internal_INPUT_REGISTERS(N_GPR+23)(7 downto 0)     <=internal_CMDREG_RAMDATARD;
	internal_INPUT_REGISTERS(N_GPR+23)(8)              <= internal_CMDREG_RAMBUSY;
	
	-- HV dac signals
	i_dac_number                   <= internal_OUTPUT_REGISTERS(60)(15 downto 12);
	i_dac_addr                     <= internal_OUTPUT_REGISTERS(60)(11 downto 8);
--	i_dac_value                    <= internal_OUTPUT_REGISTERS(78)(11 downto 0); only for Scifi, since the 12 bit DAC didnt fit
	i_dac_value                    <= internal_OUTPUT_REGISTERS(60)(7 downto 0);
	i_dac_update                   <=  internal_OUTPUT_REGISTERS(63)(10);-- or i_register_update(60);
--	HV_DISABLE                     <= not internal_OUTPUT_REGISTERS(61)(0);

	--Trigger control
	internal_TRIGCOUNT_ena                 <= internal_OUTPUT_REGISTERS(70)(0);
	internal_TRIGCOUNT_rst                 <= internal_OUTPUT_REGISTERS(71)(0);
	internal_TRIGGER_ASIC_control_word     <= internal_OUTPUT_REGISTERS(72)(9 downto 0);

	--------Input register mapping--------------------
	--Map the first N_GPR output registers to the first set of read registers
	gen_OUTREG_to_INREG: for i in 0 to N_GPR-1 generate
		gen_BIT: for j in 0 to 15 generate
			map_BUF_RR : BUF 
			port map( 
				I => internal_OUTPUT_REGISTERS(i)(j), 
				O => internal_INPUT_REGISTERS(i)(j) 
			);
		end generate;
	end generate;
	
	--- The register numbers must be updated for the following if N_GPR is changed.
	internal_INPUT_REGISTERS(N_GPR + 0 ) <= "0000000" & internal_SMP_MAIN_CNT(8 downto 0 );
	internal_INPUT_REGISTERS(N_GPR + 1 ) <= internal_WAVEFORM_FIFO_DATA_OUT(15 downto 0);
	internal_INPUT_REGISTERS(N_GPR + 2 ) <= "000000000000000" & internal_WAVEFORM_FIFO_EMPTY;
	internal_INPUT_REGISTERS(N_GPR + 3 ) <= "000000000000000" & internal_WAVEFORM_FIFO_DATA_VALID;
	internal_INPUT_REGISTERS(N_GPR + 4 ) <= "0000000" & internal_READCTRL_DIG_RD_COLSEL & internal_READCTRL_DIG_RD_ROWSEL;
	internal_INPUT_REGISTERS(N_GPR + 5 ) <= "0000000" & internal_READCTRL_LATCH_SMP_MAIN_CNT;
	internal_INPUT_REGISTERS(N_GPR + 6 ) <= "0000000000" & internal_EVTBUILD_MAKE_READY & internal_EVTBUILD_DONE_SENDING_EVENT & internal_WAVEFORM_FIFO_EMPTY & 
	                                           internal_SROUT_IDLE_status & internal_DIG_IDLE_status & '0';
--   internal_INPUT_REGISTERS(N_GPR + 7 ) (9 downto 0) <= SHOUT(9 downto 0);
    internal_INPUT_REGISTERS(N_GPR + 7 )(0) <= SHOUT;

	internal_INPUT_REGISTERS(N_GPR + 10 ) <= internal_TRIGCOUNT_scaler(0)(15 downto 0);
--	internal_INPUT_REGISTERS(N_GPR + 11 ) <= internal_TRIGCOUNT_scaler(1)(15 downto 0);
--	internal_INPUT_REGISTERS(N_GPR + 12 ) <= internal_TRIGCOUNT_scaler(2)(15 downto 0);
--	internal_INPUT_REGISTERS(N_GPR + 13 ) <= internal_TRIGCOUNT_scaler(3)(15 downto 0);
--	internal_INPUT_REGISTERS(N_GPR + 14 ) <= internal_TRIGCOUNT_scaler(4)(15 downto 0);
--	internal_INPUT_REGISTERS(N_GPR + 15 ) <= internal_TRIGCOUNT_scaler(5)(15 downto 0);
--	internal_INPUT_REGISTERS(N_GPR + 16 ) <= internal_TRIGCOUNT_scaler(6)(15 downto 0);
--	internal_INPUT_REGISTERS(N_GPR + 17 ) <= internal_TRIGCOUNT_scaler(7)(15 downto 0);
--	internal_INPUT_REGISTERS(N_GPR + 18 ) <= internal_TRIGCOUNT_scaler(8)(15 downto 0);
--	internal_INPUT_REGISTERS(N_GPR + 19 ) <= internal_TRIGCOUNT_scaler(9)(15 downto 0);
	internal_INPUT_REGISTERS(N_GPR + 20) <= x"002c"; -- ID of the board
	internal_INPUT_REGISTERS(N_GPR + 40 ) <= internal_TRIGCOUNT_scaler(0)(31 downto 16);
--	internal_INPUT_REGISTERS(N_GPR + 41 ) <= internal_TRIGCOUNT_scaler(1)(31 downto 16);
--	internal_INPUT_REGISTERS(N_GPR + 42 ) <= internal_TRIGCOUNT_scaler(2)(31 downto 16);
--	internal_INPUT_REGISTERS(N_GPR + 43 ) <= internal_TRIGCOUNT_scaler(3)(31 downto 16);
--	internal_INPUT_REGISTERS(N_GPR + 44 ) <= internal_TRIGCOUNT_scaler(4)(31 downto 16);
--	internal_INPUT_REGISTERS(N_GPR + 45 ) <= internal_TRIGCOUNT_scaler(5)(31 downto 16);
--	internal_INPUT_REGISTERS(N_GPR + 46 ) <= internal_TRIGCOUNT_scaler(6)(31 downto 16);
--	internal_INPUT_REGISTERS(N_GPR + 47 ) <= internal_TRIGCOUNT_scaler(7)(31 downto 16);
--	internal_INPUT_REGISTERS(N_GPR + 48 ) <= internal_TRIGCOUNT_scaler(8)(31 downto 16);
--	internal_INPUT_REGISTERS(N_GPR + 49 ) <= internal_TRIGCOUNT_scaler(9)(31 downto 16);
--	
	internal_INPUT_REGISTERS(N_GPR + 30) <= "0000000" & internal_READCTRL_dig_win_start; -- digitizatoin window start
	internal_INPUT_REGISTERS(N_GPR + 31) <=internal_pswfifo_d(15 downto 0);--internal_INPUT_REGISTERS(31)
	internal_INPUT_REGISTERS(N_GPR + 24) <=internal_TRIGCOUNT_scaler_main(15 downto 0);-- main trig count scaler
	internal_INPUT_REGISTERS(N_GPR + 25) <=internal_TRIGCOUNT_scaler_main(31 downto 16);-- main trig count scaler
--	internal_INPUT_REGISTERS(N_GPR + 26) <=--internal_KLM_SCINT_MISSED_TRG;
	internal_INPUT_REGISTERS(N_GPR + 33) <=internal_PedCalcNiter;
	internal_INPUT_REGISTERS(N_GPR + 34) <="000000000000000" & internal_CMDREG_PedManBusy;

    internal_INPUT_REGISTERS(N_GPR + 64) <= x"A501"; --FW code name: SCROD A5, 01:KLM, 02: Scifi
    internal_INPUT_REGISTERS(N_GPR + 65) <= x"0100"; --FW Rev: Rev 1.0
    internal_INPUT_REGISTERS(N_GPR + 66) <= x"1509"; --FW date: YYMM
    internal_INPUT_REGISTERS(N_GPR + 67)(15 downto 8) <= x"26"; --FW date: DD
--    -- DAQ interface: FIX LATER!
--	-- DAQ Interface: 01:Ethernet 02:
--	internal_INPUT_REGISTERS(N_GPR + 67)(7 downto 0)  <= x"01" when DAQ_IFACE="Ethernet" else
--	internal_INPUT_REGISTERS(N_GPR + 67)(7 downto 0)  <= x"02" when DAQ_IFACE="KEKDAQ"   else
--					x"00"; --Unknown
	
    ODDR_inst : ODDR
    generic map(
        DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE"
        INIT => '0', -- Sets initial state of the Q output to '0' or '1'
        SRTYPE => "SYNC") -- Specifies "SYNC" or "ASYNC" set/reset
    port map (
        Q => internal_CLOCK_ASIC_CTRL_WILK,--(i), -- 1-bit output data
        C => internal_CLOCK_FPGA_LOGIC,
        CE => '1',  -- 1-bit clock enable input
        D1 => '0',   -- 1-bit data input (associated with C0)
        D2 => '1',   -- 1-bit data input (associated with C1)
        R => '0',    -- 1-bit reset input
        S => '0'     -- 1-bit set input
    );
  
  
	wilk_OBUFDS_inst : OBUFDS
    generic map (
      --IOSTANDARD => "DEFAULT")
		IOSTANDARD => "LVDS_25")
    port map (
        O => WL_CLK_P,--(i),    			-- Diff_p output (connect directly to top-level port)
        OB => WL_CLK_N,--(i),   			-- Diff_n output (connect directly to top-level port)
        I => internal_CLOCK_ASIC_CTRL_WILK--(i)     	-- Buffer input 
    );
		
	BUS_REGCLR <= '0';
--	BUSA_REGCLR <= '0';
--	BUSB_REGCLR <= '0';
--	BUSA_SCLK <= internal_DAC_CONTROL_SCLK;
--	BUSB_SCLK <= internal_DAC_CONTROL_SCLK;
	
	--ASIC control processes
	
	--TARGETX DAC Control
	u_TARGETX_DAC_CONTROL: entity work.TARGETX_DAC_CONTROL 
	PORT MAP(
		CLK 			=> internal_CLOCK_FPGA_LOGIC, 
		LOAD_PERIOD 	=> internal_DAC_CONTROL_LOAD_PERIOD,
		LATCH_PERIOD 	=> internal_DAC_CONTROL_LATCH_PERIOD,
		UPDATE 			=> internal_DAC_CONTROL_UPDATE,
		REG_DATA 		=> internal_DAC_CONTROL_REG_DATA,
		busy			=>	internal_DAC_CONTROL_busy,
		SIN 			=> internal_DAC_CONTROL_SIN,
		SCLK 			=> internal_DAC_CONTROL_SCLK,
		PCLK 			=> internal_DAC_CONTROL_PCLK
    );
    
	--only one asic
    SIN  <= internal_DAC_CONTROL_SIN  and internal_DAC_CONTROL_TDCNUM;
    PCLK <= internal_DAC_CONTROL_PCLK and internal_DAC_CONTROL_TDCNUM;
    SCLK <= internal_DAC_CONTROL_SCLK and internal_DAC_CONTROL_TDCNUM;

    ped_manager: entity work.PedestalManagement 
    PORT MAP(
		clk               => internal_CLOCK_FPGA_LOGIC,
		enable            => internal_CMDREG_PedmanEnable,
		start             => internal_CMDREG_PedCalcStart,
		win_len_start     => internal_CMDREG_PedCalcWinLen,
		asic_en_mask      => internal_CMDREG_PedCalcASICen,
		readout_trig      => internal_PEDMAN_ReadoutTrig,
		ped_calc_busy     => internal_PEDCALC_PedCalcBusy,
		dmx_allwin_done   => internal_SROUT_ALLWIN_DONE,
		readout_busy      => internal_READCTRL_busy_status,
		busy              => internal_CMDREG_PedManBusy,
		stat              => open,
		cur_win_no        => internal_PEDMAN_CurWin,
		cur_asic_en_bits  => internal_PEDMAN_CurASICen,
		ped_calc_enable   => internal_PEDMAN_calc_peds_en,
		readout_reset     => internal_PEDMAN_readout_reset,
		readout_continue  => internal_PEDMAN_readout_continue
	);
	
--  event_cntr : COUNTER_LOAD_MACRO
--   generic map (
--      COUNT_BY => X"000000000001", -- Count by value
--      DEVICE => "SPARTAN6",         -- Target Device: "VIRTEX5", "VIRTEX6", "SPARTAN6" 
--      WIDTH_DATA => 16)            -- Counter output bus width, 1-48
--   port map (
--      Q => internal_TRIG_EVENT_NO,                 -- Counter output, width determined by WIDTH_DATA generic 
--      CLK => internal_CLOCK_FPGA_LOGIC,             -- 1-bit clock input 
--      CE => internal_READCTRL_trigger,               -- 1-bit clock enable input
--      DIRECTION => '1', -- 1-bit up/down count direction input, high is count up
--      LOAD => '0',           -- 1-bit active high load input
--      LOAD_DATA => x"0000", -- Counter load data, width determined by WIDTH_DATA generic 
--      RST => --internal_scint_b2tt_runreset              -- 1-bit active high synchronous reset
--   );

	--Control the sampling, digitization and serial resout processes following trigger
	u_ReadoutControl: entity work.ReadoutControl3 
	PORT MAP(
		clk 				          => internal_CLOCK_FPGA_LOGIC,
		smp_clk 				      => internal_CLOCK_FPGA_LOGIC, 
		ctrl_mode 			          => x"1",--internal_CTRL_MODE,
		trigger 				      => internal_READCTRL_trigger,
		trig_delay 			          => internal_READCTRL_trig_delay,
		dig_offset 			          => internal_READCTRL_dig_offset,
		win_num_to_read 	          => internal_READCTRL_win_num_to_read,
		asic_enable_bits              => internal_READCTRL_asic_enable_bits,
		SMP_MAIN_CNT 		          => internal_SMP_MAIN_CNT,
		SMP_IDLE_status 	          => '0',
		DIG_IDLE_status 	          => internal_DIG_IDLE_status,
		SROUT_IDLE_status             => internal_SROUT_IDLE_status,
		fifo_empty 			          => '1',--internal_WAVEFORM_FIFO_EMPTY,
		EVTBUILD_DONE_SENDING_EVENT   => '0',--internal_EVTBUILD_DONE_SENDING_EVENT,
		LATCH_SMP_MAIN_CNT            => internal_READCTRL_LATCH_SMP_MAIN_CNT,
		dig_win_start			      => internal_READCTRL_dig_win_start,
		LATCH_DONE 			          => internal_READCTRL_LATCH_DONE,
		READOUT_RESET 		          => internal_READCTRL_readout_reset,
		READOUT_CONTINUE 	          => internal_READCTRL_readout_continue,
		RESET_EVENT_NUM 	          => internal_READCTRL_RESET_EVENT_NUM,
		use_fixed_dig_start_win       => internal_READCTRL_use_fixed_dig_start_win,-- internal_CMDREG_READCTRL_use_fixed_dig_start_win,
		ASIC_NUM 			          => internal_READCTRL_ASIC_NUM,
		busy_status 		          => internal_READCTRL_busy_status,
		smp_stop 			          => internal_READCTRL_smp_stop,
		dig_start 			          => internal_READCTRL_dig_start,
		DIG_RD_ROWSEL_S 	          => internal_READCTRL_DIG_RD_ROWSEL,
		DIG_RD_COLSEL_S 	          => internal_READCTRL_DIG_RD_COLSEL,
		srout_start 		          => internal_READCTRL_srout_start,
	    srout_restart 		          => internal_READCTRL_srout_restart,
		ped_sub_start		          => internal_PEDSUB_start,
		ped_sub_busy		          => internal_ped_sub_busy,
		EVTBUILD_start 	              => open,
		EVTBUILD_MAKE_READY           => open,
		EVENT_NUM 			          => internal_READCTRL_EVENT_NUM,
		READOUT_DONE 		          => internal_READCTRL_READOUT_DONE
	);
	
	internal_ped_sub_busy              <= internal_PEDSUB_busy and internal_PedSubEnable;
	internal_SOFTWARE_TRIGGER_VETO     <= internal_CMDREG_SOFTWARE_TRIGGER_VETO;
	internal_HARDWARE_TRIGGER_ENABLE   <= internal_CMDREG_HARDWARE_TRIGGER_ENABLE;
	internal_SOFTWARE_TRIGGER          <= internal_CMDREG_SOFTWARE_trigger;-- AND NOT internal_SOFTWARE_TRIGGER_VETO;
	internal_HARDWARE_TRIGGER          <= internal_HARDWARE_TRIGGER_ENABLE AND internal_TRIGGER_ALL;
	--internal_CMDREG_USE_EXTRIG usuage:
	--"100": use ex trig and read from fixed asic
	--"101": use ex trig and increment asic number after each trigger
	--"110": use internal counter trig and read from fixed asic
	--"111": use internal counter trig and increment asic number after each trigger
--	internal_READCTRL_trigger <= (internal_SOFTWARE_TRIGGER OR internal_HARDWARE_TRIGGER or internal_ASIC_TRIG) when internal_CMDREG_USE_TRIGDEC='0' else internal_TRIGDEC_trig;
	internal_READCTRL_trigger <= 
        internal_PEDMAN_ReadoutTrig                                     when internal_CMDREG_PedmanEnable='1' else
		internal_EXTRIG					                                when internal_CMDREG_USE_EXTRIG(2)='1' else
--		internal_klm_trig				                                when internal_CMDREG_USE_KLMTRIG='1' else
--		internal_TRIGDEC_trig and not internal_READCTRL_busy_status	    when internal_CMDREG_USE_TRIGDEC='1' else
--		internal_SCRODLINK_RX_TRIG										when internal_CMDREG_USE_SCRODLINK='1' else 
		(internal_SOFTWARE_TRIGGER OR internal_HARDWARE_TRIGGER or internal_ASIC_TRIG)	;
											
	--internal_READCTRL_trigger                <= internal_SOFTWARE_TRIGGER;
	internal_READCTRL_trig_delay               <= internal_CMDREG_READCTRL_trig_delay;
	internal_READCTRL_dig_offset               <= internal_CMDREG_READCTRL_dig_offset;
	internal_READCTRL_win_num_to_read          <= internal_CMDREG_READCTRL_win_num_to_read;
	
    internal_READCTRL_asic_enable_bits         <= "0000000001"; -- only one asic				  
	
	internal_READCTRL_readout_continue         <= internal_CMDREG_READCTRL_readout_continue when internal_CMDREG_PedmanEnable='0' else internal_PEDMAN_readout_continue;

	internal_READCTRL_use_fixed_dig_start_win  <= internal_CMDREG_READCTRL_use_fixed_dig_start_win when internal_CMDREG_PedmanEnable='0' else "1000000" & internal_PEDMAN_CurWin;
	
	internal_READCTRL_readout_reset            <= (internal_CMDREG_READCTRL_readout_reset or internal_scint_b2tt_runreset)	when internal_CMDREG_PedmanEnable='0' else internal_PEDMAN_readout_reset;
	internal_READCTRL_RESET_EVENT_NUM          <= internal_CMDREG_READCTRL_RESET_EVENT_NUM;
	
--	u_trig_scaler_multi_ch_w_timing_gen: entity work.trigger_scaler_single_channel_w_timing_gen 	
--	Port Map ( 
--			SIGNAL_TO_COUNT => internal_TRIGDEC_trig,
--			CLOCK           => --internal_CLOCK_TRIG_SCALER,
--			CLK_COUNTER_MAX=>unsigned(internal_CMGREG_TRIG_SCALER_CLK_MAX_TRIGDEC),
--			RESET_PULSE_COUNTER   => internal_TRIGCOUNT_rst,
--			READ_ENABLE_TIMER => open,
--			SCALER          => internal_TRIGCOUNT_scaler_main
--		);

--internal_SCRODLINK_TX_TRIG<=internal_TRIGDEC_trig and not internal_READCTRL_busy_status;

-- FDCE_inst_tx_trig : FDCE
--   generic map (
--      INIT => '0') -- Initial value of register ('0' or '1')  
--   port map (
--      Q => LEDS(6),--LEDS(0),      -- Data output
--      C => internal_CLOCK_FPGA_LOGIC,      -- Clock input
--      CE => '1',    -- Clock enable input
--      CLR => '0',  -- Asynchronous clear input
--      D => internal_SCRODLINK_TX_TRIG       -- Data input
--   );

-- FDCE_inst_rx_trig : FDCE
--   generic map (
--      INIT => '0') -- Initial value of register ('0' or '1')  
--   port map (
--      Q => internal_SCRODLINK_RX_TRIG,--LEDS(0),      -- Data output
--      C => internal_CLOCK_FPGA_LOGIC,      -- Clock input
--      CE => '1',    -- Clock enable input
--      CLR => '0',  -- Asynchronous clear input
--      D => LEDS(7)       -- Data input
--   );

--   FDCE_inst_extrig_LED : FDCE
--   generic map (
--      INIT => '0') -- Initial value of register ('0' or '1')  
--   port map (
--      Q => LEDS(3),--LEDS(0),      -- Data output
--      C => internal_CLOCK_FPGA_LOGIC,      -- Clock input
--      CE => '1',    -- Clock enable input
--      CLR => '0',  -- Asynchronous clear input
--      D => internal_TRIGDEC_trig and not internal_READCTRL_busy_status       -- Data input
--   );
 
	internal_SMP_EXTSYNC <= '1' when internal_SMP_MAIN_CNT="000000000" else
						    '1' when internal_SMP_MAIN_CNT="000000001" else
							'1' when internal_SMP_MAIN_CNT="000000010" else
							'1' when internal_SMP_MAIN_CNT="000000011" else
							'1' when internal_SMP_MAIN_CNT="000000100" else
							'1' when internal_SMP_MAIN_CNT="000000101" else
						     '0' ;
							
    OBUF_inst1 : OBUF
       generic map (
          DRIVE => 12,
          IOSTANDARD => "DEFAULT",
          SLEW => "SLOW")
       port map (
          O => external_SMP_EXTSYNC,     -- Buffer output (connect directly to top-level port)
          I => internal_SMP_EXTSYNC      -- Buffer input
       );
       
       SMP_EXTSYNC <= external_SMP_EXTSYNC;
								  
--	LEDS(12)<=internal_SMP_MAIN_CNT(0);
-- Testing Rev C FW: (comment LEDS(2) for RevC MB)
--	LEDS(2)<=internal_SMP_EXTSYNC;--(not internal_SMP_MAIN_CNT(0)) and (not internal_SMP_MAIN_CNT(1)) and (not internal_SMP_MAIN_CNT(2)) and (not internal_SMP_MAIN_CNT(3)) and (not internal_SMP_MAIN_CNT(4))
--				and (not internal_SMP_MAIN_CNT(5)) and (not internal_SMP_MAIN_CNT(6)) and (not internal_SMP_MAIN_CNT(7)) and (not internal_SMP_MAIN_CNT(8));

	--LEDS(12)<=internal_EX_TRIGGER_SCROD or internal_TRIGGER_ALL or internal_READCTRL_trigger or internal_SMP_MAIN_CNT(4);
	--demux and ped sub logic:
	
	u_wavepedsub: entity work.WaveformPedsubDSP 
	PORT MAP (
        clk                    => internal_CLOCK_FPGA_LOGIC,
        enable                 => internal_PedSubEnable,
        reset                  => internal_waveformpedsub_reset, 
	    SMP_MAIN_CNT           => internal_SMP_MAIN_CNT,
        asic_no                => internal_READCTRL_ASIC_NUM,
        win_addr_start         => internal_READCTRL_dig_win_start,--internal_READCTRL_DIG_RD_COLSEL & internal_READCTRL_DIG_RD_ROWSEL,
        trigin                 => internal_PEDSUB_start,--internal_READCTRL_LATCH_DONE,--srout_start,
			 
        asic_en_bits           => internal_READCTRL_asic_enable_bits,
	    busy                   => internal_PEDSUB_busy,
	    PDAQ_DATA_MODE         => internal_CMDREG_PDAQ_DATA_MODE,-- slow controlled: x"0"= charge and time, x"1"=fullwave,...
	    PDAQ_CHMASK            => internal_CMDREG_PDAQ_DATA_CHMASK,--slow controlled: masks channels that we would like to send full wavefrom dump to pocketdaq
			 
	    mode                   => internal_CMDREG_PedStatSelect & internal_CMDREG_PedDemuxFifoOutputSelect,
	    calc_mode              => internal_CMDREG_PedSubCalcMode,

	    pswfifo_en	           => internal_pswfifo_en,
	    pswfifo_clk            => internal_pswfifo_clk,
	    pswfifo_d 	           => internal_pswfifo_d,--internal_INPUT_REGISTERS(31)

	    fifo_en 	           => internal_SROUT_FIFO_WR_EN,
	    fifo_clk               => internal_SROUT_FIFO_WR_CLK,
	    fifo_din               => internal_SROUT_FIFO_DATA_OUT,

	    qt_fifo_rd_clk 	       => internal_qt_fifo_rd_clk,
	    qt_fifo_rd_en 		   => internal_qt_fifo_rd_en,
	    qt_fifo_dout 		   => internal_qt_fifo_d,
	    qt_fifo_empty 		   => internal_qt_fifo_empty,
	    qt_fifo_almost_empty   => internal_qt_fifo_almost_empty,
	    qt_fifo_evt_rdy 	   => internal_qt_fifo_evt_rdy,

		trig_ctime 		       => internal_klm_trig_ctime,
		bram_doutb             => internal_bram_rd_data(11 downto 0),
		bram_addrb	           => internal_pedsub_bram_addr,
		dmx_allwin_done        => internal_SROUT_ALLWIN_DONE,

		trig_bram_addr         => internal_TRIG_BRAM_PEDSUB_ADDR,
		trig_bram_data         => internal_trig_bram_data,
	    trig_bram_sel          => internal_TRIG_BRAM_PEDSUB_SEL,

		trigasic_bram_rd_addr  => trigasic_bram_rd_addr, 
	    trigasic_bram_rd_data  => trigasic_bram_rd_data, 
		  
        ram_addr               => internal_ram_Ain(2),
        ram_data               => internal_ram_DRout(2),
        ram_update             => internal_ram_update(2),
        ram_busy               => internal_ram_busy(2)
        );
        
	    internal_waveformpedsub_reset     <= internal_CMDREG_READCTRL_readout_reset or internal_scint_b2tt_runreset;
		internal_ram_rw(2)                <= '0';-- always reading from this channel
		internal_PedSubEnable             <= '0' when  internal_CMDREG_PedDemuxFifoOutputSelect = "00" else '1';
--		internal_PedSubEnable             <= '1'; --always enabled now, since 00 is for mean deviation
		internal_ram_rw(3)                <= '1';-- always write to this channel	
--		internal_TRIG_BRAM_WEA(0) <= internal_WR_ENA and internal_TRIG_BRAM_WE; 

	
	internal_TRIG_BRAM_LKBK <= to_integer(signed(internal_SMP_MAIN_CNT)) - to_integer(signed(internal_READCTRL_dig_offset));
	
	internal_TRIG_BRAM_LKBK_ADDR <= std_logic_vector(to_unsigned(internal_TRIG_BRAM_LKBK,9)) when internal_TRIG_BRAM_LKBK >= 0 else
					                std_logic_vector(to_unsigned(512+internal_TRIG_BRAM_LKBK,9)) when internal_TRIG_BRAM_LKBK < 0;
					
	

--	gen_LKBK_triglogic : for i in 0 to 9 generate
--		internal_LKBK_ALL_ASIC_ENABLE_BITS(i)<=
--		internal_CMDREG_TRIGDEC_TRIGMASK(i) and 
--		(	internal_TRIG_BRAM_DATA(i*5) or internal_TRIG_BRAM_DATA(i*5+1) or internal_TRIG_BRAM_DATA(i*5+2) or 
--			internal_TRIG_BRAM_DATA(i*5+3) or internal_TRIG_BRAM_DATA(i*5+4)) 
--		when internal_TRIG_BRAM_PEDSUB_SEL='0' else '0';

--    end generate;

--gen_LKBK_FDCE_logic : for i in 0 to 9 generate
--	
--	trig_FDCE_inst : FDCE
--   generic map (
--      INIT => '0') -- Initial value of register ('0' or '1')  
--   port map (
--      Q => internal_LKBK_READCTRL_ASIC_ENABLE_BITS(i),      -- Data output
--      C => internal_READCTRL_trigger and not internal_READCTRL_busy_status,      -- Clock input
--      CE => '1',    -- Clock enable input
--      CLR => '0',  -- Asynchronous clear input
--      D => internal_LKBK_ASIC_ENABLE_BITS(i)       -- Data input
--   );
-- 
-- end generate;

--	
    u_WaveformPedcalcDSP: entity work.WaveformPedcalcDSP 
    PORT MAP(
        clk               => internal_CLOCK_FPGA_LOGIC,
		reset             => internal_CMDREG_PedCalcReset,
		enable            => internal_PEDMAN_calc_peds_en,--internal_CMDREG_PedmanEnable,
		navg              => internal_CMDREG_PedCalcNAVG,
		SMP_MAIN_CNT      => internal_SMP_MAIN_CNT,
		busy              => internal_PEDCALC_PedCalcBusy,
		niter             => internal_PedCalcNiter,
		dmx_allwin_done   => internal_SROUT_ALLWIN_DONE,

		asic_no           => internal_READCTRL_ASIC_NUM,
		win_addr_start    => internal_READCTRL_dig_win_start,--internal_READCTRL_DIG_RD_COLSEL & internal_READCTRL_DIG_RD_ROWSEL,
		trigin            => internal_PEDSUB_start,
		fifo_en           => internal_SROUT_FIFO_WR_EN,
		fifo_clk          => internal_SROUT_FIFO_WR_CLK,
		fifo_din          => internal_SROUT_FIFO_DATA_OUT,

		bram_doutb        => internal_bram_rd_data,
		bram_addrb	      => internal_pedcalc_bram_addr,
		
		bram2_doutb       => internal_bram2_rd_data,
		bram2_addrb       => internal_pedcalc_bram2_addr,
		
		ram_addr          => internal_ram_Ain(3),
		ram_data          => internal_ram_DWin(3),
		ram_update        => internal_ram_update(3),
		ram_busy          => internal_ram_busy(3)
	);
		

	
	--sampling logic - specifically SSPIN/SSTIN + write address control
    u_SamplingLgc : entity work.SamplingLgc
    Port map (
        clk 			=> internal_CLOCK_FPGA_LOGIC,
        reset           => internal_samplinglgc_reset,
        cfg             => internal_CMDREG_SAMPLIG_LOGIC_RESET_PARAMS,
        dig_win_start   => internal_READCTRL_dig_win_start,
        dig_win_n       => internal_READCTRL_win_num_to_read,-- "00100",
        dig_win_ena     => internal_DIG_IDLE_statusn,--internal_READCTRL_busy_status,
        trigram_wea     => internal_TRIG_BRAM_WE,
        MAIN_CNT_out    => internal_SMP_MAIN_CNT,
        sstin_out 	    => internal_SSTIN,-- GV: 6/9/14 we do not want to shut down this part of the chip!
        wr_addrclr_out  => internal_WR_ADDRCLR,
        wr1_ena 	    => open,--internal_WR_ENA,
        wr2_ena 	    => open
	);

	
	internal_dig_idle_statusn <= not internal_dig_idle_status;
	internal_samplinglgc_reset <= internal_CMDREG_RESET_SAMPLIG_LOGIC or internal_scint_b2tt_runreset;
	
--internal_WR_ENA<= not internal_DIG_IDLE_status;--internal_READCTRL_trigger;-- debug
--internal_WR_ENA<=  internal_READCTRL_READOUT_DONE;--internal_READCTRL_busy;-- debug
--internal_WR_ENA<=  not internal_READCTRL_busy_status;-- debug

	BUSA_WR_ADDRCLR <= internal_WR_ADDRCLR;

	WR1_ENA 		<= internal_WR_ENA;
	WR2_ENA 		<= internal_WR_ENA;


    OBUFDS_inst : OBUFDS
    generic map (
		IOSTANDARD => "LVDS_25")
    port map (
        O => SSTIN_P,--(i),    			-- Diff_p output (connect directly to top-level port)
        OB => SSTIN_N,--(i),   			-- Diff_n output (connect directly to top-level port)
        I => internal_SSTIN      	-- Buffer input 
    );

	--digitizing logic
	u_DigitizingLgc: entity work.DigitizingLgcTX PORT MAP(
		clk 			=> internal_CLOCK_FPGA_LOGIC,
		IDLE_status 	=> internal_DIG_IDLE_status,
		StartDig 		=> internal_DIG_STARTDIG,
		ramp_length 	=> internal_CMDREG_READCTRL_ramp_length(12 downto 0),
		rd_ena 			=> internal_DIG_RD_ENA,
		clr 			=> internal_DIG_CLR,
		startramp 		=> internal_DIG_RAMP
	);
	
	internal_DIG_STARTDIG 	<= internal_READCTRL_dig_start;
	
	--BUSA and BUSB Digitzation signals are identical
	BUSA_RD_ENA			<= internal_DIG_RD_ENA;
	BUSA_RD_ROWSEL_S 	<= internal_READCTRL_DIG_RD_ROWSEL;
	
	BUSA_RD_COLSEL_S 	<= internal_READCTRL_DIG_RD_COLSEL; 
	
	BUSA_CLR 			<= internal_DIG_CLR and not internal_CMDREG_SROUT_TPG;
	BUSA_RAMP 			<= internal_DIG_RAMP;

--select between pedsub or pedcalc
internal_bram_rd_addr<=internal_pedsub_bram_addr when internal_CMDREG_PedmanEnable='0' else internal_pedcalc_bram_addr;
internal_bram2_rd_addr<=internal_pedcalc_bram2_addr when internal_CMDREG_PedmanEnable='1' else "00000000000";
	
	u_SerialDataRoutDemux: entity work.SerialDataRoutDemux PORT MAP(
		clk 			    => internal_CLOCK_FPGA_LOGIC,
		start		 	    => internal_SROUT_START,
		restart		        => internal_READCTRL_srout_restart,
		calc_peds_en	    =>internal_PEDMAN_calc_peds_en,--internal_CMDREG_PedmanEnable
		navg                => internal_CMDREG_PedCalcNAVG,
		EVENT_NUM 	        => internal_READCTRL_EVENT_NUM,
		WIN_ADDR 	        => internal_win_addr,
		ASIC_NUM 	        => internal_READCTRL_ASIC_NUM,
		force_test_pattern  => internal_CMDREG_SROUT_TPG,
		
		IDLE_status         => internal_SROUT_IDLE_status,
		busy 			    => open,
		samp_done 	        => open,
		dout 			    => internal_SROUT_dout,
		sr_clr 		        => internal_SROUT_SR_CLR,
		sr_clk 		        => internal_SROUT_SR_CLK,
		sr_sel 		        => internal_SROUT_SR_SEL,
		samplesel 	        => internal_SROUT_SAMPLESEL,
		smplsi_any 	        => internal_SROUT_SAMPLESEL_ANY,
		dmx_allwin_done     => internal_SROUT_ALLWIN_DONE,
      
		srout_bram_dout     => internal_bram_rd_data,
		srout_bram_addr     => internal_bram_rd_addr,
		
		srout_bram2_dout    => internal_bram2_rd_data,
		srout_bram2_addr    => internal_bram2_rd_addr,

		fifo_wr_en 	        => internal_SROUT_FIFO_WR_EN,
		fifo_wr_clk         => internal_SROUT_FIFO_WR_CLK,
		fifo_wr_din         => internal_SROUT_FIFO_DATA_OUT
	);
	
	internal_win_addr <= internal_READCTRL_DIG_RD_COLSEL & internal_READCTRL_DIG_RD_ROWSEL;
	
--	internal_ram_rw(2)      <='0'; --only reading from this channel of RAM	
	internal_SROUT_START    <= internal_READCTRL_srout_start;

	--make serial readout bus signals identical
	BUSA_SAMPLESEL_S 	    <= internal_SROUT_SAMPLESEL;
--	BUSB_SAMPLESEL_S 	    <= internal_SROUT_SAMPLESEL;
	BUSA_SR_SEL             <= internal_SROUT_SR_SEL;
--	BUSB_SR_SEL             <= internal_SROUT_SR_SEL;
	BUSA_SR_CLEAR           <= internal_SROUT_SR_CLR;
--	BUSB_SR_CLEAR           <= internal_SROUT_SR_CLR;
	
	--Serial readout DO signal switches between buses based on internal_READCTRL_ASIC_NUM signal
	internal_SROUT_dout     <= BUSA_DO;
	
	--multiplex DC specific serial readout signal to ASIC specified by internal_READCTRL_ASIC_NUM signal
	internal_SROUT_ASIC_CONTROL_WORD <= "0000000001" when (internal_READCTRL_ASIC_NUM = x"1") else
										"0000000010" when (internal_READCTRL_ASIC_NUM = x"2") else
										"0000000100" when (internal_READCTRL_ASIC_NUM = x"3") else
										"0000001000" when (internal_READCTRL_ASIC_NUM = x"4") else
										"0000010000" when (internal_READCTRL_ASIC_NUM = x"5") else
										"0000100000" when (internal_READCTRL_ASIC_NUM = x"6") else
										"0001000000" when (internal_READCTRL_ASIC_NUM = x"7") else
										"0010000000" when (internal_READCTRL_ASIC_NUM = x"8") else
										"0100000000" when (internal_READCTRL_ASIC_NUM = x"9") else
										"1000000000" when (internal_READCTRL_ASIC_NUM = x"A") else
										"0000000000";
				
	SR_CLOCK <= internal_SROUT_SR_CLK and internal_SROUT_ASIC_CONTROL_WORD(0);
	SAMPLESEL_ANY <= internal_SROUT_SAMPLESEL_ANY and internal_SROUT_ASIC_CONTROL_WORD(0);
	
	--FIFO receives waveform samples produced by serial readout process
--  u_waveform_fifo_wr32_rd32 : waveform_fifo_wr32_rd32
--  PORT MAP (
--		rst => internal_WAVEFORM_FIFO_RST,
--		wr_clk => internal_SROUT_FIFO_WR_CLK_waveformfifo,
--		rd_clk => internal_WAVEFORM_FIFO_READ_CLOCK,
--		din => internal_SROUT_FIFO_DATA_OUT_waveformfifo,
--		wr_en => internal_SROUT_FIFO_WR_EN_waveformfifo,
--		rd_en => internal_WAVEFORM_FIFO_READ_ENABLE,
--		dout => internal_WAVEFORM_FIFO_DATA_OUT,
--		empty => internal_WAVEFORM_FIFO_EMPTY,
--		valid => internal_WAVEFORM_FIFO_DATA_VALID
--   );

--	internal_SROUT_FIFO_WR_CLK_waveformfifo<= internal_SROUT_FIFO_WR_CLK ;--when internal_CMDREG_PedDemuxFifoOutputSelect="00" else internal_pswfifo_clk;
--	internal_SROUT_FIFO_WR_EN_waveformfifo <= internal_SROUT_FIFO_WR_EN when internal_CMDREG_PedDemuxFifoOutputSelect="00" else internal_pswfifo_en;
--	internal_SROUT_FIFO_DATA_OUT_waveformfifo<= internal_SROUT_FIFO_DATA_OUT when internal_CMDREG_PedDemuxFifoOutputSelect="00" else internal_pswfifo_d;
	
	--Module reads out from waveform FIFO and places ASIC window-sized packets into buffer FIFO
--	u_OutputBufferControl: entity work.OutputBufferControl PORT MAP(
--		clk => internal_CLOCK_FPGA_LOGIC,
--		REQUEST_PACKET 				=> internal_READCTRL_readout_continue,
--		EVTBUILD_DONE					=> internal_EVTBUILD_DONE_SENDING_EVENT,
--		WAVEFORM_FIFO_READ_CLOCK 	=> internal_WAVEFORM_FIFO_READ_CLOCK,
--		WAVEFORM_FIFO_READ_ENABLE 	=> internal_WAVEFORM_FIFO_READ_ENABLE,
--		WAVEFORM_FIFO_DATA_OUT 		=> internal_WAVEFORM_FIFO_DATA_OUT,
--		WAVEFORM_FIFO_EMPTY 			=> internal_WAVEFORM_FIFO_EMPTY,
--		WAVEFORM_FIFO_DATA_VALID 	=> internal_WAVEFORM_FIFO_DATA_VALID,
--		--WAVEFORM_FIFO_READ_CLOCK 	=> internal_WAVEFORM_FIFO_READ_CLOCK,
--		--WAVEFORM_FIFO_READ_ENABLE 	=> open,
--
--		--WAVEFORM_FIFO_DATA_OUT 		=> (others=>'0'),
--		--WAVEFORM_FIFO_EMPTY 			=> '1',
--		--WAVEFORM_FIFO_DATA_VALID 	=> '0',
--		BUFFER_FIFO_RESET 	=> open,--internal_BUFFERCTRL_FIFO_RESET, debug- this reset needs to be implemented ?
--		BUFFER_FIFO_WR_CLK 	=> internal_BUFFERCTRL_FIFO_WR_CLK,
--		BUFFER_FIFO_WR_EN 	=> internal_BUFFERCTRL_FIFO_WR_EN,
--		BUFFER_FIFO_DIN 		=> internal_BUFFERCTRL_FIFO_DIN,
--		EVTBUILD_START	 		=> internal_READCTRL_evtbuild_start,
--		EVTBUILD_MAKE_READY	=> internal_READCTRL_evtbuild_make_ready
--	);
--	
--	--Buffer FIFO, contains up to 512 32-bit words (will not lead to USB packet drops)
--	u_buffer_wr32_rd32 : buffer_fifo_wr32_rd32
--   PORT MAP (
--		rst 		=> internal_BUFFERCTRL_FIFO_RESET,
--		wr_clk	=> internal_BUFFERCTRL_FIFO_WR_CLK,
--		rd_clk 	=> internal_EVTBUILD_FIFO_READ_CLOCK,
--		din 		=> internal_BUFFERCTRL_FIFO_DIN,
--		wr_en 	=> internal_BUFFERCTRL_FIFO_WR_EN,
--		rd_en 	=> internal_EVTBUILD_FIFO_READ_ENABLE,
--		dout 		=> internal_EVTBUILD_FIFO_DATA_OUT,
--		full 		=> open,
--		empty 	=> internal_EVTBUILD_FIFO_EMPTY,
--		valid 	=> internal_EVTBUILD_FIFO_DATA_VALID
--	);
--
--	--Event builder provides ordered waveform data to readout_interfaces module
--	map_event_builder: entity work.event_builder PORT MAP(
--		READ_CLOCK 					=> internal_READOUT_READ_CLOCK,
--		SCROD_REV_AND_ID_WORD 	=> internal_SCROD_REV_AND_ID_WORD,
--		EVENT_NUMBER_WORD 		=> internal_READCTRL_EVENT_NUM,
--		EVENT_TYPE_WORD 			=> x"65766e74",
--		EVENT_FLAG_WORD 			=> x"00000000",
--		NUMBER_OF_WAVEFORM_PACKETS_WORD => x"00000000",
--		START_BUILDING_EVENT 	=> internal_EVTBUILD_START_BUILDING_EVENT,
--		DONE_SENDING_EVENT 		=> internal_EVTBUILD_DONE_SENDING_EVENT,
--		MAKE_READY 					=> internal_EVTBUILD_MAKE_READY,
--		WAVEFORM_FIFO_DATA 		=> internal_EVTBUILD_FIFO_DATA_OUT,
--		WAVEFORM_FIFO_DATA_VALID => internal_EVTBUILD_FIFO_DATA_VALID,
--		WAVEFORM_FIFO_EMPTY 		=> internal_EVTBUILD_FIFO_EMPTY,
--		WAVEFORM_FIFO_READ_ENABLE => internal_EVTBUILD_FIFO_READ_ENABLE,
--		WAVEFORM_FIFO_READ_CLOCK => internal_EVTBUILD_FIFO_READ_CLOCK,
--		FIFO_DATA_OUT 				=> internal_READOUT_DATA_OUT,
--		FIFO_DATA_VALID 			=> internal_READOUT_DATA_VALID,
--		FIFO_EMPTY					=> internal_READOUT_EMPTY,
--		FIFO_READ_ENABLE 			=> internal_READOUT_READ_ENABLE
--	);
--	internal_EVTBUILD_START_BUILDING_EVENT <= internal_READCTRL_evtbuild_start;
--	internal_EVTBUILD_MAKE_READY <= internal_READCTRL_evtbuild_make_ready;
--	internal_SCROD_REV_AND_ID_WORD <= x"00" & x"A3" & x"002c";
--	--internal_EVTBUILD_START_BUILDING_EVENT <= internal_CMDREG_EVTBUILD_START_BUILDING_EVENT;
--	--internal_EVTBUILD_MAKE_READY <= internal_CMDREG_EVTBUILD_MAKE_READY;
	
	
		u_trigger_scaler_single_channel_w_timing_gen: entity work.trigger_scaler_single_channel_w_timing_gen 
		Port Map ( --IM 6/5/14: now using the combined trigger scaler timing gen block instead

			SIGNAL_TO_COUNT      => internal_TRIGGER_ASIC(0),
			CLOCK                => internal_CLOCK_FPGA_LOGIC,
			CLK_COUNTER_MAX      => unsigned(internal_CMGREG_TRIG_SCALER_CLK_MAX),

			RESET_PULSE_COUNTER  => internal_TRIGCOUNT_rst,
			READ_ENABLE_TIMER    => internal_READ_ENABLE_TIMER(0),
			SCALER               => internal_TRIGCOUNT_scaler(0)
		);


-----------------------------
---- MPPC Current measurement ADC: MPC3221 --connected to 3.3V LEDS on USB DC for testing only.
-----------------------------
--	inst_mcp_adc: entity work.Module_ADC_MCP3221_I2C_new
--	port map(
----		clock		=> internal_CLOCK_MPPC_DAC,--internal_CLOCK_FPGA_LOGIC,
--		clock		=> internal_CLOCK_FPGA_LOGIC,	
--		reset		=>	internal_CurrentADC_reset,
--		
--		sda		=> LEDS(10),--SDA_MON,--internal_SDA,
--		scl		=> LEDS(11),
--		 
--		runADC		=> internal_runADC,
--		enOutput		=> internal_enOutput,
--		ADCOutput	=> internal_ADCOutput
--
--	);
--
--internal_runADC<='1' when internal_MCP_ADC_counter=x"000000" else '0';
--LEDS(9)<=internal_TEST_MUX(26);-- slow pulse at 2.4s half period to select mux.


-- COUNTER_LOAD_MACRO_inst2 : COUNTER_LOAD_MACRO
--   generic map (
--      COUNT_BY => X"000000000001", -- Count by value
--      DEVICE => "SPARTAN6",         -- Target Device: "VIRTEX5", "VIRTEX6", "SPARTAN6" 
--      WIDTH_DATA => 24)            -- Counter output bus width, 1-48
--   port map (
--      Q => internal_MCP_ADC_counter,                 -- Counter output, width determined by WIDTH_DATA generic 
--      CLK => internal_CLOCK_FPGA_LOGIC,             -- 1-bit clock input
--      CE => '1',               -- 1-bit clock enable input
--      DIRECTION => '1', -- 1-bit up/down count direction input, high is count up
--      LOAD => '0',           -- 1-bit active high load input
--      LOAD_DATA => x"000000", -- Counter load data, width determined by WIDTH_DATA generic 
--      RST => '0'              -- 1-bit active high synchronous reset
--   );

--  COUNTER_LOAD_MACRO_inst : COUNTER_LOAD_MACRO
--   generic map (
--      COUNT_BY => X"000000000001", -- Count by value
--      DEVICE => "SPARTAN6",         -- Target Device: "VIRTEX5", "VIRTEX6", "SPARTAN6" 
--      WIDTH_DATA => 27)            -- Counter output bus width, 1-48
--   port map (
--      Q => internal_TEST_MUX,                 -- Counter output, width determined by WIDTH_DATA generic 
--      CLK => internal_CLOCK_FPGA_LOGIC,             -- 1-bit clock input
--      CE => '1',               -- 1-bit clock enable input
--      DIRECTION => '1', -- 1-bit up/down count direction input, high is count up
--      LOAD => '0',           -- 1-bit active high load input
--      LOAD_DATA => "000" & x"000000", -- Counter load data, width determined by WIDTH_DATA generic 
--      RST => '0'              -- 1-bit active high synchronous reset
--   );

--	i_mppc_dac_patgen: entity work.mppc_dac_patgen PORT MAP(
--		clk => internal_CLOCK_MPPC_DAC,
--		addr => internal_DAC_PATGEN_ADDR,
--		val => internal_DAC_PATGEN_VAL,
--		update => internal_DAC_PATGEN_UPDATE,
--		dac_busy => internal_DAC_BUSY
--	);
--

--	i_mppc_bias_dac088s085: entity work.mppc_bias_dac088s085 PORT MAP(
--		clk => internal_CLOCK_MPPC_DAC,
--		addr => internal_DAC_PATGEN_ADDR,
--		val => internal_DAC_PATGEN_VAL,
--		update => internal_DAC_PATGEN_UPDATE,
--		busy => internal_DAC_BUSY,
--		SCLK => LEDS(6),
--		SYNC_n => LEDS(8),
--		DIN => LEDS(7)
--	);

------------------------------------------ removed	
-----------------------------
---- MPPC Current measurement ADC: MPC3221
-----------------------------
--	inst_mpc_adc: entity work.Module_ADC_MCP3221_I2C_new
--	port map(
--		clock			 =>internal_CLOCK_FPGA_LOGIC,-- internal_CLOCK_MPPC_DAC,--internal_CLOCK_FPGA_LOGIC,
--		reset			=>	internal_CurrentADC_reset,
		
--		sda	=> SDA_MON,--internal_SDA,
--		scl	=> internal_SCL,
		 
--		runADC		=> internal_runADC,
--		enOutput		=> internal_enOutput,
--		ADCOutput	=> internal_ADCOutput

--	);

------------------------------------------ removed	
--	--------------
--	-- MPPC DACs
--	--------------
--	inst_mpps_dacs : entity work.mppc_dacs_wrapper_dac088s085
--	Port map(
--		------------CLOCK-----------------
--		CLOCK			 => internal_CLOCK_MPPC_DAC,
--		------------DAC PARAMETERS--------
--		DAC_NUMBER   => i_dac_number,
--		DAC_ADDR     => i_dac_addr,
--		DAC_VALUE    => i_dac_value,
--		WRITE_STROBE => i_dac_update_extended,
--		busy			 => i_dac_busy,
--		------------HW INTERFACE----------
--		SCK_DAC		 => i_hv_sck_dac,
--		DIN_DAC		 => i_hv_din_dac,
--		CS_DAC       => internal_TDC_CS_DAC
--	);
--gen_tdc_cs_dac_signals1: if (HW_CONF="SA4_MBSF_TX") generate
--	TDC_CS1_DAC<=internal_TDC_CS_DAC;
--	TDC_CS2_DAC<=internal_TDC_CS_DAC;
--end generate;
--gen_tdc_cs_dac_signals2: if (HW_CONF/="SA4_MBSF_TX") generate
--	TDC_CS_DAC<=--internal_TDC_CS_DAC;
--end generate;

   
--	BUSA_SCK_DAC <= i_hv_sck_dac; 
--	BUSB_SCK_DAC <= i_hv_sck_dac; 
--	BUSA_DIN_DAC <= i_hv_din_dac; 
--	BUSB_DIN_DAC <= i_hv_din_dac; 

--	inst_pulse_extent : entity work.pulse_transition
--	Generic map(
--		CLOCK_RATIO  => 20
--	)
--	Port map(
--		CLOCK_IN     => internal_CLOCK_FPGA_LOGIC,
--		D_IN         => i_dac_update,
--		CLOCK_OUT    => --internal_CLOCK_MPPC_DAC,
--		D_OUT        => i_dac_update_extended
--	);

end Behavioral;
