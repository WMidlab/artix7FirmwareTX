cd C:/Users/bkunkler/Documents/CEEM/repos/Belle-II/firmware/KLM_SCROD/klm_scrod/sim

vlib daq_gen_lib "./library/daq_gen_lib"
#vcom -work daq_gen_lib ./../source/daq_gen_notc.vhd
vcom -work daq_gen_lib ./../source/daq_gen.vhd

vcom -work daq_gen_lib ./source/daq_gen_tb.vhd

vsim daq_gen_tb -t 1ps -ieee_nowarn

@transcript off

#-----------------------------------------------------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "Testbench Signals" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
#-----------------------------------------------------------------------------------------------------------
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
add wave -noreg -logic {/daq_gen_tb/trgfifo}
add wave -noreg -hexadecimal -literal {/daq_gen_tb/dst_reg}
add wave -noreg -hexadecimal -literal {/daq_gen_tb/wd_ctr}
add wave -noreg -logic {/daq_gen_tb/bad_sof}
add wave -noreg -logic {/daq_gen_tb/bad_eof}
add wave -noreg -logic {/daq_gen_tb/bad_len}
add wave -noreg -logic {/daq_gen_tb/bad_chg}




#-----------------------------------------------------------------------------------------------------------
wave -divider "/---------------------------" -color 255,255,255
wave -divider "UUT" -color 255,255,255
wave -divider "/---------------------------" -color 255,255,255
#-----------------------------------------------------------------------------------------------------------
add wave -noreg -logic {/daq_gen_tb/UUT/clk}
add wave -noreg -logic {/daq_gen_tb/UUT/reset}
add wave -noreg -logic {/daq_gen_tb/UUT/channel_up}
add wave -noreg -hexadecimal -literal {/daq_gen_tb/UUT/addr}
add wave -noreg -logic {/daq_gen_tb/UUT/trigger}
add wave -noreg -logic {/daq_gen_tb/UUT/trgrdy}
add wave -noreg -logic {/daq_gen_tb/UUT/trgnext}
add wave -noreg -hexadecimal -literal {/daq_gen_tb/UUT/ctime}
add wave -noreg -logic {/daq_gen_tb/UUT/tx_dst_rdy_n}
add wave -noreg -logic {/daq_gen_tb/UUT/tx_src_rdy_n}
add wave -noreg -logic {/daq_gen_tb/UUT/tx_sof_n}
add wave -noreg -logic {/daq_gen_tb/UUT/tx_eof_n}
add wave -noreg -hexadecimal -literal {/daq_gen_tb/UUT/tx_d}
add wave -noreg -logic {/daq_gen_tb/UUT/tx_rem}
add wave -noreg -literal {/daq_gen_tb/UUT/daq_fsm_cs_t}
add wave -noreg -literal {/daq_gen_tb/UUT/ll_fsm_cs_t}
add wave -noreg -literal {/daq_gen_tb/UUT/trg_cs}
add wave -noreg -logic {/daq_gen_tb/UUT/scint_trg}
add wave -noreg -hexadecimal -literal {/daq_gen_tb/UUT/missed_trg}
add wave -noreg -logic {/daq_gen_tb/UUT/scint_trgrdy}
add wave -noreg -hexadecimal -literal {/daq_gen_tb/UUT/abd_init}
add wave -noreg -logic {/daq_gen_tb/UUT/abd_ctr_ld}
add wave -noreg -hexadecimal -literal {/daq_gen_tb/UUT/abd_ctr}
add wave -noreg -logic {/daq_gen_tb/UUT/abd_ctr_tc}
add wave -noreg -hexadecimal -literal {/daq_gen_tb/UUT/pdt_init}
add wave -noreg -logic {/daq_gen_tb/UUT/pdt_ctr_en}
add wave -noreg -hexadecimal -literal {/daq_gen_tb/UUT/pdt_ctr}
add wave -noreg -logic {/daq_gen_tb/UUT/pdt_ctr_tc}
add wave -noreg -hexadecimal -literal {/daq_gen_tb/UUT/pdw_init}
add wave -noreg -logic {/daq_gen_tb/UUT/pdw_ctr_ld}
add wave -noreg -hexadecimal -literal {/daq_gen_tb/UUT/pdw_ctr}
add wave -noreg -logic {/daq_gen_tb/UUT/pdw_ctr_lc}
add wave -noreg -logic {/daq_gen_tb/UUT/pdw_ctr_tc}
add wave -noreg -hexadecimal -literal {/daq_gen_tb/UUT/pds_init}
add wave -noreg -logic {/daq_gen_tb/UUT/pds_ctr_ld}
add wave -noreg -hexadecimal -literal {/daq_gen_tb/UUT/pds_ctr}
add wave -noreg -logic {/daq_gen_tb/UUT/pds_ctr_lc}
add wave -noreg -logic {/daq_gen_tb/UUT/pds_ctr_tc}
add wave -noreg -logic {/daq_gen_tb/UUT/zlt_en}
add wave -noreg -hexadecimal -literal {/daq_gen_tb/UUT/tdc_ctr}
#add wave -noreg -hexadecimal -literal {/daq_gen_tb/UUT/dmux_sel}

@transcript off

run 100 us;
