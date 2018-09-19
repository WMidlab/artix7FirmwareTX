----------------------------------------------------------------------------------
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.asic_definitions_irs2_carrier_revA.all;

entity irs2_sampling_digitizing_readout is
	Port ( 
		--SST clock for performing sampling address control
		CLOCK_SAMPLING_HOLD_MODE              : in  STD_LOGIC;
		--4xSST clock for trigger memory monitoring
		CLOCK_TRIGGER_MEMORY                  : in  STD_LOGIC;
		--General clock for ROI parsing, waveform builidng, event building
		CLOCK                                 : in  STD_LOGIC;
		--Trigger in
		SOFTWARE_TRIGGER_IN                   : in  STD_LOGIC;
		HARDWARE_TRIGGER_IN                   : in  STD_LOGIC;
		--Trigger related registers 
		SOFTWARE_TRIGGER_VETO                 : in  STD_LOGIC;
		HARDWARE_TRIGGER_VETO                 : in  STD_LOGIC;
		--User registers
		FIRST_ALLOWED_WINDOW                  : in  STD_LOGIC_VECTOR(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
		LAST_ALLOWED_WINDOW                   : in  STD_LOGIC_VECTOR(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
		ROI_ADDRESS_ADJUST                    : in  STD_LOGIC_VECTOR(TRIGGER_MEMORY_ADDRESS_BITS-1 downto 0);
		MAX_WINDOWS_TO_LOOK_BACK              : in  STD_LOGIC_VECTOR(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
		MIN_WINDOWS_TO_LOOK_BACK              : in  STD_LOGIC_VECTOR(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
		WINDOW_PAIRS_TO_SAMPLE_AFTER_TRIGGER  : in  STD_LOGIC_VECTOR(ANALOG_MEMORY_ADDRESS_BITS-2 downto 0);
		PEDESTAL_WINDOW                       : in  STD_LOGIC_VECTOR(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
		PEDESTAL_MODE                         : in  STD_LOGIC;
		SCROD_REV_AND_ID_WORD                 : in  STD_LOGIC_VECTOR(31 downto 0);
		EVENT_NUMBER_TO_SET                   : in  STD_LOGIC_VECTOR(31 downto 0);
		SET_EVENT_NUMBER                      : in  STD_LOGIC;
		EVENT_NUMBER                          : out STD_LOGIC_VECTOR(31 downto 0);
		--Masks to force a readout and prohibit a readout
		FORCE_CHANNEL_MASK                    : in  STD_LOGIC_VECTOR(TOTAL_TRIGGER_BITS-1 downto 0);
		IGNORE_CHANNEL_MASK                   : in  STD_LOGIC_VECTOR(TOTAL_TRIGGER_BITS-1 downto 0);
		--Sampling signals and controls for writing to analog memory
		ASIC_SAMPLING_TO_STORAGE_ADDRESS_NO_LSB : out STD_LOGIC_VECTOR(ANALOG_MEMORY_ADDRESS_BITS-2 downto 0);
		ASIC_SAMPLING_TO_STORAGE_ADDRESS_LSB    :  in std_logic;
		ASIC_SAMPLING_TO_STORAGE_ENABLE         : out STD_LOGIC;
		--Digitization signals
		ASIC_STORAGE_TO_WILK_ADDRESS          : out STD_LOGIC_VECTOR(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
		ASIC_STORAGE_TO_WILK_ADDRESS_ENABLE   : out STD_LOGIC;
		ASIC_STORAGE_TO_WILK_ENABLE           : out STD_LOGIC;
		ASIC_WILK_COUNTER_RESET               : out STD_LOGIC;
		ASIC_WILK_COUNTER_START               : out ASIC_START_C;
		ASIC_WILK_RAMP_ACTIVE                 : out STD_LOGIC;
		--Readout signals
		ASIC_READOUT_CHANNEL_ADDRESS          : out STD_LOGIC_VECTOR(CH_SELECT_BITS-1 downto 0);
		ASIC_READOUT_SAMPLE_ADDRESS           : out STD_LOGIC_VECTOR(SAMPLE_SELECT_BITS-1 downto 0);
		ASIC_READOUT_ENABLE                   : out STD_LOGIC;
		ASIC_READOUT_TRISTATE_DISABLE         : out Column_Row_Enables;
		ASIC_READOUT_DATA                     : in  ASIC_DATA_C;
		--Trigger bits in to determine ROIs
		ASIC_TRIGGER_BITS                     : in  COL_ROW_TRIGGER_BITS;
		--FIFO data to send off as an event
		EVENT_FIFO_DATA_OUT                   : out STD_LOGIC_VECTOR(31 downto 0);
		EVENT_FIFO_DATA_VALID                 : out STD_LOGIC;
		EVENT_FIFO_EMPTY                      : out STD_LOGIC;
		EVENT_FIFO_READ_CLOCK                 : in  STD_LOGIC;
		EVENT_FIFO_READ_ENABLE                : in  STD_LOGIC;
		EVENT_PACKET_BUILDER_BUSY             : out STD_LOGIC;
		EVENT_PACKET_BUILDER_VETO             : in  STD_LOGIC
	);
end irs2_sampling_digitizing_readout;

architecture Behavioral of irs2_sampling_digitizing_readout is
	--Track the current event number
	signal internal_EVENT_NUMBER                         : std_logic_vector(31 downto 0);
	--Trigger signals
	signal internal_TRIGGER_REG                          : std_logic_vector(1 downto 0);
	signal internal_TRIGGER                              : std_logic;
	signal internal_TRIGGER_TO_SAMPLER                   : std_logic;
	--Signals from the sampler
	signal internal_CURRENTLY_SAMPLING                   : std_logic;
	signal internal_LAST_WINDOW_SAMPLED                  : std_logic_vector(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
	signal internal_SAMPLING_TO_STORAGE_ADDRESS          : std_logic_vector(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
	--Signal between the trigger memory and ROI block
	signal internal_TRIGGER_MEMORY_READ_CLOCK            : std_logic;
	signal internal_TRIGGER_MEMORY_READ_ENABLE           : std_logic;
	signal internal_TRIGGER_MEMORY_READ_ADDRESS          : std_logic_vector(TRIGGER_MEMORY_ADDRESS_BITS-1 downto 0);
	signal internal_TRIGGER_MEMORY_READ_DATA             : std_logic_vector(TOTAL_TRIGGER_BITS-1 downto 0);
	--Connections to/from the ROI parser
	signal internal_ROI_PARSER_START                     : std_logic;
	signal internal_ROI_PARSER_READY                     : std_logic;
	signal internal_ROI_PARSER_DONE                      : std_logic;
	signal internal_ROI_PARSER_MAKE_READY                : std_logic;
	signal internal_ROI_PARSER_VETO                      : std_logic;
	signal internal_ROI_TRUNCATED_FLAG                   : std_logic;
	signal internal_NUMBER_OF_WAVEFORMS_FOUND_THIS_EVENT : std_logic_vector(SEGMENT_COUNTER_BITS-1 downto 0);
	--Connections between the ROI parser and the digitizing block
	signal internal_NEXT_WINDOW_FIFO_READ_CLOCK  : std_logic;
	signal internal_NEXT_WINDOW_FIFO_EMPTY       : std_logic;
	signal internal_NEXT_WINDOW_FIFO_READ_ENABLE : std_logic;
	signal internal_NEXT_WINDOW_FIFO_READ_DATA   : std_logic_vector(ANALOG_MEMORY_ADDRESS_BITS+ROW_SELECT_BITS+COL_SELECT_BITS+CH_SELECT_BITS-1 downto 0);
	--Connections between the digitizing block and event builder
	signal internal_WAVEFORM_FIFO_DATA        : std_logic_vector(31 downto 0);
	signal internal_WAVEFORM_FIFO_EMPTY       : std_logic;
	signal internal_WAVEFORM_FIFO_READ_CLOCK  : std_logic;
	signal internal_WAVEFORM_FIFO_READ_ENABLE : std_logic;
	signal internal_WAVEFORM_FIFO_VALID       : std_logic;
	--Busy signal for the digitizer
	signal internal_DIGITIZER_BUSY            : std_logic;
	--Event builder flags
	signal internal_EVENT_FLAG_WORD           : std_logic_vector(31 downto 0);
	signal internal_EVENT_TYPE_WORD           : std_logic_vector(31 downto 0);
	signal internal_EVENT_FIFO_EMPTY          : std_logic;
	signal internal_EVENT_FIFO_DATA_OUT       : std_logic_vector(31 downto 0);
	signal internal_EVENT_FIFO_DATA_VALID     : std_logic;
	signal internal_EVENT_FIFO_READ_ENABLE    : std_logic;
	signal internal_DONE_SENDING_EVENT        : std_logic;
	
--	--Chipscope debugging signals
--	signal internal_CHIPSCOPE_CONTROL : std_logic_vector(35 downto 0);
--	signal internal_CHIPSCOPE_ILA     : std_logic_vector(127 downto 0);
--	signal internal_CHIPSCOPE_ILA_REG : std_logic_vector(127 downto 0);
begin
	EVENT_FIFO_DATA_OUT             <= internal_EVENT_FIFO_DATA_OUT;
	EVENT_FIFO_DATA_VALID           <= internal_EVENT_FIFO_DATA_VALID;
	internal_EVENT_FIFO_READ_ENABLE <= EVENT_FIFO_READ_ENABLE;
	--Busy signal out to upper level logic
	EVENT_PACKET_BUILDER_BUSY <= not(internal_ROI_PARSER_READY) or internal_DIGITIZER_BUSY; 

	--Simple process to set the event number, should be synchronized to readout blocks
	EVENT_NUMBER <= internal_EVENT_NUMBER;
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			if (SET_EVENT_NUMBER = '1') then
				internal_EVENT_NUMBER <= EVENT_NUMBER_TO_SET;
			elsif (internal_TRIGGER = '1') then
				internal_EVENT_NUMBER <= std_logic_vector(unsigned(internal_EVENT_NUMBER) + 1);
			end if;
		end if;
	end process;

	--Edge detector for the trigger, should be synchronized to the sampling block
	process (CLOCK) begin
		--The only other couple SST clock processes work on falling edges, so we should be consistent here
		if (falling_edge(CLOCK)) then	
			internal_TRIGGER_REG(1) <= internal_TRIGGER_REG(0);
			internal_TRIGGER_REG(0) <= ((SOFTWARE_TRIGGER_IN and not(SOFTWARE_TRIGGER_VETO)) or (HARDWARE_TRIGGER_IN and not(HARDWARE_TRIGGER_VETO)));
		end if;
	end process;
	internal_TRIGGER <= '1' when (internal_TRIGGER_REG = "01") else
	                    '0';

	--Version of the trigger synchronized to the sampling clock
	map_system_trigger_edge_to_pulse : entity work.edge_to_pulse_converter 
		port map(
			INPUT_EDGE   => internal_TRIGGER,
			OUTPUT_PULSE => internal_TRIGGER_TO_SAMPLER,
			CLOCK        => CLOCK_SAMPLING_HOLD_MODE,
			CLOCK_ENABLE => '1'
		);

	---------------------------------------------------------------------
	--             TRIGGER MEMORY                                      --
	---------------------------------------------------------------------
	map_trigger_memory : entity work.trigger_memory
	port map(
		--Primary clock for this block
		CLOCK_4xSST                              => CLOCK_TRIGGER_MEMORY,
		--ASIC trigger bits in
		ASIC_TRIGGER_BITS                        => ASIC_TRIGGER_BITS,
		--Sampling monitoring
		CONTINUE_WRITING                         => internal_CURRENTLY_SAMPLING,
		CURRENT_ASIC_SAMPLING_TO_STORAGE_ADDRESS => internal_SAMPLING_TO_STORAGE_ADDRESS(ANALOG_MEMORY_ADDRESS_BITS-1 downto 1) & ASIC_SAMPLING_TO_STORAGE_ADDRESS_LSB,
		--BRAM interface to read from trigger memory from the ROI parser
		TRIGGER_MEMORY_READ_CLOCK                => internal_TRIGGER_MEMORY_READ_CLOCK,
		TRIGGER_MEMORY_READ_ENABLE               => internal_TRIGGER_MEMORY_READ_ENABLE,
		TRIGGER_MEMORY_READ_ADDRESS              => internal_TRIGGER_MEMORY_READ_ADDRESS,
		TRIGGER_MEMORY_DATA                      => internal_TRIGGER_MEMORY_READ_DATA
	);

	---------------------------------------------------------------------
	--             SAMPLING                                            --
	---------------------------------------------------------------------	
	map_sampling_control : entity work.irs2_sampling_control
	port map(
		CURRENTLY_WRITING                         => internal_CURRENTLY_SAMPLING,
		STOP_WRITING                              => internal_TRIGGER_TO_SAMPLER,
		RESUME_WRITING                            => internal_DONE_SENDING_EVENT,
		LAST_WINDOW_SAMPLED                       => internal_LAST_WINDOW_SAMPLED,
		CLOCK_SST                                 => CLOCK_SAMPLING_HOLD_MODE,
		FIRST_ADDRESS_ALLOWED                     => FIRST_ALLOWED_WINDOW,
		LAST_ADDRESS_ALLOWED                      => LAST_ALLOWED_WINDOW,
		WINDOW_PAIRS_TO_SAMPLE_AFTER_TRIGGER      => WINDOW_PAIRS_TO_SAMPLE_AFTER_TRIGGER,
		AsicIn_SAMPLING_TO_STORAGE_ADDRESS_NO_LSB => internal_SAMPLING_TO_STORAGE_ADDRESS(ANALOG_MEMORY_ADDRESS_BITS-1 downto 1),
		AsicIn_SAMPLING_TO_STORAGE_ADDRESS_ENABLE => ASIC_SAMPLING_TO_STORAGE_ENABLE
	);
	ASIC_SAMPLING_TO_STORAGE_ADDRESS_NO_LSB <= internal_SAMPLING_TO_STORAGE_ADDRESS(ANALOG_MEMORY_ADDRESS_BITS-1 downto 1);

	---------------------------------------------------------------------
	--             REGION_OF_INTEREST_TAGGER                           --
	---------------------------------------------------------------------
	internal_ROI_PARSER_START      <= not(internal_CURRENTLY_SAMPLING);
	internal_ROI_PARSER_MAKE_READY <= internal_CURRENTLY_SAMPLING;
	internal_ROI_PARSER_VETO       <= '0';
	map_irs2_roi_parser : entity work.irs2_roi_parser
	port map ( 
		--Primary clock to run this block
		CLOCK                               => CLOCK,
		--Signal to begin parsing the trigger memory
		BEGIN_PARSING_FOR_WINDOWS           => internal_ROI_PARSER_START,
		--Signals to control the flow of the parsing.
		--Last sampled window from the sampling block
		LAST_WINDOW_SAMPLED                 => internal_LAST_WINDOW_SAMPLED,
		--Registers set by the user
		ROI_ADDRESS_ADJUST                  => ROI_ADDRESS_ADJUST,
		FIRST_ALLOWED_WINDOW                => FIRST_ALLOWED_WINDOW,
		LAST_ALLOWED_WINDOW                 => LAST_ALLOWED_WINDOW,
		MAX_WINDOWS_TO_LOOK_BACK            => MAX_WINDOWS_TO_LOOK_BACK,
		MIN_WINDOWS_TO_LOOK_BACK            => MIN_WINDOWS_TO_LOOK_BACK,
		PEDESTAL_WINDOW                     => PEDESTAL_WINDOW,
		PEDESTAL_MODE                       => PEDESTAL_MODE,
		--Masks to force a readout and prohibit a readout
		FORCE_CHANNEL_MASK                  => FORCE_CHANNEL_MASK,
		IGNORE_CHANNEL_MASK                 => IGNORE_CHANNEL_MASK,
		--BRAM interface to read from trigger memory (connect to trigger memory block)
		TRIGGER_MEMORY_READ_CLOCK           => internal_TRIGGER_MEMORY_READ_CLOCK,
		TRIGGER_MEMORY_READ_ENABLE          => internal_TRIGGER_MEMORY_READ_ENABLE,
		TRIGGER_MEMORY_READ_ADDRESS         => internal_TRIGGER_MEMORY_READ_ADDRESS,
		TRIGGER_MEMORY_DATA                 => internal_TRIGGER_MEMORY_READ_DATA,
		--FIFO interface (connect to digitizer and readout)
		NEXT_WINDOW_FIFO_READ_CLOCK          => internal_NEXT_WINDOW_FIFO_READ_CLOCK,
		NEXT_WINDOW_FIFO_READ_ENABLE         => internal_NEXT_WINDOW_FIFO_READ_ENABLE,
		NEXT_WINDOW_FIFO_EMPTY               => internal_NEXT_WINDOW_FIFO_EMPTY,
		NEXT_WINDOW_FIFO_DATA                => internal_NEXT_WINDOW_FIFO_READ_DATA,		
		--Outputs that will be needed for building the response
		NUMBER_OF_WAVEFORMS_FOUND_THIS_EVENT => internal_NUMBER_OF_WAVEFORMS_FOUND_THIS_EVENT,
		EVENT_WAS_TRUNCATED                  => internal_ROI_TRUNCATED_FLAG,
		--Inputs to facilitate flow control
		MAKE_READY_FOR_NEXT_EVENT            => internal_ROI_PARSER_MAKE_READY,
		--Outputs to facilitate flow control
		READY_FOR_TRIGGER                    => internal_ROI_PARSER_READY,
		DONE_BUILDING_WINDOW_LIST            => internal_ROI_PARSER_DONE,
		VETO_NEW_EVENTS                      => internal_ROI_PARSER_VETO
	);

	---------------------------------------------------------------------
	--             DIGITIZATION AND READOUT                            --
	---------------------------------------------------------------------
	map_irs2_digitization_and_readout : entity work.irs2_digitizing
	port map( 
		--Inputs for running the digitizing state machine
		CLOCK                                 => CLOCK,
		--Interface to the ROI recorder
		NEXT_WINDOW_FIFO_READ_CLOCK           => internal_NEXT_WINDOW_FIFO_READ_CLOCK,
		NEXT_WINDOW_FIFO_READ_ENABLE          => internal_NEXT_WINDOW_FIFO_READ_ENABLE,
		NEXT_WINDOW_FIFO_EMPTY                => internal_NEXT_WINDOW_FIFO_EMPTY,
		NEXT_WINDOW_FIFO_DATA                 => internal_NEXT_WINDOW_FIFO_READ_DATA,
		ROI_PARSER_READY_FOR_TRIGGER          => internal_ROI_PARSER_READY,
		--Input ports for data to be written to packets
		SCROD_REV_AND_ID_WORD                 => SCROD_REV_AND_ID_WORD,
		EVENT_NUMBER_WORD                     => internal_EVENT_NUMBER,
		REFERENCE_WINDOW                      => internal_LAST_WINDOW_SAMPLED,
		--FIFO outputs to packet builder
		WAVEFORM_DATA_OUT                     => internal_WAVEFORM_FIFO_DATA,
		WAVEFORM_DATA_EMPTY                   => internal_WAVEFORM_FIFO_EMPTY,
		WAVEFORM_DATA_READ_CLOCK              => internal_WAVEFORM_FIFO_READ_CLOCK,
		WAVEFORM_DATA_READ_ENABLE             => internal_WAVEFORM_FIFO_READ_ENABLE,
		WAVEFORM_DATA_VALID                   => internal_WAVEFORM_FIFO_VALID,
		--Status outputs to the packet builder
		DIGITIZER_BUSY                        => internal_DIGITIZER_BUSY,
		--Outputs to the ASIC (or daughter cards)
		ASIC_STORAGE_TO_WILK_ADDRESS          => ASIC_STORAGE_TO_WILK_ADDRESS,
		ASIC_STORAGE_TO_WILK_ADDRESS_ENABLE   => ASIC_STORAGE_TO_WILK_ADDRESS_ENABLE,
		ASIC_STORAGE_TO_WILK_ENABLE           => ASIC_STORAGE_TO_WILK_ENABLE,
		ASIC_WILK_COUNTER_RESET               => ASIC_WILK_COUNTER_RESET,
		ASIC_WILK_COUNTER_START               => ASIC_WILK_COUNTER_START,
		ASIC_WILK_RAMP_ACTIVE                 => ASIC_WILK_RAMP_ACTIVE,
		ASIC_READOUT_CHANNEL_ADDRESS          => ASIC_READOUT_CHANNEL_ADDRESS,
		ASIC_READOUT_SAMPLE_ADDRESS           => ASIC_READOUT_SAMPLE_ADDRESS,
		ASIC_READOUT_ENABLE                   => ASIC_READOUT_ENABLE,
		ASIC_READOUT_TRISTATE_DISABLE         => ASIC_READOUT_TRISTATE_DISABLE,
		--Inputs from the ASIC
		ASIC_READOUT_DATA                     => ASIC_READOUT_DATA
	);

	---------------------------------------------------------------------
	--             EVENT_BUILDER                                       --
	---------------------------------------------------------------------
	EVENT_FIFO_EMPTY                      <= internal_EVENT_FIFO_EMPTY;
	internal_EVENT_TYPE_WORD(0)           <= '1' when PEDESTAL_MODE = '1' else
	                                         '0';
	internal_EVENT_FLAG_WORD(1)           <= internal_ROI_TRUNCATED_FLAG;													  
	internal_EVENT_TYPE_WORD(31 downto 1) <= (others => '0');
	internal_EVENT_FLAG_WORD(31 downto 2) <= (others => '0');
	internal_EVENT_FLAG_WORD(0)           <= '0';  --Reserved for hard/soft trigger	
	map_event_builder : entity work.event_builder
	port map( 
		READ_CLOCK                      => EVENT_FIFO_READ_CLOCK,
		--Inputs needed to come in to generate words for the event header packet
		SCROD_REV_AND_ID_WORD           => SCROD_REV_AND_ID_WORD,
		EVENT_NUMBER_WORD               => internal_EVENT_NUMBER,
		EVENT_TYPE_WORD                 => internal_EVENT_TYPE_WORD,
		EVENT_FLAG_WORD                 => internal_EVENT_FLAG_WORD,
		NUMBER_OF_WAVEFORM_PACKETS_WORD => std_logic_vector(resize(unsigned(internal_NUMBER_OF_WAVEFORMS_FOUND_THIS_EVENT),32)),
		--Flow control from the other blocks
		START_BUILDING_EVENT            => (internal_ROI_PARSER_DONE and internal_NEXT_WINDOW_FIFO_EMPTY and not(internal_DIGITIZER_BUSY)),
		DONE_SENDING_EVENT              => internal_DONE_SENDING_EVENT,
		MAKE_READY                      => internal_CURRENTLY_SAMPLING,
		--FIFO interface to the waveform packets
		WAVEFORM_FIFO_DATA              => internal_WAVEFORM_FIFO_DATA,
		WAVEFORM_FIFO_DATA_VALID        => internal_WAVEFORM_FIFO_VALID,
		WAVEFORM_FIFO_EMPTY             => internal_WAVEFORM_FIFO_EMPTY,
		WAVEFORM_FIFO_READ_ENABLE       => internal_WAVEFORM_FIFO_READ_ENABLE,
		WAVEFORM_FIFO_READ_CLOCK        => internal_WAVEFORM_FIFO_READ_CLOCK,
		--FIFO-like outputs to the command interpreter
		FIFO_DATA_OUT                   => internal_EVENT_FIFO_DATA_OUT,
		FIFO_DATA_VALID                 => internal_EVENT_FIFO_DATA_VALID,
		FIFO_EMPTY                      => internal_EVENT_FIFO_EMPTY,
		FIFO_READ_ENABLE                => internal_EVENT_FIFO_READ_ENABLE
	);


--	--DEBUGGING CRAP
--	map_ILA : entity work.s6_ila
--	port map (
--		CONTROL => internal_CHIPSCOPE_CONTROL,
--		CLK     => CLOCK,
--		TRIG0   => internal_CHIPSCOPE_ILA_REG
--	);
--	map_ICON : entity work.s6_icon
--	port map (
--		CONTROL0 => internal_CHIPSCOPE_CONTROL
--	);
--	
--	--Workaround for CS/picoblaze stupidness
--	process(CLOCK) begin
--		if (rising_edge(CLOCK)) then
--			internal_CHIPSCOPE_ILA_REG <= internal_CHIPSCOPE_ILA;
--		end if;
--	end process;
--	
--	internal_CHIPSCOPE_ILA(0) <= internal_ROI_PARSER_START;                     
--	internal_CHIPSCOPE_ILA(1) <= internal_ROI_PARSER_READY;                     
--	internal_CHIPSCOPE_ILA(2) <= internal_ROI_PARSER_DONE;                      
--	internal_CHIPSCOPE_ILA(3) <= internal_ROI_PARSER_MAKE_READY;                
--	internal_CHIPSCOPE_ILA(4) <= internal_ROI_PARSER_VETO;                      
--	internal_CHIPSCOPE_ILA(5) <= internal_ROI_TRUNCATED_FLAG;                   
--	internal_CHIPSCOPE_ILA(15 downto 6) <= internal_NUMBER_OF_WAVEFORMS_FOUND_THIS_EVENT; 
--	internal_CHIPSCOPE_ILA(16) <= internal_NEXT_WINDOW_FIFO_EMPTY;
--	internal_CHIPSCOPE_ILA(17) <= internal_NEXT_WINDOW_FIFO_READ_ENABLE;
--	internal_CHIPSCOPE_ILA(18) <= internal_DIGITIZER_BUSY;
--	internal_CHIPSCOPE_ILA(19) <= '0';
--	internal_CHIPSCOPE_ILA(35 downto 20) <= internal_NEXT_WINDOW_FIFO_READ_DATA;
--	internal_CHIPSCOPE_ILA(67 downto 36) <= internal_WAVEFORM_FIFO_DATA;
--	internal_CHIPSCOPE_ILA(68) <= internal_WAVEFORM_FIFO_EMPTY;
--	internal_CHIPSCOPE_ILA(69) <= '0';
--	internal_CHIPSCOPE_ILA(70) <= internal_WAVEFORM_FIFO_READ_ENABLE;
--	internal_CHIPSCOPE_ILA(71) <= internal_WAVEFORM_FIFO_VALID;
--	internal_CHIPSCOPE_ILA(72) <= internal_EVENT_FIFO_EMPTY;
--	internal_CHIPSCOPE_ILA(73) <= internal_EVENT_FIFO_DATA_VALID;
--	internal_CHIPSCOPE_ILA(105 downto 74) <= internal_EVENT_FIFO_DATA_OUT;
--	internal_CHIPSCOPE_ILA(106) <= internal_EVENT_FIFO_READ_ENABLE;
--	internal_CHIPSCOPE_ILA(107) <= internal_CURRENTLY_SAMPLING;
--	internal_CHIPSCOPE_ILA(116 downto 108) <= internal_LAST_WINDOW_SAMPLED;
--	internal_CHIPSCOPE_ILA(117) <= internal_DONE_SENDING_EVENT;


end Behavioral;

