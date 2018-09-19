----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:21:17 10/10/2014 
-- Design Name: 	Scheduler/ logical access channel for the CY62177EV30 SRAM chip
-- Module Name:    SRAMscheduler - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;
use work.readout_definitions.all;

--package ram_scheduler_pkg is
--  type AddrArray is array (NRAMCH-1 downto 0) of std_logic_vector(21 downto 0);
--  type DataArray is array (NRAMCH-1 downto 0) of std_logic_vector(7 downto 0);
--  type QArray is array (NRAMCH-1 downto 0) of integer;
-- 
---- type AddrArray is array (NRAMCH-1 downto 0) of std_logic_vector(21 downto 0);
--end package;

entity SRAMscheduler is


Port ( 
			  
			  clk  : in std_logic;
						
			  Ain 	: in AddrArray;
			  DWin 	: in DataArray;
			  DRout 	 	: out DataArray;
			  rw   	: in std_logic_vector(NRAMCH-1 downto 0); --'0' = read, '1' = write
			  update_req : in std_logic_vector(NRAMCH-1 downto 0); --'0'= do nothing, edge to '1' means start either a read or write opertion
			  busy 	: out std_logic_vector(NRAMCH-1 downto 0);
						  
			--Controls to the SRAM, the scheduler will control who has access to the RAM using a multiplexer  
			  A : out  STD_LOGIC_VECTOR (21 downto 0);
           IOw : out  STD_LOGIC_VECTOR (7 downto 0);
           IOr : in  STD_LOGIC_VECTOR (7 downto 0);
			  bs: out std_logic;--buffstate
           WEb : out  STD_LOGIC;
           CE2 : out  STD_LOGIC;
           CE1b : out  STD_LOGIC;
           OEb : out  STD_LOGIC
			  
			  );
			  
end SRAMscheduler;

architecture Behavioral of SRAMscheduler is

signal busy_i: std_logic_vector(NRAMCH-1 downto 0);
signal update_req_i1: std_logic_vector(NRAMCH-1 downto 0);
signal update_req_i0: std_logic_vector(NRAMCH-1 downto 0);
signal ram_wait_i: std_logic_vector(NRAMCH-1 downto 0):=(others=>'0');
signal queue_i		: QArray:=(others=>0);
signal ql_i		: integer :=0; --Queue length (next item will be added to this index) has to be <NRAMCH
--signal nap : integer :=0; 
signal curr_ch : integer :=0; --the current ch that is actually connected to the RAM and is controlling it
signal update_req_edg : std_logic_vector(NRAMCH-1 downto 0);
signal update_req_edg_new : std_logic;
signal allch_busy : std_logic:='0';

signal A_i :  AddrArray;
signal IOw_i : DataArray;
signal IOr_i : DataArray;

signal WEb_i	: STD_LOGIC_vector(NRAMCH-1 downto 0);
signal CE2_i	: std_logic_vector(NRAMCH-1 downto 0);
signal CE1b_i	: std_logic_vector(NRAMCH-1 downto 0);
signal OEb_i	: std_logic_vector(NRAMCH-1 downto 0);
signal bs_i	: std_logic_vector(NRAMCH-1 downto 0);


type state_type is
	(
	SrvQ,			-- Idling until there is a '1' edge in any update_req bit, during idle, monitor previous requests and service as needed
	WaitCheckUpdate,	--Wait 
	CheckUpdate,	--Check the diff in update request bits and find the requesting channels and add to queue 
   QReq		  -- Queue the request if possible( the specific channel is not busy) and go to the Idle 
	);
	
signal sched_st	 : state_type:=SrvQ;


begin

u_ram_iface : for i in 0 to NRAMCH-1 generate
u_ri: entity work.SRAMiface2 port map
(
		clk => clk,
		addr => Ain(i),
		dw => DWin(i),
		dr => DRout(i),
		rw => rw(i),
		update => update_req_i0(i),
		busy => busy_i(i),
		ram_busy => ram_wait_i(i),
		A => A_i(i),
		IOw => IOw_i(i),
		IOr => IOr_i(i),
		bs=>bs_i(i),--buf state
		WEb => WEb_i(i),
		CE2 => CE2_i(i),
		CE1b => CE1b_i(i),
		OEb => OEb_i(i)
);

--A<=A_i(i) when (curr_ch=i) else (others=>'0');--?
--IO<=IO_i(i) when (curr_ch=i) else (others=>'0');--?
--WEb<=WEb_i(i) when (curr_ch=i) else '0';--?
--CE2<=CE2_i(i) when (curr_ch=i) else '0';--?
--CE1b<=CE1b_i(i) when (curr_ch=i) else '1';--?
--OEb<=OEb_i(i) when (curr_ch=i) else '0';--?
--update_req_edg_new <= update_req_edg_new or update_req_edg(i);

end generate;
update_req_edg_new <= update_req_edg(0) or update_req_edg(1) or update_req_edg(2) or update_req_edg(3) ;
curr_ch<=queue_i(0);
ram_wait_i<="1110" when (curr_ch=0) else
				"1101" when (curr_ch=1) else
				"1011" when (curr_ch=2) else
				"0111" when (curr_ch=3);

A<=A_i(curr_ch);
IOw<=IOw_i(curr_ch);
IOr_i(curr_ch)<=IOr;
WEb<=WEb_i(curr_ch); 
CE2<=CE2_i(curr_ch); 
CE1b<=CE1b_i(curr_ch); 
OEb<=OEb_i(curr_ch); 
bs<=bs_i(curr_ch);
busy<=busy_i;

process (clk)
begin
if (rising_edge(clk)) then
--latch signals
update_req_i1<=update_req_i0;
update_req_i0<=update_req;


for i in 0 to NRAMCH-1 loop
	if (update_req_i1(i)='0' and update_req_i0(i)='1') then
	update_req_edg(i)<='1';
	else 
	update_req_edg(i)<='0';
	end if;
end loop;

end if;

end process;


process (clk)
begin
if (rising_edge(clk)) then
--
--basic idea: check the updat bits from all logical channels, which reflects the update requests. If there is a change in the update bit pattern
--then add that to the access queue for servicing
--
--


--	for i in 0 to NRAMCH-1 loop
--	if (update_req_edg(i)='1' ) then
--	-- add the ch of the requester to the
--	if (ql_i<NRAMCH) then 
--		queue_i(ql_i+i)<=i;
--		ql_i<=ql_i+1;
--		else
--		allch_busy<='1';
--		--HANDLE ERROR HERE- NEED TO ADD A PIN!
--	end if;
--	
--	else 
--	end if;
--	end loop;

allch_busy<='0';-- this needs some work

case update_req_edg is

when "0000" =>

when "0001" => 
if (ql_i  <NRAMCH) then queue_i(ql_i)<=0;ql_i<=ql_i+1; else allch_busy<='1'; end if;
when "0010" => 
if (ql_i  <NRAMCH) then queue_i(ql_i)<=1;ql_i<=ql_i+1; else allch_busy<='1'; end if;
when "0100" => if (ql_i  <NRAMCH) then queue_i(ql_i)<=2;ql_i<=ql_i+1; else allch_busy<='1'; end if;
when "1000" => if (ql_i  <NRAMCH) then queue_i(ql_i)<=3;ql_i<=ql_i+1; else allch_busy<='1'; end if;
when "0011" => if (ql_i+1<NRAMCH) then queue_i(ql_i)<=0;queue_i(ql_i+1)<=1;ql_i<=ql_i+2; else allch_busy<='1'; end if;
when "0101" => if (ql_i+1<NRAMCH) then queue_i(ql_i)<=0;queue_i(ql_i+1)<=2;ql_i<=ql_i+2; else allch_busy<='1'; end if;
when "1001" => if (ql_i+1<NRAMCH) then queue_i(ql_i)<=0;queue_i(ql_i+1)<=3;ql_i<=ql_i+2; else allch_busy<='1'; end if;
when "0110" => if (ql_i+1<NRAMCH) then queue_i(ql_i)<=1;queue_i(ql_i+1)<=2;ql_i<=ql_i+2; else allch_busy<='1'; end if;
when "1100" => if (ql_i+1<NRAMCH) then queue_i(ql_i)<=2;queue_i(ql_i+1)<=3;ql_i<=ql_i+2; else allch_busy<='1'; end if;
when "1010" => if (ql_i+1<NRAMCH) then queue_i(ql_i)<=1;queue_i(ql_i+1)<=3;ql_i<=ql_i+2; else allch_busy<='1'; end if;
when "1110" => if (ql_i+2<NRAMCH) then queue_i(ql_i)<=1;queue_i(ql_i+1)<=2;queue_i(ql_i+2)<=3;ql_i<=ql_i+3; else allch_busy<='1'; end if;
when "1101" => if (ql_i+2<NRAMCH) then queue_i(ql_i)<=0;queue_i(ql_i+1)<=2;queue_i(ql_i+2)<=3;ql_i<=ql_i+3; else allch_busy<='1'; end if;
when "1011" => if (ql_i+2<NRAMCH) then queue_i(ql_i)<=0;queue_i(ql_i+1)<=1;queue_i(ql_i+1)<=3;ql_i<=ql_i+3; else allch_busy<='1'; end if;
when "0111" => if (ql_i+2<NRAMCH) then queue_i(ql_i)<=0;queue_i(ql_i+1)<=1;queue_i(ql_i+2)<=2;ql_i<=ql_i+3; else allch_busy<='1'; end if;
when "1111" => if (ql_i+3<NRAMCH) then queue_i(ql_i)<=0;queue_i(ql_i+1)<=1;queue_i(ql_i+2)<=2;queue_i(ql_i+3)<=3;ql_i<=ql_i+4; else allch_busy<='1'; end if;



when others =>

end case;

if (update_req_edg_new='1') then 

else 

	if (busy_i(curr_ch)='0' and ql_i>0) then
	--done with this channel shift everything one toward index 0 in array
	queue_i(0)<=queue_i(1);
	queue_i(1)<=queue_i(2);
	queue_i(2)<=queue_i(3);
	ql_i<=ql_i-1;
	end if;

end if;



--Case sched_st is
--   
--	When SrvQ =>
--	-- code to service exiting queue
--	
--	if (update_req_edg_new='1') then 
--	-- find the all the update requests and queue RAM access accordingly
--
--		sched_st<=WaitCheckUpdate;-- there are new update requests, so go and check them and add to queue
--		else 
--		sched_st<=CheckUpdate;-- there are new update requests, so go and check them and add to queue
--
--		--sched_st<=SrvQ;  -- otherwise just service the queue
--	end if;
--
--	When WaitCheckUpdate =>
--		sched_st<=CheckUpdate;
--
--
--	When CheckUpdate =>
--	if (busy_i(curr_ch)='0' and ql_i>0) then
--	--done with this channel shift everything one toward index 0 in array
--	queue_i(0)<=queue_i(1);
--	queue_i(1)<=queue_i(2);
--	queue_i(2)<=queue_i(3);
--	ql_i<=ql_i-1;
--	end if;
--	
--	sched_st<=SrvQ;
--
--
--	when others =>
--			--busy_i<=(others=>'0');
--			sched_st<=SrvQ;
--	end case;

end if;

end process;



end Behavioral;

