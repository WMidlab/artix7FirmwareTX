--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:55:40 06/05/2014
-- Design Name:   
-- Module Name:   C:/Users/isar/Documents/code2/T69UMB/ise-project/tb_trigger_scaler_single_channel_w_timing_gen02.vhd
-- Project Name:  scrod-boardstack-new-daq-interface
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: trigger_scaler_single_channel_w_timing_gen
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
 
ENTITY tb_trigger_scaler_single_channel_w_timing_gen02 IS
END tb_trigger_scaler_single_channel_w_timing_gen02;
 
ARCHITECTURE behavior OF tb_trigger_scaler_single_channel_w_timing_gen02 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT trigger_scaler_single_channel_w_timing_gen
    PORT(
         SIGNAL_TO_COUNT : IN  std_logic;
         CLOCK : IN  std_logic;
         READ_ENABLE_IN : IN  std_logic;
         RESET_COUNTER : IN  std_logic;
         SCALER : OUT  std_logic_vector(15 downto 0);
			READ_ENABLE_TIMER : OUT std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal SIGNAL_TO_COUNT : std_logic := '0';
   signal CLOCK : std_logic := '0';
   signal READ_ENABLE_IN : std_logic := '0';
   signal RESET_COUNTER : std_logic := '0';

 	--Outputs
   signal SCALER : std_logic_vector(15 downto 0);
	signal READ_ENABLE_TIMER : std_logic;
   -- Clock period definitions
   constant CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: trigger_scaler_single_channel_w_timing_gen PORT MAP (
          SIGNAL_TO_COUNT => SIGNAL_TO_COUNT,
          CLOCK => CLOCK,
          READ_ENABLE_IN => READ_ENABLE_IN,
          RESET_COUNTER => RESET_COUNTER,
          SCALER => SCALER,
			 READ_ENABLE_TIMER => READ_ENABLE_TIMER
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

    wait for 100 ns;
		SIGNAL_TO_COUNT <= '1';
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '0';
		wait for 20 ns;	

--		READ_ENABLE <= '1';
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
--		READ_ENABLE <= '0';
		
		wait for 20 ns;	
		SIGNAL_TO_COUNT <= '1';
		wait for 40 ns;	
		SIGNAL_TO_COUNT <= '0';



      wait for CLOCK_period*10;
      wait;
   end process;

END;
