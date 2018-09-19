cd C:\Users\bkunkler\Documents\CEEM\repos\Belle-II\firmware\KLM_SCROD\conc_intfc\sim
vlib trig_chan_tb_lib "./library/trig_chan_tb_lib"

###########################################################
#UUT
###########################################################
vcom -work trig_chan_tb_lib .\..\source\trig_chan_calc.vhd

###########################################################
#Models and testbench
###########################################################
vcom -work trig_chan_tb_lib .\source\trig_chan_calc_tb.vhd;

vsim trig_chan_calc_tb -t 1ps -ieee_nowarn

@transcript off

#-----------------------------------------------------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Testbench Signals" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
#-----------------------------------------------------------------------------------------------------------
add wave -noreg -logic {/trig_chan_calc_tb/clk}
add wave -noreg -logic {/trig_chan_calc_tb/to_we}
add wave -noreg -logic {/trig_chan_calc_tb/trg_valid}
add wave -noreg -logic {/trig_chan_calc_tb/axis_bit}
add wave -noreg -hexadecimal -literal {/trig_chan_calc_tb/trg_ch}
add wave -noreg -logic {/trig_chan_calc_tb/to_ce}
add wave -noreg -hexadecimal -literal {/trig_chan_calc_tb/to_ln}
add wave -noreg -hexadecimal -literal {/trig_chan_calc_tb/to_ch}
add wave -noreg -logic {/trig_chan_calc_tb/axis_bit_v}
add wave -noreg -hexadecimal -literal {/trig_chan_calc_tb/trg_ch_v}

add wave -noreg -logic {/trig_chan_calc_tb/invalid}


#-----------------------------------------------------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "UUT" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
#-----------------------------------------------------------------------------------------------------------
add wave -noreg -logic {/trig_chan_calc_tb/UUT/clk}
add wave -noreg -logic {/trig_chan_calc_tb/UUT/we}
add wave -noreg -hexadecimal -literal {/trig_chan_calc_tb/UUT/lane}
add wave -noreg -hexadecimal -literal {/trig_chan_calc_tb/UUT/chan}
add wave -noreg -logic {/trig_chan_calc_tb/UUT/valid}
add wave -noreg -logic {/trig_chan_calc_tb/UUT/axis_bit}
add wave -noreg -hexadecimal -literal {/trig_chan_calc_tb/UUT/trig_chan}
add wave -noreg -hexadecimal -literal {/trig_chan_calc_tb/UUT/a}
add wave -noreg -hexadecimal -literal {/trig_chan_calc_tb/UUT/b}
add wave -noreg -hexadecimal -literal {/trig_chan_calc_tb/UUT/c}
add wave -noreg -hexadecimal -literal {/trig_chan_calc_tb/UUT/d}
add wave -noreg -hexadecimal -literal {/trig_chan_calc_tb/UUT/p}
add wave -noreg -hexadecimal -literal {/trig_chan_calc_tb/UUT/b_d0}
add wave -noreg -hexadecimal -literal {/trig_chan_calc_tb/UUT/lane_cval}
add wave -noreg -hexadecimal -literal {/trig_chan_calc_tb/UUT/valid_shift}


@transcript off

run 25 us;