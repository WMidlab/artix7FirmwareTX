--*********************************************************************************
-- Indiana University
-- Center for Exploration of Energy and Matter (CEEM)
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    06/05/2014
--
--*********************************************************************************
-- Description:
-- Test bench for data concentrator interface entity. Model the rest of the SCROD
-- FPGA, the TARGET ASIC, and the Data Concentrator board.
--
-- Deficiencies:
--*********************************************************************************

library ieee;
    use ieee.std_logic_1164.all;
--    use ieee.math_real.all;
    use ieee.numeric_std.all;
    use ieee.std_logic_unsigned.all;
    use ieee.std_logic_textio.all;
library work;
    use work.time_order_pkg.all;
    use work.tdc_pkg.all;
    use work.conc_intfc_pkg.all;

entity conc_intfc_tb is
end conc_intfc_tb;

architecture behave of conc_intfc_tb is

    component b2tt is
        generic(
            CLKPER                  : time);
        port(
            sysclk                  : out std_logic;
            dblclk                  : out std_logic;
            runreset                : out std_logic;
            trigger                 : out std_logic;
            trgtag                  : out std_logic_vector(31 downto 0);
            fifordy                 : out std_logic;
            fifonext                : in std_logic;
            fifodata                : out std_logic_vector(95 downto 0);
            ctime                   : out std_logic_vector(26 downto 0);
            utime                   : out std_logic_vector(31 downto 0));
    end component;

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

    component daq_stim is
    generic(
        DWIDTH                      : integer;
        SEED                        : integer;
        USE_PAUSE                   : std_logic);
    port(
        clk                         : in std_logic;
        reset                       : in std_logic;
        enable                      : in std_logic;
        trigger                     : in std_logic;
        ctime                       : in std_logic_vector(26 downto 0);
        dst_rdy_n                   : in std_logic;
        sof_n                       : out std_logic;
        eof_n                       : out std_logic;
        src_rdy_n                   : out std_logic;
        data                        : out std_logic_vector(DWIDTH-1 downto 0));
    end component;

    component aurora_model is
    generic(
        USE_LFSR                    : std_logic;
        PKT_SZ                      : integer;
        CLKPER                      : time);
    port(
        clk                         : in std_logic;
        stim_enable                 : in std_logic;
        rx_dst_rdy_n                : out std_logic;
        rx_sof_n                    : in std_logic;
        rx_eof_n                    : in std_logic;
        rx_src_rdy_n                : in std_logic;
        rx_data                     : in std_logic_vector (15 downto 0);
        tx_dst_rdy_n                : in std_logic;
        tx_sof_n                    : out std_logic;
        tx_eof_n                    : out std_logic;
        tx_src_rdy_n                : out std_logic;
        tx_data                     : out std_logic_vector (15 downto 0));
    end component;

    component conc_intfc is
        port(
        -- inputs ---------------------------------------------
        sys_clk						: in std_logic;
        tdc_clk                     : in std_logic;
        ce                          : in std_logic_vector(1 to 5);
        --B2TT interface
        b2tt_runreset               : in std_logic;
        b2tt_runreset2x             : in std_logic_vector(1 to 3);
        b2tt_gtpreset               : in std_logic;
        b2tt_fifordy                : in std_logic;
        b2tt_fifodata               : in std_logic_vector (95 downto 0);
        b2tt_fifonext               : out std_logic;
        --TARGET ASIC trigger interface
        target_tb                   : tb_vec_type;
        target_tb16                 : in std_logic_vector(1 to TDC_NUM_CHAN);
        -- status sent to concentrator
        status_regs                 : in stat_reg_type;
        -- Aurora local input local link
        rx_dst_rdy_n                : out std_logic;
        rx_sof_n                    : in std_logic;
        rx_eof_n                    : in std_logic;
        rx_src_rdy_n                : in std_logic;
        rx_data                     : in std_logic_vector(15 downto 0);
        -- DAQ data local link input
        daq_dst_rdy_n               : out std_logic;
        daq_sof_n                   : in std_logic;--start of trigger
        daq_eof_n                   : in std_logic;--end of trigger
        daq_src_rdy_n               : in std_logic;
        daq_data                    : in std_logic_vector(15 downto 0);
        -- outputs --------------------------------------------
        exttrg                      : out std_logic;
        exttb                       : out tb_vec_type;
        -- Aurora local ouptput local link
        tx_dst_rdy_n                : in std_logic;
        tx_sof_n                    : out std_logic;
        tx_eof_n                    : out std_logic;
        tx_src_rdy_n                : out std_logic;
        tx_data                     : out std_logic_vector(15 downto 0);
        -- Run control local link output
        rcl_dst_rdy_n               : in std_logic;
        rcl_sof_n                   : out std_logic;
        rcl_eof_n                   : out std_logic;
        rcl_src_rdy_n               : out std_logic;
        rcl_data                    : out std_logic_vector(15 downto 0));
    end component;


    --clocks
    constant CLKPER                 : time                                  := 8 ns;
	constant CLKHPER                : time		                            := CLKPER/2;
    constant CLKQPER                : time		                            := CLKPER/4;

    constant USE_PRNG               : std_logic                             := '0';
    constant USE_LFSR               : std_logic                             := '0'; -- use LFSR for dst_rdy generation
    constant RNCTRL_PKT_SZ          : integer                               := 16;

    signal clk                      : std_logic                             := '1';
    signal clk2x                    : std_logic                             := '1';
    signal ce                       : std_logic_vector(1 to 6)              := (others => '0');
    signal tb                       : tb_vec_type                           := (others => "00000");
    signal tb16                     : std_logic_vector(1 to TDC_NUM_CHAN)   := (others => '0');
    signal fifo_re                  : std_logic_vector(1 to TDC_NUM_CHAN)   := (others => '0');

    signal ce_bit                   : std_logic                             := '0';
    signal ce_cnt                   : std_logic_vector(2 downto 0)          := (others => '1');
    signal full_reg                 : std_logic_vector(15 downto 0);
    signal stim_enable              : std_logic                             := '0';

    signal b2tt_runreset            : std_logic;
    signal b2tt_runreset2x          : std_logic_vector(1 to 3);
    signal b2tt_gtpreset            : std_logic;
    signal b2tt_trgtag              : std_logic_vector (31 downto 0)        := (others => '0');
    signal b2tt_ctime               : std_logic_vector (26 downto 0)        := (others => '0');
    signal b2tt_utime               : std_logic_vector (31 downto 0)        := (others => '0');
    signal b2tt_trgout              : std_logic;
    signal b2tt_fifordy             : std_logic                             := '1';
    signal b2tt_fifodata            : std_logic_vector (95 downto 0)        := (others => '0');
    signal b2tt_fifonext            : std_logic;
    signal rx_dst_rdy_n             : std_logic;
    signal rx_sof_n                 : std_logic;
    signal rx_eof_n                 : std_logic;
    signal rx_src_rdy_n             : std_logic;
    signal rx_data                  : std_logic_vector (15 downto 0);
    signal daq_dst_rdy_n            : std_logic;
    signal daq_sof_n                : std_logic;
    signal daq_eof_n                : std_logic;
    signal daq_src_rdy_n            : std_logic;
    signal daq_data                 : std_logic_vector (15 downto 0);
    signal exttrg                   : std_logic;
    signal exttb                    : tb_vec_type;
    signal tx_dst_rdy_n             : std_logic;
    signal tx_sof_n                 : std_logic;
    signal tx_eof_n                 : std_logic;
    signal tx_src_rdy_n             : std_logic;
    signal tx_data                  : std_logic_vector (15 downto 0);
    signal rcl_dst_rdy_n            : std_logic;
    signal rcl_sof_n                : std_logic;
    signal rcl_eof_n                : std_logic;
    signal rcl_src_rdy_n            : std_logic;
    signal rcl_data                 : std_logic_vector (15 downto 0);
    signal target_tb                : tb_vec_type;
    signal target_tb16              : std_logic_vector(1 to TDC_NUM_CHAN);
    signal status_regs              : stat_reg_type;

begin

    ------------------------------------------------------------
    -- Instantiate a timing and trigger model.
    ------------------------------------------------------------
    b2tt_ins : b2tt
    generic map(
        CLKPER                      => CLKPER)
    port map(
        sysclk                      => clk,
        dblclk                      => clk2x,
        runreset                    => b2tt_runreset,
        trigger                     => b2tt_trgout,
        trgtag                      => b2tt_trgtag,
        fifordy                     => b2tt_fifordy,
        fifonext                    => b2tt_fifonext,
        fifodata                    => b2tt_fifodata,
        ctime                       => b2tt_ctime,
        utime                       => b2tt_utime
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
            clk                     => clk,
            ce                      => ce(6),
            run_reset               => b2tt_runreset,
            stim_enable             => stim_enable,
            tb                      => target_tb(I),
            tb16                    => target_tb16(I));
    end generate;

    ------------------------------------------------------------
    -- Provide stimulus for the DAQ interface
    ------------------------------------------------------------
    stim_ins : daq_stim
    generic map(
        DWIDTH                      => 16,
        SEED                        => 1,
        USE_PAUSE                   => '0')
    port map(
        clk                         => clk,
        reset                       => b2tt_runreset,
        enable                      => stim_enable,
        trigger                     => b2tt_trgout,
        ctime                       => b2tt_ctime,
        dst_rdy_n                   => daq_dst_rdy_n,
        sof_n                       => daq_sof_n,
        eof_n                       => daq_eof_n,
        src_rdy_n                   => daq_src_rdy_n,
        data                        => daq_data
    );

    ------------------------------------------------------------
    -- Instantiate a Data Concentrator Aurora model.
    -- !Should use the real thing.
    ------------------------------------------------------------
    aurora_model_ins : aurora_model
    generic map(
        USE_LFSR                    => USE_LFSR,
        PKT_SZ                      => 32,
        CLKPER                      => CLKPER)
    port map(
        clk                         => clk,
        stim_enable                 => stim_enable,
        rx_dst_rdy_n                => tx_dst_rdy_n,
        rx_sof_n                    => tx_sof_n,
        rx_eof_n                    => tx_eof_n,
        rx_src_rdy_n                => tx_src_rdy_n,
        rx_data                     => tx_data,
        tx_dst_rdy_n                => rx_dst_rdy_n,
        tx_sof_n                    => rx_sof_n,
        tx_eof_n                    => rx_eof_n,
        tx_src_rdy_n                => rx_src_rdy_n,
        tx_data                     => rx_data
    );

    ------------------------------------------------------------
    -- The unit under test.
    ------------------------------------------------------------
    UUT : conc_intfc
        port map(
        -- inputs ---------------------------------------------
        sys_clk						=> clk,
        tdc_clk                     => clk2x,
        ce                          => ce(1 to 5),
        --B2TT interface
        b2tt_runreset               => b2tt_runreset,
        b2tt_runreset2x             => b2tt_runreset2x,
        b2tt_gtpreset               => b2tt_gtpreset,
        b2tt_fifordy                => b2tt_fifordy ,
        b2tt_fifodata               => b2tt_fifodata,
        b2tt_fifonext               => b2tt_fifonext,
        --TARGET ASIC trigger interface
        target_tb                   => target_tb,
        target_tb16                 => target_tb16,
        -- status sent to concentrator
        status_regs                 => status_regs,
        -- Aurora local input local link
        rx_dst_rdy_n                => rx_dst_rdy_n,
        rx_sof_n                    => rx_sof_n,
        rx_eof_n                    => rx_eof_n,
        rx_src_rdy_n                => rx_src_rdy_n,
        rx_data                     => rx_data,
        -- DAQ data local link input
        daq_dst_rdy_n               => daq_dst_rdy_n,
        daq_sof_n                   => daq_sof_n,
        daq_eof_n                   => daq_eof_n,
        daq_src_rdy_n               => daq_src_rdy_n,
        daq_data                    => daq_data,
        -- outputs --------------------------------------------
        exttrg                      => exttrg,
        exttb                       => exttb,
        -- Aurora local ouptput local link
        tx_dst_rdy_n                => tx_dst_rdy_n,
        tx_sof_n                    => tx_sof_n,
        tx_eof_n                    => tx_eof_n,
        tx_src_rdy_n                => tx_src_rdy_n,
        tx_data                     => tx_data,
        -- Run control local link output
        rcl_dst_rdy_n               => rcl_dst_rdy_n,
        rcl_sof_n                   => rcl_sof_n,
        rcl_eof_n                   => rcl_eof_n,
        rcl_src_rdy_n               => rcl_src_rdy_n,
        rcl_data                    => rcl_data
    );

	-- Generate clock
	--clk <= (not clk) after CLKHPER;
    --clk2x <= (not clk2x) after CLKQPER;
	-- Simulate power on b2tt_runreset
    b2tt_runreset2x <= (others => b2tt_runreset'delayed(CLKPER*2));-- try match delay in timing/control entity
    b2tt_gtpreset <= '0';
    stim_enable <= '0', '1' after CLKPER*16;--not b2tt_runreset'delayed(CLKPER*12);
    ce <= (others => ce_bit);
    rcl_dst_rdy_n <= full_reg(5);

    STAT_GEN : for I in 0 to NUM_STAT_REGS-1 generate
        status_regs(I) <= STD_LOGIC_VECTOR(TO_UNSIGNED(I,status_regs(I)'length));
    end generate;

    --------------------------------------------------------------------------
    -- Generate a psuedo-random shift register to increment counter at many
    -- different intervals, to provide stimulus that fully verifies
    -- time order circuit by toggling the next entities full flag.
    --------------------------------------------------------------------------
    full_pcs : process(b2tt_runreset,clk)
    begin
        if b2tt_runreset = '1' then
            full_reg <= "0110110010101001";
        else
            if rising_edge(clk) then
                full_reg <= full_reg(14 downto 0) & (full_reg(15) xor full_reg(12));
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------
    -- Generate clock enable.
    --------------------------------------------------------------------------
    ce_cnt_pcs : process(b2tt_runreset,clk)
    begin
        if b2tt_runreset = '1' then
            ce_cnt <= (others => '0');
        else
            if rising_edge(clk) then
                ce_cnt <= ce_cnt + 1;
            end if;
        end if;
    end process;

    ce2x_pcs : process
    begin
        wait until rising_edge(ce_cnt(0));
            ce_bit <= '1';
        wait for CLKPER;
            ce_bit <= '0';
    end process;

end behave;