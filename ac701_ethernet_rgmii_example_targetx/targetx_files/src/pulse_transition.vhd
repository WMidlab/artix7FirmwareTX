----------------------------------------------------------------------------------
-- Company:        University of Hawaii at Manoa
-- Engineer:       Boštjan Maček
-- 
-- Create Date:    11:26:46 02/07/2014 
-- Module Name:    klm_top - Behavioral 
-- Project Name:   KLM readout
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pulse_transition is
	Generic(
		CLOCK_RATIO  : integer := 10  -- ratio > f(CLOCK_IN)/f(CLOCL_OUT) rounded up
	);
	Port(
		CLOCK_IN     : in  STD_LOGIC;
		D_IN         : in  STD_LOGIC;
		CLOCK_OUT    : in  STD_LOGIC;
		D_OUT        : out STD_LOGIC
	);
end pulse_transition;

architecture Behavioral of pulse_transition is

	type tansition_state is (s_idle, s_extending);
	
	signal i_state    : tansition_state := s_idle;
	signal i_counter  : integer := 0;
	signal i_start    : std_logic := '0';
	signal i_extended : std_logic := '0'; 
	signal i_extended_slow : std_logic_vector(1 downto 0);

begin

	inst_input_edge : entity work.edge_detect
	Port map(
		CLOCK        => CLOCK_IN,
		INPUT_SIGNAL => D_IN,
		OUT_RISING   => i_start,
		OUT_FALLING  => open
	);
	
	process(CLOCK_IN)
	begin
		if rising_edge(CLOCK_IN) then
			case i_state is
				when s_idle => 
					i_counter  <= 0;
					i_extended <= '0';
					if (i_start = '1') then
						i_state <= s_extending;
					else
						i_state <= s_idle;
					end if;
				when s_extending =>
					i_counter  <= i_counter + 1;
					i_extended <= '1';
					if (i_counter = CLOCK_RATIO) then
						i_state <= s_idle;
					else
						i_state <= s_extending;
					end if;
				when others =>
					i_state <= s_idle;					
			end case;
		end if;
	end process;	

	i_extended_slow(0) <= i_extended when rising_edge(CLOCK_OUT);
	i_extended_slow(1) <= i_extended_slow(0) when rising_edge(CLOCK_OUT);
	
	inst_ouput_edge : entity work.edge_detect
	Port map(
		CLOCK        => CLOCK_OUT,
		INPUT_SIGNAL => i_extended_slow(1),
		OUT_RISING   => D_OUT,
		OUT_FALLING  => open
	);

end Behavioral;

