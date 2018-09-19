# PART is artix7 xc7a200tfbg676

#
####
#######
##########
#############
#################
## System level constraints


########## GENERAL PIN CONSTRAINTS FOR THE AC701 BOARD REV B for RGMII ##########
set_property PACKAGE_PIN R3 [get_ports clk_in_p]
set_property PACKAGE_PIN P3 [get_ports clk_in_n]
set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_in_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_in_n]

set_property PACKAGE_PIN U4 [get_ports glbl_rst]
set_property IOSTANDARD SSTL15 [get_ports glbl_rst]
set_false_path -from [get_ports glbl_rst]

#### Module LEDs_8Bit constraints
#set_property PACKAGE_PIN M26 [get_ports frame_error]
#set_property PACKAGE_PIN T24 [get_ports frame_errorn]

#set_property PACKAGE_PIN M26 [get_ports dummyport0]
#set_property IOSTANDARD LVCMOS25 [get_ports dummyport0]

set_property PACKAGE_PIN T25 [get_ports activity_flash]
set_property PACKAGE_PIN R26 [get_ports activity_flashn]
set_property IOSTANDARD LVCMOS25 [get_ports activity_flash]
set_property IOSTANDARD LVCMOS25 [get_ports activity_flashn]
#set_property IOSTANDARD LVCMOS25 [get_ports frame_error]
#set_property IOSTANDARD LVCMOS25 [get_ports frame_errorn]

#### Module Push_Buttons_4Bit constraints
set_property PACKAGE_PIN U6 [get_ports update_speed]
set_property PACKAGE_PIN R5 [get_ports config_board]
set_property PACKAGE_PIN U5 [get_ports pause_req_s]
set_property PACKAGE_PIN P6 [get_ports reset_error]
set_property IOSTANDARD LVCMOS15 [get_ports update_speed]
set_property IOSTANDARD LVCMOS15 [get_ports config_board]
set_property IOSTANDARD LVCMOS15 [get_ports pause_req_s]
set_property IOSTANDARD LVCMOS15 [get_ports reset_error]

#### Module DIP_Switches_4Bit constraints
set_property PACKAGE_PIN R8 [get_ports {mac_speed[0]}]
set_property PACKAGE_PIN P8 [get_ports {mac_speed[1]}]
set_property PACKAGE_PIN R7 [get_ports gen_tx_data]
set_property PACKAGE_PIN R6 [get_ports chk_tx_data]
set_property IOSTANDARD LVCMOS15 [get_ports {mac_speed[0]}]
set_property IOSTANDARD LVCMOS15 [get_ports {mac_speed[1]}]
set_property IOSTANDARD LVCMOS15 [get_ports gen_tx_data]
set_property IOSTANDARD LVCMOS15 [get_ports chk_tx_data]

set_property PACKAGE_PIN V18 [get_ports phy_resetn]
set_property IOSTANDARD HSTL_I_18 [get_ports phy_resetn]

# lock to unused pins
set_property PACKAGE_PIN AE25 [get_ports serial_response]
set_property PACKAGE_PIN AE26 [get_ports tx_statistics_s]
set_property PACKAGE_PIN AC22 [get_ports rx_statistics_s]
set_property IOSTANDARD LVCMOS25 [get_ports serial_response]
set_property IOSTANDARD LVCMOS25 [get_ports tx_statistics_s]
set_property IOSTANDARD LVCMOS25 [get_ports rx_statistics_s]

set_property PACKAGE_PIN W18 [get_ports mdc]
set_property PACKAGE_PIN T14 [get_ports mdio]
set_property IOSTANDARD LVCMOS18 [get_ports mdc]
set_property IOSTANDARD LVCMOS18 [get_ports mdio]

set_property PACKAGE_PIN V14 [get_ports {rgmii_rxd[3]}]
set_property PACKAGE_PIN V16 [get_ports {rgmii_rxd[2]}]
set_property PACKAGE_PIN V17 [get_ports {rgmii_rxd[1]}]
set_property PACKAGE_PIN U17 [get_ports {rgmii_rxd[0]}]
set_property IOSTANDARD HSTL_I_18 [get_ports {rgmii_rxd[3]}]
set_property IOSTANDARD HSTL_I_18 [get_ports {rgmii_rxd[2]}]
set_property IOSTANDARD HSTL_I_18 [get_ports {rgmii_rxd[1]}]
set_property IOSTANDARD HSTL_I_18 [get_ports {rgmii_rxd[0]}]

set_property PACKAGE_PIN T17 [get_ports {rgmii_txd[3]}]
set_property PACKAGE_PIN T18 [get_ports {rgmii_txd[2]}]
set_property PACKAGE_PIN U15 [get_ports {rgmii_txd[1]}]
set_property PACKAGE_PIN U16 [get_ports {rgmii_txd[0]}]
set_property IOSTANDARD HSTL_I_18 [get_ports {rgmii_txd[3]}]
set_property IOSTANDARD HSTL_I_18 [get_ports {rgmii_txd[2]}]
set_property IOSTANDARD HSTL_I_18 [get_ports {rgmii_txd[1]}]
set_property IOSTANDARD HSTL_I_18 [get_ports {rgmii_txd[0]}]

set_property PACKAGE_PIN T15 [get_ports rgmii_tx_ctl]
set_property PACKAGE_PIN U22 [get_ports rgmii_txc]
set_property IOSTANDARD HSTL_I_18 [get_ports rgmii_tx_ctl]
set_property IOSTANDARD HSTL_I_18 [get_ports rgmii_txc]

set_property PACKAGE_PIN U14 [get_ports rgmii_rx_ctl]
set_property IOSTANDARD HSTL_I_18 [get_ports rgmii_rx_ctl]

set_property PACKAGE_PIN U21 [get_ports rgmii_rxc]
set_property IOSTANDARD HSTL_I_18 [get_ports rgmii_rxc]

set_property INTERNAL_VREF 0.9 [get_iobanks 13]

# Map the TB clock pin gtx_clk_bufg_out to and un-used pin so that its not trimmed off
set_property PACKAGE_PIN F5 [get_ports gtx_clk_bufg_out]
set_property IOSTANDARD SSTL15 [get_ports gtx_clk_bufg_out]



#
####
#######
##########
#############
#################
#EXAMPLE DESIGN CONSTRAINTS

############################################################
# Associate the IDELAYCTRL in the support level to the I/Os
# in the core using IODELAYs
############################################################
#set_property IODELAY_GROUP tri_mode_ethernet_mac_iodelay_grp [get_cells  {trimac_fifo_block/trimac_sup_block/tri_mode_ethernet_mac_idelayctrl_common_i}] #here
############################################################
# Clock Period Constraints                                 #
############################################################

############################################################
# TX Clock period Constraints                              #
############################################################
# Transmitter clock period constraints: please do not relax
create_clock -period 5.000 -name clk_in_p [get_ports clk_in_p]
set_input_jitter clk_in_p 0.050



############################################################
# Get auto-generated clock names                           #
############################################################

############################################################
# Input Delay constraints
############################################################
# these inputs are alll from either dip switchs or push buttons
# and therefore have no timing associated with them
set_false_path -from [get_ports config_board]
set_false_path -from [get_ports pause_req_s]
set_false_path -from [get_ports reset_error]
set_false_path -from [get_ports {mac_speed[0]}]
set_false_path -from [get_ports {mac_speed[1]}]
set_false_path -from [get_ports gen_tx_data]
set_false_path -from [get_ports chk_tx_data]

# no timing requirements but want the capture flops close to the IO
set_max_delay -datapath_only -from [get_ports update_speed] 4.000

# mdio has timing implications but slow interface so relaxed
set_max_delay -datapath_only -from [get_ports mdio] -to [get_cells -hier -filter {NAME =~ *managen/mdio_enabled.phy/mdio_in_reg1_reg}] 16.000

# Ignore pause deserialiser as only present to prevent logic stripping
set_false_path -from [get_ports pause_req*]
#set_false_path -from [get_cells pause_req* -filter {IS_SEQUENTIAL}] #here
#set_false_path -from [get_cells pause_val* -filter {IS_SEQUENTIAL}] #here


############################################################
# Output Delay constraints
############################################################

#set_false_path -to [get_ports frame_error]
#set_false_path -to [get_ports frame_errorn]
set_false_path -to [get_ports serial_response]
set_false_path -to [get_ports tx_statistics_s]
set_false_path -to [get_ports rx_statistics_s]
#set_output_delay -clock [get_clocks -of [get_pins example_clocks/clock_generator/mmcm_adv_inst/CLKOUT1]] 1 [get_ports mdc] #here

# no timing associated with output
set_false_path -from [get_cells -hier -filter {name =~ *phy_resetn_int_reg}] -to [get_ports phy_resetn]

############################################################
# Example design Clock Crossing Constraints                          #
############################################################
set_false_path -from [get_cells -hier -filter {name =~ *phy_resetn_int_reg}] -to [get_cells -hier -filter {name =~ *axi_lite_reset_gen/reset_sync*}]


# control signal is synched over clock boundary separately
#set_false_path -from [get_cells -hier -filter {name =~ tx_stats_reg[*]}] -to [get_cells -hier -filter {name =~ tx_stats_shift_reg[*]}] #here
#set_false_path -from [get_cells -hier -filter {name =~ rx_stats_reg[*]}] -to [get_cells -hier -filter {name =~ rx_stats_shift_reg[*]}] #here


############################################################
# Ignore paths to resync flops
############################################################
set_false_path -to [get_pins -hier -filter {NAME =~ */reset_sync*/PRE}]
#set_max_delay -from [get_cells tx_stats_toggle_reg] -to [get_cells tx_stats_sync/data_sync_reg0] 6 -datapath_only #here
#set_max_delay -from [get_cells rx_stats_toggle_reg] -to [get_cells rx_stats_sync/data_sync_reg0] 6 -datapath_only #here

#
####
#######
##########
#############
#################
#FIFO BLOCK CONSTRAINTS

############################################################
# FIFO Clock Crossing Constraints                          #
############################################################

# control signal is synched separately so this is a false path
set_max_delay -datapath_only -from [get_cells -hier -filter {name =~ *rx_fifo_i/rd_addr_reg[*]}] -to [get_cells -hier -filter {name =~ *fifo*wr_rd_addr_reg[*]}] 6.000
set_max_delay -datapath_only -from [get_cells -hier -filter {name =~ *rx_fifo_i/wr_store_frame_tog_reg}] -to [get_cells -hier -filter {name =~ *fifo_i/resync_wr_store_frame_tog/data_sync_reg0}] 6.000
set_max_delay -datapath_only -from [get_cells -hier -filter {name =~ *rx_fifo_i/update_addr_tog_reg}] -to [get_cells -hier -filter {name =~ *rx_fifo_i/sync_rd_addr_tog/data_sync_reg0}] 6.000
set_max_delay -datapath_only -from [get_cells -hier -filter {name =~ *tx_fifo_i/rd_addr_txfer_reg[*]}] -to [get_cells -hier -filter {name =~ *fifo*wr_rd_addr_reg[*]}] 6.000
set_max_delay -datapath_only -from [get_cells -hier -filter {name =~ *tx_fifo_i/wr_frame_in_fifo_reg}] -to [get_cells -hier -filter {name =~ *tx_fifo_i/resync_wr_frame_in_fifo/data_sync_reg0}] 6.000
set_max_delay -datapath_only -from [get_cells -hier -filter {name =~ *tx_fifo_i/wr_frames_in_fifo_reg}] -to [get_cells -hier -filter {name =~ *tx_fifo_i/resync_wr_frames_in_fifo/data_sync_reg0}] 6.000
set_max_delay -datapath_only -from [get_cells -hier -filter {name =~ *tx_fifo_i/frame_in_fifo_valid_tog_reg}] -to [get_cells -hier -filter {name =~ *tx_fifo_i/resync_fif_valid_tog/data_sync_reg0}] 6.000
set_max_delay -datapath_only -from [get_cells -hier -filter {name =~ *tx_fifo_i/rd_txfer_tog_reg}] -to [get_cells -hier -filter {name =~ *tx_fifo_i/resync_rd_txfer_tog/data_sync_reg0}] 6.000
set_max_delay -datapath_only -from [get_cells -hier -filter {name =~ *tx_fifo_i/rd_tran_frame_tog_reg}] -to [get_cells -hier -filter {name =~ *tx_fifo_i/resync_rd_tran_frame_tog/data_sync_reg0}] 6.000


############################################################
create_clock -period 8.000 -name gtx_clk_bufg_out [get_ports gtx_clk_bufg_out]

############################################################
# TargetX Constraints                                      #
############################################################

set_property PACKAGE_PIN F20 [get_ports BUS_REGCLR]
set_property PACKAGE_PIN J20 [get_ports BUSA_WR_ADDRCLR]
set_property PACKAGE_PIN G19 [get_ports BUSA_RD_ENA]
set_property PACKAGE_PIN G15 [get_ports {BUSA_RD_ROWSEL_S[0]}]
set_property PACKAGE_PIN F15 [get_ports {BUSA_RD_ROWSEL_S[1]}]
set_property PACKAGE_PIN E16 [get_ports {BUSA_RD_ROWSEL_S[2]}]
set_property PACKAGE_PIN F24 [get_ports {BUSA_RD_COLSEL_S[0]}]
set_property PACKAGE_PIN G24 [get_ports {BUSA_RD_COLSEL_S[1]}]
set_property PACKAGE_PIN E23 [get_ports {BUSA_RD_COLSEL_S[2]}]
set_property PACKAGE_PIN F23 [get_ports {BUSA_RD_COLSEL_S[3]}]
set_property PACKAGE_PIN H24 [get_ports {BUSA_RD_COLSEL_S[4]}]
set_property PACKAGE_PIN J24 [get_ports {BUSA_RD_COLSEL_S[5]}]
set_property PACKAGE_PIN D20 [get_ports BUSA_CLR]
set_property PACKAGE_PIN B19 [get_ports BUSA_RAMP]
set_property PACKAGE_PIN F22 [get_ports {BUSA_SAMPLESEL_S[0]}]
set_property PACKAGE_PIN J21 [get_ports {BUSA_SAMPLESEL_S[1]}]
set_property PACKAGE_PIN K20 [get_ports {BUSA_SAMPLESEL_S[2]}]
set_property PACKAGE_PIN G20 [get_ports {BUSA_SAMPLESEL_S[3]}]
set_property PACKAGE_PIN G21 [get_ports {BUSA_SAMPLESEL_S[4]}]
set_property PACKAGE_PIN M17 [get_ports BUSA_SR_CLEAR]
set_property PACKAGE_PIN A22 [get_ports BUSA_SR_SEL]
set_property PACKAGE_PIN A19 [get_ports {BUSA_DO[0]}]
set_property PACKAGE_PIN B22 [get_ports {BUSA_DO[1]}]
set_property PACKAGE_PIN D21 [get_ports {BUSA_DO[2]}]
set_property PACKAGE_PIN M16 [get_ports {BUSA_DO[3]}]
set_property PACKAGE_PIN D16 [get_ports {BUSA_DO[4]}]
set_property PACKAGE_PIN B20 [get_ports {BUSA_DO[5]}]
set_property PACKAGE_PIN A17 [get_ports {BUSA_DO[6]}]
set_property PACKAGE_PIN A18 [get_ports {BUSA_DO[7]}]
set_property PACKAGE_PIN L17 [get_ports {BUSA_DO[8]}]
set_property PACKAGE_PIN A20 [get_ports {BUSA_DO[9]}]
set_property PACKAGE_PIN K21 [get_ports {BUSA_DO[10]}]
set_property PACKAGE_PIN C21 [get_ports {BUSA_DO[11]}]
set_property PACKAGE_PIN B21 [get_ports {BUSA_DO[12]}]
set_property PACKAGE_PIN L14 [get_ports {BUSA_DO[13]}]
set_property PACKAGE_PIN J19 [get_ports {BUSA_DO[14]}]
set_property PACKAGE_PIN L18 [get_ports {BUSA_DO[15]}]
set_property PACKAGE_PIN F25 [get_ports SIN]
set_property PACKAGE_PIN G26 [get_ports PCLK]
set_property PACKAGE_PIN H26 [get_ports SHOUT]
set_property PACKAGE_PIN G25 [get_ports SCLK]
set_property PACKAGE_PIN H18 [get_ports WL_CLK_N]
set_property PACKAGE_PIN J18 [get_ports WL_CLK_P]
set_property PACKAGE_PIN K23 [get_ports WR1_ENA]
set_property PACKAGE_PIN K22 [get_ports WR2_ENA]
set_property PACKAGE_PIN H15 [get_ports SSTIN_N]
set_property PACKAGE_PIN H14 [get_ports SSTIN_P]
set_property PACKAGE_PIN M14 [get_ports SR_CLOCK]
set_property PACKAGE_PIN G22 [get_ports SAMPLESEL_ANY]
set_property PACKAGE_PIN B17 [get_ports {TDC1_TRG[0]}]
set_property PACKAGE_PIN E20 [get_ports {TDC1_TRG[1]}]
set_property PACKAGE_PIN D26 [get_ports {TDC1_TRG[2]}]
set_property PACKAGE_PIN E26 [get_ports {TDC1_TRG[3]}]
set_property PACKAGE_PIN D25 [get_ports {TDC1_TRG[4]}]
set_property PACKAGE_PIN G17 [get_ports DAC_SCL]
set_property PACKAGE_PIN F17 [get_ports DAC_SDA]
set_property PACKAGE_PIN T8 [get_ports SMP_EXTSYNC]

set_property IOSTANDARD LVCMOS25 [get_ports BUS_REGCLR]
set_property IOSTANDARD LVCMOS25 [get_ports BUSA_WR_ADDRCLR]
set_property IOSTANDARD LVCMOS25 [get_ports BUSA_RD_ENA]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_RD_ROWSEL_S[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_RD_ROWSEL_S[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_RD_ROWSEL_S[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_RD_COLSEL_S[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_RD_COLSEL_S[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_RD_COLSEL_S[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_RD_COLSEL_S[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_RD_COLSEL_S[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_RD_COLSEL_S[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports BUSA_CLR]
set_property IOSTANDARD LVCMOS25 [get_ports BUSA_RAMP]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_SAMPLESEL_S[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_SAMPLESEL_S[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_SAMPLESEL_S[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_SAMPLESEL_S[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_SAMPLESEL_S[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports BUSA_SR_CLEAR]
set_property IOSTANDARD LVCMOS25 [get_ports BUSA_SR_SEL]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_DO[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_DO[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_DO[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_DO[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_DO[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_DO[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_DO[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_DO[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_DO[8]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_DO[9]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_DO[10]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_DO[11]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_DO[12]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_DO[13]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_DO[14]}]
set_property IOSTANDARD LVCMOS25 [get_ports {BUSA_DO[15]}]
set_property IOSTANDARD LVCMOS25 [get_ports SIN]
set_property IOSTANDARD LVCMOS25 [get_ports PCLK]
set_property IOSTANDARD LVCMOS25 [get_ports SHOUT]
set_property IOSTANDARD LVCMOS25 [get_ports SCLK]
set_property IOSTANDARD LVDS_25 [get_ports WL_CLK_N]
set_property IOSTANDARD LVDS_25 [get_ports WL_CLK_P]
set_property IOSTANDARD LVCMOS25 [get_ports WR1_ENA]
set_property IOSTANDARD LVCMOS25 [get_ports WR2_ENA]
set_property IOSTANDARD LVDS_25 [get_ports SSTIN_N]
set_property IOSTANDARD LVDS_25 [get_ports SSTIN_P]
set_property IOSTANDARD LVCMOS25 [get_ports SR_CLOCK]
set_property IOSTANDARD LVCMOS25 [get_ports SAMPLESEL_ANY]
set_property IOSTANDARD LVCMOS25 [get_ports {TDC1_TRG[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {TDC1_TRG[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {TDC1_TRG[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {TDC1_TRG[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {TDC1_TRG[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports DAC_SCL]
set_property IOSTANDARD LVCMOS25 [get_ports DAC_SDA]
set_property IOSTANDARD LVCMOS15 [get_ports SMP_EXTSYNC]

####################################################################
#pedsub (16k sample window max)


#######################################################################
##pedcalc (16k sample window max)
#create_debug_core u_ila_0 ila
#set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
#set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
#set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
#set_property C_DATA_DEPTH 16384 [get_debug_cores u_ila_0]
#set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
#set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
#set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
#set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
#set_property port_width 1 [get_debug_ports u_ila_0/clk]
#connect_debug_port u_ila_0/clk [get_nets [list clkgen_1/inst/clk_out1]]
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
#set_property port_width 5 [get_debug_ports u_ila_0/probe0]
#connect_debug_port u_ila_0/probe0 [get_nets [list {u_WaveformPedcalcDSP/ped_sa[0]} {u_WaveformPedcalcDSP/ped_sa[1]} {u_WaveformPedcalcDSP/ped_sa[2]} {u_WaveformPedcalcDSP/ped_sa[3]} {u_WaveformPedcalcDSP/ped_sa[4]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
#set_property port_width 3 [get_debug_ports u_ila_0/probe1]
#connect_debug_port u_ila_0/probe1 [get_nets [list {u_WaveformPedcalcDSP/count[0]} {u_WaveformPedcalcDSP/count[1]} {u_WaveformPedcalcDSP/count[2]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
#set_property port_width 11 [get_debug_ports u_ila_0/probe2]
#connect_debug_port u_ila_0/probe2 [get_nets [list {u_WaveformPedcalcDSP/ped2_arr_addr[0]} {u_WaveformPedcalcDSP/ped2_arr_addr[1]} {u_WaveformPedcalcDSP/ped2_arr_addr[2]} {u_WaveformPedcalcDSP/ped2_arr_addr[3]} {u_WaveformPedcalcDSP/ped2_arr_addr[4]} {u_WaveformPedcalcDSP/ped2_arr_addr[5]} {u_WaveformPedcalcDSP/ped2_arr_addr[6]} {u_WaveformPedcalcDSP/ped2_arr_addr[7]} {u_WaveformPedcalcDSP/ped2_arr_addr[8]} {u_WaveformPedcalcDSP/ped2_arr_addr[9]} {u_WaveformPedcalcDSP/ped2_arr_addr[10]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
#set_property port_width 3 [get_debug_ports u_ila_0/probe3]
#connect_debug_port u_ila_0/probe3 [get_nets [list {u_WaveformPedcalcDSP/ped_sa6[0]} {u_WaveformPedcalcDSP/ped_sa6[1]} {u_WaveformPedcalcDSP/ped_sa6[2]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
#set_property port_width 12 [get_debug_ports u_ila_0/probe4]
#connect_debug_port u_ila_0/probe4 [get_nets [list {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval1[0]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval1[1]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval1[2]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval1[3]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval1[4]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval1[5]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval1[6]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval1[7]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval1[8]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval1[9]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval1[10]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval1[11]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
#set_property port_width 11 [get_debug_ports u_ila_0/probe5]
#connect_debug_port u_ila_0/probe5 [get_nets [list {u_WaveformPedcalcDSP/ped_arr_addr[0]} {u_WaveformPedcalcDSP/ped_arr_addr[1]} {u_WaveformPedcalcDSP/ped_arr_addr[2]} {u_WaveformPedcalcDSP/ped_arr_addr[3]} {u_WaveformPedcalcDSP/ped_arr_addr[4]} {u_WaveformPedcalcDSP/ped_arr_addr[5]} {u_WaveformPedcalcDSP/ped_arr_addr[6]} {u_WaveformPedcalcDSP/ped_arr_addr[7]} {u_WaveformPedcalcDSP/ped_arr_addr[8]} {u_WaveformPedcalcDSP/ped_arr_addr[9]} {u_WaveformPedcalcDSP/ped_arr_addr[10]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
#set_property port_width 22 [get_debug_ports u_ila_0/probe6]
#connect_debug_port u_ila_0/probe6 [get_nets [list {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[0]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[1]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[2]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[3]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[4]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[5]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[6]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[7]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[8]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[9]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[10]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[11]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[12]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[13]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[14]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[15]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[16]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[17]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[18]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[19]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[20]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/addr[21]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
#set_property port_width 2 [get_debug_ports u_ila_0/probe7]
#connect_debug_port u_ila_0/probe7 [get_nets [list {u_WaveformPedcalcDSP/ped_win[0]} {u_WaveformPedcalcDSP/ped_win[1]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
#set_property port_width 2 [get_debug_ports u_ila_0/probe8]
#connect_debug_port u_ila_0/probe8 [get_nets [list {u_WaveformPedcalcDSP/ped_wr_start[0]} {u_WaveformPedcalcDSP/ped_wr_start[1]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
#set_property port_width 9 [get_debug_ports u_ila_0/probe9]
#connect_debug_port u_ila_0/probe9 [get_nets [list {u_WaveformPedcalcDSP/win_addr_start[0]} {u_WaveformPedcalcDSP/win_addr_start[1]} {u_WaveformPedcalcDSP/win_addr_start[2]} {u_WaveformPedcalcDSP/win_addr_start[3]} {u_WaveformPedcalcDSP/win_addr_start[4]} {u_WaveformPedcalcDSP/win_addr_start[5]} {u_WaveformPedcalcDSP/win_addr_start[6]} {u_WaveformPedcalcDSP/win_addr_start[7]} {u_WaveformPedcalcDSP/win_addr_start[8]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
#set_property port_width 12 [get_debug_ports u_ila_0/probe10]
#connect_debug_port u_ila_0/probe10 [get_nets [list {u_WaveformPedcalcDSP/wval0temp[0]} {u_WaveformPedcalcDSP/wval0temp[1]} {u_WaveformPedcalcDSP/wval0temp[2]} {u_WaveformPedcalcDSP/wval0temp[3]} {u_WaveformPedcalcDSP/wval0temp[4]} {u_WaveformPedcalcDSP/wval0temp[5]} {u_WaveformPedcalcDSP/wval0temp[6]} {u_WaveformPedcalcDSP/wval0temp[7]} {u_WaveformPedcalcDSP/wval0temp[8]} {u_WaveformPedcalcDSP/wval0temp[9]} {u_WaveformPedcalcDSP/wval0temp[10]} {u_WaveformPedcalcDSP/wval0temp[11]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
#set_property port_width 2 [get_debug_ports u_ila_0/probe11]
#connect_debug_port u_ila_0/probe11 [get_nets [list {u_WaveformPedcalcDSP/trigin_i[0]} {u_WaveformPedcalcDSP/trigin_i[1]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
#set_property port_width 4 [get_debug_ports u_ila_0/probe12]
#connect_debug_port u_ila_0/probe12 [get_nets [list {u_WaveformPedcalcDSP/ped_ch[0]} {u_WaveformPedcalcDSP/ped_ch[1]} {u_WaveformPedcalcDSP/ped_ch[2]} {u_WaveformPedcalcDSP/ped_ch[3]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
#set_property port_width 21 [get_debug_ports u_ila_0/probe13]
#connect_debug_port u_ila_0/probe13 [get_nets [list {u_WaveformPedcalcDSP/ped_sa_num[0]} {u_WaveformPedcalcDSP/ped_sa_num[1]} {u_WaveformPedcalcDSP/ped_sa_num[2]} {u_WaveformPedcalcDSP/ped_sa_num[3]} {u_WaveformPedcalcDSP/ped_sa_num[4]} {u_WaveformPedcalcDSP/ped_sa_num[5]} {u_WaveformPedcalcDSP/ped_sa_num[6]} {u_WaveformPedcalcDSP/ped_sa_num[7]} {u_WaveformPedcalcDSP/ped_sa_num[8]} {u_WaveformPedcalcDSP/ped_sa_num[9]} {u_WaveformPedcalcDSP/ped_sa_num[10]} {u_WaveformPedcalcDSP/ped_sa_num[11]} {u_WaveformPedcalcDSP/ped_sa_num[12]} {u_WaveformPedcalcDSP/ped_sa_num[13]} {u_WaveformPedcalcDSP/ped_sa_num[14]} {u_WaveformPedcalcDSP/ped_sa_num[15]} {u_WaveformPedcalcDSP/ped_sa_num[16]} {u_WaveformPedcalcDSP/ped_sa_num[17]} {u_WaveformPedcalcDSP/ped_sa_num[19]} {u_WaveformPedcalcDSP/ped_sa_num[20]} {u_WaveformPedcalcDSP/ped_sa_num[21]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
#set_property port_width 20 [get_debug_ports u_ila_0/probe14]
#connect_debug_port u_ila_0/probe14 [get_nets [list {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_addr[0]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_addr[1]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_addr[2]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_addr[3]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_addr[4]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_addr[5]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_addr[6]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_addr[7]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_addr[8]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_addr[9]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_addr[10]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_addr[11]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_addr[12]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_addr[13]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_addr[14]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_addr[15]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_addr[16]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_addr[17]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_addr[18]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_addr[19]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
#set_property port_width 12 [get_debug_ports u_ila_0/probe15]
#connect_debug_port u_ila_0/probe15 [get_nets [list {u_WaveformPedcalcDSP/wval1temp[0]} {u_WaveformPedcalcDSP/wval1temp[1]} {u_WaveformPedcalcDSP/wval1temp[2]} {u_WaveformPedcalcDSP/wval1temp[3]} {u_WaveformPedcalcDSP/wval1temp[4]} {u_WaveformPedcalcDSP/wval1temp[5]} {u_WaveformPedcalcDSP/wval1temp[6]} {u_WaveformPedcalcDSP/wval1temp[7]} {u_WaveformPedcalcDSP/wval1temp[8]} {u_WaveformPedcalcDSP/wval1temp[9]} {u_WaveformPedcalcDSP/wval1temp[10]} {u_WaveformPedcalcDSP/wval1temp[11]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
#set_property port_width 6 [get_debug_ports u_ila_0/probe16]
#connect_debug_port u_ila_0/probe16 [get_nets [list {u_WaveformPedcalcDSP/dmx_st[0]} {u_WaveformPedcalcDSP/dmx_st[1]} {u_WaveformPedcalcDSP/dmx_st[2]} {u_WaveformPedcalcDSP/dmx_st[3]} {u_WaveformPedcalcDSP/dmx_st[4]} {u_WaveformPedcalcDSP/dmx_st[5]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
#set_property port_width 8 [get_debug_ports u_ila_0/probe17]
#connect_debug_port u_ila_0/probe17 [get_nets [list {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_dataw[0]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_dataw[1]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_dataw[2]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_dataw[3]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_dataw[4]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_dataw[5]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_dataw[6]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_dataw[7]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
#set_property port_width 12 [get_debug_ports u_ila_0/probe18]
#connect_debug_port u_ila_0/probe18 [get_nets [list {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval0[0]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval0[1]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval0[2]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval0[3]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval0[4]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval0[5]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval0[6]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval0[7]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval0[8]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval0[9]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval0[10]} {u_WaveformPedcalcDSP/Inst_PedRAMaccess/wval0[11]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
#set_property port_width 8 [get_debug_ports u_ila_0/probe19]
#connect_debug_port u_ila_0/probe19 [get_nets [list {SRAM_1/dina[0]} {SRAM_1/dina[1]} {SRAM_1/dina[2]} {SRAM_1/dina[3]} {SRAM_1/dina[4]} {SRAM_1/dina[5]} {SRAM_1/dina[6]} {SRAM_1/dina[7]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
#set_property port_width 11 [get_debug_ports u_ila_0/probe20]
#connect_debug_port u_ila_0/probe20 [get_nets [list {u_SerialDataRoutDemux/u_bram2/addrb[0]} {u_SerialDataRoutDemux/u_bram2/addrb[1]} {u_SerialDataRoutDemux/u_bram2/addrb[2]} {u_SerialDataRoutDemux/u_bram2/addrb[3]} {u_SerialDataRoutDemux/u_bram2/addrb[4]} {u_SerialDataRoutDemux/u_bram2/addrb[5]} {u_SerialDataRoutDemux/u_bram2/addrb[6]} {u_SerialDataRoutDemux/u_bram2/addrb[7]} {u_SerialDataRoutDemux/u_bram2/addrb[8]} {u_SerialDataRoutDemux/u_bram2/addrb[9]} {u_SerialDataRoutDemux/u_bram2/addrb[10]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
#set_property port_width 20 [get_debug_ports u_ila_0/probe21]
#connect_debug_port u_ila_0/probe21 [get_nets [list {SRAM_1/addra[0]} {SRAM_1/addra[1]} {SRAM_1/addra[2]} {SRAM_1/addra[3]} {SRAM_1/addra[4]} {SRAM_1/addra[5]} {SRAM_1/addra[6]} {SRAM_1/addra[7]} {SRAM_1/addra[8]} {SRAM_1/addra[9]} {SRAM_1/addra[10]} {SRAM_1/addra[11]} {SRAM_1/addra[12]} {SRAM_1/addra[13]} {SRAM_1/addra[14]} {SRAM_1/addra[15]} {SRAM_1/addra[16]} {SRAM_1/addra[17]} {SRAM_1/addra[18]} {SRAM_1/addra[19]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
#set_property port_width 1 [get_debug_ports u_ila_0/probe22]
#connect_debug_port u_ila_0/probe22 [get_nets [list {SRAM_1/wea[0]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
#set_property port_width 20 [get_debug_ports u_ila_0/probe23]
#connect_debug_port u_ila_0/probe23 [get_nets [list {u_SerialDataRoutDemux/u_bram2/doutb[0]} {u_SerialDataRoutDemux/u_bram2/doutb[1]} {u_SerialDataRoutDemux/u_bram2/doutb[2]} {u_SerialDataRoutDemux/u_bram2/doutb[3]} {u_SerialDataRoutDemux/u_bram2/doutb[4]} {u_SerialDataRoutDemux/u_bram2/doutb[5]} {u_SerialDataRoutDemux/u_bram2/doutb[6]} {u_SerialDataRoutDemux/u_bram2/doutb[7]} {u_SerialDataRoutDemux/u_bram2/doutb[8]} {u_SerialDataRoutDemux/u_bram2/doutb[9]} {u_SerialDataRoutDemux/u_bram2/doutb[10]} {u_SerialDataRoutDemux/u_bram2/doutb[11]} {u_SerialDataRoutDemux/u_bram2/doutb[12]} {u_SerialDataRoutDemux/u_bram2/doutb[13]} {u_SerialDataRoutDemux/u_bram2/doutb[14]} {u_SerialDataRoutDemux/u_bram2/doutb[15]} {u_SerialDataRoutDemux/u_bram2/doutb[16]} {u_SerialDataRoutDemux/u_bram2/doutb[17]} {u_SerialDataRoutDemux/u_bram2/doutb[18]} {u_SerialDataRoutDemux/u_bram2/doutb[19]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
#set_property port_width 8 [get_debug_ports u_ila_0/probe24]
#connect_debug_port u_ila_0/probe24 [get_nets [list {SRAM_1/douta[0]} {SRAM_1/douta[1]} {SRAM_1/douta[2]} {SRAM_1/douta[3]} {SRAM_1/douta[4]} {SRAM_1/douta[5]} {SRAM_1/douta[6]} {SRAM_1/douta[7]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
#set_property port_width 20 [get_debug_ports u_ila_0/probe25]
#connect_debug_port u_ila_0/probe25 [get_nets [list {u_SerialDataRoutDemux/u_srout_bram/doutb[0]} {u_SerialDataRoutDemux/u_srout_bram/doutb[1]} {u_SerialDataRoutDemux/u_srout_bram/doutb[2]} {u_SerialDataRoutDemux/u_srout_bram/doutb[3]} {u_SerialDataRoutDemux/u_srout_bram/doutb[4]} {u_SerialDataRoutDemux/u_srout_bram/doutb[5]} {u_SerialDataRoutDemux/u_srout_bram/doutb[6]} {u_SerialDataRoutDemux/u_srout_bram/doutb[7]} {u_SerialDataRoutDemux/u_srout_bram/doutb[8]} {u_SerialDataRoutDemux/u_srout_bram/doutb[9]} {u_SerialDataRoutDemux/u_srout_bram/doutb[10]} {u_SerialDataRoutDemux/u_srout_bram/doutb[11]} {u_SerialDataRoutDemux/u_srout_bram/doutb[12]} {u_SerialDataRoutDemux/u_srout_bram/doutb[13]} {u_SerialDataRoutDemux/u_srout_bram/doutb[14]} {u_SerialDataRoutDemux/u_srout_bram/doutb[15]} {u_SerialDataRoutDemux/u_srout_bram/doutb[16]} {u_SerialDataRoutDemux/u_srout_bram/doutb[17]} {u_SerialDataRoutDemux/u_srout_bram/doutb[18]} {u_SerialDataRoutDemux/u_srout_bram/doutb[19]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
#set_property port_width 11 [get_debug_ports u_ila_0/probe26]
#connect_debug_port u_ila_0/probe26 [get_nets [list {u_SerialDataRoutDemux/u_srout_bram/addrb[0]} {u_SerialDataRoutDemux/u_srout_bram/addrb[1]} {u_SerialDataRoutDemux/u_srout_bram/addrb[2]} {u_SerialDataRoutDemux/u_srout_bram/addrb[3]} {u_SerialDataRoutDemux/u_srout_bram/addrb[4]} {u_SerialDataRoutDemux/u_srout_bram/addrb[5]} {u_SerialDataRoutDemux/u_srout_bram/addrb[6]} {u_SerialDataRoutDemux/u_srout_bram/addrb[7]} {u_SerialDataRoutDemux/u_srout_bram/addrb[8]} {u_SerialDataRoutDemux/u_srout_bram/addrb[9]} {u_SerialDataRoutDemux/u_srout_bram/addrb[10]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
#set_property port_width 1 [get_debug_ports u_ila_0/probe27]
#connect_debug_port u_ila_0/probe27 [get_nets [list u_WaveformPedcalcDSP/Inst_PedRAMaccess/update]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
#set_property port_width 1 [get_debug_ports u_ila_0/probe28]
#connect_debug_port u_ila_0/probe28 [get_nets [list u_WaveformPedcalcDSP/Inst_PedRAMaccess/ram_update]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
#set_property port_width 1 [get_debug_ports u_ila_0/probe29]
#connect_debug_port u_ila_0/probe29 [get_nets [list u_WaveformPedcalcDSP/dmx_allwin_done]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
#set_property port_width 1 [get_debug_ports u_ila_0/probe30]
#connect_debug_port u_ila_0/probe30 [get_nets [list u_WaveformPedcalcDSP/enable_i]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
#set_property port_width 1 [get_debug_ports u_ila_0/probe31]
#connect_debug_port u_ila_0/probe31 [get_nets [list u_WaveformPedcalcDSP/ped_sa_busy]]
#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets CLK]

##################################################################
##pedsub less signals(32k)

#create_debug_core u_ila_0 ila
#set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
#set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
#set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
#set_property C_DATA_DEPTH 32768 [get_debug_cores u_ila_0]
#set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
#set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
#set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
#set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
#set_property port_width 1 [get_debug_ports u_ila_0/clk]
#connect_debug_port u_ila_0/clk [get_nets [list clkgen_1/inst/clk_out1]]
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
#set_property port_width 9 [get_debug_ports u_ila_0/probe0]
#connect_debug_port u_ila_0/probe0 [get_nets [list {u_wavepedsub/win_addr_start_i[0]} {u_wavepedsub/win_addr_start_i[1]} {u_wavepedsub/win_addr_start_i[2]} {u_wavepedsub/win_addr_start_i[3]} {u_wavepedsub/win_addr_start_i[4]} {u_wavepedsub/win_addr_start_i[5]} {u_wavepedsub/win_addr_start_i[6]} {u_wavepedsub/win_addr_start_i[7]} {u_wavepedsub/win_addr_start_i[8]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
#set_property port_width 2 [get_debug_ports u_ila_0/probe1]
#connect_debug_port u_ila_0/probe1 [get_nets [list {u_wavepedsub/trigin_i[0]} {u_wavepedsub/trigin_i[1]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
#set_property port_width 13 [get_debug_ports u_ila_0/probe2]
#connect_debug_port u_ila_0/probe2 [get_nets [list {u_wavepedsub/sapedsub[0]} {u_wavepedsub/sapedsub[1]} {u_wavepedsub/sapedsub[2]} {u_wavepedsub/sapedsub[3]} {u_wavepedsub/sapedsub[4]} {u_wavepedsub/sapedsub[5]} {u_wavepedsub/sapedsub[6]} {u_wavepedsub/sapedsub[7]} {u_wavepedsub/sapedsub[8]} {u_wavepedsub/sapedsub[9]} {u_wavepedsub/sapedsub[10]} {u_wavepedsub/sapedsub[11]} {u_wavepedsub/sapedsub[12]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
#set_property port_width 32 [get_debug_ports u_ila_0/probe3]
#connect_debug_port u_ila_0/probe3 [get_nets [list {u_wavepedsub/pswfifo_d[0]} {u_wavepedsub/pswfifo_d[1]} {u_wavepedsub/pswfifo_d[2]} {u_wavepedsub/pswfifo_d[3]} {u_wavepedsub/pswfifo_d[4]} {u_wavepedsub/pswfifo_d[5]} {u_wavepedsub/pswfifo_d[6]} {u_wavepedsub/pswfifo_d[7]} {u_wavepedsub/pswfifo_d[8]} {u_wavepedsub/pswfifo_d[9]} {u_wavepedsub/pswfifo_d[10]} {u_wavepedsub/pswfifo_d[11]} {u_wavepedsub/pswfifo_d[12]} {u_wavepedsub/pswfifo_d[13]} {u_wavepedsub/pswfifo_d[14]} {u_wavepedsub/pswfifo_d[15]} {u_wavepedsub/pswfifo_d[16]} {u_wavepedsub/pswfifo_d[17]} {u_wavepedsub/pswfifo_d[18]} {u_wavepedsub/pswfifo_d[19]} {u_wavepedsub/pswfifo_d[20]} {u_wavepedsub/pswfifo_d[21]} {u_wavepedsub/pswfifo_d[22]} {u_wavepedsub/pswfifo_d[23]} {u_wavepedsub/pswfifo_d[24]} {u_wavepedsub/pswfifo_d[25]} {u_wavepedsub/pswfifo_d[26]} {u_wavepedsub/pswfifo_d[27]} {u_wavepedsub/pswfifo_d[28]} {u_wavepedsub/pswfifo_d[29]} {u_wavepedsub/pswfifo_d[30]} {u_wavepedsub/pswfifo_d[31]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
#set_property port_width 6 [get_debug_ports u_ila_0/probe4]
#connect_debug_port u_ila_0/probe4 [get_nets [list {u_wavepedsub/pedsub_st[0]} {u_wavepedsub/pedsub_st[1]} {u_wavepedsub/pedsub_st[2]} {u_wavepedsub/pedsub_st[3]} {u_wavepedsub/pedsub_st[4]} {u_wavepedsub/pedsub_st[5]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
#set_property port_width 2 [get_debug_ports u_ila_0/probe5]
#connect_debug_port u_ila_0/probe5 [get_nets [list {u_wavepedsub/ped_win[0]} {u_wavepedsub/ped_win[1]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
#set_property port_width 2 [get_debug_ports u_ila_0/probe6]
#connect_debug_port u_ila_0/probe6 [get_nets [list {u_wavepedsub/ped_sub_start[0]} {u_wavepedsub/ped_sub_start[1]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
#set_property port_width 4 [get_debug_ports u_ila_0/probe7]
#connect_debug_port u_ila_0/probe7 [get_nets [list {u_wavepedsub/ped_ch[0]} {u_wavepedsub/ped_ch[1]} {u_wavepedsub/ped_ch[2]} {u_wavepedsub/ped_ch[3]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
#set_property port_width 4 [get_debug_ports u_ila_0/probe8]
#connect_debug_port u_ila_0/probe8 [get_nets [list {u_wavepedsub/next_ped_st[0]} {u_wavepedsub/next_ped_st[1]} {u_wavepedsub/next_ped_st[2]} {u_wavepedsub/next_ped_st[3]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
#set_property port_width 3 [get_debug_ports u_ila_0/probe9]
#connect_debug_port u_ila_0/probe9 [get_nets [list {u_wavepedsub/mode[0]} {u_wavepedsub/mode[1]} {u_wavepedsub/mode[2]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
#set_property port_width 12 [get_debug_ports u_ila_0/probe10]
#connect_debug_port u_ila_0/probe10 [get_nets [list {u_wavepedsub/bram_doutb[0]} {u_wavepedsub/bram_doutb[1]} {u_wavepedsub/bram_doutb[2]} {u_wavepedsub/bram_doutb[3]} {u_wavepedsub/bram_doutb[4]} {u_wavepedsub/bram_doutb[5]} {u_wavepedsub/bram_doutb[6]} {u_wavepedsub/bram_doutb[7]} {u_wavepedsub/bram_doutb[8]} {u_wavepedsub/bram_doutb[9]} {u_wavepedsub/bram_doutb[10]} {u_wavepedsub/bram_doutb[11]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
#set_property port_width 11 [get_debug_ports u_ila_0/probe11]
#connect_debug_port u_ila_0/probe11 [get_nets [list {u_wavepedsub/bram_addrb[0]} {u_wavepedsub/bram_addrb[1]} {u_wavepedsub/bram_addrb[2]} {u_wavepedsub/bram_addrb[3]} {u_wavepedsub/bram_addrb[4]} {u_wavepedsub/bram_addrb[5]} {u_wavepedsub/bram_addrb[6]} {u_wavepedsub/bram_addrb[7]} {u_wavepedsub/bram_addrb[8]} {u_wavepedsub/bram_addrb[9]} {u_wavepedsub/bram_addrb[10]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
#set_property port_width 2 [get_debug_ports u_ila_0/probe12]
#connect_debug_port u_ila_0/probe12 [get_nets [list {u_SerialDataRoutDemux/restart_peds_i[0]} {u_SerialDataRoutDemux/restart_peds_i[1]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
#set_property port_width 2 [get_debug_ports u_ila_0/probe13]
#connect_debug_port u_ila_0/probe13 [get_nets [list {u_SerialDataRoutDemux/restart_i[0]} {u_SerialDataRoutDemux/restart_i[1]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
#set_property port_width 5 [get_debug_ports u_ila_0/probe14]
#connect_debug_port u_ila_0/probe14 [get_nets [list {u_SerialDataRoutDemux/next_state[0]} {u_SerialDataRoutDemux/next_state[1]} {u_SerialDataRoutDemux/next_state[2]} {u_SerialDataRoutDemux/next_state[3]} {u_SerialDataRoutDemux/next_state[4]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
#set_property port_width 1 [get_debug_ports u_ila_0/probe15]
#connect_debug_port u_ila_0/probe15 [get_nets [list {u_wavepedsub/u_pedarr/wea[0]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
#set_property port_width 12 [get_debug_ports u_ila_0/probe16]
#connect_debug_port u_ila_0/probe16 [get_nets [list {u_wavepedsub/u_pedarr/dina[0]} {u_wavepedsub/u_pedarr/dina[1]} {u_wavepedsub/u_pedarr/dina[2]} {u_wavepedsub/u_pedarr/dina[3]} {u_wavepedsub/u_pedarr/dina[4]} {u_wavepedsub/u_pedarr/dina[5]} {u_wavepedsub/u_pedarr/dina[6]} {u_wavepedsub/u_pedarr/dina[7]} {u_wavepedsub/u_pedarr/dina[8]} {u_wavepedsub/u_pedarr/dina[9]} {u_wavepedsub/u_pedarr/dina[10]} {u_wavepedsub/u_pedarr/dina[11]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
#set_property port_width 11 [get_debug_ports u_ila_0/probe17]
#connect_debug_port u_ila_0/probe17 [get_nets [list {u_wavepedsub/u_pedarr/addra[0]} {u_wavepedsub/u_pedarr/addra[1]} {u_wavepedsub/u_pedarr/addra[2]} {u_wavepedsub/u_pedarr/addra[3]} {u_wavepedsub/u_pedarr/addra[4]} {u_wavepedsub/u_pedarr/addra[5]} {u_wavepedsub/u_pedarr/addra[6]} {u_wavepedsub/u_pedarr/addra[7]} {u_wavepedsub/u_pedarr/addra[8]} {u_wavepedsub/u_pedarr/addra[9]} {u_wavepedsub/u_pedarr/addra[10]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
#set_property port_width 20 [get_debug_ports u_ila_0/probe18]
#connect_debug_port u_ila_0/probe18 [get_nets [list {SRAM_1/addra[0]} {SRAM_1/addra[1]} {SRAM_1/addra[2]} {SRAM_1/addra[3]} {SRAM_1/addra[4]} {SRAM_1/addra[5]} {SRAM_1/addra[6]} {SRAM_1/addra[7]} {SRAM_1/addra[8]} {SRAM_1/addra[9]} {SRAM_1/addra[10]} {SRAM_1/addra[11]} {SRAM_1/addra[12]} {SRAM_1/addra[13]} {SRAM_1/addra[14]} {SRAM_1/addra[15]} {SRAM_1/addra[16]} {SRAM_1/addra[17]} {SRAM_1/addra[18]} {SRAM_1/addra[19]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
#set_property port_width 8 [get_debug_ports u_ila_0/probe19]
#connect_debug_port u_ila_0/probe19 [get_nets [list {SRAM_1/douta[0]} {SRAM_1/douta[1]} {SRAM_1/douta[2]} {SRAM_1/douta[3]} {SRAM_1/douta[4]} {SRAM_1/douta[5]} {SRAM_1/douta[6]} {SRAM_1/douta[7]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
#set_property port_width 1 [get_debug_ports u_ila_0/probe20]
#connect_debug_port u_ila_0/probe20 [get_nets [list u_SerialDataRoutDemux/calc_peds_en]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
#set_property port_width 1 [get_debug_ports u_ila_0/probe21]
#connect_debug_port u_ila_0/probe21 [get_nets [list u_wavepedsub/dmx_allwin_done]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
#set_property port_width 1 [get_debug_ports u_ila_0/probe22]
#connect_debug_port u_ila_0/probe22 [get_nets [list u_wavepedsub/enable_i]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
#set_property port_width 1 [get_debug_ports u_ila_0/probe23]
#connect_debug_port u_ila_0/probe23 [get_nets [list internal_PEDMAN_calc_peds_en]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
#set_property port_width 1 [get_debug_ports u_ila_0/probe24]
#connect_debug_port u_ila_0/probe24 [get_nets [list internal_READCTRL_srout_restart]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
#set_property port_width 1 [get_debug_ports u_ila_0/probe25]
#connect_debug_port u_ila_0/probe25 [get_nets [list internal_READCTRL_srout_start]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
#set_property port_width 1 [get_debug_ports u_ila_0/probe26]
#connect_debug_port u_ila_0/probe26 [get_nets [list u_wavepedsub/ped_sub_fetch_done]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
#set_property port_width 1 [get_debug_ports u_ila_0/probe27]
#connect_debug_port u_ila_0/probe27 [get_nets [list u_SerialDataRoutDemux/restart]]
#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets CLK]

############################################################################################
##serialdataroutdemux
#create_debug_core u_ila_0 ila
#set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
#set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
#set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
#set_property C_DATA_DEPTH 16384 [get_debug_cores u_ila_0]
#set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
#set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
#set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
#set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
#set_property port_width 1 [get_debug_ports u_ila_0/clk]
#connect_debug_port u_ila_0/clk [get_nets [list clkgen_1/inst/clk_out1]]
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
#set_property port_width 2 [get_debug_ports u_ila_0/probe0]
#connect_debug_port u_ila_0/probe0 [get_nets [list {u_SerialDataRoutDemux/dmx_win[0]} {u_SerialDataRoutDemux/dmx_win[1]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
#set_property port_width 6 [get_debug_ports u_ila_0/probe1]
#connect_debug_port u_ila_0/probe1 [get_nets [list {u_SerialDataRoutDemux/internal_samplesel[0]} {u_SerialDataRoutDemux/internal_samplesel[1]} {u_SerialDataRoutDemux/internal_samplesel[2]} {u_SerialDataRoutDemux/internal_samplesel[3]} {u_SerialDataRoutDemux/internal_samplesel[4]} {u_SerialDataRoutDemux/internal_samplesel[5]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
#set_property port_width 16 [get_debug_ports u_ila_0/probe2]
#connect_debug_port u_ila_0/probe2 [get_nets [list {u_SerialDataRoutDemux/dout[0]} {u_SerialDataRoutDemux/dout[1]} {u_SerialDataRoutDemux/dout[2]} {u_SerialDataRoutDemux/dout[3]} {u_SerialDataRoutDemux/dout[4]} {u_SerialDataRoutDemux/dout[5]} {u_SerialDataRoutDemux/dout[6]} {u_SerialDataRoutDemux/dout[7]} {u_SerialDataRoutDemux/dout[8]} {u_SerialDataRoutDemux/dout[9]} {u_SerialDataRoutDemux/dout[10]} {u_SerialDataRoutDemux/dout[11]} {u_SerialDataRoutDemux/dout[12]} {u_SerialDataRoutDemux/dout[13]} {u_SerialDataRoutDemux/dout[14]} {u_SerialDataRoutDemux/dout[15]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
#set_property port_width 5 [get_debug_ports u_ila_0/probe3]
#connect_debug_port u_ila_0/probe3 [get_nets [list {u_SerialDataRoutDemux/next_state[0]} {u_SerialDataRoutDemux/next_state[1]} {u_SerialDataRoutDemux/next_state[2]} {u_SerialDataRoutDemux/next_state[3]} {u_SerialDataRoutDemux/next_state[4]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
#set_property port_width 20 [get_debug_ports u_ila_0/probe4]
#connect_debug_port u_ila_0/probe4 [get_nets [list {u_SerialDataRoutDemux/ped_dev[1][0]} {u_SerialDataRoutDemux/ped_dev[1][1]} {u_SerialDataRoutDemux/ped_dev[1][2]} {u_SerialDataRoutDemux/ped_dev[1][3]} {u_SerialDataRoutDemux/ped_dev[1][4]} {u_SerialDataRoutDemux/ped_dev[1][5]} {u_SerialDataRoutDemux/ped_dev[1][6]} {u_SerialDataRoutDemux/ped_dev[1][7]} {u_SerialDataRoutDemux/ped_dev[1][8]} {u_SerialDataRoutDemux/ped_dev[1][9]} {u_SerialDataRoutDemux/ped_dev[1][10]} {u_SerialDataRoutDemux/ped_dev[1][11]} {u_SerialDataRoutDemux/ped_dev[1][12]} {u_SerialDataRoutDemux/ped_dev[1][13]} {u_SerialDataRoutDemux/ped_dev[1][14]} {u_SerialDataRoutDemux/ped_dev[1][15]} {u_SerialDataRoutDemux/ped_dev[1][16]} {u_SerialDataRoutDemux/ped_dev[1][17]} {u_SerialDataRoutDemux/ped_dev[1][18]} {u_SerialDataRoutDemux/ped_dev[1][19]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
#set_property port_width 12 [get_debug_ports u_ila_0/probe5]
#connect_debug_port u_ila_0/probe5 [get_nets [list {u_SerialDataRoutDemux/ped_mean[1][0]} {u_SerialDataRoutDemux/ped_mean[1][1]} {u_SerialDataRoutDemux/ped_mean[1][2]} {u_SerialDataRoutDemux/ped_mean[1][3]} {u_SerialDataRoutDemux/ped_mean[1][4]} {u_SerialDataRoutDemux/ped_mean[1][5]} {u_SerialDataRoutDemux/ped_mean[1][6]} {u_SerialDataRoutDemux/ped_mean[1][7]} {u_SerialDataRoutDemux/ped_mean[1][8]} {u_SerialDataRoutDemux/ped_mean[1][9]} {u_SerialDataRoutDemux/ped_mean[1][10]} {u_SerialDataRoutDemux/ped_mean[1][11]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
#set_property port_width 12 [get_debug_ports u_ila_0/probe6]
#connect_debug_port u_ila_0/probe6 [get_nets [list {u_SerialDataRoutDemux/ped_mean_old[1][0]} {u_SerialDataRoutDemux/ped_mean_old[1][1]} {u_SerialDataRoutDemux/ped_mean_old[1][2]} {u_SerialDataRoutDemux/ped_mean_old[1][3]} {u_SerialDataRoutDemux/ped_mean_old[1][4]} {u_SerialDataRoutDemux/ped_mean_old[1][5]} {u_SerialDataRoutDemux/ped_mean_old[1][6]} {u_SerialDataRoutDemux/ped_mean_old[1][7]} {u_SerialDataRoutDemux/ped_mean_old[1][8]} {u_SerialDataRoutDemux/ped_mean_old[1][9]} {u_SerialDataRoutDemux/ped_mean_old[1][10]} {u_SerialDataRoutDemux/ped_mean_old[1][11]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
#set_property port_width 20 [get_debug_ports u_ila_0/probe7]
#connect_debug_port u_ila_0/probe7 [get_nets [list {u_SerialDataRoutDemux/pedarray_tmp2[1][0]} {u_SerialDataRoutDemux/pedarray_tmp2[1][1]} {u_SerialDataRoutDemux/pedarray_tmp2[1][2]} {u_SerialDataRoutDemux/pedarray_tmp2[1][3]} {u_SerialDataRoutDemux/pedarray_tmp2[1][4]} {u_SerialDataRoutDemux/pedarray_tmp2[1][5]} {u_SerialDataRoutDemux/pedarray_tmp2[1][6]} {u_SerialDataRoutDemux/pedarray_tmp2[1][7]} {u_SerialDataRoutDemux/pedarray_tmp2[1][8]} {u_SerialDataRoutDemux/pedarray_tmp2[1][9]} {u_SerialDataRoutDemux/pedarray_tmp2[1][10]} {u_SerialDataRoutDemux/pedarray_tmp2[1][11]} {u_SerialDataRoutDemux/pedarray_tmp2[1][12]} {u_SerialDataRoutDemux/pedarray_tmp2[1][13]} {u_SerialDataRoutDemux/pedarray_tmp2[1][14]} {u_SerialDataRoutDemux/pedarray_tmp2[1][15]} {u_SerialDataRoutDemux/pedarray_tmp2[1][16]} {u_SerialDataRoutDemux/pedarray_tmp2[1][17]} {u_SerialDataRoutDemux/pedarray_tmp2[1][18]} {u_SerialDataRoutDemux/pedarray_tmp2[1][19]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
#set_property port_width 11 [get_debug_ports u_ila_0/probe8]
#connect_debug_port u_ila_0/probe8 [get_nets [list {u_SerialDataRoutDemux/srout_bram_addr[0]} {u_SerialDataRoutDemux/srout_bram_addr[1]} {u_SerialDataRoutDemux/srout_bram_addr[2]} {u_SerialDataRoutDemux/srout_bram_addr[3]} {u_SerialDataRoutDemux/srout_bram_addr[4]} {u_SerialDataRoutDemux/srout_bram_addr[5]} {u_SerialDataRoutDemux/srout_bram_addr[6]} {u_SerialDataRoutDemux/srout_bram_addr[7]} {u_SerialDataRoutDemux/srout_bram_addr[8]} {u_SerialDataRoutDemux/srout_bram_addr[9]} {u_SerialDataRoutDemux/srout_bram_addr[10]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
#set_property port_width 11 [get_debug_ports u_ila_0/probe9]
#connect_debug_port u_ila_0/probe9 [get_nets [list {u_SerialDataRoutDemux/srout_bram2_addr[0]} {u_SerialDataRoutDemux/srout_bram2_addr[1]} {u_SerialDataRoutDemux/srout_bram2_addr[2]} {u_SerialDataRoutDemux/srout_bram2_addr[3]} {u_SerialDataRoutDemux/srout_bram2_addr[4]} {u_SerialDataRoutDemux/srout_bram2_addr[5]} {u_SerialDataRoutDemux/srout_bram2_addr[6]} {u_SerialDataRoutDemux/srout_bram2_addr[7]} {u_SerialDataRoutDemux/srout_bram2_addr[8]} {u_SerialDataRoutDemux/srout_bram2_addr[9]} {u_SerialDataRoutDemux/srout_bram2_addr[10]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
#set_property port_width 13 [get_debug_ports u_ila_0/probe10]
#connect_debug_port u_ila_0/probe10 [get_nets [list {u_SerialDataRoutDemux/srout_bram2_dout[7]} {u_SerialDataRoutDemux/srout_bram2_dout[8]} {u_SerialDataRoutDemux/srout_bram2_dout[9]} {u_SerialDataRoutDemux/srout_bram2_dout[10]} {u_SerialDataRoutDemux/srout_bram2_dout[11]} {u_SerialDataRoutDemux/srout_bram2_dout[12]} {u_SerialDataRoutDemux/srout_bram2_dout[13]} {u_SerialDataRoutDemux/srout_bram2_dout[14]} {u_SerialDataRoutDemux/srout_bram2_dout[15]} {u_SerialDataRoutDemux/srout_bram2_dout[16]} {u_SerialDataRoutDemux/srout_bram2_dout[17]} {u_SerialDataRoutDemux/srout_bram2_dout[18]} {u_SerialDataRoutDemux/srout_bram2_dout[19]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
#set_property port_width 20 [get_debug_ports u_ila_0/probe11]
#connect_debug_port u_ila_0/probe11 [get_nets [list {u_SerialDataRoutDemux/srout_bram_dout[0]} {u_SerialDataRoutDemux/srout_bram_dout[1]} {u_SerialDataRoutDemux/srout_bram_dout[2]} {u_SerialDataRoutDemux/srout_bram_dout[3]} {u_SerialDataRoutDemux/srout_bram_dout[4]} {u_SerialDataRoutDemux/srout_bram_dout[5]} {u_SerialDataRoutDemux/srout_bram_dout[6]} {u_SerialDataRoutDemux/srout_bram_dout[7]} {u_SerialDataRoutDemux/srout_bram_dout[8]} {u_SerialDataRoutDemux/srout_bram_dout[9]} {u_SerialDataRoutDemux/srout_bram_dout[10]} {u_SerialDataRoutDemux/srout_bram_dout[11]} {u_SerialDataRoutDemux/srout_bram_dout[12]} {u_SerialDataRoutDemux/srout_bram_dout[13]} {u_SerialDataRoutDemux/srout_bram_dout[14]} {u_SerialDataRoutDemux/srout_bram_dout[15]} {u_SerialDataRoutDemux/srout_bram_dout[16]} {u_SerialDataRoutDemux/srout_bram_dout[17]} {u_SerialDataRoutDemux/srout_bram_dout[18]} {u_SerialDataRoutDemux/srout_bram_dout[19]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
#set_property port_width 20 [get_debug_ports u_ila_0/probe12]
#connect_debug_port u_ila_0/probe12 [get_nets [list {u_SerialDataRoutDemux/pedarray_tmp[1][0]} {u_SerialDataRoutDemux/pedarray_tmp[1][1]} {u_SerialDataRoutDemux/pedarray_tmp[1][2]} {u_SerialDataRoutDemux/pedarray_tmp[1][3]} {u_SerialDataRoutDemux/pedarray_tmp[1][4]} {u_SerialDataRoutDemux/pedarray_tmp[1][5]} {u_SerialDataRoutDemux/pedarray_tmp[1][6]} {u_SerialDataRoutDemux/pedarray_tmp[1][7]} {u_SerialDataRoutDemux/pedarray_tmp[1][8]} {u_SerialDataRoutDemux/pedarray_tmp[1][9]} {u_SerialDataRoutDemux/pedarray_tmp[1][10]} {u_SerialDataRoutDemux/pedarray_tmp[1][11]} {u_SerialDataRoutDemux/pedarray_tmp[1][12]} {u_SerialDataRoutDemux/pedarray_tmp[1][13]} {u_SerialDataRoutDemux/pedarray_tmp[1][14]} {u_SerialDataRoutDemux/pedarray_tmp[1][15]} {u_SerialDataRoutDemux/pedarray_tmp[1][16]} {u_SerialDataRoutDemux/pedarray_tmp[1][17]} {u_SerialDataRoutDemux/pedarray_tmp[1][18]} {u_SerialDataRoutDemux/pedarray_tmp[1][19]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
#set_property port_width 20 [get_debug_ports u_ila_0/probe13]
#connect_debug_port u_ila_0/probe13 [get_nets [list {u_SerialDataRoutDemux/pedarray_tmp4[1][0]} {u_SerialDataRoutDemux/pedarray_tmp4[1][1]} {u_SerialDataRoutDemux/pedarray_tmp4[1][2]} {u_SerialDataRoutDemux/pedarray_tmp4[1][3]} {u_SerialDataRoutDemux/pedarray_tmp4[1][4]} {u_SerialDataRoutDemux/pedarray_tmp4[1][5]} {u_SerialDataRoutDemux/pedarray_tmp4[1][6]} {u_SerialDataRoutDemux/pedarray_tmp4[1][7]} {u_SerialDataRoutDemux/pedarray_tmp4[1][8]} {u_SerialDataRoutDemux/pedarray_tmp4[1][9]} {u_SerialDataRoutDemux/pedarray_tmp4[1][10]} {u_SerialDataRoutDemux/pedarray_tmp4[1][11]} {u_SerialDataRoutDemux/pedarray_tmp4[1][12]} {u_SerialDataRoutDemux/pedarray_tmp4[1][13]} {u_SerialDataRoutDemux/pedarray_tmp4[1][14]} {u_SerialDataRoutDemux/pedarray_tmp4[1][15]} {u_SerialDataRoutDemux/pedarray_tmp4[1][16]} {u_SerialDataRoutDemux/pedarray_tmp4[1][17]} {u_SerialDataRoutDemux/pedarray_tmp4[1][18]} {u_SerialDataRoutDemux/pedarray_tmp4[1][19]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
#set_property port_width 20 [get_debug_ports u_ila_0/probe14]
#connect_debug_port u_ila_0/probe14 [get_nets [list {u_SerialDataRoutDemux/pedarray_tmp3[1][0]} {u_SerialDataRoutDemux/pedarray_tmp3[1][1]} {u_SerialDataRoutDemux/pedarray_tmp3[1][2]} {u_SerialDataRoutDemux/pedarray_tmp3[1][3]} {u_SerialDataRoutDemux/pedarray_tmp3[1][4]} {u_SerialDataRoutDemux/pedarray_tmp3[1][5]} {u_SerialDataRoutDemux/pedarray_tmp3[1][6]} {u_SerialDataRoutDemux/pedarray_tmp3[1][7]} {u_SerialDataRoutDemux/pedarray_tmp3[1][8]} {u_SerialDataRoutDemux/pedarray_tmp3[1][9]} {u_SerialDataRoutDemux/pedarray_tmp3[1][10]} {u_SerialDataRoutDemux/pedarray_tmp3[1][11]} {u_SerialDataRoutDemux/pedarray_tmp3[1][12]} {u_SerialDataRoutDemux/pedarray_tmp3[1][13]} {u_SerialDataRoutDemux/pedarray_tmp3[1][14]} {u_SerialDataRoutDemux/pedarray_tmp3[1][15]} {u_SerialDataRoutDemux/pedarray_tmp3[1][16]} {u_SerialDataRoutDemux/pedarray_tmp3[1][17]} {u_SerialDataRoutDemux/pedarray_tmp3[1][18]} {u_SerialDataRoutDemux/pedarray_tmp3[1][19]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
#set_property port_width 20 [get_debug_ports u_ila_0/probe15]
#connect_debug_port u_ila_0/probe15 [get_nets [list {u_SerialDataRoutDemux/u_srout_bram/douta[0]} {u_SerialDataRoutDemux/u_srout_bram/douta[1]} {u_SerialDataRoutDemux/u_srout_bram/douta[2]} {u_SerialDataRoutDemux/u_srout_bram/douta[3]} {u_SerialDataRoutDemux/u_srout_bram/douta[4]} {u_SerialDataRoutDemux/u_srout_bram/douta[5]} {u_SerialDataRoutDemux/u_srout_bram/douta[6]} {u_SerialDataRoutDemux/u_srout_bram/douta[7]} {u_SerialDataRoutDemux/u_srout_bram/douta[8]} {u_SerialDataRoutDemux/u_srout_bram/douta[9]} {u_SerialDataRoutDemux/u_srout_bram/douta[10]} {u_SerialDataRoutDemux/u_srout_bram/douta[11]} {u_SerialDataRoutDemux/u_srout_bram/douta[12]} {u_SerialDataRoutDemux/u_srout_bram/douta[13]} {u_SerialDataRoutDemux/u_srout_bram/douta[14]} {u_SerialDataRoutDemux/u_srout_bram/douta[15]} {u_SerialDataRoutDemux/u_srout_bram/douta[16]} {u_SerialDataRoutDemux/u_srout_bram/douta[17]} {u_SerialDataRoutDemux/u_srout_bram/douta[18]} {u_SerialDataRoutDemux/u_srout_bram/douta[19]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
#set_property port_width 1 [get_debug_ports u_ila_0/probe16]
#connect_debug_port u_ila_0/probe16 [get_nets [list {u_SerialDataRoutDemux/u_srout_bram/wea[0]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
#set_property port_width 11 [get_debug_ports u_ila_0/probe17]
#connect_debug_port u_ila_0/probe17 [get_nets [list {u_SerialDataRoutDemux/u_srout_bram/addra[0]} {u_SerialDataRoutDemux/u_srout_bram/addra[1]} {u_SerialDataRoutDemux/u_srout_bram/addra[2]} {u_SerialDataRoutDemux/u_srout_bram/addra[3]} {u_SerialDataRoutDemux/u_srout_bram/addra[4]} {u_SerialDataRoutDemux/u_srout_bram/addra[5]} {u_SerialDataRoutDemux/u_srout_bram/addra[6]} {u_SerialDataRoutDemux/u_srout_bram/addra[7]} {u_SerialDataRoutDemux/u_srout_bram/addra[8]} {u_SerialDataRoutDemux/u_srout_bram/addra[9]} {u_SerialDataRoutDemux/u_srout_bram/addra[10]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
#set_property port_width 20 [get_debug_ports u_ila_0/probe18]
#connect_debug_port u_ila_0/probe18 [get_nets [list {u_SerialDataRoutDemux/u_srout_bram/dina[0]} {u_SerialDataRoutDemux/u_srout_bram/dina[1]} {u_SerialDataRoutDemux/u_srout_bram/dina[2]} {u_SerialDataRoutDemux/u_srout_bram/dina[3]} {u_SerialDataRoutDemux/u_srout_bram/dina[4]} {u_SerialDataRoutDemux/u_srout_bram/dina[5]} {u_SerialDataRoutDemux/u_srout_bram/dina[6]} {u_SerialDataRoutDemux/u_srout_bram/dina[7]} {u_SerialDataRoutDemux/u_srout_bram/dina[8]} {u_SerialDataRoutDemux/u_srout_bram/dina[9]} {u_SerialDataRoutDemux/u_srout_bram/dina[10]} {u_SerialDataRoutDemux/u_srout_bram/dina[11]} {u_SerialDataRoutDemux/u_srout_bram/dina[12]} {u_SerialDataRoutDemux/u_srout_bram/dina[13]} {u_SerialDataRoutDemux/u_srout_bram/dina[14]} {u_SerialDataRoutDemux/u_srout_bram/dina[15]} {u_SerialDataRoutDemux/u_srout_bram/dina[16]} {u_SerialDataRoutDemux/u_srout_bram/dina[17]} {u_SerialDataRoutDemux/u_srout_bram/dina[18]} {u_SerialDataRoutDemux/u_srout_bram/dina[19]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
#set_property port_width 1 [get_debug_ports u_ila_0/probe19]
#connect_debug_port u_ila_0/probe19 [get_nets [list {u_SerialDataRoutDemux/u_bram2/wea[0]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
#set_property port_width 11 [get_debug_ports u_ila_0/probe20]
#connect_debug_port u_ila_0/probe20 [get_nets [list {u_SerialDataRoutDemux/u_bram3/addra[0]} {u_SerialDataRoutDemux/u_bram3/addra[1]} {u_SerialDataRoutDemux/u_bram3/addra[2]} {u_SerialDataRoutDemux/u_bram3/addra[3]} {u_SerialDataRoutDemux/u_bram3/addra[4]} {u_SerialDataRoutDemux/u_bram3/addra[5]} {u_SerialDataRoutDemux/u_bram3/addra[6]} {u_SerialDataRoutDemux/u_bram3/addra[7]} {u_SerialDataRoutDemux/u_bram3/addra[8]} {u_SerialDataRoutDemux/u_bram3/addra[9]} {u_SerialDataRoutDemux/u_bram3/addra[10]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
#set_property port_width 20 [get_debug_ports u_ila_0/probe21]
#connect_debug_port u_ila_0/probe21 [get_nets [list {u_SerialDataRoutDemux/u_bram2/dina[0]} {u_SerialDataRoutDemux/u_bram2/dina[1]} {u_SerialDataRoutDemux/u_bram2/dina[2]} {u_SerialDataRoutDemux/u_bram2/dina[3]} {u_SerialDataRoutDemux/u_bram2/dina[4]} {u_SerialDataRoutDemux/u_bram2/dina[5]} {u_SerialDataRoutDemux/u_bram2/dina[6]} {u_SerialDataRoutDemux/u_bram2/dina[7]} {u_SerialDataRoutDemux/u_bram2/dina[8]} {u_SerialDataRoutDemux/u_bram2/dina[9]} {u_SerialDataRoutDemux/u_bram2/dina[10]} {u_SerialDataRoutDemux/u_bram2/dina[11]} {u_SerialDataRoutDemux/u_bram2/dina[12]} {u_SerialDataRoutDemux/u_bram2/dina[13]} {u_SerialDataRoutDemux/u_bram2/dina[14]} {u_SerialDataRoutDemux/u_bram2/dina[15]} {u_SerialDataRoutDemux/u_bram2/dina[16]} {u_SerialDataRoutDemux/u_bram2/dina[17]} {u_SerialDataRoutDemux/u_bram2/dina[18]} {u_SerialDataRoutDemux/u_bram2/dina[19]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
#set_property port_width 20 [get_debug_ports u_ila_0/probe22]
#connect_debug_port u_ila_0/probe22 [get_nets [list {u_SerialDataRoutDemux/u_bram2/douta[0]} {u_SerialDataRoutDemux/u_bram2/douta[1]} {u_SerialDataRoutDemux/u_bram2/douta[2]} {u_SerialDataRoutDemux/u_bram2/douta[3]} {u_SerialDataRoutDemux/u_bram2/douta[4]} {u_SerialDataRoutDemux/u_bram2/douta[5]} {u_SerialDataRoutDemux/u_bram2/douta[6]} {u_SerialDataRoutDemux/u_bram2/douta[7]} {u_SerialDataRoutDemux/u_bram2/douta[8]} {u_SerialDataRoutDemux/u_bram2/douta[9]} {u_SerialDataRoutDemux/u_bram2/douta[10]} {u_SerialDataRoutDemux/u_bram2/douta[11]} {u_SerialDataRoutDemux/u_bram2/douta[12]} {u_SerialDataRoutDemux/u_bram2/douta[13]} {u_SerialDataRoutDemux/u_bram2/douta[14]} {u_SerialDataRoutDemux/u_bram2/douta[15]} {u_SerialDataRoutDemux/u_bram2/douta[16]} {u_SerialDataRoutDemux/u_bram2/douta[17]} {u_SerialDataRoutDemux/u_bram2/douta[18]} {u_SerialDataRoutDemux/u_bram2/douta[19]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
#set_property port_width 11 [get_debug_ports u_ila_0/probe23]
#connect_debug_port u_ila_0/probe23 [get_nets [list {u_SerialDataRoutDemux/u_bram2/addra[0]} {u_SerialDataRoutDemux/u_bram2/addra[1]} {u_SerialDataRoutDemux/u_bram2/addra[2]} {u_SerialDataRoutDemux/u_bram2/addra[3]} {u_SerialDataRoutDemux/u_bram2/addra[4]} {u_SerialDataRoutDemux/u_bram2/addra[5]} {u_SerialDataRoutDemux/u_bram2/addra[6]} {u_SerialDataRoutDemux/u_bram2/addra[7]} {u_SerialDataRoutDemux/u_bram2/addra[8]} {u_SerialDataRoutDemux/u_bram2/addra[9]} {u_SerialDataRoutDemux/u_bram2/addra[10]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
#set_property port_width 1 [get_debug_ports u_ila_0/probe24]
#connect_debug_port u_ila_0/probe24 [get_nets [list {u_SerialDataRoutDemux/u_bram3/wea[0]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
#set_property port_width 12 [get_debug_ports u_ila_0/probe25]
#connect_debug_port u_ila_0/probe25 [get_nets [list {u_SerialDataRoutDemux/u_bram3/dina[0]} {u_SerialDataRoutDemux/u_bram3/dina[1]} {u_SerialDataRoutDemux/u_bram3/dina[2]} {u_SerialDataRoutDemux/u_bram3/dina[3]} {u_SerialDataRoutDemux/u_bram3/dina[4]} {u_SerialDataRoutDemux/u_bram3/dina[5]} {u_SerialDataRoutDemux/u_bram3/dina[6]} {u_SerialDataRoutDemux/u_bram3/dina[7]} {u_SerialDataRoutDemux/u_bram3/dina[8]} {u_SerialDataRoutDemux/u_bram3/dina[9]} {u_SerialDataRoutDemux/u_bram3/dina[10]} {u_SerialDataRoutDemux/u_bram3/dina[11]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
#set_property port_width 12 [get_debug_ports u_ila_0/probe26]
#connect_debug_port u_ila_0/probe26 [get_nets [list {u_SerialDataRoutDemux/u_bram3/douta[0]} {u_SerialDataRoutDemux/u_bram3/douta[1]} {u_SerialDataRoutDemux/u_bram3/douta[2]} {u_SerialDataRoutDemux/u_bram3/douta[3]} {u_SerialDataRoutDemux/u_bram3/douta[4]} {u_SerialDataRoutDemux/u_bram3/douta[5]} {u_SerialDataRoutDemux/u_bram3/douta[6]} {u_SerialDataRoutDemux/u_bram3/douta[7]} {u_SerialDataRoutDemux/u_bram3/douta[8]} {u_SerialDataRoutDemux/u_bram3/douta[9]} {u_SerialDataRoutDemux/u_bram3/douta[10]} {u_SerialDataRoutDemux/u_bram3/douta[11]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
#set_property port_width 1 [get_debug_ports u_ila_0/probe27]
#connect_debug_port u_ila_0/probe27 [get_nets [list u_SerialDataRoutDemux/dmx_allwin_done]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
#set_property port_width 1 [get_debug_ports u_ila_0/probe28]
#connect_debug_port u_ila_0/probe28 [get_nets [list u_SerialDataRoutDemux/internal_start]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
#set_property port_width 1 [get_debug_ports u_ila_0/probe29]
#connect_debug_port u_ila_0/probe29 [get_nets [list u_SerialDataRoutDemux/internal_start_srout]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
#set_property port_width 1 [get_debug_ports u_ila_0/probe30]
#connect_debug_port u_ila_0/probe30 [get_nets [list u_SerialDataRoutDemux/start_bram2tmp_xfer]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
#set_property port_width 1 [get_debug_ports u_ila_0/probe31]
#connect_debug_port u_ila_0/probe31 [get_nets [list u_SerialDataRoutDemux/start_tmp2bram_xfer]]
#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets CLK]

##################################################################################
###pedsub (16k)
#create_debug_core u_ila_0 ila
#set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
#set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
#set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
#set_property C_DATA_DEPTH 16384 [get_debug_cores u_ila_0]
#set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
#set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
#set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
#set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
#set_property port_width 1 [get_debug_ports u_ila_0/clk]
#connect_debug_port u_ila_0/clk [get_nets [list clkgen_1/inst/clk_out1]]
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
#set_property port_width 1 [get_debug_ports u_ila_0/probe0]
#connect_debug_port u_ila_0/probe0 [get_nets [list {SRAM_1/wea[0]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
#set_property port_width 20 [get_debug_ports u_ila_0/probe1]
#connect_debug_port u_ila_0/probe1 [get_nets [list {SRAM_1/addra[0]} {SRAM_1/addra[1]} {SRAM_1/addra[2]} {SRAM_1/addra[3]} {SRAM_1/addra[4]} {SRAM_1/addra[5]} {SRAM_1/addra[6]} {SRAM_1/addra[7]} {SRAM_1/addra[8]} {SRAM_1/addra[9]} {SRAM_1/addra[10]} {SRAM_1/addra[11]} {SRAM_1/addra[12]} {SRAM_1/addra[13]} {SRAM_1/addra[14]} {SRAM_1/addra[15]} {SRAM_1/addra[16]} {SRAM_1/addra[17]} {SRAM_1/addra[18]} {SRAM_1/addra[19]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
#set_property port_width 8 [get_debug_ports u_ila_0/probe2]
#connect_debug_port u_ila_0/probe2 [get_nets [list {SRAM_1/dina[0]} {SRAM_1/dina[1]} {SRAM_1/dina[2]} {SRAM_1/dina[3]} {SRAM_1/dina[4]} {SRAM_1/dina[5]} {SRAM_1/dina[6]} {SRAM_1/dina[7]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
#set_property port_width 8 [get_debug_ports u_ila_0/probe3]
#connect_debug_port u_ila_0/probe3 [get_nets [list {SRAM_1/douta[0]} {SRAM_1/douta[1]} {SRAM_1/douta[2]} {SRAM_1/douta[3]} {SRAM_1/douta[4]} {SRAM_1/douta[5]} {SRAM_1/douta[6]} {SRAM_1/douta[7]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
#set_property port_width 9 [get_debug_ports u_ila_0/probe4]
#connect_debug_port u_ila_0/probe4 [get_nets [list {u_wavepedsub/win_addr_start_i[0]} {u_wavepedsub/win_addr_start_i[1]} {u_wavepedsub/win_addr_start_i[2]} {u_wavepedsub/win_addr_start_i[3]} {u_wavepedsub/win_addr_start_i[4]} {u_wavepedsub/win_addr_start_i[5]} {u_wavepedsub/win_addr_start_i[6]} {u_wavepedsub/win_addr_start_i[7]} {u_wavepedsub/win_addr_start_i[8]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
#set_property port_width 13 [get_debug_ports u_ila_0/probe5]
#connect_debug_port u_ila_0/probe5 [get_nets [list {u_wavepedsub/sapedsub[0]} {u_wavepedsub/sapedsub[1]} {u_wavepedsub/sapedsub[2]} {u_wavepedsub/sapedsub[3]} {u_wavepedsub/sapedsub[4]} {u_wavepedsub/sapedsub[5]} {u_wavepedsub/sapedsub[6]} {u_wavepedsub/sapedsub[7]} {u_wavepedsub/sapedsub[8]} {u_wavepedsub/sapedsub[9]} {u_wavepedsub/sapedsub[10]} {u_wavepedsub/sapedsub[11]} {u_wavepedsub/sapedsub[12]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
#set_property port_width 5 [get_debug_ports u_ila_0/probe6]
#connect_debug_port u_ila_0/probe6 [get_nets [list {u_wavepedsub/ped_sa[0]} {u_wavepedsub/ped_sa[1]} {u_wavepedsub/ped_sa[2]} {u_wavepedsub/ped_sa[3]} {u_wavepedsub/ped_sa[4]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
#set_property port_width 32 [get_debug_ports u_ila_0/probe7]
#connect_debug_port u_ila_0/probe7 [get_nets [list {u_wavepedsub/pswfifo_d[0]} {u_wavepedsub/pswfifo_d[1]} {u_wavepedsub/pswfifo_d[2]} {u_wavepedsub/pswfifo_d[3]} {u_wavepedsub/pswfifo_d[4]} {u_wavepedsub/pswfifo_d[5]} {u_wavepedsub/pswfifo_d[6]} {u_wavepedsub/pswfifo_d[7]} {u_wavepedsub/pswfifo_d[8]} {u_wavepedsub/pswfifo_d[9]} {u_wavepedsub/pswfifo_d[10]} {u_wavepedsub/pswfifo_d[11]} {u_wavepedsub/pswfifo_d[12]} {u_wavepedsub/pswfifo_d[13]} {u_wavepedsub/pswfifo_d[14]} {u_wavepedsub/pswfifo_d[15]} {u_wavepedsub/pswfifo_d[16]} {u_wavepedsub/pswfifo_d[17]} {u_wavepedsub/pswfifo_d[18]} {u_wavepedsub/pswfifo_d[19]} {u_wavepedsub/pswfifo_d[20]} {u_wavepedsub/pswfifo_d[21]} {u_wavepedsub/pswfifo_d[22]} {u_wavepedsub/pswfifo_d[23]} {u_wavepedsub/pswfifo_d[24]} {u_wavepedsub/pswfifo_d[25]} {u_wavepedsub/pswfifo_d[26]} {u_wavepedsub/pswfifo_d[27]} {u_wavepedsub/pswfifo_d[28]} {u_wavepedsub/pswfifo_d[29]} {u_wavepedsub/pswfifo_d[30]} {u_wavepedsub/pswfifo_d[31]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
#set_property port_width 6 [get_debug_ports u_ila_0/probe8]
#connect_debug_port u_ila_0/probe8 [get_nets [list {u_wavepedsub/pedsub_st[0]} {u_wavepedsub/pedsub_st[1]} {u_wavepedsub/pedsub_st[2]} {u_wavepedsub/pedsub_st[3]} {u_wavepedsub/pedsub_st[4]} {u_wavepedsub/pedsub_st[5]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
#set_property port_width 9 [get_debug_ports u_ila_0/probe9]
#connect_debug_port u_ila_0/probe9 [get_nets [list {u_wavepedsub/ped_win[0]} {u_wavepedsub/ped_win[1]} {u_wavepedsub/ped_win[2]} {u_wavepedsub/ped_win[3]} {u_wavepedsub/ped_win[4]} {u_wavepedsub/ped_win[5]} {u_wavepedsub/ped_win[6]} {u_wavepedsub/ped_win[7]} {u_wavepedsub/ped_win[8]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
#set_property port_width 18 [get_debug_ports u_ila_0/probe10]
#connect_debug_port u_ila_0/probe10 [get_nets [list {u_wavepedsub/ped_sa_num[0]} {u_wavepedsub/ped_sa_num[1]} {u_wavepedsub/ped_sa_num[2]} {u_wavepedsub/ped_sa_num[3]} {u_wavepedsub/ped_sa_num[4]} {u_wavepedsub/ped_sa_num[5]} {u_wavepedsub/ped_sa_num[6]} {u_wavepedsub/ped_sa_num[7]} {u_wavepedsub/ped_sa_num[8]} {u_wavepedsub/ped_sa_num[9]} {u_wavepedsub/ped_sa_num[10]} {u_wavepedsub/ped_sa_num[11]} {u_wavepedsub/ped_sa_num[12]} {u_wavepedsub/ped_sa_num[13]} {u_wavepedsub/ped_sa_num[14]} {u_wavepedsub/ped_sa_num[15]} {u_wavepedsub/ped_sa_num[16]} {u_wavepedsub/ped_sa_num[17]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
#set_property port_width 3 [get_debug_ports u_ila_0/probe11]
#connect_debug_port u_ila_0/probe11 [get_nets [list {u_wavepedsub/ped_sa6[0]} {u_wavepedsub/ped_sa6[1]} {u_wavepedsub/ped_sa6[2]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
#set_property port_width 2 [get_debug_ports u_ila_0/probe12]
#connect_debug_port u_ila_0/probe12 [get_nets [list {u_wavepedsub/trigin_i[0]} {u_wavepedsub/trigin_i[1]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
#set_property port_width 11 [get_debug_ports u_ila_0/probe13]
#connect_debug_port u_ila_0/probe13 [get_nets [list {u_wavepedsub/bram_addrb[0]} {u_wavepedsub/bram_addrb[1]} {u_wavepedsub/bram_addrb[2]} {u_wavepedsub/bram_addrb[3]} {u_wavepedsub/bram_addrb[4]} {u_wavepedsub/bram_addrb[5]} {u_wavepedsub/bram_addrb[6]} {u_wavepedsub/bram_addrb[7]} {u_wavepedsub/bram_addrb[8]} {u_wavepedsub/bram_addrb[9]} {u_wavepedsub/bram_addrb[10]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
#set_property port_width 12 [get_debug_ports u_ila_0/probe14]
#connect_debug_port u_ila_0/probe14 [get_nets [list {u_wavepedsub/bram_doutb[0]} {u_wavepedsub/bram_doutb[1]} {u_wavepedsub/bram_doutb[2]} {u_wavepedsub/bram_doutb[3]} {u_wavepedsub/bram_doutb[4]} {u_wavepedsub/bram_doutb[5]} {u_wavepedsub/bram_doutb[6]} {u_wavepedsub/bram_doutb[7]} {u_wavepedsub/bram_doutb[8]} {u_wavepedsub/bram_doutb[9]} {u_wavepedsub/bram_doutb[10]} {u_wavepedsub/bram_doutb[11]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
#set_property port_width 3 [get_debug_ports u_ila_0/probe15]
#connect_debug_port u_ila_0/probe15 [get_nets [list {u_wavepedsub/mode[0]} {u_wavepedsub/mode[1]} {u_wavepedsub/mode[2]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
#set_property port_width 4 [get_debug_ports u_ila_0/probe16]
#connect_debug_port u_ila_0/probe16 [get_nets [list {u_wavepedsub/next_ped_st[0]} {u_wavepedsub/next_ped_st[1]} {u_wavepedsub/next_ped_st[2]} {u_wavepedsub/next_ped_st[3]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
#set_property port_width 2 [get_debug_ports u_ila_0/probe17]
#connect_debug_port u_ila_0/probe17 [get_nets [list {u_wavepedsub/count[0]} {u_wavepedsub/count[1]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
#set_property port_width 4 [get_debug_ports u_ila_0/probe18]
#connect_debug_port u_ila_0/probe18 [get_nets [list {u_wavepedsub/ped_ch[0]} {u_wavepedsub/ped_ch[1]} {u_wavepedsub/ped_ch[2]} {u_wavepedsub/ped_ch[3]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
#set_property port_width 2 [get_debug_ports u_ila_0/probe19]
#connect_debug_port u_ila_0/probe19 [get_nets [list {u_wavepedsub/ped_sub_start[0]} {u_wavepedsub/ped_sub_start[1]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
#set_property port_width 12 [get_debug_ports u_ila_0/probe20]
#connect_debug_port u_ila_0/probe20 [get_nets [list {u_wavepedsub/Inst_PedRAMaccess/rval1[0]} {u_wavepedsub/Inst_PedRAMaccess/rval1[1]} {u_wavepedsub/Inst_PedRAMaccess/rval1[2]} {u_wavepedsub/Inst_PedRAMaccess/rval1[3]} {u_wavepedsub/Inst_PedRAMaccess/rval1[4]} {u_wavepedsub/Inst_PedRAMaccess/rval1[5]} {u_wavepedsub/Inst_PedRAMaccess/rval1[6]} {u_wavepedsub/Inst_PedRAMaccess/rval1[7]} {u_wavepedsub/Inst_PedRAMaccess/rval1[8]} {u_wavepedsub/Inst_PedRAMaccess/rval1[9]} {u_wavepedsub/Inst_PedRAMaccess/rval1[10]} {u_wavepedsub/Inst_PedRAMaccess/rval1[11]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
#set_property port_width 12 [get_debug_ports u_ila_0/probe21]
#connect_debug_port u_ila_0/probe21 [get_nets [list {u_wavepedsub/Inst_PedRAMaccess/rval0[0]} {u_wavepedsub/Inst_PedRAMaccess/rval0[1]} {u_wavepedsub/Inst_PedRAMaccess/rval0[2]} {u_wavepedsub/Inst_PedRAMaccess/rval0[3]} {u_wavepedsub/Inst_PedRAMaccess/rval0[4]} {u_wavepedsub/Inst_PedRAMaccess/rval0[5]} {u_wavepedsub/Inst_PedRAMaccess/rval0[6]} {u_wavepedsub/Inst_PedRAMaccess/rval0[7]} {u_wavepedsub/Inst_PedRAMaccess/rval0[8]} {u_wavepedsub/Inst_PedRAMaccess/rval0[9]} {u_wavepedsub/Inst_PedRAMaccess/rval0[10]} {u_wavepedsub/Inst_PedRAMaccess/rval0[11]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
#set_property port_width 18 [get_debug_ports u_ila_0/probe22]
#connect_debug_port u_ila_0/probe22 [get_nets [list {u_wavepedsub/Inst_PedRAMaccess/addr[0]} {u_wavepedsub/Inst_PedRAMaccess/addr[1]} {u_wavepedsub/Inst_PedRAMaccess/addr[2]} {u_wavepedsub/Inst_PedRAMaccess/addr[3]} {u_wavepedsub/Inst_PedRAMaccess/addr[4]} {u_wavepedsub/Inst_PedRAMaccess/addr[5]} {u_wavepedsub/Inst_PedRAMaccess/addr[6]} {u_wavepedsub/Inst_PedRAMaccess/addr[7]} {u_wavepedsub/Inst_PedRAMaccess/addr[8]} {u_wavepedsub/Inst_PedRAMaccess/addr[9]} {u_wavepedsub/Inst_PedRAMaccess/addr[10]} {u_wavepedsub/Inst_PedRAMaccess/addr[11]} {u_wavepedsub/Inst_PedRAMaccess/addr[12]} {u_wavepedsub/Inst_PedRAMaccess/addr[13]} {u_wavepedsub/Inst_PedRAMaccess/addr[14]} {u_wavepedsub/Inst_PedRAMaccess/addr[15]} {u_wavepedsub/Inst_PedRAMaccess/addr[16]} {u_wavepedsub/Inst_PedRAMaccess/addr[17]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
#set_property port_width 2 [get_debug_ports u_ila_0/probe23]
#connect_debug_port u_ila_0/probe23 [get_nets [list {u_SerialDataRoutDemux/restart_i[0]} {u_SerialDataRoutDemux/restart_i[1]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
#set_property port_width 2 [get_debug_ports u_ila_0/probe24]
#connect_debug_port u_ila_0/probe24 [get_nets [list {u_SerialDataRoutDemux/restart_peds_i[0]} {u_SerialDataRoutDemux/restart_peds_i[1]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
#set_property port_width 5 [get_debug_ports u_ila_0/probe25]
#connect_debug_port u_ila_0/probe25 [get_nets [list {u_SerialDataRoutDemux/next_state[0]} {u_SerialDataRoutDemux/next_state[1]} {u_SerialDataRoutDemux/next_state[2]} {u_SerialDataRoutDemux/next_state[3]} {u_SerialDataRoutDemux/next_state[4]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
#set_property port_width 1 [get_debug_ports u_ila_0/probe26]
#connect_debug_port u_ila_0/probe26 [get_nets [list {u_wavepedsub/u_pedarr/wea[0]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
#set_property port_width 11 [get_debug_ports u_ila_0/probe27]
#connect_debug_port u_ila_0/probe27 [get_nets [list {u_wavepedsub/u_pedarr/addra[0]} {u_wavepedsub/u_pedarr/addra[1]} {u_wavepedsub/u_pedarr/addra[2]} {u_wavepedsub/u_pedarr/addra[3]} {u_wavepedsub/u_pedarr/addra[4]} {u_wavepedsub/u_pedarr/addra[5]} {u_wavepedsub/u_pedarr/addra[6]} {u_wavepedsub/u_pedarr/addra[7]} {u_wavepedsub/u_pedarr/addra[8]} {u_wavepedsub/u_pedarr/addra[9]} {u_wavepedsub/u_pedarr/addra[10]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
#set_property port_width 12 [get_debug_ports u_ila_0/probe28]
#connect_debug_port u_ila_0/probe28 [get_nets [list {u_wavepedsub/u_pedarr/dina[0]} {u_wavepedsub/u_pedarr/dina[1]} {u_wavepedsub/u_pedarr/dina[2]} {u_wavepedsub/u_pedarr/dina[3]} {u_wavepedsub/u_pedarr/dina[4]} {u_wavepedsub/u_pedarr/dina[5]} {u_wavepedsub/u_pedarr/dina[6]} {u_wavepedsub/u_pedarr/dina[7]} {u_wavepedsub/u_pedarr/dina[8]} {u_wavepedsub/u_pedarr/dina[9]} {u_wavepedsub/u_pedarr/dina[10]} {u_wavepedsub/u_pedarr/dina[11]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
#set_property port_width 12 [get_debug_ports u_ila_0/probe29]
#connect_debug_port u_ila_0/probe29 [get_nets [list {u_wavepedsub/u_pedarr/doutb[0]} {u_wavepedsub/u_pedarr/doutb[1]} {u_wavepedsub/u_pedarr/doutb[2]} {u_wavepedsub/u_pedarr/doutb[3]} {u_wavepedsub/u_pedarr/doutb[4]} {u_wavepedsub/u_pedarr/doutb[5]} {u_wavepedsub/u_pedarr/doutb[6]} {u_wavepedsub/u_pedarr/doutb[7]} {u_wavepedsub/u_pedarr/doutb[8]} {u_wavepedsub/u_pedarr/doutb[9]} {u_wavepedsub/u_pedarr/doutb[10]} {u_wavepedsub/u_pedarr/doutb[11]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
#set_property port_width 11 [get_debug_ports u_ila_0/probe30]
#connect_debug_port u_ila_0/probe30 [get_nets [list {u_wavepedsub/u_pedarr/addrb[0]} {u_wavepedsub/u_pedarr/addrb[1]} {u_wavepedsub/u_pedarr/addrb[2]} {u_wavepedsub/u_pedarr/addrb[3]} {u_wavepedsub/u_pedarr/addrb[4]} {u_wavepedsub/u_pedarr/addrb[5]} {u_wavepedsub/u_pedarr/addrb[6]} {u_wavepedsub/u_pedarr/addrb[7]} {u_wavepedsub/u_pedarr/addrb[8]} {u_wavepedsub/u_pedarr/addrb[9]} {u_wavepedsub/u_pedarr/addrb[10]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
#set_property port_width 1 [get_debug_ports u_ila_0/probe31]
#connect_debug_port u_ila_0/probe31 [get_nets [list u_SerialDataRoutDemux/calc_peds_en]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
#set_property port_width 1 [get_debug_ports u_ila_0/probe32]
#connect_debug_port u_ila_0/probe32 [get_nets [list u_wavepedsub/dmx_allwin_done]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
#set_property port_width 1 [get_debug_ports u_ila_0/probe33]
#connect_debug_port u_ila_0/probe33 [get_nets [list u_wavepedsub/enable_i]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
#set_property port_width 1 [get_debug_ports u_ila_0/probe34]
#connect_debug_port u_ila_0/probe34 [get_nets [list internal_PEDMAN_calc_peds_en]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
#set_property port_width 1 [get_debug_ports u_ila_0/probe35]
#connect_debug_port u_ila_0/probe35 [get_nets [list internal_READCTRL_srout_restart]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
#set_property port_width 1 [get_debug_ports u_ila_0/probe36]
#connect_debug_port u_ila_0/probe36 [get_nets [list internal_READCTRL_srout_start]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
#set_property port_width 1 [get_debug_ports u_ila_0/probe37]
#connect_debug_port u_ila_0/probe37 [get_nets [list u_wavepedsub/ped_sub_fetch_done]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
#set_property port_width 1 [get_debug_ports u_ila_0/probe38]
#connect_debug_port u_ila_0/probe38 [get_nets [list u_SerialDataRoutDemux/restart]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
#set_property port_width 1 [get_debug_ports u_ila_0/probe39]
#connect_debug_port u_ila_0/probe39 [get_nets [list u_wavepedsub/Inst_PedRAMaccess/update]]
#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets CLK]









create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 16384 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clkgen_1/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 16 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {u_WaveformPedcalcDSP/ped_sa_num[0]} {u_WaveformPedcalcDSP/ped_sa_num[1]} {u_WaveformPedcalcDSP/ped_sa_num[2]} {u_WaveformPedcalcDSP/ped_sa_num[3]} {u_WaveformPedcalcDSP/ped_sa_num[4]} {u_WaveformPedcalcDSP/ped_sa_num[5]} {u_WaveformPedcalcDSP/ped_sa_num[6]} {u_WaveformPedcalcDSP/ped_sa_num[7]} {u_WaveformPedcalcDSP/ped_sa_num[8]} {u_WaveformPedcalcDSP/ped_sa_num[9]} {u_WaveformPedcalcDSP/ped_sa_num[10]} {u_WaveformPedcalcDSP/ped_sa_num[11]} {u_WaveformPedcalcDSP/ped_sa_num[12]} {u_WaveformPedcalcDSP/ped_sa_num[19]} {u_WaveformPedcalcDSP/ped_sa_num[20]} {u_WaveformPedcalcDSP/ped_sa_num[21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 17 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {u_WaveformPedcalcDSP/wval0temp[0]} {u_WaveformPedcalcDSP/wval0temp[1]} {u_WaveformPedcalcDSP/wval0temp[2]} {u_WaveformPedcalcDSP/wval0temp[3]} {u_WaveformPedcalcDSP/wval0temp[4]} {u_WaveformPedcalcDSP/wval0temp[5]} {u_WaveformPedcalcDSP/wval0temp[6]} {u_WaveformPedcalcDSP/wval0temp[7]} {u_WaveformPedcalcDSP/wval0temp[8]} {u_WaveformPedcalcDSP/wval0temp[9]} {u_WaveformPedcalcDSP/wval0temp[10]} {u_WaveformPedcalcDSP/wval0temp[11]} {u_WaveformPedcalcDSP/wval0temp[12]} {u_WaveformPedcalcDSP/wval0temp[13]} {u_WaveformPedcalcDSP/wval0temp[14]} {u_WaveformPedcalcDSP/wval0temp[15]} {u_WaveformPedcalcDSP/wval0temp[16]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 12 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {u_WaveformPedcalcDSP/ped_sa_wval0[0]} {u_WaveformPedcalcDSP/ped_sa_wval0[1]} {u_WaveformPedcalcDSP/ped_sa_wval0[2]} {u_WaveformPedcalcDSP/ped_sa_wval0[3]} {u_WaveformPedcalcDSP/ped_sa_wval0[4]} {u_WaveformPedcalcDSP/ped_sa_wval0[5]} {u_WaveformPedcalcDSP/ped_sa_wval0[6]} {u_WaveformPedcalcDSP/ped_sa_wval0[7]} {u_WaveformPedcalcDSP/ped_sa_wval0[8]} {u_WaveformPedcalcDSP/ped_sa_wval0[9]} {u_WaveformPedcalcDSP/ped_sa_wval0[10]} {u_WaveformPedcalcDSP/ped_sa_wval0[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 2 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {u_WaveformPedcalcDSP/ped_win[0]} {u_WaveformPedcalcDSP/ped_win[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 9 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {u_WaveformPedcalcDSP/win_addr_start_i[0]} {u_WaveformPedcalcDSP/win_addr_start_i[1]} {u_WaveformPedcalcDSP/win_addr_start_i[2]} {u_WaveformPedcalcDSP/win_addr_start_i[3]} {u_WaveformPedcalcDSP/win_addr_start_i[4]} {u_WaveformPedcalcDSP/win_addr_start_i[5]} {u_WaveformPedcalcDSP/win_addr_start_i[6]} {u_WaveformPedcalcDSP/win_addr_start_i[7]} {u_WaveformPedcalcDSP/win_addr_start_i[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 12 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {u_WaveformPedcalcDSP/ped_sa_wval1[0]} {u_WaveformPedcalcDSP/ped_sa_wval1[1]} {u_WaveformPedcalcDSP/ped_sa_wval1[2]} {u_WaveformPedcalcDSP/ped_sa_wval1[3]} {u_WaveformPedcalcDSP/ped_sa_wval1[4]} {u_WaveformPedcalcDSP/ped_sa_wval1[5]} {u_WaveformPedcalcDSP/ped_sa_wval1[6]} {u_WaveformPedcalcDSP/ped_sa_wval1[7]} {u_WaveformPedcalcDSP/ped_sa_wval1[8]} {u_WaveformPedcalcDSP/ped_sa_wval1[9]} {u_WaveformPedcalcDSP/ped_sa_wval1[10]} {u_WaveformPedcalcDSP/ped_sa_wval1[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 17 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {u_WaveformPedcalcDSP/wval1temp[0]} {u_WaveformPedcalcDSP/wval1temp[1]} {u_WaveformPedcalcDSP/wval1temp[2]} {u_WaveformPedcalcDSP/wval1temp[3]} {u_WaveformPedcalcDSP/wval1temp[4]} {u_WaveformPedcalcDSP/wval1temp[5]} {u_WaveformPedcalcDSP/wval1temp[6]} {u_WaveformPedcalcDSP/wval1temp[7]} {u_WaveformPedcalcDSP/wval1temp[8]} {u_WaveformPedcalcDSP/wval1temp[9]} {u_WaveformPedcalcDSP/wval1temp[10]} {u_WaveformPedcalcDSP/wval1temp[11]} {u_WaveformPedcalcDSP/wval1temp[12]} {u_WaveformPedcalcDSP/wval1temp[13]} {u_WaveformPedcalcDSP/wval1temp[14]} {u_WaveformPedcalcDSP/wval1temp[15]} {u_WaveformPedcalcDSP/wval1temp[16]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 4 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {u_WaveformPedcalcDSP/ped_ch[0]} {u_WaveformPedcalcDSP/ped_ch[1]} {u_WaveformPedcalcDSP/ped_ch[2]} {u_WaveformPedcalcDSP/ped_ch[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 6 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {u_WaveformPedcalcDSP/dmx_st[0]} {u_WaveformPedcalcDSP/dmx_st[1]} {u_WaveformPedcalcDSP/dmx_st[2]} {u_WaveformPedcalcDSP/dmx_st[3]} {u_WaveformPedcalcDSP/dmx_st[4]} {u_WaveformPedcalcDSP/dmx_st[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 5 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {u_WaveformPedcalcDSP/count[0]} {u_WaveformPedcalcDSP/count[1]} {u_WaveformPedcalcDSP/count[2]} {u_WaveformPedcalcDSP/count[3]} {u_WaveformPedcalcDSP/count[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 20 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {u_SerialDataRoutDemux/u_bram2/doutb[0]} {u_SerialDataRoutDemux/u_bram2/doutb[1]} {u_SerialDataRoutDemux/u_bram2/doutb[2]} {u_SerialDataRoutDemux/u_bram2/doutb[3]} {u_SerialDataRoutDemux/u_bram2/doutb[4]} {u_SerialDataRoutDemux/u_bram2/doutb[5]} {u_SerialDataRoutDemux/u_bram2/doutb[6]} {u_SerialDataRoutDemux/u_bram2/doutb[7]} {u_SerialDataRoutDemux/u_bram2/doutb[8]} {u_SerialDataRoutDemux/u_bram2/doutb[9]} {u_SerialDataRoutDemux/u_bram2/doutb[10]} {u_SerialDataRoutDemux/u_bram2/doutb[11]} {u_SerialDataRoutDemux/u_bram2/doutb[12]} {u_SerialDataRoutDemux/u_bram2/doutb[13]} {u_SerialDataRoutDemux/u_bram2/doutb[14]} {u_SerialDataRoutDemux/u_bram2/doutb[15]} {u_SerialDataRoutDemux/u_bram2/doutb[16]} {u_SerialDataRoutDemux/u_bram2/doutb[17]} {u_SerialDataRoutDemux/u_bram2/doutb[18]} {u_SerialDataRoutDemux/u_bram2/doutb[19]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 11 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {u_SerialDataRoutDemux/u_bram2/addrb[0]} {u_SerialDataRoutDemux/u_bram2/addrb[1]} {u_SerialDataRoutDemux/u_bram2/addrb[2]} {u_SerialDataRoutDemux/u_bram2/addrb[3]} {u_SerialDataRoutDemux/u_bram2/addrb[4]} {u_SerialDataRoutDemux/u_bram2/addrb[5]} {u_SerialDataRoutDemux/u_bram2/addrb[6]} {u_SerialDataRoutDemux/u_bram2/addrb[7]} {u_SerialDataRoutDemux/u_bram2/addrb[8]} {u_SerialDataRoutDemux/u_bram2/addrb[9]} {u_SerialDataRoutDemux/u_bram2/addrb[10]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 20 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {SRAM_1/addra[0]} {SRAM_1/addra[1]} {SRAM_1/addra[2]} {SRAM_1/addra[3]} {SRAM_1/addra[4]} {SRAM_1/addra[5]} {SRAM_1/addra[6]} {SRAM_1/addra[7]} {SRAM_1/addra[8]} {SRAM_1/addra[9]} {SRAM_1/addra[10]} {SRAM_1/addra[11]} {SRAM_1/addra[12]} {SRAM_1/addra[13]} {SRAM_1/addra[14]} {SRAM_1/addra[15]} {SRAM_1/addra[16]} {SRAM_1/addra[17]} {SRAM_1/addra[18]} {SRAM_1/addra[19]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 8 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {SRAM_1/dina[0]} {SRAM_1/dina[1]} {SRAM_1/dina[2]} {SRAM_1/dina[3]} {SRAM_1/dina[4]} {SRAM_1/dina[5]} {SRAM_1/dina[6]} {SRAM_1/dina[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 8 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {SRAM_1/douta[0]} {SRAM_1/douta[1]} {SRAM_1/douta[2]} {SRAM_1/douta[3]} {SRAM_1/douta[4]} {SRAM_1/douta[5]} {SRAM_1/douta[6]} {SRAM_1/douta[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 5 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {u_wavepedsub/count[0]} {u_wavepedsub/count[1]} {u_wavepedsub/count[2]} {u_wavepedsub/count[3]} {u_wavepedsub/count[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 5 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {u_wavepedsub/next_ped_st[0]} {u_wavepedsub/next_ped_st[1]} {u_wavepedsub/next_ped_st[2]} {u_wavepedsub/next_ped_st[3]} {u_wavepedsub/next_ped_st[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 4 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {u_wavepedsub/ped_ch[0]} {u_wavepedsub/ped_ch[1]} {u_wavepedsub/ped_ch[2]} {u_wavepedsub/ped_ch[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 5 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {u_wavepedsub/ped_sa[0]} {u_wavepedsub/ped_sa[1]} {u_wavepedsub/ped_sa[2]} {u_wavepedsub/ped_sa[3]} {u_wavepedsub/ped_sa[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 22 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {u_wavepedsub/ped_sa_num[0]} {u_wavepedsub/ped_sa_num[1]} {u_wavepedsub/ped_sa_num[2]} {u_wavepedsub/ped_sa_num[3]} {u_wavepedsub/ped_sa_num[4]} {u_wavepedsub/ped_sa_num[5]} {u_wavepedsub/ped_sa_num[6]} {u_wavepedsub/ped_sa_num[7]} {u_wavepedsub/ped_sa_num[8]} {u_wavepedsub/ped_sa_num[9]} {u_wavepedsub/ped_sa_num[10]} {u_wavepedsub/ped_sa_num[11]} {u_wavepedsub/ped_sa_num[12]} {u_wavepedsub/ped_sa_num[13]} {u_wavepedsub/ped_sa_num[14]} {u_wavepedsub/ped_sa_num[15]} {u_wavepedsub/ped_sa_num[16]} {u_wavepedsub/ped_sa_num[17]} {u_wavepedsub/ped_sa_num[18]} {u_wavepedsub/ped_sa_num[19]} {u_wavepedsub/ped_sa_num[20]} {u_wavepedsub/ped_sa_num[21]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 2 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {u_wavepedsub/ped_win[0]} {u_wavepedsub/ped_win[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 12 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {u_wavepedsub/rval0[0]} {u_wavepedsub/rval0[1]} {u_wavepedsub/rval0[2]} {u_wavepedsub/rval0[3]} {u_wavepedsub/rval0[4]} {u_wavepedsub/rval0[5]} {u_wavepedsub/rval0[6]} {u_wavepedsub/rval0[7]} {u_wavepedsub/rval0[8]} {u_wavepedsub/rval0[9]} {u_wavepedsub/rval0[10]} {u_wavepedsub/rval0[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 12 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {u_wavepedsub/rval1[0]} {u_wavepedsub/rval1[1]} {u_wavepedsub/rval1[2]} {u_wavepedsub/rval1[3]} {u_wavepedsub/rval1[4]} {u_wavepedsub/rval1[5]} {u_wavepedsub/rval1[6]} {u_wavepedsub/rval1[7]} {u_wavepedsub/rval1[8]} {u_wavepedsub/rval1[9]} {u_wavepedsub/rval1[10]} {u_wavepedsub/rval1[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 9 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {u_wavepedsub/win_addr_start_i[0]} {u_wavepedsub/win_addr_start_i[1]} {u_wavepedsub/win_addr_start_i[2]} {u_wavepedsub/win_addr_start_i[3]} {u_wavepedsub/win_addr_start_i[4]} {u_wavepedsub/win_addr_start_i[5]} {u_wavepedsub/win_addr_start_i[6]} {u_wavepedsub/win_addr_start_i[7]} {u_wavepedsub/win_addr_start_i[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 12 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {u_SerialDataRoutDemux/dmx_wav[1][0]} {u_SerialDataRoutDemux/dmx_wav[1][1]} {u_SerialDataRoutDemux/dmx_wav[1][2]} {u_SerialDataRoutDemux/dmx_wav[1][3]} {u_SerialDataRoutDemux/dmx_wav[1][4]} {u_SerialDataRoutDemux/dmx_wav[1][5]} {u_SerialDataRoutDemux/dmx_wav[1][6]} {u_SerialDataRoutDemux/dmx_wav[1][7]} {u_SerialDataRoutDemux/dmx_wav[1][8]} {u_SerialDataRoutDemux/dmx_wav[1][9]} {u_SerialDataRoutDemux/dmx_wav[1][10]} {u_SerialDataRoutDemux/dmx_wav[1][11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {u_wavepedsub/u_pedarr/wea[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 12 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {u_wavepedsub/u_pedarr/dina[0]} {u_wavepedsub/u_pedarr/dina[1]} {u_wavepedsub/u_pedarr/dina[2]} {u_wavepedsub/u_pedarr/dina[3]} {u_wavepedsub/u_pedarr/dina[4]} {u_wavepedsub/u_pedarr/dina[5]} {u_wavepedsub/u_pedarr/dina[6]} {u_wavepedsub/u_pedarr/dina[7]} {u_wavepedsub/u_pedarr/dina[8]} {u_wavepedsub/u_pedarr/dina[9]} {u_wavepedsub/u_pedarr/dina[10]} {u_wavepedsub/u_pedarr/dina[11]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 20 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {u_SerialDataRoutDemux/u_srout_bram/doutb[0]} {u_SerialDataRoutDemux/u_srout_bram/doutb[1]} {u_SerialDataRoutDemux/u_srout_bram/doutb[2]} {u_SerialDataRoutDemux/u_srout_bram/doutb[3]} {u_SerialDataRoutDemux/u_srout_bram/doutb[4]} {u_SerialDataRoutDemux/u_srout_bram/doutb[5]} {u_SerialDataRoutDemux/u_srout_bram/doutb[6]} {u_SerialDataRoutDemux/u_srout_bram/doutb[7]} {u_SerialDataRoutDemux/u_srout_bram/doutb[8]} {u_SerialDataRoutDemux/u_srout_bram/doutb[9]} {u_SerialDataRoutDemux/u_srout_bram/doutb[10]} {u_SerialDataRoutDemux/u_srout_bram/doutb[11]} {u_SerialDataRoutDemux/u_srout_bram/doutb[12]} {u_SerialDataRoutDemux/u_srout_bram/doutb[13]} {u_SerialDataRoutDemux/u_srout_bram/doutb[14]} {u_SerialDataRoutDemux/u_srout_bram/doutb[15]} {u_SerialDataRoutDemux/u_srout_bram/doutb[16]} {u_SerialDataRoutDemux/u_srout_bram/doutb[17]} {u_SerialDataRoutDemux/u_srout_bram/doutb[18]} {u_SerialDataRoutDemux/u_srout_bram/doutb[19]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 11 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {u_wavepedsub/u_pedarr/addra[0]} {u_wavepedsub/u_pedarr/addra[1]} {u_wavepedsub/u_pedarr/addra[2]} {u_wavepedsub/u_pedarr/addra[3]} {u_wavepedsub/u_pedarr/addra[4]} {u_wavepedsub/u_pedarr/addra[5]} {u_wavepedsub/u_pedarr/addra[6]} {u_wavepedsub/u_pedarr/addra[7]} {u_wavepedsub/u_pedarr/addra[8]} {u_wavepedsub/u_pedarr/addra[9]} {u_wavepedsub/u_pedarr/addra[10]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 11 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {u_SerialDataRoutDemux/u_srout_bram/addrb[0]} {u_SerialDataRoutDemux/u_srout_bram/addrb[1]} {u_SerialDataRoutDemux/u_srout_bram/addrb[2]} {u_SerialDataRoutDemux/u_srout_bram/addrb[3]} {u_SerialDataRoutDemux/u_srout_bram/addrb[4]} {u_SerialDataRoutDemux/u_srout_bram/addrb[5]} {u_SerialDataRoutDemux/u_srout_bram/addrb[6]} {u_SerialDataRoutDemux/u_srout_bram/addrb[7]} {u_SerialDataRoutDemux/u_srout_bram/addrb[8]} {u_SerialDataRoutDemux/u_srout_bram/addrb[9]} {u_SerialDataRoutDemux/u_srout_bram/addrb[10]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 1 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list u_WaveformPedcalcDSP/update]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 1 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list u_wavepedsub/update]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets CLK]
