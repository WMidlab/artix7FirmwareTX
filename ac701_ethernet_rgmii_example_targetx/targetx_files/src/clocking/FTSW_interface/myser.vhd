------------------------------------------------------------------------
-- en8b10b.vhd
-- 20030624 data part is confirmed to work with a FPGA setup
--          (code: ftest_en v0.10)
--
-- Mikihiko Nakao, KEK IPNS
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity en8b10b is
  Port ( 
    reset:  in std_logic;
    clock:  in std_logic;
    en:     in std_logic;
    kin:    in std_logic_vector(3 downto 0);
    din:    in std_logic_vector(7 downto 0);
    dout:   out std_logic_vector(9 downto 0)
  );
end en8b10b;

architecture Behavioral of en8b10b is

  signal din5: std_logic_vector(4 downto 0);
  signal din3: std_logic_vector(2 downto 0);

  signal dout6, dout6m, dout6p: std_logic_vector(5 downto 0);
  signal dout4, dout4m, dout4p: std_logic_vector(3 downto 0);
  signal kout6, kout6m, kout6p: std_logic_vector(5 downto 0);
  signal kout4, kout4m, kout4p: std_logic_vector(3 downto 0);

  signal rd6p, rd4p: std_logic;
  signal rdplus, rdnextp: std_logic;

begin

  din5 <= din(4 downto 0);
  din3 <= din(7 downto 5);

  -- special code-group
  --  K28.0 to K28.7             : kin = 1000 to 1111
  --  k23.7, k27.7, k29.7, k30.7 : kin = 0001, 0010, 0011, 0100

  kout4m <= "1011" when kin = "1000" else  -- K28.0
            "1001" when kin = "1001" else  -- K28.1
            "0101" when kin = "1010" else  -- K28.2
            "1100" when kin = "1011" else  -- K28.3
            "1101" when kin = "1100" else  -- K28.4
            "0101" when kin = "1101" else  -- K28.5
            "1001" when kin = "1110" else  -- K28.6
            "0111";                        -- K28.7

  kout6m <= "111010" when kin = "0001" else -- K23
            "110110" when kin = "0010" else -- K27
            "101110" when kin = "0011" else -- K29
            "011110" when kin = "0100" else -- K30
            "001111";                       -- K28

  dout4m <= "1011" when din3 = "000" else
            "1001" when din3 = "001" else
            "0101" when din3 = "010" else
            "1100" when din3 = "011" else
            "1101" when din3 = "100" else
            "1010" when din3 = "101" else
            "0110" when din3 = "110" else
            "0111" when  -- 17, 18, 20
               din5 = "10001" or din5 = "10010" or din5 = "10100" else
            "1110";

  dout6m <= "100111" when din5 = "00000" else
            "011101" when din5 = "00001" else
            "101101" when din5 = "00010" else
            "110001" when din5 = "00011" else
            "110101" when din5 = "00100" else
            "101001" when din5 = "00101" else
            "011001" when din5 = "00110" else
            "111000" when din5 = "00111" else
            "111001" when din5 = "01000" else
            "100101" when din5 = "01001" else
            "010101" when din5 = "01010" else
            "110100" when din5 = "01011" else
            "001101" when din5 = "01100" else
            "101100" when din5 = "01101" else
            "011100" when din5 = "01110" else
            "010111" when din5 = "01111" else
            "011011" when din5 = "10000" else
            "100011" when din5 = "10001" else
            "010011" when din5 = "10010" else
            "110010" when din5 = "10011" else
            "001011" when din5 = "10100" else
            "101010" when din5 = "10101" else
            "011010" when din5 = "10110" else
            "111010" when din5 = "10111" else
            "110011" when din5 = "11000" else
            "100110" when din5 = "11001" else
            "010110" when din5 = "11010" else
            "110110" when din5 = "11011" else
            "001110" when din5 = "11100" else
            "101110" when din5 = "11101" else
            "011110" when din5 = "11110" else
            "101011";

  dout4p <= dout4m when din3 = "001" or din3 = "010" or
                        din3 = "101" or din3 = "110" else
            "1000" when din3 = "111" and
 	           (din5 = "01011" or din5 = "01101" or din5 = "01110") else
            "0001" when din3 = "111" and
 	           (din5 = "10001" or din5 = "10010" or din5 = "10100") else
            not dout4m;

  -- If more ones in 6b RD- or for D7, flip the bitmask
  dout6p <= not dout6m when
      din5 = "00000" or din5 = "00001" or din5 = "00010" or din5 = "00100" or
      din5 = "01000" or din5 = "01111" or din5 = "10000" or din5 = "10111" or
      din5 = "11000" or din5 = "11011" or din5 = "11101" or din5 = "11110" or
      din5 = "11111" or din5 = "00111"
    else dout6m;

  kout4p <= kout4m when kin = "1001" else not kout4m;
  kout6p <= not kout6m;

  -- More ones in 6b RD- (more zeros in RD+): 0 1 2 4 8 15 16 23 24 27 29 30 31
  rd6p <= rdplus;
  rd4p <= not rd6p when
      din5 = "00000" or din5 = "00001" or din5 = "00010" or din5 = "00100" or
      din5 = "01000" or din5 = "01111" or din5 = "10000" or din5 = "10111" or
      din5 = "11000" or din5 = "11011" or din5 = "11101" or din5 = "11110" or
      din5 = "11111"
    else rd6p;

  rdnextp <= not rd4p when din3 = "000" or din3 = "100" or din3 = "111"
	     else rd4p;

  dout6 <= dout6m when rd6p = '0' else dout6p;
  dout4 <= dout4m when rd4p = '0' else dout4p;
  kout6 <= kout6m when rd6p = '0' else kout6p;
  kout4 <= kout4m when rd4p = '0' else kout4p;

  process(clock, reset)
  begin
    if clock = '1' and clock'event then
      if reset = '1' then
        rdplus <= '0';
        dout <= "000000" & "0000";
      elsif kin = "0000" then
	dout <= dout6 & dout4;
      else
	dout <= kout6 & kout4;
      end if;
      if en = '1' then
        rdplus <= rdnextp;
      end if;
    end if;
  end process;

end Behavioral;
------------------------------------------------------------------------
-- de8b10b.vhd
-- 20030624 data part is confirmed to work with a FPGA setup
--          (code: ftest_en v0.10)
--
-- Mikihiko Nakao, KEK IPNS
------------------------------------------------------------------------
  
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity de8b10b is
  port ( 
    reset:  in std_logic;
    clock:  in std_logic;
    en:     in std_logic;
    din:    in std_logic_vector(9 downto 0);
    dout:   out std_logic_vector(7 downto 0);
    kout:   out std_logic_vector(3 downto 0);
    eout:   out std_logic
    --kerrout:   out std_logic;
    --alt1ngout: out std_logic;
    --alt2ngout: out std_logic;
    --err4out:   out std_logic;
    --err6out:   out std_logic;
    --rd6ngout:  out std_logic;
    --rd4ngout:  out std_logic;
    --rdngout:   out std_logic;
    --rdpout:    out std_logic;
    --rd6flipout: out std_logic
    );
end de8b10b;

architecture behavioral of de8b10b is

  signal dout5: std_logic_vector(4 downto 0);
  signal dout3: std_logic_vector(2 downto 0);
  signal kout3: std_logic_vector(2 downto 0);
  signal kout4: std_logic_vector(3 downto 0);

  signal din6: std_logic_vector(5 downto 0);
  signal din4: std_logic_vector(3 downto 0);

  signal err4, err6:   std_logic;
  signal rd4ng, rd6ng: std_logic;
  signal rdng: std_logic;

  signal rd4p, rd4m, rd6p, rd6m: std_logic;
  signal rd6flip: std_logic;
  signal err: std_logic;

  signal rd_def: std_logic;
  signal rdp: std_logic;
  signal k28: std_logic;
  signal kany: std_logic;
  signal rd_any: std_logic;

  signal alt, alt1, alt2      : std_logic;
  signal alt1ng, alt2ng, kerr : std_logic;
  
begin

  din6 <= din(9 downto 4);
  din4 <= din(3 downto 0);

  err4 <= '1' when din4 = "0000" or din4 = "1111" else '0';
  err6 <= '1' when  -- all 0, five 0 or 000011 and comlements
      din6 = "000000" or din6 = "111111" or
      din6 = "000001" or din6 = "000010" or din6 = "000100" or
      din6 = "001000" or din6 = "010000" or din6 = "100000" or
      din6 = "111110" or din6 = "111101" or din6 = "111011" or
      din6 = "110111" or din6 = "101111" or din6 = "011111" or
      din6 = "000011" or din6 = "111100" else '0';

  dout3 <= "000" when din4 = "1011" or din4 = "0100" else
           "001" when din4 = "1001"                  else
           "010" when din4 = "0101"                  else
           "011" when din4 = "1100" or din4 = "0011" else
           "100" when din4 = "1101" or din4 = "0010" else
           "101" when din4 = "1010"                  else
           "110" when din4 = "0110"                  else
           "111";

  dout5 <= "00000" when din6 = "100111" or din6 = "011000" else
           "00001" when din6 = "011101" or din6 = "100010" else
           "00010" when din6 = "101101" or din6 = "010010" else
           "00011" when din6 = "110001"                    else
           "00100" when din6 = "110101" or din6 = "001010" else
           "00101" when din6 = "101001"                    else
           "00110" when din6 = "011001"                    else
           "00111" when din6 = "111000" or din6 = "000111" else
           "01000" when din6 = "111001" or din6 = "000110" else
           "01001" when din6 = "100101"                    else
           "01010" when din6 = "010101"                    else
           "01011" when din6 = "110100"                    else
           "01100" when din6 = "001101"                    else
           "01101" when din6 = "101100"                    else
           "01110" when din6 = "011100"                    else
           "01111" when din6 = "010111" or din6 = "101000" else
           "10000" when din6 = "011011" or din6 = "100100" else
           "10001" when din6 = "100011"                    else
           "10010" when din6 = "010011"                    else
           "10011" when din6 = "110010"                    else
           "10100" when din6 = "001011"                    else
           "10101" when din6 = "101010"                    else
           "10110" when din6 = "011010"                    else
           "10111" when din6 = "111010" or din6 = "000101" else
           "11000" when din6 = "110011" or din6 = "001100" else
           "11001" when din6 = "100110"                    else
           "11010" when din6 = "010110"                    else
           "11011" when din6 = "110110" or din6 = "001001" else
           "11100" when din6 = "001110"                    else
           "11101" when din6 = "101110" or din6 = "010001" else
           "11110" when din6 = "011110" or din6 = "100001" else
           "11111";

  -- rd- is expected for these din
  rd4m <= '1' when din4 = "1110" or din4 = "1101" or
                   din4 = "1011" or din4 = "0111" or din4 = "1100" else '0';
  rd6m <= '1' when din6 = "100111" or din6 = "011101" or
                   din6 = "101101" or din6 = "110101" or
                   din6 = "111000" or din6 = "111001" or
                   din6 = "010111" or din6 = "011011" or
                   din6 = "111010" or din6 = "110011" or
                   din6 = "110110" or din6 = "101110" or
                   din6 = "011110" or din6 = "101011" else '0';

  -- rd+ is expected for these din
  rd4p <= '1' when din4 = "0001" or din4 = "0010" or
                   din4 = "0100" or din4 = "1000" or din4 = "0011" else '0';
  rd6p <= '1' when din6 = "011000" or din6 = "100010" or
                   din6 = "010010" or din6 = "001010" or
                   din6 = "000111" or din6 = "000110" or
                   din6 = "101000" or din6 = "100100" or
                   din6 = "000101" or din6 = "001100" or
                   din6 = "001001" or din6 = "010001" or
                   din6 = "100001" or din6 = "010100" else '0';

  -- rd for these will flip after 5b6b
  rd6flip <= '1' when
      dout5 = "00000" or dout5 = "00001" or dout5 = "00010" or
      dout5 = "00100" or dout5 = "01000" or dout5 = "01111" or
      dout5 = "10000" or dout5 = "10111" or dout5 = "11000" or
      dout5 = "11011" or dout5 = "11101" or dout5 = "11110" or
      dout5 = "11111" else '0';

  -- error condition when rd is defined
  rd6ng <= rd_def and ((rd6m and rdp) or (rd6p and not rdp));
  rd4ng <= rd_def and (((rdp xor rd6flip) and rd4m) or
                   ((not rdp xor rd6flip) and rd4p));

  -- error condition only from 5b6b and 3b4b part
  rdng  <= (rd6m and rd4m and rd6flip) or
           (rd6p and rd4p and rd6flip) or
           (rd6m and rd4p and not rd6flip) or
           (rd6p and rd4m and not rd6flip);

  -- any control code
  k28 <= '1' when din6 = "001111" or din6 = "110000" else '0';

  -- alternative .7 is found (for control code and D11 D13 D14 D17 D18 D20)
  alt1 <= '1' when din6 = "110100" or din6 = "101100" or din6 = "011100"
	      else '0';
  alt2 <= '1' when din6 = "100011" or din6 = "010011" or din6 = "001011"
	      else '0';
  alt1ng <= alt1 when din4 = "0001" or din4 = "0111" else '0';
  alt2ng <= alt2 when din4 = "1000" or din4 = "1110" else '0';
  alt    <= '1' when din4 = "0111" or din4 = "1000" else '0';

  kout3 <= "001" when (alt = '1' and (din6 = "111010" or din6 = "000101")) or
                      (din6 = "001111" and din4 = "1001")                  or
                      (din6 = "110000" and din4 = "0110")                else
           "010" when (alt = '1' and (din6 = "110110" or din6 = "001001")) or
                      (din6 = "001111" and din4 = "0101")                  or
                      (din6 = "110000" and din4 = "1010")                else
           "011" when (alt = '1' and (din6 = "101110" or din6 = "010001")) or
                      (k28 = '1' and (din4 = "1100" or din4 = "0011"))   else
           "100" when (alt = '1' and (din6 = "011110" or din6 = "100001")) or
                      (k28 = '1' and (din4 = "1101" or din4 = "0010"))   else
           "101" when (din6 = "001111" and din4 = "1010")                  or
                      (din6 = "110000" and din4 = "0101")                else
           "110" when (din6 = "001111" and din4 = "0110")                  or
                      (din6 = "110000" and din4 = "1001")                else
           "111" when alt = '1' and k28 = '1'                            else
           "000";
  kout4 <= k28 & kout3;
  --kout  <= kout4;
  kerr <= (not (alt1 or alt2)) when alt = '1' and kout4 = "0000" else '0';
  --kerr <= '0';
  --kany <= '0';
  
  err    <= err4 or err6 or rd6ng or rd4ng or rdng or alt1ng or alt2ng or kerr;
  rd_any <= rd4p or rd6p or rd4m or rd6m;
  kany   <= '0' when k28 = '0' and kout3 = "000" else '1';

  process(clock, reset)
  begin
    if clock = '1' and clock'event then
      if reset = '1' then
        rd_def <= '0';
        rdp  <= '0';
        dout <= "00000" & "000";
        eout <= '0';
        
        --kerrout   <= '0';
        --alt1ngout <= '0';
        --alt2ngout <= '0';
        --err4out   <= '0';
        --err6out   <= '0';
        --rd6ngout  <= '0';
        --rd4ngout  <= '0';
        --rdngout   <= '0';
        --rdpout    <= '0';
        --rd6flipout <= '0';
      else      
        rd_def <= (rd_def or rd_any) and not err;
        if en = '1' then
          if dout3 = "011" then
            rdp <= rd4p;
          elsif rd4m = '1' then
            rdp <= '1';
          elsif rd4p = '1' then
            rdp <= '0';
          elsif dout5 = "00111" then
            rdp <= rd6p;
          elsif rd6m = '1' or rd6p = '1' then
            rdp <= rd6m;
          end if;
        end if;
        if kany = '0' and err = '0' then
          dout <= dout3 & dout5;
        else
          dout <= (others => '0');
        end if;
        kout <= kout4;
        eout <= err;
        
        --kerrout <= kerr;
        --alt1ngout <= alt1ng;
        --alt2ngout <= alt2ng;
        --err4out   <= err4;
        --err6out   <= err6;
        --rd6ngout  <= rd6ng;
        --rd4ngout  <= rd4ng;
        --rdngout   <= rdng;
        --rdpout    <= rdp;
        --rd6flipout <= rd6flip;
      end if;
    end if;
  end process;

end Behavioral;
