cd C:\Users\bkunkler\Documents\CEEM\repos\Belle-II\firmware\KLM_SCROD\time_order\sim\
vlib time_order_lib "./library/time_order_lib.lib"

#TDC Files
vcom -work time_order_lib .\..\..\tdc\source\tdc_pkg.vhd
vcom -work time_order_lib .\..\..\tdc\source\tdc_fifo.vhd
vcom -work time_order_lib .\..\..\tdc\source\tdc_channel.vhd
vcom -work time_order_lib .\..\..\tdc\source\tdc.vhd

vcom -work time_order_lib .\..\source\time_order_pkg.vhd
vcom -work time_order_lib .\..\source\tom_2_to_1.vhd
vcom -work time_order_lib .\..\source\tom_3_to_1.vhd
vcom -work time_order_lib .\..\source\tom_4_to_1.vhd
vcom -work time_order_lib .\..\source\tom_10_to_1.vhd
vcom -work time_order_lib .\..\source\time_order.vhd
vcom -work time_order_lib .\source\tdc_stim.vhd
vcom -work time_order_lib .\source\time_order_tb.vhd

vsim time_order_tb -t 1ps -ieee_nowarn

transcript off
#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Testbench Signals" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/time_order_tb/clk}
add wave -noreg -hexadecimal -literal {/time_order_tb/ce}
add wave -noreg -logic {/time_order_tb/run_reset}
add wave -noreg -hexadecimal -literal {/time_order_tb/tb}
add wave -noreg -hexadecimal -literal {/time_order_tb/tb16}
add wave -noreg -hexadecimal -literal {/time_order_tb/fifo_re}
add wave -noreg -hexadecimal -literal {/time_order_tb/fifo_ept}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_dout}
add wave -noreg -logic {/time_order_tb/dst_we}
add wave -noreg -logic {/time_order_tb/dst_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/ordered}
add wave -noreg -logic {/time_order_tb/ce_bit}
add wave -noreg -hexadecimal -literal {/time_order_tb/ce_cnt}
add wave -noreg -hexadecimal -literal {/time_order_tb/full_reg}
add wave -noreg -hexadecimal -literal {/time_order_tb/lordered}
add wave -noreg -hexadecimal -literal {/time_order_tb/cordered}
add wave -noreg -hexadecimal -literal {/time_order_tb/dordered}
add wave -noreg -logic {/time_order_tb/stim_enable}
add wave -noreg -logic {/time_order_tb/test}

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

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "TDC" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/time_order_tb/tdc_ins/tdc_clk}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/ce}
add wave -noreg -logic {/time_order_tb/tdc_ins/reset}
add wave -noreg -logic {/time_order_tb/tdc_ins/tdc_clr}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/tb}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/tb16}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/fifo_re}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/fifo_ept}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/tdc_dout}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/tdc_clr_qn}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/tdc_clr_dlyln}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/fifo_ept_q0}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/fifo_ept_q1}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/tdc_dout_q0}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/tdc_dout_q1}

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "TDC Channel 1" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/tdc_clk}
add wave -noreg -logic {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/reset}
add wave -noreg -logic {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/tdc_clr}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/tb}
add wave -noreg -logic {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/tb16}
add wave -noreg -logic {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/fifo_re}
add wave -noreg -logic {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/fifo_ept}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/tdc_dout}
add wave -noreg -logic {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/tdc_rst_q0}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/tb_q0}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/tb_q1}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/tb_q2}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/tb_q3}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/tb_q4}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/counter}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/counter_q0}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/counter_q1}
add wave -noreg -logic {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/fifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/fifo_din}
add wave -noreg -logic {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/fifo_we_q0}
add wave -noreg -logic {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/trig_q0}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/chan_q0}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__1/tdc_ch_ins/chan_q1}

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "TDC Channel 10" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/tdc_clk}
add wave -noreg -logic {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/reset}
add wave -noreg -logic {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/tdc_clr}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/tb}
add wave -noreg -logic {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/tb16}
add wave -noreg -logic {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/fifo_re}
add wave -noreg -logic {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/fifo_ept}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/tdc_dout}
add wave -noreg -logic {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/tdc_rst_q0}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/tb_q0}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/tb_q1}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/tb_q2}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/tb_q3}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/tb_q4}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/counter}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/counter_q0}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/counter_q1}
add wave -noreg -logic {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/fifo_full}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/fifo_din}
add wave -noreg -logic {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/fifo_we_q0}
add wave -noreg -logic {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/trig_q0}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/chan_q0}
add wave -noreg -hexadecimal -literal {/time_order_tb/tdc_ins/TDC_CH_GEN__10/tdc_ch_ins/chan_q1}


#-------------------------------------------
transcript on

run 20 us;