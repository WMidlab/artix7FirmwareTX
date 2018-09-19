------------------------------------------------------------------------
-- b2tt_symbols.vhd
--
-- Mikihiko Nakao, KEK IPNS
--
-- 20120130  first version
-- 20130403  renamed to tt_symbols
-- 20130507  renamed back to b2tt_symbols
-- 20131002  TTYP_TEST added
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

package b2tt_symbols is
-- - kcode
  subtype octet10b_t is std_logic_vector (9 downto 0);
  subtype octet_t    is std_logic_vector (7 downto 0);

  constant K28_0 : octet_t := x"1c"; -- K.28.0  28 000 11100
  constant K28_1 : octet_t := x"3c"; -- K.28.1  60 001 11100
  constant K28_2 : octet_t := x"5c"; -- K.28.2  92 010 11100
  constant K28_3 : octet_t := x"7c"; -- K.28.3 124 011 11100
  constant K28_4 : octet_t := x"9c"; -- K.28.4 156 100 11100
  constant K28_5 : octet_t := x"bc"; -- K.28.5 188 101 11100
  constant K28_6 : octet_t := x"dc"; -- K.28.6 220 110 11100
  constant K28_7 : octet_t := x"fc"; -- K.28.7 252 111 11100
  constant K23_7 : octet_t := x"f7"; -- K.23.7 247 111 10111
  constant K27_7 : octet_t := x"fb"; -- K.27.7 251 111 11011
  constant K29_7 : octet_t := x"fd"; -- K.29.7 253 111 11101
  constant K30_7 : octet_t := x"fe"; -- K.30.7 254 111 11110
  
  constant K28_0N : octet10b_t := "001111" & "0100"; -- K.28.0 x"0f4"
  constant K28_1N : octet10b_t := "001111" & "1001"; -- K.28.1 x"0f9"
  constant K28_2N : octet10b_t := "001111" & "0101"; -- K.28.2 x"0f5"
  constant K28_3N : octet10b_t := "001111" & "0011"; -- K.28.3 x"0f3"
  constant K28_4N : octet10b_t := "001111" & "0010"; -- K.28.4 x"0f2"
  constant K28_5N : octet10b_t := "001111" & "1010"; -- K.28.5 x"0fa"
  constant K28_6N : octet10b_t := "001111" & "0110"; -- K.28.6 x"0f6"
  constant K28_7N : octet10b_t := "001111" & "1000"; -- K.28.7 x"0f8"
  constant K23_7N : octet10b_t := "111010" & "1000"; -- K.23.7 x"3a8"
  constant K27_7N : octet10b_t := "110110" & "1000"; -- K.27.7 x"368"
  constant K29_7N : octet10b_t := "101110" & "1000"; -- K.29.7 x"2e8"
  constant K30_7N : octet10b_t := "011110" & "1000"; -- K.30.7 x"1e8"
  
  constant K28_0P : octet10b_t := "110000" & "1011"; -- K.28.0 x"30b"
  constant K28_1P : octet10b_t := "110000" & "0110"; -- K.28.1 x"306"
  constant K28_2P : octet10b_t := "110000" & "1010"; -- K.28.2 x"30a"
  constant K28_3P : octet10b_t := "110000" & "1100"; -- K.28.3 x"30c"
  constant K28_4P : octet10b_t := "110000" & "1101"; -- K.28.4 x"30d"
  constant K28_5P : octet10b_t := "110000" & "0101"; -- K.28.5 x"305"
  constant K28_6P : octet10b_t := "110000" & "1001"; -- K.28.6 x"309"
  constant K28_7P : octet10b_t := "110000" & "0111"; -- K.28.7 x"307"
  constant K23_7P : octet10b_t := "000101" & "0111"; -- K.23.7 x"057"
  constant K27_7P : octet10b_t := "001001" & "0111"; -- K.27.7 x"097"
  constant K29_7P : octet10b_t := "010001" & "0111"; -- K.29.7 x"117"
  constant K30_7P : octet10b_t := "100001" & "0111"; -- K.30.7 x"217"
  
  -- - trigger type
  --   TTYP_PIDx contains 2ns interval info from PID
  --   TTYP_RSVx also cointains 2ns interval, usage to be defined later
  --   other TTYP have no 2ns interval info
  
  subtype trigtyp_t  is std_logic_vector (3 downto 0);
  constant TTYP_PID0 : trigtyp_t := "0000";
  constant TTYP_PID1 : trigtyp_t := "0100";
  constant TTYP_PID2 : trigtyp_t := "1000";
  constant TTYP_PID3 : trigtyp_t := "1100";
  constant TTYP_RSV0 : trigtyp_t := "0110";
  constant TTYP_RSV1 : trigtyp_t := "1010";
  constant TTYP_RSV2 : trigtyp_t := "1010";
  constant TTYP_RSV3 : trigtyp_t := "1110";
  
  constant TTYP_ECL  : trigtyp_t := "0001";
  constant TTYP_CDC  : trigtyp_t := "0011";
  constant TTYP_DPHY : trigtyp_t := "0101";  -- delayed physics
  constant TTYP_RAND : trigtyp_t := "0111";
  constant TTYP_TEST : trigtyp_t := "1001";  -- test pulse input
  constant TTYP_RSV5 : trigtyp_t := "1011";
  constant TTYP_RSV6 : trigtyp_t := "1101";
  constant TTYP_NONE : trigtyp_t := "1111";  -- also used for begin-run
  
  -- - payload
  subtype payload_t is std_logic_vector (76 downto 0);
  constant PAYLOAD_EMPTY : payload_t := x"0000000000000000000" & '0';

  -- - command
  subtype ttpkt_t  is std_logic_vector (11 downto 0);
  constant TTPKT_IDLE : ttpkt_t := x"fff"; -- unused
  constant TTPKT_TTAG : ttpkt_t := x"000";
  constant TTPKT_FREQ : ttpkt_t := x"001";
  constant TTPKT_RST  : ttpkt_t := x"002";
  constant TTPKT_CMD  : ttpkt_t := x"003";
  constant TTPKT_DISP : ttpkt_t := x"007";
  constant TTPKT_INJV : ttpkt_t := x"00e";
  constant TTPKT_SYNC : ttpkt_t := x"00f";
  
end package b2tt_symbols;

-- - emacs outline mode setup
-- Local Variables: ***
-- mode:outline-minor ***
-- outline-regexp:"-- -+" ***
-- End: ***
