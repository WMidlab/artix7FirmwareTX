----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:59:48 11/08/2014 
-- Design Name: 
-- Module Name:    TrigDecisionLogic2 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;
 use work.tdc_pkg.all;
 Library work;
 use work.all;


entity TrigDecisionLogic2 is
    Port ( 
			  clk: in std_logic;--clock is used for creating a simulated delay only
			  tb : in  tb_vec_type;
			  tm : in std_logic_vector(15 downto 1);-- mode
           TrigOut : out  STD_LOGIC;
           asicX : out  STD_LOGIC_VECTOR (2 downto 0):="000";
           asicY : out  STD_LOGIC_VECTOR (2 downto 0):="000"
			  );
			  
end TrigDecisionLogic2;

architecture Behavioral of TrigDecisionLogic2 is
signal Xtb 		: 	std_logic_vector(5 downto 1):="00000";
signal Ytb 		: 	std_logic_vector(5 downto 1):="00000";
signal trg		:	std_logic:='0';
signal trg_l	:	std_logic:='0';
signal trg_i	:	std_logic:='0';
signal asicXY_i :  STD_LOGIC_VECTOR (5 downto 0):="000000";--X is 5 downto 3, Y is 2 downto 0
signal asicXY_l :  STD_LOGIC_VECTOR (5 downto 0):="000000";
signal asicXY_l2 :  STD_LOGIC_VECTOR (5 downto 0):="000000";
signal trgbuf	:	std_logic_vector (1 downto 0):=(others=>'0');-- delay line shiftreg
signal asicXYbuf1: std_logic_vector(5 downto 0);
signal asicXYbuf0: std_logic_vector(5 downto 0);
signal tm_i :std_logic_vector(15 downto 1);

signal trg_l_1: std_logic:='0';
signal trg_l_2: std_logic:='0';
signal trg_l_3: std_logic:='0';


signal cnt		:	integer:=0;

type trgdelay is
(
idle,
countdelay,
counthold
);
signal trgstate: trgdelay:=idle;


begin

Xtb(1)<=(tb(1)(1) or tb(1)(2) or tb(1)(3) or tb(1)(4) or tb(1)(5)) and tm_i(1);
Xtb(2)<=(tb(2)(1) or tb(2)(2) or tb(2)(3) or tb(2)(4) or tb(2)(5)) and tm_i(2);
Xtb(3)<=(tb(3)(1) or tb(3)(2) or tb(3)(3) or tb(3)(4) or tb(3)(5)) and tm_i(3);
Xtb(4)<=(tb(4)(1) or tb(4)(2) or tb(4)(3) or tb(4)(4) or tb(4)(5)) and tm_i(4);
Xtb(5)<=(tb(5)(1) or tb(5)(2) or tb(5)(3) or tb(5)(4) or tb(5)(5)) and tm_i(5);

Ytb(1)<=(tb(6 )(1) or tb(6 )(2) or tb(6 )(3) or tb(6 )(4) or tb(6 )(5)) and tm_i(6);
Ytb(2)<=(tb(7 )(1) or tb(7 )(2) or tb(7 )(3) or tb(7 )(4) or tb(7 )(5)) and tm_i(7);
Ytb(3)<=(tb(8 )(1) or tb(8 )(2) or tb(8 )(3) or tb(8 )(4) or tb(8 )(5)) and tm_i(8);
Ytb(4)<=(tb(9 )(1) or tb(9 )(2) or tb(9 )(3) or tb(9 )(4) or tb(9 )(5)) and tm_i(9);
Ytb(5)<=(tb(10)(1) or tb(10)(2) or tb(10)(3) or tb(10)(4) or tb(10)(5)) and tm_i(10);

trg_l<= (Xtb(1) or Xtb(2) or Xtb(3) or Xtb(4) or Xtb(5) )  or  (Ytb(1) or Ytb(2) or Ytb(3) or Ytb(4) or Ytb(5) ) when tm_i(15)='0' else
		  (Xtb(1) or Xtb(2) or Xtb(3) or Xtb(4) or Xtb(5) )  and (Ytb(1) or Ytb(2) or Ytb(3) or Ytb(4) or Ytb(5) );


asicXY_l(5 downto 3)<=	"001" when (Xtb(1 downto 1)="1"    )	  else
								"010" when (Xtb(2 downto 1)="10"   ) 	else 
								"011" when (Xtb(3 downto 1)="100"  )     else 
								"100" when (Xtb(4 downto 1)="1000" )     else 
								"101" when (Xtb(5 downto 1)="10000")     else
								"000";
								
asicXY_l(2 downto 0)<=	"001" when (Ytb(1 downto 1)="1"    )	   else
								"010" when (Ytb(2 downto 1)="10"   ) 		else 
								"011" when (Ytb(3 downto 1)="100"  )     else 
								"100" when (Ytb(4 downto 1)="1000" )     else 
								"101" when (Ytb(5 downto 1)="10000") 		else
								"000";

TrigOut<=trg_l_1;

   FDCE_inst0 : FDCE
   generic map (
      INIT => '0') -- Initial value of register ('0' or '1')  
   port map (
      Q => trg_l_1,      -- Data output
      C => trg_l,      -- Clock input
      CE => '1',    -- Clock enable input
      CLR => trg_l_3,  -- Asynchronous clear input
      D => '1'       -- Data input
   );
 
   FDCE_inst1 : FDCE
   generic map (
      INIT => '0') -- Initial value of register ('0' or '1')  
   port map (
      Q => trg_l_2,      -- Data output
      C => clk,      -- Clock input
      CE => '1',    -- Clock enable input
      CLR => '0',  -- Asynchronous clear input
      D => trg_l_1       -- Data input
   );
 
   FDCE_inst2 : FDCE
   generic map (
      INIT => '0') -- Initial value of register ('0' or '1')  
   port map (
      Q => trg_l_3,      -- Data output
      C => clk,      -- Clock input
      CE => '1',    -- Clock enable input
      CLR => '0',  -- Asynchronous clear input
      D => trg_l_2       -- Data input
   );
  


process	(trg_l)
begin
	if (rising_edge(trg_l)) then
		asicXY_l2<=asicXY_l;
	end if;
end process;

process( trg_i)
begin
	if (rising_edge(trg_i)) then
		asicX<=asicXY_i(5 downto 3);
		asicY<=asicXY_i(2 downto 0);
	end if;

end process;

process (clk)
begin

	if (rising_edge(clk)) then
			tm_i<=tm;

		trgbuf<=trgbuf(0) & trg_l;
		asicXYbuf1<=asicXYbuf0;
		asicXYbuf0<=asicXY_l2;
	end if;
	
	if (rising_edge(clk)) then
	
		
		
		case trgstate is
		
		when idle=>
			trg_i<='0';
			if (trgbuf="01") then
				cnt<=2;-- count this many clock cycles
				asicXY_i<=asicXYbuf0;
				trgstate<=countdelay;
			else
				trgstate<=idle;
			end if;
			
		when countdelay=>
			if (cnt>1) then 
				cnt<=cnt-1;
				trg_i<='0';
				trgstate<=countdelay;
			else 
				trg_i<='1';
				cnt<=5;
				trgstate<=counthold;
			end if;

		when counthold=>
			if (cnt>1) then 
				cnt<=cnt-1;
				trg_i<='1';
				trgstate<=counthold;
			else 
				trg_i<='0';
				trgstate<=idle;
			end if;
		
		end case;

	end if;

	


end process;


end Behavioral;

