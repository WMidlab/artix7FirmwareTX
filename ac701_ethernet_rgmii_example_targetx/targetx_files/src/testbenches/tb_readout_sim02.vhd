--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:56:57 02/12/2015
-- Design Name:   
-- Module Name:   C:/Users/isar/Documents/code4/TX9UMB-3/ise-project/tb_readout_sim02.vhd
-- Project Name:  scrod-A4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: scrod_top_A4_sim
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
 
ENTITY tb_readout_sim02 IS
END tb_readout_sim02;
 
ARCHITECTURE behavior OF tb_readout_sim02 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT scrod_top_A4_sim
    PORT(
         BOARD_CLOCKP : IN  std_logic;
         BOARD_CLOCKN : IN  std_logic;
         LEDS : OUT  std_logic_vector(12 downto 0);
         RJ45_ACK_P : OUT  std_logic;
         RJ45_ACK_N : OUT  std_logic;
         RJ45_TRG_P : IN  std_logic;
         RJ45_TRG_N : IN  std_logic;
         RJ45_RSV_P : OUT  std_logic;
         RJ45_RSV_N : OUT  std_logic;
         RJ45_CLK_P : IN  std_logic;
         RJ45_CLK_N : IN  std_logic;
         mgttxfault : IN  std_logic_vector(1 downto 1);
         mgtmod0 : IN  std_logic_vector(1 downto 1);
         mgtlos : IN  std_logic_vector(1 downto 1);
         mgttxdis : OUT  std_logic_vector(1 downto 1);
         mgtmod2 : OUT  std_logic_vector(1 downto 1);
         mgtmod1 : OUT  std_logic_vector(1 downto 1);
         mgtrxp : IN  std_logic;
         mgtrxn : IN  std_logic;
         mgttxp : OUT  std_logic;
         mgttxn : OUT  std_logic;
         status_fake : OUT  std_logic;
         control_fake : OUT  std_logic;
         mgtclk0p : IN  std_logic;
         mgtclk0n : IN  std_logic;
         mgtclk1p : IN  std_logic;
         mgtclk1n : IN  std_logic;
         EX_TRIGGER_MB : OUT  std_logic;
         EX_TRIGGER_SCROD : OUT  std_logic;
         BUS_REGCLR : OUT  std_logic;
         BUSA_WR_ADDRCLR : OUT  std_logic;
         BUSA_RD_ENA : OUT  std_logic;
         BUSA_RD_ROWSEL_S : OUT  std_logic_vector(2 downto 0);
         BUSA_RD_COLSEL_S : OUT  std_logic_vector(5 downto 0);
         BUSA_CLR : OUT  std_logic;
         BUSA_RAMP : OUT  std_logic;
         BUSA_SAMPLESEL_S : OUT  std_logic_vector(4 downto 0);
         BUSA_SR_CLEAR : OUT  std_logic;
         BUSA_SR_SEL : OUT  std_logic;
         BUSA_DO : IN  std_logic_vector(15 downto 0);
         BUSB_WR_ADDRCLR : OUT  std_logic;
         BUSB_RD_ENA : OUT  std_logic;
         BUSB_RD_ROWSEL_S : OUT  std_logic_vector(2 downto 0);
         BUSB_RD_COLSEL_S : OUT  std_logic_vector(5 downto 0);
         BUSB_CLR : OUT  std_logic;
         BUSB_RAMP : OUT  std_logic;
         BUSB_SAMPLESEL_S : OUT  std_logic_vector(4 downto 0);
         BUSB_SR_CLEAR : OUT  std_logic;
         BUSB_SR_SEL : OUT  std_logic;
         BUSB_DO : IN  std_logic_vector(15 downto 0);
         SIN : OUT  std_logic_vector(9 downto 0);
         PCLK : OUT  std_logic_vector(9 downto 0);
         SHOUT : IN  std_logic_vector(9 downto 0);
         SCLK : OUT  std_logic_vector(9 downto 0);
         WL_CLK_N : OUT  std_logic_vector(9 downto 0);
         WL_CLK_P : OUT  std_logic_vector(9 downto 0);
         WR1_ENA : OUT  std_logic_vector(9 downto 0);
         WR2_ENA : OUT  std_logic_vector(9 downto 0);
         SSTIN_N : OUT  std_logic_vector(9 downto 0);
         SSTIN_P : OUT  std_logic_vector(9 downto 0);
         SR_CLOCK : OUT  std_logic_vector(9 downto 0);
         SAMPLESEL_ANY : OUT  std_logic_vector(9 downto 0);
         BUSA_SCK_DAC : OUT  std_logic;
         BUSA_DIN_DAC : OUT  std_logic;
         BUSB_SCK_DAC : OUT  std_logic;
         BUSB_DIN_DAC : OUT  std_logic;
         TDC1_TRG : IN  std_logic_vector(4 downto 0);
         TDC2_TRG : IN  std_logic_vector(4 downto 0);
         TDC3_TRG : IN  std_logic_vector(4 downto 0);
         TDC4_TRG : IN  std_logic_vector(4 downto 0);
         TDC5_TRG : IN  std_logic_vector(4 downto 0);
         TDC6_TRG : IN  std_logic_vector(4 downto 0);
         TDC7_TRG : IN  std_logic_vector(4 downto 0);
         TDC8_TRG : IN  std_logic_vector(4 downto 0);
         TDC9_TRG : IN  std_logic_vector(4 downto 0);
         TDC10_TRG : IN  std_logic_vector(4 downto 0);
         TDC_CS_DAC : OUT  std_logic_vector(9 downto 0);
         TDC_AMUX_S : OUT  std_logic_vector(3 downto 0);
         TOP_AMUX_S : OUT  std_logic_vector(3 downto 0);
         USB_IFCLK : IN  std_logic;
         USB_CTL0 : IN  std_logic;
         USB_CTL1 : IN  std_logic;
         USB_CTL2 : IN  std_logic;
         USB_FDD : INOUT  std_logic_vector(15 downto 0);
         USB_PA0 : OUT  std_logic;
         USB_PA1 : OUT  std_logic;
         USB_PA2 : OUT  std_logic;
         USB_PA3 : OUT  std_logic;
         USB_PA4 : OUT  std_logic;
         USB_PA5 : OUT  std_logic;
         USB_PA6 : OUT  std_logic;
         USB_PA7 : IN  std_logic;
         USB_RDY0 : OUT  std_logic;
         USB_RDY1 : OUT  std_logic;
         USB_WAKEUP : IN  std_logic;
         USB_CLKOUT : IN  std_logic;
         RAM_A : OUT  std_logic_vector(21 downto 0);
         RAM_IO : INOUT  std_logic_vector(7 downto 0);
         RAM_CE1n : OUT  std_logic;
         RAM_CE2 : OUT  std_logic;
         RAM_OEn : OUT  std_logic;
         RAM_WEn : OUT  std_logic;
         SCL_MON : OUT  std_logic;
         SDA_MON : INOUT  std_logic;
         TDC_DONE : IN  std_logic_vector(9 downto 0);
         TDC_MON_TIMING : IN  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal BOARD_CLOCKP : std_logic := '0';
   signal BOARD_CLOCKN : std_logic := '0';
   signal RJ45_TRG_P : std_logic := '0';
   signal RJ45_TRG_N : std_logic := '0';
   signal RJ45_CLK_P : std_logic := '0';
   signal RJ45_CLK_N : std_logic := '0';
   signal mgttxfault : std_logic_vector(1 downto 1) := (others => '0');
   signal mgtmod0 : std_logic_vector(1 downto 1) := (others => '0');
   signal mgtlos : std_logic_vector(1 downto 1) := (others => '0');
   signal mgtrxp : std_logic := '0';
   signal mgtrxn : std_logic := '0';
   signal mgtclk0p : std_logic := '0';
   signal mgtclk0n : std_logic := '0';
   signal mgtclk1p : std_logic := '0';
   signal mgtclk1n : std_logic := '0';
   signal BUSA_DO : std_logic_vector(15 downto 0) := (others => '0');
   signal BUSB_DO : std_logic_vector(15 downto 0) := (others => '0');
   signal SHOUT : std_logic_vector(9 downto 0) := (others => '0');
   signal TDC1_TRG : std_logic_vector(4 downto 0) := (others => '0');
   signal TDC2_TRG : std_logic_vector(4 downto 0) := (others => '0');
   signal TDC3_TRG : std_logic_vector(4 downto 0) := (others => '0');
   signal TDC4_TRG : std_logic_vector(4 downto 0) := (others => '0');
   signal TDC5_TRG : std_logic_vector(4 downto 0) := (others => '0');
   signal TDC6_TRG : std_logic_vector(4 downto 0) := (others => '0');
   signal TDC7_TRG : std_logic_vector(4 downto 0) := (others => '0');
   signal TDC8_TRG : std_logic_vector(4 downto 0) := (others => '0');
   signal TDC9_TRG : std_logic_vector(4 downto 0) := (others => '0');
   signal TDC10_TRG : std_logic_vector(4 downto 0) := (others => '0');
   signal USB_IFCLK : std_logic := '0';
   signal USB_CTL0 : std_logic := '0';
   signal USB_CTL1 : std_logic := '0';
   signal USB_CTL2 : std_logic := '0';
   signal USB_PA7 : std_logic := '0';
   signal USB_WAKEUP : std_logic := '0';
   signal USB_CLKOUT : std_logic := '0';
   signal TDC_DONE : std_logic_vector(9 downto 0) := (others => '0');
   signal TDC_MON_TIMING : std_logic_vector(9 downto 0) := (others => '0');

	--BiDirs
   signal USB_FDD : std_logic_vector(15 downto 0);
   signal RAM_IO : std_logic_vector(7 downto 0);
   signal SDA_MON : std_logic;

 	--Outputs
   signal LEDS : std_logic_vector(12 downto 0);
   signal RJ45_ACK_P : std_logic;
   signal RJ45_ACK_N : std_logic;
   signal RJ45_RSV_P : std_logic;
   signal RJ45_RSV_N : std_logic;
   signal mgttxdis : std_logic_vector(1 downto 1);
   signal mgtmod2 : std_logic_vector(1 downto 1);
   signal mgtmod1 : std_logic_vector(1 downto 1);
   signal mgttxp : std_logic;
   signal mgttxn : std_logic;
   signal status_fake : std_logic;
   signal control_fake : std_logic;
   signal EX_TRIGGER_MB : std_logic;
   signal EX_TRIGGER_SCROD : std_logic;
   signal BUS_REGCLR : std_logic;
   signal BUSA_WR_ADDRCLR : std_logic;
   signal BUSA_RD_ENA : std_logic;
   signal BUSA_RD_ROWSEL_S : std_logic_vector(2 downto 0);
   signal BUSA_RD_COLSEL_S : std_logic_vector(5 downto 0);
   signal BUSA_CLR : std_logic;
   signal BUSA_RAMP : std_logic;
   signal BUSA_SAMPLESEL_S : std_logic_vector(4 downto 0);
   signal BUSA_SR_CLEAR : std_logic;
   signal BUSA_SR_SEL : std_logic;
   signal BUSB_WR_ADDRCLR : std_logic;
   signal BUSB_RD_ENA : std_logic;
   signal BUSB_RD_ROWSEL_S : std_logic_vector(2 downto 0);
   signal BUSB_RD_COLSEL_S : std_logic_vector(5 downto 0);
   signal BUSB_CLR : std_logic;
   signal BUSB_RAMP : std_logic;
   signal BUSB_SAMPLESEL_S : std_logic_vector(4 downto 0);
   signal BUSB_SR_CLEAR : std_logic;
   signal BUSB_SR_SEL : std_logic;
   signal SIN : std_logic_vector(9 downto 0);
   signal PCLK : std_logic_vector(9 downto 0);
   signal SCLK : std_logic_vector(9 downto 0);
   signal WL_CLK_N : std_logic_vector(9 downto 0);
   signal WL_CLK_P : std_logic_vector(9 downto 0);
   signal WR1_ENA : std_logic_vector(9 downto 0);
   signal WR2_ENA : std_logic_vector(9 downto 0);
   signal SSTIN_N : std_logic_vector(9 downto 0);
   signal SSTIN_P : std_logic_vector(9 downto 0);
   signal SR_CLOCK : std_logic_vector(9 downto 0);
   signal SAMPLESEL_ANY : std_logic_vector(9 downto 0);
   signal BUSA_SCK_DAC : std_logic;
   signal BUSA_DIN_DAC : std_logic;
   signal BUSB_SCK_DAC : std_logic;
   signal BUSB_DIN_DAC : std_logic;
   signal TDC_CS_DAC : std_logic_vector(9 downto 0);
   signal TDC_AMUX_S : std_logic_vector(3 downto 0);
   signal TOP_AMUX_S : std_logic_vector(3 downto 0);
   signal USB_PA0 : std_logic;
   signal USB_PA1 : std_logic;
   signal USB_PA2 : std_logic;
   signal USB_PA3 : std_logic;
   signal USB_PA4 : std_logic;
   signal USB_PA5 : std_logic;
   signal USB_PA6 : std_logic;
   signal USB_RDY0 : std_logic;
   signal USB_RDY1 : std_logic;
   signal RAM_A : std_logic_vector(21 downto 0);
   signal RAM_CE1n : std_logic;
   signal RAM_CE2 : std_logic;
   signal RAM_OEn : std_logic;
   signal RAM_WEn : std_logic;
   signal SCL_MON : std_logic;

   -- Clock period definitions
   constant PCLK_period : time := 10 ns;
   constant SCLK_period : time := 10 ns;
   constant SR_CLOCK_period : time := 10 ns;
   constant USB_IFCLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: scrod_top_A4_sim PORT MAP (
          BOARD_CLOCKP => BOARD_CLOCKP,
          BOARD_CLOCKN => BOARD_CLOCKN,
          LEDS => LEDS,
          RJ45_ACK_P => RJ45_ACK_P,
          RJ45_ACK_N => RJ45_ACK_N,
          RJ45_TRG_P => RJ45_TRG_P,
          RJ45_TRG_N => RJ45_TRG_N,
          RJ45_RSV_P => RJ45_RSV_P,
          RJ45_RSV_N => RJ45_RSV_N,
          RJ45_CLK_P => RJ45_CLK_P,
          RJ45_CLK_N => RJ45_CLK_N,
          mgttxfault => mgttxfault,
          mgtmod0 => mgtmod0,
          mgtlos => mgtlos,
          mgttxdis => mgttxdis,
          mgtmod2 => mgtmod2,
          mgtmod1 => mgtmod1,
          mgtrxp => mgtrxp,
          mgtrxn => mgtrxn,
          mgttxp => mgttxp,
          mgttxn => mgttxn,
          status_fake => status_fake,
          control_fake => control_fake,
          mgtclk0p => mgtclk0p,
          mgtclk0n => mgtclk0n,
          mgtclk1p => mgtclk1p,
          mgtclk1n => mgtclk1n,
          EX_TRIGGER_MB => EX_TRIGGER_MB,
          EX_TRIGGER_SCROD => EX_TRIGGER_SCROD,
          BUS_REGCLR => BUS_REGCLR,
          BUSA_WR_ADDRCLR => BUSA_WR_ADDRCLR,
          BUSA_RD_ENA => BUSA_RD_ENA,
          BUSA_RD_ROWSEL_S => BUSA_RD_ROWSEL_S,
          BUSA_RD_COLSEL_S => BUSA_RD_COLSEL_S,
          BUSA_CLR => BUSA_CLR,
          BUSA_RAMP => BUSA_RAMP,
          BUSA_SAMPLESEL_S => BUSA_SAMPLESEL_S,
          BUSA_SR_CLEAR => BUSA_SR_CLEAR,
          BUSA_SR_SEL => BUSA_SR_SEL,
          BUSA_DO => BUSA_DO,
          BUSB_WR_ADDRCLR => BUSB_WR_ADDRCLR,
          BUSB_RD_ENA => BUSB_RD_ENA,
          BUSB_RD_ROWSEL_S => BUSB_RD_ROWSEL_S,
          BUSB_RD_COLSEL_S => BUSB_RD_COLSEL_S,
          BUSB_CLR => BUSB_CLR,
          BUSB_RAMP => BUSB_RAMP,
          BUSB_SAMPLESEL_S => BUSB_SAMPLESEL_S,
          BUSB_SR_CLEAR => BUSB_SR_CLEAR,
          BUSB_SR_SEL => BUSB_SR_SEL,
          BUSB_DO => BUSB_DO,
          SIN => SIN,
          PCLK => PCLK,
          SHOUT => SHOUT,
          SCLK => SCLK,
          WL_CLK_N => WL_CLK_N,
          WL_CLK_P => WL_CLK_P,
          WR1_ENA => WR1_ENA,
          WR2_ENA => WR2_ENA,
          SSTIN_N => SSTIN_N,
          SSTIN_P => SSTIN_P,
          SR_CLOCK => SR_CLOCK,
          SAMPLESEL_ANY => SAMPLESEL_ANY,
          BUSA_SCK_DAC => BUSA_SCK_DAC,
          BUSA_DIN_DAC => BUSA_DIN_DAC,
          BUSB_SCK_DAC => BUSB_SCK_DAC,
          BUSB_DIN_DAC => BUSB_DIN_DAC,
          TDC1_TRG => TDC1_TRG,
          TDC2_TRG => TDC2_TRG,
          TDC3_TRG => TDC3_TRG,
          TDC4_TRG => TDC4_TRG,
          TDC5_TRG => TDC5_TRG,
          TDC6_TRG => TDC6_TRG,
          TDC7_TRG => TDC7_TRG,
          TDC8_TRG => TDC8_TRG,
          TDC9_TRG => TDC9_TRG,
          TDC10_TRG => TDC10_TRG,
          TDC_CS_DAC => TDC_CS_DAC,
          TDC_AMUX_S => TDC_AMUX_S,
          TOP_AMUX_S => TOP_AMUX_S,
          USB_IFCLK => USB_IFCLK,
          USB_CTL0 => USB_CTL0,
          USB_CTL1 => USB_CTL1,
          USB_CTL2 => USB_CTL2,
          USB_FDD => USB_FDD,
          USB_PA0 => USB_PA0,
          USB_PA1 => USB_PA1,
          USB_PA2 => USB_PA2,
          USB_PA3 => USB_PA3,
          USB_PA4 => USB_PA4,
          USB_PA5 => USB_PA5,
          USB_PA6 => USB_PA6,
          USB_PA7 => USB_PA7,
          USB_RDY0 => USB_RDY0,
          USB_RDY1 => USB_RDY1,
          USB_WAKEUP => USB_WAKEUP,
          USB_CLKOUT => USB_CLKOUT,
          RAM_A => RAM_A,
          RAM_IO => RAM_IO,
          RAM_CE1n => RAM_CE1n,
          RAM_CE2 => RAM_CE2,
          RAM_OEn => RAM_OEn,
          RAM_WEn => RAM_WEn,
          SCL_MON => SCL_MON,
          SDA_MON => SDA_MON,
          TDC_DONE => TDC_DONE,
          TDC_MON_TIMING => TDC_MON_TIMING
        );

   -- Clock process definitions
   PCLK_process :process
   begin
		PCLK <= '0';
		wait for PCLK_period/2;
		PCLK <= '1';
		wait for PCLK_period/2;
   end process;
 
   SCLK_process :process
   begin
		SCLK <= '0';
		wait for SCLK_period/2;
		SCLK <= '1';
		wait for SCLK_period/2;
   end process;
 
   SR_CLOCK_process :process
   begin
		SR_CLOCK <= '0';
		wait for SR_CLOCK_period/2;
		SR_CLOCK <= '1';
		wait for SR_CLOCK_period/2;
   end process;
 
   USB_IFCLK_process :process
   begin
		USB_IFCLK <= '0';
		wait for USB_IFCLK_period/2;
		USB_IFCLK <= '1';
		wait for USB_IFCLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for PCLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
