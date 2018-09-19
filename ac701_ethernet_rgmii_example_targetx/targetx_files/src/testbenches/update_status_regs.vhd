----------------------------------------------------------------------------------
-- Company: UH Manoa	
-- Engineer: Isar Mostafanezhad
-- 
-- Create Date:    17:06:31 09/15/2014 
-- Design Name: 
-- Module Name:    update_status_regs - Behavioral 
-- Project Name: SCROD Rev A3/4 for BELLE II KLM	
-- Target Devices: SP6
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity update_status_regs is

 port (
        clk		 			 : in   std_logic;
        update	    		 : in   std_logic;  -- start reading everything on the risign edge (MPPC biases, Tempetarue and ...) and update the regs
		  status_regs      : out 	STATREG;
		  busy				 : out std_logic; -- busy woring on updating values

		AMUX					: out std_logic_vector(7 downto 0); --analog mux 
		SDA_MON			 : inout std_logic; --SDA and SCL for I2C chip- goes to top pins
		SCL_MON			 : in  std_logic
     );

end update_status_regs;

architecture Behavioral of update_status_regs is

signal ADC_reset : std_logic;
signal runADC_i : std_logic;
signal ADCval_i :std_logic_vector(11 downto 0);
signal cnt : integer :=0;
signal curreg : unsigned (7 downto 0);
signal w1: integer :=10;
signal w2: integer :=10;
signal update_i : std_logic_vector(1 downto 0);
signal busy_i  : std_logic;

type reg_pop_state is
	(
	Idle,				  -- Idling until update goes high	
	WaitStart,
	SetMux,
	WaitSetMux,
	ReadADC,
	WaitReadADC,
	IncReg,
	Done
	);
	
signal next_st:reg_pop_state:=Idle;


begin

---------------------------
-- MPPC Current measurement ADC: MPC3221
---------------------------
	inst_mpc_adc: entity work.Module_ADC_MCP3221_I2C_new
	port map(
		clock			 => clk,--internal_CLOCK_FPGA_LOGIC,
		reset			=>	ADC_reset,
		
		sda	=> SDA_MON,
		scl	=> SCL_MON,
		 
		runADC		=> runADC_i,
		enOutput		=> enOutput_i,
		ADCOutput	=> ADCval_i

	);


process(clk) is

begin
if (rising_edge(clk)) then
	update_i(1)<=update_i(0);	
	update_i(0)<=update;
	busy<=busy_i;
	
end if;

end process;

process(clk)
begin
if (rising_edge(clk)) then
  
  Case next_st is
  
   When Idle =>
	if (update_i="01") then
		busy_i<='0';
		enOutput_i<='0';
		next_st<=Idle;
	else 
		busy_i<='1';
		ADC_reset<='1';
		curreg<=x"00";
		cnt<=0;
		next_st<=WaitStart;
	end if;
  
   When WaitStart =>
		cnt<=cnt+1;
		if (cnt<w1) then
		next_st<=WaitStart;
		else
		cnt<=0;
		next_st<=SetMux;
		end if;
	
   When SetMux =>
		AMUX<=curreg;
		enOutput_i<='0';
		cnt<=cnt+1;
		if (cnt<w1) then
		next_st<=SetMux;
		else
		cnt<=0;
		next_st<=ReadADC;
		end if;
	
	When ReadADC =>
		enOutput_i<='1';
		cnt<=cnt+1;
		if (cnt<w2) then
		next_st<=ReadADC;
		else
		cnt<=0;
		status_regs(curreg)<=ADCval_i;
		next_st<=IncReg;
		end if;	
		
	When IncReg =>
		curreg<=curreg+1;
		if (curreg<N_MPPCADC_REG) then
		next_st<=SetMux;
		else
		next_st<= Done;
		end if;
	
	When Done =>
		busy_i<='0';
		enOutput_i<='0';
		next_st<=Idle;
		
	When Others =>
		busy_i<='0';
		enOutput_i<='0';
		next_st<=Idle;
		
  
  end case;


end if;

end process;


end Behavioral;

