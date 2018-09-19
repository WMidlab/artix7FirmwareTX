----------------------------------------------------------------------------------
-- Company: UH Manoa- ID LAB
-- Engineer: Isar Mostafanezhad
-- 
-- Create Date:    11:02:00 08/23/2014 
-- Design Name:    CY62177EV30 SRAM chip
-- Module Name:    SRAMiface1 - Behavioral 
-- Project Name: KLM- 
-- Target Devices: SP6-SCROD rev A3, IDL_KLM_MB RevA (w SRAM)
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity SRAMiface1 is
    Port ( 
			  
			  clk  : in std_logic;
			
			  addr : in std_logic_vector(20 downto 0);
			  dw 	 : in std_logic_vector(15 downto 0);
			  dr 	 : out std_logic_vector(15 downto 0);
			  rw   : in std_logic; --'0' = read, '1' = write
			  update : in std_logic; --'0'= do nothing, edge to '1' means start either a read or write opertion
			  busy : out std_logic;
			
			--Controls to the SRAM  
			  A : out  STD_LOGIC_VECTOR (20 downto 0);
           IO : inout  STD_LOGIC_VECTOR (15 downto 0);
           BYTEb : out  STD_LOGIC;
           BHEb : out  STD_LOGIC;
           WEb : out  STD_LOGIC;
           CE2 : out  STD_LOGIC;
           CE1b : out  STD_LOGIC;
           OEb : out  STD_LOGIC;
           BLEb : out  STD_LOGIC
			  
			  );

end SRAMiface1;

architecture Behavioral of SRAMiface1 is

type state_type is
	(
	Idle,			-- Idling until update bit
	Start,
   wStart,		  -- w start 
	wWait_tHZOE,	-- w wait for tHZOE ns
	wDataout,		  -- w put data on the IO lines
	wWaitEnd,		  -- w wait for write end tSD ns
	
	rStart,
	rWaitDataout,
	rWaitEnd
	);

signal next_state	 : state_type:=Idle;
signal addr_i 	 : std_logic_vector(20 downto 0) := (others=>'0');
signal dw_i  	 : std_logic_vector(15 downto 0) := (others=>'0');
signal dr_i 	 : std_logic_vector(15 downto 0) := (others=>'0');
signal rw_i   	 : std_logic:='0'; --'0' = read, '1' = write
signal update_i : std_logic:='0'; --'0'= do nothing, edge to '1' means start either a read or write opertion
signal busy_i 	 : std_logic:='0';

signal cnt_tHZOE : integer :=0;
signal tHZOE : integer :=10; --tHZOE as in datasheet: can take up to max 18 ns for chip to have output into HiZ
signal cnt_tWEND : integer:=0;
signal tWEND : integer:=10; --wait time for Write operation to finish

signal cnt_tRDOUT: integer :=0;
signal tRDOUT: integer :=10;
signal cnt_tREND: integer :=0;
signal tREND: integer :=10;


begin
busy<=busy_i;
BYTEb<='0';
dr<=dr_i;

process(clk,update)
begin

if (update'event and update ='1' and busy_i='0') then
	update_i<='1';


end if;


if (clk'event and clk = '1') then
	


	--latch onto input if in idle mode
	Case next_state is
   When Idle =>
	IO<=(others=>'U');
	CE1b<='1';
	CE2<='0';
	WEb<='1';
	BHEb<='1';
	BLEb<='1';
	OEb<='1';
	busy_i<='0';
	
	if(update_i ='1') then
		busy_i<='1';
		rw_i<=rw;
		addr_i<=addr;
		dw_i<=dw;
		next_state <= Start;
	else
		next_state<=Idle;
	end if;
	
	When Start =>
	if (rw_i='1') then
		next_state <= wStart;
	else
		next_state <= rStart;
	end if;
	
	When wStart =>
	A<=addr_i;
	CE1b<='0';
	CE2<='1';
	WEb<='0';
	BHEb<='0';
	BLEb<='0';
	OEb<='1';
	next_state<=wWait_tHZOE;
	
	when wWait_tHZOE =>
	if(cnt_tHZOE=tHZOE) then
		cnt_tHZOE<=0;
		next_state<=wDataout;
	else
		cnt_tHZOE<=cnt_tHZOE+1;
		next_state<=wWait_tHZOE;
	end if;
		
	when wDataout =>
		IO<=dw_i;
		next_state<=wWaitEnd;

	when wWaitEnd =>
	if(cnt_tWEND=tWEND) then
		cnt_tWEND<=0;
		next_state<=Idle;
		update_i<='0';
	else
		cnt_tWEND<=cnt_tWEND+1;
		next_state<=wWaitEnd;
	end if;		
		
		
	When rStart =>
	A<=addr_i;
	CE1b<='0';
	CE2<='1';
	WEb<='1';
	BHEb<='0';
	BLEb<='0';
	OEb<='0';
	next_state<=rWaitDataout;

	when rWaitDataout =>
	if(cnt_tRDOUT=tRDOUT) then
		cnt_tRDOUT<=0;
		dr_i<=IO;
		next_state<=rWaitEnd;
	else
		cnt_tRDOUT<=cnt_tRDOUT+1;
		next_state<=rWaitDataout;
	end if;		
	
	when rWaitEnd =>
	if(cnt_tREND=tREND) then
		cnt_tREND<=0;
		next_state<=Idle;
		update_i<='0';
	else
		cnt_tREND<=cnt_tREND+1;
		next_state<=rWaitEnd;
	end if;		
	
	when others =>
			update_i<='0';
			busy_i<='0';
			next_state<=idle;
	end case;
	
	
end if;


	
end process;




end Behavioral;




