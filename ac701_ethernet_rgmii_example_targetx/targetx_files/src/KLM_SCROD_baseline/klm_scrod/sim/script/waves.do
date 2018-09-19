onerror { resume }
transcript off
add wave -noreg -logic {/daq_gen_tb/clk}
add wave -noreg -logic {/daq_gen_tb/reset}
add wave -noreg -logic {/daq_gen_tb/channel_up}
add wave -noreg -hexadecimal -literal {/daq_gen_tb/addr}
add wave -noreg -logic {/daq_gen_tb/trigger}
add wave -noreg -logic {/daq_gen_tb/trgrdy}
add wave -noreg -logic {/daq_gen_tb/trgnext}
add wave -noreg -hexadecimal -literal {/daq_gen_tb/ctime}
add wave -noreg -logic {/daq_gen_tb/tx_dst_rdy_n}
add wave -noreg -logic {/daq_gen_tb/tx_src_rdy_n}
add wave -noreg -logic {/daq_gen_tb/tx_sof_n}
add wave -noreg -logic {/daq_gen_tb/tx_eof_n}
add wave -noreg -hexadecimal -literal {/daq_gen_tb/tx_d}
add wave -noreg -logic {/daq_gen_tb/tx_rem}
add wave -noreg -logic {/daq_gen_tb/stim_enable}

add wave -noreg -hexadecimal -literal {/daq_gen_tb/dst_reg}
add wave -noreg -hexadecimal -literal {/daq_gen_tb/wd_ctr}
add wave -noreg -logic {/daq_gen_tb/bad_sof}
add wave -noreg -logic {/daq_gen_tb/bad_eof}
add wave -noreg -logic {/daq_gen_tb/bad_len}
add wave -noreg -logic {/daq_gen_tb/bad_chg}
add wave -noreg -logic {/daq_gen_tb/trigger'DELAYED~13}
add wave -noreg -logic {/daq_gen_tb/trgrdy'DELAYED~13}
cursor "Cursor 1" 0ps  
transcript on
