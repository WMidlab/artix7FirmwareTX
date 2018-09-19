----------------------------------------------------------------------------------
-- Company: UH Manoa- ID LAB
-- Engineer: Isar Mostafanezhad
-- 
-- Create Date:    11:02:00 08/23/2014 
-- Design Name:    CY62177EV30 SRAM chip
-- Module Name:    SRAMiface2 - Behavioral 
-- Project Name: KLM- 
-- Target Devices: SP6-SCROD rev A4, IDL_KLM_MB RevB (w SRAM on SCROD)
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
Library UNISIM;
use UNISIM.vcomponents.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SRAMiface2 is
Port ( 
    clk  : in std_logic;		
    addr : in std_logic_vector(21 downto 0);
    dw 	 : in std_logic_vector(7 downto 0);
    dr 	 : out std_logic_vector(7 downto 0);
    rw   : in std_logic; --'0' = read, '1' = write
    update : in std_logic; --'0'= do nothing, edge to '1' means start either a read or write opertion
    busy : out std_logic;
    			
    ram_busy : in std_logic; -- input from the master scheduler, if '1', then stay in wait state longer until '0' to access RAM and service request
    
    --Controls to the SRAM  
    A : out  STD_LOGIC_VECTOR (21 downto 0);
    IOw : out  STD_LOGIC_VECTOR (7 downto 0);
    IOr : in  STD_LOGIC_VECTOR (7 downto 0);
    bs: out std_logic;-- tristate buf state
    WEb : out  STD_LOGIC;
    CE2 : out  STD_LOGIC;
    CE1b : out  STD_LOGIC;
    OEb : out  STD_LOGIC
    );
end SRAMiface2;

architecture Behavioral of SRAMiface2 is

type state_type is
	(
	Idle,			-- Idling until update bit
	WaitStart,	--wait for ram_busy signal to go '0'
    wStart,		  -- w start 
	wStart2,
	wWait_tHZOE,	-- w wait for tHZOE ns
	wDataout,		  -- w put data on the IO lines
	wWaitEnd,		  -- w wait for write end tSD ns
	
	rStart,
	rStart2,
	rWaitDataout,
	rWaitEnd
	);

signal next_state   : state_type:=Idle;
signal addr_i       : std_logic_vector(21 downto 0) := (others=>'0');
signal dw_i         : std_logic_vector(7 downto 0) := (others=>'0');
signal dr_i         : std_logic_vector(7 downto 0) := (others=>'0');
signal rw_i         : std_logic:='0'; --'0' = read, '1' = write
signal update_i     : std_logic_vector(1 downto 0):="00"; --'00'= do nothing, edge to "01" means start either a read or write opertion
signal busy_i       : std_logic:='0';
signal ram_busy_i   : std_logic:='0';

signal cnt_tHZOE    : integer :=0;
signal tHZOE        : integer :=1; --tHZOE as in datasheet: can take up to max 18 ns for chip to have output into HiZ
signal cnt_tWEND    : integer:=0;
signal tWEND        : integer:=4; --wait time for Write operation to finish

signal cnt_tRDOUT   : integer :=0;
signal tRDOUT       : integer :=4;
signal cnt_tREND    : integer :=0;
signal tREND        : integer :=1;
signal bufstate     : std_logic:='1';

begin

    bs<=bufstate;
    busy<=busy_i;


process(clk)
begin
    if (rising_edge(clk)) then
        update_i(1)<=update_i(0);
        update_i(0)<=update;
        ram_busy_i<=ram_busy;
         --dr<=dr_i;
         --dw_i<=dw;
    end if;

    if (rising_edge(clk )) then
	--latch onto input if in idle mode
    	Case next_state is
    	
            When Idle =>
                --IO<=(others=>'Z');
                bufstate<='1';
                A<=(others=>'0');
                CE1b<='1';
                CE2 <='0';
                WEb <='1';
                OEb <='1';
                busy_i<='0';
                --if(update_i ="01") then
                if(update ='1' and update_i(0)='0') then
                    --ram_busy_i<=ram_busy;
                    --dr<=dr_i;
                    --dw_i<=dw;
                    busy_i<='1';
                    rw_i<=rw;
                    addr_i<=addr;
                    dw_i<=dw;
                    next_state <= WaitStart;
                else
                    next_state<=Idle;
                end if;

            When WaitStart =>
                if (ram_busy_i='0') then
                	if (rw_i='1') then
                		next_state <= wStart;
                	else
                		next_state <= rStart;
                	end if;
                else
                	next_state <= WaitStart;
                end if;
			
            When wStart =>
                A<=addr_i;
                IOw<=dw_i;
                --bufstate<='0';--buffer is in output mode
                next_state<=wStart2;
	
            When wStart2 =>
                CE1b<='0';
                CE2<='1';
                OEb<='1';
                next_state<=wWait_tHZOE;
	
            When wWait_tHZOE =>
                if(cnt_tHZOE=tHZOE) then
                	cnt_tHZOE<=0;
                	WEb<='0';
                	next_state<=wDataout;
                else
                	cnt_tHZOE<=cnt_tHZOE+1;
                	next_state<=wWait_tHZOE;
                end if;
		
        	When wDataout =>
        --		IO<=dw_i;
        		bufstate<='0';--buffer is in output mode
        		next_state<=wWaitEnd;

            When wWaitEnd =>
                if(cnt_tWEND=tWEND) then
                	cnt_tWEND<=0;
                	bufstate<='1';--buffer back  to input mode
                	next_state<=Idle;
                else
                	cnt_tWEND<=cnt_tWEND+1;
                	next_state<=wWaitEnd;
                end if;			
		
        	When rStart =>
        	    A<=addr_i;
        	    next_state<=rStart2;
        
        	When rStart2 =>
                CE1b<='0';
                CE2<='1';
                WEb<='1';
                OEb<='0';
                bufstate<='1';--buffer is input mode
                next_state<=rWaitDataout;

            when rWaitDataout =>
                if(cnt_tRDOUT=tRDOUT) then
                	cnt_tRDOUT<=0;
                	dr_i<=IOr;
                	dr<=IOr;
                	next_state<=rWaitEnd;
                else
                	cnt_tRDOUT<=cnt_tRDOUT+1;
                	next_state<=rWaitDataout;
                end if;		
	
            when rWaitEnd =>
                if(cnt_tREND=tREND) then
                	cnt_tREND<=0;
                	next_state<=Idle;
                else
                	cnt_tREND<=cnt_tREND+1;
                	next_state<=rWaitEnd;
                end if;		
	
            when others =>
            	busy_i<='0';
            	bufstate<='1';
            	next_state<=idle;
        end case;
    end if;
end process;

end Behavioral;