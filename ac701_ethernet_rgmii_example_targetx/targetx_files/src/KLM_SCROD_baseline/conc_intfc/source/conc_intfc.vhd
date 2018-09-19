--*********************************************************************************
-- Indiana University CEEM
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    06/09/2014
--
--*********************************************************************************
-- Description:
--
-- Reads trigger and DAQ packets from the scintillator electronics. The trigger
-- packets are comprised of of many smaller raw samples. Trigger raw samples are
-- channel and time. DAQ packets are an entire triggers worth of data. Data bandwith
-- is increased by not using the overhead of marking each raw sample on the link.
-- A pause should be inserted after the sof_n signal is asserted and ~4 pauses should
-- be inserted after eof_n is asserted.
--
-- Deficiencies/Issues
-- 1) Will drop a word if a clock correction sequence occurs during the middle of
--    a packet. Need to re-transmit if tx_dst_rdy_n is asserted while tx_src_rdy_n
--    is asserted. Could tranistion to a wait state that keeps all local link signals
--    the same until tx_dst_rdy_n is de-asserted. Or, could use the do_cc and warn_cc
--    signals to prevent sending data when tx_dst_rdy_n is going to be asserted.
-- 2) Does nothing with run control registers (may not matter).
-- 3) Does nothing with status registers.
-- 4) Need to add assertions to make sure no FIFO read or write errors occur.
--*********************************************************************************
library ieee;
	use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.numeric_std.all;
    use ieee.std_logic_misc.all;
library work;
    use work.time_order_pkg.all;
    use work.tdc_pkg.all;
    use work.conc_intfc_pkg.all;

entity conc_intfc is
	port(
    -- inputs ---------------------------------------------
	sys_clk						: in std_logic;
    tdc_clk                     : in std_logic;
    ce                          : in std_logic_vector(1 to 5);
    --B2TT interface
    b2tt_runreset               : in std_logic;
    b2tt_runreset2x             : in std_logic_vector(1 to 3);
    b2tt_gtpreset               : in std_logic;
    b2tt_fifordy                : in std_logic;
    b2tt_fifodata               : in std_logic_vector (95 downto 0);
    b2tt_fifonext               : out std_logic;    
    b2tt_ctime	               : in std_logic_vector(26 downto 0);    
    --TARGET ASIC trigger interface (trigger bits)
    target_tb                   : in tb_vec_type;
    target_tb16                 : in std_logic_vector(1 to TDC_NUM_CHAN);
    -- status sent to concentrator
    status_regs                 : in stat_reg_type;
    -- Aurora local input local link (from Concentrator)
    rx_dst_rdy_n                : out std_logic;
    rx_sof_n                    : in std_logic;
    rx_eof_n                    : in std_logic;
    rx_src_rdy_n                : in std_logic;
    rx_data                     : in std_logic_vector(15 downto 0);
    -- DAQ data local link input (TARGET DAQ data when triggered)
    daq_dst_rdy_n               : out std_logic;
    daq_sof_n                   : in std_logic;--start of trigger
    daq_eof_n                   : in std_logic;--end of trigger
    daq_src_rdy_n               : in std_logic;
    daq_data                    : in std_logic_vector(15 downto 0);
    -- outputs --------------------------------------------
    exttrg                      : out std_logic                             := '0';
    exttb                       : out tb_vec_type;
	-- fine trig bram - for KPP testing:
	exttb_format				: in std_logic_vector(3 downto 0);-- format of the exttb which is a copy that comes out of TDC
	trigasic_select				: in std_logic_vector(9 downto 0); -- theoretically only one ASIC should be enabled on this
	trigasic_bram_rd_clk		: in std_logic;
	trigasic_bram_we			: in std_logic;
	trigasic_bram_rd_addr		: in std_logic_vector(8 downto 0);
	trigasic_bram_rd_data		: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);

    -- Aurora local ouptput local link (to Concentrator)
    tx_dst_rdy_n                : in std_logic;
    tx_sof_n                    : out std_logic;
    tx_eof_n                    : out std_logic;
    tx_src_rdy_n                : out std_logic;
    tx_data                     : out std_logic_vector(15 downto 0);
    -- Run control local link output
    rcl_dst_rdy_n               : in std_logic;
    rcl_sof_n                   : out std_logic                             := '1';
    rcl_eof_n                   : out std_logic                             := '1';
    rcl_src_rdy_n               : out std_logic                             := '1';
    rcl_data                    : out std_logic_vector(15 downto 0));
end conc_intfc;

architecture behave of conc_intfc is

    component tdc is
    port(
    -- Inputs -----------------------------
        tdc_clk                 : in std_logic;
        ce                      : in std_logic_vector(1 to 4);
        reset                   : in std_logic;
        tdc_clr                 : in std_logic;
        tb                      : in tb_vec_type;
        tb16                    : in std_logic_vector(1 to TDC_NUM_CHAN);
        fifo_re                 : in std_logic_vector(1 to TDC_NUM_CHAN);
		  exttb_format			:in std_logic_vector(3 downto 0);
	 -- Outputs -----------------------------
        exttb                   : out tb_vec_type;    
        fifo_ept                : out std_logic_vector(1 to TDC_NUM_CHAN);
        tdc_dout                : out tdc_dout_type);
    end component;

    component time_order is
    port(
        clk                     : in std_logic;
        ce                      : in std_logic;
        reset                   : in std_logic;
        dst_full                : in std_logic;
        src_epty                : in std_logic_vector(1 to TO_NUM_LANES);
        din                     : in tdc_dout_type;
        src_re                  : out std_logic_vector(1 to TO_NUM_LANES);
        dst_we                  : out std_logic;
        dout                    : out std_logic_vector(TO_WIDTH-1 downto 0));
    end component;

    component trig_chan_calc is
    generic(
        NUM_CHAN                : integer;   -- ASIC channels
        LANEIW                  : integer;   -- Lane in width
        CHANIW                  : integer;   -- Channel in width
        CHANOW                  : integer;   -- Channel out width
        AXIS_VAL                : std_logic);-- Axis bit default
    port(
        -- inputs ---------------------------------------------
        clk						: in std_logic;
        we                      : in std_logic;
        lane                    : in std_logic_vector(LANEIW-1 downto 0);
        chan                    : in std_logic_vector(CHANIW-1 downto 0);
        valid                   : out std_logic;
        axis_bit                : out std_logic;
        trig_chan               : out std_logic_vector(CHANOW-1 downto 0));
    end component;

    component trig_fifo
    port (
        rst                     : in std_logic;
        wr_clk                  : in std_logic;
        rd_clk                  : in std_logic;
        din                     : in std_logic_vector(17 downto 0);
        wr_en                   : in std_logic;
        rd_en                   : in std_logic;
        dout                    : out std_logic_vector(17 downto 0);
        full                    : out std_logic;
        almost_full             : out std_logic;
        empty                   : out std_logic;
        almost_empty            : out std_logic);
    end component;

    component daq_fifo
    port (
        clk                     : in std_logic;
        srst                    : in std_logic;
        din                     : in std_logic_vector(17 downto 0);
        wr_en                   : in std_logic;
        rd_en                   : in std_logic;
        dout                    : out std_logic_vector(17 downto 0);
        full                    : out std_logic;
        almost_full             : out std_logic;
        empty                   : out std_logic;
        almost_empty            : out std_logic);
    end component;

--COMPONENT trigasic_bram
--  PORT (
--    clka : IN STD_LOGIC;
--    ena : IN STD_LOGIC;
--    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
--    dina : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    clkb : IN STD_LOGIC;
--    enb : IN STD_LOGIC;
--    addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
--    doutb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
--  );
--END COMPONENT;


    type tx_fsm_type is (CLEARS,IDLES,TRGSOFS,TRGPLDS,DAQSOFS,DAQPLDS,TRGEOFS,STATSOFS,STATPLDS);
    type word_shift_type is array (natural range <> ) of std_logic_vector(15 downto 0);

    signal exttrg_ctr           : std_logic_vector(3 downto 0)      := (others => '0');
    
    signal tdc_rden             : std_logic_vector(1 to TDC_NUM_CHAN);
    signal tdc_epty             : std_logic_vector(1 to TDC_NUM_CHAN);
    signal tdc_dout             : tdc_dout_type;

    signal to_dst_we            : std_logic;
    signal to_dout              : std_logic_vector(TO_WIDTH-1 downto 0);
    signal to_valid             : std_logic_vector(1 downto 0);

    signal trg_fifo_we          : std_logic                         := '0';
    signal trg_fifo_di          : std_logic_vector(17 downto 0);
    signal trg_fifo_re          : std_logic;
    signal trg_fifo_do          : std_logic_vector(17 downto 0);
    signal trg_fifo_afull       : std_logic;
    signal trg_fifo_epty        : std_logic;
    signal trg_fifo_aepty       : std_logic;
    signal trg_fifo_full        : std_logic;
    -- signal trg_fifo_rderr       : std_logic;
    -- signal trg_fifo_wrerr       : std_logic;

    signal daq_fifo_we          : std_logic                         := '0';
    signal daq_fifo_di          : std_logic_vector(17 downto 0);
    signal daq_fifo_re          : std_logic;
    signal daq_fifo_do          : std_logic_vector(17 downto 0);
    signal daq_fifo_afull       : std_logic;
    signal daq_fifo_epty        : std_logic;
    signal daq_fifo_aepty       : std_logic;
    signal daq_fifo_full        : std_logic;
    -- signal daq_fifo_rderr       : std_logic;
    -- signal daq_fifo_wrerr       : std_logic;

    signal axis_bit             : std_logic;
    signal trg_ch               : std_logic_vector(7 downto 0);
    signal trg_ch_valid         : std_logic;
    signal strg_eof             : std_logic;
    signal trg_valid            : std_logic_vector(0 downto 0);
    signal trgsof_ctr           : std_logic_vector(7 downto 0);
    signal trgeof_ctr           : std_logic_vector(7 downto 0);

    signal zrlentrg             : std_logic;
    signal ftrgtag              : std_logic;
    signal daq_sof_d            : std_logic;
    signal daq_eof_d            : std_logic;
    signal daq_sof_q            : std_logic_vector(1 downto 0);
    signal daq_eof_q            : std_logic_vector(1 downto 0);
    signal daq_src_rdy_q        : std_logic_vector(1 downto 0);
    signal daq_data_q           : word_shift_type(1 downto 0);
    signal daq_valid            : std_logic_vector(2 downto 0);
    signal daq_di_addr          : std_logic_vector(2 downto 0);
    signal daq_pause            : std_logic_vector(3 downto 0);
    signal sts_pause            : std_logic_vector(1 downto 0);
    signal idl_pause            : std_logic_vector(1 downto 0);


    -- pakcet type counter (time spent writing trigger data) - just change the width to adjust
    signal pkttp_ctr_ld         : std_logic;
    signal pkttp_ctr_tc         : std_logic;
    signal pkttp_ctr            : std_logic_vector(PKTTP_CTRW-1 downto 0);
    signal trgpkt_ctr_ld        : std_logic;
    signal trgpkt_ctr_en        : std_logic;
    signal trgpkt_ctr_tc        : std_logic;
    signal trgpkt_ctr           : std_logic_vector(TGPKT_CTRW-1 downto 0);
    signal stspkt_ctr_ld        : std_logic;
    signal stspkt_ctr_en        : std_logic;
    signal stspkt_ctr_tc        : std_logic;
    signal stspkt_ctr           : std_logic_vector(STSPKT_CTRW-1 downto 0);

    signal sts_sof              : std_logic;
    signal sts_eof              : std_logic;
    signal sts_sof_q            : std_logic;
    signal sts_data             : std_logic_vector(15 downto 0);

    signal tx_fsm_cs            : tx_fsm_type                           := CLEARS;
    signal tx_fsm_ns            : tx_fsm_type;

    alias to_ln is to_dout(16 downto 13);
    alias to_ch is to_dout(12 downto 9);
    alias to_tdc is to_dout(TDC_TWIDTH-1 downto 0);
    alias trgtag is b2tt_fifodata(47 downto 32);
    alias atrg_sof is trg_fifo_do(trg_fifo_do'length-1);
    alias atrg_eof is trg_fifo_do(trg_fifo_do'length-2);
    alias daq_sof is daq_fifo_do(daq_fifo_do'length-1);
    alias daq_eof is daq_fifo_do(daq_fifo_do'length-2);

    signal trigasic_bram_wr_addr              : std_logic_vector(10 downto 0)   := (others=>'0');
	 signal trig_asic_num:std_logic_vector(3 downto 0);
	 signal I_trigasic:integer:=0;
	 signal trigasic_bram_wr_data:std_logic_vector(0 downto 0);
	 signal trigasic_bram_we_i:std_logic_vector(0 downto 0);
	 signal exttb_i                  : tb_vec_type;  
begin

------------------------------------------------------------------------------------------------
-- Component instantiations
------------------------------------------------------------------------------------------------

    ------------------------------------------------------------
    -- Generate TDC value from trigger bits and buffer.
    ------------------------------------------------------------
    tdc_ins : tdc
    port map(
    -- Inputs -----------------------------
        tdc_clk                 => tdc_clk,
        ce                      => ce(1 to 4),
        reset                   => b2tt_runreset2x(1),
        tdc_clr                 => b2tt_runreset2x(2),
        tb                      => target_tb,
        tb16                    => target_tb16,
        fifo_re                 => tdc_rden,
		exttb_format			=> exttb_format,
	-- Outputs -----------------------------
        exttb                   => exttb_i,
        fifo_ept                => tdc_epty,
        tdc_dout                => tdc_dout
    );

    ------------------------------------------------------------
    -- Time order TDC values.
    ------------------------------------------------------------
    tmodr_ins : time_order
    port map(
        clk                     => tdc_clk,
        ce                      => ce(5),
        reset                   => b2tt_runreset2x(3),
        dst_full                => trg_fifo_full,
        src_epty                => tdc_epty,
        din                     => tdc_dout,
        src_re                  => tdc_rden,
        dst_we                  => to_dst_we,
        dout                    => to_dout
    );

    --------------------------------------------------------------------------
	-- Calculate the channel word for trigger Aurora stream (convert to unified
    -- trigger data format).
	--------------------------------------------------------------------------
    trg_chan_ins : trig_chan_calc
    generic map(
        NUM_CHAN                => ASIC_NUM_CHAN,
        LANEIW                  => to_ln'length,
        CHANIW                  => to_ch'length,
        CHANOW                  => trg_ch'length,
        AXIS_VAL                => AXIS_BIT_VAL)-- Axis bit default
    port map(
        clk						=> tdc_clk,
        we                      => to_dst_we,
        lane                    => to_ln,
        chan                    => to_ch,
        valid                   => trg_ch_valid,
        axis_bit                => axis_bit,
        trig_chan               => trg_ch
    );

    --------------------------------------------------------------------------
	-- Buffer trigger data and cross clock domain to system clock.
	--------------------------------------------------------------------------
    trig_fifo_ins : trig_fifo
    port map(
        rst                     => b2tt_runreset,
        wr_clk                  => tdc_clk,
        rd_clk                  => sys_clk,
        din                     => trg_fifo_di,
        wr_en                   => trg_fifo_we,
        rd_en                   => trg_fifo_re,
        dout                    => trg_fifo_do,
        full                    => trg_fifo_full,
        almost_full             => trg_fifo_afull,
        empty                   => trg_fifo_epty,
        almost_empty            => trg_fifo_aepty
    );


    --------------------------------------------------------------------------
	-- Buffer DAQ data.
	--------------------------------------------------------------------------
    daq_fifo_ins : daq_fifo
    port map(
        clk                     => sys_clk,
        srst                    => b2tt_runreset,
        din                     => daq_fifo_di,
        wr_en                   => daq_fifo_we,
        rd_en                   => daq_fifo_re,
        dout                    => daq_fifo_do,
        full                    => daq_fifo_full,
        almost_full             => daq_fifo_afull,
        empty                   => daq_fifo_epty,
        almost_empty            => daq_fifo_aepty
    );

	trigasic_bram_ins : entity work.trigasic_bram
  PORT MAP (
    clka => sys_clk,--tdc_clk,
    ena => '1',
    enb => '1',
    addra 	=> trigasic_bram_wr_addr,
    wea 	=> trigasic_bram_we_i,
    dina 	=> trigasic_bram_wr_data,
    clkb 	=> trigasic_bram_rd_clk,
    addrb 	=> trigasic_bram_rd_addr(8 downto 0),
    doutb 	=> trigasic_bram_rd_data
  );



  --------------------------------------------------------
	-- Map signals out of the port
	--------------------------------------------------------

	--------------------------------------------------------
	-- Combinational logic
	--------------------------------------------------------
    daq_sof_d <= not (daq_sof_n or daq_src_rdy_n);
    daq_eof_d <= not (daq_eof_n or daq_src_rdy_n);
    daq_di_addr <= ftrgtag & daq_sof_q(1) & (not (daq_sof_n or daq_src_rdy_n));

	trig_asic_num<=	x"1" when trigasic_select="0000000001" else
					x"2" when trigasic_select="0000000010" else
					x"3" when trigasic_select="0000000100" else
					x"4" when trigasic_select="0000001000" else
					x"5" when trigasic_select="0000010000" else
					x"6" when trigasic_select="0000100000" else
					x"7" when trigasic_select="0001000000" else
					x"8" when trigasic_select="0010000000" else
					x"9" when trigasic_select="0100000000" else
					x"A" when trigasic_select="1000000000" else
					x"1";-- we cannot have x"0" here
	
	trigasic_bram_wr_data(0)<=exttb_i(I_trigasic)(1) or exttb_i(I_trigasic)(2) or exttb_i(I_trigasic)(3) or exttb_i(I_trigasic)(4) or exttb_i(I_trigasic)(5);
	
	exttb<=exttb_i;

---------------------------------------------------------------------------------------------------------
-- Asynchronous and Synchronous processes
---------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------
-- Synchronous processes
-------------------------------------------------------------------------------------------

    --------------------------------------
    -- Counter to generate sys_clk equivalent values for the trig bram which is going to be used for KPP
    --------------------------------------
    sys_clk_count_pcs : process(sys_clk)
    begin
        if (sys_clk'event and sys_clk = '1') then
			I_trigasic<=to_integer(unsigned(trig_asic_num));
			trigasic_bram_we_i(0)<=trigasic_bram_we;
            if b2tt_runreset = '1' then
                trigasic_bram_wr_addr <= (others=>'0');
            else
                trigasic_bram_wr_addr <= trigasic_bram_wr_addr + 1;
            end if;
        end if;
    end process;

	
    --------------------------------------------------------------------------
	-- Generate external trigger
	--------------------------------------------------------------------------
    exttrg_pcs : process(tdc_clk)
    begin
        if (tdc_clk'event and tdc_clk = '1') then
            if b2tt_runreset2x(1) = '1' then
                exttrg_ctr <= (others => '0');
                exttrg <= '0';
            else
                if to_dst_we = '1' then
                    exttrg_ctr <= (others => '1');
                    exttrg <= '1';
                else
                    if exttrg_ctr = 0 then
                        exttrg_ctr <= exttrg_ctr;
                        exttrg <= '0';
                    else
                        exttrg_ctr <= exttrg_ctr - 1;
                        exttrg <= '1';
                    end if;
                end if;
            end if;
        end if;
    end process;


    --------------------------------------------------------------------------
	-- Deal with the b2tt interface
	--------------------------------------------------------------------------
    b2tt_pcs : process(sys_clk)
    begin
        if (sys_clk'event and sys_clk = '1') then
            -- get the next trigger tag value from first-word-fall-through-fifo
            --?has not been tested, trigger processing must take 8 clocks minimum
            if b2tt_runreset = '1' then
                b2tt_fifonext <= '0';
            else
                b2tt_fifonext <= b2tt_fifordy and daq_eof_q(0);
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------
	-- Write data to the trigger FIFO. Add SOF and EOF in the upper data bits.
	--------------------------------------------------------------------------
    trg_wr_pcs : process(tdc_clk)
    begin
        if (tdc_clk'event and tdc_clk = '1') then
            -- trigger FIFO input signals
            -- need extend pulse to write two words
            to_valid <= trg_ch_valid & to_valid(to_valid'length-1 downto 1);
            -- write channel and TDC (data)
            trg_fifo_we <= to_valid(1) or to_valid(0);
            if to_valid(1) = '1' then
                -- sof & eof & spare bits & data
--                trg_fifo_di <= "10" & "0000000" & axis_bit & STD_LOGIC_VECTOR(trg_ch); --old
                trg_fifo_di <= "10" & b2tt_ctime(13 downto 7) & axis_bit & STD_LOGIC_VECTOR(trg_ch);-- with KPP: ctime is embedded here
            else
                -- sof & eof & spare bits & data
--                trg_fifo_di <= "01" & "0000000" & to_tdc; old one
                trg_fifo_di <= "01" & b2tt_ctime(6 downto 0) & to_tdc;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------
	-- Read data from the trigger FIFO.
	--------------------------------------------------------------------------
    trg_rd_pcs : process(sys_clk)
    begin
        if (sys_clk'event and sys_clk = '1') then
            trg_valid <= trg_fifo_re & trg_valid (trg_valid'length-1 downto 1);
            if pkttp_ctr_ld = '1' then
                trgsof_ctr <= (others => '0');
                trgeof_ctr <= (others => '0');
            else
                if (trg_valid(0) and atrg_sof) = '1' then
                    trgsof_ctr <= trgsof_ctr + '1';
                end if;
                if (trg_valid(0) and atrg_eof) = '1' then
                    trgeof_ctr <= trgeof_ctr + '1';
                end if;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------
	-- Write data to the DAQ FIFO. Place SOF and EOF in the upper data bits.
	--------------------------------------------------------------------------
    daq_wr_pcs : process(sys_clk)
    begin
        if (sys_clk'event and sys_clk = '1') then
            daq_dst_rdy_n <= daq_fifo_afull;
            zrlentrg <= not (daq_sof_n or daq_eof_n or daq_src_rdy_n);
            ftrgtag <= zrlentrg;
            --delay two clocks so we can insert SOF marker and TRGTAG ------------
            daq_sof_q <= daq_sof_d & daq_sof_q(daq_sof_q'length-1 downto 1);
            daq_eof_q <= daq_eof_d & daq_eof_q(daq_eof_q'length-1 downto 1);
            daq_src_rdy_q <= (not daq_src_rdy_n) & daq_src_rdy_q(daq_src_rdy_q'length-1 downto 1);
            daq_data_q <= daq_data & daq_data_q(daq_data_q'length-1 downto 1);
            -------------------------------------------------------------------
            --generate write enable and extend to compensate for SOF marker and TRGTAG
            --daq_fifo_we <= (not daq_fifo_afull) and (not zrlentrg) and ((not daq_src_rdy_n) or daq_eof_q(1) or daq_eof_q(0));--!make sure afull provides enough delay
            daq_fifo_we <= (not daq_fifo_afull) and (not zrlentrg) and (daq_sof_d or daq_sof_q(1) or daq_src_rdy_q(0) or daq_eof_q(1) or daq_eof_q(0));--!make sure afull provides enough delay
            -- select link transmit data
            case daq_di_addr is
            when "000" =>
                -- payload/EOF
                daq_fifo_di <= (not daq_sof_n) & daq_eof_q(0) & daq_data_q(0);
            when "001" =>
                -- insert SOF marker
                daq_fifo_di <= "10" & DAQ_SOF_VAL;
            when "010" =>
                -- insert 16-bits of trigger tag
                daq_fifo_di <= "00" & trgtag;
            when "011" =>
                -- should not happen
                daq_fifo_di <= "10" & DAQ_SOF_VAL;
            when "100" =>
                -- payload/EOF, force trigger tag & EOF when zero length
                daq_fifo_di <= "01" & trgtag;
            when "101" =>
                -- insert SOF marker
                daq_fifo_di <= "10" & DAQ_SOF_VAL;
            when "110" =>
                -- insert 16-bits of trigger tag
                daq_fifo_di <= "00" & trgtag;
            when "111" =>
                -- should not happen
                daq_fifo_di <= "10" & DAQ_SOF_VAL;
            when others =>
                -- will not happen
                daq_fifo_di <= (others => 'X');
            end case;
        end if;
    end process;

    --------------------------------------------------------------------------
	-- Read data from the DAQ FIFO.
	--------------------------------------------------------------------------
    daq_rd_pcs : process(sys_clk)
    begin
        if (sys_clk'event and sys_clk = '1') then
            daq_valid <= daq_fifo_re & daq_valid(daq_valid'length-1 downto 1);
            daq_pause <= (atrg_eof and pkttp_ctr_tc) & daq_pause(daq_pause'length-1 downto 1);
            sts_pause <= daq_eof & sts_pause(sts_pause'length-1 downto 1);
            idl_pause <= sts_eof & idl_pause(idl_pause'length-1 downto 1);
        end if;
    end process;

    --------------------------------------------------------------------------
	-- Write status data to registers to delay.
	--------------------------------------------------------------------------
    status_wr_pcs : process(sys_clk)
    begin
        if (sys_clk'event and sys_clk = '1') then
            sts_sof_q <= sts_sof;
            if stspkt_ctr_en = '0' then
                sts_data <= STS_SOF_VAL;
            else
                sts_data <= status_regs(TO_INTEGER(UNSIGNED(stspkt_ctr)));
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------
	-- Counters for packet type logic.
	--------------------------------------------------------------------------
    packet_pcs : process(sys_clk)
    begin
        if (sys_clk'event and sys_clk = '1') then
            -- Trigger or DAQ packet timer
            if pkttp_ctr_ld = '1' then
                pkttp_ctr <= (others => '1');
                pkttp_ctr_tc <= '0';
            else
                if pkttp_ctr_tc = '0' then
                    pkttp_ctr <= pkttp_ctr - '1';
                end if;
                if pkttp_ctr = 0 then
                    pkttp_ctr_tc <= '1';
                end if;
            end if;
            -- Counter for trigger packets for status packet decision
            if trgpkt_ctr_ld = '1' then
                trgpkt_ctr <= (others => '1');
                trgpkt_ctr_tc <= '0';
            else
                if trgpkt_ctr_en = '1' then
                    trgpkt_ctr <= trgpkt_ctr - '1';
                end if;
                if trgpkt_ctr = 0 then
                    trgpkt_ctr_tc <= '1';
                end if;
            end if;
            -- Counter for status packet length
            if stspkt_ctr_ld = '1' then
                stspkt_ctr <= (others => '0');
                stspkt_ctr_tc <= '0';
            else
                if (stspkt_ctr_en and (not stspkt_ctr_tc)) <= '1' then
                    stspkt_ctr <= stspkt_ctr + '1';
                end if;
                if stspkt_ctr = (NUM_STAT_REGS-2) then
                    stspkt_ctr_tc <= '1';
                end if;
            end if;
        end if;
    end process;

    --------------------------------------------------------------------------
	-- Asynchronous poriton of local link transmit state machine. Control
    -- reading of trigger, DAQ, and status data from FIFO and the writing of
    -- said data to the Aurora lane. Must be asynchronous because tx_dst_rdy_n
    -- can be asserted any clock cycle. May be able to use warn_cc signal to
    -- pause transmit so no link errors occur.
    --?Unlikely this will meet timing, but try to keep trigger data latency low.
	--------------------------------------------------------------------------
    ll_tx_fsm_a : process(tx_fsm_cs,tx_dst_rdy_n,pkttp_ctr_tc,trg_fifo_epty,daq_fifo_epty,atrg_sof,atrg_eof,daq_sof,daq_eof,trgpkt_ctr_tc,trg_fifo_do,daq_fifo_do,daq_pause(0),stspkt_ctr_tc,sts_data,sts_pause,idl_pause,sts_eof)
	begin
        -- Default values (use less lines)
        pkttp_ctr_ld <= '0';
        trgpkt_ctr_ld <= '0';
        trgpkt_ctr_en <= '0';
        stspkt_ctr_ld <= '1';
        stspkt_ctr_en <= '0';
        strg_eof <= '0';
        sts_sof <= '0';
        sts_eof <= '0';
        trg_fifo_re <= '0';
        daq_fifo_re <= '0';
        tx_sof_n <= '1';
        tx_eof_n <= '1';
        --tx_src_rdy_n <= '1';
        tx_data <= (others => '1');

        case tx_fsm_cs is
            when CLEARS =>
                pkttp_ctr_ld <= '1';
                trgpkt_ctr_ld <= '1';
                trgpkt_ctr_en <= '0';
                stspkt_ctr_ld <= '1';
                strg_eof <= '0';
                sts_sof <= '0';
                sts_eof <= '0';
                trg_fifo_re <= '0';
                daq_fifo_re <= '0';
                tx_sof_n <= '1';
                tx_eof_n <= '1';
                --tx_src_rdy_n <= '1';
                tx_data <= (others => '1');
                tx_fsm_ns <= IDLES;
            when IDLES =>
            -- wait until FIFO has data and Aurora ready
                if tx_dst_rdy_n = '0' then
                    if pkttp_ctr_tc = '0' then
                    -- trigger takes precedence
                        if trg_fifo_epty = '0' then
                            tx_fsm_ns <= TRGSOFS;
                        else
                            tx_fsm_ns <= IDLES;
                        end if;
                    else
                        if daq_fifo_epty = '0' then
                            tx_fsm_ns <= DAQSOFS;
                        else
                            tx_fsm_ns <= IDLES;
                        end if;
                    end if;
                else
                    tx_fsm_ns <= IDLES;
                end if;
            when TRGSOFS =>
            -- make sure trigger SOF is read
                trg_fifo_re <= (not tx_dst_rdy_n) and (not trg_fifo_epty) and (not atrg_sof);
                if ((not tx_dst_rdy_n) and atrg_sof) = '1' then
                -- make sure SOF was read
                    tx_sof_n <= '0';
                    --tx_src_rdy_n <= '0';
                    tx_fsm_ns <= TRGPLDS;
                    tx_data <= TRG_SOF_VAL;-- insert trigger SOF value
                else
                -- wait otherwise
                    tx_sof_n <= '1';
                    --tx_src_rdy_n <= '1';
                    tx_fsm_ns <=TRGSOFS;
                    tx_data <= trg_fifo_do(15 downto 0);-- FIFO data
                end if;
                --tx_data <= trg_fifo_do(15 downto 0);
            when TRGPLDS =>
            -- make sure the trigger payload is read until EOF
                trg_fifo_re <= (not tx_dst_rdy_n) and (not trg_fifo_epty) and (not (atrg_eof and pkttp_ctr_tc));
                --tx_src_rdy_n <= tx_dst_rdy_n or trg_fifo_epty;
                if ((not tx_dst_rdy_n) and (atrg_eof and pkttp_ctr_tc)) = '1' then
                -- make sure EOF was read
                    --tx_eof_n <= '0';--g
                    strg_eof <= '1';--n
                    tx_fsm_ns <= TRGEOFS;
                else
                -- keep reading otherwise
                    --tx_eof_n <= '1';--g
                    strg_eof <= '0';--n
                    tx_fsm_ns <= TRGPLDS;
                end if;
                tx_data <= trg_fifo_do(15 downto 0);
            when TRGEOFS =>
            -- write EOF and counters for debug
                --tx_eof_n <= '0';--n
                tx_eof_n <= not (daq_pause(daq_pause'length-1) and (not daq_pause(daq_pause'length-2)));--n
                pkttp_ctr_ld <= '1';-- use for pause
                -- where do we go next? - send status if sent enough trigger packets and DAQ ZLT
                if daq_pause(0) = '1' then
                    tx_fsm_ns <= DAQSOFS;
                else
                    tx_fsm_ns <= TRGEOFS;--IDLES;
                end if;
               tx_data <= trgsof_ctr & trgeof_ctr;
            when DAQSOFS =>
            -- make sure DAQ SOF is read
                pkttp_ctr_ld <= '1';
                daq_fifo_re <= (not tx_dst_rdy_n) and (not daq_fifo_epty) and (not daq_sof);
                if ((not tx_dst_rdy_n) and daq_sof) = '1' then
                    tx_sof_n <= '0';
                    --tx_src_rdy_n <= '0';
                    trgpkt_ctr_en <= '1';
                    tx_fsm_ns <= DAQPLDS;
                else
                    tx_sof_n <= '1';
                    --tx_src_rdy_n <= '1';
                    trgpkt_ctr_en <= '0';
                    tx_fsm_ns <= DAQSOFS;
                end if;
                tx_data <= daq_fifo_do(15 downto 0);
            when DAQPLDS =>
            -- make sure the DAQ payload is read until EOF
                pkttp_ctr_ld <= '1';
                daq_fifo_re <= (not tx_dst_rdy_n) and (not daq_fifo_epty) and (not daq_eof);
                --tx_src_rdy_n <= tx_dst_rdy_n or daq_fifo_epty;
                --if ((not tx_dst_rdy_n) and daq_eof) = '1' then--g
                tx_eof_n <= not (daq_eof and (not sts_pause(sts_pause'length-1)));
                if ((not tx_dst_rdy_n) and daq_eof and sts_pause(0)) = '1' then--n
                    --tx_eof_n <= '0';--g
                    if trgpkt_ctr_tc = '1' then--g
                        tx_fsm_ns <= STATSOFS;
                    else
                        tx_fsm_ns <= IDLES;
                    end if;
                else
                    --tx_eof_n <= '1';--g
                    tx_fsm_ns <= DAQPLDS;
                end if;
                tx_data <= daq_fifo_do(15 downto 0);
            when STATSOFS =>
            -- send start of frame (SOF)
                pkttp_ctr_ld <= '1';
                trgpkt_ctr_ld <= '1';
                sts_sof <= '1';
                if ((not tx_dst_rdy_n) and sts_sof_q) = '1' then
                    tx_sof_n <= '0';
                    tx_fsm_ns <= STATPLDS;
                else
                    tx_sof_n <= '1';
                    tx_fsm_ns <= STATSOFS;
                end if;
                tx_data <= sts_data;
            when STATPLDS =>
                pkttp_ctr_ld <= '1';
                trgpkt_ctr_ld <= '1';
                stspkt_ctr_ld <= '0';
                --tx_eof_n <= not (stspkt_ctr_tc and (not idl_pause(idl_pause'length-1)));-- sts_eof;--gish
                tx_eof_n <= not (stspkt_ctr_tc and (not OR_REDUCE(idl_pause)));--n
                -- if ((not tx_dst_rdy_n) and stspkt_ctr_tc) = '1' then
                    -- stspkt_ctr_en <= '0';
                    -- --tx_eof_n <= '0';--g
                    -- sts_eof <= '1';
                    -- --tx_fsm_ns <= IDLES;--g
                -- else
                    -- stspkt_ctr_en <= '1';
                    -- --tx_eof_n <= '1';--g
                    -- sts_eof <= '0';
                    -- --tx_fsm_ns <= STATPLDS;--g
                -- end if;
                stspkt_ctr_en <= (not tx_dst_rdy_n) and (not stspkt_ctr_tc);
                sts_eof <= (not tx_dst_rdy_n) and stspkt_ctr_tc;
                if idl_pause(0) = '1' then--n
                    tx_fsm_ns <= IDLES;
                else
                    tx_fsm_ns <= STATPLDS;
                end if;
                tx_data <= sts_data;
            when others =>
                tx_fsm_ns <= IDLES;
        end case;
	end process;

    --------------------------------------------------------------------------
	-- Synchronous portion of local link transmit state machine.
	--------------------------------------------------------------------------
    ll_tx_fsm_s : process(sys_clk)
	begin
		if (sys_clk'event and sys_clk = '1') then
			if b2tt_runreset = '1' then
				tx_fsm_cs <= CLEARS;
            else
                tx_fsm_cs <= tx_fsm_ns;
            end if;
        end if;
	end process;

    ------------------------------------------------------------------
	-- Generate the local link signals. Make something sensible of
    -- the state machine outputs.
	------------------------------------------------------------------
    ll_tx_pcs :  process(sys_clk)
    begin
		if (sys_clk'event and sys_clk = '1') then
            --use atrg_sof to inject trigger SOF word, delay read enable signals
            -- so FIFO out if valid
            --!delaying this makes invalid local link signal because DST_RDY_N is zero delay
            --tx_src_rdy_n <= not (trg_fifo_re or daq_fifo_re);
            --tx_src_rdy_n <= not (atrg_sof or trg_fifo_re or daq_fifo_re);
            tx_src_rdy_n <= not (atrg_sof or strg_eof or trg_fifo_re or daq_fifo_re or (sts_sof and (not sts_sof_q)) or stspkt_ctr_en);
        end if;
    end process;

    ------------------------------------------------------------------
	-- Recieve data from the Aurora lane and write to the run control
    -- interface.
	------------------------------------------------------------------
    ll_rx_pcs :  process(sys_clk)
    begin
		if (sys_clk'event and sys_clk = '1') then
            --?just pass it through for now
            rx_dst_rdy_n   <= rcl_dst_rdy_n;
            rcl_sof_n      <= rx_sof_n;
            rcl_eof_n      <= rx_eof_n;
            rcl_src_rdy_n  <= rx_src_rdy_n;
            rcl_data       <= rx_data;
        end if;
    end process;

end behave;
--------------------------------------------------------------------------------------------------------

