cd C:\Users\bkunkler\Documents\CEEM\npvm_svn\Belle-II\firmware\4020044\4020047\time_order\sim\
vlib time_order_tb
vcom -work time_order_tb .\..\..\coinc_find\source\coinc_fifo.vhd
vcom -work time_order_tb .\..\..\coinc_find\source\coinc_find.vhd
vcom -work time_order_tb .\..\source\rpc_time_order_pkg.vhd
vcom -work time_order_tb .\..\source\tom_2_to_1.vhd
vcom -work time_order_tb .\..\source\tom_3_to_1.vhd
vcom -work time_order_tb .\..\source\tom_4_to_1.vhd
vcom -work time_order_tb .\..\source\tom_13_to_1.vhd
vcom -work time_order_tb .\..\source\rpc_time_order.vhd
vcom -work time_order_tb .\source\rpc_time_order_tb.vhd


vsim time_order_tb -t 1ps -ieee_nowarn

transcript off
#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Testbench Signals" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/time_order_tb/reset}
add wave -noreg -logic {/time_order_tb/clk}
add wave -noreg -logic {/time_order_tb/start}
add wave -noreg -hexadecimal -literal {/time_order_tb/tofifo_dout_t}
add wave -noreg -hexadecimal -literal {/time_order_tb/tofifo_re}
add wave -noreg -hexadecimal -literal {/time_order_tb/tofifo_epty}
add wave -noreg -logic {/time_order_tb/dst_we}
add wave -noreg -hexadecimal -literal {/time_order_tb/ordered}
add wave -noreg -hexadecimal -literal {/time_order_tb/ce_cnt}
add wave -noreg -logic {/time_order_tb/ce}
add wave -noreg -hexadecimal -literal {/time_order_tb/full_reg}
add wave -noreg -logic {/time_order_tb/bpi_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/cordered}
add wave -noreg -hexadecimal -literal {/time_order_tb/dordered}
add wave -noreg -hexadecimal -literal {/time_order_tb/test}
add wave -noreg -hexadecimal -literal {/time_order_tb/rx_dst_rdy_n}
add wave -noreg -hexadecimal -literal {/time_order_tb/rx_sof_n}
add wave -noreg -hexadecimal -literal {/time_order_tb/rx_eof_n}
add wave -noreg -hexadecimal -literal {/time_order_tb/rx_src_rdy_n}
add wave -noreg -hexadecimal -literal {/time_order_tb/rx_data}
add wave -noreg -logic {/time_order_tb/fileio_enable}
add wave -noreg -logic {/time_order_tb/reset'DELAYED~13}

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "UUT Top Level " -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/time_order_tb/UUT/clk}
add wave -noreg -logic {/time_order_tb/UUT/ce}
add wave -noreg -logic {/time_order_tb/UUT/reset}
add wave -noreg -logic {/time_order_tb/UUT/dst_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/UUT/src_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/UUT/din}
add wave -noreg -hexadecimal -literal {/time_order_tb/UUT/src_re}
add wave -noreg -logic {/time_order_tb/UUT/dst_we}
add wave -noreg -hexadecimal -literal {/time_order_tb/UUT/dout}
add wave -noreg -hexadecimal -literal {/time_order_tb/UUT/ein1_t}
add wave -noreg -hexadecimal -literal {/time_order_tb/UUT/cin1_t}
add wave -noreg -hexadecimal -literal {/time_order_tb/UUT/din1_t}
add wave -noreg -logic {/time_order_tb/UUT/emin1_t}
add wave -noreg -hexadecimal -literal {/time_order_tb/UUT/cmin1_t}
add wave -noreg -hexadecimal -literal {/time_order_tb/UUT/dmin1_t}
add wave -noreg -hexadecimal -literal {/time_order_tb/UUT/one_hot_ch_t}
add wave -noreg -hexadecimal -literal {/time_order_tb/UUT/src_re_d0}
add wave -noreg -hexadecimal -literal {/time_order_tb/UUT/src_re_q0}
add wave -noreg -logic {/time_order_tb/UUT/out_cmp_d0}
add wave -noreg -logic {/time_order_tb/UUT/out_cmp_q0}
add wave -noreg -logic {/time_order_tb/UUT/out_cmp_d1}
add wave -noreg -logic {/time_order_tb/UUT/out_cmp_q1}
add wave -noreg -logic {/time_order_tb/UUT/out_cmp_q2}
add wave -noreg -hexadecimal -literal {/time_order_tb/UUT/out_cmp_vec}
add wave -noreg -hexadecimal -literal {/time_order_tb/UUT/dout_q0}
add wave -noreg -hexadecimal -literal {/time_order_tb/UUT/dout_q1}
add wave -noreg -hexadecimal -literal {/time_order_tb/UUT/temp}


#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Coincidence Finder Lane 1" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/clk}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/ce}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/reset}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__1/coinc_find_ins/coinc_window}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/rx_dst_rdy_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/rx_sof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/rx_eof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/rx_src_rdy_n}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__1/coinc_find_ins/rx_data}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/tofifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/tofifo_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__1/coinc_find_ins/tofifo_dout}
add wave -noreg -literal {/time_order_tb/COINC_GEN__1/coinc_find_ins/coinc_fsm_cs}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/axis_fifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__1/coinc_find_ins/ch_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__1/coinc_find_ins/data_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/xfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/xfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__1/coinc_find_ins/xfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/xfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/xfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__1/coinc_find_ins/xfifo_dout}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/yfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/yfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__1/coinc_find_ins/yfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/yfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/yfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__1/coinc_find_ins/yfifo_dout}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__1/coinc_find_ins/xtdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__1/coinc_find_ins/ytdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__1/coinc_find_ins/xcmp_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__1/coinc_find_ins/ycmp_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/xcmp_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/ycmp_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__1/coinc_find_ins/axis_diff}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/coinc_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/time_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/coinc_fsm_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/coinc_found}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__1/coinc_find_ins/coinc_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__1/coinc_find_ins/coincx}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__1/coinc_find_ins/coincy}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/tx_fsm_rd}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__1/coinc_find_ins/tmodr_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__1/coinc_find_ins/tofifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__1/coinc_find_ins/tofifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__1/coinc_find_ins/tofifo_full}

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Coincidence Finder Lane 2" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/clk}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/ce}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/reset}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__2/coinc_find_ins/coinc_window}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/rx_dst_rdy_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/rx_sof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/rx_eof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/rx_src_rdy_n}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__2/coinc_find_ins/rx_data}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/tofifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/tofifo_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__2/coinc_find_ins/tofifo_dout}
add wave -noreg -literal {/time_order_tb/COINC_GEN__2/coinc_find_ins/coinc_fsm_cs}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/axis_fifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__2/coinc_find_ins/ch_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__2/coinc_find_ins/data_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/xfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/xfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__2/coinc_find_ins/xfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/xfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/xfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__2/coinc_find_ins/xfifo_dout}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/yfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/yfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__2/coinc_find_ins/yfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/yfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/yfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__2/coinc_find_ins/yfifo_dout}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__2/coinc_find_ins/xtdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__2/coinc_find_ins/ytdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__2/coinc_find_ins/xcmp_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__2/coinc_find_ins/ycmp_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/xcmp_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/ycmp_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__2/coinc_find_ins/axis_diff}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/coinc_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/time_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/coinc_fsm_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/coinc_found}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__2/coinc_find_ins/coinc_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__2/coinc_find_ins/coincx}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__2/coinc_find_ins/coincy}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/tx_fsm_rd}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__2/coinc_find_ins/tmodr_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__2/coinc_find_ins/tofifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__2/coinc_find_ins/tofifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__2/coinc_find_ins/tofifo_full}

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Coincidence Finder Lane 3" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/clk}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/ce}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/reset}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__3/coinc_find_ins/coinc_window}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/rx_dst_rdy_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/rx_sof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/rx_eof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/rx_src_rdy_n}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__3/coinc_find_ins/rx_data}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/tofifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/tofifo_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__3/coinc_find_ins/tofifo_dout}
add wave -noreg -literal {/time_order_tb/COINC_GEN__3/coinc_find_ins/coinc_fsm_cs}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/axis_fifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__3/coinc_find_ins/ch_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__3/coinc_find_ins/data_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/xfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/xfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__3/coinc_find_ins/xfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/xfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/xfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__3/coinc_find_ins/xfifo_dout}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/yfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/yfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__3/coinc_find_ins/yfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/yfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/yfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__3/coinc_find_ins/yfifo_dout}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__3/coinc_find_ins/xtdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__3/coinc_find_ins/ytdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__3/coinc_find_ins/xcmp_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__3/coinc_find_ins/ycmp_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/xcmp_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/ycmp_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__3/coinc_find_ins/axis_diff}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/coinc_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/time_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/coinc_fsm_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/coinc_found}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__3/coinc_find_ins/coinc_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__3/coinc_find_ins/coincx}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__3/coinc_find_ins/coincy}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/tx_fsm_rd}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__3/coinc_find_ins/tmodr_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__3/coinc_find_ins/tofifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__3/coinc_find_ins/tofifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__3/coinc_find_ins/tofifo_full}

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Coincidence Finder Lane 4" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/clk}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/ce}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/reset}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__4/coinc_find_ins/coinc_window}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/rx_dst_rdy_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/rx_sof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/rx_eof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/rx_src_rdy_n}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__4/coinc_find_ins/rx_data}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/tofifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/tofifo_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__4/coinc_find_ins/tofifo_dout}
add wave -noreg -literal {/time_order_tb/COINC_GEN__4/coinc_find_ins/coinc_fsm_cs}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/axis_fifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__4/coinc_find_ins/ch_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__4/coinc_find_ins/data_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/xfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/xfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__4/coinc_find_ins/xfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/xfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/xfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__4/coinc_find_ins/xfifo_dout}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/yfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/yfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__4/coinc_find_ins/yfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/yfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/yfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__4/coinc_find_ins/yfifo_dout}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__4/coinc_find_ins/xtdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__4/coinc_find_ins/ytdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__4/coinc_find_ins/xcmp_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__4/coinc_find_ins/ycmp_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/xcmp_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/ycmp_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__4/coinc_find_ins/axis_diff}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/coinc_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/time_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/coinc_fsm_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/coinc_found}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__4/coinc_find_ins/coinc_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__4/coinc_find_ins/coincx}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__4/coinc_find_ins/coincy}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/tx_fsm_rd}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__4/coinc_find_ins/tmodr_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__4/coinc_find_ins/tofifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__4/coinc_find_ins/tofifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__4/coinc_find_ins/tofifo_full}

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Coincidence Finder Lane 5" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/clk}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/ce}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/reset}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__5/coinc_find_ins/coinc_window}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/rx_dst_rdy_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/rx_sof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/rx_eof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/rx_src_rdy_n}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__5/coinc_find_ins/rx_data}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/tofifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/tofifo_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__5/coinc_find_ins/tofifo_dout}
add wave -noreg -literal {/time_order_tb/COINC_GEN__5/coinc_find_ins/coinc_fsm_cs}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/axis_fifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__5/coinc_find_ins/ch_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__5/coinc_find_ins/data_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/xfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/xfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__5/coinc_find_ins/xfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/xfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/xfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__5/coinc_find_ins/xfifo_dout}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/yfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/yfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__5/coinc_find_ins/yfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/yfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/yfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__5/coinc_find_ins/yfifo_dout}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__5/coinc_find_ins/xtdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__5/coinc_find_ins/ytdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__5/coinc_find_ins/xcmp_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__5/coinc_find_ins/ycmp_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/xcmp_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/ycmp_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__5/coinc_find_ins/axis_diff}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/coinc_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/time_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/coinc_fsm_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/coinc_found}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__5/coinc_find_ins/coinc_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__5/coinc_find_ins/coincx}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__5/coinc_find_ins/coincy}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/tx_fsm_rd}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__5/coinc_find_ins/tmodr_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__5/coinc_find_ins/tofifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__5/coinc_find_ins/tofifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__5/coinc_find_ins/tofifo_full}

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Coincidence Finder Lane 6" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/clk}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/ce}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/reset}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__6/coinc_find_ins/coinc_window}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/rx_dst_rdy_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/rx_sof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/rx_eof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/rx_src_rdy_n}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__6/coinc_find_ins/rx_data}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/tofifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/tofifo_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__6/coinc_find_ins/tofifo_dout}
add wave -noreg -literal {/time_order_tb/COINC_GEN__6/coinc_find_ins/coinc_fsm_cs}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/axis_fifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__6/coinc_find_ins/ch_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__6/coinc_find_ins/data_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/xfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/xfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__6/coinc_find_ins/xfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/xfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/xfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__6/coinc_find_ins/xfifo_dout}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/yfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/yfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__6/coinc_find_ins/yfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/yfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/yfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__6/coinc_find_ins/yfifo_dout}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__6/coinc_find_ins/xtdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__6/coinc_find_ins/ytdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__6/coinc_find_ins/xcmp_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__6/coinc_find_ins/ycmp_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/xcmp_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/ycmp_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__6/coinc_find_ins/axis_diff}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/coinc_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/time_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/coinc_fsm_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/coinc_found}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__6/coinc_find_ins/coinc_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__6/coinc_find_ins/coincx}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__6/coinc_find_ins/coincy}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/tx_fsm_rd}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__6/coinc_find_ins/tmodr_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__6/coinc_find_ins/tofifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__6/coinc_find_ins/tofifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__6/coinc_find_ins/tofifo_full}

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Coincidence Finder Lane 7" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/clk}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/ce}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/reset}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__7/coinc_find_ins/coinc_window}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/rx_dst_rdy_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/rx_sof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/rx_eof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/rx_src_rdy_n}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__7/coinc_find_ins/rx_data}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/tofifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/tofifo_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__7/coinc_find_ins/tofifo_dout}
add wave -noreg -literal {/time_order_tb/COINC_GEN__7/coinc_find_ins/coinc_fsm_cs}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/axis_fifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__7/coinc_find_ins/ch_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__7/coinc_find_ins/data_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/xfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/xfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__7/coinc_find_ins/xfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/xfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/xfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__7/coinc_find_ins/xfifo_dout}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/yfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/yfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__7/coinc_find_ins/yfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/yfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/yfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__7/coinc_find_ins/yfifo_dout}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__7/coinc_find_ins/xtdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__7/coinc_find_ins/ytdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__7/coinc_find_ins/xcmp_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__7/coinc_find_ins/ycmp_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/xcmp_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/ycmp_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__7/coinc_find_ins/axis_diff}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/coinc_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/time_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/coinc_fsm_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/coinc_found}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__7/coinc_find_ins/coinc_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__7/coinc_find_ins/coincx}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__7/coinc_find_ins/coincy}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/tx_fsm_rd}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__7/coinc_find_ins/tmodr_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__7/coinc_find_ins/tofifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__7/coinc_find_ins/tofifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__7/coinc_find_ins/tofifo_full}

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Coincidence Finder Lane 8" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/clk}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/ce}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/reset}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__8/coinc_find_ins/coinc_window}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/rx_dst_rdy_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/rx_sof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/rx_eof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/rx_src_rdy_n}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__8/coinc_find_ins/rx_data}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/tofifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/tofifo_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__8/coinc_find_ins/tofifo_dout}
add wave -noreg -literal {/time_order_tb/COINC_GEN__8/coinc_find_ins/coinc_fsm_cs}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/axis_fifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__8/coinc_find_ins/ch_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__8/coinc_find_ins/data_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/xfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/xfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__8/coinc_find_ins/xfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/xfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/xfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__8/coinc_find_ins/xfifo_dout}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/yfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/yfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__8/coinc_find_ins/yfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/yfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/yfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__8/coinc_find_ins/yfifo_dout}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__8/coinc_find_ins/xtdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__8/coinc_find_ins/ytdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__8/coinc_find_ins/xcmp_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__8/coinc_find_ins/ycmp_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/xcmp_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/ycmp_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__8/coinc_find_ins/axis_diff}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/coinc_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/time_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/coinc_fsm_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/coinc_found}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__8/coinc_find_ins/coinc_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__8/coinc_find_ins/coincx}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__8/coinc_find_ins/coincy}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/tx_fsm_rd}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__8/coinc_find_ins/tmodr_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__8/coinc_find_ins/tofifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__8/coinc_find_ins/tofifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__8/coinc_find_ins/tofifo_full}

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Coincidence Finder Lane 9" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/clk}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/ce}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/reset}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__9/coinc_find_ins/coinc_window}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/rx_dst_rdy_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/rx_sof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/rx_eof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/rx_src_rdy_n}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__9/coinc_find_ins/rx_data}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/tofifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/tofifo_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__9/coinc_find_ins/tofifo_dout}
add wave -noreg -literal {/time_order_tb/COINC_GEN__9/coinc_find_ins/coinc_fsm_cs}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/axis_fifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__9/coinc_find_ins/ch_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__9/coinc_find_ins/data_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/xfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/xfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__9/coinc_find_ins/xfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/xfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/xfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__9/coinc_find_ins/xfifo_dout}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/yfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/yfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__9/coinc_find_ins/yfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/yfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/yfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__9/coinc_find_ins/yfifo_dout}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__9/coinc_find_ins/xtdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__9/coinc_find_ins/ytdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__9/coinc_find_ins/xcmp_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__9/coinc_find_ins/ycmp_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/xcmp_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/ycmp_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__9/coinc_find_ins/axis_diff}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/coinc_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/time_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/coinc_fsm_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/coinc_found}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__9/coinc_find_ins/coinc_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__9/coinc_find_ins/coincx}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__9/coinc_find_ins/coincy}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/tx_fsm_rd}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__9/coinc_find_ins/tmodr_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__9/coinc_find_ins/tofifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__9/coinc_find_ins/tofifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__9/coinc_find_ins/tofifo_full}

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Coincidence Finder Lane 10" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/clk}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/ce}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/reset}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__10/coinc_find_ins/coinc_window}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/rx_dst_rdy_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/rx_sof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/rx_eof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/rx_src_rdy_n}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__10/coinc_find_ins/rx_data}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/tofifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/tofifo_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__10/coinc_find_ins/tofifo_dout}
add wave -noreg -literal {/time_order_tb/COINC_GEN__10/coinc_find_ins/coinc_fsm_cs}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/axis_fifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__10/coinc_find_ins/ch_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__10/coinc_find_ins/data_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/xfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/xfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__10/coinc_find_ins/xfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/xfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/xfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__10/coinc_find_ins/xfifo_dout}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/yfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/yfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__10/coinc_find_ins/yfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/yfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/yfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__10/coinc_find_ins/yfifo_dout}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__10/coinc_find_ins/xtdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__10/coinc_find_ins/ytdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__10/coinc_find_ins/xcmp_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__10/coinc_find_ins/ycmp_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/xcmp_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/ycmp_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__10/coinc_find_ins/axis_diff}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/coinc_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/time_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/coinc_fsm_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/coinc_found}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__10/coinc_find_ins/coinc_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__10/coinc_find_ins/coincx}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__10/coinc_find_ins/coincy}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/tx_fsm_rd}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__10/coinc_find_ins/tmodr_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__10/coinc_find_ins/tofifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__10/coinc_find_ins/tofifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__10/coinc_find_ins/tofifo_full}

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Coincidence Finder Lane 11" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/clk}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/ce}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/reset}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__11/coinc_find_ins/coinc_window}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/rx_dst_rdy_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/rx_sof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/rx_eof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/rx_src_rdy_n}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__11/coinc_find_ins/rx_data}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/tofifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/tofifo_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__11/coinc_find_ins/tofifo_dout}
add wave -noreg -literal {/time_order_tb/COINC_GEN__11/coinc_find_ins/coinc_fsm_cs}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/axis_fifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__11/coinc_find_ins/ch_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__11/coinc_find_ins/data_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/xfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/xfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__11/coinc_find_ins/xfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/xfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/xfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__11/coinc_find_ins/xfifo_dout}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/yfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/yfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__11/coinc_find_ins/yfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/yfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/yfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__11/coinc_find_ins/yfifo_dout}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__11/coinc_find_ins/xtdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__11/coinc_find_ins/ytdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__11/coinc_find_ins/xcmp_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__11/coinc_find_ins/ycmp_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/xcmp_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/ycmp_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__11/coinc_find_ins/axis_diff}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/coinc_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/time_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/coinc_fsm_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/coinc_found}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__11/coinc_find_ins/coinc_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__11/coinc_find_ins/coincx}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__11/coinc_find_ins/coincy}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/tx_fsm_rd}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__11/coinc_find_ins/tmodr_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__11/coinc_find_ins/tofifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__11/coinc_find_ins/tofifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__11/coinc_find_ins/tofifo_full}

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Coincidence Finder Lane 12" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/clk}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/ce}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/reset}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__12/coinc_find_ins/coinc_window}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/rx_dst_rdy_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/rx_sof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/rx_eof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/rx_src_rdy_n}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__12/coinc_find_ins/rx_data}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/tofifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/tofifo_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__12/coinc_find_ins/tofifo_dout}
add wave -noreg -literal {/time_order_tb/COINC_GEN__12/coinc_find_ins/coinc_fsm_cs}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/axis_fifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__12/coinc_find_ins/ch_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__12/coinc_find_ins/data_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/xfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/xfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__12/coinc_find_ins/xfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/xfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/xfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__12/coinc_find_ins/xfifo_dout}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/yfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/yfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__12/coinc_find_ins/yfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/yfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/yfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__12/coinc_find_ins/yfifo_dout}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__12/coinc_find_ins/xtdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__12/coinc_find_ins/ytdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__12/coinc_find_ins/xcmp_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__12/coinc_find_ins/ycmp_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/xcmp_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/ycmp_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__12/coinc_find_ins/axis_diff}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/coinc_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/time_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/coinc_fsm_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/coinc_found}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__12/coinc_find_ins/coinc_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__12/coinc_find_ins/coincx}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__12/coinc_find_ins/coincy}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/tx_fsm_rd}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__12/coinc_find_ins/tmodr_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__12/coinc_find_ins/tofifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__12/coinc_find_ins/tofifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__12/coinc_find_ins/tofifo_full}

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Coincidence Finder Lane 13" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/clk}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/ce}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/reset}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__13/coinc_find_ins/coinc_window}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/rx_dst_rdy_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/rx_sof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/rx_eof_n}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/rx_src_rdy_n}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__13/coinc_find_ins/rx_data}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/tofifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/tofifo_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__13/coinc_find_ins/tofifo_dout}
add wave -noreg -literal {/time_order_tb/COINC_GEN__13/coinc_find_ins/coinc_fsm_cs}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/axis_fifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__13/coinc_find_ins/ch_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__13/coinc_find_ins/data_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/xfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/xfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__13/coinc_find_ins/xfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/xfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/xfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__13/coinc_find_ins/xfifo_dout}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/yfifo_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/yfifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__13/coinc_find_ins/yfifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/yfifo_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/yfifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__13/coinc_find_ins/yfifo_dout}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__13/coinc_find_ins/xtdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__13/coinc_find_ins/ytdc}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__13/coinc_find_ins/xcmp_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__13/coinc_find_ins/ycmp_reg}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/xcmp_epty}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/ycmp_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__13/coinc_find_ins/axis_diff}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/coinc_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/time_cmp}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/coinc_fsm_rd}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/coinc_found}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__13/coinc_find_ins/coinc_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__13/coinc_find_ins/coincx}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__13/coinc_find_ins/coincy}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/tx_fsm_rd}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__13/coinc_find_ins/tmodr_luta}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__13/coinc_find_ins/tofifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/COINC_GEN__13/coinc_find_ins/tofifo_din}
add wave -noreg -logic {/time_order_tb/COINC_GEN__13/coinc_find_ins/tofifo_full}

#-------------------------------------------
transcript on

run 1 us;