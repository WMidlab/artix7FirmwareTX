----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:20:38 10/25/2012 
-- Design Name: 
-- Module Name:    scrod_top_A4 - Behavioral 
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
use work.all;
use work.readout_definitions.all;
    use work.tdc_pkg.all;
   use work.time_order_pkg.all;
    use work.conc_intfc_pkg.all;
    use work.klm_scrod_pkg.all;
--use work.asic_definitions_irs2_carrier_revA.all;
--use work.CarrierRevA_DAC_definitions.all;

entity scrod_top2_A4 is
	   generic(
    NUM_GTS                     : integer := 1;
	 -- uncomment one of these lines only to comiple with the given configuration
--	 HW_CONF						: string :="SA4_MBA_DCA_RB_I" --SCROD A4, MB A, TXDC A, RHIC B, with Interconnect board
--	 HW_CONF						: string :="SA4_MBSF_TX" --SCROD A4, MB SciFi, TX SificDC 
--	 HW_CONF						: string :="SA3_MBA_DCA_RB" 	 --SCROD A3, MB A, TXDC A, RHIC B
	 HW_CONF						: string :="SA4_MBB_DCA_RB" 	 --SCROD A4, MB B, TXDC A, RHIC B
	 
	 );
	 Port(
		BOARD_CLOCKP                : in  STD_LOGIC;
		BOARD_CLOCKN                : in  STD_LOGIC;
		LEDS                        : out STD_LOGIC_VECTOR(12 downto 0);
		------------------FTSW pins------------------
		RJ45_ACK_P                  : out std_logic;
		RJ45_ACK_N                  : out std_logic;			  
		RJ45_TRG_P                  : in std_logic;
		RJ45_TRG_N                  : in std_logic;			  			  
		RJ45_RSV_P                  : out std_logic;-- should be output 
		RJ45_RSV_N                  : out std_logic;
		RJ45_CLK_P                  : in std_logic;
		RJ45_CLK_N                  : in std_logic;
		---------Jumper for choosing FTSW clock------
	--	MONITOR_INPUT               : in  std_logic_vector(0 downto 0);- shoud go
		
		--------------------------------------
		----------SFP-------------------------
		--------------------------------------
	   mgttxfault                  : in std_logic_vector(1 to NUM_GTS);
		mgtmod0                     : in std_logic_vector(1 to NUM_GTS);
		mgtlos                      : in std_logic_vector(1 to NUM_GTS);
		mgttxdis                    : out std_logic_vector(1 to NUM_GTS);
		mgtmod2                     : out std_logic_vector(1 to NUM_GTS);
		mgtmod1                     : out std_logic_vector(1 to NUM_GTS);
		mgtrxp                      : in std_logic;
		mgtrxn                      : in std_logic;
		mgttxp                      : out std_logic;
		mgttxn                      : out std_logic;
		status_fake                 : out std_logic;
		control_fake                : out std_logic;
		mgtclk0p   						 : in std_logic; 
		mgtclk0n  					    : in std_logic; 
		mgtclk1p                    : in std_logic; 
		mgtclk1n                    : in std_logic; 
		
		
		----------------------------------------------
		------------Fiberoptic Pins-------------------
		----------------------------------------------
--		FIBER_0_RXP                 : in  STD_LOGIC;
--		FIBER_0_RXN                 : in  STD_LOGIC;
--		FIBER_1_RXP                 : in  STD_LOGIC;
--		FIBER_1_RXN                 : in  STD_LOGIC;
--		FIBER_0_TXP                 : out STD_LOGIC;
--		FIBER_0_TXN                 : out STD_LOGIC;
--		FIBER_1_TXP                 : out STD_LOGIC;
--		FIBER_1_TXN                 : out STD_LOGIC;
--		FIBER_REFCLKP               : in  STD_LOGIC;
--		FIBER_REFCLKN               : in  STD_LOGIC;
--		FIBER_0_DISABLE_TRANSCEIVER : out STD_LOGIC;
--		FIBER_1_DISABLE_TRANSCEIVER : out STD_LOGIC;
--		FIBER_0_LINK_UP             : out STD_LOGIC;
--		FIBER_1_LINK_UP             : out STD_LOGIC;
--		FIBER_0_LINK_ERR            : out STD_LOGIC;
--		FIBER_1_LINK_ERR            : out STD_LOGIC;

		--MB Specific Signals
		
		EX_TRIGGER_MB					 : out std_logic;
		EX_TRIGGER_SCROD	   		 : in STD_LOGIC;
--		EX_TRIGGER2						 : out STD_LOGIC;
		
		--Global Bus Signals
		
		--ASIC related
		
		--BUS A Specific Signals
		BUS_REGCLR						 : out STD_LOGIC;
		BUSA_WR_ADDRCLR				 : out STD_LOGIC;
		BUSA_RD_ENA						 : out STD_LOGIC;
		BUSA_RD_ROWSEL_S				 : out STD_LOGIC_VECTOR(2 downto 0);
		BUSA_RD_COLSEL_S				 : out STD_LOGIC_VECTOR(5 downto 0);
		BUSA_CLR							 : out STD_LOGIC;
		BUSA_RAMP						 : out STD_LOGIC;
		BUSA_SAMPLESEL_S				 : out STD_LOGIC_VECTOR(4 downto 0);
		BUSA_SR_CLEAR					 : out STD_LOGIC;
		BUSA_SR_SEL						 : out STD_LOGIC;
		BUSA_DO							 : in STD_LOGIC_VECTOR(15 downto 0);
		
		--Bus B Specific Signals
		BUSB_WR_ADDRCLR				 : out STD_LOGIC;
		BUSB_RD_ENA						 : out STD_LOGIC;
		BUSB_RD_ROWSEL_S				 : out STD_LOGIC_VECTOR(2 downto 0);
		BUSB_RD_COLSEL_S				 : out STD_LOGIC_VECTOR(5 downto 0);
		BUSB_CLR							 : out STD_LOGIC;
		BUSB_RAMP						 : out STD_LOGIC;
		BUSB_SAMPLESEL_S				 : out STD_LOGIC_VECTOR(4 downto 0);
		BUSB_SR_CLEAR					 : out STD_LOGIC;
		BUSB_SR_SEL						 : out STD_LOGIC;
		BUSB_DO							 : in STD_LOGIC_VECTOR(15 downto 0);
		
		--ASIC DAC Update Signals
		SIN								 : out STD_LOGIC_VECTOR(9 downto 0);
		PCLK								 : out STD_LOGIC_VECTOR(9 downto 0);
		SHOUT						 	    : in STD_LOGIC_VECTOR(9 downto 0);--bring SCLOK up here
		
		
		--Digitization Signals
		
		--Serial Readout Signals
		SR_CLOCK							 : out STD_LOGIC_VECTOR(9 downto 0);
		SAMPLESEL_ANY 					 : out STD_LOGIC_VECTOR(9 downto 0);
		
		-- HV DAC
		BUSA_SCK_DAC		          : out STD_LOGIC;
		BUSA_DIN_DAC		          : out STD_LOGIC;

		BUSB_SCK_DAC		          : out STD_LOGIC;
		BUSB_DIN_DAC		          : out STD_LOGIC;
	
		
		--TRIGGER SIGNALS
		TDC1_TRG							 : in STD_LOGIC_VECTOR(4 downto 0);
		TDC2_TRG							 : in STD_LOGIC_VECTOR(4 downto 0);
		TDC3_TRG							 : in STD_LOGIC_VECTOR(4 downto 0);
		TDC4_TRG							 : in STD_LOGIC_VECTOR(4 downto 0);
		TDC5_TRG							 : in STD_LOGIC_VECTOR(4 downto 0);
		TDC6_TRG							 : in STD_LOGIC_VECTOR(4 downto 0);
		TDC7_TRG							 : in STD_LOGIC_VECTOR(4 downto 0);
		TDC8_TRG							 : in STD_LOGIC_VECTOR(4 downto 0);
		TDC9_TRG							 : in STD_LOGIC_VECTOR(4 downto 0);
		TDC10_TRG						 : in STD_LOGIC_VECTOR(4 downto 0);
		--- SciFi Tracker only: (comment out for KLM MB compile)
----		GPIO								: in std_logic_vector(23 downto 0);
--		FPGA_GCLK_N						: in std_logic_vector(0 downto 0);
--		FPGA_GCLK_P						: in std_logic_vector(0 downto 0);
--		FPGA_GCLK_CTRL					: in std_logic;
----		HVDAC_CS							: out std_logic;
----		HVDAC_SCK						: out std_logic;
----		HVDAC_SDI						: out std_logic;
----		N5VEN								: out std_logic;
----		P2V5EN							: out std_logic;
----		P5VAEN							: out std_logic;
----		HVEN								: out std_logic;
--		
--		BUSA_DED_WR_ADDRCLR 			: out std_logic_vector(4 downto 0);
--		BUSB_DED_WR_ADDRCLR 			: out std_logic_vector(4 downto 0);
--		
--		TDC_CS1_DAC						: out std_logic_vector(9 downto 0);
--		TDC_CS2_DAC						: out std_logic_vector(9 downto 0);
		-- Uncomment for TX KLM MB, keep commented for SciFi
		TDC_CS_DAC                  : out STD_LOGIC_VECTOR(9 downto 0);-- move it to close to SPI DACs
----		HV_DISABLE                  : out STD_LOGIC;
		TDC_AMUX_S                  : out STD_LOGIC_VECTOR(3 downto 0);--change to RHIC_ some better known name and maybe connect them together
		TOP_AMUX_S                  : out STD_LOGIC_VECTOR(3 downto 0);
		---------------------------------------------
		------------------USB pins-------------------
		---------------------------------------------
		USB_IFCLK                   : in  STD_LOGIC;
		USB_CTL0                    : in  STD_LOGIC;
		USB_CTL1                    : in  STD_LOGIC;
		USB_CTL2                    : in  STD_LOGIC;
		USB_FDD                     : inout STD_LOGIC_VECTOR(15 downto 0);
		USB_PA0                     : out STD_LOGIC;
		USB_PA1                     : out STD_LOGIC;
		USB_PA2                     : out STD_LOGIC;
		USB_PA3                     : out STD_LOGIC;
		USB_PA4                     : out STD_LOGIC;
		USB_PA5                     : out STD_LOGIC;
		USB_PA6                     : out STD_LOGIC;
		USB_PA7                     : in  STD_LOGIC;
		USB_RDY0                    : out STD_LOGIC;
		USB_RDY1                    : out STD_LOGIC;
		USB_WAKEUP                  : in  STD_LOGIC;
		USB_CLKOUT		             : in  STD_LOGIC;


		---- end of SciFi Related ports

		
		
		--New Stuff for TargetX:
		--RAM:
		RAM_A									: out STD_LOGIC_VECTOR(21 downto 0);-- RAM address line         
		RAM_IO								: inout STD_LOGIC_VECTOR(7 downto 0);-- RAM IO data line     
		RAM_CE1n							 	: out STD_LOGIC := '1';                                         
		RAM_CE2							   : out STD_LOGIC := '0';                           
		RAM_OEn				            : out std_logic := '1';                       
		RAM_WEn				            : out std_logic := '1';                         
	            
		SCLK								: out STD_LOGIC_VECTOR(9 downto 0);
		WL_CLK_N								: out STD_LOGIC_VECTOR(9 downto 0);
		WL_CLK_P								: out STD_LOGIC_VECTOR(9 downto 0);
		WR1_ENA								: out STD_LOGIC_VECTOR(9 downto 0);--move up
		WR2_ENA								: out STD_LOGIC_VECTOR(9 downto 0);

		SSTIN_N								 : out STD_LOGIC_VECTOR(9 downto 0);
		SSTIN_P								 : out STD_LOGIC_VECTOR(9 downto 0);
		
		SCL_MON								 : out STD_LOGIC;
		SDA_MON								 : inout STD_LOGIC;
		TDC_DONE								: in STD_LOGIC_VECTOR(9 downto 0);-- move to readout signals
		TDC_MON_TIMING						: in STD_LOGIC_VECTOR(9 downto 0)-- add the ref to the programming of the TX chip

	);
end scrod_top2_A4;

architecture Behavioral of scrod_top2_A4 is
	signal internal_BOARD_CLOCK_OUT      : std_logic;
	signal internal_CLOCK_FPGA_LOGIC : std_logic;
	signal internal_CLOCK_MPPC_DAC  : std_logic;
	signal internal_CLOCK_ASIC_CTRL : std_logic;
	signal internal_CLOCK_ASIC_CTRL_WILK : std_logic;
	signal internal_CLOCK_B2TT_SYS	:std_logic;
	
	signal internal_CLOCK_MPPC_ADC  : std_logic;
	
	signal WL_CLK_tmp	:std_logic_vector(9 downto 0);


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
	constant TRIGGER_SCALER_BIT_WIDTH      : integer := 16;
	type TARGETX_TRIGGER_SCALERS is array(9 downto 0) of std_logic_vector(TRIGGER_SCALER_BIT_WIDTH-1 downto 0);	
	signal internal_TRIGCOUNT_scaler : TARGETX_TRIGGER_SCALERS;
	signal internal_READ_ENABLE_TIMER : std_logic_vector (9 downto 0);
	signal internal_TXDCTRIG : tb_vec_type;-- All triger bits from all ASICs are here
	signal internal_TXDCTRIG16 : std_logic_vector(1 to TDC_NUM_CHAN);-- All triger bits from all ASICs are here
	signal internal_TXDCTRIG_buf : tb_vec_type;-- All triger bits from all ASICs are here
	signal internal_TXDCTRIG16_buf : std_logic_vector(1 to TDC_NUM_CHAN);-- All triger bits from all ASICs are here
	
	--ASIC DAC CONTROL
	signal internal_DAC_CONTROL_UPDATE : std_logic := '0';
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
	
	signal internal_CMDREG_RESET_SAMPLIG_LOGIC :std_logic :='0';
	signal internal_CMDREG_SOFTWARE_trigger : std_logic := '0';
	signal internal_CMDREG_SOFTWARE_TRIGGER_VETO : std_logic := '0';
	signal internal_CMDREG_HARDWARE_TRIGGER_ENABLE : std_logic := '0';
	signal internal_CMDREG_READCTRL_trig_delay : std_logic_vector(11 downto 0) := (others => '0');
	signal internal_CMDREG_READCTRL_dig_offset : std_logic_vector(8 downto 0) := (others => '0');
	signal internal_CMDREG_READCTRL_win_num_to_read : std_logic_vector(8 downto 0) := (others => '0');
	signal internal_CMDREG_READCTRL_asic_enable_bits : std_logic_vector(9 downto 0) := (others => '0');
	signal internal_CMDREG_READCTRL_readout_reset : std_logic := '0';
	signal internal_CMDREG_READCTRL_readout_continue : std_logic := '0';
	signal internal_CMDREG_DIG_STARTDIG : std_logic := '0';
	signal internal_CMDREG_DIG_RD_ROWSEL_S : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
	signal internal_CMDREG_DIG_RD_COLSEL_S : STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
	signal internal_CMDREG_SROUT_START : std_logic := '0';
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
	signal internal_CMDREG_PedCalcEnable			:std_logic:='0';
	signal internal_PedSubEnable			:std_logic:='0';
	signal internal_CMDREG_PedCalcNAVG			:std_logic_vector(3 downto 0):=x"3";-- 2**3=8 averages for calculating peds
	signal internal_CMDREG_PedDemuxFifoEnable		:std_logic:='1';-- this out put will replace the common readout fifo from the SRreadout module
	signal internal_CMDREG_PedDemuxFifoOutputSelect: std_logic_vector(1 downto 0);

		
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
	
	-- MPPC DAC
	signal i_dac_number : std_logic_vector(3 downto 0);
	signal i_dac_addr   : std_logic_vector(3 downto 0);
	signal i_dac_value  : std_logic_vector(7 downto 0);
	signal i_dac_update : std_logic;
	signal i_dac_update_extended : std_logic;
	signal i_hv_sck_dac : std_logic;
	signal i_hv_din_dac : std_logic;

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
	
	
	
-----------------------USB:
signal		internal_USB_IFCLK                   :  STD_LOGIC:='Z';
signal		internal_USB_CTL0                    :  STD_LOGIC:='Z';
signal		internal_USB_CTL1                    :  STD_LOGIC:='Z';
signal		internal_USB_CTL2                    :  STD_LOGIC:='Z';
signal		internal_USB_FDD                     :  STD_LOGIC_VECTOR(15 downto 0);
signal		internal_USB_PA0                     :  STD_LOGIC:='Z';
signal		internal_USB_PA1                     :  STD_LOGIC:='Z';
signal		internal_USB_PA2                     :  STD_LOGIC:='Z';
signal		internal_USB_PA3                     :  STD_LOGIC:='Z';
signal		internal_USB_PA4                     :  STD_LOGIC:='Z';
signal		internal_USB_PA5                     :  STD_LOGIC:='Z';
signal		internal_USB_PA6                     :  STD_LOGIC:='Z';
signal		internal_USB_PA7                     :  STD_LOGIC:='Z';
signal		internal_USB_RDY0                    :  STD_LOGIC:='Z';
signal		internal_USB_RDY1                    :  STD_LOGIC:='Z';
signal		internal_USB_WAKEUP                  :  STD_LOGIC:='Z';
signal		internal_USB_CLKOUT		             :  STD_LOGIC:='Z';

----------Internal Trig_decision Logic:
	
signal internal_TRIGDEC_ax						:std_logic_vector(2 downto 0):="000";
signal internal_TRIGDEC_ay						:std_logic_vector(2 downto 0):="000";
signal internal_TRIGDEC_asic_enable_bits	:std_logic_vector(9 downto 0):="0000000000";
signal internal_CMDREG_USE_TRIGDEC			:std_logic:='0';	
signal internal_TRIGDEC_trig					:std_logic:='0';
signal internal_CMDREG_TRIGDEC_TRIGMASK	: std_logic_vector(9 downto 0):="1111111111";
---------------NEW BUSB BUSA signalling:

signal asicy_dig_sr_busy_i:std_logic:='0';
signal asicx_dig_sr_busy_i:std_logic:='0';
signal srasicx_i:std_logic_vector(2 downto 0):="000";
signal srasicy_i:std_logic_vector(2 downto 0):="000";

signal ro_win_start_i:std_logic_vector(8 downto 0);
signal READOUT_BUSY_i:std_logic;
signal dig_sr_start_i:std_logic:='0';

	signal BUSA_DIG_RD_ENA_i:std_logic;
	signal BUSA_cur_ro_win_i:std_logic_vector(8 downto 0);	
	signal BUSA_DIG_CLR_i:std_logic;
	signal BUSA_DIG_RAMP_i:std_logic;

	signal BUSB_DIG_RD_ENA_i:std_logic;
	signal BUSB_cur_ro_win_i:std_logic_vector(8 downto 0);	
	signal BUSB_DIG_CLR_i:std_logic;
	signal BUSB_DIG_RAMP_i:std_logic;

	
	--make serial readout bus signals identical
	signal BUSA_SAMPLESEL_i:std_logic_vector(4 downto 0);
	signal BUSA_SR_SEL_i:std_logic;
	signal BUSA_SR_CLR_i:std_logic;
	signal BUSA_SR_CLK_i:std_logic;
	signal BUSA_SAMPLESEL_ANY_i:std_logic;
	signal BUSB_SAMPLESEL_i:std_logic_vector(4 downto 0);
	signal BUSB_SR_SEL_i:std_logic;
	signal BUSB_SR_CLR_i:std_logic;
	signal BUSB_SR_CLK_i:std_logic;
	signal BUSB_SAMPLESEL_ANY_i:std_logic;
	
	signal ASICX_SROUT_ENABLE_WORD:std_logic_vector(4 downto 0):="00000";
	signal ASICY_SROUT_ENABLE_WORD:std_logic_vector(4 downto 0):="00000";
	
	--Serial readout DO signal switches between buses based on internal_READCTRL_ASIC_NUM signal
	signal BUSA_dout_i:std_logic_vector(15 downto 0);
	signal BUSB_dout_i:std_logic_vector(15 downto 0);
	
	


---------------------------------------
--module for updating MPPC bias and temp status regs
    COMPONENT update_status_regs
    PORT(
         clk : IN  std_logic;
         update : IN  std_logic;
         status_regs : OUT  STATREG;
         busy : OUT  std_logic;
         AMUX : OUT  std_logic_vector(7 downto 0);
         SDA_MON : INOUT  std_logic;
         SCL_MON : OUT  std_logic
        );
    END COMPONENT;
	 
	--Waveform FIFO component
	COMPONENT waveform_fifo_wr32_rd32
	PORT (
		rst : IN STD_LOGIC;
		wr_clk : IN STD_LOGIC;
		rd_clk : IN STD_LOGIC;
		din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		wr_en : IN STD_LOGIC;
		rd_en : IN STD_LOGIC;
		dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		full : OUT STD_LOGIC;
		empty : OUT STD_LOGIC;
		valid : OUT STD_LOGIC
	);
   END COMPONENT;
	
	COMPONENT buffer_fifo_wr32_rd32
	PORT (
		rst : IN STD_LOGIC;
		wr_clk : IN STD_LOGIC;
		rd_clk : IN STD_LOGIC;
		din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		wr_en : IN STD_LOGIC;
		rd_en : IN STD_LOGIC;
		dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		full : OUT STD_LOGIC;
		empty : OUT STD_LOGIC;
		valid : OUT STD_LOGIC
	);
	END COMPONENT;
	
	
	 COMPONENT SRAMscheduler
    PORT(
         clk : IN  std_logic;
         Ain : IN  AddrArray;
         DWin : IN  DataArray;
         DRout : OUT  DataArray;
         rw : IN  std_logic_vector(3 downto 0);
         update_req : IN  std_logic_vector(3 downto 0);
         busy : OUT  std_logic_vector(3 downto 0);
         A : OUT  std_logic_vector(21 downto 0);
         IOw : OUT  std_logic_vector(7 downto 0);
         IOr : IN  std_logic_vector(7 downto 0);
         BS : OUT  std_logic;
         WEb : OUT  std_logic;
         CE2 : OUT  std_logic;
         CE1b : OUT  std_logic;
         OEb : OUT  std_logic
        );
    END COMPONENT;
	 
	 COMPONENT WaveformDemuxPedsubDSPBRAM
    PORT(
         clk : IN  std_logic;
			enable 				: in std_logic;  -- '0'= disable, '1'= enable

         asic_no : IN  std_logic_vector(3 downto 0);
         win_addr_start : IN  std_logic_vector(8 downto 0);
         sr_start : IN  std_logic;
			mode : in std_logic_vector(1 downto 0);
			
			pswfifo_en 			:	out std_logic;
			pswfifo_clk 		: 	out std_logic;
			pswfifo_d 			: 	out std_logic_vector(31 downto 0);
			
         fifo_en : IN  std_logic;
         fifo_clk : IN  std_logic;
         fifo_din : IN  std_logic_vector(31 downto 0);
         ram_addr : OUT  std_logic_vector(21 downto 0);
         ram_data : IN  std_logic_vector(7 downto 0);
         ram_update : OUT  std_logic;
         ram_busy : IN  std_logic
        );
    END COMPONENT;

	COMPONENT WaveformDemuxCalcPedsBRAM
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		enable : IN std_logic;
		navg : IN std_logic_vector(3 downto 0);
		busy:out std_logic;
		asic_no : IN std_logic_vector(3 downto 0);
		win_addr_start : IN std_logic_vector(8 downto 0);
		trigin : IN std_logic;
		fifo_en : IN std_logic;
		fifo_clk : IN std_logic;
		fifo_din : IN std_logic_vector(31 downto 0);
		ram_busy : IN std_logic;          
		ram_addr : OUT std_logic_vector(21 downto 0);
		ram_data : OUT std_logic_vector(7 downto 0);
		ram_update : OUT std_logic
		);
	END COMPONENT;
	
COMPONENT ReadoutControl2
	PORT(
		clk : IN std_logic;
		trig : IN std_logic;
		dig_offset : IN std_logic_vector(8 downto 0);
		use_fixed_dig_start_win : IN std_logic_vector(15 downto 0);
		nwin_read : IN std_logic_vector(2 downto 0);
		systime : IN std_logic_vector(31 downto 0);
		curwin : IN std_logic_vector(8 downto 0);
		asicX : IN std_logic_vector(2 downto 0);
		asicY : IN std_logic_vector(2 downto 0);
		DIG_IDLE : IN std_logic;
		dig_sr_busy : IN std_logic;
		EVTBUILD_DONE_SENDING_EVENT : IN std_logic;
		RESET_EVENT_NUM : IN std_logic;
		fifo_empty : IN std_logic;          
		trig_ack : OUT std_logic;
		SRax : OUT std_logic_vector(2 downto 0);
		SRay : OUT std_logic_vector(2 downto 0);
		ro_win_start : OUT std_logic_vector(8 downto 0);
		sr_systime : OUT std_logic_vector(31 downto 0);
		ro_busy : OUT std_logic;
		dig_sr_start : OUT std_logic;
		EVTBUILD_start : OUT std_logic;
		EVTBUILD_MAKE_READY : OUT std_logic;
		EVENT_NUM : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT DigSRPedDSP
	PORT(
		clk : IN std_logic;
		start : IN std_logic;
		ro_win_start : IN std_logic_vector(8 downto 0);
		win_n : IN std_logic_vector(2 downto 0);
		asic : IN std_logic_vector(2 downto 0);
		dig_ramp_length : IN std_logic_vector(11 downto 0);
		do : IN std_logic_vector(15 downto 0);
		force_test_pattern : IN std_logic;
		ram_data : IN std_logic_vector(7 downto 0);
		ram_busy : IN std_logic;
		mode : IN std_logic_vector(1 downto 0);          
		busy : OUT std_logic;
		dig_rd_ena : OUT std_logic;
		dig_clr : OUT std_logic;
		dig_startramp : OUT std_logic;
		sr_clr : OUT std_logic;
		sr_clk : OUT std_logic;
		sr_sel : OUT std_logic;
		sr_samplesel : OUT std_logic_vector(4 downto 0);
		sr_samplsl_any : OUT std_logic;
		ram_addr : OUT std_logic_vector(21 downto 0);
		ram_update : OUT std_logic;
		cur_ro_win : OUT std_logic_vector(8 downto 0);
		pswfifo_en : OUT std_logic;
		pswfifo_d : OUT std_logic_vector(31 downto 0);
		pswfifo_clk : OUT std_logic;
		fifo_en : OUT std_logic;
		fifo_clk : OUT std_logic;
		fifo_d : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
begin

	extrig_OBUF_inst : OBUF
   generic map (
      DRIVE => 12,
      IOSTANDARD => "DEFAULT",
      SLEW => "SLOW")
   port map (
      O => EX_TRIGGER_MB,     -- Buffer output (connect directly to top-level port)
      I => internal_EX_TRIGGER_MB      -- Buffer input 
   );
	
	
 extrigscrd_IBUF_inst : IBUF
   generic map (
      IBUF_LOW_PWR => FALSE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
      IOSTANDARD => "DEFAULT")
   port map (
      O => internal_EX_TRIGGER_SCROD,     -- Buffer output
      I => EX_TRIGGER_SCROD      -- Buffer input (connect directly to top-level port
   );
	

internal_TRIGGER_ALL <=internal_EX_TRIGGER_SCROD;

internal_EX_TRIGGER_MB<=internal_TRIGGER_ALL;

--internal_EX_TRIGGER2_MB<=internal_READCTRL_LATCH_DONE;



	
	
	--Overall Signal Routing
	--debug/diag route:
 --  EX_TRIGGER2 <= internal_TRIGGER_ASIC(9);
--	EX_TRIGGER1 <= internal_READ_ENABLE_TIMER(9);
 --  EX_TRIGGER1 <= not internal_READCTRL_busy_status;--internal_TXDCTRIG_buf(10)(5);
--	EX_TRIGGER2 <= internal_READCTRL_trigger;--SHOUT(9);
 -- EX_TRIGGER1_MB<= internal_BOARD_CLOCK_OUT;--internal_clock_asic_ctrl;
--  EX_TRIGGER2_MB<='0';-- internal_clock_asic_ctrl;
 -- EX_TRIGGER_SCROD<='0';
	
   internal_TXDCTRIG(1)(1) <=TDC1_TRG(0) ; internal_TXDCTRIG(1)(2)  <=TDC1_TRG(1);internal_TXDCTRIG(1)(3) <=TDC1_TRG(2);internal_TXDCTRIG(1)(4) <=TDC1_TRG(3);internal_TXDCTRIG(1)(5) <=TDC1_TRG(4);
   internal_TXDCTRIG(2)(1) <=TDC2_TRG(0) ; internal_TXDCTRIG(2)(2)  <=TDC2_TRG(1);internal_TXDCTRIG(2)(3) <=TDC2_TRG(2);internal_TXDCTRIG(2)(4) <=TDC2_TRG(3);internal_TXDCTRIG(2)(5) <=TDC2_TRG(4);
   internal_TXDCTRIG(3)(1) <=TDC3_TRG(0) ; internal_TXDCTRIG(3)(2)  <=TDC3_TRG(1);internal_TXDCTRIG(3)(3) <=TDC3_TRG(2);internal_TXDCTRIG(3)(4) <=TDC3_TRG(3);internal_TXDCTRIG(3)(5) <=TDC3_TRG(4);
   internal_TXDCTRIG(4)(1) <=TDC4_TRG(0) ; internal_TXDCTRIG(4)(2)  <=TDC4_TRG(1);internal_TXDCTRIG(4)(3) <=TDC4_TRG(2);internal_TXDCTRIG(4)(4) <=TDC4_TRG(3);internal_TXDCTRIG(4)(5) <=TDC4_TRG(4);
   internal_TXDCTRIG(5)(1) <=TDC5_TRG(0) ; internal_TXDCTRIG(5)(2)  <=TDC5_TRG(1);internal_TXDCTRIG(5)(3) <=TDC5_TRG(2);internal_TXDCTRIG(5)(4) <=TDC5_TRG(3);internal_TXDCTRIG(5)(5) <=TDC5_TRG(4);
   internal_TXDCTRIG(6)(1) <=TDC6_TRG(0) ; internal_TXDCTRIG(6)(2)  <=TDC6_TRG(1);internal_TXDCTRIG(6)(3) <=TDC6_TRG(2);internal_TXDCTRIG(6)(4) <=TDC6_TRG(3);internal_TXDCTRIG(6)(5) <=TDC6_TRG(4);
   internal_TXDCTRIG(7)(1) <=TDC7_TRG(0) ; internal_TXDCTRIG(7)(2)  <=TDC7_TRG(1);internal_TXDCTRIG(7)(3) <=TDC7_TRG(2);internal_TXDCTRIG(7)(4) <=TDC7_TRG(3);internal_TXDCTRIG(7)(5) <=TDC7_TRG(4);
   internal_TXDCTRIG(8)(1) <=TDC8_TRG(0) ; internal_TXDCTRIG(8)(2)  <=TDC8_TRG(1);internal_TXDCTRIG(8)(3) <=TDC8_TRG(2);internal_TXDCTRIG(8)(4) <=TDC8_TRG(3);internal_TXDCTRIG(8)(5) <=TDC8_TRG(4);
   internal_TXDCTRIG(9)(1) <=TDC9_TRG(0) ; internal_TXDCTRIG(9)(2)  <=TDC9_TRG(1);internal_TXDCTRIG(9)(3) <=TDC9_TRG(2);internal_TXDCTRIG(9)(4) <=TDC9_TRG(3);internal_TXDCTRIG(9)(5) <=TDC9_TRG(4);
   internal_TXDCTRIG(10)(1)<=TDC10_TRG(0); internal_TXDCTRIG(10)(2) <=TDC10_TRG(1);internal_TXDCTRIG(10)(3) <=TDC10_TRG(2);internal_TXDCTRIG(10)(4) <=TDC10_TRG(3);internal_TXDCTRIG(10)(5) <=TDC10_TRG(4);
                                                                                                                                                                                                     
																																																																	  
--	internal_TXDCTRIG16(1)<=TDC1_TRG(4);
--	internal_TXDCTRIG16(2)<=TDC2_TRG(4);
--	internal_TXDCTRIG16(3)<=TDC3_TRG(4);
--	internal_TXDCTRIG16(4)<=TDC4_TRG(4);
--	internal_TXDCTRIG16(5)<=TDC5_TRG(4);
--	internal_TXDCTRIG16(6)<=TDC6_TRG(4);
--	internal_TXDCTRIG16(7)<=TDC7_TRG(4);
--	internal_TXDCTRIG16(8)<=TDC8_TRG(4);
--	internal_TXDCTRIG16(9)<=TDC9_TRG(4);	
--	internal_TXDCTRIG16(10)<=TDC10_TRG(4);
	
--	 asic_IBUF2_GEN : 
--    for I in 1 to 10 generate
--        atb_IBUF2_GEN : 
--        for J in 5 downto 1 generate
--            atb_IBUF2 : IBUF
--            port map(
--                O               => internal_TXDCTRIG_buf(I)(J),
--                I               => internal_TXDCTRIG(I)(J)
--            );
--        end generate;
--        atb16_IBUF2 : IBUF
--        port map(
--                O               => internal_TXDCTRIG16_buf(I),
--                I               => internal_TXDCTRIG16(I)
--        );             
--                
--    end generate;   
	 
	
	
	asic_trig_GGEN: for I in 1 to 10 generate
	internal_TRIGGER_ASIC(I-1) <= internal_TXDCTRIG16_buf(I) OR internal_TXDCTRIG_buf(I)(1) OR internal_TXDCTRIG_buf(I)(2) OR internal_TXDCTRIG_buf(I)(3) OR internal_TXDCTRIG_buf(I)(4);
end generate;

--	internal_TRIGGER_ASIC(0) <= TDC1_TRG_16 OR TDC1_TRG(0) OR TDC1_TRG(1) OR TDC1_TRG(2) OR TDC1_TRG(3);
--	internal_TRIGGER_ASIC(1) <= TDC2_TRG_16 OR TDC2_TRG(0) OR TDC2_TRG(1) OR TDC2_TRG(2) OR TDC2_TRG(3);
--	internal_TRIGGER_ASIC(2) <= TDC3_TRG_16 OR TDC3_TRG(0) OR TDC3_TRG(1) OR TDC3_TRG(2) OR TDC3_TRG(3);
--	internal_TRIGGER_ASIC(3) <= TDC4_TRG_16 OR TDC4_TRG(0) OR TDC4_TRG(1) OR TDC4_TRG(2) OR TDC4_TRG(3);
--	internal_TRIGGER_ASIC(4) <= TDC5_TRG_16 OR TDC5_TRG(0) OR TDC5_TRG(1) OR TDC5_TRG(2) OR TDC5_TRG(3);
--	internal_TRIGGER_ASIC(5) <= TDC6_TRG_16 OR TDC6_TRG(0) OR TDC6_TRG(1) OR TDC6_TRG(2) OR TDC6_TRG(3);
--	internal_TRIGGER_ASIC(6) <= TDC7_TRG_16 OR TDC7_TRG(0) OR TDC7_TRG(1) OR TDC7_TRG(2) OR TDC7_TRG(3);
--	internal_TRIGGER_ASIC(7) <= TDC8_TRG_16 OR TDC8_TRG(0) OR TDC8_TRG(1) OR TDC8_TRG(2) OR TDC8_TRG(3);
--	internal_TRIGGER_ASIC(8) <= TDC9_TRG_16 OR TDC9_TRG(0) OR TDC9_TRG(1) OR TDC9_TRG(2) OR TDC9_TRG(3);
--	internal_TRIGGER_ASIC(9) <= TDC10_TRG_16 OR TDC10_TRG(0) OR TDC10_TRG(1) OR TDC10_TRG(2) OR TDC10_TRG(3);
--	internal_TRIGGER_ALL <= internal_TRIGGER_ASIC(0) OR internal_TRIGGER_ASIC(1);

--	internal_ASIC_TRIG<=internal_TRIGGER_ASIC(9) and internal_TRIGGER_ASIC_control_word(9) ;
--	internal_TRIGGER_ALL <=EX_TRIGGER2_MB or  (internal_TRIGGER_ASIC(0) --AND internal_TRIGGER_ASIC_control_word(0)

--	)
	internal_ASIC_TRIG<=(internal_TRIGGER_ASIC(0) and internal_TRIGGER_ASIC_control_word(0) )
		OR ( internal_TRIGGER_ASIC(1) AND internal_TRIGGER_ASIC_control_word(1)
		)
		OR ( internal_TRIGGER_ASIC(2) AND internal_TRIGGER_ASIC_control_word(2) 
		)
		OR ( internal_TRIGGER_ASIC(3) AND internal_TRIGGER_ASIC_control_word(3) 
		)
		OR ( internal_TRIGGER_ASIC(4) AND internal_TRIGGER_ASIC_control_word(4) 
		)
		OR ( internal_TRIGGER_ASIC(5) AND internal_TRIGGER_ASIC_control_word(5) 
		)
		OR ( internal_TRIGGER_ASIC(6) AND internal_TRIGGER_ASIC_control_word(6) 
		)
		OR ( internal_TRIGGER_ASIC(7) AND internal_TRIGGER_ASIC_control_word(7) 
		)
		OR ( internal_TRIGGER_ASIC(8) AND internal_TRIGGER_ASIC_control_word(8) 
		)
		OR ( internal_TRIGGER_ASIC(9) AND internal_TRIGGER_ASIC_control_word(9) 
		);
	


	--RAM_A <=internal_RAM_A;
	--RAM_IO<=internal_RAM_IO;
	--connect ch.0 of SRAM access dedicated to the USB access
	internal_ram_Ain(0)<=internal_CMDREG_RAMADDR;--
	internal_ram_DWin(0)<=internal_CMDREG_RAMDATAWR;
	internal_CMDREG_RAMDATARD<=internal_ram_DRout(0);
	internal_ram_update(0)<=internal_CMDREG_RAMUPDATE;
	internal_ram_rw(0)<=internal_CMDREG_RAMRW;
	internal_CMDREG_RAMBUSY<=internal_ram_busy(0);
	
	 uut_pedram: SRAMscheduler PORT MAP (
          clk => internal_CLOCK_FPGA_LOGIC,
          Ain => internal_ram_Ain,
          DWin => internal_ram_DWin,
          DRout => internal_ram_DRout,
          rw => internal_ram_rw,
          update_req => internal_ram_update,
          busy => internal_ram_busy,
          A => RAM_A,
          IOw => RAM_IOw_i,
          IOr => RAM_IOr_i,
          BS => RAM_IO_BS_i,
          WEb => RAM_WEn,
          CE2 => RAM_CE2,
          CE1b => RAM_CE1n,
          OEb => RAM_OEn
        );
		  
 gen_io_buf:  for i in 0 to 7 generate
   IOBUF_inst : IOBUF
   generic map (
      DRIVE => 12,
      IOSTANDARD => "DEFAULT",
      SLEW => "SLOW")
   port map (
      O => RAM_IOr_i(i),     -- Buffer output
      IO => RAM_IO(i),   -- Buffer inout port (connect directly to top-level port)
      I => RAM_IOw_i(i),     -- Buffer input
      T =>  RAM_IO_BS_i      -- 3-state enable input, high=input, low=output 
   );
  
  end generate;

		  
	--Clock generation
	map_clock_gen : entity work.clock_gen
	generic map (
		HW_CONF => HW_CONF
	)
	port map ( 
		--Raw boad clock input
		BOARD_CLOCKP      => BOARD_CLOCKP,
		BOARD_CLOCKN      => BOARD_CLOCKN,
		BOARD_CLOCK_OUT			=>internal_BOARD_CLOCK_OUT,
		
		B2TT_SYS_CLOCK		=>internal_CLOCK_B2TT_SYS,
		--FTSW inputs
		
		--Trigger outputs from FTSW
		FTSW_TRIGGER      => open,
		--Select signal between the two
		USE_LOCAL_CLOCK   => '1',
		--General output clocks
		CLOCK_FPGA_LOGIC  => internal_CLOCK_FPGA_LOGIC,
		CLOCK_MPPC_DAC   => internal_CLOCK_MPPC_DAC,
		CLOCK_MPPC_ADC   => internal_CLOCK_MPPC_ADC,
		--ASIC control clocks
		--IM/GSV: Modify to it will run LVDS:
		CLOCK_ASIC_CTRL_WILK=>internal_CLOCK_ASIC_CTRL_WILK,
		CLOCK_ASIC_CTRL  => internal_CLOCK_ASIC_CTRL
		
	);  


		
	--Interface to the DAQ devices
	map_readout_interfaces : entity work.readout_interface
	port map ( 
		CLOCK                        => internal_CLOCK_FPGA_LOGIC,

		OUTPUT_REGISTERS             => internal_OUTPUT_REGISTERS,
		INPUT_REGISTERS              => internal_INPUT_REGISTERS,
		REGISTER_UPDATED             => i_register_update,
	
		--NOT original implementation - KLM specific
--		WAVEFORM_FIFO_DATA_IN        => internal_READOUT_DATA_OUT,
--		WAVEFORM_FIFO_EMPTY          => internal_READOUT_EMPTY,
--		WAVEFORM_FIFO_DATA_VALID     => internal_READOUT_DATA_VALID,
--		WAVEFORM_FIFO_READ_CLOCK     => internal_READOUT_READ_CLOCK,
--		WAVEFORM_FIFO_READ_ENABLE    => internal_READOUT_READ_ENABLE,
--		WAVEFORM_PACKET_BUILDER_BUSY => internal_READCTRL_busy_status,

		WAVEFORM_FIFO_DATA_IN        => internal_WAVEFORM_FIFO_DATA_OUT,
		WAVEFORM_FIFO_EMPTY          => internal_WAVEFORM_FIFO_EMPTY,
		WAVEFORM_FIFO_DATA_VALID     => internal_WAVEFORM_FIFO_DATA_VALID,
		WAVEFORM_FIFO_READ_CLOCK     => open,
		WAVEFORM_FIFO_READ_ENABLE    => internal_WAVEFORM_FIFO_READ_ENABLE,
		WAVEFORM_PACKET_BUILDER_BUSY => READOUT_BUSY_i,
		
		
		--WAVEFORM_PACKET_BUILDER_BUSY => '0',
		WAVEFORM_PACKET_BUILDER_VETO => internal_EVTBUILD_PACKET_BUILDER_VETO,
		
		--WAVEFORM ROI readout disable - command packets only
		--WAVEFORM_FIFO_DATA_IN        => (others=>'0'),
		--WAVEFORM_FIFO_EMPTY          => '1',
		--WAVEFORM_FIFO_DATA_VALID     => '0',
		--WAVEFORM_FIFO_READ_CLOCK     => open,
		--WAVEFORM_FIFO_READ_ENABLE    => open,
		--WAVEFORM_PACKET_BUILDER_BUSY => '0',
		--WAVEFORM_PACKET_BUILDER_VETO => open,
--
--		FIBER_0_RXP                  => FIBER_0_RXP,
--		FIBER_0_RXN                  => FIBER_0_RXN,
--	   FIBER_1_RXP                  => FIBER_1_RXP,
--		FIBER_1_RXN                  => FIBER_1_RXN,
--		FIBER_0_TXP                  => FIBER_0_TXP,
--		FIBER_0_TXN                  => FIBER_0_TXN,
--		FIBER_1_TXP                  => FIBER_1_TXP,
--		FIBER_1_TXN                  => FIBER_1_TXN,
--		FIBER_REFCLKP                => FIBER_REFCLKP,
--   	    FIBER_REFCLKN                => FIBER_REFCLKN,
----		FIBER_0_DISABLE_TRANSCEIVER  => FIBER_0_DISABLE_TRANSCEIVER,
----		FIBER_1_DISABLE_TRANSCEIVER  => FIBER_1_DISABLE_TRANSCEIVER,
----		FIBER_0_LINK_UP              => FIBER_0_LINK_UP,
----		FIBER_1_LINK_UP              => FIBER_1_LINK_UP,
----		FIBER_0_LINK_ERR             => FIBER_0_LINK_ERR,
----		FIBER_1_LINK_ERR             => FIBER_1_LINK_ERR,
--

		FIBER_0_RXP                  => 'Z',
		FIBER_0_RXN                  => 'Z',
		FIBER_1_RXP                  => 'Z',
		FIBER_1_RXN                  => 'Z',
		FIBER_0_TXP                  => open,
		FIBER_0_TXN                  => open,
		FIBER_1_TXP                  =>  open,
		FIBER_1_TXN                  =>  open,
		FIBER_REFCLKP                =>  'Z',
		FIBER_REFCLKN                =>  'Z',
		FIBER_0_DISABLE_TRANSCEIVER  =>  open,
		FIBER_1_DISABLE_TRANSCEIVER  =>  open,
		FIBER_0_LINK_UP              =>  open,
		FIBER_1_LINK_UP              =>  open,
		FIBER_0_LINK_ERR             =>  open,
		FIBER_1_LINK_ERR             =>  open,
                                         

		USB_IFCLK                    =>USB_IFCLK,
		USB_CTL0                     =>USB_CTL0,
		USB_CTL1                     =>USB_CTL1,
		USB_CTL2                     =>USB_CTL2,
		USB_FDD                      =>USB_FDD,
		USB_PA0                      =>USB_PA0,
		USB_PA1                      =>USB_PA1,
		USB_PA2                      =>USB_PA2,
		USB_PA3                      =>USB_PA3,
		USB_PA4                      =>USB_PA4,
		USB_PA5                      =>USB_PA5,
		USB_PA6                      =>USB_PA6,
		USB_PA7                      =>USB_PA7,
		USB_RDY0                     =>USB_RDY0,
		USB_RDY1                     =>USB_RDY1,
		USB_WAKEUP                   =>USB_WAKEUP,
		USB_CLKOUT		             =>USB_CLKOUT
);
---------------------------------------------------------------
---------KLM_SCROD: interface for Trigger using FTSW-----------
---------------------------------------------------------------

	klm_scrod_trig_interface : entity work.KLM_SCROD
	generic map(NUM_GTS=>1)
		port map ( 
	
			
--			    TTD/FTSW interface
    ttdclkp  => RJ45_CLK_P,
    ttdclkn  => RJ45_CLK_N,
    ttdtrgp  => RJ45_TRG_P,
    ttdtrgn  => RJ45_TRG_N,    
    ttdrsvp  => RJ45_RSV_P,  
    ttdrsvn  => RJ45_RSV_N,
    ttdackp  => RJ45_ACK_P,
    ttdackn  => RJ45_ACK_N,
	 b2ttsysclk	=>internal_CLOCK_B2TT_SYS,
----     ASIC Interface
    target_tb  => internal_TXDCTRIG,		--                 : in tb_vec_type; 
    target_tb16 => internal_TXDCTRIG16,	--                : in std_logic_vector(1 to TDC_NUM_CHAN); 
    -- SFP interface
    mgttxfault	=>		mgttxfault,  
    mgtmod0		=>		mgtmod0,               
    mgtlos		=>		mgtlos,                
    mgttxdis	=>		mgttxdis,              
    mgtmod2   	=>		mgtmod2,               
    mgtmod1  	=>		mgtmod1,              
	 mgtclk0p   =>		mgtclk0p,
	 mgtclk0n   =>		mgtclk0n,
	 mgtclk1p   =>		mgtclk1p,
	 mgtclk1n   =>		mgtclk1n,
    mgtrxp    	=>		mgtrxp,                
    mgtrxn   	=>		mgtrxn,                
    mgttxp    	=>		mgttxp,                
    mgttxn   	=>		mgttxn,               
	ex_trig1=>'1',
    status_fake =>	status_fake,          
    control_fake => 	control_fake         

			);
			




	--------------------------------------------------
	-------General registers interfaced to DAQ -------
	--------------------------------------------------

	--LEDS (no need for A4?)- it is on Interconnect Board
	LEDS(11 downto 3) <= internal_OUTPUT_REGISTERS(0)(11 downto 3);
	
	--LEDS <= internal_WAVEFORM_FIFO_EMPTY & internal_SROUT_IDLE_status & internal_DIG_IDLE_status & internal_SMP_IDLE_STATUS & "000" & internal_SMP_MAIN_CNT;
	
	--DAC CONTROL SIGNALS
	internal_DAC_CONTROL_UPDATE <= internal_OUTPUT_REGISTERS(1)(0);
	internal_DAC_CONTROL_REG_DATA <= internal_OUTPUT_REGISTERS(2)(6 downto 0) 
												& internal_OUTPUT_REGISTERS(3)(11 downto 0);
   internal_DAC_CONTROL_TDCNUM <= internal_OUTPUT_REGISTERS(4)(9 downto 0);
	internal_DAC_CONTROL_LOAD_PERIOD <= internal_OUTPUT_REGISTERS(5)(15 downto 0);
	internal_DAC_CONTROL_LATCH_PERIOD <= internal_OUTPUT_REGISTERS(6)(15 downto 0);
	
	--Sampling Signals
	internal_CMDREG_RESET_SAMPLIG_LOGIC <= internal_OUTPUT_REGISTERS(10)(0);

	--Digitization Signals
   internal_CMDREG_DIG_STARTDIG <= internal_OUTPUT_REGISTERS(20)(0);
   internal_CMDREG_DIG_RD_ROWSEL_S <= internal_OUTPUT_REGISTERS(21)(8 downto 6);
	internal_CMDREG_DIG_RD_COLSEL_S <= internal_OUTPUT_REGISTERS(21)(5 downto 0);
	
	--Serial Readout Signals
	internal_CMDREG_SROUT_START <=  internal_OUTPUT_REGISTERS(30)(0);
	internal_CMDREG_SROUT_TPG <= internal_OUTPUT_REGISTERS(31)(0); --'1': force test pattern to output. '0': regular operation

	--RAM Access from USB or anything:
	internal_CMDREG_RAMADDR(15 downto 0) <=internal_OUTPUT_REGISTERS(32);
	internal_CMDREG_RAMADDR(21 downto 16) <=internal_OUTPUT_REGISTERS(33)(5 downto 0);
	internal_CMDREG_RAMDATAWR <=internal_OUTPUT_REGISTERS(34)(7 downto 0);
	internal_CMDREG_RAMUPDATE <=internal_OUTPUT_REGISTERS(35)(0);
	internal_CMDREG_RAMRW <=internal_OUTPUT_REGISTERS(35)(1);

	---status regs: automaticly generated and fed to conc. or read via software?
	internal_CMDREG_SW_STATUS_READ<=internal_OUTPUT_REGISTERS(37)(0); -- '0': SW status read connections disabled, '1': SW status read is enabled

	internal_CMDREG_PedCalcNAVG	<=internal_OUTPUT_REGISTERS(38)(3 downto 0); -- 2**NAVG= number of averages for calculating peds
	internal_CMDREG_PedCalcReset 	<=internal_OUTPUT_REGISTERS(38)(15);
	internal_CMDREG_PedCalcEnable 	<=internal_OUTPUT_REGISTERS(38)(14);	
	internal_CMDREG_PedDemuxFifoOutputSelect<=internal_OUTPUT_REGISTERS(38)(13 downto 12); --00: disable (regular waveform dump)--01: ped sub, 10: ped only, 11: waveform only
	
	

	
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
	internal_CMDREG_READCTRL_dig_offset <= internal_OUTPUT_REGISTERS(54)(8 downto 0);
	internal_CMDREG_READCTRL_readout_reset <= internal_OUTPUT_REGISTERS(55)(0);
	internal_CMDREG_READCTRL_win_num_to_read <= internal_OUTPUT_REGISTERS(57)(8 downto 0);
	internal_CMDREG_READCTRL_readout_continue <= internal_OUTPUT_REGISTERS(58)(0);
	internal_CMDREG_READCTRL_RESET_EVENT_NUM <= internal_OUTPUT_REGISTERS(59)(0);
	internal_CMDREG_READCTRL_ramp_length <= internal_OUTPUT_REGISTERS(61);
	internal_CMDREG_READCTRL_use_fixed_dig_start_win<=internal_OUTPUT_REGISTERS(62);-- bit 15: '1'=> use fixed start win and (8 downto 0) is the fixed start win

	--Internal current readout ADC connecitons:
--	internal_CurrentADC_reset	<= intenal_STATREG_CurrentADC_reset;--internal_OUTPUT_REGISTERS(63)(0) when internal_CMDREG_SW_STATUS_READ ='1' else '0' ;
--	internal_runADC	<= intenal_STATREG_runADC;--internal_OUTPUT_REGISTERS(63)(1);
	internal_CMDREG_UPDATE_STATUS_REGS <=internal_OUTPUT_REGISTERS(63)(0);
	--internal_SDA  <=SDA_MON;
	--SCL_MON <=internal_SCL;
--	internal_enOutput	<= internal_OUTPUT_REGISTERS(63)(2);
--	internal_ADCOutput 	<= internal_OUTPUT_REGISTERS(64)(11 downto 0);
	--internal_INPUT_REGISTERS(N_GPR + 21)(11 downto 0) <= internal_ADCOutput(11 downto 0);--no need any more
	internal_INPUT_REGISTERS(N_GPR + 22)(0) <= internal_enOutput;

--uncomment forTX KLM MB operation
	TDC_AMUX_S   <= internal_AMUX_S(3 downto 0);--internal_NCH_AMUX_S;--internal_OUTPUT_REGISTERS(62)(3 downto 0);--channel within a daughtercard
	TOP_AMUX_S   <= internal_AMUX_S(7 downto 4);--internal_NDC_AMUX_S;--internal_OUTPUT_REGISTERS(62)(7 downto 4);-- Daughter Card Number

	internal_INPUT_REGISTERS(N_GPR+23)(7 downto 0)<=internal_CMDREG_RAMDATARD;
	internal_INPUT_REGISTERS(N_GPR+23)(8)<=internal_CMDREG_RAMBUSY;
	

	
	
	-- HV dac signals
	i_dac_number <= internal_OUTPUT_REGISTERS(60)(15 downto 12);
	i_dac_addr   <= internal_OUTPUT_REGISTERS(60)(11 downto 8);
	i_dac_value  <= internal_OUTPUT_REGISTERS(60)(7 downto 0);
	i_dac_update <= i_register_update(60);
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
	internal_INPUT_REGISTERS(N_GPR + 0 ) <= "0000000" & internal_SMP_MAIN_CNT(8 downto 0 );
	internal_INPUT_REGISTERS(N_GPR + 1 ) <= internal_WAVEFORM_FIFO_DATA_OUT(15 downto 0);
	internal_INPUT_REGISTERS(N_GPR + 2 ) <= "000000000000000" & internal_WAVEFORM_FIFO_EMPTY;
	internal_INPUT_REGISTERS(N_GPR + 3 ) <= "000000000000000" & internal_WAVEFORM_FIFO_DATA_VALID;
	internal_INPUT_REGISTERS(N_GPR + 4 ) <= "0000000" & internal_READCTRL_DIG_RD_COLSEL & internal_READCTRL_DIG_RD_ROWSEL;
	internal_INPUT_REGISTERS(N_GPR + 5 ) <= "0000000" & internal_READCTRL_LATCH_SMP_MAIN_CNT;
	internal_INPUT_REGISTERS(N_GPR + 6 ) <= "0000000000" & internal_EVTBUILD_MAKE_READY & internal_EVTBUILD_DONE_SENDING_EVENT & internal_WAVEFORM_FIFO_EMPTY & internal_SROUT_IDLE_status 
										& internal_DIG_IDLE_status & '0';
   internal_INPUT_REGISTERS(N_GPR + 7 ) (9 downto 0) <= SHOUT(9 downto 0);
   
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
	
	internal_INPUT_REGISTERS(N_GPR + 30) <= "0000000" & internal_READCTRL_dig_win_start; -- digitizatoin window start
	internal_INPUT_REGISTERS(N_GPR + 31) <=internal_pswfifo_d(15 downto 0);--internal_INPUT_REGISTERS(31)
	internal_INPUT_REGISTERS(N_GPR + 32 ) <= "0000000" & BUSA_cur_ro_win_i;
	internal_INPUT_REGISTERS(N_GPR + 33 ) <= "0000000" & BUSB_cur_ro_win_i;

	-- Status Regs:
	gen_STAT_REG_INREG: for i in 0 to N_STAT_REG-1 generate
		gen_BIT2: for j in 0 to 15 generate
			map_BUF_RR2 : BUF 
			port map( 
				I => internal_STATREG_REGISTERS(i)(j), 
				O => internal_INPUT_REGISTERS(N_GPR + i+40)(j) 
			);
		end generate;
	end generate;
	
--	gen_STAT_REG_INREG: for i in 0 to N_STAT_REG-1 generate
--				internal_INPUT_REGISTERS(N_GPR + i+40)<=x"ABCD"; 
--	end generate;
--	--internal_INPUT_REGISTERS(N_GPR + 40) <= 
--status reg update module	

	   uut: update_status_regs PORT MAP (
          clk => internal_CLOCK_FPGA_LOGIC,
          update => internal_CMDREG_UPDATE_STATUS_REGS,
          status_regs => internal_STATREG_REGISTERS,
          busy => open,
          AMUX => internal_AMUX_S,
          SDA_MON => SDA_MON,
          SCL_MON => SCL_MON
        );


	gen_wl_clk_to_asic : for i in 0 to 9 generate

	wilk_OBUFDS_inst : OBUFDS
   generic map (
      --IOSTANDARD => "DEFAULT")
		IOSTANDARD => "LVDS_25")

   port map (
      O => WL_CLK_P(i),    			-- Diff_p output (connect directly to top-level port)
      OB => WL_CLK_N(i),   			-- Diff_n output (connect directly to top-level port)
      I => internal_CLOCK_ASIC_CTRL_WILK      	-- Buffer input 
 --		I  => WL_CLK_tmp(i)        -- 1-bit output data

   );
	
	end generate;
		
	BUS_REGCLR <= '0';

	  --ASIC control processes
	
	--TARGETX DAC Control
	u_TARGETX_DAC_CONTROL: entity work.TARGETX_DAC_CONTROL PORT MAP(
			CLK 				=> internal_CLOCK_FPGA_LOGIC,
			LOAD_PERIOD 	=> internal_DAC_CONTROL_LOAD_PERIOD,
			LATCH_PERIOD 	=> internal_DAC_CONTROL_LATCH_PERIOD,
			UPDATE 			=> internal_DAC_CONTROL_UPDATE,
			REG_DATA 		=> internal_DAC_CONTROL_REG_DATA,
			busy				=>open,
			SIN 				=> internal_DAC_CONTROL_SIN,
			SCLK 				=> internal_DAC_CONTROL_SCLK,
			PCLK 				=> internal_DAC_CONTROL_PCLK
   );
	--end generate;
	--Only specified DC gets serial data signals, uses bit mask
	gen_DAC_CONTROL: for i in 0 to 9 generate
		SIN(i)  <= internal_DAC_CONTROL_SIN  and internal_DAC_CONTROL_TDCNUM(i);
		PCLK(i) <= internal_DAC_CONTROL_PCLK and internal_DAC_CONTROL_TDCNUM(i);
		SCLK(i) <= internal_DAC_CONTROL_SCLK and internal_DAC_CONTROL_TDCNUM(i);
	end generate;
----------------------------- READOUT CONTROL REV2------------------------------------

Inst_ReadoutControl2: ReadoutControl2 PORT MAP(
		clk => internal_CLOCK_FPGA_LOGIC,
		trig => internal_READCTRL_trigger,
		dig_offset => internal_READCTRL_dig_offset,
		use_fixed_dig_start_win => internal_CMDREG_READCTRL_use_fixed_dig_start_win,
		nwin_read => internal_READCTRL_win_num_to_read(2 downto 0),
		systime => x"12345678",
		curwin => internal_SMP_MAIN_CNT,
		asicX => "000",
		asicY => "101",
		DIG_IDLE => '1',
		dig_sr_busy => asicx_dig_sr_busy_i or asicy_dig_sr_busy_i,
		EVTBUILD_DONE_SENDING_EVENT => internal_EVTBUILD_DONE_SENDING_EVENT,
		RESET_EVENT_NUM => internal_READCTRL_RESET_EVENT_NUM,
		fifo_empty => internal_WAVEFORM_FIFO_EMPTY,
		trig_ack => open,
		SRax => SRasicX_i,
		SRay => SRasicY_i,
		ro_win_start => ro_win_start_i,
		sr_systime => open,
		ro_busy => READOUT_BUSY_i,
		dig_sr_start => dig_sr_start_i ,
		EVTBUILD_start => open,
		EVTBUILD_MAKE_READY =>open ,
		EVENT_NUM => internal_READCTRL_EVENT_NUM
	);


-----------------
--------------------Dig+SRou+Ped+DSP- BUSB
Inst_DigSRPedDSP_Y: DigSRPedDSP PORT MAP(
		clk 							=> internal_CLOCK_FPGA_LOGIC,
		start 						=> dig_sr_start_i,
		ro_win_start 				=> ro_win_start_i,
		win_n 						=> internal_READCTRL_win_num_to_read(2 downto 0),
		asic 							=> SRasicY_i,
		busy 							=> asicy_dig_sr_busy_i,
		dig_ramp_length		   => internal_CMDREG_READCTRL_ramp_length(11 downto 0),
		dig_rd_ena				   => BUSB_DIG_RD_ENA_i,
		dig_clr 						=> BUSB_DIG_CLR_i,
		dig_startramp 				=> BUSB_DIG_RAMP_i,
		do 							=> BUSB_dout_i,
		force_test_pattern 		=> '0',
		sr_clr 						=> BUSB_SR_CLR_i,
		sr_clk 						=> BUSB_SR_CLK_i,
		sr_sel 						=> BUSB_SR_SEL_i,
		sr_samplesel 				=> BUSB_SAMPLESEL_i,
		sr_samplsl_any 			=> BUSB_SAMPLESEL_ANY_i,
		ram_addr						=>internal_ram_Ain(2),
		ram_data						=>internal_ram_DRout(2),
		ram_update					=>internal_ram_update(2),
		ram_busy						=>internal_ram_busy(2),
		cur_ro_win 					=> BUSB_cur_ro_win_i,
		mode 							=> "11",
		pswfifo_en 					=>open ,
		pswfifo_d 					=> open,
		pswfifo_clk 				=> open,
		fifo_en					   => internal_SROUT_FIFO_WR_EN,
		fifo_clk 					=> internal_SROUT_FIFO_WR_CLK,
		fifo_d 						=> internal_SROUT_FIFO_DATA_OUT
	);
	
	
	
	
	--BUSA and BUSB Digitzation signals are identical
	BUSA_RD_ENA			<= BUSA_DIG_RD_ENA_i;
	BUSA_RD_ROWSEL_S 	<= BUSA_cur_ro_win_i(2 downto 0);	
	BUSA_RD_COLSEL_S 	<= BUSA_cur_ro_win_i(8 downto 3); 
	BUSA_CLR 			<= BUSA_DIG_CLR_i and not internal_CMDREG_SROUT_TPG;
	BUSA_RAMP 			<= BUSA_DIG_RAMP_i;

	BUSB_RD_ENA			<= BUSB_DIG_RD_ENA_i;
	BUSB_RD_ROWSEL_S 	<= BUSB_cur_ro_win_i(2 downto 0);
	BUSB_RD_COLSEL_S 	<= BUSB_cur_ro_win_i(8 downto 3);
	BUSB_CLR 			<= BUSB_DIG_CLR_i and not internal_CMDREG_SROUT_TPG;
	BUSB_RAMP 			<= BUSB_DIG_RAMP_i;		
	--make serial readout bus signals identical
	BUSA_SAMPLESEL_S 	<= BUSA_SAMPLESEL_i;
	BUSA_SR_SEL 		<= BUSA_SR_SEL_i;
	BUSA_SR_CLEAR		<= BUSA_SR_CLR_i;
	BUSB_SAMPLESEL_S 	<= BUSB_SAMPLESEL_i;
	BUSB_SR_SEL 		<= BUSB_SR_SEL_i;
	BUSB_SR_CLEAR		<= BUSB_SR_CLR_i;
	
	--Serial readout DO signal switches between buses based on internal_READCTRL_ASIC_NUM signal
	BUSA_dout_i<=BUSA_DO;
	BUSB_dout_i<=BUSB_DO;
	
	--multiplex DC specific serial readout signal to ASIC specified by internal_READCTRL_ASIC_NUM signal

	ASICX_SROUT_ENABLE_WORD 					<= "00001" when (SRasicX_i = "001") else
															"00010" when (SRasicX_i = "010") else
															"00100" when (SRasicX_i = "011") else
															"01000" when (SRasicX_i = "100") else
															"10000" when (SRasicX_i = "101") else
															"00000";

	ASICY_SROUT_ENABLE_WORD 					<= "00001" when (SRasicY_i = "001") else
															"00010" when (SRasicY_i = "010") else
															"00100" when (SRasicY_i = "011") else
															"01000" when (SRasicY_i = "100") else
															"10000" when (SRasicY_i = "101") else
															"00000";
	

	
	--Only specified DC gets serial data signals, uses bit mask

	gen_BUSA_SAMPLESEL_ANY_CONTROL: for i in 0 to 4 generate
		SR_CLOCK(i)		<= BUSA_SR_CLK_i			and ASICX_SROUT_ENABLE_WORD(i);
		SAMPLESEL_ANY(i)<= BUSA_SAMPLESEL_ANY_i 	and ASICX_SROUT_ENABLE_WORD(i);
	end generate;
		
	gen_BUSB_SAMPLESEL_ANY_CONTROL: for i in 0 to 4 generate
		SR_CLOCK(i+5)			<= BUSB_SR_CLK_i			and ASICY_SROUT_ENABLE_WORD(i);
		SAMPLESEL_ANY(i+5) 	<= BUSB_SAMPLESEL_ANY_i 	and ASICY_SROUT_ENABLE_WORD(i);
	end generate;

	
	
	
	
	
	--Control the sampling, digitization and serial resout processes following trigger
--	u_ReadoutControl: entity work.ReadoutControl PORT MAP(
--		clk 					=> internal_CLOCK_FPGA_LOGIC,
--		smp_clk 				=> internal_CLOCK_ASIC_CTRL,
--		trigger 				=> internal_READCTRL_trigger,
--		trig_delay 			=> internal_READCTRL_trig_delay,
--		dig_offset 			=> internal_READCTRL_dig_offset,
--		win_num_to_read 	=> internal_READCTRL_win_num_to_read,
--		asic_enable_bits  => internal_READCTRL_asic_enable_bits,
--		SMP_MAIN_CNT 		=> internal_SMP_MAIN_CNT,
--		SMP_IDLE_status 	=> '0',
--		DIG_IDLE_status 	=> internal_DIG_IDLE_status,
--		SROUT_IDLE_status => internal_SROUT_IDLE_status,
--		fifo_empty 			=> internal_WAVEFORM_FIFO_EMPTY,
--		EVTBUILD_DONE_SENDING_EVENT => internal_EVTBUILD_DONE_SENDING_EVENT,
--		LATCH_SMP_MAIN_CNT => internal_READCTRL_LATCH_SMP_MAIN_CNT,
--		dig_win_start			=> internal_READCTRL_dig_win_start,
--		LATCH_DONE 			=> internal_READCTRL_LATCH_DONE,
--		READOUT_RESET 		=> internal_READCTRL_readout_reset,
--		READOUT_CONTINUE 	=> internal_READCTRL_readout_continue,
--		RESET_EVENT_NUM 	=> internal_READCTRL_RESET_EVENT_NUM,
--		use_fixed_dig_start_win=>internal_CMDREG_READCTRL_use_fixed_dig_start_win,
--		ASIC_NUM 			=> internal_READCTRL_ASIC_NUM,
--		busy_status 		=> internal_READCTRL_busy_status,
--		smp_stop 			=> internal_READCTRL_smp_stop,
--		dig_start 			=> internal_READCTRL_dig_start,
--		DIG_RD_ROWSEL_S 	=> internal_READCTRL_DIG_RD_ROWSEL,
--		DIG_RD_COLSEL_S 	=> internal_READCTRL_DIG_RD_COLSEL,
--		srout_start 		=> internal_READCTRL_srout_start,
--		EVTBUILD_start 	=> open,
--		EVTBUILD_MAKE_READY => open,
--		EVENT_NUM 			=> internal_READCTRL_EVENT_NUM,
--		READOUT_DONE 		=> internal_READCTRL_READOUT_DONE
--	);
	internal_SOFTWARE_TRIGGER_VETO <= internal_CMDREG_SOFTWARE_TRIGGER_VETO;
	internal_HARDWARE_TRIGGER_ENABLE <= internal_CMDREG_HARDWARE_TRIGGER_ENABLE;
	internal_SOFTWARE_TRIGGER <= internal_CMDREG_SOFTWARE_trigger;-- AND NOT internal_SOFTWARE_TRIGGER_VETO;
	internal_HARDWARE_TRIGGER <= internal_TRIGGER_ALL AND internal_HARDWARE_TRIGGER_ENABLE;
	internal_READCTRL_trigger <= internal_SOFTWARE_TRIGGER OR internal_HARDWARE_TRIGGER or internal_ASIC_TRIG;
	--internal_READCTRL_trigger <= internal_SOFTWARE_TRIGGER;
	internal_READCTRL_trig_delay <= internal_CMDREG_READCTRL_trig_delay;
	internal_READCTRL_dig_offset <= internal_CMDREG_READCTRL_dig_offset;
	internal_READCTRL_win_num_to_read <= internal_CMDREG_READCTRL_win_num_to_read;
	internal_READCTRL_asic_enable_bits <= internal_CMDREG_READCTRL_asic_enable_bits;
	internal_READCTRL_readout_reset <= internal_CMDREG_READCTRL_readout_reset;
	internal_READCTRL_RESET_EVENT_NUM <= internal_CMDREG_READCTRL_RESET_EVENT_NUM;
	
	LEDS(0)<=internal_TRIGGER_ALL;-- scope probe here
	LEDS(1)<=internal_READCTRL_trigger;
	LEDS(2)<=internal_SMP_MAIN_CNT(4); 
	
	LEDS(12)<=internal_EX_TRIGGER_SCROD or internal_TRIGGER_ALL or internal_READCTRL_trigger or internal_SMP_MAIN_CNT(4);
	--demux and ped sub logic:
	
--	 u_wavedemux: WaveformDemuxPedsubDSPBRAM PORT MAP (
--          clk => internal_CLOCK_FPGA_LOGIC,
--			 enable=>internal_PedSubEnable,
--          asic_no => internal_READCTRL_ASIC_NUM,
--          win_addr_start => internal_READCTRL_DIG_RD_COLSEL & internal_READCTRL_DIG_RD_ROWSEL,
--          sr_start => internal_READCTRL_LATCH_DONE,--srout_start,
--			 mode=>internal_CMDREG_PedDemuxFifoOutputSelect,
--
--			fifo_en 	=> internal_SROUT_FIFO_WR_EN,
--			fifo_clk => internal_SROUT_FIFO_WR_CLK,
--			fifo_din => internal_SROUT_FIFO_DATA_OUT,
--
--			pswfifo_d =>internal_pswfifo_d,--internal_INPUT_REGISTERS(31)
--			pswfifo_clk =>internal_pswfifo_clk,
--			pswfifo_en=>internal_pswfifo_en,
--
--          ram_addr => internal_ram_Ain(2),
--          ram_data => internal_ram_DRout(2),
--          ram_update => internal_ram_update(2),
--          ram_busy => internal_ram_busy(2)
--        );
--	
--	
--		internal_ram_rw(2)<='0';-- always reading from this channel
--		internal_PedSubEnable<='0' when  internal_CMDREG_PedDemuxFifoOutputSelect="00" else '1';
--	
--	Inst_WaveformDemuxCalcPedsBRAM: WaveformDemuxCalcPedsBRAM PORT MAP(
--		clk => internal_CLOCK_FPGA_LOGIC,
--		reset => internal_CMDREG_PedCalcReset,
--		enable => internal_CMDREG_PedCalcEnable,
--		navg => internal_CMDREG_PedCalcNAVG,
--		busy=>open,
--		asic_no => internal_READCTRL_ASIC_NUM,
--		win_addr_start =>internal_READCTRL_DIG_RD_COLSEL & internal_READCTRL_DIG_RD_ROWSEL,
--		trigin => internal_READCTRL_LATCH_DONE,
--		fifo_en => internal_SROUT_FIFO_WR_EN ,
--		fifo_clk => internal_SROUT_FIFO_WR_CLK,
--		fifo_din => internal_SROUT_FIFO_DATA_OUT,
--		
--		ram_addr => internal_ram_Ain(3),
--		ram_data => internal_ram_DWin(3),
--		ram_update => internal_ram_update(3),
--		ram_busy => internal_ram_busy(3)
--	);
--		
--		internal_ram_rw(3)<='1';-- always write to this channel	
--	
	
	--sampling logic - specifically SSPIN/SSTIN + write address control
	u_SamplingLgc : entity work.SamplingLgc
   Port map (
		clk 			=> internal_CLOCK_ASIC_CTRL,
		reset => internal_CMDREG_RESET_SAMPLIG_LOGIC,
		dig_win_start => internal_READCTRL_dig_win_start,
		dig_win_n => internal_READCTRL_win_num_to_read,-- "00100",
      dig_win_ena => not internal_DIG_IDLE_status,--internal_READCTRL_busy_status,
		MAIN_CNT_out => internal_SMP_MAIN_CNT,
		sstin_out 	=> internal_SSTIN,-- GV: 6/9/14 we do not want to shut down this part of the chip!
		wr_addrclr_out => internal_WR_ADDRCLR,
		wr1_ena 	=> open,--internal_WR_ENA,
		wr2_ena 	=> open
	);

	internal_WR_ENA<= not READOUT_BUSY_i;
	BUSA_WR_ADDRCLR 	<= internal_WR_ADDRCLR;
	BUSB_WR_ADDRCLR 	<= internal_WR_ADDRCLR;	

	
	
	--SamplingLgc signals just get fanned out identically to each daughter card
	gen_SamplingLgcSignals : for i in 0 to 9 generate
		WR1_ENA(i) 		<= internal_WR_ENA;
		WR2_ENA(i) 		<= internal_WR_ENA;
	end generate;

gen_sstin : for i in 0 to 9 generate
 OBUFDS_inst : OBUFDS
   generic map (
 --     IOSTANDARD => "DEFAULT")
		IOSTANDARD => "LVDS_25")
   port map (
      O => SSTIN_P(i),    			-- Diff_p output (connect directly to top-level port)
      OB => SSTIN_N(i),   			-- Diff_n output (connect directly to top-level port)
      I => internal_SSTIN      	-- Buffer input 
   );
end generate;

	--digitizing logic
--	u_DigitizingLgc: entity work.DigitizingLgcTX PORT MAP(
--		clk 				=> internal_CLOCK_FPGA_LOGIC,
--		IDLE_status 	=> internal_DIG_IDLE_status,
--		StartDig 		=> internal_DIG_STARTDIG,
--		ramp_length 	=> internal_CMDREG_READCTRL_ramp_length(12 downto 0),
--		rd_ena 			=> internal_DIG_RD_ENA,
--		clr 				=> internal_DIG_CLR,
--		startramp 		=> internal_DIG_RAMP
--	);
--	internal_DIG_STARTDIG 	<= internal_READCTRL_dig_start;

	
--	u_SerialDataRout: entity work.SerialDataRout PORT MAP(
--		clk 			=> internal_CLOCK_FPGA_LOGIC,
--		start		 	=> internal_SROUT_START,
--		EVENT_NUM 	=> internal_READCTRL_EVENT_NUM,
--		WIN_ADDR 	=> internal_READCTRL_DIG_RD_COLSEL & internal_READCTRL_DIG_RD_ROWSEL,
--		ASIC_NUM 	=> internal_READCTRL_ASIC_NUM,
--		force_test_pattern =>internal_CMDREG_SROUT_TPG,
--		
--		IDLE_status => internal_SROUT_IDLE_status,
--		busy 			=> open,
--		samp_done 	=> open,
--		dout 			=> internal_SROUT_dout,
--		sr_clr 		=> internal_SROUT_SR_CLR,
--		sr_clk 		=> internal_SROUT_SR_CLK,
--		sr_sel 		=> internal_SROUT_SR_SEL,
--		samplesel 	=> internal_SROUT_SAMPLESEL,
--		smplsi_any 	=> internal_SROUT_SAMPLESEL_ANY,
--		fifo_wr_en 	=> internal_SROUT_FIFO_WR_EN,
--		fifo_wr_clk => internal_SROUT_FIFO_WR_CLK,
--		fifo_wr_din => internal_SROUT_FIFO_DATA_OUT
--		
----		ram_addr=>internal_ram_Ain(2),
----		ram_data=>internal_ram_DRout(2),
----		ram_update=>internal_ram_update(2),
----		ram_busy=>internal_ram_busy(2)
--	);
----	internal_ram_rw(2)<='0'; --only reading from this channel of RAM	
--	internal_SROUT_START <= internal_READCTRL_srout_start;



	--FIFO receives waveform samples produced by serial readout process
   u_waveform_fifo_wr32_rd32 : waveform_fifo_wr32_rd32
   PORT MAP (
		rst => internal_WAVEFORM_FIFO_RST,
		wr_clk => internal_SROUT_FIFO_WR_CLK,
		rd_clk => internal_WAVEFORM_FIFO_READ_CLOCK,
		din => internal_SROUT_FIFO_DATA_OUT,
		wr_en => internal_SROUT_FIFO_WR_EN,
		rd_en => internal_WAVEFORM_FIFO_READ_ENABLE,
		dout => internal_WAVEFORM_FIFO_DATA_OUT,
		empty => internal_WAVEFORM_FIFO_EMPTY,
		valid => internal_WAVEFORM_FIFO_DATA_VALID
   );

--	internal_SROUT_FIFO_WR_CLK_waveformfifo<= internal_SROUT_FIFO_WR_CLK when internal_CMDREG_PedDemuxFifoOutputSelect="00" else internal_pswfifo_clk;
--	internal_SROUT_FIFO_WR_EN_waveformfifo <= internal_SROUT_FIFO_WR_EN when internal_CMDREG_PedDemuxFifoOutputSelect="00" else internal_pswfifo_en;
--	internal_SROUT_FIFO_DATA_OUT_waveformfifo<= internal_SROUT_FIFO_DATA_OUT when internal_CMDREG_PedDemuxFifoOutputSelect="00" else internal_pswfifo_d;
--	
	
	
	
	--Module reads out from waveform FIFO and places ASIC window-sized packets into buffer FIFO
--	u_OutputBufferControl: entity work.OutputBufferControl PORT MAP
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
--		--WAVEFORM_FIFO_DATA_OUT 		=> (others=>'0'),
--		--WAVEFORM_FIFO_EMPTY 			=> '1',
--		--WAVEFORM_FIFO_DATA_VALID 	=> '0',
--		BUFFER_FIFO_RESET 	=> internal_BUFFERCTRL_FIFO_RESET,
--		BUFFER_FIFO_WR_CLK 	=> internal_BUFFERCTRL_FIFO_WR_CLK,
--		BUFFER_FIFO_WR_EN 	=> internal_BUFFERCTRL_FIFO_WR_EN,
--		BUFFER_FIFO_DIN 		=> internal_BUFFERCTRL_FIFO_DIN,
--		EVTBUILD_START	 		=> internal_READCTRL_evtbuild_start,
--		EVTBUILD_MAKE_READY	=> internal_READCTRL_evtbuild_make_ready
--	);
	internal_READCTRL_readout_continue <= internal_CMDREG_READCTRL_readout_continue;
	
	--Buffer FIFO, contains up to 512 32-bit words (will not lead to USB packet drops)
	u_buffer_wr32_rd32 : buffer_fifo_wr32_rd32
   PORT MAP (
		rst 		=> internal_BUFFERCTRL_FIFO_RESET,
		wr_clk	=> internal_BUFFERCTRL_FIFO_WR_CLK,
		rd_clk 	=> internal_EVTBUILD_FIFO_READ_CLOCK,
		din 		=> internal_BUFFERCTRL_FIFO_DIN,
		wr_en 	=> internal_BUFFERCTRL_FIFO_WR_EN,
		rd_en 	=> internal_EVTBUILD_FIFO_READ_ENABLE,
		dout 		=> internal_EVTBUILD_FIFO_DATA_OUT,
		full 		=> open,
		empty 	=> internal_EVTBUILD_FIFO_EMPTY,
		valid 	=> internal_EVTBUILD_FIFO_DATA_VALID
	);
	
	--Event builder provides ordered waveform data to readout_interfaces module
	map_event_builder: entity work.event_builder PORT MAP(
		READ_CLOCK 					=> internal_READOUT_READ_CLOCK,
		SCROD_REV_AND_ID_WORD 	=> internal_SCROD_REV_AND_ID_WORD,
		EVENT_NUMBER_WORD 		=> internal_READCTRL_EVENT_NUM,
		EVENT_TYPE_WORD 			=> x"65766e74",
		EVENT_FLAG_WORD 			=> x"00000000",
		NUMBER_OF_WAVEFORM_PACKETS_WORD => x"00000000",
		START_BUILDING_EVENT 	=> internal_EVTBUILD_START_BUILDING_EVENT,
		DONE_SENDING_EVENT 		=> internal_EVTBUILD_DONE_SENDING_EVENT,
		MAKE_READY 					=> internal_EVTBUILD_MAKE_READY,
		WAVEFORM_FIFO_DATA 		=> internal_EVTBUILD_FIFO_DATA_OUT,
		WAVEFORM_FIFO_DATA_VALID => internal_EVTBUILD_FIFO_DATA_VALID,
		WAVEFORM_FIFO_EMPTY 		=> internal_EVTBUILD_FIFO_EMPTY,
		WAVEFORM_FIFO_READ_ENABLE => internal_EVTBUILD_FIFO_READ_ENABLE,
		WAVEFORM_FIFO_READ_CLOCK => internal_EVTBUILD_FIFO_READ_CLOCK,
		FIFO_DATA_OUT 				=> internal_READOUT_DATA_OUT,
		FIFO_DATA_VALID 			=> internal_READOUT_DATA_VALID,
		FIFO_EMPTY					=> internal_READOUT_EMPTY,
		FIFO_READ_ENABLE 			=> internal_READOUT_READ_ENABLE
	);
	internal_EVTBUILD_START_BUILDING_EVENT <= internal_READCTRL_evtbuild_start;
	internal_EVTBUILD_MAKE_READY <= internal_READCTRL_evtbuild_make_ready;
	internal_SCROD_REV_AND_ID_WORD <= x"00" & x"A3" & x"002c";
	--internal_EVTBUILD_START_BUILDING_EVENT <= internal_CMDREG_EVTBUILD_START_BUILDING_EVENT;
	--internal_EVTBUILD_MAKE_READY <= internal_CMDREG_EVTBUILD_MAKE_READY;
	
	gen_trigger_counters : for i in 0 to 9 generate
		--u_trigger_scaler_single_channel: entity work.trigger_scaler_single_channel Port Map ( 
		u_trigger_scaler_single_channel_w_timing_gen: entity work.trigger_scaler_single_channel_w_timing_gen Port Map ( --IM 6/5/14: now using the combined trigger scaler timing gen block inctead

			SIGNAL_TO_COUNT => internal_TRIGGER_ASIC(i),
			CLOCK           => internal_CLOCK_FPGA_LOGIC,
			READ_ENABLE_IN     => internal_TRIGCOUNT_ena,
			RESET_COUNTER   => internal_TRIGCOUNT_rst,
			READ_ENABLE_TIMER => internal_READ_ENABLE_TIMER(i),
			SCALER          => internal_TRIGCOUNT_scaler(i)
		);
	end generate;

---------------------------
-- MPPC Current measurement ADC: MPC3221
---------------------------
	inst_mpc_adc: entity work.Module_ADC_MCP3221_I2C_new
	port map(
		clock			 => internal_CLOCK_MPPC_DAC,--internal_CLOCK_FPGA_LOGIC,
		reset			=>	internal_CurrentADC_reset,
		
		sda	=> SDA_MON,--internal_SDA,
		scl	=> internal_SCL,
		 
		runADC		=> internal_runADC,
		enOutput		=> internal_enOutput,
		ADCOutput	=> internal_ADCOutput

	);


	--------------
	-- MPPC DACs
	--------------
	inst_mpps_dacs : entity work.mppc_dacs
	Port map(
		------------CLOCK-----------------
		CLOCK			 => internal_CLOCK_MPPC_DAC,
		------------DAC PARAMETERS--------
		DAC_NUMBER   => i_dac_number,
		DAC_ADDR     => i_dac_addr,
		DAC_VALUE    => i_dac_value,
		WRITE_STROBE => i_dac_update_extended,
		------------HW INTERFACE----------
		SCK_DAC		 => i_hv_sck_dac,
		DIN_DAC		 => i_hv_din_dac,
		CS_DAC       => internal_TDC_CS_DAC
	);
   --TDC_CS_DAC <= "0000000000";
--gen_tdc_cs_dac_signals1: if (HW_CONF="SA4_MBSF_TX") generate
--	TDC_CS1_DAC<=internal_TDC_CS_DAC;
--	TDC_CS2_DAC<=internal_TDC_CS_DAC;
--end generate;
gen_tdc_cs_dac_signals2: if (HW_CONF/="SA4_MBSF_TX") generate
	TDC_CS_DAC<=internal_TDC_CS_DAC;
end generate;

	BUSA_SCK_DAC <= i_hv_sck_dac;
	BUSB_SCK_DAC <= i_hv_sck_dac;
	BUSA_DIN_DAC <= i_hv_din_dac;
	BUSB_DIN_DAC <= i_hv_din_dac;

	inst_pulse_extent : entity work.pulse_transition
	Generic map(
		CLOCK_RATIO  => 20
	)
	Port map(
		CLOCK_IN     => internal_CLOCK_FPGA_LOGIC,
		D_IN         => i_dac_update,
		CLOCK_OUT    => internal_CLOCK_MPPC_DAC,
		D_OUT        => i_dac_update_extended
	);

end Behavioral;
