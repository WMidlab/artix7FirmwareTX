--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:47:31 09/17/2014
-- Design Name:   
-- Module Name:   C:/Users/isar/Documents/code4/TX9UMB-2/ise-project/tb_update_status_reg01.vhd
-- Project Name:  scrod-boardstack-new-daq-interface
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: update_status_regs
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
 use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;
use work.readout_definitions.all;


ENTITY tb_update_status_reg01 IS
END tb_update_status_reg01;
 
ARCHITECTURE behavior OF tb_update_status_reg01 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT update_status_regs
    PORT(
         clk : IN  std_logic;
         update : IN  std_logic;
         status_regs : OUT  STATREG;
         busy : OUT  std_logic;
         AMUX : OUT  std_logic_vector(7 downto 0);
         SDA_MON : INOUT  std_logic;
         SCL_MON : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal update : std_logic := '0';

	--BiDirs
   signal SDA_MON : std_logic;

 	--Outputs
   signal status_regs : STATREG;
   signal busy : std_logic;
   signal AMUX : std_logic_vector(7 downto 0);
   signal SCL_MON : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: update_status_regs PORT MAP (
          clk => clk,
          update => update,
          status_regs => status_regs,
          busy => busy,
          AMUX => AMUX,
          SDA_MON => SDA_MON,
          SCL_MON => SCL_MON
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
	update<='1';
	
      wait;
   end process;

END;
