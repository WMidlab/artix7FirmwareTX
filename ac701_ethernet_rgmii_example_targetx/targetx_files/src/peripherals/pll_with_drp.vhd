----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:35:41 11/24/2012 
-- Design Name: 
-- Module Name:    pll_with_drp - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity pll_with_drp is
	Generic (
		clock_outputs : integer range 1 to 6 := 6
	);
	Port ( 
		RAW_CLOCK_IN   : in  STD_LOGIC;
		RAW_CLOCKS_OUT : out STD_LOGIC(clock_outputs-1 downto 0);
		PLL_DRP_CLOCK  : in  STD_LOGIC;
		PLL_DRP_DADRR  : in  STD_LOGIC_VECTOR(4 downto 0);
		PLL_DRP_DIN    : in  STD_LOGIC_VECTOR(15 downto 0);
		PLL_DRP_START  : in  STD_LOGIC;
		PLL_DRP_DOUT   : out STD_LOGIC_VECTOR(15 downto 0);
		PLL_DRP_READY  : out  STD_LOGIC			  
	);
end pll_with_drp;

architecture Behavioral of pll_with_drp is
	
begin

   map_pll_adv : PLL_ADV 
	generic map(
		SIM_DEVICE     => "SPARTAN6",
      DIVCLK_DIVIDE  => 1, -- 1 to 52
      BANDWIDTH      => "LOW", -- "HIGH", "LOW" or "OPTIMIZED"      
		--Feedback clock stuff
      CLKFBOUT_MULT  => 8, 
      CLKFBOUT_PHASE => 0.0,
      --Set the clock period (ns) of input clocks and reference jitter
      REF_JITTER     => 0.100,
      CLKIN1_PERIOD  => 10.000,
      CLKIN2_PERIOD  => 10.000, 
      -- CLKOUT parameters:
      -- DIVIDE: (1 to 128)
      -- DUTY_CYCLE: (0.01 to 0.99) - This is dependent on the divide value.
      -- PHASE: (0.0 to 360.0) - This is dependent on the divide value.
      CLKOUT0_DIVIDE     => (8),
      CLKOUT0_DUTY_CYCLE => (0.5),
      CLKOUT0_PHASE      => (0.0), 
      CLKOUT1_DIVIDE     => (8), 
      CLKOUT1_DUTY_CYCLE => (0.5),
      CLKOUT1_PHASE      => (0.0), 
      CLKOUT2_DIVIDE     => (8),
      CLKOUT2_DUTY_CYCLE => (0.5),
      CLKOUT2_PHASE      => (0.0),
      CLKOUT3_DIVIDE     => (8),
      CLKOUT3_DUTY_CYCLE => (0.5),
      CLKOUT3_PHASE      => (0.0),
      CLKOUT4_DIVIDE     => (8),
      CLKOUT4_DUTY_CYCLE => (0.5),
      CLKOUT4_PHASE      => (0.0), 
      CLKOUT5_DIVIDE     => (8),
      CLKOUT5_DUTY_CYCLE => (0.5),
      CLKOUT5_PHASE      => (0.0),
      -- Set the compensation
      COMPENSATION => "SYSTEM_SYNCHRONOUS",
      -- PMCD stuff (not used)
      EN_REL           => "FALSE",
      PLL_PMCD_MODE    => "FALSE",
      RST_DEASSERT_CLK => "CLKIN1"
   ) port map (
      CLKFBDCM  => open,
      CLKFBOUT  => clkfb_bufgin,
      -- CLK outputs
      CLKOUT0   => clk0_bufgin,
      CLKOUT1   => clk1_bufgin,
      CLKOUT2   => clk2_bufgin,
      CLKOUT3   => clk3_bufgin,
      CLKOUT4   => clk4_bufgin,
      CLKOUT5   => clk5_bufgin,
      -- CLKOUTS to DCM
      CLKOUTDCM0 => open,
      CLKOUTDCM1 => open,
      CLKOUTDCM2 => open, 
      CLKOUTDCM3 => open,
      CLKOUTDCM4 => open,
      CLKOUTDCM5 => open, 
      -- DRP Ports
      DO    => dout,
      DRDY  => drdy, 
      DADDR => daddr, 
      DCLK  => dclk,
      DEN   => den,
      DI    => di,
      DWE   => dwe,
      -- Locked signal
      LOCKED   => locked,
		-- Feedback signal in
      CLKFBIN  => clkfb_bufgout,
      -- Clock inputs
      CLKIN1   => CLKIN, 
      CLKIN2   => '0',
      CLKINSEL => '1', --'1' corresponds to CLKIN1, '0' to CLKIN2
      --Reserved, leave it 0
      REL => '0',
		--Reset pin
      RST => rst_pll
   );

end Behavioral;

