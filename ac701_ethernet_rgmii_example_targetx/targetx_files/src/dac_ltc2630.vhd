----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:20:53 08/03/2015 
-- Design Name: 
-- Module Name:    dac_ltc2630 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dac_ltc2630 is --for 12 bit dac
    Port ( clk 		: 	in  STD_LOGIC;
           data 		: 	in  STD_LOGIC_VECTOR (11 downto 0);
           update 	: 	in  STD_LOGIC;
           busy 		: 	out STD_LOGIC;
			  out_valid	:	out std_logic;
			  SCK			:	out std_logic;
			  SDI			:	out std_logic;
			  CSnLD		: 	out std_logic);
			  
end dac_ltc2630;

architecture Behavioral of dac_ltc2630 is

signal update_i:std_logic_vector(1 downto 0);
signal data_i:	 std_logic_vector(11 downto 0);

type state_type is 
		(st_init,st_idle,st_setupWTM,st_set_bitcnt,st_setup_SDI,st_set_SCK_hi,st_dec_bitcnt,st_send_bits,st_wait_end);

signal st: state_type:=st_idle;

signal CSn:std_logic;
signal cmd_w:std_logic_vector(3 downto 0):="0011";-- write to and update
signal cmd_pack:std_logic_vector(23 downto 0);
signal bit_cnt :integer:=0;

begin

latch2clk: process (clk)
begin
	if (rising_edge(clk)) then
		update_i<=update_i(0) & update;
--		data_i<=data;
	end if;
end process;

latch2update: process (update)
begin
	if (rising_edge(update)) then
	end if;
end process;

CSnLD<= CSn;

process (clk)
begin

	if (rising_edge(clk)) then 
-- state machine for senSDIg signals to the DAC		
	case st is
	
	when st_init=>
		out_valid<='0';-- first time up: shutdown HV 
		st<=st_idle;
	
	when st_idle=>
		SCK<='0';
		CSn<='0';
		SDI<='0';
		if (update_i="01") then 
			data_i<=data;
			busy<='1';
			st<=st_setupWTM;
		else 
			busy<='0';
			st<=st_idle;
		end if;
	
	when st_setupWTM=>
		cmd_pack<=cmd_w & "0000" & data_i & "0000";
		SCK<='0';
		CSn<='1';
		SDI<='0';
		st<=st_set_bitcnt;

	when st_set_bitcnt =>
		SCK<='0';
		CSn<='0';
		SDI<='0';
		bit_cnt<=23;
		st<=st_setup_SDI;
		
	when st_setup_SDI =>
		SCK<='0';
		CSn<='0';
		SDI<=cmd_pack(bit_cnt);
		st<=st_set_SCK_hi;

	when st_set_SCK_hi =>
		SCK<='1';
		CSn<='0';
		SDI<=cmd_pack(bit_cnt);
		st<=st_dec_bitcnt;

	when st_dec_bitcnt =>
		if (bit_cnt/=0) then 
			SCK<='0';
			CSn<='0';
			SDI<=cmd_pack(bit_cnt);
			bit_cnt<=bit_cnt-1;
			st<=st_setup_SDI;
		else
			SCK<='0';
			CSn<='1';
			SDI<='0';
			st<=st_wait_end;
		end if;

	when st_wait_end =>
		SCK<='0';
		CSn<='1';
		SDI<='0';
		out_valid<='1';
		st<=st_idle;
	
	
	when others =>
		st<=st_idle;
	
	
	end case;
	
	
	end if;
	


end process;



end Behavioral;

