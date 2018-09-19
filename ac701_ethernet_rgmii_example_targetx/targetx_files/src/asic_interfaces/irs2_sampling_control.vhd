----------------------------------------------------------------------------------
-- ASIC sampling control
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.asic_definitions_irs2_carrier_revA.all;

entity irs2_sampling_control is
	Port (
		--Flow control signals
		CURRENTLY_WRITING                         : out std_logic;
		STOP_WRITING                              : in  std_logic;
		RESUME_WRITING                            : in  std_logic;
		LAST_WINDOW_SAMPLED                       : out std_logic_vector(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
		--Single clock signal in
		CLOCK_SST                                 : in  std_logic;
		--Control from general user registers
		FIRST_ADDRESS_ALLOWED                     : in  std_logic_vector(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
		LAST_ADDRESS_ALLOWED                      : in  std_logic_vector(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
		WINDOW_PAIRS_TO_SAMPLE_AFTER_TRIGGER      : in  std_logic_vector(ANALOG_MEMORY_ADDRESS_BITS-2 downto 0);
		--Outputs to the ASIC
		AsicIn_SAMPLING_TO_STORAGE_ADDRESS_NO_LSB : out	std_logic_vector(ANALOG_MEMORY_ADDRESS_BITS-2 downto 0);
		AsicIn_SAMPLING_TO_STORAGE_ADDRESS_ENABLE : out	std_logic
	);
end irs2_sampling_control;

architecture Behavioral of irs2_sampling_control is
	type sampling_state is (NORMAL_SAMPLING, POST_TRIGGER_SAMPLING, DONE);
	signal internal_SAMPLING_STATE                            : sampling_state := NORMAL_SAMPLING;
	signal internal_NEXT_SAMPLING_STATE                       : sampling_state := NORMAL_SAMPLING;
	signal internal_AsicIn_SAMPLING_TO_STORAGE_ADDRESS        : unsigned(ANALOG_MEMORY_ADDRESS_BITS-2 downto 0) := (others => '0');
	signal internal_AsicIn_SAMPLING_TO_STORAGE_ADDRESS_ENABLE : std_logic := '0';
	signal internal_WINDOW_PAIRS_SAMPLED_AFTER_TRIGGER        : unsigned(ANALOG_MEMORY_ADDRESS_BITS-2 downto 0) := (others => '0');
	signal internal_WINDOW_PAIRS_SAMPLED_AFTER_TRIGGER_ENABLE : std_logic := '0';
	signal internal_WINDOW_PAIRS_SAMPLED_AFTER_TRIGGER_RESET  : std_logic := '0';	
	signal internal_CONTINUE_WRITING                          : std_logic := '0';

begin
	LAST_WINDOW_SAMPLED <= std_logic_vector(internal_AsicIn_SAMPLING_TO_STORAGE_ADDRESS) & '1';
	AsicIn_SAMPLING_TO_STORAGE_ADDRESS_NO_LSB <= std_logic_vector(internal_AsicIn_SAMPLING_TO_STORAGE_ADDRESS);

	--State outputs
	process(internal_SAMPLING_STATE) begin
		case internal_SAMPLING_STATE is
			when NORMAL_SAMPLING =>
				CURRENTLY_WRITING <= '1';
				AsicIn_SAMPLING_TO_STORAGE_ADDRESS_ENABLE <= '1';
				internal_CONTINUE_WRITING <= '1';
			when POST_TRIGGER_SAMPLING =>
				CURRENTLY_WRITING <= '1';
				AsicIn_SAMPLING_TO_STORAGE_ADDRESS_ENABLE <= '1';
				internal_CONTINUE_WRITING <= '1';
			when DONE =>
				CURRENTLY_WRITING <= '0';
				AsicIn_SAMPLING_TO_STORAGE_ADDRESS_ENABLE <= '0';
				internal_CONTINUE_WRITING <= '0';
		end case;
	end process;
	--Next state logic
	process(internal_SAMPLING_STATE, STOP_WRITING, RESUME_WRITING, internal_WINDOW_PAIRS_SAMPLED_AFTER_TRIGGER, WINDOW_PAIRS_TO_SAMPLE_AFTER_TRIGGER) begin
		case internal_SAMPLING_STATE is
			when NORMAL_SAMPLING =>
				if (STOP_WRITING = '1') then
					internal_NEXT_SAMPLING_STATE <= POST_TRIGGER_SAMPLING;				
				else
					internal_NEXT_SAMPLING_STATE <= NORMAL_SAMPLING;
				end if;
			when POST_TRIGGER_SAMPLING =>
				if (internal_WINDOW_PAIRS_SAMPLED_AFTER_TRIGGER < unsigned(WINDOW_PAIRS_TO_SAMPLE_AFTER_TRIGGER)) then
					internal_NEXT_SAMPLING_STATE <= POST_TRIGGER_SAMPLING;
				else
					internal_NEXT_SAMPLING_STATE <= DONE;
				end if;
			when DONE =>
				if (RESUME_WRITING = '1') then
					internal_NEXT_SAMPLING_STATE <= NORMAL_SAMPLING;
				else
					internal_NEXT_SAMPLING_STATE <= DONE;
				end if;
		end case;
	end process;	
	--Register the next state
	process(CLOCK_SST) begin
		if (falling_edge(CLOCK_SST)) then
			internal_SAMPLING_STATE <= internal_NEXT_SAMPLING_STATE;
		end if;
	end process;

	--Counter for incrementing the analog storage window 
	process(CLOCK_SST) begin
		if falling_edge(CLOCK_SST) then
			if (internal_CONTINUE_WRITING = '1') then
				if (unsigned(internal_AsicIn_SAMPLING_TO_STORAGE_ADDRESS & '1') < unsigned(LAST_ADDRESS_ALLOWED)) then
					internal_AsicIn_SAMPLING_TO_STORAGE_ADDRESS <= internal_AsicIn_SAMPLING_TO_STORAGE_ADDRESS + 1;
				else
					internal_AsicIn_SAMPLING_TO_STORAGE_ADDRESS <= unsigned(FIRST_ADDRESS_ALLOWED(FIRST_ADDRESS_ALLOWED'length-1 downto 1));
				end if;
			end if;
		end if;
	end process;

	--Counter for post trigger sampling
	process(CLOCK_SST) begin
		if (falling_edge(CLOCK_SST)) then
			if (internal_WINDOW_PAIRS_SAMPLED_AFTER_TRIGGER_RESET = '1') then
				internal_WINDOW_PAIRS_SAMPLED_AFTER_TRIGGER <= (others => '0');
			elsif (internal_WINDOW_PAIRS_SAMPLED_AFTER_TRIGGER_ENABLE = '1') then
				internal_WINDOW_PAIRS_SAMPLED_AFTER_TRIGGER <= internal_WINDOW_PAIRS_SAMPLED_AFTER_TRIGGER + 1;
			end if;
		end if;
	end process;
	
end Behavioral;

