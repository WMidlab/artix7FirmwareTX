--*********************************************************************************
-- Indiana University
-- Center for Exploration of Energy and Matter (CEEM)
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    01/28/2014
--
--*********************************************************************************
-- Description:
-- Time order and merge (TOM) TO_NUM_LANES inputs into a single output. The empty flags
-- from the previous entity's FIFOs is used as a valid data flag. The minimum output
-- is found and then that FIFO is read - there is a feedback loop. The output is
-- only written when new data appears.
-- Output pseudocode: 
-- 1) Wait for valid data flag.
-- 2) Write minimum value to output.
-- 3) Read input that contains minimum value.
-- 4) Find new minimum value.
--
-- Deficiencies/Issues
-- 1) The use of constant is conflicting and lacking.
--*********************************************************************************
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.math_real.all;
library work;    
    use work.time_order_pkg.all;
    use work.tdc_pkg.all;

entity time_order is
    port(
    clk                         : in std_logic;
    ce                          : in std_logic;
    reset                       : in std_logic;
    dst_full                    : in std_logic;
    src_epty                    : in std_logic_vector(1 to TO_NUM_LANES);
    din                         : in tdc_dout_type;
    src_re                      : out std_logic_vector(1 to TO_NUM_LANES);
    dst_we                      : out std_logic;
    dout                        : out std_logic_vector(TO_WIDTH-1 downto 0));
end time_order;


architecture behave of time_order is
    
    component tom_10_to_1 is
        port(
        clk                     : in std_logic;
        ce                      : in std_logic;
        ein                     : in to_10e_type;
        cin                     : in to_10c_type;
        din                     : in to_10d_type;
        emin                    : out std_logic;
        cmin                    : out std_logic_vector(TO_CWIDTH-1 downto 0);
        dmin                    : out std_logic_vector(TO_DWIDTH-1 downto 0));
    end component;    
    
    constant LANE_BITS          : integer := INTEGER(CEIL(LOG2(REAL(TO_NUM_LANES))));
    
    signal ein_t                : to_mape_type(1 to TO_NUM_LANES);
    signal cin_t                : to_mapc_type(1 to TO_NUM_LANES);
    signal din_t                : to_mapd_type(1 to TO_NUM_LANES);    

    signal emin                 : std_logic;
    signal cmin                 : std_logic_vector(TO_CWIDTH-1 downto 0);    
    signal dmin                 : std_logic_vector(TO_DWIDTH-1 downto 0);    

    signal one_hot_ch_t         : std_logic_vector(1 to TO_NUM_LANES);
    signal src_re_d0            : std_logic_vector(1 to TO_NUM_LANES);
    signal src_re_q0            : std_logic_vector(1 to TO_NUM_LANES)          := (others => '0');
    signal out_cmp_d0           : std_logic;
    signal out_cmp_q0           : std_logic                                 := '0';
    signal out_cmp_d1           : std_logic;
    signal out_cmp_q1           : std_logic                                 := '0';
    signal out_cmp_q2           : std_logic                                 := '0';
    signal out_cmp_vec          : std_logic_vector(1 to TO_NUM_LANES);
    signal dout_q0              : std_logic_vector(TO_WIDTH-1 downto 0)     := (others => '0');
    signal dout_q1              : std_logic_vector(TO_WIDTH-1 downto 0)     := (others => '0');
    
    signal rdfail_ctr           : std_logic_vector(2 downto 0)            := (others => '1');
    signal rdfail               : std_logic_vector(1 to TO_NUM_LANES)     := (others => '0');    
    
    alias lane is cmin(cmin'length-1 downto cmin'length-4);

begin

---------------------------------------------------------------------------------------------------------
-- Component instantiations
---------------------------------------------------------------------------------------------------------
    
    -----------------------------------------------------------
    -- Time order scintillator data
    -----------------------------------------------------------
    rpc_tom_ins : tom_10_to_1
    port map(
        clk                 => clk,
        ce                  => ce,
        ein                 => to_10e_type(ein_t),
        cin                 => to_10c_type(cin_t),
        din                 => to_10d_type(din_t),
        emin                => emin,
        cmin                => cmin,
        dmin                => dmin
    );    
    
---------------------------------------------------------------------------------------------------------
-- Concurrent statments
---------------------------------------------------------------------------------------------------------

    -- Assertions ----------------------------------------------

    -----------------------------------------------------------
    
    -- Map the static signals to/from the port
    INPUT_GEN :
    for N in 1 to TO_NUM_LANES generate
        ein_t(N) <= src_epty(N);
        cin_t(N) <= TO_CH_FUN(N,LANE_BITS) & din(N)(din(N)'length-1 downto TO_DWIDTH);
        din_t(N) <= din(N)(TO_DWIDTH-1 downto 0);
    end generate;

    src_re <= src_re_q0;
    --dst_we <= out_cmp_q1;
    dst_we <= out_cmp_q2;
    --dout <= dout_q0;
    dout <= dout_q1;

    -- Asynchronous logic -------------------------------------
    dout_q0 <= cmin & dmin;

    -- exclude the bootstrap bit (MSb) from conversion
    one_hot_ch_t <= TO_CH2ONEHOT(cmin(cmin'length-1 downto cmin'length-LANE_BITS),TO_NUM_LANES);

    -- assert when the output data changes
    out_cmp_d0 <= '0' when dout_q0 = dout_q1 else '1';
    --out_cmp_d1 <= out_cmp_q0 and (not emin);
    out_cmp_d1 <= out_cmp_q0 and (not emin) and (not dst_full);
    --out_cmp_vec <= (others => out_cmp_q0);--? should we use _q1?
    out_cmp_vec <= (others => out_cmp_q1);--add another clock/output word?

    --src_re_d0 <= out_cmp_vec and (not src_epty) and one_hot_ch_t;
    src_re_d0 <= ((not src_epty) and out_cmp_vec and one_hot_ch_t) or (rdfail and one_hot_ch_t);
    -------------------------------- ---------------------------
    
---------------------------------------------------------------------------------------------------------
-- Synchronous processes
---------------------------------------------------------------------------------------------------------

    
    --------------------------------------------------------------------------
    -- Register the inputs and outputs to improve timing or adjust delays.
    --------------------------------------------------------------------------
    io_regs_pcs : process(clk)
    begin
        if (clk'event and clk = '1') then
        end if;
    end process;

    --------------------------------------------------------------------------
    -- Register valid data output signals to improve timing or adjust delays.
    --------------------------------------------------------------------------
    valid_pcs : process(clk)
    begin
        if (clk'event and clk = '1') then
            src_re_q0 <= src_re_d0;
            dout_q1 <= dout_q0;
            --out_cmp_q0 <= out_cmp_d0;
            if dst_full = '0' then
            -- upate with new value
                out_cmp_q0 <= out_cmp_d0;
            else
            --store when destination full so writing continues after
                out_cmp_q0 <= out_cmp_q0;
            end if;            
            out_cmp_q1 <= out_cmp_d1;
            out_cmp_q2 <= out_cmp_q1;
            --keep the logic from freezing, one value is lost
            if (emin or out_cmp_q1 or dst_full) = '1' then
            -- reset when empty or read
                rdfail_ctr <= (others => '1');
                rdfail <= (others => '0');
            else
            -- count idle CEs when not empty
                if ce = '1' then
                    rdfail_ctr <= rdfail_ctr - '1';
                end if;
                -- force a read for one clock cycle
                if rdfail_ctr = 0 then-- may need to move outside reset to meet timing
                    rdfail <= (others => '1');
                else
                    rdfail <= (others => '0');
                end if;
            end if;            
        end if;
    end process;

end behave;

