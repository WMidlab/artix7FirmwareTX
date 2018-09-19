----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:58:47 03/06/2013 
-- Design Name: 
-- Module Name:    triggerScalerMonitor - Behavioral 
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

entity triggerScalerMonitor is
    Port ( CLK : in  STD_LOGIC;
			  TRG_SELF 		: in STD_LOGIC_VECTOR(9 downto 0);
			  TRIGSCALAR_0 : out STD_LOGIC_VECTOR(15 DOWNTO 0);
			  TRIGSCALAR_1 : out STD_LOGIC_VECTOR(15 DOWNTO 0);
			  TRIGSCALAR_2 : out STD_LOGIC_VECTOR(15 DOWNTO 0);
			  TRIGSCALAR_3 : out STD_LOGIC_VECTOR(15 DOWNTO 0);
			  TRIGSCALAR_4 : out STD_LOGIC_VECTOR(15 DOWNTO 0);
			  TRIGSCALAR_5 : out STD_LOGIC_VECTOR(15 DOWNTO 0);
			  TRIGSCALAR_6 : out STD_LOGIC_VECTOR(15 DOWNTO 0);
			  TRIGSCALAR_7 : out STD_LOGIC_VECTOR(15 DOWNTO 0);
			  TRIGSCALAR_8 : out STD_LOGIC_VECTOR(15 DOWNTO 0);
			  TRIGSCALAR_9 : out STD_LOGIC_VECTOR(15 DOWNTO 0)
	 );
end triggerScalerMonitor;

architecture Behavioral of triggerScalerMonitor is

   type state_type is (st1_reset, st2_enable, st3_latch); 
   signal state : state_type := st1_reset;
	signal next_state : state_type := st1_reset;

	signal reset_scalers						: STD_LOGIC := '0';
	signal enable_scalers					: STD_LOGIC := '0';
	signal INTERNAL_COUNTER					: UNSIGNED(31 downto 0) := x"00000000";

	signal internal_TRIGSCALAR_0					: STD_LOGIC_VECTOR(15 DOWNTO 0) := x"0000";
	signal internal_TRIGSCALAR_1					: STD_LOGIC_VECTOR(15 DOWNTO 0) := x"0000";
	signal internal_TRIGSCALAR_2					: STD_LOGIC_VECTOR(15 DOWNTO 0) := x"0000";
	signal internal_TRIGSCALAR_3					: STD_LOGIC_VECTOR(15 DOWNTO 0) := x"0000";
	signal internal_TRIGSCALAR_4					: STD_LOGIC_VECTOR(15 DOWNTO 0) := x"0000";
	signal internal_TRIGSCALAR_5					: STD_LOGIC_VECTOR(15 DOWNTO 0) := x"0000";
	signal internal_TRIGSCALAR_6					: STD_LOGIC_VECTOR(15 DOWNTO 0) := x"0000";
	signal internal_TRIGSCALAR_7					: STD_LOGIC_VECTOR(15 DOWNTO 0) := x"0000";
	signal internal_TRIGSCALAR_8					: STD_LOGIC_VECTOR(15 DOWNTO 0) := x"0000";
	signal internal_TRIGSCALAR_9					: STD_LOGIC_VECTOR(15 DOWNTO 0) := x"0000";
	
	signal TRIGSCALAR_0_out					: STD_LOGIC_VECTOR(15 DOWNTO 0) := x"0000";
	signal TRIGSCALAR_1_out					: STD_LOGIC_VECTOR(15 DOWNTO 0) := x"0000";
	signal TRIGSCALAR_2_out					: STD_LOGIC_VECTOR(15 DOWNTO 0) := x"0000";
	signal TRIGSCALAR_3_out					: STD_LOGIC_VECTOR(15 DOWNTO 0) := x"0000";
	signal TRIGSCALAR_4_out					: STD_LOGIC_VECTOR(15 DOWNTO 0) := x"0000";
	signal TRIGSCALAR_5_out					: STD_LOGIC_VECTOR(15 DOWNTO 0) := x"0000";
	signal TRIGSCALAR_6_out					: STD_LOGIC_VECTOR(15 DOWNTO 0) := x"0000";
	signal TRIGSCALAR_7_out					: STD_LOGIC_VECTOR(15 DOWNTO 0) := x"0000";
	signal TRIGSCALAR_8_out					: STD_LOGIC_VECTOR(15 DOWNTO 0) := x"0000";
	signal TRIGSCALAR_9_out					: STD_LOGIC_VECTOR(15 DOWNTO 0) := x"0000";

begin

	--counter process
	process (CLK) begin
		if (rising_edge(CLK)) then
			if enable_scalers = '1' then
				INTERNAL_COUNTER <= INTERNAL_COUNTER + 1;
			else
				INTERNAL_COUNTER <= (others=>'0');
			end if;
		end if;
	end process;

	--Insert the following in the architecture after the begin keyword
   SYNC_PROC: process (CLK)
   begin
      if (CLK'event and CLK = '1') then
			state <= next_state;
			TRIGSCALAR_0 <= internal_TRIGSCALAR_0;
			TRIGSCALAR_1 <= internal_TRIGSCALAR_1;
			TRIGSCALAR_2 <= internal_TRIGSCALAR_2;
			TRIGSCALAR_3 <= internal_TRIGSCALAR_3;
			TRIGSCALAR_4 <= internal_TRIGSCALAR_4;
			TRIGSCALAR_5 <= internal_TRIGSCALAR_5;
			TRIGSCALAR_6 <= internal_TRIGSCALAR_6;
			TRIGSCALAR_7 <= internal_TRIGSCALAR_7;
			TRIGSCALAR_8 <= internal_TRIGSCALAR_8;
			TRIGSCALAR_9 <= internal_TRIGSCALAR_9;	
      end if;
   end process;
 
   --MOORE State-Machine - Outputs based on state only
   OUTPUT_DECODE: process (state)
   begin
      --insert statements to decode internal output signals
      --below is simple example
      if state = st1_reset then
         reset_scalers <= '1';
      else
         reset_scalers <= '0';
      end if;
		if state = st2_enable then
         enable_scalers <= '1';
      else
         enable_scalers <= '0';
      end if;
		if state = st3_latch then
			internal_TRIGSCALAR_0 <= TRIGSCALAR_0_out;
			internal_TRIGSCALAR_1 <= TRIGSCALAR_1_out;
			internal_TRIGSCALAR_2 <= TRIGSCALAR_2_out;
			internal_TRIGSCALAR_3 <= TRIGSCALAR_3_out;
			internal_TRIGSCALAR_4 <= TRIGSCALAR_4_out;
			internal_TRIGSCALAR_5 <= TRIGSCALAR_5_out;
			internal_TRIGSCALAR_6 <= TRIGSCALAR_6_out;
			internal_TRIGSCALAR_7 <= TRIGSCALAR_7_out;
			internal_TRIGSCALAR_8 <= TRIGSCALAR_8_out;
			internal_TRIGSCALAR_9 <= TRIGSCALAR_9_out;
      end if;
   end process;
 
   NEXT_STATE_DECODE: process (state, INTERNAL_COUNTER)
   begin
      --declare default state for next_state to avoid latches
      next_state <= state;  --default is to stay in current state
      --insert statements to decode next_state
      --below is a simple example
      case (state) is
         when st1_reset =>
               next_state <= st2_enable;
         when st2_enable =>
				if INTERNAL_COUNTER > x"2FF0000"  then
					next_state <= st3_latch;
				end if;
         when st3_latch =>
            next_state <= st1_reset;
         when others =>
            next_state <= st1_reset;
      end case;      
   end process;

	--TRIGGER SCALARs	
	Inst_trigger_scaler_single_channel_0: entity work.trigger_scaler_single_channel 
	PORT MAP(
		SIGNAL_TO_COUNT => TRG_SELF(0),
		CLOCK => CLK,
		READ_ENABLE => enable_scalers,
		RESET_COUNTER => reset_scalers,
		SCALER => TRIGSCALAR_0_out
	);
	
	Inst_trigger_scaler_single_channel_1: entity work.trigger_scaler_single_channel 
	PORT MAP(
		SIGNAL_TO_COUNT => TRG_SELF(1),
		CLOCK => CLK,
		READ_ENABLE => enable_scalers,
		RESET_COUNTER => reset_scalers,
		SCALER => TRIGSCALAR_1_out
	);
	
	Inst_trigger_scaler_single_channel_2: entity work.trigger_scaler_single_channel 
	PORT MAP(
		SIGNAL_TO_COUNT => TRG_SELF(2),
		CLOCK => CLK,
		READ_ENABLE => enable_scalers,
		RESET_COUNTER => reset_scalers,
		SCALER => TRIGSCALAR_2_out
	);
	
	Inst_trigger_scaler_single_channel_3: entity work.trigger_scaler_single_channel 
	PORT MAP(
		SIGNAL_TO_COUNT => TRG_SELF(3),
		CLOCK => CLK,
		READ_ENABLE => enable_scalers,
		RESET_COUNTER => reset_scalers,
		SCALER => TRIGSCALAR_3_out
	);
	
	Inst_trigger_scaler_single_channel_4: entity work.trigger_scaler_single_channel 
	PORT MAP(
		SIGNAL_TO_COUNT => TRG_SELF(4),
		CLOCK => CLK,
		READ_ENABLE => enable_scalers,
		RESET_COUNTER => reset_scalers,
		SCALER => TRIGSCALAR_4_out
	);
	
	Inst_trigger_scaler_single_channel_5: entity work.trigger_scaler_single_channel 
	PORT MAP(
		SIGNAL_TO_COUNT => TRG_SELF(5),
		CLOCK => CLK,
		READ_ENABLE => enable_scalers,
		RESET_COUNTER => reset_scalers,
		SCALER => TRIGSCALAR_5_out
	);
	
	Inst_trigger_scaler_single_channel_6: entity work.trigger_scaler_single_channel 
	PORT MAP(
		SIGNAL_TO_COUNT => TRG_SELF(6),
		CLOCK => CLK,
		READ_ENABLE => enable_scalers,
		RESET_COUNTER => reset_scalers,
		SCALER => TRIGSCALAR_6_out
	);
	
	Inst_trigger_scaler_single_channel_7: entity work.trigger_scaler_single_channel 
	PORT MAP(
		SIGNAL_TO_COUNT => TRG_SELF(7),
		CLOCK => CLK,
		READ_ENABLE => enable_scalers,
		RESET_COUNTER => reset_scalers,
		SCALER => TRIGSCALAR_7_out
	);
	
	Inst_trigger_scaler_single_channel_8: entity work.trigger_scaler_single_channel 
	PORT MAP(
		SIGNAL_TO_COUNT => TRG_SELF(8),
		CLOCK => CLK,
		READ_ENABLE => enable_scalers,
		RESET_COUNTER => reset_scalers,
		SCALER => TRIGSCALAR_8_out
	);
	
	Inst_trigger_scaler_single_channel_9: entity work.trigger_scaler_single_channel 
	PORT MAP(
		SIGNAL_TO_COUNT => TRG_SELF(9),
		CLOCK => CLK,
		READ_ENABLE => enable_scalers,
		RESET_COUNTER => reset_scalers,
		SCALER => TRIGSCALAR_9_out
	);

end Behavioral;
