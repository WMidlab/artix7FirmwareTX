--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:08:35 11/08/2014
-- Design Name:   
-- Module Name:   C:/Users/isar/Documents/code4/TX9UMB-3/src/tb_ReadoutCtrl_DigSRPedDSP_01.vhd
-- Project Name:  scrod-A4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DigSRPedDSP
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
 
ENTITY tb_ReadoutCtrl_DigSRPedDSP_01 IS
END tb_ReadoutCtrl_DigSRPedDSP_01;
 
ARCHITECTURE behavior OF tb_ReadoutCtrl_DigSRPedDSP_01 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 COMPONENT ReadoutControl2
	PORT(
		clk : IN std_logic;
		trig : IN std_logic;
		dig_offset : IN std_logic_vector(8 downto 0);
		use_fixed_dig_start_win : IN std_logic_vector(15 downto 0);
		nwin_read : IN std_logic_vector(2 downto 0);
		systime : IN std_logic_vector(31 downto 0);
		curwin : IN std_logic_vector(8 downto 0);
		asicX : IN std_logic_vector(2 downto 0);
		asicY : IN std_logic_vector(2 downto 0);
		DIG_IDLE : IN std_logic;
		dig_sr_busy : IN std_logic;
		EVTBUILD_DONE_SENDING_EVENT : IN std_logic;
		RESET_EVENT_NUM : IN std_logic;
		fifo_empty : IN std_logic;          
		trig_ack : OUT std_logic;
		SRax : OUT std_logic_vector(2 downto 0);
		SRay : OUT std_logic_vector(2 downto 0);
		ro_win_start : OUT std_logic_vector(8 downto 0);
		sr_systime : OUT std_logic_vector(31 downto 0);
		ro_busy : OUT std_logic;
		dig_sr_start : OUT std_logic;
		EVTBUILD_start : OUT std_logic;
		EVTBUILD_MAKE_READY : OUT std_logic;
		EVENT_NUM : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	


    COMPONENT DigSRPedDSP
    PORT(
         clk : IN  std_logic;
         start : IN  std_logic;
         ro_win_start : IN  std_logic_vector(8 downto 0);
         win_n : IN  std_logic_vector(2 downto 0);
         asic : IN  std_logic_vector(2 downto 0);
         busy : OUT  std_logic;
         dig_ramp_length : IN  std_logic_vector(11 downto 0);
         dig_rd_ena : OUT  std_logic;
         dig_clr : OUT  std_logic;
         dig_startramp : OUT  std_logic;
         do : IN  std_logic_vector(15 downto 0);
         force_test_pattern : IN  std_logic;
         sr_clr : OUT  std_logic;
         sr_clk : OUT  std_logic;
         sr_sel : OUT  std_logic;
         sr_samplesel : OUT  std_logic_vector(4 downto 0);
         sr_samplsl_any : OUT  std_logic;
         ram_addr : OUT  std_logic_vector(21 downto 0);
         ram_data : IN  std_logic_vector(7 downto 0);
         ram_update : OUT  std_logic;
         ram_busy : IN  std_logic;
         cur_ro_win : OUT  std_logic_vector(8 downto 0);
         mode : IN  std_logic_vector(1 downto 0);
         pswfifo_en : OUT  std_logic;
         pswfifo_d : OUT  std_logic_vector(31 downto 0);
         pswfifo_clk : OUT  std_logic;
         fifo_en : OUT  std_logic;
         fifo_clk : OUT  std_logic;
         fifo_d : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    
 COMPONENT SamplingLgc
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
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
	 
   --Inputs
   signal clk : std_logic := '0';
   signal start : std_logic := '0';
   signal ro_win_start : std_logic_vector(8 downto 0) := (others => '0');
   signal win_n : std_logic_vector(2 downto 0) := (others => '0');
   signal asic : std_logic_vector(2 downto 0) := (others => '0');
   signal dig_ramp_length : std_logic_vector(11 downto 0) := (others => '0');
   signal do : std_logic_vector(15 downto 0) := (others => '0');
   signal force_test_pattern : std_logic := '0';
   signal ram_data : std_logic_vector(7 downto 0) := (others => '0');
   signal ram_busy : std_logic := '0';
   signal mode : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal busy : std_logic;
   signal dig_rd_ena : std_logic;
   signal dig_clr : std_logic;
   signal dig_startramp : std_logic;
   signal sr_clr : std_logic;
   signal sr_clk : std_logic;
   signal sr_sel : std_logic;
   signal sr_samplesel : std_logic_vector(4 downto 0);
   signal sr_samplsl_any : std_logic;
   signal ram_addr : std_logic_vector(21 downto 0);
   signal ram_update : std_logic;
   signal cur_ro_win : std_logic_vector(8 downto 0);
   signal pswfifo_en : std_logic;
   signal pswfifo_d : std_logic_vector(31 downto 0);
   signal pswfifo_clk : std_logic;
   signal fifo_en : std_logic;
   signal fifo_clk : std_logic;
   signal fifo_d : std_logic_vector(31 downto 0);

		  
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
	signal bit_no: integer:=0;

signal wr_addrclr_out : std_logic;
   signal wr1_ena : std_logic;
   signal wr2_ena : std_logic;
	signal smp_reset : std_logic;
	signal smp_clk : std_logic;
	signal cur_smp_win:std_logic_vector(8 downto 0);
	signal dig_sr_start:std_logic:='0';
	signal ROXasic:std_logic_vector(2 downto 0);
	signal dig_sr_busy:std_logic;
	signal trig:std_logic:='0';
	signal ro_busy:std_logic:='0';
   -- Clock period definitions
   constant clk_period : time := 16 ns;
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DigSRPedDSP PORT MAP (
          clk => clk,
          start => dig_sr_start,
          ro_win_start => ro_win_start,
          win_n => win_n,
          asic => ROXasic,
          busy => dig_sr_busy,
          dig_ramp_length => dig_ramp_length,
          dig_rd_ena => dig_rd_ena,
          dig_clr => dig_clr,
          dig_startramp => dig_startramp,
          do => do,
          force_test_pattern => force_test_pattern,
          sr_clr => sr_clr,
          sr_clk => sr_clk,
          sr_sel => sr_sel,
          sr_samplesel => sr_samplesel,
          sr_samplsl_any => sr_samplsl_any,
          ram_addr => ram_addr,
          ram_data => ram_data,
          ram_update => ram_update,
          ram_busy => ram_busy,
          cur_ro_win => cur_ro_win,
          mode => mode,
          pswfifo_en => pswfifo_en,
          pswfifo_d => pswfifo_d,
          pswfifo_clk => pswfifo_clk,
          fifo_en => fifo_en,
          fifo_clk => fifo_clk,
          fifo_d => fifo_d
        );

Inst_ReadoutControl2: ReadoutControl2 PORT MAP(
		clk => clk,
		trig => trig,
		dig_offset => "000000100",
		use_fixed_dig_start_win => x"8010",
		nwin_read => "010",
		systime => x"12345678",
		curwin => cur_smp_win,
		asicX => asic,
		asicY => "000",
		DIG_IDLE => '0',
		dig_sr_busy => dig_sr_busy,
		EVTBUILD_DONE_SENDING_EVENT => '0',
		RESET_EVENT_NUM => '0',
		fifo_empty => '0',
		trig_ack => open,
		SRax => ROXasic,
		SRay => open,
		ro_win_start => ro_win_start,
		sr_systime => open,
		ro_busy => ro_busy,
		dig_sr_start => dig_sr_start,
		EVTBUILD_start => open,
		EVTBUILD_MAKE_READY => open,
		EVENT_NUM => open 
	);

 uut_samp: SamplingLgc PORT MAP (
          clk => clk,
          reset => smp_reset,
          dig_win_start => "000000000",
          dig_win_n => "000000000",
          dig_win_ena => '0',
          MAIN_CNT_out => cur_smp_win,
          sstin_out => smp_clk,
          wr_addrclr_out => wr_addrclr_out,
          wr1_ena => wr1_ena,
          wr2_ena => wr2_ena
        );
		  


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
	  sa_val_0 <=cur_ro_win(2 downto 0) & sr_samplesel& x"0";
	  sa_val_1 <=cur_ro_win(2 downto 0) & sr_samplesel& x"1";
	  sa_val_2 <=cur_ro_win(2 downto 0) & sr_samplesel& x"2";
	  sa_val_3 <=cur_ro_win(2 downto 0) & sr_samplesel& x"3";
	  sa_val_4 <=cur_ro_win(2 downto 0) & sr_samplesel& x"4";
	  sa_val_5 <=cur_ro_win(2 downto 0) & sr_samplesel& x"5";
	  sa_val_6 <=cur_ro_win(2 downto 0) & sr_samplesel& x"6";
	  sa_val_7 <=cur_ro_win(2 downto 0) & sr_samplesel& x"7";
	  sa_val_8 <=cur_ro_win(2 downto 0) & sr_samplesel& x"8";
	  sa_val_9 <=cur_ro_win(2 downto 0) & sr_samplesel& x"9";
	  sa_val_A <=cur_ro_win(2 downto 0) & sr_samplesel& x"A";
	  sa_val_B <=cur_ro_win(2 downto 0) & sr_samplesel& x"B";
	  sa_val_C <=cur_ro_win(2 downto 0) & sr_samplesel& x"C";
	  sa_val_D <=cur_ro_win(2 downto 0) & sr_samplesel& x"D";
	  sa_val_E <=cur_ro_win(2 downto 0) & sr_samplesel& x"E";
	  sa_val_F <=cur_ro_win(2 downto 0) & sr_samplesel& x"F";
	  

	
	if (sr_clk_i="01") then
--	bit_no<=bit_no+1;
	do(0 )<=sa_val_0(bit_no);
	do(1 )<=sa_val_1(bit_no);
	do(2 )<=sa_val_2(bit_no);
	do(3 )<=sa_val_3(bit_no);
	do(4 )<=sa_val_4(bit_no);
	do(5 )<=sa_val_5(bit_no);
	do(6 )<=sa_val_6(bit_no);
	do(7 )<=sa_val_7(bit_no);
	do(8 )<=sa_val_8(bit_no);
	do(9 )<=sa_val_9(bit_no);
	do(10)<=sa_val_A(bit_no);
	do(11)<=sa_val_B(bit_no);
	do(12)<=sa_val_C(bit_no);
	do(13)<=sa_val_D(bit_no);
	do(14)<=sa_val_E(bit_no);
	do(15)<=sa_val_F(bit_no);
	end if;
	
		
	
	--end if;

 end if;

 
 
 end process;
 

 
 
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;	
      wait for clk_period*10;
		smp_reset<='1';
      wait for clk_period*10;
		smp_reset<='0';
		


      wait for clk_period*10;
	asic<="011";
	--win_start<="000001000";
	win_n<="010";
	dig_ramp_length<=x"D00";
      wait for clk_period*10;
	trig<='1';
      -- insert stimulus here 

      wait;
   end process;












END;
