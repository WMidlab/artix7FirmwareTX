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
-- Time order and merge (TOM) three inputs into a single output. The lower
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


entity tom_3_to_1 is
	port(
    clk                         : in std_logic;
    ce                          : in std_logic;
    ein                         : in to_3e_type;
    cin                         : in to_3c_type;
    din                         : in to_3d_type;
    emin                        : out std_logic                             := '1';
    cmin                        : out std_logic_vector(TO_CWIDTH-1 downto 0);
    dmin                        : out std_logic_vector(TO_DWIDTH-1 downto 0));
end tom_3_to_1;


architecture behave of tom_3_to_1 is

    component tom_2_to_1 is
        port(
        ein                     : in to_2e_type;
        cin                     : in to_2c_type;
        din                     : in to_2d_type;
        emin                    : out std_logic;
        cmin                    : out std_logic_vector(TO_CWIDTH-1 downto 0);
        dmin                    : out std_logic_vector(TO_DWIDTH-1 downto 0));
    end component;

    signal ein1_t               : to_2e_type;
    signal cin1_t               : to_2c_type;
    signal din1_t               : to_2d_type;
    signal ein2_t               : to_2e_type;
    signal cin2_t               : to_2c_type;
    signal din2_t               : to_2d_type;
    signal emin1                : std_logic;
    signal cmin1                : std_logic_vector(TO_CWIDTH-1 downto 0);
    signal dmin1                : std_logic_vector(TO_DWIDTH-1 downto 0);
    signal emin2                : std_logic;
    signal cmin2                : std_logic_vector(TO_CWIDTH-1 downto 0);
    signal dmin2                : std_logic_vector(TO_DWIDTH-1 downto 0);

begin

-- Stage 1 ------------------------------------
    tom_4_11 : tom_2_to_1
        port map(
        ein                     => ein1_t,
        cin                     => cin1_t,
        din                     => din1_t,
        emin                    => emin1,
        cmin                    => cmin1,
        dmin                    => dmin1
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
    ein1_t <= (ein(1) , ein(2));
    cin1_t <= (cin(1) , cin(2));
    din1_t <= (din(1) , din(2));
    ein2_t <= (emin1 , ein(3));
    cin2_t <= (cmin1 , cin(3));
    din2_t <= (dmin1 , din(3));
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


