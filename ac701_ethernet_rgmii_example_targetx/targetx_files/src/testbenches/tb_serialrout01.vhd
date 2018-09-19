--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:02:35 08/19/2014
-- Design Name:   
-- Module Name:   C:/Users/isar/Documents/code4/TX9UMB-2/ise-project/tb_serialrout01.vhd
-- Project Name:  scrod-boardstack-new-daq-interface
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SerialDataRout
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
 
ENTITY tb_serialrout01 IS
END tb_serialrout01;
 
ARCHITECTURE behavior OF tb_serialrout01 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SerialDataRout
    PORT(
         clk : IN  std_logic;
         start : IN  std_logic;
         EVENT_NUM : IN  std_logic_vector(31 downto 0);
         WIN_ADDR : IN  std_logic_vector(8 downto 0);
         ASIC_NUM : IN  std_logic_vector(3 downto 0);
         IDLE_status : OUT  std_logic;
         busy : OUT  std_logic;
         samp_done : OUT  std_logic;
         dout : IN  std_logic_vector(15 downto 0);
         sr_clr : OUT  std_logic;
         sr_clk : OUT  std_logic;
         sr_sel : OUT  std_logic;
         samplesel : OUT  std_logic_vector(4 downto 0);
         smplsi_any : OUT  std_logic;
         fifo_wr_en : OUT  std_logic;
         fifo_wr_clk : OUT  std_logic;
         fifo_wr_din : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal start : std_logic := '0';
   signal EVENT_NUM : std_logic_vector(31 downto 0) := (others => '0');
   signal WIN_ADDR : std_logic_vector(8 downto 0) := (others => '0');
   signal ASIC_NUM : std_logic_vector(3 downto 0) := (others => '0');
   signal dout : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal IDLE_status : std_logic;
   signal busy : std_logic;
   signal samp_done : std_logic;
   signal sr_clr : std_logic;
   signal sr_clk : std_logic;
   signal sr_sel : std_logic;
   signal samplesel : std_logic_vector(4 downto 0);
   signal smplsi_any : std_logic;
   signal fifo_wr_en : std_logic;
   signal fifo_wr_clk : std_logic;
   signal fifo_wr_din : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SerialDataRout PORT MAP (
          clk => clk,
          start => start,
          EVENT_NUM => EVENT_NUM,
          WIN_ADDR => WIN_ADDR,
          ASIC_NUM => ASIC_NUM,
          IDLE_status => IDLE_status,
          busy => busy,
          samp_done => samp_done,
          dout => dout,
          sr_clr => sr_clr,
          sr_clk => sr_clk,
          sr_sel => sr_sel,
          samplesel => samplesel,
          smplsi_any => smplsi_any,
          fifo_wr_en => fifo_wr_en,
          fifo_wr_clk => fifo_wr_clk,
          fifo_wr_din => fifo_wr_din
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

		start<='1';

      -- insert stimulus here 

      wait;
   end process;

END;
