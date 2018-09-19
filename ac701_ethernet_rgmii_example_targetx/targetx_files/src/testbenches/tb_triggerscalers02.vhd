--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:21:48 06/04/2014
-- Design Name:   
-- Module Name:   C:/Users/isar/Documents/code2/T69UMB/ise-project/tb_triggerscalers02.vhd
-- Project Name:  scrod-boardstack-new-daq-interface
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: trigger_scaler_timing_generator
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
 
ENTITY tb_triggerscalers02 IS
END tb_triggerscalers02;
 
ARCHITECTURE behavior OF tb_triggerscalers02 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT trigger_scaler_timing_generator
    PORT(
         CLOCK : IN  std_logic;
         READ_ENABLE : OUT  std_logic;
         RESET_COUNTER : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLOCK : std_logic := '0';

 	--Outputs
   signal READ_ENABLE : std_logic;
   signal RESET_COUNTER : std_logic;

   -- Clock period definitions
   constant CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: trigger_scaler_timing_generator PORT MAP (
          CLOCK => CLOCK,
          READ_ENABLE => READ_ENABLE,
          RESET_COUNTER => RESET_COUNTER
        );

   -- Clock process definitions
   CLOCK_process :process
   begin
		CLOCK <= '0';
		wait for CLOCK_period/2;
		CLOCK <= '1';
		wait for CLOCK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLOCK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
