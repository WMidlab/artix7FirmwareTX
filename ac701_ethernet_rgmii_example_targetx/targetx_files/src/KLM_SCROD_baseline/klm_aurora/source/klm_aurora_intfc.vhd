--*********************************************************************************
-- Indiana University
-- Center for Exploration of Energy and Matter (CEEM)
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    06/25/2014
--
--*********************************************************************************
-- Description:
-- Top level Aurora entity.
--*********************************************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use work.aurora_pkg.all;

entity klm_aurora_intfc is
    generic(
        SIM_GTPRESET_SPEEDUP    : integer := 1;
        CLK_CORRECT_USE         : boolean := TRUE);--Set to true to use clock correction
    port(
        refseldypll             : std_logic_vector(2 downto 0);
        ref_clk0                : in std_logic;
        ref_clk1                : in std_logic;
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
        gtlock                  : out std_logic;
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
end klm_aurora_intfc;

architecture MAPPED of klm_aurora_intfc is

    signal hard_err_i           : std_logic;
    signal soft_err_i           : std_logic;
    signal frame_err_i          : std_logic;
    -- Status
    signal channel_up_i         : std_logic;
    signal lane_up_i            : std_logic;
    -- Clock Compensation Control Interface
    signal warn_cc_i            : std_logic;
    signal do_cc_i              : std_logic;
    -- System Interface
    signal plllockn_i           : std_logic                     := '1';
    signal tx_lock_i            : std_logic;
    signal rxeqmix_in_i         : std_logic_vector(1 downto 0);
    signal daddr_in_i           : std_logic_vector(7 downto 0);
    signal dclk_in_i            : std_logic;
    signal den_in_i             : std_logic;
    signal di_in_i              : std_logic_vector(15 downto 0);
    signal drdy_out_unused_i    : std_logic;
    signal drpdo_out_unused_i   : std_logic_vector(15 downto 0);
    signal dwe_in_i             : std_logic;
    signal rst_cc_module_i      : std_logic;

    signal warn_cc_mdl          : std_logic;
    signal do_cc_mdl            : std_logic;

    -- Component Declarations --
    component klm_aurora
    generic(
        SIM_GTPRESET_SPEEDUP    : integer := 1;
        CLK_CORRECT_USE         : boolean := TRUE);
    port(
        -- LocalLink TX Interface
        TX_D                    : in std_logic_vector(0 to 15);
        TX_REM                  : in std_logic;
        TX_SRC_RDY_N            : in std_logic;
        TX_SOF_N                : in std_logic;
        TX_EOF_N                : in std_logic;
        TX_DST_RDY_N            : out std_logic;
         -- LocalLink RX Interface
        RX_D                    : out std_logic_vector(0 to 15);
        RX_REM                  : out std_logic;
        RX_SRC_RDY_N            : out std_logic;
        RX_SOF_N                : out std_logic;
        RX_EOF_N                : out std_logic;
        -- GT Serial I/O
        RXP                     : in std_logic;
        RXN                     : in std_logic;
        TXP                     : out std_logic;
        TXN                     : out std_logic;
        -- GT Reference Clock Interface
        REFSELDYPLL             : in std_logic_vector(2 downto 0);
        REFCLK0                 : in std_logic;
        REFCLK1                 : in std_logic;
        GCLK                    : in std_logic;
        -- Error Detection Interface
        HARD_ERR                : out std_logic;
        SOFT_ERR                : out std_logic;
        FRAME_ERR               : out std_logic;
        -- Status
        CHANNEL_UP              : out std_logic;
        LANE_UP                 : out std_logic;
        -- Clock Compensation Control Interface
        WARN_CC                 : in std_logic;
        DO_CC                   : in std_logic;
        -- System Interface
        USER_CLK                : in std_logic;
        SYNC_CLK                : in std_logic;
        GT_RESET                : in std_logic;
        RESET                   : in std_logic;
        POWER_DOWN              : in std_logic;
        LOOPBACK                : in std_logic_vector(2 downto 0);
        GTPCLKOUT               : out std_logic;
        RXEQMIX_IN              : in std_logic_vector(1 downto 0);
        DADDR_IN                : in std_logic_vector(7 downto 0);
        DCLK_IN                 : in std_logic;
        DEN_IN                  : in std_logic;
        DI_IN                   : in std_logic_vector(15 downto 0);
        DRDY_OUT                : out std_logic;
        DRPDO_OUT               : out std_logic_vector(15 downto 0);
        DWE_IN                  : in std_logic;
        TX_LOCK                 : out std_logic);
    end component;

    component STANDARD_CC_MODULE
    port (
        -- Clock Compensation Control Interface
        WARN_CC                 : out std_logic;
        DO_CC                   : out std_logic;
        -- System Interface
        USER_CLK                : in std_logic;
        RESET                   : in std_logic);
    end component;

begin

    -- Module Instantiations --
    klm_aurora_ins : klm_aurora
    generic map(
        SIM_GTPRESET_SPEEDUP    => SIM_GTPRESET_SPEEDUP,
        CLK_CORRECT_USE         => CLK_CORRECT_USE)
    port map(
    -- LocalLink TX Interface
        TX_D                    => tx_d,
        TX_REM                  => tx_rem,
        TX_SRC_RDY_N            => tx_src_rdy_n,
        TX_SOF_N                => tx_sof_n,
        TX_EOF_N                => tx_eof_n,
        TX_DST_RDY_N            => tx_dst_rdy_n,
        -- LocalLink RX Interface
        RX_D                    => rx_d,
        RX_REM                  => rx_rem,
        RX_SRC_RDY_N            => rx_src_rdy_n,
        RX_SOF_N                => rx_sof_n,
        RX_EOF_N                => rx_eof_n,
        -- GT Serial I/O
        RXP                     => rxp,
        RXN                     => rxn,
        TXP                     => txp,
        TXN                     => txn,
        -- GT Reference Clock Interface
        REFSELDYPLL             => refseldypll,
        REFCLK0                 => ref_clk0,
        REFCLK1                 => ref_clk1,
        GCLK                    => user_clk,
        -- Error Detection Interface
        HARD_ERR                => hard_err_i,
        SOFT_ERR                => soft_err_i,
        FRAME_ERR               => frame_err_i,
        -- Status
        CHANNEL_UP              => channel_up_i,
        LANE_UP                 => lane_up_i,
        -- Clock Compensation Control Interface
        WARN_CC                 => warn_cc_i,
        DO_CC                   => do_cc_i,
        -- System Interface
        USER_CLK                => user_clk,
        SYNC_CLK                => sync_clk,
        RESET                   => reset,
        POWER_DOWN              => powerdown,
        LOOPBACK                => loopback,
        GT_RESET                => gt_reset,
        GTPCLKOUT               => open,
        RXEQMIX_IN              => rxeqmix_in_i,
        DADDR_IN                => daddr_in_i,
        DCLK_IN                 => dclk_in_i,
        DEN_IN                  => den_in_i,
        DI_IN                   => di_in_i,
        DRDY_OUT                => drdy_out_unused_i,
        DRPDO_OUT               => drpdo_out_unused_i,
        DWE_IN                  => dwe_in_i,
        TX_LOCK                 => tx_lock_i
    );

    std_cc_module_i : STANDARD_CC_MODULE
    port map(
    -- Clock Compensation Control Interface
        WARN_CC        => warn_cc_mdl,
        DO_CC          => do_cc_mdl,
        -- System Interface
        USER_CLK       => user_clk,
        RESET          => rst_cc_module_i
    );

    --Clock correct logic generation
    CCLT_GEN : if CLK_CORRECT_USE = TRUE generate
        warn_cc_i <= warn_cc_mdl;
        do_cc_i <= do_cc_mdl;
    end generate;
    CCLF_GEN : if CLK_CORRECT_USE = FALSE generate
        warn_cc_i <= '0';
        do_cc_i <= '0';
    end generate;

    -- GTX control ports
    rxeqmix_in_i    <=  "11";
    daddr_in_i      <=  (others=>'0');
    dclk_in_i       <=  '0';
    den_in_i        <=  '0';
    di_in_i         <=  (others=>'0');
    dwe_in_i        <=  '0';
    rst_cc_module_i <=  not lane_up_i;

    -- Register core user ports
    pipeline_pcs : process (user_clk)
    begin
        if (user_clk 'event and user_clk = '1') then
            plllockn_i <= not plllock;
            gtlock <= tx_lock_i;
            hard_err <= hard_err_i;
            soft_err <= soft_err_i;
            frame_err <= frame_err_i;
            lane_up <= lane_up_i;
            channel_up <= channel_up_i;
            warn_cc <= warn_cc_i;
            do_cc <= do_cc_i;
        end if;
    end process;

end MAPPED;
