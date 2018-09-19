------------------------------------------------------------------------    

------------------------------------------------------------------------
-- mydcm100 component
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library unisim;
use unisim.vcomponents.ALL;

entity mydcm100 is
  port (
    clk100in : in  std_logic;
    clk200   : out std_logic;
    reset    : in  std_logic;
    locked   : out std_logic );
end mydcm100;

architecture implementation of mydcm100 is
  signal sig_fbout : std_logic;
  signal sig_fbin  : std_logic;
  signal sig_clkfx : std_logic;
begin
  map200: bufg port map ( i => sig_clkfx, o => clk200 );
  mapfb:  bufg port map ( i => sig_fbout, o => sig_fbin );
  
  mapdcm: dcm_sp
    generic map (
      CLKFX_MULTIPLY => 2,
      CLKFX_DIVIDE   => 1,
      DFS_FREQUENCY_MODE => "HIGH",
      DLL_FREQUENCY_MODE => "HIGH" )
    --DCM_PERFORMANCE_MODE => "MAX_SPEED" )
    port map (
      rst    => reset,
      locked => locked,
      clkin  => clk100in,
      clk0   => sig_fbout,
      clkfb  => sig_fbin,
      clkfx  => sig_clkfx );

--   mapdcm: dcm_base
--     generic map (
--       CLKFX_MULTIPLY => 2,
--       CLKFX_DIVIDE   => 1,
--       DFS_FREQUENCY_MODE => "HIGH",
--       DLL_FREQUENCY_MODE => "HIGH",
--       DCM_PERFORMANCE_MODE => "MAX_SPEED" )
--     port map (
--       rst    => reset,
--       locked => locked,
--       clkin  => clk100in,
--       clk0   => sig_fbout,
--       clkfb  => sig_fbin,
--       clkfx  => sig_clkfx );
      
end implementation;
------------------------------------------------------------------------
-- mypllfrom127_s6 component
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library unisim;
use unisim.vcomponents.ALL;

entity mypllfrom127_s6 is
  generic (
    PHASE  : real := 0.0 );
  port (
    clk127in : in  std_logic; -- after bufg
    clk254   : out std_logic; -- after bufpll
    clk254s  : out std_logic; -- after bufpll
    clk127   : out std_logic; -- after bufg
    --clk63    : out std_logic; -- after bufg
    --clk31    : out std_logic; -- after bufg
    clk100   : out std_logic; -- after bufg
    reset    : in  std_logic;
    locked   : out std_logic );
end mypllfrom127_s6;

architecture implementation of mypllfrom127_s6 is
  signal sig_fbout : std_logic;
  signal sig_fbin  : std_logic;
  signal sig_clk0  : std_logic;
  signal sig_clk1  : std_logic;
  signal sig_clk2  : std_logic;
  signal sig_clk3  : std_logic;
  signal sig_clk4  : std_logic;
  signal sta_locked1 : std_logic;
  signal sta_locked2 : std_logic;
  signal sig_clk127  : std_logic;
begin
  clk127 <= sig_clk127;
  locked <= sta_locked1 and sta_locked2;
  
  map_fb:  bufg port map ( i => sig_fbout, o => sig_fbin );
  map_127: bufg port map ( i => sig_clk1,  o => sig_clk127 );
  --map_63:  bufg port map ( i => sig_clk2,  o => clk63 );
  --map_31:  bufg port map ( i => sig_clk3,  o => clk31 );
  --map_100: bufg port map ( i => sig_clk4,  o => clk100 );
  map_100: bufg port map ( i => sig_clk2,  o => clk100 );

  map_254: bufpll
    generic map ( DIVIDE => 2 )
    port map (
      pllin  => sig_clk0,
      gclk   => sig_clk127,
      locked => sta_locked1,
      ioclk  => clk254,
      lock   => sta_locked2,
      serdesstrobe => clk254s );
  
  map_pll: pll_base
    generic map (
      CLKIN_PERIOD   => 7.8,  -- F_VCO has to be between 400 - 1000 MHz
      CLKFBOUT_MULT  => 4,    -- F_VCO = F_CLKIN * CLKFBOUT_MULT
      DIVCLK_DIVIDE  => 1,    --         / DIVCLK_DIVIDE
      CLKOUT0_DIVIDE => 2,    -- F_OUT = F_VCO / CLKOUTn_DIVIDE
      CLKOUT1_DIVIDE => 4,
      --CLKOUT2_DIVIDE => 8,
      --CLKOUT3_DIVIDE => 16,
      --CLKOUT4_DIVIDE => 5,
      CLKOUT2_DIVIDE => 5,
      BANDWIDTH => "OPTIMIZED" )
    port map (
      clkin    => clk127in,
      rst      => reset,
      clkfbout => sig_fbout,
      clkout0  => sig_clk0,
      clkout1  => sig_clk1,
      clkout2  => sig_clk2,
      --clkout3  => sig_clk3,
      --clkout4  => sig_clk4,
      locked   => sta_locked1,
      clkfbin  => sig_fbin );
end implementation;
------------------------------------------------------------------------
-- mypllfrom127 component
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library unisim;
use unisim.vcomponents.ALL;

entity mypllfrom127 is
  generic (
    PHASE  : real := 0.0 );
  port (
    clk127in : in  std_logic; -- after bufg
    clk254   : out std_logic; -- after bufg
    clk127   : out std_logic; -- after bufg
    --clk63    : out std_logic; -- after bufg
    --clk31    : out std_logic; -- after bufg
    clk100   : out std_logic; -- after bufg
    reset    : in  std_logic;
    locked   : out std_logic );
end mypllfrom127;

architecture implementation of mypllfrom127 is
  signal sig_fbout : std_logic;
  signal sig_fbin  : std_logic;
  signal sig_clk0  : std_logic;
  signal sig_clk1  : std_logic;
  signal sig_clk2  : std_logic;
  signal sig_clk3  : std_logic;
  signal sig_clk4  : std_logic;
begin
  map_fb:  bufg port map ( i => sig_fbout, o => sig_fbin );
  map_254: bufg port map ( i => sig_clk0,  o => clk254 );
  map_127: bufg port map ( i => sig_clk1,  o => clk127 );
  --map_63:  bufg port map ( i => sig_clk2,  o => clk63 );
  --map_31:  bufg port map ( i => sig_clk3,  o => clk31 );
  --map_100: bufg port map ( i => sig_clk4,  o => clk100 );
  map_100: bufg port map ( i => sig_clk2,  o => clk100 );

  map_pll: pll_base
    generic map (
      CLKIN_PERIOD   => 7.8,  -- F_VCO has to be between 400 - 1000 MHz
      CLKFBOUT_MULT  => 4,    -- F_VCO = F_CLKIN * CLKFBOUT_MULT
      DIVCLK_DIVIDE  => 1,    --         / DIVCLK_DIVIDE
      CLKOUT0_DIVIDE => 2,    -- F_OUT = F_VCO / CLKOUTn_DIVIDE
      CLKOUT1_DIVIDE => 4,
      --CLKOUT2_DIVIDE => 8,
      --CLKOUT3_DIVIDE => 16,
      --CLKOUT4_DIVIDE => 5,
      CLKOUT2_DIVIDE => 5,
      BANDWIDTH => "OPTIMIZED" )
    port map (
      clkin    => clk127in,
      rst      => reset,
      clkfbout => sig_fbout,
      clkout0  => sig_clk0,
      clkout1  => sig_clk1,
      clkout2  => sig_clk2,
      --clkout3  => sig_clk3,
      --clkout4  => sig_clk4,
      locked   => locked,
      clkfbin  => sig_fbin );
end implementation;
------------------------------------------------------------------------
-- mypllfrom31 component
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library unisim;
use unisim.vcomponents.ALL;

entity mypllfrom31 is
  generic (
    PHASE  : real := 0.0 );
  port (
    clk31in  : in  std_logic; -- after bufg
    clk254   : out std_logic; -- after bufg
    clk127   : out std_logic; -- after bufg
    clk63    : out std_logic; -- after bufg
    clk100   : out std_logic; -- after bufg
    reset    : in  std_logic;
    locked   : out std_logic );
end mypllfrom31;

architecture implementation of mypllfrom31 is
  signal sig_fbout : std_logic;
  signal sig_fbin  : std_logic;
  signal sig_clk0  : std_logic;
  signal sig_clk1  : std_logic;
  signal sig_clk2  : std_logic;
  signal sig_clk3  : std_logic;
begin
  map_fb:  bufg port map ( i => sig_fbout, o => sig_fbin );
  map_254: bufg port map ( i => sig_clk0,  o => clk254 );
  map_127: bufg port map ( i => sig_clk1,  o => clk127 );
  map_63:  bufg port map ( i => sig_clk2,  o => clk63 );
  map_100: bufg port map ( i => sig_clk3,  o => clk100 );

  map_pll: pll_base
    generic map (
      CLKIN_PERIOD   => 31.2, -- F_VCO has to be between 400 - 1000 MHz
      CLKFBOUT_MULT  => 16,   -- F_VCO = F_CLKIN * CLKFBOUT_MULT
      DIVCLK_DIVIDE  => 1,    --         / DIVCLK_DIVIDE
      CLKOUT0_DIVIDE => 2,    -- F_OUT = F_VCO / CLKOUTn_DIVIDE
      CLKOUT1_DIVIDE => 4,
      CLKOUT2_DIVIDE => 8,
      CLKOUT3_DIVIDE => 5,
      BANDWIDTH => "OPTIMIZED" )
    port map (
      clkin    => clk31in,
      rst      => reset,
      clkfbout => sig_fbout,
      clkout0  => sig_clk0,
      clkout1  => sig_clk1,
      clkout2  => sig_clk2,
      clkout3  => sig_clk3,
      locked   => locked,
      clkfbin  => sig_fbin );
end implementation;

------------------------------------------------------------------------
-- myjittercleaner component
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library unisim;
use unisim.vcomponents.ALL;

entity myjittercleaner is
  port (
    clkin  : in  std_logic;
    clkout : out std_logic );
end myjittercleaner;

architecture behaviour of myjittercleaner is

  signal sig_fbin  : std_logic;
  signal sig_fbout : std_logic;
  signal sig_out   : std_logic;
  signal sig_in    : std_logic;
  
begin

  map_bufg2: bufg port map ( i => sig_fbout, o => sig_fbin );
  map_bufg1: bufg port map ( i => sig_out,   o => clkout );
  map_bufg0: bufg port map ( i => clkin,     o => sig_in );

  map_pll: pll_base
    generic map (
      CLKIN_PERIOD   => 8.0,
      CLKFBOUT_MULT  => 4,
      DIVCLK_DIVIDE  => 1,
      CLKOUT0_DIVIDE => 4 )
    port map (
      clkin    => sig_in,
      rst      => '0',
      clkfbout => sig_fbout,
      clkout0  => sig_out,
      locked   => open,
      clkfbin  => sig_fbin );

end behaviour;

------------------------------------------------------------------------
-- mygtpclk component
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library unisim;
use unisim.vcomponents.ALL;

entity mygtpclk is
  port (
    clkin  : in  std_logic;
    reset  : in  std_logic;
    clk1   : out std_logic;
    clk2   : out std_logic;
    locked : out std_logic );
end mygtpclk;

architecture behaviour of mygtpclk is

  signal sig_clkin : std_logic;
  signal sig_clk0  : std_logic;
  signal sig_clk0g : std_logic;
  signal sig_clkdv : std_logic;
  
begin

  clk1 <= sig_clkin;
  map_bufg0: bufg port map ( i => sig_clk0,  o => sig_clk0g );
  map_bufg1: bufg port map ( i => clkin,     o => sig_clkin );
  map_bufg2: bufg port map ( i => sig_clkdv, o => clk2 );

  map_pll: pll_base
    generic map (
      CLKIN_PERIOD   => 3.2,
      CLKFBOUT_MULT  => 2,
      DIVCLK_DIVIDE  => 1,
      CLKOUT0_DIVIDE => 4 )
    port map (
      clkin    => sig_clkin,
      rst      => reset,
      clkfbout => sig_clk0,
      clkout0  => sig_clkdv,
      locked   => locked,
      clkfbin  => sig_clk0g );

end behaviour;

------------------------------------------------------------------------
-- myanyclk component
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library unisim;
use unisim.vcomponents.ALL;

entity myanyclk is
  generic (
    constant DIV    : integer := 5;
    constant MUL    : integer := 4;
    constant PLLMUL : integer := 4;
    constant PERIOD : real    := 8.0 );
  port (
    clkin     : in  std_logic;
    dcmreset  : in  std_logic;
    pllreset  : in  std_logic;
    clkout    : out std_logic;
    dcmlocked : out std_logic;
    plllocked : out std_logic );
end myanyclk;

architecture behaviour of myanyclk is

  signal sig_clkin   : std_logic;
  signal sig_dcmclk  : std_logic;
  signal sig_dcmclkg : std_logic;
  signal sig_dcmfb   : std_logic;
  signal sig_dcmfbg  : std_logic;
  signal sig_pllfb   : std_logic;
  signal sig_pllclk  : std_logic;
  
begin

  mapin:     bufg port map ( i => clkin,      o => sig_clkin  );
  mapdcmclk: bufg port map ( i => sig_dcmclk, o => sig_dcmclkg );
  mapdcmfb:  bufg port map ( i => sig_dcmfb,  o => sig_dcmfbg  );
  mappllclk: bufg port map ( i => sig_pllclk, o => clkout      );

  mapdcm: dcm_base
    generic map (
      CLKFX_MULTIPLY => 2,
      CLKFX_DIVIDE   => DIV,
      DFS_FREQUENCY_MODE => "HIGH",
      DLL_FREQUENCY_MODE => "HIGH",
      DCM_PERFORMANCE_MODE => "MAX_SPEED" )
    port map (
      rst    => dcmreset,
      locked => dcmlocked,
      clkin  => sig_clkin,
      clk0   => sig_dcmfb,
      clkfb  => sig_dcmfbg,
      clkfx  => sig_dcmclk );
      
  mappll: pll_base
    generic map (
      CLKIN_PERIOD   => 16.0,
      CLKFBOUT_MULT  => 8,
      DIVCLK_DIVIDE  => 1,
      CLKOUT0_DIVIDE => 4 )
    port map (
      clkin    => sig_dcmclkg,
      rst      => pllreset,
      clkfbout => sig_pllfb,
      clkout0  => sig_pllclk,
      locked   => plllocked,
      clkfbin  => sig_pllfb );

end behaviour;
------------------------------------------------------------------------
-- myclkchk component
-- REFCLK 42MHz
-- REF=34 for for 125.00 MHz
-- REF=27 for for 156.25 MHz
------------------------------------------------------------------------
library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity myclkchk is
  generic (
    constant REF : integer := 27 );
  port (
  clkin  : in std_logic;
  en     : in std_logic;
  refclk : in std_logic;
  clkout : out std_logic;
  cnt    : out std_logic_vector (7 downto 0);
  ok     : out std_logic );
end myclkchk;

architecture behavior of myclkchk is
  signal sav   : std_logic_vector (7 downto 0);
  signal i     : std_logic_vector (7 downto 0);
  signal n     : std_logic_vector (7 downto 0);
  signal clr0  : std_logic;
  signal clr1  : std_logic;
  signal clkok : std_logic;
begin
  cnt    <= sav;
  clkout <= en and clkin and clkok;
  ok     <= clkok;

  clkproc: process(clkin, clr1)
  begin
    if clr1 = '1' then
      n <= (others => '0');
    elsif clkin'event and clkin = '1' then
      n <= n + 1;
    end if;
  end process;
  
  refproc: process(refclk)
  begin
    if refclk'event and refclk = '1' then

      if sav(7 downto 3) = "01100" then   -- 16#60# to 16#67# (96 to 103)
        clkok <= '1';
      else
        clkok <= '0';
      end if;

      clr1 <= clr0;
      
      if i = REF then
        i <= (others => '0');
        sav <= n;
        clr0 <= '1';
      else
        i <= i + 1;
        clr0 <= '0';
      end if;
    end if;
  end process;
end behavior;
