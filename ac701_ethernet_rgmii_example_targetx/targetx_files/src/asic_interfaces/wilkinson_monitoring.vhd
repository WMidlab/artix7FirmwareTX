----------------------------------------------------------------------------------
-- Single feedback loop (1 ASIC)
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.asic_definitions_irs2_carrier_revA.all;
use work.CarrierRevA_DAC_definitions.all;

entity wilkinson_feedback is
	port (
		CLOCK           : in  std_logic;
		CLOCK_ENABLE    : in  std_logic;
		FEEDBACK_ENABLE : in  std_logic;
		CURRENT_VALUE   : in  Wilkinson_Counter;
		TARGET_VALUE    : in  Wilkinson_Counter;
		DAC_VALUE       : out DAC_Setting
	);
end wilkinson_feedback;

architecture Behavioral of wilkinson_feedback is
	signal   internal_DAC_VALUE               : DAC_Setting;
	signal   internal_NEXT_DAC_VALUE          : signed(13 downto 0);
	constant starting_dac_value               : DAC_Setting := x"AF0";
	signal   internal_CURRENT_DIFFERENCE      : signed(16 downto 0);
	signal   internal_STEP                    : signed(11 downto 0);
begin
	--Map the signals to the output
	DAC_VALUE <= internal_DAC_VALUE;
	--Calculate the difference between what we have and what we want
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			if (CLOCK_ENABLE = '1') then
				internal_CURRENT_DIFFERENCE <= signed('0' & TARGET_VALUE) - signed ('0' & CURRENT_VALUE);
			end if;
		end if;
	end process;
	--The effective proportionality constant is chosen here by truncating the LSBs.
	internal_STEP <= internal_CURRENT_DIFFERENCE(16 downto 5);
	internal_NEXT_DAC_VALUE <= signed(resize(unsigned(internal_DAC_VALUE),internal_NEXT_DAC_VALUE'length)) + signed(resize(internal_STEP,internal_NEXT_DAC_VALUE'length));
	--Apply the correction
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			if (CLOCK_ENABLE = '1') then
				if (FEEDBACK_ENABLE = '0') then
					internal_DAC_VALUE <= starting_dac_value;
				else
					if (internal_NEXT_DAC_VALUE < 0) then
						internal_DAC_VALUE <= (others => '0');
					elsif (internal_NEXT_DAC_VALUE > 4095) then
						internal_DAC_VALUE <= (others => '1');
					else
						internal_DAC_VALUE <= std_logic_vector(internal_NEXT_DAC_VALUE(11 downto 0));
					end if;
				end if;
			end if;
		end if;
	end process;
end Behavioral;

----------------------------------------------------------------------------------
-- Instantiate a copy of the above for all ASICs
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.asic_definitions_irs2_carrier_revA.all;
use work.CarrierRevA_DAC_definitions.all;

entity wilkinson_monitoring is
	port (
		AsicOut_MONITOR_WILK_COUNTERS_C0_R : in std_logic_vector(3 downto 0);
		AsicOut_MONITOR_WILK_COUNTERS_C1_R : in std_logic_vector(3 downto 0);
		AsicOut_MONITOR_WILK_COUNTERS_C2_R : in std_logic_vector(3 downto 0);
		AsicOut_MONITOR_WILK_COUNTERS_C3_R : in std_logic_vector(3 downto 0);				

		FEEDBACK_WILKINSON_ENABLES_C_R     : in  Column_Row_Enables;
		FEEDBACK_WILKINSON_GOALS_C_R       : in  Column_Row_Wilkinson_Counters;
		FEEDBACK_WILKINSON_COUNTERS_C_R    : out Column_Row_Wilkinson_Counters;
		FEEDBACK_WILKINSON_DAC_VALUES_C_R  : out Column_Row_DAC_Values;

		CLOCK                              : in std_logic
	);
end wilkinson_monitoring;

architecture Behavioral of wilkinson_monitoring is
	signal internal_READ_ENABLE            : std_logic := '0';
	signal internal_RESET_COUNTER          : std_logic := '0';
	signal internal_WILKINSON_COUNTERS_C_R : Column_Row_Wilkinson_Counters;
begin
	--Map to output ports
	FEEDBACK_WILKINSON_COUNTERS_C_R <= internal_WILKINSON_COUNTERS_C_R;

	--Create the read enables for the Wilkinson counter monitoring
	--This reuses the trigger scaler related stuff, since the logic is identical
	map_trigger_scaler_timing_gen : entity work.trigger_scaler_timing_generator
	port map(
		CLOCK         => CLOCK,
		READ_ENABLE   => internal_READ_ENABLE,
		RESET_COUNTER => internal_RESET_COUNTER
	);
	
	--We reuse the trigger scaler counters here since the procedure is
	--just about identical to record the count rates.
	gen_wilk_counter_row : for row in 0 to 3 generate
		map_wilk_counter_c0 : entity work.trigger_scaler_single_channel
			port map( 
				SIGNAL_TO_COUNT => AsicOut_MONITOR_WILK_COUNTERS_C0_R(row),
				CLOCK           => CLOCK,
				READ_ENABLE     => internal_READ_ENABLE,
				RESET_COUNTER   => internal_RESET_COUNTER,
				SCALER          => internal_WILKINSON_COUNTERS_C_R(0)(row)
			);
		map_wilk_counter_c1 : entity work.trigger_scaler_single_channel
			port map( 
				SIGNAL_TO_COUNT => AsicOut_MONITOR_WILK_COUNTERS_C1_R(row),
				CLOCK           => CLOCK,
				READ_ENABLE     => internal_READ_ENABLE,
				RESET_COUNTER   => internal_RESET_COUNTER,
				SCALER          => internal_WILKINSON_COUNTERS_C_R(1)(row)
			);
		map_wilk_counter_c2 : entity work.trigger_scaler_single_channel
			port map( 
				SIGNAL_TO_COUNT => AsicOut_MONITOR_WILK_COUNTERS_C2_R(row),
				CLOCK           => CLOCK,
				READ_ENABLE     => internal_READ_ENABLE,
				RESET_COUNTER   => internal_RESET_COUNTER,
				SCALER          => internal_WILKINSON_COUNTERS_C_R(2)(row)
			);
		map_wilk_counter_c3 : entity work.trigger_scaler_single_channel
			port map( 
				SIGNAL_TO_COUNT => AsicOut_MONITOR_WILK_COUNTERS_C3_R(row),
				CLOCK           => CLOCK,
				READ_ENABLE     => internal_READ_ENABLE,
				RESET_COUNTER   => internal_RESET_COUNTER,
				SCALER          => internal_WILKINSON_COUNTERS_C_R(3)(row)
			);
	end generate;

	--Now instantiate the logic that actually performs the feedback
	gen_wilk_feedback_col : for col in 0 to 3 generate
		gen_wilk_feedback_row : for row in 0 to 3 generate
			map_wilk_feedback : entity work.wilkinson_feedback
				port map(
					CLOCK           => CLOCK,
					CLOCK_ENABLE    => internal_RESET_COUNTER,
					FEEDBACK_ENABLE => FEEDBACK_WILKINSON_ENABLES_C_R(col)(row),
					CURRENT_VALUE   => internal_WILKINSON_COUNTERS_C_R(col)(row),
					TARGET_VALUE    => FEEDBACK_WILKINSON_GOALS_C_R(col)(row),
					DAC_VALUE       => FEEDBACK_WILKINSON_DAC_VALUES_C_R(col)(row)
				);
		end generate;
	end generate;

end Behavioral;

