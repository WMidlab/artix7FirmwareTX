---*********************************************************************************
-- Indiana University
-- Center for Exploration of Energy and Matter (CEEM)
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    06/04/2014
--
--*********************************************************************************
-- Description:
-- Test bench for top KLM Aurora interface. Connect two interaces and use the
-- "standard" frame generator and checker for stimulus/verification.
--*********************************************************************************
library ieee;
	use ieee.std_logic_1164.all;

entity klm_aurora_tb is
end klm_aurora_tb;

architecture behave of klm_aurora_tb is

    component klm_aurora_intfc is
    generic(
        REFSELDYPLL             : std_logic_vector(2 downto 0);
        SIM_GTPRESET_SPEEDUP    : integer);
    port(
        user_clk                : in std_logic;
        sync_clk                : in std_logic;
        reset                   : in std_logic;
        gt_reset                : in std_logic;
        plllock                 : in std_logic;
    -- LocalLink TX Interface
        tx_dst_rdy_n            : out std_logic;
        tx_src_rdy_n            : in std_logic;
        tx_sof_n                : in std_logic;
        tx_eof_n                : in std_logic;
        tx_d                    : in std_logic_vector(0 to 15);
        tx_rem                  : in std_logic;
    -- LocalLink RX Interface
        rx_src_rdy_n            : out std_logic;
        rx_sof_n                : out std_logic;
        rx_eof_n                : out std_logic;
        rx_rem                  : out std_logic;
        rx_d                    : out std_logic_vector(0 to 15);
    -- Status
        hard_err                : out std_logic;
        soft_err                : out std_logic;
        frame_err               : out std_logic;
        channel_up              : out std_logic;
        lane_up                 : out std_logic;
        warn_cc                 : out std_logic;
        do_cc                   : out std_logic;
    -- Control
        powerdown               : in std_logic;
        loopback                : in std_logic_vector(2 downto 0);
    -- GT I/O
        rxp                     : in std_logic;
        rxn                     : in std_logic;
        txp                     : out std_logic;
        txn                     : out std_logic);
    end component;
    
    component FRAME_GEN is
    port(
        -- User Interface
        TX_D                    : out std_logic_vector(0 to 15); 
        TX_REM                  : out std_logic;     
        TX_SOF_N                : out std_logic;
        TX_EOF_N                : out std_logic;
        TX_SRC_RDY_N            : out std_logic;
        TX_DST_RDY_N            : in std_logic;    
        -- System Interface
        USER_CLK                : in std_logic;   
        RESET                   : in std_logic;
        CHANNEL_UP              : in std_logic); 
    end component;    
    
    component FRAME_CHECK is
    port(
        -- User Interface
        RX_D                    : in  std_logic_vector(0 to 15); 
        RX_REM                  : in  std_logic;     
        RX_SOF_N                : in  std_logic;
        RX_EOF_N                : in  std_logic;
        RX_SRC_RDY_N            : in  std_logic;
        -- System Interface
        USER_CLK                : in  std_logic;   
        RESET                   : in  std_logic;
        CHANNEL_UP              : in  std_logic;
        ERR_COUNT               : out std_logic_vector(0 to 7));
    end component;    

	constant UCKPER             : time 		                    := 8 ns;
	constant UCKHLFPER          : time		                    := UCKPER/2;
	constant UCKQTRPER          : time		                    := UCKPER/4;
    constant NUM_MGT            : integer                       := 2;
    constant CLKSEL             : std_logic_vector(2 downto 0)  := "010";--PLLCLK (bad idea)

    type tb_lld_type is array (1 to NUM_MGT) of std_logic_vector(15 downto 0);
    type tb_lb_type is array (1 to NUM_MGT) of std_logic_vector(2 downto 0);
    type tb_err_type is array (1 to NUM_MGT) of std_logic_vector(0 to 7);
    type tb_sfp_type is array (1 to 2) of std_logic_vector(1 to NUM_MGT);

    signal user_clk             : std_logic := '1';
    signal sync_clk             : std_logic := '1';
    signal reset                : std_logic;
    signal gt_reset             : std_logic;
    signal plllock              : std_logic;
    signal tx_dst_rdy_n         : std_logic_vector(1 to NUM_MGT);
    signal tx_src_rdy_n         : std_logic_vector(1 to NUM_MGT);
    signal tx_sof_n             : std_logic_vector(1 to NUM_MGT);
    signal tx_eof_n             : std_logic_vector(1 to NUM_MGT);
    signal tx_d                 : tb_lld_type;
    signal tx_rem               : std_logic_vector(1 to NUM_MGT);
    signal rx_src_rdy_n         : std_logic_vector(1 to NUM_MGT);
    signal rx_sof_n             : std_logic_vector(1 to NUM_MGT);
    signal rx_eof_n             : std_logic_vector(1 to NUM_MGT);
    signal rx_rem               : std_logic_vector(1 to NUM_MGT);
    signal rx_d                 : tb_lld_type;
    signal hard_err             : std_logic_vector(1 to NUM_MGT);
    signal soft_err             : std_logic_vector(1 to NUM_MGT);
    signal frame_err            : std_logic_vector(1 to NUM_MGT);
    signal channel_up           : std_logic_vector(1 to NUM_MGT);
    signal lane_up              : std_logic_vector(1 to NUM_MGT);
    signal warn_cc              : std_logic_vector(1 to NUM_MGT);
    signal do_cc                : std_logic_vector(1 to NUM_MGT);
    signal powerdown            : std_logic_vector(1 to NUM_MGT);
    signal loopback             : tb_lb_type;
    signal err_count            : tb_err_type;

    signal mgttxfault           : tb_sfp_type;
    signal mgtmod0              : tb_sfp_type;
    signal mgtlos               : tb_sfp_type;

    signal mgttxdis             : tb_sfp_type;
    signal mgtmod2              : tb_sfp_type;
    signal mgtmod1              : tb_sfp_type;
    signal mgtrate              : tb_sfp_type;

    signal rxp                  : std_logic_vector(1 to NUM_MGT);
    signal rxn                  : std_logic_vector(1 to NUM_MGT);
    signal txp                  : std_logic_vector(1 to NUM_MGT);
    signal txn                  : std_logic_vector(1 to NUM_MGT);

begin

--------------------------------------------------------------------------------
-- Instantiate two concenrator boards.
--------------------------------------------------------------------------------
    UUT1 : klm_aurora_intfc
    generic map(
        REFSELDYPLL             => CLKSEL,
        SIM_GTPRESET_SPEEDUP    => 1)
    port map(
        user_clk                => user_clk,
        sync_clk                => synC_clk,
        reset                   => reset,
        gt_reset                => gt_reset,
        plllock                 => plllock,
        -- LocalLink TX Interface
        tx_dst_rdy_n            => tx_dst_rdy_n(1),
        tx_src_rdy_n            => tx_src_rdy_n(1),
        tx_sof_n                => tx_sof_n(1),
        tx_eof_n                => tx_eof_n(1),
        tx_d                    => tx_d(1),
        tx_rem                  => tx_rem(1),
        -- LocalLink RX Interface
        rx_src_rdy_n            => rx_src_rdy_n(1),
        rx_sof_n                => rx_sof_n(1),
        rx_eof_n                => rx_eof_n(1),
        rx_rem                  => rx_rem(1),
        rx_d                    => rx_d(1),
        -- Status
        hard_err                => hard_err(1),
        soft_err                => soft_err(1),
        frame_err               => frame_err(1),
        channel_up              => channel_up(1),
        lane_up                 => lane_up(1),
        warn_cc                 => warn_cc(1),
        do_cc                   => do_cc(1),
        -- Control
        powerdown               => powerdown(1),
        loopback                => loopback(1),
        -- GT I/O
        rxp                     => rxp(1),
        rxn                     => rxn(1),
        txp                     => txp(1),
        txn                     => txn(1)
    );
    
    fg1_ins : FRAME_GEN
    port map(
        -- User Interface
        TX_D                    => tx_d(1), 
        TX_REM                  => tx_rem(1),
        TX_SOF_N                => tx_sof_n(1),
        TX_EOF_N                => tx_eof_n(1),
        TX_SRC_RDY_N            => tx_src_rdy_n(1),
        TX_DST_RDY_N            => tx_dst_rdy_n(1),
        -- System Interface     
        USER_CLK                => user_clk,
        RESET                   => reset,
        CHANNEL_UP              => channel_up(1)
    );
    
    fc1_ins : FRAME_CHECK
    port map(
        -- User Interface
        RX_D                    => rx_d(1), 
        RX_REM                  => rx_rem(1),
        RX_SOF_N                => rx_sof_n(1),
        RX_EOF_N                => rx_eof_n(1),
        RX_SRC_RDY_N            => rx_src_rdy_n(1),
        -- System Interface     
        USER_CLK                => user_clk,
        RESET                   => reset,
        CHANNEL_UP              => channel_up(1),
        ERR_COUNT               => err_count(1) 
    );

    UUT2 : klm_aurora_intfc
    generic map(
        REFSELDYPLL             => CLKSEL,
        SIM_GTPRESET_SPEEDUP    => 1)
    port map(
        user_clk                => user_clk,
        sync_clk                => sync_clk,
        reset                   => reset,
        gt_reset                => gt_reset,
        plllock                 => plllock,
        -- LocalLink TX Interface
        tx_dst_rdy_n            => tx_dst_rdy_n(2),
        tx_src_rdy_n            => tx_src_rdy_n(2),
        tx_sof_n                => tx_sof_n(2),
        tx_eof_n                => tx_eof_n(2),
        tx_d                    => tx_d(2),
        tx_rem                  => tx_rem(2),
        -- LocalLink RX Interface
        rx_src_rdy_n            => rx_src_rdy_n(2),
        rx_sof_n                => rx_sof_n(2),
        rx_eof_n                => rx_eof_n(2),
        rx_rem                  => rx_rem(2),
        rx_d                    => rx_d(2),
        -- Status
        hard_err                => hard_err(2),
        soft_err                => soft_err(2),
        frame_err               => frame_err(2),
        channel_up              => channel_up(2),
        lane_up                 => lane_up(2),
        warn_cc                 => warn_cc(2),
        do_cc                   => do_cc(2),
        -- Control
        powerdown               => powerdown(2),
        loopback                => loopback(2),
        -- GT I/O
        rxp                     => rxp(2),
        rxn                     => rxn(2),
        txp                     => txp(2),
        txn                     => txn(2)
    );
    
    fg2_ins : FRAME_GEN
    port map(
        -- User Interface
        TX_D                    => tx_d(2), 
        TX_REM                  => tx_rem(2),
        TX_SOF_N                => tx_sof_n(2),
        TX_EOF_N                => tx_eof_n(2),
        TX_SRC_RDY_N            => tx_src_rdy_n(2),
        TX_DST_RDY_N            => tx_dst_rdy_n(2),
        -- System Interface     
        USER_CLK                => user_clk,
        RESET                   => reset,
        CHANNEL_UP              => channel_up(2)
    );
    
    fc2_ins : FRAME_CHECK
    port map(
        -- User Interface
        RX_D                    => rx_d(2), 
        RX_REM                  => rx_rem(2),
        RX_SOF_N                => rx_sof_n(2),
        RX_EOF_N                => rx_eof_n(2),
        RX_SRC_RDY_N            => rx_src_rdy_n(2),
        -- System Interface     
        USER_CLK                => user_clk,
        RESET                   => reset,
        CHANNEL_UP              => channel_up(2),
        ERR_COUNT               => err_count(2) 
    );    

    --------------------------------------------------------------------------
	-- Generate misc. stimulus
    --------------------------------------------------------------------------
	-- Generate clocks
	user_clk <= (not user_clk) after UCKHLFPER;
    sync_clk <= (not sync_clk) after UCKQTRPER;
    -- Generate resets
    reset       <= '1', '0' after UCKPER*4;
    gt_reset    <= '1', '0' after UCKPER*4;
    
    plllock <= '0', '1' after UCKPER*4;
    powerdown <= "00";
    loopback <= "000" & "000";
    
    mgttxfault  <= (others => (others => '0'));
    mgtmod0     <= (others => (others => '0'));
    mgtlos      <= (others => (others => '0'));

    rxp(1) <= txp(2);
    rxn(1) <= txn(2);
    rxp(2) <= txp(1);
    rxn(2) <= txn(1);
	------------------------------------------------------


end behave;