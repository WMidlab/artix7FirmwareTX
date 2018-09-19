cd C:\Users\bkunkler\Documents\CEEM\repos\Belle-II\firmware\KLM_SCROD\tdc\sim\
vlib tdc_fifo_lib ".\library\tdc_fifo_lib.lib"

vcom -work tdc_fifo_lib .\..\source\tdc_fifo.vhd
vcom -work tdc_fifo_lib .\source\tdc_fifo_tb.vhd

vsim tdc_fifo_tb -t 10ps -ieee_nowarn

transcript off
#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Testbench Signals" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/tdc_fifo_tb/clk}
add wave -noreg -logic {/tdc_fifo_tb/reset}
add wave -noreg -logic {/tdc_fifo_tb/rden}
add wave -noreg -logic {/tdc_fifo_tb/wren}
add wave -noreg -hexadecimal -literal {/tdc_fifo_tb/di}
add wave -noreg -hexadecimal -literal {/tdc_fifo_tb/do}
add wave -noreg -logic {/tdc_fifo_tb/epty}
add wave -noreg -logic {/tdc_fifo_tb/full}
add wave -noreg -logic {/tdc_fifo_tb/wrerr}
add wave -noreg -logic {/tdc_fifo_tb/rderr}
add wave -noreg -logic {/tdc_fifo_tb/stim_enable}
add wave -noreg -hexadecimal -literal {/tdc_fifo_tb/full_reg}
add wave -noreg -hexadecimal -literal {/tdc_fifo_tb/epty_reg}
add wave -noreg -logic {/tdc_fifo_tb/source_eptyn}
add wave -noreg -logic {/tdc_fifo_tb/dest_full}
add wave -noreg -logic {/tdc_fifo_tb/dvalid}
add wave -noreg -logic {/tdc_fifo_tb/invalid}
add wave -noreg -hexadecimal -literal {/tdc_fifo_tb/verify_cntr}
add wave -noreg -hexadecimal -literal {/tdc_fifo_tb/verify_data}
add wave -noreg  -logic {/tdc_fifo_tb/invalid_assert}


#-------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "UUT Top Level " -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Ports"  -color 255,255,255
#-------------------------------------------------------------
add wave -noreg -logic {/tdc_fifo_tb/UUT/clk}
add wave -noreg -logic {/tdc_fifo_tb/UUT/clr}
add wave -noreg -logic {/tdc_fifo_tb/UUT/rd}
add wave -noreg -logic {/tdc_fifo_tb/UUT/wr}
add wave -noreg -hexadecimal -literal {/tdc_fifo_tb/UUT/din}
add wave -noreg -logic {/tdc_fifo_tb/UUT/empty}
add wave -noreg -logic {/tdc_fifo_tb/UUT/full}
add wave -noreg -hexadecimal -literal {/tdc_fifo_tb/UUT/dout}
add wave -noreg -hexadecimal -literal {/tdc_fifo_tb/UUT/dpram_t}
add wave -noreg -hexadecimal -literal {/tdc_fifo_tb/UUT/wr_ptr}
add wave -noreg -hexadecimal -literal {/tdc_fifo_tb/UUT/rd_ptr}
add wave -noreg -hexadecimal -literal {/tdc_fifo_tb/UUT/outaddr}
add wave -noreg -hexadecimal -literal {/tdc_fifo_tb/UUT/flag_ptr}
add wave -noreg -hexadecimal -literal {/tdc_fifo_tb/UUT/dpramout}
add wave -noreg -hexadecimal -literal {/tdc_fifo_tb/UUT/dout0}
add wave -noreg -logic {/tdc_fifo_tb/UUT/dout0_en}
add wave -noreg -logic {/tdc_fifo_tb/UUT/dout_en}
add wave -noreg -logic {/tdc_fifo_tb/UUT/ram_valid}
add wave -noreg -logic {/tdc_fifo_tb/UUT/dout0_valid}
add wave -noreg -logic {/tdc_fifo_tb/UUT/dout_valid}
add wave -noreg -logic {/tdc_fifo_tb/UUT/rd_ptr_en}
add wave -noreg -logic {/tdc_fifo_tb/UUT/wr_ptr_en}
add wave -noreg -hexadecimal -literal {/tdc_fifo_tb/UUT/flag_en}
add wave -noreg -logic {/tdc_fifo_tb/UUT/full_d}
add wave -noreg -logic {/tdc_fifo_tb/UUT/empty_d}
add wave -noreg -logic {/tdc_fifo_tb/UUT/empty_i}



#-------------------------------------------
transcript on

run 500 ns;