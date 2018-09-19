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

entity daq_gen_readout is
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
    tx_rem          : out std_logic;

	 scint_trg			:out	std_logic;
	 scint_trgrdy		:in	std_logic;
	 missed_trg			:out std_logic_vector(15 downto 0);
	 
	 qt_fifo_rd_en		:out std_logic;
	 qt_fifo_rd_d		:in std_logic_vector(17 downto 0);
	 qt_fifo_almost_empty		: in std_logic;
	 qt_fifo_empty		: in std_logic;
	 qt_fifo_evt_rdy	: in std_logic;
	 zlt					: in std_logic -- wire it to the readout busy signal
	 
	 );
end daq_gen_readout;

architecture multi_trig of daq_gen_readout is

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
    signal scint_trg_i            : std_logic;
	 signal scint_trg_i2					: std_logic_vector(1 downto 0):="00";
    signal missed_trg_i           : std_logic_vector(15 downto 0);
    signal scint_trgrdy_i         : std_logic;
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
	signal qt_fifo_evt_rdy_i	: std_logic_vector(5 downto 0):="000000";
	signal tx_force_sof_eof		:std_logic:='0';
	signal sc_cnt	:std_logic_vector(7 downto 0):=x"00";

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

	missed_trg <= missed_trg_i;
	
---------------------------------------------------------------------------------------------------------
-- Synchronous processes
---------------------------------------------------------------------------------------------------------
  latch2input : process(clk)
    begin
        if (clk'event and clk = '1') then
            if reset = '1' then
                qt_fifo_evt_rdy_i <= "000000";
					 scint_trgrdy_i<='0';
					 scint_trg_i2<="00";
            else
					qt_fifo_evt_rdy_i<=qt_fifo_evt_rdy_i(4 downto 0) & qt_fifo_evt_rdy;
					zlt_en<=zlt;
					scint_trgrdy_i<=scint_trgrdy;
					scint_trg_i2<=scint_trg_i2(0) & scint_trg_i;
				end if;
			end if;
		end process;
		
    --------------------------------------------------------------------------
    -- Keep track of missed triggers.
    --------------------------------------------------------------------------
    trigger_fsm : process(clk)
    begin
        if (clk'event and clk = '1') then
            if reset = '1' then
                scint_trg_i <= '0';
                missed_trg_i <= (others => '0');
                trg_cs <= IDLES;
            else
                case trg_cs is
                    when IDLES =>
                    -- wait until trigger
                        scint_trg_i <= '0';
                        if trigger = '1' then
                            missed_trg_i <= missed_trg_i + 1;
                        else
                            missed_trg_i <= missed_trg_i;
                        end if;
                        if missed_trg_i > 0 then
                            trg_cs <= TTRDYS;
                        else
                            trg_cs <= IDLES;
                        end if;
                    when TTRDYS =>
                    -- wait wait for b2tt fifo to update so we have correct trigger tag
                        scint_trg_i <= '0';
                        if trigger = '1' then
                            missed_trg_i <= missed_trg_i + '1';
                        else
                            missed_trg_i <= missed_trg_i;
                        end if;
                        if trgrdy = '1' then
                            trg_cs <= SCTTRGS;
                        else
                            trg_cs <= TTRDYS;
                        end if;
                    when SCTTRGS =>
                    -- wait for scint trigger window
                        scint_trg_i <= '1';
                        if trigger = '1' then
                            missed_trg_i <= missed_trg_i + '1';
                        else
                            missed_trg_i <= missed_trg_i;
                        end if;
                        if scint_trgrdy_i = '1' then
                            trg_cs <= DONES;
                        else
                            trg_cs <= SCTTRGS;
                        end if;
                    when DONES =>
                    -- finished, count triggers, read next value
                        scint_trg_i <= '0';
                        -- wait for concentrator interface to read next trig
                        if trigger = '1' then
                            missed_trg_i <= missed_trg_i + '1';
                        else
                            if trgnext = '1' then
                                missed_trg_i <= missed_trg_i - '1';
                            else
                                missed_trg_i <= missed_trg_i;
                            end if;
                        end if;
                        if trgnext = '1' then
                            trg_cs <= IDLES;
                        else
                            trg_cs <= DONES;
                        end if;
                    when others =>
                        scint_trg_i <= '0';
                        missed_trg_i <= (others => '0');
                        trg_cs <= IDLES;
                end case;
            end if;
        end if;
    end process;
	 
----------------------------------------------
	scint_trig_out : process(clk)
	begin
      if (clk'event and clk='1') then
            if reset = '1' then
					scint_trg<='0';
            else
					if scint_trg_i2="01" then
						sc_cnt<=x"20";
					end if;
					
					if (sc_cnt/= x"00") then
						scint_trg<='1';
						sc_cnt<=sc_cnt-1;
					else 
						scint_trg<='0';
					end if;
					
				
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
                tx_force_sof_eof<='1';
--                tx_sof_n <= '1';
--              tx_eof_n <= '1';
                tx_src_rdy_n <= '1';
                ll_fsm_cs_t <= SOFS;
            else
					
                case ll_fsm_cs_t is
                    when SOFS =>
                    -- wait for the packet counters, send SOF
                        if (qt_fifo_evt_rdy_i(5 downto 4)="01" and tx_dst_rdy_n='0') then
                        -- send start of frame
--                            tx_eof_n <= '1';
--	                        tx_sof_n <= '0';-- no need already in fifo data
--                            tx_src_rdy_n <= '0';
                            --ll_fsm_cs_t <= SOFS;
                            tx_force_sof_eof<='1';
 									 qt_fifo_rd_en<='1';
                            ll_fsm_cs_t <= PAYLOADS;
                        else
                        -- idle
--                            tx_eof_n <= not zlt_en;
--                            tx_sof_n <= not zlt_en;
--                            tx_src_rdy_n <= not zlt_en;
                            tx_force_sof_eof<='1';
 									 qt_fifo_rd_en<='0';
--									 tx_eof_n <= '1';
--                            tx_sof_n <= '1';
                            tx_src_rdy_n <= '1';
                            ll_fsm_cs_t <= SOFS;
                        end if;
                    when PAYLOADS =>
                    -- send packet payload
--                        tx_sof_n <= '1';
                        --tx_eof_n <= '1';
                        if (qt_fifo_empty='1') then
--                            tx_eof_n <= '0';
 									qt_fifo_rd_en<='0';
									tx_force_sof_eof<='1';
									tx_src_rdy_n <= '1';
                           ll_fsm_cs_t <= EOFS;
                        else
--                            tx_eof_n <= '1';
                            tx_force_sof_eof<='0';
 									 qt_fifo_rd_en<='1';
                        tx_src_rdy_n <= tx_dst_rdy_n;
                            ll_fsm_cs_t <= PAYLOADS;
                        end if;
                    when EOFS =>
                    -- send end of frame
--                        tx_sof_n <= '1';
--                        tx_eof_n <= '1';
--                        tx_src_rdy_n <= '1';
                        if tx_dst_rdy_n = '0' then
                            ll_fsm_cs_t <= SOFS;
                        else
                            ll_fsm_cs_t <= EOFS;
                        end if;
								
                    when others =>
								tx_force_sof_eof<='1';
                        tx_src_rdy_n <= '1';
                        ll_fsm_cs_t <= SOFS;
                end case;
            end if;
        end if;
    end process;

    -------------------------------------------------------------
    -- Generat Local Link logic output.
    -------------------------------------------------------------
		tx_d<=qt_fifo_rd_d(15 downto 0);
		tx_sof_n<=qt_fifo_rd_d(16) when	tx_force_sof_eof='0' else '1';
		tx_eof_n<=qt_fifo_rd_d(17) when  tx_force_sof_eof='0' else '1';

  

end multi_trig;

