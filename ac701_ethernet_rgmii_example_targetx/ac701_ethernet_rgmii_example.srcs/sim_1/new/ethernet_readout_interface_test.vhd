--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:22:40 10/27/2015
-- Design Name:   
-- Module Name:   C:/Users/Kevin/Desktop/KO/eth/bbb.vhd
-- Project Name:  eth
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ethernet_readout_interface 
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
 
ENTITY ethernet_readout_interface_test IS
END ethernet_readout_interface_test;
 
ARCHITECTURE behavior OF ethernet_readout_interface_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ethernet_readout_interface
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         wave_fifo_wr_en : IN  std_logic;
         wave_fifo_data : IN  std_logic_vector(31 downto 0);
         wave_fifo_reset : IN  std_logic;
         wave_fifo_event_rdy : IN  std_logic;
         tx_dac_busy : IN  std_logic;
         pedman_busy : IN  std_logic;
         mppc_dac_busy : IN  std_logic;
         rcl_fifo_rd_en : OUT  std_logic;
         rcl_fifo_data : IN  std_logic_vector(31 downto 0);
         rcl_fifo_empty : IN  std_logic;
         ctrl_mode : OUT  std_logic_vector(3 downto 0);
         glbl_rst : IN  std_logic;
         clk_in_p : IN  std_logic;
         clk_in_n : IN  std_logic;
         gtx_clk_bufg_out : OUT  std_logic;
         phy_resetn : OUT  std_logic;
         rgmii_txd : OUT  std_logic_vector(3 downto 0);
         rgmii_tx_ctl : OUT  std_logic;
         rgmii_txc : OUT  std_logic;
         rgmii_rxd : IN  std_logic_vector(3 downto 0);
         rgmii_rx_ctl : IN  std_logic;
         rgmii_rxc : IN  std_logic;
         mdio : INOUT  std_logic;
         mdc : OUT  std_logic;
         tx_statistics_s : OUT  std_logic;
         rx_statistics_s : OUT  std_logic;
         pause_req_s : IN  std_logic;
         mac_speed : IN  std_logic_vector(1 downto 0);
         update_speed : IN  std_logic;
         config_board : IN  std_logic;
         serial_response : OUT  std_logic;
         gen_tx_data : IN  std_logic;
         chk_tx_data : IN  std_logic;
         reset_error : IN  std_logic;
         frame_error : OUT  std_logic;
         frame_errorn : OUT  std_logic;
         activity_flash : OUT  std_logic;
         activity_flashn : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal wave_fifo_wr_en : std_logic := '0';
   signal wave_fifo_data : std_logic_vector(31 downto 0) := (others => '0');
   signal wave_fifo_reset : std_logic := '0';
   signal wave_fifo_event_rdy : std_logic := '0';
   signal tx_dac_busy : std_logic := '0';
   signal pedman_busy : std_logic := '0';
   signal mppc_dac_busy : std_logic := '0';
   signal rcl_fifo_data : std_logic_vector(31 downto 0) := (others => '0');
   signal rcl_fifo_empty : std_logic := '0';
   signal glbl_rst : std_logic := '0';
   signal clk_in_p : std_logic := '0';
   signal clk_in_n : std_logic := '0';
   signal rgmii_rxd : std_logic_vector(3 downto 0) := (others => '0');
   signal rgmii_rx_ctl : std_logic := '0';
   signal rgmii_rxc : std_logic := '0';
   signal pause_req_s : std_logic := '0';
   signal mac_speed : std_logic_vector(1 downto 0) := (others => '0');
   signal update_speed : std_logic := '0';
   signal config_board : std_logic := '0';
   signal gen_tx_data : std_logic := '0';
   signal chk_tx_data : std_logic := '0';
   signal reset_error : std_logic := '0';

	--BiDirs
   signal mdio : std_logic;

 	--Outputs
   signal rcl_fifo_rd_en : std_logic;
   signal ctrl_mode : std_logic_vector(3 downto 0);
   signal gtx_clk_bufg_out : std_logic;
   signal phy_resetn : std_logic;
   signal rgmii_txd : std_logic_vector(3 downto 0);
   signal rgmii_tx_ctl : std_logic;
   signal rgmii_txc : std_logic;
   signal mdc : std_logic;
   signal tx_statistics_s : std_logic;
   signal rx_statistics_s : std_logic;
   signal serial_response : std_logic;
   signal frame_error : std_logic;
   signal frame_errorn : std_logic;
   signal activity_flash : std_logic;
   signal activity_flashn : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant clk_in_p_period : time := 10 ns;
   constant clk_in_n_period : time := 10 ns;
 
 type data_type is array (natural range <>) of std_logic_vector(3 downto 0);
   constant data : data_type := (
   x"d", x"a", x"0", x"1", x"0", x"2", x"0", x"3", x"0", x"4", x"0", x"5",
   x"5", x"a", x"0", x"1", x"0", x"2", x"0", x"3", x"0", x"4", x"0", x"5",
   x"0", x"8", x"0", x"0",
   x"ff", x"fe", x"fd", x"fc", x"fb", x"fa", x"f9", x"f8",
   x"f7", x"f6", x"f5", x"f4", x"f3", x"f2", x"f1", x"f0",
   x"ef", x"ee", x"ed", x"ec", x"eb", x"ea", x"e9", x"e8",
   x"e7", x"e6", x"e5", x"e4", x"e3", x"e2", x"e1", x"e0");
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ethernet_readout_interface PORT MAP (
          clk => clk,
          reset => reset,
          wave_fifo_wr_en => wave_fifo_wr_en,
          wave_fifo_data => wave_fifo_data,
          wave_fifo_reset => wave_fifo_reset,
          wave_fifo_event_rdy => wave_fifo_event_rdy,
          tx_dac_busy => tx_dac_busy,
          pedman_busy => pedman_busy,
          mppc_dac_busy => mppc_dac_busy,
          rcl_fifo_rd_en => rcl_fifo_rd_en,
          rcl_fifo_data => rcl_fifo_data,
          rcl_fifo_empty => rcl_fifo_empty,
          ctrl_mode => ctrl_mode,
          glbl_rst => glbl_rst,
          clk_in_p => clk_in_p,
          clk_in_n => clk_in_n,
          gtx_clk_bufg_out => gtx_clk_bufg_out,
          phy_resetn => phy_resetn,
          rgmii_txd => rgmii_txd,
          rgmii_tx_ctl => rgmii_tx_ctl,
          rgmii_txc => rgmii_txc,
          rgmii_rxd => rgmii_rxd,
          rgmii_rx_ctl => rgmii_rx_ctl,
          rgmii_rxc => rgmii_rxc,
          mdio => mdio,
          mdc => mdc,
          tx_statistics_s => tx_statistics_s,
          rx_statistics_s => rx_statistics_s,
          pause_req_s => pause_req_s,
          mac_speed => mac_speed,
          update_speed => update_speed,
          config_board => config_board,
          serial_response => serial_response,
          gen_tx_data => gen_tx_data,
          chk_tx_data => chk_tx_data,
          reset_error => reset_error,
          frame_error => frame_error,
          frame_errorn => frame_errorn,
          activity_flash => activity_flash,
          activity_flashn => activity_flashn
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		clk_in_p <= '0';
		clk_in_n <= '1';
		rgmii_txc <= '0';
		rgmii_rxc <= '0';
		wait for 2 ns;
		clk <= '1';
		clk_in_p <= '1';
        clk_in_n <= '0';
        rgmii_txc <= '1';
        rgmii_rxc <= '1';
		wait for 2 ns;
   end process;
 


   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;
      rgmii_rxd <= x"0";
      rgmii_ctl <= '0';
      wait for 4 ns;
      rgmii_ctl <= '1';
      for i in 0 to 45*2+1 loop -- send half bytes backwards, kind of
        if i mod 2 = 0 then
            rgmii_rxd <= data(i+1);
            wait for 4 ns;
        else
            rgmii_rxd <= data(i-1);
            wait for 4 ns;
        end if;
      rgmii_ctl <= '0';
      end loop;

      wait;
   end process;

END;