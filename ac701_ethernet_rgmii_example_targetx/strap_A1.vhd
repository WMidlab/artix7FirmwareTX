----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:20:38 10/25/2012 
-- Design Name: 
-- Module Name:    strap_A1 - Behavioral 
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

use work.strap_definitions.all;

entity strap_A1 is
	   generic(
	DAQ_IFACE				: string :="Ethernet";  --main readout interface is ethernet -- still gets clock from FTSW for testing
	 HW_CONF						: string :="STRAP_A1" 	 --SCROD A5, MB C, TXDC C, RHIC C
	 );
	 Port(
      glbl_rst                      : in  std_logic;

     -- 200MHz clock input from board
     clk_in_p                      : in  std_logic;
     clk_in_n                      : in  std_logic;
     -- 125 MHz clock output from MMCM
     gtx_clk_bufg_out              : out std_logic;

     phy_resetn                    : out std_logic;


     -- RGMII Interface
     ------------------
     rgmii_txd                     : out std_logic_vector(3 downto 0);
     rgmii_tx_ctl                  : out std_logic;
     rgmii_txc                     : out std_logic;
     rgmii_rxd                     : in  std_logic_vector(3 downto 0);
     rgmii_rx_ctl                  : in  std_logic;
     rgmii_rxc                     : in  std_logic;

     -- MDIO Interface
     -----------------
     mdio                          : inout std_logic;
     mdc                           : out std_logic;


     -- Serialised statistics vectors
     --------------------------------
     tx_statistics_s               : out std_logic;
     rx_statistics_s               : out std_logic;

     -- Serialised Pause interface controls
     --------------------------------------
     pause_req_s                   : in  std_logic;

     -- Main example design controls
     -------------------------------
     mac_speed                     : in  std_logic_vector(1 downto 0);
     update_speed                  : in  std_logic;
     config_board                  : in  std_logic;
     --serial_command                : in  std_logic;  -- tied to pause_req_s
     serial_response               : out std_logic;
     gen_tx_data                   : in  std_logic;
     chk_tx_data                   : in  std_logic;
     reset_error                   : in  std_logic;
 --    frame_error                   : out std_logic;
   --  frame_errorn                  : out std_logic;
     activity_flash                : out std_logic;
     activity_flashn               : out std_logic
     


	);
end strap_A1;

architecture Behavioral of strap_A1 is
	signal internal_BOARD_CLOCK_OUT      : std_logic;
	signal internal_CLOCK_FPGA_LOGIC : std_logic;
	signal internal_CLOCK_MPPC_DAC  : std_logic;
--	signal internal_CLOCK_ASIC_CTRL : std_logic;
	signal internal_CLOCK_ASIC_CTRL_WILK : std_logic_vector(9 downto 0);
	signal internal_CLOCK_B2TT_SYS	:std_logic;	
	signal internal_CLOCK_MPPC_ADC  : std_logic;
	signal internal_CLOCK_TRIG_SCALER:std_logic;


	signal internal_OUTPUT_REGISTERS : GPR;
	signal internal_INPUT_REGISTERS  : RR;
	signal i_register_update         : RWT;
	signal internal_STATREG_REGISTERS		: STATREG;
	
	--Trigger readout
	signal internal_SOFTWARE_TRIGGER : std_logic;
	signal internal_HARDWARE_TRIGGER : std_logic;
	signal internal_TRIGGER : std_logic;
	signal internal_TRIGGER_OUT : std_logic;
	
	--Vetoes for the triggers
	signal internal_SOFTWARE_TRIGGER_VETO : std_logic;
	signal internal_HARDWARE_TRIGGER_ENABLE : std_logic;
	
	--SCROD ID and REVISION Number
	signal internal_SCROD_REV_AND_ID_WORD        : STD_LOGIC_VECTOR(31 downto 0);
   signal internal_EVENT_NUMBER_TO_SET          : STD_LOGIC_VECTOR(31 downto 0) := (others => '0'); --This is what event number will be set to when set event number is enabled
   signal internal_SET_EVENT_NUMBER             : STD_LOGIC;
   signal internal_EVENT_NUMBER                 : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

	--Event builder + readout interface waveform data flow related
	signal internal_WAVEFORM_FIFO_DATA_OUT       : std_logic_vector(31 downto 0) := (others => '0');
	signal internal_WAVEFORM_FIFO_EMPTY          : std_logic := '0';
	signal internal_WAVEFORM_FIFO_DATA_VALID     : std_logic := '0';
	signal internal_WAVEFORM_FIFO_READ_CLOCK     : std_logic := '0';
	signal internal_WAVEFORM_FIFO_READ_ENABLE    : std_logic := '0';
	signal internal_WAVEFORM_PACKET_BUILDER_BUSY	: std_logic := '0';
	signal internal_WAVEFORM_PACKET_BUILDER_VETO : std_logic := '0';
	signal internal_USB_FIFO_CLOCK					:std_logic:='0';
	
	signal internal_EVTBUILD_FIFO_DATA_OUT					: std_logic_vector(31 downto 0) := (others => '0');
	signal internal_EVTBUILD_FIFO_EMPTY          : std_logic := '0';
	signal internal_EVTBUILD_FIFO_DATA_VALID     : std_logic := '0';
	signal internal_EVTBUILD_FIFO_READ_CLOCK     : std_logic := '0';
	signal internal_EVTBUILD_FIFO_READ_ENABLE    : std_logic := '0';
	
	signal internal_READOUT_DATA_OUT					: std_logic_vector(31 downto 0) := (others => '0');
	signal internal_READOUT_DATA_VALID				: std_logic := '0';
	signal internal_READOUT_EMPTY						: std_logic := '0';
	signal internal_READOUT_READ_CLOCK     : std_logic := '0';
	signal internal_READOUT_READ_ENABLE				: std_logic := '0';
	
	signal internal_EVTBUILD_DATA_OUT       : std_logic_vector(31 downto 0) := (others => '0');
	signal internal_EVTBUILD_EMPTY          : std_logic := '0';
	signal internal_EVTBUILD_DATA_VALID     : std_logic := '0';
	signal internal_EVTBUILD_READ_CLOCK     : std_logic := '0';
	signal internal_EVTBUILD_READ_ENABLE    : std_logic := '0';
	signal internal_EVTBUILD_PACKET_BUILDER_BUSY	: std_logic := '0';
	signal internal_EVTBUILD_PACKET_BUILDER_VETO : std_logic := '0';
	signal internal_EVTBUILD_START_BUILDING_EVENT : std_logic := '0';
	signal internal_EVTBUILD_DONE_SENDING_EVENT : std_logic := '0';
	--External Trig Control:
	
		
	signal internal_EX_TRIGGER_MB	: std_logic:='0';
	signal internal_EX_TRIGGER_SCROD	: STD_LOGIC:='0';
		
		
	--ASIC TRIGGER CONTROL
	signal internal_TRIGGER_ALL : std_logic := '0';
	signal internal_TRIGGER_ASIC : std_logic_vector(9 downto 0) := "0000000000";
	signal internal_TRIGGER_ASIC_control_word : std_logic_vector(9 downto 0) := "0000000000";
	signal internal_TRIGCOUNT_ena : std_logic := '0';
	signal internal_TRIGCOUNT_rst : std_logic := '0';
	constant TRIGGER_SCALER_BIT_WIDTH      : integer := 32;
	type TARGETX_TRIGGER_SCALERS is array(9 downto 0) of std_logic_vector(TRIGGER_SCALER_BIT_WIDTH-1 downto 0);	
	signal internal_TRIGCOUNT_scaler : TARGETX_TRIGGER_SCALERS;
	signal internal_TRIGCOUNT_scaler_main : std_logic_vector(TRIGGER_SCALER_BIT_WIDTH-1 downto 0);
	signal internal_READ_ENABLE_TIMER : std_logic_vector (9 downto 0);
--	signal internal_TXDCTRIG : tb_vec_type;-- All triger bits from all ASICs are here
--	signal internal_ext_TXDCTRIG : tb_vec_type;-- All triger bits from all ASICs are here
--	signal internal_ext_TRIGDEC_TXDCTRIG : tb_vec_type;-- All triger bits from all ASICs are here- they will be extended even more here
	
--	signal internal_TXDCTRIG16 : std_logic_vector(1 to TDC_NUM_CHAN);-- All triger bits from all ASICs are here
--	signal internal_TXDCTRIG_buf : tb_vec_type;-- All triger bits from all ASICs are here
--	signal internal_TXDCTRIG16_buf : std_logic_vector(1 to TDC_NUM_CHAN);-- All triger bits from all ASICs are here
	
	signal internal_SMP_EXTSYNC	: std_logic:='0';
	
	
	signal internal_TRIG_BRAM_WE	:	std_logic:='0';
	signal internal_TRIG_BRAM_WEA	:	std_logic_vector(0 downto 0):="0";
   signal internal_TRIG_BRAM_ADDR:	std_logic_vector(8 downto 0) :=(others=>'0');
	signal internal_TRIG_BRAM_PEDSUB_ADDR:  std_logic_vector(8 downto 0) :=(others=>'0'); 
	signal internal_TRIG_BRAM_LKBK_ADDR: std_logic_vector(8 downto 0) :=(others=>'0'); 
	signal internal_TRIG_BRAM_DATA:	std_logic_vector(49 downto 0) :=(others=>'0');
	signal internal_TRIG_BRAM_PEDSUB_SEL: std_logic:='0';
	signal internal_alltb:std_logic_vector(49 downto 0) :=(others=>'0');
	signal internal_TRIG_BRAM_DINA:std_logic_vector(49 downto 0) :=(others=>'0');
	
	
	--ASIC DAC CONTROL
	signal internal_DAC_CONTROL_UPDATE : std_logic := '0';
	signal internal_DAC_CONTROL_busy: std_logic:='0';
	signal internal_DAC_CONTROL_REG_DATA : std_logic_vector(18 downto 0) := (others => '0');
	signal internal_DAC_CONTROL_TDCNUM : std_logic_vector(9 downto 0) := (others => '0');
	signal internal_DAC_CONTROL_SIN : std_logic := '0';
	signal internal_DAC_CONTROL_SCLK : std_logic := '0';
	signal internal_DAC_CONTROL_PCLK : std_logic := '0';
	signal internal_DAC_CONTROL_LOAD_PERIOD : std_logic_vector(15 downto 0)  := (others => '0');
	signal internal_DAC_CONTROL_LATCH_PERIOD : std_logic_vector(15 downto 0)  := (others => '0');
	signal internal_TDC_CS_DAC : std_logic_vector(9 downto 0);
	signal internal_WL_CLK_N						: std_logic := '0';

	--READOUT CONTROL
	signal internal_READCTRL_trigger : std_logic := '0';
	signal internal_READCTRL_trig_delay : std_logic_vector(11 downto 0) := (others => '0');
	signal internal_READCTRL_dig_offset : std_logic_vector(8 downto 0) := (others => '0');
	signal internal_READCTRL_win_num_to_read : std_logic_vector(8 downto 0) := (others => '0');
	signal internal_READCTRL_asic_enable_bits : std_logic_vector(9 downto 0) := (others => '0');
	signal internal_READCTRL_readout_reset : std_logic := '0';
	signal internal_READCTRL_readout_continue : std_logic := '0';
	signal internal_READCTRL_busy_status : std_logic := '0';
	signal internal_READCTRL_smp_stop : std_logic := '0';
	signal internal_READCTRL_dig_start  : std_logic := '0';
	signal internal_READCTRL_DIG_RD_ROWSEL : std_logic_vector(2 downto 0) := (others => '0');
	signal internal_READCTRL_DIG_RD_COLSEL : std_logic_vector(5 downto 0) := (others => '0');
	signal internal_READCTRL_srout_start  : std_logic := '0';
	signal internal_READCTRL_srout_restart  : std_logic := '0';
	signal internal_PEDMAN_calc_peds_en	:std_logic:='0';
	signal internal_READCTRL_evtbuild_start  : std_logic := '0';
	signal internal_READCTRL_evtbuild_make_ready  : std_logic := '0';
	signal internal_READCTRL_LATCH_SMP_MAIN_CNT : std_logic_vector(8 downto 0) := (others => '0');
	signal internal_READCTRL_LATCH_DONE : std_logic := '0';
	signal internal_READCTRL_ASIC_NUM : std_logic_vector(3 downto 0) := (others => '0');
	signal internal_READCTRL_RESET_EVENT_NUM : std_logic := '0';
	signal internal_READCTRL_EVENT_NUM : std_logic_vector(31 downto 0) := x"00000000";
	signal internal_READCTRL_READOUT_DONE : std_logic := '0';
	signal internal_READCTRL_dig_win_start : std_logic_vector(8 downto 0) := (others => '0');
	signal internal_ASIC_TRIG: std_logic:='0';
	signal internal_PEDSUB_start:std_logic :='0';
	signal internal_PEDSUB_busy:std_logic :='0';
	
	----readout trigger modes and signals
	signal internal_TRIG_SW			:std_logic :='0';
	signal internal_TRIG_KLM1		:std_logic :='0';
	signal internal_TRIG_KLM2		:std_logic :='0';
	signal internal_TRIG_HW1		:std_logic :='0';
	signal internal_TRIG_PEDMAN	:std_logic :='0';
	
	
	signal internal_CMDREG_RESET_SAMPLIG_LOGIC :std_logic :='0';
	signal internal_CMDREG_SAMPLIG_LOGIC_RESET_PARAMS :std_logic_vector(15 downto 0) :=(others => '0');
	signal internal_CMDREG_SOFTWARE_trigger : std_logic := '0';
	signal internal_CMDREG_SOFTWARE_TRIGGER_VETO : std_logic := '0';
	signal internal_CMDREG_HARDWARE_TRIGGER_ENABLE : std_logic := '0';
	signal internal_CMDREG_READCTRL_trig_delay : std_logic_vector(11 downto 0) := (others => '0');
	signal internal_CMDREG_READCTRL_dig_offset : std_logic_vector(8 downto 0) := (others => '0');
	signal internal_CMDREG_READCTRL_win_num_to_read : std_logic_vector(8 downto 0) := (others => '0');
	signal internal_CMDREG_READCTRL_asic_enable_bits : std_logic_vector(9 downto 0) := (others => '0');
	signal internal_CMDREG_READCTRL_readout_reset : std_logic := '0';
	signal internal_CMDREG_READCTRL_readout_continue : std_logic := '0';
	signal internal_CMDREG_WAVEFORM_FIFO_RST : std_logic := '0';
	signal internal_CMDREG_EVTBUILD_START_BUILDING_EVENT : std_logic := '0';
	signal internal_CMDREG_EVTBUILD_MAKE_READY : std_logic := '0';
	signal internal_CMDREG_EVTBUILD_DONE_SENDING_EVENT : std_logic := '0';
	signal internal_CMDREG_EVTBUILD_PACKET_BUILDER_BUSY : std_logic := '0';
	signal internal_CMDREG_READCTRL_RESET_EVENT_NUM : std_logic := '0';
	signal internal_CMDREG_readctrl_ramp_length : std_logic_vector(15 downto 0) :=(others => '0');
	signal internal_cmdreg_readctrl_use_fixed_dig_start_win : std_logic_vector(15 downto 0):=(others => '0');
	signal internal_CMDREG_SW_STATUS_READ : std_logic;

	--pedestal handling unit using command regs
	signal internal_CMDREG_PedCalcReset			:std_logic:='0';
	signal internal_CMDREG_PedmanEnable			:std_logic:='0';
	signal internal_PedSubEnable			:std_logic:='0';
	signal internal_CMDREG_PedCalcNAVG			:std_logic_vector(3 downto 0):=x"3";-- 2**3=8 averages for calculating peds
	signal internal_CMDREG_PedDemuxFifoEnable		:std_logic:='1';-- this out put will replace the common readout fifo from the SRreadout module
	signal internal_CMDREG_PedDemuxFifoOutputSelect: std_logic_vector(1 downto 0);
	signal internal_CMDREG_PedSubCalcMode:std_logic_vector(3 downto 0);
	signal internal_CMDREG_USE_KLMTRIG:std_logic:='0';
	signal internal_CMDREG_KLMTRIG_CAL_READOUT_MODE:std_logic:='0';
	signal internal_CMDREG_USE_SCRODLINK:std_logic:='0';
	signal internal_SCRODLINK_RX_TRIG:std_logic:='0';
	signal internal_SCRODLINK_TX_TRIG:std_logic:='0';
	signal internal_PedCalcNiter: std_logic_vector(15 downto 0):=(others=>'0');
	signal internal_KLM_SCINT_MISSED_TRG: std_logic_vector(15 downto 0):=(others=>'0');
			
	--ASIC SAMPLING CONTROL
	signal internal_SMP_MAIN_CNT 			: std_logic_vector(8 downto 0) := (others => '0');
	signal internal_SSTIN 					: std_logic := '0';
	signal internal_SSPIN 					: std_logic := '0';
	signal internal_WR_STRB 				: std_logic := '0';
	signal internal_WR_ADVCLK 				: std_logic := '0';
	signal internal_WR_ENA 					: std_logic := '1';
	signal internal_WR_ADDRCLR 			: std_logic := '0';
	
	--ASIC DIGITIZATION CONTROL
	signal internal_DIG_STARTDIG 			: std_logic := '0';
	signal internal_DIG_IDLE_status 		: std_logic := '0';
	signal internal_DIG_RD_ENA 			: std_logic := '0';
	signal internal_DIG_CLR 				: std_logic := '0';

	signal internal_DIG_RD_ROWSEL_S 		: STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
	signal internal_DIG_RD_COLSEL_S 		: STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
	signal internal_DIG_START 				: STD_LOGIC := '0';
	signal internal_DIG_RAMP 				: STD_LOGIC := '0';
	
	--ASIC SERIAL READOUT
	signal internal_SROUT_START 			: std_logic := '0';
	signal internal_SROUT_IDLE_status 	: std_logic := '0';
	signal internal_SROUT_SAMP_DONE 		: std_logic := '0';
	signal internal_SROUT_SR_CLR 			: std_logic := '0';

	signal internal_SROUT_SR_CLK 			: std_logic := '0';
	signal internal_SROUT_SR_SEL 			: std_logic := '0';

	signal internal_SROUT_SAMPLESEL 		: std_logic_vector(4 downto 0) := (others => '0');
	signal internal_SROUT_SAMPLESEL_ANY : std_logic := '0';

	signal internal_SROUT_FIFO_WR_CLK   : std_logic := '0';
	signal internal_SROUT_FIFO_WR_EN    : std_logic := '0';
	signal internal_SROUT_FIFO_DATA_OUT : std_logic_vector(31 downto 0) := (others => '0');
	signal internal_SROUT_FIFO_WR_CLK_waveformfifo   : std_logic := '0';
	signal internal_SROUT_FIFO_WR_EN_waveformfifo    : std_logic := '0';
	signal internal_SROUT_FIFO_DATA_OUT_waveformfifo : std_logic_vector(31 downto 0) := (others => '0');
	signal internal_SROUT_dout 			: std_logic_vector(15 downto 0) := (others => '0');
	signal internal_SROUT_ASIC_CONTROL_WORD : std_logic_vector(9 downto 0) := (others => '0');
	signal internal_CMDREG_SROUT_TPG : std_logic := '0';
	signal internal_SROUT_ALLWIN_DONE :std_logic:='0';	
	
	
	--WAVEFORM DATA FIFO
	signal internal_WAVEFORM_FIFO_RST 	: std_logic := '0';
	signal internal_EVTBUILD_MAKE_READY : std_logic := '0';
	
	--BUFFER CONTROL
	signal internal_BUFFERCTRL_FIFO_RESET	: std_logic := '0';
	signal internal_BUFFERCTRL_FIFO_WR_CLK : std_logic := '0';
	signal internal_BUFFERCTRL_FIFO_WR_EN 	: std_logic := '0';
	signal internal_BUFFERCTRL_FIFO_DIN 	: std_logic_vector(31 downto 0) := (others => '0');
	
	--MPPC Current Read ADCs
	signal internal_CurrentADC_reset			: std_logic;
	signal internal_SDA							: std_logic;
	signal internal_SCL							: std_logic;
	signal internal_runADC						: std_logic;
	signal internal_enOutput					: std_logic;
	signal internal_ADCOutput 					: std_logic_vector(11 downto 0);
	signal internal_AMUX_S						: std_logic_vector(7 downto 0);
	signal internal_MCP_ADC_counter			: std_logic_vector(23 downto 0);
	signal internal_TEST_MUX					: std_logic_vector(26 downto 0);
	
	-- MPPC DAC
	signal i_dac_number : std_logic_vector(3 downto 0);
	signal i_dac_addr   : std_logic_vector(3 downto 0);
	signal i_dac_value  : std_logic_vector(7 downto 0);
	signal i_dac_update : std_logic;
	signal i_dac_update_extended : std_logic;
	signal i_dac_busy :std_logic:='0';
	signal i_hv_sck_dac : std_logic;
	signal i_hv_din_dac : std_logic;

	signal internal_DAC_PATGEN_ADDR   : std_logic_vector(3 downto 0);
	signal internal_DAC_PATGEN_VAL  : std_logic_vector(7 downto 0);
	signal internal_DAC_PATGEN_UPDATE : std_logic;
	signal internal_DAC_BUSY : std_logic;


	signal internal_TDC_MON_TIMING_buf : std_logic_vector(9 downto 0);

	signal internal_CMDREG_UPDATE_STATUS_REGS : std_logic;
-----------------SRAM  Signals:


	signal internal_CMDREG_RAMADDR : std_logic_vector (21 downto 0);
	signal internal_CMDREG_RAMDATAWR :std_logic_vector(7 downto 0);
	signal internal_CMDREG_RAMUPDATE :std_logic;
	signal internal_CMDREG_RAMDATARD :std_logic_vector(7 downto 0);
	signal internal_CMDREG_RAMRW :std_logic;
	signal internal_CMDREG_RAMBUSY :std_logic;
-- Mutlti port RAM driver channels: ch 0: USB, ch 1: Run Control pedestal write, ch 2: waveform demux+ped subtraction, ch 3: waveform demux + ped calculation  
   signal internal_ram_Ain : AddrArray;--:= (others => '0');
   signal internal_ram_DWin : DataArray;-- := (others => '0');
   signal internal_ram_rw : std_logic_vector(NRAMCH-1 downto 0) := (others => '0');
   signal internal_ram_update : std_logic_vector(NRAMCH-1 downto 0) := (others => '0');
   signal internal_ram_DRout : DataArray;
   signal internal_ram_busy : std_logic_vector(NRAMCH-1 downto 0);
	signal RAM_IOw_i:std_logic_vector(7 downto 0);
	signal RAM_IOr_i:std_logic_vector(7 downto 0);
	signal RAM_IO_bs_i:std_logic;
-------------------------------------
	signal internal_pswfifo_d:std_logic_vector(31 downto 0);
	signal internal_pswfifo_clk:std_logic;
	signal internal_pswfifo_en:std_logic;
	signal internal_bram_rd_data		: STD_LOGIC_VECTOR(19 DOWNTO 0):=x"00000";
	signal internal_bram_rd_addr		: std_logic_vector(10 downto 0):="00000000000";
	signal internal_bram_addrb			: std_logic_vector(10 downto 0):="00000000000";
	signal internal_pedsub_bram_addr : std_logic_vector(10 downto 0):="00000000000";
	signal internal_pedcalc_bram_addr: std_logic_vector(10 downto 0):="00000000000";
	signal	internal_qt_fifo_d		:	STD_LOGIC_VECTOR(17 DOWNTO 0):="00" & x"0000";
	signal	internal_qt_fifo_empty	:	std_logic;
	signal	internal_qt_fifo_almost_empty	:	std_logic;
	signal	internal_qt_fifo_rd_clk	:	std_logic;
	signal	internal_qt_fifo_rd_en	:	std_logic;
	signal   internal_qt_fifo_evt_rdy	:std_logic;
	signal	internal_trig_ctime		:	std_logic_vector(26 downto 0):=(others => '0');
	signal internal_TRIG_EVENT_NO		:	std_logic_vector(15 downto 0):=x"0000";
	signal 	internal_scint_b2tt_runreset:std_logic:='0';
	signal 	internal_scint_b2tt_runreset_i:std_logic:='0';


signal  	 internal_rcl_fifo_rd_clk	: std_logic:='0';
signal  	 internal_rcl_fifo_rd_en 	: std_logic:='0';
signal  	 internal_rcl_fifo_data		: std_logic_vector(31 downto 0);
signal  	 internal_rcl_fifo_empty	: std_logic:='0';
signal 	 internal_CTRL_MODE			:	std_logic_vector(3 downto 0);

signal gtx_clk_bufg_out_i : std_logic;


------------------------------------------

----------Internal Trig_decision Logic:
	
signal internal_TRIGDEC_ax						:std_logic_vector(2 downto 0):="000";
signal internal_TRIGDEC_ay						:std_logic_vector(2 downto 0):="000";
signal internal_TRIGDEC_asic_enable_bits	:std_logic_vector(9 downto 0):="0000000000";
signal internal_CMDREG_USE_TRIGDEC			:std_logic:='0';	
signal internal_TRIGDEC_trig					:std_logic:='0';
signal internal_CMDREG_TRIGDEC_TRIGMASK	: std_logic_vector(14 downto 0):="000001111111111";
signal internal_CMDREG_PDAQ_DATA_MODE:std_logic_vector(3 downto 0):=x"0";
signal internal_CMDREG_PDAQ_DATA_CHMASK:std_logic_vector(15 downto 0):=x"0000";


signal internal_LKBK_READCTRL_ASIC_ENABLE_BITS:std_logic_vector(9 downto 0):="0000000000";
signal internal_LKBK_ALL_ASIC_ENABLE_BITS:std_logic_vector(9 downto 0):="0000000000";
signal internal_LKBK_ASIC_ENABLE_BITS:std_logic_vector(9 downto 0):="0000000000";
signal internal_TRIG_BRAM_LKBK: integer:=0;

signal internal_CMGREG_TRIG_SCALER_CLK_MAX			:std_logic_vector(15 downto 0):=x"0010";--scaler counter max values
signal internal_CMGREG_TRIG_SCALER_CLK_MAX_TRIGDEC	:std_logic_vector(15 downto 0):=x"0010";
	
---------------Pedestal management--------------
signal internal_CMDREG_PedCalcStart  : std_logic:='0';
signal internal_CMDREG_PedCalcWinLen : std_logic_vector(15 downto 0):=(others=>'0');
signal internal_CMDREG_PedCalcASICen : std_logic_vector(9 downto 0):=(others=>'0');
signal internal_PEDMAN_ReadoutTrig: std_logic:='0';
signal internal_CMDREG_PedManBusy:	std_logic:='0';
signal internal_PEDMAN_CurWin		 : std_logic_vector(8 downto 0):=(others=>'0');
signal internal_PEDMAN_CurASICen  : std_logic_vector(9 downto 0):=(others=>'0'); 
signal internal_PEDMAN_readout_reset	: std_logic:='0';
signal internal_READCTRL_use_fixed_dig_start_win : std_logic_vector(15 downto 0):=(others=>'0');	
signal internal_PEDCALC_PedCalcBusy:std_logic:='0';
signal internal_PEDMAN_readout_continue:std_logic:='0';
signal internal_klm_trig_ctime	: std_logic_vector(26 downto 0);
signal internal_klm_trig			: std_logic;
signal CONTROL0						:std_logic_vector(35 DOWNTO 0);
signal vio_ASYNC_IN :  STD_LOGIC_VECTOR(47 DOWNTO 0);
signal vio_ASYNC_OUT :  STD_LOGIC_VECTOR(47 DOWNTO 0);

signal internal_EXTRIG:std_logic:='0';
signal internal_cmdreg_use_extrig:std_logic_vector(2 downto 0):="000";
signal internal_auto_EXT_TRIG_counter:std_logic_vector(31 downto 0);
signal internal_CMDREG_READCTRL_inc_asic_enable_bits:std_logic_vector(9 downto 0);
signal internal_auto_EXT_TRIG_inc_asic_counter:std_logic_vector(3 downto 0);
signal internal_CMDREG_USE_EXTRIG_PERIOD:std_logic_vector(4 downto 0);

signal internal_EXTRIG_counter_trig:std_logic;--_vector(31 downto 0);
signal internal_CMDREG_HVEN:std_logic:='0';
--signal trg_l_1:tb_vec_type;
--signal trg_l_2:tb_vec_type;
--signal trg_l_3:tb_vec_type;
--signal trg_l_4:tb_vec_type;
--signal trg_l_5:tb_vec_type;

--signal     internal_klm_status_regs                 : stat_reg_type;
	signal internal_tx_udp_data:std_logic_vector(7 downto 0);
	signal internal_tx_udp_valid:std_logic;
	signal internal_tx_udp_valid_lo:std_logic;	
	signal internal_tx_udp_valid_hi:std_logic;	
	signal internal_tx_udp_ready:std_logic;
	signal internal_udp_clk:std_logic;
	signal internal_udp_wavtx_fifo_empty:std_logic;


signal tx_statistics_s_i : std_logic;
signal rx_statistics_s_i : std_logic;
	 

    attribute keep : string;
    attribute keep of internal_output_registers : signal is "true";


	
	
	



	
begin
--dummyport0 <= internal_output_registers(0)(0) or internal_output_registers(0)(1) or internal_output_registers(0)(2) or internal_output_registers(0)(3) or
--internal_output_registers(0)(4) or internal_output_registers(0)(5) or internal_output_registers(0)(6) or internal_output_registers(0)(7) or
--internal_output_registers(0)(8) or internal_output_registers(0)(9) or internal_output_registers(0)(10) or internal_output_registers(0)(11) or
--internal_output_registers(0)(12) or internal_output_registers(0)(13) or internal_output_registers(0)(14) or internal_output_registers(0)(15);

internal_EX_TRIGGER_MB<=internal_TRIGGER_ALL;

----internal_EX_TRIGGER2_MB<=internal_READCTRL_LATCH_DONE;
--u_COUNTER_auto_EXT_TRIG : COUNTER_LOAD_MACRO
--   generic map (
--      COUNT_BY => X"000000000001", -- Count by value
--      DEVICE => "SPARTAN6",         -- Target Device: "VIRTEX5", "VIRTEX6", "SPARTAN6" 
--      WIDTH_DATA => 32)            -- Counter output bus width, 1-48
--   port map (
--      Q => internal_auto_EXT_TRIG_counter,                 -- Counter output, width determined by WIDTH_DATA generic 
--      CLK => internal_CLOCK_FPGA_LOGIC,             -- 1-bit clock input
--      CE => '1',               -- 1-bit clock enable input
--      DIRECTION => '1', -- 1-bit up/down count direction input, high is count up
--      LOAD => '0',           -- 1-bit active high load input
--      LOAD_DATA => x"00000000", -- Counter load data, width determined by WIDTH_DATA generic 
--      RST => '0'              -- 1-bit active high synchronous reset
--   );
	
--internal_EXTRIG<='1' when to_integer(unsigned(internal_auto_EXT_TRIG_counter))<20 else '0';
--internal_EXTRIG_counter_trig <='1'	when internal_auto_EXT_TRIG_counter(to_integer(unsigned(internal_CMDREG_USE_EXTRIG_PERIOD)))='1'
--										and to_integer(unsigned(internal_auto_EXT_TRIG_counter((to_integer(unsigned(internal_CMDREG_USE_EXTRIG_PERIOD))-1) downto 0)))<20 	
--										else '0';

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
	
	internal_CMDREG_READCTRL_inc_asic_enable_bits<= "0000000001" when internal_auto_EXT_TRIG_inc_asic_counter=x"0" else
																	"0000000010" when internal_auto_EXT_TRIG_inc_asic_counter=x"1" else
																	"0000000100" when internal_auto_EXT_TRIG_inc_asic_counter=x"2" else
																	"0000001000" when internal_auto_EXT_TRIG_inc_asic_counter=x"3" else
																	"0000010000" when internal_auto_EXT_TRIG_inc_asic_counter=x"4" else
																	"0000100000" when internal_auto_EXT_TRIG_inc_asic_counter=x"5" else
																	"0001000000" when internal_auto_EXT_TRIG_inc_asic_counter=x"6" else
																	"0010000000" when internal_auto_EXT_TRIG_inc_asic_counter=x"7" else
																	"0100000000" when internal_auto_EXT_TRIG_inc_asic_counter=x"8" else
																	"1000000000" when internal_auto_EXT_TRIG_inc_asic_counter=x"9" else 
																	"0000000000" ;
	
	--Overall Signal Routing
	--debug/diag route:
 --  EX_TRIGGER2 <= internal_TRIGGER_ASIC(9);
--	EX_TRIGGER1 <= internal_READ_ENABLE_TIMER(9);
 --  EX_TRIGGER1 <= not internal_READCTRL_busy_status;--internal_TXDCTRIG_buf(10)(5);
--	EX_TRIGGER2 <= internal_READCTRL_trigger;--SHOUT(9);
 -- EX_TRIGGER1_MB<= internal_BOARD_CLOCK_OUT;--internal_clock_asic_ctrl;
--  EX_TRIGGER2_MB<='0';-- internal_clock_asic_ctrl;
 -- EX_TRIGGER_SCROD<='0';
	
--   internal_TXDCTRIG(1)(1) <=TDC1_TRG(0) ; internal_TXDCTRIG(1)(2)  <=TDC1_TRG(1);internal_TXDCTRIG(1)(3) <=TDC1_TRG(2);internal_TXDCTRIG(1)(4) <=TDC1_TRG(3);internal_TXDCTRIG(1)(5) <=TDC1_TRG(4);
--   internal_TXDCTRIG(2)(1) <=TDC2_TRG(0) ; internal_TXDCTRIG(2)(2)  <=TDC2_TRG(1);internal_TXDCTRIG(2)(3) <=TDC2_TRG(2);internal_TXDCTRIG(2)(4) <=TDC2_TRG(3);internal_TXDCTRIG(2)(5) <=TDC2_TRG(4);
--   internal_TXDCTRIG(3)(1) <=TDC3_TRG(0) ; internal_TXDCTRIG(3)(2)  <=TDC3_TRG(1);internal_TXDCTRIG(3)(3) <=TDC3_TRG(2);internal_TXDCTRIG(3)(4) <=TDC3_TRG(3);internal_TXDCTRIG(3)(5) <=TDC3_TRG(4);
--   internal_TXDCTRIG(4)(1) <=TDC4_TRG(0) ; internal_TXDCTRIG(4)(2)  <=TDC4_TRG(1);internal_TXDCTRIG(4)(3) <=TDC4_TRG(2);internal_TXDCTRIG(4)(4) <=TDC4_TRG(3);internal_TXDCTRIG(4)(5) <=TDC4_TRG(4);
--   internal_TXDCTRIG(5)(1) <=TDC5_TRG(0) ; internal_TXDCTRIG(5)(2)  <=TDC5_TRG(1);internal_TXDCTRIG(5)(3) <=TDC5_TRG(2);internal_TXDCTRIG(5)(4) <=TDC5_TRG(3);internal_TXDCTRIG(5)(5) <=TDC5_TRG(4);
--   internal_TXDCTRIG(6)(1) <=TDC6_TRG(0) ; internal_TXDCTRIG(6)(2)  <=TDC6_TRG(1);internal_TXDCTRIG(6)(3) <=TDC6_TRG(2);internal_TXDCTRIG(6)(4) <=TDC6_TRG(3);internal_TXDCTRIG(6)(5) <=TDC6_TRG(4);
--   internal_TXDCTRIG(7)(1) <=TDC7_TRG(0) ; internal_TXDCTRIG(7)(2)  <=TDC7_TRG(1);internal_TXDCTRIG(7)(3) <=TDC7_TRG(2);internal_TXDCTRIG(7)(4) <=TDC7_TRG(3);internal_TXDCTRIG(7)(5) <=TDC7_TRG(4);
--   internal_TXDCTRIG(8)(1) <=TDC8_TRG(0) ; internal_TXDCTRIG(8)(2)  <=TDC8_TRG(1);internal_TXDCTRIG(8)(3) <=TDC8_TRG(2);internal_TXDCTRIG(8)(4) <=TDC8_TRG(3);internal_TXDCTRIG(8)(5) <=TDC8_TRG(4);
--   internal_TXDCTRIG(9)(1) <=TDC9_TRG(0) ; internal_TXDCTRIG(9)(2)  <=TDC9_TRG(1);internal_TXDCTRIG(9)(3) <=TDC9_TRG(2);internal_TXDCTRIG(9)(4) <=TDC9_TRG(3);internal_TXDCTRIG(9)(5) <=TDC9_TRG(4);
--   internal_TXDCTRIG(10)(1)<=TDC10_TRG(0); internal_TXDCTRIG(10)(2) <=TDC10_TRG(1);internal_TXDCTRIG(10)(3) <=TDC10_TRG(2);internal_TXDCTRIG(10)(4) <=TDC10_TRG(3);internal_TXDCTRIG(10)(5) <=TDC10_TRG(4);
                                                                                                                                                                                                   
	
--	internal_TRIGGER_ASIC(0) <= internal_ext_TXDCTRIG(1)(1)  OR internal_ext_TXDCTRIG(1)(2) OR internal_ext_TXDCTRIG(1)(3) OR internal_ext_TXDCTRIG(1)(4) OR internal_ext_TXDCTRIG(1)(5);
--	internal_TRIGGER_ASIC(1) <= internal_ext_TXDCTRIG(2)(1)  OR internal_ext_TXDCTRIG(2)(2) OR internal_ext_TXDCTRIG(2)(3) OR internal_ext_TXDCTRIG(2)(4) OR internal_ext_TXDCTRIG(2)(5);
--	internal_TRIGGER_ASIC(2) <= internal_ext_TXDCTRIG(3)(1)  OR internal_ext_TXDCTRIG(3)(2) OR internal_ext_TXDCTRIG(3)(3) OR internal_ext_TXDCTRIG(3)(4) OR internal_ext_TXDCTRIG(3)(5);
--	internal_TRIGGER_ASIC(3) <= internal_ext_TXDCTRIG(4)(1)  OR internal_ext_TXDCTRIG(4)(2) OR internal_ext_TXDCTRIG(4)(3) OR internal_ext_TXDCTRIG(4)(4) OR internal_ext_TXDCTRIG(4)(5);
--	internal_TRIGGER_ASIC(4) <= internal_ext_TXDCTRIG(5)(1)  OR internal_ext_TXDCTRIG(5)(2) OR internal_ext_TXDCTRIG(5)(3) OR internal_ext_TXDCTRIG(5)(4) OR internal_ext_TXDCTRIG(5)(5);
--	internal_TRIGGER_ASIC(5) <= internal_ext_TXDCTRIG(6)(1)  OR internal_ext_TXDCTRIG(6)(2) OR internal_ext_TXDCTRIG(6)(3) OR internal_ext_TXDCTRIG(6)(4) OR internal_ext_TXDCTRIG(6)(5);
--	internal_TRIGGER_ASIC(6) <= internal_ext_TXDCTRIG(7)(1)  OR internal_ext_TXDCTRIG(7)(2) OR internal_ext_TXDCTRIG(7)(3) OR internal_ext_TXDCTRIG(7)(4) OR internal_ext_TXDCTRIG(7)(5);
--	internal_TRIGGER_ASIC(7) <= internal_ext_TXDCTRIG(8)(1)  OR internal_ext_TXDCTRIG(8)(2) OR internal_ext_TXDCTRIG(8)(3) OR internal_ext_TXDCTRIG(8)(4) OR internal_ext_TXDCTRIG(8)(5);
--	internal_TRIGGER_ASIC(8) <= internal_ext_TXDCTRIG(9)(1)  OR internal_ext_TXDCTRIG(9)(2) OR internal_ext_TXDCTRIG(9)(3) OR internal_ext_TXDCTRIG(9)(4) OR internal_ext_TXDCTRIG(9)(5);
--	internal_TRIGGER_ASIC(9) <= internal_ext_TXDCTRIG(10)(1) OR internal_ext_TXDCTRIG(10)(2) OR internal_ext_TXDCTRIG(10)(3) OR internal_ext_TXDCTRIG(10)(4) OR internal_ext_TXDCTRIG(10)(5);
	
	internal_TRIGGER_ALL <= internal_TRIGGER_ASIC(0) OR internal_TRIGGER_ASIC(1) or internal_TRIGGER_ASIC(2) OR
	internal_TRIGGER_ASIC(3) OR internal_TRIGGER_ASIC(4) OR internal_TRIGGER_ASIC(5) OR
	internal_TRIGGER_ASIC(6) OR internal_TRIGGER_ASIC(7) OR internal_TRIGGER_ASIC(8) OR
	internal_TRIGGER_ASIC(9);



	--RAM_A <=internal_RAM_A;
	--RAM_IO<=internal_RAM_IO;
	--connect ch.0 of SRAM access dedicated to the USB access
	internal_ram_Ain(0)<=internal_CMDREG_RAMADDR;--
	internal_ram_DWin(0)<=internal_CMDREG_RAMDATAWR;
	internal_CMDREG_RAMDATARD<=internal_ram_DRout(0);
	internal_ram_update(0)<=internal_CMDREG_RAMUPDATE;
	internal_ram_rw(0)<=internal_CMDREG_RAMRW;
	internal_CMDREG_RAMBUSY<=internal_ram_busy(0);
	

		  
	--Clock generation
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
		clk => internal_CLOCK_FPGA_LOGIC,
		reset => '0',
		OUTPUT_REGISTERS             => internal_OUTPUT_REGISTERS,
		INPUT_REGISTERS              => internal_INPUT_REGISTERS,
		REGISTER_UPDATED             => i_register_update,

		tx_dac_busy=>internal_DAC_CONTROL_busy,
		pedman_busy=>internal_CMDREG_PedManBusy,
		mppc_dac_busy=>i_dac_busy,

		wave_fifo_wr_en => internal_pswfifo_en,
		wave_fifo_data => internal_pswfifo_d,
		wave_fifo_reset => '0',
		wave_fifo_event_rdy => internal_qt_fifo_evt_rdy,
		
		rcl_fifo_rd_en	=>	internal_rcl_fifo_rd_en,
		rcl_fifo_data		=>	internal_rcl_fifo_data,
		rcl_fifo_empty	=>	internal_rcl_fifo_empty,

	glbl_rst                      =>   glbl_rst,                
              clk_in_p                      =>   clk_in_p,                
              clk_in_n                      =>   clk_in_n,                
              gtx_clk_bufg_out              =>   gtx_clk_bufg_out_i,        
              phy_resetn                    =>   phy_resetn,              
              rgmii_txd                     =>   rgmii_txd,               
              rgmii_tx_ctl                  =>   rgmii_tx_ctl,
              rgmii_txc                     =>   rgmii_txc,               
              rgmii_rxd                     =>   rgmii_rxd,               
              rgmii_rx_ctl                  =>   rgmii_rx_ctl,            
              rgmii_rxc                     =>   rgmii_rxc,               
              mdio                          =>   mdio,                    
              mdc                           =>   mdc ,                    
              tx_statistics_s               =>   tx_statistics_s_i   ,      
              rx_statistics_s               =>   rx_statistics_s_i   ,      
              pause_req_s                   =>   pause_req_s      ,       
              mac_speed                     =>   mac_speed         ,      
              update_speed                  =>   update_speed       ,     
              config_board                  =>   config_board       ,     
              serial_response               =>   serial_response    ,     
              gen_tx_data                   =>   gen_tx_data       ,      
              chk_tx_data                   =>   chk_tx_data       ,      
              reset_error                   =>   reset_error       ,   
     --         frame_error                   =>   frame_error       ,      
       --       frame_errorn                  =>   frame_errorn      ,      
              activity_flash                =>   activity_flash    ,      
              activity_flashn               =>   activity_flashn   ,
              ------------------------------
              dummyport0 => dummyport0
              ------------------------------      
              
	);


tx_statistics_s <= tx_statistics_s_i;
rx_statistics_s <= rx_statistics_s_i;

	
--    STAT_GEN : for j in 0 to 59 generate

-- gen_FDSE_inst_statregs:  for i in 0 to 15 generate

--  FDSE_inst_status_regs : FDSE
--   generic map (
--      INIT => '0') -- Initial value of register ('0' or '1')  
--   port map (
--      Q => internal_klm_status_regs(j)(i),      -- Data output
--      C => internal_CLOCK_MPPC_DAC,      -- Clock input
--      CE => '1',    -- Clock enable input
--      S => '0',      -- Synchronous Set input
--      D => internal_INPUT_REGISTERS(N_GPR+j)(i)       -- Data input
--   );

----		internal_klm_status_regs(I)<=internal_INPUT_REGISTERS(N_GPR+I);
--    end generate;

--    end generate;

 
 gen_FDSE_inst_trig_ctime:  for i in 0 to 26 generate
   FDSE_inst_trig_ctime : FDSE
   generic map (
      INIT => '0') -- Initial value of register ('0' or '1')  
   port map (
      Q => internal_klm_trig_ctime(i),      -- Data output
      C => internal_klm_trig,      -- Clock input
      CE => '1',    -- Clock enable input
      S => '0',      -- Synchronous Set input
      D => internal_trig_ctime(i)       -- Data input
   );
  	
  
  end generate;	



	
	--DAC CONTROL SIGNALS
	internal_DAC_CONTROL_UPDATE <= internal_OUTPUT_REGISTERS(1)(0);
	internal_DAC_CONTROL_REG_DATA <= internal_OUTPUT_REGISTERS(2)(6 downto 0) 
												& internal_OUTPUT_REGISTERS(3)(11 downto 0);
   internal_DAC_CONTROL_TDCNUM <= internal_OUTPUT_REGISTERS(4)(9 downto 0);
	internal_DAC_CONTROL_LOAD_PERIOD <= internal_OUTPUT_REGISTERS(5)(15 downto 0);
	internal_DAC_CONTROL_LATCH_PERIOD <= internal_OUTPUT_REGISTERS(6)(15 downto 0);
	
	--Sampling Signals
	internal_CMDREG_RESET_SAMPLIG_LOGIC <= internal_OUTPUT_REGISTERS(10)(0);
	internal_CMDREG_SAMPLIG_LOGIC_RESET_PARAMS <= internal_OUTPUT_REGISTERS(11);

	
	--Serial Readout Signal
	internal_CMDREG_SROUT_TPG <= internal_OUTPUT_REGISTERS(31)(0); --'1': force test pattern to output. '0': regular operation

	--RAM Access from USB or anything:
	internal_CMDREG_RAMADDR(15 downto 0) <=internal_OUTPUT_REGISTERS(32);
	internal_CMDREG_RAMADDR(21 downto 16) <=internal_OUTPUT_REGISTERS(33)(5 downto 0);
	internal_CMDREG_RAMDATAWR <=internal_OUTPUT_REGISTERS(34)(7 downto 0);
	internal_CMDREG_RAMUPDATE <=internal_OUTPUT_REGISTERS(35)(0);
	internal_CMDREG_RAMRW <=internal_OUTPUT_REGISTERS(35)(1);

	---status regs: automaticly generated and fed to conc. or read via software?
	internal_CMDREG_USE_EXTRIG<=internal_OUTPUT_REGISTERS(37)(2 downto 0);
	--internal_CMDREG_USE_EXTRIG usuage:
	--"100": use ex trig and read from fixed asic
	--"101": use ex trig and increment asic number after each trigger
	--"110": use internal counter trig and read from fixed asic
	--"111": use internal counter trig and increment asic number after each trigger
	internal_CMDREG_USE_EXTRIG_PERIOD<=internal_OUTPUT_REGISTERS(37)(15 downto 11);
	


	internal_CMDREG_PedCalcNAVG	<=internal_OUTPUT_REGISTERS(38)(3 downto 0); -- 2**NAVG= number of averages for calculating peds
	internal_CMDREG_PedCalcReset 	<=internal_OUTPUT_REGISTERS(38)(15);
	internal_CMDREG_PedmanEnable 	<=internal_OUTPUT_REGISTERS(38)(14);	
	internal_CMDREG_PedDemuxFifoOutputSelect<=internal_OUTPUT_REGISTERS(38)(13 downto 12); --00: disable (regular waveform dump)--01: ped sub, 10: ped only, 11: waveform only
	internal_WAVEFORM_FIFO_RST<=internal_OUTPUT_REGISTERS(38)(11);-- reset the waveform and buffer fifos
	internal_BUFFERCTRL_FIFO_RESET<=internal_OUTPUT_REGISTERS(38)(11);
	internal_CMDREG_PedSubCalcMode<=internal_OUTPUT_REGISTERS(38)(10 downto 7);	
	internal_CMDREG_USE_KLMTRIG<=internal_OUTPUT_REGISTERS(38)(5);
	internal_CMDREG_KLMTRIG_CAL_READOUT_MODE<=internal_OUTPUT_REGISTERS(38)(6);-- calmode: force readout on a KLM trigger- do not use LKBK window, instead determine ASICs to read from internal_CMDREG_READCTRL_asic_enable_bits
	internal_CMDREG_USE_SCRODLINK<=internal_OUTPUT_REGISTERS(38)(4);
	
	internal_CMDREG_USE_TRIGDEC	<=internal_OUTPUT_REGISTERS(39)(15); --'1': only use trigger generated by internal trig dec logic , '0'= use trigger generated by HW or SW or anything
	internal_CMDREG_TRIGDEC_TRIGMASK	<=internal_OUTPUT_REGISTERS(39)(14 downto 0); --Mask the ASICS that we dont want to fire on- due to bad supply
	
	-------------------MAX clock counters for trigger scalers for the trigger scanning mode and the built in trigdec logic
	internal_CMGREG_TRIG_SCALER_CLK_MAX<=internal_OUTPUT_REGISTERS(47);
	internal_CMGREG_TRIG_SCALER_CLK_MAX_TRIGDEC<=internal_OUTPUT_REGISTERS(48);

	internal_CMDREG_PedCalcStart  <=internal_OUTPUT_REGISTERS(41)(15);
	internal_CMDREG_PedCalcASICen <=internal_OUTPUT_REGISTERS(41)(9 downto 0);
	internal_CMDREG_PedCalcWinLen <=internal_OUTPUT_REGISTERS(42);

	--Event builder signals
	internal_CMDREG_WAVEFORM_FIFO_RST <= internal_OUTPUT_REGISTERS(40)(0);
	internal_CMDREG_EVTBUILD_START_BUILDING_EVENT <= internal_OUTPUT_REGISTERS(44)(0);
	internal_CMDREG_EVTBUILD_MAKE_READY <= internal_OUTPUT_REGISTERS(45)(0);
	internal_CMDREG_EVTBUILD_PACKET_BUILDER_BUSY <= internal_OUTPUT_REGISTERS(46)(0);
	
	--Readout control signals
	internal_CMDREG_SOFTWARE_trigger <= internal_OUTPUT_REGISTERS(50)(0);
	--internal_CMDREG_SOFTWARE_TRIGGER_VETO <= internal_OUTPUT_REGISTERS(51)(0);
	internal_CMDREG_READCTRL_asic_enable_bits <= internal_OUTPUT_REGISTERS(51)(9 downto 0);
	internal_CMDREG_HARDWARE_TRIGGER_ENABLE <= internal_OUTPUT_REGISTERS(52)(0);
	internal_CMDREG_READCTRL_trig_delay <= internal_OUTPUT_REGISTERS(53)(11 downto 0);
	internal_CMDREG_READCTRL_dig_offset <= vio_ASYNC_OUT(8 downto 0) when vio_ASYNC_OUT(47)='1' else internal_OUTPUT_REGISTERS(54)(8 downto 0) ;
	internal_CMDREG_READCTRL_readout_reset <= internal_OUTPUT_REGISTERS(55)(0);
	internal_CMDREG_READCTRL_win_num_to_read <= internal_OUTPUT_REGISTERS(57)(8 downto 0);
	internal_CMDREG_READCTRL_readout_continue <= internal_OUTPUT_REGISTERS(58)(0);
	internal_CMDREG_READCTRL_RESET_EVENT_NUM <= internal_OUTPUT_REGISTERS(59)(0);
	internal_CMDREG_READCTRL_ramp_length <= internal_OUTPUT_REGISTERS(61);
	internal_CMDREG_READCTRL_use_fixed_dig_start_win<=internal_OUTPUT_REGISTERS(62);-- bit 15: '1'=> use fixed start win and (8 downto 0) is the fixed start win

	internal_CMDREG_PDAQ_DATA_MODE<=internal_OUTPUT_REGISTERS(75)(3 downto 0);-- determines the pdaq's data mode, 0=qt, 1=full wavw
	internal_CMDREG_PDAQ_DATA_CHMASK<=internal_OUTPUT_REGISTERS(76);-- determines what channels for sending full waveforms to pdaq.


	internal_INPUT_REGISTERS(N_GPR + 21)(11 downto 0) <= internal_ADCOutput(11 downto 0);--no need any more
	internal_INPUT_REGISTERS(N_GPR + 21)(12) <= internal_enOutput;


----uncomment forTX KLM MB operation
--TDC_AMUX_S   <= internal_AMUX_S(3 downto 0);--internal_NCH_AMUX_S;--internal_OUTPUT_REGISTERS(62)(3 downto 0);--channel within a daughtercard
--TOP_AMUX_S   <= internal_AMUX_S(7 downto 4);--internal_NDC_AMUX_S;--internal_OUTPUT_REGISTERS(62)(7 downto 4);-- Daughter Card Number

	internal_AMUX_S(3 downto 0)	<=internal_OUTPUT_REGISTERS(63)(3 downto 0);--channel within a daughtercard (TDC_AMUX_S)
	internal_AMUX_S(7 downto 4)	<=internal_OUTPUT_REGISTERS(63)(7 downto 4);--channel within a daughtercard (TOP_AMUX_S)
--	TDC_AMUX_S   		<= internal_OUTPUT_REGISTERS(63)(3 downto 0);--channel within a daughtercard
--	TOP_AMUX_S  	 	<= internal_OUTPUT_REGISTERS(63)(7 downto 4);-- Daughter Card Number
	internal_runADC	<= internal_OUTPUT_REGISTERS(63)(8);
	internal_CurrentADC_reset	<= internal_OUTPUT_REGISTERS(63)(9);

	internal_INPUT_REGISTERS(N_GPR+23)(7 downto 0)<=internal_CMDREG_RAMDATARD;
	internal_INPUT_REGISTERS(N_GPR+23)(8)<=internal_CMDREG_RAMBUSY;
	

	
	
	-- HV dac signals
	i_dac_number <= internal_OUTPUT_REGISTERS(60)(15 downto 12);
	i_dac_addr   <= internal_OUTPUT_REGISTERS(60)(11 downto 8);
--	i_dac_value  <= internal_OUTPUT_REGISTERS(78)(11 downto 0); only for Scifi, since the 12 bit DAC didnt fit
	i_dac_value  <= internal_OUTPUT_REGISTERS(60)(7 downto 0);
	i_dac_update <= i_register_update(60) or internal_OUTPUT_REGISTERS(63)(10);
--	HV_DISABLE   <= not internal_OUTPUT_REGISTERS(61)(0);

	--Trigger control
	internal_TRIGCOUNT_ena <= internal_OUTPUT_REGISTERS(70)(0);
	internal_TRIGCOUNT_rst <= internal_OUTPUT_REGISTERS(71)(0);
	internal_TRIGGER_ASIC_control_word <= internal_OUTPUT_REGISTERS(72)(9 downto 0);

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
	internal_INPUT_REGISTERS(N_GPR + 0 ) <= "0000000" & internal_SMP_MAIN_CNT(6 downto 0 ) &     tx_statistics_s_i  &  rx_statistics_s_i;
	internal_INPUT_REGISTERS(N_GPR + 1 ) <= internal_WAVEFORM_FIFO_DATA_OUT(15 downto 0);
	internal_INPUT_REGISTERS(N_GPR + 2 ) <= "000000000000000" & internal_WAVEFORM_FIFO_EMPTY;
	internal_INPUT_REGISTERS(N_GPR + 3 ) <= "000000000000000" & internal_WAVEFORM_FIFO_DATA_VALID;
	internal_INPUT_REGISTERS(N_GPR + 4 ) <= "0000000" & internal_READCTRL_DIG_RD_COLSEL & internal_READCTRL_DIG_RD_ROWSEL;
	internal_INPUT_REGISTERS(N_GPR + 5 ) <= "0000000" & internal_READCTRL_LATCH_SMP_MAIN_CNT;
	internal_INPUT_REGISTERS(N_GPR + 6 ) <= "0000000000" & internal_EVTBUILD_MAKE_READY & internal_EVTBUILD_DONE_SENDING_EVENT & internal_WAVEFORM_FIFO_EMPTY & internal_SROUT_IDLE_status 
										& internal_DIG_IDLE_status & '0';
--   internal_INPUT_REGISTERS(N_GPR + 7 ) (9 downto 0) <= SHOUT(9 downto 0);
   
	internal_INPUT_REGISTERS(N_GPR + 10 ) <= internal_TRIGCOUNT_scaler(0)(15 downto 0);
	internal_INPUT_REGISTERS(N_GPR + 11 ) <= internal_TRIGCOUNT_scaler(1)(15 downto 0);
	internal_INPUT_REGISTERS(N_GPR + 12 ) <= internal_TRIGCOUNT_scaler(2)(15 downto 0);
	internal_INPUT_REGISTERS(N_GPR + 13 ) <= internal_TRIGCOUNT_scaler(3)(15 downto 0);
	internal_INPUT_REGISTERS(N_GPR + 14 ) <= internal_TRIGCOUNT_scaler(4)(15 downto 0);
	internal_INPUT_REGISTERS(N_GPR + 15 ) <= internal_TRIGCOUNT_scaler(5)(15 downto 0);
	internal_INPUT_REGISTERS(N_GPR + 16 ) <= internal_TRIGCOUNT_scaler(6)(15 downto 0);
	internal_INPUT_REGISTERS(N_GPR + 17 ) <= internal_TRIGCOUNT_scaler(7)(15 downto 0);
	internal_INPUT_REGISTERS(N_GPR + 18 ) <= internal_TRIGCOUNT_scaler(8)(15 downto 0);
	internal_INPUT_REGISTERS(N_GPR + 19 ) <= internal_TRIGCOUNT_scaler(9)(15 downto 0);
	internal_INPUT_REGISTERS(N_GPR + 20) <= x"002c"; -- ID of the board
	internal_INPUT_REGISTERS(N_GPR + 40 ) <= internal_TRIGCOUNT_scaler(0)(31 downto 16);
	internal_INPUT_REGISTERS(N_GPR + 41 ) <= internal_TRIGCOUNT_scaler(1)(31 downto 16);
	internal_INPUT_REGISTERS(N_GPR + 42 ) <= internal_TRIGCOUNT_scaler(2)(31 downto 16);
	internal_INPUT_REGISTERS(N_GPR + 43 ) <= internal_TRIGCOUNT_scaler(3)(31 downto 16);
	internal_INPUT_REGISTERS(N_GPR + 44 ) <= internal_TRIGCOUNT_scaler(4)(31 downto 16);
	internal_INPUT_REGISTERS(N_GPR + 45 ) <= internal_TRIGCOUNT_scaler(5)(31 downto 16);
	internal_INPUT_REGISTERS(N_GPR + 46 ) <= internal_TRIGCOUNT_scaler(6)(31 downto 16);
	internal_INPUT_REGISTERS(N_GPR + 47 ) <= internal_TRIGCOUNT_scaler(7)(31 downto 16);
	internal_INPUT_REGISTERS(N_GPR + 48 ) <= internal_TRIGCOUNT_scaler(8)(31 downto 16);
	internal_INPUT_REGISTERS(N_GPR + 49 ) <= internal_TRIGCOUNT_scaler(9)(31 downto 16);
--	
	internal_INPUT_REGISTERS(N_GPR + 30) <= "0000000" & internal_READCTRL_dig_win_start; -- digitizatoin window start
	internal_INPUT_REGISTERS(N_GPR + 31) <=internal_pswfifo_d(15 downto 0);--internal_INPUT_REGISTERS(31)
	internal_INPUT_REGISTERS(N_GPR + 24) <=internal_TRIGCOUNT_scaler_main(15 downto 0);-- main trig count scaler
	internal_INPUT_REGISTERS(N_GPR + 25) <=internal_TRIGCOUNT_scaler_main(31 downto 16);-- main trig count scaler
	internal_INPUT_REGISTERS(N_GPR + 26) <=internal_KLM_SCINT_MISSED_TRG;
	internal_INPUT_REGISTERS(N_GPR + 33) <=internal_PedCalcNiter;
	internal_INPUT_REGISTERS(N_GPR + 34) <="000000000000000" & internal_CMDREG_PedManBusy;


--	gen_wl_clk_to_asic : for i in 0 to 9 generate

-- ODDR2_inst : ODDR2
--   generic map(
--      DDR_ALIGNMENT => "NONE", -- Sets output alignment to "NONE", "C0", "C1" 
--      INIT => '0', -- Sets initial state of the Q output to '0' or '1'
--      SRTYPE => "SYNC") -- Specifies "SYNC" or "ASYNC" set/reset
--   port map (
--      Q => internal_CLOCK_ASIC_CTRL_WILK(i), -- 1-bit output data
--      C0 => internal_CLOCK_FPGA_LOGIC, -- 1-bit clock input
--      C1 => not internal_CLOCK_FPGA_LOGIC, -- 1-bit clock input
--      CE => '1',  -- 1-bit clock enable input
--      D0 => '0',   -- 1-bit data input (associated with C0)
--      D1 => '1',   -- 1-bit data input (associated with C1)
--      R => '0',    -- 1-bit reset input
--      S => '0'     -- 1-bit set input
--   );
  
  
--	wilk_OBUFDS_inst : OBUFDS
--   generic map (
--      --IOSTANDARD => "DEFAULT")
--		IOSTANDARD => "LVDS_25")

--   port map (
--      O => WL_CLK_P(i),    			-- Diff_p output (connect directly to top-level port)
--      OB => WL_CLK_N(i),   			-- Diff_n output (connect directly to top-level port)
--      I => internal_CLOCK_ASIC_CTRL_WILK (i)     	-- Buffer input 

--   );
	
--	end generate;
		
--	BUS_REGCLR <= '0';	


	--end generate;
	--Only specified DC gets serial data signals, uses bit mask


	

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
--      RST => internal_scint_b2tt_runreset              -- 1-bit active high synchronous reset
--   );


internal_CLOCK_FPGA_LOGIC <= gtx_clk_bufg_out_i;
gtx_clk_bufg_out <= gtx_clk_bufg_out_i;

end Behavioral;
