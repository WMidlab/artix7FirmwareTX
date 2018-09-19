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
-- Simulate TARGET ASIC trigger bits using a counter and random noise.
--*********************************************************************************

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    use ieee.std_logic_unsigned.all;
    use ieee.math_real.all;


entity tdc_stim is
generic(
    USE_PRNG                    : std_logic);
port(
    clk                         : in std_logic;
    ce                          : in std_logic;
    run_reset                   : in std_logic;
    stim_enable                 : in std_logic;
    tb                          : out std_logic_vector(5 downto 1);
    tb16                        : out std_logic);
end tdc_stim;

architecture behave of tdc_stim is


    signal tb_ctr                       : std_logic_vector(6 downto 0)      := (others => '0');
    signal tb_prng                      : std_logic_vector(6 downto 0)      := (others => '0');

begin

    tb <= tb_ctr(5 downto 1) when USE_PRNG = '0' else tb_prng(5 downto 1);
    tb16 <= tb_ctr(6) when USE_PRNG = '0' else tb_prng(6);

    --------------------------------------------------------------------------
    -- Generate counter trigger bits.
    --------------------------------------------------------------------------
    tb_ctr_pcs : process(run_reset,clk)
    begin
        if run_reset = '1' then
            tb_ctr <= (others => '0');
        else
            if rising_edge(clk) then
                if stim_enable = '1' then
                    tb_ctr <= tb_ctr + '1';
                end if;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------
    -- Generate a psuedo-random trigger bits.
    --------------------------------------------------------------------------
    tb_prng_pcs : process(clk)
        variable seed1, seed2                   : positive;                    -- Seed values for random generator
        variable rand                           : real;                        -- Random real-number value in range 0 to 1.0
        variable int_rand                       : integer;                     -- Random integer value in range 0..4095
    begin
        if rising_edge(clk) then
            if stim_enable = '1' then
                UNIFORM(seed1, seed2, rand);                                      -- generate random number
                int_rand := 1 + ABS(INTEGER(TRUNC(rand*32.0)));                   -- rescale and find integer part
                tb_prng <= STD_LOGIC_VECTOR(TO_UNSIGNED(int_rand,tb_prng'LENGTH));-- convert to std_logic_vector
            end if;
        end if;
    end process;

end behave;