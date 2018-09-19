------------------------------------------------------------------------
-- belle2tt_s6.vhd
--
-- Belle II clock and timing distribution for Spartan6
--
-- Mikihiko Nakao (KEK)
-- 20101215 v0.01 rev1
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- belle2clk
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
library unisim;
use unisim.vcomponents.ALL;
library work;
use work.mytypes.all;

entity belle2clk is
  port (
    -- hardware interface
    clk   : in  std_logic;

    -- user interface
    ready  : out std_logic;
    clk254 : out std_logic;
    clk254s : out std_logic;
    clk127 : out std_logic );
  --clk63  : out std_logic;
  --clk31  : out std_logic );
end belle2clk;
--
architecture implementation of belle2clk is
  signal clk_raw : std_logic;
  signal clk_in  : std_logic;
  signal clk_254 : std_logic;
  signal clk_254s : std_logic;
  signal clk_127 : std_logic;
  --signal clk_63  : std_logic;
  --signal clk_31  : std_logic;
  signal clk_100 : std_logic;
  signal clk_200 : std_logic;

  signal sta_pll : std_logic;
  signal clr_pll : std_logic;
  signal sta_dcm : std_logic;
  signal clr_dcm : std_logic;
  signal sta_ictrl : std_logic;
  signal clr_ictrl : std_logic;

  signal cnt_check : std_logic10;
begin
  clk254 <= clk_254;
  clk254s <= clk_254s;
  clk127 <= clk_127;
  --clk63  <= clk_63;
  --clk31  <= clk_31;
  --ready  <= sta_pll and sta_dcm and sta_ictrl;
  ready  <= sta_pll;
  ------------------------------------------------------------------------
  -- differential pins
  ------------------------------------------------------------------------
  clk_raw <= clk;
  --map_clkin:  ibufds port map ( o => clk_raw, i => clk_p, ib => clk_n );
  --map_rsvout: obufds port map ( i => clk_in,  o => rsv_p, ob => rsv_n );

  ------------------------------------------------------------------------
  -- PLL
  ------------------------------------------------------------------------
  map_bufg: bufg port map ( i => clk_raw, o => clk_in );
  map_pll: entity work.mypllfrom127_s6 port map (
    clk127in => clk_in,
    clk254s => clk_254s,
    clk254 => clk_254, clk127 => clk_127, --clk63 => clk_63, clk31 => clk_31,
    clk100 => clk_100, reset => clr_pll, locked => sta_pll );
  
  ------------------------------------------------------------------------
  -- DCM
  ------------------------------------------------------------------------
--   map_dcm: entity work.mydcm100 port map (
--     clk100in => clk_100, clk200 => clk_200,
--     reset => clr_dcm, locked => sta_dcm );
  
  ------------------------------------------------------------------------
  -- IDELAYCTRL (refclk: 200+-10 MHz)
  ------------------------------------------------------------------------
  --map_idelayctrl: idelayctrl
  --  port map ( refclk => clk_200, rst => clr_ictrl, rdy => sta_ictrl );

  ------------------------------------------------------------------------
  -- status check
  ------------------------------------------------------------------------
  proc_check: process (clk_in)
  begin
    if clk_in'event and clk_in = '1' then
      cnt_check <= cnt_check + 1;
      if cnt_check /= 0 then
        clr_pll <= '0';
        clr_dcm <= '0';
        clr_ictrl <= '0';
      elsif sta_pll = '0' then
        clr_pll <= '1';
      --elsif sta_dcm = '0' then
      --  clr_dcm <= '1';
      --elsif sta_ictrl = '0' then
      --  clr_ictrl <= '1';
      end if;
    end if;
  end process;
end implementation;

------------------------------------------------------------------------
-- belle2trg
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
library unisim;
use unisim.vcomponents.ALL;
library work;
use work.mytypes.all;

entity belle2trg is
  port (
    -- hardware interface
    trg_p : in  std_logic;
    trg_n : in  std_logic;
    ack_p : out std_logic;
    ack_n : out std_logic;
      
    -- internal interface
    clk254 : in std_logic;
    clk254s : in std_logic;
    clk127 : in std_logic;

    -- user interface (more to be added)
    reset   : out std_logic;            -- 3-revo long
    ready   : out std_logic;
    l1trg   : out std_logic;
    revo    : out std_logic;            -- once in 1280 clks
    revo3   : out std_logic;            -- once in 3 revos
    clk21   : out std_logic;            -- 21 MHz clock
    trg21   : out std_logic;            -- adjusted to clk21
    timzero : out std_logic_vector (47 downto 0);  -- from start
    timsync : out std_logic_vector (47 downto 0);  -- since sync'ed
    timrun  : out std_logic_vector (47 downto 0);  -- since reset
    timprev : out std_logic_vector (47 downto 0);  -- previous timrun
    
    -- serial data
    frame   : out std_logic;
    decoded : out std_logic_vector (31 downto 0);
    kchar   : out std_logic_vector (31 downto 0);

    -- debug interface
    reg_autosync : in std_logic;        -- should be set to '1'
    set_1bitslip : in std_logic;        -- should be set to '0'
    set_2bitslip : in std_logic;        --    if not controled
    buf_10bita   : out std_logic10;
    buf_10bitb   : out std_logic10;
    buf_10bitc   : out std_logic10;
    buf_10bitd   : out std_logic10;
    sta_cntsync  : out byte_t;
    sta_cnterr   : out byte_t;
    sta_delaycnt : out byte_t;

    set_idelay   : in std_logic;        -- should be set to '0'
    clr_idelay   : in std_logic;        --    if not controled
    clr_iserdes  : in std_logic;        -- 

    dbg : out std_logic_vector (1 downto 0);
    
    l1dbg  : out std_logic );
end belle2trg;
--
architecture implementation of belle2trg is
  signal sig_trgin    : std_logic;
  signal sig_ackout   : std_logic;

  signal sig_idelay   : std_logic;
  signal seq_idelay   : std_logic2;

  signal sig_desin    : std_logic;
  signal sig_desout   : std_logic2;
  signal sta_40bit    : std_logic40;

  signal sta_decoded  : long_t;
  signal sta_kchar    : long_t;

  signal seq_en8b10b  : std_logic2;
  signal sig_encoded  : std_logic10;
  signal sig_dout     : byte_t;
  signal sig_kout     : std_logic4;
  
  signal sig_1bitslip : std_logic;
  signal sig_1bitslip2 : std_logic;
  signal sig_2bitslip : std_logic;
  signal seq_1bitslip : std_logic2;
  signal seq_2bitslip : std_logic2;
  signal sta_skipsync : std_logic;
  signal sta_sync     : std_logic;
  signal sta_sync2    : std_logic;
  signal cnt_sync     : byte_t;
  signal cnt_syncerr  : byte_t;
  
  signal cnt_timzero  : std_logic48;
  signal cnt_timsync  : std_logic48;
  signal cnt_timrun   : std_logic48;
  signal buf_timrun   : std_logic48;
  signal cnt_2bitseq  : std_logic5;  -- 0..19 2-bit sequences for 40-bit word
  signal cnt_wordseq  : std_logic6;  -- 0..63 word sequences for 2560-bit revo

  signal cnt_nosync   : std_logic_vector (7 downto 0);
  signal cnt_idelay   : std_logic_vector (7 downto 0);
  signal sig_autoidelay : std_logic_vector (1 downto 0);
  
  signal sig_trgout   : std_logic;
  signal cnt_trgout   : std_logic5;

  signal sig_reset    : std_logic;
  
  signal seq_clk6     : std_logic_vector (5 downto 0);
  signal seq_trg6     : std_logic_vector (5 downto 0);
  signal seq_trgout   : std_logic;
begin
  ------------------------------------------------------------------------
  -- user interface
  ------------------------------------------------------------------------
  l1trg <= sig_trgout;
  ready <= sta_sync2;
  reset <= sig_reset;
  timzero <= cnt_timzero;
  timsync <= cnt_timsync;
  timrun  <= cnt_timrun;
  timprev <= buf_timrun;
  sta_cnterr   <= cnt_syncerr;
  sta_delaycnt <= cnt_idelay;
  
  ------------------------------------------------------------------------
  -- differential pins
  ------------------------------------------------------------------------
  map_trgin:  ibufds port map ( o => sig_trgin,  i => trg_p, ib => trg_n );
  map_ackout: obufds port map ( i => sig_ackout, o => ack_p, ob => ack_n );
  
  ------------------------------------------------------------------------
  -- IODELAY2 for Spartan6
  ------------------------------------------------------------------------
  map_iodelay: iodelay2
    generic map (
      IDELAY_VALUE       => 0,
      IDELAY2_VALUE      => 0,
      IDELAY_MODE        => "NORMAL",
--      IDELAY_TYPE        => "DIFF_PHASE_DETECTOR",
      IDELAY_TYPE        => "VARIABLE_FROM_ZERO",
      COUNTER_WRAPAROUND => "WRAPAROUND",
      DELAY_SRC          => "IDATAIN" )
    port map (
      idatain => sig_trgin,
      tout => open,
      dout => open,
      t   => '1',
      odatain => '0',
      dataout => sig_desin,
      ioclk0 => clk254,
      ioclk1 => '0',
      clk => clk127,
      ce  => sig_idelay,
      rst => clr_idelay,
      inc => '1',
      cal => '0' );
  
  ------------------------------------------------------------------------
  -- ISERDES
  ------------------------------------------------------------------------
  map_iserdes: iserdes2
    generic map (
      BITSLIP_ENABLE => TRUE,
      DATA_RATE      => "SDR",
      DATA_WIDTH     => 2,
      INTERFACE_TYPE => "NETWORKING",
      SERDES_MODE    => "MASTER" )
    port map (
      d         => sig_desin,
      ce0       => '1',
      clk0      => clk254,
      clk1      => '0',
      ioce      => clk254s,
      clkdiv    => clk127,
      rst => clr_iserdes,
      shiftin   => '0',
      bitslip   => sig_1bitslip2,
      fabricout => open,
      q3 => sig_desout(0),
      q4 => sig_desout(1) );
  
  ------------------------------------------------------------------------
  -- 8b10b
  ------------------------------------------------------------------------
  map_de8b10b: entity work.de8b10b
    port map (
      reset => '0',
      clock => clk127,
      en    => seq_en8b10b(0),
      din   => sig_encoded,
      kout  => sig_kout,
      dout  => sig_dout );

  ------------------------------------------------------------------------
  -- time
  ------------------------------------------------------------------------
  proc_time: process(clk127)
  begin
    if clk127'event and clk127 = '1' then
      -- just count from power on
      cnt_timzero <= cnt_timzero + 1;

      -- count only when timing-link is sync'ed
      if sta_sync2 = '0' then
        cnt_timsync <= (others => '0');
      else
        cnt_timsync <= cnt_timsync + 1;
      end if;

      -- count after reset is issued
      if sig_reset = '1' then
        buf_timrun <= cnt_timrun;
        cnt_timrun <= (others => '0');
      else
        cnt_timrun <= cnt_timrun + 1;
      end if;
    end if;
  end process;
  
  ------------------------------------------------------------------------
  -- rawdata
  ------------------------------------------------------------------------
  proc_rawdata: process(clk127)
  begin
    if clk127'event and clk127 = '1' then
      -- copy to 40-bit buffer
      sta_40bit <= sig_desout & sta_40bit(39 downto 2);
      dbg <= sig_desout;
      
      -- cycle boundary marker
      if cnt_2bitseq = 19 then
        buf_10bita   <= sta_40bit(9  downto 0);  -- just for monitor
        buf_10bitb   <= sta_40bit(19 downto 10);
        buf_10bitc   <= sta_40bit(29 downto 20);
        buf_10bitd   <= sta_40bit(39 downto 30);
      end if;
    end if;
    
  end process;
  ------------------------------------------------------------------------
  -- boundary control
  ------------------------------------------------------------------------
  proc_boundary: process(clk127)
    variable sta_10bit: std_logic10;
  begin
    sta_10bit := sta_40bit(39 downto 30);
    
    if clk127'event and clk127 = '1' then
      sig_1bitslip2 <= sig_1bitslip;
      sta_sync2 <= sta_sync;
      -- seq_idelay
      seq_idelay <= seq_idelay(0) & (set_idelay or sig_autoidelay(0));
      if seq_idelay = "10" then
        sig_idelay <= '1';
      else
        sig_idelay <= '0';
      end if;

      -- sig_bitslip for one-bit slip within 2-bit in ISERDES
      if reg_autosync = '0' then
        seq_1bitslip <= seq_1bitslip(0) & set_1bitslip;
        seq_2bitslip <= seq_2bitslip(0) & set_2bitslip;
      end if;

      if seq_1bitslip = "01" or
        (cnt_2bitseq = 0 and sta_sync2 = '0' and sta_skipsync = '1') then
        sig_1bitslip <= '1';
      else
        sig_1bitslip <= '0';
      end if;

      -- cycle counter adjustment based on k-char at cycle 0
      if cnt_2bitseq = 19 then
        cnt_2bitseq  <= (others => '0');
        if sta_skipsync = '1' then
          sta_skipsync <= '0';
        elsif sta_10bit = "0011111010" or sta_10bit = "1100000101" then
          sta_sync <= '1';
          if sta_sync2 = '0' then
            sta_cntsync <= cnt_sync;
            cnt_sync    <= (others => '0');
          end if;
          if sig_autoidelay(1) = '1' then
--            sig_autoidelay <= "01";      -- one more delay to be safe
            sig_autoidelay <= "00";      
          end if;
        else
          sta_sync <= '0';
          if sta_sync2 = '1' then
            cnt_syncerr <= cnt_syncerr + 1;
          end if;

          -- once in 40*4 times, try idelay
          if cnt_nosync = 159 and reg_autosync = '1' then
            cnt_nosync <= (others => '0');
            cnt_idelay <= cnt_idelay + 1;
            sig_autoidelay <= "11";
          else
            cnt_nosync <= cnt_nosync + 1;
          end if;
          
          if reg_autosync = '1' then
            cnt_sync     <= cnt_sync + 1;
            sta_skipsync <= '1';              -- bit shift in progress
            sig_2bitslip <= not cnt_sync(0);  -- 2-bit shift once in twice
          end if;
        end if;

      else -- to adjust boundary, do not increment cnt_2bitseq
        sig_autoidelay(0) <= '0';
        
        if not (seq_2bitslip = "01" or sig_2bitslip = '1') then
          cnt_2bitseq <= cnt_2bitseq + 1;
        end if;
        sig_2bitslip <= '0';
      end if;
      
    end if;
  end process;
    
  ------------------------------------------------------------------------
  -- decode
  ------------------------------------------------------------------------
  trg21 <= seq_trg6(5);
  proc_decode: process(clk127)
  begin
    if clk127'event and clk127 = '1' then
      -- 21M clock
      clk21 <= seq_clk6(5);
      
      -- copy to decoding buffer at byte boundary
      if cnt_2bitseq = 4 or cnt_2bitseq = 9 or
        cnt_2bitseq = 14 or cnt_2bitseq = 19 then
        sig_encoded <= sta_40bit(39 downto 30);
        seq_en8b10b <= seq_en8b10b(0) & '1';
      else
        seq_en8b10b <= seq_en8b10b(0) & '0';
      end if;

      -- copy to decoded data at byte boundary (2 clks later)
      if seq_en8b10b(1) = '1' then
        sta_decoded <=        sig_dout & sta_decoded(31 downto 8);
        sta_kchar <= "0000" & sig_kout & sta_kchar(31   downto 8);
      end if;

      -- L1 trigger --
      if cnt_2bitseq = 7 then
        if sta_decoded(7+24 downto 5+24) = TTTYP_NONE then
          l1dbg <= '0';
        else
          l1dbg <= '1';
          if sta_decoded(4+24 downto 0+24) = 0 then
            sig_trgout <= '1';
          elsif sta_decoded(4+24) = '0' or sta_decoded(3+24 downto 2+24) = 0 then
          --else
            cnt_trgout <= sta_decoded(4+24 downto 0+24);
          end if;
        end if;
      elsif cnt_trgout = 1 then
        sig_trgout <= '1';
        cnt_trgout(0) <= '0';
      else
        sig_trgout <= '0';
        if cnt_trgout /= 0 then
          cnt_trgout <= cnt_trgout - 1;
        end if;
      end if;

      -- long trigger
      if seq_trg6 /= 0 then
        seq_trg6 <= seq_trg6(4 downto 0) & '0';
      elsif sig_trgout = '1' and seq_clk6 = "000111" then
        seq_trg6 <= "111111";
      elsif sig_trgout = '1' then
        seq_trgout <= '1';
      elsif seq_trgout = '1' and seq_clk6 = "000111" then
        seq_trg6 <= "111111";
        seq_trgout <= '0';
      end if;

      -- revolution, 3-revolution, clk42 --
      if cnt_2bitseq = 12 then
        if sta_decoded(1+24 downto 0+24) /= 0 then
          revo <= '1';
        end if;
        if sta_decoded(1+24 downto 0+24) = 3 then
          revo3 <= '1';
          seq_clk6 <= "000111";
          sig_reset <= sta_decoded(15);
        else
          sig_reset <= '0';
          seq_clk6 <= seq_clk6(4 downto 0) & seq_clk6(5);
        end if;
      else
        revo  <= '0';
        revo3 <= '0';
        seq_clk6 <= seq_clk6(4 downto 0) & seq_clk6(5);
      end if;
      
      -- save buffer
      if cnt_2bitseq = 2 then
        decoded <= sta_decoded;
        kchar   <= sta_kchar;
        frame   <= '1';
      else
        frame   <= '0';
      end if;
      
    end if;
  end process;
  
end implementation;
