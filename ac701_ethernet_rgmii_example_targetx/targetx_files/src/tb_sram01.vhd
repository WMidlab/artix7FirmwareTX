--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:52:18 08/23/2014
-- Design Name:   
-- Module Name:   C:/Users/isar/Documents/code4/TX9UMB-2/src/tb_sram01.vhd
-- Project Name:  scrod-boardstack-new-daq-interface
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SRAMiface1
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
 
ENTITY tb_sram01 IS
END tb_sram01;
 
ARCHITECTURE behavior OF tb_sram01 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SRAMiface1
    PORT(
         clk : IN  std_logic;
         addr : IN  std_logic_vector(20 downto 0);
         dw : IN  std_logic_vector(15 downto 0);
         dr : OUT  std_logic_vector(15 downto 0);
         rw : IN  std_logic;
         update : IN  std_logic;
         busy : OUT  std_logic;
         A : OUT  std_logic_vector(20 downto 0);
         IO : INOUT  std_logic_vector(15 downto 0);
         BYTEb : OUT  std_logic;
         BHEb : OUT  std_logic;
         WEb : OUT  std_logic;
         CE2 : OUT  std_logic;
         CE1b : OUT  std_logic;
         OEb : OUT  std_logic;
         BLEb : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal addr : std_logic_vector(20 downto 0) := (others => '0');
   signal dr : std_logic_vector(15 downto 0) := (others => '0');
	signal dw : std_logic_vector(15 downto 0) := (others => '0');

   signal rw : std_logic := '0';
   signal update : std_logic := '0';

	--BiDirs
   signal IO : std_logic_vector(15 downto 0);

 	--Outputs
   signal do : std_logic_vector(15 downto 0);
   signal busy : std_logic;
   signal A : std_logic_vector(20 downto 0);
   signal BYTEb : std_logic;
   signal BHEb : std_logic;
   signal WEb : std_logic;
   signal CE2 : std_logic;
   signal CE1b : std_logic;
   signal OEb : std_logic;
   signal BLEb : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SRAMiface1 PORT MAP (
          clk => clk,
          addr => addr,
          dw => dw,
          dr => dr,
          rw => rw,
          update => update,
          busy => busy,
          A => A,
          IO => IO,
          BYTEb => BYTEb,
          BHEb => BHEb,
          WEb => WEb,
          CE2 => CE2,
          CE1b => CE1b,
          OEb => OEb,
          BLEb => BLEb
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
	  addr <= '1' & x"541A3";
	  dw <=x"ABCD";
	  rw<='1';
	  
	  wait for 15 ns;
	  update<='1';
	  
	  wait for 24 ns;
	  update<='0';
	  wait for 25 ns;
	  update<='1';
	  
		wait for 300 ns;
		update<='0';
		addr <= '0' & x"0002A";
	  
		wait for 24 ns;
		update<='1';

		wait for 300 ns;
		update<='0';
		rw<='0';
		
		wait for 24 ns;
		update<='1';

      wait;
   end process;

END;
