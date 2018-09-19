cd C:/Users/bkunkler/Documents/CEEM/repos/Belle-II/firmware/KLM_SCROD/tdc/sim/
vlib tdc_lib "./library/tdc_lib.lib"

vcom -work tdc_lib ./../source/tdc_pkg.vhd
vcom -work tdc_lib ./../source/tdc_fifo.vhd
vcom -work tdc_lib ./../source/tdc_channel.vhd
vcom -work tdc_lib ./../source/tdc.vhd
vcom -work tdc_lib ./source/tdc_tb.vhd

vsim -lib tdc_lib tdc_tb -t 10ps -ieee_nowarn +access +r

transcript off
#------------------------------------------------------------- 
wave -divider "/---------------------------"
wave -divider "Testbench Signals"			
wave -divider "/---------------------------"
#-------------------------------------------------------------
add wave /tdc_tb/clk
add wave /tdc_tb/clk2x
add wave /tdc_tb/ce
add wave /tdc_tb/run_reset
add wave /tdc_tb/tb
add wave /tdc_tb/tb16
add wave /tdc_tb/fifo_re
add wave /tdc_tb/exttb
add wave /tdc_tb/fifo_ept
add wave /tdc_tb/tdc_dout
add wave /tdc_tb/tb_ctr
add wave /tdc_tb/tb_prng

#-------------------------------------------------------------
wave -divider "/---------------------------"
wave -divider "UUT Top Level"
wave -divider "/---------------------------"
wave -divider "Ports" 
#-------------------------------------------------------------
add wave /tdc_tb/UUT/tdc_clk
add wave /tdc_tb/UUT/ce
add wave /tdc_tb/UUT/reset
add wave /tdc_tb/UUT/tdc_clr
add wave /tdc_tb/UUT/tb
add wave /tdc_tb/UUT/tb16
add wave /tdc_tb/UUT/fifo_re
add wave /tdc_tb/UUT/exttb
add wave /tdc_tb/UUT/fifo_ept
add wave /tdc_tb/UUT/tdc_dout
add wave /tdc_tb/UUT/tdc_clr_qn
add wave /tdc_tb/UUT/tdc_clr_dlyln
add wave /tdc_tb/UUT/fifo_ept_q0
add wave /tdc_tb/UUT/fifo_ept_q1
add wave /tdc_tb/UUT/tdc_dout_q0
add wave /tdc_tb/UUT/tdc_dout_q1

#-------------------------------------------------------------
wave -divider "/---------------------------"
wave -divider "TDC Channel 1"
wave -divider "/---------------------------"
wave -divider "Ports" 
#-------------------------------------------------------------
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/tdc_clk
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/reset
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/tdc_clr
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/tb
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/tb16
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/fifo_re
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/exttb
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/fifo_ept
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/tdc_dout
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/tdc_rst_q0
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/tb_q0
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/tb_q1
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/tb_q2
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/tb_q3
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/tb_q4
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/counter
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/counter_q0
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/counter_q1
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/fifo_full
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/fifo_din
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/fifo_we_q0
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/trig_q0
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/chan_q0
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/chan_q1
add wave /tdc_tb/UUT/TDC_CH_GEN__1/tdc_ch_ins/extexn
#-------------------------------------------------------------
wave -divider "/---------------------------"
wave -divider "TDC Channel 10"
wave -divider "/---------------------------"
wave -divider "Ports" 
#-------------------------------------------------------------
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/tdc_clk
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/reset
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/tdc_clr
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/tb
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/tb16
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/fifo_re
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/exttb
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/fifo_ept
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/tdc_dout
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/tdc_rst_q0
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/tb_q0
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/tb_q1
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/tb_q2
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/tb_q3
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/tb_q4
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/counter
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/counter_q0
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/counter_q1
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/fifo_full
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/fifo_din
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/fifo_we_q0
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/trig_q0
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/chan_q0
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/chan_q1
add wave /tdc_tb/UUT/TDC_CH_GEN__10/tdc_ch_ins/extexn


#--------------------------------------------------
#-------------------------------------------
transcript on

run 500 ns;