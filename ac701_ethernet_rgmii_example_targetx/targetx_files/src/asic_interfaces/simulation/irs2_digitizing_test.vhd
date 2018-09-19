--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:31:56 11/28/2012
-- Design Name:   
-- Module Name:   C:/cygwin/home/Dr Kurtis/idlab-scrod/SCROD-boardstack/new_daq_interface/src/asic_interfaces/simulation/irs2_digitizing_test.vhd
-- Project Name:  USB_and_fiber_readout
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: irs2_digitizing
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.asic_definitions_irs2_carrier_revA.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY irs2_digitizing_test IS
END irs2_digitizing_test;
 
ARCHITECTURE behavior OF irs2_digitizing_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT irs2_digitizing
    PORT(
         CLOCK : IN  std_logic;
         NEXT_WINDOW_FIFO_READ_CLOCK : OUT  std_logic;
         NEXT_WINDOW_FIFO_READ_ENABLE : OUT  std_logic;
         NEXT_WINDOW_FIFO_EMPTY : IN  std_logic;
         NEXT_WINDOW_FIFO_DATA : IN  std_logic_vector(15 downto 0);
         ROI_PARSER_READY_FOR_TRIGGER : IN  std_logic;
         SCROD_REV_AND_ID_WORD : IN  std_logic_vector(31 downto 0);
         REFERENCE_WINDOW : IN  std_logic_vector(8 downto 0);
         WAVEFORM_DATA_OUT : OUT  std_logic_vector(31 downto 0);
         WAVEFORM_DATA_EMPTY : OUT  std_logic;
         WAVEFORM_DATA_READ_CLOCK : IN  std_logic;
         WAVEFORM_DATA_READ_ENABLE : IN  std_logic;
         WAVEFORM_DATA_VALID : OUT  std_logic;
         DIGITIZER_BUSY : OUT  std_logic;
         ASIC_STORAGE_TO_WILK_ADDRESS : OUT  std_logic_vector(8 downto 0);
         ASIC_STORAGE_TO_WILK_ADDRESS_ENABLE : OUT  std_logic;
         ASIC_STORAGE_TO_WILK_ENABLE : OUT  std_logic;
         ASIC_WILK_COUNTER_RESET : OUT  std_logic;
         ASIC_WILK_COUNTER_START : OUT std_logic_vector(3 downto 0);
         ASIC_WILK_RAMP_ACTIVE : OUT  std_logic;
         ASIC_READOUT_CHANNEL_ADDRESS : OUT  std_logic_vector(2 downto 0);
         ASIC_READOUT_SAMPLE_ADDRESS : OUT  std_logic_vector(5 downto 0);
         ASIC_READOUT_ENABLE : OUT  std_logic;
         ASIC_READOUT_TRISTATE_DISABLE : OUT  std_logic_vector(3 downto 0);
         ASIC_READOUT_DATA : IN  std_logic_vector(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLOCK : std_logic := '0';
   signal NEXT_WINDOW_FIFO_EMPTY : std_logic := '0';
   signal NEXT_WINDOW_FIFO_DATA : std_logic_vector(15 downto 0) := (others => '0');
   signal ROI_PARSER_READY_FOR_TRIGGER : std_logic := '0';
   signal SCROD_REV_AND_ID_WORD : std_logic_vector(31 downto 0) := (others => '0');
   signal REFERENCE_WINDOW : std_logic_vector(8 downto 0) := (others => '0');
   signal WAVEFORM_DATA_READ_CLOCK : std_logic := '0';
   signal WAVEFORM_DATA_READ_ENABLE : std_logic := '0';
   signal ASIC_READOUT_DATA : std_logic_vector(11 downto 0) := (others => '0');

 	--Outputs
   signal NEXT_WINDOW_FIFO_READ_CLOCK : std_logic;
   signal NEXT_WINDOW_FIFO_READ_ENABLE : std_logic;
   signal WAVEFORM_DATA_OUT : std_logic_vector(31 downto 0);
   signal WAVEFORM_DATA_EMPTY : std_logic;
   signal WAVEFORM_DATA_VALID : std_logic;
   signal DIGITIZER_BUSY : std_logic;
   signal ASIC_STORAGE_TO_WILK_ADDRESS : std_logic_vector(8 downto 0);
   signal ASIC_STORAGE_TO_WILK_ADDRESS_ENABLE : std_logic;
   signal ASIC_STORAGE_TO_WILK_ENABLE : std_logic;
   signal ASIC_WILK_COUNTER_RESET : std_logic;
   signal ASIC_WILK_COUNTER_START : std_logic_vector(3 downto 0);
   signal ASIC_WILK_RAMP_ACTIVE : std_logic;
   signal ASIC_READOUT_CHANNEL_ADDRESS : std_logic_vector(2 downto 0);
   signal ASIC_READOUT_SAMPLE_ADDRESS : std_logic_vector(5 downto 0);
   signal ASIC_READOUT_ENABLE : std_logic;
   signal ASIC_READOUT_TRISTATE_DISABLE : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLOCK_period : time := 10 ns;
   constant NEXT_WINDOW_FIFO_READ_CLOCK_period : time := 10 ns;
   constant WAVEFORM_DATA_READ_CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: irs2_digitizing PORT MAP (
          CLOCK => CLOCK,
          NEXT_WINDOW_FIFO_READ_CLOCK => NEXT_WINDOW_FIFO_READ_CLOCK,
          NEXT_WINDOW_FIFO_READ_ENABLE => NEXT_WINDOW_FIFO_READ_ENABLE,
          NEXT_WINDOW_FIFO_EMPTY => NEXT_WINDOW_FIFO_EMPTY,
          NEXT_WINDOW_FIFO_DATA => NEXT_WINDOW_FIFO_DATA,
          ROI_PARSER_READY_FOR_TRIGGER => ROI_PARSER_READY_FOR_TRIGGER,
          SCROD_REV_AND_ID_WORD => SCROD_REV_AND_ID_WORD,
          REFERENCE_WINDOW => REFERENCE_WINDOW,
          WAVEFORM_DATA_OUT => WAVEFORM_DATA_OUT,
          WAVEFORM_DATA_EMPTY => WAVEFORM_DATA_EMPTY,
          WAVEFORM_DATA_READ_CLOCK => WAVEFORM_DATA_READ_CLOCK,
          WAVEFORM_DATA_READ_ENABLE => WAVEFORM_DATA_READ_ENABLE,
          WAVEFORM_DATA_VALID => WAVEFORM_DATA_VALID,
          DIGITIZER_BUSY => DIGITIZER_BUSY,
          ASIC_STORAGE_TO_WILK_ADDRESS => ASIC_STORAGE_TO_WILK_ADDRESS,
          ASIC_STORAGE_TO_WILK_ADDRESS_ENABLE => ASIC_STORAGE_TO_WILK_ADDRESS_ENABLE,
          ASIC_STORAGE_TO_WILK_ENABLE => ASIC_STORAGE_TO_WILK_ENABLE,
          ASIC_WILK_COUNTER_RESET => ASIC_WILK_COUNTER_RESET,
          ASIC_WILK_COUNTER_START => ASIC_WILK_COUNTER_START,
          ASIC_WILK_RAMP_ACTIVE => ASIC_WILK_RAMP_ACTIVE,
          ASIC_READOUT_CHANNEL_ADDRESS => ASIC_READOUT_CHANNEL_ADDRESS,
          ASIC_READOUT_SAMPLE_ADDRESS => ASIC_READOUT_SAMPLE_ADDRESS,
          ASIC_READOUT_ENABLE => ASIC_READOUT_ENABLE,
          ASIC_READOUT_TRISTATE_DISABLE => ASIC_READOUT_TRISTATE_DISABLE,
          ASIC_READOUT_DATA => ASIC_READOUT_DATA
        );

   -- Clock process definitions
   CLOCK_process :process
   begin
		CLOCK <= '0';
		wait for CLOCK_period/2;
		CLOCK <= '1';
		wait for CLOCK_period/2;
   end process;
 
   NEXT_WINDOW_FIFO_READ_CLOCK_process :process
   begin
		NEXT_WINDOW_FIFO_READ_CLOCK <= '0';
		wait for NEXT_WINDOW_FIFO_READ_CLOCK_period/2;
		NEXT_WINDOW_FIFO_READ_CLOCK <= '1';
		wait for NEXT_WINDOW_FIFO_READ_CLOCK_period/2;
   end process;
 
   WAVEFORM_DATA_READ_CLOCK_process :process
   begin
		WAVEFORM_DATA_READ_CLOCK <= '0';
		wait for WAVEFORM_DATA_READ_CLOCK_period/2;
		WAVEFORM_DATA_READ_CLOCK <= '1';
		wait for WAVEFORM_DATA_READ_CLOCK_period/2;
   end process;
 
	ASIC_READOUT_DATA <= '0' & ASIC_READOUT_CHANNEL_ADDRESS & "00" & ASIC_READOUT_SAMPLE_ADDRESS;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLOCK_period*10;

      -- insert stimulus here 
		NEXT_WINDOW_FIFO_EMPTY <= '0';
		wait for CLOCK_period;
		NEXT_WINDOW_FIFO_EMPTY <= '1';

      wait;
   end process;

END;
