--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:57:35 06/04/2014
-- Design Name:   
-- Module Name:   C:/Users/isar/Documents/code2/T69UMB/ise-project/ub_trigger_scaler_single_channel01.vhd
-- Project Name:  scrod-boardstack-new-daq-interface
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: trigger_scaler_single_channel
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
 
ENTITY ub_trigger_scaler_single_channel01 IS
END ub_trigger_scaler_single_channel01;
 
ARCHITECTURE behavior OF ub_trigger_scaler_single_channel01 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT trigger_scaler_single_channel
    PORT(
         SIGNAL_TO_COUNT : IN  std_logic;
         CLOCK : IN  std_logic;
         READ_ENABLE : IN  std_logic;
         RESET_COUNTER : IN  std_logic;
         SCALER : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SIGNAL_TO_COUNT : std_logic := '0';
   signal CLOCK : std_logic := '0';
   signal READ_ENABLE : std_logic := '0';
   signal RESET_COUNTER : std_logic := '0';

 	--Outputs
   signal SCALER : std_logic_vector(15 downto 0):="0000000000000000";

   -- Clock period definitions
   constant CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: trigger_scaler_single_channel PORT MAP (
          SIGNAL_TO_COUNT => SIGNAL_TO_COUNT,
          CLOCK => CLOCK,
          READ_ENABLE => READ_ENABLE,
          RESET_COUNTER => RESET_COUNTER,
          SCALER => SCALER
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
		SIGNAL_TO_COUNT <= '1';
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '0';
		wait for 20 ns;	

		READ_ENABLE <= '1';
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '1';
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '0';
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '1';
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '0';
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '1';
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '0';
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '1';
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '0';
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '1';
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '0';
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '1';
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '0';
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '1';
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '0';
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '1';
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '0';
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '1';
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '0';
		
		wait for 20 ns;
		READ_ENABLE <= '0';
		
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '1';
		wait for 40 ns;	
		SIGNAL_TO_COUNT <= '0';



      wait for CLOCK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
