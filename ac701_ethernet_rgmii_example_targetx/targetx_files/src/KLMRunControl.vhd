----------------------------------------------------------------------------------
-- Company: UH Manoa
-- Engineer: Isar Mostafanezhad
-- 
-- Create Date:    10:50:43 09/23/2014 
-- Design Name: 
-- Module Name:    KLMRunControl - Behavioral 
-- Project Name:    SCROD Rev A3/4 for BELLE II KLM	
-- Target Devices: SP6
-- Tool versions: 
-- Description:
-- --------------------------------------------------
-- Input: 16 bit DIN (sync) and START (sync)
-- This block stores the run control parameters into the approporiate place for the first 'Nrunctrl' values. The rest are pedestals and will go directly to RAM
-- It automatically takes care of resetting the FIFO and ....
--
-- SCROD regs
-- ASIC  regs
-- MPPC bias points
-- 
-- Format:
-- 	SCROD reg:
-- 		WD1: (1st 16b DIN word) is x"AUVW" where A="A", U="F", VW= SCROD reg number
--			WD2: (2nd 16b DIN word)	is the 16 bit register value 	
--			
-- 	ASIC reg:
-- 		WD1: (1st 16b DIN word) is x"BUVW" where B="B", U="0"-"9" for DC number , VW= 0 - 79 for ASIC register number
--			WD2: (2nd 16b DIN word)	is the 16 bit register value (only lower 12 bits are used)
--
-- 	MPPC bias point:
-- 		WD1: (1st 16b DIN word) is x"CUVW" where C="C", U="0"-"9" for DC number , VW= 80- 95 for MPPC channel(0-15) on the DC
--			WD2: (2nd 16b DIN word)	is the 16 bit register value (only lower 12 bits are used)
--
-- --------------------------------------------------
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
library UNISIM;
use UNISIM.VComponents.all;
use work.readout_definitions.all;

entity KLMRunControl is

port (
        clk		 		: in   std_logic;
        runcl_src_ready_n	: in   std_logic;  -- wr='1' and rising edge of wr_clk=> add input to FIFO-- connect to  RCL_SRC_RDY_N coming from the LL interface of the conc interface
		runcl_sof_n	: in std_logic; --start the process- reset the counters and ... connect to SOF from conc.= start of frame. Local Link.
		 
		 -- this will eventually start the FSM for run control stream- read from FIFO and fill the first N words then send the rest to the pedestal RAM 
		  din   			: in 	std_logic_vector(15 downto 0);-- input stream, coming from the conc interface ouput
		  --fifo_wr_clk	: in std_logic;

		  runcl_dst_ready_n	: out std_logic; --LL signaling
		  
		  busy			: out std_logic; -- busy working 
		  error			: out std_logic; --error
		  
		-- output path to top
		out_regs : out GPR; -- registers that will control the SCROD- in TOP module, this will replace the readout interface output
		
		--to program the ASICs:
		SCLK				: out std_logic_vector(9 downto 0);
		SIN				: out std_logic_vector(9 downto 0);
		PCLK				: out std_logic_vector(9 downto 0)
		
		--RAM interface for pedestals
		
		
     );



end KLMRunControl;

architecture Behavioral of KLMRunControl is

COMPONENT runctrl_fifo_wr16_rd32
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC
  );
END COMPONENT;

signal cnt : integer :=0;
signal w1: integer :=100;
signal w2: integer :=100;
signal start_i : std_logic_vector(1 downto 0);
signal busy_i  : std_logic;
signal cntr_runreg : integer :=0;
signal ram_addr : std_logic_vector(20 downto 0):= (others=>'0');
signal rst_fifo_i:std_logic:='0';
signal wr_en_i:std_logic:='0';
signal rd_en_i:std_logic:='0';
signal do_fifo_i:std_logic_vector(31 downto 0):=x"00000000";
signal din_i :std_logic_vector(15 downto 0):=x"0000";
signal din_i1:std_logic_vector(15 downto 0):=x"0000";
signal din_i2:std_logic_vector(15 downto 0):=x"0000";
signal din_i3:std_logic_vector(15 downto 0):=x"0000";
signal din_i4:std_logic_vector(15 downto 0):=x"0000";
signal din_i5:std_logic_vector(15 downto 0):=x"0000";
signal full_i: std_logic:='0';
signal empty_i: std_logic:='0';
signal fifo2reg_busy_i:std_logic:='0';
signal Nrunctrl:integer :=500;
signal Nramvals:integer :=1000;
signal dac_ctrl_busy_i:std_logic:='0';
signal internal_DAC_CONTROL_LOAD_PERIOD:std_logic_vector(15 downto 0):=x"0020";
signal internal_DAC_CONTROL_LATCH_PERIOD:std_logic_vector(15 downto 0):=x"0040";
signal TX_SCLK_i:std_logic;
signal TX_PCLK_i:std_logic;
signal TX_SIN_i:std_logic;
signal UPDATEtx_i:std_logic:='0';
signal DAC_CONTROL_REG_DATA_i:std_logic_vector(18 downto 0);
signal TDCNUM:std_logic_vector(9 downto 0);
signal asic_num:std_logic_vector(3 downto 0);
signal out_regs_i :  GPR; -- buffer for registers that will control the SCROD- in TOP module, this will replace the readout interface output
signal runcl_src_ready_n_i: std_logic:='1';
signal runcl_dst_ready_n_i: std_logic:='1';
signal runcl_sof_n_i: std_logic:='1';
signal input_is_runreg: std_logic:='0';

type fifo2reg_state is
	(
	Idle_fifo2reg,				  -- Idling until there is something in the FIFO	
	FifoRead,
	FifoRead1,
	FifoRead2,
	FifoRead3,
	UpdateReg,
	WaitTXDac1,
	WaitTXDac2,
	WaitTXDac3,
	WaitTXDac
	);
	
	signal next_fifo_st:fifo2reg_state:=Idle_fifo2reg;

type wr2fifo_ram_state is
	(
	Idle_wr2fifo,				  -- Idling until there start goes up	
	fifo_rst1,
	fifo_rst2,
	fifo_rst3,
	fifo_rst4,
	fifo_wr,
	fifo_wr_done,
	ram_wr,
	ram_wr_done
	);
	
	signal next_w2fifo_ram_st:wr2fifo_ram_state:=Idle_wr2fifo;
	
begin
out_regs<=out_regs_i;
busy<=busy_i;


internal_DAC_CONTROL_LOAD_PERIOD<=out_regs_i(5);
internal_DAC_CONTROL_LATCH_PERIOD<=out_regs_i(6);

asic_num<=do_fifo_i(27 downto 24);-- can move to the state machine sometime


TDCNUM		<= "0000000001" when (asic_num = x"0") else
					"0000000010" when (asic_num = x"1") else
					"0000000100" when (asic_num = x"2") else
					"0000001000" when (asic_num = x"3") else
					"0000010000" when (asic_num = x"4") else
					"0000100000" when (asic_num = x"5") else
					"0001000000" when (asic_num = x"6") else
					"0010000000" when (asic_num = x"7") else
					"0100000000" when (asic_num = x"8") else
					"1000000000" when (asic_num = x"9") else
					"0000000000";
		
DAC_CONTROL_REG_DATA_i<=do_fifo_i(22 downto 16) & do_fifo_i(11 downto 0);


	--TARGETX DAC Control
	u_TX_DAC_CONTROL: entity work.TARGETX_DAC_CONTROL PORT MAP(
			CLK 				=> clk,
			LOAD_PERIOD 	=> internal_DAC_CONTROL_LOAD_PERIOD,
			LATCH_PERIOD 	=> internal_DAC_CONTROL_LATCH_PERIOD,
			UPDATE 			=> UPDATEtx_i,
			REG_DATA 		=> DAC_CONTROL_REG_DATA_i,
			busy				=>	dac_ctrl_busy_i,
			SIN 				=> TX_SIN_i,
			SCLK 				=> TX_SCLK_i,
			PCLK 				=> TX_PCLK_i
   );
	--end generate;
	--Only specified DC gets serial data signals, uses bit mask
	gen_TX_DAC_CONTROL: for i in 0 to 9 generate
		SIN(i)  <= TX_SIN_i  and TDCNUM(i);
		PCLK(i) <= TX_PCLK_i and TDCNUM(i);
		SCLK(i) <= TX_SCLK_i and TDCNUM(i);
	end generate;


u_runctrl_fifo : runctrl_fifo_wr16_rd32
  PORT MAP (
    rst => rst_fifo_i,
    wr_clk => clk,
    rd_clk => clk,
    din => din_i,
    wr_en => wr_en_i,
    rd_en => rd_en_i,
    dout => do_fifo_i,
    full => full_i,
    empty => empty_i
  );

process (clk) is --latch on start input
begin

if (rising_edge(clk)) then

	runcl_src_ready_n_i<=runcl_src_ready_n;
	runcl_dst_ready_n<=runcl_dst_ready_n_i;
	runcl_sof_n_i<=runcl_sof_n;

	start_i(1)<=start_i(0);	
	start_i(0)<=runcl_sof_n_i;
	din_i5<=din;
	din_i4<=din_i5;
	din_i3<=din_i4;
	din_i2<=din_i3;
	din_i1<=din_i2;
	din_i <=din_i1;
	
end if;

end process;

wr_en_i<=(not runcl_dst_ready_n_i) and (not runcl_src_ready_n_i) and input_is_runreg;



process(clk) is --determine to write to FIFO or ram what
begin

if (rising_edge(clk)) then

case next_w2fifo_ram_st is 

When Idle_wr2fifo =>
 if (start_i/="01") then 
	busy_i<='0';
	next_w2fifo_ram_st<=Idle_wr2fifo;
	runcl_dst_ready_n_i<='1';
	else
	busy_i<='1';
	ram_addr<=(others=>'0');
	cntr_runreg<=0;
	input_is_runreg<='1';
	rst_fifo_i<='1';-- reset fifo and also needs to wait a few cycles for fifo to properly reset
	next_w2fifo_ram_st<=fifo_rst1;
 end if;

When fifo_rst1 =>
	rst_fifo_i<='0';
	next_w2fifo_ram_st<=fifo_rst2;

When fifo_rst2 =>
	next_w2fifo_ram_st<=fifo_rst3;

When fifo_rst3 =>
	next_w2fifo_ram_st<=fifo_rst4;

When fifo_rst4 =>
	runcl_dst_ready_n_i<='0';
	--wr_en_i<='1';
	next_w2fifo_ram_st<=fifo_wr;

When fifo_wr =>
--	wr_en_i<='1';

	if(runcl_src_ready_n_i='0') then -- fifo wr_ena just clocked 
	
	cntr_runreg<=cntr_runreg+1;
	if (cntr_runreg<Nrunctrl*2) then 
		next_w2fifo_ram_st<=fifo_wr;
	else 
--		wr_en_i<='0';
	input_is_runreg<='0';-- done writing to FIFO, the rest will go to ram
	next_w2fifo_ram_st<=ram_wr;
		
	end if;
	else
		next_w2fifo_ram_st<=fifo_wr;-- just wait for data to come from the src
	
 end if;
 
When ram_wr =>
	if (to_integer(unsigned(ram_addr))<Nramvals) then --needs work
		next_w2fifo_ram_st<=ram_wr;
		ram_addr<=std_logic_vector(to_unsigned((to_integer(unsigned(ram_addr))+1),21));
	else
		next_w2fifo_ram_st<=ram_wr_done;
	end if;
	
When ram_wr_done =>
	next_w2fifo_ram_st<=Idle_wr2fifo;
	
When Others=>
	next_w2fifo_ram_st<=Idle_wr2fifo;
 
end case;


end if;

end process;

process(clk) is --read from FIFO and write to registers
begin
if (rising_edge(clk)) then

case next_fifo_st is 

When Idle_fifo2reg =>
 if (empty_i='1') then 
	fifo2reg_busy_i<='0';
	next_fifo_st<=Idle_fifo2reg;
	else
	fifo2reg_busy_i<='1';
	next_fifo_st<=FifoRead;
 end if;

When FifoRead =>
	rd_en_i<='0';
	next_fifo_st<=FifoRead1;

When FifoRead1 =>
	rd_en_i<='1';
	next_fifo_st<=FifoRead2;

When FifoRead2 =>
	rd_en_i<='0';
	next_fifo_st<=FifoRead3;

When FifoRead3 =>
	rd_en_i<='0';
	next_fifo_st<=UpdateReg;
	
When UpdateReg =>
	if (asic_num="1111") then-- we are writing to a SCROD register
		out_regs_i(to_integer(unsigned(do_fifo_i(23 downto 16))))<=do_fifo_i(15 downto 0);
		if (empty_i='0') then
		next_fifo_st<=FifoRead;
		else
		next_fifo_st<=Idle_fifo2reg;
		end if;
-- write to TARGETX DAC module to program a certin register on a certain DC  
-- this section can be parallelized to increase speed if needed
   elsif (to_integer(unsigned(asic_num))>=0 and to_integer(unsigned(asic_num))<=9) then
		UPDATEtx_i<='1';
		next_fifo_st<=WaitTXDAC1;
	else
		if (empty_i='0') then
		next_fifo_st<=FifoRead;
		else
		next_fifo_st<=Idle_fifo2reg;
		end if;

	end if;

When WaitTXDAC1=>	--afew wait states until TXDAC-> busy signal comes up
		next_fifo_st<=WaitTXDAC2;
When WaitTXDAC2=>
		next_fifo_st<=WaitTXDAC3;
When WaitTXDAC3=>
		next_fifo_st<=WaitTXDAC;
		
	
When WaitTXDAC => 
		if (dac_ctrl_busy_i='1') then -- this is a long wait so be prepared
		next_fifo_st<=WaitTXDAC;
		else
		UPDATEtx_i<='0';
		if (empty_i='0') then
		next_fifo_st<=FifoRead;
		else
		next_fifo_st<=Idle_fifo2reg;
		end if;
		end if;

When Others=>
	next_fifo_st<=Idle_fifo2reg;
 
end case;


end if;

end process;



end Behavioral;

