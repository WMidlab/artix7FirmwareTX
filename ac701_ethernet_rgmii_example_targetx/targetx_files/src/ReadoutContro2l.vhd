----------------------------------------------------------------------------------
-- Company: UH Manoa- ID LAB
-- Engineer: Isar Mostafanezhad
-- 
-- Create Date:    11/8/2014
-- Design Name:   ReadOutController- Revamped
-- Module Name:    ReadoutControl2 - Behavioral 
-- Project Name: KLM Belle II
-- Target Devices: SP6
-- Tool versions: ISE 14.7
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------

Library work;
use work.all;
--use work.Target2Package.all;

Library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
--Library synplify;
--use synplify.attributes.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ReadoutControl2 is
    Port ( 
			  clk 			: in  STD_LOGIC;
           trig 			: in  STD_LOGIC;
			  dig_offset 	: in  STD_LOGIC_VECTOR(8 downto 0);
			  use_fixed_dig_start_win : in std_logic_vector(15 downto 0);
			  nwin_read 	: in  STD_LOGIC_VECTOR(2 downto 0);-- number of windows to read
			  systime		: in  std_logic_vector(31 downto 0);-- connected to a counter on top and used as a clock tick
			  curwin			: in 	std_logic_vector(8 downto 0);-- current window that the ASICs are writing to- comes from sampling logic			
			  asicX			: in std_logic_vector(2 downto 0);
			  asicY			: in std_logic_vector(2 downto 0);
			  DIG_IDLE		: in  STD_LOGIC;
			  dig_sr_busy   : in  STD_LOGIC;
			  EVTBUILD_DONE_SENDING_EVENT : in  STD_LOGIC;
			  RESET_EVENT_NUM : in STD_LOGIC;
			  fifo_empty   : in  STD_LOGIC;
			 
			  trig_ack			: out std_logic;
			  SRax				: out std_logic_vector(2 downto 0);
			  SRay				: out std_logic_vector(2 downto 0);
    		  ro_win_start  	: out STD_LOGIC_VECTOR(8 downto 0);
			  sr_systime		: out std_logic_vector(31 downto 0);
			  ro_busy 			: out STD_LOGIC;
           dig_sr_start 	: out  STD_LOGIC;
			  EVTBUILD_start : out  STD_LOGIC;
			  EVTBUILD_MAKE_READY : out  STD_LOGIC;
			  EVENT_NUM : out STD_LOGIC_VECTOR(31 downto 0)
	  );
end ReadoutControl2;

architecture Behavioral of ReadoutControl2 is

signal		  trig_i 			:   STD_LOGIC_vector(1 downto 0):="00";
signal		  dig_offset_i 	:   STD_LOGIC_VECTOR(8 downto 0);
signal		  use_fixed_dig_start_win_i :  std_logic_vector(15 downto 0);
signal		  nwin_i 	:   STD_LOGIC_VECTOR(2 downto 0);-- number of windows to read
signal		  trigwin_i 	:   STD_LOGIC_VECTOR(8 downto 0);-- window that we latched onto right after trigger
signal		  systime_i		: std_logic_vector(31 downto 0);-- connected to a counter on top and used as a clock tick
signal		  curwin_i			: std_logic_vector(8 downto 0);-- current window that the ASICs are writing to- comes from sampling logic			
signal		  ro_win_i			: std_logic_vector(8 downto 0);-- current window that the ASICs are writing to- comes from sampling logic			
signal		  asicX_i			: std_logic_vector(2 downto 0);
signal		  asicY_i			: std_logic_vector(2 downto 0);
signal		  DIG_IDLE_i		: STD_LOGIC:='0';
signal		  dig_sr_busy_i   : STD_LOGIC:='0';
signal		  EVTBUILD_DONE_SENDING_EVENT_i :   STD_LOGIC:='0';
signal		  RESET_EVENT_NUM_i :  STD_LOGIC:='0';
signal		  fifo_empty_i   : STD_LOGIC:='0';
		 
signal		  trig_ack_i			:  std_logic;
signal		  ax_i				:  std_logic_vector(2 downto 0);
signal		  ay_i				: std_logic_vector(2 downto 0);
signal		  ro_win_start_i  	: STD_LOGIC_VECTOR(8 downto 0);
signal		  sr_systime_i		: std_logic_vector(31 downto 0);
signal		  ro_busy_i 			:  STD_LOGIC:='0';
signal        dig_sr_start_i 			:   STD_LOGIC:='0';
signal		  EVTBUILD_start_i :   STD_LOGIC:='0';
signal		  EVTBUILD_MAKE_READY_i :   STD_LOGIC:='0';
signal		  EVENT_NUM_i : integer:=0;
signal 			evtbuild_cntr:integer:=0;

type next_st_rdout is
	(
		rd_idle,
		rd_start,
		rd_wait0,
		rd_wait1,
		rd_wait2,
		rd_wait3,
		rd_wait_dig_sr_done,
		rd_START_EVTBUILD,
		rd_WAIT_READOUT_RESET,
		rd_WAIT_EVTBUILD_DONE,
		rd_SET_EVTBUILD_MAKE_READY
		
	);
signal st_rdout	: next_st_rdout:=rd_idle;



begin


ro_busy<=ro_busy_i;
dig_sr_start <= dig_sr_start_i;

			  
			  
EVTBUILD_start <= EVTBUILD_start_i;
EVTBUILD_MAKE_READY <= EVTBUILD_MAKE_READY_i;
ro_win_start<= ro_win_i;
SRax<=ax_i;
SRay<=ay_i;
sr_systime<=systime_i;

EVENT_NUM <= std_logic_vector(to_unsigned(EVENT_NUM_i,32));



latch_inputs: process (clk)
begin

if (rising_edge(clk)) then
	
	trig_i(1)<=trig_i(0);
	trig_i(0)<=trig;
	dig_offset_i<=dig_offset;
	use_fixed_dig_start_win_i<=use_fixed_dig_start_win;
	nwin_i<=nwin_read;
	DIG_IDLE_i<=DIG_IDLE;
	dig_sr_busy_i<=dig_sr_busy;
	EVTBUILD_DONE_SENDING_EVENT_i<=EVTBUILD_DONE_SENDING_EVENT;
	RESET_EVENT_NUM_i<=RESET_EVENT_NUM;
	fifo_empty_i<=fifo_empty;
	curwin_i<=curwin;
	
--	if (trig_i='0' and trig='1') then
--		if (st_rdout='0') then
--			systime_i<=systime;
--			ax_i<=asicX;
--			ay_i<=asicY;
--			trigwin_i<=curwin;
--			ro_win_i<=std_logic_vector(to_unsigned(to_integer(unsigned(curwin))-to_integer(unsigned(nwin_i)),9));-- needs work?
--			trig_ack<='1';
--		else
--			trig_ack<='0';
--		end if;
--		
--	end if;
	

end if;

end process;

work_trig: process(clk)
begin

if (rising_edge(clk)) then

case st_rdout is

when rd_idle =>
	if (trig_i="01") then
		systime_i<=systime;
		ax_i<=asicX;
		ay_i<=asicY;
		trigwin_i<=curwin;
		ro_win_i<=std_logic_vector(to_unsigned(to_integer(unsigned(curwin_i))-to_integer(unsigned(dig_offset_i)),9));-- needs work?
		trig_ack<='1';
		ro_busy_i<='1';
		st_rdout<=rd_start;
	else
		trig_ack<='0';
		ro_busy_i<='0';
		st_rdout<=rd_idle;
	end if;
	
when rd_start =>
		trig_ack<='0';
	-- everything is latched, so now let the dig and sr start
		ro_busy_i<='1';
		dig_sr_start_i<='1';
		EVTBUILD_start_i <= '0';
		EVTBUILD_MAKE_READY_i <= '0';
		st_rdout<=rd_wait0;

when rd_wait0 =>
		st_rdout<=rd_wait1;
		
when rd_wait1 =>
	st_rdout<=rd_wait2;

when rd_wait2 =>
	st_rdout<=rd_wait3;
	
when rd_wait3 =>
	st_rdout<=rd_wait_dig_sr_done;


when rd_wait_dig_sr_done =>
		if (dig_sr_busy_i='1') then
			ro_busy_i<='1';
			st_rdout<=rd_wait_dig_sr_done;
		else 
			ro_busy_i<='0';
			EVTBUILD_start_i <= '0';
					st_rdout <= rd_idle;

		--	st_rdout<=rd_START_EVTBUILD;		
		end if;
		
--		
--	When rd_START_EVTBUILD =>
--		EVTBUILD_start_i <= '1';
--		EVTBUILD_MAKE_READY_i <= '0';
--		evtbuild_cntr<=1000;
--		st_rdout <= rd_WAIT_EVTBUILD_DONE;
--			
--	--wait for event builder to finish
--	When rd_WAIT_EVTBUILD_DONE =>
--	if( EVTBUILD_DONE_SENDING_EVENT_i = '0' and evtbuild_cntr>0) then 
--		evtbuild_cntr<=evtbuild_cntr-1;
--		st_rdout <= rd_WAIT_EVTBUILD_DONE;
--	else
--		evtbuild_cntr<=0;
--		st_rdout <= rd_SET_EVTBUILD_MAKE_READY;
--	end if;
--	
--	--send MAKE_READY signal, hand shake for event builder finishing
--	When rd_SET_EVTBUILD_MAKE_READY =>
--		EVTBUILD_start_i <= '0';
--		EVTBUILD_MAKE_READY_i <= '1'; --leave this high, gets cleared in START_DIG or READOUT_RESET
--		--internal_busy_status <= '0'; --readout is not busy at this point
--			--next_trig_state <= DIG_WINDOW_LOOP; --go back to check if any more windows need digitizing
--			st_rdout <= rd_WAIT_READOUT_RESET;
--			--next_trig_state <= SROUT_ASIC_LOOP;  --go back to SROUT_ASIC_LOOP to if more ASICs need to be read out
--			
--	--wait for readout to be reset via command interpreter controlled internal_LATCH_DONE
--	When rd_WAIT_READOUT_RESET =>
--		EVTBUILD_start_i <= '0';
--		EVTBUILD_MAKE_READY_i <= '0';
--		st_rdout <= rd_idle;

when others=>
			ro_busy_i<='0';
			st_rdout<=rd_idle;		

end case;



end if;

end process;


evtno:process(RESET_EVENT_NUM, trig_ack_i)
begin
	if (RESET_EVENT_NUM = '1') then
		EVENT_NUM_i <= 0;
	else
		if( rising_edge(trig_ack_i) ) then
			EVENT_NUM_i <= EVENT_NUM_i + 1;
		end if;
	end if;
end process;




end Behavioral;

