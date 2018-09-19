----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:09:20 04/12/2013 
-- Design Name: 
-- Module Name:    Module_ADC_MCP3221_I2C - Behavioral 
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
-- History:  Wicked Minds Electronics, 2012may15, Stripped down. Added IDLE.
--           Felix Bertram, 2002jan11, Created.
-- Source: http://www.fpgarelated.com/usenet/fpga/show/43649-1.php

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

entity Module_ADC_MCP3221_I2C_new is
	port(
		clock	: in std_logic;	--40MHz clock on Univ. Eval RevA board
		reset	: in std_logic;
		
		sda	: inout std_logic;
		scl	: out std_logic;
		
		runADC			: in std_logic;
		enOutput			: out std_logic;
		ADCOutput		: OUT std_logic_vector(11 downto 0)	--12 bit

	);

end Module_ADC_MCP3221_I2C_new;

architecture Behavioral of Module_ADC_MCP3221_I2C_new is



	--=============================================================================
	
		---==================================		
--		Part#					Address
--		MCP3221A0T			000
--		MCP3221A1T			001
--		MCP3221A2T			010
--		MCP3221A3T			011
--		MCP3221A4T			100
--		MCP3221A5T			101
--		MCP3221A6T			110
--		MCP3221A7T			111
---==================================
--		constant DevCode			: std_logic_vector(3 downto 0):= "1001";
		constant DevCode			: std_logic_vector(3 downto 0):= "1001";
		
		constant AddrBitA0T			: std_logic_vector(2 downto 0):= "000";
		constant AddrBitA1T			: std_logic_vector(2 downto 0):= "001";
		constant AddrBitA2T			: std_logic_vector(2 downto 0):= "010";
		constant AddrBitA3T			: std_logic_vector(2 downto 0):= "011";
		constant AddrBitA4T			: std_logic_vector(2 downto 0):= "100";
		constant AddrBitA5T			: std_logic_vector(2 downto 0):= "101";
		constant AddrBitA6T			: std_logic_vector(2 downto 0):= "110";
		constant AddrBitA7T			: std_logic_vector(2 downto 0):= "111";
		
		----------------------------------------------------------------
		constant DeviceAddress				: STD_LOGIC_VECTOR(6 DOWNTO 0) := DevCode & AddrBitA7T;
--		constant DeviceAddress				: STD_LOGIC_VECTOR(6 DOWNTO 0) := DevCode & AddrBitA5T;
		signal	dataToWrite					: std_logic_vector(7 downto 0) := DeviceAddress & '1'; --read mode
		signal	dataToRead					: std_logic_vector(7 downto 0);
		
	--=============================================================================
	signal   idxBit :         unsigned(3 downto 0);
	signal   idxCyc :         unsigned(1 downto 0);

	signal	readyForNextState : std_logic;
	signal	readUpperByte		: std_logic;
	
	signal	clkCounter :		unsigned(15 downto 0);
	signal	dbgcntr	:			unsigned(15 downto 0);

	type I2C_STATE_TYPE is
		(
			st_idle,
			st_start,
			
			st_read_byte,
			st_write_byte,
			st_wait_for_ack,
			st_send_ack,
			st_send_no_ack,
			
			st_stop
		);
		
	signal state		: I2C_STATE_TYPE := st_idle;
	
	signal upperDataByte, LowerDataByte		:std_logic_vector(7 downto 0);
	
	signal i_runADC	: std_logic;



begin
	
	process (clock, reset) --40MHz clock
	begin
		if reset= '1' then
			clkCounter<= (others=>'0');
		elsif rising_edge(clock) then
			clkCounter <= clkCounter + 1;
			dbgcntr <= dbgcntr+1;
		end if;
	end process;
	
	process (clock, reset)
	begin
		if reset='1' then
			i_runADC <= '0';
		elsif rising_edge(clock) then
			if runADC= '1' and state = st_idle then
				i_runADC <= '1';
			elsif i_runADC = '1' and state = st_stop then
				i_runADC <= '0';
			end if;
		end if;
	end process;
	
	process (clkCounter(14), reset)  --~97.66kHz
	begin
		if reset='1' then
			idxCyc <= "00";
			idxbit <= "0000";
			state	 <= st_idle;
			readyForNextState <= '1';
		elsif rising_edge(clkCounter(14)) then
			if readyForNextState = '1' then
				--idle ==> start
				if state = st_idle and i_runADC = '1'  then
				--if state = st_idle  then
					state <= st_start;
					readyForNextState <= '0';
					idxCyc <= "00";
				--start ==>	write
				elsif state = st_start  then
					state <= st_write_byte;
					readyForNextState <= '0';
					idxCyc <= "00";
					idxBit <= "0000";
				--write ==> wait for ack
				elsif state = st_write_byte  then
					state <= st_wait_for_ack;
					readyForNextState <= '0';
					idxCyc <= "00";
					idxBit <= "0000";
					
				--wait for ack ==> read upper byte
				elsif state = st_wait_for_ack then
					state <= st_read_byte;
					
					readyForNextState <= '0';
					idxCyc <= "00";
					idxBit <= "0000";			
					
				--read upper byte ==>send ack
				elsif state = st_read_byte and readUpperByte='1' then
					upperDataByte <= dataToRead;
					state <= st_send_ack;
					readUpperByte<='0';
					readyForNextState <= '0';
					idxCyc <= "00";
					idxBit <= "0000";
				
				--send ack ==> read lower byte
				elsif state = st_send_ack  then
					
					state <= st_read_byte;
					readyForNextState <= '0';
					idxCyc <= "00";
					idxBit <= "0000";	
				
				--read lower byte ==> send no ack
				elsif state = st_read_byte and readUpperByte= '0' then
					lowerDataByte <= dataToRead;
					state <= st_send_no_ack;
					readUpperByte <= '1';
					readyForNextState <= '0';
					idxCyc <= "00";
					idxBit <= "0000";
				
				--send no ack ==> stop
				elsif state = st_send_no_ack  then
					state <= st_stop;
					readyForNextState <= '0';
					idxCyc <= "00";
					idxBit <= "0000";	
				
				--stop ==> idle
				elsif state = st_stop  then
					state <= st_idle;
					readyForNextState <= '0';
					idxCyc <= "00";
					idxBit <= "0000";
				end if;			
					
			
			else --if readyForNextState = '0'
			
				case state is
					when st_start =>
						if idxCyc= 0 then
							scl<= '0';
							idxCyc<= idxCyc + 1;
						elsif idxCyc= 1 then
							sda<= '1';
							idxCyc<= idxCyc + 1;
						elsif idxCyc= 2 then
							scl<= '1';
							idxCyc<= idxCyc + 1;
						elsif idxCyc= 3 then
							sda<= '0';
							readyForNextState <= '1';
						end if;
						
					when st_write_byte =>
						if idxBit < 8 then
							if idxCyc = 0 then
								scl		<= '0';
								idxCyc	<= idxCyc + 1;
							elsif idxCyc= 1 then
								sda		<= DataToWrite(to_integer(7 - idxBit));
								idxCyc	<= idxCyc + 1;
							elsif idxCyc= 2 then
								scl		<= '1';
								idxCyc	<= idxCyc + 1;
							elsif idxCyc= 3 then
								idxCyc	<= "00";
								idxBit	<= idxBit + 1;
							end if;
						else
							--wait for state change
							readyForNextState <= '1';
						end if;
						
					when st_read_byte  =>
						if idxBit < 8 then
							if idxCyc = 0 then
								scl		<= '0';
								sda <= 'Z';
								idxCyc	<= idxCyc + 1;
							elsif idxCyc= 1 then
								
								idxCyc	<= idxCyc + 1;
							elsif idxCyc= 2 then
								scl		<= '1';
								idxCyc	<= idxCyc + 1;
							elsif idxCyc= 3 then
								dataToRead(to_integer(7 - idxBit)) <= sda;
								idxCyc	<= "00";
								idxBit	<= idxBit + 1;
							end if;
						else	--idxBit = 8
							--wait for state change
							readyForNextState <= '1';
						end if;
						
					when st_wait_for_ack =>
						if idxCyc= 0 then
							scl<= '0';
							idxCyc<= idxCyc + 1;
						elsif idxCyc= 1 then
							sda<= 'Z';
							--sda<= '1';
							idxCyc<= idxCyc + 1;
						elsif idxCyc= 2 then
							scl<= '1';
							--sda<='Z';
							idxCyc<= idxCyc + 1;
						elsif idxCyc= 3 then
	--						if sda = '0' then
	--						else
	--						end if;
							readyForNextState <= '1';
						end if;

					when st_send_ack =>
						if idxCyc= 0 then
							scl<= '0';
							idxCyc<= idxCyc + 1;
						elsif idxCyc= 1 then
							sda<= '0';
							idxCyc<= idxCyc + 1;
						elsif idxCyc= 2 then
							scl<= '1';
							--sda<= '0';
							idxCyc<= idxCyc + 1;
						elsif idxCyc= 3 then
							scl <= '1';
							--sda <= 'Z';
							readyForNextState <= '1';
						end if;

					when st_send_no_ack =>
						if idxCyc= 0 then
							scl<= '0';
							idxCyc<= idxCyc + 1;
						elsif idxCyc= 1 then
							sda<= '1';
							idxCyc<= idxCyc + 1;
						elsif idxCyc= 2 then
							scl<= '1';
							--sda<= '1';
							idxCyc<= idxCyc + 1;
						elsif idxCyc= 3 then
							readyForNextState <= '1';
						end if;	
						
					when st_stop =>
						if idxCyc= 0 then
							scl<= '0';
							idxCyc<= idxCyc + 1;
						elsif idxCyc= 1 then
							sda<= '0';
							idxCyc<= idxCyc + 1;
						elsif idxCyc= 2 then
							scl<= '1';
							idxCyc<= idxCyc + 1;
						elsif idxCyc= 3 then
							sda<= '1';
							readyForNextState <= '1';
						end if;				

					when st_idle =>
						scl<= '1';
						sda<= '1';
						readyForNextState <= '1';
				end case;
			end if;		--end of "if readyForNextState"
		end if;	--end of "reset"
	end process;
	
	
	
	ADCOutput <= upperDataByte(3 downto 0) & lowerDataByte;
--	ADCOutput <= std_logic_vector(dbgcntr(15 downto 4));-- debug counter just o spit out dummy 

end Behavioral;
























