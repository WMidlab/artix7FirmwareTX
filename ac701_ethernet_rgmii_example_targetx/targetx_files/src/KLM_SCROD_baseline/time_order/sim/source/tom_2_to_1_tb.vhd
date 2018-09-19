--*********************************************************************************
-- Indiana University
-- Center for Exploration of Energy and Matter (CEEM)
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    12/11/2012
--
--*********************************************************************************
-- Description:
-- Test bench for time order merge 2 to 1.
--*********************************************************************************

library ieee;
	use ieee.std_logic_1164.all;
--	use ieee.math_real.all;
 	use ieee.numeric_std.all;
--	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;
	use ieee.std_logic_textio.all;
library work;
	use work.tdc_pkg.all;
    use work.time_order_pkg.all;

entity tom_2_to_1_tb is
end tom_2_to_1_tb;

architecture behave of tom_2_to_1_tb is

    component tdc_channel is
    generic(
        INIT_VAL                    : std_logic_vector(TDC_WIDTH-1 downto 0) := (others => '0'));
    port(
    -- Inputs -----------------------------
        tdc_clk                	    : in std_logic;
        reset                       : in std_logic;
        tdc_clr			            : in std_logic;
        disc                        : in std_logic;
        fifo_re                     : in std_logic;
    -- Outputs -----------------------------
        fifo_ept                    : out std_logic;
        tdc_dout                    : out std_logic_vector(TDC_WIDTH-1 downto 0));
    end component;

    component tom_2_to_1 is
        port(
        ein                         : in std_logic_vector(1 to 2);
        cin                         : in to_2c_type;
        din                         : in to_2d_type;
        emin                        : out std_logic;
        cmin                        : out std_logic_vector(TO_CWIDTH-1 downto 0);
        dmin                        : out std_logic_vector(TO_DWIDTH-1 downto 0));
    end component;

	constant CLKPER                 : time      := 8 ns;
	constant CLKHLFPER              : time		:= CLKPER/2;

	-- Test bench signals
	signal reset		            : std_logic	                                := '1';
	signal clk				        : std_logic                                 := '1';
    signal start                    : std_logic                                 := '1';
    signal tdc_clr                  : std_logic_vector(1 to 2)                  := (others => '0');
    signal disc                     : std_logic_vector(1 to 2);
    signal tdc_ch_t                 : to_2c_type;
    signal tdc_dout_t               : to_2d_type;
    signal tdc_fifo_re              : std_logic_vector(1 to 2)                  := (others => '0');
    signal tdc_fifo_ept             : std_logic_vector(1 to 2);
    signal emin                     : std_logic;
    signal cmin                     : std_logic_vector(TO_CWIDTH-1 downto 0);
    signal dmin                     : std_logic_vector(TO_DWIDTH-1 downto 0);
    signal disc_ce                  : std_logic;
    signal disc_reg                 : std_logic_vector(15 downto 0);
    signal disc_cnt                 : std_logic_vector(1 downto 0)               := (others => '1');
    signal ce                       : std_logic;
    signal ce_cnt                   : std_logic_vector(2 downto 0)               := (others => '1');
    signal full_reg                 : std_logic_vector(15 downto 0);
    signal dst_we                   : std_logic                                  := '0';

begin

	TDC_GEN:
    for I in 1 to 2 generate
        tdc_ch_inst : tdc_channel
        generic map(
            INIT_VAL                => TDC_INIT_FUN(I,TDC_WIDTH))
            --INIT_VAL                => INIT_VAL)
        port map(
        -- Inputs -----------------------------
            tdc_clk                 => clk,
            reset                   => reset,
            tdc_clr			        => tdc_clr(I),
            disc                    => disc(I),
            fifo_re                 => tdc_fifo_re(I),
        -- Outputs -----------------------------
            fifo_ept                => tdc_fifo_ept(I),
            tdc_dout                => tdc_dout_t(I)
        );
    end generate;

    UUT : tom_2_to_1
        port map(
        ein                         => tdc_fifo_ept,
        cin                         => tdc_ch_t,
        din                         => tdc_dout_t,
        emin                        => emin,
        cmin                        => cmin,
        dmin                        => dmin
    );

	-- Simulate power on reset
	reset <= '0' after 200 ns;
    start <= reset'delayed(100 ns);
	-- Generate clock
	clk <= (not clk) after CLKHLFPER;

    -- Make the TDC init circuit
    tdc_clr(1) <= reset'delayed(CLKPER);
    tdc_clr(2) <= reset;

    -- discriminator signals are counter bits
    disc <= disc_cnt;
    -- select a bit from the pseudo-random shift register to enable counter
    disc_ce <= disc_reg(3);

    --------------------------------------------------------------------------
	-- Generate a psuedo-random shift regiser to incrment counter a many
    -- different intervals, to provide stimulus that fully verifies
    -- time order circuit.
	--------------------------------------------------------------------------
	disc_reg_pcs : process(reset,clk)
	begin
        if reset = '1' then
            disc_reg <= "1001011001011010";
        else
            if rising_edge(clk) then
                disc_reg <= disc_reg(14 downto 0) & (disc_reg(15) xor disc_reg(12));
            end if;
        end if;
	end process;

    --------------------------------------------------------------------------
	-- Two-bit counter for discriminator input.
	--------------------------------------------------------------------------
	disc_cnt_pcs : process(reset,clk)
	begin
        if reset = '1' then
            disc_cnt <= (others => '0');
        else
            if rising_edge(clk) then
                if disc_ce = '1' then
                    disc_cnt <= disc_cnt + 1;
                end if;
            end if;
        end if;
	end process;

    --------------------------------------------------------------------------
	-- Generate a psuedo-random shift regiser to incrment counter a many
    -- different intervals, to provide stimulus that fully verifies
    -- time order circuit.
	--------------------------------------------------------------------------
	full_pcs : process(reset,clk)
	begin
        if reset = '1' then
            full_reg <= "0110110010101001";
        else
            if rising_edge(clk) then
                full_reg <= full_reg(14 downto 0) & (full_reg(15) xor full_reg(12));
            end if;
        end if;
	end process;

    --------------------------------------------------------------------------
	-- Two-bit counter for discriminator input.
	--------------------------------------------------------------------------
	ce_cnt_pcs : process(reset,clk)
	begin
        if reset = '1' then
            ce_cnt <= (others => '0');
        else
            if rising_edge(clk) then
                ce_cnt <= ce_cnt + 1;
            end if;
        end if;
	end process;

	ce_pcs : process(reset,ce_cnt(0))
	begin
        if reset = '1' then
            ce <= '0';
        else
            if rising_edge(ce_cnt(0)) then
                ce <= '1';
            else
                ce <= '0';
            end if;
        end if;
	end process;

    tdc_ch_t(1) <= "01";
    tdc_ch_t(2) <= "10";

    dst_we <= '1' when tdc_fifo_re > 0 else '0';

    time_order_pcs : process(clk)
    begin
        if rising_edge(clk) then
            if ce = '1' then
                tdc_fifo_re <= (not tdc_fifo_ept) and TO_CH2ONEHOT(cmin,2);
            else
                tdc_fifo_re <= (others => '0');
            end if;
        end if;
    end process;

end behave;