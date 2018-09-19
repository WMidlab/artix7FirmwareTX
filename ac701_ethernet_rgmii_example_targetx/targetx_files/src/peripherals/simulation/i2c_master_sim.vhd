--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:14:39 09/27/2012
-- Design Name:   
-- Module Name:   C:/cygwin/home/Dr Kurtis/idlab-general/USB_and_fiber_readout/firmware/FPGA/src/peripherals/simulation/i2c_master_sim.vhd
-- Project Name:  USB_and_fiber_readout
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: i2c_master
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
 
ENTITY i2c_master_sim IS
END i2c_master_sim;
 
ARCHITECTURE behavior OF i2c_master_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT i2c_master
    PORT(
         I2C_BYTE_TO_SEND : IN  std_logic_vector(7 downto 0);
         I2C_BYTE_RECEIVED : OUT  std_logic_vector(7 downto 0);
         ACKNOWLEDGED : OUT  std_logic;
         SEND_START : IN  std_logic;
         SEND_BYTE : IN  std_logic;
         READ_BYTE : IN  std_logic;
         SEND_STOP : IN  std_logic;
         BUSY : OUT  std_logic;
         WAITING : OUT  std_logic;
         CLOCK : IN  std_logic;
         SCL : INOUT  std_logic;
         SDA : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal I2C_BYTE_TO_SEND : std_logic_vector(7 downto 0) := (others => '0');
   signal SEND_START : std_logic := '0';
   signal SEND_BYTE : std_logic := '0';
   signal READ_BYTE : std_logic := '0';
   signal SEND_STOP : std_logic := '0';
   signal CLOCK : std_logic := '0';

	--BiDirs
   signal SCL : std_logic;
   signal SDA : std_logic;

 	--Outputs
   signal I2C_BYTE_RECEIVED : std_logic_vector(7 downto 0);
   signal ACKNOWLEDGED : std_logic;
   signal BUSY : std_logic;
   signal WAITING : std_logic;

   -- Clock period definitions
   constant CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: i2c_master PORT MAP (
          I2C_BYTE_TO_SEND => I2C_BYTE_TO_SEND,
          I2C_BYTE_RECEIVED => I2C_BYTE_RECEIVED,
          ACKNOWLEDGED => ACKNOWLEDGED,
          SEND_START => SEND_START,
          SEND_BYTE => SEND_BYTE,
          READ_BYTE => READ_BYTE,
          SEND_STOP => SEND_STOP,
          BUSY => BUSY,
          WAITING => WAITING,
          CLOCK => CLOCK,
          SCL => SCL,
          SDA => SDA
        );

   -- Clock process definitions
   CLOCK_process :process
   begin
		CLOCK <= '0';
		wait for CLOCK_period/2;
		CLOCK <= '1';
		wait for CLOCK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLOCK_period*10;

      -- insert stimulus here 
		SEND_START <= '1';
		SEND_BYTE <= '0';
		READ_BYTE <= '0';
		SEND_STOP <= '0';
		I2C_BYTE_TO_SEND <= x"00";
		wait for CLOCK_PERIOD*1;
		SEND_START <= '0';
		SEND_BYTE <= '0';
		READ_BYTE <= '0';
		SEND_STOP <= '0';
		wait for CLOCK_PERIOD*1;
		SEND_START <= '0';
		SEND_BYTE <= '1';
		READ_BYTE <= '0';
		SEND_STOP <= '0';
		I2C_BYTE_TO_SEND <= "11001010";
		wait for CLOCK_PERIOD*40;
		SEND_START <= '0';
		SEND_BYTE <= '0';
		READ_BYTE <= '0';
		SEND_STOP <= '0';
      wait;
   end process;

END;
