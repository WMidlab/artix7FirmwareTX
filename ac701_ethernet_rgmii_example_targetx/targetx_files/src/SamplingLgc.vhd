-------------------------------------------------------------------------------
Library work;
use work.all;

Library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity SamplingLgc is
   port (
			clk		 			   : in    std_logic;  --expect input clock to be 8xSST = 62.5 MHz
			reset	    		      : in    std_logic;  -- reset chip counters, it will reset the main counter and tells the TX chip to do so
			cfg						: in 		std_logic_vector(15 downto 0);
			dig_win_start			: in   std_logic_vector(8 downto 0); --COL & ROW of start of the wr ena low (wr disable)- this area is to be protected from being written on
			dig_win_n				: in   std_logic_vector(8 downto 0); --number of windows to keep wr_ena low 
			dig_win_ena				: in   std_logic; -- enable the write disable window-- should be tied to the readout busy signal
			
			MAIN_CNT_out			: out   std_logic_vector(8 downto 0); --COL & ROW write address- we just need this to keep track of the last sample taken
			sstin_out            : out   std_logic; --SCA control signals
			trigram_wea				: out std_logic;
			wr_addrclr_out			: out   std_logic;-- write address clear: when asserted, it will reset the row and col on the TX chip
			wr1_ena					: out   std_logic; --Enable Write 1 procedure
			wr2_ena              : out   std_logic  --Enable Write 2 procedure
	);
end SamplingLgc;

architecture Behavioral of SamplingLgc is

--Theory of operation for TargetX (IM:9/5/2014): 
--clk period is 16 ns. clk/2 length is 8 ns
-- sstin_out is always present with a 64 ns period:
-- clk: 					10101010 10101010		each bit is 8 ns
-- sstin_out:			11110000 11110000
-- main counter++:	01000100 01000100	  (as per TX simulations)
-- main counter++:	00100010 00100010	  (as per this implementation)
--when start is asseted, main counter is reset and sampling starts by enabling wr1_ena and wr_2 ena. 
--main counter is increased on everyother falling edge of the input clock
--

--state machine drives sampling logic signals directly
type state_type is
	(
	resetting,					--Initial State, however sstin_out is always running 
	sampling,					--main counter is ++ and wr_ena is active
	freerun			--main counter is ++ and wr_ena is not active
	);

	signal next_state		: state_type := resetting;
	signal stop_in : std_logic :='0';
	--vector stores current write address
	signal MAIN_CNT		: UNSIGNED(8 downto 0) := "000000000";
	
	--output connecting signals
	signal sstin     : std_logic := '0'; --SCA control signals
	signal wr_addrclr : std_logic := '0'; --Clear Write Address Counter
	signal wr_ena    : std_logic := '0'; --Enable Write procedure
	signal clk_cntr : std_logic_vector(1 downto 0):=(others=>'0');-- counter 
	signal started_cntr : integer:=0;-- counter
   --sampling module control signals
	signal reset_i : std_logic_vector(1 downto 0) := "00";
	--signal dig_win_cntr : std_logic_vector(4 downto 0):=(others=>'0');-- counter
	signal dig_win_start_i : integer:=0;--(8 downto 0):=(others=>'0');
	signal dig_win_n_i : integer:=0;--std_logic_vector(8 downto 0):=(others=>'0');
	signal dig_win_end_i : integer:=0;--std_logic_vector(8 downto 0):=(others=>'0');
	signal dig_win_ena_i : std_logic;
	signal dig_win_wrap_i : std_logic;
	signal dig_win_end2_i : integer:=0;--std_logic_vector(8 downto 0):=(others=>'0');
	signal cfg_i	: std_logic_vector(15 downto 0):=(others=>'0');

--------------------------------------------------------------------------------
begin

--usual sampling signals
--MAIN_CNT_out <= MAIN_CNT; --output full counter
MAIN_CNT_out <= std_logic_vector(MAIN_CNT(8 downto 0)); --output only row + colum sections
sstin_out <= sstin;
wr_addrclr_out <= wr_addrclr;
wr1_ena <= wr_ena;
wr2_ena <= wr_ena;

--latch start/stop to local clock domain
process(clk)
begin
if (rising_edge(clk)) then
	reset_i<= reset_i(0) & reset;
	dig_win_start_i<=to_integer(unsigned(dig_win_start));
	dig_win_n_i    <=to_integer(unsigned(dig_win_n    ));
	dig_win_end_i  <=  (dig_win_start_i+ dig_win_n_i); -- this needs to be modulo 9 bits	
	dig_win_wrap_i<=to_unsigned(dig_win_end_i,10)(9);
	dig_win_end2_i<=to_integer(to_unsigned(dig_win_end_i,10)(8 downto 0));
	dig_win_ena_i<=dig_win_ena;
	cfg_i<=cfg;	
end if;
end process;

process(clk)
begin
if (rising_edge(clk)) then

--if (reset='1') then
--
--else


 clk_cntr<=std_logic_vector(unsigned(clk_cntr)+1);
 sstin<=clk_cntr(1);
 

  
-- if ((dig_win_wrap_i='0' and ( MAIN_CNT > dig_win_start_i and MAIN_CNT < dig_win_end2_i )) or
--	  (dig_win_wrap_i='1' and ( MAIN_CNT > dig_win_start_i or  MAIN_CNT < dig_win_end2_i ))
-- ) then -- if no carry over is present
--  wr_ena<=not dig_win_ena;
--  
--  else
--  wr_ena<='1';
-- 
-- end if;
 
   wr_ena<=not dig_win_ena;

--	trigram_wea<='0';

 Case next_state is
  
  --resetting, state, stay here for a few cycles
  When resetting =>
	 --keep wr_addrclr high for afew clock cycles.
	 wr_addrclr<='1';
	 trigram_wea<='0';
 	 MAIN_CNT<=(others=>'0');
	 started_cntr<=started_cntr+1;
--	 if (started_cntr>10 and clk_cntr="00") then 
	 if (started_cntr>to_integer(unsigned(cfg_i(15 downto 10))) and clk_cntr=cfg_i(1 downto 0) ) then 
	 started_cntr<=0;
--	 clk_cntr<="00";
	 wr_addrclr<='0';
	 MAIN_CNT<=(others=>'0');
	 next_state<=sampling;
	 else
	 next_state<=resetting;

   end if;
	 
	--Sampling
  When sampling =>
   --wr_ena<='1';
	if (reset_i="10") then
		next_state<=resetting;
		started_cntr<=0;
	else
		if (clk_cntr="01" or clk_cntr="11") then 
			MAIN_CNT<=MAIN_CNT+1;
			trigram_wea<='1';
		else
			MAIN_CNT<=MAIN_CNT;
			trigram_wea<='0';
		end if;
		next_state<=sampling;
	end if;
	
  When Others =>
  MAIN_CNT <= (Others => '0');
	next_state <= resetting;
  end Case;
end if;
end process;


end Behavioral;