-- (c) Copyright 2008 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
--
---------------------------------------------------------------------------------------------
--  AURORA_EXAMPLE
--
--  Aurora Generator
--
--
--
--  Description: Sample Instantiation of a 1 2-byte lane module.
--               Only tests initialization in hardware.
--
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_MISC.all;
use WORK.AURORA_PKG.all;

-- synthesis translate_off
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
-- synthesis translate_on

entity klm_aurora_example_design is
   generic(
        USE_CHIPSCOPE          : integer :=   0;
        SIM_GTPRESET_SPEEDUP   : integer :=   1);
    port(
    -- User I/O
--        RESET               : in std_logic;
--        INIT_CLK            : in std_logic;
--        GT_RESET_IN         : in  std_logic;
    -- Clocks
       -- GTPD2_P              : in  std_logic;
       -- GTPD2_N              : in  std_logic;
        RCLKP               : in  std_logic;
        RCLKN               : in  std_logic;
        --Dummy so signals are not synthesize away
        STATUS              : out std_logic;
        -- RAM 1 and 2
		RAM1_CE1			: out STD_LOGIC :='1';
		RAM1_CE2		    : out STD_LOGIC := '0';
		RAM1_OE			    : out std_logic := '1';
		RAM1_WE			    : out std_logic := '1';
		RAM2_CE1		    : out STD_LOGIC := '1';
		RAM2_CE2		    : out STD_LOGIC := '0';
		RAM2_OE			    : out std_logic := '1';
		RAM2_WE			    : out std_logic := '1';
        MGTTXDIS            : out std_logic_vector(0 to 1);
        MGTMOD2             : out std_logic_vector(0 to 1);
        MGTMOD1             : out std_logic_vector(0 to 1);
   -- GT I/O
        RXP                 : in std_logic;
        RXN                 : in std_logic;
        TXP                 : out std_logic;
        TXN                 : out std_logic);
end klm_aurora_example_design;

architecture MAPPED of klm_aurora_example_design is
  attribute core_generation_info           : string;
  attribute core_generation_info of MAPPED : architecture is "klm_aurora,aurora_8b10b_v5_3,{user_interface=Legacy_LL, backchannel_mode=Sidebands, c_aurora_lanes=1, c_column_used=None, c_gt_clock_1=GTPD2, c_gt_clock_2=None, c_gt_loc_1=X, c_gt_loc_10=X, c_gt_loc_11=X, c_gt_loc_12=X, c_gt_loc_13=X, c_gt_loc_14=X, c_gt_loc_15=X, c_gt_loc_16=X, c_gt_loc_17=X, c_gt_loc_18=X, c_gt_loc_19=X, c_gt_loc_2=X, c_gt_loc_20=X, c_gt_loc_21=X, c_gt_loc_22=X, c_gt_loc_23=X, c_gt_loc_24=X, c_gt_loc_25=X, c_gt_loc_26=X, c_gt_loc_27=X, c_gt_loc_28=X, c_gt_loc_29=X, c_gt_loc_3=X, c_gt_loc_30=X, c_gt_loc_31=X, c_gt_loc_32=X, c_gt_loc_33=X, c_gt_loc_34=X, c_gt_loc_35=X, c_gt_loc_36=X, c_gt_loc_37=X, c_gt_loc_38=X, c_gt_loc_39=X, c_gt_loc_4=X, c_gt_loc_40=X, c_gt_loc_41=X, c_gt_loc_42=X, c_gt_loc_43=X, c_gt_loc_44=X, c_gt_loc_45=X, c_gt_loc_46=X, c_gt_loc_47=X, c_gt_loc_48=X, c_gt_loc_5=1, c_gt_loc_6=X, c_gt_loc_7=X, c_gt_loc_8=X, c_gt_loc_9=X, c_lane_width=2, c_line_rate=2.5443, c_nfc=false, c_nfc_mode=IMM, c_refclk_frequency=127.215, c_simplex=false, c_simplex_mode=TX, c_stream=false, c_ufc=false, flow_mode=None, interface_mode=Framing, dataflow_config=Duplex}";

-- Parameter Declarations --
    constant REFSELDYPLL        : std_logic_vector(2 downto 0)  := "010";--PLLCLK (bad idea)
    constant DLY                : time                          := 1 ns;

-- External Register Declarations --

    signal HARD_ERR_Buffer    : std_logic;
    signal SOFT_ERR_Buffer    : std_logic;
    signal FRAME_ERR_Buffer   : std_logic;
    signal LANE_UP_Buffer     : std_logic;
    signal CHANNEL_UP_Buffer  : std_logic;
    signal TXP_Buffer         : std_logic;
    signal TXN_Buffer         : std_logic;

-- Internal Register Declarations --

    signal gt_reset_i         : std_logic;
    signal system_reset_i     : std_logic;

-- Wire Declarations --

    -- LocalLink TX Interface

    signal tx_d_i             : std_logic_vector(0 to 15);
    signal tx_rem_i           : std_logic;
    signal tx_src_rdy_n_i     : std_logic;
    signal tx_sof_n_i         : std_logic;
    signal tx_eof_n_i         : std_logic;

    signal tx_dst_rdy_n_i     : std_logic;

    -- LocalLink RX Interface

    signal rx_d_i             : std_logic_vector(0 to 15);
    signal rx_rem_i           : std_logic;
    signal rx_src_rdy_n_i     : std_logic;
    signal rx_sof_n_i         : std_logic;
    signal rx_eof_n_i         : std_logic;


    -- V5 Reference Clock Interface
    --signal GTPD2_left_i      : std_logic;
    signal rclk_i      : std_logic;

    -- Error Detection Interface

    signal hard_err_i       : std_logic;
    signal soft_err_i       : std_logic;
    signal frame_err_i      : std_logic;

    -- Status

    signal channel_up_i       : std_logic;
    signal lane_up_i          : std_logic;

    -- Clock Compensation Control Interface

    signal warn_cc_i          : std_logic;
    signal do_cc_i            : std_logic;

    -- System Interface

    signal pll_not_locked_i   : std_logic;
    signal user_clk_i         : std_logic;
    signal sync_clk_i         : std_logic;
    signal reset_i            : std_logic;
    signal power_down_i       : std_logic;
    signal loopback_i         : std_logic_vector(2 downto 0);
    signal tx_lock_i          : std_logic;
    signal rxeqmix_in_i         : std_logic_vector(1 downto 0);
    signal gtpclkout_i        : std_logic;
    signal buf_gtpclkout_i    : std_logic;
    signal daddr_in_i         : std_logic_vector(7 downto 0);
    signal dclk_in_i          : std_logic;
    signal den_in_i           : std_logic;
    signal di_in_i            : std_logic_vector(15 downto 0);
    signal drdy_out_unused_i  : std_logic;
    signal drpdo_out_unused_i : std_logic_vector(15 downto 0);
    signal dwe_in_i           : std_logic;
    --Frame check signals
    signal err_count_i      : std_logic_vector(0 to 7);
    signal ERR_COUNT_Buffer : std_logic_vector(0 to 7);

-- VIO Signals
   signal icon_to_vio_i       : std_logic_vector (35 downto 0);
   signal sync_in_i           : std_logic_vector (63 downto 0);
   signal sync_out_i          : std_logic_vector (0 to 15);

   signal lane_up_i_i         : std_logic;
   signal tx_lock_i_i         : std_logic;
   signal lane_up_reduce_i    : std_logic;
   signal rst_cc_module_i     : std_logic;

   signal error_bit_i         : std_logic;
   signal status_vec_i        : std_logic_vector(6 downto 0);

   signal user_clk_hlf        : std_logic;

   signal tied_to_ground_i    :   std_logic;

-- Component Declarations --


    component IBUFDS
        port (

                O : out std_ulogic;
                I : in std_ulogic;
                IB : in std_ulogic);

    end component;

    -- component BUFIO2

    -- generic(

      -- DIVIDE_BYPASS : boolean := TRUE;  -- TRUE, FALSE
      -- DIVIDE        : integer := 1;     -- {1..8}
      -- I_INVERT      : boolean := FALSE; -- TRUE, FALSE
      -- USE_DOUBLER   : boolean := FALSE  -- TRUE, FALSE
      -- );

    -- port(
      -- DIVCLK       : out std_ulogic;
      -- IOCLK        : out std_ulogic;
      -- SERDESSTROBE : out std_ulogic;

      -- I            : in  std_ulogic
    -- );
    -- end component;

    component klm_aurora_CLOCK_MODULE
        port (
                GT_CLK                  : in std_logic;
                GT_CLK_LOCKED           : in std_logic;
                USER_CLK                : out std_logic;
                SYNC_CLK                : out std_logic;
                PLL_NOT_LOCKED          : out std_logic
             );
    end component;

    component klm_aurora_RESET_LOGIC
        port (
                RESET                  : in std_logic;
                USER_CLK               : in std_logic;
                INIT_CLK               : in std_logic;
                GT_RESET_IN            : in std_logic;
                TX_LOCK_IN             : in std_logic;
                PLL_NOT_LOCKED         : in std_logic;
                SYSTEM_RESET           : out std_logic;
                GT_RESET_OUT           : out std_logic
             );
    end component;

    component klm_aurora
    generic(
        SIM_GTPRESET_SPEEDUP : integer := 1);
    port(
        -- LocalLink TX Interface
        TX_D             : in std_logic_vector(0 to 15);
        TX_REM           : in std_logic;
        TX_SRC_RDY_N     : in std_logic;
        TX_SOF_N         : in std_logic;
        TX_EOF_N         : in std_logic;
        TX_DST_RDY_N     : out std_logic;
         -- LocalLink RX Interface
        RX_D             : out std_logic_vector(0 to 15);
        RX_REM           : out std_logic;
        RX_SRC_RDY_N     : out std_logic;
        RX_SOF_N         : out std_logic;
        RX_EOF_N         : out std_logic;
        -- GT Serial I/O
        RXP              : in std_logic;
        RXN              : in std_logic;
        TXP              : out std_logic;
        TXN              : out std_logic;
        -- GT Reference Clock Interface
        REFSELDYPLL      : in    std_logic_vector(2 downto 0);
        --GTPD2          : in  std_logic;
        PLLCLK           : in  std_logic;
        -- Error Detection Interface
        HARD_ERR       : out std_logic;
        SOFT_ERR       : out std_logic;
        FRAME_ERR      : out std_logic;
        -- Status
        CHANNEL_UP       : out std_logic;
        LANE_UP          : out std_logic;
        -- Clock Compensation Control Interface
        WARN_CC          : in std_logic;
        DO_CC            : in std_logic;
        -- System Interface
        USER_CLK         : in std_logic;
        SYNC_CLK         : in std_logic;
        GT_RESET         : in std_logic;
        RESET            : in std_logic;
        POWER_DOWN       : in std_logic;
        LOOPBACK         : in std_logic_vector(2 downto 0);
        GTPCLKOUT        : out std_logic;
        RXEQMIX_IN           : in    std_logic_vector(1 downto 0);
        DADDR_IN       : in   std_logic_vector(7 downto 0);
        DCLK_IN        : in   std_logic;
        DEN_IN         : in   std_logic;
        DI_IN          : in   std_logic_vector(15 downto 0);
        DRDY_OUT       : out  std_logic;
        DRPDO_OUT      : out  std_logic_vector(15 downto 0);
        DWE_IN         : in   std_logic;
        TX_LOCK          : out std_logic);
    end component;


    component klm_aurora_STANDARD_CC_MODULE
        port (
        -- Clock Compensation Control Interface
                WARN_CC        : out std_logic;
                DO_CC          : out std_logic;
        -- System Interface
                PLL_NOT_LOCKED : in std_logic;
                USER_CLK       : in std_logic;
                RESET          : in std_logic
             );
    end component;


    component klm_aurora_FRAME_GEN
    port
    (
        -- User Interface
        TX_D            : out  std_logic_vector(0 to 15);
        TX_REM          : out  std_logic;
        TX_SOF_N        : out  std_logic;
        TX_EOF_N        : out  std_logic;
        TX_SRC_RDY_N    : out  std_logic;
        TX_DST_RDY_N    : in   std_logic;
        -- System Interface
        USER_CLK        : in  std_logic;
        RESET           : in  std_logic;
        CHANNEL_UP      : in  std_logic
    );
    end component;


    component klm_aurora_FRAME_CHECK
    port
    (        -- User Interface
        RX_D            : in  std_logic_vector(0 to 15);
        RX_REM          : in  std_logic;
        RX_SOF_N        : in  std_logic;
        RX_EOF_N        : in  std_logic;
        RX_SRC_RDY_N    : in  std_logic;

        -- System Interface
        USER_CLK        : in  std_logic;
        RESET           : in  std_logic;
        CHANNEL_UP      : in  std_logic;
        ERR_COUNT       : out std_logic_vector(0 to 7)

    );
    end component;

  -------------------------------------------------------------------
  --  ICON core component declaration
  -------------------------------------------------------------------
  component s6_icon

    port
    (
      control0    :   out std_logic_vector(35 downto 0)
    );
  end component;

  -------------------------------------------------------------------
  --  VIO core component declaration
  -------------------------------------------------------------------
  component s6_vio

    port
    (
      control     : in    std_logic_vector(35 downto 0);
      clk         : in    std_logic;
      sync_in     : in    std_logic_vector(63 downto 0);
      sync_out    : out   std_logic_vector(15 downto 0)
    );
  end component;


begin

    tied_to_ground_i    <= '0';

    lane_up_reduce_i    <=  lane_up_i;
    rst_cc_module_i     <=  not lane_up_reduce_i;

    TXP         <= TXP_Buffer;
    TXN         <= TXN_Buffer;

    -- ___________________________Clock Buffers________________________
      -- IBUFDS_i :  IBUFDS
      -- port map (
           -- I  => GTPD2_P ,
           -- IB => GTPD2_N ,
           -- O  => GTPD2_left_i
               -- );

    IBUFDS_i :  IBUFDS
    port map(
        I       => RCLKP ,
        IB      => RCLKN ,
        O       => rclk_i
    );

    -- BUFIO2_i : BUFIO2
    -- generic map
    -- (
        -- DIVIDE                          =>      1,
        -- DIVIDE_BYPASS                   =>      TRUE
    -- )
    -- port map
    -- (
        -- I                               =>      gtpclkout_i,
        -- DIVCLK                          =>      buf_gtpclkout_i,
        -- IOCLK                           =>      open,
        -- SERDESSTROBE                    =>      open
    -- );
    -- Instantiate a clock module for clock division

    clock_module_i : klm_aurora_CLOCK_MODULE
        port map (

                    GT_CLK              => rclk_i,
                    GT_CLK_LOCKED       => '1',--tx_lock_i,
                    USER_CLK            => user_clk_i,
                    SYNC_CLK            => sync_clk_i,
                    PLL_NOT_LOCKED      => pll_not_locked_i
                 );

    -- Register User I/O --

    -- Register User Outputs from core.

    process (user_clk_i)
    begin
        if (user_clk_i 'event and user_clk_i = '1') then
            HARD_ERR_Buffer  <= hard_err_i;
            SOFT_ERR_Buffer  <= soft_err_i;
            FRAME_ERR_Buffer <= frame_err_i;
            ERR_COUNT_Buffer <= err_count_i;
            LANE_UP_Buffer     <= lane_up_i;
            CHANNEL_UP_Buffer  <= channel_up_i;

            error_bit_i <= OR_REDUCE(ERR_COUNT_Buffer);
            status_vec_i <= FRAME_ERR_Buffer & HARD_ERR_Buffer & SOFT_ERR_Buffer & error_bit_i
                & LANE_UP_Buffer & CHANNEL_UP_Buffer & user_clk_hlf;

            STATUS <= OR_REDUCE(status_vec_i);

            user_clk_hlf <= not user_clk_hlf;
        end if;
    end process;

    -- System Interface

    power_down_i     <= '0';
    loopback_i       <= "000";

 -- ____________________________GT Ports_______________________________

    reset_i <= '0';--system_reset_i;

    rxeqmix_in_i  <=  "00";
    daddr_in_i  <=  (others=>'0');
    dclk_in_i   <=  '0';
    den_in_i    <=  '0';
    di_in_i     <=  (others=>'0');
    dwe_in_i    <=  '0';

    RAM1_CE1	<= '1';
    RAM1_CE2	<= '0';
    RAM1_OE		<= '1';
    RAM1_WE		<= '1';
    RAM2_CE1	<= '1';
    RAM2_CE2	<= '0';
    RAM2_OE		<= '1';
    RAM2_WE		<= '1';

    MGTTXDIS    <= (others => '0');
    MGTMOD2     <= (others => '1');
    MGTMOD1     <= (others => '1');

    -- _______________________________ Module Instantiations ________________________--


    --Connect a frame checker to the user interface
    frame_check_i : klm_aurora_FRAME_CHECK
    port map
    (
        -- User Interface
        RX_D            =>  rx_d_i,
        RX_REM          =>  rx_rem_i,
        RX_SOF_N        =>  rx_sof_n_i,
        RX_EOF_N        =>  rx_eof_n_i,
        RX_SRC_RDY_N    =>  rx_src_rdy_n_i,

        -- System Interface
        USER_CLK        =>  user_clk_i,
        RESET           =>  reset_i,
        CHANNEL_UP      =>  channel_up_i,
        ERR_COUNT       =>  err_count_i

    );

    --Connect a frame generator to the user interface
    frame_gen_i : klm_aurora_FRAME_GEN
    port map
    (
        -- User Interface
        TX_D            =>  tx_d_i,
            TX_REM          =>  tx_rem_i,
        TX_SOF_N        =>  tx_sof_n_i,
        TX_EOF_N        =>  tx_eof_n_i,
            TX_SRC_RDY_N    =>  tx_src_rdy_n_i,
        TX_DST_RDY_N    =>  tx_dst_rdy_n_i,


        -- System Interface
        USER_CLK        =>  user_clk_i,
        RESET           =>  reset_i,
        CHANNEL_UP      =>  channel_up_i
    );

    -- Module Instantiations --

    aurora_module_i : klm_aurora
    generic map(
        SIM_GTPRESET_SPEEDUP => SIM_GTPRESET_SPEEDUP)
    port map(
    -- LocalLink TX Interface
        TX_D                => tx_d_i,
        TX_REM              => tx_rem_i,
        TX_SRC_RDY_N        => tx_src_rdy_n_i,
        TX_SOF_N            => tx_sof_n_i,
        TX_EOF_N            => tx_eof_n_i,
        TX_DST_RDY_N        => tx_dst_rdy_n_i,
        -- LocalLink RX Interface
        RX_D                => rx_d_i,
        RX_REM              => rx_rem_i,
        RX_SRC_RDY_N        => rx_src_rdy_n_i,
        RX_SOF_N            => rx_sof_n_i,
        RX_EOF_N            => rx_eof_n_i,
        -- GT Serial I/O
        RXP                 => RXP,
        RXN                 => RXN,
        TXP                 => TXP_Buffer,
        TXN                 => TXN_Buffer,
        -- GT Reference Clock Interface
        REFSELDYPLL         => REFSELDYPLL,
        --GTPD2             => --GTPD2_left_i,
        PLLCLK              => user_clk_i,
        -- Error Detection Interface
        HARD_ERR            => hard_err_i,
        SOFT_ERR            => soft_err_i,
        FRAME_ERR           => frame_err_i,
        -- Status
        CHANNEL_UP          => channel_up_i,
        LANE_UP             => lane_up_i,
        -- Clock Compensation Control Interface
        WARN_CC             => warn_cc_i,
        DO_CC               => do_cc_i,
        -- System Interface
        USER_CLK            => user_clk_i,
        SYNC_CLK            => sync_clk_i,
        RESET               => reset_i,
        POWER_DOWN          => power_down_i,
        LOOPBACK            => loopback_i,
        GT_RESET            => '0',--gt_reset_i,
        GTPCLKOUT           => gtpclkout_i,
        RXEQMIX_IN          => rxeqmix_in_i,
        DADDR_IN            => daddr_in_i,
        DCLK_IN             => dclk_in_i,
        DEN_IN              => den_in_i,
        DI_IN               => di_in_i,
        DRDY_OUT            => drdy_out_unused_i,
        DRPDO_OUT           => drpdo_out_unused_i,
        DWE_IN              => dwe_in_i,
        TX_LOCK             => tx_lock_i);

    standard_cc_module_i : klm_aurora_STANDARD_CC_MODULE
    port map(
    -- Clock Compensation Control Interface
        WARN_CC        => warn_cc_i,
        DO_CC          => do_cc_i,
        -- System Interface
        PLL_NOT_LOCKED => pll_not_locked_i,
        USER_CLK       => user_clk_i,
        RESET          => rst_cc_module_i
    );

    -- reset_logic_i : klm_aurora_RESET_LOGIC
    -- port map(
        -- RESET              => RESET,
        -- USER_CLK           => user_clk_i,
        -- INIT_CLK           => INIT_CLK,
        -- GT_RESET_IN        => GT_RESET_IN,
        -- TX_LOCK_IN         => tx_lock_i,
        -- PLL_NOT_LOCKED     => pll_not_locked_i,
        -- SYSTEM_RESET       => system_reset_i,
        -- GT_RESET_OUT       => gt_reset_i
    -- );

end MAPPED;
