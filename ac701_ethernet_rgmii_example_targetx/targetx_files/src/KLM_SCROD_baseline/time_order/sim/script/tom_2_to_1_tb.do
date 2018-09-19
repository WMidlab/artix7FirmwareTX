cd C:\Users\bkunkler\Documents\CEEM\npvm_svn\Belle-II\bKLM\firmware\4020035\4020041\time_order\sim\
vlib tom_2_to_1_tb
vcom -work tom_2_to_1_tb .\..\..\tdc\source\tdc_pkg.vhd
vcom -work tom_2_to_1_tb .\..\..\tdc\source\tdc_fifo.vhd
vcom -work tom_2_to_1_tb .\..\..\tdc\source\tdc_channel.vhd
vcom -work tom_2_to_1_tb .\..\source\time_order_pkg.vhd
vcom -work tom_2_to_1_tb .\..\source\tom_2_to_1.vhd
vcom -work tom_2_to_1_tb .\source\tom_2_to_1_tb.vhd

vsim tom_2_to_1_tb

transcript off
#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Testbench Signals" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
#-------------------------------------------------------------
wave -logic reset
wave -logic clk
wave -logic start
wave -hexadecimal -literal tdc_clr
wave -hexadecimal -literal disc
wave -hexadecimal -literal tdc_ch_t
wave -hexadecimal -literal tdc_dout_t
wave -hexadecimal -literal tdc_fifo_re
wave -hexadecimal -literal tdc_fifo_ept
wave -logic emin
wave -hexadecimal -literal cmin
wave -hexadecimal -literal dmin
wave -logic disc_ce
wave -hexadecimal -literal disc_reg
wave -hexadecimal -literal disc_cnt
wave -logic ce
wave -hexadecimal -literal ce_cnt
wave -hexadecimal -literal full_reg
wave -logic dst_we
wave -logic reset'DELAYED~13
wave -logic reset'DELAYED~13~9

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "UUT Top Level " -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
wave -hexadecimal -literal UUT/ein
wave -hexadecimal -literal UUT/cin
wave -hexadecimal -literal UUT/din
wave -logic UUT/emin
wave -hexadecimal -literal UUT/cmin
wave -hexadecimal -literal UUT/dmin
wave -logic UUT/comp_d
wave -logic UUT/wrap_d
wave -hexadecimal -literal UUT/out_addr_d


#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "TDC Channels" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
#-------------------------------------------------------------
wave -divider "TDC Channel 1" -color 255,255,255
#-------------------------------------------------------------
wave -logic TDC_GEN__1/tdc_ch_inst/tdc_clk
wave -logic TDC_GEN__1/tdc_ch_inst/reset
wave -logic TDC_GEN__1/tdc_ch_inst/tdc_clr
wave -logic TDC_GEN__1/tdc_ch_inst/disc
wave -logic TDC_GEN__1/tdc_ch_inst/fifo_re
wave -logic TDC_GEN__1/tdc_ch_inst/fifo_ept
wave -hexadecimal -literal TDC_GEN__1/tdc_ch_inst/tdc_dout
wave -logic TDC_GEN__1/tdc_ch_inst/tdc_rst_q0
wave -logic TDC_GEN__1/tdc_ch_inst/disc_n
wave -logic TDC_GEN__1/tdc_ch_inst/disc_q0
wave -logic TDC_GEN__1/tdc_ch_inst/disc_q1
wave -logic TDC_GEN__1/tdc_ch_inst/disc_q2
wave -logic TDC_GEN__1/tdc_ch_inst/disc_q3
wave -hexadecimal -literal TDC_GEN__1/tdc_ch_inst/counter
wave -hexadecimal -literal TDC_GEN__1/tdc_ch_inst/counter_q0
wave -logic TDC_GEN__1/tdc_ch_inst/fifo_full
wave -logic TDC_GEN__1/tdc_ch_inst/tdc_fifo_we_q0

#-------------------------------------------------------------
wave -divider "TDC Channel 2" -color 255,255,255
#-------------------------------------------------------------
wave -logic TDC_GEN__2/tdc_ch_inst/tdc_clk
wave -logic TDC_GEN__2/tdc_ch_inst/reset
wave -logic TDC_GEN__2/tdc_ch_inst/tdc_clr
wave -logic TDC_GEN__2/tdc_ch_inst/disc
wave -logic TDC_GEN__2/tdc_ch_inst/fifo_re
wave -logic TDC_GEN__2/tdc_ch_inst/fifo_ept
wave -hexadecimal -literal TDC_GEN__2/tdc_ch_inst/tdc_dout
wave -logic TDC_GEN__2/tdc_ch_inst/tdc_rst_q0
wave -logic TDC_GEN__2/tdc_ch_inst/disc_n
wave -logic TDC_GEN__2/tdc_ch_inst/disc_q0
wave -logic TDC_GEN__2/tdc_ch_inst/disc_q1
wave -logic TDC_GEN__2/tdc_ch_inst/disc_q2
wave -logic TDC_GEN__2/tdc_ch_inst/disc_q3
wave -hexadecimal -literal TDC_GEN__2/tdc_ch_inst/counter
wave -hexadecimal -literal TDC_GEN__2/tdc_ch_inst/counter_q0
wave -logic TDC_GEN__2/tdc_ch_inst/fifo_full
wave -logic TDC_GEN__2/tdc_ch_inst/tdc_fifo_we_q0

#-------------------------------------------
transcript on

run 1 ms;