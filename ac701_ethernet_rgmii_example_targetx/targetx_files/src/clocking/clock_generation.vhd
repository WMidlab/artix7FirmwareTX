----------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;
use work.asic_definitions_irs2_carrier_revA.all;

entity clock_generation is
	Port ( 
		--Raw boad clock input
		BOARD_CLOCKP      : in  STD_LOGIC;
		BOARD_CLOCKN      : in  STD_LOGIC;
		--FTSW inputs
		RJ45_ACK_P        : out std_logic;
		RJ45_ACK_N        : out std_logic;			  
		RJ45_TRG_P        : in  std_logic;
		RJ45_TRG_N        : in  std_logic;			  			  
		RJ45_RSV_P        : out std_logic;
		RJ45_RSV_N        : out std_logic;
		RJ45_CLK_P        : in  std_logic;
		RJ45_CLK_N        : in  std_logic;
		--Trigger outputs from FTSW
		FTSW_TRIGGER      : out std_logic;
		--Select signal between the two
		USE_LOCAL_CLOCK   : in  std_logic;
		--General output clocks
		CLOCK_50MHz_BUFG  : out STD_LOGIC;
		CLOCK_4MHz_BUFG   : out STD_LOGIC;
		--ASIC control clocks
		CLOCK_SSTx8_BUFG  : out STD_LOGIC;
		CLOCK_SST_BUFG    : out STD_LOGIC;
		--ASIC output clocks
		ASIC_SST          : out STD_LOGIC_VECTOR(ASICS_PER_ROW-1 downto 0);
		ASIC_SSP          : out STD_LOGIC_VECTOR(ASICS_PER_ROW-1 downto 0);
		ASIC_WR_STRB      : out STD_LOGIC_VECTOR(ASICS_PER_ROW-1 downto 0);
		ASIC_WR_ADDR_LSB     : out STD_LOGIC;
		ASIC_WR_ADDR_LSB_RAW : out STD_LOGIC;
		--Output clock enable for I2C things
		I2C_CLOCK_ENABLE  : out STD_LOGIC
	);
end clock_generation;

architecture Behavioral of clock_generation is
	signal internal_BOARD_CLOCK         : std_logic;
	signal internal_BOARD_CLOCK_FB      : std_logic;
	signal internal_BOARD_CLOCK_FB_BUFG : std_logic;
	signal internal_BOARD_DERIVED_SST   : std_logic;
	signal internal_FTSW_DERIVED_SST    : std_logic;
	signal internal_CLOCK_SST           : std_logic;
	signal internal_CLOCK_SSP_BUFG      : std_logic;
	signal internal_CLOCK_WRITE_STROBE_BUFG : std_logic;
	--
	signal internal_FTSW_INTERFACE_READY  : std_logic;
	signal internal_FTSW_INTERFACE_STABLE : std_logic;
	signal internal_FTSW_STABLE_COUNTER   : unsigned(15 downto 0);
	signal internal_FTSW_TRIGGER          : std_logic;
	--
	signal internal_CLOCK_4MHz_BUFG     : std_logic;
	signal internal_CLOCK_50MHz_BUFG    : std_logic;
	signal internal_CLOCK_SSTx8_BUFG    : std_logic;

begin
	------------------------------------------------------
	--            Board derived clocking                --
	------------------------------------------------------
	map_board_clock : ibufds
	port map(
		I  => BOARD_CLOCKP,
		IB => BOARD_CLOCKN,
		O  => internal_BOARD_CLOCK
	);	
	
	--the following is not used
	map_board_clock_feedback : bufg
	port map(
		I  => internal_BOARD_CLOCK_FB,
		O  => internal_BOARD_CLOCK_FB_BUFG
	);
	map_board_derived_clockgen : entity work.clockgen
	port map (
		-- Clock in ports
		BOARD_CLK     => internal_BOARD_CLOCK,
		-- Feedback ports
		CLKFB_IN      => internal_BOARD_CLOCK_FB_BUFG,
		CLKFB_OUT     => internal_BOARD_CLOCK_FB,		
		-- clock out ports
		BOARD_CLK_SST => internal_BOARD_DERIVED_SST,
		LOCKED        => open
	);
	------------------------------------------------------
	--            FTSW derived clocking                 --
	--GV,6/7/14: uncomment this part to make FTSW work- use w caution!
	------------------------------------------------------
--	map_FTSW_interface: entity work.bpid
--	port map (
--		ack_p  => RJ45_ACK_P,
--		ack_n  => RJ45_ACK_N,
--		trg_p  => RJ45_TRG_P,
--		trg_n  => RJ45_TRG_N,
--		rsv_p  => RJ45_RSV_P,
--		rsv_n  => RJ45_RSV_N,
--		clk_p  => RJ45_CLK_P,
--		clk_n  => RJ45_CLK_N,
--		clk127 => open,
--		clk21  => internal_FTSW_DERIVED_SST,
--		trg127 => open,
--		trg21  => internal_FTSW_TRIGGER,
--		ready  => internal_FTSW_INTERFACE_READY,
--		monitor => open
--	);
	--Quick stability check for FTSW interface
	process(internal_BOARD_DERIVED_SST) begin
		if (rising_edge(internal_BOARD_DERIVED_SST)) then
			if (internal_FTSW_INTERFACE_READY = '0') then
				internal_FTSW_STABLE_COUNTER <= (others => '0');
			elsif (internal_FTSW_STABLE_COUNTER(15) = '0') then
				internal_FTSW_STABLE_COUNTER <= internal_FTSW_STABLE_COUNTER + 1;
			end if;
		end if;
	end process;
	--Don't issue FTSW triggers unless the FTSW interface is stable.
	internal_FTSW_INTERFACE_STABLE <= internal_FTSW_STABLE_COUNTER(15);
	FTSW_TRIGGER <= internal_FTSW_TRIGGER and internal_FTSW_INTERFACE_STABLE;
	
	------------------------------------------------------
	--            MUX between board/FTSW                --
	------------------------------------------------------
--	map_bufgmux_sst : bufgmux
--	port map (
--		I0 => internal_FTSW_DERIVED_SST,
--		I1 => internal_BOARD_DERIVED_SST,
--		O  => internal_CLOCK_SST,
--		S  => USE_LOCAL_CLOCK		
--	);

	map_sst_bufg : bufg port map(
		I => internal_BOARD_DERIVED_SST,
		O => internal_CLOCK_SST
	);
	------------------------------------------------------
	--        PLLs to generate all other clocks         --
	------------------------------------------------------
	--this takes in 31.25 MHz in
	--     generates 50 MHz clock for general use @ 0 degrees
	--               4 MHz clock for general use @ 0 degrees
	--               sspx8   @ 62.500 MHz @ 90 degrees
   --               ssp     @ 7.812 MHz @ 315 degree
	--               wr_strb @ 15.625 MHz @ 90 degrees
	map_clockgen_ASIC : entity work.clockgen_asic_A
	port map (
		-- Clock in ports
		CLK_SST          => internal_CLOCK_SST,
		-- Clock out ports
		CLK_50MHz_BUFG   => open,--internal_CLOCK_50MHz_BUFG,run everything with the 62.5MHz clock, experiment: IM 8/29/14
		CLK_4MHz_BUFG    =>open,-- internal_CLOCK_4MHz_BUFG,
		CLK_SSTx8_BUFG   => internal_CLOCK_SSTx8_BUFG,
		CLK_SSP_BUFG     => open,--internal_CLOCK_SSP_BUFG,
		CLK_WR_STRB_BUFG =>open,-- internal_CLOCK_WRITE_STROBE_BUFG,
		-- Status and control signals
		LOCKED    => open
	);
	CLOCK_50MHz_BUFG<=internal_CLOCK_SSTx8_BUFG ;-- run everything with the 62.5MHz clock, experiment: IM 8/29/14
	CLOCK_SSTx8_BUFG<=internal_CLOCK_SSTx8_BUFG;
	--CLOCK_50MHz_BUFG <= internal_CLOCK_50MHz_BUFG;

	CLOCK_4MHz_BUFG  <= internal_CLOCK_4MHz_BUFG;
   CLOCK_SST_BUFG   <= internal_CLOCK_SST;
	
	------------------------------------------------------
	--Logic to generate slow clock enable(e.g., for I2C)--
	------------------------------------------------------
	map_i2c_clock_enable : entity work.clock_enable_generator
	generic map (
		DIVIDE_RATIO => 20
	)
	port map (
		CLOCK_IN         => internal_CLOCK_4MHz_BUFG,
		CLOCK_ENABLE_OUT => I2C_CLOCK_ENABLE
	);
	
	map_4MHz_clock_enable : entity work.clock_enable_generator
	generic map (
		DIVIDE_RATIO => 12
	)
	port map (
		CLOCK_IN         => internal_CLOCK_50MHz_BUFG,
		CLOCK_ENABLE_OUT => internal_CLOCK_4MHz_BUFG
	);
	------------------------------------------------------------
	--Map out the ASIC control signals that are on clock nets --
	------------------------------------------------------------
--	gen_sst_to_asic : for i in 0 to ASICS_PER_ROW-1 generate
--		map_sst_to_col : ODDR2
--			generic map(
--				DDR_ALIGNMENT => "NONE", -- Sets output alignment to "NONE", "C0", "C1"
--				INIT => '0', -- Sets initial state of the Q output to '0' or '1'
--				SRTYPE => "SYNC") -- Specifies "SYNC" or "ASYNC" set/reset
--			port map (
--				Q  => ASIC_SST(i),        -- 1-bit output data
--				C0 => internal_CLOCK_SST,      -- 1-bit clock input
--				C1 => not(internal_CLOCK_SST), -- 1-bit clock input
--				CE => '1',                     -- 1-bit clock enable input
--				D0 => '1',                     -- 1-bit data input (associated with C0)
--				D1 => '0',                     -- 1-bit data input (associated with C1)
--				R  => '0',                     -- 1-bit reset input
--				S  => '0'                      -- 1-bit set input
--		);
--		map_ssp_to_col : ODDR2 --GV 6/9/14: not needed any more- its created inside the ASICs
--			generic map(
--				DDR_ALIGNMENT => "NONE", -- Sets output alignment to "NONE", "C0", "C1"
--				INIT => '0', -- Sets initial state of the Q output to '0' or '1'
--				SRTYPE => "SYNC") -- Specifies "SYNC" or "ASYNC" set/reset
--			port map (
--				Q  => ASIC_SSP(i),        -- 1-bit output data
--				C0 => internal_CLOCK_SSP_BUFG,      -- 1-bit clock input
--				C1 => not(internal_CLOCK_SSP_BUFG), -- 1-bit clock input
--				CE => '1',                     -- 1-bit clock enable input
--				D0 => '1',                     -- 1-bit data input (associated with C0)
--				D1 => '0',                     -- 1-bit data input (associated with C1)
--				R  => '0',                     -- 1-bit reset input
--				S  => '0'                      -- 1-bit set input
--		);		
--		map_wr_strb_to_col : ODDR2
--			generic map(
--				DDR_ALIGNMENT => "NONE", -- Sets output alignment to "NONE", "C0", "C1"
--				INIT => '0', -- Sets initial state of the Q output to '0' or '1'
--				SRTYPE => "SYNC") -- Specifies "SYNC" or "ASYNC" set/reset
--			port map (
--				Q  => ASIC_WR_STRB(i),        -- 1-bit output data
--				C0 => internal_CLOCK_WRITE_STROBE_BUFG,      -- 1-bit clock input
--				C1 => not(internal_CLOCK_WRITE_STROBE_BUFG), -- 1-bit clock input
--				CE => '1',                     -- 1-bit clock enable input
--				D0 => '1',                     -- 1-bit data input (associated with C0)
--				D1 => '0',                     -- 1-bit data input (associated with C1)
--				R  => '0',                     -- 1-bit reset input
--				S  => '0'                      -- 1-bit set input
--		);		
--	end generate;
--	map_oddr2_wr_addr_lsb : ODDR2
--		generic map(
--			DDR_ALIGNMENT => "NONE", -- Sets output alignment to "NONE", "C0", "C1"
--			INIT => '0', -- Sets initial state of the Q output to '0' or '1'
--			SRTYPE => "SYNC") -- Specifies "SYNC" or "ASYNC" set/reset
--		port map (
--			Q  => ASIC_WR_ADDR_LSB,        -- 1-bit output data
--			C0 => internal_CLOCK_SST,      -- 1-bit clock input
--			C1 => not(internal_CLOCK_SST), -- 1-bit clock input
--			CE => '1',                     -- 1-bit clock enable input
--			D0 => '1',                     -- 1-bit data input (associated with C0)
--			D1 => '0',                     -- 1-bit data input (associated with C1)
--			R  => '0',                     -- 1-bit reset input
--			S  => '0'                      -- 1-bit set input
--	);	
--	--Drive a non-ODDR version of this signal out so we can use it within FPGA
--	--(mainly needed for the trigger memory)
--	ASIC_WR_ADDR_LSB_RAW <= internal_BOARD_DERIVED_SST;

end Behavioral;

