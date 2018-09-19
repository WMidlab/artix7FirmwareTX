----------------------------------------------------------------------------------
-- Feedback and monitoring for ASIC items
-- Description:
--		This module handles all the feedback related ASIC items, such as 
--    sampling rate, wilkinson conversion rate, and trigger width.
--    Inputs and outputs are still in a state of flux... at the moment only
--    the Wilkinson rate feedback is implemented.  The desired DAC values 
--    come from this module, but should be multiplexed to the actual DAC
--    choices somewhere else in case feedback should be turned off.
-- Change log:
-- 2011-09-?? - Created by Kurtis
-- 2011-09-29 - Comments/description added to describe basic functionality - Kurtis
-- 2012-11-21 - Modifying for new version of front-end firmware
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.asic_definitions_irs2_carrier_revA.all;
use work.CarrierRevA_DAC_definitions.all;

entity feedback_and_monitoring is
  port (
--				AsicIn_MONITOR_TRIG                       : out std_logic;
--				AsicOut_MONITOR_TRIG_C0_R                 : in std_logic_vector(3 downto 0);
--				AsicOut_MONITOR_TRIG_C1_R                 : in std_logic_vector(3 downto 0);
--				AsicOut_MONITOR_TRIG_C2_R                 : in std_logic_vector(3 downto 0);
--				AsicOut_MONITOR_TRIG_C3_R                 : in std_logic_vector(3 downto 0);
--
--				AsicIn_SAMPLING_TRACK_MODE                : in std_logic;
--				AsicOut_SAMPLING_TRACK_MODE_C0_R          : in std_logic_vector(3 downto 0);
--				AsicOut_SAMPLING_TRACK_MODE_C1_R          : in std_logic_vector(3 downto 0);
--				AsicOut_SAMPLING_TRACK_MODE_C2_R          : in std_logic_vector(3 downto 0);
--				AsicOut_SAMPLING_TRACK_MODE_C3_R          : in std_logic_vector(3 downto 0);
--				
--				FEEDBACK_SAMPLING_RATE_ENABLE             : in std_logic_vector(15 downto 0);
--				FEEDBACK_SAMPLING_RATE_COUNTER_C_R        : out Sampling_Rate_Counters_C_R;
--				FEEDBACK_SAMPLING_RATE_VADJP_C_R          : out Sampling_Rate_DAC_C_R;
--				FEEDBACK_SAMPLING_RATE_VADJN_C_R          : out Sampling_Rate_DAC_C_R;

				AsicOut_MONITOR_WILK_COUNTERS_C0_R        : in std_logic_vector(3 downto 0);
				AsicOut_MONITOR_WILK_COUNTERS_C1_R        : in std_logic_vector(3 downto 0);
				AsicOut_MONITOR_WILK_COUNTERS_C2_R        : in std_logic_vector(3 downto 0);
				AsicOut_MONITOR_WILK_COUNTERS_C3_R        : in std_logic_vector(3 downto 0);
				
				FEEDBACK_WILKINSON_ENABLES_C_R            : in  Column_Row_Enables;
				FEEDBACK_WILKINSON_GOALS_C_R              : in  Column_Row_Wilkinson_Counters;
				FEEDBACK_WILKINSON_COUNTERS_C_R           : out Column_Row_Wilkinson_Counters;
				FEEDBACK_WILKINSON_DAC_VALUES_C_R         : out Column_Row_DAC_Values;
				
				CLOCK                                     : in std_logic
	);
end feedback_and_monitoring;

architecture Behavioral of feedback_and_monitoring is 
begin
	map_wilkinson_monitoring : entity work.wilkinson_monitoring 
		port map (
				AsicOut_MONITOR_WILK_COUNTERS_C0_R => AsicOut_MONITOR_WILK_COUNTERS_C0_R,
				AsicOut_MONITOR_WILK_COUNTERS_C1_R => AsicOut_MONITOR_WILK_COUNTERS_C1_R,
				AsicOut_MONITOR_WILK_COUNTERS_C2_R => AsicOut_MONITOR_WILK_COUNTERS_C2_R,
				AsicOut_MONITOR_WILK_COUNTERS_C3_R => AsicOut_MONITOR_WILK_COUNTERS_C3_R,
				FEEDBACK_WILKINSON_ENABLES_C_R     => FEEDBACK_WILKINSON_ENABLES_C_R,
				FEEDBACK_WILKINSON_GOALS_C_R       => FEEDBACK_WILKINSON_GOALS_C_R,
				FEEDBACK_WILKINSON_COUNTERS_C_R    => FEEDBACK_WILKINSON_COUNTERS_C_R,
				FEEDBACK_WILKINSON_DAC_VALUES_C_R  => FEEDBACK_WILKINSON_DAC_VALUES_C_R,
				CLOCK                              => CLOCK
		);
end Behavioral;

