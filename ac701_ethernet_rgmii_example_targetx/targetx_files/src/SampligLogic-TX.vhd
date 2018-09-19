-------------------------------------------------------------------------------
-- Title         : Evolution Target 2 board
-- Project       : Hiro
-------------------------------------------------------------------------------
-- File          : SamplingLgc.vhd
-- Author        : Leonid Sapozhnikov, leosap@slac.stanford.edu
-- Created       : 6/22/2011
-------------------------------------------------------------------------------
-- Description:--
--	Function:		Implement sampling control signals
--               At this point very simple. Start recording when enable
--              Stop signal due to readout stop recording and recording restart
--              from location 0 when readout is complete, need to verify if stop desireble
--              wrt_addrclr clear Target2 address as well on stop
--              SM desined for easy change if require different timing
--	Modifications:
--
--

--
-- ROVDD  need to be set in way that it is a little slower then 125*8 =1Ghz in order to
-- avoid missing samples but rather to have double sampling at the end and beginning of
-- two neiboring rows
--

-------------------------------------------------------------------------------
-- Copyright (c) 2011 by Leonid Sapozhnikov. All rights reserved.
-------------------------------------------------------------------------------
-- Modification history:
-- 6/22/2011: created.
-- 7/20/12
-- Modified to take the following approach
--  1. Tracking time is 8ns (difference between rising edge of SP and SST), also option to change to 32
--  2. Sampling 32ns- minimum(also to make option to other value multiple of 8 ns
--  3. Settling time of 8-16ns, wr_clk changing at the beginning of this interval
--  4. wr_strobe 8-16ns
--  5. Option for extending period longer than 64 ns for sampling study
--   There are 3 options for 1G sampling
--    option  tracking hold wr_strb
--     0        8        16    8 
--     1        8        8     16
--     2        16       8     8 
 
--   There are 1 options for 0.4G sampling
--    option  tracking hold wr_strb
--     0        16        48    16 
 
-- ver3
-- introduced logic to control write enable during readout to disable overwrite of buffer of interest
-- from being overwritten
-- Write enable act on base of  stored LUT for buffer which will beed to be processed
-- As result writing skipped over this locations
-------------------------------------------------------------------------------
Library work;
use work.all;
--use work.Target2Package.all;

Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--Library synplify;
--use synplify.attributes.all;


entity SamplingLgicTX is
   port (
			 clk		 			    : in   std_logic;
			 rst 			        : in   std_logic;
       Enable			      : in  std_logic;  -- Enable analog sampling
		 SamplSpeed 	   : in   std_logic;
		 Test_sampling		  	: in std_logic;
		 Test_setup			  : in std_logic_vector (31 downto 0);
			 stop	 			      : in   std_logic;  -- hold operation
			 samp_wr_ena     : in std_logic;  -- if suspend write to the next buffer
			 MAIN_CNT			: out std_logic_vector(10 downto 0); --(10 downto 5) is col, (4 downto 2) is row, (1 downto 0) & "000" is smp
--			 cur_COL_l			  : out  std_logic_vector(5 downto 0);
--			 cur_ROW_l			  : out  std_logic_vector(2 downto 0);
--			 cur_SMP_l			  : out  std_logic_vector(4 downto 0);
--			 cur_COL			    : out  std_logic_vector(5 downto 0);
--			 cur_ROW			    : out  std_logic_vector(2 downto 0);
		 sst_int          : out   std_logic;
       sstclk           : out   std_logic;
       wr_addrclr       : out   std_logic;
		 rst_local        : out   std_logic;
       wr_ena           : out   std_logic
       );
end SamplingLgicTX;

architecture Behavioral of SamplingLgicTX is

type state_type is
	(
	Idle,				  -- Idling until command start bit
  Sampling0,		-- state 0 of init high processing
  Sampling1,		-- state 1 of init high processing
  Sampling2,		-- state 2 of init high processing
	Sampling3,	  -- state 3 of init high processing
	Sampling4,	  -- state 4 of init high processing
	Sampling5,	  -- state 5 of init high processing
	Sampling6,	  -- state 0 of normal low processing
	Sampling7,	  -- state 1 of normal low processing
	Sampling8,	  -- state 2 of normal low processing
	Sampling9,	  -- state 3 of normal low processing
	Sampling10,	  -- state 0 of normal high processing
	Sampling11,	  -- state 1 of normal high processing
	Sampling12,	  -- state 2 of normal high processing
	Sampling13	  -- state 3 of normal high processing
	);

signal next_state					: state_type;

	signal MAIN_CNT_i		: std_logic_vector(10 downto 0);
	signal DEl_CNT		    : std_logic_vector(3 downto 0);
	signal ClearDelCnt   : std_logic_vector(17 downto 0);

--	signal sstclk_i    	: std_logic;
--	signal sstclk_i_d  	: std_logic;

	signal sst_int_i   	: std_logic;
	signal wr_ena_i    	: std_logic;
	signal rst_local_i    	: std_logic;

	
	signal sst_cnt  	            : std_logic_vector(1 downto 0);
--	signal Proc_readout_del  	   : std_logic_vector(3 downto 0);  -- to sync clocks
--	signal Buf_Sel_Start_local  	: std_logic_vector(8 downto 0);  -- to sync clocks
--	signal enable_wren         	: std_logic;

--------------------------------------------------------------------------------

begin
--------------------------------------------------------------------------------

MAIN_CNT<=MAIN_CNT_i;
		
-- to  delay everything by one clock to properly handle samp_wr_ena
process(clk,rst)
begin
if (clk'event and clk = '1') then
   if (rst = '1') then
		sst_int    <= '0';
      wr_ena     <= '0';
	   sstclk     <= '0'	;	
		rst_local <= '1';
   else
		sst_int    <= sst_int_i;
      wr_ena     <= wr_ena_i and samp_wr_ena;
	   sstclk     <= sst_cnt(1);
		rst_local <= rst_local_i;
	end if;
end if;
end process;


--------------------------------------------------------------------------------

-------------------------------------------------------------------------------


process(Clk,rst)
begin
if (rst = '1') then
  MAIN_CNT_i <= (Others => '0');
  DEl_CNT <= (Others => '0');
  sst_int_i               <= '0';
  sst_cnt             <= (Others => '0');
  ClearDelCnt         <= (Others => '0');
  wr_addrclr        <= '1';
  rst_local_i      <= '1';
  wr_ena_i            <= '0';
	next_state <= Idle;
elsif (Clk'event and Clk = '1') then
   if (Enable = '0') then
		ClearDelCnt         <= (Others => '0');
		wr_addrclr        <= '1';
   elsif (ClearDelCnt = "111111111111111111") then
		ClearDelCnt         <= (Others => '1');
		wr_addrclr        <= '0';
	else
	   ClearDelCnt         <= ClearDelCnt  + '1';  -- need counter to wait until ASIC is in proper state
		wr_addrclr        <= '1';
	end if;
	
  Case next_state is
  When Idle =>
    MAIN_CNT_i <= (Others => '0');
	 DEl_CNT <= (Others => '0');
	 sst_int_i               <= '0';
	 sst_cnt             <= (Others => '0');
--    wr_addrclr        <= '1';
	 rst_local_i      <= '1';
    wr_ena_i            <= '0';
    if (Enable = '1') then   -- start sampling and store data
      next_state 	<= Sampling6;
    else
      next_state 	<= Idle;
    end if;


  When Sampling6 =>   -- sstin low for 32 ns,sspin_i0 stay for 8ns high
	 DEl_CNT <= (Others => '0');
	 MAIN_CNT_i <= MAIN_CNT_i + '1';
	 sst_int_i               <= '0';
	 sst_cnt             <= sst_cnt + '1';
--    wr_addrclr           <= '0';
	 rst_local_i      <= '0';
    wr_ena_i              <= NOT(stop);
    if (Enable = '0') then   --
      next_state 	<= Idle;
    else
      next_state 	<= Sampling7;
    end if;

  When Sampling7 =>
    MAIN_CNT_i <= MAIN_CNT_i + '1';
	 DEl_CNT <= (Others => '0');
	 sst_int_i               <= '0';
	 sst_cnt             <= sst_cnt + '1';
--    wr_addrclr           <= '0';
    wr_ena_i               <= NOT(stop);
    if (Enable = '0') then   --
      next_state 	<= Idle;
    else
      next_state 	<= Sampling8;
    end if;

  When Sampling8 =>     -- start sspin_i0 high for 16ns
    MAIN_CNT_i <= MAIN_CNT_i + '1';
	 DEl_CNT <= DEl_CNT + '1';
	 sst_int_i               <= '1';
	 sst_cnt             <= sst_cnt + '1';
--    wr_addrclr           <= '0';
    wr_ena_i               <= NOT(stop);
    if (Enable = '0') then   --
      next_state 	<= Idle;
    elsif ((DEl_CNT < "0110") AND  (Test_setup(21 downto 20) = "11")) then   --
      next_state 	<= Sampling8;
    else
      next_state 	<= Sampling9;
    end if;

  When Sampling9 =>
	 MAIN_CNT_i <= MAIN_CNT_i + '1';
	 DEl_CNT <= (Others => '0');
	 sst_int_i               <= '1';
	 sst_cnt             <= sst_cnt + '1';
--    wr_addrclr           <= '0';
    wr_ena_i               <= NOT(stop);
    if (Enable = '0') then   --
      next_state 	<= Idle;
    else
      next_state 	<= Sampling10;
    end if;

  When Sampling10 =>   -- 
    MAIN_CNT_i <= MAIN_CNT_i + '1';
	 DEl_CNT <= (Others => '0');
	 sst_int_i               <= '1';
	 sst_cnt             <= sst_cnt + '1';
--    wr_addrclr           <= '0';
    wr_ena_i               <= NOT(stop);
    if (Enable = '0') then   --
      next_state 	<= Idle;
    else
      next_state 	<= Sampling11;
    end if;

  When Sampling11 =>
    MAIN_CNT_i <= MAIN_CNT_i + '1';
	 DEl_CNT <= (Others => '0');
	 sst_int_i               <= '1';
	 sst_cnt             <= sst_cnt + '1';
--    wr_addrclr           <= '0';
    wr_ena_i               <= NOT(stop);
    if (Enable = '0') then   --
      next_state 	<= Idle;
    else
      next_state 	<= Sampling12;
    end if;

  When Sampling12 =>     -- start sspin_i0 high for 16ns
    MAIN_CNT_i <= MAIN_CNT_i + '1';
	 DEl_CNT <= DEl_CNT + '1';
	 sst_int_i               <= '0';
	 sst_cnt             <= sst_cnt + '1';
--    wr_addrclr           <= '0';
    wr_ena_i               <= NOT(stop);
    if (Enable = '0') then   --
      next_state 	<= Idle;
    elsif ((DEl_CNT < "0110") AND  (Test_setup(21 downto 20) = "11")) then   --
      next_state 	<= Sampling12;
    else
      next_state 	<= Sampling13;
    end if;

  When Sampling13 =>
    MAIN_CNT_i <= MAIN_CNT_i + '1';
	 DEl_CNT <= (Others => '0');
	 sst_int_i               <= '0';
	 sst_cnt             <= sst_cnt + '1';
--    wr_addrclr           <= '0';
    wr_ena_i               <= NOT(stop);
    if (Enable = '0') then   --
      next_state 	<= Idle;
    else
      next_state 	<= Sampling6;
    end if;
	 
  When Others =>
  MAIN_CNT_i <= (Others => '0');
  DEl_CNT <= (Others => '0');
  sst_int_i               <= '0';
  sst_cnt             <= (Others => '0');
--  wr_addrclr        <= '1';
  rst_local_i      <= '1';
  wr_ena_i            <= '0';
	next_state <= Idle;
  end Case;
end if;
end process;

end Behavioral;