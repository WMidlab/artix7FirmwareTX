------------------------------------------------------------------------
--
-- ecl_b2tt.vhd --- B2TT receiver example with ECL Collector
--
-- Mikihiko Nakao, KEK IPNS
--
-- 20140722 0.01  copied from sp605_b2tt 0.15
-- 20140808 0.02  b2tt 0.29
-- 20140917 0.03  b2tt 0.31
-- 20150105 0.04  b2tt 0.33
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
entity ecl_b2tt is
  generic (
    VERSION : integer := 4;
    ID : std_logic_vector (31 downto 0) := x"45434c54";  -- "ECLT"
    USE_CHIPSCOPE : std_logic := '1' );

  port (
    ack_n      : out   std_logic;
    ack_p      : out   std_logic;
    trg_n      : in    std_logic;
    trg_p      : in    std_logic;
    rsv_n      : out   std_logic;
    rsv_p      : out   std_logic;
    clk_n      : in    std_logic;
    clk_p      : in    std_logic );

end ecl_b2tt;

------------------------------------------------------------------------
-- architecture
------------------------------------------------------------------------
architecture implementation of ecl_b2tt is

  constant XVERSION : std_logic_vector (31 downto 0)
    := conv_std_logic_vector(VERSION, 32);

  signal sig_raw127    : std_logic := '0';
  signal clk_127       : std_logic := '0';
  signal clk_254       : std_logic := '0';
  
  signal sig_clkup     : std_logic := '0';
  signal sig_ttup      : std_logic := '0';
  signal sig_trg       : std_logic := '0';

  signal sig_revo      : std_logic := '0';

  signal sig_trgtag    : std_logic_vector (31 downto 0) := (others => '0');

  signal reg_dbg       : std_logic_vector (7  downto 0) := (others => '0');
  
  signal open_utime    : std_logic_vector (31 downto 0) := (others => '0');
  signal open_ctime    : std_logic_vector (26 downto 0) := (others => '0');
  signal open_divclk1  : std_logic_vector (1  downto 0) := (others => '0');
  signal open_divclk2  : std_logic_vector (1  downto 0) := (others => '0');
  signal open_exprun   : std_logic_vector (31 downto 0) := (others => '0');
  signal open_runreset : std_logic := '0';
  signal open_feereset : std_logic := '0';
  signal open_gtpreset : std_logic := '0';
  signal open_trgtyp   : std_logic_vector (3  downto 0) := (others => '0');
  signal open_revo9    : std_logic := '0';
  signal open_revoclk  : std_logic_vector (10 downto 0) := (others => '0');
  signal open_revogap  : std_logic := '0';
  signal open_injveto  : std_logic_vector (1  downto 0) := (others => '0');
  signal open_fifordy  : std_logic := '0';
  signal open_fifodata : std_logic_vector (95 downto 0) := (others => '0');
  signal open_octet    : std_logic_vector (7  downto 0) := (others => '0');
  signal open_isk      : std_logic := '0';
  signal open_cntbit2  : std_logic_vector (2  downto 0) := (others => '0');
  signal open_sigbit2  : std_logic_vector (1  downto 0) := (others => '0');
  signal sig_dbg       : std_logic_vector (95 downto 0) := (others => '0');

  -- for chipscope
  signal sig_ilacontrol : std_logic_vector (35 downto 0) := (others => '0');
begin
  ----------------------------------------------------------------------
  -- b2tt
  ----------------------------------------------------------------------
  map_b2tt: entity work.b2tt
    generic map (
      FLIPACK  => '0',
      USEICTRL => '0',
      USEPLL   => '1',
      USEFIFO  => '0' )
    port map (
      -- RJ-45
      clkp     => clk_p,
      clkn     => clk_n,
      trgp     => trg_p,
      trgn     => trg_n,
      ackp     => ack_p,
      ackn     => ack_n,
      rsvp     => rsv_p,
      rsvn     => rsv_n,

      -- alternative external clock source
      extclk    => '0',
      extclkinv => '0',
      extclkdbl => '0',
      extdblinv => '0',
      extclklck => '0',

      -- board id
      id       => (others => '0'),
      
      -- link status
      b2clkup  => sig_clkup,
      b2ttup   => sig_ttup,

      -- system clock and time
      sysclk   => clk_127,
      rawclk   => sig_raw127,
      dblclk   => clk_254,
      utime    => open_utime,
      ctime    => open_ctime,

      -- divided clock
      divclk1  => open_divclk1,
      divclk2  => open_divclk2,

      -- run reset
      exprun   => open_exprun,
      runreset => open_runreset,
      feereset => open_feereset,
      gtpreset => open_gtpreset,

      -- trigger
      trgout   => sig_trg,
      trgtyp   => open_trgtyp,
      trgtag   => sig_trgtag,
      
      -- revolution
      revo     => sig_revo,
      revo9    => open_revo9,
      revoclk  => open_revoclk,
      revogap  => open_revogap,
      injveto  => open_injveto,

      -- busy and status return
      busy     => '0',
      err      => '0',

      -- Belle2link status
      b2plllk  => '1', -- dummy
      b2linkup => '1', -- dummy
      b2linkwe => '0',
      b2lclk   => clk_127,

      -- SEU status (from virtex5_seu_controller)
      seuinit  => '0',
      seubusy  => '0',
      seuactiv => '0',
      seuscan  => '0',
      seudet   => '0',
      seucrc   => '0',
      seumbe   => '0',

      -- data for Belle2link header
      fifordy  => open_fifordy,
      fifodata => open_fifodata,
      fifonext => '0',

      -- b2tt-link status
      regdbg   => reg_dbg,
      octet    => open_octet,
      isk      => open_isk,
      cntbit2  => open_cntbit2,
      sigbit2  => open_sigbit2,
      dbglink  => sig_dbg,
      dbgerr   => open );
      --dbgerr   => sig_dbg,
      --dbglink  => open );
  
  ----------------------------------------------------------------------
  -- chipscope
  ----------------------------------------------------------------------
  gen_cs: if USE_CHIPSCOPE = '1' generate
    map_icon: entity work.b2tt_icon port map ( control0 => sig_ilacontrol );
    map_ila:  entity work.b2tt_ila
      port map (
        control => sig_ilacontrol,
        clk     => clk_127,
        trig0   => sig_dbg );

  end generate;

end implementation;
