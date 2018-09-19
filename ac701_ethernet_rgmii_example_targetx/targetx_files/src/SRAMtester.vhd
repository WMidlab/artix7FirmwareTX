----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:52:46 06/15/2015 
-- Design Name: 
-- Module Name:    SRAMtester - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SRAMtester is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           start : in  STD_LOGIC;
           status : out  STD_LOGIC_VECTOR (7 downto 0);
			  
				ram_addr 	: OUT  std_logic_vector(21 downto 0);
				ram_datar 	: in   std_logic_vector(7 downto 0);
				ram_dataw 	: OUT  std_logic_vector(7 downto 0);
				ram_rw		: out std_logic;
				ram_update 	: OUT  std_logic;
				ram_busy 	: IN  std_logic
			  
			  );
end SRAMtester;

architecture Behavioral of SRAMtester is

begin


end Behavioral;

