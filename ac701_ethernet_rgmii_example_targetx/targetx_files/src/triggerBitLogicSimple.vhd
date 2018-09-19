----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:43:03 02/08/2013 
-- Design Name: 
-- Module Name:    triggerBitLogic - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity triggerBitLogicSimple is
    Port ( CLK : in  STD_LOGIC;
           TRIGGER_IN : in  STD_LOGIC;
			  LOAD_DACs_DONE_in : in  STD_LOGIC;
			  SEND_PACKET : out  STD_LOGIC;
			  PACKETSENT_IN : in  STD_LOGIC;
			  MAKE_READY : out std_logic;
           LOAD_DACs : out  STD_LOGIC;
           WRITE_DACs : out  STD_LOGIC;
           TRIG_TYPE_val : out  STD_LOGIC;
			  TDC_TRG_1_IN : in STD_LOGIC_VECTOR(9 downto 0);
			  TDC_TRG_2_IN : in STD_LOGIC_VECTOR(9 downto 0);			
			  TDC_TRG_3_IN : in STD_LOGIC_VECTOR(9 downto 0);
			  TDC_TRG_4_IN : in STD_LOGIC_VECTOR(9 downto 0);
			  TDC_TRG_16_IN : in STD_LOGIC_VECTOR(9 downto 0);
			  TDC_TRG_1_out0 : out STD_LOGIC_VECTOR(9 downto 0);
			  TDC_TRG_2_out0 : out STD_LOGIC_VECTOR(9 downto 0);			
			  TDC_TRG_3_out0 : out STD_LOGIC_VECTOR(9 downto 0);
			  TDC_TRG_4_out0 : out STD_LOGIC_VECTOR(9 downto 0);
			  TDC_TRG_16_out0 : out STD_LOGIC_VECTOR(9 downto 0);
			  TDC_TRG_1_out1 : out STD_LOGIC_VECTOR(9 downto 0);
			  TDC_TRG_2_out1 : out STD_LOGIC_VECTOR(9 downto 0);			
			  TDC_TRG_3_out1 : out STD_LOGIC_VECTOR(9 downto 0);
			  TDC_TRG_4_out1 : out STD_LOGIC_VECTOR(9 downto 0);
			  TDC_TRG_16_out1 : out STD_LOGIC_VECTOR(9 downto 0)
			  --LATCH_TEST_OUT	:out STD_LOGIC
			  );
end triggerBitLogicSimple;

architecture Behavioral of triggerBitLogicSimple is

	--state machine for trigger bit recording
	--Insert the following in the architecture before the begin keyword
   --Use descriptive names for the states, like st1_reset, st2_searc	
   type state_type is (st1_WaitTrigger, st2_WaitPacketSend, st3_SendMakeReady, st4_WaitReset); 
   signal state : state_type := st1_WaitTrigger;
	signal next_state : state_type := st1_WaitTrigger;
	
	signal LOAD_DACs_DONE : std_logic := '0';
   signal PACKETSENT : std_logic := '0';
	signal REQ_PACKET : std_logic := '0';
	signal internal_TRIGGER : std_logic := '0';
	signal LATCH_TRGBITS_0 : std_logic := '0';
	signal LATCH_TRGBITS_1 : std_logic := '0';
	signal ENABLE_COUNTER : std_logic := '0';
	signal INTERNAL_COUNTER	: UNSIGNED(15 downto 0);
	signal TRIGGER_REG : std_logic_vector(1 downto 0) := "00";
	signal LATCH_TRGBITS_0_REG : std_logic_vector(1 downto 0) := "00";
	signal LATCH_TRGBITS_1_REG : std_logic_vector(1 downto 0) := "00";
	
	signal TDC_TRG_16_d0				: std_logic_vector(9 downto 0);
	signal TDC_TRG_4_d0					: std_logic_vector(9 downto 0);
	signal TDC_TRG_3_d0					: std_logic_vector(9 downto 0);
	signal TDC_TRG_2_d0					: std_logic_vector(9 downto 0);
	signal TDC_TRG_1_d0					: std_logic_vector(9 downto 0);

	signal TDC_TRG_16_d1				: std_logic_vector(9 downto 0);
	signal TDC_TRG_4_d1					: std_logic_vector(9 downto 0);
	signal TDC_TRG_3_d1					: std_logic_vector(9 downto 0);
	signal TDC_TRG_2_d1					: std_logic_vector(9 downto 0);
	signal TDC_TRG_1_d1					: std_logic_vector(9 downto 0);
	
	signal TDC_TRG_16_d2				: std_logic_vector(9 downto 0);
	signal TDC_TRG_4_d2					: std_logic_vector(9 downto 0);
	signal TDC_TRG_3_d2					: std_logic_vector(9 downto 0);
	signal TDC_TRG_2_d2					: std_logic_vector(9 downto 0);
	signal TDC_TRG_1_d2					: std_logic_vector(9 downto 0);
	
	signal TDC_TRG_16_d3				: std_logic_vector(9 downto 0);
	signal TDC_TRG_4_d3					: std_logic_vector(9 downto 0);
	signal TDC_TRG_3_d3					: std_logic_vector(9 downto 0);
	signal TDC_TRG_2_d3					: std_logic_vector(9 downto 0);
	signal TDC_TRG_1_d3					: std_logic_vector(9 downto 0);
	
	signal TDC_TRG_16_d4				: std_logic_vector(9 downto 0);
	signal TDC_TRG_4_d4					: std_logic_vector(9 downto 0);
	signal TDC_TRG_3_d4					: std_logic_vector(9 downto 0);
	signal TDC_TRG_2_d4					: std_logic_vector(9 downto 0);
	signal TDC_TRG_1_d4					: std_logic_vector(9 downto 0);
	
	signal TDC_TRG_16_d5				: std_logic_vector(9 downto 0);
	signal TDC_TRG_4_d5					: std_logic_vector(9 downto 0);
	signal TDC_TRG_3_d5					: std_logic_vector(9 downto 0);
	signal TDC_TRG_2_d5					: std_logic_vector(9 downto 0);
	signal TDC_TRG_1_d5					: std_logic_vector(9 downto 0);
	
	signal TDC_TRG_16_d6				: std_logic_vector(9 downto 0);
	signal TDC_TRG_4_d6					: std_logic_vector(9 downto 0);
	signal TDC_TRG_3_d6					: std_logic_vector(9 downto 0);
	signal TDC_TRG_2_d6					: std_logic_vector(9 downto 0);
	signal TDC_TRG_1_d6					: std_logic_vector(9 downto 0);
	
	signal TDC_TRG_16_ext				: std_logic_vector(9 downto 0);
	signal TDC_TRG_4_ext					: std_logic_vector(9 downto 0);
	signal TDC_TRG_3_ext					: std_logic_vector(9 downto 0);
	signal TDC_TRG_2_ext					: std_logic_vector(9 downto 0);
	signal TDC_TRG_1_ext					: std_logic_vector(9 downto 0);
	signal TDC_TRG_16_latch0				: std_logic_vector(9 downto 0);
	signal TDC_TRG_4_latch0					: std_logic_vector(9 downto 0);
	signal TDC_TRG_3_latch0					: std_logic_vector(9 downto 0);
	signal TDC_TRG_2_latch0					: std_logic_vector(9 downto 0);
	signal TDC_TRG_1_latch0					: std_logic_vector(9 downto 0);
	signal TDC_TRG_16_latch1				: std_logic_vector(9 downto 0);
	signal TDC_TRG_4_latch1					: std_logic_vector(9 downto 0);
	signal TDC_TRG_3_latch1					: std_logic_vector(9 downto 0);
	signal TDC_TRG_2_latch1					: std_logic_vector(9 downto 0);
	signal TDC_TRG_1_latch1					: std_logic_vector(9 downto 0);
	
begin

	--set constants here
	LOAD_DACs <= '0';
   WRITE_DACs <= '0';
   TRIG_TYPE_val <= '0';

	--Edge detector for the trigger, key internal signals
	process (CLK) begin
		--The only other couple SST clock processes work on falling edges, so we should be consistent here
		if (falling_edge(CLK)) then	
			TRIGGER_REG(1) <= TRIGGER_REG(0);
			TRIGGER_REG(0) <= TRIGGER_IN;
			
			LATCH_TRGBITS_0_REG(1) <= LATCH_TRGBITS_0_REG(0);
			LATCH_TRGBITS_0_REG(0) <= LATCH_TRGBITS_0;
		end if;
	end process;
	internal_TRIGGER <= '1' when (TRIGGER_REG = "01") else
	                    '0';

	--Trigger bit related
	--extend trigger bit signals
	gen_trig_delay: for i in 0 to 9 generate
		process (CLK) begin
			if(rising_edge(CLK)) then
				TDC_TRG_1_d0(i) <= TDC_TRG_1_IN(i);
				TDC_TRG_2_d0(i) <= TDC_TRG_2_IN(i);
				TDC_TRG_3_d0(i) <= TDC_TRG_3_IN(i);
				TDC_TRG_4_d0(i) <= TDC_TRG_4_IN(i);
				TDC_TRG_16_d0(i) <= TDC_TRG_16_IN(i);
				
				TDC_TRG_1_d1(i) <= TDC_TRG_1_d0(i);
				TDC_TRG_2_d1(i) <= TDC_TRG_2_d0(i);
				TDC_TRG_3_d1(i) <= TDC_TRG_3_d0(i);
				TDC_TRG_4_d1(i) <= TDC_TRG_4_d0(i);
				TDC_TRG_16_d1(i) <= TDC_TRG_16_d0(i);
				
				TDC_TRG_1_d2(i) <= TDC_TRG_1_d1(i);
				TDC_TRG_2_d2(i) <= TDC_TRG_2_d1(i);
				TDC_TRG_3_d2(i) <= TDC_TRG_3_d1(i);
				TDC_TRG_4_d2(i) <= TDC_TRG_4_d1(i);
				TDC_TRG_16_d2(i) <= TDC_TRG_16_d1(i);
				
				TDC_TRG_1_d3(i) <= TDC_TRG_1_d2(i);
				TDC_TRG_2_d3(i) <= TDC_TRG_2_d2(i);
				TDC_TRG_3_d3(i) <= TDC_TRG_3_d2(i);
				TDC_TRG_4_d3(i) <= TDC_TRG_4_d2(i);
				TDC_TRG_16_d3(i) <= TDC_TRG_16_d2(i);
				
				TDC_TRG_1_d4(i) <= TDC_TRG_1_d3(i);
				TDC_TRG_2_d4(i) <= TDC_TRG_2_d3(i);
				TDC_TRG_3_d4(i) <= TDC_TRG_3_d3(i);
				TDC_TRG_4_d4(i) <= TDC_TRG_4_d3(i);
				TDC_TRG_16_d4(i) <= TDC_TRG_16_d3(i);
				
				TDC_TRG_1_d5(i) <= TDC_TRG_1_d4(i);
				TDC_TRG_2_d5(i) <= TDC_TRG_2_d4(i);
				TDC_TRG_3_d5(i) <= TDC_TRG_3_d4(i);
				TDC_TRG_4_d5(i) <= TDC_TRG_4_d4(i);
				TDC_TRG_16_d5(i) <= TDC_TRG_16_d4(i);

				TDC_TRG_1_d6(i) <= TDC_TRG_1_d5(i);
				TDC_TRG_2_d6(i) <= TDC_TRG_2_d5(i);
				TDC_TRG_3_d6(i) <= TDC_TRG_3_d5(i);
				TDC_TRG_4_d6(i) <= TDC_TRG_4_d5(i);
				TDC_TRG_16_d6(i) <= TDC_TRG_16_d5(i);
			end if;
		end process;
		--extended trigger bit signal (clean up implementation)
		TDC_TRG_1_ext(i) <= TDC_TRG_1_d0(i) or TDC_TRG_1_d1(i) or TDC_TRG_1_d2(i) or TDC_TRG_1_d3(i) or TDC_TRG_1_d4(i) or TDC_TRG_1_d5(i) or TDC_TRG_1_d6(i);
		TDC_TRG_2_ext(i) <= TDC_TRG_2_d0(i) or TDC_TRG_2_d1(i) or TDC_TRG_2_d2(i) or TDC_TRG_2_d3(i) or TDC_TRG_2_d4(i) or TDC_TRG_2_d5(i) or TDC_TRG_2_d6(i);
		TDC_TRG_3_ext(i) <= TDC_TRG_3_d0(i) or TDC_TRG_3_d1(i) or TDC_TRG_3_d2(i) or TDC_TRG_3_d3(i) or TDC_TRG_3_d4(i) or TDC_TRG_3_d5(i) or TDC_TRG_3_d6(i);
		TDC_TRG_4_ext(i) <= TDC_TRG_4_d0(i) or TDC_TRG_4_d1(i) or TDC_TRG_4_d2(i) or TDC_TRG_4_d3(i) or TDC_TRG_4_d4(i) or TDC_TRG_4_d5(i) or TDC_TRG_4_d6(i);
		TDC_TRG_16_ext(i) <= TDC_TRG_16_d0(i) or TDC_TRG_16_d1(i) or TDC_TRG_16_d2(i) or TDC_TRG_16_d3(i) or TDC_TRG_16_d4(i) or TDC_TRG_16_d5(i) or TDC_TRG_16_d6(i);
	end generate;

	--latch trigger bits on transition from wait trigger state
	gen_trig_capture0 : for i in 0 to 9 generate
		TDC_TRG_16_latch0(i) <= TDC_TRG_16_ext(i) when (LATCH_TRGBITS_0_REG = "01") else
	                    TDC_TRG_16_latch0(i);
		TDC_TRG_4_latch0(i) <= TDC_TRG_4_ext(i) when (LATCH_TRGBITS_0_REG = "01") else
	                    TDC_TRG_4_latch0(i);
		TDC_TRG_3_latch0(i) <= TDC_TRG_3_ext(i) when (LATCH_TRGBITS_0_REG = "01") else
	                    TDC_TRG_3_latch0(i);
		TDC_TRG_2_latch0(i) <= TDC_TRG_2_ext(i) when (LATCH_TRGBITS_0_REG = "01") else
	                    TDC_TRG_2_latch0(i);
		TDC_TRG_1_latch0(i) <= TDC_TRG_1_ext(i) when (LATCH_TRGBITS_0_REG = "01") else
	                    TDC_TRG_1_latch0(i);
		TDC_TRG_16_out0(i) <= TDC_TRG_16_latch0(i);
		TDC_TRG_4_out0(i) <= TDC_TRG_4_latch0(i);
		TDC_TRG_3_out0(i) <= TDC_TRG_3_latch0(i);
		TDC_TRG_2_out0(i) <= TDC_TRG_2_latch0(i);
		TDC_TRG_1_out0(i) <= TDC_TRG_1_latch0(i);
	end generate;
	
	--STATE MACHINE SYNC
   SYNC_PROC: process (CLK)
   begin
      if (CLK'event and CLK = '1') then
         state <= next_state;
         PACKETSENT <= PACKETSENT_IN;
      end if;
   end process;
	
	--MOORE State-Machine - Outputs based on state only
   OUTPUT_DECODE: process (state)
   begin
		--start event builder packet send
		--latch trigger bits after transition from WaitTrigger state
		if state = st2_WaitPacketSend then
			LATCH_TRGBITS_0 <= '1';
			SEND_PACKET <= '1';
		else
			LATCH_TRGBITS_0 <= '0';
			SEND_PACKET <= '0';
		end if;
		--send event builder end process signal
		if state = st3_SendMakeReady then
			MAKE_READY <= '1';
		else
			MAKE_READY <= '0';
		end if;
   end process;

   NEXT_STATE_DECODE: process (state, internal_TRIGGER, PACKETSENT)
   begin
      --declare default state for next_state to avoid latches
      next_state <= state;  --default is to stay in current state
      case (state) is
			when st1_WaitTrigger =>	
				if internal_TRIGGER = '1' then --wait for trigger to come in
					next_state <= st2_WaitPacketSend;
				end if;
			when st2_WaitPacketSend =>
				if PACKETSENT = '1' then --wait for event builder to send data packet with latched trigger bits
					next_state <= st3_SendMakeReady;
				end if;
			when st3_SendMakeReady => --packet sent handshake signal with event builder, allows event builder go to idle
				next_state <= st4_WaitReset;
			when st4_WaitReset => --do not reset until trigger signal goes down, data packet confirmed sent
				if internal_TRIGGER = '0' and PACKETSENT = '0' then
					next_state <= st1_WaitTrigger;
				end if;
         when others =>
            next_state <= st1_WaitTrigger;
      end case;      
   end process;
	
end Behavioral;