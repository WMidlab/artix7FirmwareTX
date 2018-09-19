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
-- Time order and merge (TOM) four inputs into a single output. The lower
-- level entities must have the same delay (pipeline stages) for time ordering to
-- be successful. The clock enable (ce) is used to lower the rate so the signals
-- can propagate through the asynchronous signal path.
--
-- Deficiencies/Issues
--
--*********************************************************************************
library ieee;
    use ieee.std_logic_1164.all;
library work;
    use work.time_order_pkg.all;


entity tom_4_to_1 is
	port(
    clk                         : in std_logic;
    ce                          : in std_logic;
    ein                         : in to_4e_type;
    cin                         : in to_4c_type;
    din                         : in to_4d_type;
    emin                        : out std_logic                             := '1';
    cmin                        : out std_logic_vector(TO_CWIDTH-1 downto 0);
    dmin                        : out std_logic_vector(TO_DWIDTH-1 downto 0));
end tom_4_to_1;


architecture behave of tom_4_to_1 is

    component tom_2_to_1 is
        port(
        ein                     : in to_2e_type;
        cin                     : in to_2c_type;
        din                     : in to_2d_type;
        emin                    : out std_logic;
        cmin                    : out std_logic_vector(TO_CWIDTH-1 downto 0);
        dmin                    : out std_logic_vector(TO_DWIDTH-1 downto 0));
    end component;
 
    signal ein2_t               : to_2e_type;
    signal cin2_t               : to_2c_type;
    signal din2_t               : to_2d_type;    
    signal emin1_t              : to_2e_type;
    signal cmin1_t              : to_2c_type;
    signal dmin1_t              : to_2d_type;
    signal emin2                : std_logic;
    signal cmin2                : std_logic_vector(TO_CWIDTH-1 downto 0);
    signal dmin2                : std_logic_vector(TO_DWIDTH-1 downto 0);    

begin

-- Stage 1 ------------------------------------
    tom_4_11 : tom_2_to_1
        port map(
        ein                     => ein(1),
        cin                     => cin(1),
        din                     => din(1),
        emin                    => emin1_t(1),
        cmin                    => cmin1_t(1),
        dmin                    => dmin1_t(1)
    );

    tom_4_12 : tom_2_to_1
        port map(
        ein                     => ein(2),
        cin                     => cin(2),
        din                     => din(2),
        emin                    => emin1_t(2),
        cmin                    => cmin1_t(2),
        dmin                    => dmin1_t(2)
    );

-- Stage 2 ------------------------------------
    tom_4_21 : tom_2_to_1
        port map(
        ein                     => ein2_t,
        cin                     => cin2_t,
        din                     => din2_t,
        emin                    => emin2,
        cmin                    => cmin2,
        dmin                    => dmin2
    );

---------------------------------------------------------------------------------------------------------
-- Concurrent statments
---------------------------------------------------------------------------------------------------------

	-- Assertions ----------------------------------------------

	-----------------------------------------------------------

    -- Map signals to ports -----------------------------------
    ein2_t <= (emin1_t(1),emin1_t(2));
    cin2_t <= (cmin1_t(1),cmin1_t(2));
    din2_t <= (dmin1_t(1),dmin1_t(2));

	-----------------------------------------------------------


    -- Asynchronous logic -------------------------------------


    -----------------------------------------------------------
---------------------------------------------------------------------------------------------------------
-- Asynchronous processes
---------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------------------
-- Synchronous processes
---------------------------------------------------------------------------------------------------------
    oreg_pcs : process(clk)
    begin
        if clk'event and clk='1' then
            if ce = '1' then
                emin <= emin2;
                cmin <= cmin2;
                dmin <= dmin2;
            end if;
        end if;
    end process;

end behave;


