------------------------------------------------------------------------
--
--- b2tt.vhd --- Belle II TT-link receiver top
---
--  This firmware is a reference design for a frontend board
--  which is connected to ft2u firmware
--
--  (Note: there are still missing features,
--         marked with TBI = to be implemented.)
--
--  Mikihiko Nakao, KEK IPNS
--  20130530 0.01  first version
--     (there are many intermediate versions between 0.01 and 0.02)
--  20130926 0.02  revised (revo/revo9, b2ltag in ack packet)
--  20131002 0.03  revised (exprun, b2tt_ddr.vhd)
--  20131013 0.04  merging v5,v6,s6 versions
--  20131028 0.05  fixing b2tt_ddr
--  20131101 0.06  no more std_logic_arith
--  20131110 0.07  96-bit fifodata for final(?) header format
--  20131118 0.08  all open ports are connected to dummy signals
--  20131119 0.09  S6 iodelay2 fix
--  20131121 0.10  tested with S6/V5/V6, more iodelay monitor and control
--  20131127 0.11  duplicated header fix (bug in b2tt_fifo)
--  20131218 0.12  entagerr added
--  20140102 0.13  fix for one-pulse err signal, tagerr check ini.values
--  20140406 0.14  ttup error study
--  20140409 0.15  crc8 trial
--  20140607 0.16  b2tt version output
--  20140611 0.17  revised dbg for chipscope of KLM data concentrator
--  20140614 0.18  port 0.17 changes to v5 and s6
--  20140618 0.19  iserdes version for v6
--  20140704 0.20  interface adjustment for v5 and s6
--  20140708 0.21  iserdes version for v6 tuning
--  20140710 0.22  crc8 for rx, ila revised, signals for scan mode
--  20140710 0.23  no sigslip version (scan test, only for v6)
--  20140710 0.24  delay scan (calc test, only for v6)
--  20140710 0.25  delay scan and set (only for v6)
--  20140715 0.26  improved error handling
--  20140718 0.27  b2ttup and b2lup should be current status
--  20140729 0.28  new b2tt_symbols for ft2u059
--  20140808 0.29  b2tt_payload separated from b2tt_encode
--  20140827 0.30  one frame long runreset, busyup at runreset fix
--  20140902 0.31  sim_speedup, optional external clock source
--  20141002 0.32  gtpreset when clk is lost and recovered
--  20150105 0.33  no more raw ddr signal out, rawclk after bufg
--  20150112 0.34  jtag handling, trgmask, cleanup unused signals
--  20150112 0.35  timerr fix
--  20150227 0.36  merging trgmask fixes
--  20150310 0.37  clraddr, stareset
--  20150428 0.38  b2tt encode fix, decode clraddr
--  20150525 0.39  b2tt decode to no tagerr when mask is cleared
--  20150528 0.40  DIVCLK fix
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity b2tt is
  generic (
    VERSION  : integer := 40;
    PROTOCOL : integer := 29;
    DEFADDR  : std_logic_vector (19 downto 0) := x"00000";
    FLIPCLK  : std_logic := '0';  -- no more used
    FLIPTRG  : std_logic := '0';
    FLIPACK  : std_logic := '0';
    USEFIFO  : std_logic := '1';
    CLKDIV1  : integer range 1 to 72 := 3;
    CLKDIV2  : integer range 1 to 72 := 4;
    USEPLL   : std_logic := '0';
    USEICTRL : std_logic := '1';
    NBITTIM  : integer range 1 to 32 := 32;
    NBITTAG  : integer range 4 to 32 := 32;
    NBITID   : integer range 4 to 32 := 16;
    B2LRATE  : integer := 4;  -- 127 Mbyte / s
    USEEXTCLK   : std_logic := '0';
    SIM_SPEEDUP : std_logic := '0' );
  port (
    -- b2tt version
    b2ttver  : out std_logic_vector (15 downto 0);
    
    -- RJ-45
    clkp     : in  std_logic;
    clkn     : in  std_logic;
    trgp     : in  std_logic;
    trgn     : in  std_logic;
    rsvp     : out std_logic;
    rsvn     : out std_logic;
    ackp     : out std_logic;
    ackn     : out std_logic;

    -- alternative external clock source
    extclk    : in std_logic;
    extclkinv : in std_logic;
    extclkdbl : in std_logic;
    extdblinv : in std_logic;
    extclklck : in std_logic;

    -- board id
    id       : in  std_logic_vector (NBITID-1 downto 0);

    -- link status
    b2clkup  : out std_logic;
    b2ttup   : out std_logic;

    -- system clock and time
    sysclk   : out std_logic;
    rawclk   : out std_logic;
    dblclk   : out std_logic;
    hlfclk   : out std_logic;
    utime    : out std_logic_vector (NBITTIM-1 downto 0);
    ctime    : out std_logic_vector (26 downto 0);

    -- divided clock
    divclk1  : out std_logic_vector (1 downto 0);
    divclk2  : out std_logic_vector (1 downto 0);

    -- exp- / run-number
    exprun   : out std_logic_vector (31 downto 0);
    
    -- run reset
    runreset : out std_logic;
    feereset : out std_logic;
    b2lreset : out std_logic;
    gtpreset : out std_logic;
    
    -- trigger
    trgout   : out std_logic;
    trgtyp   : out std_logic_vector (3  downto 0);
    trgtag   : out std_logic_vector (31 downto 0);
    trgmask  : out std_logic;

    -- revolution
    revo     : out std_logic;
    --revo3  : out std_logic;
    revo9    : out std_logic;
    revoclk  : out std_logic_vector (10 downto 0);
    revogap  : out std_logic;                       -- TBI
    injveto  : out std_logic_vector (1 downto 0);   -- TBI
    
    -- busy and status return
    busy     : in  std_logic; -- to suspend the trigger
    err      : in  std_logic; -- to stop the run

    -- Belle2link status
    b2plllk  : in  std_logic;
    b2linkup : in  std_logic;
    b2linkwe : in  std_logic;
    b2lclk   : in  std_logic;

    -- SEU status (from virtex5_seu_controller)
    seuinit  : in  std_logic;  -- initialising
    seubusy  : in  std_logic;  -- busy
    seuactiv : in  std_logic;  -- acm_active
    seuscan  : in  std_logic;  -- end_of_scan
    seudet   : in  std_logic;  -- seu_detect
    seucrc   : in  std_logic;  -- crc_error
    seumbe   : in  std_logic;  -- mbe
    
    -- data for Belle2link header
    fifordy  : out std_logic;
    fifodata : out std_logic_vector (95 downto 0);
    fifonext : in  std_logic;

    -- b2tt-link status
    regdbg   : in  std_logic_vector (7 downto 0);
    octet    : out std_logic_vector (7 downto 0);  -- decode
    isk      : out std_logic;                      -- decode
    cntbit2  : out std_logic_vector (2 downto 0);  -- decode
    sigbit2  : out std_logic_vector (1 downto 0);  -- decode
    dbglink  : out std_logic_vector (95 downto 0);
    dbgerr   : out std_logic_vector (95 downto 0) );

end b2tt;

architecture implementation of b2tt is

  signal clk_i        : std_logic := '0';
  signal clk_inv      : std_logic := '0';
  signal clk_dbl      : std_logic := '0';
  signal clk_dblinv   : std_logic := '0';
  ------ sig_254s     : std_logic := '0';
  
  signal regin        : std_logic_vector (5  downto 0) := (others => '0');
  signal reg_imanual  : std_logic := '0';
  signal clr_idelay   : std_logic := '0';
  signal set_idelay   : std_logic := '0';
  signal reg_slip     : std_logic := '0';
  signal sig_caldelay : std_logic := '0';
  signal reg_decdelay : std_logic := '0';

  signal sta_dcm      : std_logic := '0';
  signal buf_myaddr   : std_logic_vector (19 downto 0) := DEFADDR;

  signal sta_utime    : std_logic_vector (31 downto 0) := (others => '0');
  signal sta_ctime    : std_logic_vector (26 downto 0) := (others => '0');
  signal sta_timerr   : std_logic := '0';
  signal sig_runreset : std_logic := '0';
  signal sig_stareset : std_logic := '0';
  signal sig_trig     : std_logic := '0';
  signal sta_trgtyp   : std_logic_vector (3  downto 0) := (others => '0');
  signal sta_trgtag   : std_logic_vector (31 downto 0) := (others => '0');
  signal sta_tagerr   : std_logic := '0';
  signal sta_trgmask  : std_logic := '0';

  signal sta_trgshort : std_logic := '0';
  signal sta_octet    : std_logic := '0';
  signal sta_link     : std_logic := '0';
  signal cnt_linkrst  : std_logic_vector (7  downto 0) := (others => '0');
  signal sig_frame    : std_logic := '0';
  signal sig_frame3   : std_logic := '0';
  signal sig_frame9   : std_logic := '0';
  signal buf_payload  : std_logic_vector (76 downto 0) := (others => '0');
  signal sig_payload  : std_logic := '0';
  signal sig_idle     : std_logic := '0';

  signal cnt_packet   : std_logic_vector (7  downto 0) := (others => '0');
  signal cnt_idelay   : std_logic_vector (6  downto 0) := (others => '0');
  signal cnt_iwidth   : std_logic_vector (5  downto 0) := (others => '0');
  signal sta_iddr     : std_logic_vector (1  downto 0) := (others => '0');
  signal sta_rxerr    : std_logic_vector (8  downto 0) := (others => '0');

  signal sta_fifoful  : std_logic := '0';
  signal sta_fifoemp  : std_logic := '0'; -- unused
  signal sta_fifoerr  : std_logic := '0';
  signal sta_fifordy  : std_logic := '0';
  signal sta_seu      : std_logic_vector (6  downto 0) := (others => '0');

  signal sig_trgdat   : std_logic_vector (95 downto 0) := (others => '0');

  signal buf_rxisk    : std_logic := '0';
  signal buf_rxoctet  : std_logic_vector (7  downto 0) := (others => '0');
  signal buf_rxbit2   : std_logic_vector (1  downto 0) := (others => '0');
  signal buf_rxcnt2   : std_logic_vector (2  downto 0) := (others => '0');
  signal buf_rxcnto   : std_logic_vector (4  downto 0) := (others => '0');
  signal buf_rxcntd   : std_logic_vector (3  downto 0) := (others => '0');

  signal cnt_b2ltag   : std_logic_vector (15 downto 0) := (others => '0');
  signal cnt_b2lwe    : std_logic_vector (15 downto 0) := (others => '0');

  signal buf_txdata   : std_logic_vector (111 downto 0) := (others => '0');
  signal sig_txfill   : std_logic;
  
  -- unused signals defined for poor simulator
  signal open_jtag    : std_logic_vector (2  downto 0) := (others => '0');
  signal open_jtagdbg : std_logic_vector (9  downto 0) := (others => '0');
  signal open_clkfreq : std_logic_vector (26 downto 0) := (others => '0');
  signal open_stat    : std_logic_vector (1  downto 0) := (others => '0');
  signal open_drd     : std_logic_vector (95 downto 0) := (others => '0');
  signal open_dbg     : std_logic_vector (17 downto 0) := (others => '0');
  signal open_bit10   : std_logic_vector (9  downto 0) := (others => '0');
  signal open_clraddr : std_logic := '0';

  -- signals for debug and chipscope
  signal buf_txcnt2   : std_logic_vector (2  downto 0) := (others => '0');
  signal buf_txcnto   : std_logic_vector (3  downto 0) := (others => '0');
  signal buf_txisk    : std_logic := '0';
  signal buf_txoctet  : std_logic_vector (7  downto 0) := (others => '0');
  signal buf_txbit2   : std_logic_vector (1  downto 0) := (others => '0');
  signal buf_txbsyup  : std_logic := '0';
  signal buf_txbsydn  : std_logic := '0';

  signal sig_iddrdbg  : std_logic_vector (9  downto 0) := (others => '0');
  signal sig_crcdbg   : std_logic_vector (8  downto 0) := (others => '0');

  signal sta_badver   : std_logic := '0';

  signal seq_dcm      : std_logic_vector (1  downto 0) := "11";
  signal sig_clklost  : std_logic := '0';
  signal clk_raw      : std_logic := '0';
  signal sig_gtpreset : std_logic := '0';

  signal sig_tagdbg   : std_logic_vector (31 downto 0) := (others => '0');
begin

  -- in
  regin <= regdbg(5 downto 0);
  reg_imanual  <= regin(0);
  reg_slip     <= regin(1);
  set_idelay   <= regin(2);
  clr_idelay   <= regin(3);
  sig_caldelay <= regin(4);
  reg_decdelay <= regin(5);
  sta_seu <= seuinit & seubusy & seuactiv & seuscan & seudet & seucrc & seumbe;

  gen_useextclk0: if USEEXTCLK = '0' generate
    map_clk: entity work.b2tt_clk
      generic map (
        USEPLL   => USEPLL,
        USEICTRL => USEICTRL )
      port map (
        clkp     => clkp,
        clkn     => clkn,
        reset    => '0', -- (probably there's no way to reset)
        rawclk   => clk_raw,     -- out
        clock    => clk_i,       -- out
        invclock => clk_inv,     -- out
        dblclock => clk_dbl,     -- out
        dblclockb => clk_dblinv,     -- out
        hlfclock => hlfclk,
        locked   => sta_dcm,     -- out
        stat     => open_stat ); -- out
  end generate;
  gen_useextclk1: if USEEXTCLK = '1' generate
    clk_i      <= extclk;
    clk_inv    <= extclkinv;
    clk_dbl    <= extclkdbl;
    clk_dblinv <= extdblinv;
    clk_raw    <= extclk;
    sta_dcm    <= extclklck;
  end generate;

  process (clk_raw)
  begin
    if rising_edge(clk_raw) then
      seq_dcm <= seq_dcm(0) & sta_dcm;
      sig_clklost <= seq_dcm(0) and (not seq_dcm(1));
    end if;
  end process;
  gtpreset <= sig_gtpreset or sig_clklost;

  sig_trgdat <= sta_fifoerr & sta_ctime(26 downto 0) & sta_trgtyp(3 downto 0) &
                sta_trgtag(31 downto 0) &
                sta_utime(31 downto 0);
  
  map_fifo: entity work.b2tt_fifo
    port map (
      -- input
      clock  => clk_i,
      enfifo => USEFIFO,
      clr    => sig_runreset,
      wr     => sig_trig,
      din    => sig_trgdat,
      rd     => fifonext,
      ready  => sta_fifordy,
      dout   => fifodata,      -- out
      drd    => open_drd,      -- out
      err    => sta_fifoerr,   -- out
      dbg    => open_dbg,      -- out
      empty  => sta_fifoemp,   -- out
      full   => sta_fifoful ); -- out
      
  map_decode: entity work.b2tt_decode
    generic map (
      PROTOCOL => PROTOCOL,
      FLIPTRG  => FLIPTRG,
      DEFADDR  => DEFADDR,
      CLKDIV1  => CLKDIV1,
      CLKDIV2  => CLKDIV2,
      SIM_SPEEDUP => SIM_SPEEDUP )
    port map (
      -- input
      clock      => clk_i,
      invclock   => clk_inv,
      dblclock   => clk_dbl,
      dblclockb  => clk_dblinv,
      en         => sta_dcm,
      trgp       => trgp,
      trgn       => trgn,

      -- system time
      clkfreq    => open_clkfreq, -- out
      utime      => sta_utime,    -- out
      ctime      => sta_ctime,    -- out
      timerr     => sta_timerr,   -- out

      -- exp- / run-number
      exprun     => exprun,       -- out
      clraddr    => open_clraddr, -- out
      myaddr     => buf_myaddr,   -- out
      
      -- reset out
      runreset   => sig_runreset, -- out
      stareset   => sig_stareset, -- out
      feereset   => feereset,     -- out
      b2lreset   => b2lreset,     -- out
      gtpreset   => sig_gtpreset, -- out
      
      -- jtag out
      jtag       => open_jtag,    -- out
      jtagdbg    => open_jtagdbg, -- out
      
      -- trigger out
      trgout     => sig_trig,     -- out
      trgtyp     => sta_trgtyp,   -- out
      trgtag     => sta_trgtag,   -- out
      tagerr     => sta_tagerr,   -- out
      trgshort   => sta_trgshort, -- out
      trgmask    => sta_trgmask,  -- out
      
      -- status out
      staoctet   => sta_octet,    -- out
      stalink    => sta_link,     -- out
      cntlinkrst => cnt_linkrst,  -- out
      badver     => sta_badver,   -- out
      
      -- revolution signal
      frame      => sig_frame,    -- out
      frame3     => sig_frame3,   -- out
      frame9     => sig_frame9,   -- out
      cntrevoclk => revoclk,      -- out
      divclk1    => divclk1,      -- out
      divclk2    => divclk2,      -- out

      -- data out
      octet      => buf_rxoctet,  -- out
      isk        => buf_rxisk,    -- out
      payload    => buf_payload (76 downto 0), -- out
      sigpayload => sig_payload,  -- out
      sigidle    => sig_idle,     -- out
      cntbit2    => buf_rxcnt2,   -- out
      cntoctet   => buf_rxcnto,   -- out
      cntdato    => buf_rxcntd,   -- out
      cntpacket  => cnt_packet,   -- out
      
      -- debug input
      manual   => reg_imanual,
      clrdelay => clr_idelay,
      incdelay => set_idelay,
      regslip  => reg_slip,
      decdelay => reg_decdelay,
      caldelay => sig_caldelay,
      
      -- debug output
      bit2       => buf_rxbit2, -- out
      bit10      => open_bit10, -- out
      cntdelay   => cnt_idelay,  -- out
      cntwidth   => cnt_iwidth,  -- out
      staiddr    => sta_iddr,     -- out
      starxerr   => sta_rxerr,    -- out
      iddrdbg    => sig_iddrdbg,  -- out
      tagdbg     => sig_tagdbg, -- out
      crcdbg     => sig_crcdbg ); -- out

  --- map: b2tt_payload ------------------------------------------------

  map_pa: entity work.b2tt_payload
    port map (
      clock     => clk_i,
      id        => id,
      myaddr    => buf_myaddr,
      b2clkup   => sta_dcm,
      b2ttup    => sta_link,
      b2plllk   => b2plllk,
      b2linkup  => b2linkup,
      b2linkwe  => b2linkwe,
      b2lnext   => fifonext,
      b2lclk    => b2lclk,
      runreset  => sig_runreset,
      stareset  => sig_stareset,
      busy      => busy,
      err       => err,
      moreerrs  => "00",
      timerr    => sta_timerr,
      tag       => sta_trgtag,
      tagerr    => sta_tagerr,
      fifoerr   => sta_fifoerr,
      fifoful   => sta_fifoful,
      badver    => sta_badver,
      trgmask   => sta_trgmask,
      seu       => sta_seu,
      cntdelay  => cnt_idelay,
      cntwidth  => cnt_iwidth,
      regdbg    => (others => '0'),
      fillsig   => sig_txfill,
      cntb2ltag => cnt_b2ltag, -- out
      cntb2lwe  => cnt_b2lwe,  -- out
      payload   => buf_txdata ); -- out
  
  --- map: b2tt_encode -------------------------------------------------

  map_encode: entity work.b2tt_encode
    generic map (
      FLIPACK => FLIPACK )
    port map (
      clock     => clk_i,
      invclock  => clk_inv,
      frame     => sig_frame,
      runreset  => sig_runreset,
      busy      => busy,
      err       => err,
      fillsig   => sig_txfill,
      payload   => buf_txdata,
      
      -- to RJ-45
      ackp      => ackp,   -- out
      ackn      => ackn,   -- out
      
      -- debug output
      cntbit2   => buf_txcnt2,  -- out
      cntoctet  => buf_txcnto,  -- out
      isk       => buf_txisk,   -- out
      octet     => buf_txoctet, -- out
      busyup    => buf_txbsyup, -- out
      busydn    => buf_txbsydn, -- out
      bit2      => buf_txbit2 ); -- out

  -- out
  rsvp     <= '0';
  rsvn     <= '0';
  b2ttver  <= std_logic_vector(to_unsigned(VERSION, 16));
  
  octet    <= buf_rxoctet;
  isk      <= buf_rxisk;
  sigbit2  <= buf_rxbit2;
  cntbit2  <= buf_rxcnt2;
  
  sysclk   <= clk_i;
  dblclk   <= clk_dbl;
  revo     <= sig_frame;
  --revo3  <= sig_frame3;
  revo9    <= sig_frame9;
  b2clkup  <= sta_dcm;
  b2ttup   <= sta_link;
  utime    <= sta_utime(NBITTIM-1 downto 0);
  ctime    <= sta_ctime;
  runreset <= sig_runreset;
  trgout   <= sig_trig;
  trgtyp   <= sta_trgtyp;
  trgtag   <= sta_trgtag;
  trgmask  <= sta_trgmask;

  fifordy  <= sta_fifordy;

  rawclk <= clk_raw;

  -- dbglink for signals to test establishing b2tt link
  dbglink(95)           <= sta_link;
  dbglink(94)           <= sta_octet;
  dbglink(93)           <= sig_payload;
  dbglink(92)           <= '0';
  dbglink(91 downto 90) <= buf_rxbit2;
  dbglink(89 downto 82) <= buf_rxoctet;
  dbglink(81)           <= buf_rxisk;
  dbglink(80 downto 78) <= buf_rxcnt2;
  dbglink(77 downto 73) <= buf_rxcnto;
  dbglink(72)           <= sig_idle;
  dbglink(71)           <= '0' when cnt_packet(7 downto 4) = 0 else '1';
  dbglink(70 downto 67) <= cnt_packet(3 downto 0) when sta_link = '1' else
                           buf_rxcntd;

  dbglink(66)           <= sig_trig;
  dbglink(65)           <= sig_runreset;
  dbglink(64 downto 58) <= cnt_idelay;
  dbglink(57 downto 52) <= cnt_iwidth;
  dbglink(51 downto 43) <= sta_rxerr;
  dbglink(42 downto 34) <= sig_crcdbg;
  dbglink(33 downto 24) <= sig_iddrdbg;
  dbglink(23 downto 22) <= sta_iddr;
  --dbglink(33 downto 22) <= sig_tagdbg(11 downto 0);

  dbglink(21)           <= buf_txbsyup;
  dbglink(20)           <= buf_txbsydn;
  dbglink(19)           <= sta_trgmask;

  dbglink(18 downto 16) <= buf_txcnt2;
  dbglink(15 downto 12) <= buf_txcnto;
  dbglink(11)           <= '0';
  dbglink(10 downto  9) <= buf_txbit2;
  dbglink(8)            <= buf_txisk;
  dbglink(7  downto  0) <= buf_txoctet;

  -- dbgerr for signals to analyze error in the trigger cycle
  dbgerr(95) <= sta_link; -- b2ttup
  dbgerr(94) <= sta_octet;
  dbgerr(93) <= sig_trig;
  dbgerr(92) <= fifonext;
  dbgerr(91) <= sta_fifordy;
  dbgerr(90) <= busy;
  dbgerr(89) <= err;
  dbgerr(88) <= sta_fifoerr;
  dbgerr(87) <= sta_fifoful;
  dbgerr(86) <= sta_tagerr;
  dbgerr(85) <= sig_runreset;
  dbgerr(84 downto 69) <= cnt_b2ltag;
  dbgerr(68 downto 53) <= cnt_b2lwe;
  dbgerr(52) <= b2linkup;
  dbgerr(51) <= sta_dcm; -- b2clkup

  dbgerr(50 downto 37) <= (others => '0');
  
  dbgerr(36)           <= buf_rxisk;
  dbgerr(35 downto 28) <= buf_rxoctet;
  dbgerr(27 downto  0) <= sta_trgtag(27 downto 0);
  
end implementation;
