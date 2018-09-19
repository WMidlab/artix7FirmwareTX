----------------------------------------------------------------------------------
-- Company: UH Manoa- ID LAB
-- Engineer: Isar Mostafanezhad
-- 
-- Create Date:    10:30:17 02/12/2015 
-- Design Name: Belle II- KLM- SCROD Scintillator motherboard readout
-- Module Name:    PedestalManagement - Behavioral 
-- Project Name: 
-- Target Devices: SP6
-- Tool versions: ISE 14.7
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PedestalManagement is
Port ( 
    clk 				: in STD_LOGIC;
    enable              : in STD_LOGIC;
    start 				: in STD_LOGIC;
    win_len_start       : in STD_LOGIC_VECTOR (15  downto 0);--15 downto 9 is divide by 4 of the number of windows. 8 downto 0 is the start win no
    asic_en_mask		: in std_logic_vector (9  downto 0);-- perform ped calc only on these asics
    readout_trig        : out STD_LOGIC;
    ped_calc_busy       : in STD_LOGIC;
    readout_busy        : in STD_LOGIC;
    dmx_allwin_done     : in std_logic;
    busy 				: out STD_LOGIC;
    stat 				: out STD_LOGIC_VECTOR (31 downto 0);
    cur_win_no          : out STD_LOGIC_VECTOR (8  downto 0);-- 8 downto 0 is win no
    cur_asic_en_bits    : out STD_LOGIC_VECTOR (9  downto 0);
	ped_calc_enable     : out std_logic;
	readout_reset       : out std_logic;
	readout_continue    : out std_logic  
    );
end PedestalManagement;

architecture Behavioral of PedestalManagement is

signal enable_i             : std_logic:='0';
signal start_i              : std_logic_vector(1 downto 0):="00";
signal win_start_i          : integer:=0;
signal win_end_i            : integer:=0;
signal asic_en_mask_i       : STD_LOGIC_VECTOR (9 downto 0);
signal cur_win_no_i         : STD_LOGIC_VECTOR (8  downto 0);
signal cur_asic_en_bits_i   : STD_LOGIC_VECTOR (9  downto 0);
signal asic_cnt             : integer:=0;
signal win_cnt              : integer:=0;
--signal 

type ped_manage_state is
	(
		idle,	
		ltch_inputs,
		asic_sel1,
		asic_sel2,
		reset_pedcalc0,
		reset_pedcalc1,
		win_sel1,
		st_readout_reset_hold1,
		st_readout_reset_hold2,
		st_readout_reset_hold3,
		st_readout_reset,
		st_readout_reset2,
		st_readout_reset3,
		trig_readout,
		wait_readout_busy_high,
		wait_readout_done,
		wait_ped_calc_busy_low,
		check_win,
		asic_inc,
		check_asic,
		done
	);
	
signal mng_st : ped_manage_state := idle;

begin

    cur_asic_en_bits <= cur_asic_en_bits_i;
	cur_win_no <= cur_win_no_i;

latch_inputs: process (clk)
begin
	if (rising_edge(clk)) then
		enable_i <= enable;
		start_i <= start_i(0) & start;
	end if;
end process;

process(clk)
begin

if rising_edge(clk) then
	case mng_st is
	
    	When idle => --0x00
    		busy <= '0';
    		readout_trig <= '0';
    		readout_reset <= '0';
    		readout_continue <= '0';
    		cur_asic_en_bits_i <= (others=>'0');
    		if (enable_i='1' and start_i="01") then
    			busy <= '1';
    			mng_st <= ltch_inputs;
    		else
    			mng_st <= idle;
    		end if;
    
    	When ltch_inputs=> --0x01
    		win_start_i	<= to_integer(unsigned(win_len_start(8 downto 0)));
    		win_end_i <= to_integer(unsigned(win_len_start(8 downto 0)))+to_integer(unsigned(win_len_start(15 downto 9) & "00"));
    		asic_en_mask_i <= asic_en_mask;
    		asic_cnt <= 0;
    		readout_reset <= '0'; 
    		mng_st <= asic_sel1;
	
    	When asic_sel1 => --0x02
    		cur_asic_en_bits_i <= (others=>'0');
    		readout_reset <= '0';
    		ped_calc_enable <= '0';
    		if (asic_en_mask_i(asic_cnt)='1') then 	
    			mng_st <= asic_sel2;
    		else
    			mng_st <= asic_inc;
    		end if;
    		
    	When asic_sel2 => --0x03
    		readout_reset <= '0';
    		cur_asic_en_bits_i(asic_cnt) <= asic_en_mask_i(asic_cnt);
    		win_cnt <= 0;
    		mng_st <= reset_pedcalc0;
    		
    	When reset_pedcalc0 =>  --0x04
    		ped_calc_enable <= '0';
    		mng_st <= reset_pedcalc1;
    
    	When reset_pedcalc1 =>  --0x05
    		ped_calc_enable <= '1';
    		mng_st <= win_sel1;
	
    	When win_sel1=>  --0x06
    		cur_win_no_i <= std_logic_vector(to_unsigned(win_start_i+win_cnt,9));
    		readout_reset <= '1';
    		readout_trig <= '0';
    		readout_continue <= '0';
    		mng_st <= st_readout_reset_hold1;
    	
    	When st_readout_reset_hold1 =>  --0x07
    		mng_st <= st_readout_reset_hold2;
    
    	When st_readout_reset_hold2 =>  --0x08
    		mng_st <= st_readout_reset_hold3;
    
    	When st_readout_reset_hold3 =>  --0x09
    		mng_st <= st_readout_reset;
    	
    	When st_readout_reset => --0x0a
    		readout_reset <= '0';
    		mng_st	<= st_readout_reset2;

    	When st_readout_reset2 => --0x0b
    		readout_reset <='0';
    		mng_st <=st_readout_reset3;
    		
    	When st_readout_reset3 =>  --0x0c
    		readout_reset <= '0';
    		mng_st <= trig_readout;
    		
    	When trig_readout=> --0x0d
    		readout_trig <= '1';
    		mng_st <= wait_readout_busy_high;
    	
    	When wait_readout_busy_high=> --0x0e
    		if (readout_busy='0') then
    			mng_st <= wait_readout_busy_high;
    		else
    			readout_trig <= '0';
    			mng_st <= wait_readout_done;
    		end if;
    		
    	When wait_readout_done=> --0x0f
    		if (readout_busy='1') then
    			mng_st <= wait_readout_done;
    		else
    			readout_continue <= '1';
    			if (dmx_allwin_done='0') then --still waiting on more trigs on same window and asic- adding to navg
    				mng_st <= win_sel1;
    			else
    				mng_st <= wait_ped_calc_busy_low;
    			end if;
    		end if;
    		
    	When wait_ped_calc_busy_low => --0x10
    		readout_continue<='0';
    		if (ped_calc_busy='1') then
    			mng_st <= wait_ped_calc_busy_low;
    		else-- done with this window- advance to next window
                win_cnt <= win_cnt+4;
    			mng_st <= check_win;
    		end if;

    	When check_win => --0x11
    		if ((win_start_i+win_cnt)<=win_end_i) then
    			mng_st <= reset_pedcalc0;
    		else
    			mng_st <= asic_inc;
    		end if;
    		
    	When asic_inc => --0x12
    			asic_cnt <= asic_cnt+1;
    			mng_st <= check_asic;
    	
    	When check_asic => --0x13
    		if (asic_cnt<10) then
    			mng_st <= asic_sel1;
    		else
    			mng_st <= done;
    		end if;
    
    	When done=> --0x14
    		busy <= '0';
    		mng_st <= idle;
	
    	When Others =>
    		mng_st<=idle;
    	
    	end case;
    end if;
end process;

end Behavioral;
