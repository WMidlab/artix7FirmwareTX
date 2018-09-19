
--name: Kevin Oshiro
--date: 1/22/16
--description: state machine and logic to program LTC2657 DAC on targetx fmc board

--scl has one extra cycle before stop condition, hence stop2 state.
--added extra cycle because it was programming like it was one clock cycle short, but simulation showed it was correct
--extra scl cycles appended at end of of scl but before stop condition shouldn't cause problem even if too many

--------------------------------
-- SA6|...|SA0|WRn|ack|C3|...|C0|A3|...|A0|ack|D15|...|D0|ack|
-- C3C2C1C0
-- 0 write to input reg n
-- 1 update dac reg n
-- 2 write to input reg n, update all
-- 3 write to and update n
-- 4 power down n
-- 5 power down chip
-- 6 select int ref
-- 7 select ext ref
-- 8 no op
--
-- A3A2A1A0
-- 0 DAC A
-- ...
-- 7 DAC H
-- 15 all DACs
--
-- V = 2.5*X/(2^16)
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ped_dac_control is 
    Port( 
        fpga_clk : in STD_LOGIC; 
        dac_op_sel : in STD_LOGIC_VECTOR(7 downto 0);
        dac_val : in STD_LOGIC_VECTOR(15 downto 0);
        SCL : out STD_LOGIC;
        SDA : inout STD_LOGIC
    );
end ped_dac_control;

architecture Behavioral of ped_dac_control is

signal slave_addr : std_logic_vector(6 downto 0):= "0010000";

type state_type is (idle, start, prog, stop, stop2);
signal state: state_type := idle;

signal count : std_logic_vector(5 downto 0):= (others => '0'); -- count bits
signal DAC_data : std_logic_vector(35 downto 0); -- data to send to DAC

-- command and address are always x"3F"
signal dac_old : std_logic_vector(23 downto 0) := x"3F" & x"0000"; -- save old data to check for change
signal change : std_logic_vector(23 downto 0); -- check if bits changed
signal wr_dac : std_logic := '0'; -- signal to start writing to DAC

signal clk_count : std_logic_vector(8 downto 0):= (others => '0');
signal clk : std_logic:= '0';
signal scl_en : std_logic:= '0';
signal dac_val_i : std_logic_vector(15 downto 0):= (others => '0');
signal SCL_temp : std_logic;
signal dd : std_logic:= '0'; --add extra scl cycle

--debug
signal ack : std_logic_vector(3 downto 0):= (others => '0');
signal SDA_debug : std_logic;

constant div_fact : integer := 125;

signal scl_i : std_logic_vector(73 downto 0):= "Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0Z0";
signal scl_count : std_logic_vector(6 downto 0):= (others => '0');
signal clk2 : std_logic:= '0';
signal clk2_count : std_logic_vector(7 downto 0):= (others => '0');

attribute dont_touch : string;
attribute dont_touch of change :signal  is "true";
attribute dont_touch of wr_dac :signal  is "true";
attribute dont_touch of DAC_data :signal  is "true";
attribute dont_touch of ack : signal is "true";
attribute dont_touch of SDA_debug : signal is "true";
attribute dont_touch of dac_val : signal is "true";
attribute dont_touch of dac_val_i : signal is "true";
attribute dont_touch of dac_old : signal is "true";
attribute dont_touch of dd : signal is "true";
--attribute dont_touch of SCL_temp : signal is "true";

--attribute keep : string;
--attribute keep of SDA: signal is "true";
--attribute keep of SCL: signal is "true";

begin


--generate slower clock, 125MHz -> 250kHz
process(fpga_clk) begin
    if rising_edge(fpga_clk) then
        if clk_count = std_logic_vector(to_unsigned(div_fact-1, 9)) then
            clk_count <= (others => '0');
            clk <= not clk;
        else
            clk_count <= std_logic_vector(unsigned(clk_count)+1);
        end if;  
    end if;
end process;

-- program dac if register written to
process(clk) begin
	if rising_edge(clk) then
	   dac_val_i <= dac_val;
		dac_old <= dac_op_sel & dac_val_i;
		change <= dac_old xor (dac_op_sel & dac_val_i);
	end if;
end process;

wr_dac <= change(23) or change(22) or change(21) or change(20) or change(19) or change(18) or change(17) or change(16) or 
			change(15) or change(14) or change(13) or change(12) or change(11) or change(10) or change(9) or change(8) or 
			change(7) or change(6) or change(5) or change(4) or change(3) or change(2) or change(1) or change(0);

-- data to send on SDA
dac_data <= slave_addr & '0' & 'Z' & dac_op_sel & 'Z' & dac_val_i(15 downto 8) & 'Z' & dac_val_i(7 downto 0) & 'Z';


-- wait until registers written to, wait until data changed from 1s to Zs, program DAC
process(clk) begin
    if (falling_edge(clk)) then
        case(state) is
            when idle =>
                dd <= '1';
                scl_en <= '0';
                SDA <= 'Z'; --high while not in use/signal stop
                SDA_debug <= '1';
                if wr_dac = '1' then --start write
						state <= start;
                else 
						state <= idle;
                end if;
			when start =>
			    dd <= '0';
				SDA <= '0'; --signal start
                SDA_debug <= '0';
				state <= prog;
            when prog =>
                dd <= '0';
				if DAC_data(35-to_integer(unsigned(count))) = '0' then
					SDA <= '0';
				else
					SDA <= 'Z';
				end if;
                SDA_debug <= DAC_data(35-to_integer(unsigned(count)));
                if count = std_logic_vector(to_unsigned(35, 6)) then  
					count <= (others => '0');
					state <= stop;
                else 
					count <= std_logic_vector(unsigned(count)+1);
					state <= prog;
                end if;
			when stop =>
			    dd <= '0';
				SDA <= '0';
                SDA_debug <= '0';
				state <= stop2;
			when stop2 =>
			    dd <= '0';
			    SDA <= '0';
			    SDA_debug <= '0';
			    state <= idle;
        end case;
    end if;
end process;

--check acknowledges
process(clk) begin
	if state = prog then
		if count = std_logic_vector(to_unsigned(9, 6)) then
			ack(0) <= not SDA;
		elsif count = std_logic_vector(to_unsigned(18, 6)) then
			ack(1) <= not SDA;
		elsif count = std_logic_vector(to_unsigned(27, 6)) then
			ack(2) <= not SDA;
		elsif count = std_logic_vector(to_unsigned(36, 6)) then
			ack(3) <= not SDA;
		end if;
	end if;
end process;

--output scl clock
--SCL <= '0' when clk = '0' and ((state = prog and count /= "000000") or state = stop or (state = idle and dd = '0')) else 'Z';
SCL <= '0' when clk = '0' and ((state = prog and count /= "000000") or state = stop or state = stop2 or (state = idle and dd = '0')) else 'Z';

end Behavioral;