cd C:\Users\bkunkler\Documents\CEEM\repos\Belle-II\firmware\KLM_SCROD\time_order\sim\
vlib tom_10_to_1_lib "./library/tom_10_to_1_lib.lib"

vcom -work tom_10_to_1_lib .\..\..\tdc\source\tdc_pkg.vhd
vcom -work tom_10_to_1_lib .\..\..\tdc\source\tdc_fifo.vhd
vcom -work tom_10_to_1_lib .\..\..\tdc\source\tdc_channel.vhd
vcom -work tom_10_to_1_lib .\..\source\time_order_pkg.vhd
vcom -work tom_10_to_1_lib .\..\source\tom_2_to_1.vhd
vcom -work tom_10_to_1_lib .\..\source\tom_3_to_1.vhd
vcom -work tom_10_to_1_lib .\..\source\tom_4_to_1.vhd
vcom -work tom_10_to_1_lib .\..\source\tom_10_to_1.vhd
vcom -work tom_10_to_1_lib .\source\tom_10_to_1_tb.vhd

vsim tom_10_to_1_tb

transcript off
#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Testbench Signals" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
#-------------------------------------------------------------
wave -logic clk
wave -hexadecimal -literal disc_reg
wave -hexadecimal -literal ein
wave -hexadecimal -literal cin
wave -hexadecimal -literal din
wave -logic emin
wave -hexadecimal -literal cmin
wave -hexadecimal -literal dmin
wave -logic ce
wave -hexadecimal -literal ce_cnt

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "UUT Top Level " -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
wave -hexadecimal -literal UUT/ein11_t
wave -hexadecimal -literal UUT/cin11_t
wave -hexadecimal -literal UUT/din11_t
wave -hexadecimal -literal UUT/ein12_t
wave -hexadecimal -literal UUT/cin12_t
wave -hexadecimal -literal UUT/din12_t
wave -hexadecimal -literal UUT/ein13_t
wave -hexadecimal -literal UUT/cin13_t
wave -hexadecimal -literal UUT/din13_t
wave -hexadecimal -literal UUT/ein2_t
wave -hexadecimal -literal UUT/cin2_t
wave -hexadecimal -literal UUT/din2_t
wave -hexadecimal -literal UUT/emin1_t
wave -hexadecimal -literal UUT/cmin1_t
wave -hexadecimal -literal UUT/dmin1_t
wave -logic UUT/clk
wave -logic UUT/ce
wave -hexadecimal -literal UUT/ein
wave -hexadecimal -literal UUT/cin
wave -hexadecimal -literal UUT/din
wave -logic UUT/emin
wave -hexadecimal -literal UUT/cmin
wave -hexadecimal -literal UUT/dmin

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "UUT tom_4_to_1_11" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
wave -logic UUT/tom_4_to_1_11/clk
wave -logic UUT/tom_4_to_1_11/ce
wave -hexadecimal -literal UUT/tom_4_to_1_11/ein
wave -hexadecimal -literal UUT/tom_4_to_1_11/cin
wave -hexadecimal -literal UUT/tom_4_to_1_11/din
wave -logic UUT/tom_4_to_1_11/emin
wave -hexadecimal -literal UUT/tom_4_to_1_11/cmin
wave -hexadecimal -literal UUT/tom_4_to_1_11/dmin
wave -hexadecimal -literal UUT/tom_4_to_1_11/ein1_t
wave -hexadecimal -literal UUT/tom_4_to_1_11/cin1_t
wave -hexadecimal -literal UUT/tom_4_to_1_11/din1_t
wave -hexadecimal -literal UUT/tom_4_to_1_11/ein2_t
wave -hexadecimal -literal UUT/tom_4_to_1_11/cin2_t
wave -hexadecimal -literal UUT/tom_4_to_1_11/din2_t
wave -hexadecimal -literal UUT/tom_4_to_1_11/emin1_t
wave -hexadecimal -literal UUT/tom_4_to_1_11/cmin1_t
wave -hexadecimal -literal UUT/tom_4_to_1_11/dmin1_t
wave -logic UUT/tom_4_to_1_11/emin2
wave -hexadecimal -literal UUT/tom_4_to_1_11/cmin2
wave -hexadecimal -literal UUT/tom_4_to_1_11/dmin2

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "UUT tom_4_to_1_12" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
wave -logic UUT/tom_4_to_1_12/clk
wave -logic UUT/tom_4_to_1_12/ce
wave -hexadecimal -literal UUT/tom_4_to_1_12/ein
wave -hexadecimal -literal UUT/tom_4_to_1_12/cin
wave -hexadecimal -literal UUT/tom_4_to_1_12/din
wave -logic UUT/tom_4_to_1_12/emin
wave -hexadecimal -literal UUT/tom_4_to_1_12/cmin
wave -hexadecimal -literal UUT/tom_4_to_1_12/dmin
wave -hexadecimal -literal UUT/tom_4_to_1_12/ein1_t
wave -hexadecimal -literal UUT/tom_4_to_1_12/cin1_t
wave -hexadecimal -literal UUT/tom_4_to_1_12/din1_t
wave -hexadecimal -literal UUT/tom_4_to_1_12/ein2_t
wave -hexadecimal -literal UUT/tom_4_to_1_12/cin2_t
wave -hexadecimal -literal UUT/tom_4_to_1_12/din2_t
wave -hexadecimal -literal UUT/tom_4_to_1_12/emin1_t
wave -hexadecimal -literal UUT/tom_4_to_1_12/cmin1_t
wave -hexadecimal -literal UUT/tom_4_to_1_12/dmin1_t
wave -logic UUT/tom_4_to_1_12/emin2
wave -hexadecimal -literal UUT/tom_4_to_1_12/cmin2
wave -hexadecimal -literal UUT/tom_4_to_1_12/dmin2

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "UUT tom_4_to_1_13" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
wave -logic UUT/tom_4_to_1_13/clk
wave -logic UUT/tom_4_to_1_13/ce
wave -hexadecimal -literal UUT/tom_4_to_1_13/ein
wave -hexadecimal -literal UUT/tom_4_to_1_13/cin
wave -hexadecimal -literal UUT/tom_4_to_1_13/din
wave -logic UUT/tom_4_to_1_13/emin
wave -hexadecimal -literal UUT/tom_4_to_1_13/cmin
wave -hexadecimal -literal UUT/tom_4_to_1_13/dmin
wave -hexadecimal -literal UUT/tom_4_to_1_13/ein1_t
wave -hexadecimal -literal UUT/tom_4_to_1_13/cin1_t
wave -hexadecimal -literal UUT/tom_4_to_1_13/din1_t
wave -hexadecimal -literal UUT/tom_4_to_1_13/ein2_t
wave -hexadecimal -literal UUT/tom_4_to_1_13/cin2_t
wave -hexadecimal -literal UUT/tom_4_to_1_13/din2_t
wave -hexadecimal -literal UUT/tom_4_to_1_13/emin1_t
wave -hexadecimal -literal UUT/tom_4_to_1_13/cmin1_t
wave -hexadecimal -literal UUT/tom_4_to_1_13/dmin1_t
wave -logic UUT/tom_4_to_1_13/emin2
wave -hexadecimal -literal UUT/tom_4_to_1_13/cmin2
wave -hexadecimal -literal UUT/tom_4_to_1_13/dmin2

#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "UUT tom_3_to_1_21" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
wave -hexadecimal -literal UUT/tom_3_to_1_21/ein1_t
wave -hexadecimal -literal UUT/tom_3_to_1_21/cin1_t
wave -hexadecimal -literal UUT/tom_3_to_1_21/din1_t
wave -hexadecimal -literal UUT/tom_3_to_1_21/ein2_t
wave -hexadecimal -literal UUT/tom_3_to_1_21/cin2_t
wave -hexadecimal -literal UUT/tom_3_to_1_21/din2_t
wave -logic UUT/tom_3_to_1_21/emin1
wave -hexadecimal -literal UUT/tom_3_to_1_21/cmin1
wave -hexadecimal -literal UUT/tom_3_to_1_21/dmin1
wave -logic UUT/tom_3_to_1_21/emin2
wave -hexadecimal -literal UUT/tom_3_to_1_21/cmin2
wave -hexadecimal -literal UUT/tom_3_to_1_21/dmin2
wave -logic UUT/tom_3_to_1_21/clk
wave -logic UUT/tom_3_to_1_21/ce
wave -hexadecimal -literal UUT/tom_3_to_1_21/ein
wave -hexadecimal -literal UUT/tom_3_to_1_21/cin
wave -hexadecimal -literal UUT/tom_3_to_1_21/din
wave -logic UUT/tom_3_to_1_21/emin
wave -hexadecimal -literal UUT/tom_3_to_1_21/cmin
wave -hexadecimal -literal UUT/tom_3_to_1_21/dmin

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

run 1 us;