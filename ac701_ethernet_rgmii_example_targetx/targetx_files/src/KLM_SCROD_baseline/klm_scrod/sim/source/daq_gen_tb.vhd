---*********************************************************************************
-- Indiana University
-- Center for Exploration of Energy and Matter (CEEM)
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    09/26/2011
--
--*********************************************************************************
-- Description:
-- Test bench for top level KLM SCROD FPGA.
--
-- Deficiencies/Know Issues
--
--*********************************************************************************
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.numeric_std.all;


entity daq_gen_tb is
end daq_gen_tb;

architecture behave of daq_gen_tb is

    component daq_gen_readout is
    generic(
        SIM_SPEEDUP     : in std_logic := '0');
    port(
        clk             : in std_logic;
        reset           : in std_logic;
        channel_up      : in std_logic;
        addr            : in std_logic_vector(3 downto 0);
        trigger         : in std_logic;
        trgrdy          : in std_logic;
        trgnext         : in std_logic;
        ctime           : in std_logic_vector(15 downto 0);
        tx_dst_rdy_n    : in std_logic;
        tx_src_rdy_n    : out std_logic;
        tx_sof_n        : out std_logic;
        tx_eof_n        : out std_logic;
        tx_d            : out std_logic_vector(15 downto 0);
        tx_rem          : out std_logic;
	 qt_fifo_rd_en		:out std_logic;
	 qt_fifo_rd_d		:in std_logic_vector(15 downto 0);
	 qt_fifo_empty		: in std_logic;
	 qt_fifo_src_rdy	: in std_logic);
	 
    end component;

    -- Clocks --------------------------------
    -- RF clock derivatives
	constant CKPER      : time 		                    := 1 ns;
	constant CKHPER     : time		                    := CKPER/2;
    ------------------------------------------
    constant USE_PRNG   : std_logic                     := '0';
    constant USE_LFSR   : std_logic                     := '0'; -- use LFSR for dst_rdy generation

    signal clk          : std_logic                     := '0';
    signal reset        : std_logic;
    signal channel_up   : std_logic;
    signal addr         : std_logic_vector(3 downto 0)  := X"3";
    signal trigger      : std_logic;
    signal trgrdy       : std_logic;
    signal trgnext      : std_logic;
    signal ctime        : std_logic_vector(26 downto 0);
    signal tx_dst_rdy_n : std_logic;
    signal tx_src_rdy_n : std_logic;
    signal tx_sof_n     : std_logic;
    signal tx_eof_n     : std_logic;
    signal tx_d         : std_logic_vector(15 downto 0);
    signal tx_rem       : std_logic;

	signal	qt_fifo_d		:	STD_LOGIC_VECTOR(15 DOWNTO 0):=x"0000";
	signal	qt_fifo_empty	:	std_logic;
	signal	qt_fifo_rd_clk	:	std_logic;
	signal	qt_fifo_rd_en	:	std_logic;
	signal	trig_ctime		:	std_logic_vector(15 downto 0):=x"0000";
	

    signal stim_enable  : std_logic                     := '0';
    signal trgfifo      : std_logic;
    signal dst_reg      : std_logic_vector(15 downto 0);
    signal wd_ctr       : std_logic_vector(7 downto 0);
    signal bad_sof      : std_logic;
    signal bad_eof      : std_logic;
    signal bad_len      : std_logic;
    signal bad_chg      : std_logic;

	--for all : daq_gen_readout use entity work.daq_gen_readout(single_trig);
	for all : daq_gen_readout use entity work.daq_gen_readout(multi_trig);	
	
begin

    ------------------------------------------------------------
    -- KLM SCROD (the unit-under-test)
    ------------------------------------------------------------
    UUT : daq_gen_readout
    generic map(
        SIM_SPEEDUP     => '1')
    port map(
        clk             => clk         ,
        reset           => reset       ,
        addr            => addr        ,
        channel_up      => channel_up  ,
        ctime           => ctime(15 downto 0),
        trigger         => trigger     ,
        trgrdy          => trgrdy      ,
        trgnext         => trgnext     ,
        tx_dst_rdy_n    => tx_dst_rdy_n,
        tx_src_rdy_n    => tx_src_rdy_n,
        tx_sof_n        => tx_sof_n    ,
        tx_eof_n        => tx_eof_n    ,
        tx_d            => tx_d        ,
        tx_rem          => tx_rem		,
		  qt_fifo_rd_en	=>	qt_fifo_rd_en,
		  qt_fifo_rd_d		=> qt_fifo_d,
		  qt_fifo_empty	=> qt_fifo_empty,
		  qt_fifo_src_rdy	=>	'0'
		  
    );

    -----------------------------------------------------------------------------------------------
    -- Miscellaneous Test Bench Stuff
    -----------------------------------------------------------------------------------------------
    clk <= (not clk) after CKHPER;
    reset <= '1', '0' after CKPER*4;
    channel_up <= '0', '1' after CKPER*8;
    -- trgrdy <= trgfifo'delayed(CKPER*4);
    -- trgnext <= trgrdy'delayed(CKPER*256);
    tx_dst_rdy_n <= dst_reg(3) when USE_LFSR = '1' else '0';

    --------------------------------------------------------------------------
    -- Generate fake triggers.
    --------------------------------------------------------------------------
    trg_pcs : process
        variable stop  : std_logic := '0';
    begin
        trigger <= '0';        
        wait for CKPER*12;
        trg_loop: for I in 1 to 256 loop
            trigger <= not stop;
            wait for CKPER*1;
            trigger <= '0';
            --wait for CKPER*95;
			wait for CKPER*1024;
            if I = 256 then
                stop := '1';
            end if;
        end loop;
    end process;
	
    fifo_pcs : process        
    begin	
        trgrdy <= '0';
		trgnext <= '0';
		wait until rising_edge(trigger);
		wait for CKPER*4;
		trgrdy <= '1';
		trgnext <= '0';
		wait for CKPER*512;
		trgrdy <= '0';
		trgnext <= '1';
		wait for CKPER*2;
		trgrdy <= '0';
		trgnext <= '0';

    end process;	

    --------------------------------------------------------------------------
    -- Generate a fake ctime.
    --------------------------------------------------------------------------
    ctime_pcs : process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                ctime <= (others => '0');
            else
                ctime <= ctime + '1';
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------
    -- Generate a psuedo-random shift register to increment counter at many
    -- different intervals, to provide stimulus that fully verifies
    -- time order circuit by toggling the next entities full flag.
    --------------------------------------------------------------------------
    dst_rdy_pcs : process(stim_enable,clk)
    begin
        if reset = '1' then
            dst_reg <= "0110110010101001";
        else
            if rising_edge(clk) then
                dst_reg <= dst_reg(14 downto 0) & (dst_reg(15) xor dst_reg(4) xor dst_reg(2) xor dst_reg(1));
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------
    -- Do some simple checks.
    --------------------------------------------------------------------------
    valid_pcs : process(clk)
    begin
        if rising_edge(clk) then
            if (reset or (not tx_eof_n)) = '1' then
                wd_ctr <= (others => '0');
                bad_sof <= '0';
                bad_eof <= '0';
                bad_len <= '0';
                bad_chg <= '0';
            else
                -- count valid word
                if tx_src_rdy_n = '0' then
                    wd_ctr <= wd_ctr + '1';
                end if;
                -- check SOF data value
                if (tx_sof_n or tx_src_rdy_n) = '0' then
--                    if tx_d(7 downto 0) /= TO_INTEGER(UNSIGNED(X"5A")) then
                    if tx_d(7 downto 0) /= X"5A" then
                        bad_sof <= '1';
                    end if;
                end if;
                -- check EOF data value
                if (tx_eof_n or tx_src_rdy_n) = '0' then
                    -- check charge value
                    if tx_d /= 0 then
                        bad_eof <= '1';
                    end if;
                    --check number of valid bytes
                    if wd_ctr /= 63 then
                        bad_len <= '1';
                    end if;
                end if;
                -- check for each charge value
                if (wd_ctr(1) and wd_ctr(0) and (not tx_src_rdy_n)) = '1' then
                    if tx_d /= 0 then
                        bad_chg <= '1';
                    end if;
                end if;
            end if;
        end if;
    end process;

end behave;