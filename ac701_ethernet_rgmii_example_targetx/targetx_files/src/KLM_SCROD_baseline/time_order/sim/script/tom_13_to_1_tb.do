cd C:\Users\bkunkler\Documents\CEEM\npvm_svn\Belle-II\firmware\4020044\4020047\time_order\sim\
vlib tom_13_to_1_tb
vcom -work tom_13_to_1_tb .\..\source\rpc_time_order_pkg.vhd
vcom -work tom_13_to_1_tb .\..\source\tom_2_to_1.vhd
vcom -work tom_13_to_1_tb .\..\source\tom_3_to_1.vhd
vcom -work tom_13_to_1_tb .\..\source\tom_4_to_1.vhd
vcom -work tom_13_to_1_tb .\..\source\tom_13_to_1.vhd
vcom -work tom_13_to_1_tb .\source\tom_13_to_1_tb.vhd

vsim tom_13_to_1_tb

transcript off
#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Testbench Signals" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/tom_13_to_1_tb/clk}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/disc_reg}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/ein}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/cin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/din}
add wave -noreg -logic {/tom_13_to_1_tb/emin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/cmin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/dmin}
add wave -noreg -logic {/tom_13_to_1_tb/ce}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/ce_cnt}


#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "UUT Top Level " -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/tom_13_to_1_tb/UUT/clk}
add wave -noreg -logic {/tom_13_to_1_tb/UUT/ce}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/ein}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/cin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/din}
add wave -noreg -logic {/tom_13_to_1_tb/UUT/emin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/cmin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/dmin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/ein11_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/cin11_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/din11_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/ein12_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/cin12_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/din12_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/ein13_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/cin13_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/din13_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/ein14_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/cin14_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/din14_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/emin1_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/cmin1_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/dmin1_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/ein2_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/cin2_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/din2_t}


#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "UUT tom_3_to_1_11" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_3_to_1_11/clk}
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_3_to_1_11/ce}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_11/ein}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_11/cin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_11/din}
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_3_to_1_11/emin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_11/cmin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_11/dmin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_11/ein1_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_11/cin1_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_11/din1_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_11/ein2_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_11/cin2_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_11/din2_t}
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_3_to_1_11/emin1}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_11/cmin1}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_11/dmin1}
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_3_to_1_11/emin2}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_11/cmin2}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_11/dmin2}


#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "UUT tom_3_to_1_12" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_3_to_1_12/clk}
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_3_to_1_12/ce}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_12/ein}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_12/cin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_12/din}
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_3_to_1_12/emin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_12/cmin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_12/dmin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_12/ein1_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_12/cin1_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_12/din1_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_12/ein2_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_12/cin2_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_12/din2_t}
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_3_to_1_12/emin1}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_12/cmin1}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_12/dmin1}
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_3_to_1_12/emin2}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_12/cmin2}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_12/dmin2}


#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "UUT tom_3_to_1_13" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_3_to_1_13/clk}
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_3_to_1_13/ce}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_13/ein}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_13/cin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_13/din}
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_3_to_1_13/emin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_13/cmin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_13/dmin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_13/ein1_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_13/cin1_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_13/din1_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_13/ein2_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_13/cin2_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_13/din2_t}
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_3_to_1_13/emin1}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_13/cmin1}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_13/dmin1}
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_3_to_1_13/emin2}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_13/cmin2}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_3_to_1_13/dmin2}



#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "UUT tom_4_to_1_14" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_4_to_1_14/clk}
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_4_to_1_14/ce}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_14/ein}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_14/cin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_14/din}
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_4_to_1_14/emin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_14/cmin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_14/dmin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_14/ein2_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_14/cin2_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_14/din2_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_14/emin1_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_14/cmin1_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_14/dmin1_t}
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_4_to_1_14/emin2}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_14/cmin2}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_14/dmin2}


#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "UUT tom_4_to_1_21" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_4_to_1_21/clk}
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_4_to_1_21/ce}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_21/ein}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_21/cin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_21/din}
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_4_to_1_21/emin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_21/cmin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_21/dmin}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_21/ein2_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_21/cin2_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_21/din2_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_21/emin1_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_21/cmin1_t}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_21/dmin1_t}
add wave -noreg -logic {/tom_13_to_1_tb/UUT/tom_4_to_1_21/emin2}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_21/cmin2}
add wave -noreg -hexadecimal -literal {/tom_13_to_1_tb/UUT/tom_4_to_1_21/dmin2}


#-------------------------------------------
transcript on

run 1 us