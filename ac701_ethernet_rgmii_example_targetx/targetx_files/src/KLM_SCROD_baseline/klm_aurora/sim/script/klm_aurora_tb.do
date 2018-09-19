cd C:\Users\bkunkler\Documents\CEEM\repos\Belle-II\firmware\KLM_SCROD\klm_aurora\sim
vlib klm_aurora_tb "./library/klm_aurora_lib.lib"

vcom -work klm_aurora_tb ../source/aurora_tile.vhd;
vcom -work klm_aurora_tb ../source/transceiver_wrapper.vhd;
vcom -work klm_aurora_tb ../source/aurora_pkg.vhd;
vcom -work klm_aurora_tb ../source/chbond_count_dec.vhd;
vcom -work klm_aurora_tb ../source/err_detect.vhd;
vcom -work klm_aurora_tb ../source/lane_init_sm.vhd;
vcom -work klm_aurora_tb ../source/sym_dec.vhd;
vcom -work klm_aurora_tb ../source/sym_gen.vhd;
vcom -work klm_aurora_tb ../source/aurora_lane.vhd;           
vcom -work klm_aurora_tb ../source/channel_err_detect.vhd;
vcom -work klm_aurora_tb ../source/channel_init_sm.vhd;
vcom -work klm_aurora_tb ../source/idle_and_ver_gen.vhd;
vcom -work klm_aurora_tb ../source/global_logic.vhd;            
vcom -work klm_aurora_tb ../source/tx_ll_control.vhd;
vcom -work klm_aurora_tb ../source/tx_ll_datapath.vhd;
vcom -work klm_aurora_tb ../source/tx_ll.vhd;           
vcom -work klm_aurora_tb ../source/rx_ll_pdu_datapath.vhd;           
vcom -work klm_aurora_tb ../source/rx_ll.vhd;
vcom -work klm_aurora_tb ../source/standard_cc_module.vhd;
vcom -work klm_aurora_tb ../source/klm_aurora.vhd;
vcom -work klm_aurora_tb ../source/klm_aurora_intfc.vhd;           

vcom -work klm_aurora_tb ./source/frame_check.vhd;
vcom -work klm_aurora_tb ./source/frame_gen.vhd;    
vcom -work klm_aurora_tb ./source/klm_aurora_tb.vhd;

vsim klm_aurora_tb -t 1ps -ieee_nowarn

@transcript off

#-----------------------------------------------------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Testbench Signals" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
#-----------------------------------------------------------------------------------------------------------
add wave -noreg -logic {/klm_aurora_tb/user_clk}
add wave -noreg -logic {/klm_aurora_tb/sync_clk}
add wave -noreg -logic {/klm_aurora_tb/reset}
add wave -noreg -logic {/klm_aurora_tb/gt_reset}
add wave -noreg -logic {/klm_aurora_tb/plllock}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/tx_dst_rdy_n}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/tx_src_rdy_n}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/tx_sof_n}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/tx_eof_n}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/tx_d}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/tx_rem}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/rx_src_rdy_n}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/rx_sof_n}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/rx_eof_n}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/rx_rem}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/rx_d}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/hard_err}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/soft_err}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/frame_err}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/channel_up}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/lane_up}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/warn_cc}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/do_cc}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/powerdown}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/loopback}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/err_count}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/mgttxfault}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/mgtmod0}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/mgtlos}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/mgttxdis}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/mgtmod2}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/mgtmod1}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/mgtrate}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/rxp}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/rxn}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/txp}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/txn}
add wave -noreg -logic {/klm_aurora_tb/UUT1/hard_err_i}
add wave -noreg -logic {/klm_aurora_tb/UUT1/soft_err_i}
add wave -noreg -logic {/klm_aurora_tb/UUT1/frame_err_i}
add wave -noreg -logic {/klm_aurora_tb/UUT1/channel_up_i}
add wave -noreg -logic {/klm_aurora_tb/UUT1/lane_up_i}
add wave -noreg -logic {/klm_aurora_tb/UUT1/warn_cc_i}
add wave -noreg -logic {/klm_aurora_tb/UUT1/do_cc_i}
add wave -noreg -logic {/klm_aurora_tb/UUT1/pll_not_locked_i}
add wave -noreg -logic {/klm_aurora_tb/UUT1/tx_lock_i}


#-----------------------------------------------------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "UUT1" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
#-----------------------------------------------------------------------------------------------------------
add wave -noreg -logic {/klm_aurora_tb/UUT1/user_clk}
add wave -noreg -logic {/klm_aurora_tb/UUT1/sync_clk}
add wave -noreg -logic {/klm_aurora_tb/UUT1/reset}
add wave -noreg -logic {/klm_aurora_tb/UUT1/gt_reset}
add wave -noreg -logic {/klm_aurora_tb/UUT1/plllockn_i}
add wave -noreg -logic {/klm_aurora_tb/UUT1/tx_dst_rdy_n}
add wave -noreg -logic {/klm_aurora_tb/UUT1/tx_src_rdy_n}
add wave -noreg -logic {/klm_aurora_tb/UUT1/tx_sof_n}
add wave -noreg -logic {/klm_aurora_tb/UUT1/tx_eof_n}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/tx_d}
add wave -noreg -logic {/klm_aurora_tb/UUT1/tx_rem}
add wave -noreg -logic {/klm_aurora_tb/UUT1/rx_src_rdy_n}
add wave -noreg -logic {/klm_aurora_tb/UUT1/rx_sof_n}
add wave -noreg -logic {/klm_aurora_tb/UUT1/rx_eof_n}
add wave -noreg -logic {/klm_aurora_tb/UUT1/rx_rem}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/rx_d}
add wave -noreg -logic {/klm_aurora_tb/UUT1/hard_err}
add wave -noreg -logic {/klm_aurora_tb/UUT1/soft_err}
add wave -noreg -logic {/klm_aurora_tb/UUT1/frame_err}
add wave -noreg -logic {/klm_aurora_tb/UUT1/channel_up}
add wave -noreg -logic {/klm_aurora_tb/UUT1/lane_up}
add wave -noreg -logic {/klm_aurora_tb/UUT1/warn_cc}
add wave -noreg -logic {/klm_aurora_tb/UUT1/do_cc}
add wave -noreg -logic {/klm_aurora_tb/UUT1/powerdown}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/loopback}
add wave -noreg -logic {/klm_aurora_tb/UUT1/rxp}
add wave -noreg -logic {/klm_aurora_tb/UUT1/rxn}
add wave -noreg -logic {/klm_aurora_tb/UUT1/txp}
add wave -noreg -logic {/klm_aurora_tb/UUT1/txn}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/rxeqmix_in_i}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/daddr_in_i}
add wave -noreg -logic {/klm_aurora_tb/UUT1/dclk_in_i}
add wave -noreg -logic {/klm_aurora_tb/UUT1/den_in_i}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/di_in_i}
add wave -noreg -logic {/klm_aurora_tb/UUT1/drdy_out_unused_i}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/drpdo_out_unused_i}
add wave -noreg -logic {/klm_aurora_tb/UUT1/dwe_in_i}
add wave -noreg -logic {/klm_aurora_tb/UUT1/lane_up_reduce_i}
add wave -noreg -logic {/klm_aurora_tb/UUT1/rst_cc_module_i}

#-----------------------------------------------------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "UUT2" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
#-----------------------------------------------------------------------------------------------------------
add wave -noreg -logic {/klm_aurora_tb/UUT2/user_clk}
add wave -noreg -logic {/klm_aurora_tb/UUT2/sync_clk}
add wave -noreg -logic {/klm_aurora_tb/UUT2/reset}
add wave -noreg -logic {/klm_aurora_tb/UUT2/gt_reset}
add wave -noreg -logic {/klm_aurora_tb/UUT2/plllockn_i}
add wave -noreg -logic {/klm_aurora_tb/UUT2/tx_dst_rdy_n}
add wave -noreg -logic {/klm_aurora_tb/UUT2/tx_src_rdy_n}
add wave -noreg -logic {/klm_aurora_tb/UUT2/tx_sof_n}
add wave -noreg -logic {/klm_aurora_tb/UUT2/tx_eof_n}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT2/tx_d}
add wave -noreg -logic {/klm_aurora_tb/UUT2/tx_rem}
add wave -noreg -logic {/klm_aurora_tb/UUT2/rx_src_rdy_n}
add wave -noreg -logic {/klm_aurora_tb/UUT2/rx_sof_n}
add wave -noreg -logic {/klm_aurora_tb/UUT2/rx_eof_n}
add wave -noreg -logic {/klm_aurora_tb/UUT2/rx_rem}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT2/rx_d}
add wave -noreg -logic {/klm_aurora_tb/UUT2/hard_err}
add wave -noreg -logic {/klm_aurora_tb/UUT2/soft_err}
add wave -noreg -logic {/klm_aurora_tb/UUT2/frame_err}
add wave -noreg -logic {/klm_aurora_tb/UUT2/channel_up}
add wave -noreg -logic {/klm_aurora_tb/UUT2/lane_up}
add wave -noreg -logic {/klm_aurora_tb/UUT2/warn_cc}
add wave -noreg -logic {/klm_aurora_tb/UUT2/do_cc}
add wave -noreg -logic {/klm_aurora_tb/UUT2/powerdown}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT2/loopback}
add wave -noreg -logic {/klm_aurora_tb/UUT2/rxp}
add wave -noreg -logic {/klm_aurora_tb/UUT2/rxn}
add wave -noreg -logic {/klm_aurora_tb/UUT2/txp}
add wave -noreg -logic {/klm_aurora_tb/UUT2/txn}
add wave -noreg -logic {/klm_aurora_tb/UUT2/hard_err_i}
add wave -noreg -logic {/klm_aurora_tb/UUT2/soft_err_i}
add wave -noreg -logic {/klm_aurora_tb/UUT2/frame_err_i}
add wave -noreg -logic {/klm_aurora_tb/UUT2/channel_up_i}
add wave -noreg -logic {/klm_aurora_tb/UUT2/lane_up_i}
add wave -noreg -logic {/klm_aurora_tb/UUT2/warn_cc_i}
add wave -noreg -logic {/klm_aurora_tb/UUT2/do_cc_i}
add wave -noreg -logic {/klm_aurora_tb/UUT2/pll_not_locked_i}
add wave -noreg -logic {/klm_aurora_tb/UUT2/tx_lock_i}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT2/rxeqmix_in_i}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT2/daddr_in_i}
add wave -noreg -logic {/klm_aurora_tb/UUT2/dclk_in_i}
add wave -noreg -logic {/klm_aurora_tb/UUT2/den_in_i}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT2/di_in_i}
add wave -noreg -logic {/klm_aurora_tb/UUT2/drdy_out_unused_i}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT2/drpdo_out_unused_i}
add wave -noreg -logic {/klm_aurora_tb/UUT2/dwe_in_i}
add wave -noreg -logic {/klm_aurora_tb/UUT2/lane_up_reduce_i}
add wave -noreg -logic {/klm_aurora_tb/UUT2/rst_cc_module_i}


@transcript off

run 100 us;