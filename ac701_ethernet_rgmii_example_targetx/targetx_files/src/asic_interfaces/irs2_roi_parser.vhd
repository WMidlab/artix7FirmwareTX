----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.asic_definitions_irs2_carrier_revA.all;

entity irs2_roi_parser is
	Port ( 
		--Primary clock to run this block
		CLOCK                       : in  STD_LOGIC;
		
		--Signal to begin parsing the trigger memory
		BEGIN_PARSING_FOR_WINDOWS   : in  STD_LOGIC;

		--Signals to control the flow of the parsing.
		--Last sampled window from the sampling block
		LAST_WINDOW_SAMPLED         : in  STD_LOGIC_VECTOR(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
		--Registers set by the user
		FIRST_ALLOWED_WINDOW        : in  STD_LOGIC_VECTOR(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
		LAST_ALLOWED_WINDOW         : in  STD_LOGIC_VECTOR(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
		MAX_WINDOWS_TO_LOOK_BACK    : in  STD_LOGIC_VECTOR(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
		MIN_WINDOWS_TO_LOOK_BACK    : in  STD_LOGIC_VECTOR(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
		ROI_ADDRESS_ADJUST          : in  std_logic_vector(TRIGGER_MEMORY_ADDRESS_BITS-1 downto 0);
		PEDESTAL_WINDOW             : in  STD_LOGIC_VECTOR(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
		PEDESTAL_MODE               : in  STD_LOGIC;
		--Masks to force a readout and prohibit a readout
		FORCE_CHANNEL_MASK          : in  STD_LOGIC_VECTOR(TOTAL_TRIGGER_BITS-1 downto 0);
		IGNORE_CHANNEL_MASK         : in  STD_LOGIC_VECTOR(TOTAL_TRIGGER_BITS-1 downto 0);

		--BRAM interface to read from trigger memory
		TRIGGER_MEMORY_READ_CLOCK   : out STD_LOGIC;
		TRIGGER_MEMORY_READ_ENABLE  : out STD_LOGIC;
		TRIGGER_MEMORY_READ_ADDRESS : out STD_LOGIC_VECTOR(TRIGGER_MEMORY_ADDRESS_BITS-1 downto 0);
		TRIGGER_MEMORY_DATA         : in  STD_LOGIC_VECTOR(TOTAL_TRIGGER_BITS-1 downto 0);
	
		--FIFO interface
		NEXT_WINDOW_FIFO_READ_CLOCK  : in  STD_LOGIC;
		NEXT_WINDOW_FIFO_READ_ENABLE : in  STD_LOGIC;
		NEXT_WINDOW_FIFO_EMPTY       : out STD_LOGIC;
		--This happens to be 16 bits wide right now... I'm keeping the constants here but know
		--that if they happen to change, the FIFO width will need to be changed as well.
		NEXT_WINDOW_FIFO_DATA        : out STD_LOGIC_VECTOR(ANALOG_MEMORY_ADDRESS_BITS+ROW_SELECT_BITS+COL_SELECT_BITS+CH_SELECT_BITS-1 downto 0);
		
		--Outputs that will be needed for building the response
		NUMBER_OF_WAVEFORMS_FOUND_THIS_EVENT : out STD_LOGIC_VECTOR(SEGMENT_COUNTER_BITS-1 downto 0);
		EVENT_WAS_TRUNCATED                  : out STD_LOGIC;
		--Inputs to facilitate flow control
		MAKE_READY_FOR_NEXT_EVENT            : in  STD_LOGIC;
		--Outputs to facilitate flow control
		READY_FOR_TRIGGER                    : out STD_LOGIC;
		DONE_BUILDING_WINDOW_LIST            : out STD_LOGIC;
		VETO_NEW_EVENTS                      : in  STD_LOGIC
	);
end irs2_roi_parser;

architecture Behavioral of irs2_roi_parser is
	signal internal_DONE_BUILDING_WINDOW_LIST          : std_logic;
	signal internal_READY_FOR_TRIGGER                  : std_logic;
	type roi_parser_state is (IDLE, CALCULATE_FIRST_WINDOW, INITIALIZE_CURRENT_WINDOW, READ_NEXT_TRIGGER_WORD, CHECK_EACH_CHANNEL_A, CHECK_EACH_CHANNEL_B, INCREMENT_WINDOW, GENERATE_PEDESTALS, DONE);
	signal internal_ROI_STATE                          : roi_parser_state := IDLE;
	signal internal_ROI_NEXT_STATE                     : roi_parser_state := IDLE;
	signal internal_STARTING_WINDOW                    : unsigned(TRIGGER_MEMORY_ADDRESS_BITS-1 downto 0);
	signal internal_STARTING_WINDOW_REG                : unsigned(TRIGGER_MEMORY_ADDRESS_BITS-1 downto 0);
	signal internal_STARTING_WINDOW_READ_ENABLE        : std_logic := '0';
	signal internal_ENDING_WINDOW                      : unsigned(TRIGGER_MEMORY_ADDRESS_BITS-1 downto 0);
	signal internal_ENDING_WINDOW_REG                  : unsigned(TRIGGER_MEMORY_ADDRESS_BITS-1 downto 0);
	signal internal_ENDING_WINDOW_READ_ENABLE          : std_logic := '0';
	signal internal_CURRENT_WINDOW                     : unsigned(TRIGGER_MEMORY_ADDRESS_BITS-1 downto 0);
	signal internal_CURRENT_WINDOW_COUNT_ENABLE        : std_logic := '0';
	signal internal_CURRENT_WINDOW_INITIALIZE          : std_logic := '0';
	signal internal_CHANNEL_COUNTER                    : unsigned(TOTAL_TRIGGER_BIT_WIDTH-1 downto 0) := (others => '0');
	signal internal_CHANNEL_COUNTER_ENABLE             : std_logic := '0';
	signal internal_CHANNEL_COUNTER_RESET              : std_logic := '1';
	signal internal_SEGMENTS_THIS_EVENT_COUNTER        : unsigned(SEGMENT_COUNTER_BITS-1 downto 0);
	signal internal_SEGMENTS_THIS_EVENT_COUNTER_RESET  : std_logic := '1';
	signal internal_SEGMENTS_THIS_EVENT_COUNTER_ENABLE : std_logic := '0';
	--Read trigger memory blockram interface
	signal internal_TRIGGER_MEMORY_READ_ADDRESS_RAW : std_logic_vector(TRIGGER_MEMORY_ADDRESS_BITS-1 downto 0) := (others => '0');
	signal internal_TRIGGER_MEMORY_READ_ADDRESS_ADJ : std_logic_vector(TRIGGER_MEMORY_ADDRESS_BITS-1 downto 0) := (others => '0');
	signal internal_TRIGGER_MEMORY_WORD           : std_logic_vector(TOTAL_TRIGGER_BITS-1 downto 0);
	signal internal_TRIGGER_MEMORY_WORD_MASKED    : std_logic_vector(TOTAL_TRIGGER_BITS-1 downto 0);
	signal internal_TRIGGER_MEMORY_READ_ENABLE    : std_logic := '0';
	signal internal_THIS_TRIGGER_BIT              : std_logic := '0';
	signal internal_THIS_TRIGGER_BIT_FORCED       : std_logic := '0';
	signal internal_THIS_PEDESTAL_BIT             : std_logic := '0';
	--Digitization window FIFO interface
	signal internal_NEXT_WINDOW_FIFO_WRITE_DATA   : std_logic_vector(COL_SELECT_BITS+ROW_SELECT_BITS+CH_SELECT_BITS+ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
	signal internal_NEXT_WINDOW_FIFO_WRITE_DATA_A : std_logic_vector(COL_SELECT_BITS+ROW_SELECT_BITS+CH_SELECT_BITS+ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
	signal internal_NEXT_WINDOW_FIFO_WRITE_DATA_B : std_logic_vector(COL_SELECT_BITS+ROW_SELECT_BITS+CH_SELECT_BITS+ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
	signal internal_NEXT_WINDOW_FIFO_WRITE_DATA_PEDESTALS : std_logic_vector(COL_SELECT_BITS+ROW_SELECT_BITS+CH_SELECT_BITS+ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
	signal internal_NEXT_WINDOW_FIFO_MUX_SELECT   : std_logic;
	signal internal_NEXT_WINDOW_FIFO_WRITE_ENABLE : std_logic := '0';
	signal internal_NEXT_WINDOW_FIFO_FULL         : std_logic := '0';
	signal internal_NEXT_WINDOW_FIFO_RESET        : std_logic := '0';
	
	-- Signals for adjusting the region of interest
	signal internal_BASE_ADDRESS_SIGNED                   : signed(TRIGGER_MEMORY_ADDRESS_BITS-1+2 downto 0);  --Sign extend by two bits
	signal internal_ADJUSTED_ADDRESS_SIGNED               : signed(TRIGGER_MEMORY_ADDRESS_BITS-1+2 downto 0);  
	signal internal_ADDRESS_ADJUST_SIGNED                 : signed(TRIGGER_MEMORY_ADDRESS_BITS-1+2 downto 0);  --Sign extend the user register
	signal internal_MAX_ADDRESS_SIGNED                    : signed(TRIGGER_MEMORY_ADDRESS_BITS-1+2 downto 0);
	signal internal_MIN_ADDRESS_SIGNED                    : signed(TRIGGER_MEMORY_ADDRESS_BITS-1+2 downto 0);
	signal internal_MAX_MINUS_MIN_PLUS_ONE                : signed(TRIGGER_MEMORY_ADDRESS_BITS-1+2 downto 0);
	signal internal_TRIGGER_MEMORY_READ_ADDRESS_TOO_HIGH  : signed(TRIGGER_MEMORY_ADDRESS_BITS-1+2 downto 0);
	signal internal_TRIGGER_MEMORY_READ_ADDRESS_TOO_LOW   : signed(TRIGGER_MEMORY_ADDRESS_BITS-1+2 downto 0);
	signal internal_OUTSIDE_OF_RANGE                      : std_logic_vector(1 downto 0);
	
	-- Chipscope debugging signals
	signal internal_CHIPSCOPE_CONTROL : std_logic_vector(35 downto 0);
	signal internal_CHIPSCOPE_ILA     : std_logic_vector(127 downto 0);
	signal internal_CHIPSCOPE_ILA_REG : std_logic_vector(127 downto 0);
	
begin
	--Wiring to the ports
	internal_TRIGGER_MEMORY_WORD <= TRIGGER_MEMORY_DATA;
	TRIGGER_MEMORY_READ_ENABLE   <= internal_TRIGGER_MEMORY_READ_ENABLE;
	TRIGGER_MEMORY_READ_ADDRESS  <= internal_TRIGGER_MEMORY_READ_ADDRESS_ADJ;
	TRIGGER_MEMORY_READ_CLOCK    <= CLOCK;
	NUMBER_OF_WAVEFORMS_FOUND_THIS_EVENT <= std_logic_vector(internal_SEGMENTS_THIS_EVENT_COUNTER);
	DONE_BUILDING_WINDOW_LIST    <= internal_DONE_BUILDING_WINDOW_LIST;
	READY_FOR_TRIGGER            <= internal_READY_FOR_TRIGGER;
	--Mask in or out the bits we want for the trigger memory word
	gen_trigger_memory_mask : for i in 0 to TOTAL_TRIGGER_BITS-1 generate
		internal_TRIGGER_MEMORY_WORD_MASKED(i) <= (internal_TRIGGER_MEMORY_WORD(i) and not(IGNORE_CHANNEL_MASK(i)));
	end generate;

	--State outputs
	process(internal_ROI_STATE, internal_THIS_TRIGGER_BIT, internal_THIS_TRIGGER_BIT_FORCED, internal_THIS_PEDESTAL_BIT, internal_SEGMENTS_THIS_EVENT_COUNTER) begin
		--Default levels for various components of the logic
		internal_CHANNEL_COUNTER_RESET              <= '0';
		internal_CHANNEL_COUNTER_ENABLE             <= '0';
		internal_CURRENT_WINDOW_INITIALIZE          <= '0';
		internal_CURRENT_WINDOW_COUNT_ENABLE        <= '0';
		internal_STARTING_WINDOW_READ_ENABLE        <= '0';
		internal_ENDING_WINDOW_READ_ENABLE          <= '0';
		internal_NEXT_WINDOW_FIFO_WRITE_ENABLE      <= '0';
		internal_SEGMENTS_THIS_EVENT_COUNTER_RESET  <= '0';
		internal_SEGMENTS_THIS_EVENT_COUNTER_ENABLE <= '0';
		internal_TRIGGER_MEMORY_READ_ENABLE         <= '0';
		internal_NEXT_WINDOW_FIFO_MUX_SELECT        <= '0';
		internal_READY_FOR_TRIGGER                  <= '0';
		internal_DONE_BUILDING_WINDOW_LIST          <= '0';
		internal_NEXT_WINDOW_FIFO_RESET             <= '0';
		--
		case(internal_ROI_STATE) is
			when IDLE =>
				internal_READY_FOR_TRIGGER <= '1';
				--Otherwise just use the defaults in IDLE state
			when CALCULATE_FIRST_WINDOW =>
				internal_SEGMENTS_THIS_EVENT_COUNTER_RESET <= '1';
				internal_CHANNEL_COUNTER_RESET             <= '1';
				internal_STARTING_WINDOW_READ_ENABLE       <= '1';
				internal_ENDING_WINDOW_READ_ENABLE         <= '1';
				--Reset the FIFO here just in case we have junk left over from previous events. Should never happen, but might as well be safe.
				internal_NEXT_WINDOW_FIFO_RESET            <= '1';  
			when INITIALIZE_CURRENT_WINDOW =>
				internal_CURRENT_WINDOW_INITIALIZE   <= '1';
			when READ_NEXT_TRIGGER_WORD =>
				internal_TRIGGER_MEMORY_READ_ENABLE  <= '1';
			when CHECK_EACH_CHANNEL_A =>
				internal_CHANNEL_COUNTER_ENABLE      <= '1';
				if ( (internal_THIS_TRIGGER_BIT = '1') and (unsigned(internal_SEGMENTS_THIS_EVENT_COUNTER) /= MAXIMUM_SEGMENTS_PER_EVENT) ) then
					internal_NEXT_WINDOW_FIFO_WRITE_ENABLE <= '1';
					internal_SEGMENTS_THIS_EVENT_COUNTER_ENABLE <= '1';
				end if;
			when CHECK_EACH_CHANNEL_B =>
				internal_CHANNEL_COUNTER_ENABLE      <= '1';
				internal_NEXT_WINDOW_FIFO_MUX_SELECT <= '1';
				--When trigger bits are forced, only check them during the "B" cycle, or we'll end up writing multiple windows repeatedly.
				if ( (internal_THIS_TRIGGER_BIT = '1' or internal_THIS_TRIGGER_BIT_FORCED = '1') and (unsigned(internal_SEGMENTS_THIS_EVENT_COUNTER) /= MAXIMUM_SEGMENTS_PER_EVENT) ) then
					internal_NEXT_WINDOW_FIFO_WRITE_ENABLE <= '1';
					internal_SEGMENTS_THIS_EVENT_COUNTER_ENABLE <= '1';
				end if;
			when INCREMENT_WINDOW =>
				internal_CURRENT_WINDOW_COUNT_ENABLE <= '1';
				internal_CHANNEL_COUNTER_RESET       <= '1';
			when GENERATE_PEDESTALS =>
				internal_CHANNEL_COUNTER_ENABLE      <= '1';
				if ( (internal_THIS_PEDESTAL_BIT = '1') ) then
					internal_NEXT_WINDOW_FIFO_WRITE_ENABLE <= '1';
					internal_SEGMENTS_THIS_EVENT_COUNTER_ENABLE <= '1';
				end if;
			when DONE => 
				internal_DONE_BUILDING_WINDOW_LIST <= '1';
			when others =>
		end case;		
	end process;
	--Next state logic
	process(internal_ROI_STATE, BEGIN_PARSING_FOR_WINDOWS, internal_TRIGGER_MEMORY_WORD_MASKED, internal_CHANNEL_COUNTER, internal_CURRENT_WINDOW, internal_ENDING_WINDOW_REG, VETO_NEW_EVENTS, PEDESTAL_MODE, MAKE_READY_FOR_NEXT_EVENT, FORCE_CHANNEL_MASK) begin
		case(internal_ROI_STATE) is
			when IDLE =>
				if (BEGIN_PARSING_FOR_WINDOWS = '1' and VETO_NEW_EVENTS = '0') then
					internal_ROI_NEXT_STATE <= CALCULATE_FIRST_WINDOW;
				else
					internal_ROI_NEXT_STATE <= IDLE;
				end if;
			when CALCULATE_FIRST_WINDOW =>
				if (PEDESTAL_MODE = '1') then
					internal_ROI_NEXT_STATE <= GENERATE_PEDESTALS;
				else
					internal_ROI_NEXT_STATE <= INITIALIZE_CURRENT_WINDOW;
				end if;
			when INITIALIZE_CURRENT_WINDOW =>
				internal_ROI_NEXT_STATE <= READ_NEXT_TRIGGER_WORD;
			when READ_NEXT_TRIGGER_WORD =>
				internal_ROI_NEXT_STATE <= CHECK_EACH_CHANNEL_A;
			when CHECK_EACH_CHANNEL_A =>
				if ( unsigned(internal_TRIGGER_MEMORY_WORD_MASKED) = 0  and unsigned(FORCE_CHANNEL_MASK) = 0) then 
					--No trigger bits to process, skip ahead to next address
					internal_ROI_NEXT_STATE <= INCREMENT_WINDOW;
				elsif ( internal_CHANNEL_COUNTER = to_unsigned(TOTAL_TRIGGER_BITS-1,internal_CHANNEL_COUNTER'length) ) then
					internal_ROI_NEXT_STATE <= CHECK_EACH_CHANNEL_B;
				else
					internal_ROI_NEXT_STATE <= CHECK_EACH_CHANNEL_A;
				end if;
			when CHECK_EACH_CHANNEL_B =>
				if ( internal_CHANNEL_COUNTER = to_unsigned(TOTAL_TRIGGER_BITS-1,internal_CHANNEL_COUNTER'length) ) then
					internal_ROI_NEXT_STATE <= INCREMENT_WINDOW;
				else
					internal_ROI_NEXT_STATE <= CHECK_EACH_CHANNEL_B;
				end if;
			when INCREMENT_WINDOW =>
				if ( internal_CURRENT_WINDOW = internal_ENDING_WINDOW_REG ) then
					internal_ROI_NEXT_STATE <= DONE;
				else
					internal_ROI_NEXT_STATE <= READ_NEXT_TRIGGER_WORD;
				end if;
			when GENERATE_PEDESTALS =>
				if ( internal_CHANNEL_COUNTER = to_unsigned(TOTAL_TRIGGER_BITS-1,internal_CHANNEL_COUNTER'length) ) then
					internal_ROI_NEXT_STATE <= DONE;
				else
					internal_ROI_NEXT_STATE <= GENERATE_PEDESTALS;
				end if;				
			when DONE =>
				if (MAKE_READY_FOR_NEXT_EVENT = '1') then
					internal_ROI_NEXT_STATE <= IDLE;
				else
					internal_ROI_NEXT_STATE <= DONE;
				end if;
			when others =>
				internal_ROI_NEXT_STATE <= IDLE;
		end case;
	end process;
	--Register next state
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			internal_ROI_STATE <= internal_ROI_NEXT_STATE;
		end if;
	end process;


	--Asynchronous logic to calculate starting and ending windows
	process(LAST_WINDOW_SAMPLED, MAX_WINDOWS_TO_LOOK_BACK, MIN_WINDOWS_TO_LOOK_BACK, FIRST_ALLOWED_WINDOW, LAST_ALLOWED_WINDOW) begin
		--Starting window
		if (unsigned(LAST_WINDOW_SAMPLED) < unsigned(FIRST_ALLOWED_WINDOW) + unsigned(MAX_WINDOWS_TO_LOOK_BACK)) then
			internal_STARTING_WINDOW <= (unsigned(LAST_ALLOWED_WINDOW) + unsigned(LAST_WINDOW_SAMPLED) - unsigned(FIRST_ALLOWED_WINDOW) - unsigned(MAX_WINDOWS_TO_LOOK_BACK) + 1) & '0';
		else
			internal_STARTING_WINDOW <= (unsigned(LAST_WINDOW_SAMPLED) - unsigned(MAX_WINDOWS_TO_LOOK_BACK)) & '0';
		end if;
		--Ending window
		if (unsigned(LAST_WINDOW_SAMPLED) < unsigned(FIRST_ALLOWED_WINDOW) + unsigned(MIN_WINDOWS_TO_LOOK_BACK)) then
			internal_ENDING_WINDOW <= (unsigned(LAST_ALLOWED_WINDOW) + unsigned(LAST_WINDOW_SAMPLED) - unsigned(FIRST_ALLOWED_WINDOW) - unsigned(MIN_WINDOWS_TO_LOOK_BACK) + 1) & '1';
		else
			internal_ENDING_WINDOW <= (unsigned(LAST_WINDOW_SAMPLED) - unsigned(MIN_WINDOWS_TO_LOOK_BACK)) & '1';
		end if;
	end process;
	

	--Synchronous processes to grab the window to be used
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			if (internal_STARTING_WINDOW_READ_ENABLE = '1') then
				internal_STARTING_WINDOW_REG <= internal_STARTING_WINDOW;
			end if;
			if (internal_ENDING_WINDOW_READ_ENABLE = '1') then
				internal_ENDING_WINDOW_REG   <= internal_ENDING_WINDOW;
			end if;
		end if;
	end process;
	
	--Counter for the current window with set and overflow checking
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			if (internal_CURRENT_WINDOW_INITIALIZE = '1') then
				internal_CURRENT_WINDOW <= internal_STARTING_WINDOW_REG;
			elsif (internal_CURRENT_WINDOW_COUNT_ENABLE = '1') then
				if (internal_CURRENT_WINDOW < unsigned(LAST_ALLOWED_WINDOW & '1')) then
					internal_CURRENT_WINDOW <= internal_CURRENT_WINDOW + 1;
				else 
					internal_CURRENT_WINDOW <= unsigned(FIRST_ALLOWED_WINDOW & '0');
				end if;
			end if;
		end if;
	end process;
	--Map the current window to the trigger memory.  This is adjusted with the user selectable lookback
	--later in this block.
	internal_TRIGGER_MEMORY_READ_ADDRESS_RAW <= std_logic_vector(internal_CURRENT_WINDOW);
	--Logic for the current trigger bit
	process(internal_TRIGGER_MEMORY_WORD_MASKED, internal_CHANNEL_COUNTER) begin
		internal_THIS_TRIGGER_BIT        <= internal_TRIGGER_MEMORY_WORD_MASKED(to_integer(internal_CHANNEL_COUNTER));
	end process;
	--Logic for the current pedestal bit or the force channel bit
	process(FORCE_CHANNEL_MASK, internal_CHANNEL_COUNTER, internal_CURRENT_WINDOW) begin
		internal_THIS_PEDESTAL_BIT      <= FORCE_CHANNEL_MASK(to_integer(internal_CHANNEL_COUNTER));
		internal_THIS_TRIGGER_BIT_FORCED <= FORCE_CHANNEL_MASK(to_integer(internal_CHANNEL_COUNTER)) and not(internal_CURRENT_WINDOW(0));
	end process;

	--The word that would be written to the FIFO if we see something
	--These are for the "A" cycle
	process(internal_CHANNEL_COUNTER, internal_CURRENT_WINDOW) begin
		if (internal_CURRENT_WINDOW(0) = '0') then
			internal_NEXT_WINDOW_FIFO_WRITE_DATA_A <= std_logic_vector(internal_CHANNEL_COUNTER) & std_logic_vector(internal_CURRENT_WINDOW(internal_CURRENT_WINDOW'length-1 downto 1) - 1);
		else
			internal_NEXT_WINDOW_FIFO_WRITE_DATA_A <= std_logic_vector(internal_CHANNEL_COUNTER) & std_logic_vector(internal_CURRENT_WINDOW(internal_CURRENT_WINDOW'length-1 downto 1));
		end if;
	end process;
	--These are for the "B" cycle
	process(internal_CHANNEL_COUNTER, internal_CURRENT_WINDOW) begin
		if (internal_CURRENT_WINDOW(0) = '0') then
			internal_NEXT_WINDOW_FIFO_WRITE_DATA_B <= std_logic_vector(internal_CHANNEL_COUNTER) & std_logic_vector(internal_CURRENT_WINDOW(internal_CURRENT_WINDOW'length-1 downto 1));
		else
			internal_NEXT_WINDOW_FIFO_WRITE_DATA_B <= std_logic_vector(internal_CHANNEL_COUNTER) & std_logic_vector(internal_CURRENT_WINDOW(internal_CURRENT_WINDOW'length-1 downto 1) + 1);
		end if;
	end process;
	--These are if you're taking pedestals
	process(internal_CHANNEL_COUNTER, PEDESTAL_WINDOW) begin
		internal_NEXT_WINDOW_FIFO_WRITE_DATA_PEDESTALS <= std_logic_vector(internal_CHANNEL_COUNTER) & std_logic_vector(PEDESTAL_WINDOW);
	end process;
	--Multiplexer to select "A" or "B" or pedestal windows
	internal_NEXT_WINDOW_FIFO_WRITE_DATA <= internal_NEXT_WINDOW_FIFO_WRITE_DATA_PEDESTALS when PEDESTAL_MODE = '1' else
	                                        internal_NEXT_WINDOW_FIFO_WRITE_DATA_A         when internal_NEXT_WINDOW_FIFO_MUX_SELECT = '0' else
	                                        internal_NEXT_WINDOW_FIFO_WRITE_DATA_B         when internal_NEXT_WINDOW_FIFO_MUX_SELECT = '1' else
														 (others => 'X');

	--Flag for truncated output
	process(internal_SEGMENTS_THIS_EVENT_COUNTER) begin
		if ( internal_SEGMENTS_THIS_EVENT_COUNTER >= MAXIMUM_SEGMENTS_PER_EVENT )	then
			EVENT_WAS_TRUNCATED <= '1';
		else
			EVENT_WAS_TRUNCATED <= '0';
		end if;
	end process;
	--Counters (channel counter and segment counter)
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			if (internal_SEGMENTS_THIS_EVENT_COUNTER_RESET = '1') then
				internal_SEGMENTS_THIS_EVENT_COUNTER <= (others => '0');
			elsif (internal_SEGMENTS_THIS_EVENT_COUNTER_ENABLE = '1' and internal_SEGMENTS_THIS_EVENT_COUNTER /= MAXIMUM_SEGMENTS_PER_EVENT ) then
				internal_SEGMENTS_THIS_EVENT_COUNTER <= internal_SEGMENTS_THIS_EVENT_COUNTER + 1;
			end if;
		end if;
	end process;
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			if (internal_CHANNEL_COUNTER_RESET = '1') then
				internal_CHANNEL_COUNTER <= (others => '0');
			elsif (internal_CHANNEL_COUNTER_ENABLE = '1') then
				internal_CHANNEL_COUNTER <= internal_CHANNEL_COUNTER + 1;
			end if;
		end if;	
	end process;


	--Calculate the adjusted versions including the user offset.
	--These change every time the base read address changes
	internal_BASE_ADDRESS_SIGNED                   <= signed(resize(unsigned(internal_TRIGGER_MEMORY_READ_ADDRESS_RAW),internal_BASE_ADDRESS_SIGNED'length));
	internal_ADJUSTED_ADDRESS_SIGNED               <= internal_BASE_ADDRESS_SIGNED + internal_ADDRESS_ADJUST_SIGNED;
	internal_TRIGGER_MEMORY_READ_ADDRESS_TOO_HIGH  <= internal_ADJUSTED_ADDRESS_SIGNED - internal_MAX_MINUS_MIN_PLUS_ONE;
	internal_TRIGGER_MEMORY_READ_ADDRESS_TOO_LOW   <= internal_ADJUSTED_ADDRESS_SIGNED + internal_MAX_MINUS_MIN_PLUS_ONE;
	--These change only when user registers change
	internal_ADDRESS_ADJUST_SIGNED   <= resize(signed(ROI_ADDRESS_ADJUST),internal_ADDRESS_ADJUST_SIGNED'length);
	internal_MAX_ADDRESS_SIGNED      <= signed(resize(unsigned(LAST_ALLOWED_WINDOW & '1'),internal_MAX_ADDRESS_SIGNED'length));
	internal_MIN_ADDRESS_SIGNED      <= signed(resize(unsigned(FIRST_ALLOWED_WINDOW & '0'),internal_MIN_ADDRESS_SIGNED'length));
	internal_MAX_MINUS_MIN_PLUS_ONE  <= internal_MAX_ADDRESS_SIGNED - internal_MIN_ADDRESS_SIGNED + 1;
	--Logic to see if we're on the high or low side of the range
	process(internal_ADJUSTED_ADDRESS_SIGNED, internal_MAX_ADDRESS_SIGNED, internal_MIN_ADDRESS_SIGNED) begin
		if (internal_ADJUSTED_ADDRESS_SIGNED > internal_MAX_ADDRESS_SIGNED) then
			internal_OUTSIDE_OF_RANGE <= "01";
		elsif (internal_ADJUSTED_ADDRESS_SIGNED < internal_MIN_ADDRESS_SIGNED) then
			internal_OUTSIDE_OF_RANGE <= "10";
		else
			internal_OUTSIDE_OF_RANGE <= "00";
		end if;
	end process;	
	--Multiplex to select the output
	internal_TRIGGER_MEMORY_READ_ADDRESS_ADJ <= std_logic_vector(internal_TRIGGER_MEMORY_READ_ADDRESS_TOO_HIGH(internal_TRIGGER_MEMORY_READ_ADDRESS_ADJ'length-1 downto 0)) when (internal_OUTSIDE_OF_RANGE = "01") else
	                                            std_logic_vector(internal_TRIGGER_MEMORY_READ_ADDRESS_TOO_LOW(internal_TRIGGER_MEMORY_READ_ADDRESS_ADJ'length-1 downto 0))  when (internal_OUTSIDE_OF_RANGE = "10") else
	                                            std_logic_vector(internal_ADJUSTED_ADDRESS_SIGNED(internal_TRIGGER_MEMORY_READ_ADDRESS_ADJ'length-1 downto 0));


	--Instantiate the FIFO where we write the windows to be digitized
	map_next_window_to_digitize_fifo : entity work.window_to_read_fifo
	port map(
		rst    => '0',
		wr_clk => CLOCK,
		rd_clk => NEXT_WINDOW_FIFO_READ_CLOCK,
		din    => internal_NEXT_WINDOW_FIFO_WRITE_DATA,
		wr_en  => internal_NEXT_WINDOW_FIFO_WRITE_ENABLE,
		rd_en  => NEXT_WINDOW_FIFO_READ_ENABLE,
		dout   => NEXT_WINDOW_FIFO_DATA,
		full   => open,
		empty  => NEXT_WINDOW_FIFO_EMPTY,
		valid  => open
	);
	
	--DEBUGGING CRAP
	--map_ILA : entity work.s6_ila
	--port map (
	--	CONTROL => internal_CHIPSCOPE_CONTROL,
	--	CLK     => CLOCK,
	--	TRIG0   => internal_CHIPSCOPE_ILA_REG
	--);
	--map_ICON : entity work.s6_icon
	--port map (
	--	CONTROL0 => internal_CHIPSCOPE_CONTROL
	--);
	
	--Workaround for CS/picoblaze stupidness
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			internal_CHIPSCOPE_ILA_REG <= internal_CHIPSCOPE_ILA;
		end if;
	end process;
	
	internal_CHIPSCOPE_ILA( 9 downto  0) <= internal_TRIGGER_MEMORY_READ_ADDRESS_RAW;
	internal_CHIPSCOPE_ILA(17 downto 10) <= internal_TRIGGER_MEMORY_WORD(7 downto 0);
	internal_CHIPSCOPE_ILA(18) <= internal_CHANNEL_COUNTER_RESET;                     
	internal_CHIPSCOPE_ILA(19) <= internal_CHANNEL_COUNTER_ENABLE;                      
	internal_CHIPSCOPE_ILA(26 downto 20) <= std_logic_vector(internal_CHANNEL_COUNTER);
	internal_CHIPSCOPE_ILA(27) <= BEGIN_PARSING_FOR_WINDOWS;
	internal_CHIPSCOPE_ILA(28) <= MAKE_READY_FOR_NEXT_EVENT;
	internal_CHIPSCOPE_ILA(29) <= VETO_NEW_EVENTS;
	internal_CHIPSCOPE_ILA(30) <= internal_DONE_BUILDING_WINDOW_LIST;
	internal_CHIPSCOPE_ILA(31) <= internal_READY_FOR_TRIGGER;
	internal_CHIPSCOPE_ILA(47 downto 32) <= internal_NEXT_WINDOW_FIFO_WRITE_DATA;
	internal_CHIPSCOPE_ILA(48) <= internal_NEXT_WINDOW_FIFO_WRITE_ENABLE;
	internal_CHIPSCOPE_ILA(58 downto 49) <= std_logic_vector(internal_ENDING_WINDOW_REG);
	internal_CHIPSCOPE_ILA(59) <= internal_CURRENT_WINDOW_INITIALIZE;
	internal_CHIPSCOPE_ILA(60) <= internal_CURRENT_WINDOW_COUNT_ENABLE;
	internal_CHIPSCOPE_ILA(70 downto 61) <= std_logic_vector(internal_CURRENT_WINDOW);
	internal_CHIPSCOPE_ILA(79 downto 71) <= LAST_WINDOW_SAMPLED;
	internal_CHIPSCOPE_ILA(89 downto 80) <= internal_TRIGGER_MEMORY_READ_ADDRESS_ADJ;

end Behavioral;