----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:16:14 10/22/2014 
-- Design Name: 
-- Module Name:    PedRAMaccess - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
---- add explicit comments on the input here
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.readout_definitions.all;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

--package thisfile is
--
--type addrarr is array (2 downto 0) of std_logic_vector(21 downto 0);
--end thisfile;

--Used to access RAM for pedestal reading or writing
--When writing, two 12 bit samples (wval0 and wval1) are converted to three 8 bit data (ASIC data is 12 bit, RAM is 8 bit input width)
--When reading, three 8 bit data are converted back to two 12 bit samples

entity PedRAMaccess is
Port ( 
    clk         : in  STD_LOGIC;
    addr        :  in  STD_LOGIC_VECTOR (21 downto 0); -- bit 0 is ignored, pedestal sample value address (this wil be translated within the block into proper ram address)
    rval0       : out  STD_LOGIC_VECTOR (11 downto 0);--read value for  ped 0
    rval1       : out  STD_LOGIC_VECTOR (11 downto 0);--read value for  ped 1
    wval0       : in  STD_LOGIC_VECTOR (11 downto 0); --write value for ped 0
    wval1       : in  STD_LOGIC_VECTOR (11 downto 0); --write value for ped 1
    rw          : in  STD_LOGIC;--'0' for read, '1' for write
    update      : in  STD_LOGIC;--rising edge : do the update operation either read or write
    busy        : out  STD_LOGIC;-- '0'= idle, '1'= busy
			  
    --tie this to the correct scheduler channel:
    ram_addr    : out std_logic_vector(21 downto 0);
    ram_datar	: in  std_logic_vector(7 downto 0);
    ram_dataw	: out std_logic_vector(7 downto 0);
    ram_rw		: out std_logic;
    ram_update	: out std_logic;
    ram_busy    : in std_logic
    );
end PedRAMaccess;


architecture Behavioral of PedRAMaccess is

signal addr_i       : std_logic_vector(21 downto 0);
signal wval0_i      : std_logic_vector(11 downto 0);
signal wval1_i      : std_logic_vector(11 downto 0);
signal rw_i         : std_logic;
signal updates_i    : std_logic_vector(1 downto 0):="00";
signal ram_datar_i  : std_logic_vector(7 downto 0);
signal addrarr      : AddrArray;
signal rbytes       : std_logic_vector(23 downto 0);
signal wbytes       : std_logic_vector(23 downto 0);

signal idx          : integer :=0;

type state_type is (idle, translate_addr, set_ram_addr,	wait_ram1, wait_ram2, wait_ram3, wait_ram_busy, populate_regs);
	
signal st           : state_type:=idle;

    attribute dont_touch : string;
    attribute dont_touch of addr : signal is "true";
    
    
begin

process (clk)
begin
    if (rising_edge(clk)) then
        updates_i(1)<=updates_i(0);
        updates_i(0)<=update;
        rw_i<=rw;
        wval0_i<=wval0;
        wval1_i<=wval1;
        addr_i<=addr;
    end if;
end process;

process (clk)
begin
    if (rising_edge(clk)) then
        case st is 

            when idle=>
                ram_update<='0';
                idx<=0;
                if (updates_i(0)='0' and update='1') then
                    busy<='1';
                    wbytes<=wval0_i & wval1_i;
                    st<=translate_addr;
                else
                    busy<='0';
                    st<=idle;
                end if;
	
            when translate_addr =>
                addrarr(0)<=std_logic_vector(to_unsigned(to_integer(unsigned(addr_i(21 downto 1)  ))*3+0,22)) ;
                addrarr(1)<=std_logic_vector(to_unsigned(to_integer(unsigned(addr_i(21 downto 1)  ))*3+1,22)) ;
                addrarr(2)<=std_logic_vector(to_unsigned(to_integer(unsigned(addr_i(21 downto 1)  ))*3+2,22)) ;
                --ram_dataw<=wbytes(23-8*idx downto 16-8*idx);
                --ram_dataw<=wbytes(23 downto 16);
                ram_rw<=rw_i;
                idx<=0;
                st<=set_ram_addr;
	
            when set_ram_addr=>
            	ram_dataw<=wbytes(23-8*idx downto 16-8*idx);
            	ram_addr<=addrarr(idx);
            	ram_update<='1';
            	st<=wait_ram1;
            
            when wait_ram1=>
            	st<=wait_ram2;
            	
            when wait_ram2=>
            	st<=wait_ram3;
            	
            when wait_ram3=>
               st<=wait_ram_busy;
		
            when wait_ram_busy=>
                ram_update<='0';
                if (ram_busy='1') then
            		st<=wait_ram_busy;
            	else
                    rbytes(23-8*idx downto 16-8*idx)<=ram_datar;
                    if (idx<2) then 
                        idx<=idx+1;
                        st<=set_ram_addr;
                    else
                        st<=populate_regs;
                    end if;
            	end if;
            	
            when populate_regs=>
            	rval0<=rbytes(23 downto 12);
            	rval1<=rbytes(11 downto 0 );
            	busy<='0';
            	st<=idle;
            
            when others=>
                st<=idle;

        end case;
    end if;
end process;

end Behavioral;

