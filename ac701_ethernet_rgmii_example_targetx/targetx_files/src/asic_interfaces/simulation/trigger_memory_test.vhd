--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:52:54 12/05/2012
-- Design Name:   
-- Module Name:   C:/cygwin/home/Dr Kurtis/idlab-scrod/SCROD-boardstack/new_daq_interface/src/asic_interfaces/simulation/trigger_memory_test.vhd
-- Project Name:  USB_and_fiber_readout
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: trigger_memory
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
use ieee.NUMERIC_STD.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY trigger_memory_test IS
END trigger_memory_test;
 
ARCHITECTURE behavior OF trigger_memory_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT trigger_memory
    PORT(
         CLOCK_4xSST : IN  std_logic;
         ASIC_TRIGGER_BITS : IN  std_logic_vector(127 downto 0);
         ROI_ADDRESS_ADJUST : IN  std_logic_vector(9 downto 0);
         FIRST_ALLOWED_ADDRESS : IN  std_logic_vector(8 downto 0);
         LAST_ALLOWED_ADDRESS : IN  std_logic_vector(8 downto 0);
         CONTINUE_WRITING : IN  std_logic;
         CURRENT_ASIC_SAMPLING_TO_STORAGE_ADDRESS : IN  std_logic_vector(8 downto 0);
         TRIGGER_MEMORY_READ_CLOCK : IN  std_logic;
         TRIGGER_MEMORY_READ_ENABLE : IN  std_logic;
         TRIGGER_MEMORY_READ_ADDRESS : IN  std_logic_vector(9 downto 0);
         TRIGGER_MEMORY_DATA : OUT  std_logic_vector(127 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLOCK_4xSST : std_logic := '0';
   signal ASIC_TRIGGER_BITS : std_logic_vector(127 downto 0) := (others => '0');
   signal ROI_ADDRESS_ADJUST : std_logic_vector(9 downto 0) := (others => '0');
   signal FIRST_ALLOWED_ADDRESS : std_logic_vector(8 downto 0) := (others => '0');
   signal LAST_ALLOWED_ADDRESS : std_logic_vector(8 downto 0) := (others => '0');
   signal CONTINUE_WRITING : std_logic := '0';
   signal CURRENT_ASIC_SAMPLING_TO_STORAGE_ADDRESS : std_logic_vector(8 downto 0) := (others => '0');
   signal TRIGGER_MEMORY_READ_CLOCK : std_logic := '0';
   signal TRIGGER_MEMORY_READ_ENABLE : std_logic := '0';
   signal TRIGGER_MEMORY_READ_ADDRESS : std_logic_vector(9 downto 0) := (others => '0');

 	--Outputs
   signal TRIGGER_MEMORY_DATA : std_logic_vector(127 downto 0);

   -- Clock period definitions
   constant CLOCK_4xSST_period : time := 10 ns;
   constant TRIGGER_MEMORY_READ_CLOCK_period : time := 10 ns;
	signal internal_CLK_2xSST : std_logic := '0';
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: trigger_memory PORT MAP (
          CLOCK_4xSST => CLOCK_4xSST,
          ASIC_TRIGGER_BITS => ASIC_TRIGGER_BITS,
          ROI_ADDRESS_ADJUST => ROI_ADDRESS_ADJUST,
          FIRST_ALLOWED_ADDRESS => FIRST_ALLOWED_ADDRESS,
          LAST_ALLOWED_ADDRESS => LAST_ALLOWED_ADDRESS,
          CONTINUE_WRITING => CONTINUE_WRITING,
          CURRENT_ASIC_SAMPLING_TO_STORAGE_ADDRESS => CURRENT_ASIC_SAMPLING_TO_STORAGE_ADDRESS,
          TRIGGER_MEMORY_READ_CLOCK => TRIGGER_MEMORY_READ_CLOCK,
          TRIGGER_MEMORY_READ_ENABLE => TRIGGER_MEMORY_READ_ENABLE,
          TRIGGER_MEMORY_READ_ADDRESS => TRIGGER_MEMORY_READ_ADDRESS,
          TRIGGER_MEMORY_DATA => TRIGGER_MEMORY_DATA
        );

   -- Clock process definitions
   CLOCK_4xSST_process :process
   begin
		CLOCK_4xSST <= '0';
		wait for CLOCK_4xSST_period/2;
		CLOCK_4xSST <= '1';
		wait for CLOCK_4xSST_period/2;
   end process;

   CLOCK_2xSST_process :process
   begin
		internal_CLK_2xSST <= '0';
		wait for CLOCK_4xSST_period/2*2;
		internal_CLK_2xSST <= '1';
		wait for CLOCK_4xSST_period/2*2;
   end process;
	
	ADDRESS_INCR_PROCESS : process(internal_CLK_2xSST)
	begin
		if (rising_edge(internal_CLK_2xSST)) then
			if (unsigned(CURRENT_ASIC_SAMPLING_TO_STORAGE_ADDRESS) < unsigned(LAST_ALLOWED_ADDRESS)) then
				CURRENT_ASIC_SAMPLING_TO_STORAGE_ADDRESS <= std_logic_vector(unsigned(CURRENT_ASIC_SAMPLING_TO_STORAGE_ADDRESS) + 1);
			else
				CURRENT_ASIC_SAMPLING_TO_STORAGE_ADDRESS <= FIRST_ALLOWED_ADDRESS;
			end if;
		end if;
	end process;
 
   TRIGGER_MEMORY_READ_CLOCK_process :process
   begin
		TRIGGER_MEMORY_READ_CLOCK <= '0';
		wait for TRIGGER_MEMORY_READ_CLOCK_period/2;
		TRIGGER_MEMORY_READ_CLOCK <= '1';
		wait for TRIGGER_MEMORY_READ_CLOCK_period/2;
   end process;
 
	ASIC_TRIGGER_BITS <= (others => '0');
	CONTINUE_WRITING  <= '1';
	
	ROI_ADDRESS_ADJUST <= std_logic_vector(to_signed(4,ROI_ADDRESS_ADJUST'length));
	FIRST_ALLOWED_ADDRESS <= std_logic_vector(to_unsigned(4,FIRST_ALLOWED_ADDRESS'length));
	LAST_ALLOWED_ADDRESS <= std_logic_vector(to_unsigned(63,LAST_ALLOWED_ADDRESS'length));

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLOCK_4xSST_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
