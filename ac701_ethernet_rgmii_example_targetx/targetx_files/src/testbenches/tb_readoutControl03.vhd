--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:41:30 09/05/2014
-- Design Name:   
-- Module Name:   C:/Users/isar/Documents/code4/TX9UMB-2/ise-project/tb_readoutControl03.vhd
-- Project Name:  scrod-boardstack-new-daq-interface
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ReadoutControl
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
 use work.readout_definitions.all;

ENTITY tb_readoutControl03 IS
END tb_readoutControl03;
 
ARCHITECTURE behavior OF tb_readoutControl03 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ReadoutControl
    PORT(
         clk : IN  std_logic;
 		  smp_clk : in STD_LOGIC;
           trigger : in  STD_LOGIC;
			  trig_delay : in  STD_LOGIC_VECTOR(11 downto 0);
			  dig_offset : in  STD_LOGIC_VECTOR(8 downto 0);
			  win_num_to_read : in  STD_LOGIC_VECTOR(8 downto 0);
			  asic_enable_bits : in  STD_LOGIC_VECTOR(9 downto 0);
			  SMP_MAIN_CNT : in STD_LOGIC_VECTOR(8 downto 0);
			  SMP_IDLE_status : in  STD_LOGIC;
			  DIG_IDLE_status : in  STD_LOGIC;
			  SROUT_IDLE_status : in  STD_LOGIC;
			  fifo_empty : in  STD_LOGIC;
			  EVTBUILD_DONE_SENDING_EVENT : in  STD_LOGIC;
			  READOUT_RESET  : in  STD_LOGIC;
			  READOUT_CONTINUE : in STD_LOGIC;
			  RESET_EVENT_NUM : in STD_LOGIC;
			  use_fixed_dig_start_win : in std_logic_vector(15 downto 0);
			  LATCH_SMP_MAIN_CNT : out STD_LOGIC_VECTOR(8 downto 0);
			  dig_win_start		: out STD_LOGIC_VECTOR(8 downto 0);-- goes to the sampling logic to kill the write enable while writing over the digitization window
			  LATCH_DONE : out STD_LOGIC;
			  ASIC_NUM : out STD_LOGIC_VECTOR(3 downto 0);
			  busy_status : out STD_LOGIC;
           smp_stop : out  STD_LOGIC;
           dig_start : out  STD_LOGIC;
			  DIG_RD_ROWSEL_S : out STD_LOGIC_VECTOR(2 downto 0);
			  DIG_RD_COLSEL_S : out STD_LOGIC_VECTOR(5 downto 0);
           srout_start : out  STD_LOGIC;
			  srout_restart : out std_logic;
			  ped_sub_start : out std_logic;
			  ped_sub_busy	: in std_logic;			

			  EVTBUILD_start : out  STD_LOGIC;
			  EVTBUILD_MAKE_READY : out  STD_LOGIC;
			  EVENT_NUM : out STD_LOGIC_VECTOR(31 downto 0);
			  READOUT_DONE : out  STD_LOGIC
			  );
    END COMPONENT;

	COMPONENT PedestalManagement
	PORT(
		clk : IN std_logic;
		enable : IN std_logic;
		start : IN std_logic;
		win_len_start : IN std_logic_vector(15 downto 0);
		asic_en_mask : IN std_logic_vector(9 downto 0);
		ped_calc_busy : IN std_logic;
		dmx_allwin_done	: in 	std_logic;
		readout_busy : IN std_logic;          
		readout_trig : OUT std_logic;
		busy : OUT std_logic;
		stat : OUT std_logic_vector(31 downto 0);
		cur_win_no : OUT std_logic_vector(8 downto 0);
		cur_asic_en_bits : OUT std_logic_vector(9 downto 0);
      ped_calc_enable	: out std_logic;
		readout_reset : OUT std_logic;
		readout_continue : OUT std_logic
		);
	END COMPONENT;

    
	
    COMPONENT DigitizingLgcTX
    PORT(
         clk : IN  std_logic;
         IDLE_status : OUT  std_logic;
         StartDig : IN  std_logic;
         ramp_length : IN  std_logic_vector(12 downto 0);
         rd_ena : OUT  std_logic;
         clr : OUT  std_logic;
         startramp : OUT  std_logic
        );
    END COMPONENT;
    
COMPONENT SerialDataRoutDemux
	PORT(
       clk		 			 : in   std_logic;
        start	    		 : in   std_logic;  -- start serial readout
		  restart			 : in		std_logic;-- reset the dmx_win counter
		  calc_peds_en		 :	in std_logic;-- enable pedestal calculation mode- will start averaging sampels to create pedestals and write to BRAM- edge sensitive restart for averaging window counter.
		  navg				 : in std_logic_vector(3 downto 0);-- 2**navg= number of reads to average.
		  
		  EVENT_NUM			 : in   std_logic_vector(31 downto 0);
		  WIN_ADDR			 : in   std_logic_vector(8 downto 0);
		  ASIC_NUM 		    : in   std_logic_vector(3 downto 0);
		  force_test_pattern : in   std_logic;
		  
		  IDLE_status		: out  std_logic;
		  busy				 : out  std_logic;
        samp_done	       : out  std_logic;  -- indicate that all sampled processed

        dout             : in   std_logic_vector(15 downto 0);
        sr_clr           : out  std_logic;     -- Unused set to 0
        sr_clk           : out  std_logic;     -- start slow at 125/2	=62.5MHz
        sr_sel           : out  std_logic;     -- 1 -latch data, 0 - shift
		  samplesel 	    : out  std_logic_vector(4 downto 0);
        smplsi_any       : out  std_logic;     -- off during conversion
		  
		  dmx_allwin_done	 : out std_logic;
		  
			srout_bram_dout: out STD_LOGIC_VECTOR(19 DOWNTO 0);--:=x"000";
			srout_bram_addr: in std_logic_vector(10 downto 0);--:="00000000000";		  
		  
		  fifo_wr_en		 : out  std_logic;
		  fifo_wr_clk		 : out  std_logic;
		  fifo_wr_din		 : out  std_logic_vector(31 downto 0)
		);
	END COMPONENT;

    
	 COMPONENT SamplingLgc
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
			cfg						: in 		std_logic_vector(15 downto 0);
         dig_win_start : IN  std_logic_vector(8 downto 0);
         dig_win_n : IN  std_logic_vector(8 downto 0);
         dig_win_ena : IN  std_logic;
         MAIN_CNT_out : OUT  std_logic_vector(8 downto 0);
         sstin_out : OUT  std_logic;
         wr_addrclr_out : OUT  std_logic;
         wr1_ena : OUT  std_logic;
         wr2_ena : OUT  std_logic
        );
    END COMPONENT;
 
	COMPONENT WaveformPedsubDSP
	PORT(
		clk : IN std_logic;
		enable : IN std_logic;
		SMP_MAIN_CNT : IN std_logic_vector(8 downto 0);
		asic_no : IN std_logic_vector(3 downto 0);
		win_addr_start : IN std_logic_vector(8 downto 0);
		trigin : IN std_logic;
		busy					 : out std_logic; -- stays '1' until all pedsub samples have been sent out to the FIFO

		mode : IN std_logic_vector(1 downto 0);
		calc_mode : IN std_logic_vector(3 downto 0);
		fifo_en : IN std_logic;
		fifo_clk : IN std_logic;
		fifo_din : IN std_logic_vector(31 downto 0);
		bram_doutb		: in STD_LOGIC_VECTOR(11 DOWNTO 0);--:=x"000";
		bram_addrb	: out std_logic_vector(10 downto 0);--:="00000000000";		  
	 
	 dmx_allwin_done	:in std_logic;

		trig_bram_data : IN std_logic_vector(49 downto 0);
		ram_data : IN std_logic_vector(7 downto 0);
		ram_busy : IN std_logic;          
		pswfifo_en : OUT std_logic;
		pswfifo_clk : OUT std_logic;
		pswfifo_d : OUT std_logic_vector(31 downto 0);
		trig_bram_addr : OUT std_logic_vector(8 downto 0);
		ram_addr : OUT std_logic_vector(21 downto 0);
		ram_update : OUT std_logic
		);
	END COMPONENT;

COMPONENT WaveformPedcalcDSP
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		enable : IN std_logic;
		navg : IN std_logic_vector(3 downto 0);
		SMP_MAIN_CNT : IN std_logic_vector(8 downto 0);
		asic_no : IN std_logic_vector(3 downto 0);
			 dmx_allwin_done	:in std_logic;

		win_addr_start : IN std_logic_vector(8 downto 0);
		trigin : IN std_logic;
		bram_doutb : IN std_logic_vector(19 downto 0);
		fifo_en : IN std_logic;
		fifo_clk : IN std_logic;
		fifo_din : IN std_logic_vector(31 downto 0);
		ram_busy : IN std_logic;          
		busy : OUT std_logic;
		niter : OUT std_logic_vector(15 downto 0);
		bram_addrb : OUT std_logic_vector(10 downto 0);
		ram_addr : OUT std_logic_vector(21 downto 0);
		ram_data : OUT std_logic_vector(7 downto 0);
		ram_update : OUT std_logic
		);
	END COMPONENT;

 	 
  COMPONENT SRAMscheduler
    PORT(
         clk : IN  std_logic;
         Ain : IN  AddrArray;
         DWin : IN  DataArray;
         DRout : OUT  DataArray;
         rw : IN  std_logic_vector(3 downto 0);
         update_req : IN  std_logic_vector(3 downto 0);
         busy : OUT  std_logic_vector(3 downto 0);
         A : OUT  std_logic_vector(21 downto 0);
         IOw : OUT  std_logic_vector(7 downto 0);
         IOr : IN  std_logic_vector(7 downto 0);
         bs : OUT  std_logic;
         WEb : OUT  std_logic;
         CE2 : OUT  std_logic;
         CE1b : OUT  std_logic;
         OEb : OUT  std_logic
        );
    END COMPONENT;
  
	

   --Inputs
   signal clk : std_logic := '0';
   signal smp_clk : std_logic := '0';
   signal trigger : std_logic := '0';
   signal trig_delay : std_logic_vector(11 downto 0) := (others => '0');
   signal dig_offset : std_logic_vector(8 downto 0) :=(others => '0');-- "000110100";--(others => '0');
   signal win_num_to_read : std_logic_vector(8 downto 0) := "000000100";
   signal asic_enable_bits : std_logic_vector(9 downto 0) := "0100000010";
   signal SMP_MAIN_CNT : std_logic_vector(8 downto 0) := "001000000";
   signal SMP_IDLE_status : std_logic := '0';
   signal DIG_IDLE_status : std_logic := '1';
   signal SROUT_IDLE_status : std_logic := '1';
   signal fifo_empty : std_logic := '1';
   signal EVTBUILD_DONE_SENDING_EVENT : std_logic := '0';
   signal READOUT_RESET : std_logic := '0';
   signal READOUT_CONTINUE : std_logic := '0';
   signal RESET_EVENT_NUM : std_logic := '0';
	signal ramp_length : std_logic_vector(12 downto 0) := "0110100000000"; -- x"D00"
 --Inputs
  -- signal clk : std_logic := '0';
 --  signal start : std_logic := '0';
   signal EVENT_NUM : std_logic_vector(31 downto 0) := (others => '0');
   signal WIN_ADDR : std_logic_vector(8 downto 0) := (others => '0');
 --  signal ASIC_NUM : std_logic_vector(3 downto 0) := (others => '0');
   signal dout : std_logic_vector(15 downto 0) := "1111000011110000";

 	--Outputs
--   signal IDLE_status : std_logic;
   signal busy : std_logic;
   signal samp_done : std_logic;
   signal sr_clr : std_logic;
   signal sr_clk : std_logic;
   signal sr_sel : std_logic;
   signal samplesel : std_logic_vector(4 downto 0);
   signal smplsi_any : std_logic;
   signal fifo_wr_en : std_logic;
   signal fifo_wr_clk : std_logic;
   signal fifo_wr_din : std_logic_vector(31 downto 0);

 	--Outputs
   signal IDLE_status : std_logic;
   signal dig_rd_ena : std_logic;
   signal dig_clr : std_logic;
   signal dig_startramp : std_logic;
 	--Outputs
   signal LATCH_SMP_MAIN_CNT : std_logic_vector(8 downto 0);
	signal internal_READCTRL_dig_win_start : std_logic_vector(8 downto 0);
   signal LATCH_DONE : std_logic;
   signal ASIC_NUM : std_logic_vector(3 downto 0);
   signal busy_status : std_logic;
   signal smp_stop : std_logic;
   signal dig_start : std_logic;
   signal DIG_RD_ROWSEL_S : std_logic_vector(2 downto 0);
   signal DIG_RD_COLSEL_S : std_logic_vector(5 downto 0);
   signal srout_start : std_logic;
   signal EVTBUILD_start : std_logic;
   signal EVTBUILD_MAKE_READY : std_logic;
   --signal EVENT_NUM : std_logic_vector(31 downto 0);
   signal READOUT_DONE : std_logic;
	signal internal_pedsub_start : std_logic :='0';
	signal internal_pedsub_busy : std_logic :='0';

signal internal_CMDREG_PedCalcStart  : std_logic:='0';
signal internal_CMDREG_PedCalcWinLen : std_logic_vector(15 downto 0):=(others=>'0');
signal internal_CMDREG_PedCalcASICen : std_logic_vector(9 downto 0):=(others=>'0');
signal internal_PEDMAN_ReadoutTrig: std_logic:='0';
signal internal_CMDREG_PedCalcBusy:	std_logic:='0';
signal internal_PEDMAN_CurWin		 : std_logic_vector(8 downto 0):=(others=>'0');
signal internal_PEDMAN_CurASICen  : std_logic_vector(9 downto 0):=(others=>'0'); 
signal internal_PEDMAN_readout_reset	: std_logic:='0';
signal internal_READCTRL_use_fixed_dig_start_win : std_logic_vector(15 downto 0):=(others=>'0');	
signal internal_READCTRL_trigger : std_logic := '0';
signal internal_READCTRL_asic_enable_bits : std_logic_vector(9 downto 0) := (others => '0');
signal internal_READCTRL_readout_reset : std_logic := '0';
signal internal_PEDMAN_calc_peds_en : std_logic := '0';
	

	signal internal_cmdreg_readctrl_use_fixed_dig_start_win : std_logic_vector(15 downto 0):=x"8000" or x"0002";


   signal internal_ram_Ain : AddrArray;--:= (others => '0');
   signal internal_ram_DWin : DataArray;-- := (others => '0');
   signal internal_ram_rw : std_logic_vector(NRAMCH-1 downto 0) := (others => '0');
   signal internal_ram_update : std_logic_vector(NRAMCH-1 downto 0) := (others => '0');
   signal internal_ram_DRout : DataArray;
   signal internal_ram_busy : std_logic_vector(NRAMCH-1 downto 0);

   signal IOr : std_logic_vector(7 downto 0):="11011001";
   signal IOw : std_logic_vector(7 downto 0);
	signal ramiobufstate : std_logic;
   signal A : std_logic_vector(21 downto 0);
   signal WEb : std_logic;
   signal CE2 : std_logic;
   signal CE1b : std_logic;
   signal OEb : std_logic;

	signal PedCalcReset: std_logic:='0';
	signal PedCalcBusy: std_logic:='0';

	signal internal_bram_rd_data		: STD_LOGIC_VECTOR(19 DOWNTO 0):=x"00000";
	signal internal_bram_rd_addr		: std_logic_vector(10 downto 0):="00000000000";
	signal internal_bram_addrb			: std_logic_vector(10 downto 0):="00000000000";
	signal internal_pedsub_bram_addr : std_logic_vector(10 downto 0):="00000000000";
	signal internal_pedcalc_bram_addr: std_logic_vector(10 downto 0):="00000000000";

signal internal_CMDREG_PedCalcEnable:std_logic:='0';

	signal internal_CMDREG_PedCalcNAVG			:std_logic_vector(3 downto 0):=x"1";-- 2**3=8 averages for calculating peds

  signal wr_addrclr_out : std_logic;
   signal wr1_ena : std_logic;
   signal wr2_ena : std_logic;
	signal smp_reset : std_logic;
	
	signal fifo_wr_din_i:std_logic_vector(31 downto 0):=x"12345678";
	signal bit_no: integer:=0;
		  
signal sa_val_0: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_1: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_2: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_3: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_4: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_5: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_6: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_7: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_8: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_9: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_A: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_B: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_C: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_D: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_E: std_logic_vector(11 downto 0):="000000000000";
signal sa_val_F: std_logic_vector(11 downto 0):="000000000000";
 signal sr_clk_i:std_logic_vector(1 downto 0):="00";

signal internal_wav_wea				: std_logic_vector(0 downto 0):="0";
	signal internal_wav_dina			: STD_LOGIC_VECTOR(11 DOWNTO 0):=x"000";
	signal internal_wav_bram_addra	: std_logic_vector(10 downto 0):="00000000000";
	signal internal_READCTRL_srout_restart  : std_logic := '0';
signal internal_SROUT_ALLWIN_DONE:std_logic:='0';

   -- Clock period definitions
   constant clk_period : time := 16 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	 uut_samp: SamplingLgc PORT MAP (
          clk => clk,
          reset => smp_reset,
			 cfg=>(others=>'0'),
          dig_win_start => internal_READCTRL_dig_win_start,
          dig_win_n => win_num_to_read,
          dig_win_ena => not DIG_IDLE_status,--busy_status,
          MAIN_CNT_out => SMP_MAIN_CNT,
          sstin_out => smp_clk,
          wr_addrclr_out => wr_addrclr_out,
          wr1_ena => wr1_ena,
          wr2_ena => wr2_ena
        );
		  
		ped_manager: PedestalManagement PORT MAP(
		clk => clk,
		enable => internal_CMDREG_PedCalcEnable,
		start => internal_CMDREG_PedCalcStart,
		win_len_start => internal_CMDREG_PedCalcWinLen,
		asic_en_mask => internal_CMDREG_PedCalcASICen,
		readout_trig => internal_PEDMAN_ReadoutTrig,
		ped_calc_busy => PedCalcBusy,
		readout_busy => busy_status,
	  dmx_allwin_done=>internal_SROUT_ALLWIN_DONE,
		busy => internal_CMDREG_PedCalcBusy,
		stat => open,
		cur_win_no => internal_PEDMAN_CurWin,
		cur_asic_en_bits => internal_PEDMAN_CurASICen,
	  ped_calc_enable=>internal_PEDMAN_calc_peds_en,

		readout_reset => internal_PEDMAN_readout_reset,
		readout_continue => open
	);
		  
   uut: ReadoutControl PORT MAP (
          clk => clk,
          smp_clk => smp_clk,
          trigger => internal_READCTRL_trigger,
          trig_delay => trig_delay,
          dig_offset => dig_offset,
          win_num_to_read => win_num_to_read,
          asic_enable_bits => internal_READCTRL_asic_enable_bits ,
          SMP_MAIN_CNT => SMP_MAIN_CNT,
          SMP_IDLE_status => SMP_IDLE_status,
          DIG_IDLE_status => DIG_IDLE_status,
          SROUT_IDLE_status => SROUT_IDLE_status,
          dig_win_start			=> internal_READCTRL_dig_win_start,
			 fifo_empty => fifo_empty,
          EVTBUILD_DONE_SENDING_EVENT => EVTBUILD_DONE_SENDING_EVENT,
          READOUT_RESET => internal_READCTRL_readout_reset ,
          READOUT_CONTINUE => READOUT_CONTINUE,
          RESET_EVENT_NUM => RESET_EVENT_NUM,
          LATCH_SMP_MAIN_CNT => LATCH_SMP_MAIN_CNT,
			 use_fixed_dig_start_win=>internal_READCTRL_use_fixed_dig_start_win,
          LATCH_DONE => LATCH_DONE,
          ASIC_NUM => ASIC_NUM,
          busy_status => busy_status,
          smp_stop => smp_stop,
          dig_start => dig_start,
          DIG_RD_ROWSEL_S => DIG_RD_ROWSEL_S,
          DIG_RD_COLSEL_S => DIG_RD_COLSEL_S,
          srout_start => srout_start,
			 srout_restart=>internal_READCTRL_srout_restart,
			 ped_sub_start		=> internal_PEDSUB_start,
			 ped_sub_busy		=> internal_PEDSUB_busy,
          EVTBUILD_start => EVTBUILD_start,
          EVTBUILD_MAKE_READY => EVTBUILD_MAKE_READY,
          EVENT_NUM => EVENT_NUM,
          READOUT_DONE => READOUT_DONE
        );
		  
		  
		  	internal_READCTRL_trigger <= (trigger) when internal_CMDREG_PedCalcEnable='0' else
											internal_PEDMAN_ReadoutTrig;
											
			internal_READCTRL_asic_enable_bits <= asic_enable_bits when internal_CMDREG_PedCalcEnable='0' else
													  internal_PEDMAN_CurASICen;
	
	
			internal_READCTRL_use_fixed_dig_start_win<= internal_CMDREG_READCTRL_use_fixed_dig_start_win when internal_CMDREG_PedCalcEnable='0' else
																"1000000" & internal_PEDMAN_CurWin;
	
			internal_READCTRL_readout_reset <= READOUT_RESET when internal_CMDREG_PedCalcEnable='0' else internal_PEDMAN_readout_reset ;
	  
		  
		  
-- Instantiate the Unit Under Test (UUT)
   uut_dig: DigitizingLgcTX PORT MAP (
          clk => clk,
          IDLE_status => DIG_IDLE_status,
          StartDig => dig_start,
          ramp_length => ramp_length,
          rd_ena => dig_rd_ena,
          clr => dig_clr,
          startramp => dig_startramp
        );
		  
		   uut_serread: SerialDataRoutDemux PORT MAP (
          clk => clk,
          start => srout_start,
 	 		calc_peds_en	=>	internal_PEDMAN_calc_peds_en,--internal_CMDREG_PedCalcEnable,--internal_READCTRL_calc_peds_en,
					navg => internal_CMDREG_PedCalcNAVG,

			 restart=>internal_READCTRL_srout_restart,
          EVENT_NUM => EVENT_NUM,
          WIN_ADDR => WIN_ADDR,
          ASIC_NUM => ASIC_NUM,
          IDLE_status => SROUT_IDLE_status,
			 force_test_pattern=>'0',
          busy => busy,
          samp_done => open,
          dout => dout,
          sr_clr => sr_clr,
          sr_clk => sr_clk,
          sr_sel => sr_sel,
          samplesel => samplesel,
          smplsi_any => smplsi_any,
	
			srout_bram_dout => internal_bram_rd_data,
			srout_bram_addr => internal_bram_rd_addr,

			    dmx_allwin_done=>internal_SROUT_ALLWIN_DONE,
	
          fifo_wr_en => fifo_wr_en,
          fifo_wr_clk => fifo_wr_clk,
          fifo_wr_din => fifo_wr_din
        );
		  
		  internal_bram_rd_addr<=internal_pedsub_bram_addr when internal_CMDREG_PedCalcEnable='0' else internal_pedcalc_bram_addr;
		  --internal_bram_rd_addr<=internal_pedcalc_bram_addr;


		  uut_wavedemux: WaveformPedsubDSP PORT MAP (
          clk => clk,
			enable => not internal_CMDREG_PedCalcEnable,
         asic_no => ASIC_NUM,
          win_addr_start => internal_READCTRL_dig_win_start,--WIN_ADDR,
			 mode=>"01",
 			 calc_mode =>x"1",
			 busy=> internal_PEDSUB_busy,
		  --trig bram access
		  trig_bram_addr=>open,
		  trig_bram_data=>"00" & x"000000000000",

			bram_doutb=>internal_bram_rd_data(11 downto 0),
			bram_addrb	=>internal_pedsub_bram_addr,

		  dmx_allwin_done=>internal_SROUT_ALLWIN_DONE,
	
		SMP_MAIN_CNT=> SMP_MAIN_CNT,

          trigin => internal_PEDSUB_start,--srout_start,
          fifo_en => fifo_wr_en,
          fifo_clk => fifo_wr_clk,
          fifo_din => fifo_wr_din,
          
			 ram_addr => internal_ram_Ain(0),
          ram_data => internal_ram_DRout(0),
          ram_update => internal_ram_update(0),
          ram_busy => internal_ram_busy(0)
        );

	u_WaveformPedcalcDSP: WaveformPedcalcDSP PORT MAP(
		clk => clk,
		reset => PedCalcReset,
		enable => internal_PEDMAN_calc_peds_en,--internal_CMDREG_PedCalcEnable,
		navg => internal_CMDREG_PedCalcNAVG,
		SMP_MAIN_CNT=> SMP_MAIN_CNT,
	  dmx_allwin_done=>internal_SROUT_ALLWIN_DONE,
		busy=>PedCalcBusy,
		asic_no => ASIC_NUM,
		win_addr_start =>internal_READCTRL_dig_win_start,--WIN_ADDR ,
		trigin => internal_PEDSUB_start,
		fifo_en => fifo_wr_en ,
		fifo_clk => fifo_wr_clk,
		fifo_din => fifo_wr_din,
		
		bram_doutb=>internal_bram_rd_data,
		bram_addrb	=>internal_pedcalc_bram_addr,

		
		ram_addr => internal_ram_Ain(3),
		ram_data => internal_ram_DWin(3),
		ram_update => internal_ram_update(3),
		ram_busy => internal_ram_busy(3)
	);
	  
		   uut_sramsched: SRAMscheduler PORT MAP (
          clk => clk,
          Ain => internal_ram_Ain,
          DWin => internal_ram_DWin,
          DRout => internal_ram_DRout,
          rw => internal_ram_rw,
          update_req => internal_ram_update,
          busy => internal_ram_busy,
          A => A,
          IOw => IOw,
          IOr => IOr,
			 bs=> ramiobufstate,
          WEb => WEb,
          CE2 => CE2,
          CE1b => CE1b,
          OEb => OEb
        );
		  
		  WIN_ADDR<=DIG_RD_COLSEL_S & DIG_RD_ROWSEL_S;
		  
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
 
 TXdummy: process (clk)
  begin
 
  if (rising_edge(clk)) then
  
  sr_clk_i(1)<=sr_clk_i(0);
  sr_clk_i(0)<=sr_clk;
  
  if (fifo_wr_din(31 downto 20)=x"ABC") then
	  bit_no<=0;
	  fifo_wr_din_i<=fifo_wr_din;--the first is x"ABC"!
  
  
  end if;
	
	if (sr_clk_i="01" ) then -- reset bit number 
	
	if (sr_sel='1') then
	bit_no<=0;
	  else 
	bit_no<=bit_no+1;

	 end if;

	
	 end if;
	 
--	  sa_no<=fifo_wr_din(4 downto 0);
--	  win_no<=fifo_wr_din(18 downto 10);
--	  win_no<=fifo_wr_din(12 downto 10);-- only reflect 3 lower bits of the window numbner for now
	  sa_val_0 <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"0";
	  sa_val_1 <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"1";
	  sa_val_2 <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"2";
	  sa_val_3 <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"3";
	  sa_val_4 <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"4";
	  sa_val_5 <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"5";
	  sa_val_6 <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"6";
	  sa_val_7 <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"7";
	  sa_val_8 <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"8";
	  sa_val_9 <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"9";
	  sa_val_A <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"A";
	  sa_val_B <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"B";
	  sa_val_C <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"C";
	  sa_val_D <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"D";
	  sa_val_E <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"E";
	  sa_val_F <=fifo_wr_din_i(12 downto 10) & fifo_wr_din_i(4 downto 0)& x"F";
	  

	
	if (sr_clk_i="01") then
--	bit_no<=bit_no+1;
	dout(0 )<=sa_val_0(bit_no);
	dout(1 )<=sa_val_1(bit_no);
	dout(2 )<=sa_val_2(bit_no);
	dout(3 )<=sa_val_3(bit_no);
	dout(4 )<=sa_val_4(bit_no);
	dout(5 )<=sa_val_5(bit_no);
	dout(6 )<=sa_val_6(bit_no);
	dout(7 )<=sa_val_7(bit_no);
	dout(8 )<=sa_val_8(bit_no);
	dout(9 )<=sa_val_9(bit_no);
	dout(10)<=sa_val_A(bit_no);
	dout(11)<=sa_val_B(bit_no);
	dout(12)<=sa_val_C(bit_no);
	dout(13)<=sa_val_D(bit_no);
	dout(14)<=sa_val_E(bit_no);
	dout(15)<=sa_val_F(bit_no);
	end if;
	
		
	
	--end if;

 end if;

 
 
 end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	internal_CMDREG_PedCalcEnable<='0';
      -- hold reset state for 100 ns.
--	 internal_cmdreg_readctrl_use_fixed_dig_start_win <=x"8000" or x"01fe";
	 internal_cmdreg_readctrl_use_fixed_dig_start_win <=x"8000" or x"005A";
--internal_SROUT_ALLWIN_DONE<='0';

--internal_bram_rd_addr<="00000000000";

      wait for clk_period*10;	
		smp_reset<='1';
     wait for clk_period*1;	
		smp_reset<='0';
    wait for clk_period*1;	
		
		internal_CMDREG_PedCalcEnable<='1';
		
--PedCalcReset<='1';
      wait for clk_period*1;
--PedCalcReset<='0';
		
	--	internal_CMDREG_PedCalcEnable<='0';

		--wait for clk_period*10;
--		wait for 15.3 us+ 10 ns+ 1114 ns -448 ns + 288 ns -4 *16 ns -8*16 ns-40*16 ns;
		wait for 1 us;
--	trigger<='1';
--internal_CMDREG_PedCalcWinLen<="1111111000000000";
internal_CMDREG_PedCalcWinLen<="0000010" & "000001000";
internal_CMDREG_PedCalcASICen<="0001000000";

	internal_CMDREG_PedCalcStart<='1';
      -- insert stimulus here 
      wait for clk_period*20;
			trigger<='0';

      wait for clk_period*20;
		
		
		
		
      wait for clk_period*25000;
		--poke at the shared RAM to see if it can manage
		internal_ram_Ain (1)<="10" & x"DCBA0";
		internal_ram_DWin(1)<=x"D0";
		internal_ram_rw(1)<='1';
		internal_ram_update(1)<='0';

		internal_ram_Ain (2)<="10" & x"DCBA1";
		--internal_ram_DWin(2)<=x"D0";
		internal_ram_rw(2)<='1';
		internal_ram_update(2)<='0';

		wait for clk_period*2;
		internal_ram_update(1)<='1';
		internal_ram_update(2)<='1';
		wait for clk_period*2;
		internal_ram_update(1)<='0';
		internal_ram_update(2)<='0';

		wait for clk_period*20;
		internal_ram_update(1)<='1';
		wait for clk_period*20;
		internal_ram_update(1)<='0';
		
		wait for 1000 us;
		wait for 10*clk_period;READOUT_RESET<='1';wait for 10*clk_period;READOUT_RESET<='0';
		wait for 10*clk_period;trigger<='1';wait for clk_period*20;trigger<='0';

--		wait for 1000 us;
--		wait for 10*clk_period;READOUT_RESET<='1';wait for 10*clk_period;READOUT_RESET<='0';
--		wait for 10*clk_period;trigger<='1';wait for clk_period*20;trigger<='0';
--		wait for 1000 us;
--		wait for 10*clk_period;READOUT_RESET<='1';wait for 10*clk_period;READOUT_RESET<='0';
--		wait for 10*clk_period;trigger<='1';wait for clk_period*20;trigger<='0';
--		wait for 1000 us;
--		wait for 10*clk_period;READOUT_RESET<='1';wait for 10*clk_period;READOUT_RESET<='0';
--		wait for 10*clk_period;trigger<='1';wait for clk_period*20;trigger<='0';
--		wait for 1000 us;
--		wait for 10*clk_period;READOUT_RESET<='1';wait for 10*clk_period;READOUT_RESET<='0';
--		wait for 10*clk_period;trigger<='1';wait for clk_period*20;trigger<='0';
--		wait for 1000 us;
--		wait for 10*clk_period;READOUT_RESET<='1';wait for 10*clk_period;READOUT_RESET<='0';
--		wait for 10*clk_period;trigger<='1';wait for clk_period*20;trigger<='0';
--		wait for 1000 us;
--		wait for 10*clk_period;READOUT_RESET<='1';wait for 10*clk_period;READOUT_RESET<='0';
--		wait for 10*clk_period;trigger<='1';wait for clk_period*20;trigger<='0';
--		wait for 1000 us;
--		wait for 10*clk_period;READOUT_RESET<='1';wait for 10*clk_period;READOUT_RESET<='0';
--		wait for 10*clk_period;trigger<='1';wait for clk_period*20;trigger<='0';


      wait;
   end process;

END;
