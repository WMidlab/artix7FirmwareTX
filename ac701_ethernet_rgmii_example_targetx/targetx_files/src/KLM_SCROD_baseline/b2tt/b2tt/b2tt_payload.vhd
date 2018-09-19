------------------------------------------------------------------------
--
--  b2tt_payload.vhd -- TT-link payload filler
--
--  Mikihiko Nakao, KEK IPNS
--
--  20140806 first version, split from b2tt_encode.vhd
--
------------------------------------------------------------------------

------------------------------------------------------------------------
-- b2tt_payload
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity b2tt_payload is
  port (
    clock     : in  std_logic;
    id        : in  std_logic_vector (15 downto 0);
    myaddr    : in  std_logic_vector (19 downto 0);
    b2clkup   : in  std_logic;
    b2ttup    : in  std_logic;
    b2plllk   : in  std_logic;
    b2linkup  : in  std_logic;
    b2linkwe  : in  std_logic;
    b2lnext   : in  std_logic;
    b2lclk    : in  std_logic;
    runreset  : in  std_logic;
    stareset  : in  std_logic;
    busy      : in  std_logic;
    err       : in  std_logic;
    moreerrs  : in  std_logic_vector (1  downto 0);
    timerr    : in  std_logic;
    tag       : in  std_logic_vector (31 downto 0);
    tagerr    : in  std_logic;
    fifoerr   : in  std_logic;
    fifoful   : in  std_logic;
    badver    : in  std_logic;
    trgmask   : in  std_logic;
    seu       : in  std_logic_vector (6  downto 0);
    cntdelay  : in  std_logic_vector (6  downto 0);
    cntwidth  : in  std_logic_vector (5  downto 0);
    regdbg    : in  std_logic_vector (7  downto 0);
    fillsig   : in  std_logic;
    cntb2lwe  : out std_logic_vector (15 downto 0);
    cntb2ltag : out std_logic_vector (15 downto 0);
    payload   : out std_logic_vector (111 downto 0) );
end b2tt_payload;
------------------------------------------------------------------------
architecture implementation of b2tt_payload is
  signal cnt_b2lwe    : std_logic_vector (15 downto 0) := (others => '0');
  signal cnt_b2ltag   : std_logic_vector (15 downto 0) := (others => '0');
  signal seq_seudet   : std_logic_vector (1  downto 0) := (others => '0');
  signal cnt_seudet   : std_logic_vector (9  downto 0) := (others => '0');
  signal seq_seuscan  : std_logic_vector (1  downto 0) := (others => '0');
  signal cnt_seuscan  : std_logic_vector (7  downto 0) := (others => '0');
  signal cnt_payload  : std_logic_vector (7  downto 0) := (others => '0');
  signal sta_err      : std_logic := '0';
  signal sta_fifoerr  : std_logic := '0';
  signal sta_fifoful  : std_logic := '0';
  signal sta_tagerr   : std_logic := '0';
  signal sta_timerr   : std_logic := '0';
  signal sta_ttup     : std_logic := '0';
  signal sta_b2lup    : std_logic := '0';
  signal sig_ttlost   : std_logic := '0';
  signal sig_b2llost  : std_logic := '0';
  signal sta_ttlost   : std_logic := '0';
  signal sta_b2llost  : std_logic := '0';
  signal sig_stareset : std_logic := '0';

  function setsta
    ( sta: std_logic; rst: std_logic; sig: std_logic ) return std_logic is
  begin
    if rst = '1' then
      return sig;
    else
      return sta or sig;
    end if;
  end function setsta;
  
begin
  sig_stareset <= stareset or runreset;
  
  proc_b2l: process (b2lclk)
  begin
    if b2lclk'event and b2lclk = '1' then
      --MN (debug code enabled to debug cdcv3b2l)
      if b2clkup = '0' or b2linkup = '0' or runreset = '1' then
        cnt_b2lwe  <= (others => '0');
        cnt_b2ltag <= (others => '0');
      else
        if b2linkwe = '1' then
          cnt_b2lwe <= cnt_b2lwe + 1;
        end if;
        if b2lnext = '1' then
          cnt_b2ltag <= cnt_b2ltag + 1;
        end if;
      end if;
    end if; -- event
  end process;
  
  proc: process (clock)
  begin
    if clock'event and clock = '1' then

      --MN (nominal code is disabled to debug cdcv3b2l)
      --MN -- cnt_b2lwe
      --MN if b2clkup = '0' or b2linkup = '0' or runreset = '1' then
      --MN  cnt_b2lwe <= (others => '0');
      --MN elsif seq_b2lwe = '0' and b2linkwe = '1' then
      --MN  cnt_b2lwe <= cnt_b2lwe + 1;
      --MN end if;

      -- seq_seudet, cnt_seudet
      if seq_seudet = "01" then
        cnt_seudet <= cnt_seudet + 1;
      end if;
      seq_seudet <= seq_seudet(0) & seu(2);
      
      -- seq_seuscan, cnt_seuscan
      if seq_seuscan = "01" then
        cnt_seuscan <= cnt_seuscan + 1;
      end if;
      seq_seuscan <= seq_seuscan(0) & seu(3);

      -- sta_err
      sta_ttup  <= sta_ttup  or b2ttup;
      sta_b2lup <= sta_b2lup or b2ttup;
      
      sig_ttlost  <= sta_ttup and (not b2ttup);
      sig_b2llost <= sta_b2lup and (not b2linkup);
      sta_err     <= setsta(sta_err,     sig_stareset, err);
      sta_fifoerr <= setsta(sta_fifoerr, sig_stareset, fifoerr);
      sta_fifoful <= setsta(sta_fifoful, sig_stareset, fifoful);
      sta_tagerr  <= setsta(sta_tagerr,  sig_stareset, tagerr);
      sta_timerr  <= setsta(sta_timerr,  sig_stareset, timerr);
      sta_ttlost  <= setsta(sta_ttlost,  sig_stareset, sig_ttlost);
      sta_b2llost <= setsta(sta_b2llost, sig_stareset, sig_b2llost);

      --payload <= x"123456789abcdef0132435465768";
      --payload <= x"21436587a9cbed0f314253647586";
      -- payload
      if b2clkup = '0' then
        payload(91 downto 77) <= (others => '0');
        payload(76 downto 75) <= (others => '1'); -- impossible combination
        payload(74 downto  0) <= (others => '0');
      elsif fillsig = '1' then
      --elsif cntbit2 = 4 and cntoctet = 15 then
        payload(111 downto 92) <= myaddr;
        payload(91)            <= b2ttup;
        payload(90)            <= b2linkup;
        payload(89  downto 82) <= cnt_payload;
        payload(81)            <= busy;
        payload(80)            <= sta_err;
        payload(79)            <= sta_ttlost;
        payload(78)            <= sta_b2llost;
        --payload(79  downto 78) <= moreerrs;
        payload(77)            <= sta_tagerr;
        payload(76)            <= sta_fifoerr;
        payload(75)            <= sta_fifoful;
        payload(74  downto 68) <= seu;

        -- cnt_b2ltag(15 downto 12) is not used in ftsw,
        -- for 4 more reserved bits (e.g., moreerrs)
        
        payload(67  downto 52) <= cnt_b2ltag(15 downto 0);
        payload(51  downto 36) <= cnt_b2lwe;
        payload(35  downto 26) <= cnt_seudet;
        payload(25  downto 18) <= cnt_seuscan;
        -- b2plllk should be placed somewhere else, maybe by rearranging
        -- seu bits
        payload(17)            <= b2plllk;
        --payload(17  downto 16) <= "00"; -- 0 for id
        if cnt_payload(0) = '0' then
          payload(16) <= '0'; -- 0 for id
          payload(15  downto  0) <= id;
        else
          payload(16) <= '1'; -- 0 for id
          payload(15 downto 14) <= "00";
          payload(13)           <= badver;
          payload(12)           <= sta_timerr;
          payload(11 downto  7) <= cntwidth(5 downto 1);
          payload(6  downto  0) <= cntdelay;
        end if;
        cnt_payload <= cnt_payload + 1;
      end if;
    end if;
  end process;

  -- out
  cntb2ltag <= cnt_b2ltag;
  cntb2lwe  <= cnt_b2lwe;
  
end implementation;
