--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:25:53 09/05/2014
-- Design Name:   
-- Module Name:   C:/Users/isar/Documents/code4/TX9UMB-2/ise-project/tb_samplinglogic_new01.vhd
-- Project Name:  scrod-boardstack-new-daq-interface
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SamplingLgc
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
 
ENTITY tb_samplinglogic_new01 IS
END tb_samplinglogic_new01;
 
ARCHITECTURE behavior OF tb_samplinglogic_new01 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SamplingLgc
    PORT(
         clk : IN  std_logic;
         enable : IN  std_logic;
         MAIN_CNT_out : OUT  std_logic_vector(8 downto 0);
         sstin_out : OUT  std_logic;
         wr_addrclr_out : OUT  std_logic;
         wr1_ena : OUT  std_logic;
         wr2_ena : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal enable : std_logic := '0';

 	--Outputs
   signal MAIN_CNT_out : std_logic_vector(8 downto 0);
   signal sstin_out : std_logic;
   signal wr_addrclr_out : std_logic;
   signal wr1_ena : std_logic;
   signal wr2_ena : std_logic;

   -- Clock period definitions
   constant clk_period : time := 16 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SamplingLgc PORT MAP (
          clk => clk,
          enable => enable,
          MAIN_CNT_out => MAIN_CNT_out,
          sstin_out => sstin_out,
          wr_addrclr_out => wr_addrclr_out,
          wr1_ena => wr1_ena,
          wr2_ena => wr2_ena
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

		enable<='1';
      -- insert stimulus here 
		
		wait for clk_period*100;

		enable<='0';
		
		wait for clk_period*100;

		enable<='1';

      wait;
   end process;

END;
