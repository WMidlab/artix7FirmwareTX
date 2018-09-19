--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;
use work.asic_definitions_irs2_carrier_revA.all;

package readout_definitions is
	--General purpose registers (GPR) are outputs from this block, and are also
	--routed back to the inputs 
	constant N_GPR             : integer := 128;
	constant N_STAT_REG        : integer := 160;
	constant N_MPPCADC_REG     : integer := 160;
	constant NRAMCH            : integer := 4;
	constant NWWin             : integer := 4; -- number of waveform windows to be peroccessed in the FPGA
	constant NSamplesPerWin    : integer := 32; 
	constant NCHPerTX          : integer := 16; 

	
    type AddrArray is array (NRAMCH-1 downto 0) of std_logic_vector(21 downto 0);
    type DataArray is array (NRAMCH-1 downto 0) of std_logic_vector(7 downto 0);
    type QArray    is array (NRAMCH+2  downto 0) of integer;


--  type WaveformArray is array (NWWin*NSamplesPerWin*NCHPerTX-1 downto 0) of integer;
--  type WaveformArray is array (NWWin*NSamplesPerWin*NCHPerTX-1 downto 0) of std_logic_vector(15 downto 0);

--  type WaveTempArray is array (NCHPerTX-1 downto 0) of std_logic_vector(15 downto 0);
    type WaveWideTempArray          is array (NCHPerTX-1 downto 0) of std_logic_vector(19 downto 0);
    type WaveTempArray              is array (NCHPerTX-1 downto 0) of std_logic_vector(11 downto 0);
    type WaveUnsignedTempArray      is array (NCHPerTX-1 downto 0) of unsigned(11 downto 0);

    type WaveSignedTempArray        is array (NCHPerTX-1 downto 0) of signed(12 downto 0);
    type JDXTempArray               is array (NCHPerTX-1 downto 0) of std_logic_vector(10 downto 0);

	type STATREG                    is array (N_STAT_REG-1 downto 0) of std_logic_vector(15 downto 0);

	--Read registers (RR) are inputs to the command interpreter
	--The first N_GPR of these are directly connected to the general
	--purpose registers to allow readback of any values.
	--This means N_RR should be >= N_GPR.
	constant N_RR  : integer := 256;
--	constant N_RR  : integer := 485;
--	constant N_RR  : integer := 566;

	--Widths of both of these types of registers are set to 16 bits.
	type GPR   is array(N_GPR-1 downto 0) of std_logic_vector(15 downto 0);
	type RR    is array(N_RR-1 downto 0) of std_logic_vector(15 downto 0);
	type RWT   is array (N_GPR-1 downto 0) of std_logic;

	--Constants for packet types and such
	constant word_PACKET_HEADER        : std_logic_vector(31 downto 0) := x"00BE11E2";
	constant word_WAVEFORM_HEADER      : std_logic_vector(31 downto 0) := x"77617665"; --"wave"
	constant word_EVENT_HEADER         : std_logic_vector(31 downto 0) := x"65766E74"; --"evnt"
	constant word_PROTOCOL_FREEZE_DATE : std_logic_vector(31 downto 0) := x"20121128"; 
	--Constants for specific packet types
	--Waveform packets are currently fixed size.
	constant word_NUMBER_WORDS_IN_WAVEFORM_PACKET       : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(5+(2+SAMPLES_PER_WINDOW/2)*WAVEFORMS_PER_PACKET+1,32)); --packet type+SCROD+event_number+reference_window+#segments + (segment+window+samples/2)*#segments + checksum
	constant NUMBER_OF_WAVEFORM_PACKET_WORDS_BEFORE_ADC : integer := 8;
	constant word_NUMBER_SEGMENTS_IN_WAVEFORM_PACKET    : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(WAVEFORMS_PER_PACKET,32));
	constant word_NUMBER_SAMPLES_IN_WAVEFORM_PACKET     : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(SAMPLES_PER_WINDOW,32));
	--Event header packet type is also fixed size
	constant word_NUMBER_WORDS_IN_EVENT_HEADER          : std_logic_vector(31 downto 0) := x"00000013";
	constant word_NUMBER_AUX_PACKETS                    : std_logic_vector(31 downto 0) := x"00000000";

end readout_definitions;

package body readout_definitions is
--Nothing in the body 
end readout_definitions;
