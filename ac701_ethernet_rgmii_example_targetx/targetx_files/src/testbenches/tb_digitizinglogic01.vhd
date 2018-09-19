--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:42:07 07/24/2014
-- Design Name:   
-- Module Name:   C:/Users/isar/Documents/code4/TX9UMB-2/ise-project/tb_digitizinglogic01.vhd
-- Project Name:  scrod-boardstack-new-daq-interface
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DigitizingLgc
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
 
ENTITY tb_digitizinglogic01 IS
END tb_digitizinglogic01;
 
ARCHITECTURE behavior OF tb_digitizinglogic01 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DigitizingLgcTX
    PORT(
         clk : IN  std_logic;
         IDLE_status : OUT  std_logic;
         StartDig : IN  std_logic;
         ramp_length : IN  std_logic_vector(11 downto 0);
         rd_ena : OUT  std_logic;
         clr : OUT  std_logic;
         startramp : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal StartDig : std_logic := '0';
   signal ramp_length : std_logic_vector(11 downto 0) := "000000001000";

 	--Outputs
   signal IDLE_status : std_logic;
   signal rd_ena : std_logic;
   signal clr : std_logic;
   signal startramp : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DigitizingLgcTX PORT MAP (
          clk => clk,
          IDLE_status => IDLE_status,
          StartDig => StartDig,
          ramp_length => ramp_length,
          rd_ena => rd_ena,
          clr => clr,
          startramp => startramp
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

      wait for clk_period*10;

	StartDig<='1';
      -- insert stimulus here 

      wait;
   end process;

END;
