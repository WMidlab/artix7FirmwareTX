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
-- Test bench for time order channel enity.
--*********************************************************************************

library ieee;
	use ieee.std_logic_1164.all;
--	use ieee.math_real.all;
-- 	use ieee.numeric_std.all;
	use ieee.std_logic_unsigned.all;
	use ieee.std_logic_textio.all;
library std;
	use std.textio.all;
library work;
    use work.time_order_pkg.all;

entity time_order_tb is
end time_order_tb;

architecture behave of time_order_tb is

    component coinc_find is
        generic(
        IN_WIDTH                    : integer;
        OUT_WIDTH                   : integer;
        CH_WIDTH                    : integer;
        TDC_WIDTH                   : integer);
        port(
        -- inputs ---------------------------------------------
        clk 						: in std_logic;
        ce                          : in std_logic;
        reset                       : in std_logic;
        coinc_window                : in std_logic_vector(TDC_WIDTH-1 downto 0);
        rx_dst_rdy_n                : out std_logic;
        rx_sof_n                    : in std_logic;
        rx_eof_n                    : in std_logic;
        rx_src_rdy_n                : in std_logic;
        rx_data                     : in std_logic_vector(IN_WIDTH-1 downto 0);
        tofifo_rd                   : in std_logic;
        -- outputs --------------------------------------------
        tofifo_epty                 : out std_logic;
        tofifo_dout                 : out std_logic_vector(OUT_WIDTH-1 downto 0));
    end component;

    component time_order is
        generic(
        NUM_LANES                   : integer);
        port(
        clk						    : in std_logic;
        ce                          : in std_logic;
        reset						: in std_logic;
        dst_full                    : in std_logic;
        src_epty                    : in std_logic_vector(1 to NUM_LANES);
        din    	                    : in trigger_data_type;
        src_re                      : out std_logic_vector(1 to NUM_LANES);
        dst_we                      : out std_logic;
        dout                        : out std_logic_vector(TO_WIDTH-1 downto 0));
    end component;

    component coinc_find_fileio is
        generic(
            STIMULUS_FILE  	        : string	                                := ".\source\coinc_find_fileio.txt";
            DWIDTH                  : integer                                   := 16);
        port(
            clk                     : in std_logic;
            ce                      : in std_logic;
            reset                   : in std_logic;
            fileio_enable           : in std_logic;
            rx_dst_rdy_n            : in std_logic                              := '1';
            rx_sof_n                : out std_logic                             := '1';
            rx_eof_n                : out std_logic                             := '1';
            rx_src_rdy_n            : out std_logic                             := '1';
            rx_data                 : out std_logic_vector(DWIDTH-1 downto 0)   := (others => '0'));
    end component;

	constant STIMULUS_FILE  	    : string	                                := "..\..\coinc_find\sim\source\coinc_find_tb.txt";
    constant CLKPER                 : time                                      := 4 ns;
	constant CLKHLFPER              : time		                                := CLKPER/2;

    constant IN_WIDTH               : integer                                   := 16;
    constant OUT_WIDTH              : integer                                   := 32;
    constant TDC_WIDTH              : integer                                   := 9;
    constant CH_WIDTH               : integer                                   := 8;
    constant TO_NUM_LANES           : integer                                   := 13;
    constant COINC_WINDOW           : std_logic_vector(TDC_WIDTH-1 downto 0)    := "000001000";


    type to_ctrl_type is array (1 to TO_NUM_LANES) of std_logic;


	-- Test bench signals

	signal clk				        : std_logic                                     := '1';
    signal ce                       : std_logic                                     := '0';
	signal reset		            : std_logic	                                    := '1';
    signal tofifo_dout_t            : trigger_data_type(1 to TO_NUM_LANES);
    signal tofifo_re                : std_logic_vector(1 to TO_NUM_LANES);
    signal tofifo_epty              : std_logic_vector(1 to TO_NUM_LANES);
    signal dst_we                   : std_logic;
    signal ordered                  : std_logic_vector(TO_WIDTH-1 downto 0);
    signal ce_cnt                   : std_logic_vector(2 downto 0)                  := (others => '1');

    signal full_reg                 : std_logic_vector(15 downto 0);
    signal bpi_full                 : std_logic                                     := '0';
    signal cordered                 : std_logic_vector(TO_CWIDTH-1 downto 0);
    signal dordered                 : std_logic_vector(TO_DWIDTH-1 downto 0);

    signal rx_dst_rdy_n             : to_ctrl_type                                  := (others => '1');
    signal rx_sof_n                 : to_ctrl_type                                  := (others => '1');
    signal rx_eof_n                 : to_ctrl_type                                  := (others => '1');
    signal rx_src_rdy_n             : to_ctrl_type                                  := (others => '1');
    signal rx_data                  : aurora_data_type(1 to TO_NUM_LANES)           := (others => (others => '1'));
    signal fileio_enable            : std_logic                                     := '0';

    signal test                     : std_logic;

begin

    ------------------------------------------------------------
    -- Use coincidence finder for stimulus because doing
    -- otherwise requires too much labor.
    ------------------------------------------------------------
    COINC_GEN:
    for I in 1 to TO_NUM_LANES generate
        coinc_find_ins : coinc_find
        generic map(
            IN_WIDTH                => IN_WIDTH,
            OUT_WIDTH               => OUT_WIDTH,
            CH_WIDTH                => CH_WIDTH,
            TDC_WIDTH               => TDC_WIDTH)
        port map(
            -- inputs ---------------------------------------------
            clk 					=> clk,
            ce                      => ce,
            reset                   => reset,
            coinc_window            => COINC_WINDOW,
            rx_dst_rdy_n            => rx_dst_rdy_n(I),
            rx_sof_n                => rx_sof_n(I),
            rx_eof_n                => rx_eof_n(I),
            rx_src_rdy_n            => rx_src_rdy_n(I),
            rx_data                 => rx_data(I),
            tofifo_rd               => tofifo_re(I),
            -- outputs --------------------------------------------
            tofifo_epty             => tofifo_epty(I),
            tofifo_dout             => tofifo_dout_t(I)
        );
    end generate;

    UUT : time_order
    generic map(
        NUM_LANES                   => TO_NUM_LANES)
    port map(
        clk						    => clk,
        ce                          => ce,
        reset						=> reset,
        dst_full                    => bpi_full,
        src_epty                    => tofifo_epty,
        din    	                    => tofifo_dout_t,
        src_re                      => tofifo_re,
        dst_we                      => dst_we,
        dout                        => ordered
    );

    STIM_GEN:
    for I in 1 to TO_NUM_LANES generate
    stim_ins : coinc_find_fileio
        generic map(
            STIMULUS_FILE  	        => STIMULUS_FILE,
            DWIDTH                  => IN_WIDTH)
        port map(
            clk                     => clk,
            ce                      => ce,
            reset                   => reset,
            fileio_enable           => fileio_enable,
            rx_dst_rdy_n            => rx_dst_rdy_n(I),
            rx_sof_n                => rx_sof_n(I),
            rx_eof_n                => rx_eof_n(I),
            rx_src_rdy_n            => rx_src_rdy_n(I),
            rx_data                 => rx_data(I));
    end generate;

	-- Simulate power on reset
	reset <= '0' after 200 ns;
    fileio_enable <= not reset'delayed(200 ns);
	-- Generate clock
	clk <= (not clk) after CLKHLFPER;


    bpi_full <= full_reg(5);

    cordered <= ordered(ordered'length-1 downto ordered'length-TO_CWIDTH);
    dordered <= ordered(TO_DWIDTH-1 downto 0);


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

	ce2x_pcs : process
	begin
        wait until rising_edge(ce_cnt(0));
            ce <= '1';
        wait for CLKPER;
            ce <= '0';
	end process;

end behave;