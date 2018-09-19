--*********************************************************************************
-- Center for Exploration of Energy and Matter (CEEM)
--
-- Project: Belle-II
--
-- Author:  Brandon Kunkler
--
-- Date:    06/06/2014
--
--*********************************************************************************
-- Description:
-- A simple fifo with programmable depth, and data width. There are four FIFOs in 
-- this entity, three first-word-fall-through (FWFT) and one standard. Select the
-- arch that implements the proper function and meets timing. The FWFTs are meant
-- to be functionally equivalent, but may differ if optimized to meet timing.
-- The read address can pipelined to improve timing; the read logic should be
-- modified accordingly.
--*********************************************************************************

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
    use ieee.numeric_std.all;
    use ieee.math_real.all;

entity tdc_fifo is
    generic(
        DEPTH               : integer := 128;
        DWIDTH              : integer := 8);
	port(
		clk                 : in std_logic;
        clr                 : in std_logic;
		rd                  : in std_logic;
		wr                  : in std_logic;
		din                 : in std_logic_vector(DWIDTH-1 downto 0);
		empty               : out std_logic                             := '1';
		full                : out std_logic                             := '0';
		dout                : out std_logic_vector(DWIDTH-1 downto 0));
end entity;


--*********************************************************************************
-- Description:
-- Simple first-word-fall-through fifo.If the read address is pipelined to improve
-- timing, the read logic should be modified accordingly.
-- http://billauer.co.il/reg_fifo.html
--*********************************************************************************
architecture fwft_arch0 of tdc_fifo is

    constant ADDRWDH			 : integer 	:= INTEGER(CEIL(LOG2(REAL(DEPTH))));

	type ram_type is array (DEPTH-1 downto 0) of std_logic_vector(DWIDTH-1 downto 0);

	signal dpram_t              : ram_type                              := (others => (others => '0'));
	signal wr_ptr               : std_logic_vector(ADDRWDH-1 downto 0)	:= (others => '0');
	signal rd_ptr               : std_logic_vector(ADDRWDH-1 downto 0)	:= (others => '0');
    --signal outaddr              : std_logic_vector(ADDRWDH-1 downto 0)	:= (others => '0');
    signal flag_ptr             : std_logic_vector(ADDRWDH-1 downto 0)	:= (others => '0');
    signal dpramout             : std_logic_vector(DWIDTH-1 downto 0)   := (others => '0');
    signal dout_valid           : std_logic                             := '0';
    signal rd_ptr_en            : std_logic;
    signal wr_ptr_en            : std_logic;
    signal flag_en              : std_logic_vector(1 downto 0)          := (others => '0');
    signal full_d               : std_logic;
    signal afull_d              : std_logic;
    signal empty_d              : std_logic;    
    --signal empty_i              : std_logic;

begin

---------------------------------------------------------------------------------------------------------
-- Concurrent statments
---------------------------------------------------------------------------------------------------------

	-- Assertions ----------------------------------------------
	-----------------------------------------------------------

    -- Map signals to ports -----------------------------------
    empty <= not dout_valid;
	-----------------------------------------------------------

    -- Asynchronous logic -------------------------------------
    -- do nothing if full and write
    wr_ptr_en <= (not full_d) and wr;
    -- first-word-fall-through logic -------------------------
    -- keep the output register valid
    rd_ptr_en <= (not empty_d) and ((not dout_valid) or rd);
    ----------------------------------------------------------
    -- fifo flags (internal)
    flag_en <= wr_ptr_en & rd_ptr_en;
    empty_d <= '1' when flag_ptr = 0 else '0';    
    full_d <= '1' when flag_ptr = (DEPTH-1) else '0';
    afull_d <= '1' when flag_ptr > (DEPTH-3) else '0';

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
            -- first-word-fall-through registers ------------
            if rd_ptr_en = '1' then
               dout_valid <= '1';
               --empty_i <= '0';
            else
                if rd = '1' then
                    dout_valid <= '0';
                    --empty_i <= '1';
                end if;
            end if;
            -- pipeline output
            --empty <= not dout_valid;
            if rd_ptr_en = '1' then
                dout <= dpramout;
            end if;
        -----------------------------------------------------
		end if;
	end process;

	------------------------------------------------------
    -- Write process. Use asynchronous write so a block
    -- RAM can be used for the array.
    ------------------------------------------------------
    wr_pcs : process (clk)
	begin
		if (clk'event and clk = '1') then
            if wr = '1' then
                dpram_t(TO_INTEGER(UNSIGNED(wr_ptr))) <= din;
            end if;
            full <= afull_d;
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
                flag_ptr <= (others => '0');
			else
                if wr_ptr_en = '1' then
                    wr_ptr <= wr_ptr + 1;
                end if;
                if rd_ptr_en = '1' then
                    rd_ptr <= rd_ptr + 1;
                end if;
                case flag_en is
                    when "00" =>
                        flag_ptr <= flag_ptr;
                    when "01" =>
                        flag_ptr <= flag_ptr - 1;
                    when "10" =>
                        flag_ptr <= flag_ptr + 1;
                    when "11" =>
                        flag_ptr <= flag_ptr;
                    when others =>
                        flag_ptr <= (others => 'X');
                end case;

			end if;
		end if;
	end process;

end fwft_arch0;

--*********************************************************************************
-- Description:
-- Simple first-word-fall-through fifo with output pipeline registers.
-- If the read address is pipelined to improve timing, the read logic should be
-- modified accordingly.
-- http://billauer.co.il/reg_fifo.html
--*********************************************************************************
architecture fwft_arch1 of tdc_fifo is

    constant ADDRWDH			 : integer 	:= INTEGER(CEIL(LOG2(REAL(DEPTH))));

	type ram_type is array (DEPTH-1 downto 0) of std_logic_vector(DWIDTH-1 downto 0);

	signal dpram_t              : ram_type                              := (others => (others => '0'));
	signal wr_ptr               : std_logic_vector(ADDRWDH-1 downto 0)	:= (others => '0');
	signal rd_ptr               : std_logic_vector(ADDRWDH-1 downto 0)	:= (others => '0');
    --signal outaddr              : std_logic_vector(ADDRWDH-1 downto 0)	:= (others => '0');
    signal flag_ptr             : std_logic_vector(ADDRWDH-1 downto 0)	:= (others => '0');
    signal dpramout             : std_logic_vector(DWIDTH-1 downto 0)   := (others => '0');
    signal ram_dout             : std_logic_vector(DWIDTH-1 downto 0)   := (others => '0');    
    signal dout0                : std_logic_vector(DWIDTH-1 downto 0)	:= (others => '0');
    signal dout0_en             : std_logic;
    signal dout_en              : std_logic;
    signal ram_valid            : std_logic                             := '0';
    signal dout0_valid          : std_logic                             := '0';
    signal dout_valid           : std_logic                             := '0';
    signal rd_ptr_en            : std_logic;
    signal wr_ptr_en            : std_logic;
    signal flag_en              : std_logic_vector(1 downto 0)          := (others => '0');
    signal full_d               : std_logic;
    signal afull_d              : std_logic;
    signal empty_d              : std_logic;
    signal aempty_d             : std_logic;

begin

---------------------------------------------------------------------------------------------------------
-- Concurrent statments
---------------------------------------------------------------------------------------------------------

	-- Assertions ----------------------------------------------

	-----------------------------------------------------------

    -- Map signals to ports -----------------------------------
	-----------------------------------------------------------

    -- Asynchronous logic -------------------------------------
    -- first-word-fall-through logic -------------------------
     -- intermediate register enable
    dout0_en <= ram_valid and (not (dout0_valid xor dout_en));
    -- output register enable
    dout_en <= (dout0_valid or ram_valid) and (rd or (not dout_valid));
    -- do nothing if full and write
    wr_ptr_en <= (not full_d) and wr;
    --wr_ptr_en <= wr;
    -- keep the output register valid
    rd_ptr_en <= (not empty_d) and (not (dout0_valid and dout_valid and ram_valid));
    --rd_ptr_en <= not (dout0_valid and dout_valid and ram_valid);
    ----------------------------------------------------------
    -- fifo flags (internal)
    flag_en <= wr_ptr_en & rd_ptr_en;
    empty_d <= '1' when flag_ptr = 0 else '0';
    aempty_d <= '1' when flag_ptr < 2 else '0';
    full_d <= '1' when flag_ptr = (DEPTH-1) else '0';
    afull_d <= '1' when flag_ptr > (DEPTH-3) else '0';

    -- output must be asynchronous for inference
    --dpramout <= dpram_t(TO_INTEGER(UNSIGNED(rd_ptr-1)));
    dpramout <= dpram_t(TO_INTEGER(UNSIGNED(rd_ptr)));
    --dpramout <= dpram_t(TO_INTEGER(UNSIGNED(outaddr)));

	------------------------------------------------------
    -- Read process. Register the output.
    ------------------------------------------------------
    rd_pcs : process (clk)
	begin
		if (clk'event and clk = '1') then
            -- pipeline read pointer to improve timing
            --outaddr <= rd_ptr -1;
            -- first-word-fall-through registers ------------
            if dout0_en = '1' then
                dout0 <= ram_dout; -- intermediate register
            end if;
            if dout_en = '1' then
                if dout0_valid = '1' then
                    dout <= dout0; -- output register
                else
                    dout <= ram_dout; -- output register
                end if;
            end if;
            if rd_ptr_en = '1' then
                ram_valid <= '1';
            else
                if (dout0_en or dout_en) = '1' then
                    ram_valid <= '0';
                end if;
            end if;
            if dout0_en = '1' then
               dout0_valid <= '1';
            else
                if dout_en = '1' then
                    dout0_valid <= '0';
                end if;
            end if;
            if dout_en = '1' then
               dout_valid <= '1';
               empty <= '0';
            else
                if rd = '1' then
                    dout_valid <= '0';
                    empty <= '1';
                end if;
            end if;            
            if rd_ptr_en = '1' then
                ram_dout <= dpramout;
            end if;            
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
            if wr = '1' then
                dpram_t(TO_INTEGER(UNSIGNED(wr_ptr))) <= din;
            end if;
            full <= afull_d;
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
                flag_ptr <= (others => '0');
			else
                if wr_ptr_en = '1' then
                    wr_ptr <= wr_ptr + 1;
                end if;
                if rd_ptr_en = '1' then
                    rd_ptr <= rd_ptr + 1;
                end if;
                case flag_en is
                    when "00" =>
                        flag_ptr <= flag_ptr;
                    when "01" =>
                        flag_ptr <= flag_ptr - 1;
                    when "10" =>
                        flag_ptr <= flag_ptr + 1;
                    when "11" =>
                        flag_ptr <= flag_ptr;
                    when others =>
                        flag_ptr <= (others => 'X');
                end case;

			end if;
		end if;
	end process;

end fwft_arch1;


--*********************************************************************************
-- Description:
-- Simple first-word-fall-through fifo with output pipeline registers.
-- If the read address is pipelined to improve timing, the read logic should be
-- modified accordingly.
-- http://asics.chuckbenz.com/FifosRingBuffers.htm
--*********************************************************************************
architecture fwft_arch2 of tdc_fifo is

    constant ADDRWDH			 : integer 	:= INTEGER(CEIL(LOG2(REAL(DEPTH))));

	type ram_type is array (DEPTH-1 downto 0) of std_logic_vector(DWIDTH-1 downto 0);

	signal dpram_t              : ram_type                              := (others => (others => '0'));
	signal wr_ptr               : std_logic_vector(ADDRWDH-1 downto 0)	:= (others => '0');
	signal rd_ptr               : std_logic_vector(ADDRWDH-1 downto 0)	:= (others => '0');
	signal new_wr_ptr           : std_logic_vector(ADDRWDH-1 downto 0)	:= (others => '0');
	signal new_rd_ptr           : std_logic_vector(ADDRWDH-1 downto 0)	:= (others => '0');
    --signal outaddr              : std_logic_vector(ADDRWDH-1 downto 0)	:= (others => '0');
    signal dpramout             : std_logic_vector(DWIDTH-1 downto 0)   := (others => '0');
    signal rd_ptr_en            : std_logic;
    signal wr_ptr_en            : std_logic;
    signal full_d               : std_logic                             :='0';
    signal afull_d              : std_logic                             :='0';
    signal empty_d              : std_logic                             :='1';
    signal aempty_d             : std_logic                             :='1';

begin

---------------------------------------------------------------------------------------------------------
-- Concurrent statments
---------------------------------------------------------------------------------------------------------

	-- Assertions ----------------------------------------------

	-----------------------------------------------------------

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

end fwft_arch2;

--*********************************************************************************
-- std_arch
-- Standard FIFO (not first word fall through. The full and empty are asserted when
-- there is one address remaining. This allows full rate operation at the cost of
-- extra logic. If the logic is changed to standard full/empty then the FIFO cannot
-- operate at full rate but will operate at a higher clock rate.
--*********************************************************************************
architecture std_arch of tdc_fifo is

    constant ADDRWDH			 : integer 	:= INTEGER(CEIL(LOG2(REAL(DEPTH))));

	type ram_type is array (DEPTH-1 downto 0) of std_logic_vector(DWIDTH-1 downto 0);

	signal dpram_t              : ram_type                              := (others => (others => '0'));
	signal wr_ptr               : std_logic_vector(ADDRWDH-1 downto 0)	:= (others => '0');
	signal rd_ptr               : std_logic_vector(ADDRWDH-1 downto 0)	:= (others => '0');
    signal flag_ptr             : std_logic_vector(ADDRWDH-1 downto 0)	:= (others => '0');
    signal dpramout             : std_logic_vector(DWIDTH-1 downto 0)   := (others => '0');
    signal rd_ptr_en            : std_logic;
    signal wr_ptr_en            : std_logic;
    signal flag_en              : std_logic_vector(1 downto 0)          := (others => '0');
    signal full_d               : std_logic;
    signal afull_d              : std_logic;
    signal empty_d              : std_logic;
    signal aempty_d             : std_logic;

begin

---------------------------------------------------------------------------------------------------------
-- Concurrent statments
---------------------------------------------------------------------------------------------------------

	-- Assertions ----------------------------------------------
	-----------------------------------------------------------

    -- Map signals to ports -----------------------------------
	-----------------------------------------------------------

    -- Asynchronous logic -------------------------------------
    -- do nothing if full and write
    wr_ptr_en <= (not full_d) and wr;
    rd_ptr_en <= (not empty_d) and rd;
    ----------------------------------------------------------
    -- fifo flags (internal)
    flag_en <= wr_ptr_en & rd_ptr_en;
    empty_d <= '1' when flag_ptr = 0 else '0';
    aempty_d <= '1' when flag_ptr < 2 else '0';
    full_d <= '1' when flag_ptr = (DEPTH-1) else '0';
    afull_d <= '1' when flag_ptr > (DEPTH-3) else '0';

    -- output must be asynchronous for inference
    dpramout <= dpram_t(TO_INTEGER(UNSIGNED(rd_ptr)));

	------------------------------------------------------
    -- Read process. Register the output.
    ------------------------------------------------------
    rd_pcs : process (clk)
	begin
		if (clk'event and clk = '1') then
            if rd = '1' then
            -- keep output from changing when empty
                dout <= dpramout; -- output register
            end if;
            empty <= aempty_d;
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
            if wr = '1' then
                dpram_t(TO_INTEGER(UNSIGNED(wr_ptr))) <= din;
            end if;
            full <= afull_d;
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
                flag_ptr <= (others => '0');
			else
                if wr_ptr_en = '1' then
                    wr_ptr <= wr_ptr + 1;
                end if;
                if rd_ptr_en = '1' then
                    rd_ptr <= rd_ptr + 1;
                end if;
                case flag_en is
                    when "00" =>
                        flag_ptr <= flag_ptr;
                    when "01" =>
                        flag_ptr <= flag_ptr - 1;
                    when "10" =>
                        flag_ptr <= flag_ptr + 1;
                    when "11" =>
                        flag_ptr <= flag_ptr;
                    when others =>
                        flag_ptr <= (others => 'X');
                end case;

			end if;
		end if;
	end process;

end std_arch;