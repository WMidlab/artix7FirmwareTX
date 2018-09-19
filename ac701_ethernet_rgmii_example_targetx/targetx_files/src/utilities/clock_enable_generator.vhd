----------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.math_real.log2;
use ieee.math_real.ceil;
Library UNISIM;
use UNISIM.vcomponents.all;


entity clock_enable_generator is
	Generic (
		DIVIDE_RATIO : integer := 40 -- must be an even number
		);

	Port (
		CLOCK_IN         : in  std_logic;
		CLOCK_ENABLE_OUT : out std_logic
	);
end clock_enable_generator;

architecture Behavioral of clock_enable_generator is
	constant counter_width          : integer := 10;
	signal   internal_COUNTER       : unsigned(counter_width-1 downto 0) := (others => '0');
	signal   internal_COUNTER_RESET : std_logic := '0';
	signal internal_clkout : std_logic :='0';
	
begin
	
	--comparator
	process(CLOCK_IN) begin

		if (rising_edge(CLOCK_IN)) then
			if (internal_COUNTER = to_unsigned(DIVIDE_RATIO/2-1,counter_width)) then
				internal_COUNTER <= (others => '0');
				internal_clkout<= not internal_clkout;
			else 
				internal_COUNTER <= internal_COUNTER + 1;
				
			end if;
	end if;
	end process;
	--map output port
	CLOCK_ENABLE_OUT <=internal_clkout;
	
end Behavioral;

