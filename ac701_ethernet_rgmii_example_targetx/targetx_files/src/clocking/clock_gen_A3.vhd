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
	Port ( 
		--Raw boad clock input
		BOARD_CLOCKP      : in  STD_LOGIC;
		BOARD_CLOCKN      : in  STD_LOGIC;
		--FTSW inputs from KLM_SCROD interface

		--Trigger outputs from FTSW
		FTSW_TRIGGER      : out std_logic;
		--Select signal between the two
		USE_LOCAL_CLOCK   : in  std_logic;
		--General output clocks
		CLOCK_FPGA_LOGIC  : out STD_LOGIC; -- around 50 to 62 MHz
		CLOCK_MPPC_DAC   : out STD_LOGIC; -- around 4 or 5MHz for MPPC DAC read writes
		CLOCK_MPPC_ADC :out std_logic;
		--ASIC control clocks
		CLOCK_ASIC_CTRL  : out STD_LOGIC --used to be called SSTx8 ~= 62.5 MHz at half the FTSW clock 
	);
end clock_gen;

architecture Behavioral of clock_gen is
	signal internal_BOARD_CLOCK         : std_logic;
	signal internal_CLOCK_FPGA_LOGIC : std_logic;
	signal internal_CLOCK_ASIC_CTRL : std_logic;
begin
	------------------------------------------------------
	--            Board derived clocking                --
	------------------------------------------------------
	map_board_clock : ibufds
	port map(
		I  => BOARD_CLOCKP,
		IB => BOARD_CLOCKN,
		O  => internal_BOARD_CLOCK -- either 250 MHz or 125 MHz depending on the osc on SCROD
	);	
	
	map_ASIC_CTRL_clock_enable : entity work.clock_enable_generator
	generic map (
		DIVIDE_RATIO => 4
	)
	port map (
		CLOCK_IN         => internal_BOARD_CLOCK,
		CLOCK_ENABLE_OUT => internal_CLOCK_ASIC_CTRL
	);
	
	map_FPGA_LOGIC_clock_enable : entity work.clock_enable_generator
	generic map (
		DIVIDE_RATIO => 6
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
		DIVIDE_RATIO => 12
	)
	port map (
		CLOCK_IN         => internal_BOARD_CLOCK,
		CLOCK_ENABLE_OUT => CLOCK_MPPC_DAC
	);
	
	map_MPPC_ADC_clock_enable : entity work.clock_enable_generator
	generic map (
		DIVIDE_RATIO => 6
	)
	port map (
		CLOCK_IN         => internal_BOARD_CLOCK,
		CLOCK_ENABLE_OUT => CLOCK_MPPC_ADC
	);
	

end Behavioral;

