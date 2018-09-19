----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:54:18 06/25/2015 
-- Design Name: 
-- Module Name:    eth_top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity eth_top is
    PORT(
--		board_clkp : in std_logic;
--		board_clkn : in std_logic;
        ext_user_clk            :in std_logic;
	    tx_udp_data             : in std_logic_vector(7 downto 0);
		tx_udp_valid            : in std_logic;
		tx_udp_ready            : out std_logic;
	    rx_udp_data             : out std_logic_vector(7 downto 0);
		rx_udp_valid            : out std_logic;
		rx_udp_ready            : in std_logic;
		trx_udp_clock			: out std_logic;
		
	    glbl_rst                : in std_logic;
        clk_in_p                : in std_logic;
        clk_in_n                : in std_logic;
        gtx_clk_bufg_out        : out std_logic;
        phy_resetn              : out std_logic;
        rgmii_txd               : out std_logic_vector(3 downto 0);
        rgmii_tx_ctl            : out std_logic;
        rgmii_txc               : out std_logic;
        rgmii_rxd               : in std_logic_vector(3 downto 0);
        rgmii_rx_ctl            : in std_logic;
        rgmii_rxc               : in std_logic;
        mdio                    : inout std_logic;
        mdc                     : out std_logic;
        tx_statistics_s         : out std_logic;
        rx_statistics_s         : out std_logic;
        pause_req_s             : in std_logic;
        mac_speed               : in std_logic_vector(1 downto 0);
        update_speed            : in std_logic;
        config_board            : in std_logic;
        serial_response         : out std_logic;
        gen_tx_data             : in std_logic;
        chk_tx_data             : in std_logic;
        reset_error             : in std_logic;
        frame_error             : out std_logic;
        frame_errorn            : out std_logic;
        activity_flash          : out std_logic;
        activity_flashn         : out std_logic
		);
end eth_top;

architecture Behavioral of eth_top is 

component udp
    generic(
	    ip_addr         : std_logic_vector(31 downto 0):= x"c0a81405";
	    dst_ip_addr     : std_logic_vector(31 downto 0) := x"c0a81401";
	    port_num        : std_logic_vector(15 downto 0):= x"6000";
	    dst_port_num    : std_logic_vector(15 downto 0):= x"7000";
        mac_addr        : std_logic_vector(47 downto 0):= x"aabbccddeeff";
--      dst_mac_addr : std_logic_vector(47 downto 0) := x"0023564c1962"--Bronson's PC
        dst_mac_addr    : std_logic_vector(47 downto 0):=x"be11e25CB0D5"--Belle II SCROD A5!-- x"0050B67C6C0F" --Isar's VM PC
    );
    port(
--		board_clkp : in std_logic;
--		board_clkn : in std_logic;
        ext_user_clk		: in std_logic;
	    tx_udp_data         : in std_logic_vector(7 downto 0);
		tx_udp_valid        : in std_logic;
		tx_udp_ready        : out std_logic;
	    rx_udp_data         : out std_logic_vector(7 downto 0);
		rx_udp_valid        : out std_logic;
		rx_udp_ready        : in std_logic;
		trx_udp_clock		: out std_logic;
        glbl_rst            : in std_logic;
        clk_in_p            : in std_logic;
        clk_in_n            : in std_logic;
        gtx_clk_bufg_out    : out std_logic;
        phy_resetn          : out std_logic;
        rgmii_txd           : out std_logic_vector(3 downto 0);
        rgmii_tx_ctl        : out std_logic;
        rgmii_txc           : out std_logic;
        rgmii_rxd           : in std_logic_vector(3 downto 0);
        rgmii_rx_ctl        : in std_logic;
        rgmii_rxc           : in std_logic;
        mdio                : inout std_logic;
        mdc                 : out std_logic;
        tx_statistics_s     : out std_logic;
        rx_statistics_s     : out std_logic;
        pause_req_s         : in std_logic;
        mac_speed           : in std_logic_vector(1 downto 0);
        update_speed        : in std_logic;
        config_board        : in std_logic;
        serial_response     : out std_logic;
        gen_tx_data         : in std_logic;
        chk_tx_data         : in std_logic;
        reset_error         : in std_logic;
        frame_error         : out std_logic;
        frame_errorn        : out std_logic;
        activity_flash      : out std_logic;
        activity_flashn     : out std_logic
    );
end component;

	signal clk_enable_1            : std_logic;
	signal speedis100_1	           : std_logic;
	signal speedis10100_1	       : std_logic;
	signal tx_statistics_s_1	   : std_logic;
	signal rx_statistics_s_1	   : std_logic;
	signal pause_req_s_1	       : std_logic;
	signal mac_speed_1	           : std_logic_vector(1 downto 0);
	signal update_speed_1	       : std_logic;
	signal config_board_1	       : std_logic;
	signal serial_response_1	   : std_logic;
	signal gen_tx_data_1	       : std_logic;
	signal chk_tx_data_1	       : std_logic;
	signal reset_error_1	       : std_logic;
	signal frame_error_1	       : std_logic;
	signal frame_errorn_1	       : std_logic;
	signal activity_flash_1	       : std_logic;
	signal activity_flashn_1	   : std_logic;
	signal phyad0_1	               : std_logic_vector(4 downto 0);
	signal configuration_vector0_1 : std_logic_vector(4 downto 0);
	signal configuration_valid0_1  : std_logic;
	signal link_timer_value0_1	   : std_logic_vector(8 downto 0);
	signal an_interrupt0_1	       : std_logic;
	signal an_adv_config_vector0_1 : std_logic_vector(15 downto 0);
	signal an_adv_config_val0_1	   : std_logic;
	signal an_restart_config0_1	   : std_logic;
	signal status_vector0_1	       : std_logic_vector(15 downto 0);
	signal reset0_1	               : std_logic := '0';
	signal signal_detect0_1	       : std_logic;
	signal mgtclk1p_1              : std_logic;
	signal mgtclk1n_1              : std_logic;
	signal mgtrxp_1                : std_logic;
	signal mgtrxn_1                : std_logic;
	signal mgttxp_1                : std_logic;
	signal mgttxn_1                : std_logic;
	signal txp1_1	               : std_logic;
	signal txn1_1	               : std_logic;
	signal rxp1_1	               : std_logic;
	signal rxn1_1	               : std_logic;

	signal board_clkp_1 : std_logic;
	signal board_clkn_1 : std_logic;
	
begin

    udp_1 : udp
    port map(
--	     board_clkp       => board_clkp_1,
--	     board_clkn       => board_clkn_1,
         ext_user_clk         => ext_user_clk,
	     tx_udp_data          => tx_udp_data,
	     tx_udp_valid         => tx_udp_valid ,  
	     tx_udp_ready         => tx_udp_ready ,   
	     rx_udp_data          => rx_udp_data ,        
         rx_udp_valid         => rx_udp_valid  ,      
	     rx_udp_ready         => rx_udp_ready ,        
	     trx_udp_clock        => trx_udp_clock,		

         glbl_rst             => glbl_rst,                
         clk_in_p             => clk_in_p,                
         clk_in_n             => clk_in_n,                
         gtx_clk_bufg_out     => gtx_clk_bufg_out,        
         phy_resetn           => phy_resetn,              
         rgmii_txd            => rgmii_txd,               
         rgmii_tx_ctl         => rgmii_tx_ctl,
         rgmii_txc            => rgmii_txc,               
         rgmii_rxd            => rgmii_rxd,               
         rgmii_rx_ctl         => rgmii_rx_ctl,            
         rgmii_rxc            => rgmii_rxc,               
         mdio                 => mdio,                    
         mdc                  => mdc,                    
         tx_statistics_s      => tx_statistics_s,      
         rx_statistics_s      => rx_statistics_s,      
         pause_req_s          => pause_req_s,       
         mac_speed            => mac_speed,      
         update_speed         => update_speed,     
         config_board         => config_board,     
         serial_response      => serial_response,     
         gen_tx_data          => gen_tx_data,      
         chk_tx_data          => chk_tx_data,      
         reset_error          => reset_error,   
         frame_error          => frame_error,      
         frame_errorn         => frame_errorn,      
         activity_flash       => activity_flash,      
         activity_flashn      => activity_flashn
    );

end Behavioral;

