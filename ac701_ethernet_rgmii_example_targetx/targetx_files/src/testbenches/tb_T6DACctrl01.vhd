--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:10:30 08/20/2014
-- Design Name:   
-- Module Name:   C:/Users/isar/Documents/code4/TX9UMB-2/ise-project/tb_T6DACctrl01.vhd
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
 
ENTITY tb_T6DACctrl01 IS
END tb_T6DACctrl01;
 
ARCHITECTURE behavior OF tb_T6DACctrl01 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TARGET6_DAC_CONTROL
    PORT(
         CLK : IN  std_logic;
         LOAD_PERIOD : IN  std_logic_vector(15 downto 0);
         LATCH_PERIOD : IN  std_logic_vector(15 downto 0);
         UPDATE : IN  std_logic;
         REG_DATA : IN  std_logic_vector(18 downto 0);
         SIN : OUT  std_logic;
         SCLK : OUT  std_logic;
         PCLK : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal LOAD_PERIOD : std_logic_vector(15 downto 0) := x"0010";
   signal LATCH_PERIOD : std_logic_vector(15 downto 0) := x"0010";
   signal UPDATE : std_logic := '0';
   signal REG_DATA : std_logic_vector(18 downto 0) := "1001111" & "111010110101";

 	--Outputs
   signal SIN : std_logic;
   signal SCLK : std_logic;
   signal PCLK : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
 
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
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;
		update<='1';
      wait for CLK_period*2000;
		update<='0';
      wait for CLK_period*10;
		update<='1';
		
		-- insert stimulus here 

      wait;
   end process;

END;
