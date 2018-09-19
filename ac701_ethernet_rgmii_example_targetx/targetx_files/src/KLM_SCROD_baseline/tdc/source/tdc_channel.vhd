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
-- Generate free running counter that written to a FIFO when trigger bit is asserted.
-- Decode TARGET ASIC trigger bits.  Modified RPC Front End board design.
--
-- Use INIT_VAL to add an offset when TDC counter is reset. This will sync it other
-- counters like the RPC system counters.
--
-- Deficiencies:
-- 1) Does not handle multiple channel (>2) trigger decoding.
-- 2) Does not deal with glitches that occur when multiple channel are triggered.
--    Need to know the real timing constrains of trigger glitches ~ 2ns.
--*********************************************************************************

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
    use ieee.std_logic_misc.all;
library work;
   	use work.tdc_pkg.all;
library unisim;
    use unisim.vcomponents.all;

entity tdc_channel is
generic(
    INIT_VAL                    : std_logic_vector(TDC_TWIDTH-1 downto 0));
port(
-- Inputs -----------------------------
    tdc_clk                     : in std_logic;
    reset                       : in std_logic;
    tdc_clr			            : in std_logic;
    tb                          : in std_logic_vector(5 downto 1);
    tb16                        : in std_logic;--?
    fifo_re                     : in std_logic;
	exttb_format				: in std_logic_vector(3 downto 0);
-- Outputs -----------------------------
    exttb                       : out std_logic_vector(5 downto 1);
    fifo_ept                    : out std_logic;
    tdc_dout                    : out std_logic_vector(TDC_FWIDTH-1 downto 0));
end tdc_channel;


architecture behave of tdc_channel is

    component tdc_fifo is
        generic(
            DEPTH               : integer;
            DWIDTH              : integer);
        port(
            clk                 : in std_logic;
            clr                 : in std_logic;
            rd                  : in std_logic;
            wr                  : in std_logic;
            din                 : in std_logic_vector(DWIDTH-1 downto 0);
            empty               : out std_logic;
            full                : out std_logic;
            dout                : out std_logic_vector(DWIDTH-1 downto 0));
    end component;

    signal tdc_rst_q0           : std_logic := '1';  --?? check timing effects.

    signal tb_q0                : std_logic_vector(5 downto 1);
    signal tb_q1                : std_logic_vector(5 downto 1) := (others => '1');
    signal tb_q2                : std_logic_vector(5 downto 1) := (others => '1');
    signal tb_q3                : std_logic_vector(5 downto 1) := (others => '1');
    signal tb_q4                : std_logic_vector(5 downto 1) := (others => '0');

    signal counter              : std_logic_vector(TDC_TWIDTH-1 downto 0)   := INIT_VAL;
    signal counter_q0           : std_logic_vector(TDC_TWIDTH-1 downto 0)   := INIT_VAL;
    signal counter_q1           : std_logic_vector(TDC_TWIDTH-1 downto 0)   := INIT_VAL;

    signal fifo_full            : std_logic;
    signal fifo_din             : std_logic_vector(TDC_FWIDTH-1 downto 0);
    signal fifo_we_q0           : std_logic                                 := '0';

    signal trig_q0              : std_logic                                 := '0';
    signal chan_q0              : std_logic_vector(TDC_CWIDTH-1 downto 0)   := ("0000");
    signal chan_q1              : std_logic_vector(TDC_CWIDTH-1 downto 0)   := ("0000");

    signal extexn               : tb_ext_type;
	signal exttb_format_i		: std_logic_vector(3 downto 0):=x"0";
    for all : tdc_fifo use entity work.tdc_fifo(fwft_arch0);

    -- attribute shreg_extract: string;
    -- attribute shreg_extract of counter_q0 : signal is "no";
    -- attribute shreg_extract of counter_q1 : signal is "no";

begin

----------------------------------------------------------------
-- Component Instantiations
----------------------------------------------------------------
    fifo_ins : tdc_fifo
        generic map(
            DEPTH               => 4,
            DWIDTH              => TDC_FWIDTH)
        port map(
            clk                 => tdc_clk,
            clr                 => tdc_rst_q0,
            rd                  => fifo_re,
            wr                  => fifo_we_q0,
            din                 => fifo_din,
            empty               => fifo_ept,
            full                => fifo_full,
            dout                => tdc_dout
    );

----------------------------------------------------------------
-- Concurrent Statements
----------------------------------------------------------------

    fifo_din <= chan_q1 & counter_q1;

----------------------------------------------------------------
-- Synchronous Logic
----------------------------------------------------------------
    --------------------------------------------------
    -- Generate the cross-clock domain FFs. Generate
    -- one clock trigger pulse from arbitrarily long
    -- trigger pulses. Instantiate FFs so we know what
    -- we are getting.
    --?Could use sys clock on first FF if trigger bits
    -- are synchronous.
    --------------------------------------------------
    CC_FFS_GEN : for I in 5 downto 1 generate
        -- clock FF with analog discriminator
        FDCE0_inst : FDCE
        generic map (
            INIT => '0') -- Initial value of register ('0' or '1')
        port map (
            Q           => tb_q0(I),     -- Data output
            C           => tdc_clk,--tb(I),        -- Clock input
            CE          => '1',         -- Clock enable input
            CLR         => '0',--tb_q2(I),     -- Asynchronous clear input
            D           => tb(I)--'1'          -- Data input
        );

        -- double register the discriminator value --
        FDSE1_inst : FDSE
        generic map (
            INIT => '1') -- Initial value of register ('0' or '1')
        port map (
            Q           => tb_q1(I),      -- Data output
            C           => tdc_clk,     -- Clock input
            CE          => '1',         -- Clock enable input
            S           => '0',         -- Synchronous set input
            D           => tb_q0(I)      -- Data input
        );

        FDSE2_inst : FDSE
        generic map (
            INIT => '1') -- Initial value of register ('0' or '1')
        port map (
            Q           => tb_q2(I),     -- Data output
            C           => tdc_clk,     -- Clock input
            CE          => '1',         -- Clock enable input
            S           => '0',         -- Synchronous set input
            D           => tb_q1(I)      -- Data input
        );
        -----------------------------------------------

        -- add another register for the edge detector
        FDSE3_inst : FDSE
        generic map (
            INIT => '1') -- Initial value of register ('0' or '1')
        port map (
            Q           => tb_q3(I),     -- Data output
            C           => tdc_clk,     -- Clock input
            CE          => '1',         -- Clock enable input
            S           => '0',         -- Synchronous set input
            D           => tb_q2(I)      -- Data input
        );
    end generate;

    -------------------------------------
    -- Input registers
    -------------------------------------
    tdc_regs_pcs : process(tdc_clk)
    begin
        if (tdc_clk'event and tdc_clk = '1') then
            -- add a FF to improve timing on large fanout signal
            tdc_rst_q0 <= reset;
            -- detect an edge on the trigger bits
            tb_q4 <= (not tb_q3) and tb_q2;
            fifo_we_q0 <= trig_q0 and (not fifo_full);
            chan_q1 <= chan_q0;
            -- pipeline the output
            counter_q0 <= counter;
            counter_q1 <= counter_q0;
				
				exttb_format_i<=exttb_format;
				if (exttb_format_i=EXTB_EXTENDED) then
					extexn <= tb_q4 & extexn(extexn'length-1 downto 1);
					exttb <= EXT_REDUCE(extexn);
				elsif (exttb_format_i=EXTB_EDGE) then
					exttb<=(not tb_q3) and tb_q2;
				elsif (exttb_format_i=EXTB_TB) then
					exttb<=tb_q3;
				else
					exttb<=(others=>'0');
				end if;
        end if;
    end process;

    --------------------------------------
    -- Counter to generate TDC value
    --------------------------------------
    count_pcs : process(tdc_clk)
    begin
        if (tdc_clk'event and tdc_clk = '1') then
            if tdc_clr = '1' then
                counter <= INIT_VAL;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    --------------------------------------
    -- Decode the trigger bits
    --------------------------------------
    tb_dcdc_pcs : process(tdc_clk)
    begin
        if (tdc_clk'event and tdc_clk='1') then
            case tb_q4 is
            -------------------------------------
            -- Straight decoder
            -------------------------------------
                when "00000" =>
                    trig_q0 <= '0';
                    chan_q0 <= "0000";
                when "00001" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0001";
                when "00010" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0010";
                when "00011" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0011";
                when "00100" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0100";
                when "00101" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0101";
                when "00110" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0110";
                when "00111" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0111";
                when "01000" =>
                    trig_q0 <= '1';
                    chan_q0 <= "1000";
                when "01001" =>
                    trig_q0 <= '1';
                    chan_q0 <= "1001";
                when "01010" =>
                    trig_q0 <= '1';
                    chan_q0 <= "1010";
                when "01011" =>
                    trig_q0 <= '1';
                    chan_q0 <= "1011";
                when "01100" =>
                    trig_q0 <= '1';
                    chan_q0 <= "1100";
                when "01101" =>
                    trig_q0 <= '1';
                    chan_q0 <= "1101";
                when "01110" =>
                    trig_q0 <= '1';
                    chan_q0 <= "1110";
                when "01111" =>
                    trig_q0 <= '1';
                    chan_q0 <= "1111";
                -------------------------------------
                -- >2 channels decoder--?
                -- (just write channel 0 to mark >2 for now)
                -------------------------------------
                when "10000" =>--should not happen
                    trig_q0 <= '1';
                    chan_q0 <= "0000";
                when "10001" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0000";
                when "10010" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0000";
                when "10011" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0000";
                when "10100" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0000";
                when "10101" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0000";
                when "10110" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0000";
                when "10111" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0000";
                when "11000" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0000";
                when "11001" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0000";
                when "11010" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0000";
                when "11011" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0000";
                when "11100" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0000";
                when "11101" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0000";
                when "11110" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0000";
                when "11111" =>
                    trig_q0 <= '1';
                    chan_q0 <= "0000";
                when others =>--fully defined, don't care
                    trig_q0 <= 'X';
                    chan_q0 <= "XXXX";
            end case;
        end if;
    end process;

end behave;


