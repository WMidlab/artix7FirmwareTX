--*********************************************************************************
-- Indiana University
-- Center for Exploration of Energy and Matter (CEEM)
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    03/25/2014
--
--*********************************************************************************
-- Description:
-- Test bench for time-to-digital converter fifo.
--
--*********************************************************************************

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;

entity tdc_fifo_tb is
end tdc_fifo_tb;

architecture behave of tdc_fifo_tb is

    component tdc_fifo is
        generic(
            DEPTH                   : integer;
            DWIDTH                  : integer);
        port(
            clk                     : in std_logic;
            clr                     : in std_logic;
            rd                      : in std_logic;
            wr                      : in std_logic;
            din                     : in std_logic_vector(DWIDTH-1 downto 0);
            empty                   : out std_logic;
            full                    : out std_logic;
            dout                    : out std_logic_vector(DWIDTH-1 downto 0));
    end component;

    constant CLKPER                 : time                                      := 1 ns;
	constant CLKHPER                : time		                                := CLKPER/2;
    constant USE_LFSR               : std_logic                                 := '1'; -- use LFSR for dst_rdy generation
    constant USE_FWFT               : std_logic                                 := '1'; -- use LFSR for dst_rdy generation
    constant DWIDTH                 : integer                                   := 16;

	-- UUT port signals
	signal clk			            : std_logic                                 := '1';
	signal reset		            : std_logic	                                := '1';
    signal rden                     : std_logic                                 := '0';
    signal wren                     : std_logic                                 := '0';
    signal di                       : std_logic_vector(DWIDTH-1 downto 0)       := (others => '0');
    signal do                       : std_logic_vector(DWIDTH-1 downto 0)       := (others => '0');
    signal epty                     : std_logic                                 := '1';
    signal full                     : std_logic                                 := '0';
    signal rderr                    : std_logic                                 := '0';
    signal wrerr                    : std_logic                                 := '0';
    -- test bench signals
    signal stim_enable              : std_logic;
    signal full_reg                 : std_logic_vector(15 downto 0);
    signal epty_reg                 : std_logic_vector(15 downto 0);
    signal source_eptyn             : std_logic                                 := '0';
    signal dest_full                : std_logic                                 := '0';
    signal dvalid                   : std_logic                                 := '0';
    signal invalid                  : std_logic                                 := '1';
    signal verify_cntr              : std_logic_vector(DWIDTH-1 downto 0);
    signal verify_data              : std_logic_vector(DWIDTH-1 downto 0)       := (others => '0');
    signal invalid_assert           : std_logic;

    for all : tdc_fifo use entity work.tdc_fifo(fwft_arch0);--USE_FWFT := '1'
    --for all : tdc_fifo use entity work.tdc_fifo(fwft_arch1);--USE_FWFT := '1'
    --for all : tdc_fifo use entity work.tdc_fifo(fwft_arch2);--USE_FWFT := '0'
    --for all : tdc_fifo use entity work.tdc_fifo(std_arch);--USE_FWFT := '0'

begin

---------------------------------------------------------------------------------------------------------
-- Component instantiations
---------------------------------------------------------------------------------------------------------

    -------------------------------------------------------
    -- Instantiate unit under test
    -------------------------------------------------------
    UUT : tdc_fifo
    generic map(
        DEPTH               => 4,
        DWIDTH              => DWIDTH)
    port map(
        clk                 => clk,
        clr                 => reset,
        rd                  => rden,
        wr                  => wren,
        din                 => di,
        empty               => epty,
        full                => full,
        dout                => do
    );

---------------------------------------------------------------------------------------------------------
-- Concurrent statements
---------------------------------------------------------------------------------------------------------
    assert (invalid_assert='0') report "FIFO input and output do not match" severity ERROR;

	-- generate clock
	clk <= (not clk) after CLKHPER;
	-- simulate power on reset
	reset <= '0' after 20 ns;
    wren <= stim_enable and source_eptyn and (not full);
    --wren <= source_eptyn and (not full);--generate an error
    rden <= (not dest_full) and (not epty);
    stim_enable <= '0', '1' after 30 ns;
    source_eptyn <= epty_reg(0) when USE_LFSR = '1' else '1';
    dest_full <= full_reg(0) when USE_LFSR = '1' else '0';
    verify_data <= verify_cntr'delayed(CLKPER*0);
    invalid_assert <= invalid and stim_enable;

---------------------------------------------------------------------------------------------------------
-- Sequential statements
---------------------------------------------------------------------------------------------------------

    --------------------------------------------------------------------------
	-- Generate a psuedo-random shift register to simulate FIFO empty at
    -- source interface.
	--------------------------------------------------------------------------
	empty_pcs : process(reset,clk)
	begin
        if reset = '1' then
            epty_reg <= "0110110010101111";
        else
            if rising_edge(clk) then
                epty_reg <= epty_reg(14 downto 0) & (epty_reg(15) xor epty_reg(3));
            end if;
        end if;
	end process;

    --------------------------------------------------------------------------
	-- Generate a psuedo-random shift register to simulate FIFO full at
    -- destination interface.
	--------------------------------------------------------------------------
	full_pcs : process
	begin
        full_reg <= "1001110001101101";
        -- wait until full to test full logic
        wait until rising_edge(full);
        full_loop : while(TRUE) loop
            full_reg <= full_reg(14 downto 0) & (full_reg(15) xor full_reg(7));
            wait until rising_edge(clk);
        end loop;
	end process;

    ------------------------------------------------------------------
	-- Generate data input stimulus from a counter.
	------------------------------------------------------------------

    write_pcs : process(reset,clk)
    begin
        if reset = '1' then
            di <= (others => '0');
        else
            if rising_edge(clk) then
                di <= di + wren;
            end if;
        end if;
    end process;

    -- write_pcs : process
    -- begin
        -- --wren <= '0';
        -- di <= (others => '0');
        -- --wait until rising_edge(stim_enable);
        -- write_loop : while(TRUE) loop
            -- wait until rising_edge(clk);
            -- --wren <= source_eptyn and (not full);
            -- di <= di + wren;
            -- -- enable high and the entity is ready
            -- -- if (source_eptyn = '1') and (full = '0')  then
                -- -- wren <= '1';
                -- -- di <= di + '1';
                -- -- wait until rising_edge(clk);
                -- -- next write_loop;
            -- -- else
                -- -- wren <= '0';
                -- -- di <= di;
                -- -- wait until rising_edge(clk);
            -- -- end if;
        -- end loop;
    -- end process;


    ------------------------------------------------------------------
	-- Verify that the output matches the input.
	------------------------------------------------------------------    
    verify_pcs : process(reset,clk)
    begin
        if reset = '1' then
            wrerr <= '0';
            rderr <= '0';
            dvalid <= '0';
            if USE_FWFT = '1' then
                verify_cntr <= (others => '0');
            else
                verify_cntr <= (others => '1');
            end if;
            invalid <= '0';
        else
            if rising_edge(clk) then
                wrerr <= wren and full;
                rderr <= rden and epty;
                --dvalid <= rden after CLKPER*1;
                dvalid <= rden after CLKPER*0;
                if rden = '1' then
                    verify_cntr <= verify_cntr + '1';
                end if;
                if (dvalid and (not epty)) = '1' then
                    if do /= verify_data then
                        invalid <= '1';
                    else
                        invalid <= '0';
                    end if;
                else
                    invalid <= '0';
                end if;
            end if;            
        end if;
    end process;

end behave;