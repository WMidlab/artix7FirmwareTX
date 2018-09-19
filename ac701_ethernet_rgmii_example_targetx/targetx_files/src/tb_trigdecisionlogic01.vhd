--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:42:15 11/08/2014
-- Design Name:   
-- Module Name:   C:/Users/isar/Documents/code4/TX9UMB-3/src/tb_trigdecisionlogic01.vhd
-- Project Name:  scrod-A4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TrigDecisionLogic
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
  use work.tdc_pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_trigdecisionlogic01 IS
END tb_trigdecisionlogic01;
 
ARCHITECTURE behavior OF tb_trigdecisionlogic01 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TrigDecisionLogic2
    PORT(
			clk : in std_logic;
         tb : IN  tb_vec_type;
			  tm : in std_logic_vector(15 downto 1);-- mask
			
         TrigOut : OUT  std_logic;
         asicX : OUT  std_logic_vector(2 downto 0);
         asicY : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal tb : tb_vec_type := (others => "00000");
   signal clk : std_logic := '0';

 	--Outputs
   signal TrigOut : std_logic;
   signal asicX : std_logic_vector(2 downto 0);
   signal asicY : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 16 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TrigDecisionLogic2 PORT MAP (
			 clk=>clk,
          tb => tb,
			 tm=>"000001111111111",
          TrigOut => TrigOut,
          asicX => asicX,
          asicY => asicY
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

--      wait for clk_period*10;
--		tb (3)<="11000";
--		tb (8)<="01100";
--
--      wait for clk_period*10;
--		tb (3)<="00000";
--		tb (8)<="00000";
--		
      wait for clk_period*10;
		--tb (1)<="01100";
		tb (10)<="10000";
      wait for clk_period/4;
		tb (10)<="00000";
		


      -- insert stimulus here 

      wait;
   end process;

END;
