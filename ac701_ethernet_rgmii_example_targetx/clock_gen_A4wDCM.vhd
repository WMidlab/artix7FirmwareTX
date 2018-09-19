----------------------------------------------------------------------------------
-- 2014-08-29: IM: New clock generation for the SCROD Rev A3 and A4 to be used in the KLM FW
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;
--use work.asic_definitions_irs2_carrier_revA.all;

entity clock_gen is
   generic(
			USE_LOCAL_CLOCK   : std_logic :='0';
	 -- uncomment one of these lines only to comiple with the given configuration
--	 HW_CONF						: string:="ee"-- :="SA4_MBA_DCA_RB_I", --SCROD A4, MB A, TXDC A, RHIC B, with Interconnect board
--	 HW_CONF						: string :="SA3_MBA_DCA_RB" 	 --SCROD A3, MB A, TXDC A, RHIC B
	 HW_CONF						: string :="SA4_MBB_DCA_RB" 	 --SCROD A4, MB B, TXDC A, RHIC B
	 );
	Port ( 
		--Raw boad clock input
		BOARD_CLOCKP      : in  STD_LOGIC;
		BOARD_CLOCKN      : in  STD_LOGIC;
		BOARD_CLOCK_OUT	: out std_logic;
		B2TT_SYS_CLOCK		: in std_logic;

		--Select signal between the two onboard osc or the b2tt sys clock coming from the FTSW
		--General output clocks
		CLOCK_TRIG_SCALER		: out std_logic;-- used for counters within the trigger scalers: 
		CLOCK_FPGA_LOGIC	 : out STD_LOGIC; -- around 62.5 MHz
		CLOCK_MPPC_DAC  	 : out STD_LOGIC; -- around 4 or 5MHz for MPPC DAC read writes
		CLOCK_MPPC_ADC		 :out std_logic
		--ASIC control clocks
--		CLOCK_ASIC_CTRL_WILK  : out STD_LOGIC; --used to be called SSTx8 ~= 62.5 MHz at half the FTSW clock 
--		CLOCK_ASIC_CTRL  : out STD_LOGIC --used to be called SSTx8 ~= 62.5 MHz at half the FTSW clock 
	);
end clock_gen;

architecture Behavioral of clock_gen is
	signal internal_BOARD_CLOCK         : std_logic;
	signal internal_LOCAL_CLOCK         : std_logic;
	signal internal_CLOCK_FPGA_LOGIC : std_logic;
	signal internal_CLOCK_ASIC_CTRL : std_logic;
signal ratio_mppc_dac_clock :   integer:=6;
	signal ratio_mppc_adc_clock :   integer:=6;
	signal ratio_trig_scaler_clock :   integer:=10;	
	signal internal_CLOCK_DCM_FPGA_LOGIC : std_logic;
	
component asic_fpga_clock_gen_core
port
 (-- Clock in ports
  CLK_IN1_P         : in     std_logic;
  CLK_IN1_N         : in     std_logic;
  -- Clock out ports
  CLK_OUT1          : out    std_logic;
--  CLK_OUT2          : out    std_logic;
  -- Status and control signals
  RESET             : in     std_logic;
  LOCKED            : out    std_logic
 );
end component;




begin
	------------------------------------------------------
	--            Board derived clocking                --
	------------------------------------------------------

dcmclkgen : asic_fpga_clock_gen_core
  port map
   (-- Clock in ports
    CLK_IN1_P => BOARD_CLOCKP,
    CLK_IN1_N => BOARD_CLOCKN,
    -- Clock out ports
    CLK_OUT1 => internal_CLOCK_DCM_FPGA_LOGIC,
--    CLK_OUT2 => open,--internal_CLOCK_ASIC_CTRL,
    -- Status and control signals
    RESET  => '0',
    LOCKED => open
	 
	 );
	 

	internal_BOARD_CLOCK<=internal_CLOCK_DCM_FPGA_LOGIC when USE_LOCAL_CLOCK='1' else B2TT_SYS_CLOCK;
	CLOCK_FPGA_LOGIC<=internal_BOARD_CLOCK;


	

end Behavioral;

