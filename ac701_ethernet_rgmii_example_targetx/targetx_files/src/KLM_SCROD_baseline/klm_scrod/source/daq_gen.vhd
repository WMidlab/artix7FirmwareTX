--*********************************************************************************
-- Indiana University CEEM
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    10/13/2014
--
--*********************************************************************************
-- Description:
--
-- Generate somewhat realistic DAQ data for generating events in the Data
-- Concentrator.
--
--*********************************************************************************


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity daq_gen is
generic(
    SIM_SPEEDUP     : in std_logic := '0');
port(
    clk             : in std_logic;
    reset           : in std_logic;
    channel_up      : in std_logic;
    addr            : in std_logic_vector(3 downto 0);
    trigger         : in std_logic;
    trgrdy          : in std_logic;
    trgnext         : in std_logic;
    ctime           : in std_logic_vector(15 downto 0);
    tx_dst_rdy_n    : in std_logic;
    tx_src_rdy_n    : out std_logic;
    tx_sof_n        : out std_logic;
    tx_eof_n        : out std_logic;
    tx_d            : out std_logic_vector(15 downto 0);
    tx_rem          : out std_logic);
end daq_gen;

architecture single_trig of daq_gen is

    constant ABD_INITV          : std_logic_vector(23 downto 0)     := X"0FFFFF";
    constant ABD_SIMV           : std_logic_vector(23 downto 0)     := X"0000FF";
    constant PDT_INITV          : std_logic_vector(1 downto 0)      := "11";
    constant PDT_SIMV           : std_logic_vector(1 downto 0)      := "11";
    constant PDW_INITV          : std_logic_vector(1 downto 0)      := "11";
    constant PDW_SIMV           : std_logic_vector(1 downto 0)      := "11";
    constant PDS_INITV          : std_logic_vector(3 downto 0)      := X"F";
    constant PDS_SIMV           : std_logic_vector(3 downto 0)      := X"F";

    type daq_fsm_type is (IDLES,TRIGGERS,ASICS,PAYLOADS,ZLTS);
    type lls_fsm_type is (IDLES,SOFS,PAYLOADS,EOFS);

    signal daq_fsm_cs_t         : daq_fsm_type;
    signal ll_fsm_cs_t          : lls_fsm_type;

    signal abd_init             : std_logic_vector(23 downto 0)     := (others => '1');
    signal abd_ctr_ld           : std_logic                         := '1';
    signal abd_ctr              : std_logic_vector(23 downto 0)     := (others => '1');
    signal abd_ctr_tc           : std_logic                         := '0';
    signal pdt_init             : std_logic_vector(1 downto 0);
    signal pdt_ctr_en           : std_logic                         := '0';
    signal pdt_ctr              : std_logic_vector(1 downto 0)      := (others => '1');
    signal pdt_ctr_tc           : std_logic                         := '0';
    signal pdw_init             : std_logic_vector(1 downto 0);
    signal pdw_ctr_ld           : std_logic                         := '1';
    signal pdw_ctr              : std_logic_vector(1 downto 0)      := (others => '1');
    signal pdw_ctr_lc           : std_logic                         := '0';
    signal pdw_ctr_tc           : std_logic                         := '0';
    signal pds_init             : std_logic_vector(3 downto 0)      := (others => '1');
    signal pds_ctr_ld           : std_logic                         := '1';
    signal pds_ctr              : std_logic_vector(3 downto 0)      := (others => '1');
    signal pds_ctr_lc           : std_logic                         := '0';
    signal pds_ctr_tc           : std_logic                         := '0';
    signal zlt_en               : std_logic                         := '0';
    signal tdc_ctr              : std_logic_vector(10 downto 0);
    signal dmux_sel             : std_logic_vector(1 downto 0);
    signal tx_src_rdy           : std_logic;

begin

--------------------------------------------------------------------------------------------------------
-- Component instantiations
--------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------
-- Concurrent statements
--------------------------------------------------------------------------------------------------------

    --------------------------------------------------------
    -- Combinational logic
    --------------------------------------------------------
    abd_init <= ABD_SIMV when SIM_SPEEDUP = '1' else ABD_INITV;
    pdt_init <= PDT_SIMV when SIM_SPEEDUP = '1' else PDT_INITV;
    pdw_init <= PDW_SIMV when SIM_SPEEDUP = '1' else PDW_INITV;
    pds_init <= PDS_SIMV when SIM_SPEEDUP = '1' else PDS_INITV;

    pdw_ctr_tc <= '1' when pdw_ctr = 0 else '0';

---------------------------------------------------------------------------------------------------------
-- Synchronous processes
---------------------------------------------------------------------------------------------------------

    -------------------------------------------------------------
    -- State machine to create data.
    -------------------------------------------------------------
    daq_fsm : process(clk)
    begin
        if (clk'event and clk='1') then
            if reset = '1' then
                abd_ctr_ld <= '1';
                pdw_ctr_ld <= '1';
                pds_ctr_ld <= '1';
                zlt_en <= '0';
                daq_fsm_cs_t <= IDLES;
            else
                case daq_fsm_cs_t is
                    when IDLES =>
                    -- wait for the Aurora Core to init
                        abd_ctr_ld <= '1';
                        pdw_ctr_ld <= '1';
                        pds_ctr_ld <= '1';
                        zlt_en <= '0';
                        if channel_up = '1' then
                            daq_fsm_cs_t <= TRIGGERS;
                        else
                            daq_fsm_cs_t <= IDLES;
                        end if;
                    when TRIGGERS =>
                    -- wait for a trigger
                        abd_ctr_ld <= '1';
                        pdw_ctr_ld <= '1';
                        pds_ctr_ld <= '1';
                        zlt_en <= '0';
                        if trigger = '1' then
                            daq_fsm_cs_t <= ASICS;
                        else
                            daq_fsm_cs_t <= TRIGGERS;
                        end if;
                    when ASICS =>
                    -- simulate the time it takes TARGET to read buffer
                        abd_ctr_ld <= '0';
                        pdw_ctr_ld <= '1';
                        pds_ctr_ld <= '1';
                        zlt_en <= '0';
                        if abd_ctr_tc = '1' then
                            if pdt_ctr_tc = '1' then
                                daq_fsm_cs_t <= ZLTS;
                            else
                                daq_fsm_cs_t <= PAYLOADS;
                            end if;
                        else
                            daq_fsm_cs_t <= ASICS;
                        end if;
                    when PAYLOADS =>
                    -- write a packet
                        abd_ctr_ld <= '1';
                        pdw_ctr_ld <= '0';
                        pds_ctr_ld <= '0';
                        zlt_en <= '0';
                        if (pdw_ctr_tc and pds_ctr_tc) = '1' then
                            daq_fsm_cs_t <= IDLES;
                        else
                            daq_fsm_cs_t <= PAYLOADS;
                        end if;
                    when ZLTS =>
                    -- send zero length trigger
                        abd_ctr_ld <= '1';
                        pdw_ctr_ld <= '1';--pulse
                        pds_ctr_ld <= '1';-- pulse
                        zlt_en <= '1';
                        daq_fsm_cs_t <= IDLES;
                    when others =>
                        abd_ctr_ld <= '1';
                        pdw_ctr_ld <= '1';
                        pds_ctr_ld <= '1';
                        daq_fsm_cs_t <= IDLES;
                end case;
            end if;
        end if;
    end process;

    -------------------------------------------------------------
    -- Generate counter simulate ASIC buffer read delay.
    -------------------------------------------------------------
    abd_count_pcs : process(clk)
    begin
        if (clk'event and clk='1') then
            if abd_ctr_ld = '1' then
                abd_ctr <= abd_init;
            else
                abd_ctr <= abd_ctr - 1;
            end if;
            -- terminal count ---------------
            if (abd_ctr = 0) then
                abd_ctr_tc <= '1';
            else
                abd_ctr_tc <= '0';
            end if;
        end if;
    end process;

    -------------------------------------------------------------
    -- Count the types of payload.
    -------------------------------------------------------------
    pdt_count_pcs : process(clk)
    begin
        if (clk'event and clk='1') then
            pdt_ctr_en <= trigger;
            if reset = '1' then
                pdt_ctr <= pdt_init;
            else
                if pdt_ctr_en = '1' then
                    pdt_ctr <= pdt_ctr - 1;
                end if;
            end if;
            -- terminal count ---------------
            if (pdt_ctr = 0) then
                pdt_ctr_tc <= '1';
            else
                pdt_ctr_tc <= '0';
            end if;
        end if;
    end process;

    -------------------------------------------------------------
    -- Count the number of words in the sample.
    -------------------------------------------------------------
    pdw_count_pcs : process(clk)
    begin
        if (clk'event and clk='1') then
            if pdw_ctr_ld = '1' then
                pdw_ctr <= pdw_init;
            else
                if tx_dst_rdy_n = '0' then
                    pdw_ctr <= pdw_ctr - 1;
                end if;
            end if;
            -- load count ---------------
            if (pdw_ctr = pdw_init) then
                pdw_ctr_lc <= '1';
            else
                pdw_ctr_lc <= '0';
            end if;
            -- terminal count ---------------
            -- if (pdw_ctr = 0) then
                -- pdw_ctr_tc <= '1';
            -- else
                -- pdw_ctr_tc <= '0';
            -- end if;
        end if;
    end process;

    -------------------------------------------------------------
    -- Count the number of samples in the payload.
    -------------------------------------------------------------
    pds_count_pcs : process(clk)
    begin
        if (clk'event and clk='1') then
            if pds_ctr_ld = '1' then
                pds_ctr <= pds_init;
            else
                if pdw_ctr_tc = '1' then
                    pds_ctr <= pds_ctr - 1;
                end if;
            end if;
            -- load count ---------------
            if (pds_ctr = pds_init) then
                pds_ctr_lc <= '1';
            else
                pds_ctr_lc <= '0';
            end if;
            -- terminal count ---------------
            if (pds_ctr = 0) then
                pds_ctr_tc <= '1';
            else
                pds_ctr_tc <= '0';
            end if;
        end if;
    end process;

    -------------------------------------------------------------
    -- Generate a TDC value
    -------------------------------------------------------------
    tdc_pcs : process(clk)
    begin
        if (clk'event and clk='1') then
            if reset = '1' then
                tdc_ctr <= (others => '0');
            else
                tdc_ctr <= tdc_ctr - 1;
            end if;
        end if;
    end process;

    -------------------------------------------------------------
    -- State machine to generate local link signals.
    -------------------------------------------------------------
    ll_fsm : process(clk)
    begin
        if (clk'event and clk='1') then
            if reset = '1' then
                tx_sof_n <= '1';
                tx_eof_n <= '1';
                tx_src_rdy_n <= '1';
                ll_fsm_cs_t <= IDLES;
            else
                case ll_fsm_cs_t is
                    when IDLES =>
                    -- wait for the packet counters
                        --tx_sof_n <= '1';
                        --tx_eof_n <= '1';
                        --tx_src_rdy_n <= '1';
                        if (pds_ctr_ld or tx_dst_rdy_n) = '0' then
                        -- send start of frame
                            tx_eof_n <= '1';
                            tx_sof_n <= '0';
                            tx_src_rdy_n <= '0';
                            --ll_fsm_cs_t <= SOFS;
                            ll_fsm_cs_t <= PAYLOADS;
                        else
                        -- idle
                            tx_eof_n <= not zlt_en;
                            tx_sof_n <= not zlt_en;
                            tx_src_rdy_n <= not zlt_en;
                            ll_fsm_cs_t <= IDLES;
                        end if;
                    -- when SOFS =>
                    -- send start of frame
                        -- tx_sof_n <= tx_dst_rdy_n;
                        -- tx_eof_n <= '1';
                        -- tx_src_rdy_n <= tx_dst_rdy_n;
                        -- if tx_dst_rdy_n = '0' then
                            -- ll_fsm_cs_t <= PAYLOADS;
                        -- else
                            -- ll_fsm_cs_t <= SOFS;
                        -- end if;
                    when PAYLOADS =>
                    -- send packet payload
                        tx_sof_n <= '1';
                        --tx_eof_n <= '1';
                        tx_src_rdy_n <= tx_dst_rdy_n;
                        if (pdw_ctr_tc and pds_ctr_tc) = '1' then
                            tx_eof_n <= '0';
                            ll_fsm_cs_t <= EOFS;
                        else
                            tx_eof_n <= '1';
                            ll_fsm_cs_t <= PAYLOADS;
                        end if;
                    when EOFS =>
                    -- send end of frame
                        tx_sof_n <= '1';
                        tx_eof_n <= '1';
                        tx_src_rdy_n <= '1';
                        if tx_dst_rdy_n = '0' then
                            ll_fsm_cs_t <= IDLES;
                        else
                            ll_fsm_cs_t <= EOFS;
                        end if;
                    when others =>
                        tx_sof_n <= '1';
                        tx_eof_n <= '1';
                        tx_src_rdy_n <= '1';
                        ll_fsm_cs_t <= IDLES;
                end case;
            end if;
        end if;
    end process;

    -------------------------------------------------------------
    -- Generat Local Link logic output.
    -------------------------------------------------------------
    ll_pcs : process(clk)
    begin
        if (clk'event and clk='1') then
            -- tx_src_rdy <= (not pds_ctr_ld) and (not tx_dst_rdy_n);
            -- tx_src_rdy_n <= (not tx_src_rdy);
            -- tx_sof_n <= (not (pdw_ctr_lc and pds_ctr_lc)) or pdw_ctr_ld;
            -- tx_eof_n <= not (pdw_ctr_tc and pds_ctr_tc);
            tx_rem       <= '0';
            --dmux_sel <= pdw_ctr;
            --case dmux_sel is
            case pdw_ctr is
            when "11" => --channel
                tx_d <= ((not addr(0)) & "000") & addr & X"5A";--just repeat axis bit/board address
            when "10" =>--ctime aument
                tx_d <= ctime;
            when "01" =>--time
                tx_d <= "00000" & tdc_ctr;
            when "00" =>--charge
                tx_d <= (others => '0');
            when others =>--don't care
                tx_d <= (others => 'X');
            end case;
        end if;
    end process;

end single_trig;


architecture multi_trig of daq_gen is

    constant ABD_INITV          : std_logic_vector(15 downto 0)     := X"07FF";
    constant ABD_SIMV           : std_logic_vector(15 downto 0)     := X"00FF";
    constant PDT_INITV          : std_logic_vector(1 downto 0)      := "11";
    constant PDT_SIMV           : std_logic_vector(1 downto 0)      := "11";
    constant PDW_INITV          : std_logic_vector(1 downto 0)      := "11";
    constant PDW_SIMV           : std_logic_vector(1 downto 0)      := "11";
    constant PDS_INITV          : std_logic_vector(3 downto 0)      := X"F";
    constant PDS_SIMV           : std_logic_vector(3 downto 0)      := X"F";

    type trigger_fsm_type is (IDLES,TTRDYS,SCTTRGS,DONES);
    type daq_fsm_type is (IDLES,TRIGGERS,ASICS,PAYLOADS,ZLTS,DONES);
    type lls_fsm_type is (SOFS,PAYLOADS,EOFS);

    signal daq_fsm_cs_t         : daq_fsm_type;
    signal ll_fsm_cs_t          : lls_fsm_type;

    signal trg_cs               : trigger_fsm_type;
    signal scint_trg            : std_logic;
    signal missed_trg           : std_logic_vector(7 downto 0);
    signal scint_trgrdy         : std_logic;
    signal abd_init             : std_logic_vector(15 downto 0)     := (others => '1');
    signal abd_ctr_ld           : std_logic                         := '1';
    signal abd_ctr              : std_logic_vector(15 downto 0)     := (others => '1');
    signal abd_ctr_tc           : std_logic                         := '0';
    signal pdt_init             : std_logic_vector(1 downto 0);
    signal pdt_ctr_en           : std_logic                         := '0';
    signal pdt_ctr              : std_logic_vector(1 downto 0)      := (others => '1');
    signal pdt_ctr_tc           : std_logic                         := '0';
    signal pdw_init             : std_logic_vector(1 downto 0);
    signal pdw_ctr_ld           : std_logic                         := '1';
    signal pdw_ctr              : std_logic_vector(1 downto 0)      := (others => '1');
    signal pdw_ctr_lc           : std_logic                         := '0';
    signal pdw_ctr_tc           : std_logic                         := '0';
    signal pds_init             : std_logic_vector(3 downto 0)      := (others => '1');
    signal pds_ctr_ld           : std_logic                         := '1';
    signal pds_ctr              : std_logic_vector(3 downto 0)      := (others => '1');
    signal pds_ctr_lc           : std_logic                         := '0';
    signal pds_ctr_tc           : std_logic                         := '0';
    signal zlt_en               : std_logic                         := '0';
    signal tdc_ctr              : std_logic_vector(10 downto 0);
    --signal dmux_sel             : std_logic_vector(1 downto 0);


begin

--------------------------------------------------------------------------------------------------------
-- Component instantiations
--------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------
-- Concurrent statements
--------------------------------------------------------------------------------------------------------

    --------------------------------------------------------
    -- Combinational logic
    --------------------------------------------------------
    abd_init <= ABD_SIMV when SIM_SPEEDUP = '1' else ABD_INITV;
    pdt_init <= PDT_SIMV when SIM_SPEEDUP = '1' else PDT_INITV;
    pdw_init <= PDW_SIMV when SIM_SPEEDUP = '1' else PDW_INITV;
    pds_init <= PDS_SIMV when SIM_SPEEDUP = '1' else PDS_INITV;

    pdw_ctr_tc <= '1' when pdw_ctr = 0 else '0';

---------------------------------------------------------------------------------------------------------
-- Synchronous processes
---------------------------------------------------------------------------------------------------------

    --------------------------------------------------------------------------
    -- Keep track of missed triggers.
    --------------------------------------------------------------------------
    trigger_fsm : process(clk)
    begin
        if (clk'event and clk = '1') then
            if reset = '1' then
                scint_trg <= '0';
                missed_trg <= (others => '0');
                trg_cs <= IDLES;
            else
                case trg_cs is
                    when IDLES =>
                    -- wait until trigger
                        scint_trg <= '0';
                        if trigger = '1' then
                            missed_trg <= missed_trg + 1;
                        else
                            missed_trg <= missed_trg;
                        end if;
                        if missed_trg > 0 then
                            trg_cs <= TTRDYS;
                        else
                            trg_cs <= IDLES;
                        end if;
                    when TTRDYS =>
                    -- wait wait for b2tt fifo to update so we have correct trigger tag
                        scint_trg <= '0';
                        if trigger = '1' then
                            missed_trg <= missed_trg + '1';
                        else
                            missed_trg <= missed_trg;
                        end if;
                        if trgrdy = '1' then
                            trg_cs <= SCTTRGS;
                        else
                            trg_cs <= TTRDYS;
                        end if;
                    when SCTTRGS =>
                    -- wait for scint trigger window
                        scint_trg <= '1';
                        if trigger = '1' then
                            missed_trg <= missed_trg + '1';
                        else
                            missed_trg <= missed_trg;
                        end if;
                        if scint_trgrdy = '1' then
                            trg_cs <= DONES;
                        else
                            trg_cs <= SCTTRGS;
                        end if;
                    when DONES =>
                    -- finished, count triggers, read next value
                        scint_trg <= '0';
                        -- wait for concentrator interface to read next trig
                        if trigger = '1' then
                            missed_trg <= missed_trg + '1';
                        else
                            if trgnext = '1' then
                                missed_trg <= missed_trg - '1';
                            else
                                missed_trg <= missed_trg;
                            end if;
                        end if;
                        if trgnext = '1' then
                            trg_cs <= IDLES;
                        else
                            trg_cs <= DONES;
                        end if;
                    when others =>
                        scint_trg <= '0';
                        missed_trg <= (others => '0');
                        trg_cs <= IDLES;
                end case;
            end if;
        end if;
    end process;


    -------------------------------------------------------------
    -- State machine to create fake data.
    -------------------------------------------------------------
    daq_fsm : process(clk)
    begin
        if (clk'event and clk='1') then
            if reset = '1' then
                abd_ctr_ld <= '1';
                pdw_ctr_ld <= '1';
                pds_ctr_ld <= '1';
                zlt_en <= '0';
                scint_trgrdy <= '0';
                daq_fsm_cs_t <= IDLES;
            else
                case daq_fsm_cs_t is
                    when IDLES =>
                    -- wait for the Aurora Core to init
                        abd_ctr_ld <= '1';
                        pdw_ctr_ld <= '1';
                        pds_ctr_ld <= '1';
                        zlt_en <= '0';
                        scint_trgrdy <= '0';
                        if channel_up = '1' then
                            daq_fsm_cs_t <= TRIGGERS;
                        else
                            daq_fsm_cs_t <= IDLES;
                        end if;
                    when TRIGGERS =>
                    -- wait for a trigger
                        abd_ctr_ld <= '1';
                        pdw_ctr_ld <= '1';
                        pds_ctr_ld <= '1';
                        zlt_en <= '0';
                        scint_trgrdy <= '0';
                        if scint_trg = '1' then
                            daq_fsm_cs_t <= ASICS;
                        else
                            daq_fsm_cs_t <= TRIGGERS;
                        end if;
                    when ASICS =>
                    -- simulate the time it takes TARGET to read buffer
                        abd_ctr_ld <= '0';
                        pdw_ctr_ld <= '1';
                        pds_ctr_ld <= '1';
                        zlt_en <= '0';
                        scint_trgrdy <= '0';
                        if abd_ctr_tc = '1' then
                            if pdt_ctr_tc = '1' then
                                daq_fsm_cs_t <= ZLTS;
                            else
                                daq_fsm_cs_t <= PAYLOADS;
                            end if;
                        else
                            daq_fsm_cs_t <= ASICS;
                        end if;
                    when PAYLOADS =>
                    -- write a packet
                        abd_ctr_ld <= '1';
                        pdw_ctr_ld <= '0';
                        pds_ctr_ld <= '0';
                        zlt_en <= '0';
                        if (pdw_ctr_tc and pds_ctr_tc) = '1' then
                            scint_trgrdy <= '1';
                            daq_fsm_cs_t <= DONES;
                        else
                            scint_trgrdy <= '0';
                            daq_fsm_cs_t <= PAYLOADS;
                        end if;
                    when ZLTS =>
                    -- send zero length trigger
                        abd_ctr_ld <= '1';
                        pdw_ctr_ld <= '1';--pulse
                        pds_ctr_ld <= '1';-- pulse
                        zlt_en <= '1';
                        scint_trgrdy <= '1';
                        daq_fsm_cs_t <= DONES;
				    when DONES =>
						-- wait for trigger state machine
						abd_ctr_ld <= '1';
						pdw_ctr_ld <= '1';--pulse
						pds_ctr_ld <= '1';-- pulse
						zlt_en <= '0';
						scint_trgrdy <= '0';
						if scint_trg = '0' then
							daq_fsm_cs_t <= IDLES;
						else
							daq_fsm_cs_t <= DONES;
					    end if;
                    when others =>
                        abd_ctr_ld <= '1';
                        pdw_ctr_ld <= '1';
                        pds_ctr_ld <= '1';
                        daq_fsm_cs_t <= IDLES;
                end case;
            end if;
        end if;
    end process;

    -------------------------------------------------------------
    -- Generate counter to simulate ASIC buffer read delay.
    -------------------------------------------------------------
    abd_count_pcs : process(clk)
    begin
        if (clk'event and clk='1') then
            if abd_ctr_ld = '1' then
                abd_ctr <= abd_init;
            else
                abd_ctr <= abd_ctr - 1;
            end if;
            -- terminal count ---------------
            if (abd_ctr = 0) then
                abd_ctr_tc <= '1';
            else
                abd_ctr_tc <= '0';
            end if;
        end if;
    end process;

    -------------------------------------------------------------
    -- Count the types of payload.
    -------------------------------------------------------------
    pdt_count_pcs : process(clk)
    begin
        if (clk'event and clk='1') then
            pdt_ctr_en <= scint_trgrdy;
            if reset = '1' then
                pdt_ctr <= pdt_init;
            else
                if pdt_ctr_en = '1' then
                    pdt_ctr <= pdt_ctr - 1;
                end if;
            end if;
            -- terminal count ---------------
            if (pdt_ctr = 0) then
                pdt_ctr_tc <= '1';
            else
                pdt_ctr_tc <= '0';
            end if;
        end if;
    end process;

    -------------------------------------------------------------
    -- Count the number of words in the sample.
    -------------------------------------------------------------
    pdw_count_pcs : process(clk)
    begin
        if (clk'event and clk='1') then
            if pdw_ctr_ld = '1' then
                pdw_ctr <= pdw_init;
            else
                if tx_dst_rdy_n = '0' then
                    pdw_ctr <= pdw_ctr - 1;
                end if;
            end if;
            -- load count ---------------
            if (pdw_ctr = pdw_init) then
                pdw_ctr_lc <= '1';
            else
                pdw_ctr_lc <= '0';
            end if;
        end if;
    end process;

    -------------------------------------------------------------
    -- Count the number of samples in the payload.
    -------------------------------------------------------------
    pds_count_pcs : process(clk)
    begin
        if (clk'event and clk='1') then
            if pds_ctr_ld = '1' then
                pds_ctr <= pds_init;
            else
                if pdw_ctr_tc = '1' then
                    pds_ctr <= pds_ctr - 1;
                end if;
            end if;
            -- load count ---------------
            if (pds_ctr = pds_init) then
                pds_ctr_lc <= '1';
            else
                pds_ctr_lc <= '0';
            end if;
            -- terminal count ---------------
            if (pds_ctr = 0) then
                pds_ctr_tc <= '1';
            else
                pds_ctr_tc <= '0';
            end if;
        end if;
    end process;

    -------------------------------------------------------------
    -- Generate a TDC value
    -------------------------------------------------------------
    tdc_pcs : process(clk)
    begin
        if (clk'event and clk='1') then
            if reset = '1' then
                tdc_ctr <= (others => '0');
            else
                tdc_ctr <= tdc_ctr - 1;
            end if;
        end if;
    end process;

    -------------------------------------------------------------
    -- State machine to generate local link signals.
    -------------------------------------------------------------
    ll_fsm : process(clk)
    begin
        if (clk'event and clk='1') then
            if reset = '1' then
                tx_sof_n <= '1';
                tx_eof_n <= '1';
                tx_src_rdy_n <= '1';
                ll_fsm_cs_t <= SOFS;
            else
                case ll_fsm_cs_t is
                    when SOFS =>
                    -- wait for the packet counters, send SOF
                        if (pds_ctr_ld or tx_dst_rdy_n) = '0' then
                        -- send start of frame
                            tx_eof_n <= '1';
                            tx_sof_n <= '0';
                            tx_src_rdy_n <= '0';
                            --ll_fsm_cs_t <= SOFS;
                            ll_fsm_cs_t <= PAYLOADS;
                        else
                        -- idle
                            tx_eof_n <= not zlt_en;
                            tx_sof_n <= not zlt_en;
                            tx_src_rdy_n <= not zlt_en;
                            ll_fsm_cs_t <= SOFS;
                        end if;
                    when PAYLOADS =>
                    -- send packet payload
                        tx_sof_n <= '1';
                        --tx_eof_n <= '1';
                        tx_src_rdy_n <= tx_dst_rdy_n;
                        if (pdw_ctr_tc and pds_ctr_tc) = '1' then
                            tx_eof_n <= '0';
                            ll_fsm_cs_t <= EOFS;
                        else
                            tx_eof_n <= '1';
                            ll_fsm_cs_t <= PAYLOADS;
                        end if;
                    when EOFS =>
                    -- send end of frame
                        tx_sof_n <= '1';
                        tx_eof_n <= '1';
                        tx_src_rdy_n <= '1';
                        if tx_dst_rdy_n = '0' then
                            ll_fsm_cs_t <= SOFS;
                        else
                            ll_fsm_cs_t <= EOFS;
                        end if;
                    when others =>
                        tx_sof_n <= '1';
                        tx_eof_n <= '1';
                        tx_src_rdy_n <= '1';
                        ll_fsm_cs_t <= SOFS;
                end case;
            end if;
        end if;
    end process;

    -------------------------------------------------------------
    -- Generat Local Link logic output.
    -------------------------------------------------------------
    ll_pcs : process(clk)
    begin
        if (clk'event and clk='1') then
            tx_rem       <= '0';
            --dmux_sel <= pdw_ctr;
            --case dmux_sel is
            case pdw_ctr is
            when "11" => --channel
                tx_d <= ((not addr(0)) & "000") & addr & X"5A";--just repeat axis bit/board address
            when "10" =>--ctime aument
                tx_d <= ctime;
            when "01" =>--time
                tx_d <= "00000" & tdc_ctr;
            when "00" =>--charge
                tx_d <= (others => '0');
            when others =>--don't care
                tx_d <= (others => 'X');
            end case;
        end if;
    end process;

end multi_trig;

