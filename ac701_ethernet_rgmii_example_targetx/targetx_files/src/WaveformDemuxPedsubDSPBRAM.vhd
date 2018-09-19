----------------------------------------------------------------------------------
-- Company: UH Manoa - ID LAB
-- Engineer: Isar Mostafanezhad
-- 
-- Create Date:    13:06:51 10/16/2014 
-- Design Name:  WaveformDemuxPedsubDSPBRAM
-- Module Name:    WaveformDemuxPedsubDSPBRAM - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;
use work.readout_definitions.all;


entity WaveformDemuxPedsubDSPBRAM is
port(
			clk		 			 : in   std_logic;
			enable 				: in std_logic;  -- '0'= disable, '1'= enable
			--these two signals com form the ReadoutControl module and as soon as they are set and the SR Readout start is asserted, it goes and finds the proper pedestals from SRAM and populates buffer
			SMP_MAIN_CNT		: in std_logic_vector(8 downto 0);-- just to keep track of the sampling window number being written to at the time of trigger
			asic_no				 : in std_logic_vector(3 downto 0);
			win_addr_start		 : in std_logic_vector (8 downto 0);
			trigin				 : in std_logic; -- comes from the readout control module
			
			mode	: in std_logic_vector(1 downto 0);

			calc_mode : in std_logic_vector(3 downto 0);
			
			--ped subtracted waveform FIFO:
			pswfifo_en 			:	out std_logic;
			pswfifo_clk 		: 	out std_logic;
			pswfifo_d 			: 	out std_logic_vector(31 downto 0);
			
			--waveform : 
			-- steal fifo signal from the srreadout module and demux 
		  fifo_en		 : in  std_logic;
		  fifo_clk		 : in  std_logic;
		  fifo_din		 : in  std_logic_vector(31 downto 0);
		  
		  --trig bram access
		  trig_bram_addr	: out std_logic_vector(8 downto 0);
		  trig_bram_data	: in  std_logic_vector(49 downto 0);
		  
		  -- 12 bit Pedestal RAM Access: only for reading pedestals
		   ram_addr 	: OUT  std_logic_vector(21 downto 0);
         ram_data 	: IN  std_logic_vector(7 downto 0);
         ram_update 	: OUT  std_logic;
         ram_busy 	: IN  std_logic

);

end WaveformDemuxPedsubDSPBRAM;

architecture Behavioral of WaveformDemuxPedsubDSPBRAM is
COMPONENT PedRAMaccess
	PORT(
		clk : IN std_logic;
		addr : IN std_logic_vector(21 downto 0);
		wval0 : IN std_logic_vector(11 downto 0);
		wval1 : IN std_logic_vector(11 downto 0);
		rw : IN std_logic;
		update : IN std_logic;
		ram_datar : IN std_logic_vector(7 downto 0);
		ram_busy : IN std_logic;          
		rval0 : OUT std_logic_vector(11 downto 0);
		rval1 : OUT std_logic_vector(11 downto 0);
		busy : OUT std_logic;
		ram_addr : OUT std_logic_vector(21 downto 0);
		ram_dataw : OUT std_logic_vector(7 downto 0);
		ram_rw : OUT std_logic;
		ram_update : OUT std_logic
		);
	END COMPONENT;
	
	------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT blk_mem_gen_v7_3
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    clkb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------




--Latch to clock or trigin
signal asic_no_i			: integer;--std_logic_vector (3 downto 0);-- latched to trigin
signal win_addr_start_i	: integer;--std_logic_vector (9 downto 0);
signal trigin_i			: std_logic_vector(25 downto 0);
signal ped_fetch_start	: std_logic:='0';
--signal ped_sa_num_i		: std_logic_vector(21 downto 0);
signal ped_sa_rval0		: std_logic_vector(11 downto 0);
signal ped_sa_rval1		: std_logic_vector(11 downto 0);
--signal ped_rval0_i		: std_logic_vector(11 downto 0);
signal ped_arr_addr:std_logic_vector(10 downto 0);
signal ped_arr_addr0_int : integer:=0;
signal ped_arr_addr1_int : integer:=0;
signal ped_sa_update		: std_logic:='0';
signal ped_sa_busy		: std_logic:='0';

signal ped_sa_num:std_logic_vector(21 downto 0);

signal ped_asic				: integer:=0;
signal ped_ch					: integer:=0;
signal ped_win					: integer:=0;
signal ped_sa					: integer:=0;
signal ped_hbyte				:std_logic_vector(7 downto 0);
signal ped_hbword				:integer:=0;
signal ped_word				:std_logic_vector(16 downto 0);
--signal dmx2_win				:std_logic_vector(1 downto 0):="00";
signal dmx2_sa					:std_logic_vector(4 downto 0):="00000";
signal dmx_asic				:integer:=0;
signal dmx_win					:std_logic_vector(1 downto 0):="00";
signal dmx_ch					:integer:=0;
signal dmx_sa					:integer:=0;
signal dmx_bit					:integer:=0;
signal fifo_din_i				: std_logic_vector(31 downto 0);
signal fifo_din_i2				: std_logic_vector(31 downto 0);
signal fifo_en_i				: std_logic:='0';
signal enable_i				: std_logic:='0';
signal start_ped_sub			: std_logic :='0';
signal sa_cnt					: integer 	:=0;
signal dmx_allwin_busy 		: std_logic:='1';
signal ped_sub_fetch_busy 	: std_logic:='1';
signal ped_sub_start			:std_logic_vector(1 downto 0):="00";
--signal jdx						: JDXTempArray;
--signal jdx2						: JDXTempArray;
signal jdx1						: std_logic_vector(6 downto 0);
signal ped_sub_fetch_done	: std_logic:='0'; 
signal dmx_allwin_done		: std_logic:='0';
signal lastbit					: std_logic:='0';
		
signal dmx_wav					: WaveTempArray:=(x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000");
signal ped_wea			: std_logic_vector(0 downto 0):="0";
signal ped_dina			: STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ped_doutb		: STD_LOGIC_VECTOR(11 DOWNTO 0);
signal ped_bram_addra	: std_logic_vector(10 downto 0);
signal ped_bram_addrb	: std_logic_vector(10 downto 0);
signal wav_wea			: std_logic_vector(0 downto 0):="0";
signal wav_dina			: STD_LOGIC_VECTOR(11 DOWNTO 0):=x"000";
signal wav_doutb		: STD_LOGIC_VECTOR(11 DOWNTO 0):=x"000";
signal wav_bram_addra	: std_logic_vector(10 downto 0):="00000000000";
signal wav_bram_addrb	: std_logic_vector(10 downto 0):="00000000000";

signal trgrec	: std_logic_vector(19 downto 0):=(others=>'0');--a snapshot of the trigger bits for the ASIC of interest: 19 downto 15 is DigWin, 14 downto 10 is DigWin+1, 9 downto 5 is DigWin+2, 4 downto 0 is DigWin+3

signal trig_bram_cnt: integer :=0;
signal trig_bram_start_addr_i :integer:=0;--(8 downto 0):=(others=>'0');
signal trig_asic_no_i : integer :=0;


signal sapedsub	:unsigned(12 downto 0):=(others=> '0');
signal samem		: WaveUnsignedTempArray:=(others=> x"000");
signal ct_lpv		: WaveUnsignedTempArray:=(others=> x"000");
signal ct_lpt		: WaveUnsignedTempArray:=(x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000");
signal ct_sa		: std_logic_vector(6 downto 0):="0000000";
signal ct_ch		: integer:=0;
signal ct_cnt		: integer:=0;
signal start_tmp2bram_xfer: std_logic:='0';
signal SMP_MAIN_CNT_i:std_logic_vector(8 downto 0);
signal calc_mode_i:std_logic_vector(3 downto 0);

signal tmp2bram_ctr	: std_logic_vector(7 downto 0):=x"00";

signal wavarray_tmp				: WaveTempArray;-- added for pipelining

type ped_state is --pedstals fetch state
(
PedsIdle,				  -- Idling until command start bit and store asic no and win addr no	
PedsFetchPedVal,
PedsFetchPedValWaitSRAM1,
PedsFetchPedValWaitSRAM2,
PedsFetchPedValWaitSRAM3,
PedsFetchRedValWR1,
PedsFetchRedValWR2,
PedsFetchCheckSample,
PedsFetchCheckWin,
PedsFetchCheckCH,
PedsFetchDone
);
signal next_ped_st					: ped_state := PedsIdle;

type dmx_state is -- demux state
(
dmxIdle,				 
dmxAction,
dmxDone
);
signal next_dmx_st					: dmx_state := dmxIdle;

type pedsub_state is
(
pedsub_idle,
pedsub_wait_tmp2bram,
pedsub_sub_pre,
pedsub_sub,
pedsub_sub0,
pedsub_sub1,
pedsub_sub2,
pedsub_dumpct,
pedsub_dumpct2,
pedsub_dump_trigrec,
pedsub_dumpfooter,
pedsub_dumpfooter2
);
signal pedsub_st : pedsub_state:=pedsub_idle;

type tmp_to_bram_state is
(
st_tmp2bram_waitstart,
st_tmp2bram_check_ctr,
st_tmp2bram_store1,
st_tmp2bram_store2
);

signal st_tmp2bram				: tmp_to_bram_state:=st_tmp2bram_waitstart;

type trig_rec_state is
(
trg_rec_idle,
trg_rec_win0,
trg_rec_win1,
trg_rec_win2,
trg_rec_win3
);

signal st_trgrec		: trig_rec_state:=trg_rec_idle;


begin

pswfifo_clk<=clk;


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

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
u_pedarr : blk_mem_gen_v7_3
  PORT MAP (
    clka => clk,
    wea => ped_wea,
    addra => ped_bram_addra,
    dina => ped_dina(11 DOWNTO 0),
    clkb => clk,
    addrb => ped_bram_addrb,
    doutb => ped_doutb(11 DOWNTO 0)
  );
  
u_wavarr : blk_mem_gen_v7_3
  PORT MAP (
    clka => clk,
    wea => wav_wea,
    addra => wav_bram_addra,
    dina => wav_dina(11 DOWNTO 0),
    clkb => clk,
    addrb => wav_bram_addrb,
    doutb => wav_doutb(11 DOWNTO 0)
  );


-- INST_TAG_END ------ End INSTANTIATION Template ------------


process(clk)
begin

	if (rising_edge(clk)) then
	fifo_en_i<=fifo_en;
	fifo_din_i<=fifo_din;
	enable_i<=enable;
	calc_mode_i<=calc_mode;
	
	
	
	if (trigin_i(1 downto 0) = "01") then
		SMP_MAIN_CNT_i<=SMP_MAIN_CNT;
	end if;

	end if;

end process;


process(clk) -- pedestal fetch
begin

if (rising_edge(clk)) then
-- take care of trigger 
--case st_trgrec is
--
--	when trg_rec_idle =>
--		trgrec<=trgrec;
--		trig_bram_cnt<=0;
--		if (trigin_i(25 downto 24)="01") then
--			trig_bram_start_addr_i<=to_integer(unsigned(win_addr_start));
--			trig_asic_no_i<=to_integer(unsigned(asic_no));
--			st_trgrec<=trg_rec_win0;
--		else
--			st_trgrec<=trg_rec_idle;
--		end if;
--
--	when trg_rec_win0 =>	
--		trgrec<=trgrec;
--		trig_bram_addr<=std_logic_vector(to_unsigned(trig_bram_start_addr_i+trig_bram_cnt,9));
--		st_trgrec<=trg_rec_win1;
--		
--	when trg_rec_win1 =>
--		trgrec<=trgrec;
--		st_trgrec<=trg_rec_win2;
--
--	when trg_rec_win2 =>
--		trgrec((trig_bram_cnt*5+4) downto (trig_bram_cnt*5))<=trig_bram_data((trig_asic_no_i*5-1) downto (trig_asic_no_i*5-5));
--		trig_bram_cnt<=trig_bram_cnt+1;
--		st_trgrec<=trg_rec_win3;
--
--	when trg_rec_win3 =>
--		trgrec<=trgrec;
--		if (trig_bram_cnt = 5) then
--			st_trgrec<=trg_rec_idle;
--		else
--			st_trgrec<=trg_rec_win0;
--		end if;
--			
--		
--
--end case;


end if;






if (rising_edge(clk)) then

	case next_ped_st is 

	When PedsIdle =>
	if (trigin_i(25 downto 24)="01"  and enable_i='1') then
		ped_asic<=to_integer(unsigned(asic_no));
		ped_ch  <=0;
		ped_win <=0;
		ped_sa  <=0;
		ped_sub_fetch_busy<='0';
		next_ped_st<=PedsFetchPedVal;
	end if ;

	When PedsFetchPedVal =>
		ped_sub_fetch_busy<='1';
		ped_sa_num(21 downto 18)<=std_logic_vector(to_unsigned(asic_no_i-1,4));--		: std_logic_vector(21 downto 0);
		ped_sa_num(17 downto 14)<=std_logic_vector(to_unsigned(ped_ch,4));--		: std_logic_vector(21 downto 0);
		ped_sa_num(13 downto 5) <=std_logic_vector(to_unsigned(ped_win+win_addr_start_i,9));
		ped_sa_num(4  downto 0) <=std_logic_vector(to_unsigned(ped_sa,5));
		ped_sa_update<='1';
		ped_wea<="0";
		next_ped_st<=PedsFetchPedValWaitSRAM1;
	
	When PedsFetchPedValWaitSRAM1 =>
		--wait for ram_busy to come up
		ped_arr_addr<=ped_sa_num(17 downto 14) & std_logic_vector(to_unsigned(ped_win,2)) & ped_sa_num(4 downto 0);
		next_ped_st<=PedsFetchPedValWaitSRAM2;
	
	When PedsFetchPedValWaitSRAM2 =>
		ped_sa_update<='0';
		if (ped_sa_busy='1') then
				next_ped_st<=PedsFetchPedValWaitSRAM2;
		else
				next_ped_st<=PedsFetchPedValWaitSRAM3;
		end if;

	When PedsFetchPedValWaitSRAM3=>
			ped_bram_addra<=ped_arr_addr;
			ped_dina<=ped_sa_rval0;
			ped_wea<="1";
			ped_sa<=ped_sa+2;
			next_ped_st<=PedsFetchRedValWR1;

	When PedsFetchRedValWR1=>
			ped_bram_addra<=std_logic_vector(to_unsigned(to_integer(unsigned(ped_arr_addr))+1,11));
			ped_dina<=ped_sa_rval1;
			ped_wea<="1";
			next_ped_st<=PedsFetchCheckSample;
				
	When PedsFetchCheckSample=>
			ped_wea<="0";
			if (ped_sa<NSamplesPerWin) then
				next_ped_st<=PedsFetchPedVal;
			else
				ped_sa<=0;
				ped_win<=ped_win+1;
				next_ped_st<=PedsFetchCheckWin;
			end if;

	When PedsFetchCheckWin=>
			if (ped_win<NWWin) then
				next_ped_st<=PedsFetchPedVal;
			else
				ped_win<=0;
				ped_ch<=ped_ch+1;
				next_ped_st<=PedsFetchCheckCH;
			end if;
	
	When PedsFetchCheckCH=>
			if (ped_ch<NCHPerTX) then
				next_ped_st<=PedsFetchPedVal;
			else
				next_ped_st<=PedsFetchDone;
			end if;
					
	When PedsFetchDone =>
		ped_sub_fetch_busy<='0';
		ped_sub_fetch_done<='1';
		next_ped_st<=PedsIdle;
	--done Fetching pedestals
	

	When others =>
		next_ped_st<=PedsIdle;

	end case;


end if;
 

if (rising_edge(clk)) then
	
	trigin_i(25 downto 1)<=trigin_i(24 downto 0);
	trigin_i(0)<=trigin;
	
	-- give it enough time till the win addr and other information become available
	
	if (trigin_i(25 downto 24)="01") then
--		tmp2bram_ctr<=x"01";
		asic_no_i<=to_integer(unsigned(asic_no));
		win_addr_start_i<=to_integer(unsigned(win_addr_start));
		ped_fetch_start<='1';
		ped_sub_fetch_done<='0';
		dmx_allwin_done<='0';
	end if;
	
	start_tmp2bram_xfer<='0';
	lastbit<='0';
	--start_ped_sub<='0';
	
	if (lastbit='1') then  -- this is the last bit of the sample. pass on to bram
		wavarray_tmp((0 ))<=dmx_wav(0  );--pedarray_tmp((0 ));
		wavarray_tmp((1 ))<=dmx_wav(1  );--pedarray_tmp((1 ));
		wavarray_tmp((2 ))<=dmx_wav(2  );--pedarray_tmp((2 ));
		wavarray_tmp((3 ))<=dmx_wav(3  );--pedarray_tmp((3 ));
		wavarray_tmp((4 ))<=dmx_wav(4  );--pedarray_tmp((4 ));
		wavarray_tmp((5 ))<=dmx_wav(5  );--pedarray_tmp((5 ));
		wavarray_tmp((6 ))<=dmx_wav(6  );--pedarray_tmp((6 ));
		wavarray_tmp((7 ))<=dmx_wav(7  );--pedarray_tmp((7 ));
		wavarray_tmp((8 ))<=dmx_wav(8  );--pedarray_tmp((8 ));
		wavarray_tmp((9 ))<=dmx_wav(9  );--pedarray_tmp((9 ));
		wavarray_tmp((10))<=dmx_wav(10 );--pedarray_tmp((10));
		wavarray_tmp((11))<=dmx_wav(11 );--pedarray_tmp((11));
		wavarray_tmp((12))<=dmx_wav(12 );--pedarray_tmp((12));
		wavarray_tmp((13))<=dmx_wav(13 );--pedarray_tmp((13));
		wavarray_tmp((14))<=dmx_wav(14 );--pedarray_tmp((14));
		wavarray_tmp((15))<=dmx_wav(15 );--pedarray_tmp((15));

		start_tmp2bram_xfer<='1';
	else 
		wavarray_tmp<=wavarray_tmp;
		start_tmp2bram_xfer<='0';
		-- write it all back to bram 
	end if;


	if (fifo_en_i='1' and enable_i='1') then-- data is coming, push into waveform memory
	fifo_din_i2<=fifo_din_i;

		if    (fifo_din_i(31 downto 20)=x"ABC") then
			if (to_integer(unsigned(fifo_din_i(18 downto 10)))=win_addr_start_i) then -- this is the first window- set the flag
				dmx_allwin_busy<='1';
			end if;
		
			dmx_asic<=to_integer(unsigned(fifo_din_i(9 downto 6)));
			dmx_win <=std_logic_vector(to_unsigned(to_integer(unsigned(fifo_din_i(18 downto 10)))-win_addr_start_i,2));
			dmx_sa  <=to_integer(unsigned(fifo_din_i(4 downto 0)));
			dmx2_sa<=fifo_din_i(4 downto 0);
			
		elsif (fifo_din_i(31 downto 20)=x"DEF") then
			dmx_asic<=dmx_asic;
			dmx_win <=dmx_win;
			dmx_sa  <=dmx_sa;
			dmx2_sa<=dmx2_sa;
			if (fifo_din_i(19 downto 16)="0111") then -- this is the first bit in the sequence, so prep the address and stuff
				jdx1<=dmx_win & dmx2_sa;
				else
				jdx1<=jdx1;
			end if;
			dmx_wav(0 )<=dmx_wav(0 )(10 downto 0) & fifo_din_i(0 );			dmx_wav(1 )<=dmx_wav(1 )(10 downto 0) & fifo_din_i(1 );			dmx_wav(2 )<=dmx_wav(2 )(10 downto 0) & fifo_din_i(2 );			dmx_wav(3 )<=dmx_wav(3 )(10 downto 0) & fifo_din_i(3 );			dmx_wav(4 )<=dmx_wav(4 )(10 downto 0) & fifo_din_i(4 );			dmx_wav(5 )<=dmx_wav(5 )(10 downto 0) & fifo_din_i(5 );			dmx_wav(6 )<=dmx_wav(6 )(10 downto 0) & fifo_din_i(6 );			dmx_wav(7 )<=dmx_wav(7 )(10 downto 0) & fifo_din_i(7 );			dmx_wav(8 )<=dmx_wav(8 )(10 downto 0) & fifo_din_i(8 );			dmx_wav(9 )<=dmx_wav(9 )(10 downto 0) & fifo_din_i(9 );			dmx_wav(10)<=dmx_wav(10)(10 downto 0) & fifo_din_i(10);			dmx_wav(11)<=dmx_wav(11)(10 downto 0) & fifo_din_i(11);			dmx_wav(12)<=dmx_wav(12)(10 downto 0) & fifo_din_i(12);			dmx_wav(13)<=dmx_wav(13)(10 downto 0) & fifo_din_i(13);			dmx_wav(14)<=dmx_wav(14)(10 downto 0) & fifo_din_i(14);			dmx_wav(15)<=dmx_wav(15)(10 downto 0) & fifo_din_i(15);

			if (fifo_din_i(19 downto 16)="1011") then -- this is the first bit in the sequence, so prep the address and stuff
				lastbit<='1';
				else
				lastbit<='0';
			end if;
		
		elsif (fifo_din_i(31 downto 0) = x"FACEFACE") then --end of window.
--			if (jdx1=x"7F") then -- this is the sample of the last window- set the flag
			if (dmx_win="11" ) then -- this is the sample of the last window- set the flag
				dmx_allwin_busy<='0';
				dmx_allwin_done<='1';
			end if;
		
		else 
			wavarray_tmp<=wavarray_tmp;
			start_tmp2bram_xfer<='0';

			--unknown package!
		
		end if;
	


	
	end if;
	
	ped_sub_start(1)<=ped_sub_start(0);
	--ped_sub_start(0)<=not(dmx_allwin_busy) and not(ped_sub_fetch_busy);
	ped_sub_start(0)<=dmx_allwin_done;-- and ped_sub_fetch_done;

	
case pedsub_st is

When pedsub_idle =>
	if (ped_sub_start="01" and enable_i='1') then 
		sa_cnt<=0;
		pswfifo_en<='0';
		pedsub_st<=pedsub_wait_tmp2bram;
--		pedsub_st<=pedsub_sub;
	else 
	   pswfifo_en<='0';
		pedsub_st<=pedsub_idle;
	end if;
	
	
	 when pedsub_wait_tmp2bram=>
	   pswfifo_en<='0';
		if (tmp2bram_ctr/=x"00") then 
			start_tmp2bram_xfer<='0';
			pedsub_st<=pedsub_wait_tmp2bram;
		else
			pedsub_st<=pedsub_sub_pre;
		end if;
	
When pedsub_sub_pre =>
		pswfifo_d<=x"FE" & std_logic_vector(to_unsigned(dmx_asic,4)) & "00" & SMP_MAIN_CNT_i & std_logic_vector(to_unsigned(win_addr_start_i,9)) ;
		pswfifo_en<='1';
		if (calc_mode_i=x"0") then --peak search mode
			ct_lpv<=(others=> x"000");
		elsif (calc_mode_i=x"1") then --trough search mode
			ct_lpv<=(others=> x"FFF");
		end if;
		samem(0)<=(others=>'0');
		samem(1)<=(others=>'0');
		samem(2)<=(others=>'0');
		pedsub_st<=pedsub_sub;
		

When pedsub_sub=>--read from bram and send out to FIFO
	   pswfifo_en<='0';
		wav_bram_addrb<=std_logic_vector(to_unsigned(sa_cnt,11));
		ped_bram_addrb<=std_logic_vector(to_unsigned(sa_cnt,11));
 		pedsub_st<=pedsub_sub0;

When pedsub_sub0=>
	   pswfifo_en<='0';
		ct_ch<=to_integer(unsigned(wav_bram_addrb(10 downto 7)));
		ct_sa<=wav_bram_addrb(6 downto 0);
		if (mode="01") then 
--			sapedsub<=(to_signed(to_integer(unsigned(wav_doutb))-to_integer(unsigned(ped_doutb)),12 ));
			sapedsub<=(unsigned('0' & wav_doutb)+('0' & x"D48")-unsigned('0' & ped_doutb));
		end if;
		if (mode="10") then 
			sapedsub<=unsigned('0' & ped_doutb);
		end if;
		if (mode="11") then 
			sapedsub<=unsigned('0' & wav_doutb);
		end if;
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
		
		pswfifo_d<=x"BD" & '0' & std_logic_vector(to_unsigned(sa_cnt,11)) & std_logic_vector(sapedsub(11 downto 0));
		pswfifo_en<='1';
		if (ct_sa=x"7F") then -- reset buffer at the end of a channel
			samem(0)<=(others=>'0');
			samem(1)<=(others=>'0');
			samem(2)<=(others=>'0');
		end if;
		
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
		pswfifo_d<=x"CB" & std_logic_vector(to_unsigned(ct_cnt,4))  & '0' & std_logic_vector(ct_lpt(ct_cnt)(6 downto 0)) & std_logic_vector(ct_lpv(ct_cnt)(11 downto 0));-- charge and time
		ct_cnt<=ct_cnt+1;
		pswfifo_en<='1';
		pedsub_st<=pedsub_dumpct;

when pedsub_dump_trigrec =>
		pswfifo_d<=x"CF" & std_logic_vector(to_unsigned(dmx_asic,4)) & trgrec;
		pswfifo_en<='1';
		pedsub_st<=pedsub_dumpfooter;

when pedsub_dumpfooter=>
		pswfifo_en<='1';
		pswfifo_d<=x"E0F1E0F1";
		pedsub_st<=pedsub_dumpfooter2;
		
when pedsub_dumpfooter2=>
		pswfifo_en<='1';
		pswfifo_d<=x"FACEFACE";
		pedsub_st<=pedsub_idle;


when others=>
		pedsub_st<=pedsub_idle;
		
end case;





end if;


if (rising_edge(clk)) then

case st_tmp2bram is-- this is a side working FSM just to store and fill the temp sample in the BRAM array

when st_tmp2bram_waitstart =>
	if (start_tmp2bram_xfer='0') then
		tmp2bram_ctr<=x"00";
		st_tmp2bram<=st_tmp2bram_waitstart;
	else
		tmp2bram_ctr<=x"10";
		st_tmp2bram<=st_tmp2bram_check_ctr;
	end if;

when st_tmp2bram_check_ctr =>
	if (tmp2bram_ctr=x"00") then
		st_tmp2bram<= st_tmp2bram_waitstart;
		wav_bram_addra<="00000000000";
		wav_dina<=x"000";
		wav_wea<="0";
	else
			-- make sure BRAM is connected to this then read from temp array and fill BRAM
		tmp2bram_ctr<=std_logic_vector(to_unsigned(to_integer(unsigned(tmp2bram_ctr))-1,8));
		st_tmp2bram<= st_tmp2bram_store1;
	end if;

when 	st_tmp2bram_store1 =>

		if (to_integer(unsigned(tmp2bram_ctr))<16) then
			wav_bram_addra<=tmp2bram_ctr(3 downto 0) & jdx1;--(to_integer(unsigned(tmp2bram_ctr)));
			wav_dina<=wavarray_tmp(to_integer(unsigned(tmp2bram_ctr)));
			wav_wea<="1";
			else
			wav_bram_addra<="00000000000";
			wav_dina<=x"000";
			wav_wea<="0";
			
		end if;
		
		st_tmp2bram<= st_tmp2bram_store2;


when st_tmp2bram_store2 =>
	wav_bram_addra<="00000000000";
	wav_dina<=x"000";
	wav_wea<="0";
	st_tmp2bram<=st_tmp2bram_check_ctr;

-- put in different processes
end case;


end if;



end process;

bramtmp: process(clk)
begin


end process;






end Behavioral;

