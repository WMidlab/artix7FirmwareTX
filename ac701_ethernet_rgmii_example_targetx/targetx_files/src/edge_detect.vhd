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

entity edge_detect is
	Port(
		CLOCK        : in  STD_LOGIC;
		INPUT_SIGNAL : in  STD_LOGIC;
		OUT_RISING   : out STD_LOGIC;
		OUT_FALLING  : out STD_LOGIC
	);
end edge_detect;

architecture Behavioral of edge_detect is

	signal i_signal : std_logic;

begin

	i_signal <= INPUT_SIGNAL when rising_edge(CLOCK);
	
	process(CLOCK)
	begin
		if rising_edge(CLOCK) then
			if (INPUT_SIGNAL = '1' and i_signal = '0') then
				OUT_RISING  <= '1';
				OUT_FALLING <= '0';
			elsif (INPUT_SIGNAL = '0' and i_signal = '1') then
				OUT_RISING  <= '0';
				OUT_FALLING <= '1';
			else
				OUT_RISING  <= '0';
				OUT_FALLING <= '0';
			end if;
		end if;
	end process;

end Behavioral;

