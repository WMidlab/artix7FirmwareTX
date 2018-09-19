----------------------------------------------------------------------------------
-- Module Name:      readout_interface.vhd
-- Target Devices:   SCROD (Spartan-6 XC6SLX150T) & 
--                   Universal Eval Rev A/B (Spartan-3 XC3S400)
-- Tool versions:    Developed in ISE 13.2
-- Description:      
-- Revision history: 2012-10-25 Preliminary release by Kurtis Nishimura
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;
use work.readout_definitions.all;
use work.autoinit_definitions.all;

entity readout_interface is
	Generic (
		INCLUDE_AURORA : integer :=   0;
		INCLUDE_USB    : integer :=   1;
		AUTO_INIT		: integer :=   0
	);
	Port ( 
		CLOCK                       : in  STD_LOGIC;
	
		OUTPUT_REGISTERS            : out GPR;
		INPUT_REGISTERS             : in  RR;
		------------------WRITE TRIGGERS-------------
		REGISTER_UPDATED            : out RWT;

		--These connections allow another interface to connect to the
		--same FIFO as the command interpreter.
		WAVEFORM_FIFO_DATA_IN        : in  STD_LOGIC_VECTOR(31 downto 0);
		WAVEFORM_FIFO_EMPTY          : in  STD_LOGIC;
		WAVEFORM_FIFO_DATA_VALID     : in  STD_LOGIC;
		WAVEFORM_FIFO_READ_CLOCK     : out STD_LOGIC;
		WAVEFORM_FIFO_READ_ENABLE    : out STD_LOGIC;
		WAVEFORM_PACKET_BUILDER_BUSY : in  STD_LOGIC;
		WAVEFORM_PACKET_BUILDER_VETO : out STD_LOGIC;
		tx_dac_busy							: in std_logic;
		pedman_busy							: in std_logic;
		mppc_dac_busy						: in std_logic;
	
		rcl_fifo_rd_en			 			: out std_logic;
		rcl_fifo_data						: in std_logic_vector(31 downto 0);
		rcl_fifo_empty					 	: in std_logic;
		ctrl_mode							:out std_logic_vector(3 downto 0); --x"0"= USB has control, x"1"= PocketDAQ controlled readout,...
	
		FIBER_0_RXP                 : in  STD_LOGIC;
		FIBER_0_RXN                 : in  STD_LOGIC;
		FIBER_1_RXP                 : in  STD_LOGIC;
		FIBER_1_RXN                 : in  STD_LOGIC;
		FIBER_0_TXP                 : out STD_LOGIC;
		FIBER_0_TXN                 : out STD_LOGIC;
		FIBER_1_TXP                 : out STD_LOGIC;
		FIBER_1_TXN                 : out STD_LOGIC;
		FIBER_REFCLKP               : in  STD_LOGIC;
		FIBER_REFCLKN               : in  STD_LOGIC;
		FIBER_0_DISABLE_TRANSCEIVER : out STD_LOGIC;
		FIBER_1_DISABLE_TRANSCEIVER : out STD_LOGIC;
		FIBER_0_LINK_UP             : out STD_LOGIC;
		FIBER_1_LINK_UP             : out STD_LOGIC;
		FIBER_0_LINK_ERR            : out STD_LOGIC;
		FIBER_1_LINK_ERR            : out STD_LOGIC;

		USB_IFCLK                   : in  STD_LOGIC;
		USB_CTL0                    : in  STD_LOGIC;
		USB_CTL1                    : in  STD_LOGIC;
		USB_CTL2                    : in  STD_LOGIC;
		USB_FDD                     : inout STD_LOGIC_VECTOR(15 downto 0);
		USB_PA0                     : out STD_LOGIC;
		USB_PA1                     : out STD_LOGIC;
		USB_PA2                     : out STD_LOGIC;
		USB_PA3                     : out STD_LOGIC;
		USB_PA4                     : out STD_LOGIC;
		USB_PA5                     : out STD_LOGIC;
		USB_PA6                     : out STD_LOGIC;
		USB_PA7                     : in  STD_LOGIC;
		USB_RDY0                    : out STD_LOGIC;
		USB_RDY1                    : out STD_LOGIC;
		USB_WAKEUP                  : in  STD_LOGIC;
		USB_CLKOUT		             : in  STD_LOGIC;
		USB_FIFO_CLOCK					 : out STD_LOGIC
	);
end readout_interface;

architecture Behavioral of readout_interface is

COMPONENT bram_statreg
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    clkb : IN STD_LOGIC;
    enb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;


	signal internal_EVT_OUT_FIFO_DATA         : std_logic_vector(31 downto 0);
	signal internal_EVT_OUT_FIFO_WRITE_ENABLE : std_logic;
	signal internal_EVT_OUT_FIFO_WRITE_CLOCK  : std_logic;
	signal internal_EVT_OUT_FIFO_FULL         : std_logic;
	signal internal_TRG_OUT_FIFO_DATA         : std_logic_vector(31 downto 0);
	signal internal_TRG_OUT_FIFO_WRITE_ENABLE : std_logic;
	signal internal_TRG_OUT_FIFO_WRITE_CLOCK  : std_logic;
	signal internal_TRG_OUT_FIFO_FULL         : std_logic;
	signal internal_TRG_INP_FIFO_DATA         : std_logic_vector(31 downto 0);
	signal internal_TRG_INP_FIFO_READ_ENABLE  : std_logic;
	signal internal_TRG_INP_FIFO_READ_CLOCK   : std_logic;
	signal internal_TRG_INP_FIFO_EMPTY        : std_logic;
	signal internal_TRG_INP_FIFO_VALID        : std_logic;
	
	--Command interpreter (picoblaze) signals
	signal internal_PB_CLOCK          : std_logic;
	signal internal_PB_ADDRESS        : std_logic_vector(11 downto 0);
	signal internal_PB_INSTRUCTION    : std_logic_vector(17 downto 0);
	signal internal_PB_BRAM_ENABLE    : std_logic;
	signal internal_PB_IN_PORT        : std_logic_vector(7 downto 0);
	signal internal_PB_OUT_PORT       : std_logic_vector(7 downto 0);
	signal internal_PB_PORT_ID        : std_logic_vector(7 downto 0);
	signal internal_PB_WRITE_STROBE   : std_logic;
	signal internal_PB_K_WRITE_STROBE : std_logic;
	signal internal_PB_READ_STROBE    : std_logic;
	signal internal_PB_INTERRUPT      : std_logic;
	signal internal_PB_INTERRUPT_ACK  : std_logic;
	signal internal_PB_SLEEP          : std_logic;
	signal internal_PB_RESET          : std_logic;
	--Command interpreter reads from the input event fifo
	signal internal_EVT_INP_FIFO_DATA            : std_logic_vector(31 downto 0);
	signal internal_EVT_INP_FIFO_READ_ENABLE_pre : std_logic;
	signal internal_EVT_INP_FIFO_READ_ENABLE_reg : std_logic;
	signal internal_EVT_INP_FIFO_READ_ENABLE     : std_logic;
	signal internal_EVT_INP_FIFO_READ_CLOCK      : std_logic;
	signal internal_EVT_INP_FIFO_EMPTY           : std_logic;
	signal internal_EVT_INP_FIFO_VALID           : std_logic;
	--Command interpreter can write to the output event fifo
	signal internal_CI_DATA_TO_FIFO      : std_logic_vector(31 downto 0);
	signal internal_CI_FIFO_WRITE_ENABLE : std_logic;
	--Memory mapped address space (General Purpose Registers)
	signal internal_GPR_ADDRESS          : std_logic_vector(15 downto 0);
	signal internal_GPR_DATA_TO_WRITE    : std_logic_vector(15 downto 0);
	signal internal_GPR_WRITE_STROBE     : std_logic;
	signal internal_GPR                  : GPR;
	signal internal_GPR_auto				 : GPR;
	signal internal_GPR_rcl					 :	GPR;
	signal internal_GPR_usb					 :	GPR;
	
	--Memory mapped address space (Read Only Registers)
	signal internal_RR_DATA_OUT          : std_logic_vector(15 downto 0);
	signal internal_RR                   : RR;
	--Interface to multiplex between waveform event data and command responses
	signal internal_WAVEFORM_DATA_INTERFACE    : std_logic_vector(7 downto 0);
	signal internal_SELECT_WAVEFORM_DATA       : std_logic;
	signal internal_WAVEFORM_FIFO_WRITE_ENABLE : std_logic;
	signal internal_WAVEFORM_FIFO_DATA_IN      : std_logic_vector(31 downto 0);

	signal i_register_updated : RWT;
	
	signal i_wr_en       : std_logic;
	signal auto_init_en	:std_logic:='0';
	signal sw2usb			: std_logic_vector(1 downto 0):="00";
	signal sw2rcl			: std_logic_vector(1 downto 0):="00";
	signal internal_GPR_SEL: std_logic_vector(1 downto 0):="00";
	
	signal init_cnt1		: integer:=0;
	signal cnt1				: integer:=0;
	signal init_precnt   : integer:=0;
	signal cur_scrod_reg	: std_logic_vector(23 downto 0);
	signal cur_dc			:integer:=0;
	signal asic_dc_msk	: std_logic_vector(15 downto 0);
	signal asic_reg_num	: integer:=0;
--	signal tx_dac_busy	:std_logic:='0';
	signal init_postcnt	:integer:=0;
	signal init_pedscnt	:integer:=0;
	  type auto_init_st is (init_st_startup,init_st_cnt1,init_st_setauto_pre,init_st_setauto_pre0,init_st_setauto_asic_setdc,
	  init_st_setauto_asic_setdc2,init_st_setauto_asic_wait1,init_st_setauto_asic_reg,init_st_setauto_asic_reg_wait,
	  init_st_setauto_asic_reg_wait2,init_st_setauto_asic_reg_wait3,init_st_setauto_asic_reg_inc,init_st_setauto_asic_dc_inc,
	  init_st_setauto_peds0,init_st_setauto_peds,init_st_wait_pedsbusy_hi,init_st_wait_pedsbusy_low,
	  init_st_setauto_post,init_st_setauto_post0,init_st_done
			); 
   signal init_st : auto_init_st := init_st_startup;

	type proc_rcl_st is (rcl_check_empty,rcl_load,rcl_load0,rcl_load1, rcl_proc,rcl_downcnt,rcl_asic_reg_wait,rcl_asic_reg_wait1,rcl_asic_reg_wait2,rcl_asic_reg_wait3
								, rcl_dac_wait,rcl_dac_wait2,rcl_dac_wait3); 
   signal rcl_st : proc_rcl_st := rcl_check_empty;
	
	signal rcl_fifo_data_i:std_logic_vector(31 downto 0);
	signal rcl_wd1:std_logic_vector(15 downto 0);
	signal rcl_wd2:std_logic_vector(15 downto 0);
	signal rcl_cnt:integer:=0;
	
	--signal rcl_asic_en_mask:std_logic_vector(15 downto 0);
	signal rcl_asic_num: integer:=0;
	
	
	
--	--Chipscope debugging crap
--	signal internal_CHIPSCOPE_CONTROL : std_logic_vector(35 downto 0);
--	signal internal_CHIPSCOPE_ILA     : std_logic_vector(127 downto 0);
--	signal internal_CHIPSCOPE_ILA_REG : std_logic_vector(127 downto 0);	
	
begin
	--OUTPUT_REGISTERS <= internal_GPR when auto_init_en='0' else internal_GPR_auto ;
	OUTPUT_REGISTERS <= internal_GPR 		when internal_GPR_SEL="01" 	else
							  internal_GPR_rcl	when internal_GPR_SEL="10" 	else
							  internal_GPR_auto	when auto_init_en		='1'		else
							  internal_GPR ;
							  
	internal_RR <= INPUT_REGISTERS;

	--The TRG input/output fifos are a simple loopback right now
	internal_TRG_OUT_FIFO_DATA         <= internal_TRG_INP_FIFO_DATA;
	internal_TRG_OUT_FIFO_WRITE_ENABLE <= internal_TRG_INP_FIFO_VALID;
	internal_TRG_INP_FIFO_READ_ENABLE  <= (not(internal_TRG_INP_FIFO_EMPTY)) and (not(internal_TRG_OUT_FIFO_FULL));
	--Use the same clock for everything for now:
	internal_TRG_OUT_FIFO_WRITE_CLOCK <= CLOCK;
	internal_TRG_INP_FIFO_READ_CLOCK  <= CLOCK;
	
	--Multiplex signal to choose between waveform event data and command interpreter responses
	internal_SELECT_WAVEFORM_DATA <= internal_WAVEFORM_DATA_INTERFACE(0);
	WAVEFORM_PACKET_BUILDER_VETO  <= internal_WAVEFORM_DATA_INTERFACE(1);
	
	------Picoblaze command interpreter that reads the event/waveform input FIFO-----
	internal_PB_CLOCK <= CLOCK;
	internal_EVT_INP_FIFO_READ_CLOCK  <= internal_PB_CLOCK;
	---
	rcl_wd1<=rcl_fifo_data_i(31 downto 16);
	rcl_wd2<=rcl_fifo_data_i(15 downto 0 );

proc_select_regs: process(CLOCK) begin
		if (rising_edge(CLOCK)) then
			sw2usb<=sw2usb(0) & internal_GPR		(0)(15);
			sw2rcl<=sw2rcl(0) & internal_GPR_rcl(0)(15);

			if (sw2usb="01") then 
				internal_GPR_SEL<="01";
				ctrl_mode<=x"0";
			end if;

			if (sw2rcl="01") then 
				internal_GPR_SEL<="10";
				ctrl_mode<=x"1";
			end if;
				
			
		end if;
	end process;

--inst_bram_stat_reg : bram_statreg
--  PORT MAP (
--    clka 	=> CLOCK,
--    ena 		=> '1',
--    wea 		=> bram_stat_wr_en,
--    addra 	=> bram_stat_wr_addr,
--    dina 	=> bram_stat_wr_data,
--    clkb 	=> bram_stat_rd_clk,
--    enb 		=> bram_stat_rd_en,
--    addrb 	=> bram_stat_rd_addr,
--    doutb 	=> bram_stat_rd_data
--  );
--  
--proc_stat_regs: process(CLOCK) begin
--
--	
--	bram_stat_wr_en<='1';
--	bram_stat_wr_data<=internal_RR(cnt_addr)
--	if (rising_edge(CLOCK)) then
--		bram_stat_wr_addr<=std_logic_vector(to_unsigned((cnt_addr+1),9));
--		
--		
--	end if;
--
--end process;


proc_runctrl_regs:process(CLOCK) begin

	if (rising_edge(CLOCK)) then
--		internal_GPR_rcl
		case rcl_st is

			when rcl_check_empty =>
				if (rcl_fifo_empty='1') then
					rcl_fifo_rd_en<='0';
					rcl_st<=rcl_check_empty;
				else 
					rcl_fifo_rd_en<='1';
					rcl_st<=rcl_load;
				end if;
				
			when rcl_load =>
				rcl_fifo_rd_en<='0';
				rcl_st<=rcl_load0;

			when rcl_load0 =>
				rcl_st<=rcl_load1;
			
			when rcl_load1 =>
				rcl_fifo_data_i<=rcl_fifo_data;
				rcl_st<=rcl_proc;
			
			when rcl_proc =>
				if 	(rcl_wd1=x"AE00") then -- wait command: wait for a certain count
					rcl_cnt<=to_integer(unsigned(rcl_wd2))*256;
					rcl_st<=rcl_downcnt;
--				elsif (rcl_wd1=x"AE10") then --wait command: until ped_manager busy goes low -- this code needs work, there is no handshake possible in this setting
				elsif (rcl_wd1(15 downto 8)=x"AF") then --program scrod reg
					internal_GPR_rcl(to_integer(unsigned(rcl_wd1(7 downto 0))))<=rcl_wd2;
					rcl_st<=rcl_check_empty;
					
				elsif (rcl_wd1(15 downto 12)=x"B") then -- Command to program a TXDC Reg
					internal_GPR_rcl(1)<=x"0000";
					internal_GPR_rcl(2)<="00000000" & rcl_wd1(7 downto 0);
					internal_GPR_rcl(3)<=rcl_wd2;
					rcl_asic_num<=to_integer(unsigned(rcl_wd1(11 downto 8)));
					internal_GPR_rcl(4)<=x"0000";
					rcl_st<=rcl_asic_reg_wait;					
					
				elsif (rcl_wd1(15 downto 8)=x"C0") then -- Command to program a trim DAC
					internal_GPR_rcl(60)<=rcl_wd1(7 downto 0) & rcl_wd2(7 downto 0);
					internal_GPR_rcl(63)(10)<='0';
					rcl_st<=rcl_dac_wait;					
				else 
						rcl_st<=rcl_check_empty; --unknown command- skip!
				end if;
			
			when rcl_downcnt =>
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
				if (tx_dac_busy='0') then 
					rcl_st<=rcl_asic_reg_wait2;
				else
					rcl_st<=rcl_asic_reg_wait3;
				end if;
			
			when rcl_asic_reg_wait3=> --wait for busy signal to go down
				internal_GPR_rcl(1)<=x"0000";
				if (tx_dac_busy='1') then 
					rcl_st<=rcl_asic_reg_wait2;
				else
					rcl_st<=rcl_check_empty;
				end if;

			when rcl_dac_wait =>
				internal_GPR_rcl(63)(10)<='1';
				rcl_st<=rcl_dac_wait2;

			when rcl_dac_wait2 =>
				if (mppc_dac_busy='0') then 
					rcl_st<=rcl_dac_wait2;
				else
					rcl_st<=rcl_dac_wait3;
				end if;

			when rcl_dac_wait3 =>
				internal_GPR_rcl(63)(10)<='0';
				if (mppc_dac_busy='1') then 
					rcl_st<=rcl_dac_wait3;
				else
					rcl_st<=rcl_check_empty;
				end if;
		
		end case;
		


	

	end if;

end process;






	auto_init_manage : process(CLOCK) begin
		if (rising_edge(CLOCK)) then
		
--			sw2usb<=sw2usb(0) & internal_GPR(0)(15);
		
			case init_st is 
			when init_st_startup => 
				init_cnt1<=0;
				cnt1<=0;
				auto_init_en<='0';
				if (AUTO_INIT=0) then -- do not start auto init process
					init_st<=init_st_startup;
				else
					init_st<=init_st_cnt1;
				end if;
			
			when init_st_cnt1 =>
				init_cnt1<=init_cnt1+1;
				if (init_cnt1/=INIT_CNT1_MAX) then
					init_st<=init_st_cnt1;
				else
					internal_PB_SLEEP<='1';
					auto_init_en<='1';
					init_precnt<=0;
					init_cnt1<=0;
					init_st<=init_st_setauto_pre0;
				end if;

			when init_st_setauto_pre0=>
				if (cnt1/=WAIT_CNT1_MAX) then 
					cnt1<=cnt1+1;
					init_st<=init_st_setauto_pre0;
				else
					cnt1<=0;
					init_st<=init_st_setauto_pre;
				end if;
					

			when init_st_setauto_pre=>
				if (init_precnt<scrodpre_len) then
					internal_GPR_auto(to_integer(unsigned(init_scrodpre (init_precnt )(23 downto 16))))<=init_scrodpre (init_precnt )(15 downto 0);
					init_precnt<=init_precnt+1;
					cnt1<=0;
					init_st<=init_st_setauto_pre0;
				else 
					init_st<=init_st_setauto_asic_setdc;
					cur_dc<=0;
				end if;

			when init_st_setauto_asic_setdc=>
				asic_dc_msk<=x"0000";
				asic_reg_num<=0;
				init_st<=init_st_setauto_asic_setdc2;

			when init_st_setauto_asic_setdc2=>
				asic_dc_msk(cur_dc)<='1';
				init_st<=init_st_setauto_asic_wait1;

			when init_st_setauto_asic_wait1=>
				if (tx_dac_busy='1') then 
					init_st<=init_st_setauto_asic_wait1;
				else
					init_st<=init_st_setauto_asic_reg;
				end if;

			when init_st_setauto_asic_reg=>
				internal_GPR_auto(1)<=x"0000";
				internal_GPR_auto(2)<="00000000" & init_asicregs(asic_reg_num)(23 downto 16);
				internal_GPR_auto(3)<=init_asicregs(asic_reg_num)(15 downto 0 );
				internal_GPR_auto(4)<=asic_dc_msk;
				init_st<=init_st_setauto_asic_reg_wait;

			when init_st_setauto_asic_reg_wait=>
				internal_GPR_auto(1)<=x"0001";
				init_st<=init_st_setauto_asic_reg_wait2;

			when init_st_setauto_asic_reg_wait2=> --wait for busy signal to come up
				if (tx_dac_busy='0') then 
					init_st<=init_st_setauto_asic_reg_wait2;
				else
					init_st<=init_st_setauto_asic_reg_wait3;
				end if;

			when init_st_setauto_asic_reg_wait3=> --wait for busy signal to go down
				if (tx_dac_busy='1') then 
					init_st<=init_st_setauto_asic_reg_wait3;
				else
					init_st<=init_st_setauto_asic_reg_inc;
				end if;

			when init_st_setauto_asic_reg_inc=> 
				if (asic_reg_num<asicregs_len) then
					asic_reg_num<=asic_reg_num+1;
					init_st<=init_st_setauto_asic_wait1;
				else
					init_st<=init_st_setauto_asic_dc_inc;
				end if;

			when init_st_setauto_asic_dc_inc =>
				if (cur_dc<9) then 
					cur_dc<=cur_dc+1;
					init_st<=init_st_setauto_asic_setdc;
				else
					init_postcnt<=0;
					init_pedscnt<=0;
					cnt1<=0;
					init_st<=init_st_setauto_peds0;
				end if;


			when init_st_setauto_peds0=>
				if (cnt1/=WAIT_CNT1_MAX) then 
					cnt1<=cnt1+1;
					init_st<=init_st_setauto_peds0;
				else
					cnt1<=0;
					init_st<=init_st_setauto_peds;
				end if;

			when init_st_setauto_peds=>
				if (init_pedscnt<scrodpeds_len) then
					internal_GPR_auto(to_integer(unsigned(init_scrodpeds(init_pedscnt)(23 downto 16))))<=init_scrodpeds(init_pedscnt)(15 downto 0);
					init_pedscnt<=init_pedscnt+1;
					init_st<=init_st_setauto_peds0;
				else 
					init_st<=init_st_wait_pedsbusy_hi;
				end if;

			when init_st_wait_pedsbusy_hi=>
				if (pedman_busy='0') then
					init_st<=init_st_wait_pedsbusy_hi;
				else
					init_st<=init_st_wait_pedsbusy_low;
				end if;
				
			when init_st_wait_pedsbusy_low=>
				if (pedman_busy='1') then
					init_st<=init_st_wait_pedsbusy_low;
				else
					init_st<=init_st_setauto_post0;
					init_postcnt<=0;
				end if;

			when init_st_setauto_post0=>
				if (cnt1/=WAIT_CNT1_MAX) then 
					cnt1<=cnt1+1;
					init_st<=init_st_setauto_post0;
				else
					cnt1<=0;
					init_st<=init_st_setauto_post;
				end if;

			when init_st_setauto_post =>
				if (init_postcnt<scrodpost_len) then
					internal_GPR_auto(to_integer(unsigned(init_scrodpost(init_postcnt)(23 downto 16))))<=init_scrodpost(init_postcnt)(15 downto 0);
					init_postcnt<=init_postcnt+1;
					init_st<=init_st_setauto_post0;
				else 
					init_st<=init_st_done;
				end if;
				
			when init_st_done=>
				if (sw2usb="01") then
					auto_init_en<='0';-- now control is back to USB
				end if;
				internal_PB_SLEEP<='0';
				init_st<=init_st_done;
				
			end case;
			
		end if;
	end process;






	command_interpreter_processor : entity work.kcpsm6
	generic map(
		hwbuild                 => x"00",
		interrupt_vector        => x"3FF",
		scratch_pad_memory_size => 64
	) port map (
		address        => internal_PB_ADDRESS,
		instruction    => internal_PB_INSTRUCTION,
		bram_enable    => internal_PB_BRAM_ENABLE,
		port_id        => internal_PB_PORT_ID,
		write_strobe   => internal_PB_WRITE_STROBE,
		k_write_strobe => internal_PB_K_WRITE_STROBE,
		out_port       => internal_PB_OUT_PORT,
		read_strobe    => internal_PB_READ_STROBE,
		in_port        => internal_PB_IN_PORT,
		interrupt      => internal_PB_INTERRUPT,
		interrupt_ack  => internal_PB_INTERRUPT_ACK,
		sleep          => internal_PB_SLEEP,
		reset          => internal_PB_RESET,
		clk            => internal_PB_CLOCK
	);
	command_interpreter_rom : entity work.command_interpreter
	generic map(
		C_FAMILY             => "S6",
		C_RAM_SIZE_KWORDS    => 1,
		C_JTAG_LOADER_ENABLE => 0
	) port map (
		address     => internal_PB_ADDRESS,
		instruction => internal_PB_INSTRUCTION,
		enable      => internal_PB_BRAM_ENABLE,
		rdl         => internal_PB_RESET,
		clk         => internal_PB_CLOCK
	);
	
	-----Handle the connections of the input and output ports to the command processor----
	--First connect input FIFO 0 to the first four ports of the processor
	--This connection is made as in Figure 6-4 of UG129 (PicoBlaze user guide)
	--Asynchronous logic for the read enable
	process(internal_PB_PORT_ID) begin
		if (internal_PB_PORT_ID = x"01") then
			internal_EVT_INP_FIFO_READ_ENABLE_pre <= '1';
		else
			internal_EVT_INP_FIFO_READ_ENABLE_pre <= '0';
		end if;
	end process;
	--Register for the read enable
	process(internal_PB_CLOCK) begin
		if (rising_edge(internal_PB_CLOCK)) then
				internal_EVT_INP_FIFO_READ_ENABLE_reg <= 	internal_EVT_INP_FIFO_READ_ENABLE_pre;
		end if;
	end process;
	--Final read enable for the input fifo with the read strobe
	process(internal_EVT_INP_FIFO_READ_ENABLE_reg, internal_PB_READ_STROBE) begin
		internal_EVT_INP_FIFO_READ_ENABLE <= internal_EVT_INP_FIFO_READ_ENABLE_reg and internal_PB_READ_STROBE;
	end process;

	--Multiplex the inputs to the command interpreter (it can only read 8 bits at a time)
	process(internal_PB_PORT_ID, internal_EVT_INP_FIFO_EMPTY, internal_EVT_INP_FIFO_DATA, internal_RR_DATA_OUT, WAVEFORM_FIFO_EMPTY) begin
		case internal_PB_PORT_ID is
			--Addresses 0x00 through 0x04 are for reading the fifo:
			--0x00: Read whether the command fifo is empty
			--0x01: Asserts the read enable for the fifo
			--0x02: First 8 bits of the command input (also turns on read enable)
			--0x03: Second 8 bits
			--0x04: Third 8 bits
			--0x05: Last 8 bits
			when x"00" => internal_PB_IN_PORT <= "00000" & WAVEFORM_FIFO_EMPTY & WAVEFORM_PACKET_BUILDER_BUSY & internal_EVT_INP_FIFO_EMPTY;
			when x"01" => internal_PB_IN_PORT <= (others => '0'); --No input, but this asserts the read strobe
			when x"02" => internal_PB_IN_PORT <= internal_EVT_INP_FIFO_DATA( 7 downto  0);
			when x"03" => internal_PB_IN_PORT <= internal_EVT_INP_FIFO_DATA(15 downto  8);
			when x"04" => internal_PB_IN_PORT <= internal_EVT_INP_FIFO_DATA(23 downto 16);
			when x"05" => internal_PB_IN_PORT <= internal_EVT_INP_FIFO_DATA(31 downto 24);
			--Addresses 0x06-0x07 are the outputs of the general purpose registers
			when x"06" => internal_PB_IN_PORT <= internal_RR_DATA_OUT( 7 downto  0);
			when x"07" => internal_PB_IN_PORT <= internal_RR_DATA_OUT(15 downto  8);
			--Define further addresses here
			when others => internal_PB_IN_PORT <= "XXXXXXXX";
		end case;
	end process;
	--Multiplex the outputs from the command interpreter (8 bits wide)
	process(internal_PB_WRITE_STROBE, internal_PB_CLOCK, internal_PB_OUT_PORT) begin
		if (internal_PB_WRITE_STROBE = '1') then
			if (rising_edge(internal_PB_CLOCK)) then
				case internal_PB_PORT_ID is
					--Addresses 0x00-0x04 are for writing to the waveform/event output FIFO
					--0x04 pulses the write enable to the output fifo
					when x"00"  => internal_CI_DATA_TO_FIFO( 7 downto  0) <= internal_PB_OUT_PORT;
					when x"01"  => internal_CI_DATA_TO_FIFO(15 downto  8) <= internal_PB_OUT_PORT;
					when x"02"  => internal_CI_DATA_TO_FIFO(23 downto 16) <= internal_PB_OUT_PORT;
					when x"03"  => internal_CI_DATA_TO_FIFO(31 downto 24) <= internal_PB_OUT_PORT;
					when x"04"  => --Logic to generate the write strobe sits in another process
					--Addresses 0x05-0x06 are the general purpose register address
					when x"05"  => internal_GPR_ADDRESS( 7 downto  0) <= internal_PB_OUT_PORT;
					when x"06"  => internal_GPR_ADDRESS(15 downto  8) <= internal_PB_OUT_PORT;
					--Addresses 0x07-0x08 are the general purpose register data
					when x"07"  => internal_GPR_DATA_TO_WRITE( 7 downto  0) <= internal_PB_OUT_PORT;
					when x"08"  => internal_GPR_DATA_TO_WRITE(15 downto  8) <= internal_PB_OUT_PORT;
					--Address 0x09 will cause the general purpose write strobe to be asserted for one clock cycle
					when x"09"  => --The write strobe logic sits in another process
					--Address 0x0A is a veto to receiving event data
					when x"0A"  => internal_WAVEFORM_DATA_INTERFACE <= internal_PB_OUT_PORT;
					--Define further addresses here
					when others =>
				end case;
			end if;
		end if;
	end process;	
	--Generation of the write enable for the CI output FIFO
	process(internal_PB_WRITE_STROBE, internal_PB_PORT_ID)
		variable activate_write_strobe : std_logic;
	begin
		activate_write_strobe := '1' when internal_PB_PORT_ID = x"04" else
		                         '0';
		internal_CI_FIFO_WRITE_ENABLE <= internal_PB_WRITE_STROBE and activate_write_strobe;
	end process;
	--Generation of the GPR write strobe (Does this need to be registered?)
	process(internal_PB_WRITE_STROBE, internal_PB_PORT_ID) 
		variable activate_write_strobe : std_logic;
	begin
		activate_write_strobe := '1' when internal_PB_PORT_ID = x"09" else
		                         '0';
		internal_GPR_WRITE_STROBE <= internal_PB_WRITE_STROBE and activate_write_strobe;
	end process;
	--Control writing to the output FIFO.  This multiplexes the command interpreter 
	--responses with the waveform data, to allow these two sources to share a single
	--fiberoptic interface.  The PicoBlaze Command Intepreter decides when to switch
	--between these sources (see command_interpreter.psm for details).
	process(internal_SELECT_WAVEFORM_DATA, internal_CI_DATA_TO_FIFO, internal_WAVEFORM_FIFO_DATA_IN) begin
		case internal_SELECT_WAVEFORM_DATA is
			when '0' => internal_EVT_OUT_FIFO_DATA <= internal_CI_DATA_TO_FIFO;
			when '1' => internal_EVT_OUT_FIFO_DATA <= internal_WAVEFORM_FIFO_DATA_IN;
			when others => internal_EVT_OUT_FIFO_DATA <= (others => 'X');
		end case;
	end process;
	process(internal_SELECT_WAVEFORM_DATA, internal_CI_FIFO_WRITE_ENABLE, internal_WAVEFORM_FIFO_WRITE_ENABLE) begin
		case internal_SELECT_WAVEFORM_DATA is
			when '0' => internal_EVT_OUT_FIFO_WRITE_ENABLE <= internal_CI_FIFO_WRITE_ENABLE;
			when '1' => internal_EVT_OUT_FIFO_WRITE_ENABLE <= internal_WAVEFORM_FIFO_WRITE_ENABLE;
			when others => internal_EVT_OUT_FIFO_WRITE_ENABLE <= 'X';
		end case;
	end process;
	WAVEFORM_FIFO_READ_CLOCK <= internal_PB_CLOCK;
	WAVEFORM_FIFO_READ_ENABLE <= not(WAVEFORM_FIFO_EMPTY) and not(internal_EVT_OUT_FIFO_FULL) and internal_SELECT_WAVEFORM_DATA;
	internal_EVT_OUT_FIFO_WRITE_CLOCK  <= internal_PB_CLOCK;
	--Add one stage of pipeline delay between the waveform data and here.
	process(internal_PB_CLOCK) begin
		if (rising_edge(internal_PB_CLOCK)) then
			internal_WAVEFORM_FIFO_WRITE_ENABLE <= WAVEFORM_FIFO_DATA_VALID and internal_SELECT_WAVEFORM_DATA;
			internal_WAVEFORM_FIFO_DATA_IN      <= WAVEFORM_FIFO_DATA_IN;
		end if;
	end process;

	------General register logic (reading/writing) -----
	--Read from the read registers (asynchronous mux)
	process(internal_GPR_ADDRESS, internal_RR) 
		variable address : integer range 0 to N_RR-1;
	begin
		address := to_integer(unsigned(internal_GPR_ADDRESS));
		internal_RR_DATA_OUT <= (others => '0');
		for i in 0 to N_RR-1 loop
			if (i = address) then
				internal_RR_DATA_OUT <= internal_RR(address);
			end if;
		end loop;
	end process;
	--Write to the general purpose registers
	process(internal_PB_CLOCK, internal_GPR_ADDRESS, internal_GPR_WRITE_STROBE) begin
		for i in 0 to N_GPR-1 loop
			if ( i = to_integer(unsigned(internal_GPR_ADDRESS)) and internal_GPR_WRITE_STROBE = '1' ) then
				if (rising_edge(internal_PB_CLOCK)) then
					internal_GPR(i) <= internal_GPR_DATA_TO_WRITE;
				end if;
			end if;
		end loop;
	end process;

	-- generate write trigger
	inst_write_edge : entity work.edge_detect
	Port map(
		CLOCK        => internal_PB_CLOCK,
		INPUT_SIGNAL => internal_GPR_WRITE_STROBE,
		OUT_RISING   => i_wr_en,
		OUT_FALLING  => open
	);
	gen_strobe : for i in 0 to N_GPR-1 generate
		i_register_updated(i) <= i_wr_en when (i = to_integer(unsigned(internal_GPR_ADDRESS))) else '0';
	end generate;
	REGISTER_UPDATED <= i_register_updated when rising_edge(internal_PB_CLOCK);
	
	------FIFO layer that connects to USB and/or Aurora------
	map_daq_fifo_layer : entity work.daq_fifo_layer
	generic map(
		INCLUDE_AURORA => INCLUDE_AURORA,
		INCLUDE_USB    => INCLUDE_USB
	)
	port map (
		SYSTEM_CLOCK        => CLOCK,
		
		--FIFO signals for the 4 FIFOs
		FIFO_OUT_0_DATA     => internal_EVT_OUT_FIFO_DATA,
		FIFO_OUT_0_WR_EN    => internal_EVT_OUT_FIFO_WRITE_ENABLE,
		FIFO_OUT_0_WR_CLK   => internal_EVT_OUT_FIFO_WRITE_CLOCK,
		FIFO_OUT_0_FULL     => internal_EVT_OUT_FIFO_FULL,
		FIFO_INP_0_DATA     => internal_EVT_INP_FIFO_DATA,
		FIFO_INP_0_RD_EN    => internal_EVT_INP_FIFO_READ_ENABLE,
		FIFO_INP_0_RD_CLK   => internal_EVT_INP_FIFO_READ_CLOCK,
		FIFO_INP_0_EMPTY    => internal_EVT_INP_FIFO_EMPTY,
		FIFO_INP_0_VALID    => internal_EVT_INP_FIFO_VALID,
		FIFO_OUT_1_DATA     => internal_TRG_OUT_FIFO_DATA,
		FIFO_OUT_1_WR_EN    => internal_TRG_OUT_FIFO_WRITE_ENABLE,
		FIFO_OUT_1_WR_CLK   => internal_TRG_OUT_FIFO_WRITE_CLOCK,
		FIFO_OUT_1_FULL     => internal_TRG_OUT_FIFO_FULL,
		FIFO_INP_1_DATA     => internal_TRG_INP_FIFO_DATA,
		FIFO_INP_1_RD_EN    => internal_TRG_INP_FIFO_READ_ENABLE,
		FIFO_INP_1_RD_CLK   => internal_TRG_INP_FIFO_READ_CLOCK,
		FIFO_INP_1_EMPTY    => internal_TRG_INP_FIFO_EMPTY,
		FIFO_INP_1_VALID    => internal_TRG_INP_FIFO_VALID,

		--Signals that need to go to the top level for USB
		USB_IFCLK           => USB_IFCLK,
		USB_CTL0            => USB_CTL0,
		USB_CTL1            => USB_CTL1,
		USB_CTL2            => USB_CTL2,
		USB_FDD             => USB_FDD,
		USB_PA0             => USB_PA0,
		USB_PA1             => USB_PA1,
		USB_PA2             => USB_PA2,
		USB_PA3             => USB_PA3,
		USB_PA4             => USB_PA4,
		USB_PA5             => USB_PA5,
		USB_PA6             => USB_PA6,
		USB_PA7             => USB_PA7,
		USB_RDY0            => USB_RDY0,
		USB_RDY1            => USB_RDY1,
		USB_WAKEUP          => USB_WAKEUP,
		USB_CLKOUT          => USB_CLKOUT,
		USB_FIFO_CLOCK			=>USB_FIFO_CLOCK,
		
		--Signals that need to go to the top level for fiberoptic
		FIBER_0_RXP                 => FIBER_0_RXP,
		FIBER_0_RXN                 => FIBER_0_RXN,
		FIBER_1_RXP                 => FIBER_1_RXP,
		FIBER_1_RXN                 => FIBER_1_RXN,
		FIBER_0_TXP                 => FIBER_0_TXP,
		FIBER_0_TXN                 => FIBER_0_TXN,
		FIBER_1_TXP                 => FIBER_1_TXP,
		FIBER_1_TXN                 => FIBER_1_TXN,
		FIBER_REFCLKP               => FIBER_REFCLKP,
		FIBER_REFCLKN               => FIBER_REFCLKN,
		FIBER_0_DISABLE_TRANSCEIVER => FIBER_0_DISABLE_TRANSCEIVER,
		FIBER_1_DISABLE_TRANSCEIVER => FIBER_1_DISABLE_TRANSCEIVER,
		FIBER_0_LINK_UP             => FIBER_0_LINK_UP,
		FIBER_1_LINK_UP             => FIBER_1_LINK_UP,
		FIBER_0_LINK_ERR            => FIBER_0_LINK_ERR,
		FIBER_1_LINK_ERR            => FIBER_1_LINK_ERR
	);



	
--	--DEBUGGING SHIT
--	map_ILA : entity work.s6_ila
--	port map (
--		CONTROL => internal_CHIPSCOPE_CONTROL,
--		CLK     => internal_PB_CLOCK,
--		TRIG0   => internal_CHIPSCOPE_ILA_REG
--	);
--	map_ICON : entity work.s6_icon
--	port map (
--		CONTROL0 => internal_CHIPSCOPE_CONTROL
--	);
--	
--	--Workaround for CS/picoblaze stupidness
--	process(internal_PB_CLOCK) begin
--		if (rising_edge(internal_PB_CLOCK)) then
--			internal_CHIPSCOPE_ILA_REG <= internal_CHIPSCOPE_ILA;
--		end if;
--	end process;
--	
--	internal_CHIPSCOPE_ILA(0) <= internal_SELECT_WAVEFORM_DATA;                     
--	internal_CHIPSCOPE_ILA(32 downto  1) <= internal_WAVEFORM_FIFO_DATA_IN;                     
--	internal_CHIPSCOPE_ILA(64 downto 33) <= internal_EVT_OUT_FIFO_DATA;                      
--	internal_CHIPSCOPE_ILA(65) <= internal_EVT_OUT_FIFO_WRITE_ENABLE;                
--	internal_CHIPSCOPE_ILA(66) <= internal_WAVEFORM_FIFO_WRITE_ENABLE;                      
--	internal_CHIPSCOPE_ILA(67) <= internal_CI_FIFO_WRITE_ENABLE;                   
--	internal_CHIPSCOPE_ILA(68) <= not(WAVEFORM_FIFO_EMPTY) and not(internal_EVT_OUT_FIFO_FULL) and internal_SELECT_WAVEFORM_DATA;
--	internal_CHIPSCOPE_ILA(69) <= WAVEFORM_FIFO_DATA_VALID;
	
end Behavioral;

