---*********************************************************************************
-- Indiana University
-- Center for Exploration of Energy and Matter (CEEM)
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    01/28/2014
--
--*********************************************************************************
-- Description:
-- Reads data from a file and writes it to a local link interface.
--
--*********************************************************************************

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use ieee.std_logic_unsigned.all;
	use ieee.std_logic_textio.all;
library std;
	use std.textio.all;

entity daq_fileio is
    generic(
        STIMULUS_FILE  	            : string	                                := ".\source\daq_fileio.txt";
        DWIDTH                      : integer                                   := 16);    
    port(
        clk                         : in std_logic;                              
        ce                          : in std_logic;                                      
        reset                       : in std_logic;                              
        fileio_enable               : in std_logic;        
        rx_dst_rdy_n                : in std_logic                              := '1';
        rx_sof_n                    : out std_logic                             := '1';
        rx_eof_n                    : out std_logic                             := '1';
        rx_src_rdy_n                : out std_logic                             := '1';
        rx_data                     : out std_logic_vector(DWIDTH-1 downto 0)   := (others => '0'));    
end daq_fileio;

architecture behave of daq_fileio is

begin

    ------------------------------------------------------------------
	-- Read stimulus from file
	------------------------------------------------------------------
	stim_file_pcs : process(clk)
		file stim_file		    : text open read_mode is STIMULUS_FILE;
		variable stim_line	    : line;
        variable stim_bit       : std_logic;
        variable stim_word      : std_logic_vector(DWIDTH-1 downto 0);
		variable valid_line	    : std_logic;
	begin
		if rising_edge(clk) then
			valid_line := '0';
			if (fileio_enable = '1') and (rx_dst_rdy_n = '0') then
				read_loop : while ((not endfile(stim_file)) and (valid_line = '0')) loop
                    -- read digital data from input file
                    readline(stim_file,stim_line);
                    -- skip blank lines or comments
                    if ((stim_line'LENGTH=0) or (stim_line(stim_line'LEFT)='#')) then
                        valid_line := '0';
                        next read_loop;
                    else
                        valid_line := '1';
                        read(stim_line,stim_bit);
                        rx_sof_n <= stim_bit;
                        read(stim_line,stim_bit);
                        rx_eof_n <= stim_bit;
                        read(stim_line,stim_bit);
                        rx_src_rdy_n <= stim_bit;
                        hread(stim_line,stim_word);
                        rx_data <= stim_word;
                    end if;
        		end loop;
            else
                rx_sof_n <= '1';
                rx_eof_n <= '1';
                rx_src_rdy_n <= '1';
                rx_data <= (others => '1');
			end if;
		end if;
	end process;
    --------------------------------------------------------------------------------


end behave;