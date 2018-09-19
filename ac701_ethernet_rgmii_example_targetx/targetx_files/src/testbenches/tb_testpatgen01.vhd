--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:52:21 08/19/2014
-- Design Name:   
-- Module Name:   C:/Users/isar/Documents/code4/TX9UMB-2/ise-project/tb_testpatgen01.vhd
-- Project Name:  scrod-boardstack-new-daq-interface
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TestPatternSM
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
 
ENTITY tb_testpatgen01 IS
END tb_testpatgen01;
 
ARCHITECTURE behavior OF tb_testpatgen01 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TestPatternSM
    PORT(
         CLK : IN  std_logic;
         rst : IN  std_logic;
         Select_any_in : IN  std_logic;
         sr_clk_in : IN  std_logic;
         sr_sel_in : IN  std_logic;
         clr_in : IN  std_logic;
         Select_any_out : OUT  std_logic;
         sr_clk_out : OUT  std_logic;
         sr_sel_out : OUT  std_logic;
         clr_out : OUT  std_logic;
         SelectPattern : IN  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal rst : std_logic := '0';
   signal Select_any_in : std_logic := '0';
   --signal sr_clk_in : std_logic := '0';
   signal sr_sel_in : std_logic := '0';
   signal clr_in : std_logic := '0';
   signal SelectPattern : std_logic_vector(1 downto 0) := "00";

 	--Outputs
   signal Select_any_out : std_logic;
   signal sr_clk_out : std_logic;
   signal sr_sel_out : std_logic;
   signal clr_out : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TestPatternSM PORT MAP (
          CLK => CLK,
          rst => rst,
          Select_any_in => Select_any_in,
          sr_clk_in => CLK,
          sr_sel_in => sr_sel_in,
          clr_in => clr_in,
          Select_any_out => Select_any_out,
          sr_clk_out => sr_clk_out,
          sr_sel_out => sr_sel_out,
          clr_out => clr_out,
          SelectPattern => SelectPattern
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

	sr_sel_in <= '1';
      -- insert stimulus here 

	wait for CLK_period*10;
		Select_any_in <= '1';


      wait;
   end process;

END;
