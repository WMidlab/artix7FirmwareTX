----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:19:35 10/20/2012 
-- Design Name: 
-- Module Name:    ReadoutControl3 - Behavioral 
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

entity ReadoutControl3 is
    Port(
        clk                         : in  STD_LOGIC;
        smp_clk                     : in STD_LOGIC;
        trigger                     : in  STD_LOGIC;
        trig_delay                  : in  STD_LOGIC_VECTOR(11 downto 0);
        ctrl_mode                   : in std_logic_vector(3 downto 0); --x"0"= USB has control, x"1"= PocketDAQ controlled readout,...
        dig_offset                  : in  STD_LOGIC_VECTOR(8 downto 0);
        win_num_to_read             : in  STD_LOGIC_VECTOR(8 downto 0);
        asic_enable_bits            : in  STD_LOGIC_VECTOR(9 downto 0);
        SMP_MAIN_CNT                : in STD_LOGIC_VECTOR(8 downto 0);
        SMP_IDLE_status             : in  STD_LOGIC;
        DIG_IDLE_status             : in  STD_LOGIC;
        SROUT_IDLE_status           : in  STD_LOGIC;
        fifo_empty                  : in  STD_LOGIC;
        EVTBUILD_DONE_SENDING_EVENT : in  STD_LOGIC;
        READOUT_RESET               : in  STD_LOGIC;
        READOUT_CONTINUE            : in STD_LOGIC;
        RESET_EVENT_NUM             : in STD_LOGIC;
        use_fixed_dig_start_win     : in std_logic_vector(15 downto 0);
        LATCH_SMP_MAIN_CNT          : out STD_LOGIC_VECTOR(8 downto 0);
        dig_win_start               : out STD_LOGIC_VECTOR(8 downto 0);-- goes to the sampling logic to kill the write enable while writing over the digitization window
        LATCH_DONE                  : out STD_LOGIC;
        ASIC_NUM                    : out STD_LOGIC_VECTOR(3 downto 0);
        busy_status                 : out STD_LOGIC;
        smp_stop                    : out  STD_LOGIC;
        dig_start                   : out  STD_LOGIC;
        DIG_RD_ROWSEL_S             : out STD_LOGIC_VECTOR(2 downto 0);
        DIG_RD_COLSEL_S             : out STD_LOGIC_VECTOR(5 downto 0);
        srout_start                 : out  STD_LOGIC;
        srout_restart               : out std_logic;
        ped_sub_start               : out std_logic;
        ped_sub_busy                : in std_logic;			

        EVTBUILD_start              : out  STD_LOGIC;
        EVTBUILD_MAKE_READY         : out  STD_LOGIC;
        EVENT_NUM                   : out STD_LOGIC_VECTOR(31 downto 0);
        READOUT_DONE                : out  STD_LOGIC
        );
end ReadoutControl3;

architecture Behavioral of ReadoutControl3 is

    type SmpClk_state_type is
	(
	   Idle,
	   WaitWritePointerSafe,
	   WaitReset
	);
	
    signal next_SmpClk_state	: SmpClk_state_type;

    type trig_state_type is
	(
    	Idle,
    	WAIT_TRIG_CLEAR,
    	WAIT_TRIG_DELAY,
    	STOP_SAMPLING,
    	wait_ped_sub_busy_empty_packet_busy_hi,
    	wait_ped_sub_busy_empty_packet_busy_low,
    	WAIT_SAMPLING_IDLE,
    	send_pedsub_start,
    	DIG_WINDOW_LOOP,
    	WAIT_DIG_ADDR,
    	START_DIG,
    	WAIT_DIGITIZATION_IDLE_LOW,
    	WAIT_DIGITIZATION_IDLE_HIGH,
    	SROUT_ASIC_LOOP,
    	SROUT_CHECK_ASIC_ENABLED,
    	CheckPedSubBusy,
    	WAIT_READOUT_RESET,
    	WAIT_READOUT_CONTINUE_HIGH,
    	WAIT_READOUT_CONTINUE_LOW,
    	START_SROUT,
    	WAIT_SROUT_IDLE_LOW,
    	WAIT_SROUT_IDLE_HIGH,
    	START_EVTBUILD,
    	WAIT_EVTBUILD_DONE,
    	SET_EVTBUILD_MAKE_READY
	);
	
signal next_trig_state	: trig_state_type;

--Signals on sampling clock domain
signal internal_SmpClk_trigger                      : std_logic := '0';
signal internal_SmpClk_trigger_reg                  : std_logic_vector(1 downto 0) := "00";
signal internal_SmpClk_LATCH_DONE                   : std_logic := '0';
signal internal_SmpClk_LATCH_SMP_MAIN_CNT           : UNSIGNED(8 downto 0) := '0' & x"00";
signal internal_SmpClk_SMP_IDLE_status              : std_logic := '0';
signal internal_SmpClk_DIG_IDLE_status              : std_logic := '0';
signal internal_SmpClk_SROUT_IDLE_status            : std_logic := '0';
signal internal_SmpClk_fifo_empty                   : std_logic := '0';
signal internal_SmpClk_EVTBUILD_DONE_SENDING_EVENT  : std_logic := '0';
signal internal_SmpClk_READOUT_RESET                : std_logic := '0';

--Signals on local clock domain
signal INTERNAL_COUNTER                             : UNSIGNED(15 downto 0) :=  x"0000";

signal internal_trig_delay                          : UNSIGNED(11 downto 0) := (others=>'0');
signal internal_dig_offset                          : UNSIGNED(8 downto 0) := (others=>'0');
signal internal_win_num_to_read                     : UNSIGNED(8 downto 0) := (others=>'0');
signal internal_SMP_MAIN_CNT                        : UNSIGNED(8 downto 0) := '0' & x"00";
signal internal_SMP_IDLE_status                     : std_logic := '0';
signal internal_DIG_IDLE_status                     : std_logic := '0';
signal internal_SROUT_IDLE_status                   : std_logic := '0';
signal internal_EVTBUILD_DONE_SENDING_EVENT         : std_logic := '0';

signal internal_LATCH_DONE                          : std_logic := '0';
signal internal_LATCH_SMP_MAIN_CNT                  : UNSIGNED(8 downto 0) := '0' & x"00";
signal internal_win_cnt                             : UNSIGNED(8 downto 0) := (others=>'0');
signal internal_busy_status                         : std_logic := '0';
signal internal_asic_cnt                            : INTEGER := 0;
signal internal_smp_stop                            : std_logic := '0';
signal internal_dig_start                           : std_logic := '0';
signal internal_srout_start                         : std_logic := '0';
signal internal_EVTBUILD_start                      : std_logic := '0';
signal internal_EVTBUILD_MAKE_READY                 : std_logic := '0';
signal internal_READOUT_CONTINUE                    : std_logic := '0';
signal internal_ASIC_SROUT_ENABLE_BITS              : std_logic_vector(9 downto 0) := "1111111111";
signal internal_EVENT_NUM                           : UNSIGNED(31 downto 0) := x"00000000";
signal internal_READOUT_DONE                        : std_logic := '0';
signal internal_dig_win_start                       : unsigned(8 downto 0) := (others=>'0');
signal win_start_i                                  : integer;
signal win_end_i                                    : integer;
signal SMP_MAIN_CNT_i                               : std_logic_vector(8 downto 0);
signal SMP_MAIN_CNT_carry_i                         : std_logic_vector(9 downto 0);
signal internal_LATCH_DONE_TRIG_CLEAR               : std_logic:='0';
signal internal_cnt_reset                           : integer:=0;
signal internal_n_asics                             : integer:=0;
signal DIG_RD_COLSEL_S_temp                         : std_logic_vector(5 downto 0);

attribute dont_touch : string;
attribute dont_touch of internal_latch_done : signal is "true";
attribute dont_touch of internal_dig_idle_status : signal is "true";
attribute dont_touch of internal_readout_continue : signal is "true";
attribute dont_touch of internal_srout_idle_status : signal is "true";
attribute dont_touch of internal_evtbuild_done_sending_event : signal is "true";

begin

    busy_status <= internal_busy_status;
    smp_stop <= internal_smp_stop;
    dig_start <= internal_dig_start;
    srout_start <= internal_srout_start;
    EVTBUILD_start <= internal_EVTBUILD_start;
    EVTBUILD_MAKE_READY <= internal_EVTBUILD_MAKE_READY;
    DIG_RD_ROWSEL_S(2 downto 0) <= std_logic_vector(internal_SMP_MAIN_CNT(2 downto 0));
    DIG_RD_COLSEL_S(5 downto 0) <= std_logic_vector(internal_SMP_MAIN_CNT(8 downto 3));
    
    LATCH_SMP_MAIN_CNT <= std_logic_vector(internal_LATCH_SMP_MAIN_CNT);
    LATCH_DONE <= internal_LATCH_DONE;
    ASIC_NUM <= std_logic_vector(to_unsigned(internal_asic_cnt,ASIC_NUM'length));
    EVENT_NUM <= std_logic_vector(internal_EVENT_NUM);
    READOUT_DONE <= internal_READOUT_DONE;
    dig_win_start <= std_logic_vector(internal_dig_win_start);

    --latch trigger and related signals to SAMPLING clock domain
    process(smp_clk)
    begin
    if (smp_clk'event and smp_clk = '1') then
    	internal_SmpClk_trigger <= trigger;
    	internal_SmpClk_SMP_IDLE_status <= SMP_IDLE_status;
    	internal_SmpClk_DIG_IDLE_status <= DIG_IDLE_status;
    	internal_SmpClk_SROUT_IDLE_status <= SROUT_IDLE_status;
    	internal_SmpClk_fifo_empty <= fifo_empty;
    	internal_SmpClk_EVTBUILD_DONE_SENDING_EVENT <= EVTBUILD_DONE_SENDING_EVENT;
    	internal_SmpClk_READOUT_RESET <= READOUT_RESET;
    end if;
    end process;
    
    --detect trigger rising edge on SAMPLING clock domain
    process(smp_clk)
    begin
    if (smp_clk'event and smp_clk = '1') then
    	internal_SmpClk_trigger_reg(1) <= internal_SmpClk_trigger_reg(0);
    	internal_SmpClk_trigger_reg(0) <= internal_SmpClk_trigger;
    end if;
    end process;

--decide to accept a trigger on SAMPLING clock domain
process(smp_clk)
begin
    if (smp_clk'event and smp_clk = '1') then

    	SMP_MAIN_CNT_i<=SMP_MAIN_CNT;
    	if (SMP_MAIN_CNT_carry_i(9)='0') then
    		SMP_MAIN_CNT_carry_i(9)<=(not SMP_MAIN_CNT_i(0)) and (not SMP_MAIN_CNT_i(1)) and (not SMP_MAIN_CNT_i(2)) and (not SMP_MAIN_CNT_i(3))
    								 and (not SMP_MAIN_CNT_i(4)) and (not SMP_MAIN_CNT_i(5)) and (not SMP_MAIN_CNT_i(6)) and (not SMP_MAIN_CNT_i(7))
    								  and (not SMP_MAIN_CNT_i(8));
    	else
    		SMP_MAIN_CNT_carry_i(9)<='1';
    	end if;
    		
    	SMP_MAIN_CNT_carry_i(8 downto 0)<=SMP_MAIN_CNT_i;

        Case next_SmpClk_state is
        	--detect trigger word
        	When Idle =>
        		internal_SmpClk_LATCH_DONE <= '0';
        		if( internal_SmpClk_trigger_reg = "01" AND internal_SmpClk_SMP_IDLE_status = '0' AND internal_SmpClk_DIG_IDLE_status = '1' 
        			AND internal_SmpClk_SROUT_IDLE_status = '1' AND internal_SmpClk_fifo_empty = '1' AND internal_SmpClk_EVTBUILD_DONE_SENDING_EVENT = '0' 
        			AND internal_SmpClk_READOUT_RESET = '0' ) then 
        			--latch the SMP_MAIN_CNT at time of trigger, include a configurable digitzation window offset
        			internal_cnt_reset<=200;
        
        			if use_fixed_dig_start_win(15)='0' then
        				internal_SmpClk_LATCH_SMP_MAIN_CNT <= UNSIGNED(SMP_MAIN_CNT);
        				next_SmpClk_state <= WaitReset;
        			else
        				internal_SmpClk_LATCH_SMP_MAIN_CNT <= UNSIGNED(use_fixed_dig_start_win(8 downto 0)); --SMP_MAIN_CNT is on smp_clk domain
        				win_start_i<=to_integer(UNSIGNED(use_fixed_dig_start_win(8 downto 0)))-10+512;
        				win_end_i  <=to_integer(UNSIGNED(use_fixed_dig_start_win(8 downto 0)))+10+512+to_integer(internal_win_num_to_read);
        				SMP_MAIN_CNT_carry_i(9)<='0';
        --				next_SmpClk_state <= Idle; -- abort!
        --				next_SmpClk_state <= WaitWritePointerSafe;
        				next_SmpClk_state <= WaitReset;
        
        			end if;
        		else
        			next_SmpClk_state <= Idle;
		        end if;
	
        	When WaitWritePointerSafe =>
        			if ((to_integer(unsigned(SMP_MAIN_CNT_carry_i))+512) > win_start_i and (to_integer(unsigned(SMP_MAIN_CNT_carry_i))+512)<win_end_i ) then
        				--next_SmpClk_state <= WaitWritePointerSafe;
        				next_SmpClk_state <= Idle; -- abort!
        			else
        				next_SmpClk_state <= WaitReset;
        			end if;
        			
        --		if (to_integer(internal_LATCH_SMP_MAIN_CNT)+to_integer(internal_win_num_to_read) <= 511 ) then -- no wrap around case, just wait here until sampling counter clears the area
        --
        --			if (to_integer(unsigned(SMP_MAIN_CNT))<= to_integer(to_unsigned((to_integer(internal_LATCH_SMP_MAIN_CNT)+to_integer(internal_win_num_to_read)),9)) and 
        --				 to_integer(unsigned(SMP_MAIN_CNT))>= to_integer(internal_LATCH_SMP_MAIN_CNT)
        --			) then
        --				next_trig_state <= WAIT_TRIG_CLEAR;
        --			else
        --				next_trig_state <= WAIT_TRIG_DELAY;
        --			end if;
        --
        --		else	--  wrap around case, here until sampling counter clears the area
        --
        --			if (to_integer(unsigned(SMP_MAIN_CNT))<= to_integer(to_unsigned((to_integer(internal_LATCH_SMP_MAIN_CNT)+to_integer(internal_win_num_to_read)),10)) and 
        --			    to_integer(unsigned(SMP_MAIN_CNT))>= 511-(to_integer(internal_win_num_to_read)) 
        --			) then
        --				next_trig_state <= WAIT_TRIG_CLEAR;
        --			else
        --				next_trig_state <= WAIT_TRIG_DELAY;
        --			end if;
        --
        --		end if;


        	When WaitReset =>
        		internal_SmpClk_LATCH_DONE <= '1';
        		if (ctrl_mode=x"0") then --USB is in charge
        			if( internal_SmpClk_READOUT_RESET = '1' ) then
        				next_SmpClk_state <= Idle;
        			else
        				internal_cnt_reset<=internal_cnt_reset-1;
        				next_SmpClk_state <= WaitReset;
        			end if;
        		elsif (ctrl_mode=x"1") then
        			if (internal_SmpClk_READOUT_RESET = '1' or internal_cnt_reset = 0) then
        				next_SmpClk_state <= Idle;
        			else
        				internal_cnt_reset<=internal_cnt_reset-1;
        				next_SmpClk_state <= WaitReset;
        			end if;
        		end if;
        	
        	When Others =>
        		internal_SmpClk_LATCH_DONE <= '0';
        		internal_SmpClk_LATCH_SMP_MAIN_CNT <= (others=>'0');
        		next_SmpClk_state <= Idle;
        end Case;
        
    end if;
end process;

--control event number
process(RESET_EVENT_NUM, internal_LATCH_DONE)
begin
	if (RESET_EVENT_NUM = '1') then
		internal_EVENT_NUM <= (others=>'0');
	else
		if( rising_edge(internal_LATCH_DONE) ) then
			internal_EVENT_NUM <= internal_EVENT_NUM + 1;
		end if;
	end if;
end process;

--latch signals to local clock domain
internal_n_asics <=
	to_integer(unsigned(internal_ASIC_SROUT_ENABLE_BITS(0 downto 0)))+to_integer(unsigned(internal_ASIC_SROUT_ENABLE_BITS(1 downto 1)))+
	to_integer(unsigned(internal_ASIC_SROUT_ENABLE_BITS(2 downto 2)))+to_integer(unsigned(internal_ASIC_SROUT_ENABLE_BITS(3 downto 3)))+
	to_integer(unsigned(internal_ASIC_SROUT_ENABLE_BITS(4 downto 4)))+to_integer(unsigned(internal_ASIC_SROUT_ENABLE_BITS(5 downto 5)))+
	to_integer(unsigned(internal_ASIC_SROUT_ENABLE_BITS(6 downto 6)))+to_integer(unsigned(internal_ASIC_SROUT_ENABLE_BITS(7 downto 7)))+
	to_integer(unsigned(internal_ASIC_SROUT_ENABLE_BITS(8 downto 8)))+to_integer(unsigned(internal_ASIC_SROUT_ENABLE_BITS(9 downto 9)));


  

process(clk)
begin
    if (clk'event and clk = '1') then
        internal_LATCH_DONE <= internal_SmpClk_LATCH_DONE;
        internal_LATCH_SMP_MAIN_CNT <= internal_SmpClk_LATCH_SMP_MAIN_CNT;
        internal_SMP_IDLE_status <= SMP_IDLE_status;
    	internal_DIG_IDLE_status <= DIG_IDLE_status;
    	internal_SROUT_IDLE_status <= SROUT_IDLE_status;
    	internal_EVTBUILD_DONE_SENDING_EVENT <= EVTBUILD_DONE_SENDING_EVENT;
    	internal_trig_delay <= UNSIGNED(trig_delay);
    	internal_dig_offset <= UNSIGNED(dig_offset);
    	internal_win_num_to_read <= UNSIGNED(win_num_to_read);
    	internal_ASIC_SROUT_ENABLE_BITS <= asic_enable_bits;
    	internal_READOUT_CONTINUE <= READOUT_CONTINUE;
    end if;
end process;

--process governing trigger + sampling, stop_smp signal
process(clk)
begin
    if (clk'event and clk = '1') then
        case next_trig_state is
        	--detect if trigger is accepted
        	When Idle => --0x00
                ped_sub_start<='0';        
        		internal_busy_status <= '0';
        		internal_smp_stop <= '0';
        		internal_dig_start <= '0';
        		internal_srout_start <= '0';
        		internal_EVTBUILD_start <= '0';
        		internal_EVTBUILD_MAKE_READY <= '0';
        		internal_win_cnt <= (others=>'0');
        		internal_asic_cnt <= 0;
        		internal_READOUT_DONE <= '0';
        		internal_LATCH_DONE_TRIG_CLEAR<='0';
        		INTERNAL_COUNTER<=(others=>'0');
        		if( internal_LATCH_DONE = '1') then 
        			next_trig_state <= WAIT_TRIG_DELAY;
        			srout_restart<='1';
        		else
        			next_trig_state <= Idle;
        			srout_restart<='0';
        		end if;
        
        --	When WAIT_TRIG_CLEAR =>-- wait for trig write pointer pass the readout area then issue a readout busy and start reading out...just keep in mind that we got here because of fixed window readout
			
        	--optionally delay sampling stop
        	When WAIT_TRIG_DELAY => --0x02
                ped_sub_start<='0';        
        		internal_LATCH_DONE_TRIG_CLEAR<='1';
        		internal_busy_status <= '1';
        		if( internal_trig_delay > INTERNAL_COUNTER ) then 
        			INTERNAL_COUNTER <= INTERNAL_COUNTER + 1;
        			next_trig_state <= WAIT_TRIG_DELAY;
        		else
        			INTERNAL_COUNTER <= (Others => '0');
        			next_trig_state <=STOP_SAMPLING;
        		end if;
	
	       --stop sampling
        	When STOP_SAMPLING =>  --0x03
        		internal_LATCH_DONE_TRIG_CLEAR<='0';
        		internal_smp_stop <= '1';
        		internal_dig_start <= '0';
        		internal_srout_start <= '0';
        		internal_EVTBUILD_start <= '0';
        		internal_EVTBUILD_MAKE_READY <= '0';
        		srout_restart<='0';
        		internal_dig_win_start <= internal_LATCH_SMP_MAIN_CNT - internal_dig_offset;
        		if (internal_ASIC_SROUT_ENABLE_BITS="0000000000") then -- we know no ASICs had hits, so just signal such that it will send a dummy packet
        			ped_sub_start<='1';
        			srout_restart<='1';
        			next_trig_state <= wait_ped_sub_busy_empty_packet_busy_hi;
        		else
                    ped_sub_start<='0';        
        			next_trig_state <= SROUT_ASIC_LOOP;
        		end if;
        
        	When wait_ped_sub_busy_empty_packet_busy_hi =>  --0x04
        		ped_sub_start<='0';
        		srout_restart<='0';
        		if (ped_sub_busy='0') then 
        			next_trig_state <= wait_ped_sub_busy_empty_packet_busy_hi;
        		else
        			next_trig_state <= wait_ped_sub_busy_empty_packet_busy_low;
        		end if;

        	When wait_ped_sub_busy_empty_packet_busy_low =>  --0x05
        	    ped_sub_start<='0';		
        		if (ped_sub_busy='1') then 
        		    next_trig_state <= wait_ped_sub_busy_empty_packet_busy_low;
        		else
        			next_trig_state <= WAIT_READOUT_RESET;
        		end if;
        			
                --next_trig_state <= DIG_WINDOW_LOOP;	
               	--LOOP OVER ASICs in SERIAL READOUT
               	--first check if asic cnt > 10, if yes then done serail readout, goto DIG_WINDOW_LOOP
               	--check ASIC readout bit, if 1 goto START_SROUT, 0 goto SROUT_ASIC_LOOP
        	
        	When SROUT_ASIC_LOOP =>  --0x0d
                ped_sub_start<='0';        
        		internal_smp_stop <= '1';
        		internal_dig_start <= '0';
        		internal_srout_start <= '0';
        		internal_EVTBUILD_start <= '0';
        		internal_EVTBUILD_MAKE_READY <= '0';
        		if( internal_asic_cnt < 10 ) then
        			next_trig_state <= SROUT_CHECK_ASIC_ENABLED; --continue serial readout, go to ASIC check
        		else
                    --next_trig_state <= DIG_WINDOW_LOOP; -- done serial readout, go back to digitization loop
        			next_trig_state <= WAIT_READOUT_RESET; -- done serial readout of all ASICs, now wait for readout reset from extrenal
        		end if;
	
           --Check if specific ASIC is enabled for readout	
        	When SROUT_CHECK_ASIC_ENABLED =>  --0x0e
        		internal_smp_stop <= '1';
        		internal_dig_start <= '0';
        		internal_srout_start <= '0';
        		internal_EVTBUILD_start <= '0';
        		internal_EVTBUILD_MAKE_READY <= '0';
        		internal_asic_cnt <= internal_asic_cnt + 1;
        		if( internal_ASIC_SROUT_ENABLE_BITS( internal_asic_cnt ) = '1') then
        			next_trig_state <= send_pedsub_start; 
        			ped_sub_start<='1';
        			srout_restart<='1';
        			
        			internal_win_cnt<=(others=>'0');
                    --next_trig_state <= DIG_WINDOW_LOOP; --asic corresponding to internal_asic_cnt is enabled, read out
                    --next_trig_state <= START_SROUT; --asic corresponding to internal_asic_cnt is enabled, read out
        			--next_trig_state <= WAIT_READOUT_CONTINUE_HIGH; --pause readout to prevent USB buffer overflow
        		else
                    ped_sub_start<='0';        
        			next_trig_state <= SROUT_ASIC_LOOP; --asic not enabled, go back to SROUT [asicloop] to check next ASIC
        		end if;
        		
        	when send_pedsub_start =>  --0x07
        			srout_restart<='0';
        			ped_sub_start<='0';			
        			next_trig_state <= DIG_WINDOW_LOOP; --asic corresponding to internal_asic_cnt is enabled, read out
	
        	--multi-window readout loop here, decide to digitize window or end readout
        	When DIG_WINDOW_LOOP =>  --0x08
                ped_sub_start<='0';        
        		internal_smp_stop <= '1';
        		internal_dig_start <= '0';
        		internal_srout_start <= '0';
        		internal_EVTBUILD_start <= '0';
        		internal_EVTBUILD_MAKE_READY <= '0';
        		--internal_busy_status <= '0';
                --internal_asic_cnt <= 0;
        		internal_SMP_MAIN_CNT <= internal_LATCH_SMP_MAIN_CNT + internal_win_cnt - internal_dig_offset;
        		internal_dig_win_start <= internal_LATCH_SMP_MAIN_CNT - internal_dig_offset;
        
        		if( internal_win_cnt < internal_win_num_to_read ) then
        			internal_win_cnt <= internal_win_cnt + 1; --update # of windows digitized counter
        			next_trig_state <= WAIT_DIG_ADDR; --read out window specified by internal_SMP_MAIN_CNT
        		else
        			next_trig_state <= CheckPedSubBusy;-- done with the 4th window, now wait for the ped subtracted samples be transfred to the FIFO- keep readout busy till then
                    --next_trig_state <= WAIT_READOUT_RESET; -- done readout, go to wait for reset state
        			--next_trig_state <= START_EVTBUILD; -- done readout, start data packet creation
        		end if;
	
        	--provide some time for new read address to settle
        	When WAIT_DIG_ADDR =>  --0x09
                ped_sub_start<='0';        
        		if( x"0008" > INTERNAL_COUNTER ) then 
        			INTERNAL_COUNTER <= INTERNAL_COUNTER + 1;
        			next_trig_state <= WAIT_DIG_ADDR;
        		else
        			INTERNAL_COUNTER <= (Others => '0');
        			next_trig_state <=START_DIG;
        		end if;
        		
        	--start digitization, update # windows counter, keep sampling suspednded
        	When START_DIG =>  --0x0a
                ped_sub_start<='0';        
        		internal_smp_stop <= '1';
        		internal_dig_start <= '1';
        		internal_srout_start <= '0';
        		internal_EVTBUILD_start <= '0';
        		internal_EVTBUILD_MAKE_READY <= '0';
        		--internal_busy_status <= '1';
        		next_trig_state <= WAIT_DIGITIZATION_IDLE_LOW;	
        	
        	--wait for digitization IDLE_status to go low, ie. digitization starts
        	When WAIT_DIGITIZATION_IDLE_LOW =>  --0x0b
                ped_sub_start<='0';        
        	    if( internal_DIG_IDLE_status = '1' ) then 
        		    next_trig_state <= WAIT_DIGITIZATION_IDLE_LOW;
        	    else
        		    next_trig_state <= WAIT_DIGITIZATION_IDLE_HIGH;
        	    end if;
	
        	--wait for digitization IDLE_status to go high, ie. digitization ends
        	When WAIT_DIGITIZATION_IDLE_HIGH =>  --0x0c
                ped_sub_start<='0';        
        	    if( internal_DIG_IDLE_status = '0' ) then
        	        next_trig_state <= WAIT_DIGITIZATION_IDLE_HIGH;
        	    else
        		    next_trig_state <= START_SROUT;
        		    --next_trig_state <= WAIT_READOUT_CONTINUE_HIGH;
        	        --next_trig_state <= SROUT_ASIC_LOOP;
      	        end if;
        	
        	--READOUT CONTINUE CHECK GOES HERE, PAUSE THE READOUT TO PREVENT USB BUFFER OVERFLOW
        	--IMPORTANT: Don't pause readout for first window, slightly faster
        	When WAIT_READOUT_CONTINUE_HIGH =>  --0x11
                ped_sub_start<='0';        
        	    if( internal_READOUT_CONTINUE = '1' ) then 
        		    next_trig_state <= WAIT_READOUT_CONTINUE_LOW;
        	    else
        		    --internal_busy_status <= '0';
        		    next_trig_state <= WAIT_READOUT_CONTINUE_HIGH;
        	    end if;
	
        	When WAIT_READOUT_CONTINUE_LOW =>  --0x12
                ped_sub_start<='0';        
        	    if( internal_READOUT_CONTINUE = '0' ) then 
        		    next_trig_state <= START_SROUT;
        	    else
        		    next_trig_state <= WAIT_READOUT_CONTINUE_LOW;
        	    end if;
        	
        	--LOOP OVER ASICs SERIAL READOUT GOES HERE
        	When START_SROUT =>  --0x013
                ped_sub_start<='0';        
        		internal_smp_stop <= '1';
        		internal_dig_start <= '1'; --leave dig start signal high until end of process
        		internal_srout_start <= '1';
        		internal_EVTBUILD_start <= '0';
        		internal_EVTBUILD_MAKE_READY <= '0';
        		--internal_busy_status <= '1';
        		next_trig_state <= WAIT_SROUT_IDLE_LOW;
	
	        --wait for serial readout IDLE_status to go low, ie. digitization starts
        	When WAIT_SROUT_IDLE_LOW =>  --0x14
        	    ped_sub_start<='0';        
        	    if( internal_SROUT_IDLE_status = '1' ) then 
        	        next_trig_state <= WAIT_SROUT_IDLE_LOW;
        	    else
        		    next_trig_state <= WAIT_SROUT_IDLE_HIGH;
        	    end if;
        	
        	--wait for digitization IDLE_status to go high, ie. digitization ends
        	When WAIT_SROUT_IDLE_HIGH => --0x15
                ped_sub_start<='0';        
        	    if( internal_SROUT_IDLE_status = '0' ) then 
        		    next_trig_state <= WAIT_SROUT_IDLE_HIGH;
        	    else
        		    --next_trig_state <= START_EVTBUILD; --go to event builder, doing this here sends packet for each window
        		    next_trig_state <= DIG_WINDOW_LOOP; --go back to check if any more windows need digitizing
        		    --next_trig_state <= SROUT_ASIC_LOOP;
        	    end if;
	
        	--start event builder
        	When START_EVTBUILD => --0x16
                ped_sub_start<='0';        
        		internal_smp_stop <= '1';
        		internal_dig_start <= '0';
        		internal_srout_start <= '0';
        		internal_EVTBUILD_start <= '1';
        		internal_EVTBUILD_MAKE_READY <= '0';
        		internal_busy_status <= '0';
        		next_trig_state <= WAIT_EVTBUILD_DONE;
        			
        	--wait for event builder to finish
        	When WAIT_EVTBUILD_DONE => --0x17
                ped_sub_start<='0';        
        	    INTERNAL_COUNTER <= (Others => '0');
        	    if( internal_EVTBUILD_DONE_SENDING_EVENT = '0' ) then 
        		    next_trig_state <= WAIT_EVTBUILD_DONE;
        	    else
        		    next_trig_state <= SET_EVTBUILD_MAKE_READY;
        	    end if;
	
        	--send MAKE_READY signal, hand shake for event builder finishing
        	When SET_EVTBUILD_MAKE_READY => --0x18
                ped_sub_start<='0';        
        		internal_smp_stop <= '1';
        		internal_dig_start <= '0';
        		internal_srout_start <= '0';
        		internal_EVTBUILD_start <= '0';
        		internal_EVTBUILD_MAKE_READY <= '1'; --leave this high, gets cleared in START_DIG or READOUT_RESET
        		--internal_busy_status <= '0'; --readout is not busy at this point
        		--next_trig_state <= DIG_WINDOW_LOOP; --go back to check if any more windows need digitizing
        		next_trig_state <= WAIT_READOUT_RESET;
        		--next_trig_state <= SROUT_ASIC_LOOP;  --go back to SROUT_ASIC_LOOP to if more ASICs need to be read out
        			
        	--wait for readout to be reset via command interpreter controlled internal_LATCH_DONE
        	When CheckPedSubBusy => --0x0f -- check if pedestal subtraction is happening at the end of the 4 window sets. this should go to a wait state every 4 windows.
        	    ped_sub_start<='0';		
        	    if (ped_sub_busy='1') then 
        			next_trig_state <= CheckPedSubBusy;
        		else
        			next_trig_state <= SROUT_ASIC_LOOP;
        		end if;

        	When WAIT_READOUT_RESET => --0x10
                ped_sub_start<='0';        
        		internal_smp_stop <= '1'; --hold sampling, in principle allow testing different write addresses
        		internal_dig_start <= '0';
        		internal_srout_start <= '0';
        		internal_EVTBUILD_start <= '0';
        		internal_EVTBUILD_MAKE_READY <= '0';
        		internal_busy_status <= '0';
        		internal_READOUT_DONE <= '1';
        		internal_asic_cnt<=0;
        	    if( internal_LATCH_DONE = '1' ) then 
        		    next_trig_state <= WAIT_READOUT_RESET;
        	    else
        		    next_trig_state <= Idle;
        	    end if;
        	
        	When Others =>
                ped_sub_start<='0';        
        		INTERNAL_COUNTER <= (Others => '0');
        		internal_smp_stop <= '0';
        		internal_dig_start <= '0';
        		internal_srout_start <= '0';
        		internal_EVTBUILD_start <= '0';
        		internal_EVTBUILD_MAKE_READY <= '0';
        		internal_busy_status <= '0';
        		internal_READOUT_DONE <= '0';
        		next_trig_state <= Idle;
        		
        end case;
    end if;
end process;

end Behavioral;

