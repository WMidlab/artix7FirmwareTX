--*********************************************************************************
-- Indiana University
-- Center for Exploration of Energy and Matter (CEEM)
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    12/11/2012
--
--*********************************************************************************
-- Description:
-- Orders time stamps from two inputs and writes them to an output - expects the
-- the output to be the same entity in a tree structure. This entity is comprised
-- totally of asynchronous logic.
--
-- Deficiencies/Issues
--
--*********************************************************************************
library ieee;
    use ieee.std_logic_1164.all;
library work;
    use work.time_order_pkg.all;


entity tom_2_to_1 is
	port(
    ein                         : in to_2e_type;
    cin                         : in to_2c_type;
    din                         : in to_2d_type;
    emin                        : out std_logic;
    cmin                        : out std_logic_vector(TO_CWIDTH-1 downto 0);
    dmin                        : out std_logic_vector(TO_DWIDTH-1 downto 0));
end tom_2_to_1;


architecture behave of tom_2_to_1 is

    signal comp_d               : std_logic;
    signal wrap_d               : std_logic;
    signal out_addr_d           : std_logic_vector(3 downto 0);

begin


---------------------------------------------------------------------------------------------------------
-- Concurrent statments
---------------------------------------------------------------------------------------------------------

	-- Assertions ----------------------------------------------

	-----------------------------------------------------------

    -- Map signals to ports -----------------------------------

	-----------------------------------------------------------


    -- Asynchronous logic -------------------------------------
    comp_d <= '0' when din(1)(TO_DWIDTH-2 downto 0) < din(2)(TO_DWIDTH-2 downto 0) else '1';
    wrap_d <= '0' when din(1)(TO_DWIDTH-1) = din(2)(TO_DWIDTH-1) else '1';
    out_addr_d <= ein(1) & ein(2) & wrap_d & comp_d;
    -----------------------------------------------------------
---------------------------------------------------------------------------------------------------------
-- Asynchronous processes
---------------------------------------------------------------------------------------------------------    
    --------------------------------------------------------------------------
	-- Use the LUT address to generate a mux for the output. When the
    -- wrap flag is asserted take the opposite of the compare.
	--------------------------------------------------------------------------
    output_pcs : process(out_addr_d,ein,cin,din)
    begin
    -- out_addr_d <= ein & wrap_d & comp_d;
        case out_addr_d is
            when "0000" =>
                emin <= ein(1);
                cmin <= cin(1);
                dmin <= din(1);
            when "0001" =>
                emin <= ein(2);
                cmin <= cin(2);
                dmin <= din(2);
            when "0010" =>
                emin <= ein(2);
                cmin <= cin(2);
                dmin <= din(2);
            when "0011" =>
                emin <= ein(1);
                cmin <= cin(1);
                dmin <= din(1);
            when "0100" =>
                emin <= ein(1);
                cmin <= cin(1);
                dmin <= din(1);
            when "0101" =>
                emin <= ein(1);
                cmin <= cin(1);
                dmin <= din(1);
            when "0110" =>
                emin <= ein(1);
                cmin <= cin(1);
                dmin <= din(1);
            when "0111" =>
                emin <= ein(1);
                cmin <= cin(1);
                dmin <= din(1);
           when "1000" =>
                emin <= ein(2);
                cmin <= cin(2);
                dmin <= din(2);
            when "1001" =>
                emin <= ein(2);
                cmin <= cin(2);
                dmin <= din(2);
            when "1010" =>
                emin <= ein(2);
                cmin <= cin(2);
                dmin <= din(2);
            when "1011" =>
                emin <= ein(2);
                cmin <= cin(2);
                dmin <= din(2);
            when "1100" =>
                emin <= ein(1);
                cmin <= cin(1);
                dmin <= din(1);
            when "1101" =>
                emin <= ein(2);
                cmin <= cin(2);
                dmin <= din(2);
            when "1110" =>
                emin <= ein(2);
                cmin <= cin(2);
                dmin <= din(2);
            when "1111" =>
                emin <= ein(1);
                cmin <= cin(1);
                dmin <= din(1);
            when others =>
                emin <= 'X';
                cmin <= (others => 'X');
                dmin <= (others => 'X');
        end case;
    end process;

---------------------------------------------------------------------------------------------------------
-- Synchronous processes
---------------------------------------------------------------------------------------------------------


end behave;

