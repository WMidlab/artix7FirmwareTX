------------------------------------------------------------------------
--
-- bpid.vhd --- BPID test
--
-- Mikihiko Nakao, KEK IPNS
--
-- 20110725 0.01  first version
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
library unisim;
use unisim.vcomponents.ALL;
--library work;
--use work.mytypes.all;

------------------------------------------------------------------------
-- entity
------------------------------------------------------------------------
entity bpid is
  generic (
    constant VERSION : integer := 2;
    constant ID : std_logic_vector (31 downto 0) := x"42504944" );  -- "BPID"

  port (
--    signal user_clock   : in    std_logic;
    signal ack_n      : out   std_logic;
    signal ack_p      : out   std_logic;
    signal trg_n      : in    std_logic;
    signal trg_p      : in    std_logic;
    signal rsv_n      : out   std_logic;
    signal rsv_p      : out   std_logic;
    signal clk_n      : in    std_logic;
    signal clk_p      : in    std_logic;

	 signal clk127 	 : out	std_logic;
	 signal clk21	 	 : out	std_logic;
	 signal trg127		 : out	std_logic;
	 signal trg21		 : out	std_logic;

	 signal ready		 : out	std_logic;

    signal led        : out   std_logic_vector (15 downto 0);
    signal sma_gpio_p : out   std_logic;
    signal sma_gpio_n : out   std_logic;
    
	 signal monitor	 : out	std_logic_vector(15 downto 0) );
	 
end bpid;

------------------------------------------------------------------------
-- architecture
------------------------------------------------------------------------
architecture implementation of bpid is

  constant XVERSION : std_logic_vector (31 downto 0)
    := conv_std_logic_vector(VERSION, 32);

  -- FMC O3_RX (LA06) を trg  => S6 D4/D5 (p/n)
  -- FMC O4_RX (LA00) を clk  => S6 G9/F10 (p/n)
  --
  -- FMC O3_TX (LA03) を ack  => S6 B18/A18 (p/n)
  -- FMC O4_TX (LA05) を rsv  => S6 C4/A4 (p/n)
  --
  -- SMA_GPIO_P - S6 A3
  -- SMA_GPIO_N - S6 B3
  -- 
  -- LED0 - DS3 - S6 D17
  -- LED1 - DS4 - S6 AB4
  -- LED2 - DS5 - S6 D21
  -- LED3 - DS6 - S6 W15
  --
  -- USER_CLOCK(lclk) - S6 AB13


  signal sig_led : std_logic_vector (15 downto 0);

  signal cnt_l : std_logic_vector (23 downto 0);
  --subtype std_logic26 is std_logic_vector (25 downto 0);
  --type std_logic26_vector is array (natural range <>) of std_logic26;
  signal cnt_j : std_logic_vector (25 downto 0);
  signal sig_jclk : std_logic;
  signal sta_jclk : std_logic;

  signal clk_l : std_logic;
  signal clk_j : std_logic;
  signal clk_d : std_logic;
  signal clk_s : std_logic;
  
  signal sig_ready : std_logic;
  signal sig_trg   : std_logic;
  signal sig_dbg   : std_logic;

  signal sig_revo  : std_logic;
  signal sig_revo3 : std_logic;
  signal sig_clk21 : std_logic;
  signal sig_trg21 : std_logic;

  signal dbg : std_logic_vector (1 downto 0);

  signal cnt_trg   : std_logic_vector (1 downto 0);
  
  signal sig_sta_cnterr : std_logic_vector(7 downto 0);
   signal sig_sta_delaycnt : std_logic_vector(7 downto 0);
  
begin
  ----------------------------------------------------------------------
  -- clock and LED (lclk, jclk)
  ----------------------------------------------------------------------
  clk127 <= clk_j;
  clk21	<= sig_clk21;
  trg127 <= sig_trg;
  trg21	<= sig_trg21;
  ready  <= sig_ready;

  led <= sig_led;
  
  sig_led(15 downto 12) <= sig_sta_cnterr(3 downto 0);
  sig_led(11 downto 8) <= sig_sta_delaycnt(3 downto 0);
  sig_led(7) <= sig_trg;
  sig_led(6) <= sig_trg21;
  sig_led(5 downto 4) <= (others => '0');
  
  monitor(0)				<= sig_clk21;
  monitor(1)				<= sig_trg;
  monitor(2)				<= sig_trg21;
  monitor(3)				<= sig_ready;
--  monitor(4) 				<= sig_ready;
--  monitor(5)				<= dbg(0);
  monitor(7 downto 4) <= (others => '0');
  monitor(11 downto 8)	 <= sig_sta_cnterr(3 downto 0);
  monitor(15 downto 12)  <= sig_sta_delaycnt(3 downto 0);
  
  map_ji: ibufds port map ( o => sig_jclk, i => clk_p, ib => clk_n );
--  map_lg: bufg port map ( i => user_clock, o => clk_l );

  map_ack: obufds port map ( i => '0', o => ack_p, ob => ack_n );
  map_rsv: obufds port map ( i => '0', o => rsv_p, ob => rsv_n );
  
--   proc_lclk: process (clk_l)
--   begin
--     if clk_l'event and clk_l = '1' then
--       if cnt_l = (27000 * 500 - 1) then
--         cnt_l <= (others => '0');
--         sig_led(0) <= not sig_led(0);
--       else
--         cnt_l <= cnt_l + 1;
--       end if;
--     end if;
--   end process;

  sig_led(0) <= sig_ready;
  
  proc_jclk: process (clk_j)
  begin
    if clk_j'event and clk_j = '1' then
      if cnt_j = (127216 * 500 - 1) then
        cnt_j <= (others => '0');
        sig_led(1) <= not sig_led(1);
      else
        cnt_j <= cnt_j + 1;
      end if;
    end if;
  end process;

  proc_trg: process (clk_j)
  begin
    if clk_j'event and clk_j = '1' then
      --sig_led(3 downto 2) <= cnt_trg(1 downto 0);
      if sig_trg = '1' then
        cnt_trg <= cnt_trg + 1;
      end if;
    end if;
  end process;
  sig_led(2) <= sta_jclk;
  sig_led(3) <= dbg(0);
  
  ----------------------------------------------------------------------
  -- test input / output
  ----------------------------------------------------------------------
  --sma_gpio_p <= sig_jclk;
  --sma_gpio_p <= sig_trg;
  --sma_gpio_n <= sig_jclk;
  --sma_gpio_p <= sig_ready;
  --sma_gpio_p <= dbg(0);
  --sma_gpio_p <= sig_clk21;
  sma_gpio_p <= sig_trg21;
  sma_gpio_n <= dbg(1);
  
--  map_trg: ibufds port map ( o=>dbg(0), i=>trg_p, ib=>trg_n );
  
  ------------------------------------------------------------------------
  -- CLK/RSV
  ------------------------------------------------------------------------
  map_belle2clk: entity work.belle2clk
    port map (
      clk    => sig_jclk,
      ready  => sta_jclk,
      clk254s => clk_s,
      clk254 => clk_d,
      clk127 => clk_j );

  ------------------------------------------------------------------------
  -- TRG (iserdes)
  ------------------------------------------------------------------------
  map_belle2trg: entity work.belle2trg
    port map (
      trg_p => trg_p,
      trg_n => trg_n,
      ack_p => open,
      ack_n => open,

      clk254s => clk_s,
      clk254 => clk_d,
      clk127 => clk_j,

      ready  => sig_ready,
      l1trg  => sig_trg,
      revo   => sig_revo,
      revo3  => sig_revo3,
      clk21  => sig_clk21,
      trg21  => sig_trg21,
   
      reg_autosync => '1',
      set_1bitslip => '0',
      set_2bitslip => '0',

      set_idelay   => '0',
      clr_idelay   => '0',
      clr_iserdes  => '0',

		sta_cnterr	 => sig_sta_cnterr,
		sta_delaycnt => sig_sta_delaycnt,

      dbg    => dbg,
      l1dbg  => sig_dbg );

end implementation;
