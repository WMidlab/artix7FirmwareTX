--*********************************************************************************
-- Indiana University
-- Center for Exploration of Energy and Matter (CEEM)
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    12/11/2012
--
--*********************************************************************************
-- Description:
-- Test bench for time order channel enity.
--*********************************************************************************

library ieee;
	use ieee.std_logic_1164.all;
--	use ieee.math_real.all;
-- 	use ieee.numeric_std.all;
	use ieee.std_logic_unsigned.all;
	use ieee.std_logic_textio.all;
library std;
	use std.textio.all;        
library work;
    use work.time_order_pkg.all;

entity time_order_tb is
end time_order_tb;

architecture behave of time_order_tb is

    component coinc_find is
        generic(
        IN_WIDTH                    : integer;
        OUT_WIDTH                   : integer;
        CH_WIDTH                    : integer;
        TDC_WIDTH                   : integer);
        port(
        -- inputs ---------------------------------------------
        clk 						: in std_logic;
        ce                          : in std_logic;
        reset                       : in std_logic;
        coinc_window                : in std_logic_vector(TDC_WIDTH-1 downto 0);
        rx_dst_rdy_n                : out std_logic;
        rx_sof_n                    : in std_logic;
        rx_eof_n                    : in std_logic;
        rx_src_rdy_n                : in std_logic;
        rx_data                     : in std_logic_vector(IN_WIDTH-1 downto 0);
        tofifo_rd                   : in std_logic;
        -- outputs --------------------------------------------
        tofifo_epty                 : out std_logic;
        tofifo_dout                 : out std_logic_vector(OUT_WIDTH-1 downto 0));
    end component;

    component time_order is
        port(
        clk						    : in std_logic;
        ce                          : in std_logic;
        reset						: in std_logic;
        dst_full                    : in std_logic;
        src_epty                    : in std_logic_vector(1 to TO_NUM_LANES);
        din    	                    : in trigger_data_type;
        src_re                      : out std_logic_vector(1 to TO_NUM_LANES);
        dst_we                      : out std_logic;
        dout                        : out std_logic_vector(TO_WIDTH-1 downto 0));
    end component;

	constant STIMULUS_FILE  	    : string	                                := "..\..\coinc_find\sim\source\coinc_find_tb.txt";
    constant CLKPER                 : time                                      := 4 ns;
	constant CLKHLFPER              : time		                                := CLKPER/2;	
    
    constant IN_WIDTH               : integer                                   := 16;
    constant OUT_WIDTH              : integer                                   := 32;
    constant TDC_WIDTH              : integer                                   := 9;
    constant CH_WIDTH               : integer                                   := 8;
    constant COINC_WINDOW           : std_logic_vector(TDC_WIDTH-1 downto 0)    := "000001000";    
    

    type to_ctrl_type is array (1 to TO_NUM_LANES) of std_logic;


	-- Test bench signals

	signal clk				        : std_logic                                     := '1';
    signal ce                       : std_logic                                     := '0';
	signal reset		            : std_logic	                                    := '1';    
    signal tofifo_dout_t            : trigger_data_type;
    signal tofifo_re                : std_logic_vector(1 to TO_NUM_LANES);
    signal tofifo_epty              : std_logic_vector(1 to TO_NUM_LANES);
    signal dst_we                   : std_logic;
    signal ordered                  : std_logic_vector(TO_WIDTH-1 downto 0);
    signal ce_cnt                   : std_logic_vector(2 downto 0)                  := (others => '1');

    signal full_reg                 : std_logic_vector(15 downto 0);
    signal bpi_full                 : std_logic                                     := '0';
    signal cordered                 : std_logic_vector(TO_CWIDTH-1 downto 0);
    signal dordered                 : std_logic_vector(TO_DWIDTH-1 downto 0);    

    signal rx_dst_rdy_n             : to_ctrl_type                                  := (others => '1');
    signal rx_sof_n                 : to_ctrl_type                                  := (others => '1');
    signal rx_eof_n                 : to_ctrl_type                                  := (others => '1');
    signal rx_src_rdy_n             : to_ctrl_type                                  := (others => '1');
    signal rx_data                  : aurora_data_type                              := (others => (others => '1'));
    signal fileio_enable            : std_logic                                     := '0';
    
    signal test                     : std_logic;

begin

    ------------------------------------------------------------
    -- Use coincidence finder for stimulus because doing
    -- otherwise requires too much labor.
    ------------------------------------------------------------
    COINC_GEN:
    for I in 1 to TO_NUM_LANES generate
        coinc_find_ins : coinc_find
        generic map(
            IN_WIDTH                => IN_WIDTH,
            OUT_WIDTH               => OUT_WIDTH,
            CH_WIDTH                => CH_WIDTH,
            TDC_WIDTH               => TDC_WIDTH)
        port map(
            -- inputs ---------------------------------------------
            clk 					=> clk,
            ce                      => ce,
            reset                   => reset,            
            coinc_window            => COINC_WINDOW,            
            rx_dst_rdy_n            => rx_dst_rdy_n(I),
            rx_sof_n                => rx_sof_n(I),
            rx_eof_n                => rx_eof_n(I),
            rx_src_rdy_n            => rx_src_rdy_n(I),
            rx_data                 => rx_data(I),
            tofifo_rd               => tofifo_re(I),
            -- outputs --------------------------------------------
            tofifo_epty             => tofifo_epty(I),
            tofifo_dout             => tofifo_dout_t(I)
        );
    end generate;

    UUT : time_order
    port map(
        clk						    => clk,
        ce                          => ce,
        reset						=> reset,
        dst_full                    => bpi_full,
        src_epty                    => tofifo_epty,
        din    	                    => tofifo_dout_t,
        src_re                      => tofifo_re,
        dst_we                      => dst_we,
        dout                        => ordered
    );

	-- Simulate power on reset
	reset <= '0' after 200 ns;
    fileio_enable <= not reset'delayed(200 ns);
	-- Generate clock
	clk <= (not clk) after CLKHLFPER;


    bpi_full <= full_reg(5);

    cordered <= ordered(ordered'length-1 downto ordered'length-TO_CWIDTH);
    dordered <= ordered(TO_DWIDTH-1 downto 0);

    
    --------------------------------------------------------------------------
	-- Generate a psuedo-random shift regiser to incrment counter a many
    -- different intervals, to provide stimulus that fully verifies
    -- time order circuit.
	--------------------------------------------------------------------------
	full_pcs : process(reset,clk)
	begin
        if reset = '1' then
            full_reg <= "0110110010101001";
        else
            if rising_edge(clk) then
                full_reg <= full_reg(14 downto 0) & (full_reg(15) xor full_reg(12));
            end if;
        end if;
	end process;

    --------------------------------------------------------------------------
	-- Two-bit counter for discriminator input.
	--------------------------------------------------------------------------
	ce_cnt_pcs : process(reset,clk)
	begin
        if reset = '1' then
            ce_cnt <= (others => '0');
        else
            if rising_edge(clk) then
                ce_cnt <= ce_cnt + 1;
            end if;
        end if;
	end process;

	ce2x_pcs : process
	begin
        wait until rising_edge(ce_cnt(0));
            ce <= '1';
        wait for CLKPER;
            ce <= '0';
	end process;

    ------------------------------------------------------------------
	-- Read stimulus from file
	------------------------------------------------------------------
	stim_file_pcs : process(clk)
		file stim_file		    : text open read_mode is STIMULUS_FILE;
		variable stim_line	    : line;
        variable stim_bit       : std_logic;
        variable stim_word      : std_logic_vector(IN_WIDTH-1 downto 0);
		variable valid_line	    : std_logic;
	begin
		if rising_edge(clk) then
			valid_line := '0';
			if (fileio_enable = '1') then
				read_loop : while ((not endfile(stim_file)) and (valid_line = '0')) loop
        			-- read digital data from input file
        			readline(stim_file,stim_line);
		 			-- skip blank lines or comments
					if ((stim_line'LENGTH = 0) or (stim_line(stim_line'LEFT) = '#')) then
						valid_line := '0';
						next read_loop;
					else
						valid_line := '1';
                        read(stim_line,stim_bit);
                        rx_sof_n <= (others => stim_bit);
                        test <= stim_bit;
                        read(stim_line,stim_bit);
                        rx_eof_n <= (others => stim_bit);
                        read(stim_line,stim_bit);
                        rx_src_rdy_n <= (others => stim_bit);
                        hread(stim_line,stim_word);
                        rx_data <= (others => stim_word);
					end if;
        		end loop;
			end if;
		end if;
	end process;
    --------------------------------------------------------------------------------

end behave;