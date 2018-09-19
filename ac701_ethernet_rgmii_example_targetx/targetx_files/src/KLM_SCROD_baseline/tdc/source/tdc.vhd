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
-- Generates free running counter that is written to a FIFO when discrimitor is
-- asserted.
--
--?Must adjust TDC FIFO prog empty/full flags because a pipeline register
-- was added to tdc_fifo_dout.
--*********************************************************************************

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;
library work;
       use work.tdc_pkg.all;
library unisim;
    use unisim.vcomponents.all;


entity tdc is
port(
-- Inputs -----------------------------
    tdc_clk                         : in std_logic;
    ce                              : in std_logic_vector(1 to 4);
    reset                           : in std_logic;
    tdc_clr                         : in std_logic;
    tb                              : in tb_vec_type;
    tb16                            : in std_logic_vector(1 to TDC_NUM_CHAN);
    fifo_re                         : in std_logic_vector(1 to TDC_NUM_CHAN);
	exttb_format					: in std_logic_vector(3 downto 0);
-- Outputs -----------------------------
    exttb                           : out tb_vec_type;
    fifo_ept                        : out std_logic_vector(1 to TDC_NUM_CHAN);
    tdc_dout                        : out tdc_dout_type);
end tdc;


architecture behave of tdc is

    component tdc_channel is
    generic(
        INIT_VAL                    : std_logic_vector(TDC_TWIDTH-1 downto 0));
    port(
    -- Inputs -----------------------------
        tdc_clk                     : in std_logic;
        reset                       : in std_logic;
        tdc_clr                     : in std_logic;
        tb                          : in std_logic_vector(5 downto 1);
        tb16                        : in std_logic;
        fifo_re                     : in std_logic;
		exttb_format				: in std_logic_vector(3 downto 0);
    -- Outputs -----------------------------
        exttb                       : out std_logic_vector(5 downto 1);
        fifo_ept                    : out std_logic;
        tdc_dout                    : out std_logic_vector(TDC_FWIDTH-1 downto 0));
    end component;

    signal tdc_clr_qn               : std_logic_vector(3 downto 0)              := (others => '1');
    signal tdc_clr_dlyln            : std_logic_vector(1 to TDC_NUM_CHAN)       := (others => '1');

    signal fifo_ept_q0              : std_logic_vector(1 to TDC_NUM_CHAN)       := (others => '1');
    signal fifo_ept_q1              : std_logic_vector(1 to TDC_NUM_CHAN)       := (others => '1');
    signal tdc_dout_q0              : tdc_dout_type                             := (others => (others => '0'));
    signal tdc_dout_q1              : tdc_dout_type                             := (others => (others => '0'));
    
begin

----------------------------------------------------------------
-- Component Instantiations
----------------------------------------------------------------

    TDC_CH_GEN:
    for I in 1 to TDC_NUM_CHAN generate
        tdc_ch_ins : tdc_channel
        generic map(
            INIT_VAL                => TDC_INIT_FUN(I,TDC_TWIDTH))--shift
            --INIT_VAL                => TDC_INIT_FUN(0,TDC_TWIDTH))--distribute
        port map(
        -- Inputs -----------------------------
            tdc_clk                 => tdc_clk,
            reset                   => reset,
            tdc_clr                 => tdc_clr_dlyln(I),
            tb                      => tb(I),
            tb16                    => tb16(I),
            fifo_re                 => fifo_re(I),
			exttb_format			=> exttb_format,
        -- Outputs -----------------------------
            exttb                   => exttb(I),
            fifo_ept                => fifo_ept_q0(I),
            tdc_dout                => tdc_dout_q0(I)
        );
    end generate;

    -- Pipeline the clear signal from input to pipeline
    FDSE_GEN:
    for I in 0 to 2 generate
        FDSE_ins : FDSE
        generic map (
            INIT                    => '1') -- Initial value of register ('0' or '1')
        port map (
            Q                       => tdc_clr_qn(I+1), -- Data output
            C                       => tdc_clk,     -- Clock input
            CE                      => '1',         -- Clock enable input
            S                       => '0',         -- Synchronous set input
            D                       => tdc_clr_qn(I)    -- Data input
        );
    end generate;


----------------------------------------------------------------
-- Concurrent Statements
----------------------------------------------------------------

    -- Map signals to port -----------------------------------
    fifo_ept <= fifo_ept_q1;
    tdc_dout <= tdc_dout_q1;
    ----------------------------------------------------------

    tdc_clr_qn(0) <= tdc_clr;

----------------------------------------------------------------
-- Synchronous Logic
----------------------------------------------------------------

    -------------------------------------
    -- Input registers
    -------------------------------------
    tdc_regs_pcs : process(tdc_clk)
    begin
        if (tdc_clk'event and tdc_clk = '1') then
            -- local reset for counters
            --tdc_clr_dlyln <= tdc_clr_qn(3) & tdc_clr_dlyln(1 to tdc_clr_dlyln'length-1);
            tdc_clr_dlyln <= tdc_clr_dlyln(2 to tdc_clr_dlyln'length) & tdc_clr_qn(3);--?distribute instead of shift to improve timing
            -- clock enable these so timing analyzer understands multi-cycle path -------
            -- top of the chip --------------
            if ce(1) = '1' then
                for I in 1 to TDC_NUM_CHAN/2 loop
                    fifo_ept_q1(I) <= fifo_ept_q0(I);
                end loop;
            end if;
            if ce(2) = '1' then
                for I in 1 to TDC_NUM_CHAN/2 loop
                    tdc_dout_q1(I) <= tdc_dout_q0(I);
                end loop;
            end if;
            -- bottom of the chip --------------
            if ce(3) = '1' then
                for I in TDC_NUM_CHAN/2+1 to TDC_NUM_CHAN loop
                    fifo_ept_q1(I) <= fifo_ept_q0(I);
                end loop;
            end if;
            if ce(4) = '1' then
                for I in TDC_NUM_CHAN/2+1 to TDC_NUM_CHAN loop
                    tdc_dout_q1(I) <= tdc_dout_q0(I);
                end loop;
            end if;
            -- ------------------------------------------------------------
        end if;
    end process;

end behave;
