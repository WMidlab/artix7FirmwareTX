----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:11:31 03/31/2015 
-- Design Name: 
-- Module Name:    mppc_dac_patgen - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mppc_dac_patgen is
    Port ( clk : in  STD_LOGIC;
           addr : out  STD_LOGIC_VECTOR (3 downto 0);
           val : out  STD_LOGIC_VECTOR (7 downto 0);
           update : out  STD_LOGIC;
           dac_busy : in  STD_LOGIC);
end mppc_dac_patgen;

architecture Behavioral of mppc_dac_patgen is

signal dac_reg:std_logic_vector(11 downto 0):=(others=>'0');

type state_type is 
		(update_dac,wait_busy_hi,wait_busy_lo);

signal st: state_type:=update_dac;


begin

addr<=dac_reg(11 downto 8);
val <=dac_reg(11 downto 8) & dac_reg(3  downto 0);

process(clk)
begin

if (rising_edge(clk)) then

	case st is
	
	when update_dac =>
		update<='1';
		st<= wait_busy_hi;
	
	when wait_busy_hi =>
		update<='0';
		if (dac_busy='0') then
			st<= wait_busy_hi;
		else
			st<= wait_busy_lo;
		end if;
		
	when wait_busy_lo =>
		if (dac_busy='1') then
			st<= wait_busy_lo;
		else
			dac_reg<=std_logic_vector(to_unsigned(to_integer(unsigned(dac_reg))+1,12));
			st<= update_dac;
		end if;
		
	end case;	


end if;

end process;

end Behavioral;

