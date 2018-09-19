cd C:/Users/bkunkler/Documents/CEEM/repos/Belle-II/firmware/TX9UMB-4/src/KLM_SCROD_baseline/klm_scrod/sim/


###########################################################
#FTSW
###########################################################
vlib ft2u_lib "./library/ft2u_lib"
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/coregen/m_icon.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/coregen/m_ila.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/tt_types.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/b2tt_iscan.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/b2tt_ddr_v5.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/tt_utime.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/b2tt_8b10b.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/b2tt_symbols.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/x_decode.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/x_encode.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/o_decode.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/m_fifo.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/m_count.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/m_decode.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/m_dumtrig.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/m_encode.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/m_genbusy.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/m_gentrig.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/m_pipeline.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/m_trgdelay.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/m_collect.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/m_jtag.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/tt_aux.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/tt_blink.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/tt_dump.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/tt_ictrl.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/tt_ioswitch.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/tt_jitterspi.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/tt_oack.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/tt_oclk.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/tt_orsv.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/tt_otrg.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/tt_phasedet.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/tt_regs.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/tt_tlu.vhd
vcom -work ft2u_lib ./../../integration/det_intfc/ft2u/ft2u/ft2u.vhd

###########################################################
#Concentrator Interface
###########################################################
vlib klm_scrod_lib "./library/klm_scrod_lib.lib"
###############################
#IP Cores
###############################
vcom -work klm_scrod_lib ./../../ipcore/daq_fifo.vhd
vcom -work klm_scrod_lib ./../../ipcore/trig_fifo.vhd
###############################
#TDC Files
###############################
vcom -work klm_scrod_lib ./../../tdc/source/tdc_pkg.vhd
vcom -work klm_scrod_lib ./../../tdc/source/tdc_fifo.vhd
vcom -work klm_scrod_lib ./../../tdc/source/tdc_channel.vhd
vcom -work klm_scrod_lib ./../../tdc/source/tdc.vhd
###############################
#Time Order Files
###############################
vcom -work klm_scrod_lib ./../../time_order/source/time_order_pkg.vhd
vcom -work klm_scrod_lib ./../../time_order/source/tom_2_to_1.vhd
vcom -work klm_scrod_lib ./../../time_order/source/tom_3_to_1.vhd
vcom -work klm_scrod_lib ./../../time_order/source/tom_4_to_1.vhd
vcom -work klm_scrod_lib ./../../time_order/source/tom_10_to_1.vhd
vcom -work klm_scrod_lib ./../../time_order/source/time_order.vhd

vcom -work klm_scrod_lib ./../../conc_intfc/source/conc_intfc_pkg.vhd
vcom -work klm_scrod_lib ./../../conc_intfc/source/trig_chan_calc.vhd
vcom -work klm_scrod_lib ./../../conc_intfc/source/conc_intfc.vhd

###############################
#Aurora Core
###############################
vcom -work klm_scrod_lib ./../../klm_aurora/source/aurora_tile.vhd
vcom -work klm_scrod_lib ./../../klm_aurora/source/transceiver_wrapper.vhd
vcom -work klm_scrod_lib ./../../klm_aurora/source/aurora_pkg.vhd
vcom -work klm_scrod_lib ./../../klm_aurora/source/chbond_count_dec.vhd
vcom -work klm_scrod_lib ./../../klm_aurora/source/err_detect.vhd
vcom -work klm_scrod_lib ./../../klm_aurora/source/lane_init_sm.vhd
vcom -work klm_scrod_lib ./../../klm_aurora/source/sym_dec.vhd
vcom -work klm_scrod_lib ./../../klm_aurora/source/sym_gen.vhd
vcom -work klm_scrod_lib ./../../klm_aurora/source/aurora_lane.vhd
vcom -work klm_scrod_lib ./../../klm_aurora/source/channel_err_detect.vhd
vcom -work klm_scrod_lib ./../../klm_aurora/source/channel_init_sm.vhd
vcom -work klm_scrod_lib ./../../klm_aurora/source/idle_and_ver_gen.vhd
vcom -work klm_scrod_lib ./../../klm_aurora/source/global_logic.vhd
vcom -work klm_scrod_lib ./../../klm_aurora/source/tx_ll_control.vhd
vcom -work klm_scrod_lib ./../../klm_aurora/source/tx_ll_datapath.vhd
vcom -work klm_scrod_lib ./../../klm_aurora/source/tx_ll.vhd
vcom -work klm_scrod_lib ./../../klm_aurora/source/rx_ll_pdu_datapath.vhd
vcom -work klm_scrod_lib ./../../klm_aurora/source/rx_ll.vhd
vcom -work klm_scrod_lib ./../../klm_aurora/source/standard_cc_module.vhd
vcom -work klm_scrod_lib ./../../klm_aurora/source/klm_aurora.vhd
vcom -work klm_scrod_lib ./../../klm_aurora/source/klm_aurora_intfc.vhd

###############################
#B2TT
###############################
vcom -work klm_scrod_lib ./../../b2tt/b2tt/b2tt_symbols.vhd
vcom -work klm_scrod_lib ./../../b2tt/b2tt/b2tt_iscan.vhd
vcom -work klm_scrod_lib ./../../b2tt/b2tt/b2tt_ddr_s6.vhd
vcom -work klm_scrod_lib ./../../b2tt/b2tt/b2tt_clk_s6.vhd
vcom -work klm_scrod_lib ./../../b2tt/b2tt/b2tt_fifo_s6.vhd
vcom -work klm_scrod_lib ./../../b2tt/b2tt/b2tt_8b10b.vhd
vcom -work klm_scrod_lib ./../../b2tt/b2tt/b2tt_encode.vhd
vcom -work klm_scrod_lib ./../../b2tt/b2tt/b2tt_payload.vhd
vcom -work klm_scrod_lib ./../../b2tt/b2tt/b2tt_decode.vhd
vcom -work klm_scrod_lib ./../../b2tt/b2tt/b2tt.vhd

###############################
#Top Level
###############################					   
vcom -work klm_scrod_lib ./../source/klm_scrod_pkg.vhd
vcom -work klm_scrod_lib ./../source/frame_gen.vhd
vcom -work klm_scrod_lib ./../source/daq_gen.vhd
vcom -work klm_scrod_lib ./../source/daq_gen_readout.vhd
vcom -work klm_scrod_lib ./../source/run_ctrl.vhd
vcom -work klm_scrod_lib ./../source/sfp_stat_ctrl.vhd
vcom -work klm_scrod_lib ./../source/timing_ctrl_pkg.vhd
vcom -work klm_scrod_lib ./../source/timing_ctrl.vhd
vcom -work klm_scrod_lib ./../source/klm_scrod.vhd

###########################################################
#Models and testbench
###########################################################
#vcom -work klm_scrod_lib ./source/frame_check.vhd;
#vcom -work klm_scrod_lib ./source/frame_gen.vhd;


vcom -work klm_scrod_lib ./source/targetx.vhd
vcom -work klm_scrod_lib ./source/run_ctrl_stim.vhd
#vcom -work klm_scrod_lib ./source/aurora_model.vhd

vcom -work klm_scrod_lib ./source/klm_scrod_tb.vhd;

vsim -lib klm_scrod_lib klm_scrod_tb -t 1ps -ieee_nowarn +access +r

@transcript off

#-----------------------------------------------------------------------------------------------------------
wave -divider "/---------------------------"
wave -divider "Testbench Signals"
wave -divider "/---------------------------"
#-----------------------------------------------------------------------------------------------------------
add wave -noreg -logic {/klm_scrod_tb/stim_enable}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/full_reg}
add wave -noreg -logic {/klm_scrod_tb/f2tu_f_led1y_b}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/f2tu_f_d}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/f2tu_f_a}
add wave -noreg -logic {/klm_scrod_tb/ft2u_ads}
add wave -noreg -logic {/klm_scrod_tb/ft2u_wr}
add wave -noreg -logic {/klm_scrod_tb/ft2u_c_id1}
add wave -noreg -logic {/klm_scrod_tb/ft2u_c_id2}
add wave -noreg -logic {/klm_scrod_tb/ft2u_f_xen}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/ft2u_f_ckmux}
add wave -noreg -logic {/klm_scrod_tb/ft2u_f_tck}
add wave -noreg -logic {/klm_scrod_tb/ft2u_f_tms}
add wave -noreg -logic {/klm_scrod_tb/ft2u_f_tdi}
add wave -noreg -logic {/klm_scrod_tb/ft2u_f_tdo}
add wave -noreg -logic {/klm_scrod_tb/ft2u_j_pd_b}
add wave -noreg -logic {/klm_scrod_tb/ft2u_j_plllock}
add wave -noreg -logic {/klm_scrod_tb/ft2u_j_spiclk}
add wave -noreg -logic {/klm_scrod_tb/ft2u_j_spile}
add wave -noreg -logic {/klm_scrod_tb/ft2u_j_spimiso}
add wave -noreg -logic {/klm_scrod_tb/ft2u_j_spimosi}
add wave -noreg -logic {/klm_scrod_tb/ft2u_j_testsync}
add wave -noreg -logic {/klm_scrod_tb/ft2u_f_ick_p}
add wave -noreg -logic {/klm_scrod_tb/ft2u_f_ick_n}
add wave -noreg -logic {/klm_scrod_tb/ft2u_f_lck_p}
add wave -noreg -logic {/klm_scrod_tb/ft2u_f_lck_n}
add wave -noreg -logic {/klm_scrod_tb/ft2u_s_jck_p}
add wave -noreg -logic {/klm_scrod_tb/ft2u_s_jck_n}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/ft2u_o_aux_n}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/ft2u_o_aux_p}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/ft2u_i_aux_n}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/ft2u_i_aux_p}
add wave -noreg -logic {/klm_scrod_tb/ft2u_i_trg_n}
add wave -noreg -logic {/klm_scrod_tb/ft2u_i_trg_p}
add wave -noreg -logic {/klm_scrod_tb/ft2u_i_ack_n}
add wave -noreg -logic {/klm_scrod_tb/ft2u_i_ack_p}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/ft2u_o_clk_n}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/ft2u_o_clk_p}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/ft2u_o_trg_n}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/ft2u_o_trg_p}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/ft2u_o_ack_n}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/ft2u_o_ack_p}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/ft2u_o_rsv_n}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/ft2u_o_rsv_p}
add wave -noreg -logic {/klm_scrod_tb/ft2u_i_ledy_b}
add wave -noreg -logic {/klm_scrod_tb/ft2u_i_ledg_b}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/ft2u_o_ledy_b}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/ft2u_o_ledg_b}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/ft2u_m_a}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/ft2u_m_d}
add wave -noreg -logic {/klm_scrod_tb/ft2u_m_wr}
add wave -noreg -logic {/klm_scrod_tb/ft2u_m_ads}
add wave -noreg -logic {/klm_scrod_tb/ft2u_m_lck}
add wave -noreg -logic {/klm_scrod_tb/target_reset}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/target_tb}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/target_tb16}
add wave -noreg -logic {/klm_scrod_tb/conc_user_clk}
add wave -noreg -logic {/klm_scrod_tb/conc_sync_clk}
add wave -noreg -logic {/klm_scrod_tb/conc_reset}
add wave -noreg -logic {/klm_scrod_tb/conc_gt_reset}
add wave -noreg -logic {/klm_scrod_tb/conc_plllock}
add wave -noreg -logic {/klm_scrod_tb/conc_tx_dst_rdy_n}
add wave -noreg -logic {/klm_scrod_tb/conc_tx_src_rdy_n}
add wave -noreg -logic {/klm_scrod_tb/conc_tx_sof_n}
add wave -noreg -logic {/klm_scrod_tb/conc_tx_eof_n}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/conc_tx_d}
add wave -noreg -logic {/klm_scrod_tb/conc_tx_rem}
add wave -noreg -logic {/klm_scrod_tb/conc_rx_src_rdy_n}
add wave -noreg -logic {/klm_scrod_tb/conc_rx_sof_n}
add wave -noreg -logic {/klm_scrod_tb/conc_rx_eof_n}
add wave -noreg -logic {/klm_scrod_tb/conc_rx_rem}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/conc_rx_d}
add wave -noreg -logic {/klm_scrod_tb/conc_gtlock}
add wave -noreg -logic {/klm_scrod_tb/conc_hard_err}
add wave -noreg -logic {/klm_scrod_tb/conc_soft_err}
add wave -noreg -logic {/klm_scrod_tb/conc_frame_err}
add wave -noreg -logic {/klm_scrod_tb/conc_channel_up}
add wave -noreg -logic {/klm_scrod_tb/conc_lane_up}
add wave -noreg -logic {/klm_scrod_tb/conc_warn_cc}
add wave -noreg -logic {/klm_scrod_tb/conc_do_cc}
add wave -noreg -logic {/klm_scrod_tb/conc_powerdown}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/conc_loopback}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/conc_err_count}
add wave -noreg -logic {/klm_scrod_tb/conc_rxp}
add wave -noreg -logic {/klm_scrod_tb/conc_rxn}
add wave -noreg -logic {/klm_scrod_tb/conc_txp}
add wave -noreg -logic {/klm_scrod_tb/conc_txn}
add wave -noreg -logic {/klm_scrod_tb/scrod_ttdclk_p}
add wave -noreg -logic {/klm_scrod_tb/scrod_ttdclk_n}
add wave -noreg -logic {/klm_scrod_tb/scrod_ttdtrg_p}
add wave -noreg -logic {/klm_scrod_tb/scrod_ttdtrg_n}
add wave -noreg -logic {/klm_scrod_tb/scrod_ttdack_p}
add wave -noreg -logic {/klm_scrod_tb/scrod_ttdack_n}
add wave -noreg -logic {/klm_scrod_tb/scrod_ttdrsv_p}
add wave -noreg -logic {/klm_scrod_tb/scrod_ttdrsv_n}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/scrod_target_tb}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/scrod_target_tb16}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/scrod_mgttxfault}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/scrod_mgtmod0}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/scrod_mgtlos}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/scrod_mgttxdis}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/scrod_mgtmod2}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/scrod_mgtmod1}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/scrod_mgtrate}
add wave -noreg -logic {/klm_scrod_tb/scrod_mgtrxp}
add wave -noreg -logic {/klm_scrod_tb/scrod_mgtrxn}
add wave -noreg -logic {/klm_scrod_tb/scrod_mgttxp}
add wave -noreg -logic {/klm_scrod_tb/scrod_mgttxn}
add wave -noreg -logic {/klm_scrod_tb/scrod_ex_trig1}
add wave -noreg -logic {/klm_scrod_tb/scrod_ftsw_aux}
add wave -noreg -logic {/klm_scrod_tb/scrod_status}
add wave -noreg -logic {/klm_scrod_tb/scrod_control}



#-----------------------------------------------------------------------------------------------------------
wave -divider "/---------------------------"
wave -divider "UUT"
wave -divider "/---------------------------"
#-----------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------
wave -divider "/---------------------------"
wave -divider "Top Level"
wave -divider "/---------------------------"
#-----------------------------------------------------------------------------------
add wave -noreg -logic {/klm_scrod_tb/UUT/ttdclkp}
add wave -noreg -logic {/klm_scrod_tb/UUT/ttdclkn}
add wave -noreg -logic {/klm_scrod_tb/UUT/ttdtrgp}
add wave -noreg -logic {/klm_scrod_tb/UUT/ttdtrgn}
add wave -noreg -logic {/klm_scrod_tb/UUT/ttdrsvp}
add wave -noreg -logic {/klm_scrod_tb/UUT/ttdrsvn}
add wave -noreg -logic {/klm_scrod_tb/UUT/ttdackp}
add wave -noreg -logic {/klm_scrod_tb/UUT/ttdackn}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/target_tb}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/target_tb16}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/mgttxfault}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/mgtmod0}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/mgtlos}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/mgttxdis}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/mgtmod2}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/mgtmod1}
add wave -noreg -logic {/klm_scrod_tb/UUT/mgtrxp}
add wave -noreg -logic {/klm_scrod_tb/UUT/mgtrxn}
add wave -noreg -logic {/klm_scrod_tb/UUT/mgttxp}
add wave -noreg -logic {/klm_scrod_tb/UUT/mgttxn}
add wave -noreg -logic {/klm_scrod_tb/UUT/ex_trig1}
add wave -noreg -logic {/klm_scrod_tb/UUT/exttb}
add wave -noreg -logic {/klm_scrod_tb/UUT/ftsw_aux}
add wave -noreg -logic {/klm_scrod_tb/UUT/status_fake}
add wave -noreg -logic {/klm_scrod_tb/UUT/control_fake}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/mgttxfault_i}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/mgtmod0_i}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/mgtlos_i}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/mgttxdis_i}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/mgtmod2_i}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/mgtmod1_i}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/target_tb_i}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/target_tb16_i}
add wave -noreg -logic {/klm_scrod_tb/UUT/b2tt_ctime_i}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/status_vec_i}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/ctrl_vec_i}
add wave -noreg -logic {/klm_scrod_tb/UUT/ex_trig1_i}
add wave -noreg -logic {/klm_scrod_tb/UUT/status_fake_i}
add wave -noreg -logic {/klm_scrod_tb/UUT/control_fake_i}
add wave -noreg -logic {/klm_scrod_tb/UUT/sys_clk_ib}
add wave -noreg -logic {/klm_scrod_tb/UUT/sys_clk2x_ib}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/mgttxfault_qi}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/mgtmod0_qi}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/mgtlos_qi}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/mgttxdis_iq}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/mgtmod2_iq}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/mgtmod1_iq}
add wave -noreg -logic {/klm_scrod_tb/UUT/b2tt_ctime_iq}
add wave -noreg -logic {/klm_scrod_tb/UUT/status_fake_iq}
add wave -noreg -logic {/klm_scrod_tb/UUT/control_fake_iq}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/b2tt_id}
add wave -noreg -logic {/klm_scrod_tb/UUT/b2tt_b2clkup}
add wave -noreg -logic {/klm_scrod_tb/UUT/b2tt_b2ttup}
add wave -noreg -logic {/klm_scrod_tb/UUT/b2tt_trgout}
add wave -noreg -logic {/klm_scrod_tb/UUT/b2tt_b2plllk}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/b2tt_utime}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/b2tt_ctime}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/b2tt_divclk1}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/b2tt_divclk2}
add wave -noreg -logic {/klm_scrod_tb/UUT/b2tt_runreset}
add wave -noreg -logic {/klm_scrod_tb/UUT/b2tt_feereset}
add wave -noreg -logic {/klm_scrod_tb/UUT/b2tt_gtpreset}
add wave -noreg -logic {/klm_scrod_tb/UUT/b2tt_b2linkup}
add wave -noreg -logic {/klm_scrod_tb/UUT/b2tt_b2linkwe}
add wave -noreg -logic {/klm_scrod_tb/UUT/b2tt_b2lreset}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/b2tt_b2ttver}
add wave -noreg -logic {/klm_scrod_tb/UUT/b2tt_fifordy}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/b2tt_fifodata}
add wave -noreg -logic {/klm_scrod_tb/UUT/b2tt_fifonext}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/b2tt_exprun}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/b2tt_trgtag}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/b2tt_regdbg}
add wave -noreg -logic {/klm_scrod_tb/UUT/rx_dst_rdy_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/rx_sof_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/rx_eof_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/rx_src_rdy_n}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/rx_data}
add wave -noreg -logic {/klm_scrod_tb/UUT/tx_dst_rdy_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/tx_sof_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/tx_eof_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/tx_src_rdy_n}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/tx_data}
add wave -noreg -logic {/klm_scrod_tb/UUT/gtlock}
add wave -noreg -logic {/klm_scrod_tb/UUT/hard_err}
add wave -noreg -logic {/klm_scrod_tb/UUT/soft_err}
add wave -noreg -logic {/klm_scrod_tb/UUT/frame_err}
add wave -noreg -logic {/klm_scrod_tb/UUT/channel_up}
add wave -noreg -logic {/klm_scrod_tb/UUT/lane_up}
add wave -noreg -logic {/klm_scrod_tb/UUT/warn_cc}
add wave -noreg -logic {/klm_scrod_tb/UUT/do_cc}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/tdc_ce}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/b2tt_runreset2x}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/status_regs}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/ctrl_regs}
add wave -noreg -logic {/klm_scrod_tb/UUT/daq_dst_rdy_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/daq_sof_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/daq_eof_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/daq_src_rdy_n}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/daq_data}
add wave -noreg -logic {/klm_scrod_tb/UUT/rcl_dst_rdy_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/rcl_sof_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/rcl_eof_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/rcl_src_rdy_n}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/rcl_data}
add wave -noreg -logic {/klm_scrod_tb/UUT/fault_flag}
add wave -noreg -logic {/klm_scrod_tb/UUT/los_flag}
add wave -noreg -logic {/klm_scrod_tb/UUT/mod_flag}

#-----------------------------------------------------------------------------------
wave -divider "/---------------------------"
wave -divider "Data Concentrator Interface"
wave -divider "/---------------------------"
#-----------------------------------------------------------------------------------
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/sys_clk}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/tdc_clk}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/ce}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/b2tt_runreset}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/b2tt_runreset2x}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/b2tt_gtpreset}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/b2tt_fifordy}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/b2tt_fifodata}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/b2tt_fifonext}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/target_tb}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/target_tb16}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/status_regs}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/rx_dst_rdy_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/rx_sof_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/rx_eof_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/rx_src_rdy_n}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/rx_data}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/daq_dst_rdy_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/daq_sof_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/daq_eof_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/daq_src_rdy_n}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/daq_data}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/exttrg}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/exttb}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/tx_dst_rdy_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/tx_sof_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/tx_eof_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/tx_src_rdy_n}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/tx_data}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/rcl_dst_rdy_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/rcl_sof_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/rcl_eof_n}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/rcl_src_rdy_n}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/rcl_data}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/tdc_rden}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/tdc_epty}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/tdc_dout}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/to_dst_we}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/exttrg_ctr}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/to_dout}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/to_valid}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/trg_fifo_we}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/trg_fifo_di}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/trg_fifo_re}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/trg_fifo_do}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/trg_fifo_afull}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/trg_fifo_epty}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/trg_fifo_aepty}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/trg_fifo_full}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/daq_fifo_we}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/daq_fifo_di}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/daq_fifo_re}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/daq_fifo_do}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/daq_fifo_afull}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/daq_fifo_epty}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/daq_fifo_aepty}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/daq_fifo_full}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/axis_bit}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/trg_ch}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/trg_valid}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/daq_sof_q}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/daq_eof_q}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/daq_data_q}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/daq_valid}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/daq_di_addr}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/daq_cnt}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/pkttp_ctr_ld}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/pkttp_ctr_tc}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/pkttp_ctr}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/trgpkt_ctr_ld}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/trgpkt_ctr_tc}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/trgpkt_ctr}
add wave -noreg -literal {/klm_scrod_tb/UUT/conc_intfc_ins/tx_fsm_cs}
add wave -noreg -literal {/klm_scrod_tb/UUT/conc_intfc_ins/tx_fsm_ns}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/to_ln}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/to_ch}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/to_tdc}
add wave -noreg -hexadecimal -literal {/klm_scrod_tb/UUT/conc_intfc_ins/trgtag}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/trg_sof}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/trg_eof}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/daq_sof}
add wave -noreg -logic {/klm_scrod_tb/UUT/conc_intfc_ins/daq_eof}


@transcript off

#run 3 ms;
#run 2500 us;
run 1000 ns;