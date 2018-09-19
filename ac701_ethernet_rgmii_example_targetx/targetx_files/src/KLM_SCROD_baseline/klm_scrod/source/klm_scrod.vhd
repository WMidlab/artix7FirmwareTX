--*********************************************************************************
-- Indiana University
-- Center for Exploration of Energy and Matter (CEEM)
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    06/04/2014
--
--*********************************************************************************
-- Description:
--
-- Top level KLM SCROD design for Data Concentrator interface integration.
--
-- There are four data streams:
-- 1) Trigger data stream. The TARGET trigger bits are connected directly to and
--    processed by the conc_intfc.
-- 2) The DAQ data stream. This is an entire triggers worth of DAQ data that will
--    be forwarded to the COPPER. As of creation the DAQ data stream from each
--    TARGET must be combined before transmitting to the conc_intfc. The DAQ data
--    format was not known at time of creation. Connecting all TARGETs to the
--    conc_intfc and combing there would be more consistent. The con_intfc
--    inserts the lowest 16-bits of the trigger tag to be used for combing scint
--    and RPC data.
-- 3) Status data stream. All status registers will be forward to the Data Concentrator
--    every so many DAQ packets (trigger cycles).
-- 4) Control data stream. The Data Concentrator will transmit a single (large) packet
--    containing all run control values as specified in the interface document.
--
-- B2TT Modifications:
-- 1) Add dblclock to b2tt_clk_s6.
--
-- NOTE:
-- 1) The delay (in clocks) between b2tt runreset and the TDC counter sync must be
--    known (controlled) to keep scint and RPC TDCs in phase.
-- 2) MAXDELAY constraints may need to be placed on the b2tt runreset signal shift
--    register in the timing_ctrl entity to distribute the FFs across the chip.
-- 3) The asynchronous nature of tx_dst_rdy_n may cause issues in the conc_intfc
--    state machine.
-- 4) The Aurora core is modified; the files in the ipcore directory are not used
--    during implementation.
-- 5) Search on --? or --! for other important notes.
--
-- Issues:
-- 1) Will only work when the FTSW clock is used for both the MGT and
--    TXUSERCLK/TXUSERCLK2 (the onboard oscillator cannot be used). The GTPOUTCLK
--    will need to be used for all Aurora logic to use oscillator - requires clock
--    domain crossing.
--
--*********************************************************************************
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    use ieee.std_logic_unsigned.all;
    use ieee.std_logic_misc.all;
library work;
    use work.time_order_pkg.all;
    use work.tdc_pkg.all;
    use work.conc_intfc_pkg.all;
    use work.klm_scrod_pkg.all;
-- synthesis translate_off
library unisim;
    use unisim.vcomponents.all;
	 Library UNIMACRO;
use UNIMACRO.vcomponents.all;

-- synthesis translate_on

entity klm_scrod is
generic(
    NUM_GTS                     : integer   := 1;
    REVISION                    : string    := "A4";  --A2,A3,A4
    CLKSRC                      : string    := "FTSW";--FTSW, OBOSC
    AURORA_CC_USE               : boolean   := FALSE;
 	DAQ_IFACE				: string :="Ethernet";  --main readout interface is ethernet -- still gets clock from FTSW for testing 
	LINK_TEST                   : std_logic := '0';
    B2TT_SIM_SPEEDUP            : std_logic := '0';
    DAQ_GEN_SIM_SPEEDUP         : std_logic := '0');
port(
    --tdc_sync                    : in std_logic;
    -- TTD/FTSW interface
    ttdclkp                     : in std_logic;
    ttdclkn                     : in std_logic;
    ttdtrgp                     : in std_logic;
    ttdtrgn                     : in std_logic;
    ttdrsvp                     : out std_logic;
    ttdrsvn                     : out std_logic;
    ttdackp                     : out std_logic;
    ttdackn                     : out std_logic;
    -- ASIC Interface
    target_tb                   : in tb_vec_type;
    target_tb16                 : in std_logic_vector(1 to TDC_NUM_CHAN);
    -- SFP interface
    mgttxfault                  : in std_logic_vector(1 to NUM_GTS);
    mgtmod0                     : in std_logic_vector(1 to NUM_GTS);
    mgtlos                      : in std_logic_vector(1 to NUM_GTS);
    mgttxdis                    : out std_logic_vector(1 to NUM_GTS);
    mgtmod2                     : out std_logic_vector(1 to NUM_GTS);
    mgtmod1                     : out std_logic_vector(1 to NUM_GTS);
    mgtclk0p                    : in std_logic;
    mgtclk0n                    : in std_logic;
    mgtclk1p                    : in std_logic;
    mgtclk1n                    : in std_logic;
    mgtrxp                      : in std_logic;
    mgtrxn                      : in std_logic;
    mgttxp                      : out std_logic;
    mgttxn                      : out std_logic;
 	 clk63p5							 :out std_logic;
	 scint_b2tt_runreset			: out std_logic;

    ex_trig1                    : in std_logic;--fake address bit
    exttb                       : out tb_vec_type;
    ftsw_aux                    : out std_logic;
    status_fake                 : out std_logic;
    control_fake                : out std_logic;
    scint_trg                   : out std_logic;
    scint_trg_ctime             : out std_logic_vector(26 downto 0);
    scint_missed_trg            : out std_logic_vector(15 downto 0);
    scint_trg_rdy               : in std_logic;
    qt_fifo_rd_clk              : out std_logic;
    qt_fifo_rd_en               : out std_logic;
    qt_fifo_rd_d                : in std_logic_vector(17 downto 0);
    qt_fifo_empty               : in std_logic;
    qt_fifo_almost_empty        : in std_logic;
    qt_fifo_evt_rdy             : in std_logic;

	-- fine trig bram - for KPP testing:
	exttb_format				: in std_logic_vector(3 downto 0);-- format of the exttb which is a copy that comes out of TDC
	trigasic_select				: in std_logic_vector(9 downto 0); -- theoretically only one ASIC should be enabled on this
	trigasic_bram_we			: in std_logic;
	trigasic_bram_rd_addr		: in std_logic_vector(8 downto 0);
	trigasic_bram_rd_data		: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);

	kpp_trig					: in std_logic; -- this trigger is coming from the slow side (63.5 MHz clock) and is only used for in lab testing
-- Aurora local ouptput local link (to Concentrator) -- this copy goes to ethernet interface for in lab testing of KPPs without the need to a full Belle II DAQ
	kpp_tx_fifo_clk				: in std_logic;
	kpp_tx_fifo_re				: in std_logic;
	kpp_tx_fifo_do				: out std_logic_vector(7 downto 0);
	kpp_tx_fifo_epty			:out std_logic;
	kpp_tx_fifo_aepty			:out std_logic;

--   conc_intfc_tx_dst_rdy_n     : in std_logic;      				 
--   conc_intfc_tx_sof_n         : out std_logic;     				 
--   conc_intfc_tx_eof_n         : out std_logic;    				 
--   conc_intfc_tx_src_rdy_n     : out std_logic;    				 
--   conc_intfc_tx_data          : out std_logic_vector(15 downto 0); 
	
    klm_status_regs                 : in stat_reg_type;
 	 rcl_fifo_rd_clk			 : in std_logic;
	 rcl_fifo_rd_en			 : in std_logic;
	 rcl_fifo_data				 : out std_logic_vector(31 downto 0);
	 rcl_fifo_empty			 : out std_logic;

    zlt                         : in std_logic);
end klm_scrod;

--- architecture -------------------------------------------------------
architecture behave of klm_scrod is

    component IBUFDS is
    generic(
        DIFF_TERM               : boolean := TRUE;  -- Differential Termination
        IBUF_LOW_PWR            : boolean := FALSE; -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
        IOSTANDARD              : string  := "DEFAULT");
    port(
        O                       : out std_logic;-- Buffer output
        I                       : in std_logic; -- Diff_p buffer input (connect directly to top-level port)
        IB                      : in std_logic);-- Diff_n buffer input (connect directly to top-level port)
    end component;

    component IBUF is
    port(
        O                       : out std_logic;  -- buffer output
        I                       : in std_logic);  -- buffer input (connect directly to top-level port)
    end component;

    component OBUF is
    port(
        O                       : out std_logic;  -- buffer output
        I                       : in std_logic);  -- buffer input (connect directly to top-level port)
    end component;

   component BUFG is
    port(
        O                       : out std_logic;  -- buffer output
        I                       : in std_logic);  -- buffer input (connect directly to top-level port)
    end component;

  component FDSE is
   generic  (
      INIT : std_logic );
   port  (
      Q: out std_logic;
      C: in std_logic;
      CE: in std_logic;
      S: in std_logic;
      D : in std_logic);
		
		end component;
  
  
    component timing_ctrl is
        port(
        clk                     : in std_logic;
        clk2x                   : in std_logic;
        tdc_sync                : in std_logic;
        runreset                : in std_logic;
        tdcrst                  : out std_logic_vector(1 to 3);--vector so we can distribute to meet timing
        tdcce_2x                : out std_logic_vector(1 to 5)); -- _Nx is N times clock period
    end component;

    component b2tt is
    generic (
        VERSION                 : integer := 37;
        PROTOCOL                : integer := 29;
        DEFADDR                 : std_logic_vector (19 downto 0) := x"00000";
        FLIPCLK                 : std_logic := '0';  -- no more used
        FLIPTRG                 : std_logic := '0';
        FLIPACK                 : std_logic := '0';
        USEFIFO                 : std_logic := '1';
        CLKDIV1                 : integer range 1 to 72 := 3;
        CLKDIV2                 : integer range 1 to 72 := 4;
        USEPLL                  : std_logic := '0';
        USEICTRL                : std_logic := '1';
        NBITTIM                 : integer range 1 to 32 := 32;
        NBITTAG                 : integer range 4 to 32 := 32;
        NBITID                  : integer range 4 to 32 := 16;
        B2LRATE                 : integer := 4;  -- 127 Mbyte / s
        USEEXTCLK               : std_logic := '0';
        SIM_SPEEDUP             : std_logic := '0' );
      port (
        -- b2tt version
        b2ttver                 : out std_logic_vector (15 downto 0);        
        -- RJ-45
        clkp                    : in  std_logic;
        clkn                    : in  std_logic;
        trgp                    : in  std_logic;
        trgn                    : in  std_logic;
        rsvp                    : out std_logic;
        rsvn                    : out std_logic;
        ackp                    : out std_logic;
        ackn                    : out std_logic;
        -- alternative external clock source
        extclk                  : in std_logic;
        extclkinv               : in std_logic;
        extclkdbl               : in std_logic;
        extdblinv               : in std_logic;
        extclklck               : in std_logic;
        -- board id
        id                      : in  std_logic_vector (NBITID-1 downto 0);
        -- link status
        b2clkup                 : out std_logic;
        b2ttup                  : out std_logic;
        -- system clock and time
        sysclk                  : out std_logic;
        rawclk                  : out std_logic;
        dblclk                  : out std_logic;
        hlfclk                  : out std_logic;
        utime                   : out std_logic_vector (NBITTIM-1 downto 0);
        ctime                   : out std_logic_vector (26 downto 0);
        -- divided clock
        divclk1                 : out std_logic_vector (1 downto 0);
        divclk2                 : out std_logic_vector (1 downto 0);
        -- exp- / run-number
        exprun                  : out std_logic_vector (31 downto 0);        
        -- run reset
        runreset                : out std_logic;
        feereset                : out std_logic;
        b2lreset                : out std_logic;
        gtpreset                : out std_logic;        
        -- trigger
        trgout                  : out std_logic;
        trgtyp                  : out std_logic_vector (3  downto 0);
        trgtag                  : out std_logic_vector (31 downto 0);
        trgmask                 : out std_logic;
        -- revolution
        revo                    : out std_logic;
        --revo3                 : out std_logic;
        revo9                   : out std_logic;
        revoclk                 : out std_logic_vector (10 downto 0);
        revogap                 : out std_logic;                       -- TBI
        injveto                 : out std_logic_vector (1 downto 0);   -- TBI        
        -- busy and status return
        busy                    : in  std_logic; -- to suspend the trigger
        err                     : in  std_logic; -- to stop the run
        -- Belle2link status
        b2plllk                 : in  std_logic;
        b2linkup                : in  std_logic;
        b2linkwe                : in  std_logic;
        b2lclk                  : in  std_logic;
        -- SEU status (from virtex5_seu_controller)
        seuinit                 : in  std_logic;  -- initialising
        seubusy                 : in  std_logic;  -- busy
        seuactiv                : in  std_logic;  -- acm_active
        seuscan                 : in  std_logic;  -- end_of_scan
        seudet                  : in  std_logic;  -- seu_detect
        seucrc                  : in  std_logic;  -- crc_error
        seumbe                  : in  std_logic;  -- mbe        
        -- data for Belle2link header
        fifordy                 : out std_logic;
        fifodata                : out std_logic_vector (95 downto 0);
        fifonext                : in  std_logic;
        -- b2tt-link status
        regdbg                  : in  std_logic_vector (7 downto 0);
        octet                   : out std_logic_vector (7 downto 0);  -- decode
        isk                     : out std_logic;                      -- decode
        cntbit2                 : out std_logic_vector (2 downto 0);  -- decode
        sigbit2                 : out std_logic_vector (1 downto 0);  -- decode
        dbglink                 : out std_logic_vector (95 downto 0);
        dbgerr                  : out std_logic_vector (95 downto 0));
    end component;        

    component klm_aurora_intfc is
    generic(
        SIM_GTPRESET_SPEEDUP    : integer;
        CLK_CORRECT_USE         : boolean);
    port(
        refseldypll             : in std_logic_vector(2 downto 0);
        ref_clk0                : in std_logic;
        ref_clk1                : in std_logic;
        user_clk                : in std_logic;
        sync_clk                : in std_logic;
        reset                   : in std_logic;
        gt_reset                : in std_logic;
        plllock                 : in std_logic;
    -- LocalLink TX Interface
        tx_dst_rdy_n            : out std_logic;
        tx_src_rdy_n            : in std_logic;
        tx_sof_n                : in std_logic;
        tx_eof_n                : in std_logic;
        tx_d                    : in std_logic_vector(0 to 15);
        tx_rem                  : in std_logic;
    -- LocalLink RX Interface
        rx_src_rdy_n            : out std_logic;
        rx_sof_n                : out std_logic;
        rx_eof_n                : out std_logic;
        rx_rem                  : out std_logic;
        rx_d                    : out std_logic_vector(0 to 15);
    -- Status
        gtlock                  : out std_logic;
        hard_err                : out std_logic;
        soft_err                : out std_logic;
        frame_err               : out std_logic;
        channel_up              : out std_logic;
        lane_up                 : out std_logic;
        warn_cc                 : out std_logic;
        do_cc                   : out std_logic;
    -- Control
        powerdown               : in std_logic;
        loopback                : in std_logic_vector(2 downto 0);
    -- GT I/O
        rxp                     : in std_logic;
        rxn                     : in std_logic;
        txp                     : out std_logic;
        txn                     : out std_logic);
    end component;

    component conc_intfc is
        port(
        -- inputs ---------------------------------------------
        sys_clk                 : in std_logic;
        tdc_clk                 : in std_logic;
        ce                      : in std_logic_vector(1 to 5);
        --B2TT interface
        b2tt_runreset           : in std_logic;
        b2tt_runreset2x         : in std_logic_vector(1 to 3);
        b2tt_gtpreset           : in std_logic;
        b2tt_fifordy            : in std_logic;
        b2tt_fifodata           : in std_logic_vector (95 downto 0);
        b2tt_fifonext           : out std_logic;
		b2tt_ctime	               : in std_logic_vector(26 downto 0);    
       --TARGET ASIC trigger interface (trigger bits)
        target_tb               : in tb_vec_type;
        target_tb16             : in std_logic_vector(1 to TDC_NUM_CHAN);
        -- status sent to concentrator
        status_regs             : in stat_reg_type;
        -- Aurora local input local link (from Concentrator)
        rx_dst_rdy_n            : out std_logic;
        rx_sof_n                : in std_logic;
        rx_eof_n                : in std_logic;
        rx_src_rdy_n            : in std_logic;
        rx_data                 : in std_logic_vector(15 downto 0);
        -- DAQ data local link input (TARGET DAQ data when triggered)
        daq_dst_rdy_n           : out std_logic;
        daq_sof_n               : in std_logic;--start of trigger
        daq_eof_n               : in std_logic;--end of trigger
        daq_src_rdy_n           : in std_logic;
        daq_data                : in std_logic_vector(15 downto 0);
        -- outputs --------------------------------------------
        exttrg                  : out std_logic;
        exttb                   : out tb_vec_type;

	-- fine trig bram - for KPP testing:
		exttb_format				: in std_logic_vector(3 downto 0);-- format of the exttb which is a copy that comes out of TDC
		trigasic_select				: in std_logic_vector(9 downto 0); -- theoretically only one ASIC should be enabled on this
		trigasic_bram_we			: in std_logic;
		trigasic_bram_rd_clk		: in std_logic;
		trigasic_bram_rd_addr		: in std_logic_vector(8 downto 0);
		trigasic_bram_rd_data		: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);


		
	-- Aurora local ouptput local link (to Concentrator)
        tx_dst_rdy_n            : in std_logic;
        tx_sof_n                : out std_logic;
        tx_eof_n                : out std_logic;
        tx_src_rdy_n            : out std_logic;
        tx_data                 : out std_logic_vector(15 downto 0);
        -- Run control local link output
        rcl_dst_rdy_n           : in std_logic;
        rcl_sof_n               : out std_logic;
        rcl_eof_n               : out std_logic;
        rcl_src_rdy_n           : out std_logic;
        rcl_data                : out std_logic_vector(15 downto 0));
    end component;

    component FRAME_GEN is
    port(
        -- User Interface
        TX_D                    : out std_logic_vector(0 to 15);
        TX_REM                  : out std_logic;
        TX_SOF_N                : out std_logic;
        TX_EOF_N                : out std_logic;
        TX_SRC_RDY_N            : out std_logic;
        TX_DST_RDY_N            : in std_logic;
        -- System Interface
        USER_CLK                : in std_logic;
        RESET                   : in std_logic;
        CHANNEL_UP              : in std_logic);
    end component;

    component daq_gen_readout is
    generic(
        SIM_SPEEDUP             : in std_logic := '0');
    port(
        clk                     : in std_logic;
        reset                   : in std_logic;
        channel_up              : in std_logic;
        addr                    : in std_logic_vector(3 downto 0);
        trigger                 : in std_logic;
        trgrdy                  : in std_logic;
        trgnext                 : in std_logic;
        ctime                   : in std_logic_vector(15 downto 0);
        tx_dst_rdy_n            : in std_logic;
        tx_src_rdy_n            : out std_logic;
        tx_sof_n                : out std_logic;
        tx_eof_n                : out std_logic;
        tx_d                    : out std_logic_vector(15 downto 0);
        tx_rem                  : out std_logic;
            scint_trg           :out    std_logic;
            scint_trgrdy        :in std_logic;
            missed_trg          :out std_logic_vector(15 downto 0);
          qt_fifo_rd_en         : out std_logic;
          qt_fifo_rd_d              : in std_logic_vector(17 downto 0);
          qt_fifo_empty         : in std_logic;
          qt_fifo_almost_empty          : in std_logic;
          qt_fifo_evt_rdy           : in std_logic;
          zlt                           : in std_logic);
    end component;

    component run_ctrl is
        port(
        clk                     : in std_logic;
        rx_dst_rdy_n            : out std_logic;
        rx_sof_n                : in std_logic;
        rx_eof_n                : in std_logic;
        rx_src_rdy_n            : in std_logic;
        rx_data                 : in std_logic_vector(15 downto 0);
	     rcl_fifo_rd_clk			 : in std_logic;
		  rcl_fifo_rd_en			 : in std_logic;
		  rcl_fifo_data			 : out std_logic_vector(31 downto 0);
		  rcl_fifo_empty			 : out std_logic;
        ctrl_regs               : out ctrl_reg_type);
    end component;

    component sfp_stat_ctrl is
    generic(
        NUM_GTS                 : integer);
    port(
        clk                     : in std_logic;
        txfault                 : in std_logic_vector(1 to NUM_GTS);
        txdis                   : out std_logic_vector(1 to NUM_GTS);
        mod2                    : out std_logic_vector(1 to NUM_GTS);
        mod1                    : out std_logic_vector(1 to NUM_GTS);
        mod0                    : in std_logic_vector(1 to NUM_GTS);
        los                     : in std_logic_vector(1 to NUM_GTS);
        fault_flag              : out std_logic;
        mod_flag                : out std_logic;
        los_flag                : out std_logic);
    end component;

    alias NUM_ASICS is TDC_NUM_CHAN;

    constant NUM_ATBS           : integer                      := 5; --ASIC trigger bits

    --constant REFCLKSEL          : std_logic_vector(2 downto 0) := "000";

    signal mgtclk0_i            : std_logic;
    signal mgtclk1_i            : std_logic;
    signal mgtrxp_i             : std_logic;
    signal mgtrxn_i             : std_logic;
    signal mgttxp_i             : std_logic;
    signal mgttxn_i             : std_logic;
    signal mgttxfault_i         : std_logic_vector(1 to NUM_GTS);
    signal mgtmod0_i            : std_logic_vector(1 to NUM_GTS);
    signal mgtlos_i             : std_logic_vector(1 to NUM_GTS);

    signal mgttxdis_i           : std_logic_vector(1 to NUM_GTS);
    signal mgtmod2_i            : std_logic_vector(1 to NUM_GTS);
    signal mgtmod1_i            : std_logic_vector(1 to NUM_GTS);

    signal target_tb_i          : tb_vec_type;
    signal target_tb16_i        : std_logic_vector(1 to TDC_NUM_CHAN);

    signal b2tt_ctime_i         : std_logic;
    signal status_vec_i         : std_logic_vector(1 to NUM_STAT_REGS);
    signal ctrl_vec_i           : std_logic_vector(1 to NUM_CTRL_REGS);
    signal ex_trig1_i           : std_logic;
    signal ftsw_aux_i           : std_logic;
    signal status_fake_i        : std_logic;
    signal control_fake_i       : std_logic;

    signal sys_clk_ib           : std_logic;
	signal sys_clk2x_ib         : std_logic;

	attribute keep : string;
	attribute keep of sys_clk_ib :signal  is "true";
	attribute keep of sys_clk2x_ib :signal  is "true";

    signal mgttxfault_qi        : std_logic_vector(1 to NUM_GTS);
    signal mgtmod0_qi           : std_logic_vector(1 to NUM_GTS);
    signal mgtlos_qi            : std_logic_vector(1 to NUM_GTS);

    signal mgttxdis_iq          : std_logic_vector(1 to NUM_GTS);
    signal mgtmod2_iq           : std_logic_vector(1 to NUM_GTS);
    signal mgtmod1_iq           : std_logic_vector(1 to NUM_GTS);

    signal b2tt_ctime_iq        : std_logic;
    signal status_fake_iq       : std_logic;
    signal control_fake_iq      : std_logic;
    signal ftsw_aux_iq          : std_logic;

    -- B2TT Signals
    signal b2tt_id              : std_logic_vector (B2TT_NBITID-1 downto 0);
    signal b2tt_b2clkup         : std_logic;
    signal b2tt_b2ttup          : std_logic;
    signal b2tt_trgout          : std_logic;
    signal b2tt_b2plllk         : std_logic;
    signal b2tt_utime           : std_logic_vector(B2TT_NBITTIM-1 downto 0);
    signal b2tt_ctime           : std_logic_vector(26 downto 0);
    signal b2tt_divclk1         : std_logic_vector(1 downto 0);
    signal b2tt_divclk2         : std_logic_vector(1 downto 0);
    signal b2tt_runreset        : std_logic                             := '1';
    signal b2tt_feereset        : std_logic                             := '1';
    signal b2tt_gtpreset        : std_logic                             := '1';
    signal b2tt_b2linkup        : std_logic                             := '1';
    signal b2tt_b2linkwe        : std_logic                             := '0';
    signal b2tt_b2lreset        : std_logic                             := '1';
    signal b2tt_b2ttver         : std_logic_vector(15 downto 0);
    signal b2tt_fifordy         : std_logic                             := '0';
    signal b2tt_fifodata        : std_logic_vector(95 downto 0)         := (others => '0');
    signal b2tt_fifonext        : std_logic                             := '0';
    signal b2tt_exprun          : std_logic_vector(31 downto 0);
    signal b2tt_trgtag          : std_logic_vector(31 downto 0);
    signal b2tt_regdbg          : std_logic_vector(7 downto 0)          := (others => '0');

	signal con_intfc_b2tt_trgout	: std_logic;
	signal con_intfc_b2tt_fifordy   : std_logic                             := '0';
	signal con_intfc_b2tt_fifonext  : std_logic                             := '0';
	signal kpp_trig_sysclk	:std_logic:='0';
	
    signal rx_dst_rdy_n         : std_logic;
    signal rx_sof_n             : std_logic;
    signal rx_eof_n             : std_logic;
    signal rx_src_rdy_n         : std_logic;
    signal rx_data              : std_logic_vector(15 downto 0);

    signal tx_dst_rdy_n         : std_logic;
    signal tx_sof_n             : std_logic;
    signal tx_eof_n             : std_logic;
    signal tx_src_rdy_n         : std_logic;
    signal tx_data              : std_logic_vector(15 downto 0);

	
	attribute keep of tx_dst_rdy_n     : signal is "true";
	attribute keep of tx_sof_n         : signal is "true";
	attribute keep of tx_eof_n         : signal is "true";
	attribute keep of tx_src_rdy_n     : signal is "true";
	attribute keep of tx_data          : signal is "true";
	
    signal refclksel            : std_logic_vector(2 downto 0);
    signal gtlock               : std_logic;
    signal hard_err             : std_logic;
    signal soft_err             : std_logic;
    signal frame_err            : std_logic;
    signal channel_up           : std_logic;
    signal lane_up              : std_logic;
    signal warn_cc              : std_logic;
    signal do_cc                : std_logic;
    signal tdc_ce               : std_logic_vector(1 to 5);
    signal b2tt_runreset2x      : std_logic_vector(1 to 3);

    signal mbaddr               : std_logic_vector(3 downto 0);
    signal status_regs          : stat_reg_type;
    signal ctrl_regs            : ctrl_reg_type;
    signal daq_dst_rdy_n        : std_logic;
    signal daq_sof_n            : std_logic;
    signal daq_eof_n            : std_logic;
    signal daq_src_rdy_n        : std_logic;
    signal daq_data             : std_logic_vector(15 downto 0);
    signal rcl_dst_rdy_n        : std_logic;
    signal rcl_sof_n            : std_logic;
    signal rcl_eof_n            : std_logic;
    signal rcl_src_rdy_n        : std_logic;
    signal rcl_data             : std_logic_vector(15 downto 0);
	 signal qt_fifo_rd_clk_i	  :std_logic;
    signal fault_flag           : std_logic;
    signal los_flag             : std_logic;
    signal mod_flag             : std_logic;
		signal sys_clk63p5			: std_logic;
    --for all : daq_gen use entity work.daq_gen(single_trig);
    for all : daq_gen_readout use entity work.daq_gen_readout(multi_trig);


begin


clk63p5<=sys_clk63p5;


 FDSE_inst_b2tt_runreset : FDSE
   generic map (
      INIT => '0') -- Initial value of register ('0' or '1')  
   port map (
      Q => scint_b2tt_runreset,      -- Data output
      C => sys_clk63p5,      -- Clock input
      CE => '1',    -- Clock enable input
      S => '0',      -- Synchronous Set input
      D => b2tt_runreset       -- Data input
   );
  

    mgtclk0_inst : IBUFDS
    port map (
        O                       => mgtclk0_i,-- Buffer output
        I                       => mgtclk0p, -- Diff_p buffer input (connect directly to top-level port)
        IB                      => mgtclk0n  -- Diff_n buffer input (connect directly to top-level port)
    );


    -------------------------------------------------
    -- Input Buffers
    -------------------------------------------------
gen_gt_core_clk_buf: if (DAQ_IFACE="KEKDAQ") generate
 
    mgtclk1_inst : IBUFDS
    port map (
        O                       => mgtclk1_i,-- Buffer output
        I                       => mgtclk1p, -- Diff_p buffer input (connect directly to top-level port)
        IB                      => mgtclk1n  -- Diff_n buffer input (connect directly to top-level port)
    );
	 --mgttxfault_i<=mgttxfault;
    mgttxfault_IBUF_GEN :
    for I in 1 to NUM_GTS generate
        mgttxfault_IBUF : IBUF
        port map(
            O                   => mgttxfault_i(I),
            I                   => mgttxfault(I)
        );
    end generate;

--mgtmod0_i<=mgtmod0;
    mgtmod0_IBUF_GEN :
    for I in 1 to NUM_GTS generate
        mgtmod0_IBUF : IBUF
        port map(
            O                   => mgtmod0_i(I),
            I                   => mgtmod0(I)
        );
    end generate;

    mgtlos_IBUF_GEN :
    for I in 1 to NUM_GTS generate
        mgtlos_IBUF : IBUF
        port map(
            O                   => mgtlos_i(I),
            I                   => mgtlos(I)
        );
    end generate;

    mgtrxp_IBUF : IBUF
    port map(
        O                       => mgtrxp_i,
        I                       => mgtrxp
    );

    mgtrxn_IBUF : IBUF
    port map(
        O                       => mgtrxn_i,
        I                       => mgtrxn
    );
	 
end generate;

target_tb_i<=target_tb;
target_tb16_i<=target_tb16;
--    asic_IBUF_GEN :
--    for I in 1 to 10 generate
--        atb_IBUF_GEN :
--        for J in 5 downto 1 generate
--            atb_IBUF : IBUF
--            port map(
--                O               => target_tb_i(I)(J),
--                I               => target_tb(I)(J)
--            );
--        end generate;
--        atb16_IBUF : IBUF
--        port map(
--                O               => target_tb16_i(I),
--                I               => target_tb16(I)
--        );
--    end generate;


    
    ftsw_aux_OBUF : OBUF
    port map(
        O                       => ftsw_aux,
        I                       => ftsw_aux_iq
    );    


ex_trig1_i<=ex_trig1;
--    ex_trig1_IBUF : IBUF
--    port map(
--        O                       => ex_trig1_i,
--        I                       => ex_trig1
--    );

    -------------------------------------------------
    -- Output Buffers
    -------------------------------------------------
    mgttxdis_OBUF_GEN :
    for I in 1 to NUM_GTS generate
        mgttxdis_OBUF : OBUF
        port map(
            O                   => mgttxdis(I),
            I                   => mgttxdis_iq(I)
        );
    end generate;

    mgtmod2_OBUF_GEN :
    for I in 1 to NUM_GTS generate
        mgtmod2_OBUF : OBUF
        port map(
            O                   => mgtmod2(I),
            I                   => mgtmod2_iq(I)
        );
    end generate;

    mgtmod1_OBUF_GEN :
    for I in 1 to NUM_GTS generate
        mgtmod1_OBUF : OBUF
        port map(
            O                   => mgtmod1(I),
            I                   => mgtmod1_iq(I)
        );
    end generate;

    mgttxp_OBUF : OBUF
    port map(
        O                       => mgttxp,
        I                       => mgttxp_i
    );

    mgttxn_OBUF : OBUF
    port map(
        O                       => mgttxn,
        I                       => mgttxn_i
    );

    status_OBUF : OBUF
    port map(
        O                       => status_fake,
        I                       => status_fake_iq
    );

    control_OBUF : OBUF
    port map(
        O                       => control_fake,
        I                       => control_fake_iq
    );

    ----------------------------------------------------------------
    -- Clock enables, resets, strobes, etc.
    ----------------------------------------------------------------
    tmg_ctrl_ins : timing_ctrl
    port map(
        clk                     => sys_clk_ib,
        clk2x                   => sys_clk2x_ib,
        tdc_sync                => '0',--tdc_sync,--!
        runreset                => b2tt_runreset,
        tdcrst                  => b2tt_runreset2x,
        tdcce_2x                => tdc_ce
    );

    ----------------------------------------------------------------
    -- Timing and trigger distribution interface.
    ----------------------------------------------------------------
    b2tt_ins : b2tt
    generic map(
        VERSION                 => B2TT_VERSION,
        PROTOCOL                => B2TT_PROTOCOL,
        DEFADDR                 => B2TT_DEFADDR,
        FLIPCLK                 => B2TT_FLIPCLK,
        FLIPTRG                 => B2TT_FLIPTRG,
        FLIPACK                 => B2TT_FLIPACK,
        USEFIFO                 => B2TT_USEFIFO,
        CLKDIV1                 => B2TT_CLKDIV1,
        CLKDIV2                 => B2TT_CLKDIV2,
        USEPLL                  => B2TT_USEPLL,
        USEICTRL                => B2TT_USEICTRL,
        NBITTIM                 => B2TT_NBITTIM,
        NBITTAG                 => B2TT_NBITTAG,
        NBITID                  => B2TT_NBITID,
        B2LRATE                 => B2TT_B2LRATE,
        USEEXTCLK               => B2TT_USEEXTCLK,
        SIM_SPEEDUP             => B2TT_SIM_SPEEDUP)
      port map(
        -- b2tt version
        b2ttver                 => b2tt_b2ttver,      
        -- RJ-45
        clkp                    => ttdclkp,
        clkn                    => ttdclkn,
        trgp                    => ttdtrgp,
        trgn                    => ttdtrgn,
        rsvp                    => ttdrsvp,
        rsvn                    => ttdrsvn,
        ackp                    => ttdackp,
        ackn                    => ttdackn,
        -- alternative external clock source
        extclk                  => '0',
        extclkinv               => '0',
        extclkdbl               => '0',
        extdblinv               => '0',
        extclklck               => '0',
        -- board id
        id                      => b2tt_id,
        -- link status
        b2clkup                 => b2tt_b2clkup,
        b2ttup                  => b2tt_b2ttup,
        -- system clock and time
        sysclk                  => sys_clk_ib,
        rawclk                  => open,                
        dblclk                  => sys_clk2x_ib,
        hlfclk                  => sys_clk63p5,
        utime                   => b2tt_utime,
        ctime                   => b2tt_ctime,
                                
        -- divided clock
        divclk1                 => b2tt_divclk1,--does not work for factor of 2
        divclk2                 => b2tt_divclk2,
        -- exp- / run-number
        exprun                  => b2tt_exprun,        
        -- run reset
        runreset                => b2tt_runreset,
        feereset                => b2tt_feereset,
        b2lreset                => b2tt_b2lreset,
        gtpreset                => b2tt_gtpreset,       
        -- trigger
        trgout                  => b2tt_trgout,
        trgtyp                  => open,
        trgtag                  => b2tt_trgtag,
        trgmask                 => open,
        -- revolution
        revo                    => open,
        --revo3                 => open,
        revo9                   => open,
        revoclk                 => open,
        revogap                 => open, -- TBI
        injveto                 => open, -- TBI     
        -- busy and status return
        busy                    => '0',  -- to suspend the trigger
        err                     => '0',  -- to stop the run
        -- Belle2link status
        b2plllk                 => b2tt_b2plllk,
        b2linkup                => '1',--b2tt_b2linkup,-- cannot use this signal with Aurora for unknown reason
        b2linkwe                => b2tt_b2linkwe,
        b2lclk                  => sys_clk_ib,
        -- SEU status (from virtex5_seu_controller)
        seuinit                 => '0',  -- initialising
        seubusy                 => '0',  -- busy
        seuactiv                => '0',  -- acm_active
        seuscan                 => '0',  -- end_of_scan
        seudet                  => '0',  -- seu_detect
        seucrc                  => '0',  -- crc_error
        seumbe                  => '0',  -- mbe
        -- data for Belle2link header
        fifordy                 => b2tt_fifordy,
        fifodata                => b2tt_fifodata,
        fifonext                => b2tt_fifonext,
        -- b2tt-link status
        regdbg                  => b2tt_regdbg,--X"00",
        octet                   => open,  -- decode
        isk                     => open,  -- decode
        cntbit2                 => open,  -- decode
        sigbit2                 => open,  -- decode
        dbglink                 => open,  -- encode              
        dbgerr                  => open
    );    
    
	-- send out a copy of the local link signals to ethernet interface for in lab KPP testing of trigger timing resolution
gen_ETHspec_ins: if (DAQ_IFACE="Ethernet") generate 
		tx_dst_rdy_n<='0';
--		tx_dst_rdy_n			<=conc_intfc_tx_dst_rdy_n 	;
--		conc_intfc_tx_sof_n 	<=tx_sof_n			 		;
--		conc_intfc_tx_eof_n 	<=tx_eof_n			 		;
--		conc_intfc_tx_src_rdy_n <=tx_src_rdy_n			 	;
--		conc_intfc_tx_data 		<=tx_data	 				;
		con_intfc_b2tt_trgout<=kpp_trig_sysclk;
		con_intfc_b2tt_fifordy<='1';
		--con_intfc_b2tt_fifonext<='1';
		kpp_trig_sysclk<=kpp_trig when rising_edge(sys_clk_ib);
end generate;

gen_KEKDAQspec_ins: if (DAQ_IFACE="KEKDAQ") generate 

		con_intfc_b2tt_trgout	<=	b2tt_trgout	;
		con_intfc_b2tt_fifordy  <=  b2tt_fifordy  ;
		con_intfc_b2tt_fifonext <=  b2tt_fifonext ;
end generate;

--------------------------------------------------------------------------
-- Buffer trigger data and cross clock domain to slow clock for ethernet to readout during SiPM Cal runs over the ethernet in lab.
--------------------------------------------------------------------------
-- this is probbaly more compilcated than this. might have to find a way to fool the fifo_full signal 
--  kpp_tx_fifo_ins : trig_fifo --just using the trig_fifo for convenience- but it contains both DAQ and Trig packets and signaling stuff
--  port map(
--      rst                     => b2tt_runreset,
--      wr_clk                  => sys_clk_ib,
--      rd_clk                  => kpp_tx_fifo_clk,
--      din                     => tx_sof_n & tx_eof_n & tx_data,
--      wr_en                   => not tx_src_rdy_n,
--      rd_en                   => kpp_tx_fifo_re,
--      dout                    => kpp_tx_fifo_do,
--      empty                   => kpp_tx_fifo_epty,
--      almost_empty            => kpp_tx_fifo_aepty,
--      full                    => open,
--      almost_full             => open
--  );

  
 u_kpp_tx_fifo_ins : entity work.kpp_trig_fifo1
  PORT MAP (
    rst => b2tt_runreset,
    wr_clk => sys_clk_ib,
    rd_clk => kpp_tx_fifo_clk,
--    din => x"DCA" & "00" & tx_sof_n & tx_eof_n & tx_data,
    din => tx_data,
    wr_en => not tx_src_rdy_n,
    rd_en => kpp_tx_fifo_re,
    dout => kpp_tx_fifo_do,
    full => open,
    empty => kpp_tx_fifo_epty
 --   valid => open
  );
  kpp_tx_fifo_aepty<='0';
	
    ----------------------------------------------------------------
    -- Aurora Core.
    ----------------------------------------------------------------
gen_aurora_ins: if (DAQ_IFACE="KEKDAQ") generate

    aurora_ins : klm_aurora_intfc
    generic map(
        SIM_GTPRESET_SPEEDUP    => 1,
        CLK_CORRECT_USE         => AURORA_CC_USE)
    port map(
        refseldypll             => refclksel,--CLK1--"010",--PLLCLK (bad idea),
        ref_clk0                => mgtclk0_i,
        ref_clk1                => mgtclk1_i,
        user_clk                => sys_clk_ib,
        sync_clk                => sys_clk2x_ib,
        reset                   => b2tt_runreset,--b2tt_b2lreset,
        gt_reset                => b2tt_runreset,--b2tt_gtpreset,
        plllock                 => b2tt_b2clkup,--b2tt_b2plllk,
    -- LocalLink TX Interface
        tx_dst_rdy_n            => tx_dst_rdy_n,
        tx_src_rdy_n            => tx_src_rdy_n,
        tx_sof_n                => tx_sof_n,
        tx_eof_n                => tx_eof_n,
        tx_d                    => tx_data,
        tx_rem                  => '1',--?
    -- LocalLink RX Interface
        rx_src_rdy_n            => rx_src_rdy_n,
        rx_sof_n                => rx_sof_n,
        rx_eof_n                => rx_eof_n,
        rx_rem                  => open,--?
        rx_d                    => rx_data,
    -- Status
        gtlock                  => gtlock,
        hard_err                => hard_err,
        soft_err                => soft_err,
        frame_err               => frame_err,
        channel_up              => channel_up,
        lane_up                 => lane_up,
        warn_cc                 => warn_cc, -- the may help in conc interface
        do_cc                   => do_cc,
    -- Control
        powerdown               => '0',
        loopback                => "000",
    -- GT I/O
        rxp                     => mgtrxp_i,
        rxn                     => mgtrxn_i,
        txp                     => mgttxp_i,
        txn                     => mgttxn_i
    );

end generate;
    ----------------------------------------------------------------
    -- Data Concentrator interface. Generate and time-order TDC.
    -- Combine trigger, DAQ, and status data. Receive control data.
    ----------------------------------------------------------------
    conc_intfc_ins : conc_intfc
    port map(
        -- inputs ---------------------------------------------
        sys_clk                 => sys_clk_ib,
        tdc_clk                 => sys_clk2x_ib,
        ce                      => tdc_ce,
        --B2TT interface
        b2tt_runreset           => b2tt_runreset,
        b2tt_runreset2x         => b2tt_runreset2x,
        b2tt_gtpreset           => b2tt_gtpreset,
        b2tt_fifordy            => con_intfc_b2tt_fifordy,-- con_intfc_b2tt_trgout	b2tt_fifordy ,
        b2tt_fifodata           => b2tt_fifodata,
        b2tt_fifonext           => con_intfc_b2tt_fifonext,-- b2tt_fifonext,
		b2tt_ctime				=>	b2tt_ctime,
        --TARGET ASIC trigger interface (trigger bits)
        target_tb               => target_tb_i,
        target_tb16             => target_tb16_i,
        -- status sent to concentrator
        status_regs             => status_regs,
        -- Aurora local input local link (from Concentrator)
        rx_dst_rdy_n            => rx_dst_rdy_n,
        rx_sof_n                => rx_sof_n,
        rx_eof_n                => rx_eof_n,
        rx_src_rdy_n            => rx_src_rdy_n,
        rx_data                 => rx_data,
        -- DAQ data local link input (TARGET DAQ data when triggered)
        daq_dst_rdy_n           => daq_dst_rdy_n,
        daq_sof_n               => daq_sof_n,--start of trigger
        daq_eof_n               => daq_eof_n,--end of trigger
        daq_src_rdy_n           => daq_src_rdy_n,
        daq_data                => daq_data,
        -- outputs --------------------------------------------
        exttrg                  => open,
        exttb                   => exttb,
 	-- fine trig bram - for KPP testing:
		exttb_format				=> exttb_format			,-- format of the exttb which is a copy that comes out of TDC
		trigasic_select				=> trigasic_select		,-- theoretically only one ASIC should be enabled on this
		trigasic_bram_rd_clk		=> sys_clk63p5			,
		trigasic_bram_we			=> trigasic_bram_we		,
		trigasic_bram_rd_addr		=> trigasic_bram_rd_addr,
		trigasic_bram_rd_data		=> trigasic_bram_rd_data,

	-- Aurora local ouptput local link (to Concentrator)
        tx_dst_rdy_n            => tx_dst_rdy_n,
        tx_sof_n                => tx_sof_n,
        tx_eof_n                => tx_eof_n,
        tx_src_rdy_n            => tx_src_rdy_n,
        tx_data                 => tx_data,
        -- Run control local link output
        rcl_dst_rdy_n           => rcl_dst_rdy_n,
        rcl_sof_n               => rcl_sof_n,
        rcl_eof_n               => rcl_eof_n,
        rcl_src_rdy_n           => rcl_src_rdy_n,
        rcl_data                => rcl_data
    );

    ----------------------------------------------------------------
    -- Aurora example design link test.
    ----------------------------------------------------------------
    TEST_GEN : if LINK_TEST = '1' generate
        daq_gen_ins : FRAME_GEN
        port map(
            -- User Interface
            TX_D                => daq_data,
            TX_REM              => open,
            TX_SOF_N            => daq_sof_n,
            TX_EOF_N            => daq_eof_n,
            TX_SRC_RDY_N        => daq_src_rdy_n,
            TX_DST_RDY_N        => daq_dst_rdy_n,
            -- System Interface
            USER_CLK            => sys_clk_ib,
            RESET               => b2tt_runreset,--b2tt_b2lreset,
            CHANNEL_UP          => b2tt_b2linkup
        );
    end generate;

    ----------------------------------------------------------------
    -- Create a single DAQ data stream from all ASICs.
    --!A packet is an entire trigger.
    --!Must be synced with b2tt trigger/fifo read.
    ----------------------------------------------------------------
 --    scint_trg_ctime<=b2tt_ctime(15 downto 0);

  ctime_FDCE_inst :
    for I in 0 to 26 generate
        ctime_bit_FDSE_inst :  FDSE
		  
   generic map (
      INIT => '0') -- Initial value of register ('0' or '1')  
   port map (
      Q => scint_trg_ctime(I),      -- Data output
      C => sys_clk63p5,      -- Clock input
      CE => '1',    -- Clock enable input
      S => '0',  -- Asynchronous clear input
      D => b2tt_ctime(I)       -- Data input
   );
	
    end generate;
	 
    
	  qt_fifo_rd_clk<=qt_fifo_rd_clk_i;
	  qt_fifo_rd_clk_i<=sys_clk_ib;
	  
--	sys_clk_BUFG_inst : BUFG
--   port map (
--      O => qt_fifo_rd_clk_i, -- 1-bit output: Clock buffer output
--      I => sys_clk_ib  -- 1-bit input: Clock buffer input
--   );
	  
--   scint_trgrdy       :in std_logic;
--   missed_trg         :out std_logic_vector(15 downto 0);


    PROD_GEN : if LINK_TEST = '0' generate
        daq_gen_ins : daq_gen_readout
        generic map(
            SIM_SPEEDUP         => DAQ_GEN_SIM_SPEEDUP)
        port map(
            clk                 => sys_clk_ib,
            reset               => b2tt_runreset,--b2tt_b2lreset,
            channel_up          => b2tt_b2linkup,
            addr                => mbaddr,
            trigger             => con_intfc_b2tt_trgout,--b2tt_trgout,
            trgrdy              => con_intfc_b2tt_fifordy,--b2tt_fifordy
            trgnext             => con_intfc_b2tt_fifonext,--b2tt_fifonext
            ctime               => b2tt_ctime(15 downto 0),
            tx_dst_rdy_n        => daq_dst_rdy_n,
            tx_src_rdy_n        => daq_src_rdy_n,
            tx_sof_n            => daq_sof_n,
            tx_eof_n            => daq_eof_n,
            tx_d                => daq_data,
            tx_rem              => open,
                scint_trg               =>  scint_trg,
                scint_trgrdy        =>scint_trg_rdy,
                missed_trg          =>scint_missed_trg,
                qt_fifo_rd_en       =>  qt_fifo_rd_en,
                qt_fifo_rd_d        => qt_fifo_rd_d,
                qt_fifo_empty       => qt_fifo_empty,
                qt_fifo_almost_empty        => qt_fifo_almost_empty,
                qt_fifo_evt_rdy =>  qt_fifo_evt_rdy,
                zlt                 => zlt
        );
    end generate;

    ----------------------------------------------------------------
    -- Receive and distribute run control registers.
    ----------------------------------------------------------------
    run_ctrl_ins : run_ctrl
        port map(
        clk                     => sys_clk_ib,
        rx_dst_rdy_n            => rcl_dst_rdy_n,
        rx_sof_n                => rcl_sof_n,
        rx_eof_n                => rcl_eof_n,
        rx_src_rdy_n            => rcl_src_rdy_n,
        rx_data                 => rcl_data,
		  rcl_fifo_rd_clk			  => rcl_fifo_rd_clk,
		  rcl_fifo_rd_en			  => rcl_fifo_rd_en,
		  rcl_fifo_data			  => rcl_fifo_data,
		  rcl_fifo_empty			  => rcl_fifo_empty,
        ctrl_regs               => ctrl_regs
    );

    ----------------------------------------------------------------
    -- Deal with the SFP connections.
    ----------------------------------------------------------------
    sfp_stat_ctrl_ins : sfp_stat_ctrl
    generic map(
        NUM_GTS                 => NUM_GTS)
    port map(
        clk                     => sys_clk_ib,
        txfault                 => mgttxfault_qi,
        txdis                   => mgttxdis_i,
        mod2                    => mgtmod2_i,
        mod1                    => mgtmod1_i,
        mod0                    => mgtmod0_qi,
        los                     => mgtlos_qi,
        fault_flag              => fault_flag,
        mod_flag                => mod_flag,
        los_flag                => los_flag
    );

---------------------------------------------------------------------
-- Concurrent statements
---------------------------------------------------------------------

    --------------------------------------
    -- Map the status registers
    --------------------------------------
    --! just keep signals from being synthesized away for now
    --! SFP/link signals are useless if link is down
    status_regs(0) <= "0000000" & fault_flag & mod_flag & los_flag & hard_err & soft_err & frame_err & lane_up & warn_cc & do_cc;
    status_regs(1) <= "0000000" & b2tt_b2plllk & b2tt_fifonext & b2tt_b2linkwe & b2tt_trgout & b2tt_b2ttup & b2tt_feereset & b2tt_b2lreset & b2tt_gtpreset & b2tt_ctime_iq;
    STAT_GEN : for I in 2 to NUM_STAT_REGS-1 generate
        status_regs(I) <= klm_status_regs(I-2);
--        status_regs(I) <= STD_LOGIC_VECTOR(TO_UNSIGNED(I,16));
    end generate;


    mbaddr <= "000" & ex_trig1_i;
    b2tt_id <= X"0" & mbaddr & X"FF";-- Use MSB for MB because RPC FEBs use LSB !How does this board get address?
    b2tt_b2linkup <= channel_up;
    b2tt_b2plllk <= gtlock;
    b2tt_b2linkwe <= (not tx_src_rdy_n);
    b2tt_regdbg <= X"00";

    --------------------------------------
    -- Select MGT clock
    --------------------------------------
    --GCLK (bad idea)
    REVA2_GEN : if REVISION = "A2" generate
        refclksel <= "001";
    end generate;

    --GCLK (bad idea)
    REVA3_GEN : if REVISION = "A3" generate
        refclksel <= "001";
    end generate;

    --CLK0/CLK1 (dedicated clock pins)
    REVA4_GEN : if REVISION = "A4" generate
        -- Use FTSW clock
        CLKSRC1_GEN : if CLKSRC = "FTSW" generate
            refclksel <= "000"; --CLK0
        end generate;
        -- Use the onboard oscillator
        CLKSRC2_GEN : if CLKSRC = "OBOSC" generate
            refclksel <= "100"; --CLK1
        end generate;
    end generate;
    --------------------------------------

---------------------------------------------------------------------
-- Synchronous processes
---------------------------------------------------------------------
----------------------------------------------------------------
-- Input registers to be placed in the I/O ring
----------------------------------------------------------------

    --------------------------------------
    -- System clock domain input registers
    --------------------------------------
    sysin_regs : process(sys_clk_ib)
    begin
        if (sys_clk_ib'event and sys_clk_ib = '1') then
            mgttxfault_qi <= mgttxfault_i;
            mgtmod0_qi <= mgtmod0_i;
            mgtlos_qi <= mgtlos_i;
        end if;
    end process;

----------------------------------------------------------------
-- Output registers to be placed in the I/O ring
----------------------------------------------------------------

    --------------------------------------
    -- System clock domain output registers
    --------------------------------------
    sout_regs : process(sys_clk_ib)
    begin
        if (sys_clk_ib'event and sys_clk_ib = '1') then
            ftsw_aux_iq <= ftsw_aux_i;
            mgttxdis_iq <= mgttxdis_i;
            mgtmod2_iq <= mgtmod2_i;
            mgtmod1_iq <= mgtmod1_i;
            b2tt_ctime_i <= OR_REDUCE(b2tt_ctime);
            b2tt_ctime_iq <= b2tt_ctime_i;
            status_fake_iq <= status_fake_i;
            control_fake_iq <= control_fake_i;
            -- keep signals from being synthesized away
            status_vec_i <= (others => '0');
            status_fake_i <= OR_REDUCE(status_vec_i);
            ctrl_vec_i <= OR_REDUCE(ctrl_regs(0)) & OR_REDUCE(ctrl_regs(1));
            control_fake_i <= OR_REDUCE(ctrl_vec_i);
        end if;
    end process;

end behave;
