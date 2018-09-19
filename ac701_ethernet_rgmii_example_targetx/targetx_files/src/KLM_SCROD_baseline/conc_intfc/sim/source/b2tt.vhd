--*********************************************************************************
-- Indiana University
-- Center for Exploration of Energy and Matter (CEEM)
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    03/25/2014
--
--*********************************************************************************
-- Description:
-- Simple model of B2TT (Belle-II Timing and Trigger).
--
--*********************************************************************************

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.numeric_std.all;
    use ieee.math_real.all;

entity b2tt is
    generic(
        CLKPER                      : time);
    port(
        sysclk                      : out std_logic;
        dblclk                      : out std_logic;
        runreset                    : out std_logic;
        trigger                     : out std_logic;
        trgtag                      : out std_logic_vector(31 downto 0);
        fifordy                     : out std_logic;
        fifonext                    : in std_logic;
        fifodata                    : out std_logic_vector(95 downto 0);
        ctime                       : out std_logic_vector(26 downto 0);
        utime                       : out std_logic_vector(31 downto 0));
end b2tt;

architecture behave of b2tt is

    type state_type is (IDLES,WAITS,TRIGGERS,READYS);

    constant CLKHPER                : time                                      := CLKPER/2;
    constant MINTRGPER              : real                                      := REAL((200 ns)/CLKPER);
	--constant MINTRGPER              : real                                      := REAL(1024.0);

    signal start                    : std_logic                                 := '0';
    signal clk                      : std_logic                                 := '0';
    signal clk2x                    : std_logic                                 := '0';    
    signal reset                    : std_logic                                 := '0';
    signal trigger_lfsr             : std_logic_vector(1 to 16);
    signal trigger_prng             : std_logic_vector(15 downto 0);
    signal trgper_ctr               : std_logic_vector(15 downto 0);
    signal ttctr                    : std_logic_vector(31 downto 0);
    signal state                    : state_type;
    signal init_val                 : std_logic_vector(1 to trigger_lfsr'length);
    signal ctctr                    : std_logic_vector(ctime'length-1 downto 0);
    signal utctr                    : std_logic_vector(utime'length-1 downto 0);

    -- Fifo Signals ------------------------------------------------------------
    constant DEPTH                  : integer                                   := 8;
    constant DWIDTH                 : integer                                   := 96;
    constant ADDRWDH                : integer                                   := INTEGER(CEIL(LOG2(REAL(DEPTH))));

    type ram_type is array (DEPTH-1 downto 0) of std_logic_vector(DWIDTH-1 downto 0);

    signal dpram_t                  : ram_type                                  := (others => (others => '0'));
    signal wr_ptr                   : std_logic_vector(ADDRWDH-1 downto 0)      := (others => '0');
    signal rd_ptr                   : std_logic_vector(ADDRWDH-1 downto 0)      := (others => '0');
    signal new_wr_ptr               : std_logic_vector(ADDRWDH-1 downto 0)      := (others => '0');
    signal new_rd_ptr               : std_logic_vector(ADDRWDH-1 downto 0)      := (others => '0');
    --signal outaddr                  : std_logic_vector(ADDRWDH-1 downto 0)    := (others => '0');
    signal dpramout                 : std_logic_vector(DWIDTH-1 downto 0)       := (others => '0');
    signal rd_ptr_en                : std_logic;
    signal wr_ptr_en                : std_logic;
    signal full_d                   : std_logic                                 :='0';
    signal afull_d                  : std_logic                                 :='0';
    signal empty_d                  : std_logic                                 :='1';
    signal aempty_d                 : std_logic                                 :='1';
    signal clr                      : std_logic                                 := '0';
    signal rd                       : std_logic;
    signal wr                       : std_logic;
    signal empty                    : std_logic;
    signal full                     : std_logic;
    signal din                      : std_logic_vector(DWIDTH-1 downto 0);
    signal dout                     : std_logic_vector(DWIDTH-1 downto 0);
    --------------------------------------------------------------------------

begin

    sysclk <= clk;
    dblclk <= clk2x;
    runreset <= reset;
    trigger <= wr;
    trgtag <= ttctr;
    fifordy <= not empty;
    fifodata <= dout;
    ctime <= ctctr;
    utime <= utctr;

    clr <= reset;
    rd <= fifonext;    
    --          err    ctime   typ   tag   utime
    din <= "0" & ctctr & X"0" & ttctr & utctr;

    init_val <= STD_LOGIC_VECTOR(TO_UNSIGNED(1,trigger_lfsr'length));

    -- Generate clock
    clk <= (not clk) after CLKHPER;
    clk2x <= (not clk2x) after CLKHPER/2;
    

    reset <= '1', '0' after CLKPER*1, '1' after 50 ns, '0' after (50 ns + CLKPER*1);
    start <= '0', '1' after (200 ns + 50 ns + CLKPER*4);

    -------------------------------------------------------
    -- Generate psuedo-random value for trigger period .
    -------------------------------------------------------
    prng_pcs : process(reset,clk)
        variable seed1, seed2 : positive := 1;
        variable prng : real;
    begin
        if rising_edge(clk) then
            uniform(seed1,seed2,prng);
            trigger_prng <= STD_LOGIC_VECTOR(TO_UNSIGNED(INTEGER(MINTRGPER + prng*REAL((2**5)-INTEGER(MINTRGPER))),trigger_prng'length));
        end if;
    end process;

    -------------------------------------------------------
    -- Simulate ctime counter.
    -------------------------------------------------------
    ctime_pcs : process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then--run reset
                ctctr <= (others => '0');
            else
                ctctr <= ctctr + '1';
            end if;
        end if;
    end process;
    
    -------------------------------------------------------
    -- Simulate utime counter.
    -------------------------------------------------------
    utime_pcs : process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then--run reset
                utctr <= (others => '0');
            else
                if ctctr = ((2**ctctr'length)-1) then
                    utctr <= utctr + '1';
                end if;
            end if;
        end if;
    end process;    

    -------------------------------------------------------
    -- Packet generation state machine.
    -------------------------------------------------------
    fsm_pcs : process(clk)
    begin
        if reset = '1' then
            wr <= '0';
            ttctr <= (others => '0');
            trgper_ctr <= (others => '0');
            state <= IDLES;
        else
            if rising_edge(clk) then
                case state is
                when IDLES =>
                -- wait for packet enable
                    wr <= '0';
                    ttctr <= ttctr;
                    --trgper_ctr <= trigger_lfsr;
                    trgper_ctr <= trigger_prng;
                    if start = '1' then
                        state <= WAITS;
                    else
                        state <= IDLES;
                    end if;
                when WAITS =>
                -- start of frame
                    wr <= '0';
                    ttctr <= ttctr;
                    trgper_ctr <= trgper_ctr - '1';
                    if trgper_ctr = 0 then
                        state <= TRIGGERS;
                    else
                        state <= WAITS;
                    end if;
                when TRIGGERS =>
                -- payload
                    wr <= '1';
                    ttctr <= ttctr + '1';
                    trgper_ctr <= trgper_ctr;
                    state <= READYS;
                when READYS =>
                -- end of frame
                    wr <= '0';
                    ttctr <= ttctr;
                    trgper_ctr <= trgper_ctr;
                    state <= IDLES;
                when others =>
                    NULL;
                end case;
            end if;
        end if;
    end process;

--*********************************************************************************
-- Description:
-- Simple first-word-fall-through fifo with output pipeline registers.
-- If the read address is pipelined to improve timing, the read logic should be
-- modified accordingly.
-- http://asics.chuckbenz.com/FifosRingBuffers.htm
--*********************************************************************************

    -- Map signals to ports -----------------------------------
    full <= full_d;
    -----------------------------------------------------------

    -- Asynchronous logic -------------------------------------
    wr_ptr_en <= wr and (not full_d);
    new_wr_ptr <= (wr_ptr + 1) when wr_ptr_en = '1' else wr_ptr;
    new_rd_ptr <= (rd_ptr + 1) when (rd and (not empty_d)) = '1' else rd_ptr;

    -- first-word-fall-through logic -------------------------
    ----------------------------------------------------------

    -- output must be asynchronous for inference
    dpramout <= dpram_t(TO_INTEGER(UNSIGNED(rd_ptr)));
    --dpramout <= dpram_t(TO_INTEGER(UNSIGNED(outaddr)));

    ------------------------------------------------------
    -- Read process. Register the output.
    ------------------------------------------------------
    rd_pcs : process (clk)
    begin
        if (clk'event and clk = '1') then
            -- pipeline read pointer to improve timing
            --outaddr <= rd_ptr;
            dout <= dpramout;
            empty <= empty_d;
        end if;
        -----------------------------------------------------
    end process;

    ------------------------------------------------------
    -- Write process. Use asynchronous write so a block
    -- RAM can be used for the array.
    ------------------------------------------------------
    wr_pcs : process (clk)
    begin
        if (clk'event and clk = '1') then
            if wr_ptr_en = '1' then
                dpram_t(TO_INTEGER(UNSIGNED(wr_ptr))) <= din;
            end if;
        end if;
    end process;

    ------------------------------------------------------
    -- Pointer process to control write and read pointer.
    ------------------------------------------------------
    ptr_pcs : process (clk)
    begin
        if (clk'event and clk = '1') then
            if clr = '1' then
                wr_ptr <= (others => '0');
                rd_ptr <= (others => '0');
                full_d <= '0';
                empty_d <= '1';
            else
                wr_ptr <= new_wr_ptr;
                rd_ptr <= new_rd_ptr;
                if (wr_ptr_en = '1') and (new_wr_ptr = new_rd_ptr) then
                    full_d <= '1';
                else
                    if rd = '1' then
                        full_d <= '0';
                    end if;
                end if;
                if (rd = '1') and (new_wr_ptr = new_rd_ptr) then
                    empty_d <= '1';
                else
                    if wr = '1' then
                        empty_d <= '0';
                    end if;
                end if;
            end if;
        end if;
    end process;

end behave;