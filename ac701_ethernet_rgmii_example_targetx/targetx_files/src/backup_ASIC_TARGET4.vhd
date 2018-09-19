----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:57:12 05/23/2012 
-- Design Name: 
-- Module Name:    ASIC_TARGET4 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
--library UNISIM;
--use UNISIM.VComponents.all;

entity ASIC_TARGET4 is
	generic (
		constant BIT_WIDTH : integer := 363		--Total 363 bits for TARGET4 registers.
	);
	port (
		CLK 				:  in  	STD_LOGIC;
		LOAD_DACs_IN	:  IN		STD_LOGIC;
		UPDATE_DACS		:	IN		STD_LOGIC;
		UPDATE_REGS		:	IN		STD_LOGIC;
		UPDATE_REGS_NUMBER		:	IN		STD_LOGIC_VECTOR(15 DOWNTO 0);
		UPDATE_REGS_DATA			:	IN		STD_LOGIC_VECTOR(15 DOWNTO 0);
		LOAD_DACs_DONE :  out 	STD_LOGIC;
		TRIG_TYPE_val  :  in 	STD_LOGIC;
		SCLK 				:  out 	STD_LOGIC;
		SIN 				:  out 	STD_LOGIC;
		REGCLR			:	OUT	STD_LOGIC;
		PCLK 				:  out 	STD_LOGIC
	);
end ASIC_TARGET4;

architecture Behavioral of ASIC_TARGET4 is
	type STATE_TYPE is 
		(IDLE,
		LOAD_DAC,
		UPDATE
		);
	signal state 				: STATE_TYPE := IDLE;
	signal step_cnt			: std_logic := '0';
	SIGNAL cnt					: integer := 0;	--count 363 bits when clocked in data serially
	type RegDataWord is array( 0 to 9 ) of STD_LOGIC_VECTOR(BIT_WIDTH-1 DOWNTO 0);
	signal REG_DATA			: RegDataWord;
	signal LOAD_DACs		: STD_LOGIC;
	signal UPDATE_DACS_REG  : STD_LOGIC_VECTOR(1 downto 0);
	-----------------------TARGET4 internal DACs values-------------------------
	type dacWord is array( 0 to 9 ) of std_logic_vector( 11 downto 0);
	SIGNAL SGN_ASIC						: STD_LOGIC_VECTOR(9 DOWNTO 0) := (others=>'0');
	SIGNAL Trig_type_ASIC				: STD_LOGIC_VECTOR(9 DOWNTO 0) := (others=>'0');
	SIGNAL Wbias_ASIC						: dacWord := (x"FDC",x"FDC",x"FDC",x"FDC",x"FDC",x"FDC",x"FDC",x"FDC",x"FDC",x"FDC");
	SIGNAL TRGbias_ASIC					: dacWord := (x"006",x"006",x"006",x"006",x"006",x"006",x"006",x"006",x"006",x"006");
	SIGNAL Vbias_ASIC						: dacWord := (x"FFC",x"FFC",x"FFC",x"FFC",x"FFC",x"FFC",x"FFC",x"FFC",x"FFC",x"FFC");
	SIGNAL Trig_thresh_16_ASIC			: dacWord := (x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000");
	SIGNAL Trig_thresh_15_ASIC			: dacWord := (x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000");
	SIGNAL Trig_thresh_14_ASIC			: dacWord := (x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000");
	SIGNAL Trig_thresh_13_ASIC			: dacWord := (x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000");
	SIGNAL Trig_thresh_12_ASIC			: dacWord := (x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000");
	SIGNAL Trig_thresh_11_ASIC			: dacWord := (x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000");
	SIGNAL Trig_thresh_10_ASIC			: dacWord := (x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000");
	SIGNAL Trig_thresh_9_ASIC			: dacWord := (x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000");
	SIGNAL Trig_thresh_8_ASIC			: dacWord := (x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000");
	SIGNAL Trig_thresh_7_ASIC			: dacWord := (x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000");
	SIGNAL Trig_thresh_6_ASIC			: dacWord := (x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000");
	SIGNAL Trig_thresh_5_ASIC			: dacWord := (x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000");
	SIGNAL Trig_thresh_4_ASIC			: dacWord := (x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000");
	SIGNAL Trig_thresh_3_ASIC			: dacWord := (x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000");
	SIGNAL Trig_thresh_2_ASIC			: dacWord := (x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000");
	SIGNAL Trig_thresh_1_ASIC			: dacWord := (x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000",x"000");
	SIGNAL Vbuff_ASIC						: dacWord := (x"FFC",x"FFC",x"FFC",x"FFC",x"FFC",x"FFC",x"FFC",x"FFC",x"FFC",x"FFC");
	SIGNAL CMPbias_ASIC					: dacWord := (x"0FC",x"0FC",x"0FC",x"0FC",x"0FC",x"0FC",x"0FC",x"0FC",x"0FC",x"0FC");
	SIGNAL PUbias_ASIC					: dacWord := (x"007",x"007",x"007",x"007",x"007",x"007",x"007",x"007",x"007",x"007");
	SIGNAL VdlyN_ASIC						: dacWord := (x"FFE",x"FFE",x"FFE",x"FFE",x"FFE",x"FFE",x"FFE",x"FFE",x"FFE",x"FFE");
	SIGNAL VdlyP_ASIC						: dacWord := (x"FF7",x"FF7",x"FF7",x"FF7",x"FF7",x"FF7",x"FF7",x"FF7",x"FF7",x"FF7");
	SIGNAL MonTRGthresh_ASIC			: dacWord := (x"D06",x"D06",x"D06",x"D06",x"D06",x"D06",x"D06",x"D06",x"D06",x"D06");
	SIGNAL SST_SSP_out_ASIC				: STD_LOGIC_VECTOR(9 DOWNTO 0) := (others=>'0');
	SIGNAL DBbias_ASIC					: dacWord := (x"FFC",x"FFC",x"FFC",x"FFC",x"FFC",x"FFC",x"FFC",x"FFC",x"FFC",x"FFC");
	SIGNAL SBbias_ASIC					: dacWord := (x"0DE",x"0DE",x"0DE",x"0DE",x"0DE",x"0DE",x"0DE",x"0DE",x"0DE",x"0DE");
	SIGNAL Isel_ASIC						: dacWord := (x"FFE",x"FFE",x"FFE",x"FFE",x"FFE",x"FFE",x"FFE",x"FFE",x"FFE",x"FFE");
	SIGNAL Vdischarge_ASIC				: dacWord := (x"0C0",x"0C0",x"0C0",x"0C0",x"0C0",x"0C0",x"0C0",x"0C0",x"0C0",x"0C0");
	SIGNAL Vdly_ASIC						: dacWord := (x"FFF",x"FFF",x"FFF",x"FFF",x"FFF",x"FFF",x"FFF",x"FFF",x"FFF",x"FFF");

begin
	
	gen_self_trig: for i in 0 to 9 generate
		REG_DATA(i)	<= SGN_ASIC(i)	& Trig_type_ASIC(i) & Wbias_ASIC(i)	& TRGbias_ASIC(i) & Vbias_ASIC(i) &			
		Trig_thresh_16_ASIC(i) & Trig_thresh_15_ASIC(i) & Trig_thresh_14_ASIC(i) & Trig_thresh_13_ASIC(i) &
		Trig_thresh_12_ASIC(i) & Trig_thresh_11_ASIC(i) & Trig_thresh_10_ASIC(i) & Trig_thresh_9_ASIC(i) &	
		Trig_thresh_8_ASIC(i) & Trig_thresh_7_ASIC(i) & Trig_thresh_6_ASIC(i) & Trig_thresh_5_ASIC(i) &	
		Trig_thresh_4_ASIC(i) & Trig_thresh_3_ASIC(i) & Trig_thresh_2_ASIC(i) & Trig_thresh_1_ASIC(i) &	
		Vbuff_ASIC(i) & CMPbias_ASIC(i) & PUbias_ASIC(i) & VdlyN_ASIC(i) & VdlyP_ASIC(i) & MonTRGthresh_ASIC(i) &
		SST_SSP_out_ASIC(i) & DBbias_ASIC(i) &	SBbias_ASIC(i)	& Isel_ASIC(i) & Vdischarge_ASIC(i) & Vdly_ASIC(i);
		--control trigger type
		Trig_type_ASIC(i) <= TRIG_TYPE_val;
	end generate;

	--process updates DAC register values
	process (CLK) is
	begin
		if ( RISING_EDGE(CLK) ) then	
			if( UPDATE_REGS = '1' ) then
				CASE UPDATE_REGS_NUMBER(15 downto 0) IS
					WHEN x"0000" => --load defaults
						SGN_ASIC <= '0';
						--Trig_type_ASIC <= '0';
						Wbias_ASIC <= x"FDC";
						TRGbias_ASIC <= x"006";
						Vbias_ASIC <= x"FFC";
						Trig_thresh_16_ASIC <= x"000";
						Trig_thresh_15_ASIC <= x"000";
						Trig_thresh_14_ASIC <= x"000";
						Trig_thresh_13_ASIC <= x"000";
						Trig_thresh_12_ASIC <= x"000";
						Trig_thresh_11_ASIC <= x"000";
						Trig_thresh_10_ASIC <= x"000";
						Trig_thresh_9_ASIC <= x"000";
						Trig_thresh_8_ASIC <= x"000";
						Trig_thresh_7_ASIC <= x"000";
						Trig_thresh_6_ASIC <= x"000";
						Trig_thresh_5_ASIC <= x"000";
						Trig_thresh_4_ASIC <= x"000";
						Trig_thresh_3_ASIC <= x"000";
						Trig_thresh_2_ASIC <= x"000";
						Trig_thresh_1_ASIC <= x"000";
						Vbuff_ASIC <= x"FFC";
						CMPbias_ASIC <= x"0FC";
						PUbias_ASIC <= x"007";
						VdlyN_ASIC <= x"FFE";
						VdlyP_ASIC <= x"FF7";
						MonTRGthresh_ASIC <= x"D06";
						SST_SSP_out_ASIC <= '0';
						DBbias_ASIC <=	x"FFC";
						SBbias_ASIC <=	x"0DE";
						Isel_ASIC <=	x"FFE";
						Vdischarge_ASIC <=	x"0C0";
						Vdly_ASIC <=	x"FFF";
					WHEN x"0001" =>
						SGN_ASIC <= UPDATE_REGS_DATA(0);
					WHEN x"0002" =>
						--Trig_type_ASIC <= UPDATE_REGS_DATA(0);
					WHEN x"0003" =>
						Wbias_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"0004" =>
						TRGbias_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"0005" =>
						Vbias_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"0006" =>
						Trig_thresh_16_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"0007" =>
						Trig_thresh_15_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"0008" =>
						Trig_thresh_14_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"0009" =>
						Trig_thresh_13_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"000a" =>
						Trig_thresh_12_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"000b" =>
						Trig_thresh_11_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"000c" =>
						Trig_thresh_10_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"000d" =>
						Trig_thresh_9_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"000e" =>
						Trig_thresh_8_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"000f" =>
						Trig_thresh_7_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"0010" =>
						Trig_thresh_6_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"0011" =>
						Trig_thresh_5_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"0012" =>
						Trig_thresh_4_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"0013" =>
						Trig_thresh_3_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"0014" =>
						Trig_thresh_2_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"0015" =>
						Trig_thresh_1_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"0016" =>
						Vbuff_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"0017" =>
						CMPbias_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"0018" =>
						PUbias_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"0019" =>
						VdlyN_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"001a" =>
						VdlyP_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"001b" =>
						MonTRGthresh_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"001c" =>
						SST_SSP_out_ASIC <= UPDATE_REGS_DATA(0);
					WHEN x"001d" =>
						DBbias_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"001e" =>
						SBbias_ASIC <=	UPDATE_REGS_DATA(11 downto 0);
					WHEN x"001f" =>
						Isel_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"0020" =>
						Vdischarge_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN x"0021" =>
						Vdly_ASIC <= UPDATE_REGS_DATA(11 downto 0);
					WHEN OTHERS =>
				END CASE;
			end if; --check update regs
		end if;
	end process;

	--Edge detector for key internal signals
	process (CLK) begin
		--The only other couple SST clock processes work on falling edges, so we should be consistent here
		if (falling_edge(CLK)) then	
			UPDATE_DACS_REG(1) <= UPDATE_DACS_REG(0);
			UPDATE_DACS_REG(0) <= UPDATE_DACS;
		end if;
	end process;
	PCLK <= '1' when (UPDATE_DACS_REG = "01") else
	                    '0';

	--SYNC
	SYNC_PROC: process (CLK)
   begin
		--The only other couple SST clock processes work on falling edges, so we should be consistent here
		if (rising_edge(CLK)) then	
			LOAD_DACs <= LOAD_DACs_IN;
		end if;
	end process;
	
	--process to load DACs to ASIC
	SERIAL_CONFIG_DAC_TARGET4 : PROCESS(CLK)
	BEGIN
		------------------------------------------------------------
		IF RISING_EDGE(CLK) THEN
			REGCLR	<= '0';
			------------------------------------------------------------
			CASE STATE IS
				--------------------------------
				WHEN IDLE =>
					SCLK		<= '0';
					SIN		<= '0';
					cnt 		<= 0;
					step_cnt <= '0';
					if LOAD_DACs = '1' then
						state <= LOAD_DAC;
						LOAD_DACs_DONE <= '0';
					else
						state <= IDLE;
						LOAD_DACs_DONE <= '1';
					end if;
				--------------------------------
				WHEN LOAD_DAC =>
					if cnt < BIT_WIDTH then
						if step_cnt = '0' then 
							SCLK <= '0';
							step_cnt <= '1';
							SIN <= REG_DATA(cnt);	--SLB is sent first as "cnt" increasing.
						--elsif step_cnt = "01" then
						--	SIN <= REG_DATA(cnt);	--SLB is sent first as "cnt" increasing.
						--	step_cnt <= "10";
						else
							SCLK <= '1';
							cnt <= cnt + 1;
							step_cnt <= '0';
						end if;
					else	--after 363 bits are clocked in
						SCLK <= '0';						
						state <= IDLE;
						cnt <= 0;
						step_cnt <= '0';
						LOAD_DACs_DONE <= '1';
					end if;
				--------------------------------
				WHEN OTHERS =>
					state <= IDLE;
			END CASE;
			------------------------------------------------------------
		END IF;
		------------------------------------------------------------
	END PROCESS SERIAL_CONFIG_DAC_TARGET4;
	
end Behavioral;

