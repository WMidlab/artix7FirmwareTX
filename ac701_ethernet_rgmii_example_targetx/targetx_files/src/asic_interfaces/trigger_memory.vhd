----------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.asic_definitions_irs2_carrier_revA.all;

entity trigger_memory is
	Port ( 
		--Primary clock for this block
		CLOCK_4xSST                              : in  std_logic;
		--ASIC trigger bits in
		ASIC_TRIGGER_BITS                        : in  COL_ROW_TRIGGER_BITS;
		--Sampling monitoring
		CONTINUE_WRITING                         : in  std_logic;
		CURRENT_ASIC_SAMPLING_TO_STORAGE_ADDRESS : in  std_logic_vector(ANALOG_MEMORY_ADDRESS_BITS-1 downto 0);
		--BRAM interface to read from trigger memory from the ROI parser
		TRIGGER_MEMORY_READ_CLOCK                : in  STD_LOGIC;
		TRIGGER_MEMORY_READ_ENABLE               : in  STD_LOGIC;
		TRIGGER_MEMORY_READ_ADDRESS              : in  STD_LOGIC_VECTOR(TRIGGER_MEMORY_ADDRESS_BITS-1 downto 0);
		TRIGGER_MEMORY_DATA                      : out STD_LOGIC_VECTOR(TOTAL_TRIGGER_BITS-1 downto 0)
	);
end trigger_memory;

architecture Behavioral of trigger_memory is
	signal internal_TRIGGER_MEMORY_WRITE_ADDRESS_RAW : std_logic_vector(TRIGGER_MEMORY_ADDRESS_BITS-1 downto 0);
	signal internal_TRIGGER_MEMORY_WRITE_ADDRESS_RAW_REG : std_logic_vector(TRIGGER_MEMORY_ADDRESS_BITS-1 downto 0);
	signal internal_TRIGGER_MEMORY_WRITE_DATA        : std_logic_vector(TOTAL_TRIGGER_BITS-1 downto 0);
	signal internal_ASIC_TRIGGER_BITS_RAW            : std_logic_vector(TOTAL_TRIGGER_BITS-1 downto 0);
	signal internal_ASIC_TRIGGER_BITS_REGISTERED     : std_logic_vector(TOTAL_TRIGGER_BITS-1 downto 0);
	signal internal_WRITE_ADDRESS_LSB_REG            : std_logic_vector(1 downto 0);
	signal internal_CONTINUE_WRITING                 : std_logic_vector(0 downto 0);
	
--	-- Chipscope debugging signals
--	signal internal_CHIPSCOPE_CONTROL : std_logic_vector(35 downto 0);
--	signal internal_CHIPSCOPE_ILA     : std_logic_vector(127 downto 0);
--	signal internal_CHIPSCOPE_ILA_REG : std_logic_vector(127 downto 0);

begin

	--Remap trigger bits
	gen_trigger_bits_col : for col in 0 to ASICS_PER_ROW-1 generate
		gen_trigger_bits_row : for row in 0 to ROWS_PER_COL-1 generate
			gen_trigger_bits_ch : for ch in 0 to CHANNELS_PER_ASIC-1 generate
				internal_ASIC_TRIGGER_BITS_RAW(col*32+row*8+ch) <= ASIC_TRIGGER_BITS(col)(row)(ch);
			end generate;
		end generate;
	end generate;
	--Move the trigger bits into the 4xSST clock domain, and make them edge sensitive
	gen_trigger_bit_pulses : for ch in 0 to TOTAL_TRIGGER_BITS-1 generate
		map_trigger_edge_to_pulse : entity work.edge_to_pulse_converter 
		port map(
			INPUT_EDGE   => internal_ASIC_TRIGGER_BITS_RAW(ch),
			OUTPUT_PULSE => internal_ASIC_TRIGGER_BITS_REGISTERED(ch),
			CLOCK        => CLOCK_4xSST,
			CLOCK_ENABLE => '1'
		);
	end generate;

	--Determine the trigger memory write address.
	--The upper bits match the analog storage memory
	internal_TRIGGER_MEMORY_WRITE_ADDRESS_RAW(TRIGGER_MEMORY_ADDRESS_BITS-1 downto 1) <= CURRENT_ASIC_SAMPLING_TO_STORAGE_ADDRESS;
	--Logic to determine the LSB
	process(CLOCK_4xSST) begin
		if (rising_edge(CLOCK_4xSST)) then
			internal_WRITE_ADDRESS_LSB_REG(1) <= internal_WRITE_ADDRESS_LSB_REG(0);
			internal_WRITE_ADDRESS_LSB_REG(0) <= CURRENT_ASIC_SAMPLING_TO_STORAGE_ADDRESS(0);
		end if;
	end process;
	internal_TRIGGER_MEMORY_WRITE_ADDRESS_RAW(0) <= '0' when internal_WRITE_ADDRESS_LSB_REG = "00" else
	                                                '0' when internal_WRITE_ADDRESS_LSB_REG = "11" else
															      '1';

	--Register the trigger memory address
	process(CLOCK_4xSST) begin
		if rising_edge(CLOCK_4xSST) then
			internal_TRIGGER_MEMORY_WRITE_ADDRESS_RAW_REG <= internal_TRIGGER_MEMORY_WRITE_ADDRESS_RAW;
		end if;
	end process;
	
	--Instantiate the blockram	
	internal_CONTINUE_WRITING(0) <= CONTINUE_WRITING;
	map_trigger_memory : entity work.trigger_memory_bram
	PORT MAP (
		clka   => CLOCK_4xSST,
		wea    => internal_CONTINUE_WRITING,
		addra  => internal_TRIGGER_MEMORY_WRITE_ADDRESS_RAW_REG,
		dina   => internal_ASIC_TRIGGER_BITS_REGISTERED,
		clkb   => TRIGGER_MEMORY_READ_CLOCK,
		addrb  => TRIGGER_MEMORY_READ_ADDRESS,
		doutb  => TRIGGER_MEMORY_DATA
	);

--	--DEBUGGING CRAP
--	map_ILA : entity work.s6_ila
--	port map (
--		CONTROL => internal_CHIPSCOPE_CONTROL,
--		CLK     => CLOCK_4xSST,
--		TRIG0   => internal_CHIPSCOPE_ILA_REG
--	);
--	map_ICON : entity work.s6_icon
--	port map (
--		CONTROL0 => internal_CHIPSCOPE_CONTROL
--	);
--	
--	--Workaround for CS/picoblaze stupidness
--	process(CLOCK_4xSST) begin
--		if (rising_edge(CLOCK_4xSST)) then
--			internal_CHIPSCOPE_ILA_REG <= internal_CHIPSCOPE_ILA;
--		end if;
--	end process;
--	
--	internal_CHIPSCOPE_ILA( 9 downto  0) <= internal_TRIGGER_MEMORY_WRITE_ADDRESS_RAW_REG;
--	internal_CHIPSCOPE_ILA(19 downto 10) <= internal_TRIGGER_MEMORY_WRITE_ADDRESS_ADJ_REG;
--	internal_CHIPSCOPE_ILA(29 downto 20) <= ROI_ADDRESS_ADJUST;
--	internal_CHIPSCOPE_ILA(38 downto 30) <= FIRST_ALLOWED_ADDRESS;
--	internal_CHIPSCOPE_ILA(47 downto 39) <= LAST_ALLOWED_ADDRESS;
--	internal_CHIPSCOPE_ILA(56 downto 48) <= CURRENT_ASIC_SAMPLING_TO_STORAGE_ADDRESS;



end Behavioral;

