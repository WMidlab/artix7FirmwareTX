--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:32:03 03/30/2015
-- Design Name:   
-- Module Name:   C:/Users/isar/Documents/code5/TX9UMB-4/src/testbenches/tb_mppc_bias_dac088s085_test0.vhd
-- Project Name:  scrod-A4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mppc_bias_dac088s085
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
 
ENTITY tb_mppc_bias_dac088s085_test0 IS
END tb_mppc_bias_dac088s085_test0;
 
ARCHITECTURE behavior OF tb_mppc_bias_dac088s085_test0 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mppc_bias_dac088s085
    PORT(
         clk : IN  std_logic;
         addr : IN  std_logic_vector(3 downto 0);
         val : IN  std_logic_vector(7 downto 0);
         update : IN  std_logic;
         busy : OUT  std_logic;
         SCLK : OUT  std_logic;
         SYNC_n : OUT  std_logic;
         DIN : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal addr : std_logic_vector(3 downto 0) := (others => '0');
   signal val : std_logic_vector(7 downto 0) := (others => '0');
   signal update : std_logic := '0';

 	--Outputs
   signal busy : std_logic;
   signal SCLK : std_logic;
   signal SYNC_n : std_logic;
   signal DIN : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant SCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mppc_bias_dac088s085 PORT MAP (
          clk => clk,
          addr => addr,
          val => val,
          update => update,
          busy => busy,
          SCLK => SCLK,
          SYNC_n => SYNC_n,
          DIN => DIN
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
      wait for 123 ns;	
	addr<="0101";
	val<=x"45";
	update<='0';

      wait for 422 ns;	
	update<='1';
	
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
