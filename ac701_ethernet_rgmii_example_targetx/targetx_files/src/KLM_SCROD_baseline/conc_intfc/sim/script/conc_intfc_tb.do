cd C:/Users/bkunkler/Documents/CEEM/repos/Belle-II/firmware/KLM_SCROD/conc_intfc/sim/

vlib conc_intfc_lib "./library/conc_intfc_lib.lib"

#IP Cores
vcom -work conc_intfc_lib ./../../ipcore/daq_fifo.vhd
vcom -work conc_intfc_lib ./../../ipcore/trig_fifo.vhd

#TDC Files
vcom -work conc_intfc_lib ./../../tdc/source/tdc_pkg.vhd
vcom -work conc_intfc_lib ./../../tdc/source/tdc_fifo.vhd
vcom -work conc_intfc_lib ./../../tdc/source/tdc_channel.vhd
vcom -work conc_intfc_lib ./../../tdc/source/tdc.vhd

#Time Order Files
vcom -work conc_intfc_lib ./../../time_order/source/time_order_pkg.vhd
vcom -work conc_intfc_lib ./../../time_order/source/tom_2_to_1.vhd
vcom -work conc_intfc_lib ./../../time_order/source/tom_3_to_1.vhd
vcom -work conc_intfc_lib ./../../time_order/source/tom_4_to_1.vhd
vcom -work conc_intfc_lib ./../../time_order/source/tom_10_to_1.vhd
vcom -work conc_intfc_lib ./../../time_order/source/time_order.vhd

vcom -work conc_intfc_lib ./../source/conc_intfc_pkg.vhd
vcom -work conc_intfc_lib ./../source/trig_chan_calc.vhd
vcom -work conc_intfc_lib ./../source/conc_intfc.vhd
#vcom -work conc_intfc_lib ./../source/conc_intfc0.vhd

vcom -work conc_intfc_lib ./source/b2tt.vhd
vcom -work conc_intfc_lib ./source/targetx.vhd
vcom -work conc_intfc_lib ./source/daq_stim.vhd
vcom -work conc_intfc_lib ./source/aurora_model.vhd
vcom -work conc_intfc_lib ./source/conc_intfc_tb.vhd

vsim -lib conc_intfc_lib conc_intfc_tb -t 1ps -ieee_nowarn +access +r


transcript off

#-------------------------------------------------------------
wave -divider "/---------------------------"
wave -divider "Testbench Signals"
wave -divider "/---------------------------"
#-------------------------------------------------------------
add wave /conc_intfc_tb/clk
add wave /conc_intfc_tb/clk2x
add wave /conc_intfc_tb/ce
add wave /conc_intfc_tb/tb
add wave /conc_intfc_tb/tb16
add wave /conc_intfc_tb/fifo_re
add wave /conc_intfc_tb/ce_bit
add wave /conc_intfc_tb/ce_cnt
add wave /conc_intfc_tb/full_reg
add wave /conc_intfc_tb/stim_enable
add wave /conc_intfc_tb/b2tt_runreset
add wave /conc_intfc_tb/b2tt_runreset2x
add wave /conc_intfc_tb/b2tt_gtpreset
add wave /conc_intfc_tb/b2tt_trgtag
add wave /conc_intfc_tb/b2tt_ctime
add wave /conc_intfc_tb/b2tt_utime
add wave /conc_intfc_tb/b2tt_trgout
add wave /conc_intfc_tb/b2tt_fifordy
add wave /conc_intfc_tb/b2tt_fifodata
add wave /conc_intfc_tb/b2tt_fifonext
add wave /conc_intfc_tb/rx_dst_rdy_n
add wave /conc_intfc_tb/rx_sof_n
add wave /conc_intfc_tb/rx_eof_n
add wave /conc_intfc_tb/rx_src_rdy_n
add wave /conc_intfc_tb/rx_data
add wave /conc_intfc_tb/daq_dst_rdy_n
add wave /conc_intfc_tb/daq_sof_n
add wave /conc_intfc_tb/daq_eof_n
add wave /conc_intfc_tb/daq_src_rdy_n
add wave /conc_intfc_tb/daq_data
add wave /conc_intfc_tb/exttrg
add wave /conc_intfc_tb/exttb
add wave /conc_intfc_tb/tx_dst_rdy_n
add wave /conc_intfc_tb/tx_sof_n
add wave /conc_intfc_tb/tx_eof_n
add wave /conc_intfc_tb/tx_src_rdy_n
add wave /conc_intfc_tb/tx_data
add wave /conc_intfc_tb/rcl_dst_rdy_n
add wave /conc_intfc_tb/rcl_sof_n
add wave /conc_intfc_tb/rcl_eof_n
add wave /conc_intfc_tb/rcl_src_rdy_n
add wave /conc_intfc_tb/rcl_data
add wave /conc_intfc_tb/target_tb
add wave /conc_intfc_tb/target_tb16
add wave /conc_intfc_tb/status_regs

#-------------------------------------------------------------
wave -divider "/---------------------------"
wave -divider "UUT Signals"
wave -divider "/---------------------------"
#-------------------------------------------------------------
add wave /conc_intfc_tb/UUT/sys_clk
add wave /conc_intfc_tb/UUT/tdc_clk
add wave /conc_intfc_tb/UUT/ce
add wave /conc_intfc_tb/UUT/b2tt_runreset
add wave /conc_intfc_tb/UUT/b2tt_runreset2x
add wave /conc_intfc_tb/UUT/b2tt_gtpreset
add wave /conc_intfc_tb/UUT/b2tt_fifordy
add wave /conc_intfc_tb/UUT/b2tt_fifodata
add wave /conc_intfc_tb/UUT/b2tt_fifonext
add wave /conc_intfc_tb/UUT/target_tb
add wave /conc_intfc_tb/UUT/target_tb16
add wave /conc_intfc_tb/UUT/status_regs
add wave /conc_intfc_tb/UUT/rx_dst_rdy_n
add wave /conc_intfc_tb/UUT/rx_sof_n
add wave /conc_intfc_tb/UUT/rx_eof_n
add wave /conc_intfc_tb/UUT/rx_src_rdy_n
add wave /conc_intfc_tb/UUT/rx_data
add wave /conc_intfc_tb/UUT/daq_dst_rdy_n
add wave /conc_intfc_tb/UUT/daq_sof_n
add wave /conc_intfc_tb/UUT/daq_eof_n
add wave /conc_intfc_tb/UUT/daq_src_rdy_n
add wave /conc_intfc_tb/UUT/daq_data
add wave /conc_intfc_tb/UUT/exttrg
add wave /conc_intfc_tb/UUT/exttb
add wave /conc_intfc_tb/UUT/tx_dst_rdy_n
add wave /conc_intfc_tb/UUT/tx_sof_n
add wave /conc_intfc_tb/UUT/tx_eof_n
add wave /conc_intfc_tb/UUT/tx_src_rdy_n
add wave /conc_intfc_tb/UUT/tx_data
add wave /conc_intfc_tb/UUT/rcl_dst_rdy_n
add wave /conc_intfc_tb/UUT/rcl_sof_n
add wave /conc_intfc_tb/UUT/rcl_eof_n
add wave /conc_intfc_tb/UUT/rcl_src_rdy_n
add wave /conc_intfc_tb/UUT/rcl_data
add wave /conc_intfc_tb/UUT/exttrg_ctr
add wave /conc_intfc_tb/UUT/tdc_rden
add wave /conc_intfc_tb/UUT/tdc_epty
add wave /conc_intfc_tb/UUT/tdc_dout
add wave /conc_intfc_tb/UUT/to_dst_we
add wave /conc_intfc_tb/UUT/to_dout
add wave /conc_intfc_tb/UUT/to_valid
add wave /conc_intfc_tb/UUT/trg_fifo_we
add wave /conc_intfc_tb/UUT/trg_fifo_di
add wave /conc_intfc_tb/UUT/trg_fifo_re
add wave /conc_intfc_tb/UUT/trg_fifo_do
add wave /conc_intfc_tb/UUT/trg_fifo_afull
add wave /conc_intfc_tb/UUT/trg_fifo_epty
add wave /conc_intfc_tb/UUT/trg_fifo_aepty
add wave /conc_intfc_tb/UUT/trg_fifo_full
add wave /conc_intfc_tb/UUT/daq_fifo_we
add wave /conc_intfc_tb/UUT/daq_fifo_di
add wave /conc_intfc_tb/UUT/daq_fifo_re
add wave /conc_intfc_tb/UUT/daq_fifo_do
add wave /conc_intfc_tb/UUT/daq_fifo_afull
add wave /conc_intfc_tb/UUT/daq_fifo_epty
add wave /conc_intfc_tb/UUT/daq_fifo_aepty
add wave /conc_intfc_tb/UUT/daq_fifo_full
add wave /conc_intfc_tb/UUT/axis_bit
add wave /conc_intfc_tb/UUT/trg_ch
add wave /conc_intfc_tb/UUT/trg_ch_valid
add wave /conc_intfc_tb/UUT/strg_eof
add wave /conc_intfc_tb/UUT/trg_valid
add wave /conc_intfc_tb/UUT/trgsof_ctr
add wave /conc_intfc_tb/UUT/trgeof_ctr
add wave /conc_intfc_tb/UUT/zrlentrg
add wave /conc_intfc_tb/UUT/ftrgtag
add wave /conc_intfc_tb/UUT/daq_sof_d
add wave /conc_intfc_tb/UUT/daq_eof_d
add wave /conc_intfc_tb/UUT/daq_sof_q
add wave /conc_intfc_tb/UUT/daq_eof_q
add wave /conc_intfc_tb/UUT/daq_src_rdy_q
add wave /conc_intfc_tb/UUT/daq_data_q
add wave /conc_intfc_tb/UUT/daq_valid
add wave /conc_intfc_tb/UUT/daq_di_addr
add wave /conc_intfc_tb/UUT/daq_pause
add wave /conc_intfc_tb/UUT/sts_pause
add wave /conc_intfc_tb/UUT/idl_pause
add wave /conc_intfc_tb/UUT/pkttp_ctr_ld
add wave /conc_intfc_tb/UUT/pkttp_ctr_tc
add wave /conc_intfc_tb/UUT/pkttp_ctr
add wave /conc_intfc_tb/UUT/trgpkt_ctr_ld
add wave /conc_intfc_tb/UUT/trgpkt_ctr_en
add wave /conc_intfc_tb/UUT/trgpkt_ctr_tc
add wave /conc_intfc_tb/UUT/trgpkt_ctr
add wave /conc_intfc_tb/UUT/stspkt_ctr_ld
add wave /conc_intfc_tb/UUT/stspkt_ctr_en
add wave /conc_intfc_tb/UUT/stspkt_ctr_tc
add wave /conc_intfc_tb/UUT/stspkt_ctr
add wave /conc_intfc_tb/UUT/sts_sof
add wave /conc_intfc_tb/UUT/sts_eof
add wave /conc_intfc_tb/UUT/sts_sof_q
add wave /conc_intfc_tb/UUT/sts_data
add wave /conc_intfc_tb/UUT/tx_fsm_cs
add wave /conc_intfc_tb/UUT/tx_fsm_ns
add wave /conc_intfc_tb/UUT/to_ln
add wave /conc_intfc_tb/UUT/to_ch
add wave /conc_intfc_tb/UUT/to_tdc
add wave /conc_intfc_tb/UUT/trgtag
add wave /conc_intfc_tb/UUT/atrg_sof
add wave /conc_intfc_tb/UUT/atrg_eof
add wave /conc_intfc_tb/UUT/daq_sof
add wave /conc_intfc_tb/UUT/daq_eof

#-------------------------------------------------------------
wave -divider "/---------------------------"
wave -divider "Target 1"
wave -divider "/---------------------------"
#-------------------------------------------------------------
add wave /conc_intfc_tb/TARGET_GEN__1/targetx_ins/clk
add wave /conc_intfc_tb/TARGET_GEN__1/targetx_ins/ce
add wave /conc_intfc_tb/TARGET_GEN__1/targetx_ins/run_reset
add wave /conc_intfc_tb/TARGET_GEN__1/targetx_ins/stim_enable
add wave /conc_intfc_tb/TARGET_GEN__1/targetx_ins/tb
add wave /conc_intfc_tb/TARGET_GEN__1/targetx_ins/tb16
add wave /conc_intfc_tb/TARGET_GEN__1/targetx_ins/tb_ctr
add wave /conc_intfc_tb/TARGET_GEN__1/targetx_ins/tb_prng

#-------------------------------------------------------------
wave -divider "/---------------------------"
wave -divider "Target 10"
wave -divider "/---------------------------"
#-------------------------------------------------------------
add wave /conc_intfc_tb/TARGET_GEN__10/targetx_ins/clk
add wave /conc_intfc_tb/TARGET_GEN__10/targetx_ins/ce
add wave /conc_intfc_tb/TARGET_GEN__10/targetx_ins/run_reset
add wave /conc_intfc_tb/TARGET_GEN__10/targetx_ins/stim_enable
add wave /conc_intfc_tb/TARGET_GEN__10/targetx_ins/tb
add wave /conc_intfc_tb/TARGET_GEN__10/targetx_ins/tb16
add wave /conc_intfc_tb/TARGET_GEN__10/targetx_ins/tb_ctr
add wave /conc_intfc_tb/TARGET_GEN__10/targetx_ins/tb_prng



transcript on

run 50 us;
