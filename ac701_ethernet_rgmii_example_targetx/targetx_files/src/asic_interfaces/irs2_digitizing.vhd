----------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.asic_definitions_irs2_carrier_revA.all;
use work.readout_definitions.all;

entity irs2_digitizing is
	Port ( 
		--Inputs for running the digitizing state machine
		CLOCK                                 : in  STD_LOGIC;
		--Interface to the ROI recorder
		NEXT_WINDOW_FIFO_READ_CLOCK           : out std_logic;
		NEXT_WINDOW_FIFO_READ_ENABLE          : out std_logic;
		NEXT_WINDOW_FIFO_EMPTY                : in  std_logic;
		NEXT_WINDOW_FIFO_DATA                 : in  STD_LOGIC_VECTOR(ANALOG_MEMORY_ADDRESS_BITS+ROW_SELECT_BITS+COL_SELECT_BITS+CH_SELECT_BITS-1 downto 0);
		ROI_PARSER_READY_FOR_TRIGGER          : in  std_logic;
		--Input ports for data to be written to packets
		EVENT_NUMBER_WORD                     : in  STD_LOGIC_VECTOR(31 downto 0);
		SCROD_REV_AND_ID_WORD                 : in  STD_LOGIC_VECTOR(31 downto 0);
		REFERENCE_WINDOW                      : in  STD_LOGIC_VECTOR(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
		--FIFO outputs to packet builder
		WAVEFORM_DATA_OUT                     : out STD_LOGIC_VECTOR(31 downto 0);
		WAVEFORM_DATA_EMPTY                   : out STD_LOGIC;
		WAVEFORM_DATA_READ_CLOCK              : in  STD_LOGIC;
		WAVEFORM_DATA_READ_ENABLE             : in  STD_LOGIC;
		WAVEFORM_DATA_VALID                   : out STD_LOGIC;
		--Status outputs to the packet builder
		DIGITIZER_BUSY                        : out STD_LOGIC;
		--Outputs to the ASIC (or daughter cards)
		ASIC_STORAGE_TO_WILK_ADDRESS          : out STD_LOGIC_VECTOR(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
		ASIC_STORAGE_TO_WILK_ADDRESS_ENABLE   : out STD_LOGIC;
		ASIC_STORAGE_TO_WILK_ENABLE           : out STD_LOGIC;
		ASIC_WILK_COUNTER_RESET               : out STD_LOGIC;
		ASIC_WILK_COUNTER_START               : out ASIC_START_C;
--		ASIC_WILK_COUNTER_START               : out STD_LOGIC_VECTOR(3 downto 0);  --For simulation
		ASIC_WILK_RAMP_ACTIVE                 : out STD_LOGIC;
		ASIC_READOUT_CHANNEL_ADDRESS          : out STD_LOGIC_VECTOR(CH_SELECT_BITS-1 downto 0);
		ASIC_READOUT_SAMPLE_ADDRESS           : out STD_LOGIC_VECTOR(SAMPLE_SELECT_BITS-1 downto 0);
		ASIC_READOUT_ENABLE                   : out STD_LOGIC;
		ASIC_READOUT_TRISTATE_DISABLE         : out Column_Row_Enables;
--		ASIC_READOUT_TRISTATE_DISABLE         : out STD_LOGIC_VECTOR(3 downto 0); --For simulation
		--Inputs from the ASIC
		ASIC_READOUT_DATA                     : in  ASIC_DATA_C
--		ASIC_READOUT_DATA                     : in  STD_LOGIC_VECTOR(11 downto 0) --For simulation
	);
end irs2_digitizing;

architecture Behavioral of irs2_digitizing is
	constant target_WILKINSON_COUNT : integer := 310;  --Number of cycles to run the Wilkinson counter, 310 @ 50 MHz is ~6.2 us
--	constant target_WILKINSON_COUNT : integer := 10; --Shorter version for simulation
	signal internal_CHECKSUM        : unsigned(31 downto 0) := (others => '0');
	signal internal_CHECKSUM_RESET  : std_logic := '0';

	type digitizing_state is (IDLE, READ_NEXT_MEMORY_ADDRESS, CHECK_IF_DIGITIZED, DIGITIZE, BUILD_PACKET_HEADER, READOUT_EVEN, READOUT_ODD, WRITE_ADC_VALUE, WRITE_CHECKSUM);
	signal internal_DIGITIZING_STATE      : digitizing_state := IDLE;
	signal internal_NEXT_DIGITIZING_STATE : digitizing_state := IDLE;
	
	signal internal_WILKINSON_COUNTER        : unsigned(8 downto 0) := (others => '0');
	signal internal_WILKINSON_COUNTER_ENABLE : std_logic := '0';
	signal internal_WILKINSON_COUNTER_RESET  : std_logic := '0';

	signal internal_PACKET_COUNTER           : unsigned(8 downto 0) := (others => '0');
	signal internal_PACKET_COUNTER_ENABLE    : std_logic := '0';
	signal internal_PACKET_COUNTER_RESET     : std_logic := '0';

	signal internal_SAMPLE_COUNTER           : unsigned(SAMPLE_SELECT_BITS-1 downto 0) := (others => '0');
	signal internal_SAMPLE_COUNTER_ENABLE    : std_logic := '0';
	signal internal_SAMPLE_COUNTER_RESET     : std_logic := '0';
	
	signal internal_NEXT_ADDRESS_TO_READ     : STD_LOGIC_VECTOR(ANALOG_MEMORY_ADDRESS_BITS+ROW_SELECT_BITS+COL_SELECT_BITS+CH_SELECT_BITS-1 downto 0);
	signal internal_CHANNEL_TO_READ          : STD_LOGIC_VECTOR(CH_SELECT_BITS-1 downto 0);
	signal internal_ROW_TO_READ              : STD_LOGIC_VECTOR(ROW_SELECT_BITS-1 downto 0);
	signal internal_COL_TO_READ              : STD_LOGIC_VECTOR(COL_SELECT_BITS-1 downto 0);	
	signal internal_ADDR_TO_READ             : STD_LOGIC_VECTOR(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);	
	signal internal_LAST_ADDRESS_DIGITIZED   : STD_LOGIC_VECTOR(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);	
	signal internal_NEXT_ADDRESS_READ_ENABLE : STD_LOGIC := '0';

	--Single start that will be mapped out to all columsn
	signal internal_ASIC_WILK_COUNTER_START  : std_logic := '0';

	--Signals to choose which column we're reading from
	signal internal_SINGLE_ASIC_READOUT_DATA : STD_LOGIC_VECTOR(11 downto 0);

	--Word for packing two ADC values into a word
	signal internal_ADC_VALUES               : STD_LOGIC_VECTOR(31 downto 0);
	signal internal_ADC_EVEN_READ_ENABLE     : STD_LOGIC := '0';
	signal internal_ADC_ODD_READ_ENABLE      : STD_LOGIC := '0';

	--A set-reset flip flop to ensure that we always digitize the first window of any event
	signal internal_FORCE_NEXT_DIGITIZE               : std_logic := '1';
	signal internal_CLEAR_FORCE_NEXT_DIGITIZE         : std_logic := '0';
	signal internal_ROI_PARSER_READY_FOR_TRIGGER      : std_logic := '0';
	signal internal_ROI_PARSER_READY_FOR_TRIGGER_LAST : std_logic := '0';

	--FIFO write interface
	signal internal_WAVEFORM_FIFO_WRITE_ENABLE : std_logic := '0';
	signal internal_WAVEFORM_FIFO_WRITE_DATA   : std_logic_vector(31 downto 0) := (others => '0');

begin
	--Mapping to the top level ports
	NEXT_WINDOW_FIFO_READ_CLOCK  <= CLOCK;
	ASIC_STORAGE_TO_WILK_ADDRESS <= internal_ADDR_TO_READ;
	ASIC_READOUT_CHANNEL_ADDRESS <= internal_CHANNEL_TO_READ;
	ASIC_READOUT_SAMPLE_ADDRESS  <= std_logic_vector(internal_SAMPLE_COUNTER);
	--Output enables for the tristates on the ASIC data buses
	--We could technically readout multiple columns simultaneously, but let's start simple...
	process(internal_COL_TO_READ,internal_ROW_TO_READ) begin
		for col in 0 to ASICS_PER_ROW-1 loop
			for row in 0 to ROWS_PER_COL-1 loop
				if (internal_COL_TO_READ = std_logic_vector(to_unsigned(col,internal_COL_TO_READ'length)) and
				      internal_ROW_TO_READ = std_logic_vector(to_unsigned(row,internal_COL_TO_READ'length)) ) then
					 ASIC_READOUT_TRISTATE_DISABLE(col)(row) <= '0';
				else
					 ASIC_READOUT_TRISTATE_DISABLE(col)(row) <= '1';					
				end if;
			end loop;
		end loop;
	end process;
--	--Simulation version of above
--	process(internal_COL_TO_READ,internal_ROW_TO_READ) begin
--		for col in 0 to ASICS_PER_ROW-1 loop
--				if (internal_COL_TO_READ = std_logic_vector(to_unsigned(col,internal_COL_TO_READ'length))) then
--					 ASIC_READOUT_TRISTATE_DISABLE(col) <= '0';
--				else
--					 ASIC_READOUT_TRISTATE_DISABLE(col) <= '1';					
--				end if;				
--		end loop;
--	end process;

	--Let's also choose which column we're reading out here
	process(internal_COL_TO_READ, ASIC_READOUT_DATA) begin
		internal_SINGLE_ASIC_READOUT_DATA <= ASIC_READOUT_DATA(to_integer(unsigned(internal_COL_TO_READ)));
	end process;
-- Simulation-friendly version of above
--	internal_SINGLE_ASIC_READOUT_DATA <= ASIC_READOUT_DATA;
	--Map the start signal out to all columns
	map_wilk_start_col : for col in 0 to ASICS_PER_ROW-1 generate
		ASIC_WILK_COUNTER_START(col) <= internal_ASIC_WILK_COUNTER_START;
	end generate;

	--State output logic
	process(internal_DIGITIZING_STATE, NEXT_WINDOW_FIFO_EMPTY, internal_FORCE_NEXT_DIGITIZE, internal_ADDR_TO_READ, internal_LAST_ADDRESS_DIGITIZED, internal_WILKINSON_COUNTER) begin
		--Defaults
		internal_CLEAR_FORCE_NEXT_DIGITIZE  <= '0';
		internal_WILKINSON_COUNTER_ENABLE   <= '0';
		internal_WILKINSON_COUNTER_RESET    <= '0';
		internal_SAMPLE_COUNTER_ENABLE      <= '0';
		internal_SAMPLE_COUNTER_RESET       <= '0';
		internal_PACKET_COUNTER_ENABLE      <= '0';
		internal_PACKET_COUNTER_RESET       <= '0';
		internal_NEXT_ADDRESS_READ_ENABLE   <= '0';
		internal_WAVEFORM_FIFO_WRITE_ENABLE <= '0';
		internal_CHECKSUM_RESET             <= '0';
		internal_ADC_EVEN_READ_ENABLE       <= '0';
		internal_ADC_ODD_READ_ENABLE        <= '0';
		NEXT_WINDOW_FIFO_READ_ENABLE        <= '0';
		ASIC_STORAGE_TO_WILK_ADDRESS_ENABLE <= '0';
		ASIC_STORAGE_TO_WILK_ENABLE         <= '0';
		ASIC_WILK_COUNTER_RESET             <= '0';
		internal_ASIC_WILK_COUNTER_START    <= '0';
		ASIC_WILK_RAMP_ACTIVE               <= '0';
		ASIC_READOUT_ENABLE                 <= '0';
		DIGITIZER_BUSY                      <= '1';
		--Logic outputs for each state
		case(internal_DIGITIZING_STATE) is
			when IDLE =>
				DIGITIZER_BUSY                   <= '0';
				internal_WILKINSON_COUNTER_RESET <= '1';
				internal_SAMPLE_COUNTER_RESET    <= '1';
				internal_PACKET_COUNTER_RESET    <= '1';
				internal_CHECKSUM_RESET          <= '1';
				if (NEXT_WINDOW_FIFO_EMPTY = '0') then
					NEXT_WINDOW_FIFO_READ_ENABLE  <= '1';
				end if;
			when READ_NEXT_MEMORY_ADDRESS =>
				internal_NEXT_ADDRESS_READ_ENABLE <= '1';
			when CHECK_IF_DIGITIZED =>
				if (internal_FORCE_NEXT_DIGITIZE = '1' or internal_ADDR_TO_READ /= internal_LAST_ADDRESS_DIGITIZED) then
					ASIC_WILK_COUNTER_RESET <= '1';
				end if;
			when DIGITIZE =>
				internal_CLEAR_FORCE_NEXT_DIGITIZE  <= '1';
				ASIC_STORAGE_TO_WILK_ADDRESS_ENABLE <= '1';
				ASIC_STORAGE_TO_WILK_ENABLE <= '1';
				internal_WILKINSON_COUNTER_ENABLE <= '1';
				--The following is meant to remove a potential race condition between START and RESET/ENABLES.
				if (to_integer(internal_WILKINSON_COUNTER) /= 0) then
					internal_ASIC_WILK_COUNTER_START <= '1';
					ASIC_WILK_RAMP_ACTIVE   <= '1';
				end if;
			when BUILD_PACKET_HEADER =>
				internal_WAVEFORM_FIFO_WRITE_ENABLE <= '1';
				internal_PACKET_COUNTER_ENABLE      <= '1';
				ASIC_READOUT_ENABLE                 <= '1';
			when READOUT_EVEN =>
				internal_ADC_EVEN_READ_ENABLE       <= '1';
				ASIC_READOUT_ENABLE                 <= '1';
				internal_SAMPLE_COUNTER_ENABLE      <= '1';
			when READOUT_ODD =>
				internal_ADC_ODD_READ_ENABLE        <= '1';
				ASIC_READOUT_ENABLE                 <= '1';
			when WRITE_ADC_VALUE =>
				internal_WAVEFORM_FIFO_WRITE_ENABLE <= '1';
				internal_PACKET_COUNTER_ENABLE      <= '1';
				internal_SAMPLE_COUNTER_ENABLE      <= '1';
				ASIC_READOUT_ENABLE                 <= '1';
			when WRITE_CHECKSUM => 
				internal_WAVEFORM_FIFO_WRITE_ENABLE <= '1';
			when others =>
		end case;
	end process;
	--Next state logic
	process(internal_DIGITIZING_STATE,NEXT_WINDOW_FIFO_EMPTY,internal_FORCE_NEXT_DIGITIZE,internal_ADDR_TO_READ,internal_LAST_ADDRESS_DIGITIZED,internal_WILKINSON_COUNTER,internal_PACKET_COUNTER,internal_SAMPLE_COUNTER) begin
		case(internal_DIGITIZING_STATE) is
			when IDLE =>
				if (NEXT_WINDOW_FIFO_EMPTY = '0') then
					internal_NEXT_DIGITIZING_STATE <= READ_NEXT_MEMORY_ADDRESS;
				else
					internal_NEXT_DIGITIZING_STATE <= IDLE;
				end if;
			when READ_NEXT_MEMORY_ADDRESS =>
				internal_NEXT_DIGITIZING_STATE <= CHECK_IF_DIGITIZED;
			when CHECK_IF_DIGITIZED =>
				if (internal_FORCE_NEXT_DIGITIZE = '1' or internal_ADDR_TO_READ /= internal_LAST_ADDRESS_DIGITIZED) then
					internal_NEXT_DIGITIZING_STATE <= DIGITIZE;
				else
					internal_NEXT_DIGITIZING_STATE <= BUILD_PACKET_HEADER;
				end if;
			when DIGITIZE =>
				if (internal_WILKINSON_COUNTER = to_unsigned(target_WILKINSON_COUNT,internal_WILKINSON_COUNTER'length)) then
					internal_NEXT_DIGITIZING_STATE <= BUILD_PACKET_HEADER;
				else
					internal_NEXT_DIGITIZING_STATE <= DIGITIZE;
				end if;
			when BUILD_PACKET_HEADER =>
				if (to_integer(internal_PACKET_COUNTER) = NUMBER_OF_WAVEFORM_PACKET_WORDS_BEFORE_ADC) then
					internal_NEXT_DIGITIZING_STATE <= READOUT_EVEN;
				else
					internal_NEXT_DIGITIZING_STATE <= BUILD_PACKET_HEADER;
				end if;
			when READOUT_EVEN =>
				internal_NEXT_DIGITIZING_STATE <= READOUT_ODD;
			when READOUT_ODD =>
				internal_NEXT_DIGITIZING_STATE <= WRITE_ADC_VALUE;
			when WRITE_ADC_VALUE =>
				if (to_integer(internal_SAMPLE_COUNTER) = SAMPLES_PER_WINDOW-1) then
					internal_NEXT_DIGITIZING_STATE <= WRITE_CHECKSUM;
				else
					internal_NEXT_DIGITIZING_STATE <= READOUT_EVEN;
				end if;
			when WRITE_CHECKSUM =>
				internal_NEXT_DIGITIZING_STATE <= IDLE;
			when others =>
				internal_NEXT_DIGITIZING_STATE <= IDLE;
		end case;
	end process;	
	--Register the next state
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			internal_DIGITIZING_STATE <= internal_NEXT_DIGITIZING_STATE;
		end if;
	end process;

	--Logic to parse the row, col, channel, address from the word
	internal_COL_TO_READ     <= internal_NEXT_ADDRESS_TO_READ(ANALOG_MEMORY_ADDRESS_BITS+ROW_SELECT_BITS+COL_SELECT_BITS+CH_SELECT_BITS-1 downto ANALOG_MEMORY_ADDRESS_BITS+ROW_SELECT_BITS+CH_SELECT_BITS);
	internal_ROW_TO_READ     <= internal_NEXT_ADDRESS_TO_READ(ANALOG_MEMORY_ADDRESS_BITS+ROW_SELECT_BITS+CH_SELECT_BITS-1 downto ANALOG_MEMORY_ADDRESS_BITS+CH_SELECT_BITS);
	internal_CHANNEL_TO_READ <= internal_NEXT_ADDRESS_TO_READ(ANALOG_MEMORY_ADDRESS_BITS+CH_SELECT_BITS-1 downto ANALOG_MEMORY_ADDRESS_BITS);
	internal_ADDR_TO_READ    <= internal_NEXT_ADDRESS_TO_READ(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
	--Keep track of the last address
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			if (internal_NEXT_ADDRESS_READ_ENABLE = '1') then
				internal_NEXT_ADDRESS_TO_READ   <= NEXT_WINDOW_FIFO_DATA;
				internal_LAST_ADDRESS_DIGITIZED <= internal_ADDR_TO_READ;
			end if;
		end if;
	end process;

	--Look for rising edges of ROI_PARSER_READY_FOR_TRIGGER to set the status of FORCE_NEXT_DIGITIZE
	--Clear it on the first digitization for an event
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			internal_ROI_PARSER_READY_FOR_TRIGGER      <= ROI_PARSER_READY_FOR_TRIGGER;
			internal_ROI_PARSER_READY_FOR_TRIGGER_LAST <= internal_ROI_PARSER_READY_FOR_TRIGGER;
		end if;
	end process;
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			if (internal_ROI_PARSER_READY_FOR_TRIGGER = '1' and internal_ROI_PARSER_READY_FOR_TRIGGER_LAST = '0') then
				internal_FORCE_NEXT_DIGITIZE <= '1';
			elsif (internal_CLEAR_FORCE_NEXT_DIGITIZE = '1') then
				internal_FORCE_NEXT_DIGITIZE <= '0';
			end if;
		end if;
	end process;

	--Counters for Wilkinson conversion, sample selection, and packet word
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			if (internal_WILKINSON_COUNTER_RESET = '1') then
				internal_WILKINSON_COUNTER <= (others => '0');
			elsif (internal_WILKINSON_COUNTER_ENABLE = '1') then
				internal_WILKINSON_COUNTER <= internal_WILKINSON_COUNTER + 1;
			end if;
		end if;
	end process;
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			if (internal_SAMPLE_COUNTER_RESET = '1') then
				internal_SAMPLE_COUNTER <= (others => '0');
			elsif (internal_SAMPLE_COUNTER_ENABLE = '1') then
				internal_SAMPLE_COUNTER <= internal_SAMPLE_COUNTER + 1;
			end if;
		end if;
	end process;
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			if (internal_PACKET_COUNTER_RESET = '1') then
				internal_PACKET_COUNTER <= (others => '0');
			elsif (internal_PACKET_COUNTER_ENABLE = '1') then
				internal_PACKET_COUNTER <= internal_PACKET_COUNTER + 1;
			end if;
		end if;
	end process;

	--Process to handle incrementing the checksum
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			if (internal_CHECKSUM_RESET = '1') then
				internal_CHECKSUM <= (others => '0');
			elsif (internal_WAVEFORM_FIFO_WRITE_ENABLE = '1') then
				internal_CHECKSUM <= internal_CHECKSUM + unsigned(internal_WAVEFORM_FIFO_WRITE_DATA);
			end if;
		end if;
	end process;
	
	--Process to pack two 12-bit ADC values into a single 32-bit word
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			if (internal_ADC_EVEN_READ_ENABLE = '1') then
				internal_ADC_VALUES(15 downto 0) <= x"0" & internal_SINGLE_ASIC_READOUT_DATA;
			end if;
			if (internal_ADC_ODD_READ_ENABLE = '1') then
				internal_ADC_VALUES(31 downto 16)  <= x"0" & internal_SINGLE_ASIC_READOUT_DATA;
			end if;
		end if;
	end process;
	
	--Multiplexer to choose what's being written to the FIFO	
	internal_WAVEFORM_FIFO_WRITE_DATA <=                   word_PACKET_HEADER when (to_integer(internal_PACKET_COUNTER) = 0) else
	                                     word_NUMBER_WORDS_IN_WAVEFORM_PACKET when (to_integer(internal_PACKET_COUNTER) = 1) else
	                                                     word_WAVEFORM_HEADER when (to_integer(internal_PACKET_COUNTER) = 2) else
	                                                    SCROD_REV_AND_ID_WORD when (to_integer(internal_PACKET_COUNTER) = 3) else
																		     EVENT_NUMBER_WORD when (to_integer(internal_PACKET_COUNTER) = 4) else 
	                  std_logic_vector(resize(unsigned(REFERENCE_WINDOW),32)) when (to_integer(internal_PACKET_COUNTER) = 5) else
	                                  word_NUMBER_SEGMENTS_IN_WAVEFORM_PACKET when (to_integer(internal_PACKET_COUNTER) = 6) else
	     std_logic_vector(resize(unsigned(internal_NEXT_ADDRESS_TO_READ),32)) when (to_integer(internal_PACKET_COUNTER) = 7) else
	                                   word_NUMBER_SAMPLES_IN_WAVEFORM_PACKET when (to_integer(internal_PACKET_COUNTER) = 8) else
	                                      std_logic_vector(internal_CHECKSUM) when (to_integer(internal_PACKET_COUNTER) = to_integer(unsigned(word_NUMBER_WORDS_IN_WAVEFORM_PACKET)+1)) else
	                                                     internal_ADC_VALUES;

	--Instantiate the FIFO that will contain the waveform packets
	map_waveform_packet_fifo : entity work.waveform_packets_fifo
	port map(
		rst    => '0',
		wr_clk => CLOCK,
		rd_clk => WAVEFORM_DATA_READ_CLOCK,
		din    => internal_WAVEFORM_FIFO_WRITE_DATA,
		wr_en  => internal_WAVEFORM_FIFO_WRITE_ENABLE,
		rd_en  => WAVEFORM_DATA_READ_ENABLE,
		dout   => WAVEFORM_DATA_OUT,
		full   => open,
		empty  => WAVEFORM_DATA_EMPTY,
		valid  => WAVEFORM_DATA_VALID	
	);

end Behavioral;

