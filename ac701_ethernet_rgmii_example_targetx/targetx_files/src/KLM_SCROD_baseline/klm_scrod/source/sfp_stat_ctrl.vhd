--*********************************************************************************
-- Indiana University
-- Center for Exploration of Energy and Matter (CEEM)
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    07/23/2013
--
--*********************************************************************************
-- Description:
-- Deal with SFP status and control signals.
--
-- Deficiencies/Issues
--
--*********************************************************************************
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_misc.all;

entity sfp_stat_ctrl is
    generic(
    NUM_GTS                     : integer := 2);
	port(
	clk					        : in std_logic;
    txfault                     : in std_logic_vector(1 to NUM_GTS);
    txdis                       : out std_logic_vector(1 to NUM_GTS);
    mod2                        : out std_logic_vector(1 to NUM_GTS);
    mod1                        : out std_logic_vector(1 to NUM_GTS);
    mod0                        : in std_logic_vector(1 to NUM_GTS);    
    los                         : in std_logic_vector(1 to NUM_GTS);
    fault_flag                  : out std_logic;
    mod_flag                    : out std_logic;
    los_flag                    : out std_logic);
end sfp_stat_ctrl;


architecture behave of sfp_stat_ctrl is




begin

---------------------------------------------------------------------------------------------------------
-- Component instantiations
---------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------------------
-- Concurrent statements
---------------------------------------------------------------------------------------------------------
    txdis <= (others => '0');
    mod2 <= (others => '1');
    mod1 <= (others => '1');

	-- Assertions ----------------------------------------------

	-----------------------------------------------------------

---------------------------------------------------------------------------------------------------------
-- Synchronous processes
---------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------
	-- Register the inputs and outputs to improve timing or adjust delays.
	--------------------------------------------------------------------------
    status_pcs : process(clk)
    begin
        if (clk'event and clk = '1') then
            -- high is bad
            fault_flag <= OR_REDUCE(txfault);
            mod_flag <= OR_REDUCE(mod0);
            los_flag <= OR_REDUCE(los);
    	end if;
    end process;

end behave;

