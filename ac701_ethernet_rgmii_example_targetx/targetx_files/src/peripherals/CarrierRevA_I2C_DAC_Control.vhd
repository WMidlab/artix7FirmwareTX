----------------------------------------------------------------------------------
-- DAC Control for the full board stack
-- Description:
--		Inputs/outputs:
--		
--		INTENDED_DAC_VALUES - input of type Board_Stack_Voltages (see Board_Stack_Definitions.vhd)
--									 These specify the target voltages for the board stack.
--		CURRENT_DAC_VALUES  - output of type Board_Stack_Voltages (see Board_Stack_Definitions.vhd)
--									 These specify the current known voltages for the board stack.
--		CLK_100kHz_MAX		  - clock enable used to drive the IIC state machines.
--    SCL_C 		  		  - output bus for the four IIC SCL lines, ones for each column
--		SDA_C		  			  - inout bus for the four IIC SDA lines, one for each column
--
--		This module handles all the control to set DAC voltages on the various IIC
-- 	buses.  It does not control what the desired voltages are.  That should be 
--    set at a higher level or in a different module, for example from the command
--    parser that accepts fiberoptic commands.
--   
-- Change log:
-- 2011-09-?? - Created by Kurtis
-- 2011-09-29 - Comments/description added to describe basic functionality - Kurtis
-- 2012-11-19 - Modified to use clock enables instead of a slow clock,
--              also removed "current_dac_values" in favor of 1 bit per DAC channel
--              indicating success or failure in the update. - Kurtis
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

package CarrierRevA_DAC_definitions is
	subtype DAC_Setting is std_logic_vector(11 downto 0);
	-- A single LTC2637 has 8 DAC channels, each 12 bits
	type LTC2637_Voltages is array(7 downto 0) of DAC_Setting;
	-- There are 2 LTC2637 DACs per daughter card, so 8 per column.
   type Column_Voltages is array(7 downto 0) of LTC2637_Voltages;
	type Board_Stack_Voltages is array(3 downto 0) of Column_Voltages;
	-- Special data types for DACs across rows/columns (helpful for DACs that might be on feedback)
	type Row_DAC_Values is array(3 downto 0) of DAC_Setting;
	type Column_Row_DAC_Values is array(3 downto 0) of Row_DAC_Values;
	-- Data types of 1-bit width per DAC channel to indicate success or failure
	-- upon an update.
	subtype LTC2637_Statuses is std_logic_vector(7 downto 0);
	type Column_DAC_Statuses is array(7 downto 0) of LTC2637_Statuses;
	type Board_Stack_DAC_Statuses is array(3 downto 0) of Column_DAC_Statuses;
	
	-- Address conventions for the board stack DACs
	subtype LTC2637_Address is std_logic_vector(6 downto 0);
	-- The following are the chosen address conventions
	-- Please note that the "row" refers to the carrier level
	-- and the index 0/1 correspond to which DAC on the daughter
	-- card.  
	-- Index 0 : DAC1
	-- Index 1 : DAC2  
	-- *Recommend a name change on the schematic & silkscreen for consistency.
	-- 
	-- Name (R<row>_(0/1))								IIC Address		CA(2)	CA(1)	CA(0)
	constant DAC_Address_R3_0	: LTC2637_Address := "0010000";--GND	GND	GND
	constant DAC_Address_R3_1	: LTC2637_Address := "0010001";--GND	GND	FLT
	constant DAC_Address_R2_0	: LTC2637_Address := "0110001";--FLT	GND	GND
	constant DAC_Address_R2_1	: LTC2637_Address := "0110010";--FLT	GND	FLT
	constant DAC_Address_R1_0	: LTC2637_Address := "0010011";--GND	FLT	GND
	constant DAC_Address_R1_1	: LTC2637_Address := "0100000";--GND	FLT	FLT
	constant DAC_Address_R0_0	: LTC2637_Address := "1000000";--FLT	FLT	GND
	constant DAC_Address_R0_1	: LTC2637_Address := "1000001";--FLT	FLT	FLT 
   constant DAC_Write_and_Update : std_logic_vector(3 downto 0) := "0011";
	---------------------------------------------------------------------------
end CarrierRevA_DAC_definitions;

package body CarrierRevA_DAC_definitions is
--Nothing in the body 
end CarrierRevA_DAC_definitions;

--


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.CarrierRevA_DAC_definitions.ALL;
-------------------------
-------------------------
-- This part controls a single column of DACs.  Four of these entities are
-- instantiated (see below) to form the whole board stack's worth of DAC
-- control.
-- I'm not sure how to do something like declare a prototype so that this can
-- be used without it appearing above the main part of this block.
-- If you know how to do it, please tell me so we can modify this block for 
-- increased clarity.  -KN
-------------------------

entity Board_Stack_Column_DAC_Control is
	Port ( 
		INTENDED_DAC_VALUES : in  Column_Voltages;
		UPDATE_STATUSES     : out Column_DAC_Statuses;
		CLK                 : in  std_logic;
		CLK_ENABLE          : in  std_logic;
		SCL                 : out std_logic;
		SDA                 : inout std_logic;
		STATE_MONITOR       : out std_logic_vector(2 downto 0)
	);
end Board_Stack_Column_DAC_Control;

architecture Behavioral of Board_Stack_Column_DAC_Control is
---------------------------------------------------------------
	signal internal_INTENDED_DAC_VALUES : Column_Voltages;	
	signal internal_UPDATE_STATUSES     : Column_DAC_Statuses;
	signal internal_SCL                 : std_logic;
	signal internal_SDA                 : std_logic;
	signal internal_ADDRESS		       	: std_logic_vector(6 downto 0);
	signal internal_COMMAND             : std_logic_vector(3 downto 0);
	signal internal_CHANNEL             : std_logic_vector(3 downto 0);
	signal internal_DAC_VALUE           : std_logic_vector(11 downto 0);
	signal internal_UPDATE              : std_logic;
	signal internal_UPDATING 				: std_logic;
	signal internal_UPDATE_SUCCEEDED    : std_logic;

	signal internal_DAC_STATE_MONITOR	: std_logic_vector(2 downto 0);

	type DAC_STATE_TYPE is (SEARCHING_FOR_UPDATES, SETTING_UP_UPDATES, START_UPDATING, WAIT_FOR_UPDATE);
	signal DAC_STATE      : DAC_STATE_TYPE := SEARCHING_FOR_UPDATES;
	
--------------------------------------------------------------	
begin
   ----------------------------------------------------------
	COL_LTC2637 : entity work.LTC2637_I2C_Interface
	port map (
		SCL => internal_SCL,
		SDA => internal_SDA,
		CLK => CLK,
		CLK_ENABLE => CLK_ENABLE,
		UPDATE => internal_UPDATE,
		ADDRESS => internal_ADDRESS,
		COMMAND => internal_COMMAND,
		CHANNEL => internal_CHANNEL,
		DAC_VALUE => internal_DAC_VALUE,
		UPDATING => internal_UPDATING,
		UPDATE_SUCCEEDED => internal_UPDATE_SUCCEEDED
	);
   -----------------------------------------------------------
	SCL <= internal_SCL;
	SDA <= internal_SDA;
	internal_INTENDED_DAC_VALUES <= INTENDED_DAC_VALUES;
	UPDATE_STATUSES <= internal_UPDATE_STATUSES;
	internal_COMMAND <= DAC_Write_and_Update;
	
	STATE_MONITOR <= internal_DAC_STATE_MONITOR;
--------------------------------------------------------------
	
	process (CLK, CLK_ENABLE) 
		variable dac_channel : integer range 0 to 7 := 0;
		variable dac_address : integer range 0 to 7 := 0;
		constant dac_channels : integer := 8;
		constant dac_addresses: integer := 8;
	begin
		if (CLK_ENABLE = '1') then
			if (falling_edge(CLK)) then
				case DAC_STATE is
					when SEARCHING_FOR_UPDATES =>
						internal_DAC_STATE_MONITOR	<= "000";
--						if (internal_UPDATE_STATUSES(dac_address)(dac_channel) /= '1') then
							DAC_STATE <= SETTING_UP_UPDATES;
--						else 
--							if (dac_channel < dac_channels - 1) then
--								dac_channel := dac_channel + 1;
--							else
--								dac_channel := 0;
--								if (dac_address < dac_addresses - 1) then
--									dac_address := dac_address + 1;
--								else
--									dac_address := 0;
--								end if;
--							end if;
--						end if;
					when SETTING_UP_UPDATES =>
						internal_DAC_STATE_MONITOR	<= "001";
						case dac_address is
							when 0 => internal_ADDRESS <= DAC_Address_R0_0;
							when 1 => internal_ADDRESS <= DAC_Address_R0_1;
							when 2 => internal_ADDRESS <= DAC_Address_R1_0;
							when 3 => internal_ADDRESS <= DAC_Address_R1_1;
							when 4 => internal_ADDRESS <= DAC_Address_R2_0;
							when 5 => internal_ADDRESS <= DAC_Address_R2_1;
							when 6 => internal_ADDRESS <= DAC_Address_R3_0;
							when 7 => internal_ADDRESS <= DAC_Address_R3_1;	
						end case;
						internal_CHANNEL <= std_logic_vector(to_unsigned(dac_channel, 4));
						internal_DAC_VALUE <= internal_INTENDED_DAC_VALUES(dac_address)(dac_channel);
						DAC_STATE <= START_UPDATING;
					when START_UPDATING =>
						internal_DAC_STATE_MONITOR	<= "010";				
						internal_UPDATE <= '1';
						if (internal_UPDATING = '1') then
							internal_UPDATE <= '0';
							DAC_STATE <= WAIT_FOR_UPDATE;
						end if;
					when WAIT_FOR_UPDATE =>
						internal_DAC_STATE_MONITOR	<= "011";
						if (internal_UPDATING = '0') then
							if (internal_UPDATE_SUCCEEDED = '1') then
								internal_UPDATE_STATUSES(dac_address)(dac_channel) <= '1';
							else
								internal_UPDATE_STATUSES(dac_address)(dac_channel) <= '0';
							end if;
							if (dac_channel < dac_channels - 1) then
								dac_channel := dac_channel + 1;
							else
								dac_channel := 0;
								if (dac_address < dac_addresses - 1) then
									dac_address := dac_address + 1;
								else
									dac_address := 0;
								end if;
							end if;						
							DAC_STATE <= SEARCHING_FOR_UPDATES;
						end if;
					when others =>
						DAC_STATE <= SEARCHING_FOR_UPDATES;
				end case;
			end if;
		end if;
	end process;
	
end Behavioral;

-------------------------
-------------------------
-- This part is the highest level of this module, and forms the
-- connections to the top level.
-------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.CarrierRevA_DAC_definitions.ALL;

entity CarrierRevA_I2C_DAC_Control is
	Port ( 
		INTENDED_DAC_VALUES  : in Board_Stack_Voltages;
		UPDATE_STATUSES      : out Board_Stack_DAC_Statuses;
		CLK                  : in  std_logic;
		CLK_ENABLE           : in  std_logic;
      SCL_C                : out std_logic_vector(3 downto 0);
		SDA_C                : inout std_logic_vector(3 downto 0)
	);
end CarrierRevA_I2C_DAC_Control;

architecture Behavioral of CarrierRevA_I2C_DAC_Control is
	signal internal_INTENDED_DAC_VALUES      : Board_Stack_Voltages;
	signal internal_UPDATE_STATUSES          : Board_Stack_DAC_Statuses;
	signal internal_SCL_C                    : std_logic_vector(3 downto 0);
	signal internal_SDA_C                    : std_logic_vector(3 downto 0);
begin
	internal_INTENDED_DAC_VALUES <= INTENDED_DAC_VALUES;
	UPDATE_STATUSES              <= internal_UPDATE_STATUSES;
	SDA_C                        <= internal_SDA_C;
	SCL_C                        <= internal_SCL_C;

	map_DAC_Control_COL_GEN : for i in 0 to 3 generate
		map_DAC_Control_COL : entity work.Board_Stack_Column_DAC_Control
			port map (
				INTENDED_DAC_VALUES  => internal_INTENDED_DAC_VALUES(i),
				UPDATE_STATUSES      => internal_UPDATE_STATUSES(i),
				CLK                  => CLK,
				CLK_ENABLE           => CLK_ENABLE,
				SCL                  => internal_SCL_C(i),
				SDA                  => internal_SDA_C(i),
				STATE_MONITOR        => open
			);
	end generate;

end Behavioral;


