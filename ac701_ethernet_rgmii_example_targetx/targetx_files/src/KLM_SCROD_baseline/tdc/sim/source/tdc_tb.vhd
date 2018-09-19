--*********************************************************************************
-- Indiana University
-- Center for Exploration of Energy and Matter (CEEM)
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    05/09/2014
--
--*********************************************************************************
-- Description:
-- Test bench for top level TDC entity.
--*********************************************************************************

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.math_real.all;
    use ieee.numeric_std.all;
    use ieee.std_logic_unsigned.all;
library work;
    use work.tdc_pkg.all;

entity tdc_tb is
end tdc_tb;

architecture behave of tdc_tb is

    component tdc is
    port(
    -- Inputs -----------------------------
        tdc_clk                         : in std_logic;
        ce                              : in std_logic_vector(1 to 4);
        reset                           : in std_logic;
        tdc_clr                         : in std_logic;
        tb                              : in tb_vec_type;
        tb16                            : in std_logic_vector(1 to TDC_NUM_CHAN);
        fifo_re                         : in std_logic_vector(1 to TDC_NUM_CHAN);
    -- Outputs -----------------------------
        exttb                           : out tb_vec_type;
        fifo_ept                        : out std_logic_vector(1 to TDC_NUM_CHAN);
        tdc_dout                        : out tdc_dout_type);
    end component;

    --clocks
    constant CLKPER                     : time                                  := 8 ns;
    constant CLKHPER                    : time                                  := CLKPER/2;
    constant CLKQPER                    : time                                  := CLKPER/4;
    constant USE_PRNG                   : std_logic                             := '0';

    signal clk                          : std_logic                             := '1';
    signal clk2x                        : std_logic                             := '1';
    signal ce                           : std_logic_vector(1 to 4)              := (others => '1');
    signal run_reset                    : std_logic                             := '1';
    signal tb                           : tb_vec_type                           := (others => "00000");
    signal tb16                         : std_logic_vector(1 to TDC_NUM_CHAN)   := (others => '0');
    signal fifo_re                      : std_logic_vector(1 to TDC_NUM_CHAN)   := (others => '0');
    signal exttb                        : tb_vec_type                           := (others => "00000");
    signal fifo_ept                     : std_logic_vector(1 to TDC_NUM_CHAN);
    signal tdc_dout                     : tdc_dout_type;
    -- Test bench signals
    signal tb_ctr                       : std_logic_vector(6 downto 0)      := (others => '0');
    signal tb_prng                      : std_logic_vector(6 downto 0)      := (others => '0');

begin

    UUT : tdc
    port map(
    -- Inputs -----------------------------
        tdc_clk                         => clk2x,
        ce                              => ce,
        reset                           => run_reset,
        tdc_clr                         => run_reset,
        tb                              => tb,
        tb16                            => tb16,
        fifo_re                         => fifo_re,
    -- Outputs -----------------------------
        exttb                           => exttb,
        fifo_ept                        => fifo_ept,
        tdc_dout                        => tdc_dout
    );

    -- Generate clock
    clk <= (not clk) after CLKHPER;
    clk2x <= (not clk2x) after CLKQPER;
    -- Simulate TTD run_reset
    run_reset <= '0' after CLKPER*8;
    -- Generate TARGET ASIC trigger bits
    TB_GEN: for I in 1 to TDC_NUM_CHAN generate
        tb(I) <= tb_ctr(5 downto 1) when USE_PRNG = '0' else tb_prng(5 downto 1);
        tb16(I) <= tb_ctr(6) when USE_PRNG = '0' else tb_prng(6);
    end generate;


    --------------------------------------------------------------------------
    -- Generate counter for trigger bits.
    --------------------------------------------------------------------------
    tb_ctr_pcs : process(run_reset,clk2x)
    begin
        if run_reset = '1' then
            tb_ctr <= (others => '0');
        else
            if rising_edge(clk2x) then
                tb_ctr <= tb_ctr + '1';
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------
    -- Generate a psuedo-random trigger bits.
    --------------------------------------------------------------------------
    tb_prng_pcs : process(clk2x)
        variable seed1, seed2                   : positive;                    -- Seed values for random generator
        variable rand                           : real;                        -- Random real-number value in range 0 to 1.0
        variable int_rand                       : integer;                     -- Random integer value in range 0..4095
    begin
        if rising_edge(clk2x) then
            UNIFORM(seed1, seed2, rand);                                       -- generate random number
            int_rand := 90 + ABS(INTEGER(TRUNC(rand*32.0)));                   -- rescale and find integer part
            tb_prng <= STD_LOGIC_VECTOR(TO_UNSIGNED(int_rand,tb_prng'LENGTH)); -- convert to std_logic_vector
        end if;
    end process;

    --------------------------------------------------------------------------
    -- FIFO read process.
    --------------------------------------------------------------------------
    read_pcs : process(clk2x)
    begin
        if rising_edge(clk2x) then
            -- read every other clock cycle so flags can update
            fifo_re <= (not fifo_re) and (not fifo_ept);
        end if;
    end process;



end behave;