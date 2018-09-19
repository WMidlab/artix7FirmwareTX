--
--	Function:		Sync Trigger to specific buffer position in order to stady effect of digitization on sampling.
--
--
--	Modifications:
--
-- Wait until desired buffer is reached, generate first trigger, then waiting 
-- specified amount of time and generate the second trigger 

--------------------------------------------------------------------------------
Library work;
use work.all;

Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--Library synplify;
--use synplify.attributes.all;

entity TestPatternSM is
port (
			 CLK			    : in    std_logic;
			 rst			    : in    std_logic;
       Select_any_in          : in  std_logic;
       sr_clk_in        : in  std_logic;
       sr_sel_in           : in  std_logic;
		 clr_in              : in   std_logic;
		 Select_any_out          : out  std_logic;
       sr_clk_out        : out  std_logic;
       sr_sel_out           : out  std_logic;
		 clr_out              : out  std_logic;

		 SelectPattern	 : in   std_logic_vector(1 downto 0)
       );
end TestPatternSM;

architecture Behavioral of TestPatternSM is

type state_type is
	(
	Idle,				  -- Idling until command start 
	state0,   	  --
	state00,   	  --
	state1,   	  --
	state2,   	  --
	state22,   	  --
	state3,   	  --
	state33,   	  --
	state4,   	  --
	state44,   	  --
	state5,   	  --
	state55,   	  --
	state6,   	  --
	state66,   	  --
	state7,   	  --
	state77,   	  --
	state8,   	  --
	state9   	     -- Done
	);

signal next_state					: state_type;



	signal cnt        : std_logic_vector(3 downto 0);

   signal 	Select_any_i          :  std_logic;
   signal 	sr_clk_i        :  std_logic;
   signal 	sr_sel_i           :  std_logic;


--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
begin

process ( SelectPattern, Select_any_in,sr_clk_in, clr_in, sr_sel_in, Select_any_i,sr_clk_i, sr_sel_i) is
begin
if (SelectPattern(1 downto 0) = "00") then
		Select_any_out <= Select_any_in;
		sr_clk_out <= sr_clk_in;
		sr_sel_out <= sr_sel_in;
		clr_out    <= clr_in;
	elsif (SelectPattern(1 downto 0) = "01") then
		Select_any_out <= Select_any_i;
		sr_clk_out <= sr_clk_i;
		sr_sel_out <= sr_sel_i;
		clr_out    <= '0';
	elsif (SelectPattern(1 downto 0) = "10") then
		Select_any_out <= Select_any_in;
		sr_clk_out <= sr_clk_in;
		sr_sel_out <= sr_sel_in;
		clr_out    <= '0';
	else
		Select_any_out <= Select_any_in;
		sr_clk_out <= sr_clk_in;
		sr_sel_out <= sr_sel_in;
		clr_out    <= '1';
	end if;
end process;


--------------------------------------------------------------------------------
process(Clk,rst)
begin
if (rst = '1') then
		Select_any_i <= '0';
		sr_clk_i <= '0';
		sr_sel_i <= '0';
		cnt <= "1111";
	 next_state <= Idle;
elsif (Clk'event and Clk = '1') then
  Case next_state is
   When Idle =>
		Select_any_i <= '0';
		sr_clk_i <= '0';
		sr_sel_i <= '0';
		cnt <= "1111";
    if (SelectPattern(1 downto 0) ="01" ) then
      next_state 	<= State0;
    else
      next_state 	<= Idle;
    end if;

   When State0 =>
		Select_any_i <= '0';
		sr_clk_i <= '0';
		sr_sel_i <= '0';
    if (SelectPattern(1 downto 0) ="01" ) then
      next_state 	<= State00;
    else
      next_state 	<= Idle;
    end if;

   When State00 =>
		Select_any_i <= '0';
		sr_clk_i <= '0';
		sr_sel_i <= '0';
    if (SelectPattern(1 downto 0) ="01" ) then
      next_state 	<= State1;
    else
      next_state 	<= Idle;
    end if;

   When State1 =>
		Select_any_i <= '0';
		sr_clk_i <= '0';
		sr_sel_i <= '1';
    if (SelectPattern(1 downto 0) ="01" ) then
      next_state 	<= State2;
    else
      next_state 	<= Idle;
    end if;



   When State2 =>
		Select_any_i <= '0';
		sr_clk_i <= '0';
		sr_sel_i <= '1';
    if (SelectPattern(1 downto 0) ="01" ) then
      next_state 	<= State22;
    else
      next_state 	<= Idle;
    end if;

   When State22 =>
		Select_any_i <= '0';
		sr_clk_i <= '0';
		sr_sel_i <= '1';
    if (SelectPattern(1 downto 0) ="01" ) then
      next_state 	<= State3;
    else
      next_state 	<= Idle;
    end if;


   When State3 =>  -- to store test pattern
		Select_any_i <= '0';
		sr_clk_i <= '1';
		sr_sel_i <= '1';
    if (SelectPattern(1 downto 0) ="01" ) then
      next_state 	<= State33;
    else
      next_state 	<= Idle;
    end if;

   When State33 =>  -- to store test pattern
		Select_any_i <= '0';
		sr_clk_i <= '1';
		sr_sel_i <= '1';
    if (SelectPattern(1 downto 0) ="01" ) then
      next_state 	<= State4;
    else
      next_state 	<= Idle;
    end if;


   When State4 =>
		Select_any_i <= '0';
		sr_clk_i <= '0';
		sr_sel_i <= '0';
    if (SelectPattern(1 downto 0) ="01" ) then
      next_state 	<= State44;
    else
      next_state 	<= Idle;
    end if;
	 
   When State44 =>
		Select_any_i <= '0';
		sr_clk_i <= '0';
		sr_sel_i <= '0';
    if (SelectPattern(1 downto 0) ="01" ) then
      next_state 	<= State5;
    else
      next_state 	<= Idle;
    end if;
	 
   When State5 =>
		Select_any_i <= '1';
		sr_clk_i <= '0';
		sr_sel_i <= '0';
    if (SelectPattern(1 downto 0) ="01" ) then
      next_state 	<= State55;
    else
      next_state 	<= Idle;
    end if;
	 
   When State55 =>
		Select_any_i <= '1';
		sr_clk_i <= '0';
		sr_sel_i <= '0';
    if (SelectPattern(1 downto 0) ="01" ) then
      next_state 	<= State6;
    else
      next_state 	<= Idle;
    end if;
	
   When State6 =>
		Select_any_i <= '1';
		sr_clk_i <= '1';
		sr_sel_i <= '0';
    if (SelectPattern(1 downto 0) ="01" ) then
      next_state 	<= State66;
    else
      next_state 	<= Idle;
    end if;
	 
   When State66 =>
		Select_any_i <= '1';
		sr_clk_i <= '1';
		sr_sel_i <= '0';
    if (SelectPattern(1 downto 0) ="01" ) then
      next_state 	<= State7;
    else
      next_state 	<= Idle;
    end if;
	 
   When State7 =>
		Select_any_i <= '1';
		sr_clk_i <= '0';
		sr_sel_i <= '0';
    if (SelectPattern(1 downto 0) ="01" ) then
         next_state 	<= State77;
    else
      next_state 	<= Idle;
    end if;
	 
   When State77 =>
		Select_any_i <= '1';
		sr_clk_i <= '0';
		sr_sel_i <= '0';
    if (SelectPattern(1 downto 0) ="01" ) then
	   if(cnt = "0000") then
		   cnt <= "1111";
         next_state 	<= State8;
		else
		   cnt <= cnt - '1';
		   next_state 	<= State6;
		end if;
    else
      next_state 	<= Idle;
    end if;
	 
   When State8 =>
		Select_any_i <= '1';
		sr_clk_i <= '0';
		sr_sel_i <= '0';
    if (SelectPattern(1 downto 0) ="01" ) then
      next_state 	<= State9;
    else
      next_state 	<= Idle;
    end if;
	 
   When State9 =>
		Select_any_i <= '0';
		sr_clk_i <= '0';
		sr_sel_i <= '0';
    if (SelectPattern(1 downto 0) ="01" ) then
      next_state 	<= State0;
    else
      next_state 	<= Idle;
    end if;
	 
	 	 
  When Others =>
		Select_any_i <= '0';
		sr_clk_i <= '0';
		sr_sel_i <= '0';
	 next_state <= Idle;
	end case;
end if;
end process;
---------------------------------
end Behavioral;

