----------------------------------------------------------------------------------
-- Company: UH Manoa
-- Engineer: Isar Mostafanezhad
-- 
-- Create Date:    10:53:30 08/19/2015 
-- Design Name: KLM-Scintillator readout using ethernet
-- Module Name:    ethernet_readout_interface - Behavioral 
-- Project Name: 
-- Target Devices: 
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
use work.readout_definitions.all;
use work.autoinit_definitions.all;

entity ethernet_readout_interface is
	Generic (
		DAQ_IFACE : string :="Ethernet"
	);
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           wave_fifo_wr_en : in  STD_LOGIC;
           wave_fifo_data : in  STD_LOGIC_VECTOR (31 downto 0);
           wave_fifo_reset : in  STD_LOGIC;
           wave_fifo_event_rdy : in  STD_LOGIC;
			  
		OUTPUT_REGISTERS            : out GPR;
		INPUT_REGISTERS             : in  RR;
		------------------WRITE TRIGGERS-------------
		REGISTER_UPDATED            : out RWT;

		tx_dac_busy							: in std_logic;
		pedman_busy							: in std_logic;
		mppc_dac_busy						: in std_logic;

	kpp_tx_fifo_clk				: out std_logic;
	kpp_tx_fifo_re				: out std_logic;
	kpp_tx_fifo_do				: in std_logic_vector(7 downto 0);
	kpp_tx_fifo_epty			:in std_logic;
	kpp_tx_fifo_aepty			:in std_logic;
--		conc_intfc_tx_dst_rdy_n     : out std_logic;      				 
--		conc_intfc_tx_sof_n         : in std_logic;     				 
--		conc_intfc_tx_eof_n         : in std_logic;    				 
--		conc_intfc_tx_src_rdy_n     : in std_logic;    				 
--		conc_intfc_tx_data          : in std_logic_vector(15 downto 0); 

		rcl_fifo_rd_en			 			: out std_logic;
		rcl_fifo_data						: in std_logic_vector(31 downto 0);
		rcl_fifo_empty					 	: in std_logic;
		ctrl_mode							:out std_logic_vector(3 downto 0); --x"0"= USB has control, x"1"= PocketDAQ controlled readout,x"2" Ethernet controlled readout,...
		  
			  
		mgttxfault                  : in std_logic;
		mgtmod0                     : in std_logic;
		mgtlos                      : in std_logic;
		mgttxdis                    : out std_logic;
		mgtmod2                     : out std_logic;
		mgtmod1                     : out std_logic;
		mgtrxp                      : in std_logic;
		mgtrxn                      : in std_logic;
		mgttxp                      : out std_logic;
		mgttxn                      : out std_logic;
		mgtclk1p                    : in std_logic;
		mgtclk1n                    : in std_logic
			  
			  
			  );
end ethernet_readout_interface;

architecture Behavioral of ethernet_readout_interface is

signal tx_udp_data_i:std_logic_vector(7 downto 0);
signal tx_udp_valid_i:std_logic;
signal tx_udp_ready_i:std_logic;
signal rx_udp_data_i:std_logic_vector(7 downto 0);
signal wave_fifo_dout:std_logic_vector(7 downto 0);
signal stat_fifo_dout:std_logic_vector(7 downto 0);
signal stat_fifo_din:std_logic_vector(31 downto 0);
signal wave_fifo_din:std_logic_vector(31 downto 0);
signal fifo_select:std_logic_vector(3 downto 0):=x"0";
signal stat_fifo_rd_en:std_logic;
signal stat_fifo_empty:std_logic;
signal tx_fifo_rd_en:std_logic;
signal tx_fifo_empty:std_logic;
signal tx_fifo_empty_q1:std_logic;
signal stat_fifo_wr_en:std_logic;
signal stat_fifo_data_rdy:std_logic;
signal RR_val:std_logic_vector(15 downto 0);
signal R_val:std_logic_vector(15 downto 0);
signal stat_cnt:integer:=0;
signal stat_cnt_end:integer:=0;

signal rx_udp_valid_i:std_logic;
signal udp_usr_clk:std_logic;
signal wave_fifo_rd_en:std_logic;
signal cmd_fifo_rd_en:std_logic;
signal cmd_fifo_empty:std_logic;
signal cmd_fifo_dout:std_logic_vector(31 downto 0);

signal wave_fifo_empty:std_logic;
signal wave_fifo_event_rdy_udp:std_logic_vector(1 downto 0);
signal stat_fifo_data_rdy_udp:std_logic_vector(1 downto 0);
type tx_fifo_st_type is (tx_fifo_st_idle, tx_fifo_st_check_ready,tx_fifo_st_wait_data_rdy, tx_fifo_st_xfer,tx_fifo_st_wait_data_rdy2,tx_fifo_st_xfer2,tx_fifo_st_zeropad1,tx_fifo_st_zeropad2);
signal tx_fifo_st : tx_fifo_st_type := tx_fifo_st_idle;
signal cnt1:integer:=0;
signal cnt1_start:integer:=100000000;
signal wav_evt_cnt:integer:=0;
signal stat_data_cnt:integer:=0;

	type proc_rcl_st is (rcl_check_empty,rcl_load,rcl_load0,rcl_load1, rcl_proc,rcl_downcnt,rcl_asic_reg_wait,rcl_asic_reg_wait1,rcl_asic_reg_wait2,rcl_asic_reg_wait3
								, rcl_dac_wait,rcl_dac_wait2,rcl_dac_wait3,rcl_send_stat_word,
								rcl_send_stat_word_loop0,rcl_send_stat_word_loop1,rcl_send_stat_word_loop2,rcl_send_stat_word1,rcl_send_stat_word2,rcl_send_stat_word3,rcl_send_stat_word4,rcl_send_stat_word5); 
   signal rcl_st : proc_rcl_st := rcl_check_empty;
	signal rcl_fifo_data_i:std_logic_vector(31 downto 0);
	signal rcl_wd1:std_logic_vector(15 downto 0);
	signal rcl_wd2:std_logic_vector(15 downto 0);
	signal rcl_cnt:integer:=0;
		signal internal_GPR_rcl					 :	GPR;
			signal internal_RR                   : RR;
	signal rcl_asic_num: integer:=0;
	signal cmd_fifo_reset:std_logic;
	signal  rx_udp_data_i_q6:std_logic_vector(7 downto 0);
	signal  rx_udp_data_i_q5:std_logic_vector(7 downto 0);
	signal  rx_udp_data_i_q4:std_logic_vector(7 downto 0);
	signal  rx_udp_data_i_q3:std_logic_vector(7 downto 0);
	signal  rx_udp_data_i_q2:std_logic_vector(7 downto 0);
	signal  rx_udp_data_i_q1:std_logic_vector(7 downto 0);
	signal  rx_udp_data_i_q0:std_logic_vector(7 downto 0);
	signal rx_udp_valid_i_q6:std_logic;
	signal rx_udp_valid_i_q5:std_logic;
	signal rx_udp_valid_i_q4:std_logic;
	signal rx_udp_valid_i_q3:std_logic;
	signal rx_udp_valid_i_q2:std_logic;
	signal rx_udp_valid_i_q1:std_logic;
	signal rx_udp_valid_i_q0:std_logic;
	signal rx_udp_sync:std_logic_vector(63 downto 0);
	signal cmd_fifo_reset_q:std_logic_vector(3 downto 0);
	signal register_updated_i : RWT;
	signal tx_dac_busy_i:std_logic;
	signal mppc_dac_busy_i:std_logic;

	constant STAT_FIFO_SEL : std_logic_vector(3 downto 0):=x"1";
	constant WAVE_FIFO_SEL : std_logic_vector(3 downto 0):=x"2";
	constant KPP_FIFO_SEL  : std_logic_vector(3 downto 0):=x"3";
	constant ZPAD_FIFO_SEL	:std_logic_vector(3 downto 0):=x"4";
	
	attribute keep : string;
	attribute keep of udp_usr_clk :signal  is "true";
	attribute keep of fifo_select :signal  is "true";
	
--	attribute dont_touch of cmd_fifo_reset_q : signal is "true";
--	attribute dont_touch of cmd_fifo_reset : signal is "true";
	
begin

kpp_tx_fifo_clk<=udp_usr_clk;

	OUTPUT_REGISTERS <= internal_GPR_rcl;
	internal_RR <= INPUT_REGISTERS;
	REGISTER_UPDATED<=register_updated_i;
	
	gen_udp_block: if (DAQ_IFACE="Ethernet") generate
	
u_eth_top: entity work.eth_top PORT MAP(
      ext_user_clk=>clk,
	   tx_udp_data              =>tx_udp_data_i,
		tx_udp_valid            =>tx_udp_valid_i,
		tx_udp_ready            =>tx_udp_ready_i,
	   rx_udp_data              =>rx_udp_data_i,
		rx_udp_valid            =>rx_udp_valid_i,
		rx_udp_ready            =>'1',
		trx_udp_clock			=>udp_usr_clk,

		mgttxfault =>mgttxfault ,
		mgtmod0 => mgtmod0,
		mgtlos =>mgtlos ,
		mgttxdis =>mgttxdis,
		mgtmod2 => mgtmod2,
		mgtmod1 => mgtmod1,
		mgtrxp => mgtrxp,
		mgtrxn => mgtrxn,
		mgttxp =>mgttxp ,
		mgttxn =>mgttxn ,
		mgtclk1p => mgtclk1p,
		mgtclk1n => mgtclk1n
	);

	u_udp_cmdrx_wr8rd32 : entity work.udp_cmdrx_wr8rd32
  PORT MAP (
    rst => cmd_fifo_reset,
    wr_clk => udp_usr_clk,
    rd_clk => clk,
    din => rx_udp_data_i_q6,
    wr_en => rx_udp_valid_i_q6,
    rd_en => cmd_fifo_rd_en,
    dout => cmd_fifo_dout,
    full => open,
    empty => cmd_fifo_empty
  );
cmd_fifo_reset<=cmd_fifo_reset_q(0) or cmd_fifo_reset_q(1) or cmd_fifo_reset_q(2) or cmd_fifo_reset_q(3);
 end generate;

--gen_rcl_signals: if (DAQ_IFACE/="Ethernet") generate
--		rcl_fifo_rd_en<=cmd_fifo_rd_en;
--		rcl_fifo_data=>cmd_fifo_dout;
--		rcl_fifo_empty=>cmd_fifo_empty;
--
--end generate;
	


u_udp_wavtx_fifo_w32r8 : entity work.udp_wavtx_fifo_w32r8
  PORT MAP (
    rst => wave_fifo_reset,
    wr_clk => clk,
    rd_clk => udp_usr_clk,
    din => wave_fifo_data,
    wr_en => wave_fifo_wr_en,
    rd_en => wave_fifo_rd_en,
    dout => wave_fifo_dout,
    full => open,
    empty => wave_fifo_empty,
    valid => open
  );
 
u_udp_stattx_fifo_w32r8 : entity work.udp_stattx_fifo_wr32r8
  PORT MAP (
    rst => wave_fifo_reset,
    wr_clk => clk,
    rd_clk => udp_usr_clk,
    din => stat_fifo_din,
    wr_en => stat_fifo_wr_en,
    rd_en => stat_fifo_rd_en,
    dout => stat_fifo_dout,
    full => open,
    empty => stat_fifo_empty
 --   valid => open
  );
 
--MUX between Wave TX and Stat TX
tx_udp_data_i	<=	stat_fifo_dout when fifo_select=STAT_FIFO_SEL else 
					wave_fifo_dout when fifo_select=WAVE_FIFO_SEL else 
					kpp_tx_fifo_do when fifo_select=KPP_FIFO_SEL  else
					x"00"			when fifo_select=ZPAD_FIFO_SEL
					else x"A1";
stat_fifo_rd_en	<=tx_fifo_rd_en 	when fifo_select=STAT_FIFO_SEL else '0';
wave_fifo_rd_en	<=tx_fifo_rd_en 	when fifo_select=WAVE_FIFO_SEL else '0';
kpp_tx_fifo_re		<=tx_fifo_rd_en 	when fifo_select=KPP_FIFO_SEL else '0';
tx_fifo_empty	<=stat_fifo_empty 	when fifo_select=STAT_FIFO_SEL else wave_fifo_empty when fifo_select=WAVE_FIFO_SEL else kpp_tx_fifo_epty when fifo_select=KPP_FIFO_SEL else '1';
 
--tx_udp_valid_i<=not tx_fifo_empty_q1 when tx_fifo_st=tx_fifo_st_xfer else '0';-- original, before adding the Conc_intface fifo
--tx_udp_valid_i	<=not tx_fifo_empty_q1 when tx_fifo_st=tx_fifo_st_xfer2 else 
--					'1' when tx_fifo_st=tx_fifo_st_xfer or tx_fifo_st=tx_fifo_st_wait_data_rdy2 else '0';
tx_udp_valid_i<='1' when tx_fifo_st=tx_fifo_st_xfer or tx_fifo_st=tx_fifo_st_wait_data_rdy2 or tx_fifo_st=tx_fifo_st_xfer2 or tx_fifo_st=tx_fifo_st_zeropad1 or tx_fifo_st=tx_fifo_st_zeropad2 else '0';

proc_tx_fifo_manage:process(udp_usr_clk)

begin
	if rising_edge(udp_usr_clk) then
		wave_fifo_event_rdy_udp<=wave_fifo_event_rdy_udp(0) & wave_fifo_event_rdy;
		stat_fifo_data_rdy_udp<=stat_fifo_data_rdy_udp(0) & stat_fifo_data_rdy;
	end if;

if rising_edge(udp_usr_clk) then

	if (wave_fifo_event_rdy_udp="01") then 
		wav_evt_cnt<=wav_evt_cnt+1;
	end if;

	if (stat_fifo_data_rdy_udp="01") then 
		stat_data_cnt<=stat_data_cnt+1;
	end if;
	
	tx_fifo_empty_q1<=tx_fifo_empty;
	
	

	case(tx_fifo_st) is

	when tx_fifo_st_idle =>
		tx_fifo_rd_en<='0';
		--tx_udp_valid_i<='0';
		cnt1<=cnt1_start;
		if (wav_evt_cnt/=0) then
			tx_fifo_st<=tx_fifo_st_check_ready;
			fifo_select<=WAVE_FIFO_SEL;
		elsif (stat_data_cnt/=0) then 
			tx_fifo_st<=tx_fifo_st_check_ready;
			fifo_select<=STAT_FIFO_SEL;
		else 
			tx_fifo_st<=tx_fifo_st_idle;
		end if;
	
	when tx_fifo_st_check_ready =>
		--tx_udp_valid_i<='0';
		if (tx_udp_ready_i='1') then
			tx_fifo_rd_en<='1';
			tx_fifo_st<=tx_fifo_st_wait_data_rdy;
		else 
			tx_fifo_rd_en<='0';
			cnt1<=cnt1-1;
			if (cnt1/=1) then 
				tx_fifo_st<=tx_fifo_st_check_ready;-- wait until ready comes up
			else
				tx_fifo_st<=tx_fifo_st_idle;-- if ready doesnt come up in time, time out and go to idle to wait for next event. -- the fifo will become stale at this point
			end if;
		end if;

	when tx_fifo_st_wait_data_rdy =>
		tx_fifo_rd_en<='1';
		tx_fifo_st<=tx_fifo_st_xfer;

	
	when tx_fifo_st_xfer =>
		tx_fifo_rd_en<='1';
		--tx_udp_valid_i<='1';
		if (tx_fifo_empty_q1='0' and tx_udp_ready_i='1') then 
			tx_fifo_st<=tx_fifo_st_xfer;
		else-- done with xfer, go to idle 
			if (fifo_select=WAVE_FIFO_SEL) then -- we were xfering wave, so reset the wave counter and send the stuff from Conc Interface
				wav_evt_cnt<=0;
				fifo_select<=KPP_FIFO_SEL;
				tx_fifo_st<=tx_fifo_st_wait_data_rdy2;
			elsif (fifo_select=STAT_FIFO_SEL) then 
				stat_data_cnt<=0;
				tx_fifo_st<=tx_fifo_st_idle;
			else 
				tx_fifo_st<=tx_fifo_st_idle;
			end if;
		end if;

	when tx_fifo_st_wait_data_rdy2 =>
		tx_fifo_rd_en<='1';
		tx_fifo_st<=tx_fifo_st_xfer2;

	when tx_fifo_st_xfer2 =>-- now send the data that the conc_intfc has prepared in the fifo
		tx_fifo_rd_en<='1';
		if (tx_fifo_empty_q1='0' and tx_udp_ready_i='1') then 
			tx_fifo_st<=tx_fifo_st_xfer2;
		else-- done with xfer, go to idle 
			fifo_select<=ZPAD_FIFO_SEL;
			tx_fifo_st<=tx_fifo_st_zeropad1;
		end if;

	when tx_fifo_st_zeropad1 =>
		tx_fifo_rd_en<='1';
		tx_fifo_st<=tx_fifo_st_zeropad2;

	when tx_fifo_st_zeropad2 =>
		tx_fifo_rd_en<='1';
		tx_fifo_st<=tx_fifo_st_idle;

	end case;

end if;


end process;

proc_sync_cmd_hdr: process (udp_usr_clk) 

begin
	if rising_edge(udp_usr_clk) then
		rx_udp_data_i_q6<=rx_udp_data_i_q5;
		rx_udp_data_i_q5<=rx_udp_data_i_q4;
		rx_udp_data_i_q4<=rx_udp_data_i_q3;
		rx_udp_data_i_q3<=rx_udp_data_i_q2;
		rx_udp_data_i_q2<=rx_udp_data_i_q1;
		rx_udp_data_i_q1<=rx_udp_data_i_q0;
		rx_udp_data_i_q0<=rx_udp_data_i;
		
	
--		if (rx_udp_valid_i='1') then
--			rx_udp_sync<=rx_udp_sync(55 downto 0) & rx_udp_data_i;
--		else
--			rx_udp_sync<=(others=>'0');
--		end if;

	
--		if (rx_udp_sync=x"53594e43") then --"SYNC"
		if (rx_udp_data_i=x"43" and rx_udp_data_i_q0=x"4e" and rx_udp_data_i_q1=x"59" and rx_udp_data_i_q2=x"53") then --"SYNC"
			cmd_fifo_reset_q <=cmd_fifo_reset_q(2 downto 0) & '1';
			rx_udp_valid_i_q6<='0';
			rx_udp_valid_i_q5<='0';
			rx_udp_valid_i_q4<='0';
			rx_udp_valid_i_q3<='0';
			rx_udp_valid_i_q2<='0';
			rx_udp_valid_i_q1<='0';
			rx_udp_valid_i_q0<='0';
		else
			cmd_fifo_reset_q <=cmd_fifo_reset_q(2 downto 0) & '0';
			rx_udp_valid_i_q6<=rx_udp_valid_i_q5;
			rx_udp_valid_i_q5<=rx_udp_valid_i_q4;
			rx_udp_valid_i_q4<=rx_udp_valid_i_q3;
			rx_udp_valid_i_q3<=rx_udp_valid_i_q2;
			rx_udp_valid_i_q2<=rx_udp_valid_i_q1;
			rx_udp_valid_i_q1<=rx_udp_valid_i_q0;
			rx_udp_valid_i_q0<=rx_udp_valid_i;
		end if;
			
	end if;

end process;

  
	rcl_wd1<=rcl_fifo_data_i(31 downto 16);
	rcl_wd2<=rcl_fifo_data_i(15 downto 0 );

proc_runctrl_regs:process(clk) begin

	if (rising_edge(clk)) then
	mppc_dac_busy_i<=mppc_dac_busy;
	tx_dac_busy_i<=tx_dac_busy;
--		internal_GPR_rcl
		case rcl_st is

			when rcl_check_empty =>
				stat_fifo_wr_en<='0';
				stat_fifo_data_rdy<='0';
				register_updated_i<=(others=>'0');
				if (cmd_fifo_empty='1') then
					cmd_fifo_rd_en<='0';
					rcl_st<=rcl_check_empty;
				else 
					cmd_fifo_rd_en<='1';
					rcl_st<=rcl_load;
				end if;
				
			when rcl_load =>
				cmd_fifo_rd_en<='0';
				rcl_st<=rcl_load0;

			when rcl_load0 =>
				rcl_st<=rcl_load1;
			
			when rcl_load1 =>
				rcl_fifo_data_i<=cmd_fifo_dout;
				rcl_st<=rcl_proc;
			
			when rcl_proc =>
				if 	(rcl_wd1=x"AE00") then -- wait command: wait for a certain count
					rcl_cnt<=to_integer(unsigned(rcl_wd2))*256;
					rcl_st<=rcl_downcnt;
--				elsif (rcl_wd1=x"AE10") then --wait command: until ped_manager busy goes low -- this code needs work, there is no handshake possible in this setting
				elsif (rcl_wd1(15 downto 8)=x"AF") then --program scrod reg
					internal_GPR_rcl(to_integer(unsigned(rcl_wd1(7 downto 0))))<=rcl_wd2;
					register_updated_i(to_integer(unsigned(rcl_wd1(7 downto 0))))<='1';
					rcl_st<=rcl_check_empty;

				elsif (rcl_wd1(15 downto 8)=x"AD") then --inuire about the value of a certain SCROD register
					RR_val<=internal_RR(to_integer(unsigned(rcl_wd1(7 downto 0))));
					rcl_st<=rcl_send_stat_word;
					
				elsif (rcl_wd1(15 downto 12)=x"B") then -- Command to program a TXDC Reg
					internal_GPR_rcl(1)<=x"0000";
					internal_GPR_rcl(2)<="00000000" & rcl_wd1(7 downto 0);
					internal_GPR_rcl(3)<=rcl_wd2;
					rcl_asic_num<=to_integer(unsigned(rcl_wd1(11 downto 8)));
					internal_GPR_rcl(4)<=x"0000";
					register_updated_i(4 downto 1)<="1111";
					rcl_st<=rcl_asic_reg_wait;					
					
				elsif (rcl_wd1(15 downto 8)=x"C0") then -- Command to program a trim DAC
					internal_GPR_rcl(60)<=rcl_wd1(7 downto 0) & rcl_wd2(7 downto 0);
					internal_GPR_rcl(63)(10)<='0';
					register_updated_i(60)<='1';
					register_updated_i(63)<='1';
				rcl_st<=rcl_dac_wait;					
				else 
						rcl_st<=rcl_check_empty; --unknown command- skip!
				end if;
			
			when rcl_downcnt =>
				register_updated_i<=(others=>'0');
				if (rcl_cnt/=0) then
					rcl_cnt<=rcl_cnt-1;
					rcl_st<=rcl_downcnt;
				else
					rcl_st<=rcl_check_empty;
				end if;
	
			when rcl_asic_reg_wait =>
				internal_GPR_rcl(4)(rcl_asic_num)<='1';
				rcl_st<=rcl_asic_reg_wait1;

			when rcl_asic_reg_wait1 =>
				internal_GPR_rcl(1)<=x"0001";
				rcl_st<=rcl_asic_reg_wait2;
			
			when rcl_asic_reg_wait2	 =>
				if (tx_dac_busy_i='0') then 
					rcl_st<=rcl_asic_reg_wait2;
				else
					rcl_st<=rcl_asic_reg_wait3;
				end if;
			
			when rcl_asic_reg_wait3=> --wait for busy signal to go down
				internal_GPR_rcl(1)<=x"0000";
				if (tx_dac_busy_i='1') then 
					rcl_st<=rcl_asic_reg_wait2;
				else
					rcl_st<=rcl_check_empty;
				end if;

			when rcl_dac_wait =>
				internal_GPR_rcl(63)(10)<='1';
				rcl_st<=rcl_dac_wait2;

			when rcl_dac_wait2 =>
				if (mppc_dac_busy_i='0') then 
					rcl_st<=rcl_dac_wait2;
				else
					rcl_st<=rcl_dac_wait3;
				end if;

			when rcl_dac_wait3 =>
				internal_GPR_rcl(63)(10)<='0';
				if (mppc_dac_busy_i='1') then 
					rcl_st<=rcl_dac_wait3;
				else
					rcl_st<=rcl_check_empty;
				end if;
				
			when rcl_send_stat_word=>
				stat_fifo_din<=x"7363726F"; --'scro' : all lower case
				stat_fifo_wr_en<='1';
				rcl_st<=rcl_send_stat_word1;

			when rcl_send_stat_word1=>
				stat_fifo_din<=x"64413530"; --'dA50' : all lower case
				stat_fifo_wr_en<='1';
				rcl_st<=rcl_send_stat_word2;

			when rcl_send_stat_word2=>
				stat_fifo_din<=x"73746174"; --'stat' : all lower case
				stat_fifo_wr_en<='1';
				rcl_st<=rcl_send_stat_word3;
				
			when rcl_send_stat_word3=>
				stat_fifo_din<=x"73796e63"; --'sync' : all lower case
				stat_fifo_wr_en<='1';
				if (rcl_wd2=x"00000000") then 
					rcl_st<=rcl_send_stat_word4; --SW is asking for only one register to be sent back
				else
					stat_cnt<=to_integer(unsigned(rcl_wd2(7 downto 0)));
					stat_cnt_end<=to_integer(unsigned(rcl_wd2(15 downto 8)));
					rcl_st<=rcl_send_stat_word_loop0; --SW is asking for a range of regs to be sent back
				end if;
			
			when rcl_send_stat_word_loop0 =>
				stat_fifo_wr_en<='0';
				if (stat_cnt<stat_cnt_end) then 
					rcl_st<=rcl_send_stat_word_loop1;
				else
					rcl_st<=rcl_send_stat_word4;
				end if;
				
			when rcl_send_stat_word_loop1 =>
				R_val<=internal_RR(stat_cnt);
				stat_fifo_wr_en<='0';
				rcl_st<=rcl_send_stat_word_loop2;

			when rcl_send_stat_word_loop2 =>
				stat_fifo_din<=x"AC" & std_logic_vector(to_unsigned(stat_cnt,8)) & R_val;
				stat_fifo_wr_en<='1';
				if (stat_cnt/=stat_cnt_end) then
					stat_cnt<=stat_cnt+1;
					rcl_st<=rcl_send_stat_word_loop1;
				else
					rcl_st<=rcl_send_stat_word5;-- we re done, pad with 0's and send ready signal
				end if;

			when rcl_send_stat_word4=>
				stat_fifo_din<=x"AC" & rcl_wd1(7 downto 0) & RR_val;
				stat_fifo_wr_en<='1';
				rcl_st<=rcl_send_stat_word5;
			
			when rcl_send_stat_word5=> --Zero pad due to some checksum issues
				stat_fifo_din<=x"00000000";
				stat_fifo_wr_en<='1';
				stat_fifo_data_rdy<='1';
				rcl_st<=rcl_check_empty;

		
		end case;
		


	

	end if;

end process;



end Behavioral;

