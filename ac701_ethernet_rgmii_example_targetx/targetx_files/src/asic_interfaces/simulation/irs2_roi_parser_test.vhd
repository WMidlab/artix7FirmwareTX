--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:40:28 11/26/2012
-- Design Name:   
-- Module Name:   C:/cygwin/home/Dr Kurtis/idlab-scrod/SCROD-boardstack/new_daq_interface/src/asic_interfaces/simulation/irs2_roi_parser_test.vhd
-- Project Name:  USB_and_fiber_readout
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: irs2_roi_parser
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY irs2_roi_parser_test IS
END irs2_roi_parser_test;
 
ARCHITECTURE behavior OF irs2_roi_parser_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT irs2_roi_parser
    PORT(
         CLOCK : IN  std_logic;
         BEGIN_PARSING_FOR_WINDOWS : IN  std_logic;
         LAST_WINDOW_SAMPLED : IN  std_logic_vector(8 downto 0);
         FIRST_ALLOWED_WINDOW : IN  std_logic_vector(8 downto 0);
         LAST_ALLOWED_WINDOW : IN  std_logic_vector(8 downto 0);
         MAX_WINDOWS_TO_LOOK_BACK : IN  std_logic_vector(8 downto 0);
         MIN_WINDOWS_TO_LOOK_BACK : IN  std_logic_vector(8 downto 0);
			PEDESTAL_WINDOW : in  STD_LOGIC_VECTOR(8 downto 0);
			PEDESTAL_MODE : in  STD_LOGIC;
			FORCE_CHANNEL_MASK : in  STD_LOGIC_VECTOR(127 downto 0);
			IGNORE_CHANNEL_MASK : in  STD_LOGIC_VECTOR(127 downto 0);
         TRIGGER_MEMORY_READ_CLOCK : OUT  std_logic;
         TRIGGER_MEMORY_READ_ENABLE : OUT  std_logic;
         TRIGGER_MEMORY_READ_ADDRESS : OUT  std_logic_vector(9 downto 0);
         TRIGGER_MEMORY_DATA : IN  std_logic_vector(127 downto 0);
         NEXT_WINDOW_FIFO_READ_CLOCK : IN  std_logic;
         NEXT_WINDOW_FIFO_READ_ENABLE : IN  std_logic;
         NEXT_WINDOW_FIFO_EMPTY : OUT  std_logic;
         NEXT_WINDOW_FIFO_DATA : OUT  std_logic_vector(15 downto 0);
         NUMBER_OF_WAVEFORMS_FOUND_THIS_EVENT : OUT  std_logic_vector(9 downto 0);
         EVENT_WAS_TRUNCATED : OUT  std_logic;
			MAKE_READY_FOR_NEXT_EVENT            : in  STD_LOGIC;
			READY_FOR_TRIGGER                    : out STD_LOGIC;
			DONE_BUILDING_WINDOW_LIST            : out STD_LOGIC;
			VETO_NEW_EVENTS                      : in  STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal CLOCK : std_logic := '0';
   signal BEGIN_PARSING_FOR_WINDOWS : std_logic := '0';
   signal LAST_WINDOW_SAMPLED : std_logic_vector(8 downto 0) := '0' & x"07";
   signal FIRST_ALLOWED_WINDOW : std_logic_vector(8 downto 0) := '0' & x"03";
   signal LAST_ALLOWED_WINDOW : std_logic_vector(8 downto 0) := '0' & x"09";
   signal MAX_WINDOWS_TO_LOOK_BACK : std_logic_vector(8 downto 0) := '0' & x"05";
   signal MIN_WINDOWS_TO_LOOK_BACK : std_logic_vector(8 downto 0) := '0' & x"02";
   signal TRIGGER_MEMORY_DATA : std_logic_vector(127 downto 0) := (others => '0');
   signal NEXT_WINDOW_FIFO_READ_CLOCK : std_logic := '0';
	signal MAKE_READY_FOR_NEXT_EVENT : std_logic := '0';
   signal VETO_NEW_EVENTS : std_logic := '0';
	signal PEDESTAL_MODE : std_logic := '1';
	signal PEDESTAL_WINDOW : std_logic_vector(8 downto 0) := '0' & x"21";
	signal FORCE_CHANNEL_MASK  : std_logic_vector(127 downto 0) := (7 downto 0 => '1', others => '0');
	signal IGNORE_CHANNEL_MASK : std_logic_vector(127 downto 0) := (8 => '1', others => '0');

 	--Outputs
   signal TRIGGER_MEMORY_READ_CLOCK : std_logic;
   signal TRIGGER_MEMORY_READ_ENABLE : std_logic;
   signal TRIGGER_MEMORY_READ_ADDRESS : std_logic_vector(9 downto 0);
   signal NEXT_WINDOW_FIFO_READ_ENABLE : std_logic;
   signal NEXT_WINDOW_FIFO_EMPTY : std_logic;
   signal NEXT_WINDOW_FIFO_DATA : std_logic_vector(15 downto 0);
   signal NUMBER_OF_WAVEFORMS_FOUND_THIS_EVENT : std_logic_vector(9 downto 0);
   signal EVENT_WAS_TRUNCATED : std_logic;
   signal READY_FOR_TRIGGER : std_logic;
   signal DONE_BUILDING_WINDOW_LIST : std_logic;

   -- Clock period definitions
   constant CLOCK_period : time := 2 ns;
   constant TRIGGER_MEMORY_READ_CLOCK_period : time := 2 ns;
   constant NEXT_WINDOW_FIFO_READ_CLOCK_period : time := 2 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: irs2_roi_parser PORT MAP (
          CLOCK => CLOCK,
          BEGIN_PARSING_FOR_WINDOWS => BEGIN_PARSING_FOR_WINDOWS,
          LAST_WINDOW_SAMPLED => LAST_WINDOW_SAMPLED,
          FIRST_ALLOWED_WINDOW => FIRST_ALLOWED_WINDOW,
          LAST_ALLOWED_WINDOW => LAST_ALLOWED_WINDOW,
          MAX_WINDOWS_TO_LOOK_BACK => MAX_WINDOWS_TO_LOOK_BACK,
          MIN_WINDOWS_TO_LOOK_BACK => MIN_WINDOWS_TO_LOOK_BACK,
			 PEDESTAL_MODE => PEDESTAL_MODE,
			 PEDESTAL_WINDOW => PEDESTAL_WINDOW,
			 FORCE_CHANNEL_MASK => FORCE_CHANNEL_MASK,
			 IGNORE_CHANNEL_MASK => IGNORE_CHANNEL_MASK,
          TRIGGER_MEMORY_READ_CLOCK => TRIGGER_MEMORY_READ_CLOCK,
          TRIGGER_MEMORY_READ_ENABLE => TRIGGER_MEMORY_READ_ENABLE,
          TRIGGER_MEMORY_READ_ADDRESS => TRIGGER_MEMORY_READ_ADDRESS,
          TRIGGER_MEMORY_DATA => TRIGGER_MEMORY_DATA,
          NEXT_WINDOW_FIFO_READ_CLOCK => NEXT_WINDOW_FIFO_READ_CLOCK,
          NEXT_WINDOW_FIFO_READ_ENABLE => NEXT_WINDOW_FIFO_READ_ENABLE,
          NEXT_WINDOW_FIFO_EMPTY => NEXT_WINDOW_FIFO_EMPTY,
          NEXT_WINDOW_FIFO_DATA => NEXT_WINDOW_FIFO_DATA,
          NUMBER_OF_WAVEFORMS_FOUND_THIS_EVENT => NUMBER_OF_WAVEFORMS_FOUND_THIS_EVENT,
          EVENT_WAS_TRUNCATED => EVENT_WAS_TRUNCATED,
			 MAKE_READY_FOR_NEXT_EVENT => MAKE_READY_FOR_NEXT_EVENT,
          READY_FOR_TRIGGER => READY_FOR_TRIGGER,
          DONE_BUILDING_WINDOW_LIST => DONE_BUILDING_WINDOW_LIST,
          VETO_NEW_EVENTS => VETO_NEW_EVENTS
        );

   -- Clock process definitions
   CLOCK_process :process
   begin
		CLOCK <= '0';
		wait for CLOCK_period/2;
		CLOCK <= '1';
		wait for CLOCK_period/2;
   end process;
 
   TRIGGER_MEMORY_READ_CLOCK_process :process
   begin
		TRIGGER_MEMORY_READ_CLOCK <= '0';
		wait for TRIGGER_MEMORY_READ_CLOCK_period/2;
		TRIGGER_MEMORY_READ_CLOCK <= '1';
		wait for TRIGGER_MEMORY_READ_CLOCK_period/2;
   end process;
 
   NEXT_WINDOW_FIFO_READ_CLOCK_process :process
   begin
		NEXT_WINDOW_FIFO_READ_CLOCK <= '0';
		wait for NEXT_WINDOW_FIFO_READ_CLOCK_period/2;
		NEXT_WINDOW_FIFO_READ_CLOCK <= '1';
		wait for NEXT_WINDOW_FIFO_READ_CLOCK_period/2;
   end process;

	process(TRIGGER_MEMORY_READ_ADDRESS) begin
		TRIGGER_MEMORY_DATA <= (others => '0');
		if (TRIGGER_MEMORY_READ_ADDRESS = "0000000111") then
			TRIGGER_MEMORY_DATA(8)   <= '1';
			TRIGGER_MEMORY_DATA(121) <= '1';
		end if;
	end process;

	process(NEXT_WINDOW_FIFO_READ_CLOCK, NEXT_WINDOW_FIFO_EMPTY) begin
		if (rising_edge(NEXT_WINDOW_FIFO_READ_CLOCK)) then
			if (NEXT_WINDOW_FIFO_EMPTY <= '0') then
				NEXT_WINDOW_FIFO_READ_ENABLE <= '1';
			end if;
		end if;
	end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLOCK_period*10;

      -- insert stimulus here 
		BEGIN_PARSING_FOR_WINDOWS <= '1';
		wait for CLOCK_period;
		BEGIN_PARSING_FOR_WINDOWS <= '0';

      wait;
   end process;

END;
