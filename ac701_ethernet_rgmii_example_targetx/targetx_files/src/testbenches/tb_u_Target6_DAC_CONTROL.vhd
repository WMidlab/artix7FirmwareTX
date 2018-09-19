--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:04:11 06/03/2014
-- Design Name:   
-- Module Name:   C:/Users/isar/Documents/code2/T69UMB/ise-project/tb_u_Target6_DAC_CONTROL.vhd
-- Project Name:  scrod-boardstack-new-daq-interface
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TARGET6_DAC_CONTROL
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
 
ENTITY tb_u_Target6_DAC_CONTROL IS
END tb_u_Target6_DAC_CONTROL;
 
ARCHITECTURE behavior OF tb_u_Target6_DAC_CONTROL IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TARGET6_DAC_CONTROL
    PORT(
         CLK : IN  std_logic;
         LOAD_PERIOD : IN  std_logic_vector(15 downto 0);
         LATCH_PERIOD : IN  std_logic_vector(15 downto 0);
         UPDATE : IN  std_logic;
         REG_DATA : IN  std_logic_vector(17 downto 0);
         SIN : OUT  std_logic;
         SCLK : OUT  std_logic;
         PCLK : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal LOAD_PERIOD : std_logic_vector(15 downto 0) := "0000000010000000";
   signal LATCH_PERIOD : std_logic_vector(15 downto 0) := "0000000101000000";
   signal UPDATE : std_logic := '0';
   signal REG_DATA : std_logic_vector(17 downto 0) := ("000000" & "000001111111");

 	--Outputs
   signal SIN : std_logic;
   signal SCLK : std_logic;
   signal PCLK : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
  -- constant SCLK_period : time := 10 ns;
  -- constant PCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TARGET6_DAC_CONTROL PORT MAP (
          CLK => CLK,
          LOAD_PERIOD => LOAD_PERIOD,
          LATCH_PERIOD => LATCH_PERIOD,
          UPDATE => UPDATE,
          REG_DATA => REG_DATA,
          SIN => SIN,
          SCLK => SCLK,
          PCLK => PCLK
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
--   SCLK_process :process
--   begin
--		SCLK <= '0';
--		wait for SCLK_period/2;
--		SCLK <= '1';
--		wait for SCLK_period/2;
--   end process;
-- 
--   PCLK_process :process
--   begin
--		PCLK <= '0';
--		wait for PCLK_period/2;
--		PCLK <= '1';
--		wait for PCLK_period/2;
--   end process;
-- 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		UPDATE <= '1';
		wait for 1000 ns;	
		UPDATE <= '0';		
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
