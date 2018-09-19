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

package strap_definitions is
	--General purpose registers (GPR) are outputs from this block, and are also
	--routed back to the inputs 
	constant N_GPR : integer := 128;
	constant N_STAT_REG : integer := 160;
	constant N_MPPCADC_REG : integer := 160;
	constant NRAMCH : integer :=4;
	constant NWWin : integer :=   4; -- number of waveform windows to be peroccessed in the FPGA
	constant NSamplesPerWin : integer :=   32; 
	constant NCHPerTX : integer :=   16; 

	
  type AddrArray is array (NRAMCH-1 downto 0) of std_logic_vector(21 downto 0);
  type DataArray is array (NRAMCH-1 downto 0) of std_logic_vector(7 downto 0);
  type QArray    is array (NRAMCH+2  downto 0) of integer;


--  type WaveformArray is array (NWWin*NSamplesPerWin*NCHPerTX-1 downto 0) of integer;
--  type WaveformArray is array (NWWin*NSamplesPerWin*NCHPerTX-1 downto 0) of std_logic_vector(15 downto 0);

--  type WaveTempArray is array (NCHPerTX-1 downto 0) of std_logic_vector(15 downto 0);
  type WaveWideTempArray is array (NCHPerTX-1 downto 0) of std_logic_vector(19 downto 0);
  type WaveTempArray is array (NCHPerTX-1 downto 0) of std_logic_vector(11 downto 0);
  type WaveUnsignedTempArray is array (NCHPerTX-1 downto 0) of unsigned(11 downto 0);

  type WaveSignedTempArray is array (NCHPerTX-1 downto 0) of signed(12 downto 0);
  type JDXTempArray is array (NCHPerTX-1 downto 0) of std_logic_vector(10 downto 0);

	type STATREG is array (N_STAT_REG-1 downto 0) of std_logic_vector(15 downto 0);

	--Read registers (RR) are inputs to the command interpreter
	--The first N_GPR of these are directly connected to the general
	--purpose registers to allow readback of any values.
	--This means N_RR should be >= N_GPR.
	constant N_RR  : integer := 256;
--	constant N_RR  : integer := 485;
--	constant N_RR  : integer := 566;

	--Widths of both of these types of registers are set to 16 bits.
	type GPR is array(N_GPR-1 downto 0) of std_logic_vector(15 downto 0);
	type RR is array(N_RR-1 downto 0) of std_logic_vector(15 downto 0);
	type RWT is array (N_GPR-1 downto 0) of std_logic;

end strap_definitions;

package body strap_definitions is
--Nothing in the body 
end strap_definitions;
