----------------------------------------------------------------------------------
-- Company: UH MANOA	ID Lab	
-- Engineer: Isar Mostafanezhad
-- 
-- Create Date:    18:11:29 11/08/2014 
-- Design Name: 
-- Module Name:    DigSRPedDSP - Behavioral 
-- Project Name: TX readout for KLM
-- Target Devices: TargetX + Xilinx SP6
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
 
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
use work.readout_definitions.all;
  
  
entity DigSRPedDSP is
    Port ( clk : in  STD_LOGIC;
           start : in  STD_LOGIC;
           ro_win_start : in  STD_LOGIC_VECTOR (8 downto 0);
           win_n : in  STD_LOGIC_VECTOR (2 downto 0);
           asic : in  STD_LOGIC_VECTOR (2 downto 0);
           busy : out  STD_LOGIC;
           dig_ramp_length : in  STD_LOGIC_VECTOR (11 downto 0);
           dig_rd_ena : out  STD_LOGIC;
           dig_clr : out  STD_LOGIC;
           dig_startramp : out  STD_LOGIC;
           do : in  STD_LOGIC_VECTOR (15 downto 0);
			  force_test_pattern: in std_logic;
			  
           sr_clr : out  STD_LOGIC;
           sr_clk : out  STD_LOGIC;
           sr_sel : out  STD_LOGIC;
           sr_samplesel : out  STD_LOGIC_vector(4 downto 0);
           sr_samplsl_any : out  STD_LOGIC;
           ram_addr : out  STD_LOGIC_VECTOR (21 downto 0);
           ram_data : in  STD_LOGIC_VECTOR (7 downto 0);
           ram_update : out  STD_LOGIC;
           ram_busy : in  STD_LOGIC;
           cur_ro_win : out  STD_LOGIC_VECTOR (8 downto 0);
           mode : in  STD_LOGIC_VECTOR (1 downto 0);
           pswfifo_en : out  STD_LOGIC;
           pswfifo_d : out  STD_LOGIC_VECTOR (31 downto 0);
           pswfifo_clk : out  STD_LOGIC;
           fifo_en : out  STD_LOGIC;
           fifo_clk : out  STD_LOGIC;
           fifo_d : out  STD_LOGIC_VECTOR (31 downto 0));
end DigSRPedDSP;

architecture Behavioral of DigSRPedDSP is
	------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT blk_mem_gen_v7_3
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    clkb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

	

	 
signal start_i :   STD_LOGIC;	
signal ro_win_start_i : STD_LOGIC_VECTOR (8 downto 0);	
signal win_n_i : STD_LOGIC_VECTOR (2 downto 0);	
signal asic_i :   STD_LOGIC_VECTOR (2 downto 0);	
signal busy_i :   STD_LOGIC;	
signal dig_ramp_length_i :   STD_LOGIC_VECTOR (11 downto 0);	
signal dig_rd_en_i :   STD_LOGIC;
signal dig_clr_i :   STD_LOGIC;
signal dig_startramp_i :   STD_LOGIC;
signal do_i :   STD_LOGIC_VECTOR (15 downto 0);
signal sr_clr_i :   STD_LOGIC;
signal sr_clk_i :   STD_LOGIC;
signal sr_sel_i :   STD_LOGIC;
signal sr_samplesel_i :  integer:=0;
signal sr_samplsl_any_i :   STD_LOGIC;
signal cur_ro_win_i :   STD_LOGIC_VECTOR (8 downto 0);
signal mode_i :   STD_LOGIC_VECTOR (1 downto 0);
signal dig_start:std_logic:='0';

---------- Digitization signals-----------------------------------
signal dig_rd_ena_out    : std_logic := '0';
signal dig_clr_out 		: std_logic := '0';
signal dig_startramp_out : std_logic := '0';
signal dig_IDLE_status : std_logic := '0';
signal dig_ramp_start : integer:=0;
signal dig_RDEN_LENGTH : integer:=0;
signal dig_RAMP_CNT    : integer:= 0;	

type dig_state_type is
	(
	dig_Idle,				  -- Idling until command start bit
   dig_WaitAddress,		  -- Wait for address to settle
   dig_WaitRead,		  -- Wait for transfer time from Array to WADC, read enable
	dig_WConvert,	    -- wait for conversion to complete
	dig_CheckDone, 	  -- check if done of more loops
	dig_ClrState
	);	
signal dig_next_state		: dig_state_type := dig_Idle;

--------------end Dig-------------------------------------

---------------SR signals:-------------------------------------
	constant sr_ADDR_TIME : integer := 2;
	constant sr_LOAD_TIME : integer := 2;
	constant sr_LOAD_TIME1 : integer :=2;
	constant sr_LOAD_TIME2 : integer := 2;
	constant sr_CLK_CNT_MAX : integer := 12; -- (11+1)->12 clk -> 12 bits

	signal   fifo_wr_en_i		 :   std_logic;
	signal   fifo_wr_clk_i		 :   std_logic;
	signal	fifo_wr_din_i		 :   std_logic_vector(31 downto 0);
	signal	srout_busy	:std_logic:='0';
	signal start_srout:std_logic:='0';
	signal win_cntr_i:integer:=0;
	
	type sr_state_type is
	(
	sr_st_Idle,				  -- Idling until command start bit and store size	
	sr_st_WaitStart,
	sr_st_LoadHeader,
	sr_st_LoadHeader2,
	sr_st_WaitAddr,	    -- Wait for address to settle, need docs to finilize
	sr_st_WaitLoad,	    -- Wait for load cmd to settle, need docs to finilize
	sr_st_WaitLoad1,	    -- Wait for load cmd to settle relatively to clk, need docs to finilize
	sr_st_WaitLoad1a,
	sr_st_WaitLoad2,	    -- Wait for load cmd to settle relatively to clk, need docs to finilize
	sr_st_clkHigh,	    -- Clock high, now at 62.5 MHz ,can investigate later at higher speed
	sr_st_clkHighHold,
	sr_st_clkLow,	      -- Clock low, now at 62.5 MHz ,can investigate later at higher speed
	sr_st_clkLowHold,	      -- Clock low, now at 62.5 MHz ,can investigate later at higher speed
	sr_st_StoreDataSt,	  -- Store shifted in data
	sr_st_StoreDataEnd,
	sr_st_CheckWindowEnd
	);
	signal sr_st					: sr_state_type := sr_st_Idle;
	signal Ev_CNT     	  			: integer:= 0;
	signal BIT_CNT     	 			: integer:= 0;

-----------------------------
-------------MasterProcess----------------
type maste_state_type is --pedstals fetch state
(
master_Idle,				  -- Idling until command start bit and store asic no and win addr no	
master_WaitDig0,
master_WaitDig01,
master_WaitDig1,
master_WaitDig,
master_WaitSR0,
master_WaitSR1,
master_WaitSR,
master_CheckWinCnt
);
signal st_master					: maste_state_type := master_idle;
	










-------------







type ped_state is --pedstals fetch state
(
PedsIdle,				  -- Idling until command start bit and store asic no and win addr no	
PedsFetchPedVal,
PedsFetchPedValWaitSRAM1,
PedsFetchPedValWaitSRAM2,
PedsFetchPedValWaitSRAM3,
PedsFetchRedValWR1,
PedsFetchRedValWR2,
PedsFetchCheckSample,
PedsFetchCheckWin,
PedsFetchCheckCH,
PedsFetchDone
);
signal next_ped_st					: ped_state := PedsIdle;
	
	
type pedsub_state is
(
pedsub_idle,
pedsub_wait_tmp2bram,
pedsub_sub,
pedsub_sub1,
pedsub_sub2,
pedsub_dumpct,
pedsub_dumpct2
);
signal pedsub_st : pedsub_state:=pedsub_idle;

type tmp_to_bram_state is
(
st_tmp2bram_check_ctr,
st_tmp2bram_fetch1,
st_tmp2bram_fetch2
);
signal st_tmp2bram				: tmp_to_bram_state:=st_tmp2bram_check_ctr;
	
	
begin

busy<=busy_i;
sr_clr<=sr_clr_i;
sr_clk<=sr_clk_i;
sr_sel<=sr_sel_i;
sr_samplesel<=std_logic_vector(to_unsigned(sr_samplesel_i,5));
sr_samplsl_any<=sr_samplsl_any_i;
fifo_d<=fifo_wr_din_i;
fifo_en<=fifo_wr_en_i;
fifo_clk<=clk;
cur_ro_win<=cur_ro_win_i;


latch_inputs:process(clk)
begin
if (rising_edge(clk)) then

ro_win_start_i<=ro_win_start;
win_n_i<=win_n;
asic_i<=asic;
mode_i<=mode;

dig_ramp_length_i<=dig_ramp_length;
do_i<=do;
start_i<=start;


end if;

end process;



master_proc: process(clk)
begin
if (rising_edge(clk)) then

Case st_master is
  
	When master_Idle =>
		busy_i<='0';
		win_cntr_i<=0;
		if (start_i='0' and start='1') then
			busy_i<='1';
			st_master<=master_waitDig0;
		else
			st_master<=master_Idle;
		end if;

  When master_WaitDig0 =>
  		dig_start<='1';
		cur_ro_win_i<=std_logic_vector(to_unsigned(to_integer(unsigned(ro_win_start_i))+win_cntr_i,9));
		st_master<=master_waitDig01;
 
  When master_WaitDig01 =>
		st_master<=master_waitDig1;

 When master_WaitDig1 =>
		st_master<=master_waitDig;

  When master_WaitDig =>
		dig_start<='0';
		if dig_idle_status='0' then
			st_master<=master_waitDig;
		else
			start_srout<='1';
			st_master<=master_waitSR0;
		end if;
 
  When master_WaitSR0 =>
			st_master<=master_waitSR1;
			
 When master_WaitSR1 =>
			st_master<=master_waitSR;
			
  When master_WaitSR =>
		start_srout<='0';
		if srout_busy='1' then
			st_master<=master_waitSR;
		else
			win_cntr_i<=win_cntr_i+1;
			st_master<=master_CheckWinCnt;
		end if;
		
	When master_CheckWinCnt =>
		if (win_cntr_i<to_integer(unsigned(win_n_i))) then
			st_master<=master_WaitDig0;
		else
			st_master<=master_Idle;
		end if;

  
  
  
  
end case;
	 


end if;


end process;








--digitization:
dig_rd_ena <= dig_rd_ena_out;
dig_clr <= dig_clr_out;
dig_startramp <= dig_startramp_out;
--time delay between receipt of "Start" and setting rd_en high
dig_ramp_start <= 16;
--time rd_en is held high before setting ramp, start high
dig_RDEN_LENGTH <=32;


dig_process: process(clk)
begin

if (rising_edge(clk)) then
	 Case dig_next_state is
  When dig_Idle =>
    dig_clr_out              <= '1';
	 dig_rd_ena_out         <= '0';
	 dig_startramp_out            	<= '0';
    dig_RAMP_CNT         <=0;
	 dig_IDLE_status <= '1';
    if (dig_start = '1') then   -- start (trigger was detected)
      dig_next_state 	<= dig_WaitAddress;
    else
      dig_next_state 	<= dig_Idle;
    end if;

  When dig_WaitAddress =>  --wait for address to settle on ASIC
    dig_clr_out              <= '0';
	 dig_rd_ena_out         <= '0';  -- making guess on how transfer initiated
	 dig_startramp_out        <= '0';
	 dig_IDLE_status <= '0';
    if (dig_RAMP_CNT < dig_ramp_start) then  -- to delay ramp
      dig_RAMP_CNT <= dig_RAMP_CNT + 1;
      dig_next_state 	<= dig_WaitAddress;
    else
      dig_RAMP_CNT <= 0;
      dig_next_state 	<= dig_WaitRead;
    end if;

  When dig_WaitRead =>  --set read enable high, wait for X clock cycles
    dig_clr_out              <= '0';
	 dig_rd_ena_out         <= '1';  -- latches column , row read address?
	 dig_startramp_out        <= '0';
    if (dig_RAMP_CNT < dig_RDEN_LENGTH) then
      dig_RAMP_CNT <= dig_RAMP_CNT + 1;
      dig_next_state 	<= dig_WaitRead;
    else
      dig_RAMP_CNT <= 0;
      dig_next_state 	<= dig_WConvert;
    end if;

  When dig_WConvert =>  --set ramp, start high
    dig_clr_out              <= '0';
	 dig_rd_ena_out         <= '1';
	 dig_startramp_out        <= '1';
    if (dig_RAMP_CNT< to_integer(unsigned(dig_ramp_length_i))) then  -- to generate ramp
      dig_RAMP_CNT <= dig_RAMP_CNT + 1;
      dig_next_state 	<= dig_WConvert;
    else
      dig_RAMP_CNT <= 0;
      dig_next_state 	<= dig_CheckDone;
    end if;

  When dig_CheckDone => 
	 dig_clr_out              <= '0';
    dig_rd_ena_out         <= '1';
	 dig_startramp_out        <= '0';
    dig_RAMP_CNT         <= 0;
	 dig_IDLE_status <= '1';
    if(dig_start = '0') then  -- done
      dig_next_state 	<= dig_Idle	;
    else
      dig_next_state 	<= dig_CheckDone;
    end if;

  When Others =>
  dig_clr_out              <= '1';
  dig_startramp_out        <= '0';
  dig_rd_ena_out         <= '0';
  dig_RAMP_CNT         <= 0;
  dig_next_state <= dig_Idle;
  end Case;

end if;



end process;


srout: process(clk)
begin
if (rising_edge(clk)) then
  sr_clr_i            <= '0'; --doesn't do anything
  Case sr_st is
    
  When sr_st_Idle =>
    sr_clk_i  	       <= '0';
    sr_sel_i  	       <= '0';
    Ev_CNT           <= 0;
	 BIT_CNT				<= 0;
	 sr_samplsl_any_i       <= '0';
	 fifo_wr_en_i			<= '0';
	 sr_samplesel_i<=0;
	 srout_busy <= '0';
	 fifo_wr_din_i <= (others=>'0');
    if( start_srout = '1') then   -- start (readout initiated)
      sr_st 		  <= sr_st_WaitStart;
    else
      sr_st 		<= sr_st_Idle;
    end if;
	 
   --delay some number of clock cycles
   When sr_st_WaitStart =>
    sr_clk_i  	       <= '0';
    sr_sel_i  	       <= '0';
	 BIT_CNT				<= 0;
	 sr_samplsl_any_i       <= '0';
	 srout_busy <= '1';
	fifo_wr_en_i			<= '0';

    if (Ev_CNT < sr_ADDR_TIME) then   -- start (trigger was detected)
      Ev_CNT <= Ev_CNT + 1;
      sr_st 	<= sr_st_WaitStart;
    else
      Ev_CNT           <= 0;
		sr_st 	<= sr_st_LoadHeader;
    end if;
	
	--load initial sample packet header
	When sr_st_LoadHeader =>
    sr_clk_i  	       <= '0';
    sr_sel_i  	       <= '0';
	 BIT_CNT				<= 0;
	 sr_samplsl_any_i       <= '0';
	 fifo_wr_en_i			<= '1';
	 fifo_wr_din_i <= x"ABC" & '0' & cur_ro_win_i & '0' & ASIC_i & '0' & std_logic_vector(to_unsigned(sr_samplesel_i,5));
	 srout_busy <= '1';
      --sr_st 	<= LoadHeader2;
      sr_st 	<= sr_st_WaitAddr;--debug- IM: 11/4/2014

		
	--turn sr_samplsl_any_i on, wait to settle
   When sr_st_WaitAddr =>
    sr_clk_i  	       <= '0';
    sr_sel_i  	       <= '0';
    sr_samplsl_any_i       <= not force_test_pattern; -- <='0' inorder to force test pattern;
	 --start_fifo 		<= '0';
	 fifo_wr_en_i			<= '0';
    if (Ev_CNT < sr_ADDR_TIME) then   -- start (trigger was detected)
      Ev_CNT <= Ev_CNT + 1;
      sr_st 	<= sr_st_WaitAddr;
    else
      Ev_CNT           <= 0;
      sr_st 	<= sr_st_WaitLoad;
    end if;

	--turn sr_sel_i on, wait to settle
   When sr_st_WaitLoad =>
	 sr_sel_i  	       <= '1';
    sr_samplsl_any_i       <= not force_test_pattern; -- <='0' inorder to force test pattern;
    if (Ev_CNT < sr_LOAD_TIME) then
      Ev_CNT <= Ev_CNT + 1;
		sr_clk_i  	       <= '0';
      sr_st 	<= sr_st_WaitLoad;
    else
      Ev_CNT           <= 0;
		sr_clk_i  	       <= '1';
      sr_st 	<= sr_st_WaitLoad1;
    end if;

	--turn sr_clk_i on, wait to settle
	--turn off sr_sel_i and sr_clk_i on transition
   When sr_st_WaitLoad1 =>
    sr_samplsl_any_i       <= not force_test_pattern; -- <='0' inorder to force test pattern;
    if (Ev_CNT < sr_LOAD_TIME1) then
      Ev_CNT <= Ev_CNT +1;
      sr_sel_i  	       <= '1';
		sr_clk_i  	       <= '1';
      sr_st 	<= sr_st_WaitLoad1;
    else
      Ev_CNT           <= 0;
      sr_sel_i  	       <= '1';
		sr_clk_i  	       <= '0';
      sr_st 	<= sr_st_WaitLoad2;
    end if;

	 
	--turn off sr_sel_i and sr_clk_i on transition
   When sr_st_WaitLoad2 =>
    sr_samplsl_any_i       <= not force_test_pattern; -- <='0' inorder to force test pattern;
	 sr_sel_i  	       <= '0';
	 sr_clk_i  	       <= '0';
    if (Ev_CNT < sr_LOAD_TIME1) then
      Ev_CNT <= Ev_CNT + 1;
      sr_st 	<= sr_st_WaitLoad2;
    else
      Ev_CNT           <= 0;
      --sr_st 	<= ClkHigh;
		sr_st 	<= sr_st_StoreDataSt;
    end if; 
	
	--hold sr_clk_i high
   When sr_st_ClkHigh =>
    sr_sel_i  	       <= '0';
    sr_samplsl_any_i       <= '1';
	 Ev_CNT           <= 0;
    if (BIT_CNT < sr_CLK_CNT_MAX) then
      sr_clk_i  	       <= '1';
      sr_st 	<= sr_st_ClkHighHold;
    else
      sr_clk_i  	       <= '0';
		sr_samplesel_i<=sr_samplesel_i+1;
      --sr_st 	<= StoreDataSt;
		sr_st 	<= sr_st_CheckWindowEnd;
    end if;
	
	When sr_st_ClkHighHold =>
    sr_sel_i  	       <= '0';
    sr_samplsl_any_i       <= '1';
	 sr_clk_i  	       <= '1';
	if (Ev_CNT < sr_LOAD_TIME2) then   -- start (trigger was detected)
      Ev_CNT <= Ev_CNT + 1;
		sr_st 	<= sr_st_ClkHighHold;
	else
		Ev_CNT           <= 0;
		sr_st 	<= sr_st_ClkLow;
    end if;
	 
	--hold sr_clk_i low
   When sr_st_ClkLow =>
    sr_sel_i  	       <= '0';
    sr_samplsl_any_i       <= '1';
	 Ev_CNT           <= 0;
    BIT_CNT <= BIT_CNT;
    sr_clk_i  	       <= '0';
	 sr_st 	<= sr_st_ClkLowHold;
	 
   When sr_st_ClkLowHold =>
    sr_sel_i  	       <= '0';
    sr_samplsl_any_i       <= '1';
    BIT_CNT <= BIT_CNT;
    sr_clk_i  	       <= '0';
	 if (Ev_CNT < sr_LOAD_TIME2) then   -- start (trigger was detected)
      Ev_CNT <= Ev_CNT +1;
		sr_st 	<= sr_st_ClkLowHold;
	else
		Ev_CNT           <= 0;
		sr_st 	<= sr_st_StoreDataSt;
    end if;

	--Start FIFO write process
   When sr_st_StoreDataSt =>
    sr_clk_i  	       <= '0';
    sr_sel_i  	       <= '0';
    sr_samplsl_any_i       <= '1';
	 fifo_wr_en_i			<= '1';
	 fifo_wr_din_i <= x"DEF" & std_logic_vector(to_unsigned(BIT_CNT,4)) & do_i;
	 sr_st 	<= sr_st_StoreDataEnd;
	 
	When sr_st_StoreDataEnd =>
    sr_clk_i  	       <= '0';
    sr_sel_i  	       <= '0';
    sr_samplsl_any_i       <= '1';
	 BIT_CNT <= BIT_CNT +1;
	 fifo_wr_en_i			<= '0';
	 sr_st 	<= sr_st_ClkHigh;

	--wait for start signal to go low
   When sr_st_CheckWindowEnd =>
    sr_clk_i  	       <= '0';
    sr_sel_i  	       <= '0';
    sr_samplsl_any_i       <= '0';
	 sr_st 		<= sr_st_Idle;
	 --add a footer to end of window
	 fifo_wr_din_i <= x"FACEFACE";
	 if( sr_samplesel_i = 32) then
      fifo_wr_en_i			<= '1';
	  	 sr_st 		<= sr_st_Idle;
	 else
	 	fifo_wr_en_i			<= '0';
		sr_st 		<= sr_st_WaitStart;
	 end if;
	 
  When Others =>
    sr_clk_i  	       <= '0';
    sr_sel_i  	       <= '0';
    sr_samplsl_any_i       <= '0';
    Ev_CNT           <= 0;
	 BIT_CNT           <= 0;
	 srout_busy <= '0';
	 fifo_wr_en_i			<= '0';
	 sr_st 		<= sr_st_Idle;
	end case;
end if;
end process;




end Behavioral;

