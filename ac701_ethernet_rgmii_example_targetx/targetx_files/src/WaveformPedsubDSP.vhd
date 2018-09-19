----------------------------------------------------------------------------------
-- Company: UH Manoa - ID LAB
-- Engineer: Isar Mostafanezhad
-- 
-- Create Date:    13:06:51 10/16/2014 
-- Design Name:  WaveformPedsubDSP
-- Module Name:    WaveformPedsubDSP - Behavioral 
-- Project Name: 
-- Target Devices: SP6-SCROD rev A4, IDL_KLM_MB RevA (w SRAM)
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
-- 
----------------------------------------------------------------------------------

--get data from temporary bram (serialdataroutdemux) and/or pedestals from pedestal ram
--generate pedestal subtraction, pedestals only, raw, (or mean deviation) values
--package data and send out 32 bit per sample

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;
Library work;
use work.readout_definitions.all;
use work.all;

entity WaveformPedsubDSP is
port(
    clk                 : in   std_logic;
    enable              : in std_logic;  -- '0'= disable, '1'= enable
    reset               : in std_logic;
    
    --these two signals com form the ReadoutControl module and as soon as they are set and the SR Readout start is asserted, it goes and finds the proper pedestals from SRAM and populates buffer
    SMP_MAIN_CNT        : in std_logic_vector(8 downto 0);-- just to keep track of the sampling window number being written to at the time of trigger
    asic_no             : in std_logic_vector(3 downto 0);
    win_addr_start      : in std_logic_vector (8 downto 0);
    trigin              : in std_logic; -- comes from the readout control module: starts fetching pedestals
    
    asic_en_bits        : in std_logic_vector(9 downto 0);
    busy                : out std_logic; -- stays '1' until all pedsub samples have been sent out to the FIFO
    PDAQ_DATA_MODE      : in std_logic_vector(3 downto 0);-- slow controlled: x"0"= charge and time, x"1"=fullwave,...
    PDAQ_CHMASK         : in std_logic_vector(15 downto 0);--slow controlled: masks channels that we would like to send full wavefrom dump to pocketdaq
			
    mode                : in std_logic_vector(2 downto 0);
    calc_mode           : in std_logic_vector(3 downto 0);
	
	--ped subtracted waveform FIFO:
	pswfifo_en 			:out std_logic;
	pswfifo_clk 		: out std_logic;
	pswfifo_d 			: out std_logic_vector(31 downto 0);
			
	--waveform : 
	-- steal fifo signal from the srreadout module and demux -- this has to go no more needed
    fifo_en             : in  std_logic;
    fifo_clk            : in  std_logic;
    fifo_din            : in  std_logic_vector(31 downto 0);
    
    qt_fifo_rd_clk          : in std_logic;
    qt_fifo_rd_en           : in std_logic;
    qt_fifo_dout		    : out STD_LOGIC_VECTOR(17 DOWNTO 0);
    qt_fifo_empty           : out std_logic;
    qt_fifo_almost_empty    : out std_logic;
    qt_fifo_evt_rdy	        : out std_logic;
		  
   	trig_ctime              : in std_logic_vector(26 downto 0);

    --SerialDataRoutDemux signals
    bram_doutb              : in STD_LOGIC_VECTOR(11 DOWNTO 0);--:=x"000";
    bram_addrb              : out std_logic_vector(10 downto 0);--:="00000000000";		  
    dmx_allwin_done         : in std_logic;-- signals that all windows have been readout using the serial readout module and are in the BRAM ready for pedsub and sending to FIFO
		  
	--trig bram access
	trig_bram_addr	        : out std_logic_vector(8 downto 0);
	trig_bram_data	        : in  std_logic_vector(49 downto 0);
    trig_bram_sel           : out std_logic;

    trigasic_bram_rd_addr   : out std_logic_vector(8 downto 0);
    trigasic_bram_rd_data   : in STD_LOGIC_VECTOR(3 DOWNTO 0);

	-- 12 bit Pedestal RAM Access: only for reading pedestals
    ram_addr                : OUT  std_logic_vector(21 downto 0);
    ram_data                : IN  std_logic_vector(7 downto 0);
    ram_update              : OUT  std_logic;
    ram_busy                : IN  std_logic

);
end WaveformPedsubDSP;

architecture Behavioral of WaveformPedsubDSP is
COMPONENT PedRAMaccess
	PORT(
        clk           : IN std_logic;
        addr          : IN std_logic_vector(21 downto 0);
        wval0         : IN std_logic_vector(11 downto 0);
        wval1         : IN std_logic_vector(11 downto 0);
        rw            : IN std_logic;
        update        : IN std_logic;
        ram_datar     : IN std_logic_vector(7 downto 0);
        ram_busy      : IN std_logic;          
        rval0         : OUT std_logic_vector(11 downto 0);
        rval1         : OUT std_logic_vector(11 downto 0);
        busy          : OUT std_logic;
        ram_addr      : OUT std_logic_vector(21 downto 0);
        ram_dataw     : OUT std_logic_vector(7 downto 0);
        ram_rw        : OUT std_logic;
        ram_update    : OUT std_logic
        );
	END COMPONENT;
	
COMPONENT blk_mem_gen_v8_3
    PORT (
        clka    : IN STD_LOGIC;
        wea     : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra   : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        dina    : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        clkb    : IN STD_LOGIC;
        addrb   : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        doutb   : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
        );
END COMPONENT;

--Latch to clock or trigin
signal asic_no_i			: std_logic_vector (3 downto 0);-- latched to trigin
signal win_addr_start_i	    : integer;--std_logic_vector (9 downto 0);
signal trigin_i             : std_logic_vector(1 downto 0);
--signal ped_sa_num_i		: std_logic_vector(21 downto 0);
signal ped_sa_rval0         : std_logic_vector(11 downto 0);
signal ped_sa_rval1         : std_logic_vector(11 downto 0);
--signal ped_rval0_i		: std_logic_vector(11 downto 0);
signal ped_arr_addr         : std_logic_vector(10 downto 0);
signal ped_arr_addr0_int    : integer:=0;
signal ped_arr_addr1_int    : integer:=0;
signal ped_sa_update		: std_logic:='0';
signal ped_sa_busy		    : std_logic:='0';

signal ped_sa_num           : std_logic_vector(21 downto 0);

signal ped_asic				: integer:=0;
signal ped_ch				: integer:=0;
signal ped_win				: integer:=0;
signal ped_sa				: integer:=0;
signal ped_sa6              : integer:=0; --ped_sa6*6 = what ped_sa would be
signal ped_hbyte			: std_logic_vector(7 downto 0);
signal ped_hbword			: integer:=0;
signal ped_word				: std_logic_vector(16 downto 0);
--signal dmx2_win			: std_logic_vector(1 downto 0):="00";
signal dmx2_sa				: std_logic_vector(4 downto 0):="00000";
signal dmx_asic				: integer:=0;
signal dmx_win				: std_logic_vector(1 downto 0):="00";
signal dmx_ch				: integer:=0;
signal dmx_sa				: integer:=0;
signal dmx_bit				: integer:=0;
signal fifo_din_i			: std_logic_vector(31 downto 0);
signal fifo_din_i2			: std_logic_vector(31 downto 0);
signal fifo_en_i			: std_logic:='0';
signal enable_i				: std_logic:='0';
signal start_ped_sub		: std_logic :='0';
signal sa_cnt				: integer 	:=0;
signal dmx_allwin_busy 		: std_logic:='1';
signal ped_sub_start		: std_logic_vector(1 downto 0):="00";
--signal jdx				: JDXTempArray;
--signal jdx2				: JDXTempArray;
signal jdx1					: std_logic_vector(6 downto 0);
signal ped_sub_fetch_done	: std_logic:='0'; 
--signal dmx_allwin_done	: std_logic:='0';
signal lastbit				: std_logic:='0';
		
signal dmx_wav                  : WaveTempArray:=(x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000");
signal ped_wea                  : std_logic_vector(0 downto 0):="0";
signal ped_dina                 : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ped_doutb                : STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ped_bram_addra           : std_logic_vector(10 downto 0);
signal ped_bram_addrb           : std_logic_vector(10 downto 0);
signal wav_doutb                : STD_LOGIC_VECTOR(11 DOWNTO 0):=x"000";
signal wav_bram_addrb           : std_logic_vector(10 downto 0):="00000000000";
signal ped_sub_send_data_busy   : std_logic:='0';
signal busy_i                   : std_logic:='0';
signal trig_ctime_i             : std_logic_vector(26 downto 0);

signal trgrec                   : std_logic_vector(19 downto 0):=(others=>'0');--a snapshot of the trigger bits for the ASIC of interest: 19 downto 15 is DigWin, 14 downto 10 is DigWin+1, 9 downto 5 is DigWin+2, 4 downto 0 is DigWin+3
signal trig_bram_cnt            : integer :=0;
signal trig_bram_start_addr_i   : integer:=0;--(8 downto 0):=(others=>'0');
signal trig_asic_no_i           : integer :=0;

signal sapedsub	                : unsigned(12 downto 0):=(others=> '0');
signal samem                    : WaveUnsignedTempArray:=(others=> x"000");
signal ct_lpv                   : WaveUnsignedTempArray:=(others=> x"000");
signal ct_lpt                   : WaveUnsignedTempArray:=(x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000");
signal ct_sa                    : std_logic_vector(6 downto 0):="0000000";
signal ct_ch                    : integer:=0;
signal ct_cnt                   : integer:=0;
signal start_tmp2bram_xfer      : std_logic:='0';
signal SMP_MAIN_CNT_i           : std_logic_vector(8 downto 0);
signal calc_mode_i              : std_logic_vector(3 downto 0);
signal tmp_cnt                  : integer:=0;
signal wavarray_tmp				: WaveTempArray;-- added for pipelining

signal qt_rst           : std_logic:='0';
signal qt_rd_clk        : std_logic;
signal qt_din           : STD_LOGIC_VECTOR(17 DOWNTO 0);	--tx_eof_n & tx_sof_n & rest of data
signal qt_wr_en         : std_logic:='0';
signal qt_rd_en         : std_logic:='0';
signal qt_dout		    : STD_LOGIC_VECTOR(17 DOWNTO 0);	--tx_eof_n & tx_sof_n & rest of data
signal qt_full		    : std_logic:='0';
signal qt_empty         : std_logic:='0';
signal qt_almost_empty  : std_logic:='0';

signal first_asic_no            : std_logic_vector(3 downto 0):=x"0";
signal last_asic_no             : std_logic_vector(3 downto 0):=x"0";
signal asic_en_bits_i		    : std_logic_vector(9 downto 0):="0000000000";
signal send_empty_packet	    : std_logic:='0';
signal qt_chno                  : integer:=0;
signal qt_axis                  : std_logic:='0';
signal swd_cnt                  : integer:=0;
signal qtwav                    : std_logic_vector(47 downto 0);
signal PDAQ_CHMASK_i            : std_logic_vector(15 downto 0):=x"0000";
signal last_ch_no               : std_logic_vector(3 downto 0):=x"0";
signal packet_no                : std_logic_vector(15 downto 0):=x"0000";
signal win_cnt                  : integer:=0;
signal pswfifo_d_i              : std_logic_vector(31 downto 0);
signal trigasic_bram_rd_addr_i  : std_logic_vector(8 downto 0);
signal count                    : std_logic_vector(4 downto 0):= (others => '0');

type pedwork_state is --overal managing process
(
    PWidle
);

signal pw_st : pedwork_state:=PWidle;

type pedfetch_state is --pedstals fetch state
(
    PedsIdle,				  -- Idling until command start bit and store asic no and win addr no	
    PedsFetchPedVal,
    PedsFetchPedValWaitSRAM1,
    PedsFetchPedValWaitSRAM2,
    PedsFetchPedValWaitSRAM3,
    PedsFetchRedValWR1,
    PedsFetchRedValWR2,
    Peds2FetchPedVal, --reading mean deviation instead of mean
    Peds2SRAMAddress,
    Peds2SRAMWait,
    Peds2SRAMdata0,
    Peds2SRAMdata1,
    PedsFetchCheckSample,
    PedsFetchCheckWin,
    PedsFetchCheckCH,
    PedsFetchWinWait,
    PedsFetchDone
);
signal next_ped_st : pedfetch_state := PedsIdle;

type pedsub_state is
(
    pedsub_idle,
    pedsub_sub_pre_chk_empty,
    pedsub_sub_pre0,
    pedsub_sub_pre,
    pedsub_sub_pre2,
    pedsub_sub_pre3,
    pedsub_sub,
    pedsub_sub0wait,
    pedsub_sub0,
    pedsub_sub1,
    pedsub_sub2,
    pedsub_inc_sa_cnt,
    pedsub_dumpct,
    pedsub_dumpct2,
    pedsub_dump_trigrec,
    pedsub_dump_trigkpp0,
    pedsub_dump_trigkpp1,
    pedsub_dumpfooter,
    pedsub_dumpfooter2,
    pedsub_dumpfooter3,
    pedsub_dump_type,
    pedsub_dump_qt_chk_empty,
    pedsub_dump_qt1,
    pedsub_dump_qt2,
    pedsub_dump_qt3,
    pedsub_dump_qt4,
    pedsub_dump_qt_chk,
    pedsub_dump_qt_footer,
    pedsub_dump_wav_qt_hdr1,
    pedsub_dump_wav_qt_hdr2,
    pedsub_dump_wav_qt_hdr3,
    pedsub_dump_wav_qt_hdr4,
    pedsub_dump_wav0_pickchannel,
    pedsub_dump_wav0_chmask_inc,
    pedsub_dump_wav0_chmask_check,
    pedsub_dump_wav0,
    pedsub_dump_wav0_fetch,
    pedsub_dump_wav0_wait0,
    pedsub_dump_wav0_wait1,
    pedsub_dump_wav0_wait2,
    pedsub_dump_wav0_dmp,
    pedsub_dump_wav0_inc,
    pedsub_dump_wav0_chk,
    pedsub_dump_wav_qt1,
    pedsub_dump_wav_qt2,
    pedsub_dump_wav_qt3,
    pedsub_dump_wav_qt4,
    pedsub_dump_qt_evt_rdy,
    pedsub_dump_qt_evt_rdy2,
    pedsub_dump_qt_evt_rdy3
);

signal pedsub_st : pedsub_state:=pedsub_idle;

type trig_rec_state is
(
    trg_rec_idle,
    trg_rec_win00,
    trg_rec_win0,
    trg_rec_win1,
    trg_rec_win2,
    trg_rec_win3
);

signal st_trgrec : trig_rec_state:=trg_rec_idle;


    attribute dont_touch : string;
    attribute dont_touch of ped_ch : signal is "true";
    attribute dont_touch of ped_sa : signal is "true";
    attribute dont_touch of ped_win : signal is "true";
    attribute dont_touch of ped_sa6 : signal is "true";
    attribute dont_touch of count : signal is "true";
    attribute dont_touch of sapedsub : signal is "true";
    attribute dont_touch of pedsub_st : signal is "true";
    attribute dont_touch of next_ped_st : signal is "true";
    attribute dont_touch of ped_sa_num : signal is "true";

begin

qt_rst<=reset;

qt_chno<=(dmx_asic-1)*15+ct_cnt+1 when dmx_asic<=5 and dmx_asic>=1 else
			(dmx_asic-6)*15+ct_cnt+1 when dmx_asic<=10 and dmx_asic>=6 else
			0;
			
qt_axis<='0' when dmx_asic<=5 and dmx_asic>=1 else
			'1' when dmx_asic<=10 and dmx_asic>=6 else
			'0';

pswfifo_d<=pswfifo_d_i;

pswfifo_clk<=clk;
bram_addrb<=wav_bram_addrb;
wav_doutb<=bram_doutb;

qt_rd_clk<=qt_fifo_rd_clk;
qt_rd_en<=qt_fifo_rd_en;
qt_fifo_dout<=qt_dout;
qt_fifo_empty<=qt_empty;
qt_fifo_almost_empty<=qt_almost_empty;

    --read pedestals from RAM and convert from 8 bit to 12 bit
	Inst_PedRAMaccess: PedRAMaccess PORT MAP(
		clk => clk,
		addr => ped_sa_num,
		rval0 => ped_sa_rval0,
		rval1 => ped_sa_rval1,
		wval0 => "000000000000",
		wval1 => "000000000000",
		rw => '0',-- read only
		update => ped_sa_update,
		busy => ped_sa_busy,
		ram_addr => ram_addr,
		ram_datar => ram_data,
		ram_dataw => open,--"00000000",
		ram_rw => open,--'0',
		ram_update => ram_update,
		ram_busy => ram_busy
	);
    --store pedestals after converting and before subtracting
    u_pedarr : blk_mem_gen_v8_3
      PORT MAP (
        clka => clk,
        wea => ped_wea,
        addra => ped_bram_addra,
        dina => ped_dina(11 DOWNTO 0),
        clkb => clk,
        addrb => ped_bram_addrb,
        doutb => ped_doutb(11 DOWNTO 0)
      );

qt_dout <= (others => '0');
qt_full <= '0';
qt_empty <= '0';
qt_almost_empty <= '0';
  
busy<=busy_i;
trigasic_bram_rd_addr<=trigasic_bram_rd_addr_i;

first_asic_no <= x"1" when asic_en_bits_i(0)='1' else
                x"2" when asic_en_bits_i(1)='1' else
                x"3" when asic_en_bits_i(2)='1' else
                x"4" when asic_en_bits_i(3)='1' else
                x"5" when asic_en_bits_i(4)='1' else
                x"6" when asic_en_bits_i(5)='1' else
                x"7" when asic_en_bits_i(6)='1' else
                x"8" when asic_en_bits_i(7)='1' else
                x"9" when asic_en_bits_i(8)='1' else
                x"A" when asic_en_bits_i(9)='1' else
                x"0";

last_asic_no <= x"A" when asic_en_bits_i(9)='1' else
                x"9" when asic_en_bits_i(8)='1' else
                x"8" when asic_en_bits_i(7)='1' else
                x"7" when asic_en_bits_i(6)='1' else
                x"6" when asic_en_bits_i(5)='1' else
                x"5" when asic_en_bits_i(4)='1' else
                x"4" when asic_en_bits_i(3)='1' else
                x"3" when asic_en_bits_i(2)='1' else
                x"2" when asic_en_bits_i(1)='1' else
                x"1" when asic_en_bits_i(0)='1' else
                x"0";

last_ch_no<=x"f" when PDAQ_CHMASK_i(15)='1' else
			x"e" when PDAQ_CHMASK_i(14)='1' else
			x"d" when PDAQ_CHMASK_i(13)='1' else
			x"c" when PDAQ_CHMASK_i(12)='1' else
			x"b" when PDAQ_CHMASK_i(11)='1' else
			x"a" when PDAQ_CHMASK_i(10)='1' else
			x"9" when PDAQ_CHMASK_i(9)='1' else
			x"8" when PDAQ_CHMASK_i(8)='1' else
			x"7" when PDAQ_CHMASK_i(7)='1' else
			x"6" when PDAQ_CHMASK_i(6)='1' else
			x"5" when PDAQ_CHMASK_i(5)='1' else
			x"4" when PDAQ_CHMASK_i(4)='1' else
			x"3" when PDAQ_CHMASK_i(3)='1' else
			x"2" when PDAQ_CHMASK_i(2)='1' else
			x"1" when PDAQ_CHMASK_i(1)='1' else
			x"0" when PDAQ_CHMASK_i(0)='1' else
			x"0";

--subtract pedestals and add offset or send pedestals or raw waveform
--mode(2) selects between mean and mean deviation
sapedsub <= unsigned('0' & wav_doutb)+('0' & x"D48")-unsigned('0' & ped_doutb) when mode(1 downto 0)="01" and ct_ch/=15 else-- if it is mmppc pulse, then subtract 3400
			(unsigned('0' & wav_doutb)+('0' & x"800"))-unsigned('0' & ped_doutb) when mode(1 downto 0)="01" and ct_ch=15 else-- if it is calibration ch., then subtract 2048
			unsigned('0' & ped_doutb) 											when mode="010" else
			unsigned('0' & wav_doutb)											when mode(1 downto 0)="11" else
			unsigned('0' & ped_doutb)                                         when mode="110" else --for mean deviation
			'0' & x"FED";

--managing_proc: process(cls)
--begin
--	if (rising_edge(clk)) then
--		case pw_st is
--			when PWidle =>
--				if (trigin_i(1 downto 0) = "01" and enable_i = '1') then
--					pw_st<=PWreset;-- reset the sub processes
--				else
--					pw_st<=PWidle;
--				end if;
--			when PWreset =>
--				pw_st<=PWcheckempty
--			when PWcheckempty =>
--		end case;
--	end if;
--end process;


latchsig_proc: process(clk)
begin
    if (rising_edge(clk)) then
        enable_i<=enable;
        calc_mode_i<=calc_mode;
        trig_ctime_i<=trig_ctime;
        if (trigin_i(1 downto 0) = "01") then
            SMP_MAIN_CNT_i<=SMP_MAIN_CNT;
            asic_en_bits_i<=asic_en_bits;
        end if;
	end if;
end process;

process(clk) -- trigs fetch
begin

if (rising_edge(clk)) then
-- take care of trigger 
    case st_trgrec is

    	when trg_rec_idle =>
    		trgrec<=trgrec;
    		trig_bram_cnt<=0;
    --		if (trigin_i="01"  and enable_i='1' and asic_no/=x"0") then
    --			st_trgrec<=trg_rec_win00;
    --			trig_bram_sel<='1';
    --		else
    --			trig_bram_sel<='0';
    --			st_trgrec<=trg_rec_idle;
    --		end if;
    		
    	when trg_rec_win00 =>
    		trig_bram_start_addr_i<=win_addr_start_i;
    		trig_asic_no_i<=to_integer(unsigned(asic_no_i));
    		st_trgrec<=trg_rec_win0;
    
    	when trg_rec_win0 =>	
    		trgrec<=trgrec;
    		trig_bram_addr<=std_logic_vector(to_unsigned(trig_bram_start_addr_i+trig_bram_cnt,9));
    		st_trgrec<=trg_rec_win1;
		
    	when trg_rec_win1 =>
    		trgrec<=trgrec;
    		st_trgrec<=trg_rec_win2;
    
    	when trg_rec_win2 =>
    		trgrec((trig_bram_cnt*5+4) downto (trig_bram_cnt*5))<=trig_bram_data((trig_asic_no_i*5-1) downto (trig_asic_no_i*5-5));
    		trig_bram_cnt<=trig_bram_cnt+1;
    		st_trgrec<=trg_rec_win3;
    
    	when trg_rec_win3 =>
    		trgrec<=trgrec;
    		if (trig_bram_cnt = 5) then
    			st_trgrec<=trg_rec_idle;
    		else
    			st_trgrec<=trg_rec_win0;
    		end if;
    end case;
end if;

--adding to this state machine to also read mean deviation values from RAM
if (rising_edge(clk)) then
	case next_ped_st is 

    	When PedsIdle =>			
            ped_sub_fetch_done<='0';
            if (trigin_i="01"  and enable_i='1') then
                if (asic_no/=x"0") then
                    ped_asic<=to_integer(unsigned(asic_no));
                    ped_ch  <=0;
                    ped_win <=0;
                    ped_sa  <=0;
                    ped_sa6 <=0;
                    if mode(2) = '1' then
                        next_ped_st<=Peds2FetchPedVal; --mean deviation
                    else
                        next_ped_st<=PedsFetchPedVal; --mean
                    end if;
                else 
                    next_ped_st<=PedsFetchDone;
                end if;
            else
                next_ped_st<=PedsIdle;
            end if;
    
    	When PedsFetchPedVal =>	   
            ped_sub_fetch_done<='0';
            --determine RAM address to read pedestals from
            --ped_sa_num(21 downto 18)<=std_logic_vector(to_unsigned(dmx_asic-1,4));--		: std_logic_vector(21 downto 0);
            ped_sa_num(21 downto 18)<=x"0";
            ped_sa_num(17 downto 14)<=std_logic_vector(to_unsigned(ped_ch,4));--		: std_logic_vector(21 downto 0);
            ped_sa_num(13 downto 5)<=std_logic_vector(to_unsigned(ped_win+win_addr_start_i,9));
            ped_sa_num(4  downto 0)<=std_logic_vector(to_unsigned(ped_sa,5));
            ped_sa_update<='1';
            ped_wea<="0";
            next_ped_st<=PedsFetchPedValWaitSRAM1;
	
    	When PedsFetchPedValWaitSRAM1 =>	   
            ped_sub_fetch_done<='0';
    		--wait for ram_busy to come up
    		ped_arr_addr<=ped_sa_num(17 downto 14) & std_logic_vector(to_unsigned(ped_win,2)) & ped_sa_num(4 downto 0);
    		next_ped_st<=PedsFetchPedValWaitSRAM2;
    	
    	When PedsFetchPedValWaitSRAM2 =>	   
            ped_sub_fetch_done<='0';
    		ped_sa_update<='0';
    		if (ped_sa_busy='1') then
    			next_ped_st<=PedsFetchPedValWaitSRAM2;
    		else
    			next_ped_st<=PedsFetchPedValWaitSRAM3;
    		end if;
        
        --write first 12 bit data
    	When PedsFetchPedValWaitSRAM3=>	   
            ped_sub_fetch_done<='0';
            ped_bram_addra<=ped_arr_addr; --address to write first datum to in 12bit ram
            ped_dina<=ped_sa_rval0;
            ped_wea<="1";
            ped_sa<=ped_sa+2;
            next_ped_st<=PedsFetchRedValWR1;
    
        --write second 12 bit data
    	When PedsFetchRedValWR1=>	   
            ped_sub_fetch_done<='0';
            ped_bram_addra<=std_logic_vector(to_unsigned(to_integer(unsigned(ped_arr_addr))+1,11)); --address to write second datum to in 12bit ram
            ped_dina<=ped_sa_rval1;
            ped_wea<="1";
            next_ped_st<=PedsFetchCheckSample;
        
        --determine RAM address to read mean deviation values from    
        When Peds2FetchPedVal =>
            ped_sub_fetch_done<='0';
            ped_sa_num(21 downto 18) <= x"1"; --only 1 asic, write to addresses starting here, change if multiple asics
            --ped_sa_num(17 downto 0) <= std_logic_vector(to_unsigned(512*12*ped_ch + 12*(ped_win+win_addr_start_i) + ped_sa6*2, 18));
			ped_sa_num(17 downto 13) <= "00000";
			ped_sa_num(12 downto 9) <= std_logic_vector(to_unsigned(ped_ch, 4));
			ped_sa_num(8 downto 0) <= std_logic_vector(to_unsigned(ped_win+win_addr_start_i, 9));
            ped_sa_update <= '1';
            ped_wea <= "0";
            next_ped_st<=Peds2SRAMaddress;
        --
        When Peds2SRAMaddress =>
            ped_sub_fetch_done<='0';
            ped_arr_addr <= std_logic_vector(to_unsigned(ped_ch, 4)) & std_logic_vector(to_unsigned(ped_win, 2)) & "00000";
            next_ped_st<=Peds2SRAMwait;
        --wait for RAM
        When Peds2SRAMwait =>
            ped_sub_fetch_done<='0';
            ped_sa_update<='0';
            if (ped_sa_busy='1') then
                next_ped_st<=Peds2SRAMwait;
            else
                next_ped_st<=Peds2SRAMdata0;
            end if;
		--write dev value to bram 32 times (windows 0 and 2), requires least changes
		When Peds2SRAMdata0 =>
			ped_bram_addra<=std_logic_vector(unsigned(ped_arr_addr)+unsigned(count));
			ped_dina<=ped_sa_rval0;
			ped_wea<="1";
			ped_sub_fetch_done<='0';
			if unsigned(count) = 31 then
				count <= (others => '0');
				next_ped_st<=peds2SRAMdata1;
			else
				count <= std_logic_vector(unsigned(count)+1);
				next_ped_st<=peds2SRAMdata0;
			end if;
        --write dev value to bram 32 times (windows 1 and 3)
        When Peds2SRAMdata1 =>
			ped_bram_addra<=std_logic_vector(unsigned(ped_arr_addr)+unsigned(count)+32);
			ped_dina<=ped_sa_rval1;
			ped_wea<="1";
			ped_sub_fetch_done<='0';
			if unsigned(count) = 31 then
				count <= (others => '0');
				ped_win <= ped_win+2;
				next_ped_st<=PedsFetchCheckWin;
			else
				count <= std_logic_vector(unsigned(count)+1);
				next_ped_st<=Peds2SRAMdata1;
	        end if;
        --check if read all samples
    	When PedsFetchCheckSample=>	   
            ped_sub_fetch_done<='0';
    		ped_wea<="0";
    		if (ped_sa<NSamplesPerWin) then
    		    if mode(2) = '1' then
    		        next_ped_st<=Peds2FetchPedVal;
    		    else
    		        next_ped_st<=PedsFetchPedVal;
    		    end if;
    		else
    			ped_sa<=0;
    			ped_sa6<=0;
    			ped_win<=ped_win+1;
    			next_ped_st<=PedsFetchCheckWin;
    		end if;
    
        --check if read all windows
    	When PedsFetchCheckWin=>	   
            ped_sub_fetch_done<='0';
        	if (ped_win<NWWin) then
        	    if mode(2) = '1' then
        	        next_ped_st<=Peds2FetchPedVal;
        	    else
        		    next_ped_st<=PedsFetchPedVal;
        		end if;
        	else
        		ped_win<=0;
        		ped_ch<=ped_ch+1;
        		next_ped_st<=PedsFetchCheckCH;
        	end if;
    	
    	When PedsFetchCheckCH=>	   
            ped_sub_fetch_done<='0';
        	if (ped_ch<NCHPerTX) then
        	    if mode(2) = '1' then
        	        next_ped_st<=Peds2FetchPedVal;
        	    else
        	        next_ped_st<=PedsFetchPedVal;
        	    end if;
        	else
        		next_ped_st<=PedsFetchWinWait;
        	end if;
        
        --wait until shiftreg done with all 4 windows
        --pedsub state machine gets stuck if dmx_allwin_done not 1
        When PedsFetchWinWait=>
            if dmx_allwin_done = '0' then
                next_ped_st<=PedsFetchWinWait;
            else
                next_ped_st<=PedsFetchDone;
            end if;
					
    	When PedsFetchDone =>
    		ped_sub_fetch_done<='1';
    		next_ped_st<=PedsIdle;
    	   --done Fetching pedestals
    	
    	When others =>	   
    	   ped_sub_fetch_done<='0';
    		next_ped_st<=PedsIdle;
    
    end case;
end if;
 

if (rising_edge(clk)) then
	trigin_i(1)<=trigin_i(0);
	trigin_i(0)<=trigin;

	PDAQ_CHMASK_i<=PDAQ_CHMASK;
	-- give it enough time till the win addr and other information become available
	if (trigin_i="01" and enable_i='1') then
			busy_i<='1';
			asic_no_i<=asic_no;
			win_addr_start_i<=to_integer(unsigned(win_addr_start));
--			ped_sub_fetch_done<='0';
			dmx_asic<=to_integer(unsigned(asic_no));
	end if;
	ped_sub_start(1)<=ped_sub_start(0);
	ped_sub_start(0)<=dmx_allwin_done and ped_sub_fetch_done;

    case pedsub_st is

        When pedsub_idle =>
        	wav_bram_addrb<="00000000000";
        	ped_bram_addrb<="00000000000";
        	qt_wr_en	<='0';
        	qt_fifo_evt_rdy<='0';
        	sa_cnt<=0;
        	ct_cnt<=0;
        	pswfifo_en<='0';
        	if (trigin_i="01" and enable_i='1' and asic_no=x"0") then
        		ped_sub_send_data_busy<='1';
        		pedsub_st<=pedsub_sub_pre_chk_empty;
        	else
        		if (ped_sub_start="01" and enable_i='1') then 
        			ped_sub_send_data_busy<='1';
        			pedsub_st<=pedsub_sub_pre_chk_empty;
        		else 
        			ped_sub_send_data_busy<='0';
        			pedsub_st<=pedsub_idle;
        		end if;
        	end if;
        	
        When pedsub_sub_pre_chk_empty =>
        	if (asic_no_i=x"0") then 
        		pedsub_st<=pedsub_idle;--pedsub_dump_qt_chk_empty;
        	else
        		pedsub_st<=pedsub_sub_pre0;
        	end if;

        When pedsub_sub_pre0 =>
        	pswfifo_d_i<=x"77617665";--"wave" in ASCII
        	pswfifo_en<='1';
        	pedsub_st<=pedsub_sub_pre;
        		
        When pedsub_sub_pre =>
        	pswfifo_d_i<=x"FE" & std_logic_vector(to_unsigned(dmx_asic,4)) & "00" & SMP_MAIN_CNT_i & std_logic_vector(to_unsigned(win_addr_start_i,9)) ;
        	pswfifo_en<='1';
        	if (calc_mode_i=x"0") then --peak search mode
        		ct_lpv<=(others=> x"000");
        	elsif (calc_mode_i=x"1") then --trough search mode
        		ct_lpv<=(others=> x"FFF");
        	end if;
        	samem(0)<=(others=>'0');
        	samem(1)<=(others=>'0');
        	samem(2)<=(others=>'0');
        	pedsub_st<=pedsub_sub_pre2;
        
        When pedsub_sub_pre2 =>
        	--send event number
        --		pswfifo_d_i<=x"C" & "0" & trig_ctime_i;
        	pswfifo_d_i<=x"CF00" & packet_no;
        	pedsub_st<=pedsub_sub_pre3;
        
        When pedsub_sub_pre3 =>
        	--send ctime
        	pswfifo_d_i<=x"D" & "0" & trig_ctime_i;
        	pedsub_st<=pedsub_sub;

        When pedsub_sub=>--read from bram and send out to FIFO
            pswfifo_en<='0';
        	wav_bram_addrb<=std_logic_vector(to_unsigned(sa_cnt,11));
        	ped_bram_addrb<=std_logic_vector(to_unsigned(sa_cnt,11));
        	pedsub_st<=pedsub_sub0wait;
        		
        When pedsub_sub0wait=>
            pedsub_st<=pedsub_sub0;
        
        When pedsub_sub0=>
            pswfifo_en<='0';
        	ct_ch<=to_integer(unsigned(wav_bram_addrb(10 downto 7)));
        	ct_sa<=wav_bram_addrb(6 downto 0);
        	pedsub_st<=pedsub_sub1;
        
        When pedsub_sub1=>
            pswfifo_en<='0';
        	samem(2)<=samem(1);
        	samem(1)<=samem(0);
        	samem(0)<=sapedsub(11 downto 0);
        	pedsub_st<=pedsub_sub2;

        when pedsub_sub2=>
        	if (calc_mode_i=x"0") then --calc peak
        		if (samem(1)>samem(2) and samem(1)>=samem(0)) then --we have a peak! add to peak memory if larger than previous peak
        			if (samem(1)>ct_lpv(ct_ch)) then 
        				ct_lpv(ct_ch)<=samem(1);
        				ct_lpt(ct_ch)<="00000" & unsigned(ct_sa);-- sample offset from the beginning of the 4 windows
        			end if;			
        		end if;
        	elsif (calc_mode_i=x"1") then  --calc trough
        		if (samem(1)<samem(2) and samem(1)<=samem(0)) then --we have a peak! add to peak memory if larger than previous peak
        			if (samem(1)<ct_lpv(ct_ch)) then 
        				ct_lpv(ct_ch)<=samem(1);
        				ct_lpt(ct_ch)<="00000" & unsigned(ct_sa);-- sample offset from the beginning of the 4 windows
        			end if;			
        		end if;
        	end if;
        	
        	pswfifo_d_i<=x"BD" & '0' & std_logic_vector(to_unsigned(sa_cnt,11)) & std_logic_vector(sapedsub(11 downto 0));
        	pswfifo_en<='1';
        	if (ct_sa="1111111") then -- reset buffer at the end of a channel
        		samem(0)<=(others=>'0');
        		samem(1)<=(others=>'0');
        		samem(2)<=(others=>'0');
        	end if;
        	
        	pedsub_st<=pedsub_inc_sa_cnt;
		
        when pedsub_inc_sa_cnt=>
        	pswfifo_en<='0';
        	sa_cnt<=sa_cnt+1;
        	if (sa_cnt>NSamplesPerWin*NWWIN*16-2) then
        			--start_calc_CT<='1';-- start calculating charge and time
        			--now dump the C&T buffer into FIFO
        			ct_cnt<=0;
        			pedsub_st<=pedsub_dumpct;
        	else 
        			pedsub_st<=pedsub_sub;
        	end if;
        		
        when pedsub_dumpct=>
        	pswfifo_en<='0';
        	if (ct_cnt<16) then
        		pedsub_st<=pedsub_dumpct2;
        	else
        		pedsub_st<=pedsub_dump_trigrec;
        	end if;
        		
        when pedsub_dumpct2=>
        	pswfifo_d_i<=x"CB" & std_logic_vector(to_unsigned(ct_cnt,4))  & '0' & std_logic_vector(ct_lpt(ct_cnt)(6 downto 0)) & std_logic_vector(ct_lpv(ct_cnt)(11 downto 0));-- charge and time
        	ct_cnt<=ct_cnt+1;
        	pswfifo_en<='1';
        	pedsub_st<=pedsub_dumpct;

        when pedsub_dump_trigrec =>
        	pswfifo_d_i<=x"CF" & std_logic_vector(to_unsigned(dmx_asic,4)) & trgrec;
        	pswfifo_en<='0';
        --	win_cnt<=-3;-- goes to to +8 (12 total windows are covered)
        	win_cnt<=-16;-- goes to to +15 (32 total windows are covered!!)
        	pedsub_st<=pedsub_dump_trigkpp0;
        	--pedsub_st<=pedsub_dumpfooter;
        
        when pedsub_dump_trigkpp0	=>
        	pswfifo_en<='0';
        	trigasic_bram_rd_addr_i<=std_logic_vector(to_unsigned(win_addr_start_i+win_cnt,9));
        	pedsub_st<=pedsub_dump_trigkpp1;
        
        when pedsub_dump_trigkpp1	=>
        	pswfifo_d_i<=x"CA" & "0000000" & trigasic_bram_rd_addr_i & "0000" & trigasic_bram_rd_data;
        	if (win_cnt=15) then
        		pswfifo_en<='1';--dump to FIFO and its the last one- dump footer and done!
        		pedsub_st<=pedsub_dumpfooter;
        	else
        		pswfifo_en<='1';--dump to FIFO
        		win_cnt<=win_cnt+1;
        		pedsub_st<=pedsub_dump_trigkpp0;
        	end if;

--when pedsub_dump_trigkpp1	=>
--		pswfifo_d_i<=x"CA" & pswfifo_d_i(19 downto 0) & trigasic_bram_rd_data;
----		if (win_cnt=-1 or win_cnt=2 or win_cnt=5) then 
--		if (win_cnt=-10 or win_cnt=-7 or win_cnt=-4 or win_cnt=-1  or win_cnt=2 or win_cnt=5 or win_cnt=8 ) then 
--			pswfifo_en<='1';--dump to FIFO
--			win_cnt<=win_cnt+1;
--			pedsub_st<=pedsub_dump_trigkpp0;
----		elsif win_cnt=8 then 
--		elsif win_cnt=11 then 
--			pswfifo_en<='1';--dump to FIFO and its the last one- dump footer and done!
--			pedsub_st<=pedsub_dumpfooter;
--		else -- still building the trig word
--			pswfifo_en<='0';
--			win_cnt<=win_cnt+1;
--			pedsub_st<=pedsub_dump_trigkpp0;
--		end if;

        when pedsub_dumpfooter=>
        	pswfifo_en<='1';
        	pswfifo_d_i<=x"E0F1E0F1";
        	pedsub_st<=pedsub_dumpfooter2;
        
        when pedsub_dumpfooter2=>
        	qt_fifo_evt_rdy<='1';
        	pswfifo_en<='1';
        	pswfifo_d_i<=x"FACEFACE";
        	pedsub_st<=pedsub_dumpfooter3;
        		
        when pedsub_dumpfooter3=>
        	pswfifo_en<='1';
        	pswfifo_d_i<=x"00000000"; --zero pad due to checksum issues
        	ct_cnt<=0;
        	qt_fifo_evt_rdy<='1';
        	busy_i <= '0';
        	pedsub_st<=pedsub_idle;
--		    pedsub_st<=pedsub_dump_qt_chk_empty;
		
---------------------------------------------------------------------------------------------------------		
--when pedsub_dump_qt_chk_empty=> -- check empty package to concentrator if there is no ASIC with valid trigger bits to be read from 
--		pswfifo_en<='0';
--		qt_wr_en	<='0';
--		if (asic_no_i=x"0") then 
--			qt_wr_en	<='1';
--			qt_din	<="00" & x"0000";
--			pedsub_st<=pedsub_dump_qt_footer;
--		else
--			pedsub_st<=pedsub_dump_type;
--		end if;

--when pedsub_dump_type=>
--		pswfifo_en<='0';
--		sa_cnt<=0;
--		if (PDAQ_DATA_MODE=x"0") then 
--			pedsub_st<=pedsub_dump_qt1;--just send QT values to the data concentrator
--		else
--			ct_ch<=0;
--			pedsub_st<=pedsub_dump_wav_qt_hdr1;--send full wave values to the data concentrator
--		end if;


--when pedsub_dump_qt1=>
--		qt_wr_en	<='1';
--		if ct_cnt=0 and asic_no_i=first_asic_no then
--			qt_din	<="10" & x"80" & qt_axis & std_logic_vector(to_unsigned(qt_chno,7));
--		else
--			qt_din	<="11" & x"80" & qt_axis & std_logic_vector(to_unsigned(qt_chno,7));
--		end if;
--		pedsub_st<=pedsub_dump_qt2;

--when pedsub_dump_qt2=>
--		qt_wr_en	<='1';
--		qt_din	<="11" & trig_ctime_i(15 downto 0);
--		pedsub_st<=pedsub_dump_qt3;

--when pedsub_dump_qt3=>
--		qt_wr_en	<='1';
--		qt_din	<="11" & std_logic_vector(to_unsigned(win_addr_start_i,9)) & std_logic_vector(ct_lpt(ct_cnt)(6 downto 0));
--		pedsub_st<=pedsub_dump_qt4;

--when pedsub_dump_qt4=>
--		qt_wr_en	<='1';
--		if ct_cnt=14 and asic_no_i=last_asic_no then
--			qt_din	<="01" & x"0" & std_logic_vector(ct_lpv(ct_cnt)(11 downto 0));
--		else
--			qt_din	<="11" & x"0" & std_logic_vector(ct_lpv(ct_cnt)(11 downto 0));
--		end if;
--		ct_cnt<=ct_cnt+1;
--		pedsub_st<=pedsub_dump_qt_chk;

--when pedsub_dump_qt_chk=>
--		qt_wr_en	<='0';
--		qt_fifo_evt_rdy<='0';
--		if (ct_cnt/=15) then 
--			pedsub_st<=pedsub_dump_qt1;
--		else
--			pedsub_st<=pedsub_dump_qt_footer;
--		end if;

--when pedsub_dump_qt_footer=>
--		qt_wr_en	<='0';
--		qt_fifo_evt_rdy<='0';
--		pedsub_st<=pedsub_dump_qt_evt_rdy;

--when pedsub_dump_wav_qt_hdr1=>
--		qt_wr_en	<='1';
--		if sa_cnt=0 and asic_no_i=first_asic_no then
--			qt_din	<="10" & x"80" & asic_no_i & x"0";
--		else
--			qt_din	<="11" & x"80" & asic_no_i & x"0";
--		end if;
--		pedsub_st<=pedsub_dump_wav_qt_hdr2;

--when pedsub_dump_wav_qt_hdr2=>
--		qt_wr_en	<='1';
--		qt_din	<="11" & x"ABC0"; --ASIC Waveform Start
--		pedsub_st<=pedsub_dump_wav_qt_hdr3;

--when pedsub_dump_wav_qt_hdr3=>
--		qt_wr_en	<='1';
--		qt_din	<="11" & trig_ctime_i(15 downto 0); --Trigger CTime
--		pedsub_st<=pedsub_dump_wav_qt_hdr4;

--when pedsub_dump_wav_qt_hdr4=>
--		qt_wr_en	<='1';
--		qt_din	<="11" & "0000000" & std_logic_vector(to_unsigned(win_addr_start_i,9));
--		sa_cnt	<=0;
--		ct_ch		<=0;
--		pedsub_st<=pedsub_dump_wav0_pickchannel;

--when pedsub_dump_wav0_pickchannel=>
--		qt_wr_en	<='0';
--		swd_cnt<=0;
--		sa_cnt<=0;
--		if (PDAQ_CHMASK_i(ct_ch)='1') then
--			pedsub_st<=pedsub_dump_wav0;
--		else
--			pedsub_st<=pedsub_dump_wav0_chmask_inc;
--		end if;

--when pedsub_dump_wav0_chmask_inc=>
--		qt_wr_en<='0';
--		ct_ch<=ct_ch+1;
--		pedsub_st<=pedsub_dump_wav0_chmask_check;

--when pedsub_dump_wav0_chmask_check=>
--		qt_wr_en<='0';
--		if (ct_ch<=15) then
--			pedsub_st<=pedsub_dump_wav0_pickchannel;
--		else
--			pedsub_st<=pedsub_dump_qt_evt_rdy;
--		end if;
		
--when pedsub_dump_wav0=>
--		qt_wr_en	<='0';
--		swd_cnt<=0;
--		pedsub_st<=pedsub_dump_wav0_fetch;
		
--when pedsub_dump_wav0_fetch=>
--		qt_wr_en	<='0';
--		wav_bram_addrb<=std_logic_vector(to_unsigned(ct_ch,4)) & std_logic_vector(to_unsigned(sa_cnt,7));
--		ped_bram_addrb<=std_logic_vector(to_unsigned(ct_ch,4)) & std_logic_vector(to_unsigned(sa_cnt,7));
--		pedsub_st<=pedsub_dump_wav0_wait0;

--when pedsub_dump_wav0_wait0=>
--		qt_wr_en	<='0';
--		ct_sa<=wav_bram_addrb(6 downto 0);
--		pedsub_st<=pedsub_dump_wav0_wait1;

--when pedsub_dump_wav0_wait1=>
--		qt_wr_en	<='0';
--		pedsub_st<=pedsub_dump_wav0_wait2;

--when pedsub_dump_wav0_wait2=>
--		qt_wr_en	<='0';
--		pedsub_st<=pedsub_dump_wav0_dmp;

		
--when pedsub_dump_wav0_dmp=>
--		qt_wr_en	<='0';
--		qtwav((3-swd_cnt)*12+11 downto (3-swd_cnt)*12)<=std_logic_vector(sapedsub(11 downto 0));
--		pedsub_st<=pedsub_dump_wav0_inc;
		
--when pedsub_dump_wav0_inc=>
--		qt_wr_en	<='0';
--		swd_cnt<=swd_cnt+1;
--		sa_cnt<=sa_cnt+1;
--		pedsub_st<=pedsub_dump_wav0_chk;
		
--when pedsub_dump_wav0_chk=>
--		qt_wr_en	<='0';
--		if (swd_cnt<4) then
--			pedsub_st<=pedsub_dump_wav0_fetch;
--		else
--			pedsub_st<=pedsub_dump_wav_qt1;
--		end if;

--when pedsub_dump_wav_qt1=>
--		qt_wr_en	<='1';
--		qt_din	<="11" & x"80" & std_logic_vector(to_unsigned(dmx_asic,4)) & std_logic_vector(to_unsigned(ct_ch,4));
--		pedsub_st<=pedsub_dump_wav_qt2;

--when pedsub_dump_wav_qt2=>
--		qt_wr_en	<='1';
--		qt_din	<="11" & qtwav(47 downto 32);
--		pedsub_st<=pedsub_dump_wav_qt3;
		
--when pedsub_dump_wav_qt3=>
--		qt_wr_en	<='1';
--		qt_din	<="11" & qtwav(31 downto 16);
--		pedsub_st<=pedsub_dump_wav_qt4;
	
--when pedsub_dump_wav_qt4=>
--		qt_wr_en	<='1';
--		if (sa_cnt>=128) then
--			if last_ch_no=std_logic_vector(to_unsigned(ct_ch,4)) or ct_ch=15 then
--				if asic_no_i=last_asic_no then
--					qt_din	<="01" & qtwav(15 downto 0);-- last wd of the packet
--				else 
--					qt_din	<="11" & qtwav(15 downto 0);
--				end if;
--				pedsub_st<=pedsub_dump_qt_evt_rdy;-- done here
--			else
--				qt_din	<="11" & qtwav(15 downto 0);
--				pedsub_st<=pedsub_dump_wav0_pickchannel;
--			end if;
--		else
--			qt_din	<="11" & qtwav(15 downto 0);
--			pedsub_st<=pedsub_dump_wav0;
--		end if;



--when pedsub_dump_qt_evt_rdy=>
--	if (asic_no_i/=x"0") then 
--		if asic_no_i=last_asic_no then
--			qt_fifo_evt_rdy<='1';
--		else 
--			qt_fifo_evt_rdy<='0';
--		end if;
--	else
--		qt_fifo_evt_rdy<='1';
--	end if;
--	qt_wr_en	<='0';
--	pedsub_st<=pedsub_dump_qt_evt_rdy2;

--when pedsub_dump_qt_evt_rdy2=>
--		pedsub_st<=pedsub_dump_qt_evt_rdy3;

--when pedsub_dump_qt_evt_rdy3=>
--		packet_no<=std_logic_vector(to_unsigned(to_integer(unsigned(packet_no))+1,16));
--		busy_i<='0';
--		pedsub_st<=pedsub_idle;
		
        when others=>
		  pedsub_st<=pedsub_idle;
		
    end case;
end if;
end process;



end Behavioral;

