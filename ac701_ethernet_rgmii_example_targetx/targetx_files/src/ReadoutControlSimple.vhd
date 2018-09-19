----------------------------------------------------------------------------------
-- Company: UH Manoa IDL	
-- Engineer: Isar Mostafanezhad
-- 
-- Create Date:    10/30/2014
-- Design Name: Readout control module for KLM TARGET X
-- Module Name:    ReadoutControlSimple - Behavioral 
-- Project Name: BELLE II KLM
-- Target Devices: TARGETX
-- Tool versions: 
-- Description: The simplified version of the readout for TargetX
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Inherited
-- Additional Comments: 
--
----------------------------------------------------------------------------------

Library work;
use work.all;

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

entity ReadoutControlSimple is
    Port ( clk : in  STD_LOGIC;
			  smp_clk : in STD_LOGIC;
           trigger : in  STD_LOGIC;
			  trig_delay : in  STD_LOGIC_VECTOR(11 downto 0);
			  dig_offset : in  STD_LOGIC_VECTOR(8 downto 0);
			  win_num_to_read : in  STD_LOGIC_VECTOR(8 downto 0);-- number of windows to read
			  asic_enable_bits : in  STD_LOGIC_VECTOR(9 downto 0);
			  SMP_MAIN_CNT : in STD_LOGIC_VECTOR(8 downto 0);
			  SMP_IDLE_status : in  STD_LOGIC;
			  DIG_IDLE_status : in  STD_LOGIC;
			  SROUT_IDLE_status : in  STD_LOGIC;
			  fifo_empty : in  STD_LOGIC;
			  EVTBUILD_DONE_SENDING_EVENT : in  STD_LOGIC;
			  READOUT_RESET  : in  STD_LOGIC;
			  READOUT_CONTINUE : in STD_LOGIC;
			  RESET_EVENT_NUM : in STD_LOGIC;
			  use_fixed_dig_start_win : in std_logic_vector(15 downto 0);
			  LATCH_SMP_MAIN_CNT : out STD_LOGIC_VECTOR(8 downto 0);
			  dig_win_start		: out STD_LOGIC_VECTOR(8 downto 0);-- goes to the sampling logic to kill the write enable while writing over the digitization window
			  LATCH_DONE : out STD_LOGIC;
			  ASIC_NUM : out STD_LOGIC_VECTOR(3 downto 0);
			  busy_status : out STD_LOGIC;
           smp_stop : out  STD_LOGIC;
           dig_start : out  STD_LOGIC;
			  DIG_RD_ROWSEL_S : out STD_LOGIC_VECTOR(2 downto 0);
			  DIG_RD_COLSEL_S : out STD_LOGIC_VECTOR(5 downto 0);
           srout_start : out  STD_LOGIC;
			  EVTBUILD_start : out  STD_LOGIC;
			  EVTBUILD_MAKE_READY : out  STD_LOGIC;
			  EVENT_NUM : out STD_LOGIC_VECTOR(31 downto 0);
			  READOUT_DONE : out  STD_LOGIC
	  );
end ReadoutControlSimple;

architecture Behavioral of ReadoutControlSimple is

type SmpClk_state_type is
	(
	Idle,
	WaitReset
	);
signal next_SmpClk_state	: SmpClk_state_type;

type trig_state_type is
	(
	Idle,
	WAIT_TRIG_DELAY,
	STOP_SAMPLING,
	WAIT_SAMPLING_IDLE,
	DIG_WINDOW_LOOP,
	WAIT_DIG_ADDR,
	START_DIG,
	WAIT_DIGITIZATION_IDLE_LOW,
	WAIT_DIGITIZATION_IDLE_HIGH,
	SROUT_ASIC_LOOP,
	SROUT_CHECK_ASIC_ENABLED,
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
signal internal_SmpClk_trigger : std_logic := '0';
signal internal_SmpClk_trigger_reg : std_logic_vector(1 downto 0) := "00";
signal internal_SmpClk_LATCH_DONE : std_logic := '0';
signal internal_SmpClk_LATCH_SMP_MAIN_CNT : UNSIGNED(8 downto 0) := '0' & x"00";
signal internal_SmpClk_SMP_IDLE_status : std_logic := '0';
signal internal_SmpClk_DIG_IDLE_status : std_logic := '0';
signal internal_SmpClk_SROUT_IDLE_status : std_logic := '0';
signal internal_SmpClk_fifo_empty : std_logic := '0';
signal internal_SmpClk_EVTBUILD_DONE_SENDING_EVENT : std_logic := '0';
signal internal_SmpClk_READOUT_RESET : std_logic := '0';

--Signals on local clock domain
signal INTERNAL_COUNTER : UNSIGNED(15 downto 0) :=  x"0000";

signal internal_trig_delay : UNSIGNED(11 downto 0) := (others=>'0');
signal internal_dig_offset : UNSIGNED(8 downto 0) := (others=>'0');
signal internal_win_num_to_read : UNSIGNED(8 downto 0) := (others=>'0');
signal internal_SMP_MAIN_CNT : UNSIGNED(8 downto 0) := '0' & x"00";
signal internal_SMP_IDLE_status : std_logic := '0';
signal internal_DIG_IDLE_status : std_logic := '0';
signal internal_SROUT_IDLE_status : std_logic := '0';
signal internal_EVTBUILD_DONE_SENDING_EVENT : std_logic := '0';

signal internal_LATCH_DONE : std_logic := '0';
signal internal_LATCH_SMP_MAIN_CNT : UNSIGNED(8 downto 0) := '0' & x"00";
signal internal_win_cnt : UNSIGNED(8 downto 0) := (others=>'0');
signal internal_busy_status : std_logic := '0';
signal internal_asic_cnt : INTEGER := 0;
signal internal_smp_stop : std_logic := '0';
signal internal_dig_start : std_logic := '0';
signal internal_srout_start : std_logic := '0';
signal internal_EVTBUILD_start : std_logic := '0';
signal internal_EVTBUILD_MAKE_READY : std_logic := '0';
signal internal_READOUT_CONTINUE : std_logic := '0';
signal internal_ASIC_SROUT_ENABLE_BITS : std_logic_vector(9 downto 0) := "1111111111";
signal internal_EVENT_NUM : UNSIGNED(31 downto 0) := x"00000000";
signal internal_READOUT_DONE : std_logic := '0';
signal internal_dig_win_start : unsigned(8 downto 0) := (others=>'0');

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
Case next_SmpClk_state is
	--detect trigger word
	When Idle =>
		internal_SmpClk_LATCH_DONE <= '0';
		if( internal_SmpClk_trigger_reg = "01" AND internal_SmpClk_SMP_IDLE_status = '0' AND internal_SmpClk_DIG_IDLE_status = '1' 
			AND internal_SmpClk_SROUT_IDLE_status = '1' AND internal_SmpClk_fifo_empty = '1' AND internal_SmpClk_EVTBUILD_DONE_SENDING_EVENT = '0' 
			AND internal_SmpClk_READOUT_RESET = '0' ) then 
			--latch the SMP_MAIN_CNT at time of trigger, include a configurable digitzation window offset
			if use_fixed_dig_start_win(15)='0' then
			internal_SmpClk_LATCH_SMP_MAIN_CNT <= UNSIGNED(SMP_MAIN_CNT);
				else
					internal_SmpClk_LATCH_SMP_MAIN_CNT <= UNSIGNED(use_fixed_dig_start_win(8 downto 0)); --SMP_MAIN_CNT is on smp_clk domain
			end if;
			next_SmpClk_state <= WaitReset;
		else
			next_SmpClk_state <= Idle;
		end if;
	
	When WaitReset =>
		internal_SmpClk_LATCH_DONE <= '1';
		if( internal_SmpClk_READOUT_RESET = '1' ) then
			next_SmpClk_state <= Idle;
		else
			next_SmpClk_state <= WaitReset;
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
	Case next_trig_state is
	
	--detect if trigger is accepted
	When Idle =>
		internal_busy_status <= '0';
		internal_smp_stop <= '0';
		internal_dig_start <= '0';
		internal_srout_start <= '0';
		internal_EVTBUILD_start <= '0';
		internal_EVTBUILD_MAKE_READY <= '0';
		internal_win_cnt <= (others=>'0');
		internal_asic_cnt <= 0;
		internal_READOUT_DONE <= '0';
	if( internal_LATCH_DONE = '1') then 
		next_trig_state <= WAIT_TRIG_DELAY;
	else
		next_trig_state <= Idle;
	end if;
	
	--optionally delay sampling stop
	When WAIT_TRIG_DELAY =>
		internal_busy_status <= '1';
		if( internal_trig_delay > INTERNAL_COUNTER ) then 
			INTERNAL_COUNTER <= INTERNAL_COUNTER + 1;
			next_trig_state <= WAIT_TRIG_DELAY;
		else
			INTERNAL_COUNTER <= (Others => '0');
			next_trig_state <=STOP_SAMPLING;
		end if;
	
	--stop sampling
	When STOP_SAMPLING =>
		internal_smp_stop <= '1';
		internal_dig_start <= '0';
		internal_srout_start <= '0';
		internal_EVTBUILD_start <= '0';
		internal_EVTBUILD_MAKE_READY <= '0';
		internal_dig_win_start <= internal_LATCH_SMP_MAIN_CNT - internal_dig_offset;
		next_trig_state <= DIG_WINDOW_LOOP;	

	--multi-window readout loop here, decide to digitize window or end readout
	When DIG_WINDOW_LOOP =>
		internal_smp_stop <= '1';
		internal_dig_start <= '0';
		internal_srout_start <= '0';
		internal_EVTBUILD_start <= '0';
		internal_EVTBUILD_MAKE_READY <= '0';
		--internal_busy_status <= '0';
		internal_asic_cnt <= 0;
		internal_SMP_MAIN_CNT <= internal_LATCH_SMP_MAIN_CNT + internal_win_cnt - internal_dig_offset;
		internal_dig_win_start <= internal_LATCH_SMP_MAIN_CNT - internal_dig_offset;

		if( internal_win_cnt < internal_win_num_to_read ) then
			internal_win_cnt <= internal_win_cnt + 1; --update # of windows digitized counter
			next_trig_state <= WAIT_DIG_ADDR; --read out window specified by internal_SMP_MAIN_CNT
		else
			next_trig_state <= WAIT_READOUT_RESET; -- done readout, go to wait for reset state
			--next_trig_state <= START_EVTBUILD; -- done readout, start data packet creation
		end if;
	
	--provide some time for new read address to settle
	When WAIT_DIG_ADDR =>
		if( x"0004" > INTERNAL_COUNTER ) then 
			INTERNAL_COUNTER <= INTERNAL_COUNTER + 1;
			next_trig_state <= WAIT_DIG_ADDR;
		else
			INTERNAL_COUNTER <= (Others => '0');
			next_trig_state <=START_DIG;
		end if;
		
	--start digitization, update # windows counter, keep sampling suspednded
	When START_DIG =>
		internal_smp_stop <= '1';
		internal_dig_start <= '1';
		internal_srout_start <= '0';
		internal_EVTBUILD_start <= '0';
		internal_EVTBUILD_MAKE_READY <= '0';
		--internal_busy_status <= '1';
			next_trig_state <= WAIT_DIGITIZATION_IDLE_LOW;	
	
	--wait for digitization IDLE_status to go low, ie. digitization starts
	When WAIT_DIGITIZATION_IDLE_LOW =>
	if( internal_DIG_IDLE_status = '1' ) then 
		next_trig_state <= WAIT_DIGITIZATION_IDLE_LOW;
	else
		next_trig_state <= WAIT_DIGITIZATION_IDLE_HIGH;
	end if;
	
	--wait for digitization IDLE_status to go high, ie. digitization ends
	When WAIT_DIGITIZATION_IDLE_HIGH =>
	if( internal_DIG_IDLE_status = '0' ) then
		next_trig_state <= WAIT_DIGITIZATION_IDLE_HIGH;
	else
		--next_trig_state <= START_SROUT;
		--next_trig_state <= WAIT_READOUT_CONTINUE_HIGH;
		next_trig_state <= SROUT_ASIC_LOOP;
	end if;
	
	--LOOP OVER ASICs in SERIAL READOUT
	--first check if asic cnt > 10, if yes then done serail readout, goto DIG_WINDOW_LOOP
	--check ASIC readout bit, if 1 goto START_SROUT, 0 goto SROUT_ASIC_LOOP
	When SROUT_ASIC_LOOP =>
		internal_smp_stop <= '1';
		internal_dig_start <= '1';
		internal_srout_start <= '0';
		internal_EVTBUILD_start <= '0';
		internal_EVTBUILD_MAKE_READY <= '0';
		if( internal_asic_cnt < 10 ) then
			next_trig_state <= SROUT_CHECK_ASIC_ENABLED; --continue serial readout, go to ASIC check
		else
			next_trig_state <= DIG_WINDOW_LOOP; -- done serial readout, go back to digitization loop
		end if;
	
   --Check if specific ASIC is enabled for readout	
	When SROUT_CHECK_ASIC_ENABLED =>
		internal_smp_stop <= '1';
		internal_dig_start <= '1';
		internal_srout_start <= '0';
		internal_EVTBUILD_start <= '0';
		internal_EVTBUILD_MAKE_READY <= '0';
		internal_asic_cnt <= internal_asic_cnt + 1;
		if( internal_ASIC_SROUT_ENABLE_BITS( internal_asic_cnt ) = '1') then
			next_trig_state <= START_SROUT; --asic corresponding to internal_asic_cnt is enabled, read out
			--next_trig_state <= WAIT_READOUT_CONTINUE_HIGH; --pause readout to prevent USB buffer overflow
		else
			next_trig_state <= SROUT_ASIC_LOOP; --asic not enabled, go back to SROUT to check next ASIC
		end if;
	
	--READOUT CONTINUE CHECK GOES HERE, PAUSE THE READOUT TO PREVENT USB BUFFER OVERFLOW
	--IMPORTANT: Don't pause readout for first window, slightly faster
	When WAIT_READOUT_CONTINUE_HIGH =>
	if( internal_READOUT_CONTINUE = '1' ) then 
		next_trig_state <= WAIT_READOUT_CONTINUE_LOW;
	else
		--internal_busy_status <= '0';
		next_trig_state <= WAIT_READOUT_CONTINUE_HIGH;
	end if;
	
	When WAIT_READOUT_CONTINUE_LOW =>
	if( internal_READOUT_CONTINUE = '0' ) then 
		next_trig_state <= START_SROUT;
	else
		next_trig_state <= WAIT_READOUT_CONTINUE_LOW;
	end if;
	
	--LOOP OVER ASICs SERIAL READOUT GOES HERE
	When START_SROUT =>
		internal_smp_stop <= '1';
		internal_dig_start <= '1'; --leave dig start signal high until end of process
		internal_srout_start <= '1';
		internal_EVTBUILD_start <= '0';
		internal_EVTBUILD_MAKE_READY <= '0';
		--internal_busy_status <= '1';
			next_trig_state <= WAIT_SROUT_IDLE_LOW;
	
	--wait for serial readout IDLE_status to go low, ie. digitization starts
	When WAIT_SROUT_IDLE_LOW =>
	if( internal_SROUT_IDLE_status = '1' ) then 
		next_trig_state <= WAIT_SROUT_IDLE_LOW;
	else
		next_trig_state <= WAIT_SROUT_IDLE_HIGH;
	end if;
	
	--wait for digitization IDLE_status to go high, ie. digitization ends
	When WAIT_SROUT_IDLE_HIGH =>
	if( internal_SROUT_IDLE_status = '0' ) then 
		next_trig_state <= WAIT_SROUT_IDLE_HIGH;
	else
		--next_trig_state <= START_EVTBUILD; --go to event builder, doing this here sends packet for each window
		--next_trig_state <= DIG_WINDOW_LOOP; --go back to check if any more windows need digitizing
		next_trig_state <= SROUT_ASIC_LOOP;
	end if;
	
	--start event builder
	When START_EVTBUILD =>
		internal_smp_stop <= '1';
		internal_dig_start <= '0';
		internal_srout_start <= '0';
		internal_EVTBUILD_start <= '1';
		internal_EVTBUILD_MAKE_READY <= '0';
		internal_busy_status <= '0';
			next_trig_state <= WAIT_EVTBUILD_DONE;
			
	--wait for event builder to finish
	When WAIT_EVTBUILD_DONE =>
	INTERNAL_COUNTER <= (Others => '0');
	if( internal_EVTBUILD_DONE_SENDING_EVENT = '0' ) then 
		next_trig_state <= WAIT_EVTBUILD_DONE;
	else
		next_trig_state <= SET_EVTBUILD_MAKE_READY;
	end if;
	
	--send MAKE_READY signal, hand shake for event builder finishing
	When SET_EVTBUILD_MAKE_READY =>
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
	When WAIT_READOUT_RESET =>
		internal_smp_stop <= '1'; --hold sampling, in principle allow testing different write addresses
		internal_dig_start <= '0';
		internal_srout_start <= '0';
		internal_EVTBUILD_start <= '0';
		internal_EVTBUILD_MAKE_READY <= '0';
		internal_busy_status <= '0';
		internal_READOUT_DONE <= '1';
	if( internal_LATCH_DONE = '1' ) then 
		next_trig_state <= WAIT_READOUT_RESET;
	else
		next_trig_state <= Idle;
	end if;
	
	When Others =>
		INTERNAL_COUNTER <= (Others => '0');
		internal_smp_stop <= '0';
		internal_dig_start <= '0';
		internal_srout_start <= '0';
		internal_EVTBUILD_start <= '0';
		internal_EVTBUILD_MAKE_READY <= '0';
		internal_busy_status <= '0';
		internal_READOUT_DONE <= '0';
		next_trig_state <= Idle;
	end Case;
	
end if;
end process;

end Behavioral;

