----------------------------------------------------------------------------------
-- Consists of a few components - 
--   0. trigger definitions (see asic_definitions_irs2_carrier_revA.vhd)
--   1. trigger_scaler_timing_generator
--   2. trigger_scaler_single_channel
--   3. trigger_scaler_asic                            
----------------------------------------------------------------------------------

-----------------------------------------------------------
--      1. trigger_scaler_timing_generator               --
-----------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.asic_definitions_irs2_carrier_revA.all;

entity trigger_scaler_timing_generator is
	Port ( 
		CLOCK           : in  STD_LOGIC;
		CLK_COUNTER_MAX	 : in unsigned(15 downto 0):=x"0010";--the number of clock cycles during which the pulse counter runs	 
		READ_ENABLE     : out STD_LOGIC;
		RESET_CLK_COUNTER   : out STD_LOGIC
	);
end trigger_scaler_timing_generator;

architecture Behavioral of trigger_scaler_timing_generator is
	signal internal_CLK_COUNTER          : unsigned(31 downto 0) := (others => '0');
	signal internal_CLK_COUNTER_RESET    : std_logic := '0';
	signal internal_ENABLE_OUT       : std_logic := '0';
	signal internal_ENABLE_OUT_DELAY : std_logic := '0';
	
begin
	--simple CLK_COUNTER
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			if (internal_CLK_COUNTER_RESET = '1') then
				internal_CLK_COUNTER <= (others => '0');
			else
				internal_CLK_COUNTER <= internal_CLK_COUNTER + 1;
			end if;
		end if;
	end process;
	--comparator
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			--if (internal_CLK_COUNTER = to_unsigned(TRIGGER_TARGET_COUNT,TRIGGER_CLK_COUNTER_WIDTH)) then
			if (internal_CLK_COUNTER(31 downto 16) = CLK_COUNTER_MAX) then 

				internal_CLK_COUNTER_RESET <= '1';
			else 
				internal_CLK_COUNTER_RESET <= '0';
			end if;
		end if;
	end process;
	internal_ENABLE_OUT <= internal_CLK_COUNTER_RESET;
	--pipeline stage to generate a one cycle delayed version of enable
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			internal_ENABLE_OUT_DELAY <= internal_ENABLE_OUT;
		end if;
	end process;
	--Map to output ports
	READ_ENABLE <= internal_ENABLE_OUT;
	RESET_CLK_COUNTER <= internal_ENABLE_OUT_DELAY;
end Behavioral;


-----------------------------------------------------------
--      2. single channel trigger scaler                 --
-----------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.asic_definitions_irs2_carrier_revA.all;

entity trigger_scaler_single_channel is
	Port ( 
		SIGNAL_TO_COUNT : in  STD_LOGIC;
		CLOCK           : in  STD_LOGIC;
		READ_ENABLE     : in  STD_LOGIC;
		RESET_PULSE_COUNTER   : in  STD_LOGIC;
		SCALER          : out STD_LOGIC_VECTOR(TRIGGER_SCALER_BIT_WIDTH-1 downto 0)
	);
end trigger_scaler_single_channel;

architecture Behavioral of trigger_scaler_single_channel is
	signal internal_PULSE_TO_COUNT 		 : std_logic := '0';
	signal internal_PULSE_COUNTER        : unsigned(TRIGGER_SCALER_BIT_WIDTH-1 downto 0) := (others => '0');
	signal internal_PULSE_COUNTER_OUT    : std_logic_vector(TRIGGER_SCALER_BIT_WIDTH-1 downto 0) := (others => '0');
begin
	--This takes asynchronous trigger bits and produces pulses
	--with a width of one CLOCK period.
	map_trigger_flip_flop : entity work.edge_to_pulse_converter
	port map(
		INPUT_EDGE   => SIGNAL_TO_COUNT,
		OUTPUT_PULSE => internal_PULSE_TO_COUNT,
		CLOCK        => CLOCK,
		CLOCK_ENABLE => '1'
	);
	--This counts the number of pulses 
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			if (RESET_PULSE_COUNTER = '1') then
				internal_PULSE_COUNTER <= (others => '0');
			elsif (internal_PULSE_TO_COUNT = '1' and internal_PULSE_COUNTER/=x"FFFFFFFF") then
				internal_PULSE_COUNTER <= internal_PULSE_COUNTER + 1;
			end if;
		end if;
	end process;
	--Latch the value of the PULSE_COUNTER to the output
	process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			if (READ_ENABLE = '1') then
				internal_PULSE_COUNTER_OUT <= std_logic_vector(internal_PULSE_COUNTER);
			end if;
		end if;
	end process;
	SCALER <= internal_PULSE_COUNTER_OUT;
end Behavioral;

--------------------------------------------------------------------------------------------------
---- 2.A  trigger scaler single channel w built in timing generator
--------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.asic_definitions_irs2_carrier_revA.all;

entity trigger_scaler_single_channel_w_timing_gen is
	Port ( 
		SIGNAL_TO_COUNT : in  STD_LOGIC;
		CLOCK           : in  STD_LOGIC;
		CLK_COUNTER_MAX : in unsigned(15 downto 0):=x"0010"; --the number of clock cycles during which the pulse counter runs	 

		RESET_PULSE_COUNTER   : in  STD_LOGIC;-- there is a built in auto reset tied to the timer, so this is not strictly necessary unless for long counts
		SCALER          : out STD_LOGIC_VECTOR(TRIGGER_SCALER_BIT_WIDTH-1 downto 0);
		READ_ENABLE_TIMER : out STD_LOGIC
	);
end trigger_scaler_single_channel_w_timing_gen;

architecture Behavioral of trigger_scaler_single_channel_w_timing_gen is
	
		signal internal_ready : STD_LOGIC;
		signal internal_reset_cntr: STD_LOGIC;
        signal internal_reset_pulse_counter : std_logic;
	
begin

		u_trigger_scaler_single_channel: entity work.trigger_scaler_single_channel Port Map ( 
			SIGNAL_TO_COUNT => SIGNAL_TO_COUNT,
			CLOCK           => CLOCK,
			READ_ENABLE     => internal_ready,
			RESET_PULSE_COUNTER   => internal_reset_pulse_counter,
			SCALER          => SCALER
		);
		
		internal_reset_pulse_counter <= internal_reset_cntr or RESET_PULSE_COUNTER;
		
		u_trigger_scaler_timing_generator: entity work.trigger_scaler_timing_generator 

		port map (
			CLOCK					=> CLOCK,
		CLK_COUNTER_MAX => CLK_COUNTER_MAX,
			READ_ENABLE		=> internal_ready,
			RESET_CLK_COUNTER	=>	internal_reset_cntr
		);
		
		READ_ENABLE_TIMER <=internal_ready;

end Behavioral;
