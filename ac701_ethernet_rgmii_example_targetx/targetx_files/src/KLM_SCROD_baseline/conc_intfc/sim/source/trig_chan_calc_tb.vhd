--*********************************************************************************
-- Indiana University
-- Center for Exploration of Energy and Matter (CEEM)
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    07/15/2014
--
--*********************************************************************************
-- Description:
-- Test bench for trigger channel calculator entity. Values are initially wrong
-- to test verification logic.
--*********************************************************************************

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    use ieee.std_logic_unsigned.all;

entity trig_chan_calc_tb is
end trig_chan_calc_tb;

architecture behave of trig_chan_calc_tb is

    component trig_chan_calc is
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
    end component;

    -- Clocks --------------------------------
	constant CKPER                  : time 		                            := 8 ns;
	constant CKHPER                 : time		                            := CKPER/2;
    constant NUM_CHAN               : integer                               := 15;
    constant NUM_LANE               : integer                               := 10;
    constant LANEIW                 : integer                               := 4;
    constant CHANIW                 : integer                               := 4;
    constant CHANOW                 : integer                               := 8;
    constant AXIS_VAL               : std_logic                             := '1';

    signal clk                      : std_logic                             := '0';
    signal to_we                    : std_logic;
    signal trg_valid                : std_logic;
    signal axis_bit                 : std_logic;
    signal trg_ch                   : std_logic_vector(CHANOW-1 downto 0);

    signal to_ce                    : std_logic;
    signal to_ln                    : std_logic_vector(3 downto 0)          := (others => '0');
    signal to_ch                    : std_logic_vector(3 downto 0)          := (others => '0');    


    signal axis_bit_v               : std_logic;
    signal trg_ch_v                 : unsigned(CHANOW-1 downto 0);
    signal invalid                  : std_logic;

begin

    --------------------------------------------------------------------------
    -- Instantiate UUT
    --------------------------------------------------------------------------
    UUT : trig_chan_calc
    generic map(
        NUM_CHAN                => NUM_CHAN,  -- ASIC channels
        LANEIW                  => LANEIW,  -- Lane in width
        CHANIW                  => CHANIW,  -- Channel in width
        CHANOW                  => CHANOW,  -- Channel out width
        AXIS_VAL                => AXIS_VAL)-- Axis bit default
    port map(
        -- inputs ---------------------------------------------
        clk						=> clk,
        we                      => to_we,
        lane                    => to_ln,
        chan                    => to_ch,
        valid                   => trg_valid,
        axis_bit                => axis_bit,
        trig_chan               => trg_ch
    );

    clk <= not clk after CKHPER;

    --------------------------------------------------------------------------
    -- Simulate the time-order process write enable.
    --------------------------------------------------------------------------
    to_we_pcs : process
    begin
        to_ce <= '0';
        we_loop : while(TRUE) loop
            wait until rising_edge(clk);
            to_ce <= '0';
            wait for CKPER*8;
            to_ce <= '1';
        end loop;
    end process;
    --------------------------------------------------------------------------
    -- Simulate the time-order process data. Cycle through every channel and lane.
    --------------------------------------------------------------------------
    to_do_pcs : process(clk)
    begin
        if rising_edge(clk) then
            to_we <= to_ce;
            if to_ce = '1' then                
                if to_ch = NUM_CHAN then
                    to_ch <= STD_LOGIC_VECTOR(TO_UNSIGNED(1,to_ch'length));
                    if to_ln = NUM_LANE then
                        to_ln <= STD_LOGIC_VECTOR(TO_UNSIGNED(1,to_ln'length));
                    else 
                        to_ln <= to_ln + '1';
                    end if;                                    
                else 
                    to_ch <= to_ch + '1';
                end if;
            end if;
        end if;
    end process;
    --------------------------------------------------------------------------

    --------------------------------------------------------------------------
    -- Generate comparison values for verification.
    --------------------------------------------------------------------------
    verify_pcs : process(clk)
    begin
        if (clk'event and clk = '1') then
            if to_ln < 6 then
                -- first axis (half)
                axis_bit_v <= AXIS_VAL;
                trg_ch_v <= (UNSIGNED(to_ln-1)*NUM_CHAN)+UNSIGNED(to_ch);
            else
                -- second axis (half)
                axis_bit_v <= not AXIS_VAL;
                trg_ch_v <= (UNSIGNED(to_ln-6)*NUM_CHAN)+UNSIGNED(to_ch);
            end if;
            if trg_valid = '1' then
                if (STD_LOGIC_VECTOR(trg_ch_v) = trg_ch) and (axis_bit_v = axis_bit) then
                    invalid <= '0';
                else
                    invalid <= '1';
                end if;
            end if;
        end if;
    end process;

end behave;