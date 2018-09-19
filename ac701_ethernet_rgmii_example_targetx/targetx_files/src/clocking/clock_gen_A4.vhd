----------------------------------------------------------------------------------
-- 2014-08-29: IM: New clock generation for the SCROD Rev A3 and A4 to be used in the KLM FW
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;
use work.asic_definitions_irs2_carrier_revA.all;

entity clock_gen is
   generic(
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
		USE_LOCAL_CLOCK   : in  std_logic;
		--General output clocks
		CLOCK_TRIG_SCALER		: out std_logic;-- used for counters within the trigger scalers: 
		CLOCK_FPGA_LOGIC	 : out STD_LOGIC; -- around 62.5 MHz
		CLOCK_MPPC_DAC  	 : out STD_LOGIC; -- around 4 or 5MHz for MPPC DAC read writes
		CLOCK_MPPC_ADC		 :out std_logic;
		--ASIC control clocks
		CLOCK_ASIC_CTRL_WILK  : out STD_LOGIC; --used to be called SSTx8 ~= 62.5 MHz at half the FTSW clock 
		CLOCK_ASIC_CTRL  : out STD_LOGIC --used to be called SSTx8 ~= 62.5 MHz at half the FTSW clock 
	);
end clock_gen;

architecture Behavioral of clock_gen is
	signal internal_BOARD_CLOCK         : std_logic;
	signal internal_LOCAL_CLOCK         : std_logic;
	signal internal_CLOCK_FPGA_LOGIC : std_logic;
	signal internal_CLOCK_ASIC_CTRL : std_logic;
	--signal internal_CLOCK_TRIG_SCALER :std_logic;
	
--	signal ratio_asic_ctrl_clock :  integer:=4;
--	signal ratio_fpga_logic_clock : integer:=4;
--	signal ratio_mppc_dac_clock :   integer:=12;
--	signal ratio_mppc_adc_clock :   integer:=6;
	
	signal ratio_asic_ctrl_clock :  integer:=2;
	signal ratio_fpga_logic_clock : integer:=2;
	signal ratio_mppc_dac_clock :   integer:=6;
	signal ratio_mppc_adc_clock :   integer:=6;
	signal ratio_trig_scaler_clock :   integer:=10;

begin
	------------------------------------------------------
	--            Board derived clocking                --
	------------------------------------------------------

----ww: if (HW_CONF="SA4_MBA_DCA_RB_I") generate -- since input clock is 127 for Rev A4, then div all radios by 2 to make the same clocks
--ratio_fpga_logic_clock<=2;
--ratio_asic_ctrl_clock<=2;
--ratio_mppc_dac_clock<=6;
--ratio_mppc_adc_clock<=3;
----end generate;	
	--BOARD_CLOCK_OUT<=internal_BOARD_CLOCK;
		--BOARD_CLOCK_OUT<='0';

	map_board_clock : ibufds
	port map(
		I  => BOARD_CLOCKP,
		IB => BOARD_CLOCKN,
		O  => internal_LOCAL_CLOCK -- 127 MHz depending on the osc on SCROD A4
	);	
	
	internal_BOARD_CLOCK<=internal_LOCAL_CLOCK when USE_LOCAL_CLOCK='1' else B2TT_SYS_CLOCK;
	
	map_ASIC_CTRL_clock_enable : entity work.clock_enable_generator
	generic map (
		DIVIDE_RATIO => ratio_asic_ctrl_clock
	)
	port map (
		CLOCK_IN         => internal_BOARD_CLOCK,
		CLOCK_ENABLE_OUT => internal_CLOCK_ASIC_CTRL
	);
	
	map_ASIC_CTRL_clock_enable_WILK : entity work.clock_enable_generator
	generic map (
		DIVIDE_RATIO => ratio_asic_ctrl_clock
	)
	port map (
		CLOCK_IN         => internal_BOARD_CLOCK,
		CLOCK_ENABLE_OUT => CLOCK_ASIC_CTRL_WILK
	);
	
	map_test_clock_enable : entity work.clock_enable_generator
	generic map (
		DIVIDE_RATIO => ratio_fpga_logic_clock
	)
	port map (
		CLOCK_IN         => internal_BOARD_CLOCK,
		CLOCK_ENABLE_OUT => BOARD_CLOCK_OUT
	);
	
	map_FPGA_LOGIC_clock_enable : entity work.clock_enable_generator
	generic map (
		DIVIDE_RATIO => ratio_fpga_logic_clock
	)
	port map (
		CLOCK_IN         => internal_BOARD_CLOCK,
		CLOCK_ENABLE_OUT => internal_CLOCK_FPGA_LOGIC
	);
	
	map_FPGA_LOGIC_clock_bufg : bufg
	port map(
		I  => internal_CLOCK_FPGA_LOGIC,
		O  => CLOCK_FPGA_LOGIC
	);
	
	map_ASIC_CTRL_clock_bufg : bufg
	port map(
		I  => internal_CLOCK_ASIC_CTRL,
		O  => CLOCK_ASIC_CTRL
	);
	

	map_MPPC_DAC_clock_enable : entity work.clock_enable_generator
	generic map (
		DIVIDE_RATIO => ratio_mppc_dac_clock
	)
	port map (
		CLOCK_IN         => internal_BOARD_CLOCK,
		CLOCK_ENABLE_OUT => CLOCK_MPPC_DAC
	);
	
	map_MPPC_ADC_clock_enable : entity work.clock_enable_generator
	generic map (
		DIVIDE_RATIO => ratio_mppc_adc_clock
	)
	port map (
		CLOCK_IN         => internal_BOARD_CLOCK,
		CLOCK_ENABLE_OUT => CLOCK_MPPC_ADC
	);
	
	map_trig_scaler_clock_enable : entity work.clock_enable_generator
	generic map (
		DIVIDE_RATIO => ratio_trig_scaler_clock
	)
	port map (
		CLOCK_IN         => internal_BOARD_CLOCK,
		CLOCK_ENABLE_OUT => CLOCK_TRIG_SCALER
	);
	

end Behavioral;

