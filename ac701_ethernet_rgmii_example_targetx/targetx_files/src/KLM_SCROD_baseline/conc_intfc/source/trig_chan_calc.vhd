--*********************************************************************************
-- Indiana University CEEM
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    07/14/2014
--
--*********************************************************************************
-- Description:
--
-- Calculates the trigger channel for the unified trigger format from the ASIC
-- number and channel. The number of pipeline registers must be adjusted to meet
-- timing.
-- NOTE: The C input/path has two less pipeline registers than A,B,D.
-- 
-- Implements this logic in a DSP48:
--
-- channel_pcs : process(tdc_clk)
-- begin
--     if (tdc_clk'event and tdc_clk = '1') then            
--         if to_ln < 6 then
--             -- first axis (half)
--             axis_bit <= AXIS_BIT_VAL;
--             trg_ch <= (UNSIGNED(to_ln-1)*ASIC_NUM_CHAN)+UNSIGNED(to_ch);
--         else
--             -- second axis (half)
--             axis_bit <= not AXIS_BIT_VAL;
--             trg_ch <= (UNSIGNED(to_ln-6)*ASIC_NUM_CHAN)+UNSIGNED(to_ch);
--         end if;
--     end if;
-- end process;
--*********************************************************************************
library ieee;
	use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
-- synthesis translate_off
library unisim;
    use unisim.vcomponents.all;
-- synthesis translate_on

entity trig_chan_calc is
generic(
    NUM_CHAN                    : integer;   -- ASIC channels
    LANEIW                      : integer;   -- Lane in width
    CHANIW                      : integer;   -- Channel in width
    CHANOW                      : integer;   -- Channel out width
    AXIS_VAL                    : std_logic);-- Axis bit default
port(
    -- inputs ---------------------------------------------
    clk						    : in std_logic;
    we                          : in std_logic;
    lane                        : in std_logic_vector(LANEIW-1 downto 0);
    chan                        : in std_logic_vector(CHANIW-1 downto 0);
    valid                       : out std_logic;
    axis_bit                    : out std_logic;
    trig_chan                   : out std_logic_vector(CHANOW-1 downto 0));
end trig_chan_calc;

architecture behave of trig_chan_calc is

    component DSP48A1
    generic(
        A0REG                   : integer := 0;
        A1REG                   : integer := 1;
        B0REG                   : integer := 0;
        B1REG                   : integer := 1;
        CARRYINREG              : integer := 1;
        CARRYINSEL              : string := "OPMODE5";
        CARRYOUTREG             : integer := 1;
        CREG                    : integer := 1;
        DREG                    : integer := 1;
        MREG                    : integer := 1;
        OPMODEREG               : integer := 1;
        PREG                    : integer := 1;
        RSTTYPE                 : string := "SYNC");
    port(
        BCOUT                   : out std_logic_vector(17 downto 0);
        CARRYOUT                : out std_ulogic;
        CARRYOUTF               : out std_ulogic;
        M                       : out std_logic_vector(35 downto 0);
        P                       : out std_logic_vector(47 downto 0);
        PCOUT                   : out std_logic_vector(47 downto 0);
        A                       : in std_logic_vector(17 downto 0);
        B                       : in std_logic_vector(17 downto 0);
        C                       : in std_logic_vector(47 downto 0);
        CARRYIN                 : in std_ulogic := 'L';
        CEA                     : in std_ulogic;
        CEB                     : in std_ulogic;
        CEC                     : in std_ulogic;
        CECARRYIN               : in std_ulogic;
        CED                     : in std_ulogic;
        CEM                     : in std_ulogic;
        CEOPMODE                : in std_ulogic;
        CEP                     : in std_ulogic;
        CLK                     : in std_ulogic;
        D                       : in std_logic_vector(17 downto 0);
        OPMODE                  : in std_logic_vector(7 downto 0);
        PCIN                    : in std_logic_vector(47 downto 0) := (others => 'L');
        RSTA                    : in std_ulogic;
        RSTB                    : in std_ulogic;
        RSTC                    : in std_ulogic;
        RSTCARRYIN              : in std_ulogic;
        RSTD                    : in std_ulogic;
        RSTM                    : in std_ulogic;
        RSTOPMODE               : in std_ulogic;
        RSTP                    : in std_ulogic);
    end component;


    constant OPMODE             : std_logic_vector(7 downto 0)  := "01011101";    
    constant ONE18              : std_logic_vector(17 downto 0) := "000000000000000001";
    constant SIX18              : std_logic_vector(17 downto 0) := "000000000000000110";
    constant ZERO48             : std_logic_vector(47 downto 0) := X"000000000000";
    constant PIPEDLY            : integer                       := 3;
    
    signal a                    : std_logic_vector(17 downto 0);
    signal b                    : std_logic_vector(17 downto 0);
    signal c                    : std_logic_vector(47 downto 0);
    signal d                    : std_logic_vector(17 downto 0);
    signal p                    : std_logic_vector(47 downto 0);    
    
    signal b_d0                 : std_logic_vector(17 downto 0);
    signal lane_cval            : std_logic_vector(LANEIW-1 downto 0);
    signal valid_shift          : std_logic_vector(PIPEDLY-1 downto 0);

begin

------------------------------------------------------------------------------------------------
-- Component instantiations
------------------------------------------------------------------------------------------------
    DSP48A1_inst : DSP48A1
    generic map(
        A0REG                   => 0,        -- First stage A input pipeline register (0/1)
        A1REG                   => 0,        -- Second stage A input pipeline register (0/1)
        B0REG                   => 1,        -- First stage B input pipeline register (0/1)
        B1REG                   => 0,        -- Second stage B input pipeline register (0/1)
        CARRYINREG              => 0,        -- CARRYIN input pipeline register (0/1)
        CARRYINSEL              => "OPMODE5",-- Specify carry-in source, "CARRYIN" or "OPMODE5" 
        CARRYOUTREG             => 0,        -- CARRYOUT output pipeline register (0/1)
        CREG                    => 1,        -- C input pipeline register (0/1)
        DREG                    => 1,        -- D pre-adder input pipeline register (0/1)
        MREG                    => 1,        -- M pipeline register (0/1)
        OPMODEREG               => 0,        -- Enable=1/disable=0 OPMODE input pipeline registers
        PREG                    => 1,        -- P output pipeline register (0/1)
        RSTTYPE                 => "SYNC")   -- Specify reset type, "SYNC" or "ASYNC" 
    port map (
        -- Cascade Ports: 18-bit (each) output: Ports to cascade from one DSP48 to another
        BCOUT                   => open,    -- 18-bit output: B port cascade output
        PCOUT                   => open,    -- 48-bit output: P cascade output (if used, connect to PCIN of another DSP48A1)
        -- Data Ports: 1-bit (each) output: Data input and output ports
        CARRYOUT                => open,    -- 1-bit output: carry output (if used, connect to CARRYIN pin of another DSP48A1)
        CARRYOUTF               => open,    -- 1-bit output: fabric carry output
        M                       => open,    -- 36-bit output: fabric multiplier data output
        P                       => p,       -- 48-bit output: data output
        -- Cascade Ports: 48-bit (each) input: Ports to cascade from one DSP48 to another
        PCIN                    => ZERO48,  -- 48-bit input: P cascade input (if used, connect to PCOUT of another DSP48A1)
        -- Control Input Ports: 1-bit (each) input: Clocking and operation mode
        CLK                     => clk,     -- 1-bit input: clock input
        OPMODE                  => OPMODE,  -- 8-bit input: operation mode input
        -- Data Ports: 18-bit (each) input: Data input and output ports
        A                       => a,       -- 18-bit input: A data input
        B                       => b,       -- 18-bit input: B data input (connected to fabric or BCOUT of adjacent DSP48A1)
        C                       => c,       -- 48-bit input: C data input
        CARRYIN                 => '0',     -- 1-bit input: carry input signal (if used, connect to CARRYOUT pin of another DSP48A1)
        D                       => d,       -- 18-bit input: B pre-adder data input
        -- Reset/Clock Enable Input Ports: 1-bit (each) input: Reset and enable input ports
        CEA                     => '1',     -- 1-bit input: active high clock enable input for A registers
        CEB                     => '1',     -- 1-bit input: active high clock enable input for B registers
        CEC                     => '1',     -- 1-bit input: active high clock enable input for C registers
        CECARRYIN               => '0',     -- 1-bit input: active high clock enable input for CARRYIN registers
        CED                     => '1',     -- 1-bit input: active high clock enable input for D registers
        CEM                     => '1',     -- 1-bit input: active high clock enable input for multiplier registers
        CEOPMODE                => '1',     -- 1-bit input: active high clock enable input for OPMODE registers
        CEP                     => '1',     -- 1-bit input: active high clock enable input for P registers
        RSTA                    => '0',     -- 1-bit input: reset input for A pipeline registers
        RSTB                    => '0',     -- 1-bit input: reset input for B pipeline registers
        RSTC                    => '0',     -- 1-bit input: reset input for C pipeline registers
        RSTCARRYIN              => '0',     -- 1-bit input: reset input for CARRYIN pipeline registers
        RSTD                    => '0',     -- 1-bit input: reset input for D pipeline registers
        RSTM                    => '0',     -- 1-bit input: reset input for M pipeline registers
        RSTOPMODE               => '0',     -- 1-bit input: reset input for OPMODE pipeline registers
        RSTP                    => '0'      -- 1-bit input: reset input for P pipeline registers
    );

---------------------------------------------------------------------------------------------------------
-- Concurrent statements
---------------------------------------------------------------------------------------------------------    

	--------------------------------------------------------
	-- Map signals out of the port
	--------------------------------------------------------
    valid <= valid_shift(0);
    trig_chan <= p(CHANOW-1 downto 0);

	--------------------------------------------------------
	-- Combinational logic
	--------------------------------------------------------
    lane_cval <= STD_LOGIC_VECTOR(TO_UNSIGNED(6,lane'length));
    b_d0 <= ONE18 when lane < lane_cval else SIX18;
    
    
    a <= STD_LOGIC_VECTOR(TO_UNSIGNED(NUM_CHAN,a'length));
    b <= b_d0;
    c <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(chan),c'length));
    d <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(lane),d'length));


---------------------------------------------------------------------------------------------------------
-- Asynchronous and Synchronous processes
---------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------
-- Synchronous processes
-------------------------------------------------------------------------------------------
    ---------------------------------------------
    -- Mux the axis bit to output based on lane
    -- number.
    ---------------------------------------------
    mux_pcs : process(clk)
    begin
        if (clk'event and clk = '1') then            
            if lane < lane_cval then
                -- first axis (half)
                axis_bit <= AXIS_VAL;
            else
                -- second axis (half)
                axis_bit <= not AXIS_VAL;
            end if;
        end if;
    end process;
    
    ---------------------------------------------
    -- Delay the write enable by the the number of
    -- DSP48 pipeline registers.
    ---------------------------------------------
    valid_pcs : process(clk)
    begin
        if (clk'event and clk = '1') then            
            valid_shift <= we & valid_shift(valid_shift'length-1 downto 1);
        end if;
    end process;

end behave;
--------------------------------------------------------------------------------------------------------

