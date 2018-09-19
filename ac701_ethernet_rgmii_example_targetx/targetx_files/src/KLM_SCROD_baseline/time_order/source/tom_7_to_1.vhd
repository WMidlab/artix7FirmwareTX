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
-- Time order and merge (TOM) seven inputs into a single output. The lower
-- level entities must have the same delay (pipeline stages) for time ordering to
-- be successful.
--
-- Deficiencies/Issues
--
--*********************************************************************************
library ieee;
    use ieee.std_logic_1164.all;
library work;
    use work.time_order_pkg.all;

entity tom_7_to_1 is
	port(
    clk                         : in std_logic;
    ce                          : in std_logic;
    ein                         : in to_7e_type;
    cin                         : in to_7c_type;
    din                         : in to_7d_type;
    emin                        : out std_logic                             := '1';
    cmin                        : out std_logic_vector(TO_CWIDTH-1 downto 0);
    dmin                        : out std_logic_vector(TO_DWIDTH-1 downto 0));
end tom_7_to_1;

architecture behave of tom_7_to_1 is

    component tom_4_to_1 is
        port(
        clk                     : in std_logic;
        ce                      : in std_logic;
        ein                     : in to_4e_type;
        cin                     : in to_4c_type;
        din                     : in to_4d_type;
        emin                    : out std_logic;
        cmin                    : out std_logic_vector(TO_CWIDTH-1 downto 0);
        dmin                    : out std_logic_vector(TO_DWIDTH-1 downto 0));
    end component;


    component tom_3_to_1 is
        port(
        clk                     : in std_logic;
        ce                      : in std_logic;
        ein                     : in to_3e_type;
        cin                     : in to_3c_type;
        din                     : in to_3d_type;
        emin                    : out std_logic;
        cmin                    : out std_logic_vector(TO_CWIDTH-1 downto 0);
        dmin                    : out std_logic_vector(TO_DWIDTH-1 downto 0));
    end component;
    
    component tom_2_to_1 is
        port(
        ein                     : in to_2e_type;
        cin                     : in to_2c_type;
        din                     : in to_2d_type;
        emin                    : out std_logic;
        cmin                    : out std_logic_vector(TO_CWIDTH-1 downto 0);
        dmin                    : out std_logic_vector(TO_DWIDTH-1 downto 0));
    end component;    

    signal ein11_t              : to_3e_type;
    signal cin11_t              : to_3c_type;
    signal din11_t              : to_3d_type;
    signal ein12_t              : to_4e_type;
    signal cin12_t              : to_4c_type;
    signal din12_t              : to_4d_type;

    signal emin1_t              : to_2e_type;
    signal cmin1_t              : to_2c_type;
    signal dmin1_t              : to_2d_type;

    signal ein2_t               : to_2e_type;
    signal cin2_t               : to_2c_type;
    signal din2_t               : to_2d_type;
    
    signal emin2                : std_logic;
    signal cmin2                : std_logic_vector(TO_CWIDTH-1 downto 0);
    signal dmin2                : std_logic_vector(TO_DWIDTH-1 downto 0);    

begin

-- Stage 1 ------------------------------------
    tom_3_to_1_11 : tom_3_to_1
        port map(
        clk                     => clk,
        ce                      => ce,
        ein                     => ein11_t,
        cin                     => cin11_t,
        din                     => din11_t,
        emin                    => emin1_t(1),
        cmin                    => cmin1_t(1),
        dmin                    => dmin1_t(1)
    );

    tom_4_to_1_12 : tom_4_to_1
        port map(
        clk                     => clk,
        ce                      => ce,
        ein                     => ein12_t,
        cin                     => cin12_t,
        din                     => din12_t,
        emin                    => emin1_t(2),
        cmin                    => cmin1_t(2),
        dmin                    => dmin1_t(2)
    );


-- Stage 2 ------------------------------------
    tom_2_to_1_21 : tom_2_to_1
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
    -- stage 1 ---------------------
    ein11_t <= (ein(1),ein(2),ein(3));
    cin11_t <= (cin(1),cin(2),cin(3));
    din11_t <= (din(1),din(2),din(3));

    ein12_t <= ((ein(4),ein(5)), (ein(6),ein(7)));
    cin12_t <= ((cin(4),cin(5)), (cin(6),cin(7)));
    din12_t <= ((din(4),din(5)), (din(6),din(7)));
    -- stage 2 ---------------------
    ein2_t <= emin1_t;
    cin2_t <= cmin1_t;
    din2_t <= dmin1_t;
	-----------------------------------------------------------


    -- Asynchronous logic -------------------------------------

    -----------------------------------------------------------
---------------------------------------------------------------------------------------------------------
-- Asynchronous processes
---------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------------------
-- Synchronous processes
---------------------------------------------------------------------------------------------------------
    -------------------------------------------------------
    -- Register output because 2-to-1 is completely
    -- asynchronous.
    -------------------------------------------------------
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


