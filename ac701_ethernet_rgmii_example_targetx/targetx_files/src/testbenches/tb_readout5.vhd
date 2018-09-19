--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:13:44 02/13/2015
-- Design Name:   
-- Module Name:   C:/Users/isar/Documents/code4/TX9UMB-3/ise-project/tb_readout5.vhd
-- Project Name:  scrod-A4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ReadoutControl
-- 
-- Dependencies:
-- 


----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;
use work.readout_definitions.all;
    use work.tdc_pkg.all;
   use work.time_order_pkg.all;
    use work.conc_intfc_pkg.all;
    use work.klm_scrod_pkg.all;
--use work.asic_definitions_irs2_carrier_revA.all;
--use work.CarrierRevA_DAC_definitions.all;

entity tb_readout5 is
  generic(
    NUM_GTS                     : integer := 1;
	 -- uncomment one of these lines only to comiple with the given configuration
--	 HW_CONF						: string :="SA4_MBA_DCA_RB_I" --SCROD A4, MB A, TXDC A, RHIC B, with Interconnect board
--	 HW_CONF						: string :="SA4_MBSF_TX" --SCROD A4, MB SciFi, TX SificDC 
--	 HW_CONF						: string :="SA3_MBA_DCA_RB" 	 --SCROD A3, MB A, TXDC A, RHIC B
	 HW_CONF						: string :="SA4_MBB_DCA_RB" 	 --SCROD A4, MB B, TXDC A, RHIC B
	 
	 );
end tb_readout5;

architecture Behavioral of tb_readout5 is
--Pins going to top:
signal		BOARD_CLOCKP                :   STD_LOGIC;
signal		BOARD_CLOCKN                :   STD_LOGIC;
signal		LEDS                        :  STD_LOGIC_VECTOR(12 downto 0);
		------------------FTSW pins------------------
signal		RJ45_ACK_P                  :  std_logic;
signal		RJ45_ACK_N                  :  std_logic;			  
signal		RJ45_TRG_P                  :  std_logic;
signal		RJ45_TRG_N                  :  std_logic;			  			  
signal		RJ45_RSV_P                  :  std_logic;-- should be output 
signal		RJ45_RSV_N                  :  std_logic;
signal		RJ45_CLK_P                  :  std_logic;
signal		RJ45_CLK_N                  :  std_logic;
		---------Jumper for choosing FTSW clock------
	--	MONITOR_INPUT               : in  std_logic_vector(0 downto 0);- shoud go
		
	--------------------------------------
		----------SFP-------------------------
		--------------------------------------
signal	   mgttxfault                   :std_logic_vector(1 to NUM_GTS);
signal		mgtmod0                     :std_logic_vector(1 to NUM_GTS);
signal		mgtlos                      :std_logic_vector(1 to NUM_GTS);
signal		mgttxdis                    : std_logic_vector(1 to NUM_GTS);
signal		mgtmod2                     : std_logic_vector(1 to NUM_GTS);
signal		mgtmod1                     : std_logic_vector(1 to NUM_GTS);
signal		mgtrxp                      :std_logic;
signal		mgtrxn                      :std_logic;
signal		mgttxp                      : std_logic;
signal		mgttxn                      : std_logic;
signal		status_fake                 : std_logic;
signal		control_fake                : std_logic;
signal		mgtclk0p   				 	:std_logic; 
signal		mgtclk0n  				    :std_logic; 
signal		mgtclk1p                    :std_logic; 
signal		mgtclk1n                    :std_logic; 
	
	

		--MB Specific Signals
		
signal		EX_TRIGGER_MB					 :  std_logic;
signal		EX_TRIGGER_SCROD	   		 :  STD_LOGIC;
--		EX_TRIGGER2						 : out STD_LOGIC;
		
		--Global Bus Signals
		
		--ASIC related
		
		--BUS A Specific Signals
signal		BUS_REGCLR						 :  STD_LOGIC;
signal		BUSA_WR_ADDRCLR				 :  STD_LOGIC;
signal		BUSA_RD_ENA						 :  STD_LOGIC;
signal		BUSA_RD_ROWSEL_S				 :  STD_LOGIC_VECTOR(2 downto 0);
signal		BUSA_RD_COLSEL_S				 :  STD_LOGIC_VECTOR(5 downto 0);
signal		BUSA_CLR						 :  STD_LOGIC;
signal		BUSA_RAMP						 :  STD_LOGIC;
signal		BUSA_SAMPLESEL_S				 :  STD_LOGIC_VECTOR(4 downto 0);
signal		BUSA_SR_CLEAR					 :  STD_LOGIC;
signal		BUSA_SR_SEL						 :  STD_LOGIC;
signal		BUSA_DO							 : STD_LOGIC_VECTOR(15 downto 0);
		
		--Bus B Specific Signals
signal		BUSB_WR_ADDRCLR				 :  STD_LOGIC;
signal		BUSB_RD_ENA						 : STD_LOGIC;
signal		BUSB_RD_ROWSEL_S				 : STD_LOGIC_VECTOR(2 downto 0);
signal		BUSB_RD_COLSEL_S				 : STD_LOGIC_VECTOR(5 downto 0);
signal		BUSB_CLR						 :  STD_LOGIC;
signal		BUSB_RAMP						 : STD_LOGIC;
signal		BUSB_SAMPLESEL_S				 : STD_LOGIC_VECTOR(4 downto 0);
signal		BUSB_SR_CLEAR					 : STD_LOGIC;
signal		BUSB_SR_SEL						 : STD_LOGIC;
signal		BUSB_DO							 :  STD_LOGIC_VECTOR(15 downto 0);
		
		--ASIC DAC Update Signals
signal		SIN								 :  STD_LOGIC_VECTOR(9 downto 0);
signal		PCLK								 :  STD_LOGIC_VECTOR(9 downto 0);
signal		SHOUT						 	    :  STD_LOGIC_VECTOR(9 downto 0);--bring SCLOK up here
signal		SCLK								:  STD_LOGIC_VECTOR(9 downto 0);

		
		--Digitization and sampling Signals
signal		WL_CLK_N								:  STD_LOGIC_VECTOR(9 downto 0);
signal		WL_CLK_P								:  STD_LOGIC_VECTOR(9 downto 0);
signal		WR1_ENA								:  STD_LOGIC_VECTOR(9 downto 0);--move up
signal		WR2_ENA								:  STD_LOGIC_VECTOR(9 downto 0);

signal		SSTIN_N								 :  STD_LOGIC_VECTOR(9 downto 0);
signal		SSTIN_P								 :  STD_LOGIC_VECTOR(9 downto 0);		
		
		--Serial Readout Signals
signal		SR_CLOCK							 :  STD_LOGIC_VECTOR(9 downto 0);
signal		SAMPLESEL_ANY 					 :  STD_LOGIC_VECTOR(9 downto 0);
		
		-- HV DAC
signal		BUSA_SCK_DAC		          :  STD_LOGIC;
signal		BUSA_DIN_DAC		          :  STD_LOGIC;
signal		BUSB_SCK_DAC		          :  STD_LOGIC;
signal		BUSB_DIN_DAC		          :  STD_LOGIC;
	
		
		--TRIGGER SIGNALS
	--	TDC_TRG							 : tb_vec_type;
		
signal		TDC1_TRG							 : STD_LOGIC_VECTOR(4 downto 0);
signal		TDC2_TRG							 : STD_LOGIC_VECTOR(4 downto 0);
signal		TDC3_TRG							 : STD_LOGIC_VECTOR(4 downto 0);
signal		TDC4_TRG							 : STD_LOGIC_VECTOR(4 downto 0);
signal		TDC5_TRG							 : STD_LOGIC_VECTOR(4 downto 0);
signal		TDC6_TRG							 : STD_LOGIC_VECTOR(4 downto 0);
signal		TDC7_TRG							 : STD_LOGIC_VECTOR(4 downto 0);
signal		TDC8_TRG							 : STD_LOGIC_VECTOR(4 downto 0);
signal		TDC9_TRG							 : STD_LOGIC_VECTOR(4 downto 0);
signal		TDC10_TRG						 :  STD_LOGIC_VECTOR(4 downto 0);
		
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
signal		TDC_CS_DAC                  :  STD_LOGIC_VECTOR(9 downto 0);-- move it to close to SPI DACs
----		HV_DISABLE                  : out STD_LOGIC;
signal		TDC_AMUX_S                  :  STD_LOGIC_VECTOR(3 downto 0);--change to RHIC_ some better known name and maybe connect them together
signal		TOP_AMUX_S                  :  STD_LOGIC_VECTOR(3 downto 0);
		---------------------------------------------
		------------------USB pins-------------------
		---------------------------------------------
signal		USB_IFCLK                   : STD_LOGIC;
signal		USB_CTL0                    : STD_LOGIC;
signal		USB_CTL1                    : STD_LOGIC;
signal		USB_CTL2                    : STD_LOGIC;
signal		USB_FDD                     : STD_LOGIC_VECTOR(15 downto 0);
signal		USB_PA0                     : STD_LOGIC;
signal		USB_PA1                     : STD_LOGIC;
signal		USB_PA2                     : STD_LOGIC;
signal		USB_PA3                     : STD_LOGIC;
signal		USB_PA4                     : STD_LOGIC;
signal		USB_PA5                     : STD_LOGIC;
signal		USB_PA6                     : STD_LOGIC;
signal		USB_PA7                     : STD_LOGIC;
signal		USB_RDY0                    : STD_LOGIC;
signal		USB_RDY1                    : STD_LOGIC;
signal		USB_WAKEUP                  : STD_LOGIC;
signal		USB_CLKOUT		             :   STD_LOGIC;


		---- end of SciFi Related ports

		
		
		--New Stuff for TargetX:
		--RAM:
signal		RAM_A									:  STD_LOGIC_VECTOR(21 downto 0);-- RAM address line         
signal		RAM_IO								:  STD_LOGIC_VECTOR(7 downto 0);-- RAM IO data line     
signal		RAM_CE1n							 	:  STD_LOGIC := '1';                                         
signal		RAM_CE2							   :  STD_LOGIC := '0';                           
signal		RAM_OEn				            :  std_logic := '1';                       
signal		RAM_WEn				            :  std_logic := '1';                         
	            
	
		
signal		SCL_MON								 :  STD_LOGIC;
signal		SDA_MON								 :  STD_LOGIC;
signal		TDC_DONE							:  STD_LOGIC_VECTOR(9 downto 0);-- move to readout signals
signal		TDC_MON_TIMING						:  STD_LOGIC_VECTOR(9 downto 0);-- add the ref to the programming of the TX chip



   constant clk_period : time := 16 ns;


	signal internal_BOARD_CLOCK_OUT      : std_logic;
	signal internal_CLOCK_FPGA_LOGIC : std_logic;
	signal internal_CLOCK_MPPC_DAC  : std_logic;
	signal internal_CLOCK_ASIC_CTRL : std_logic;
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
	signal internal_WAVEFORM_FIFO_EMPTY          : std_logic := '1';
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
	signal internal_TXDCTRIG : tb_vec_type;-- All triger bits from all ASICs are here
	signal internal_TXDCTRIG16 : std_logic_vector(1 to TDC_NUM_CHAN);-- All triger bits from all ASICs are here
--	signal internal_TXDCTRIG_buf : tb_vec_type;-- All triger bits from all ASICs are here
--	signal internal_TXDCTRIG16_buf : std_logic_vector(1 to TDC_NUM_CHAN);-- All triger bits from all ASICs are here
	
	signal internal_SMP_EXTSYNC	: std_logic:='0';
	
	
	signal internal_TRIG_BRAM_WE	:	std_logic:='0';
	signal internal_TRIG_BRAM_WEA	:	std_logic_vector(0 downto 0):="0";
   signal internal_TRIG_BRAM_ADDR:	std_logic_vector(8 downto 0) :=(others=>'0');
   signal internal_TRIG_BRAM_DATA:	std_logic_vector(49 downto 0) :=(others=>'0');
	
	
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
	signal internal_CMDREG_PedSubCalcMode:std_logic_vector(3 downto 0);
	signal internal_PedCalcNiter: std_logic_vector(15 downto 0):=(others=>'0');
		
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
	signal internal_bram_rd_data		: STD_LOGIC_VECTOR(19 DOWNTO 0):=x"00000";
	signal internal_bram_rd_addr		: std_logic_vector(10 downto 0):="00000000000";
	signal internal_bram_addrb			: std_logic_vector(10 downto 0):="00000000000";
	signal internal_pedsub_bram_addr : std_logic_vector(10 downto 0):="00000000000";
	signal internal_pedcalc_bram_addr: std_logic_vector(10 downto 0):="00000000000";
	
	
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
------------------------------------------

----------Internal Trig_decision Logic:
	
signal internal_TRIGDEC_ax						:std_logic_vector(2 downto 0):="000";
signal internal_TRIGDEC_ay						:std_logic_vector(2 downto 0):="000";
signal internal_TRIGDEC_asic_enable_bits	:std_logic_vector(9 downto 0):="0000000000";
signal internal_CMDREG_USE_TRIGDEC			:std_logic:='0';	
signal internal_TRIGDEC_trig					:std_logic:='0';
signal internal_CMDREG_TRIGDEC_TRIGMASK	: std_logic_vector(14 downto 0):="000001111111111";


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

	
----------------dummy TX-----------
	signal fifo_wr_din_i:std_logic_vector(31 downto 0):=x"12345678";
	signal bit_no: integer:=0;
		  
signal sa_val_0: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_1: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_2: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_3: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_4: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_5: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_6: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_7: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_8: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_9: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_A: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_B: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_C: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_D: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_E: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_F: std_logic_vector(11 downto 0):="000000000000";
 signal sr_clk_i:std_logic_vector(1 downto 0):="00";
------------------------

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
	
COMPONENT txtrig_bram
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(49 DOWNTO 0);
    clkb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(49 DOWNTO 0)
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
	 
	
	COMPONENT WaveformPedsubDSP
	PORT(
		clk : IN std_logic;
		enable : IN std_logic;
		SMP_MAIN_CNT : IN std_logic_vector(8 downto 0);
		asic_no : IN std_logic_vector(3 downto 0);
		win_addr_start : IN std_logic_vector(8 downto 0);
		trigin : IN std_logic;
		busy					 : out std_logic; -- stays '1' until all pedsub samples have been sent out to the FIFO

		mode : IN std_logic_vector(1 downto 0);
		calc_mode : IN std_logic_vector(3 downto 0);
		fifo_en : IN std_logic;
		fifo_clk : IN std_logic;
		fifo_din : IN std_logic_vector(31 downto 0);
		bram_doutb		: in STD_LOGIC_VECTOR(11 DOWNTO 0);--:=x"000";
		bram_addrb	: out std_logic_vector(10 downto 0);--:="00000000000";		  
	 
	 dmx_allwin_done	:in std_logic;

		trig_bram_data : IN std_logic_vector(49 downto 0);
		ram_data : IN std_logic_vector(7 downto 0);
		ram_busy : IN std_logic;          
		pswfifo_en : OUT std_logic;
		pswfifo_clk : OUT std_logic;
		pswfifo_d : OUT std_logic_vector(31 downto 0);
		trig_bram_addr : OUT std_logic_vector(8 downto 0);
		ram_addr : OUT std_logic_vector(21 downto 0);
		ram_update : OUT std_logic
		);
	END COMPONENT;

COMPONENT WaveformPedcalcDSP
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		enable : IN std_logic;
		navg : IN std_logic_vector(3 downto 0);
		dmx_allwin_done	:in std_logic;

		SMP_MAIN_CNT : IN std_logic_vector(8 downto 0);
		asic_no : IN std_logic_vector(3 downto 0);
		win_addr_start : IN std_logic_vector(8 downto 0);
		trigin : IN std_logic;
		bram_doutb : IN std_logic_vector(19 downto 0);
		fifo_en : IN std_logic;
		fifo_clk : IN std_logic;
		fifo_din : IN std_logic_vector(31 downto 0);
		ram_busy : IN std_logic;          
		busy : OUT std_logic;
		niter : OUT std_logic_vector(15 downto 0);
		bram_addrb : OUT std_logic_vector(10 downto 0);
		ram_addr : OUT std_logic_vector(21 downto 0);
		ram_data : OUT std_logic_vector(7 downto 0);
		ram_update : OUT std_logic
		);
	END COMPONENT;

	COMPONENT TrigDecisionLogic
	PORT(
		clk :in std_logic;
		tb : IN tb_vec_type;
		tm : in std_logic_vector(15 downto 1);-- mask
		TrigOut : OUT std_logic;
		asicX : OUT std_logic_vector(2 downto 0);
		asicY : OUT std_logic_vector(2 downto 0)
		);
	END COMPONENT;

	COMPONENT PedestalManagement
	PORT(
		clk : IN std_logic;
		enable : IN std_logic;
		start : IN std_logic;
		win_len_start : IN std_logic_vector(15 downto 0);
		asic_en_mask : IN std_logic_vector(9 downto 0);
		ped_calc_busy : IN std_logic;
		dmx_allwin_done	: in std_logic;
		readout_busy : IN std_logic;          
		readout_trig : OUT std_logic;
		busy : OUT std_logic;
		stat : OUT std_logic_vector(31 downto 0);
		cur_win_no : OUT std_logic_vector(8 downto 0);
		cur_asic_en_bits : OUT std_logic_vector(9 downto 0);
	  ped_calc_enable	: out std_logic;
		readout_reset : OUT std_logic;
		readout_continue : OUT std_logic
		);
	END COMPONENT;

	
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
--	
	
-- extrigscrd_IBUF_inst : IBUF
--   generic map (
--      IBUF_LOW_PWR => FALSE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
--      IOSTANDARD => "DEFAULT")
--   port map (
--      O => internal_EX_TRIGGER_SCROD,     -- Buffer output
--      I => EX_TRIGGER_SCROD      -- Buffer input (connect directly to top-level port)
--   );
--	

--internal_TRIGGER_ALL <=internal_EX_TRIGGER_SCROD;

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
--	 
--	
	
--	asic_trig_GGEN: for I in 1 to 10 generate
--	internal_TRIGGER_ASIC(I-1) <= internal_TXDCTRIG16_buf(I) OR internal_TXDCTRIG_buf(I)(1) OR internal_TXDCTRIG_buf(I)(2) OR internal_TXDCTRIG_buf(I)(3) OR internal_TXDCTRIG_buf(I)(4);
--end generate;

	internal_TRIGGER_ASIC(0) <= TDC1_TRG(0) OR TDC1_TRG(1) OR TDC1_TRG(2) OR TDC1_TRG(3) OR TDC1_TRG(4);
	internal_TRIGGER_ASIC(1) <= TDC2_TRG(0) OR TDC2_TRG(1) OR TDC2_TRG(2) OR TDC2_TRG(3) OR TDC2_TRG(4);
	internal_TRIGGER_ASIC(2) <= TDC3_TRG(0) OR TDC3_TRG(1) OR TDC3_TRG(2) OR TDC3_TRG(3) OR TDC3_TRG(4);
	internal_TRIGGER_ASIC(3) <= TDC4_TRG(0) OR TDC4_TRG(1) OR TDC4_TRG(2) OR TDC4_TRG(3) OR TDC4_TRG(4);
	internal_TRIGGER_ASIC(4) <= TDC5_TRG(0) OR TDC5_TRG(1) OR TDC5_TRG(2) OR TDC5_TRG(3) OR TDC5_TRG(4);
	internal_TRIGGER_ASIC(5) <= TDC6_TRG(0) OR TDC6_TRG(1) OR TDC6_TRG(2) OR TDC6_TRG(3) OR TDC6_TRG(4);
	internal_TRIGGER_ASIC(6) <= TDC7_TRG(0) OR TDC7_TRG(1) OR TDC7_TRG(2) OR TDC7_TRG(3) OR TDC7_TRG(4);
	internal_TRIGGER_ASIC(7) <= TDC8_TRG(0) OR TDC8_TRG(1) OR TDC8_TRG(2) OR TDC8_TRG(3) OR TDC8_TRG(4);
	internal_TRIGGER_ASIC(8) <= TDC9_TRG(0) OR TDC9_TRG(1) OR TDC9_TRG(2) OR TDC9_TRG(3) OR TDC9_TRG(4);
	internal_TRIGGER_ASIC(9) <= TDC10_TRG(0) OR TDC10_TRG(1) OR TDC10_TRG(2) OR TDC10_TRG(3) OR TDC10_TRG(4);
	
	internal_TRIGGER_ALL <= internal_TRIGGER_ASIC(0) OR internal_TRIGGER_ASIC(1) or internal_TRIGGER_ASIC(2) OR
	internal_TRIGGER_ASIC(3) OR internal_TRIGGER_ASIC(4) OR internal_TRIGGER_ASIC(5) OR
	internal_TRIGGER_ASIC(6) OR internal_TRIGGER_ASIC(7) OR internal_TRIGGER_ASIC(8) OR
	internal_TRIGGER_ASIC(9);

--	internal_ASIC_TRIG<=internal_TRIGGER_ASIC(9) and internal_TRIGGER_ASIC_control_word(9) ;
--	internal_TRIGGER_ALL <=EX_TRIGGER2_MB or  (internal_TRIGGER_ASIC(0) --AND internal_TRIGGER_ASIC_control_word(0)

--	)
--	internal_ASIC_TRIG<=(internal_TRIGGER_ASIC(0) and internal_TRIGGER_ASIC_control_word(0) )
--		OR ( internal_TRIGGER_ASIC(1) AND internal_TRIGGER_ASIC_control_word(1)
--		)
--		OR ( internal_TRIGGER_ASIC(2) AND internal_TRIGGER_ASIC_control_word(2) 
--		)
--		OR ( internal_TRIGGER_ASIC(3) AND internal_TRIGGER_ASIC_control_word(3) 
--		)
--		OR ( internal_TRIGGER_ASIC(4) AND internal_TRIGGER_ASIC_control_word(4) 
--		)
--		OR ( internal_TRIGGER_ASIC(5) AND internal_TRIGGER_ASIC_control_word(5) 
--		)
--		OR ( internal_TRIGGER_ASIC(6) AND internal_TRIGGER_ASIC_control_word(6) 
--		)
--		OR ( internal_TRIGGER_ASIC(7) AND internal_TRIGGER_ASIC_control_word(7) 
--		)
--		OR ( internal_TRIGGER_ASIC(8) AND internal_TRIGGER_ASIC_control_word(8) 
--		)
--		OR ( internal_TRIGGER_ASIC(9) AND internal_TRIGGER_ASIC_control_word(9) 
--		);
--	


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
--  
--  end generate;

		  
internal_CLOCK_ASIC_CTRL<=internal_CLOCK_FPGA_LOGIC;
--internal_CLOCK_ASIC_CTRL_WILK<=internal_CLOCK_FPGA_LOGIC;

	--Interface to the DAQ devices



	--------------------------------------------------
	-------General registers interfaced to DAQ -------
	--------------------------------------------------

	--LEDS (no need for A4?)- it is on Interconnect Board
	LEDS(11 downto 4) <= internal_OUTPUT_REGISTERS(0)(11 downto 4);
	
	
--	ODDR2_inst : ODDR2
--   generic map(
--      DDR_ALIGNMENT => "NONE", -- Sets output alignment to "NONE", "C0", "C1" 
--      INIT => '0', -- Sets initial state of the Q output to '0' or '1'
--      SRTYPE => "SYNC") -- Specifies "SYNC" or "ASYNC" set/reset
--   port map (
--      Q => LEDS(3), -- 1-bit output data
--      C0 => internal_USB_FIFO_CLOCK, -- 1-bit clock input
--      C1 => not internal_USB_FIFO_CLOCK, -- 1-bit clock input
--      CE => '1',  -- 1-bit clock enable input
--      D0 => '1',   -- 1-bit data input (associated with C0)
--      D1 => '0',   -- 1-bit data input (associated with C1)
--      R => '0',    -- 1-bit reset input
--      S => '0'     -- 1-bit set input
--   )
--  
	
	
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
	internal_CMDREG_SAMPLIG_LOGIC_RESET_PARAMS <= internal_OUTPUT_REGISTERS(11);

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
	internal_WAVEFORM_FIFO_RST<=internal_OUTPUT_REGISTERS(38)(11);-- reset the waveform and buffer fifos
	internal_BUFFERCTRL_FIFO_RESET<=internal_OUTPUT_REGISTERS(38)(11);
	internal_CMDREG_PedSubCalcMode<=internal_OUTPUT_REGISTERS(38)(10 downto 7);	
	
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
--	gen_OUTREG_to_INREG: for i in 0 to N_GPR-1 generate
--		gen_BIT: for j in 0 to 15 generate
--			map_BUF_RR : BUF 
--			port map( 
--				I => internal_OUTPUT_REGISTERS(i)(j), 
--				O => internal_INPUT_REGISTERS(i)(j) 
--			);
--		end generate;
--	end generate;
	--- The register numbers must be updated for the following if N_GPR is changed.
--	internal_INPUT_REGISTERS(N_GPR + 0 ) <= "0000000" & internal_SMP_MAIN_CNT(8 downto 0 );
--	internal_INPUT_REGISTERS(N_GPR + 1 ) <= internal_WAVEFORM_FIFO_DATA_OUT(15 downto 0);
--	internal_INPUT_REGISTERS(N_GPR + 2 ) <= "000000000000000" & internal_WAVEFORM_FIFO_EMPTY;
--	internal_INPUT_REGISTERS(N_GPR + 3 ) <= "000000000000000" & internal_WAVEFORM_FIFO_DATA_VALID;
--	internal_INPUT_REGISTERS(N_GPR + 4 ) <= "0000000" & internal_READCTRL_DIG_RD_COLSEL & internal_READCTRL_DIG_RD_ROWSEL;
--	internal_INPUT_REGISTERS(N_GPR + 5 ) <= "0000000" & internal_READCTRL_LATCH_SMP_MAIN_CNT;
--	internal_INPUT_REGISTERS(N_GPR + 6 ) <= "0000000000" & internal_EVTBUILD_MAKE_READY & internal_EVTBUILD_DONE_SENDING_EVENT & internal_WAVEFORM_FIFO_EMPTY & internal_SROUT_IDLE_status 
--										& internal_DIG_IDLE_status & '0';
--   internal_INPUT_REGISTERS(N_GPR + 7 ) (9 downto 0) <= SHOUT(9 downto 0);
--   
--	internal_INPUT_REGISTERS(N_GPR + 10 ) <= internal_TRIGCOUNT_scaler(0)(15 downto 0);
--	internal_INPUT_REGISTERS(N_GPR + 11 ) <= internal_TRIGCOUNT_scaler(1)(15 downto 0);
--	internal_INPUT_REGISTERS(N_GPR + 12 ) <= internal_TRIGCOUNT_scaler(2)(15 downto 0);
--	internal_INPUT_REGISTERS(N_GPR + 13 ) <= internal_TRIGCOUNT_scaler(3)(15 downto 0);
--	internal_INPUT_REGISTERS(N_GPR + 14 ) <= internal_TRIGCOUNT_scaler(4)(15 downto 0);
--	internal_INPUT_REGISTERS(N_GPR + 15 ) <= internal_TRIGCOUNT_scaler(5)(15 downto 0);
--	internal_INPUT_REGISTERS(N_GPR + 16 ) <= internal_TRIGCOUNT_scaler(6)(15 downto 0);
--	internal_INPUT_REGISTERS(N_GPR + 17 ) <= internal_TRIGCOUNT_scaler(7)(15 downto 0);
--	internal_INPUT_REGISTERS(N_GPR + 18 ) <= internal_TRIGCOUNT_scaler(8)(15 downto 0);
--	internal_INPUT_REGISTERS(N_GPR + 19 ) <= internal_TRIGCOUNT_scaler(9)(15 downto 0);
--	internal_INPUT_REGISTERS(N_GPR + 20) <= x"002c"; -- ID of the board
--	internal_INPUT_REGISTERS(N_GPR + 40 ) <= internal_TRIGCOUNT_scaler(0)(31 downto 16);
--	internal_INPUT_REGISTERS(N_GPR + 41 ) <= internal_TRIGCOUNT_scaler(1)(31 downto 16);
--	internal_INPUT_REGISTERS(N_GPR + 42 ) <= internal_TRIGCOUNT_scaler(2)(31 downto 16);
--	internal_INPUT_REGISTERS(N_GPR + 43 ) <= internal_TRIGCOUNT_scaler(3)(31 downto 16);
--	internal_INPUT_REGISTERS(N_GPR + 44 ) <= internal_TRIGCOUNT_scaler(4)(31 downto 16);
--	internal_INPUT_REGISTERS(N_GPR + 45 ) <= internal_TRIGCOUNT_scaler(5)(31 downto 16);
--	internal_INPUT_REGISTERS(N_GPR + 46 ) <= internal_TRIGCOUNT_scaler(6)(31 downto 16);
--	internal_INPUT_REGISTERS(N_GPR + 47 ) <= internal_TRIGCOUNT_scaler(7)(31 downto 16);
--	internal_INPUT_REGISTERS(N_GPR + 48 ) <= internal_TRIGCOUNT_scaler(8)(31 downto 16);
--	internal_INPUT_REGISTERS(N_GPR + 49 ) <= internal_TRIGCOUNT_scaler(9)(31 downto 16);
----	
--	internal_INPUT_REGISTERS(N_GPR + 30) <= "0000000" & internal_READCTRL_dig_win_start; -- digitizatoin window start
--	internal_INPUT_REGISTERS(N_GPR + 31) <=internal_pswfifo_d(15 downto 0);--internal_INPUT_REGISTERS(31)
--	internal_INPUT_REGISTERS(N_GPR + 32) <=internal_TRIGCOUNT_scaler_main(15 downto 0);-- main trig count scaler
--	internal_INPUT_REGISTERS(N_GPR + 33) <=internal_PedCalcNiter;
--	
--	internal_INPUT_REGISTERS(N_GPR + 34) <="000000000000000" & internal_CMDREG_PedManBusy;
--
--	-- Status Regs:
--	gen_STAT_REG_INREG: for i in 0 to N_STAT_REG-1 generate
--		gen_BIT2: for j in 0 to 15 generate
--			map_BUF_RR2 : BUF 
--			port map( 
--				I => internal_STATREG_REGISTERS(i)(j), 
--				O => internal_INPUT_REGISTERS(N_GPR + i+50)(j) 
--			);
--		end generate;
--	end generate;
	
--	gen_STAT_REG_INREG: for i in 0 to N_STAT_REG-1 generate
--				internal_INPUT_REGISTERS(N_GPR + i+40)<=x"ABCD"; 
--	end generate;
--	--internal_INPUT_REGISTERS(N_GPR + 40) <= 

--status reg update module	
--	   uut: update_status_regs PORT MAP (
--          clk => internal_CLOCK_FPGA_LOGIC,
--          update => internal_CMDREG_UPDATE_STATUS_REGS,
--          status_regs => internal_STATREG_REGISTERS,
--          busy => open,
--          AMUX => internal_AMUX_S,
--          SDA_MON => SDA_MON,
--          SCL_MON => SCL_MON
--        );
--


	gen_wl_clk_to_asic : for i in 0 to 9 generate

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
--      S => '0'     -- 1-bit set inpu
--   )
  
  
--	wilk_OBUFDS_inst : OBUFDS
--   generic map (
--      --IOSTANDARD => "DEFAULT")
--		IOSTANDARD => "LVDS_25")
--
--   port map (
--      O => WL_CLK_P(i),    			-- Diff_p output (connect directly to top-level port)
--      OB => WL_CLK_N(i),   			-- Diff_n output (connect directly to top-level port)
--      I => internal_CLOCK_ASIC_CTRL_WILK (i)     	-- Buffer input 
--
--   );
	
	end generate;
		
	BUS_REGCLR <= '0';
--	BUSA_REGCLR <= '0';
--	BUSB_REGCLR <= '0';
--	BUSA_SCLK <= internal_DAC_CONTROL_SCLK;
--	BUSB_SCLK <= internal_DAC_CONTROL_SCLK;
	
		
	--Only specified DC gets serial data signals, uses bit mask
	gen_DAC_CONTROL: for i in 0 to 9 generate
		SIN(i)  <= internal_DAC_CONTROL_SIN  and internal_DAC_CONTROL_TDCNUM(i);
		PCLK(i) <= internal_DAC_CONTROL_PCLK and internal_DAC_CONTROL_TDCNUM(i);
		SCLK(i) <= internal_DAC_CONTROL_SCLK and internal_DAC_CONTROL_TDCNUM(i);
	end generate;

ped_manager: PedestalManagement PORT MAP(
		clk => internal_CLOCK_FPGA_LOGIC,
		enable => internal_CMDREG_PedCalcEnable,
		start => internal_CMDREG_PedCalcStart,
		win_len_start => internal_CMDREG_PedCalcWinLen,
		asic_en_mask => internal_CMDREG_PedCalcASICen,
		readout_trig => internal_PEDMAN_ReadoutTrig,
		ped_calc_busy => internal_PEDCALC_PedCalcBusy,
		dmx_allwin_done=>internal_SROUT_ALLWIN_DONE,
		readout_busy => internal_READCTRL_busy_status,
		busy => internal_CMDREG_PedManBusy,
		stat => open,
		cur_win_no => internal_PEDMAN_CurWin,
		cur_asic_en_bits => internal_PEDMAN_CurASICen,
		ped_calc_enable=>internal_PEDMAN_calc_peds_en,
		readout_reset => internal_PEDMAN_readout_reset,
		readout_continue => open
	);
	

	
	
	
	--Control the sampling, digitization and serial resout processes following trigger
	u_ReadoutControl: entity work.ReadoutControl PORT MAP(
		clk 					=> internal_CLOCK_FPGA_LOGIC,
		smp_clk 				=> internal_CLOCK_ASIC_CTRL,
		trigger 				=> internal_READCTRL_trigger,
		trig_delay 			=> internal_READCTRL_trig_delay,
		dig_offset 			=> internal_READCTRL_dig_offset,
		win_num_to_read 	=> internal_READCTRL_win_num_to_read,
		asic_enable_bits  => internal_READCTRL_asic_enable_bits,
		SMP_MAIN_CNT 		=> internal_SMP_MAIN_CNT,
		SMP_IDLE_status 	=> '0',
		DIG_IDLE_status 	=> internal_DIG_IDLE_status,
		SROUT_IDLE_status => internal_SROUT_IDLE_status,
		fifo_empty 			=> internal_WAVEFORM_FIFO_EMPTY,
		EVTBUILD_DONE_SENDING_EVENT => internal_EVTBUILD_DONE_SENDING_EVENT,
		LATCH_SMP_MAIN_CNT => internal_READCTRL_LATCH_SMP_MAIN_CNT,
		dig_win_start			=> internal_READCTRL_dig_win_start,
		LATCH_DONE 			=> internal_READCTRL_LATCH_DONE,
		READOUT_RESET 		=> internal_READCTRL_readout_reset,
		READOUT_CONTINUE 	=> internal_READCTRL_readout_continue,
		RESET_EVENT_NUM 	=> internal_READCTRL_RESET_EVENT_NUM,
		use_fixed_dig_start_win=>internal_READCTRL_use_fixed_dig_start_win,
		ASIC_NUM 			=> internal_READCTRL_ASIC_NUM,
		busy_status 		=> internal_READCTRL_busy_status,
		smp_stop 			=> internal_READCTRL_smp_stop,
		dig_start 			=> internal_READCTRL_dig_start,
		DIG_RD_ROWSEL_S 	=> internal_READCTRL_DIG_RD_ROWSEL,
		DIG_RD_COLSEL_S 	=> internal_READCTRL_DIG_RD_COLSEL,
		srout_start 		=> internal_READCTRL_srout_start,
	   srout_restart 		=> internal_READCTRL_srout_restart,
		ped_sub_start		=> internal_PEDSUB_start,
		ped_sub_busy		=> internal_PEDSUB_busy and internal_PedSubEnable,
		EVTBUILD_start 	=> open,
		EVTBUILD_MAKE_READY => open,
		EVENT_NUM 			=> internal_READCTRL_EVENT_NUM,
		READOUT_DONE 		=> internal_READCTRL_READOUT_DONE
	);
	internal_SOFTWARE_TRIGGER_VETO <= internal_CMDREG_SOFTWARE_TRIGGER_VETO;
	internal_HARDWARE_TRIGGER_ENABLE <= internal_CMDREG_HARDWARE_TRIGGER_ENABLE;
	internal_SOFTWARE_TRIGGER <= internal_CMDREG_SOFTWARE_trigger;-- AND NOT internal_SOFTWARE_TRIGGER_VETO;
	internal_HARDWARE_TRIGGER <= internal_TRIGGER_ALL AND internal_HARDWARE_TRIGGER_ENABLE;
--	internal_READCTRL_trigger <= (internal_SOFTWARE_TRIGGER OR internal_HARDWARE_TRIGGER or internal_ASIC_TRIG) when internal_CMDREG_USE_TRIGDEC='0' else internal_TRIGDEC_trig;
	internal_READCTRL_trigger <= (internal_SOFTWARE_TRIGGER OR internal_HARDWARE_TRIGGER or internal_ASIC_TRIG) when internal_CMDREG_USE_TRIGDEC='0' and internal_CMDREG_PedCalcEnable='0' else
											internal_TRIGDEC_trig 																			when internal_CMDREG_USE_TRIGDEC='1' and internal_CMDREG_PedCalcEnable='0' else
											internal_PEDMAN_ReadoutTrig;
											
	--internal_READCTRL_trigger <= internal_SOFTWARE_TRIGGER;
	internal_READCTRL_trig_delay <= internal_CMDREG_READCTRL_trig_delay;
	internal_READCTRL_dig_offset <= internal_CMDREG_READCTRL_dig_offset;
	internal_READCTRL_win_num_to_read <= internal_CMDREG_READCTRL_win_num_to_read;
	internal_READCTRL_asic_enable_bits <= internal_CMDREG_READCTRL_asic_enable_bits when internal_CMDREG_USE_TRIGDEC='0' and internal_CMDREG_PedCalcEnable='0' else
													  internal_TRIGDEC_asic_enable_bits			  when internal_CMDREG_USE_TRIGDEC='1' and internal_CMDREG_PedCalcEnable='0' else
													  internal_PEDMAN_CurASICen;
	
	
	internal_READCTRL_use_fixed_dig_start_win<= internal_CMDREG_READCTRL_use_fixed_dig_start_win when internal_CMDREG_PedCalcEnable='0' else
																"1000000" & internal_PEDMAN_CurWin;
	
	internal_READCTRL_readout_reset <= internal_CMDREG_READCTRL_readout_reset when internal_CMDREG_PedCalcEnable='0' else internal_PEDMAN_readout_reset ;
	internal_READCTRL_RESET_EVENT_NUM <= internal_CMDREG_READCTRL_RESET_EVENT_NUM;
	
	i_TrigDecisionLogic: TrigDecisionLogic PORT MAP(
		clk=>internal_CLOCK_FPGA_LOGIC,
		tb => internal_TXDCTRIG,
		tm =>internal_CMDREG_TRIGDEC_TRIGMASK,
		TrigOut => internal_TRIGDEC_trig,
		asicX => internal_TRIGDEC_ax,
		asicY => internal_TRIGDEC_ay
	);
	

		
	internal_TRIGDEC_asic_enable_bits(4 downto 0)<= "00000" when (internal_TRIGDEC_ax="000") else
																	"00001" when (internal_TRIGDEC_ax="001") else
																	"00010" when (internal_TRIGDEC_ax="010") else
																	"00100" when (internal_TRIGDEC_ax="011") else
																	"01000" when (internal_TRIGDEC_ax="100") else
																	"10000" when (internal_TRIGDEC_ax="101") else
																	"00000";
	
	internal_TRIGDEC_asic_enable_bits(9 downto 5)<= "00000" when (internal_TRIGDEC_ay="000") else
																	"00001" when (internal_TRIGDEC_ay="001") else
																	"00010" when (internal_TRIGDEC_ay="010") else
																	"00100" when (internal_TRIGDEC_ay="011") else
																	"01000" when (internal_TRIGDEC_ay="100") else
																	"10000" when (internal_TRIGDEC_ay="101") else
																	"00000";
	
	--LEDS(0)<=internal_TRIGGER_ALL;-- scope probe here
	LEDS(1)<=internal_READCTRL_trigger;
	internal_SMP_EXTSYNC<= '1' when internal_SMP_MAIN_CNT="000000000" else
								  '1' when internal_SMP_MAIN_CNT="000000001" else
								  '1' when internal_SMP_MAIN_CNT="000000010" else
								  '1' when internal_SMP_MAIN_CNT="000000011" else
								  '1' when internal_SMP_MAIN_CNT="000000100" else
								  '1' when internal_SMP_MAIN_CNT="000000101" else
								  '0' ;
								  
	EX_TRIGGER_SCROD<= internal_SMP_EXTSYNC;--(not internal_SMP_MAIN_CNT(0)) and (not internal_SMP_MAIN_CNT(1)) and (not internal_SMP_MAIN_CNT(2)) and (not internal_SMP_MAIN_CNT(3)) and (not internal_SMP_MAIN_CNT(4))
--				and (not internal_SMP_MAIN_CNT(5)) and (not internal_SMP_MAIN_CNT(6)) and (not internal_SMP_MAIN_CNT(7)) and (not internal_SMP_MAIN_CNT(8)); -- pulse goes up at window=511
	LEDS(0)<=internal_TRIGDEC_trig;--'0';-- this is for generating a temporary GDL L1 trigger
	LEDS(12)<=internal_SMP_MAIN_CNT(0);
	LEDS(2)<=internal_SMP_EXTSYNC;--(not internal_SMP_MAIN_CNT(0)) and (not internal_SMP_MAIN_CNT(1)) and (not internal_SMP_MAIN_CNT(2)) and (not internal_SMP_MAIN_CNT(3)) and (not internal_SMP_MAIN_CNT(4))
--				and (not internal_SMP_MAIN_CNT(5)) and (not internal_SMP_MAIN_CNT(6)) and (not internal_SMP_MAIN_CNT(7)) and (not internal_SMP_MAIN_CNT(8));

	--LEDS(12)<=internal_EX_TRIGGER_SCROD or internal_TRIGGER_ALL or internal_READCTRL_trigger or internal_SMP_MAIN_CNT(4);
	--demux and ped sub logic:
	
	 u_wavepedsub: WaveformPedsubDSP PORT MAP (
          clk => internal_CLOCK_FPGA_LOGIC,
			 enable=>internal_PedSubEnable,
			 SMP_MAIN_CNT => internal_SMP_MAIN_CNT,
          asic_no => internal_READCTRL_ASIC_NUM,
          win_addr_start => internal_READCTRL_dig_win_start,--internal_READCTRL_DIG_RD_COLSEL & internal_READCTRL_DIG_RD_ROWSEL,
          trigin => internal_PEDSUB_start,--internal_READCTRL_LATCH_DONE,--srout_start,
			 busy=> internal_PEDSUB_busy,
			 mode=>internal_CMDREG_PedDemuxFifoOutputSelect,
			calc_mode => internal_CMDREG_PedSubCalcMode,

			fifo_en 	=> internal_SROUT_FIFO_WR_EN,
			fifo_clk => internal_SROUT_FIFO_WR_CLK,
			fifo_din => internal_SROUT_FIFO_DATA_OUT,

			pswfifo_d =>internal_pswfifo_d,--internal_INPUT_REGISTERS(31)
			pswfifo_clk =>internal_pswfifo_clk,
			pswfifo_en=>internal_pswfifo_en,

		  trig_bram_addr => internal_trig_bram_addr,
		  trig_bram_data => internal_trig_bram_data,
			bram_doutb=>internal_bram_rd_data(11 downto 0),
			bram_addrb	=>internal_pedsub_bram_addr,

		  dmx_allwin_done=>internal_SROUT_ALLWIN_DONE,
		  
          ram_addr => internal_ram_Ain(2),
          ram_data => internal_ram_DRout(2),
          ram_update => internal_ram_update(2),
          ram_busy => internal_ram_busy(2)

        );
	
	
		internal_ram_rw(2)<='0';-- always reading from this channel
		internal_PedSubEnable<='0' when  internal_CMDREG_PedDemuxFifoOutputSelect="00" else '1';
--	
	u_WaveformPedcalcDSP: WaveformPedcalcDSP PORT MAP(
		clk => internal_CLOCK_FPGA_LOGIC,
		reset => internal_CMDREG_PedCalcReset,
		enable => internal_PEDMAN_calc_peds_en,--internal_CMDREG_PedCalcEnable,
		navg => internal_CMDREG_PedCalcNAVG,
		SMP_MAIN_CNT=> internal_SMP_MAIN_CNT,
		busy=>internal_PEDCALC_PedCalcBusy,
		niter=>	 internal_PedCalcNiter,
		  dmx_allwin_done=>internal_SROUT_ALLWIN_DONE,

		asic_no => internal_READCTRL_ASIC_NUM,
		win_addr_start =>internal_READCTRL_dig_win_start,--internal_READCTRL_DIG_RD_COLSEL & internal_READCTRL_DIG_RD_ROWSEL,
		trigin => internal_PEDSUB_start,
		fifo_en => internal_SROUT_FIFO_WR_EN ,
		fifo_clk => internal_SROUT_FIFO_WR_CLK,
		fifo_din => internal_SROUT_FIFO_DATA_OUT,

		bram_doutb=>internal_bram_rd_data,
		bram_addrb	=>internal_pedcalc_bram_addr,
		
		ram_addr => internal_ram_Ain(3),
		ram_data => internal_ram_DWin(3),
		ram_update => internal_ram_update(3),
		ram_busy => internal_ram_busy(3)
	);
		
		internal_ram_rw(3)<='1';-- always write to this channel	
	
	internal_TRIG_BRAM_WEA(0) <= internal_TRIG_BRAM_WE and internal_WR_ENA;

--u_txtrg_bram: txtrig_bram
--  PORT MAP (
--    clka => internal_CLOCK_ASIC_CTRL,
--    wea => internal_TRIG_BRAM_WEA,
--    addra => internal_SMP_MAIN_CNT,
--    dina => internal_TXDCTRIG(10) & internal_TXDCTRIG(9) & internal_TXDCTRIG(8) & internal_TXDCTRIG(7) & internal_TXDCTRIG(6)
--	       & internal_TXDCTRIG(5) & internal_TXDCTRIG(4) & internal_TXDCTRIG(3) & internal_TXDCTRIG(2) & internal_TXDCTRIG(1),
--    clkb => internal_CLOCK_ASIC_CTRL,
--    addrb => internal_TRIG_BRAM_ADDR,
--    doutb => internal_TRIG_BRAM_DATA
--  );	
--
	--sampling logic - specifically SSPIN/SSTIN + write address control
	u_SamplingLgc : entity work.SamplingLgc
   Port map (
		clk 			=> internal_CLOCK_ASIC_CTRL,
		reset => internal_CMDREG_RESET_SAMPLIG_LOGIC,
		cfg => internal_CMDREG_SAMPLIG_LOGIC_RESET_PARAMS,
		dig_win_start => internal_READCTRL_dig_win_start,
		dig_win_n => internal_READCTRL_win_num_to_read,-- "00100",
      dig_win_ena => not internal_DIG_IDLE_status,--internal_READCTRL_busy_status,
		trigram_wea=>internal_TRIG_BRAM_WE,
		MAIN_CNT_out => internal_SMP_MAIN_CNT,
		sstin_out 	=> internal_SSTIN,-- GV: 6/9/14 we do not want to shut down this part of the chip!
		wr_addrclr_out => internal_WR_ADDRCLR,
		wr1_ena 	=> open,--internal_WR_ENA,
		wr2_ena 	=> open
	);
	
--internal_WR_ENA<= not internal_DIG_IDLE_status;--internal_READCTRL_trigger;-- debug
--internal_WR_ENA<=  internal_READCTRL_READOUT_DONE;--internal_READCTRL_busy;-- debug
internal_WR_ENA<=  not internal_READCTRL_busy_status;-- debug

	BUSA_WR_ADDRCLR 	<= internal_WR_ADDRCLR;
	BUSB_WR_ADDRCLR 	<= internal_WR_ADDRCLR;	

		
--create_ded_wr_addrclr: if (HW_CONF="SA4_MBSF_TX") generate
--	BUSB_DED_WR_ADDRCLR(0)<= internal_WR_ADDRCLR;
--	BUSB_DED_WR_ADDRCLR(1)<= internal_WR_ADDRCLR;
--	BUSB_DED_WR_ADDRCLR(2)<= internal_WR_ADDRCLR;
--	BUSB_DED_WR_ADDRCLR(3)<= internal_WR_ADDRCLR;
--	BUSB_DED_WR_ADDRCLR(4)<= internal_WR_ADDRCLR;
--	BUSA_DED_WR_ADDRCLR(0)<= internal_WR_ADDRCLR;
--	BUSA_DED_WR_ADDRCLR(1)<= internal_WR_ADDRCLR;
--	BUSA_DED_WR_ADDRCLR(2)<= internal_WR_ADDRCLR;
--	BUSA_DED_WR_ADDRCLR(3)<= internal_WR_ADDRCLR;
--	BUSA_DED_WR_ADDRCLR(4)<= internal_WR_ADDRCLR;
--	end generate;
	
	--SamplingLgc signals just get fanned out identically to each daughter card
	gen_SamplingLgcSignals : for i in 0 to 9 generate
		WR1_ENA(i) 		<= internal_WR_ENA;
		WR2_ENA(i) 		<= internal_WR_ENA;
	end generate;

--gen_sstin : for i in 0 to 9 generate
-- OBUFDS_inst : OBUFDS
--   generic map (
-- --     IOSTANDARD => "DEFAULT")
--		IOSTANDARD => "LVDS_25")
--   port map (
--      O => SSTIN_P(i),    			-- Diff_p output (connect directly to top-level port)
--      OB => SSTIN_N(i),   			-- Diff_n output (connect directly to top-level port)
--      I => internal_SSTIN      	-- Buffer input 
--   );
--end generate;

	--digitizing logic
	u_DigitizingLgc: entity work.DigitizingLgcTX PORT MAP(
		clk 				=> internal_CLOCK_FPGA_LOGIC,
		IDLE_status 	=> internal_DIG_IDLE_status,
		StartDig 		=> internal_DIG_STARTDIG,
		ramp_length 	=> internal_CMDREG_READCTRL_ramp_length(12 downto 0),
		rd_ena 			=> internal_DIG_RD_ENA,
		clr 				=> internal_DIG_CLR,
		startramp 		=> internal_DIG_RAMP
	);
	internal_DIG_STARTDIG 	<= internal_READCTRL_dig_start;
	
	--BUSA and BUSB Digitzation signals are identical
	BUSA_RD_ENA			<= internal_DIG_RD_ENA;
	BUSA_RD_ROWSEL_S 	<= internal_READCTRL_DIG_RD_ROWSEL;
	
	BUSA_RD_COLSEL_S 	<= internal_READCTRL_DIG_RD_COLSEL; 
	
	BUSA_CLR 			<= internal_DIG_CLR and not internal_CMDREG_SROUT_TPG;
	BUSA_RAMP 			<= internal_DIG_RAMP;
	BUSB_RD_ENA			<= internal_DIG_RD_ENA;
	BUSB_RD_ROWSEL_S 	<= internal_READCTRL_DIG_RD_ROWSEL;
	BUSB_RD_COLSEL_S 	<= internal_READCTRL_DIG_RD_COLSEL;
	BUSB_CLR 			<= internal_DIG_CLR and not internal_CMDREG_SROUT_TPG;
	BUSB_RAMP 			<= internal_DIG_RAMP;	


internal_bram_rd_addr<=internal_pedsub_bram_addr when internal_CMDREG_PedCalcEnable='0' else internal_pedcalc_bram_addr;
	
	u_SerialDataRoutDemux: entity work.SerialDataRoutDemux PORT MAP(
		clk 			=> internal_CLOCK_FPGA_LOGIC,
		start		 	=> internal_SROUT_START,
		restart		=> internal_READCTRL_srout_restart,
		calc_peds_en	=>	internal_PEDMAN_calc_peds_en,--internal_CMDREG_PedCalcEnable
		navg => internal_CMDREG_PedCalcNAVG,
		EVENT_NUM 	=> internal_READCTRL_EVENT_NUM,
		WIN_ADDR 	=> internal_READCTRL_DIG_RD_COLSEL & internal_READCTRL_DIG_RD_ROWSEL,
		ASIC_NUM 	=> internal_READCTRL_ASIC_NUM,
		force_test_pattern =>internal_CMDREG_SROUT_TPG,
		
		IDLE_status => internal_SROUT_IDLE_status,
		busy 			=> open,
		samp_done 	=> open,
		dout 			=> internal_SROUT_dout,
		sr_clr 		=> internal_SROUT_SR_CLR,
		sr_clk 		=> internal_SROUT_SR_CLK,
		sr_sel 		=> internal_SROUT_SR_SEL,
		samplesel 	=> internal_SROUT_SAMPLESEL,
		smplsi_any 	=> internal_SROUT_SAMPLESEL_ANY,
		dmx_allwin_done=>internal_SROUT_ALLWIN_DONE,
      
		srout_bram_dout => internal_bram_rd_data,
		srout_bram_addr => internal_bram_rd_addr,

		fifo_wr_en 	=> internal_SROUT_FIFO_WR_EN,
		fifo_wr_clk => internal_SROUT_FIFO_WR_CLK,
		fifo_wr_din => internal_SROUT_FIFO_DATA_OUT


	);
--	internal_ram_rw(2)<='0'; --only reading from this channel of RAM	
	internal_SROUT_START <= internal_READCTRL_srout_start;

	
	--make serial readout bus signals identical
	BUSA_SAMPLESEL_S 	<= internal_SROUT_SAMPLESEL;
	BUSB_SAMPLESEL_S 	<= internal_SROUT_SAMPLESEL;
	BUSA_SR_SEL <= internal_SROUT_SR_SEL;
	BUSB_SR_SEL <= internal_SROUT_SR_SEL;
	BUSA_SR_CLEAR<= internal_SROUT_SR_CLR;
	BUSB_SR_CLEAR<= internal_SROUT_SR_CLR;
	
	--Serial readout DO signal switches between buses based on internal_READCTRL_ASIC_NUM signal
	internal_SROUT_dout <= BUSA_DO when (internal_READCTRL_ASIC_NUM < x"6") else
								BUSB_DO;
	
	--multiplex DC specific serial readout signal to ASIC specified by internal_READCTRL_ASIC_NUM signal
	internal_SROUT_ASIC_CONTROL_WORD 		<= "0000000001" when (internal_READCTRL_ASIC_NUM = x"1") else
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
	
	--Only specified DC gets serial data signals, uses bit mask
	gen_SAMPLESEL_ANY_CONTROL: for i in 0 to 9 generate
		SR_CLOCK(i)			<= internal_SROUT_SR_CLK			and internal_SROUT_ASIC_CONTROL_WORD(i);
		SAMPLESEL_ANY(i) 	<= internal_SROUT_SAMPLESEL_ANY 	and internal_SROUT_ASIC_CONTROL_WORD(i);
	end generate;
	
	--FIFO receives waveform samples produced by serial readout process
--   u_waveform_fifo_wr32_rd32 : waveform_fifo_wr32_rd32
--   PORT MAP (
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

	internal_SROUT_FIFO_WR_CLK_waveformfifo<= internal_SROUT_FIFO_WR_CLK ;--when internal_CMDREG_PedDemuxFifoOutputSelect="00" else internal_pswfifo_clk;
	internal_SROUT_FIFO_WR_EN_waveformfifo <= internal_SROUT_FIFO_WR_EN when internal_CMDREG_PedDemuxFifoOutputSelect="00" else internal_pswfifo_en;
	internal_SROUT_FIFO_DATA_OUT_waveformfifo<= internal_SROUT_FIFO_DATA_OUT when internal_CMDREG_PedDemuxFifoOutputSelect="00" else internal_pswfifo_d;
	
	
	
	
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
	internal_READCTRL_readout_continue <= internal_CMDREG_READCTRL_readout_continue;
	
	--Buffer FIFO, contains up to 512 32-bit words (will not lead to USB packet drops)
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
	--internal_EVTBUILD_MAKE_READY <= internal_CMDREG_EVTBUILD_MAKE_READY






	BUSA_SCK_DAC <= i_hv_sck_dac;
	BUSB_SCK_DAC <= i_hv_sck_dac;
	BUSA_DIN_DAC <= i_hv_din_dac;
	BUSB_DIN_DAC <= i_hv_din_dac;

--	inst_pulse_extent : entity work.pulse_transition
--	Generic map(
--		CLOCK_RATIO  => 20
--	)
--	Port map(
--		CLOCK_IN     => internal_CLOCK_FPGA_LOGIC,
--		D_IN         => i_dac_update,
--		CLOCK_OUT    => internal_CLOCK_MPPC_DAC,
--		D_OUT        => i_dac_update_extended
--	);

 clk_process :process
   begin
		internal_CLOCK_FPGA_LOGIC <= '0';
		wait for clk_period/2;
		internal_CLOCK_FPGA_LOGIC <= '1';
		wait for clk_period/2;
   end process;
	
	
	
	TXdummy: process (internal_CLOCK_FPGA_LOGIC)
  begin
 
  if (rising_edge(internal_CLOCK_FPGA_LOGIC)) then
  
  sr_clk_i(1)<=sr_clk_i(0);
  sr_clk_i(0)<=internal_SROUT_SR_CLK;
  
  if (internal_SROUT_FIFO_DATA_OUT(31 downto 20)=x"ABC") then
	  bit_no<=0;
	  fifo_wr_din_i<=internal_SROUT_FIFO_DATA_OUT;--the first is x"ABC"!
  
  
  end if;
	
	if (sr_clk_i="01" ) then -- reset bit number 
	
	if (internal_SROUT_SR_SEL='1') then
	bit_no<=0;
	  else 
	bit_no<=bit_no+1;

	 end if;

	
	 end if;
	 
--	  sa_no<=fifo_wr_din(4 downto 0);
--	  win_no<=fifo_wr_din(18 downto 10);
--	  win_no<=fifo_wr_din(12 downto 10);-- only reflect 3 lower bits of the window numbner for now
	  sa_val_0 <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"0";
	  sa_val_1 <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"1";
	  sa_val_2 <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"2";
	  sa_val_3 <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"3";
	  sa_val_4 <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"4";
	  sa_val_5 <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"5";
	  sa_val_6 <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"6";
	  sa_val_7 <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"7";
	  sa_val_8 <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"8";
	  sa_val_9 <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"9";
	  sa_val_A <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"A";
	  sa_val_B <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"B";
	  sa_val_C <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"C";
	  sa_val_D <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"D";
	  sa_val_E <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"E";
	  sa_val_F <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"F";
	  

	
	if (sr_clk_i="01") then
--	bit_no<=bit_no+1;
	internal_SROUT_dout(0 )<=sa_val_0(bit_no);
	internal_SROUT_dout(1 )<=sa_val_1(bit_no);
	internal_SROUT_dout(2 )<=sa_val_2(bit_no);
	internal_SROUT_dout(3 )<=sa_val_3(bit_no);
	internal_SROUT_dout(4 )<=sa_val_4(bit_no);
	internal_SROUT_dout(5 )<=sa_val_5(bit_no);
	internal_SROUT_dout(6 )<=sa_val_6(bit_no);
	internal_SROUT_dout(7 )<=sa_val_7(bit_no);
	internal_SROUT_dout(8 )<=sa_val_8(bit_no);
	internal_SROUT_dout(9 )<=sa_val_9(bit_no);
	internal_SROUT_dout(10)<=sa_val_A(bit_no);
	internal_SROUT_dout(11)<=sa_val_B(bit_no);
	internal_SROUT_dout(12)<=sa_val_C(bit_no);
	internal_SROUT_dout(13)<=sa_val_D(bit_no);
	internal_SROUT_dout(14)<=sa_val_E(bit_no);
	internal_SROUT_dout(15)<=sa_val_F(bit_no);
	end if;
	
		
	
	--end if;

 end if;

 
 
 end process;
 
	
	
	   stim_proc: process
   begin		

      wait for clk_period*10;	
--		internal_pedcalc_bram_addr<="00000000000";
--		internal_pedsub_bram_addr<="00000000000";

      wait for clk_period*10;	
		
	internal_OUTPUT_REGISTERS(20)(0)<='0';wait for clk_period*10;
	internal_OUTPUT_REGISTERS(30)(0)<='0';wait for clk_period*10;
	internal_OUTPUT_REGISTERS(31)(0)<='0';wait for clk_period*10;
	internal_OUTPUT_REGISTERS(50)(0)<='0';wait for clk_period*10;
	internal_OUTPUT_REGISTERS(44)(0)<='0';wait for clk_period*10;
	internal_OUTPUT_REGISTERS(45)(0)<='1';wait for clk_period*10;
	internal_OUTPUT_REGISTERS(45)(0)<='0';wait for clk_period*10;
	
	internal_OUTPUT_REGISTERS(51)<=x"0004";wait for clk_period*10;
	internal_OUTPUT_REGISTERS(52)(0)<='0';wait for clk_period*10;
	internal_OUTPUT_REGISTERS(53)(0)<='0';wait for clk_period*10;
	internal_OUTPUT_REGISTERS(54)<=x"0000";wait for clk_period*10;
	internal_OUTPUT_REGISTERS(55)(0)<='1';wait for clk_period*10;
	internal_OUTPUT_REGISTERS(55)(0)<='0';wait for clk_period*10;
	internal_OUTPUT_REGISTERS(56)(0)<='1';wait for clk_period*10;
	internal_OUTPUT_REGISTERS(57)<=x"0004";wait for clk_period*10;
	internal_OUTPUT_REGISTERS(58)(0)<='0';wait for clk_period*10;
	internal_OUTPUT_REGISTERS(72)<=x"03FF";wait for clk_period*10;
	internal_OUTPUT_REGISTERS(61)<=x"0F00";wait for clk_period*10;
	
	internal_OUTPUT_REGISTERS(38)<=x"0000";wait for clk_period*10;
	internal_OUTPUT_REGISTERS(38)<="0000100000000000";wait for clk_period*10;
	internal_OUTPUT_REGISTERS(38)<="0000000000000000";wait for clk_period*10;
	internal_OUTPUT_REGISTERS(38)<="0011000010000000";wait for clk_period*10;
	internal_OUTPUT_REGISTERS(39)<="0000000000000000";wait for clk_period*10;

	internal_OUTPUT_REGISTERS(62)<=x"8010";wait for clk_period*10;

	internal_OUTPUT_REGISTERS(11)<="1000000000000001";wait for clk_period*10;

	internal_OUTPUT_REGISTERS(10)(0)<='0';wait for clk_period*10;--reset sampling logic
	internal_OUTPUT_REGISTERS(10)(0)<='1';wait for clk_period*10;
	internal_OUTPUT_REGISTERS(10)(0)<='0';wait for clk_period*10;



	wait for 20 us;
	--send one SW trigger: 
	internal_OUTPUT_REGISTERS(50)(0)<='0';wait for clk_period*10;
	internal_OUTPUT_REGISTERS(52)(0)<='0';wait for clk_period*10;
	internal_OUTPUT_REGISTERS(55)(0)<='1';wait for clk_period*10;
	internal_OUTPUT_REGISTERS(55)(0)<='0';wait for clk_period*10;
	internal_OUTPUT_REGISTERS(50)(0)<='1';wait for clk_period*10;	
	wait for 5 us;
	internal_OUTPUT_REGISTERS(50)(0)<='0';
	
	
	
		wait for 5000 us;

	
		
		
		
		
--      wait for clk_period*25000;
--		--poke at the shared RAM to see if it can manage
--		internal_ram_Ain (1)<="10" & x"DCBA0";
--		internal_ram_DWin(1)<=x"D0";
--		internal_ram_rw(1)<='1';
--		internal_ram_update(1)<='0';
--
--		internal_ram_Ain (2)<="10" & x"DCBA1";
--		--internal_ram_DWin(2)<=x"D0";
--		internal_ram_rw(2)<='1';
--		internal_ram_update(2)<='0';
--
--		wait for clk_period*2;
--		internal_ram_update(1)<='1';
--		internal_ram_update(2)<='1';
--		wait for clk_period*2;
--		internal_ram_update(1)<='0';
--		internal_ram_update(2)<='0';
--
--		wait for clk_period*20;
--		internal_ram_update(1)<='1';
--		wait for clk_period*20;
--		internal_ram_update(1)<='0';
--		
--	

      wait;
   end process;
	
	
	
	
	
end Behavioral;

