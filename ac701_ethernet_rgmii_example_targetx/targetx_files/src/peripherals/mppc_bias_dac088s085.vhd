----------------------------------------------------------------------------------
-- Company: UH Manoa- Department of Physics
-- Engineer: Isar Mostafanezhad
-- 
-- Create Date:    15:32:50 03/30/2015 
-- Design Name: 	
-- Module Name:    mppc_bias_dac088s085 - Behavioral 
-- Project Name: KLM readout for BELLE II- KLM_SCROD
-- Target Devices: SP6
-- Tool versions: ISE 14.7
-- Description: FW for controlling and writing to MPPC bias DACs
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

entity mppc_bias_dac088s085 is
    Port ( clk : in  STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR (3 downto 0);
           val : in  STD_LOGIC_VECTOR (7 downto 0);
           update : in  STD_LOGIC;
           busy : out  STD_LOGIC;
           SCLK : out  STD_LOGIC;
           SYNC_n : out  STD_LOGIC;
           DIN : out  STD_LOGIC
			  );
end mppc_bias_dac088s085;

architecture Behavioral of mppc_bias_dac088s085 is

signal addr_i:std_logic_vector(3 downto 0);
signal val_i:std_logic_vector(7 downto 0);
signal update_i:std_logic_vector(1 downto 0);
type dac_data_array is array(1 downto 0) of std_logic_vector(31 downto 0);	

signal data: dac_data_array;
constant cmd_wtm:std_logic_vector(15 downto 0):="1001000000000000";
constant wait_max:integer:=1000;

signal bit_cnt:integer:=0;
signal data_cnt:integer:=0;
signal wait_cnt:integer:=0;

type state_type is 
		(st_idle,st_setupWTM,st_set_bitcnt,st_setup_din,st_set_sclk_lo,st_dec_bitcnt,st_send_bits,st_wait_end);

signal st: state_type:=st_idle;

begin

latch2clk: process (clk)
begin
	if (rising_edge(clk)) then
		update_i<=update_i(0) & update;
	end if;
end process;

latch2update: process (update)
begin
	if (rising_edge(update)) then
		addr_i<=addr;
		val_i<=val;
	end if;
end process;

process (clk)
begin

	if (rising_edge(clk)) then 
-- state machine for sending signals to the DAC		
	case st is
	
	when st_idle=>
		SCLK<='1';
		SYNC_n<='1';
		DIN<='0';
		if (update_i="01") then 
			st<=st_setupWTM;
			busy<='1';
		else 
			st<=st_idle;
			busy<='0';
		end if;
	
	when st_setupWTM=>
		data(0)<=cmd_wtm & cmd_wtm;
		if (addr_i(3)='0') then
			data(1)<=cmd_wtm & '0' & addr_i(2 downto 0) & val_i & "0000";
		else
			data(1)<='0' & addr_i(2 downto 0) & val_i & "0000" & cmd_wtm;
		end if;
		data_cnt<=0;
		SCLK<='1';
		SYNC_n<='0';
		DIN<='0';
		st<=st_set_bitcnt;

	when st_set_bitcnt =>
		SCLK<='1';
		SYNC_n<='0';
		DIN<='0';
		bit_cnt<=31;
		st<=st_setup_din;
		
	when st_setup_din =>
		SCLK<='1';
		SYNC_n<='0';
		DIN<=data(data_cnt)(bit_cnt);
		st<=st_set_sclk_lo;

	when st_set_sclk_lo =>
		SCLK<='0';
		SYNC_n<='0';
		DIN<=data(data_cnt)(bit_cnt);
		st<=st_dec_bitcnt;
		
	
--	when st_set_sclk_hi =>
--		SCLK<='1';
--		SYNC_n<='0';
--		DIN<=data(data_cnt)(bit_cnt);
--		st<=st_dec_bitcnt;

	when st_dec_bitcnt =>
		if (bit_cnt/=0) then 
			SCLK<='1';
			SYNC_n<='0';
			DIN<='0';
			bit_cnt<=bit_cnt-1;
			st<=st_setup_din;
		else
			if (data_cnt=0) then
				SCLK<='0';
				SYNC_n<='1';
				DIN<='0';
				data_cnt<=data_cnt+1;
				st<=st_set_bitcnt;
			else
				SCLK<='0';
				SYNC_n<='1';
				DIN<='0';
				st<=st_wait_end;
			end if;
		end if;

	when st_wait_end =>
		SCLK<='1';
		SYNC_n<='1';
		DIN<='0';
		st<=st_idle;
	
	
	when others =>
		st<=st_idle;
	
	
	end case;
	
	
	end if;
	


end process;



end Behavioral;










