-- name: Kevin Oshiro
-- date: 8/12/15
-- description: connects ip/udp tx and rx blocks, eth_head and eth, and pattern generator (if testing)
--
-- modifications to be made: ready signals
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity udp is
    generic(
	   ip_addr         : std_logic_vector(31 downto 0);
	   dst_ip_addr     : std_logic_vector(31 downto 0);
	   port_num        : std_logic_vector(15 downto 0);
	   dst_port_num    : std_logic_vector(15 downto 0);
	   mac_addr        : std_logic_vector(47 downto 0);
	   dst_mac_addr    : std_logic_vector(47 downto 0)
	);
	port(
		ext_user_clk               : in std_logic;
		tx_udp_data                : in std_logic_vector(7 downto 0);
		tx_udp_valid               : in std_logic;
		tx_udp_ready               : out std_logic;
	    rx_udp_data                : out std_logic_vector(7 downto 0);
		rx_udp_valid               : out std_logic;
		rx_udp_ready               : in std_logic;
		trx_udp_clock			   : out std_logic;

        glbl_rst                   : in std_logic;
        clk_in_p                   : in std_logic;
        clk_in_n                   : in std_logic;
        gtx_clk_bufg_out           : out std_logic;
        phy_resetn                 : out std_logic;
        rgmii_txd                  : out std_logic_vector(3 downto 0);
        rgmii_tx_ctl               : out std_logic;
        rgmii_txc                  : out std_logic;
        rgmii_rxd                  : in std_logic_vector(3 downto 0);
        rgmii_rx_ctl               : in std_logic;
        rgmii_rxc                  : in std_logic;
        mdio                       : inout std_logic;
        mdc                        : out std_logic;
        tx_statistics_s            : out std_logic;
        rx_statistics_s            : out std_logic;
        pause_req_s                : in std_logic;
        mac_speed                  : in std_logic_vector(1 downto 0);
        update_speed               : in std_logic;
        config_board               : in std_logic;
        serial_response            : out std_logic;
        gen_tx_data                : in std_logic;
        chk_tx_data                : in std_logic;
        reset_error                : in std_logic;
        frame_error                : out std_logic;
        frame_errorn               : out std_logic;
        activity_flash             : out std_logic;
        activity_flashn            : out std_logic
    );
end udp;

architecture Behavioral of udp is

-- component basic_pat_gen
-- port (
--  an_done : in std_logic; --added to delay packets until autonegotiation is done
--  axi_tclk                     : in  std_logic;
--  axi_tresetn                  : in  std_logic;
--
--  -- data from the RX data path
--
--  rx_udp_data                : in  std_logic_vector(7 downto 0);
--  rx_udp_valid               : in  std_logic;
--  rx_udp_ready               : out std_logic;
--  -- data TO the TX data path
--
--  tx_udp_data                : out std_logic_vector(7 downto 0);
--  tx_udp_valid               : out std_logic;
--  tx_udp_ready               : in  std_logic
--
-- );
-- end component;


component ip_udp_tx_block
    generic(
		ip_addr       : std_logic_vector(31 downto 0);
		dst_ip_addr   : std_logic_vector(31 downto 0);
		port_num      : std_logic_vector(15 downto 0);
		dst_port_num  : std_logic_vector(15 downto 0)
		);
	port(
	   axi_tclk : in std_logic;
	   axi_tresetn : in std_logic;
	
	   -- MAC side
	   tx_eth_data     : out std_logic_vector(7 downto 0);
	   tx_eth_valid    : out std_logic;
	   tx_eth_last     : out std_logic;
--	     tx_eth_ready : in std_logic;
	
	   tx_udp_data     : in std_logic_vector(7 downto 0);
	   tx_udp_valid    : in std_logic;
	   tx_udp_ready    : out std_logic
	);
end component;

component ip_udp_rx_block
	generic(
		ip_addr : std_logic_vector(31 downto 0);
		port_num : std_logic_vector(15 downto 0)
		);
	port(
		axi_tclk : in std_logic;
		axi_tresetn : in std_logic;
		-- MAC side
		rx_eth_data : in std_logic_vector(7 downto 0);
		rx_eth_valid : in std_logic;
		rx_eth_last : in std_logic;
--		rx_eth_ready : out std_logic;
		-- user side
		rx_udp_data : out std_logic_vector(7 downto 0);
		rx_udp_valid : out std_logic
--		rx_udp_ready : in std_logic
	);
end component;

signal axi_tclk_1       : std_logic;
signal axi_tresetn_1    : std_logic;

signal an_done_1        : std_logic;

signal tx_udp_data_1    : std_logic_vector(7 downto 0);
signal tx_udp_valid_1   : std_logic;
signal tx_udp_ready_1   : std_logic;

--signal rx_udp_data_1 : std_logic_vector(7 downto 0);
--signal rx_udp_valid_1 : std_logic;
--signal rx_udp_ready_1 : std_logic;
signal tx_eth_data_1    : std_logic_vector(7 downto 0);
signal tx_eth_valid_1   : std_logic;
signal tx_eth_last_1    : std_logic;
signal tx_eth_ready_1   : std_logic;

signal rx_eth_data_1    : std_logic_vector(7 downto 0);
signal rx_eth_valid_1   : std_logic;
signal rx_eth_last_1    : std_logic;
signal rx_eth_ready_1   : std_logic;
signal tx_temac_data_1  : std_logic_vector(7 downto 0);
signal tx_temac_valid_1 : std_logic;
signal tx_temac_last_1  : std_logic;
signal tx_temac_ready_1 : std_logic;

signal rx_temac_data_1  : std_logic_vector(7 downto 0);
signal rx_temac_valid_1 : std_logic;
signal rx_temac_last_1  : std_logic;
signal rx_temac_ready_1 : std_logic;

--attribute keep : string;
--attribute keep of rx_udp_data : signal is "true";
--attribute keep of rx_udp_valid : signal is "true";

attribute dont_touch : string;
--attribute dont_touch of rx_udp_data_1 : signal is "true";
--attribute dont_touch of rx_udp_valid_1 : signal is "true";
attribute dont_touch of rx_eth_data_1 : signal is "true";
attribute dont_touch of rx_eth_valid_1 : signal is "true";
attribute dont_touch of rx_eth_last_1 : signal is "true";
attribute dont_touch of rx_temac_data_1 : signal is "true";
attribute dont_touch of rx_temac_valid_1 : signal is "true";
attribute dont_touch of rx_temac_last_1 : signal is "true";

attribute dont_touch of tx_udp_data_1 : signal is "true";
attribute dont_touch of tx_udp_valid_1 : signal is "true";
attribute dont_touch of tx_udp_ready_1 : signal is "true";
attribute dont_touch of tx_eth_data_1 : signal is "true";
attribute dont_touch of tx_eth_valid_1 : signal is "true";
attribute dont_touch of tx_eth_last_1 : signal is "true";
attribute dont_touch of tx_temac_data_1 : signal is "true";
attribute dont_touch of tx_temac_valid_1 : signal is "true";
attribute dont_touch of tx_temac_last_1 : signal is "true";

--attribute keep of  : signal is "true";
--attribute mark_debug : string;
--attribute mark_debug of rx_udp_data_1 : signal is "true";
--attribute mark_debug of rx_udp_valid_1 : signal is "true";
--attribute mark_debug of rx_udp_ready_1 : signal is "true";
--attribute mark_debug of tx_udp_data_1 : signal is "true";
--attribute mark_debug of tx_udp_valid_1 : signal is "true";
--attribute mark_debug of rgmii_txd : signal is "true";
--attribute mark_debug of rgmii_tx_ctl : signal is "true";
--attribute mark_debug of rgmii_txc : signal is "true";
--attribute mark_debug of rgmii_rxd : signal is "true";
--attribute mark_debug of rgmii_rx_ctl : signal is "true";
--attribute mark_debug of rgmii_rxc : signal is "true";

begin

eth_inst : entity work.ac701_ethernet_rgmii_example_design--eth
    port map(

        glbl_rst              => glbl_rst,                
        clk_in_p              => clk_in_p,                
        clk_in_n              => clk_in_n,                
        gtx_clk_bufg_out      => gtx_clk_bufg_out,        
        phy_resetn            => phy_resetn,              
        rgmii_txd             => rgmii_txd,               
        rgmii_tx_ctl          => rgmii_tx_ctl,
        rgmii_txc             => rgmii_txc,               
        rgmii_rxd             => rgmii_rxd,               
        rgmii_rx_ctl          => rgmii_rx_ctl,            
        rgmii_rxc             => rgmii_rxc,               
        mdio                  => mdio,                    
        mdc                   => mdc,                    
        tx_statistics_s       => tx_statistics_s,      
        rx_statistics_s       => rx_statistics_s,      
        pause_req_s           => pause_req_s,       
        mac_speed             => mac_speed,      
        update_speed          => update_speed,     
        config_board          => config_board,     
        serial_response       => serial_response,     
        gen_tx_data           => gen_tx_data,      
        chk_tx_data           => chk_tx_data,      
        reset_error           => reset_error,   
        frame_error           => frame_error,      
        frame_errorn          => frame_errorn,      
        activity_flash        => activity_flash,      
        activity_flashn       => activity_flashn,      
        
		tx_axis_fifo_tdata    => tx_temac_data_1,
		tx_axis_fifo_tvalid   => tx_temac_valid_1,
		tx_axis_fifo_tlast    => tx_temac_last_1,
--		tx_axis_fifo_tready     => tx_temac_ready_1,
		
		rx_axis_fifo_tdata    => rx_temac_data_1,
		rx_axis_fifo_tvalid   => rx_temac_valid_1,
		rx_axis_fifo_tlast    => rx_temac_last_1,
		rx_axis_fifo_tready   => '1',--rx_temac_ready_1,
		
		an_done               => an_done_1,
		axi_tclk              => axi_tclk_1,
		axi_tresetn           => axi_tresetn_1
    );

    trx_udp_clock<= axi_tclk_1;

    ip_udp_tx_block_inst: ip_udp_tx_block 
	   GENERIC MAP (
	        ip_addr => ip_addr,
	        dst_ip_addr => dst_ip_addr,
            port_num => port_num,
            dst_port_num => dst_port_num
			)
	   PORT MAP (
            axi_tclk => axi_tclk_1,
            axi_tresetn => axi_tresetn_1, 
            tx_eth_data => tx_eth_data_1,
            tx_eth_valid => tx_eth_valid_1,
            tx_eth_last => tx_eth_last_1,
--          tx_eth_ready => tx_eth_ready_1,
            tx_udp_data => tx_udp_data,-- goes to top module instead of patgem
            tx_udp_valid => tx_udp_valid,
			tx_udp_ready => tx_udp_ready
        );
        
	ip_udp_rx_block_inst: ip_udp_rx_block
	   GENERIC MAP (
			ip_addr => ip_addr,
			port_num => port_num
			)
	   PORT MAP (
			axi_tclk => axi_tclk_1,
			axi_tresetn => axi_tresetn_1,
			rx_eth_data => rx_eth_data_1,
			rx_eth_valid => rx_eth_valid_1,
			rx_eth_last => rx_eth_last_1,
--			rx_eth_ready => rx_eth_ready_1,
			rx_udp_data => rx_udp_data,
			rx_udp_valid => rx_udp_valid
--			rx_udp_ready => rx_udp_ready_1
			);
	
   eth_head_inst: entity work.eth_head 
	   GENERIC MAP (
			mac_addr => mac_addr,
			dst_mac_addr => dst_mac_addr
			)
	   PORT MAP (
            axi_tclk => axi_tclk_1,
            axi_tresetn => axi_tresetn_1,
            tx_eth_data => tx_eth_data_1,
            tx_eth_valid => tx_eth_valid_1,
            tx_eth_last => tx_eth_last_1,
 --         tx_eth_ready => tx_eth_ready_1,
            tx_temac_data => tx_temac_data_1,
            tx_temac_valid => tx_temac_valid_1,
            tx_temac_last => tx_temac_last_1,
 --         tx_temac_ready => tx_temac_ready_1
            rx_eth_data => rx_eth_data_1,
            rx_eth_valid => rx_eth_valid_1,
            rx_eth_last => rx_eth_last_1,
--          rx_eth_ready => rx_eth_ready,
            rx_temac_data => rx_temac_data_1,
            rx_temac_valid => rx_temac_valid_1,
            rx_temac_last => rx_temac_last_1
--          rx_temac_ready => rx_temac_ready
        );
        
end Behavioral;

