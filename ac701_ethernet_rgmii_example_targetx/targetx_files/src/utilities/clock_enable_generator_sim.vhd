--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:07:28 11/01/2012
-- Design Name:   
-- Module Name:   C:/cygwin/home/Dr Kurtis/idlab-general/USB_and_fiber_readout/firmware/FPGA/src/utilities/clock_enable_generator_sim.vhd
-- Project Name:  USB_and_fiber_readout
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: clock_enable_generator
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
 
ENTITY clock_enable_generator_sim IS
END clock_enable_generator_sim;
 
ARCHITECTURE behavior OF clock_enable_generator_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clock_enable_generator
    PORT(
         CLOCK_IN : IN  std_logic;
         CLOCK_ENABLE_OUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLOCK_IN : std_logic := '0';

 	--Outputs
   signal CLOCK_ENABLE_OUT : std_logic;

   -- Clock period definitions
   constant CLOCK_IN_period : time := 10 ns;
   constant CLOCK_ENABLE_OUT_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clock_enable_generator PORT MAP (
          CLOCK_IN => CLOCK_IN,
          CLOCK_ENABLE_OUT => CLOCK_ENABLE_OUT
        );

   -- Clock process definitions
   CLOCK_IN_process :process
   begin
		CLOCK_IN <= '0';
		wait for CLOCK_IN_period/2;
		CLOCK_IN <= '1';
		wait for CLOCK_IN_period/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLOCK_IN_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
