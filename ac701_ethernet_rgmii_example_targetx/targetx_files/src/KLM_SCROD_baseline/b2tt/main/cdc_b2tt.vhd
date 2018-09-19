------------------------------------------------------------------------
--
--- cdc_b2tt.vhd --- B2TT example for the CDC board
--- 
--  Mikihiko Nakao, KEK IPNS
--  20140722 0.01  copied from hslb_b2tt 0.09
--  20140808 0.02  b2tt 0.29
--  20140917 0.03  b2tt 0.31
--  20150105 0.04  b2tt 0.33
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
library unisim;
use unisim.vcomponents.all;

entity cdc_b2tt is
  generic (
    VERSION : integer := 4;
    ID : std_logic_vector (31 downto 0) := x"42325443"; -- "B2TC"
    USE_CHIPSCOPE : std_logic := '1' );
  port (
    led      : out std_logic_vector (4  downto 1);
    boardid  : in  std_logic_vector (11 downto 0); -- Board ID DIPSW

    r_ack_p  : out std_logic;
    r_ack_n  : out std_logic;
    r_rsv_p  : out std_logic;
    r_rsv_n  : out std_logic;
    r_trg_p  : in  std_logic;
    r_trg_n  : in  std_logic;
    r_clk_p  : in  std_logic;
    r_clk_n  : in  std_logic );

end cdc_b2tt;

architecture implementation of cdc_b2tt is
  -- B2TT clock (clk_127) domain signals
  signal sig_raw127   : std_logic := '0';
  signal clk_127      : std_logic := '0';
  signal cnt_127      : std_logic_vector (26 downto 0) := (others => '0');
  signal sig_trig     : std_logic := '0';
  signal sig_revo     : std_logic := '0';

  signal sig_runreset : std_logic := '0';
  
  -- REGISTER assignment
  signal sig_trgtag   : std_logic_vector (31 downto 0) := (others => '0');
  signal sig_utime    : std_logic_vector (31 downto 0) := (others => '0');
  signal sig_ctime    : std_logic_vector (26 downto 0) := (others => '0');
  signal sta_dbg      : std_logic_vector (95 downto 0) := (others => '0');

  signal sig_clkup    : std_logic := '0';
  signal sig_ttup     : std_logic := '0';

  -- for chipscope
  signal sig_ilacontrol : std_logic_vector (35 downto 0) := (others => '0');
  signal sig_dbg        : std_logic_vector (95 downto 0) := (others => '0');
  
begin
  ----------------------------------------------------------------------
  -- Belle II Trigger Timing interface example implementation
  ----------------------------------------------------------------------
  led(1) <= sig_clkup;
  led(2) <= sig_ttup;
  led(4 downto 3) <= sig_trgtag(1 downto 0);

  map_b2tt: entity work.b2tt
    generic map (
      FLIPACK  => '0',
      USEICTRL => '1',
      USEPLL   => '1',
      USEFIFO  => '0' )
    port map (
      -- RJ-45
      clkp => r_clk_p,
      clkn => r_clk_n,
      trgp => r_trg_p,
      trgn => r_trg_n,
      ackp => r_ack_p,
      ackn => r_ack_n,
      rsvp => r_rsv_p,
      rsvn => r_rsv_n,

      -- alternative external clock source
      extclk    => '0',
      extclkinv => '0',
      extclkdbl => '0',
      extdblinv => '0',
      extclklck => '0',

      -- board id
      id(11 downto  0) => boardid,
      id(15 downto 12) => x"0",
      
      -- link status
      b2clkup => sig_clkup,
      b2ttup => sig_ttup,

      -- system clock and time
      sysclk => clk_127,
      rawclk => sig_raw127,
      utime => sig_utime,
      ctime => sig_ctime,

      -- divided clock
      divclk1 => open,
      divclk2 => open,

      -- run reset
      exprun   => open,
      runreset => sig_runreset,
      feereset => open,
      gtpreset => open,

      -- trigger
      trgout => sig_trig,
      trgtyp => open,
      trgtag => sig_trgtag,
      
      -- revolution
      revo => sig_revo,
      revo9 => open,
      revoclk => open,
      revogap => open,
      injveto => open,

      -- busy and status return
      busy => '0',
      err => '0',

      -- Belle2link status
      b2plllk => '1', -- dummy
      b2linkup => '1', -- dummy
      b2linkwe => '0',
      b2lclk => clk_127,

      -- SEU status (from virtex5_seu_controller)
      seuinit => '0',
      seubusy => '0',
      seuactiv => '0',
      seuscan => '0',
      seudet => '0',
      seucrc => '0',
      seumbe => '0',

      -- data for Belle2link header
      fifordy => open,
      fifodata => open,
      fifonext => '0',

      -- b2tt-link status
      regdbg => (others => '0'),
      octet => open,
      isk => open,
      cntbit2 => open,
      sigbit2 => open,
      
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

--- (emacs outline mode setup)
-- Local Variables: ***
-- mode:outline-minor ***
-- outline-regexp:"^\\( *--- \\|begin\\|end\\|entity\\|architecture\\)" ***
-- End: ***
