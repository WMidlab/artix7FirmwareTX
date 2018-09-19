--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:10:23 10/11/2014
-- Design Name:   
-- Module Name:   C:/Users/isar/Documents/code4/TX9UMB-3/ise-project/tb_sramsched02.vhd
-- Project Name:  scrod-A4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SRAMscheduler
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
use work.readout_definitions.all;

 
ENTITY tb_sramsched02 IS
END tb_sramsched02;
 
ARCHITECTURE behavior OF tb_sramsched02 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SRAMscheduler
    PORT(
         clk : IN  std_logic;
         Ain : IN  AddrArray;
         DWin : IN  DataArray;
         DRout : OUT  DataArray;
         rw : IN  std_logic_vector(3 downto 0);
         update_req : IN  std_logic_vector(3 downto 0);
         busy : OUT  std_logic_vector(3 downto 0);
         A : OUT  std_logic_vector(21 downto 0);
         IO : INOUT  std_logic_vector(7 downto 0);
         WEb : OUT  std_logic;
         CE2 : OUT  std_logic;
         CE1b : OUT  std_logic;
         OEb : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal Ain : AddrArray;--:= (others => '0');
   signal DWin : DataArray;-- := (others => '0');
   signal rw : std_logic_vector(3 downto 0) := (others => '0');
   signal update_req : std_logic_vector(3 downto 0) := (others => '0');

	--BiDirs
   signal IO : std_logic_vector(7 downto 0);

 	--Outputs
   signal DRout : DataArray;
   signal busy : std_logic_vector(3 downto 0);
   signal A : std_logic_vector(21 downto 0);
   signal WEb : std_logic;
   signal CE2 : std_logic;
   signal CE1b : std_logic;
   signal OEb : std_logic;

   -- Clock period definitions
   constant clk_period : time := 16 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SRAMscheduler PORT MAP (
          clk => clk,
          Ain => Ain,
          DWin => DWin,
          DRout => DRout,
          rw => rw,
          update_req => update_req,
          busy => busy,
          A => A,
          IO => IO,
          WEb => WEb,
          CE2 => CE2,
          CE1b => CE1b,
          OEb => OEb
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
		Ain(3)<="000000"& x"A3A3";
		Ain(2)<="000000"& x"A2A2";
		Ain(1)<="000000"& x"A1A1";
		Ain(0)<="000000"& x"A0A0";

      wait for clk_period*10;
		--Ain(3)<="00000"& x"A3A3";
		update_req<="0000";
		
		wait for 100 ns;	
		update_req<="0111";		
		
		wait for 100 ns;	
		update_req<="0001";

		wait for 100 ns;	
		update_req<="1111";

		wait for 2000 ns;	
		update_req<="0010";

      -- insert stimulus here 

      wait;
   end process;

END;
