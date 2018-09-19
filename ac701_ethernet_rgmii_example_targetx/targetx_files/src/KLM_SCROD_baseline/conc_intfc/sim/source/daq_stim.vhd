--*********************************************************************************
-- Indiana University
-- Center for Exploration of Energy and Matter (CEEM)
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    10/15/2014
--
--*********************************************************************************
-- Description:
-- Generate stimulus for DAQ portion of testbench.
--
--*********************************************************************************

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.std_logic_misc.all;
    use ieee.numeric_std.all;
    use ieee.math_real.all;

entity daq_stim is
    generic(
        DWIDTH                      : integer;
        SEED                        : integer;
        USE_PAUSE                   : std_logic);
    port(
        clk                         : in std_logic;
        reset                       : in std_logic;
        enable                      : in std_logic;
        trigger                     : in std_logic;        
        ctime                       : in std_logic_vector(26 downto 0);
        dst_rdy_n                   : in std_logic;
        sof_n                       : out std_logic;
        eof_n                       : out std_logic;
        src_rdy_n                   : out std_logic;
        data                        : out std_logic_vector(DWIDTH-1 downto 0));
end daq_stim;

------------------------------------------------------------------------------------
-- Scintillator/Motherboard/SCROD model
------------------------------------------------------------------------------------
architecture scint_arch of daq_stim is

    type state_type is (IDLES,SOFS,PLDS,EOFS);

    signal sof                      : std_logic;
    signal eof                      : std_logic;
    signal rdy                      : std_logic;
    signal pktlen_prng              : std_logic_vector(3 downto 0);
    signal pause_prng               : std_logic_vector(3 downto 0);
    signal zlt_prng                 : std_logic_vector(3 downto 0);
    signal pkt_en                   : std_logic;
    signal pktlen_ctr               : std_logic_vector(3 downto 0);
    signal pause_ctr                : std_logic_vector(7 downto 0)  := (others =>'1');
    signal wdtyp_ctr                : integer range 0 to 3;
    signal zlt_ctr                  : std_logic_vector(3 downto 0)  := (others =>'1');
    signal channel                  : std_logic_vector(6 downto 0);
    signal chan_ctr                 : integer range 1 to 75;
    signal axis_bit                 : std_logic;
    signal state                    : state_type;
    signal tdc                      : std_logic_vector(10 downto 0);--size of scint time
    signal charge                   : std_logic_vector(DWIDTH-1 downto 0);
    signal zlt                      : std_logic;
    signal tdc_ctr                  : std_logic_vector(7 downto 0);

begin

    PGEN : if USE_PAUSE = '1' generate
        pkt_en <= (not dst_rdy_n) and pause_prng(1);
    end generate;
    
    NOPGEN : if USE_PAUSE = '0' generate
        pkt_en <= (not dst_rdy_n);
    end generate;
    

    sof_n <= not sof;
    eof_n <= not eof;
    src_rdy_n <= not rdy;
    channel <= STD_LOGIC_VECTOR(TO_UNSIGNED(chan_ctr,channel'length));
    tdc <= tdc_ctr & "000";
    charge <= STD_LOGIC_VECTOR(TO_UNSIGNED(21845,DWIDTH));
    zlt <= '1' when zlt_ctr < 2 else '0'; --two consecutive ZLTs

    -------------------------------------------------------
    -- Generate psuedo-random registers with seeds based
    -- on channel to generate values.
    -------------------------------------------------------
    prng_pcs : process(reset,clk)
        variable seed1, seed2 : positive := SEED;
        variable seed3, seed4 : positive := SEED+2;
        variable seed5, seed6 : positive := 1;
        variable prng1, prng2 : real;
        variable prng3        : real;
    begin
        if rising_edge(clk) then
            uniform(seed1,seed2,prng1);
            uniform(seed3,seed4,prng2);
            uniform(seed5,seed6,prng3);
            -- length of packet
            pktlen_prng <= STD_LOGIC_VECTOR(TO_UNSIGNED(1+NATURAL(prng1*REAL((2**4)-2)),pktlen_prng'length));
            -- pause between packets
            pause_prng <= STD_LOGIC_VECTOR(TO_UNSIGNED(NATURAL(prng2*REAL((2**12)-1)),pause_prng'length));
            -- force zero length triggers
            zlt_prng <= STD_LOGIC_VECTOR(TO_UNSIGNED(NATURAL(prng3*REAL((2**12)-1)),zlt_prng'length));
        end if;
    end process;

    -------------------------------------------------------
    -- Packet generation state machine.
    -------------------------------------------------------
    fsm_pcs : process(reset,clk)
    begin
        if reset = '1' then
            sof <= '0';
            eof <= '0';
            rdy <= '0';
            data <= (others => '1');
            chan_ctr <= 1;
            axis_bit <= '0';
            pktlen_ctr <= (others => '1');
            wdtyp_ctr <= 0;
            state <= IDLES;
        else
            axis_bit <= not axis_bit;
            if rising_edge(clk) then
                case state is
                when IDLES =>
                -- wait for packet enable
                    sof <= '0';
                    eof <= '0';
                    rdy <= '0';
                    data <= (others => '1');
                    chan_ctr <= 1;
                    if zlt = '1' then
                        pktlen_ctr <= STD_LOGIC_VECTOR(TO_UNSIGNED(1,pktlen_ctr'length));
                    else
                        pktlen_ctr <= pktlen_prng;
                    end if;
                    wdtyp_ctr <= 0;
                    if trigger = '1' then
                        state <= SOFS;
                    else
                        state <= IDLES;
                    end if;
                when SOFS =>
                -- start of frame
                    sof <= '1';
                    rdy <= '1';
                    data <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(axis_bit & channel),DWIDTH));
                    chan_ctr <= chan_ctr + 1;
                    if pktlen_ctr > 1 then
                        pktlen_ctr <= pktlen_ctr - '1';
                    else
                        pktlen_ctr <= pktlen_ctr;
                    end if;
                    -- special word -> trigger tag
                    wdtyp_ctr <= 1;
                    if pktlen_ctr = 1 then
                    -- single cycle frame
                        eof <= '1';
                        state <= IDLES;
                    else
                    -- normal frame
                        eof <= '0';
                        state <= PLDS;
                    end if;
                when PLDS =>
                -- payload, cycle through word types until end of frame/trigger
                    sof <= '0';
                    eof <= '0';
                    if pkt_en = '1' then
                    -- send data
                        rdy <= '1';
                        -- axis bit + 75 channels
                        if chan_ctr < 75 then
                            chan_ctr <= chan_ctr + 1;
                        else
                            chan_ctr <= 1;
                        end if;
                        -- keep track of words sent and type of word to send
                        if wdtyp_ctr < 3 then
                            wdtyp_ctr <= wdtyp_ctr + 1;
                            pktlen_ctr <= pktlen_ctr;
                        else
                            wdtyp_ctr <= 0;
                            if pktlen_ctr > 1 then
                                pktlen_ctr <= pktlen_ctr - 1;
                            else
                                pktlen_ctr <= pktlen_ctr;
                            end if;
                        end if;
                        -- alternate between words
                        case wdtyp_ctr is
                            when 0 =>
                                data <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(axis_bit & channel),DWIDTH));
                            when 1 =>
                                data <= ctime(15 downto 0);
                            when 2 =>
                                data <= STD_LOGIC_VECTOR(RESIZE(UNSIGNED(tdc),DWIDTH));
                            when 3 =>
                                data <= charge;
                            when others =>
                                null;
                        end case;
                        if (pktlen_ctr = 1) and (wdtyp_ctr = 2) then
                        -- last word
                            state <= EOFS;
                        else
                        -- keep writing
                            state <= PLDS;
                        end if;
                    else
                    -- wait for packet enable
                        rdy <= '0';
                        data <= ctime(15 downto 0);
                        chan_ctr <= chan_ctr;
                        wdtyp_ctr <= wdtyp_ctr;
                        pktlen_ctr <= pktlen_ctr;
                        state <= PLDS;
                    end if;
                when EOFS =>
                -- end of frame
                    sof <= '0';
                    eof <= '1';
                    rdy <= '1';
                    data <= charge;
                    chan_ctr <= chan_ctr + 1;
                    pktlen_ctr <= pktlen_ctr - 1;
                    wdtyp_ctr <= wdtyp_ctr;
                    state <= IDLES;
                when others =>
                    NULL;
                end case;
            end if;
        end if;
    end process;

    -------------------------------------------------------
    -- Simulate TDC.
    -------------------------------------------------------
    tdc_pcs : process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                tdc_ctr <= (others => '0');
            else
                tdc_ctr <= tdc_ctr + '1';
            end if;
        end if;
    end process;
    
    -------------------------------------------------------
    -- Generate zero length triggers
    -------------------------------------------------------    
    zlt_pcs : process(clk)
    begin
        if rising_edge(clk) then
            if zlt_ctr = 0 then
                zlt_ctr <= zlt_prng;
            else
                if trigger = '1' then
                    zlt_ctr <= zlt_ctr - '1';
                end if;
            end if;
        end if;
    end process;    

end scint_arch;

