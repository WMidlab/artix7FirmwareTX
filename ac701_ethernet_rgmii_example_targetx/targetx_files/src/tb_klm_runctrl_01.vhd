--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:13:53 09/25/2014
-- Design Name:   
-- Module Name:   C:/Users/isar/Documents/code4/TX9UMB-2/src/tb_klm_runctrl_01.vhd
-- Project Name:  scrod-boardstack-new-daq-interface
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: KLMRunControl
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;
use work.readout_definitions.all;

 
ENTITY tb_klm_runctrl_01 IS
END tb_klm_runctrl_01;
 
ARCHITECTURE behavior OF tb_klm_runctrl_01 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT KLMRunControl
    PORT(
         clk : IN  std_logic;
         din : IN  std_logic_vector(15 downto 0);
         start : IN  std_logic;
         busy : OUT  std_logic;
         error : OUT  std_logic;
         out_regs : OUT  GPR;
         SCLK : OUT  std_logic_vector(9 downto 0);
         SIN : OUT  std_logic_vector(9 downto 0);
         PCLK : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal din : std_logic_vector(15 downto 0) := (others => '0');
   signal start : std_logic := '0';

 	--Outputs
   signal busy : std_logic;
   signal error : std_logic;
   signal out_regs : GPR;
   signal SCLK : std_logic_vector(9 downto 0);
   signal SIN : std_logic_vector(9 downto 0);
   signal PCLK : std_logic_vector(9 downto 0);
	signal c1:integer:=0; 
	signal cclk:integer:=0; 

	type buffin is array (1000-1 downto 0) of std_logic_vector(15 downto 0);

	signal inbuf: buffin;--array std_logic_vector(15 downto 0)

   -- Clock period definitions
   constant clk_period : time := 16 ns;
 
BEGIN

--SCROD Registers: (MB regs)
inbuf(0)<=x"AF05";-- first write the latch and read periods so that TX DACs can be registered
inbuf(1)<=x"0010";
inbuf(2)<=x"AF06";
inbuf(3)<=x"0020";
inbuf(4)<=x"AF01";
inbuf(5)<=x"4567";

--DC	  Registers: (Includes ASIC(reg 0-79) and MPPC Bias points(80-96) for each DC
inbuf(6)<=x"A000";
inbuf(7)<=x"0123";
inbuf(8)<=x"A001";
inbuf(9)<=x"0321";
inbuf(10)<=x"A200";
inbuf(11)<=x"0654";
inbuf(12)<=x"A900";
inbuf(13)<=x"0789";

    
	-- Instantiate the Unit Under Test (UUT)
   uut: KLMRunControl PORT MAP (
          clk => clk,
          din => din,
          start => start,
          busy => busy,
          error => error,
          out_regs => out_regs,
          SCLK => SCLK,
          SIN => SIN,
          PCLK => PCLK
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		cclk<=cclk+1;
		
		if (cclk>10) then
		start<='1';
		end if;
		
		if (cclk>10 and c1<1000) then
		din<=inbuf(c1);
		c1<=c1+1;
		end if;
		wait for clk_period/2;
   end process;
 
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		wait for 40 ns;

      wait for 100 ns;	
		--start<='1';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
