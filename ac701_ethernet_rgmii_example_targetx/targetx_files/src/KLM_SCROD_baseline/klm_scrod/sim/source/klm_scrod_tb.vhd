---*********************************************************************************
-- Indiana University
-- Center for Exploration of Energy and Matter (CEEM)
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    09/26/2011
--
--*********************************************************************************
-- Description:
-- Test bench for top level KLM SCROD FPGA.
--
-- Deficiencies/Know Issues
--
--*********************************************************************************
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
library ft2u_lib;
    use ft2u_lib.all;
library work;
    use work.klm_scrod_pkg.all;
    use work.time_order_pkg.all;
    use work.tdc_pkg.all;
    use work.conc_intfc_pkg.all;


entity klm_scrod_tb is
end klm_scrod_tb;

architecture behave of klm_scrod_tb is

    component targetx is
    generic(
        USE_PRNG                    : std_logic);
    port(
        clk                         : in std_logic;
        ce                          : in std_logic;
        stim_enable                 : in std_logic;
        run_reset                   : in std_logic;
        tb                          : out std_logic_vector(5 downto 1);
        tb16                        : out std_logic);
    end component;

    component run_ctrl_stim is
    generic(
        USE_LFSR                    : std_logic;
        PKT_SZ                      : integer;
        CLKPER                      : time);
    port(
        clk                         : in std_logic;
        stim_enable                 : in std_logic;
        tx_dst_rdy_n                : in std_logic;
        tx_sof_n                    : out std_logic;
        tx_eof_n                    : out std_logic;
        tx_src_rdy_n                : out std_logic;
        tx_rem                      : out std_logic;
        tx_data                     : out std_logic_vector (15 downto 0));
    end component;

    component klm_aurora_intfc is    generic(
        SIM_GTPRESET_SPEEDUP        : integer);
    port(
        refseldypll                 : std_logic_vector(2 downto 0);
        ref_clk0                    : in std_logic;
        ref_clk1                    : in std_logic;
        user_clk                    : in std_logic;
        sync_clk                    : in std_logic;
        reset                       : in std_logic;
        gt_reset                    : in std_logic;
        plllock                     : in std_logic;
    -- LocalLink TX Interface
        tx_dst_rdy_n                : out std_logic;
        tx_src_rdy_n                : in std_logic;
        tx_sof_n                    : in std_logic;
        tx_eof_n                    : in std_logic;
        tx_d                        : in std_logic_vector(0 to 15);
        tx_rem                      : in std_logic;
    -- LocalLink RX Interface
        rx_src_rdy_n                : out std_logic;
        rx_sof_n                    : out std_logic;
        rx_eof_n                    : out std_logic;
        rx_rem                      : out std_logic;
        rx_d                        : out std_logic_vector(0 to 15);
    -- Status
        gtlock                      : out std_logic;
        hard_err                    : out std_logic;
        soft_err                    : out std_logic;
        frame_err                   : out std_logic;
        channel_up                  : out std_logic;
        lane_up                     : out std_logic;
        warn_cc                     : out std_logic;
        do_cc                       : out std_logic;
    -- Control
        powerdown                   : in std_logic;
        loopback                    : in std_logic_vector(2 downto 0);
    -- GT I/O
        rxp                         : in std_logic;
        rxn                         : in std_logic;
        txp                         : out std_logic;
        txn                         : out std_logic);
    end component;

    component klm_scrod is
    generic(
        NUM_GTS                     : integer;
        REVISION                    : string;  --A2,A3,A4
        CLKSRC                      : string;--FTSW, OBOSC
        AURORA_CC_USE               : boolean;
        LINK_TEST                   : std_logic;
        B2TT_SIM_SPEEDUP            : std_logic;
        DAQ_GEN_SIM_SPEEDUP         : std_logic);
    port(
        --tdc_sync                    : in std_logic;
        -- TTD/FTSW interface
        ttdclkp                     : in std_logic;
        ttdclkn                     : in std_logic;
        ttdtrgp                     : in std_logic;
        ttdtrgn                     : in std_logic;
        ttdrsvp                     : out std_logic;
        ttdrsvn                     : out std_logic;
        ttdackp                     : out std_logic;
        ttdackn                     : out std_logic;
        -- ASIC Interface
        target_tb                   : in tb_vec_type;
        target_tb16                 : in std_logic_vector(1 to TDC_NUM_CHAN);
        -- SFP interface
        mgttxfault                  : in std_logic_vector(1 to NUM_GTS);
        mgtmod0                     : in std_logic_vector(1 to NUM_GTS);
        mgtlos                      : in std_logic_vector(1 to NUM_GTS);
        mgttxdis                    : out std_logic_vector(1 to NUM_GTS);
        mgtmod2                     : out std_logic_vector(1 to NUM_GTS);
        mgtmod1                     : out std_logic_vector(1 to NUM_GTS);
        mgtclk0p                    : in std_logic;
        mgtclk0n                    : in std_logic;
        mgtclk1p                    : in std_logic;
        mgtclk1n                    : in std_logic;
        mgtrxp                      : in std_logic;
        mgtrxn                      : in std_logic;
        mgttxp                      : out std_logic;
        mgttxn                      : out std_logic;
        ex_trig1                    : in std_logic;--fake address bit
        exttb                       : out tb_vec_type;
        ftsw_aux                    : out std_logic;
        status_fake                 : out std_logic;
        control_fake                : out std_logic;
        scint_trg                   : out std_logic;
        scint_trg_ctime             : out std_logic_vector(15 downto 0);
        scint_missed_trg            : out std_logic_vector(15 downto 0);
        scint_trg_rdy               : in std_logic;
        qt_fifo_rd_clk              : out std_logic;
        qt_fifo_rd_en               : out std_logic;
        qt_fifo_rd_d                : in std_logic_vector(17 downto 0);
        qt_fifo_empty               : in std_logic;
        qt_fifo_almost_empty        : in std_logic;
        qt_fifo_evt_rdy             : in std_logic;
        zlt                         : in std_logic);
    end component;

    -- Clocks --------------------------------
    -- No idea
	constant FICKPER                : time 		                    := 32.3 ns;
	constant FICKHPER               : time		                    := FICKPER/2;
    -- RF clock derivatives
	constant FLCKPER                : time 		                    := 7.86 ns;
	constant FLCKHPER               : time		                    := FLCKPER/2;
	constant FJCKPER                : time 		                    := 7.86 ns;
	constant FJCKHPER               : time		                    := FJCKPER/2;
    ------------------------------------------

    constant USE_PRNG               : std_logic                     := '0';
    constant USE_LFSR               : std_logic                     := '0'; -- use LFSR for dst_rdy generation
    constant RNCTRL_PKT_SZ          : integer                       := 16;
    constant UCKPER                 : time                          := 8 ns;
    constant UCKHLFPER              : time                          := UCKPER/2;
    constant UCKQTRPER              : time                          := UCKPER/4;
    constant NUM_MGT                : integer                       := 1;
    constant CLKSEL                 : std_logic_vector(2 downto 0)  := "010";--PLLCLK (bad idea)

    type tb_lld_type is array (1 to NUM_MGT) of std_logic_vector(15 downto 0);
    type tb_lb_type is array (1 to NUM_MGT) of std_logic_vector(2 downto 0);
    type tb_err_type is array (1 to NUM_MGT) of std_logic_vector(0 to 7);
    type tb_sfp_type is array (1 to 2) of std_logic_vector(1 to NUM_MGT);

    signal stim_enable              : std_logic                             := '0';
    signal full_reg                 : std_logic_vector(15 downto 0);

    signal f2tu_f_led1y_b           : std_logic;
    signal f2tu_f_d                 : std_logic_vector(31 downto 0);
    signal f2tu_f_a                 : std_logic_vector(15 downto 4);
    signal ft2u_ads                 : std_logic;
    signal ft2u_wr                  : std_logic;
    signal ft2u_c_id1               : std_logic;
    signal ft2u_c_id2               : std_logic;
    signal ft2u_f_xen               : std_logic;
    signal ft2u_f_ckmux             : std_logic_vector(1  downto 0);
    signal ft2u_f_tck               : std_logic;
    signal ft2u_f_tms               : std_logic;
    signal ft2u_f_tdi               : std_logic;
    signal ft2u_f_tdo               : std_logic;
    signal ft2u_j_pd_b              : std_logic;
    signal ft2u_j_plllock           : std_logic;
    signal ft2u_j_spiclk            : std_logic;
    signal ft2u_j_spile             : std_logic;
    signal ft2u_j_spimiso           : std_logic;
    signal ft2u_j_spimosi           : std_logic;
    signal ft2u_j_testsync          : std_logic;
    signal ft2u_f_ick_p             : std_logic                         := '0';
    signal ft2u_f_ick_n             : std_logic;
    signal ft2u_f_lck_p             : std_logic                         := '0';
    signal ft2u_f_lck_n             : std_logic;
    signal ft2u_s_jck_p             : std_logic                         := '0';
    signal ft2u_s_jck_n             : std_logic;
    signal ft2u_o_aux_n             : std_logic_vector(1 downto 0);
    signal ft2u_o_aux_p             : std_logic_vector(1 downto 0);
    signal ft2u_i_aux_n             : std_logic_vector(3 downto 2)      := (others => '0');
    signal ft2u_i_aux_p             : std_logic_vector(3 downto 2)      := (others => '0');
    signal ft2u_i_trg_n             : std_logic;
    signal ft2u_i_trg_p             : std_logic                         := '0';
    signal ft2u_i_ack_n             : std_logic;
    signal ft2u_i_ack_p             : std_logic                         := '1';
    signal ft2u_o_clk_n             : std_logic_vector(20 downto 1);
    signal ft2u_o_clk_p             : std_logic_vector(20 downto 1);
    signal ft2u_o_trg_n             : std_logic_vector(20 downto 1);
    signal ft2u_o_trg_p             : std_logic_vector(20 downto 1);
    signal ft2u_o_ack_n             : std_logic_vector(20 downto 1);
    signal ft2u_o_ack_p             : std_logic_vector(20 downto 1);
    signal ft2u_o_rsv_n             : std_logic_vector(20 downto 1);
    signal ft2u_o_rsv_p             : std_logic_vector(20 downto 1);
    signal ft2u_i_ledy_b            : std_logic;
    signal ft2u_i_ledg_b            : std_logic;
    signal ft2u_o_ledy_b            : std_logic_vector (20 downto 1);
    signal ft2u_o_ledg_b            : std_logic_vector (20 downto 1);
    signal ft2u_m_a                 : std_logic_vector (6 downto 0);
    signal ft2u_m_d                 : std_logic_vector (7 downto 0);
    signal ft2u_m_wr                : std_logic;
    signal ft2u_m_ads               : std_logic;
    signal ft2u_m_lck               : std_logic;

    signal target_reset             : std_logic;
    signal target_tb                : tb_vec_type;
    signal target_tb16              : std_logic_vector(1 to TDC_NUM_CHAN);

    signal conc_user_clk            : std_logic := '1';
    signal conc_sync_clk            : std_logic := '1';
    signal conc_reset               : std_logic;
    signal conc_gt_reset            : std_logic;
    signal conc_plllock             : std_logic;
    signal conc_tx_dst_rdy_n        : std_logic;
    signal conc_tx_src_rdy_n        : std_logic;
    signal conc_tx_sof_n            : std_logic;
    signal conc_tx_eof_n            : std_logic;
    signal conc_tx_d                : std_logic_vector(15 downto 0);
    signal conc_tx_rem              : std_logic;
    signal conc_rx_src_rdy_n        : std_logic;
    signal conc_rx_sof_n            : std_logic;
    signal conc_rx_eof_n            : std_logic;
    signal conc_rx_rem              : std_logic;
    signal conc_rx_d                : std_logic_vector(15 downto 0);
    signal conc_gtlock              : std_logic;
    signal conc_hard_err            : std_logic;
    signal conc_soft_err            : std_logic;
    signal conc_frame_err           : std_logic;
    signal conc_channel_up          : std_logic;
    signal conc_lane_up             : std_logic;
    signal conc_warn_cc             : std_logic;
    signal conc_do_cc               : std_logic;
    signal conc_powerdown           : std_logic;
    signal conc_loopback            : std_logic_vector(2 downto 0);
    signal conc_err_count           : std_logic_vector(7 downto 0);
    signal conc_rxp                 : std_logic;
    signal conc_rxn                 : std_logic;
    signal conc_txp                 : std_logic;
    signal conc_txn                 : std_logic;

    signal scrod_ttdclk_p           : std_logic;
    signal scrod_ttdclk_n           : std_logic;
    signal scrod_ttdtrg_p           : std_logic;
    signal scrod_ttdtrg_n           : std_logic;
    signal scrod_ttdack_p           : std_logic;
    signal scrod_ttdack_n           : std_logic;
    signal scrod_ttdrsv_p           : std_logic;
    signal scrod_ttdrsv_n           : std_logic;
    signal scrod_target_tb          : tb_vec_type;
    signal scrod_target_tb16        : std_logic_vector(1 to TDC_NUM_CHAN);
    signal scrod_mgttxfault         : std_logic_vector(1 to NUM_MGT);
    signal scrod_mgtmod0            : std_logic_vector(1 to NUM_MGT);
    signal scrod_mgtlos             : std_logic_vector(1 to NUM_MGT);
    signal scrod_mgttxdis           : std_logic_vector(1 to NUM_MGT);
    signal scrod_mgtmod2            : std_logic_vector(1 to NUM_MGT);
    signal scrod_mgtmod1            : std_logic_vector(1 to NUM_MGT);
    signal scrod_mgtrate            : std_logic_vector(1 to NUM_MGT);
    signal scrod_mgtrxp             : std_logic;
    signal scrod_mgtrxn             : std_logic;
    signal scrod_mgttxp             : std_logic;
    signal scrod_mgttxn             : std_logic;
    signal scrod_ex_trig1           : std_logic;
    signal scrod_exttb              : tb_vec_type;    
    signal scrod_ftsw_aux           : std_logic;
    signal scrod_status             : std_logic;
    signal scrod_control            : std_logic;

begin

    -----------------------------------------------------------------------------------------------
    -- Front-End Timing Switch (FTSW)
    -----------------------------------------------------------------------------------------------
    ft2u_ins : entity ft2u_lib.ft2u
      generic map(
        LCK_ENABLE                  => '1',
        TTIN_ENABLE                 => '0',
        USE_CHIPSCOPE               => '0',
        ID                          => x"46543255") -- "FT2U"
      port map(
        -- FTSW2 only (dummy pin in FTSW3)
        f_led1y_b                   => f2tu_f_led1y_b, -- only in ft2u
        -- FTSW3 only (dummy pins in FTSW2)
        f_led1g                     => open,  -- for clock source
        f_led1y                     => open,  -- G:IN/Y:FTOR, blink if PLL unlock
        f_led2g                     => open,  -- G for ft3u
        f_led2y                     => open,  -- only in ft3u
        --c_led0                    =>
        --c_led1                    =>
        --f_testin                  =>        -- for test trigger input
        --c_gpio0                   =>
        -- local bus and local clock
        f_d                         => f2tu_f_d,
        f_a                         => f2tu_f_a,
        f_ads                       => ft2u_ads,
        f_wr                        => ft2u_wr,
        f_irq                       => open,  -- unused, set to L
        -- misc
        c_id1                       => ft2u_c_id1,
        c_id2                       => ft2u_c_id2,
        f_xen                       => ft2u_f_xen,
        f_ckmux                     => ft2u_f_ckmux,
        --f_testin_p                =>
        --f_testin_n                =>
        -- test jtag-in
        f_tck                       => ft2u_f_tck, -- tck
        f_tms                       => ft2u_f_tms, -- tms
        f_tdi                       => ft2u_f_tdi, -- tdi
        f_tdo                       => ft2u_f_tdo, -- tdo
        -- jitter cleaner control
        j_pd_b                      => ft2u_j_pd_b,
        j_plllock                   => ft2u_j_plllock,
        j_spiclk                    => ft2u_j_spiclk,
        j_spile                     => ft2u_j_spile ,
        j_spimiso                   => ft2u_j_spimiso,
        j_spimosi                   => ft2u_j_spimosi,
        j_testsync                  => ft2u_j_testsync,
        -- clock input
        f_ick_p                     => ft2u_f_ick_p,  -- for phase detection --31MHz
        f_ick_n                     => ft2u_f_ick_n,
        f_lck_p                     => ft2u_f_lck_p,                         --127MHz
        f_lck_n                     => ft2u_f_lck_n,
        s_jck_p                     => ft2u_s_jck_p,  -- main system clock   --127MHz
        s_jck_n                     => ft2u_s_jck_n,
        -- AUX (same set of pins, switch the direction by UCF pin assignment)
        o_aux_n                     => ft2u_o_aux_n,
        o_aux_p                     => ft2u_o_aux_p,
        i_aux_n                     => ft2u_i_aux_n,
        i_aux_p                     => ft2u_i_aux_p,
        -- IN
        i_trg_n                     => ft2u_i_trg_n,  -- opposite to nominal direction
        i_trg_p                     => ft2u_i_trg_p,  -- opposite to nominal direction
        i_ack_n                     => ft2u_i_ack_n,  -- opposite to nominal direction
        i_ack_p                     => ft2u_i_ack_p,  -- opposite to nominal direction
        i_rsv_n                     => open,
        i_rsv_p                     => open,
        -- OUT
        o_clk_n                     => ft2u_o_clk_n,
        o_clk_p                     => ft2u_o_clk_p,
        o_trg_n                     => ft2u_o_trg_n,
        o_trg_p                     => ft2u_o_trg_p,
        o_ack_n                     => ft2u_o_ack_n,
        o_ack_p                     => ft2u_o_ack_p,
        o_rsv_n                     => ft2u_o_rsv_n,
        o_rsv_p                     => ft2u_o_rsv_p,
        -- LED
        i_ledy_b                    => ft2u_i_ledy_b,
        i_ledg_b                    => ft2u_i_ledg_b,
        o_ledy_b                    => ft2u_o_ledy_b,
        o_ledg_b                    => ft2u_o_ledg_b,
        -- FMC control and I/O
        --m_rst                     => open,
        --m_scl                     => open,
        --m_sda                     => open,
        --m_prsnt                   => open,
        m_a                         => ft2u_m_a,
        m_d                         => ft2u_m_d,
        --m_io                      => open,
        m_wr                        => ft2u_m_wr,
        m_ads                       => ft2u_m_ads,
        m_lck                       => ft2u_m_lck,
        -- spartan3 control (only in FTSW3 / dummy in FTSW2)
        f_enable                    => open,
        f_entck                     => open,
        f_ftop                      => open,
        f_query                     => open,
        f_prsnt_b                   => open,
        -- ethernet
        e_rst_b                     => open,
        e_txen                      => open
    );

    ------------------------------------------------------------
    -- Instantiate TARGET ASIC model.
    ------------------------------------------------------------
    TARGET_GEN:
    for I in 1 to TO_NUM_LANES generate
        targetx_ins : targetx
        generic map(
            USE_PRNG                => USE_PRNG)
        port map(
            clk                     => scrod_ttdclk_p,
            ce                      => '1',
            run_reset               => target_reset,
            stim_enable             => stim_enable,
            tb                      => target_tb(I),
            tb16                    => target_tb16(I));
    end generate;

    ------------------------------------------------------------
    -- Generate som fake run control data.
    ------------------------------------------------------------
    rc_stim_ins : run_ctrl_stim
    generic map(
        USE_LFSR                    => USE_LFSR,
        PKT_SZ                      => 16,
        CLKPER                      => FLCKPER)
    port map(
        clk                         => conc_user_clk,
        stim_enable                 => stim_enable,
        tx_dst_rdy_n                => conc_tx_dst_rdy_n,
        tx_sof_n                    => conc_tx_sof_n,
        tx_eof_n                    => conc_tx_eof_n,
        tx_src_rdy_n                => conc_tx_src_rdy_n,
        tx_rem                      => conc_tx_rem,
        tx_data                     => conc_tx_d
    );

    ------------------------------------------------------------
    -- Fake the Data Concentrator Aurora Core
    ------------------------------------------------------------
    conc_ins : klm_aurora_intfc
    generic map(
        SIM_GTPRESET_SPEEDUP        => 1)
    port map(
        refseldypll                 => CLKSEL,
        ref_clk0                    => conc_user_clk,
        ref_clk1                    => conc_user_clk,
        user_clk                    => conc_user_clk,
        sync_clk                    => conc_sync_clk,
        reset                       => conc_reset,
        gt_reset                    => conc_gt_reset,
        plllock                     => conc_plllock,
        -- LocalLink TX Interface
        tx_dst_rdy_n                => conc_tx_dst_rdy_n,
        tx_src_rdy_n                => conc_tx_src_rdy_n,
        tx_sof_n                    => conc_tx_sof_n,
        tx_eof_n                    => conc_tx_eof_n,
        tx_d                        => conc_tx_d,
        tx_rem                      => conc_tx_rem,
        -- LocalLink RX Interface
        rx_src_rdy_n                => conc_rx_src_rdy_n,
        rx_sof_n                    => conc_rx_sof_n,
        rx_eof_n                    => conc_rx_eof_n,
        rx_rem                      => conc_rx_rem,
        rx_d                        => conc_rx_d,
        -- Status
        gtlock                      => conc_gtlock,
        hard_err                    => conc_hard_err,
        soft_err                    => conc_soft_err,
        frame_err                   => conc_frame_err,
        channel_up                  => conc_channel_up,
        lane_up                     => conc_lane_up,
        warn_cc                     => conc_warn_cc,
        do_cc                       => conc_do_cc,
        -- Control
        powerdown                   => conc_powerdown,
        loopback                    => conc_loopback,
        -- GT I/O
        rxp                         => conc_rxp,
        rxn                         => conc_rxn,
        txp                         => conc_txp,
        txn                         => conc_txn
    );

    ------------------------------------------------------------
    -- KLM SCROD (the unit-under-test)
    ------------------------------------------------------------
    UUT : klm_scrod
    generic map(
        NUM_GTS                     => NUM_MGT,
        REVISION                    => "A4",--A2, A3, A4
        CLKSRC                      => "FTSW",--FTSW, OBOSC
        AURORA_CC_USE               => FALSE,           
        LINK_TEST                   => '0',
        B2TT_SIM_SPEEDUP            => '1',
        DAQ_GEN_SIM_SPEEDUP         => '1')                                    
    port map(
        -- TTD/FTSW interface
        ttdclkp                     => scrod_ttdclk_p,
        ttdclkn                     => scrod_ttdclk_n,
        ttdtrgp                     => scrod_ttdtrg_p,
        ttdtrgn                     => scrod_ttdtrg_n,
        ttdackp                     => scrod_ttdack_p,
        ttdackn                     => scrod_ttdack_n,
        ttdrsvp                     => scrod_ttdrsv_p,
        ttdrsvn                     => scrod_ttdrsv_n,
        -- ASIC Interface
        target_tb                   => scrod_target_tb,
        target_tb16                 => scrod_target_tb16,
        -- SFP interface
        mgttxfault                  => scrod_mgttxfault,
        mgtmod0                     => scrod_mgtmod0,
        mgtlos                      => scrod_mgtlos,
        mgttxdis                    => scrod_mgttxdis,
        mgtmod2                     => scrod_mgtmod2,
        mgtmod1                     => scrod_mgtmod1,
        mgtclk0p                    => scrod_ttdclk_p,--!add osc to testbench
        mgtclk0n                    => scrod_ttdclk_n,
        mgtclk1p                    => scrod_ttdclk_p,--!add osc to testbench
        mgtclk1n                    => scrod_ttdclk_n,
        mgtrxp                      => scrod_mgtrxp,
        mgtrxn                      => scrod_mgtrxn,
        mgttxp                      => scrod_mgttxp,
        mgttxn                      => scrod_mgttxn,
        ex_trig1                    => scrod_ex_trig1,
        exttb                       => scrod_exttb,
        ftsw_aux                    => scrod_ftsw_aux,
        status_fake                 => scrod_status,
        control_fake                => scrod_control,
        scint_trg                   => open,
        scint_trg_ctime             => open,
        scint_missed_trg            => open,
        scint_trg_rdy               => '0',
        qt_fifo_rd_clk              => open,
        qt_fifo_rd_en               => open,
        qt_fifo_rd_d                => (others => '0'),--"00000000000000000",
        qt_fifo_empty               => '0',
        qt_fifo_almost_empty        => '0',
        qt_fifo_evt_rdy             => '0',
        zlt                         => '0'
    );

    -----------------------------------------------------------------------------------------------
    -- FTSW stimulus
    -----------------------------------------------------------------------------------------------
    -- local bus and local clock
    f2tu_f_d <= (others => '1');
    f2tu_f_a <= (others => '1');
    ft2u_ads <= '1';
    ft2u_wr  <= '1';
    -- misc
    ft2u_c_id1 <= '0';
    ft2u_c_id2 <= '1';
    ft2u_f_ckmux <= "00";
    -- test jtag-in
    ft2u_f_tck <= '1';
    ft2u_f_tms <= '1';
    ft2u_f_tdi <= '1';
    -- jitter cleaner control
    ft2u_j_plllock <= '1';
    ft2u_j_spimiso <= '1';
    -- Generate clock inputs
    ft2u_f_ick_p <= not ft2u_f_ick_p after FICKHPER; --31MHz
    ft2u_f_ick_n <= not ft2u_f_ick_p;
    ft2u_f_lck_p <= not ft2u_f_lck_p after FLCKHPER; --127MHz
    ft2u_f_lck_n <= not ft2u_f_lck_p;
    ft2u_s_jck_p <= not ft2u_s_jck_p after FJCKHPER; --127MHz
    ft2u_s_jck_n <= not ft2u_s_jck_p;
    -- AUX (same set of pins, switch the direction by UCF pin assignment)
    ft2u_i_aux_p(2) <= '0';
    ft2u_i_aux_n(2) <= not ft2u_i_aux_p(2);
    -- Inputs
    ft2u_i_trg_p <= 'Z';
    ft2u_i_trg_n <= 'Z';
    ft2u_i_ack_p <= '1';
    ft2u_i_ack_n <= not ft2u_i_ack_p;
    ft2u_o_ack_p <= X"000" & "000" & scrod_ttdack_p & "0000";
    ft2u_o_ack_n <= not ft2u_o_ack_p;
    ft2u_o_rsv_p <= X"000" & "000" & scrod_ttdrsv_p & "0000";
    ft2u_o_rsv_n <= not ft2u_o_rsv_p;

    --Generate trigger the easy way (no VME)
    ft2u_i_aux_n(3) <= not ft2u_i_aux_p(3);

    ft2u_trg_pcs : process
    begin
        ft2u_i_aux_p(3) <= '0';--not ft2u_i_aux_p(3) after 1 us;
        wait for 1250 us;
        trg_loop: while(TRUE) loop
            ft2u_i_aux_p(3) <= '1';
            wait for 500 us;
            ft2u_i_aux_p(3) <= '0';
            wait for 500 us;
        end loop;
    end process;

    -----------------------------------------------------------------------------------------------
    -- Concentrator stimulus
    -----------------------------------------------------------------------------------------------
    -- Generate clock
    conc_user_clk <= ft2u_o_clk_p(7);
    conc_sync_clk <= conc_user_clk xor conc_user_clk'delayed(FLCKPER/4);

    conc_reset <= '1', '0' after FLCKPER*4;
    conc_gt_reset <= '1', '0' after FLCKPER*2;
    conc_plllock <= '0', '1' after FLCKPER*8;

    conc_powerdown <= '0';
    conc_loopback <= "000";

    conc_rxp <= scrod_mgttxp;
    conc_rxn <= scrod_mgttxn;

    -----------------------------------------------------------------------------------------------
    -- SCROD Stimulus
    -----------------------------------------------------------------------------------------------
    scrod_ttdclk_p <= ft2u_o_clk_p(5);
    scrod_ttdclk_n <= ft2u_o_clk_n(5);
    scrod_ttdtrg_p <= ft2u_o_trg_p(5);
    scrod_ttdtrg_n <= ft2u_o_trg_n(5);
    scrod_target_tb <= target_tb;
    scrod_target_tb16 <= target_tb16;

    scrod_mgttxfault <= (others => '0');
    scrod_mgtmod0 <= (others => '0');
    scrod_mgtlos <= (others => '0');
    scrod_mgtrxp <= conc_txp;
    scrod_mgtrxn <= conc_txn;
    scrod_ex_trig1 <= '0';

    -----------------------------------------------------------------------------------------------
    -- Miscellaneous Test Bench Stuff
    -----------------------------------------------------------------------------------------------
    target_reset <= '1', '0' after FLCKPER*8;
    stim_enable <= '0', '1' after FLCKPER*16;--not reset'delayed(CLKPER*12);

    --------------------------------------------------------------------------
    -- Generate a psuedo-random shift register to increment counter at many
    -- different intervals, to provide stimulus that fully verifies
    -- time order circuit by toggling the next entities full flag.
    --------------------------------------------------------------------------
    full_pcs : process(stim_enable,conc_user_clk)
    begin
        if stim_enable = '0' then
            full_reg <= "0110110010101001";
        else
            if rising_edge(conc_user_clk) then
                full_reg <= full_reg(14 downto 0) & (full_reg(15) xor full_reg(12));
            end if;
        end if;
    end process;

end behave;