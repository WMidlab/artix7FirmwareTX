----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:37:23 06/03/2011 
-- Design Name: 
-- Module Name:    LTC2637_I2C_Interface - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--		This module talks by I2C to an LTC2637.  Upon receipt of 
--    UPDATE, it will set UPDATING high and 
--    attempt to send the command corresponding to the proper 
--    ADDRESS, COMMAND, CHANNEL, and DAC_VALUE.  At this time, 
--    UPDATE_SUCCEEDED will be dropped low.  Once the request
--    has been acknowledged, UPDATE should be released to '0'. 
--    If the command is successful (i.e., all acnkowledge bits were
--    properly seen), UPDATE_SUCCEEDED will be set high and remain
--    so until the next command.  If the command fails, it will be set 
--    low and remain so until the next command.
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

entity LTC2637_I2C_Interface is
    Port ( SCL				: out STD_LOGIC;
			  SDA				: inout STD_LOGIC;
			  CLK          : in STD_LOGIC;
			  CLK_ENABLE   : in STD_LOGIC;
			  ADDRESS      : in STD_LOGIC_VECTOR(6 downto 0);
			  COMMAND      : in STD_LOGIC_VECTOR(3 downto 0);
			  CHANNEL      : in STD_LOGIC_VECTOR(3 downto 0);
			  DAC_VALUE    : in STD_LOGIC_VECTOR(11 downto 0);
			  UPDATE       : in STD_LOGIC;			  
			  UPDATING     : out STD_LOGIC;
			  UPDATE_SUCCEEDED    : out STD_LOGIC);
end LTC2637_I2C_Interface;

architecture Behavioral of LTC2637_I2C_Interface is

	signal internal_SDA         : std_logic := '1';
	signal internal_SCL         : std_logic := '1';
	signal internal_UPDATING : std_logic := '0';
	signal internal_UPDATE_SUCCEEDED    : std_logic := '0';
	signal internal_DAC_BYTE1 : std_logic_vector(7 downto 0);
	signal internal_DAC_BYTE2 : std_logic_vector(7 downto 0);
	signal internal_DAC_BYTE3 : std_logic_vector(7 downto 0);
	signal internal_DAC_BYTE_TO_SEND : std_logic_vector(7 downto 0) := x"00";

	type IIC_LTC2637_STATE_TYPE is (IDLE,SEND_ADDRESS,SEND_WRITE_BIT,SEND_CLOCK_PULSE,WAIT_FOR_ACK,CHECK_ACK,SEND_BYTE,STOP,WAIT_AFTER_STOP);
	signal IIC_STATE      : IIC_LTC2637_STATE_TYPE := IDLE;
	signal NEXT_IIC_STATE : IIC_LTC2637_STATE_TYPE := IDLE;

begin

SCL <= internal_SCL;
SDA <= internal_SDA;
UPDATING <= internal_UPDATING;
UPDATE_SUCCEEDED <= internal_UPDATE_SUCCEEDED;

--Moved this below so that these bytes are registered on a clock edge at the beginning of the update cycle
--internal_DAC_BYTE1 <= COMMAND & CHANNEL;
--internal_DAC_BYTE2 <= DAC_VALUE(11 downto 4);
--internal_DAC_BYTE3 <= DAC_VALUE(3 downto 0) & x"0";

process(CLK, CLK_ENABLE, UPDATE) 
	variable bit_counter  : integer range 0 to 15;
	variable byte_counter : integer range 0 to 7;
	variable toggle_counter  : integer range 0 to 3;	
	variable stop_counter : integer range 0 to 63;
	variable stop_pulse_counter : integer range 0 to 7;
begin
	if (CLK_ENABLE = '1') then
		if (rising_edge(CLK)) then
			if (UPDATE = '1' and internal_UPDATING = '0') then
				internal_UPDATING <= '1';
				internal_DAC_BYTE1 <= COMMAND & CHANNEL;
				internal_DAC_BYTE2 <= DAC_VALUE(11 downto 4);
				internal_DAC_BYTE3 <= DAC_VALUE(3 downto 0) & x"0";
			else
				case IIC_STATE is
					when IDLE =>
						internal_SCL <= '1';
						internal_SDA <= '1';
						byte_counter := 0;
						bit_counter := 0;
						if (internal_UPDATING = '1') then
							internal_UPDATE_SUCCEEDED <= '0';
							--SDA low with SCL high initiates start of command						
							internal_SDA <= '0'; 
							IIC_STATE <= SEND_ADDRESS;
						end if;
						
					when SEND_ADDRESS =>
						byte_counter := 0;					
						internal_SCL <= '0';
						internal_SDA <= ADDRESS(6-bit_counter);
						IIC_STATE <= SEND_CLOCK_PULSE;
						toggle_counter := 0;
						if (bit_counter < 6) then
							NEXT_IIC_STATE <= SEND_ADDRESS;
						else 
							NEXT_IIC_STATE <= SEND_WRITE_BIT;
						end if;

					when SEND_WRITE_BIT =>
						internal_SCL <= '0';
						internal_SDA <= '0';
						IIC_STATE <= SEND_CLOCK_PULSE;
						toggle_counter := 0;
						byte_counter := 1;					
						NEXT_IIC_STATE <= WAIT_FOR_ACK;
						
					when SEND_CLOCK_PULSE =>
						if (toggle_counter = 0) then
							internal_SCL <= '1';
						else
							internal_SCL <= '0';
						end if;
						if (toggle_counter < 1) then
							toggle_counter := toggle_counter + 1;
						else
							internal_SCL <= '0';
							bit_counter := bit_counter + 1;
							toggle_counter := 0;
							IIC_STATE <= NEXT_IIC_STATE;
						end if;

					when WAIT_FOR_ACK =>
						internal_SDA <= 'Z';
						if (toggle_counter = 0) then
							toggle_counter := toggle_counter + 1;
							IIC_STATE <= WAIT_FOR_ACK;
						else
							internal_SCL <= '1';
							toggle_counter := 0;
							IIC_STATE <= CHECK_ACK;						
						end if;
						
					when CHECK_ACK =>
						if (internal_SDA = '1') then
							stop_counter := 0;
							IIC_STATE <= WAIT_AFTER_STOP;
						else 
							bit_counter := 0;
							IIC_STATE <= SEND_BYTE;						
							if (byte_counter = 1) then
								internal_DAC_BYTE_TO_SEND <= internal_DAC_BYTE1;
							elsif (byte_counter = 2) then
								internal_DAC_BYTE_TO_SEND <= internal_DAC_BYTE2;
							elsif (byte_counter = 3) then
								internal_DAC_BYTE_TO_SEND <= internal_DAC_BYTE3;
							elsif (byte_counter > 3) then
								stop_pulse_counter := 0;
								IIC_STATE <= STOP;
							end if;
						end if;

					when SEND_BYTE => 
						internal_SCL <= '0';
						internal_SDA <= internal_DAC_BYTE_TO_SEND(7-bit_counter);
						IIC_STATE <= SEND_CLOCK_PULSE;
						toggle_counter := 0;
						if (bit_counter < 7) then
							NEXT_IIC_STATE <= SEND_BYTE;
						else 
							byte_counter := byte_counter + 1;					
							NEXT_IIC_STATE <= WAIT_FOR_ACK;
						end if;
						
					when STOP =>
						if (stop_pulse_counter = 0) then
							internal_SCL <= '0';
							stop_pulse_counter := stop_pulse_counter + 1;
						elsif (stop_pulse_counter = 1) then
							internal_SCL <= '1';
							stop_pulse_counter := stop_pulse_counter + 1;						
						else 
							internal_SDA <= '1';
							stop_counter := 0;
							internal_UPDATE_SUCCEEDED <= '1';						
							IIC_STATE <= WAIT_AFTER_STOP;
						end if;

					when WAIT_AFTER_STOP =>
						if (stop_counter < 60) then
							IIC_STATE <= WAIT_AFTER_STOP;
							stop_counter := stop_counter + 1;
						else
							internal_UPDATING <= '0';					
							IIC_STATE <= IDLE;
						end if;
						
					when others =>
						IIC_STATE <= IDLE;
				end case;			
			end if;
		end if;
	end if;
end process;

end Behavioral;

