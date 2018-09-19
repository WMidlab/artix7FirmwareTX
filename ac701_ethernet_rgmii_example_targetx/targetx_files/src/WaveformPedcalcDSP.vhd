----------------------------------------------------------------------------------
-- Company: UH Manoa - ID LAB
-- Engineer: Isar Mostafanezhad
-- 
-- Create Date:    13:06:51 10/16/2014 
-- Design Name:  WaveformPedcalcDSP
-- Module Name:    WaveformPedcalcDSP - Behavioral 
-- Project Name: 
-- Target Devices: SP6-SCROD rev A4, IDL_KLM_MB RevA (w SRAM)+BRAM
-- Tool versions: 
-- Description: 
--	Creates pedestals and stores in SRAM
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--   

--change vector indicies in peds2data0 and peds2data1 states to control max and res of mean deviation
--bram2_doutb(10 downto 7)
--max = (2**11)/128 = 16
--res = max/(2**numbits) = 1
--
-- debugging:
-- for some reason reading from srout_bram requires one wait state between giving adddress and using data,
-- while reading from bram2 requires two wait states, even though every thing else appears to be the same
-- (bram generator summary shows 2 clk cycle latency for both brams)
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;
Library work;
use work.readout_definitions.all;
use work.all;

--Read pedestals from shift register temporary RAM (bram_doutb and bram_addrb)
--PedRAMAccess converts data from 12 bit to 8 bit and writes to RAM

-- this will create pedestals for 4 consequetive windows starting with win_addr_start
entity WaveformPedcalcDSP is
port(
    clk		 			 : in   std_logic;
    reset			     : in std_logic; -- resets the waveform buffer in memory and the counter 
    enable				 : in std_logic; -- '0'= disable, '1'= enable
    navg			     : in std_logic_vector(3 downto 0);-- 2**navg= number of reads to average.
    --these 3 signals com form the ReadoutControl module and as soon as they are set and the SR Readout start is asserted, it goes and finds the proper pedestals from SRAM and populates buffer
    SMP_MAIN_CNT		 : in std_logic_vector(8 downto 0);-- just to keep track of the sampling window number being written to at the time of trigger
    asic_no				 : in std_logic_vector(3 downto 0);
    win_addr_start		 : in std_logic_vector (8 downto 0);-- start of a 4 window sequence of samples
    trigin				 : in std_logic; -- comes from the readout control module- hooked to the trigger
    busy			     : out std_logic;
    
    dmx_allwin_done	     : in std_logic;
    
    niter			     : out std_logic_vector(15 downto 0); -- route debug info out to top and then a SCROD reg 
    
    --waveform : 
    bram_doutb		     : in STD_LOGIC_VECTOR(19 DOWNTO 0);--:=x"000";
    bram_addrb	         : out std_logic_vector(10 downto 0);--:="00000000000";		
    
    bram2_doutb          : in std_logic_vector(19 downto 0);
    bram2_addrb          : out std_logic_vector(10 downto 0);  

	-- steal fifo signal from the srreadout module and demux 
	fifo_en		         : in  std_logic;
	fifo_clk		     : in  std_logic;
	fifo_din		     : in  std_logic_vector(31 downto 0);
		  
    -- 12 bit Pedestal RAM Access: only for writing pedestals
    ram_addr 	         : OUT  std_logic_vector(21 downto 0);
    ram_data 	         : OUT  std_logic_vector(7 downto 0);
    ram_update 	         : OUT  std_logic;
    ram_busy 	         : IN  std_logic
	);
end WaveformPedcalcDSP;

architecture Behavioral of WaveformPedcalcDSP is

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
	
--Latch to clock or trigin
signal asic_no_i			: integer;--std_logic_vector (3 downto 0);-- latched to trigin
signal win_addr_start_i	    : integer;--std_logic_vector (9 downto 0);
signal trigin_i			    : std_logic_vector(1 downto 0);
--signal ped_sa_num_i		: std_logic_vector(21 downto 0);
signal ped_sa_wval0		    : std_logic_vector(11 downto 0);
signal ped_sa_wval1		    : std_logic_vector(11 downto 0);

signal wval0temp            : std_logic_vector(16 downto 0):= (others => '0');
signal wval1temp            : std_logic_vector(16 downto 0):= (others => '0');
signal ped2_arr_addr        : std_logic_vector(10 downto 0):= (others => '0');
signal count                : std_logic_vector(4 downto 0):= (others => '0');

--signal ped_sa_wval0_tmp		: std_logic_vector(11 downto 0);
--signal ped_sa_wval1_tmp		: std_logic_vector(11 downto 0);
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
signal ped_sa				: integer:=1; --HERE
signal ped_sa6              : integer:=0; --ped_sa6*6 = what ped_sa would equal for second half of SM
signal ped_hbyte			: std_logic_vector(7 downto 0);
signal ped_hbword			: integer:=0;
signal ped_word				: std_logic_vector(16 downto 0);
signal dmx_asic				: integer:=0;
signal dmx_win				: integer:=0;
signal dmx2_win				: std_logic_vector(1 downto 0):="00";
signal dmx_ch				: integer:=0;
signal dmx_sa				: integer:=0;
signal dmx2_sa				: std_logic_vector(4 downto 0):="00000";
signal dmx_bit				: integer:=0;
signal fifo_din_i			: std_logic_vector(31 downto 0);
signal fifo_din_i2			: std_logic_vector(31 downto 0);
signal fifo_en_i			: std_logic:='0';
signal fifo_en_i2			: std_logic:='0';
signal enable_i				: std_logic:='0';
--signal start_ped_sub		: std_logic :='0';
signal sa_cnt				: integer 	:=0;
signal busy_i 				: std_logic:='0';
signal ped_sub_wr_busy 		: std_logic:='1';
signal navg_i				: std_logic_vector(3 downto 0):="0000";
signal reset_i				: std_logic_vector(1 downto 0):="00";
signal ncnt					: unsigned(7 downto 0):=x"00";
signal ncnt_i				: unsigned(7 downto 0):=x"00";-- decrement counter
signal ncnt_int				: unsigned(7 downto 0):=x"00";-- fixed
signal jdx_bram2tmp			: std_logic_vector(6 downto 0);
signal jdx_tmp2bram			: std_logic_vector(6 downto 0);
signal SMP_MAIN_CNT_i       : std_logic_vector(8 downto 0);

signal ped_wr_start			: std_logic_vector(1 downto 0):="00";

--signal wea			: std_logic;
--signal wea_0			: std_logic_vector(0 downto 0):="0";
--signal dina			: STD_LOGIC_VECTOR(19 DOWNTO 0);
--signal doutb		: STD_LOGIC_VECTOR(19 DOWNTO 0);
--signal bram_addra	: std_logic_vector(10 downto 0);
--signal bram_addrb	: std_logic_vector(10 downto 0);

signal start_tmp2bram_xfer  : std_logic:='0';
signal start_bram2tmp_xfer  : std_logic:='0';

signal tmp2bram_ctr	        : std_logic_vector(7 downto 0):=x"00";
signal bram2tmp_ctr	        : std_logic_vector(7 downto 0):=x"00";

signal pedarray_tmp			: WaveWideTempArray;
signal pedarray_tmp2		: WaveWideTempArray;-- added for pipelining
signal dmx_wav				: WaveTempArray:=(x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000");

signal dbg_tmp2             : std_logic :='0';


    attribute dont_touch : string;
    attribute dont_touch of dmx_asic : signal is "true";
    attribute dont_touch of ped_ch : signal is "true";
    attribute dont_touch of ped_win : signal is "true";
    attribute dont_touch of win_addr_start_i : signal is "true";
    attribute dont_touch of ped_sa : signal is "true";
    attribute dont_touch of ped_sa6 : signal is "true";
    attribute dont_touch of ped_sa_busy : signal is "true";    
    attribute dont_touch of count : signal is "true";    
    attribute dont_touch of wval0temp : signal is "true";    
    attribute dont_touch of wval1temp : signal is "true";    
    attribute dont_touch of ped_arr_addr : signal is "true";    
    attribute dont_touch of ped2_arr_addr : signal is "true";    
    
type dmx_state is -- demux state
(
    idle, -- waits for a trigger signal- basically idles. if this is the first trigger then automatically resets internal buffer 
    peds_wait_allwin_done,
    peds_write,
    pedswrpedaddr1,
    pedswrpedaddr2,
    pedswrpedaddr3,
    PedsWRPedVal_RDtmp1,
    PedsWRPedVal_RDtmp1wait,
    PedsWRPedVal_RDtmp2,
    PedsWRPedVal_RDtmp3,
    PedsWRPedVal_RDtmp3wait,
    PedsWRPedVal_RDtmp4,
    PedsWRPedVal,
    PedsWRPedVal2,
    PedsWRPedValWaitSRAM1,
    PedsWRPedValWaitSRAM2,
    PedsWRPedValWaitSRAM3,
    PedsWRCheckSample,
    PedsWRCheckWin,
    PedsWRCheckCH,
    peds2addrcalc, --second set of states for reading and writing mean deviation values
    peds2addr0,
    peds2addr0wait0,
    peds2addr0wait1,
    peds2data0,
    peds2wr0,
    peds2addr1,
    peds2addr1wait0,
    peds2addr1wait1,
    peds2data1,
    peds2wr1,
    peds2update,
    peds2updatewait1,
    peds2updatewait2,
    peds2checkbusy,
    peds2checksa,
    peds2checkwin,
    peds2checkch,
    PedsWRDone
);

    signal dmx_st					: dmx_state := idle;

begin

    --convert data and write to RAM
	Inst_PedRAMaccess: PedRAMaccess PORT MAP(
		clk           => clk,
		addr          => ped_sa_num,
		rval0         => open,
		rval1         => open,
		wval0         => ped_sa_wval0,
		wval1         => ped_sa_wval1,
		rw            => '1',-- write only
		update        => ped_sa_update,
		busy          => ped_sa_busy,
		ram_addr      => ram_addr,
		ram_datar     =>"00000000",
		ram_dataw     => ram_data,--"00000000",
		ram_rw        => open,--'0',
		ram_update    => ram_update,
		ram_busy      => ram_busy
	);

    --number of times pedestals are averaged
    ncnt <= x"01" when navg_i=x"0" else
			x"02" when navg_i=x"1" else
			x"04" when navg_i=x"2" else
			x"08" when navg_i=x"3" else
			x"10" when navg_i=x"4" else
			x"20" when navg_i=x"5" else
			x"40" when navg_i=x"6" else
			x"80" when navg_i=x"7" else
			x"00";

    latch_inputs: process(clk)
    begin
        --wea_0<=wea;
        busy<=busy_i;
        
        if (rising_edge(clk)) then
            niter(7 downto 0)<=std_logic_vector(ncnt_i);
            niter(14 downto 8)<=std_logic_vector(ncnt_int(6 downto 0));
            niter(15)<=dbg_tmp2;

        	navg_i<=navg;
        
        	reset_i(1)<=reset_i(0);
        	reset_i(0)<=reset;
        
        	fifo_en_i<=fifo_en;
        	fifo_din_i<=fifo_din;
        	enable_i<=enable;
        	
        	trigin_i(1)<=trigin_i(0);
        	trigin_i(0)<=trigin;
        
        	-- give it enough time till the win addr and other information become available
        	if (trigin_i(1 downto 0) = "01") then
        		SMP_MAIN_CNT_i<=SMP_MAIN_CNT;
        	end if;
	
        	if (trigin_i="01") then
        		asic_no_i<=to_integer(unsigned(asic_no));
        		win_addr_start_i<=to_integer(unsigned(win_addr_start));
                --ncnt(conv_integer(unsigned(navg)))<='1';
        		dmx_asic<=to_integer(unsigned(asic_no));
        	end if;
	   end if;
    end process;

    parse_inpur_packet: process (clk)
    begin
        if (rising_edge(clk)) then

        end if;
    end process;

--write pedestals
process(clk)
begin

    if (rising_edge(clk)) then
    	--start_ped_sub<='0';
    	ped_wr_start(1)<=ped_wr_start(0);
    	ped_wr_start(0)<=dmx_allwin_done;
	
        case dmx_st is
            when idle =>
        	    -- this reset needs more work
        	    bram_addrb<="00000000000";
        	    busy_i<='0';
                --	if(reset_i="01") then -- force reset and then got to idle and wait for trigger
                --		dmx_st<=idle;	
                --	end if;
        	    if (trigin_i="01" and enable_i='1') then
        	       dmx_st<=peds_wait_allwin_done;
        		   busy_i<='1';
        		else 
        		   dmx_st<=idle;	
        	    end if;
        	    
        	When peds_wait_allwin_done =>
        	    if (reset_i="01") then
    		        dmx_st<=idle;
    	        else
    	            --rising edge of dmx_allwin_done
    		        if (ped_wr_start="01" ) then
    		            dmx_st<=peds_write;
    			    else 
    			        dmx_st<=peds_wait_allwin_done;
            		end if;
                end if;
    	
        	When peds_write =>
        	    if (enable_i='1') then
        	    	ped_asic<=dmx_asic-1;
        	    	ped_ch  <=0;
        	    	ped_win <=0;
        	    	ped_sa  <=1; --HERE
        	    	dmx_st<=PedsWRPedAddr1;
        	    else 
        	    	dmx_st<=idle;
        	    end if ;
    
        	When PedsWRPedAddr1 =>
        		ped_sub_wr_busy<='1';
        		ped_sa_num(21 downto 18)<=std_logic_vector(to_unsigned(dmx_asic-1,4));--		: std_logic_vector(21 downto 0);
        		ped_sa_num(17 downto 14)<=std_logic_vector(to_unsigned(ped_ch,4));--		: std_logic_vector(21 downto 0);
        		ped_sa_num(13 downto 5) <=std_logic_vector(to_unsigned(ped_win+win_addr_start_i,9));
        		ped_sa_num(4  downto 0) <=std_logic_vector(to_unsigned(ped_sa,5));
        		dmx_st<=PedsWRPedAddr2;	
        	
        	--calculate address to write to
        	When PedsWRPedAddr2 =>
        		ped_arr_addr<=ped_sa_num(17 downto 14) & std_logic_vector(to_unsigned(ped_win,2)) & ped_sa_num(4 downto 0);
        		dmx_st<=PedsWRPedAddr3;	
    
            --split address
        	When PedsWRPedAddr3 =>
        		ped_arr_addr0_int<=  to_integer(unsigned(ped_arr_addr));
        		ped_arr_addr1_int<=1+to_integer(unsigned(ped_arr_addr));
        		dmx_st<=PedsWRPedVal_RDtmp1;
        	
        	--first address
        	when PedsWRPedVal_RDtmp1=>
        		bram_addrb<=ped_arr_addr;
        		dmx_st<=PedsWRPedVal_RDtmp1wait;
        
        	when PedsWRPedVal_RDtmp1wait=>
        	    dmx_st<=PedsWRPedVal_RDtmp2;
        	
        	--first word
        	when PedsWRPedVal_RDtmp2=>
        		ped_sa_wval0<=bram_doutb((11+to_integer(unsigned(navg_i))) downto (0+to_integer(unsigned(navg_i)))); --divide by navg
        		dmx_st<=PedsWRPedVal_RDtmp3;
        
            --second address
        	when PedsWRPedVal_RDtmp3=>
        		bram_addrb<=std_logic_vector(to_unsigned(ped_arr_addr1_int,11));
        		dmx_st<=PedsWRPedVal_RDtmp3wait;
        	
        	when PedsWRPedVal_RDtmp3wait=>
        		dmx_st<=PedsWRPedVal_RDtmp4;
    	
    	    --second word
        	when PedsWRPedVal_RDtmp4=>
        		ped_sa_wval1<=bram_doutb((11+to_integer(unsigned(navg_i))) downto (0+to_integer(unsigned(navg_i)))); --divide by navg
        		dmx_st<=PedsWRPedVal2;
    				
    	    --start write
        	When PedsWRPedVal2 =>
        		ped_sa_update<='1';
        		dmx_st<=PedsWRPedValWaitSRAM1;
        
        	When PedsWRPedValWaitSRAM1 =>
        		--wait for ram_busy to come up
        		dmx_st<=PedsWRPedValWaitSRAM2;
        
        	When PedsWRPedValWaitSRAM2 =>
        		--wait for ram_busy to come up
        		dmx_st<=PedsWRPedValWaitSRAM3;
        
        	When PedsWRPedValWaitSRAM3 =>
        		ped_sa_update<='0';
        		if (ped_sa_busy='1') then
        			dmx_st<=PedsWRPedValWaitSRAM3;
        		else
        		    ped_sa<=ped_sa+2;
        			dmx_st<=PedsWRCheckSample;
        		end if;
    
            --repeat for all samples in window (32/2 = 16 iterations)
        	When PedsWRCheckSample=>
        		if (ped_sa<=NSamplesPerWin) then --HERE
        			dmx_st<=PedsWRPedAddr1;
        		else
        			ped_sa<=1; --HERE
        			ped_win<=ped_win+1;
        			dmx_st<=PedsWRCheckWin;
        		end if;
            --repeat for all (4) windows
        	When PedsWRCheckWin=>
        		if (ped_win<NWWin) then
        			dmx_st<=PedsWRPedAddr1;
        		else
        			ped_win<=0;
        			ped_ch<=ped_ch+1;
        			dmx_st<=PedsWRCheckCH;
        		end if;
        	--repeat for all (16) channels
        	--if done, start writing mean deviation values
        	When PedsWRCheckCH=>
        		if (ped_ch=NCHPerTX) then
        			--dmx_st<=PedsWRDone;
        			dmx_st <= peds2addrcalc;
        			ped_sa6 <= 0;
        			ped_win <= 0;
        			ped_ch <= 0;
        		else
        			dmx_st<=PedsWRPedAddr1;
        		end if;
        		
    		--added following states to write mean deviation values to RAM 
    		--calculate bram address to read from and ram address to write to
            When peds2addrcalc =>
                --ped_sa_num(21 downto 18)<=std_logic_vector(to_unsigned(dmx_asic-1,4));--        : std_logic_vector(21 downto 0);
                ped_sa_num(21 downto 18) <= "0001"; --only 1 asic, write to addresses starting here, change if multiple asics
                --ped_sa_num(17 downto 0) <= std_logic_vector(to_unsigned(512*12*ped_ch + 12*(ped_win+win_addr_start_i) + ped_sa6*2, 18));
                --ped2_arr_addr <= std_logic_vector(to_unsigned(ped_ch, 4)) & std_logic_vector(to_unsigned(ped_win, 2)) & std_logic_vector(to_unsigned(6*ped_sa6, 5));
				ped_sa_num(17 downto 13) <= "00000";
				ped_sa_num(12 downto 0) <= std_logic_vector(to_unsigned(512*ped_ch+ped_win+win_addr_start_i, 13)); --only write to SRAM once per window
				ped2_arr_addr <= std_logic_vector(to_unsigned(ped_ch, 4)) & std_logic_vector(to_unsigned(ped_win, 2)) & "00000";
				wval0temp <= (others => '0');
				wval1temp <= (others => '0');
                dmx_st <= peds2addr0;
            --request data from bram
            When peds2addr0 =>
                bram2_addrb <= std_logic_vector(unsigned(ped2_arr_addr)+unsigned(count));
                dmx_st <= peds2addr0wait0;
            --wait
            When peds2addr0wait0 =>
                dmx_st <= peds2addr0wait1;
            --wait an extra clk cycle?
            When peds2addr0wait1 =>
                dmx_st <= peds2data0;
            --sum data for window 0 or 2
			When peds2data0 =>
				wval0temp <= std_logic_vector(unsigned(wval0temp)+unsigned(bram2_doutb(18 downto 7)));
				if unsigned(count) = 31 then
					count <= (others => '0');
					dmx_st <= peds2wr0;
				else
					count <= std_logic_vector(unsigned(count)+1); --count samples
					dmx_st <= peds2addr0;
				end if;	
            --set data on wval0
            When peds2wr0 =>
                ped_sa_wval0 <= wval0temp(11 downto 0); --wval0temp(16 downto 5); --SW divides by 32 right now
                dmx_st <= peds2addr1;
            --request data from bram
            When peds2addr1 =>
                bram2_addrb <= std_logic_vector(unsigned(ped2_arr_addr)+32+unsigned(count));
                dmx_st <= peds2addr1wait0;
            --wait
            When peds2addr1wait0 =>  
                dmx_st <= peds2addr1wait1;
            --wait an extra clock cycle?
            When peds2addr1wait1 =>
                dmx_st <= peds2data1;
			When peds2data1 =>
				wval1temp <= std_logic_vector(unsigned(wval1temp)+unsigned(bram2_doutb(18 downto 7)));
				if unsigned(count) = 31 then
					count <= (others => '0');
					dmx_st <= peds2wr1;
				else
					count <= std_logic_vector(unsigned(count)+1); --count samples
					dmx_st <= peds2addr1;
				end if;
            --set data on wval1
            When peds2wr1 =>
                ped_sa_wval1 <= wval1temp(11 downto 0); --wval1temp(16 downto 5); --SW divides by 32 right now
                dmx_st <= peds2update;
            --send update signal
            When peds2update =>
                ped_sa_update <= '1';
                wval0temp <= (others => '0');
                wval1temp <= (others => '0');
                dmx_st <= peds2updatewait1;
            --wait
            When peds2updatewait1 =>
                dmx_st <= peds2updatewait2;
            --wait
            When peds2updatewait2 =>
                dmx_st <= peds2checkbusy;
            --check if ram busy
            When peds2checkbusy =>
                ped_sa_update <= '0';
                if (ped_sa_busy = '1') then
                    dmx_st <= peds2checkbusy;
                else
					ped_win <= ped_win+2;
                    dmx_st <= peds2checkwin;
                end if;
            --count pair of windows
            When peds2checkwin =>
                if (ped_win < 4) then
                    dmx_st <= peds2addrcalc;
                else
                    ped_win <= 0;
                    ped_ch <= ped_ch+1;
                    dmx_st <= peds2checkch;
                end if;
            --count 16 channels
            When peds2checkch =>
        		if (ped_ch = NCHPerTX) then
                    --dmx_st<=PedsWRDone;
                    dmx_st <= pedswrdone;
                    ped_win <= 0;
                    ped_ch <= 0;
                else
                    dmx_st <= peds2addrcalc;
                end if;
            When PedsWRDone =>
            	ped_sub_wr_busy<='0';
            	--get ready for next round and go to idle- this will help avoiding having to push reset everytime
            	ncnt_i	<=ncnt;
            	ncnt_int	<=ncnt;
            	dmx_st<=idle;--wait for trigger
            --done wring pedestals
            
            When others =>
            	dmx_st<=idle;
        end case;
	end if;
end process;

end Behavioral;

