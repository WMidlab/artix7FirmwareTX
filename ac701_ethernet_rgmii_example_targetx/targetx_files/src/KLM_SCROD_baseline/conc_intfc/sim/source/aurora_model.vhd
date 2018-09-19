--*********************************************************************************
-- Indiana University
-- Center for Exploration of Energy and Matter (CEEM)
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    06/10/2014
--
--*********************************************************************************
-- Description:
-- Simulate an Aurora interface (without the MGT)
--
--*********************************************************************************

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;

entity aurora_model is
generic(
    USE_LFSR                        : std_logic;
    PKT_SZ                          : integer;
    CLKPER                          : time);
port(
    clk                             : in std_logic;
    stim_enable                     : in std_logic;
    rx_dst_rdy_n                    : out std_logic;
    rx_sof_n                        : in std_logic;
    rx_eof_n                        : in std_logic;
    rx_src_rdy_n                    : in std_logic;
    rx_data                         : in std_logic_vector (15 downto 0);
    tx_dst_rdy_n                    : in std_logic;
    tx_sof_n                        : out std_logic;
    tx_eof_n                        : out std_logic;
    tx_src_rdy_n                    : out std_logic;
    tx_data                         : out std_logic_vector (15 downto 0));
end aurora_model;

architecture behave of aurora_model is

    signal tx_ctr                   : std_logic_vector(15 downto 0);
    signal epty_reg                 : std_logic_vector(15 downto 0);
    signal source_eptyn             : std_logic                             := '0';    
    signal full_reg                 : std_logic_vector(15 downto 0)         := (others => '0');        

begin

    source_eptyn <= epty_reg(0) when USE_LFSR = '1' else '1';
    tx_data <= tx_ctr;
    rx_dst_rdy_n <= full_reg(0) when USE_LFSR = '1' else '0';

    ------------------------------------------------------------------
	-- Generate DAQ stimulus from a counter. Just count through an
    -- entire DAQ packet as would occur after a trigger.
    -- The EOF signal will stay asserted forever if PKT_SZ = 2^16-1.
	------------------------------------------------------------------
    run_ctrl_pcs : process
    begin
        tx_sof_n <= '1';
        tx_eof_n <= '1';
        tx_src_rdy_n <= '1';
        tx_ctr <= (others => '0');
        wait until rising_edge(stim_enable);
        packet_loop: while(TRUE) loop
            wait until rising_edge(clk);
            -- DAQ data available and the reciever is ready
            if (source_eptyn = '1') and (tx_dst_rdy_n = '0')  then
                -- start the counter
                if tx_ctr = 0 then
                -- start of frame
                    tx_sof_n <= '0';
                    tx_eof_n <= '1';
                    tx_src_rdy_n <= '0';
                    tx_ctr <= tx_ctr + 1;
                elsif tx_ctr < (PKT_SZ-1) then
                    tx_src_rdy_n <= '0';
                    tx_sof_n <= '1';
                    tx_eof_n <= '1';
                    tx_ctr <= tx_ctr + 1;
                elsif tx_ctr = (PKT_SZ-1) then
                -- end of frame
                    tx_sof_n <= '1';
                    tx_eof_n <= '0';
                    tx_src_rdy_n <= '0';
                    tx_ctr <= tx_ctr + 1;
                else
                    tx_sof_n <= '1';
                    tx_eof_n <= '1';
                    tx_src_rdy_n <= '1';
                    tx_ctr <= (others => '0');
                    wait for CLKPER*14;
                end if;
            else
                tx_sof_n <= '1';
                tx_eof_n <= '1';
                tx_src_rdy_n <= '1';
            end if;
        end loop; -- packet_loop
    end process;

    --------------------------------------------------------------------------
	-- Generate a psuedo-random shift register to simulate a pause in the data
    -- from the source interface - the TARGET ASIC in this case.
	--------------------------------------------------------------------------
	empty_pcs : process(stim_enable,clk)
	begin
        if stim_enable = '0' then
            epty_reg <= "0110110010101111";
        else
            if rising_edge(clk) then
                epty_reg <= epty_reg(14 downto 0) & (epty_reg(15) xor epty_reg(3));
            end if;
        end if;
	end process;
    
    --------------------------------------------------------------------------
    -- Generate a psuedo-random shift register to generate a full signal to 
    -- simulate Aurora abitilty to accept data.
    --------------------------------------------------------------------------
    full_pcs : process(stim_enable,clk)
    begin
        if stim_enable = '0' then
            full_reg <= "0110110010101001";
        else
            if rising_edge(clk) then
                full_reg <= full_reg(14 downto 0) & (full_reg(15) xor full_reg(12));
            end if;
        end if;
    end process;    

end behave;