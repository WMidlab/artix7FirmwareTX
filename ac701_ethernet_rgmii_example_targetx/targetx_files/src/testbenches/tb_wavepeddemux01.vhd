--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:41:52 10/17/2014
-- Design Name:   
-- Module Name:   C:/Users/isar/Documents/code4/TX9UMB-3/ise-project/tb_wavepeddemux01.vhd
-- Project Name:  scrod-A4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: WaveformDemuxPedsubDSP
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
USE ieee.numeric_std.ALL;
 use work.readout_definitions.all;

ENTITY tb_wavepeddemux01 IS
END tb_wavepeddemux01;
 
ARCHITECTURE behavior OF tb_wavepeddemux01 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WaveformDemuxPedsubDSP
    PORT(
         clk : IN  std_logic;
         asic_no : IN  std_logic_vector(3 downto 0);
         win_addr_start : IN  std_logic_vector(8 downto 0);
         sr_start : IN  std_logic;
         fifo_en : IN  std_logic;
         fifo_clk : IN  std_logic;
         fifo_din : IN  std_logic_vector(31 downto 0);
         ram_addr : OUT  std_logic_vector(21 downto 0);
         ram_data : IN  std_logic_vector(7 downto 0);
         ram_update : OUT  std_logic;
         ram_busy : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal asic_no : std_logic_vector(3 downto 0) := (others => '0');
   signal win_addr_start : std_logic_vector(8 downto 0) := (others => '0');
   signal sr_start : std_logic := '0';
   signal fifo_en : std_logic := '0';
   signal fifo_clk : std_logic := '0';
   signal fifo_din : std_logic_vector(31 downto 0) := (others => '0');
   signal ram_data : std_logic_vector(7 downto 0) := (others => '0');
   signal ram_busy : std_logic := '0';

 	--Outputs
   signal ram_addr : std_logic_vector(21 downto 0);
   signal ram_update : std_logic;

   -- Clock period definitions
   constant clk_period : time := 16 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WaveformDemuxPedsubDSP PORT MAP (
          clk => clk,
          asic_no => asic_no,
          win_addr_start => win_addr_start,
          sr_start => sr_start,
          fifo_en => fifo_en,
          fifo_clk => fifo_clk,
          fifo_din => fifo_din,
          ram_addr => ram_addr,
          ram_data => ram_data,
          ram_update => ram_update,
          ram_busy => ram_busy
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

		win_addr_start<='0' & x"30";
		asic_no<=x"5";
		
      wait for clk_period*10;
		sr_start<='1';
		
      -- insert stimulus here 

      wait;
   end process;

END;
