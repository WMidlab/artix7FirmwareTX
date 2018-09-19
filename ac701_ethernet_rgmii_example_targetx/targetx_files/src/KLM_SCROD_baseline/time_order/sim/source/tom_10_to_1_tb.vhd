--*********************************************************************************
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
-- Test bench for time order merge 10 to 1 enity.
--*********************************************************************************

library ieee;
    use ieee.std_logic_1164.all;
--    use ieee.math_real.all;
--     use ieee.numeric_std.all;
    use ieee.std_logic_unsigned.all;
    use ieee.std_logic_textio.all;
library work;
    use work.time_order_pkg.all;


entity tom_10_to_1_tb is
end tom_10_to_1_tb;

architecture behave of tom_10_to_1_tb is

    component tom_10_to_1 is
        port(
        clk                         : in std_logic;
        ce                          : in std_logic;
        ein                         : in to_10e_type;
        cin                         : in to_10c_type;
        din                         : in to_10d_type;
        emin                        : out std_logic;
        cmin                        : out std_logic_vector(TO_CWIDTH-1 downto 0);
        dmin                        : out std_logic_vector(TO_DWIDTH-1 downto 0));
    end component;

    constant CLKPER                 : time                              := 4 ns;
    constant CLKHLFPER              : time                              := CLKPER/2;

    -- Test bench signals
    signal clk                      : std_logic                         := '1';

    signal tb_reg                 : std_logic_vector(16 downto 0)     := "10010110010110101";
    signal ein                      : to_10e_type;
    signal cin                      : to_10c_type;
    signal din                      : to_10d_type;
    signal emin                     : std_logic;
    signal cmin                     : std_logic_vector(TO_CWIDTH-1 downto 0);
    signal dmin                     : std_logic_vector(TO_DWIDTH-1 downto 0);
    signal ce                       : std_logic                         := '0';
    signal ce_cnt                   : std_logic_vector(1 downto 0)      := (others => '0');

begin

    UUT : tom_10_to_1
        port map(
        clk                         => clk,
        ce                          => ce,
        ein                         => ein,
        cin                         => cin,
        din                         => din,
        emin                        => emin,
        cmin                        => cmin,
        dmin                        => dmin
    );


    -- Generate clock
    clk <= (not clk) after CLKHLFPER;

    ein <=  "1111111111", "0000000000" after CLKPER*100,
            "0001111111" after CLKPER*108, "1111111111" after CLKPER*116,
            "1111101111" after CLKPER*124, "1111111111" after CLKPER*132;

    cin <= (X"08" , X"02" , X"03" , X"06" , X"12",
            X"09" , X"10" , X"01" , X"04" , X"11");

    -- din(1) <= tb_reg(15 downto 7) & tb_reg(14 downto 6);
    -- din(2) <= tb_reg(13 downto 5) & tb_reg(12 downto 4);
    -- din(3) <= tb_reg(11 downto 3) & tb_reg(10 downto 2);
    -- din(4) <= tb_reg(9 downto 1) & tb_reg(8 downto 0);

    din <= (("0" & X"08") , ("0" & X"02") , ("0" & X"03") , ("0" & X"06") , ("0" & X"12") , 
            ("0" & X"09") , ("0" & X"10") , ("0" & X"01") , ("0" & X"04") , ("0" & X"11"));


    --------------------------------------------------------------------------
    -- Generate a psuedo-random shift regiser to incrment counter a many
    -- different intervals, to provide stimulus that fully verifies
    -- time order circuit.
    --------------------------------------------------------------------------
    tb_reg_pcs : process(clk)
    begin
        if rising_edge(clk) then
            tb_reg <= tb_reg(15 downto 0) & (tb_reg(16) xor tb_reg(13));
        end if;
    end process;

    --------------------------------------------------------------------------
    -- Genereate a clock enable
    --------------------------------------------------------------------------
    ce_cnt_pcs : process(clk)
    begin
        if rising_edge(clk) then
            ce_cnt <= ce_cnt + 1;
        end if;
    end process;

    ce_pcs : process(ce_cnt(0))
    begin
        if rising_edge(ce_cnt(0)) then
            ce <= '1';
        else
            ce <= '0';
        end if;
    end process;
    --------------------------------------------------------------------------

end behave;