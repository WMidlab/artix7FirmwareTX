--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:41:54 07/18/2014
-- Design Name:   
-- Module Name:   C:/Users/isar/Documents/code2/TX9UMB-2/ise-project/tb_samplinglogic01.vhd
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
 
ENTITY tb_samplinglogic01 IS
END tb_samplinglogic01;
 
ARCHITECTURE behavior OF tb_samplinglogic01 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SamplingLgc
    PORT(
         clk : IN  std_logic;
         start : IN  std_logic;
         stop : IN  std_logic;
         IDLE_status : OUT  std_logic;
         MAIN_CNT_out : OUT  std_logic_vector(8 downto 0);
         sspin_out : OUT  std_logic;
         sstin_out : OUT  std_logic;
         wr_advclk_out : OUT  std_logic;
         wr_addrclr_out : OUT  std_logic;
         wr_strb_out : OUT  std_logic;
         wr_ena_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal start : std_logic := '0';
   signal stop : std_logic := '0';

 	--Outputs
   signal IDLE_status : std_logic;
   signal MAIN_CNT_out : std_logic_vector(8 downto 0);
   signal sspin_out : std_logic;
   signal sstin_out : std_logic;
   signal wr_advclk_out : std_logic;
   signal wr_addrclr_out : std_logic;
   signal wr_strb_out : std_logic;
   signal wr_ena_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 16 ns; --input clock is SSTx8 which is 62.5MHz
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SamplingLgc PORT MAP (
          clk => clk,
          start => start,
          stop => stop,
          IDLE_status => IDLE_status,
          MAIN_CNT_out => MAIN_CNT_out,
          sspin_out => sspin_out,
          sstin_out => sstin_out,
          wr_advclk_out => wr_advclk_out,
          wr_addrclr_out => wr_addrclr_out,
          wr_strb_out => wr_strb_out,
          wr_ena_out => wr_ena_out
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
		start <='1';

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
