cd C:\Users\bkunkler\Documents\CEEM\npvm_svn\Belle-II\firmware\4020044\4020047\time_order\sim\

vlib ".\library\daq_time_order_tb"
vcom -work daq_time_order_tb .\..\..\common\fpga_common_pkg.vhd
vcom -work daq_time_order_tb .\..\..\daq_path\source\to_fifo.vhd
vcom -work daq_time_order_tb .\..\source\time_order_pkg.vhd
vcom -work daq_time_order_tb .\..\source\tom_2_to_1.vhd
vcom -work daq_time_order_tb .\..\source\tom_3_to_1.vhd
vcom -work daq_time_order_tb .\..\source\tom_4_to_1.vhd
vcom -work daq_time_order_tb .\..\source\tom_13_to_1.vhd
vcom -work daq_time_order_tb .\..\source\daq_time_order.vhd

vcom -work daq_time_order_tb .\source\daq_fileio.vhd
vcom -work daq_time_order_tb .\source\daq_time_order_tb.vhd

vsim time_order_tb -t 1ps -ieee_nowarn

transcript off
#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Testbench Signals" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/time_order_tb/clk}
add wave -noreg -logic {/time_order_tb/ce}
add wave -noreg -logic {/time_order_tb/reset}
add wave -noreg -hexadecimal -literal {/time_order_tb/rx_dst_rdy_n}
add wave -noreg -hexadecimal -literal {/time_order_tb/rx_sof_n}
add wave -noreg -hexadecimal -literal {/time_order_tb/rx_eof_n}
add wave -noreg -hexadecimal -literal {/time_order_tb/rx_src_rdy_n}
add wave -noreg -hexadecimal -literal {/time_order_tb/rx_data}
add wave -noreg -hexadecimal -literal {/time_order_tb/tofifo_din}
add wave -noreg -hexadecimal -literal {/time_order_tb/tofifo_dout}
add wave -noreg -hexadecimal -literal {/time_order_tb/tofifo_wr}
add wave -noreg -hexadecimal -literal {/time_order_tb/tofifo_re}
add wave -noreg -hexadecimal -literal {/time_order_tb/tofifo_pfull}
add wave -noreg -hexadecimal -literal {/time_order_tb/tofifo_epty}
add wave -noreg -hexadecimal -literal {/time_order_tb/daq_rdy}
add wave -noreg -hexadecimal -literal {/time_order_tb/data_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/ch_reg}
add wave -noreg -logic {/time_order_tb/dst_we}
add wave -noreg -hexadecimal -literal {/time_order_tb/ordered}
add wave -noreg -hexadecimal -literal {/time_order_tb/ce_cnt}
add wave -noreg -hexadecimal -literal {/time_order_tb/full_reg}
add wave -noreg -logic {/time_order_tb/daq_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/cordered}
add wave -noreg -hexadecimal -literal {/time_order_tb/dordered}
add wave -noreg -logic {/time_order_tb/fileio_enable}
add wave -noreg -logic {/time_order_tb/test}
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
add wave -noreg -hexadecimal -literal {/time_order_tb/UUT/ein_t}
add wave -noreg -hexadecimal -literal {/time_order_tb/UUT/cin_t}
add wave -noreg -hexadecimal -literal {/time_order_tb/UUT/din_t}
add wave -noreg -logic {/time_order_tb/UUT/emin}
add wave -noreg -hexadecimal -literal {/time_order_tb/UUT/cmin}
add wave -noreg -hexadecimal -literal {/time_order_tb/UUT/dmin}
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



#-------------------------------------------
transcript on

run 5 us;