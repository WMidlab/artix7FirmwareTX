----------------------------------------------------------------------------------
-- Company: University of Hawaii at Manoa
-- Engineer: Bostjan Macek
-- 
-- Create Date:    14:22:21 02/18/2014 
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

entity mppc_dacs is
	Port (
		------------CLOCK-----------------
		CLOCK			 : IN  STD_LOGIC;
		------------DAC PARAMETERS--------
		DAC_NUMBER   : IN  STD_LOGIC_VECTOR(3 downto 0);
		DAC_ADDR     : IN  STD_LOGIC_VECTOR(3 downto 0);
		DAC_VALUE    : IN  STD_LOGIC_VECTOR(7 downto 0);
		WRITE_STROBE : IN  STD_LOGIC;
		------------HW INTERFACE----------
		SCK_DAC		 : OUT STD_LOGIC;
		DIN_DAC		 : OUT STD_LOGIC;
		CS_DAC       : OUT STD_LOGIC_VECTOR(9 downto 0)
	);
end mppc_dacs;

architecture Behavioral of mppc_dacs is

	signal i_write      : std_logic;
	signal i_write_I    : std_logic;
	signal i_dac_number : std_logic_vector(3 downto 0);
	signal i_dac_addr   : std_logic_vector(3 downto 0);
	signal i_dac_value  : std_logic_vector(7 downto 0);
	signal i_dac_mask   : std_logic_vector(9 downto 0);
	signal i_sck_dac    : std_logic;
	signal i_din_dac    : std_logic;
	signal i_cs_dac     : std_logic;	
	
begin

	-- generate write trigger
	inst_write_edge : entity work.edge_detect
	Port map(
		CLOCK        => CLOCK,
		INPUT_SIGNAL => WRITE_STROBE,
		OUT_RISING   => i_write,
		OUT_FALLING  => open
	);
	i_write_I <= i_write when rising_edge(CLOCK);
	
	--latch the singals 
	process(CLOCK)
	begin
		if rising_edge(CLOCK) then
			if (i_write = '1') then
				i_dac_number <= DAC_NUMBER;
				i_dac_addr   <= DAC_ADDR;
				i_dac_value  <= DAC_VALUE;
			end if;
		end if;
	end process;

	inst_dac_controller : entity work.TDC_MPPC_DAC 
	Generic map(
		MPPC_DACs_VALUE_WIDTH   => 32
	)
	Port map(
		CLK                     => CLOCK,
		---
		ADDR_MPPC_DAC				=> i_dac_addr,
		VALUE_MPPC_DAC				=> i_dac_value,
		ALL_OR_SINGLE_MPPC_DAC	=> '0',
		UPDATE_MPPC_DAC			=> i_write_I,
		---
		SCK_DAC                 => i_sck_dac,
		DIN_DAC                 => i_din_dac,
		CS_DAC                  => i_cs_dac,
		UPDATE_MPPCDAC_DONE		=> open
	);

	i_dac_mask <= "1111111110" when i_dac_number = x"0" else
	              "1111111101" when i_dac_number = x"1" else
	              "1111111011" when i_dac_number = x"2" else
	              "1111110111" when i_dac_number = x"3" else
	              "1111101111" when i_dac_number = x"4" else
	              "1111011111" when i_dac_number = x"5" else
	              "1110111111" when i_dac_number = x"6" else
	              "1101111111" when i_dac_number = x"7" else
	              "1011111111" when i_dac_number = x"8" else
	              "0111111111" when i_dac_number = x"9" else
					  "1111111111";

	-- outputs
	SCK_DAC <= i_sck_dac;
	DIN_DAC <= i_din_dac;
	cs_bits: for i in 0 to 9 generate
	begin	
		CS_DAC(i) <= i_dac_mask(i) or i_cs_dac;
	end generate;

end Behavioral;

