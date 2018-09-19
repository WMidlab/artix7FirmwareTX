--**********************************************************************************
-- Indiana University Cyclotron Facility (IUCF)
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    02/25/2014
--
--**********************************************************************************
-- Description:
-- Timing and control signals for logic that sends and receive data at
-- rates other than the clock frequency.  Generate clock enables and strobes
-- from a free running counter.
--**********************************************************************************
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
library work;
    use work.timing_ctrl_pkg.all;

entity timing_ctrl is
	port(
    clk                         : in std_logic;
    clk2x                       : in std_logic;
    tdc_sync                    : in std_logic;
    runreset                    : in std_logic;    
    tdcrst                      : out std_logic_vector(1 to 3);--vector so we can distribute to meet timing
    tdcce_2x                    : out std_logic_vector(1 to 5)); -- _Nx is N times clock period
end timing_ctrl;


architecture behave of timing_ctrl is

    --------------------------------------------------------------------------
	-- Signal declarations.
    --------------------------------------------------------------------------
    signal tdcrst_d             : std_logic;
    --signal tdcrst_shift         : std_logic_vector(39 downto 0)             := (others => '1');
    signal tdcrst_shift         : std_logic_vector(1 downto 0)             := (others => '1');
    signal tdcrst_i             : std_logic_vector(tdcrst'length downto 0)  := (others => '1');
    
    signal tce_cnt			    : std_logic_vector(TC_CCNT_WIDTH-1 downto 0):= (others => '0');
	signal tce_2x_d         	: std_logic;
	signal tce_2x_q0        	: std_logic                                 := '0';
	signal tce_2x_r        	    : std_logic                                 := '1';    
    signal tce_2x_i        	    : std_logic_vector(tdcce_2x'length-1 downto 0):= (others => '0');

begin



------------------------------------------------------------------------------------------------
-- Concurrent statements
------------------------------------------------------------------------------------------------
	--------------------------------------------------------
	-- Map signals out of the port
	--------------------------------------------------------
    tdcrst <= tdcrst_i(tdcrst_i'length-2 downto 0);
    tdcce_2x <= tce_2x_i;

	--------------------------------------------------------
	-- Combinational logic
	--------------------------------------------------------

	-- detect a rising edge counter bit to generate clock enable
    tce_2x_d <= tce_cnt(TC_2X_BIT) and (not tce_2x_r);
 
    ------------------------------------------------------------------
	-- Assert reset for shift length clock cycles and cross clock domain.
    --!This process aligns the RPC and Sctintillato TDC counters.
    --!Part of the shift register should be an SRL to reduce resource usage.
    -- The initial delay is 39 clock cycles.
	------------------------------------------------------------------    
    --trst_proc : process(runreset,clk2x)
    trst_proc : process(runreset,tdc_sync,clk2x)--!
	begin
        -- must use asynch reset
        --if runreset = '1' then
        if (runreset or tdc_sync) = '1' then--!
            -- assert reset for shift length
            tdcrst_shift <= (others => '1');            
        else
            if (clk2x'event and clk2x='1') then
                -- de-assert after shift length
                tdcrst_shift <= '0' & tdcrst_shift(tdcrst_shift'length-1 downto 1);
            end if;
        end if;
	end process;    
    
	------------------------------------------------------------------
	-- Free running counter for generating clock enables at
    -- different rates.
	------------------------------------------------------------------
	tce_proc : process(clk2x)
	begin
		if (clk2x'event and clk2x='1') then
            if tdcrst_i(tdcrst_i'length-1) = '1' then
				tce_cnt <= (others => '0');
			else
				tce_cnt <= tce_cnt - 1;
			end if;
            tce_2x_r <= tce_cnt(TC_2X_BIT);
		end if;
	end process;

	------------------------------------------------------------------
	-- Register outputs to improve timing and align the signal edges
	------------------------------------------------------------------
	tdly_proc : process(clk2x)
	begin
		if (clk2x'event and clk2x='1') then
            tce_2x_q0 <= tce_2x_d;
            tce_2x_i <= (others => tce_2x_q0);
            tdcrst_i <= (others => tdcrst_shift(0));
		end if;
	end process;    

end behave;