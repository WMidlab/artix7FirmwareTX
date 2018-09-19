Regenerate Core - fifo_wr16_rd32: All required files are available.

Process "Regenerate Core" completed successfully
Regenerate Core - fifo_wr32_rd16: All required files are available.

Process "Regenerate Core" completed successfully
Regenerate Core - FIFO_INP_0: All required files are available.

Process "Regenerate Core" completed successfully
Regenerate Core - FIFO_OUT_1: All required files are available.

Process "Regenerate Core" completed successfully
Regenerate Core - FIFO_OUT_0: All required files are available.

Process "Regenerate Core" completed successfully
Regenerate Core - s6_vio: All required files are available.

Process "Regenerate Core" completed successfully
Regenerate Core - s6_icon: All required files are available.

Process "Regenerate Core" completed successfully
Regenerate Core - buffer_fifo_wr32_rd32: All required files are available.

Process "Regenerate Core" completed successfully
Regenerate Core - waveform_fifo_wr32_rd32: All required files are available.

Process "Regenerate Core" completed successfully
Regenerate Core - daq_fifo: All required files are available.

Process "Regenerate Core" completed successfully
Regenerate Core - trig_fifo: All required files are available.

Process "Regenerate Core" completed successfully
Regenerate Core - blk_mem_gen_v7_3: All required files are available.

Process "Regenerate Core" completed successfully

Started : "Synthesize - XST".
Running xst...
Command Line: xst -intstyle ise -filter "C:/Users/isar/Documents/code4/TX9UMB-3/ise-project/iseconfig/filter.filter" -ifn "C:/Users/isar/Documents/code4/TX9UMB-3/ise-project/scrod_top_A4.xst" -ofn "C:/Users/isar/Documents/code4/TX9UMB-3/ise-project/scrod_top_A4.syr"
Reading design: scrod_top_A4.prj

=========================================================================
*                          HDL Parsing                                  *
=========================================================================
Analyzing Verilog file "C:\Users\isar\Documents\code4\TX9UMB-3\src\usb_interfaces\USB_IFCLK_XC3S400.v" into library work
Parsing module <USB_IFCLK_XC3S400>.
Analyzing Verilog file "C:\Users\isar\Documents\code4\TX9UMB-3\src\usb_interfaces\usb_slave_fifo_interface_io.v" into library work
Parsing module <usb_slave_fifo_interface_io>.
Analyzing Verilog file "C:\Users\isar\Documents\code4\TX9UMB-3\src\usb_interfaces\usb_slave_fifo_interface.v" into library work
Parsing module <usb_slave_fifo_interface>.
Analyzing Verilog file "C:\Users\isar\Documents\code4\TX9UMB-3\src\usb_interfaces\usb_init.v" into library work
Parsing module <usb_init>.
Analyzing Verilog file "C:\Users\isar\Documents\code4\TX9UMB-3\src\usb_interfaces\usb_top.v" into library work
Parsing module <usb_top>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\ise-project\ipcore_dir\blk_mem_gen_v7_3.vhd" into library work
Parsing entity <blk_mem_gen_v7_3>.
Parsing architecture <blk_mem_gen_v7_3_a> of entity <blk_mem_gen_v7_3>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\time_order\source\time_order_pkg.vhd" into library work
Parsing package <time_order_pkg>.
Parsing package body <time_order_pkg>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\aurora_interfaces\base_resources\aurora_interface_0_aurora_pkg.vhd" into library work
Parsing package <AURORA_PKG>.
Parsing package body <AURORA_PKG>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\time_order\source\tom_2_to_1.vhd" into library work
Parsing entity <tom_2_to_1>.
Parsing architecture <behave> of entity <tom_2_to_1>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\aurora_interfaces\gt\aurora_interface_0_tile.vhd" into library work
Parsing entity <AURORA_INTERFACE_0_TILE>.
Parsing architecture <RTL> of entity <aurora_interface_0_tile>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\aurora_interfaces\base_resources\aurora_interface_0_sym_gen_4byte.vhd" into library work
Parsing entity <aurora_interface_0_SYM_GEN_4BYTE>.
Parsing architecture <RTL> of entity <aurora_interface_0_sym_gen_4byte>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\aurora_interfaces\base_resources\aurora_interface_0_sym_dec_4byte.vhd" into library work
Parsing entity <aurora_interface_0_SYM_DEC_4BYTE>.
Parsing architecture <RTL> of entity <aurora_interface_0_sym_dec_4byte>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\aurora_interfaces\base_resources\aurora_interface_0_lane_init_sm_4byte.vhd" into library work
Parsing entity <aurora_interface_0_LANE_INIT_SM_4BYTE>.
Parsing architecture <RTL> of entity <aurora_interface_0_lane_init_sm_4byte>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\aurora_interfaces\base_resources\aurora_interface_0_idle_and_ver_gen.vhd" into library work
Parsing entity <aurora_interface_0_IDLE_AND_VER_GEN>.
Parsing architecture <RTL> of entity <aurora_interface_0_idle_and_ver_gen>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\aurora_interfaces\base_resources\aurora_interface_0_err_detect_4byte.vhd" into library work
Parsing entity <aurora_interface_0_ERR_DETECT_4BYTE>.
Parsing architecture <RTL> of entity <aurora_interface_0_err_detect_4byte>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\aurora_interfaces\base_resources\aurora_interface_0_chbond_count_dec_4byte.vhd" into library work
Parsing entity <aurora_interface_0_CHBOND_COUNT_DEC_4BYTE>.
Parsing architecture <RTL> of entity <aurora_interface_0_chbond_count_dec_4byte>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\aurora_interfaces\base_resources\aurora_interface_0_channel_init_sm.vhd" into library work
Parsing entity <aurora_interface_0_CHANNEL_INIT_SM>.
Parsing architecture <RTL> of entity <aurora_interface_0_channel_init_sm>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\aurora_interfaces\base_resources\aurora_interface_0_channel_err_detect.vhd" into library work
Parsing entity <aurora_interface_0_CHANNEL_ERR_DETECT>.
Parsing architecture <RTL> of entity <aurora_interface_0_channel_err_detect>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\time_order\source\tom_4_to_1.vhd" into library work
Parsing entity <tom_4_to_1>.
Parsing architecture <behave> of entity <tom_4_to_1>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\time_order\source\tom_3_to_1.vhd" into library work
Parsing entity <tom_3_to_1>.
Parsing architecture <behave> of entity <tom_3_to_1>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_pkg.vhd" into library work
Parsing package <tdc_pkg>.
Parsing package body <tdc_pkg>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_fifo.vhd" into library work
Parsing entity <tdc_fifo>.
Parsing architecture <fwft_arch0> of entity <tdc_fifo>.
Parsing architecture <fwft_arch1> of entity <tdc_fifo>.
Parsing architecture <fwft_arch2> of entity <tdc_fifo>.
Parsing architecture <std_arch> of entity <tdc_fifo>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\tx_ll_datapath.vhd" into library work
Parsing entity <TX_LL_DATAPATH>.
Parsing architecture <RTL> of entity <tx_ll_datapath>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\tx_ll_control.vhd" into library work
Parsing entity <TX_LL_CONTROL>.
Parsing architecture <RTL> of entity <tx_ll_control>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\sym_gen.vhd" into library work
Parsing entity <SYM_GEN>.
Parsing architecture <RTL> of entity <sym_gen>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\sym_dec.vhd" into library work
Parsing entity <SYM_DEC>.
Parsing architecture <RTL> of entity <sym_dec>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\rx_ll_pdu_datapath.vhd" into library work
Parsing entity <RX_LL_PDU_DATAPATH>.
Parsing architecture <RTL> of entity <rx_ll_pdu_datapath>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\lane_init_sm.vhd" into library work
Parsing entity <LANE_INIT_SM>.
Parsing architecture <RTL> of entity <lane_init_sm>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\idle_and_ver_gen.vhd" into library work
Parsing entity <IDLE_AND_VER_GEN>.
Parsing architecture <RTL> of entity <idle_and_ver_gen>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\err_detect.vhd" into library work
Parsing entity <ERR_DETECT>.
Parsing architecture <RTL> of entity <err_detect>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\chbond_count_dec.vhd" into library work
Parsing entity <CHBOND_COUNT_DEC>.
Parsing architecture <RTL> of entity <chbond_count_dec>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\channel_init_sm.vhd" into library work
Parsing entity <CHANNEL_INIT_SM>.
Parsing architecture <RTL> of entity <channel_init_sm>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\channel_err_detect.vhd" into library work
Parsing entity <CHANNEL_ERR_DETECT>.
Parsing architecture <RTL> of entity <channel_err_detect>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\aurora_tile.vhd" into library work
Parsing entity <AURORA_TILE>.
Parsing architecture <RTL> of entity <aurora_tile>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_iscan.vhd" into library work
Parsing entity <b2tt_iscan>.
Parsing architecture <implementation> of entity <b2tt_iscan>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\aurora_interfaces\gt\aurora_interface_0_transceiver_wrapper.vhd" into library work
Parsing entity <aurora_interface_0_GTP_WRAPPER>.
Parsing architecture <BEHAVIORAL> of entity <aurora_interface_0_gtp_wrapper>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\aurora_interfaces\base_resources\aurora_interface_0_tx_stream.vhd" into library work
Parsing entity <aurora_interface_0_TX_STREAM>.
Parsing architecture <RTL> of entity <aurora_interface_0_tx_stream>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\aurora_interfaces\base_resources\aurora_interface_0_rx_stream.vhd" into library work
Parsing entity <aurora_interface_0_RX_STREAM>.
Parsing architecture <RTL> of entity <aurora_interface_0_rx_stream>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\aurora_interfaces\base_resources\aurora_interface_0_ll_to_axi.vhd" into library work
Parsing entity <aurora_interface_0_LL_TO_AXI>.
Parsing architecture <BEHAVIORAL> of entity <aurora_interface_0_ll_to_axi>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\aurora_interfaces\base_resources\aurora_interface_0_global_logic.vhd" into library work
Parsing entity <aurora_interface_0_GLOBAL_LOGIC>.
Parsing architecture <MAPPED> of entity <aurora_interface_0_global_logic>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\aurora_interfaces\base_resources\aurora_interface_0_axi_to_ll.vhd" into library work
Parsing entity <aurora_interface_0_AXI_TO_LL>.
Parsing architecture <BEHAVIORAL> of entity <aurora_interface_0_axi_to_ll>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\aurora_interfaces\base_resources\aurora_interface_0_aurora_lane_4byte.vhd" into library work
Parsing entity <aurora_interface_0_AURORA_LANE_4BYTE>.
Parsing architecture <RTL> of entity <aurora_interface_0_aurora_lane_4byte>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\time_order\source\tom_10_to_1.vhd" into library work
Parsing entity <tom_10_to_1>.
Parsing architecture <behave> of entity <tom_10_to_1>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_channel.vhd" into library work
Parsing entity <tdc_channel>.
Parsing architecture <behave> of entity <tdc_channel>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\tx_ll.vhd" into library work
Parsing entity <TX_LL>.
Parsing architecture <MAPPED> of entity <tx_ll>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\transceiver_wrapper.vhd" into library work
Parsing entity <GTP_WRAPPER>.
Parsing architecture <BEHAVIORAL> of entity <gtp_wrapper>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\rx_ll.vhd" into library work
Parsing entity <RX_LL>.
Parsing architecture <MAPPED> of entity <rx_ll>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\global_logic.vhd" into library work
Parsing entity <GLOBAL_LOGIC>.
Parsing architecture <MAPPED> of entity <global_logic>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\aurora_lane.vhd" into library work
Parsing entity <AURORA_LANE>.
Parsing architecture <MAPPED> of entity <aurora_lane>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_symbols.vhd" into library work
Parsing package <b2tt_symbols>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_ddr_s6.vhd" into library work
Parsing entity <b2tt_iddr>.
Parsing architecture <implementation> of entity <b2tt_iddr>.
Parsing entity <b2tt_oddr>.
Parsing architecture <implementation> of entity <b2tt_oddr>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_8b10b.vhd" into library work
Parsing entity <b2tt_en8b10b>.
Parsing architecture <implementation> of entity <b2tt_en8b10b>.
Parsing entity <b2tt_de8b10b>.
Parsing architecture <implementation> of entity <b2tt_de8b10b>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\aurora_interfaces\clock_module\aurora_interface_0_clock_module.vhd" into library work
Parsing entity <aurora_interface_0_CLOCK_MODULE>.
Parsing architecture <MAPPED> of entity <aurora_interface_0_clock_module>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\aurora_interfaces\cc_manager\aurora_interface_0_standard_cc_module.vhd" into library work
Parsing entity <aurora_interface_0_STANDARD_CC_MODULE>.
Parsing architecture <RTL> of entity <aurora_interface_0_standard_cc_module>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\aurora_interfaces\aurora_interface_0.vhd" into library work
Parsing entity <aurora_interface_0>.
Parsing architecture <MAPPED> of entity <aurora_interface_0>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\asic_interfaces\asic_definitions_irs2_carrier_revA.vhd" into library work
Parsing package <asic_definitions_irs2_carrier_revA>.
Parsing package body <asic_definitions_irs2_carrier_revA>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\ise-project\ipcore_dir\s6_vio.vhd" into library work
Parsing entity <s6_vio>.
Parsing architecture <s6_vio_a> of entity <s6_vio>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\ise-project\ipcore_dir\s6_icon.vhd" into library work
Parsing entity <s6_icon>.
Parsing architecture <s6_icon_a> of entity <s6_icon>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\utilities\utilities.vhd" into library work
Parsing package <utilities>.
Parsing package body <utilities>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\readout_definitions.vhd" into library work
Parsing package <readout_definitions>.
Parsing package body <readout_definitions>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\time_order\source\time_order.vhd" into library work
Parsing entity <time_order>.
Parsing architecture <behave> of entity <time_order>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc.vhd" into library work
Parsing entity <tdc>.
Parsing architecture <behave> of entity <tdc>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\timing_ctrl_pkg.vhd" into library work
Parsing package <timing_ctrl_pkg>.
Parsing package body <timing_ctrl_pkg>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\standard_cc_module.vhd" into library work
Parsing entity <STANDARD_CC_MODULE>.
Parsing architecture <RTL> of entity <standard_cc_module>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" into library work
Parsing entity <klm_aurora>.
Parsing architecture <MAPPED> of entity <klm_aurora>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\conc_intfc\source\trig_chan_calc.vhd" into library work
Parsing entity <trig_chan_calc>.
Parsing architecture <behave> of entity <trig_chan_calc>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\conc_intfc\source\conc_intfc_pkg.vhd" into library work
Parsing package <conc_intfc_pkg>.
Parsing package body <conc_intfc_pkg>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_payload.vhd" into library work
Parsing entity <b2tt_payload>.
Parsing architecture <implementation> of entity <b2tt_payload>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_fifo_s6.vhd" into library work
Parsing entity <b2tt_fifo>.
Parsing architecture <implementation> of entity <b2tt_fifo>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_encode.vhd" into library work
Parsing entity <b2tt_encounter>.
Parsing architecture <implementation> of entity <b2tt_encounter>.
Parsing entity <b2tt_enoctet>.
Parsing architecture <implementation> of entity <b2tt_enoctet>.
Parsing entity <b2tt_enbit2>.
Parsing architecture <implementation> of entity <b2tt_enbit2>.
Parsing entity <b2tt_encode>.
Parsing architecture <implementation> of entity <b2tt_encode>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_decode.vhd" into library work
Parsing entity <b2tt_decomma>.
Parsing architecture <implementation> of entity <b2tt_decomma>.
Parsing entity <b2tt_debit2>.
Parsing architecture <implementation> of entity <b2tt_debit2>.
Parsing entity <b2tt_debit10>.
Parsing architecture <implementation> of entity <b2tt_debit10>.
Parsing entity <b2tt_detrig>.
Parsing architecture <implementation> of entity <b2tt_detrig>.
Parsing entity <b2tt_deoctet>.
Parsing architecture <implementation> of entity <b2tt_deoctet>.
Parsing entity <b2tt_depacket>.
Parsing architecture <implementation> of entity <b2tt_depacket>.
Parsing entity <b2tt_detag>.
Parsing architecture <implementation> of entity <b2tt_detag>.
Parsing entity <b2tt_decode>.
Parsing architecture <implementation> of entity <b2tt_decode>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_clk_s6.vhd" into library work
Parsing entity <b2tt_clk>.
Parsing architecture <implementation> of entity <b2tt_clk>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\detect_usb.vhd" into library work
Parsing entity <detect_usb>.
Parsing architecture <Behavioral> of entity <detect_usb>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\aurora_interfaces\two_lane_aurora_interface.vhd" into library work
Parsing entity <two_lane_aurora_interface>.
Parsing architecture <MAPPED> of entity <two_lane_aurora_interface>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\ise-project\ipcore_dir\trig_fifo.vhd" into library work
Parsing entity <trig_fifo>.
Parsing architecture <trig_fifo_a> of entity <trig_fifo>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\ise-project\ipcore_dir\fifo_wr32_rd16.vhd" into library work
Parsing entity <fifo_wr32_rd16>.
Parsing architecture <fifo_wr32_rd16_a> of entity <fifo_wr32_rd16>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\ise-project\ipcore_dir\fifo_wr16_rd32.vhd" into library work
Parsing entity <fifo_wr16_rd32>.
Parsing architecture <fifo_wr16_rd32_a> of entity <fifo_wr16_rd32>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\ise-project\ipcore_dir\FIFO_OUT_1.vhd" into library work
Parsing entity <FIFO_OUT_1>.
Parsing architecture <FIFO_OUT_1_a> of entity <fifo_out_1>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\ise-project\ipcore_dir\FIFO_OUT_0.vhd" into library work
Parsing entity <FIFO_OUT_0>.
Parsing architecture <FIFO_OUT_0_a> of entity <fifo_out_0>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\ise-project\ipcore_dir\FIFO_INP_0.vhd" into library work
Parsing entity <FIFO_INP_0>.
Parsing architecture <FIFO_INP_0_a> of entity <fifo_inp_0>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\ise-project\ipcore_dir\daq_fifo.vhd" into library work
Parsing entity <daq_fifo>.
Parsing architecture <daq_fifo_a> of entity <daq_fifo>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\utilities\edge_to_pulse_converter.vhd" into library work
Parsing entity <edge_to_pulse_converter>.
Parsing architecture <Behavioral> of entity <edge_to_pulse_converter>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\utilities\clock_enable_generator.vhd" into library work
Parsing entity <clock_enable_generator>.
Parsing architecture <Behavioral> of entity <clock_enable_generator>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\TDC_MPPC_DAC.vhd" into library work
Parsing entity <TDC_MPPC_DAC>.
Parsing architecture <Behavioral> of entity <tdc_mppc_dac>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\picoblaze\kcpsm6.vhd" into library work
Parsing entity <kcpsm6>.
Parsing architecture <low_level_definition> of entity <kcpsm6>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\picoblaze\command_interpreter\command_interpreter.vhd" into library work
Parsing package <jtag_loader_pkg>.
Parsing package body <jtag_loader_pkg>.
Parsing entity <command_interpreter>.
Parsing architecture <low_level_definition> of entity <command_interpreter>.
Parsing entity <jtag_loader_6>.
Parsing architecture <Behavioral> of entity <jtag_loader_6>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\peripherals\SRAMiface2.vhd" into library work
Parsing entity <SRAMiface2>.
Parsing architecture <Behavioral> of entity <sramiface2>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\peripherals\Module_ADC_MCP3221_I2C_new.vhd" into library work
Parsing entity <Module_ADC_MCP3221_I2C_new>.
Parsing architecture <Behavioral> of entity <module_adc_mcp3221_i2c_new>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\timing_ctrl.vhd" into library work
Parsing entity <timing_ctrl>.
Parsing architecture <behave> of entity <timing_ctrl>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\sfp_stat_ctrl.vhd" into library work
Parsing entity <sfp_stat_ctrl>.
Parsing architecture <behave> of entity <sfp_stat_ctrl>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\run_ctrl.vhd" into library work
Parsing entity <run_ctrl>.
Parsing architecture <behave> of entity <run_ctrl>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod_pkg.vhd" into library work
Parsing package <klm_scrod_pkg>.
Parsing package body <klm_scrod_pkg>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\frame_gen.vhd" into library work
Parsing entity <FRAME_GEN>.
Parsing architecture <RTL> of entity <frame_gen>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\KLM_SCROD\source\daq_gen.vhd" into library work
Parsing entity <daq_gen>.
Parsing architecture <single_trig> of entity <daq_gen>.
Parsing architecture <multi_trig> of entity <daq_gen>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora_intfc.vhd" into library work
Parsing entity <klm_aurora_intfc>.
Parsing architecture <MAPPED> of entity <klm_aurora_intfc>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\conc_intfc\source\conc_intfc.vhd" into library work
Parsing entity <conc_intfc>.
Parsing architecture <behave> of entity <conc_intfc>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt.vhd" into library work
Parsing entity <b2tt>.
Parsing architecture <implementation> of entity <b2tt>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\edge_detect.vhd" into library work
Parsing entity <edge_detect>.
Parsing architecture <Behavioral> of entity <edge_detect>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" into library work
Parsing entity <daq_fifo_layer>.
Parsing architecture <Behavioral> of entity <daq_fifo_layer>.
WARNING:HDLCompiler:946 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" Line 602: Actual for formal port din is neither a static name nor a globally static expression
WARNING:HDLCompiler:946 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" Line 620: Actual for formal port din is neither a static name nor a globally static expression
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\ise-project\PedRAMaccess.vhd" into library work
Parsing entity <PedRAMaccess>.
Parsing architecture <Behavioral> of entity <pedramaccess>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\WaveformDemuxPedsubDSPBRAM.vhd" into library work
Parsing entity <WaveformDemuxPedsubDSPBRAM>.
Parsing architecture <Behavioral> of entity <waveformdemuxpedsubdspbram>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\WaveformDemuxCalcPedsBRAM.vhd" into library work
Parsing entity <WaveformDemuxCalcPedsBRAM>.
Parsing architecture <Behavioral> of entity <waveformdemuxcalcpedsbram>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\update_status_regs.vhd" into library work
Parsing entity <update_status_regs>.
Parsing architecture <Behavioral> of entity <update_status_regs>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\TARGETX_DAC_CONTROL.vhd" into library work
Parsing entity <TARGETX_DAC_CONTROL>.
Parsing architecture <Behavioral> of entity <targetx_dac_control>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\SerialDataRout.vhd" into library work
Parsing entity <SerialDataRout>.
Parsing architecture <Behavioral> of entity <serialdatarout>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\SamplingLgc.vhd" into library work
Parsing entity <SamplingLgc>.
Parsing architecture <Behavioral> of entity <samplinglgc>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\readout_interface.vhd" into library work
Parsing entity <readout_interface>.
Parsing architecture <Behavioral> of entity <readout_interface>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\ReadoutControl.vhd" into library work
Parsing entity <ReadoutControl>.
Parsing architecture <Behavioral> of entity <readoutcontrol>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\pulse_transition.vhd" into library work
Parsing entity <pulse_transition>.
Parsing architecture <Behavioral> of entity <pulse_transition>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\OutputBufferControl.vhd" into library work
Parsing entity <OutputBufferControl>.
Parsing architecture <Behavioral> of entity <outputbuffercontrol>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\mppc_dacs.vhd" into library work
Parsing entity <mppc_dacs>.
Parsing architecture <Behavioral> of entity <mppc_dacs>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" into library work
Parsing entity <klm_scrod>.
Parsing architecture <behave> of entity <klm_scrod>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\DigitizingLgcTX.vhd" into library work
Parsing entity <DigitizingLgcTX>.
Parsing architecture <Behavioral> of entity <digitizinglgctx>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\clocking\clock_gen_A4.vhd" into library work
Parsing entity <clock_gen>.
Parsing architecture <Behavioral> of entity <clock_gen>.
WARNING:HDLCompiler:190 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\clocking\clock_gen_A4.vhd" Line 81: Actual expression for generic divide_ratio cannot reference a signal
WARNING:HDLCompiler:190 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\clocking\clock_gen_A4.vhd" Line 90: Actual expression for generic divide_ratio cannot reference a signal
WARNING:HDLCompiler:190 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\clocking\clock_gen_A4.vhd" Line 99: Actual expression for generic divide_ratio cannot reference a signal
WARNING:HDLCompiler:190 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\clocking\clock_gen_A4.vhd" Line 108: Actual expression for generic divide_ratio cannot reference a signal
WARNING:HDLCompiler:190 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\clocking\clock_gen_A4.vhd" Line 135: Actual expression for generic divide_ratio cannot reference a signal
WARNING:HDLCompiler:190 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\clocking\clock_gen_A4.vhd" Line 144: Actual expression for generic divide_ratio cannot reference a signal
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\asic_interfaces\trigger_scalers.vhd" into library work
Parsing entity <trigger_scaler_timing_generator>.
Parsing architecture <Behavioral> of entity <trigger_scaler_timing_generator>.
Parsing entity <trigger_scaler_single_channel>.
Parsing architecture <Behavioral> of entity <trigger_scaler_single_channel>.
Parsing entity <trigger_scaler_single_channel_w_timing_gen>.
Parsing architecture <Behavioral> of entity <trigger_scaler_single_channel_w_timing_gen>.
Parsing entity <trigger_scaler_one_asic>.
Parsing architecture <Behavioral> of entity <trigger_scaler_one_asic>.
Parsing entity <trigger_scaler_top>.
Parsing architecture <Behavioral> of entity <trigger_scaler_top>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\asic_interfaces\event_builder.vhd" into library work
Parsing entity <event_builder>.
Parsing architecture <Behavioral> of entity <event_builder>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\ise-project\SRAMscheduler.vhd" into library work
Parsing entity <SRAMscheduler>.
Parsing architecture <Behavioral> of entity <sramscheduler>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\ise-project\ipcore_dir\waveform_fifo_wr32_rd32.vhd" into library work
Parsing entity <waveform_fifo_wr32_rd32>.
Parsing architecture <waveform_fifo_wr32_rd32_a> of entity <waveform_fifo_wr32_rd32>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\ise-project\ipcore_dir\buffer_fifo_wr32_rd32.vhd" into library work
Parsing entity <buffer_fifo_wr32_rd32>.
Parsing architecture <buffer_fifo_wr32_rd32_a> of entity <buffer_fifo_wr32_rd32>.
Parsing VHDL file "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" into library work
Parsing entity <scrod_top_A4>.
Parsing architecture <Behavioral> of entity <scrod_top_a4>.
WARNING:HDLCompiler:946 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 1228: Actual for formal port win_addr_start is neither a static name nor a globally static expression
WARNING:HDLCompiler:946 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 1257: Actual for formal port win_addr_start is neither a static name nor a globally static expression
WARNING:HDLCompiler:946 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 1279: Actual for formal port dig_win_ena is neither a static name nor a globally static expression
WARNING:HDLCompiler:946 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 1354: Actual for formal port win_addr is neither a static name nor a globally static expression

=========================================================================
*                            HDL Elaboration                            *
=========================================================================

Elaborating entity <scrod_top_A4> (architecture <Behavioral>) with generics from library <work>.
WARNING:HDLCompiler:871 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 368: Using initial value '0' for internal_cmdreg_software_trigger_veto since it is never assigned
WARNING:HDLCompiler:871 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 442: Using initial value '0' for internal_waveform_fifo_rst since it is never assigned

Elaborating entity <SRAMscheduler> (architecture <Behavioral>) from library <work>.

Elaborating entity <SRAMiface2> (architecture <Behavioral>) from library <work>.
WARNING:HDLCompiler:871 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\peripherals\SRAMiface2.vhd" Line 92: Using initial value 1 for thzoe since it is never assigned
WARNING:HDLCompiler:871 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\peripherals\SRAMiface2.vhd" Line 94: Using initial value 4 for twend since it is never assigned
WARNING:HDLCompiler:871 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\peripherals\SRAMiface2.vhd" Line 97: Using initial value 4 for trdout since it is never assigned
WARNING:HDLCompiler:871 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\peripherals\SRAMiface2.vhd" Line 99: Using initial value 1 for trend since it is never assigned
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\peripherals\SRAMiface2.vhd" Line 234. Case statement is complete. others clause is never selected
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\ise-project\SRAMscheduler.vhd" Line 226. Case statement is complete. others clause is never selected
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\ise-project\SRAMscheduler.vhd" Line 175: Assignment to allch_busy ignored, since the identifier is never used

Elaborating entity <clock_gen> (architecture <Behavioral>) with generics from library <work>.
WARNING:HDLCompiler:871 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\clocking\clock_gen_A4.vhd" Line 52: Using initial value 2 for ratio_asic_ctrl_clock since it is never assigned
WARNING:HDLCompiler:871 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\clocking\clock_gen_A4.vhd" Line 53: Using initial value 2 for ratio_fpga_logic_clock since it is never assigned
WARNING:HDLCompiler:871 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\clocking\clock_gen_A4.vhd" Line 54: Using initial value 6 for ratio_mppc_dac_clock since it is never assigned
WARNING:HDLCompiler:871 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\clocking\clock_gen_A4.vhd" Line 55: Using initial value 6 for ratio_mppc_adc_clock since it is never assigned

Elaborating entity <clock_enable_generator> (architecture <Behavioral>) with generics from library <work>.

Elaborating entity <clock_enable_generator> (architecture <Behavioral>) with generics from library <work>.

Elaborating entity <readout_interface> (architecture <Behavioral>) from library <work>.

Elaborating entity <kcpsm6> (architecture <low_level_definition>) with generics from library <work>.

Elaborating entity <command_interpreter> (architecture <low_level_definition>) with generics from library <work>.
WARNING:HDLCompiler:92 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\readout_interface.vhd" Line 223: waveform_packet_builder_busy should be on the sensitivity list of the process
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\readout_interface.vhd" Line 288. Case statement is complete. others clause is never selected
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\readout_interface.vhd" Line 295. Case statement is complete. others clause is never selected

Elaborating entity <edge_detect> (architecture <Behavioral>) from library <work>.

Elaborating entity <daq_fifo_layer> (architecture <Behavioral>) with generics from library <work>.

Elaborating entity <FIFO_OUT_0> (architecture <FIFO_OUT_0_a>) from library <work>.

Elaborating entity <FIFO_OUT_1> (architecture <FIFO_OUT_1_a>) from library <work>.

Elaborating entity <FIFO_INP_0> (architecture <FIFO_INP_0_a>) from library <work>.

Elaborating entity <fifo_wr16_rd32> (architecture <fifo_wr16_rd32_a>) from library <work>.

Elaborating entity <fifo_wr32_rd16> (architecture <fifo_wr32_rd16_a>) from library <work>.
Going to verilog side to elaborate module usb_top

Elaborating module <usb_top>.

Elaborating module <usb_slave_fifo_interface_io>.

Elaborating module <USB_IFCLK_XC3S400>.

Elaborating module <IBUFG>.

Elaborating module <BUFG>.

Elaborating module <DCM(CLK_FEEDBACK="1X",CLKDV_DIVIDE=2.0,CLKFX_DIVIDE=1,CLKFX_MULTIPLY=4,CLKIN_DIVIDE_BY_2="FALSE",CLKIN_PERIOD=20.833,CLKOUT_PHASE_SHIFT="NONE",DESKEW_ADJUST="SYSTEM_SYNCHRONOUS",DFS_FREQUENCY_MODE="LOW",DLL_FREQUENCY_MODE="LOW",DUTY_CYCLE_CORRECTION="TRUE",FACTORY_JF=16'b1000000010000000,PHASE_SHIFT=0,STARTUP_WAIT="FALSE")>.

Elaborating module <IBUF>.

Elaborating module <OBUF>.

Elaborating module <OBUFT>.

Elaborating module <usb_slave_fifo_interface>.

Elaborating module <usb_init>.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\usb_interfaces\usb_top.v" Line 79: Net <rst_external> does not have a driver.
Back to vhdl to continue elaboration

Elaborating entity <detect_usb> (architecture <Behavioral>) from library <work>.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" Line 111: Net <internal_FIBER_0_LINK_UP> does not have a driver.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" Line 112: Net <internal_FIBER_1_LINK_UP> does not have a driver.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" Line 113: Net <internal_FIBER_0_LINK_ERR> does not have a driver.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" Line 114: Net <internal_FIBER_1_LINK_ERR> does not have a driver.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" Line 125: Net <internal_FIBER_0_RX_DATA_MSB_TO_LSB[31]> does not have a driver.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" Line 126: Net <internal_FIBER_1_RX_DATA_MSB_TO_LSB[31]> does not have a driver.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" Line 131: Net <internal_FIBER_0_TX_READ_ENABLE> does not have a driver.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" Line 132: Net <internal_FIBER_1_TX_READ_ENABLE> does not have a driver.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" Line 133: Net <internal_FIBER_0_RX_DATA_TVALID> does not have a driver.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" Line 134: Net <internal_FIBER_1_RX_DATA_TVALID> does not have a driver.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" Line 137: Net <internal_FIBER_USER_CLOCK> does not have a driver.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\readout_interface.vhd" Line 99: Net <internal_PB_INTERRUPT> does not have a driver.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\readout_interface.vhd" Line 101: Net <internal_PB_SLEEP> does not have a driver.

Elaborating entity <klm_scrod> (architecture <behave>) with generics from library <work>.
WARNING:HDLCompiler:89 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" Line 114: <ibufds> remains a black-box since it has no binding entity.

Elaborating entity <timing_ctrl> (architecture <behave>) from library <work>.

Elaborating entity <b2tt> (architecture <implementation>) with generics from library <work>.

Elaborating entity <b2tt_clk> (architecture <implementation>) with generics from library <work>.
WARNING:HDLCompiler:871 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_clk_s6.vhd" Line 49: Using initial value '0' for sig_xcm203 since it is never assigned
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_clk_s6.vhd" Line 149: Assignment to clr_ictrl ignored, since the identifier is never used

Elaborating entity <b2tt_fifo> (architecture <implementation>) from library <work>.
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_fifo_s6.vhd" Line 269: Assignment to open_dob ignored, since the identifier is never used

Elaborating entity <b2tt_decode> (architecture <implementation>) with generics from library <work>.

Elaborating entity <b2tt_iddr> (architecture <implementation>) with generics from library <work>.

Elaborating entity <b2tt_iscan> (architecture <implementation>) with generics from library <work>.

Elaborating entity <b2tt_decomma> (architecture <implementation>) from library <work>.

Elaborating entity <b2tt_debit2> (architecture <implementation>) from library <work>.

Elaborating entity <b2tt_debit10> (architecture <implementation>) from library <work>.

Elaborating entity <b2tt_de8b10b> (architecture <implementation>) from library <work>.

Elaborating entity <b2tt_detrig> (architecture <implementation>) from library <work>.

Elaborating entity <b2tt_deoctet> (architecture <implementation>) from library <work>.
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_decode.vhd" Line 429: Assignment to buf_crc8 ignored, since the identifier is never used

Elaborating entity <b2tt_depacket> (architecture <implementation>) with generics from library <work>.

Elaborating entity <b2tt_detag> (architecture <implementation>) from library <work>.

Elaborating entity <b2tt_payload> (architecture <implementation>) from library <work>.
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_payload.vhd" Line 105: Assignment to seq_b2lwe ignored, since the identifier is never used

Elaborating entity <b2tt_encode> (architecture <implementation>) with generics from library <work>.

Elaborating entity <b2tt_encounter> (architecture <implementation>) from library <work>.

Elaborating entity <b2tt_enoctet> (architecture <implementation>) from library <work>.

Elaborating entity <b2tt_enbit2> (architecture <implementation>) from library <work>.

Elaborating entity <b2tt_en8b10b> (architecture <implementation>) from library <work>.

Elaborating entity <b2tt_oddr> (architecture <implementation>) with generics from library <work>.

Elaborating entity <klm_aurora_intfc> (architecture <MAPPED>) with generics from library <work>.

Elaborating entity <klm_aurora> (architecture <MAPPED>) with generics from library <work>.
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" Line 431: Assignment to tied_to_gnd_vec_i ignored, since the identifier is never used
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" Line 433: Assignment to tied_to_ground_i ignored, since the identifier is never used
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" Line 434: Assignment to tied_to_vcc_i ignored, since the identifier is never used

Elaborating entity <AURORA_LANE> (architecture <MAPPED>) from library <work>.

Elaborating entity <LANE_INIT_SM> (architecture <RTL>) from library <work>.
WARNING:HDLCompiler:89 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\lane_init_sm.vhd" Line 175: <fdr> remains a black-box since it has no binding entity.

Elaborating entity <CHBOND_COUNT_DEC> (architecture <RTL>) from library <work>.

Elaborating entity <SYM_GEN> (architecture <RTL>) from library <work>.

Elaborating entity <SYM_DEC> (architecture <RTL>) from library <work>.

Elaborating entity <ERR_DETECT> (architecture <RTL>) from library <work>.

Elaborating entity <GTP_WRAPPER> (architecture <BEHAVIORAL>) with generics from library <work>.
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\transceiver_wrapper.vhd" Line 334: Assignment to open_txbufstatus ignored, since the identifier is never used

Elaborating entity <AURORA_TILE> (architecture <RTL>) with generics from library <work>.
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\aurora_tile.vhd" Line 557: Assignment to rxchariscomma0_float_i ignored, since the identifier is never used
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\aurora_tile.vhd" Line 559: Assignment to rxchariscomma1_float_i ignored, since the identifier is never used
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\aurora_tile.vhd" Line 561: Assignment to rxcharisk0_float_i ignored, since the identifier is never used
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\aurora_tile.vhd" Line 563: Assignment to rxcharisk1_float_i ignored, since the identifier is never used
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\aurora_tile.vhd" Line 567: Assignment to rxdisperr0_float_i ignored, since the identifier is never used
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\aurora_tile.vhd" Line 569: Assignment to rxdisperr1_float_i ignored, since the identifier is never used
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\aurora_tile.vhd" Line 571: Assignment to rxnotintable0_float_i ignored, since the identifier is never used
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\aurora_tile.vhd" Line 573: Assignment to rxnotintable1_float_i ignored, since the identifier is never used

Elaborating entity <GLOBAL_LOGIC> (architecture <MAPPED>) from library <work>.

Elaborating entity <CHANNEL_INIT_SM> (architecture <RTL>) from library <work>.
WARNING:HDLCompiler:89 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\channel_init_sm.vhd" Line 157: <fd> remains a black-box since it has no binding entity.

Elaborating entity <IDLE_AND_VER_GEN> (architecture <RTL>) from library <work>.
WARNING:HDLCompiler:89 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\idle_and_ver_gen.vhd" Line 150: <fdr> remains a black-box since it has no binding entity.
WARNING:HDLCompiler:89 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\idle_and_ver_gen.vhd" Line 167: <srl16> remains a black-box since it has no binding entity.
WARNING:HDLCompiler:89 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\idle_and_ver_gen.vhd" Line 134: <fd> remains a black-box since it has no binding entity.

Elaborating entity <CHANNEL_ERR_DETECT> (architecture <RTL>) from library <work>.

Elaborating entity <TX_LL> (architecture <MAPPED>) from library <work>.

Elaborating entity <TX_LL_DATAPATH> (architecture <RTL>) from library <work>.
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\tx_ll_datapath.vhd" Line 204. Case statement is complete. others clause is never selected
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\tx_ll_datapath.vhd" Line 273. Case statement is complete. others clause is never selected

Elaborating entity <TX_LL_CONTROL> (architecture <RTL>) from library <work>.
WARNING:HDLCompiler:89 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\tx_ll_control.vhd" Line 142: <fdr> remains a black-box since it has no binding entity.

Elaborating entity <RX_LL> (architecture <MAPPED>) from library <work>.

Elaborating entity <RX_LL_PDU_DATAPATH> (architecture <RTL>) from library <work>.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" Line 334: Net <RX1N_IN_unused> does not have a driver.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" Line 335: Net <RX1P_IN_unused> does not have a driver.

Elaborating entity <STANDARD_CC_MODULE> (architecture <RTL>) from library <work>.
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora_intfc.vhd" Line 234: Assignment to plllockn_i ignored, since the identifier is never used

Elaborating entity <conc_intfc> (architecture <behave>) from library <work>.

Elaborating entity <tdc> (architecture <behave>) from library <work>.

Elaborating entity <tdc_channel> (architecture <behave>) with generics from library <work>.

Elaborating entity <tdc_fifo> (architecture <fwft_arch0>) with generics from library <work>.
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_fifo.vhd" Line 166. Case statement is complete. others clause is never selected
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_channel.vhd" Line 322. Case statement is complete. others clause is never selected

Elaborating entity <tdc_channel> (architecture <behave>) with generics from library <work>.
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_channel.vhd" Line 322. Case statement is complete. others clause is never selected

Elaborating entity <tdc_channel> (architecture <behave>) with generics from library <work>.
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_channel.vhd" Line 322. Case statement is complete. others clause is never selected

Elaborating entity <tdc_channel> (architecture <behave>) with generics from library <work>.
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_channel.vhd" Line 322. Case statement is complete. others clause is never selected

Elaborating entity <tdc_channel> (architecture <behave>) with generics from library <work>.
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_channel.vhd" Line 322. Case statement is complete. others clause is never selected

Elaborating entity <tdc_channel> (architecture <behave>) with generics from library <work>.
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_channel.vhd" Line 322. Case statement is complete. others clause is never selected

Elaborating entity <tdc_channel> (architecture <behave>) with generics from library <work>.
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_channel.vhd" Line 322. Case statement is complete. others clause is never selected

Elaborating entity <tdc_channel> (architecture <behave>) with generics from library <work>.
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_channel.vhd" Line 322. Case statement is complete. others clause is never selected

Elaborating entity <tdc_channel> (architecture <behave>) with generics from library <work>.
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_channel.vhd" Line 322. Case statement is complete. others clause is never selected

Elaborating entity <tdc_channel> (architecture <behave>) with generics from library <work>.
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_channel.vhd" Line 322. Case statement is complete. others clause is never selected

Elaborating entity <time_order> (architecture <behave>) from library <work>.

Elaborating entity <tom_10_to_1> (architecture <behave>) from library <work>.

Elaborating entity <tom_3_to_1> (architecture <behave>) from library <work>.

Elaborating entity <tom_2_to_1> (architecture <behave>) from library <work>.
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\time_order\source\tom_2_to_1.vhd" Line 139. Case statement is complete. others clause is never selected

Elaborating entity <tom_4_to_1> (architecture <behave>) from library <work>.

Elaborating entity <trig_chan_calc> (architecture <behave>) with generics from library <work>.
WARNING:HDLCompiler:89 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\conc_intfc\source\trig_chan_calc.vhd" Line 63: <dsp48a1> remains a black-box since it has no binding entity.

Elaborating entity <trig_fifo> (architecture <trig_fifo_a>) from library <work>.

Elaborating entity <daq_fifo> (architecture <daq_fifo_a>) from library <work>.
WARNING:HDLCompiler:746 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\conc_intfc\source\conc_intfc.vhd" Line 409: Range is empty (null range)
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\conc_intfc\source\conc_intfc.vhd" Line 468. Case statement is complete. others clause is never selected
WARNING:HDLCompiler:92 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\conc_intfc\source\conc_intfc.vhd" Line 654: trgsof_ctr should be on the sensitivity list of the process
WARNING:HDLCompiler:92 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\conc_intfc\source\conc_intfc.vhd" Line 695: sts_sof_q should be on the sensitivity list of the process
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\conc_intfc\source\conc_intfc.vhd" Line 728. Case statement is complete. others clause is never selected

Elaborating entity <daq_gen> (architecture <multi_trig>) with generics from library <work>.
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\KLM_SCROD\source\daq_gen.vhd" Line 545. Case statement is complete. others clause is never selected
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\KLM_SCROD\source\daq_gen.vhd" Line 643. Case statement is complete. others clause is never selected
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\KLM_SCROD\source\daq_gen.vhd" Line 699: Assignment to pdw_ctr_lc ignored, since the identifier is never used
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\KLM_SCROD\source\daq_gen.vhd" Line 721: Assignment to pds_ctr_lc ignored, since the identifier is never used
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\KLM_SCROD\source\daq_gen.vhd" Line 811. Case statement is complete. others clause is never selected
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\KLM_SCROD\source\daq_gen.vhd" Line 839. Case statement is complete. others clause is never selected

Elaborating entity <run_ctrl> (architecture <behave>) from library <work>.

Elaborating entity <sfp_stat_ctrl> (architecture <behave>) with generics from library <work>.
WARNING:HDLCompiler:321 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" Line 996: Comparison between arrays of unequal length always returns FALSE.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" Line 417: Net <target_tb_i[1][5]> does not have a driver.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" Line 418: Net <target_tb16_i[1]> does not have a driver.
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 981: Assignment to internal_cmdreg_dig_startdig ignored, since the identifier is never used
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 982: Assignment to internal_cmdreg_dig_rd_rowsel_s ignored, since the identifier is never used
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 983: Assignment to internal_cmdreg_dig_rd_colsel_s ignored, since the identifier is never used
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 986: Assignment to internal_cmdreg_srout_start ignored, since the identifier is never used
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 997: Assignment to internal_cmdreg_sw_status_read ignored, since the identifier is never used
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 1008: Assignment to internal_cmdreg_waveform_fifo_rst ignored, since the identifier is never used
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 1009: Assignment to internal_cmdreg_evtbuild_start_building_event ignored, since the identifier is never used
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 1010: Assignment to internal_cmdreg_evtbuild_make_ready ignored, since the identifier is never used
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 1011: Assignment to internal_cmdreg_evtbuild_packet_builder_busy ignored, since the identifier is never used

Elaborating entity <update_status_regs> (architecture <Behavioral>) from library <work>.
WARNING:HDLCompiler:871 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\update_status_regs.vhd" Line 57: Using initial value 100 for w1 since it is never assigned
WARNING:HDLCompiler:871 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\update_status_regs.vhd" Line 58: Using initial value 100 for w2 since it is never assigned

Elaborating entity <Module_ADC_MCP3221_I2C_new> (architecture <Behavioral>) from library <work>.

Elaborating entity <TARGETX_DAC_CONTROL> (architecture <Behavioral>) with generics from library <work>.
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\TARGETX_DAC_CONTROL.vhd" Line 352. Case statement is complete. others clause is never selected

Elaborating entity <ReadoutControl> (architecture <Behavioral>) from library <work>.
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\ReadoutControl.vhd" Line 219. Case statement is complete. others clause is never selected
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\ReadoutControl.vhd" Line 241: Assignment to internal_smp_idle_status ignored, since the identifier is never used
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 1204: Assignment to internal_software_trigger_veto ignored, since the identifier is never used

Elaborating entity <WaveformDemuxPedsubDSPBRAM> (architecture <Behavioral>) from library <work>.

Elaborating entity <PedRAMaccess> (architecture <Behavioral>) from library <work>.
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\ise-project\PedRAMaccess.vhd" Line 176. Case statement is complete. others clause is never selected
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\ise-project\PedRAMaccess.vhd" Line 71: Net <addrarr[3][21]> does not have a driver.

Elaborating entity <blk_mem_gen_v7_3> (architecture <blk_mem_gen_v7_3_a>) from library <work>.
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\WaveformDemuxPedsubDSPBRAM.vhd" Line 270: Assignment to asic_no_i ignored, since the identifier is never used
WARNING:HDLCompiler:321 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\WaveformDemuxPedsubDSPBRAM.vhd" Line 563: Comparison between arrays of unequal length always returns FALSE.
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\WaveformDemuxPedsubDSPBRAM.vhd" Line 594. Case statement is complete. others clause is never selected
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\WaveformDemuxPedsubDSPBRAM.vhd" Line 298: Assignment to dmx_asic ignored, since the identifier is never used

Elaborating entity <WaveformDemuxCalcPedsBRAM> (architecture <Behavioral>) from library <work>.
WARNING:HDLCompiler:92 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\WaveformDemuxCalcPedsBRAM.vhd" Line 258: busy_i should be on the sensitivity list of the process
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\WaveformDemuxCalcPedsBRAM.vhd" Line 255: Assignment to asic_no_i ignored, since the identifier is never used
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\WaveformDemuxCalcPedsBRAM.vhd" Line 310: Assignment to dmx_sa ignored, since the identifier is never used
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\WaveformDemuxCalcPedsBRAM.vhd" Line 107: Net <ped_sa_wval0[11]> does not have a driver.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\WaveformDemuxCalcPedsBRAM.vhd" Line 108: Net <ped_sa_wval1[11]> does not have a driver.

Elaborating entity <SamplingLgc> (architecture <Behavioral>) from library <work>.
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\SamplingLgc.vhd" Line 80: Assignment to dig_win_wrap_i ignored, since the identifier is never used

Elaborating entity <DigitizingLgcTX> (architecture <Behavioral>) from library <work>.

Elaborating entity <SerialDataRout> (architecture <Behavioral>) from library <work>.
WARNING:HDLCompiler:1127 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\SerialDataRout.vhd" Line 115: Assignment to sr_clk_d ignored, since the identifier is never used
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\SerialDataRout.vhd" Line 186. Case statement is complete. others clause is never selected

Elaborating entity <waveform_fifo_wr32_rd32> (architecture <waveform_fifo_wr32_rd32_a>) from library <work>.

Elaborating entity <OutputBufferControl> (architecture <Behavioral>) from library <work>.
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\OutputBufferControl.vhd" Line 163. Case statement is complete. others clause is never selected

Elaborating entity <buffer_fifo_wr32_rd32> (architecture <buffer_fifo_wr32_rd32_a>) from library <work>.

Elaborating entity <event_builder> (architecture <Behavioral>) from library <work>.
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\asic_interfaces\event_builder.vhd" Line 120. Case statement is complete. others clause is never selected

Elaborating entity <trigger_scaler_single_channel_w_timing_gen> (architecture <Behavioral>) from library <work>.

Elaborating entity <trigger_scaler_single_channel> (architecture <Behavioral>) from library <work>.

Elaborating entity <edge_to_pulse_converter> (architecture <Behavioral>) from library <work>.

Elaborating entity <trigger_scaler_timing_generator> (architecture <Behavioral>) from library <work>.

Elaborating entity <mppc_dacs> (architecture <Behavioral>) from library <work>.

Elaborating entity <TDC_MPPC_DAC> (architecture <Behavioral>) with generics from library <work>.
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\TDC_MPPC_DAC.vhd" Line 158. Case statement is complete. others clause is never selected
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\TDC_MPPC_DAC.vhd" Line 177. Case statement is complete. others clause is never selected
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\TDC_MPPC_DAC.vhd" Line 80: Net <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data[31]> does not have a driver.

Elaborating entity <pulse_transition> (architecture <Behavioral>) with generics from library <work>.
INFO:HDLCompiler:679 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\pulse_transition.vhd" Line 75. Case statement is complete. others clause is never selected
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 257: Net <internal_INPUT_REGISTERS[464][15]> does not have a driver.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 456: Net <internal_enOutput> does not have a driver.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 482: Net <internal_ram_Ain[1][21]> does not have a driver.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 483: Net <internal_ram_DWin[2][7]> does not have a driver.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 484: Net <internal_ram_rw[1]> does not have a driver.
WARNING:HDLCompiler:634 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" Line 485: Net <internal_ram_update[1]> does not have a driver.

=========================================================================
*                           HDL Synthesis                               *
=========================================================================

Synthesizing Unit <scrod_top_A4>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd".
        NUM_GTS = 1
        HW_CONF = "SA4_MBB_DCA_RB"
WARNING:Xst:647 - Input <TDC_DONE> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <TDC_MON_TIMING> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 768: Output port <DRout<3>> of the instance <uut_pedram> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 768: Output port <DRout<1>> of the instance <uut_pedram> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 803: Output port <BOARD_CLOCK_OUT> of the instance <map_clock_gen> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 803: Output port <FTSW_TRIGGER> of the instance <map_clock_gen> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 803: Output port <CLOCK_MPPC_ADC> of the instance <map_clock_gen> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 832: Output port <WAVEFORM_PACKET_BUILDER_VETO> of the instance <map_readout_interfaces> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 832: Output port <FIBER_0_TXP> of the instance <map_readout_interfaces> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 832: Output port <FIBER_0_TXN> of the instance <map_readout_interfaces> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 832: Output port <FIBER_1_TXP> of the instance <map_readout_interfaces> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 832: Output port <FIBER_1_TXN> of the instance <map_readout_interfaces> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 832: Output port <FIBER_0_DISABLE_TRANSCEIVER> of the instance <map_readout_interfaces> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 832: Output port <FIBER_1_DISABLE_TRANSCEIVER> of the instance <map_readout_interfaces> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 832: Output port <FIBER_0_LINK_UP> of the instance <map_readout_interfaces> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 832: Output port <FIBER_1_LINK_UP> of the instance <map_readout_interfaces> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 832: Output port <FIBER_0_LINK_ERR> of the instance <map_readout_interfaces> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 832: Output port <FIBER_1_LINK_ERR> of the instance <map_readout_interfaces> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1114: Output port <busy> of the instance <uut> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1151: Output port <busy> of the instance <u_TARGETX_DAC_CONTROL> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1171: Output port <smp_stop> of the instance <u_ReadoutControl> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1171: Output port <EVTBUILD_start> of the instance <u_ReadoutControl> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1171: Output port <EVTBUILD_MAKE_READY> of the instance <u_ReadoutControl> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1171: Output port <READOUT_DONE> of the instance <u_ReadoutControl> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1250: Output port <busy> of the instance <Inst_WaveformDemuxCalcPedsBRAM> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1273: Output port <wr2_ena> of the instance <u_SamplingLgc> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1350: Output port <busy> of the instance <u_SerialDataRout> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1350: Output port <samp_done> of the instance <u_SerialDataRout> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1412: Output port <full> of the instance <u_waveform_fifo_wr32_rd32> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1457: Output port <full> of the instance <u_buffer_wr32_rd32> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1500: Output port <READ_ENABLE_TIMER> of the instance <gen_trigger_counters[0].u_trigger_scaler_single_channel_w_timing_gen> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1500: Output port <READ_ENABLE_TIMER> of the instance <gen_trigger_counters[1].u_trigger_scaler_single_channel_w_timing_gen> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1500: Output port <READ_ENABLE_TIMER> of the instance <gen_trigger_counters[2].u_trigger_scaler_single_channel_w_timing_gen> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1500: Output port <READ_ENABLE_TIMER> of the instance <gen_trigger_counters[3].u_trigger_scaler_single_channel_w_timing_gen> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1500: Output port <READ_ENABLE_TIMER> of the instance <gen_trigger_counters[4].u_trigger_scaler_single_channel_w_timing_gen> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1500: Output port <READ_ENABLE_TIMER> of the instance <gen_trigger_counters[5].u_trigger_scaler_single_channel_w_timing_gen> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1500: Output port <READ_ENABLE_TIMER> of the instance <gen_trigger_counters[6].u_trigger_scaler_single_channel_w_timing_gen> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1500: Output port <READ_ENABLE_TIMER> of the instance <gen_trigger_counters[7].u_trigger_scaler_single_channel_w_timing_gen> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1500: Output port <READ_ENABLE_TIMER> of the instance <gen_trigger_counters[8].u_trigger_scaler_single_channel_w_timing_gen> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\scrod_top2_A4.vhd" line 1500: Output port <READ_ENABLE_TIMER> of the instance <gen_trigger_counters[9].u_trigger_scaler_single_channel_w_timing_gen> is unconnected or connected to loadless signal.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<464>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<463>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<462>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<461>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<460>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<459>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<458>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<457>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<456>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<295>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<294>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<293>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<292>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<291>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<290>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<289>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<288>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<285>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<284>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<283>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<282>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<281>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<280>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<279><15:9>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<278><15:1>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<277>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<265>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<264>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_INPUT_REGISTERS<263><15:10>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_ram_Ain<1>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_ram_DWin<2>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_ram_DWin<1>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:2935 - Signal 'internal_ram_rw<1>', unconnected in block 'scrod_top_A4', is tied to its initial value (0).
WARNING:Xst:2935 - Signal 'internal_ram_update<1>', unconnected in block 'scrod_top_A4', is tied to its initial value (0).
WARNING:Xst:653 - Signal <internal_enOutput> is used but never assigned. This sourceless signal will be automatically connected to value GND.
    Found 16x10-bit Read Only RAM for signal <internal_SROUT_ASIC_CONTROL_WORD>
    Found 1-bit tristate buffer for signal <map_readout_interfaces_FIBER_0_RXP> created at line 877
    Found 1-bit tristate buffer for signal <map_readout_interfaces_FIBER_0_RXN> created at line 878
    Found 1-bit tristate buffer for signal <map_readout_interfaces_FIBER_1_RXP> created at line 879
    Found 1-bit tristate buffer for signal <map_readout_interfaces_FIBER_1_RXN> created at line 880
    Found 1-bit tristate buffer for signal <map_readout_interfaces_FIBER_REFCLKP> created at line 885
    Found 1-bit tristate buffer for signal <map_readout_interfaces_FIBER_REFCLKN> created at line 886
    Found 4-bit comparator greater for signal <internal_READCTRL_ASIC_NUM[3]_GND_12_o_LessThan_61_o> created at line 1389
    Summary:
	inferred   1 RAM(s).
	inferred   1 Comparator(s).
	inferred   4 Multiplexer(s).
	inferred   6 Tristate(s).
Unit <scrod_top_A4> synthesized.

Synthesizing Unit <SRAMscheduler>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\ise-project\SRAMscheduler.vhd".
    Found 4-bit register for signal <update_req_i1>.
    Found 4-bit register for signal <update_req_i0>.
    Found 4-bit register for signal <update_req_edg>.
    Found 32-bit register for signal <queue_i<3>>.
    Found 32-bit register for signal <queue_i<2>>.
    Found 32-bit register for signal <queue_i<1>>.
    Found 32-bit register for signal <queue_i<0>>.
    Found 32-bit register for signal <ql_i>.
    Found 32-bit adder for signal <n0453[31:0]> created at line 222.
    Found 32-bit adder for signal <n0490[31:0]> created at line 222.
    Found 32-bit adder for signal <n0562[31:0]> created at line 222.
    Found 32-bit adder for signal <ql_i[31]_GND_13_o_add_451_OUT> created at line 222.
    Found 32-bit subtractor for signal <ql_i[31]_GND_13_o_sub_472_OUT<31:0>> created at line 239.
    Found 22-bit 4-to-1 multiplexer for signal <A> created at line 144.
    Found 8-bit 4-to-1 multiplexer for signal <IOw> created at line 145.
    Found 1-bit 4-to-1 multiplexer for signal <WEb> created at line 147.
    Found 1-bit 4-to-1 multiplexer for signal <CE2> created at line 148.
    Found 1-bit 4-to-1 multiplexer for signal <CE1b> created at line 149.
    Found 1-bit 4-to-1 multiplexer for signal <OEb> created at line 150.
    Found 1-bit 4-to-1 multiplexer for signal <bs> created at line 151.
    Found 1-bit 4-to-1 multiplexer for signal <curr_ch[1]_busy_i[3]_Mux_469_o> created at line 234.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<3><7>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<3><6>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<3><5>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<3><4>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<3><3>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<3><2>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<3><1>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<3><0>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<2><7>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<2><6>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<2><5>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<2><4>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<2><3>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<2><2>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<2><1>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<2><0>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<1><7>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<1><6>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<1><5>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<1><4>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<1><3>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<1><2>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<1><1>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<1><0>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<0><7>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<0><6>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<0><5>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<0><4>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<0><3>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<0><2>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<0><1>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <IOr_i<0><0>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <ram_wait_i<3>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <ram_wait_i<2>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <ram_wait_i<1>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
WARNING:Xst:737 - Found 1-bit latch for signal <ram_wait_i<0>>. Latches may be generated from incomplete case or if statements. We do not recommend the use of latches in FPGA/CPLD designs, as they may lead to timing problems.
    Found 32-bit comparator greater for signal <GND_13_o_ql_i[31]_LessThan_81_o> created at line 211
    Found 32-bit comparator greater for signal <GND_13_o_ql_i[31]_LessThan_212_o> created at line 216
    Found 32-bit comparator greater for signal <GND_13_o_ql_i[31]_LessThan_268_o> created at line 218
    Found 32-bit comparator greater for signal <GND_13_o_ql_i[31]_LessThan_416_o> created at line 222
    Found 32-bit comparator greater for signal <ql_i[31]_GND_13_o_LessThan_471_o> created at line 234
    Summary:
	inferred   5 Adder/Subtractor(s).
	inferred 172 D-type flip-flop(s).
	inferred  36 Latch(s).
	inferred   5 Comparator(s).
	inferred 187 Multiplexer(s).
Unit <SRAMscheduler> synthesized.

Synthesizing Unit <SRAMiface2>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\peripherals\SRAMiface2.vhd".
    Found 1-bit register for signal <ram_busy_i>.
    Found 1-bit register for signal <bufstate>.
    Found 22-bit register for signal <A>.
    Found 1-bit register for signal <CE1b>.
    Found 1-bit register for signal <CE2>.
    Found 1-bit register for signal <WEb>.
    Found 1-bit register for signal <OEb>.
    Found 1-bit register for signal <busy_i>.
    Found 8-bit register for signal <dr>.
    Found 8-bit register for signal <dw_i>.
    Found 1-bit register for signal <rw_i>.
    Found 22-bit register for signal <addr_i>.
    Found 4-bit register for signal <next_state>.
    Found 8-bit register for signal <IOw>.
    Found 32-bit register for signal <cnt_tHZOE>.
    Found 32-bit register for signal <cnt_tWEND>.
    Found 32-bit register for signal <cnt_tRDOUT>.
    Found 8-bit register for signal <dr_i>.
    Found 32-bit register for signal <cnt_tREND>.
    Found 1-bit register for signal <update_i<0>>.
    Found finite state machine <FSM_0> for signal <next_state>.
    -----------------------------------------------------------------------
    | States             | 11                                             |
    | Transitions        | 19                                             |
    | Inputs             | 8                                              |
    | Outputs            | 9                                              |
    | Clock              | clk (rising_edge)                              |
    | Power Up State     | idle                                           |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found 32-bit adder for signal <cnt_tHZOE[31]_GND_14_o_add_8_OUT> created at line 183.
    Found 32-bit adder for signal <cnt_tWEND[31]_GND_14_o_add_12_OUT> created at line 198.
    Found 32-bit adder for signal <cnt_tRDOUT[31]_GND_14_o_add_16_OUT> created at line 221.
    Found 32-bit adder for signal <cnt_tREND[31]_GND_14_o_add_21_OUT> created at line 230.
    Summary:
	inferred   4 Adder/Subtractor(s).
	inferred 213 D-type flip-flop(s).
	inferred   6 Multiplexer(s).
	inferred   1 Finite State Machine(s).
Unit <SRAMiface2> synthesized.

Synthesizing Unit <clock_gen>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\clocking\clock_gen_A4.vhd".
        HW_CONF = "SA4_MBB_DCA_RB"
WARNING:Xst:653 - Signal <FTSW_TRIGGER> is used but never assigned. This sourceless signal will be automatically connected to value GND.
    Summary:
	no macro.
Unit <clock_gen> synthesized.

Synthesizing Unit <clock_enable_generator_1>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\utilities\clock_enable_generator.vhd".
        DIVIDE_RATIO = 2
    Found 1-bit register for signal <internal_clkout>.
    Found 10-bit register for signal <internal_COUNTER>.
    Found 10-bit adder for signal <internal_COUNTER[9]_GND_52_o_add_1_OUT> created at line 1241.
    Summary:
	inferred   1 Adder/Subtractor(s).
	inferred  11 D-type flip-flop(s).
Unit <clock_enable_generator_1> synthesized.

Synthesizing Unit <clock_enable_generator_2>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\utilities\clock_enable_generator.vhd".
        DIVIDE_RATIO = 6
    Found 1-bit register for signal <internal_clkout>.
    Found 10-bit register for signal <internal_COUNTER>.
    Found 10-bit adder for signal <internal_COUNTER[9]_GND_53_o_add_1_OUT> created at line 1241.
    Summary:
	inferred   1 Adder/Subtractor(s).
	inferred  11 D-type flip-flop(s).
Unit <clock_enable_generator_2> synthesized.

Synthesizing Unit <readout_interface>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\readout_interface.vhd".
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\readout_interface.vhd" line 157: Output port <k_write_strobe> of the instance <command_interpreter_processor> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\readout_interface.vhd" line 157: Output port <interrupt_ack> of the instance <command_interpreter_processor> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\readout_interface.vhd" line 334: Output port <OUT_FALLING> of the instance <inst_write_edge> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\readout_interface.vhd" line 347: Output port <FIFO_INP_0_VALID> of the instance <map_daq_fifo_layer> is unconnected or connected to loadless signal.
WARNING:Xst:653 - Signal <internal_PB_INTERRUPT> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_PB_SLEEP> is used but never assigned. This sourceless signal will be automatically connected to value GND.
    Found 32-bit register for signal <internal_CI_DATA_TO_FIFO>.
    Found 16-bit register for signal <internal_GPR_ADDRESS>.
    Found 16-bit register for signal <internal_GPR_DATA_TO_WRITE>.
    Found 8-bit register for signal <internal_WAVEFORM_DATA_INTERFACE>.
    Found 1-bit register for signal <internal_WAVEFORM_FIFO_WRITE_ENABLE>.
    Found 32-bit register for signal <internal_WAVEFORM_FIFO_DATA_IN>.
    Found 16-bit register for signal <internal_GPR<0>>.
    Found 16-bit register for signal <internal_GPR<1>>.
    Found 16-bit register for signal <internal_GPR<2>>.
    Found 16-bit register for signal <internal_GPR<3>>.
    Found 16-bit register for signal <internal_GPR<4>>.
    Found 16-bit register for signal <internal_GPR<5>>.
    Found 16-bit register for signal <internal_GPR<6>>.
    Found 16-bit register for signal <internal_GPR<7>>.
    Found 16-bit register for signal <internal_GPR<8>>.
    Found 16-bit register for signal <internal_GPR<9>>.
    Found 16-bit register for signal <internal_GPR<10>>.
    Found 16-bit register for signal <internal_GPR<11>>.
    Found 16-bit register for signal <internal_GPR<12>>.
    Found 16-bit register for signal <internal_GPR<13>>.
    Found 16-bit register for signal <internal_GPR<14>>.
    Found 16-bit register for signal <internal_GPR<15>>.
    Found 16-bit register for signal <internal_GPR<16>>.
    Found 16-bit register for signal <internal_GPR<17>>.
    Found 16-bit register for signal <internal_GPR<18>>.
    Found 16-bit register for signal <internal_GPR<19>>.
    Found 16-bit register for signal <internal_GPR<20>>.
    Found 16-bit register for signal <internal_GPR<21>>.
    Found 16-bit register for signal <internal_GPR<22>>.
    Found 16-bit register for signal <internal_GPR<23>>.
    Found 16-bit register for signal <internal_GPR<24>>.
    Found 16-bit register for signal <internal_GPR<25>>.
    Found 16-bit register for signal <internal_GPR<26>>.
    Found 16-bit register for signal <internal_GPR<27>>.
    Found 16-bit register for signal <internal_GPR<28>>.
    Found 16-bit register for signal <internal_GPR<29>>.
    Found 16-bit register for signal <internal_GPR<30>>.
    Found 16-bit register for signal <internal_GPR<31>>.
    Found 16-bit register for signal <internal_GPR<32>>.
    Found 16-bit register for signal <internal_GPR<33>>.
    Found 16-bit register for signal <internal_GPR<34>>.
    Found 16-bit register for signal <internal_GPR<35>>.
    Found 16-bit register for signal <internal_GPR<36>>.
    Found 16-bit register for signal <internal_GPR<37>>.
    Found 16-bit register for signal <internal_GPR<38>>.
    Found 16-bit register for signal <internal_GPR<39>>.
    Found 16-bit register for signal <internal_GPR<40>>.
    Found 16-bit register for signal <internal_GPR<41>>.
    Found 16-bit register for signal <internal_GPR<42>>.
    Found 16-bit register for signal <internal_GPR<43>>.
    Found 16-bit register for signal <internal_GPR<44>>.
    Found 16-bit register for signal <internal_GPR<45>>.
    Found 16-bit register for signal <internal_GPR<46>>.
    Found 16-bit register for signal <internal_GPR<47>>.
    Found 16-bit register for signal <internal_GPR<48>>.
    Found 16-bit register for signal <internal_GPR<49>>.
    Found 16-bit register for signal <internal_GPR<50>>.
    Found 16-bit register for signal <internal_GPR<51>>.
    Found 16-bit register for signal <internal_GPR<52>>.
    Found 16-bit register for signal <internal_GPR<53>>.
    Found 16-bit register for signal <internal_GPR<54>>.
    Found 16-bit register for signal <internal_GPR<55>>.
    Found 16-bit register for signal <internal_GPR<56>>.
    Found 16-bit register for signal <internal_GPR<57>>.
    Found 16-bit register for signal <internal_GPR<58>>.
    Found 16-bit register for signal <internal_GPR<59>>.
    Found 16-bit register for signal <internal_GPR<60>>.
    Found 16-bit register for signal <internal_GPR<61>>.
    Found 16-bit register for signal <internal_GPR<62>>.
    Found 16-bit register for signal <internal_GPR<63>>.
    Found 16-bit register for signal <internal_GPR<64>>.
    Found 16-bit register for signal <internal_GPR<65>>.
    Found 16-bit register for signal <internal_GPR<66>>.
    Found 16-bit register for signal <internal_GPR<67>>.
    Found 16-bit register for signal <internal_GPR<68>>.
    Found 16-bit register for signal <internal_GPR<69>>.
    Found 16-bit register for signal <internal_GPR<70>>.
    Found 16-bit register for signal <internal_GPR<71>>.
    Found 16-bit register for signal <internal_GPR<72>>.
    Found 16-bit register for signal <internal_GPR<73>>.
    Found 16-bit register for signal <internal_GPR<74>>.
    Found 16-bit register for signal <internal_GPR<75>>.
    Found 16-bit register for signal <internal_GPR<76>>.
    Found 16-bit register for signal <internal_GPR<77>>.
    Found 16-bit register for signal <internal_GPR<78>>.
    Found 16-bit register for signal <internal_GPR<79>>.
    Found 16-bit register for signal <internal_GPR<80>>.
    Found 16-bit register for signal <internal_GPR<81>>.
    Found 16-bit register for signal <internal_GPR<82>>.
    Found 16-bit register for signal <internal_GPR<83>>.
    Found 16-bit register for signal <internal_GPR<84>>.
    Found 16-bit register for signal <internal_GPR<85>>.
    Found 16-bit register for signal <internal_GPR<86>>.
    Found 16-bit register for signal <internal_GPR<87>>.
    Found 16-bit register for signal <internal_GPR<88>>.
    Found 16-bit register for signal <internal_GPR<89>>.
    Found 16-bit register for signal <internal_GPR<90>>.
    Found 16-bit register for signal <internal_GPR<91>>.
    Found 16-bit register for signal <internal_GPR<92>>.
    Found 16-bit register for signal <internal_GPR<93>>.
    Found 16-bit register for signal <internal_GPR<94>>.
    Found 16-bit register for signal <internal_GPR<95>>.
    Found 16-bit register for signal <internal_GPR<96>>.
    Found 16-bit register for signal <internal_GPR<97>>.
    Found 16-bit register for signal <internal_GPR<98>>.
    Found 16-bit register for signal <internal_GPR<99>>.
    Found 16-bit register for signal <internal_GPR<100>>.
    Found 16-bit register for signal <internal_GPR<101>>.
    Found 16-bit register for signal <internal_GPR<102>>.
    Found 16-bit register for signal <internal_GPR<103>>.
    Found 16-bit register for signal <internal_GPR<104>>.
    Found 16-bit register for signal <internal_GPR<105>>.
    Found 16-bit register for signal <internal_GPR<106>>.
    Found 16-bit register for signal <internal_GPR<107>>.
    Found 16-bit register for signal <internal_GPR<108>>.
    Found 16-bit register for signal <internal_GPR<109>>.
    Found 16-bit register for signal <internal_GPR<110>>.
    Found 16-bit register for signal <internal_GPR<111>>.
    Found 16-bit register for signal <internal_GPR<112>>.
    Found 16-bit register for signal <internal_GPR<113>>.
    Found 16-bit register for signal <internal_GPR<114>>.
    Found 16-bit register for signal <internal_GPR<115>>.
    Found 16-bit register for signal <internal_GPR<116>>.
    Found 16-bit register for signal <internal_GPR<117>>.
    Found 16-bit register for signal <internal_GPR<118>>.
    Found 16-bit register for signal <internal_GPR<119>>.
    Found 16-bit register for signal <internal_GPR<120>>.
    Found 16-bit register for signal <internal_GPR<121>>.
    Found 16-bit register for signal <internal_GPR<122>>.
    Found 16-bit register for signal <internal_GPR<123>>.
    Found 16-bit register for signal <internal_GPR<124>>.
    Found 16-bit register for signal <internal_GPR<125>>.
    Found 16-bit register for signal <internal_GPR<126>>.
    Found 16-bit register for signal <internal_GPR<127>>.
    Found 16-bit register for signal <internal_GPR<128>>.
    Found 16-bit register for signal <internal_GPR<129>>.
    Found 16-bit register for signal <internal_GPR<130>>.
    Found 16-bit register for signal <internal_GPR<131>>.
    Found 16-bit register for signal <internal_GPR<132>>.
    Found 16-bit register for signal <internal_GPR<133>>.
    Found 16-bit register for signal <internal_GPR<134>>.
    Found 16-bit register for signal <internal_GPR<135>>.
    Found 16-bit register for signal <internal_GPR<136>>.
    Found 16-bit register for signal <internal_GPR<137>>.
    Found 16-bit register for signal <internal_GPR<138>>.
    Found 16-bit register for signal <internal_GPR<139>>.
    Found 16-bit register for signal <internal_GPR<140>>.
    Found 16-bit register for signal <internal_GPR<141>>.
    Found 16-bit register for signal <internal_GPR<142>>.
    Found 16-bit register for signal <internal_GPR<143>>.
    Found 16-bit register for signal <internal_GPR<144>>.
    Found 16-bit register for signal <internal_GPR<145>>.
    Found 16-bit register for signal <internal_GPR<146>>.
    Found 16-bit register for signal <internal_GPR<147>>.
    Found 16-bit register for signal <internal_GPR<148>>.
    Found 16-bit register for signal <internal_GPR<149>>.
    Found 16-bit register for signal <internal_GPR<150>>.
    Found 16-bit register for signal <internal_GPR<151>>.
    Found 16-bit register for signal <internal_GPR<152>>.
    Found 16-bit register for signal <internal_GPR<153>>.
    Found 16-bit register for signal <internal_GPR<154>>.
    Found 16-bit register for signal <internal_GPR<155>>.
    Found 16-bit register for signal <internal_GPR<156>>.
    Found 16-bit register for signal <internal_GPR<157>>.
    Found 16-bit register for signal <internal_GPR<158>>.
    Found 16-bit register for signal <internal_GPR<159>>.
    Found 16-bit register for signal <internal_GPR<160>>.
    Found 16-bit register for signal <internal_GPR<161>>.
    Found 16-bit register for signal <internal_GPR<162>>.
    Found 16-bit register for signal <internal_GPR<163>>.
    Found 16-bit register for signal <internal_GPR<164>>.
    Found 16-bit register for signal <internal_GPR<165>>.
    Found 16-bit register for signal <internal_GPR<166>>.
    Found 16-bit register for signal <internal_GPR<167>>.
    Found 16-bit register for signal <internal_GPR<168>>.
    Found 16-bit register for signal <internal_GPR<169>>.
    Found 16-bit register for signal <internal_GPR<170>>.
    Found 16-bit register for signal <internal_GPR<171>>.
    Found 16-bit register for signal <internal_GPR<172>>.
    Found 16-bit register for signal <internal_GPR<173>>.
    Found 16-bit register for signal <internal_GPR<174>>.
    Found 16-bit register for signal <internal_GPR<175>>.
    Found 16-bit register for signal <internal_GPR<176>>.
    Found 16-bit register for signal <internal_GPR<177>>.
    Found 16-bit register for signal <internal_GPR<178>>.
    Found 16-bit register for signal <internal_GPR<179>>.
    Found 16-bit register for signal <internal_GPR<180>>.
    Found 16-bit register for signal <internal_GPR<181>>.
    Found 16-bit register for signal <internal_GPR<182>>.
    Found 16-bit register for signal <internal_GPR<183>>.
    Found 16-bit register for signal <internal_GPR<184>>.
    Found 16-bit register for signal <internal_GPR<185>>.
    Found 16-bit register for signal <internal_GPR<186>>.
    Found 16-bit register for signal <internal_GPR<187>>.
    Found 16-bit register for signal <internal_GPR<188>>.
    Found 16-bit register for signal <internal_GPR<189>>.
    Found 16-bit register for signal <internal_GPR<190>>.
    Found 16-bit register for signal <internal_GPR<191>>.
    Found 16-bit register for signal <internal_GPR<192>>.
    Found 16-bit register for signal <internal_GPR<193>>.
    Found 16-bit register for signal <internal_GPR<194>>.
    Found 16-bit register for signal <internal_GPR<195>>.
    Found 16-bit register for signal <internal_GPR<196>>.
    Found 16-bit register for signal <internal_GPR<197>>.
    Found 16-bit register for signal <internal_GPR<198>>.
    Found 16-bit register for signal <internal_GPR<199>>.
    Found 16-bit register for signal <internal_GPR<200>>.
    Found 16-bit register for signal <internal_GPR<201>>.
    Found 16-bit register for signal <internal_GPR<202>>.
    Found 16-bit register for signal <internal_GPR<203>>.
    Found 16-bit register for signal <internal_GPR<204>>.
    Found 16-bit register for signal <internal_GPR<205>>.
    Found 16-bit register for signal <internal_GPR<206>>.
    Found 16-bit register for signal <internal_GPR<207>>.
    Found 16-bit register for signal <internal_GPR<208>>.
    Found 16-bit register for signal <internal_GPR<209>>.
    Found 16-bit register for signal <internal_GPR<210>>.
    Found 16-bit register for signal <internal_GPR<211>>.
    Found 16-bit register for signal <internal_GPR<212>>.
    Found 16-bit register for signal <internal_GPR<213>>.
    Found 16-bit register for signal <internal_GPR<214>>.
    Found 16-bit register for signal <internal_GPR<215>>.
    Found 16-bit register for signal <internal_GPR<216>>.
    Found 16-bit register for signal <internal_GPR<217>>.
    Found 16-bit register for signal <internal_GPR<218>>.
    Found 16-bit register for signal <internal_GPR<219>>.
    Found 16-bit register for signal <internal_GPR<220>>.
    Found 16-bit register for signal <internal_GPR<221>>.
    Found 16-bit register for signal <internal_GPR<222>>.
    Found 16-bit register for signal <internal_GPR<223>>.
    Found 16-bit register for signal <internal_GPR<224>>.
    Found 16-bit register for signal <internal_GPR<225>>.
    Found 16-bit register for signal <internal_GPR<226>>.
    Found 16-bit register for signal <internal_GPR<227>>.
    Found 16-bit register for signal <internal_GPR<228>>.
    Found 16-bit register for signal <internal_GPR<229>>.
    Found 16-bit register for signal <internal_GPR<230>>.
    Found 16-bit register for signal <internal_GPR<231>>.
    Found 16-bit register for signal <internal_GPR<232>>.
    Found 16-bit register for signal <internal_GPR<233>>.
    Found 16-bit register for signal <internal_GPR<234>>.
    Found 16-bit register for signal <internal_GPR<235>>.
    Found 16-bit register for signal <internal_GPR<236>>.
    Found 16-bit register for signal <internal_GPR<237>>.
    Found 16-bit register for signal <internal_GPR<238>>.
    Found 16-bit register for signal <internal_GPR<239>>.
    Found 16-bit register for signal <internal_GPR<240>>.
    Found 16-bit register for signal <internal_GPR<241>>.
    Found 16-bit register for signal <internal_GPR<242>>.
    Found 16-bit register for signal <internal_GPR<243>>.
    Found 16-bit register for signal <internal_GPR<244>>.
    Found 16-bit register for signal <internal_GPR<245>>.
    Found 16-bit register for signal <internal_GPR<246>>.
    Found 16-bit register for signal <internal_GPR<247>>.
    Found 16-bit register for signal <internal_GPR<248>>.
    Found 16-bit register for signal <internal_GPR<249>>.
    Found 16-bit register for signal <internal_GPR<250>>.
    Found 16-bit register for signal <internal_GPR<251>>.
    Found 16-bit register for signal <internal_GPR<252>>.
    Found 16-bit register for signal <internal_GPR<253>>.
    Found 16-bit register for signal <internal_GPR<254>>.
    Found 16-bit register for signal <internal_GPR<255>>.
    Found 256-bit register for signal <REGISTER_UPDATED>.
    Found 1-bit register for signal <internal_EVT_INP_FIFO_READ_ENABLE_reg>.
    Found 16-bit 446-to-1 multiplexer for signal <internal_GPR_ADDRESS[8]_X_54_o_wide_mux_766_OUT> created at line 318.
    Found 8-bit 8-to-1 multiplexer for signal <internal_PB_IN_PORT> created at line 93.
    Summary:
	inferred 4458 D-type flip-flop(s).
	inferred 266 Multiplexer(s).
Unit <readout_interface> synthesized.

Synthesizing Unit <kcpsm6>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\picoblaze\kcpsm6.vhd".
        hwbuild = "00000000"
        interrupt_vector = "001111111111"
        scratch_pad_memory_size = 64
    Set property "HBLKNM = KCPSM6_CONTROL" for instance <reset_lut>.
    Set property "HBLKNM = KCPSM6_CONTROL" for instance <run_flop>.
    Set property "HBLKNM = KCPSM6_CONTROL" for instance <internal_reset_flop>.
    Set property "HBLKNM = KCPSM6_DECODE2" for instance <sync_sleep_flop>.
    Set property "HBLKNM = KCPSM6_CONTROL" for instance <t_state_lut>.
    Set property "HBLKNM = KCPSM6_CONTROL" for instance <t_state1_flop>.
    Set property "HBLKNM = KCPSM6_CONTROL" for instance <t_state2_flop>.
    Set property "HBLKNM = KCPSM6_DECODE0" for instance <int_enable_type_lut>.
    Set property "HBLKNM = KCPSM6_DECODE0" for instance <interrupt_enable_lut>.
    Set property "HBLKNM = KCPSM6_DECODE0" for instance <interrupt_enable_flop>.
    Set property "HBLKNM = KCPSM6_DECODE2" for instance <sync_interrupt_flop>.
    Set property "HBLKNM = KCPSM6_CONTROL" for instance <active_interrupt_lut>.
    Set property "HBLKNM = KCPSM6_CONTROL" for instance <active_interrupt_flop>.
    Set property "HBLKNM = KCPSM6_DECODE1" for instance <interrupt_ack_flop>.
    Set property "HBLKNM = KCPSM6_DECODE0" for instance <pc_move_is_valid_lut>.
    Set property "HBLKNM = KCPSM6_DECODE0" for instance <move_type_lut>.
    Set property "HBLKNM = KCPSM6_VECTOR1" for instance <pc_mode1_lut>.
    Set property "HBLKNM = KCPSM6_VECTOR1" for instance <pc_mode2_lut>.
    Set property "HBLKNM = KCPSM6_STACK1" for instance <push_pop_lut>.
    Set property "HBLKNM = KCPSM6_DECODE2" for instance <alu_decode0_lut>.
    Set property "HBLKNM = KCPSM6_DECODE2" for instance <alu_mux_sel0_flop>.
    Set property "HBLKNM = KCPSM6_DECODE1" for instance <alu_decode1_lut>.
    Set property "HBLKNM = KCPSM6_DECODE1" for instance <alu_mux_sel1_flop>.
    Set property "HBLKNM = KCPSM6_DECODE2" for instance <alu_decode2_lut>.
    Set property "HBLKNM = KCPSM6_STROBES" for instance <register_enable_type_lut>.
    Set property "HBLKNM = KCPSM6_STROBES" for instance <register_enable_lut>.
    Set property "HBLKNM = KCPSM6_STROBES" for instance <flag_enable_flop>.
    Set property "HBLKNM = KCPSM6_STROBES" for instance <register_enable_flop>.
    Set property "HBLKNM = KCPSM6_STROBES" for instance <spm_enable_lut>.
    Set property "HBLKNM = KCPSM6_STROBES" for instance <k_write_strobe_flop>.
    Set property "HBLKNM = KCPSM6_STROBES" for instance <spm_enable_flop>.
    Set property "HBLKNM = KCPSM6_STROBES" for instance <read_strobe_lut>.
    Set property "HBLKNM = KCPSM6_STROBES" for instance <write_strobe_flop>.
    Set property "HBLKNM = KCPSM6_STROBES" for instance <read_strobe_flop>.
    Set property "HBLKNM = KCPSM6_STACK1" for instance <regbank_type_lut>.
    Set property "HBLKNM = KCPSM6_STACK1" for instance <bank_lut>.
    Set property "HBLKNM = KCPSM6_STACK1" for instance <bank_flop>.
    Set property "HBLKNM = KCPSM6_CONTROL" for instance <sx_addr4_flop>.
    Set property "HBLKNM = KCPSM6_CONTROL" for instance <arith_carry_xorcy>.
    Set property "HBLKNM = KCPSM6_CONTROL" for instance <arith_carry_flop>.
    Set property "HBLKNM = KCPSM6_DECODE2" for instance <lower_parity_lut>.
    Set property "HBLKNM = KCPSM6_DECODE2" for instance <parity_muxcy>.
    Set property "HBLKNM = KCPSM6_DECODE2" for instance <upper_parity_lut>.
    Set property "HBLKNM = KCPSM6_DECODE2" for instance <parity_xorcy>.
    Set property "HBLKNM = KCPSM6_DECODE1" for instance <shift_carry_lut>.
    Set property "HBLKNM = KCPSM6_DECODE1" for instance <shift_carry_flop>.
    Set property "HBLKNM = KCPSM6_FLAGS" for instance <carry_flag_lut>.
    Set property "HBLKNM = KCPSM6_FLAGS" for instance <carry_flag_flop>.
    Set property "HBLKNM = KCPSM6_FLAGS" for instance <init_zero_muxcy>.
    Set property "HBLKNM = KCPSM6_DECODE1" for instance <use_zero_flag_lut>.
    Set property "HBLKNM = KCPSM6_DECODE1" for instance <use_zero_flag_flop>.
    Set property "HBLKNM = KCPSM6_FLAGS" for instance <lower_zero_lut>.
    Set property "HBLKNM = KCPSM6_FLAGS" for instance <lower_zero_muxcy>.
    Set property "HBLKNM = KCPSM6_FLAGS" for instance <middle_zero_lut>.
    Set property "HBLKNM = KCPSM6_FLAGS" for instance <middle_zero_muxcy>.
    Set property "HBLKNM = KCPSM6_FLAGS" for instance <upper_zero_lut>.
    Set property "HBLKNM = KCPSM6_FLAGS" for instance <upper_zero_muxcy>.
    Set property "HBLKNM = KCPSM6_FLAGS" for instance <zero_flag_flop>.
    Set property "HBLKNM = KCPSM6_STACK_RAM0" for instance <address_loop[0].return_vector_flop>.
    Set property "HBLKNM = KCPSM6_VECTOR0" for instance <address_loop[0].output_data.pc_vector_mux_lut>.
    Set property "HBLKNM = KCPSM6_PC0" for instance <address_loop[0].pc_flop>.
    Set property "HBLKNM = KCPSM6_PC0" for instance <address_loop[0].lsb_pc.high_int_vector.pc_lut>.
    Set property "HBLKNM = KCPSM6_PC0" for instance <address_loop[0].lsb_pc.pc_xorcy>.
    Set property "HBLKNM = KCPSM6_PC0" for instance <address_loop[0].lsb_pc.pc_muxcy>.
    Set property "HBLKNM = KCPSM6_STACK_RAM0" for instance <address_loop[1].return_vector_flop>.
    Set property "HBLKNM = KCPSM6_PC0" for instance <address_loop[1].pc_flop>.
    Set property "HBLKNM = KCPSM6_PC0" for instance <address_loop[1].upper_pc.high_int_vector.pc_lut>.
    Set property "HBLKNM = KCPSM6_PC0" for instance <address_loop[1].upper_pc.pc_xorcy>.
    Set property "HBLKNM = KCPSM6_PC0" for instance <address_loop[1].upper_pc.mid_pc.pc_muxcy>.
    Set property "HBLKNM = KCPSM6_STACK_RAM0" for instance <address_loop[2].return_vector_flop>.
    Set property "HBLKNM = KCPSM6_VECTOR0" for instance <address_loop[2].output_data.pc_vector_mux_lut>.
    Set property "HBLKNM = KCPSM6_PC0" for instance <address_loop[2].pc_flop>.
    Set property "HBLKNM = KCPSM6_PC0" for instance <address_loop[2].upper_pc.high_int_vector.pc_lut>.
    Set property "HBLKNM = KCPSM6_PC0" for instance <address_loop[2].upper_pc.pc_xorcy>.
    Set property "HBLKNM = KCPSM6_PC0" for instance <address_loop[2].upper_pc.mid_pc.pc_muxcy>.
    Set property "HBLKNM = KCPSM6_STACK_RAM0" for instance <address_loop[3].return_vector_flop>.
    Set property "HBLKNM = KCPSM6_PC0" for instance <address_loop[3].pc_flop>.
    Set property "HBLKNM = KCPSM6_PC0" for instance <address_loop[3].upper_pc.high_int_vector.pc_lut>.
    Set property "HBLKNM = KCPSM6_PC0" for instance <address_loop[3].upper_pc.pc_xorcy>.
    Set property "HBLKNM = KCPSM6_PC0" for instance <address_loop[3].upper_pc.mid_pc.pc_muxcy>.
    Set property "HBLKNM = KCPSM6_STACK_RAM1" for instance <address_loop[4].return_vector_flop>.
    Set property "HBLKNM = KCPSM6_VECTOR0" for instance <address_loop[4].output_data.pc_vector_mux_lut>.
    Set property "HBLKNM = KCPSM6_PC1" for instance <address_loop[4].pc_flop>.
    Set property "HBLKNM = KCPSM6_PC1" for instance <address_loop[4].upper_pc.high_int_vector.pc_lut>.
    Set property "HBLKNM = KCPSM6_PC1" for instance <address_loop[4].upper_pc.pc_xorcy>.
    Set property "HBLKNM = KCPSM6_PC1" for instance <address_loop[4].upper_pc.mid_pc.pc_muxcy>.
    Set property "HBLKNM = KCPSM6_STACK_RAM1" for instance <address_loop[5].return_vector_flop>.
    Set property "HBLKNM = KCPSM6_PC1" for instance <address_loop[5].pc_flop>.
    Set property "HBLKNM = KCPSM6_PC1" for instance <address_loop[5].upper_pc.high_int_vector.pc_lut>.
    Set property "HBLKNM = KCPSM6_PC1" for instance <address_loop[5].upper_pc.pc_xorcy>.
    Set property "HBLKNM = KCPSM6_PC1" for instance <address_loop[5].upper_pc.mid_pc.pc_muxcy>.
    Set property "HBLKNM = KCPSM6_STACK_RAM1" for instance <address_loop[6].return_vector_flop>.
    Set property "HBLKNM = KCPSM6_VECTOR0" for instance <address_loop[6].output_data.pc_vector_mux_lut>.
    Set property "HBLKNM = KCPSM6_PC1" for instance <address_loop[6].pc_flop>.
    Set property "HBLKNM = KCPSM6_PC1" for instance <address_loop[6].upper_pc.high_int_vector.pc_lut>.
    Set property "HBLKNM = KCPSM6_PC1" for instance <address_loop[6].upper_pc.pc_xorcy>.
    Set property "HBLKNM = KCPSM6_PC1" for instance <address_loop[6].upper_pc.mid_pc.pc_muxcy>.
    Set property "HBLKNM = KCPSM6_STACK_RAM1" for instance <address_loop[7].return_vector_flop>.
    Set property "HBLKNM = KCPSM6_PC1" for instance <address_loop[7].pc_flop>.
    Set property "HBLKNM = KCPSM6_PC1" for instance <address_loop[7].upper_pc.high_int_vector.pc_lut>.
    Set property "HBLKNM = KCPSM6_PC1" for instance <address_loop[7].upper_pc.pc_xorcy>.
    Set property "HBLKNM = KCPSM6_PC1" for instance <address_loop[7].upper_pc.mid_pc.pc_muxcy>.
    Set property "HBLKNM = KCPSM6_STACK_RAM1" for instance <address_loop[8].return_vector_flop>.
    Set property "HBLKNM = KCPSM6_VECTOR1" for instance <address_loop[8].output_data.pc_vector_mux_lut>.
    Set property "HBLKNM = KCPSM6_PC2" for instance <address_loop[8].pc_flop>.
    Set property "HBLKNM = KCPSM6_PC2" for instance <address_loop[8].upper_pc.high_int_vector.pc_lut>.
    Set property "HBLKNM = KCPSM6_PC2" for instance <address_loop[8].upper_pc.pc_xorcy>.
    Set property "HBLKNM = KCPSM6_PC2" for instance <address_loop[8].upper_pc.mid_pc.pc_muxcy>.
    Set property "HBLKNM = KCPSM6_STACK_RAM1" for instance <address_loop[9].return_vector_flop>.
    Set property "HBLKNM = KCPSM6_PC2" for instance <address_loop[9].pc_flop>.
    Set property "HBLKNM = KCPSM6_PC2" for instance <address_loop[9].upper_pc.high_int_vector.pc_lut>.
    Set property "HBLKNM = KCPSM6_PC2" for instance <address_loop[9].upper_pc.pc_xorcy>.
    Set property "HBLKNM = KCPSM6_PC2" for instance <address_loop[9].upper_pc.mid_pc.pc_muxcy>.
    Set property "HBLKNM = KCPSM6_STACK_RAM1" for instance <address_loop[10].return_vector_flop>.
    Set property "HBLKNM = KCPSM6_VECTOR1" for instance <address_loop[10].output_data.pc_vector_mux_lut>.
    Set property "HBLKNM = KCPSM6_PC2" for instance <address_loop[10].pc_flop>.
    Set property "HBLKNM = KCPSM6_PC2" for instance <address_loop[10].upper_pc.low_int_vector.pc_lut>.
    Set property "HBLKNM = KCPSM6_PC2" for instance <address_loop[10].upper_pc.pc_xorcy>.
    Set property "HBLKNM = KCPSM6_PC2" for instance <address_loop[10].upper_pc.mid_pc.pc_muxcy>.
    Set property "HBLKNM = KCPSM6_STACK_RAM1" for instance <address_loop[11].return_vector_flop>.
    Set property "HBLKNM = KCPSM6_PC2" for instance <address_loop[11].pc_flop>.
    Set property "HBLKNM = KCPSM6_PC2" for instance <address_loop[11].upper_pc.low_int_vector.pc_lut>.
    Set property "HBLKNM = KCPSM6_PC2" for instance <address_loop[11].upper_pc.pc_xorcy>.
    Set property "HBLKNM = KCPSM6_STACK_RAM0" for instance <shadow_carry_flag_flop>.
    Set property "HBLKNM = KCPSM6_STACK_RAM0" for instance <stack_zero_flop>.
    Set property "HBLKNM = KCPSM6_DECODE1" for instance <shadow_zero_flag_flop>.
    Set property "HBLKNM = KCPSM6_STACK_RAM0" for instance <shadow_bank_flop>.
    Set property "HBLKNM = KCPSM6_STACK_RAM0" for instance <stack_bit_flop>.
    Set property "HBLKNM = KCPSM6_STACK_RAM0" for instance <stack_ram_low>.
    Set property "HBLKNM = KCPSM6_STACK_RAM1" for instance <stack_ram_high>.
    Set property "HBLKNM = KCPSM6_STACK0" for instance <stack_loop[0].lsb_stack.pointer_flop>.
    Set property "HBLKNM = KCPSM6_STACK0" for instance <stack_loop[0].lsb_stack.stack_pointer_lut>.
    Set property "HBLKNM = KCPSM6_STACK0" for instance <stack_loop[0].lsb_stack.stack_xorcy>.
    Set property "HBLKNM = KCPSM6_STACK0" for instance <stack_loop[0].lsb_stack.stack_muxcy>.
    Set property "HBLKNM = KCPSM6_STACK0" for instance <stack_loop[1].upper_stack.pointer_flop>.
    Set property "HBLKNM = KCPSM6_STACK0" for instance <stack_loop[1].upper_stack.stack_pointer_lut>.
    Set property "HBLKNM = KCPSM6_STACK0" for instance <stack_loop[1].upper_stack.stack_xorcy>.
    Set property "HBLKNM = KCPSM6_STACK0" for instance <stack_loop[1].upper_stack.stack_muxcy>.
    Set property "HBLKNM = KCPSM6_STACK0" for instance <stack_loop[2].upper_stack.pointer_flop>.
    Set property "HBLKNM = KCPSM6_STACK0" for instance <stack_loop[2].upper_stack.stack_pointer_lut>.
    Set property "HBLKNM = KCPSM6_STACK0" for instance <stack_loop[2].upper_stack.stack_xorcy>.
    Set property "HBLKNM = KCPSM6_STACK0" for instance <stack_loop[2].upper_stack.stack_muxcy>.
    Set property "HBLKNM = KCPSM6_STACK0" for instance <stack_loop[3].upper_stack.pointer_flop>.
    Set property "HBLKNM = KCPSM6_STACK0" for instance <stack_loop[3].upper_stack.stack_pointer_lut>.
    Set property "HBLKNM = KCPSM6_STACK0" for instance <stack_loop[3].upper_stack.stack_xorcy>.
    Set property "HBLKNM = KCPSM6_STACK0" for instance <stack_loop[3].upper_stack.stack_muxcy>.
    Set property "HBLKNM = KCPSM6_STACK1" for instance <stack_loop[4].upper_stack.pointer_flop>.
    Set property "HBLKNM = KCPSM6_STACK1" for instance <stack_loop[4].upper_stack.stack_pointer_lut>.
    Set property "HBLKNM = KCPSM6_STACK1" for instance <stack_loop[4].upper_stack.stack_xorcy>.
    Set property "HBLKNM = KCPSM6_STACK1" for instance <stack_loop[4].upper_stack.stack_muxcy>.
    Set property "HBLKNM = KCPSM6_PORT_ID" for instance <data_path_loop[0].output_data.sy_kk_mux_lut>.
    Set property "HBLKNM = KCPSM6_OUT_PORT" for instance <data_path_loop[0].second_operand.out_port_lut>.
    Set property "HBLKNM = KCPSM6_ADD0" for instance <data_path_loop[0].arith_logical_lut>.
    Set property "HBLKNM = KCPSM6_ADD0" for instance <data_path_loop[0].arith_logical_flop>.
    Set property "HBLKNM = KCPSM6_ADD0" for instance <data_path_loop[0].lsb_arith_logical.arith_logical_muxcy>.
    Set property "HBLKNM = KCPSM6_ADD0" for instance <data_path_loop[0].lsb_arith_logical.arith_logical_xorcy>.
    Set property "HBLKNM = KCPSM6_SANDR" for instance <data_path_loop[0].low_hwbuild.shift_rotate_flop>.
    Set property "HBLKNM = KCPSM6_DECODE1" for instance <data_path_loop[0].lsb_shift_rotate.shift_bit_lut>.
    Set property "HBLKNM = KCPSM6_SANDR" for instance <data_path_loop[0].lsb_shift_rotate.shift_rotate_lut>.
    Set property "HBLKNM = KCPSM6_ALU0" for instance <data_path_loop[0].alu_mux_lut>.
    Set property "HBLKNM = KCPSM6_SPM0" for instance <data_path_loop[0].small_spm.spm_flop>.
    Set property "HBLKNM = KCPSM6_SPM0" for instance <data_path_loop[0].small_spm.small_spm_ram.spm_ram>.
    Set property "HBLKNM = KCPSM6_ADD0" for instance <data_path_loop[1].arith_logical_lut>.
    Set property "HBLKNM = KCPSM6_ADD0" for instance <data_path_loop[1].arith_logical_flop>.
    Set property "HBLKNM = KCPSM6_ADD0" for instance <data_path_loop[1].upper_arith_logical.arith_logical_muxcy>.
    Set property "HBLKNM = KCPSM6_ADD0" for instance <data_path_loop[1].upper_arith_logical.arith_logical_xorcy>.
    Set property "HBLKNM = KCPSM6_SANDR" for instance <data_path_loop[1].low_hwbuild.shift_rotate_flop>.
    Set property "HBLKNM = KCPSM6_ALU0" for instance <data_path_loop[1].alu_mux_lut>.
    Set property "HBLKNM = KCPSM6_SPM0" for instance <data_path_loop[1].small_spm.spm_flop>.
    Set property "HBLKNM = KCPSM6_PORT_ID" for instance <data_path_loop[2].output_data.sy_kk_mux_lut>.
    Set property "HBLKNM = KCPSM6_OUT_PORT" for instance <data_path_loop[2].second_operand.out_port_lut>.
    Set property "HBLKNM = KCPSM6_ADD0" for instance <data_path_loop[2].arith_logical_lut>.
    Set property "HBLKNM = KCPSM6_ADD0" for instance <data_path_loop[2].arith_logical_flop>.
    Set property "HBLKNM = KCPSM6_ADD0" for instance <data_path_loop[2].upper_arith_logical.arith_logical_muxcy>.
    Set property "HBLKNM = KCPSM6_ADD0" for instance <data_path_loop[2].upper_arith_logical.arith_logical_xorcy>.
    Set property "HBLKNM = KCPSM6_SANDR" for instance <data_path_loop[2].low_hwbuild.shift_rotate_flop>.
    Set property "HBLKNM = KCPSM6_SANDR" for instance <data_path_loop[2].mid_shift_rotate.shift_rotate_lut>.
    Set property "HBLKNM = KCPSM6_ALU0" for instance <data_path_loop[2].alu_mux_lut>.
    Set property "HBLKNM = KCPSM6_SPM0" for instance <data_path_loop[2].small_spm.spm_flop>.
    Set property "HBLKNM = KCPSM6_ADD0" for instance <data_path_loop[3].arith_logical_lut>.
    Set property "HBLKNM = KCPSM6_ADD0" for instance <data_path_loop[3].arith_logical_flop>.
    Set property "HBLKNM = KCPSM6_ADD0" for instance <data_path_loop[3].upper_arith_logical.arith_logical_muxcy>.
    Set property "HBLKNM = KCPSM6_ADD0" for instance <data_path_loop[3].upper_arith_logical.arith_logical_xorcy>.
    Set property "HBLKNM = KCPSM6_SANDR" for instance <data_path_loop[3].low_hwbuild.shift_rotate_flop>.
    Set property "HBLKNM = KCPSM6_ALU0" for instance <data_path_loop[3].alu_mux_lut>.
    Set property "HBLKNM = KCPSM6_SPM0" for instance <data_path_loop[3].small_spm.spm_flop>.
    Set property "HBLKNM = KCPSM6_PORT_ID" for instance <data_path_loop[4].output_data.sy_kk_mux_lut>.
    Set property "HBLKNM = KCPSM6_OUT_PORT" for instance <data_path_loop[4].second_operand.out_port_lut>.
    Set property "HBLKNM = KCPSM6_ADD1" for instance <data_path_loop[4].arith_logical_lut>.
    Set property "HBLKNM = KCPSM6_ADD1" for instance <data_path_loop[4].arith_logical_flop>.
    Set property "HBLKNM = KCPSM6_ADD1" for instance <data_path_loop[4].upper_arith_logical.arith_logical_muxcy>.
    Set property "HBLKNM = KCPSM6_ADD1" for instance <data_path_loop[4].upper_arith_logical.arith_logical_xorcy>.
    Set property "HBLKNM = KCPSM6_SANDR" for instance <data_path_loop[4].low_hwbuild.shift_rotate_flop>.
    Set property "HBLKNM = KCPSM6_SANDR" for instance <data_path_loop[4].mid_shift_rotate.shift_rotate_lut>.
    Set property "HBLKNM = KCPSM6_ALU1" for instance <data_path_loop[4].alu_mux_lut>.
    Set property "HBLKNM = KCPSM6_SPM1" for instance <data_path_loop[4].small_spm.spm_flop>.
    Set property "HBLKNM = KCPSM6_SPM1" for instance <data_path_loop[4].small_spm.small_spm_ram.spm_ram>.
    Set property "HBLKNM = KCPSM6_ADD1" for instance <data_path_loop[5].arith_logical_lut>.
    Set property "HBLKNM = KCPSM6_ADD1" for instance <data_path_loop[5].arith_logical_flop>.
    Set property "HBLKNM = KCPSM6_ADD1" for instance <data_path_loop[5].upper_arith_logical.arith_logical_muxcy>.
    Set property "HBLKNM = KCPSM6_ADD1" for instance <data_path_loop[5].upper_arith_logical.arith_logical_xorcy>.
    Set property "HBLKNM = KCPSM6_SANDR" for instance <data_path_loop[5].low_hwbuild.shift_rotate_flop>.
    Set property "HBLKNM = KCPSM6_ALU1" for instance <data_path_loop[5].alu_mux_lut>.
    Set property "HBLKNM = KCPSM6_SPM1" for instance <data_path_loop[5].small_spm.spm_flop>.
    Set property "HBLKNM = KCPSM6_PORT_ID" for instance <data_path_loop[6].output_data.sy_kk_mux_lut>.
    Set property "HBLKNM = KCPSM6_OUT_PORT" for instance <data_path_loop[6].second_operand.out_port_lut>.
    Set property "HBLKNM = KCPSM6_ADD1" for instance <data_path_loop[6].arith_logical_lut>.
    Set property "HBLKNM = KCPSM6_ADD1" for instance <data_path_loop[6].arith_logical_flop>.
    Set property "HBLKNM = KCPSM6_ADD1" for instance <data_path_loop[6].upper_arith_logical.arith_logical_muxcy>.
    Set property "HBLKNM = KCPSM6_ADD1" for instance <data_path_loop[6].upper_arith_logical.arith_logical_xorcy>.
    Set property "HBLKNM = KCPSM6_SANDR" for instance <data_path_loop[6].low_hwbuild.shift_rotate_flop>.
    Set property "HBLKNM = KCPSM6_SANDR" for instance <data_path_loop[6].msb_shift_rotate.shift_rotate_lut>.
    Set property "HBLKNM = KCPSM6_ALU1" for instance <data_path_loop[6].alu_mux_lut>.
    Set property "HBLKNM = KCPSM6_SPM1" for instance <data_path_loop[6].small_spm.spm_flop>.
    Set property "HBLKNM = KCPSM6_ADD1" for instance <data_path_loop[7].arith_logical_lut>.
    Set property "HBLKNM = KCPSM6_ADD1" for instance <data_path_loop[7].arith_logical_flop>.
    Set property "HBLKNM = KCPSM6_ADD1" for instance <data_path_loop[7].upper_arith_logical.arith_logical_muxcy>.
    Set property "HBLKNM = KCPSM6_ADD1" for instance <data_path_loop[7].upper_arith_logical.arith_logical_xorcy>.
    Set property "HBLKNM = KCPSM6_SANDR" for instance <data_path_loop[7].low_hwbuild.shift_rotate_flop>.
    Set property "HBLKNM = KCPSM6_ALU1" for instance <data_path_loop[7].alu_mux_lut>.
    Set property "HBLKNM = KCPSM6_SPM1" for instance <data_path_loop[7].small_spm.spm_flop>.
    Set property "HBLKNM = KCPSM6_REG0" for instance <lower_reg_banks>.
    Set property "HBLKNM = KCPSM6_REG1" for instance <upper_reg_banks>.
    Summary:
	no macro.
Unit <kcpsm6> synthesized.

Synthesizing Unit <command_interpreter>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\picoblaze\command_interpreter\command_interpreter.vhd".
        C_FAMILY = "S6"
        C_RAM_SIZE_KWORDS = 1
        C_JTAG_LOADER_ENABLE = 0
    Summary:
	no macro.
Unit <command_interpreter> synthesized.

Synthesizing Unit <edge_detect>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\edge_detect.vhd".
    Found 1-bit register for signal <OUT_RISING>.
    Found 1-bit register for signal <OUT_FALLING>.
    Found 1-bit register for signal <i_signal>.
    Summary:
	inferred   3 D-type flip-flop(s).
Unit <edge_detect> synthesized.

Synthesizing Unit <daq_fifo_layer>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd".
        INCLUDE_AURORA = 0
        INCLUDE_USB = 1
WARNING:Xst:647 - Input <FIBER_0_RXP> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <FIBER_0_RXN> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <FIBER_1_RXP> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <FIBER_1_RXN> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <FIBER_REFCLKP> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <FIBER_REFCLKN> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" line 297: Output port <full> of the instance <map_output_fifo_0> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" line 311: Output port <full> of the instance <map_output_fifo_1> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" line 597: Output port <full> of the instance <synthesize_with_usb.map_fifo_wr32_rd16_EP6> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" line 597: Output port <valid> of the instance <synthesize_with_usb.map_fifo_wr32_rd16_EP6> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" line 615: Output port <full> of the instance <synthesize_with_usb.map_fifo_wr32_rd16_EP8> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" line 615: Output port <valid> of the instance <synthesize_with_usb.map_fifo_wr32_rd16_EP8> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" line 633: Output port <USB_RESET> of the instance <synthesize_with_usb.map_usb_interface> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" line 633: Output port <EP6_FULL> of the instance <synthesize_with_usb.map_usb_interface> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\daq_fifo_layer.vhd" line 633: Output port <EP8_FULL> of the instance <synthesize_with_usb.map_usb_interface> is unconnected or connected to loadless signal.
WARNING:Xst:653 - Signal <internal_FIBER_0_RX_DATA_MSB_TO_LSB> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_FIBER_1_RX_DATA_MSB_TO_LSB> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <FIBER_0_TXP> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <FIBER_0_TXN> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <FIBER_1_TXP> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <FIBER_1_TXN> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_FIBER_0_LINK_UP> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_FIBER_1_LINK_UP> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_FIBER_0_LINK_ERR> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_FIBER_1_LINK_ERR> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_FIBER_0_TX_READ_ENABLE> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_FIBER_1_TX_READ_ENABLE> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_FIBER_0_RX_DATA_TVALID> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_FIBER_1_RX_DATA_TVALID> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <internal_FIBER_USER_CLOCK> is used but never assigned. This sourceless signal will be automatically connected to value GND.
    Found 1-bit register for signal <internal_USB_EP4_READ_ENABLE_reg>.
    Found 1-bit register for signal <internal_USB_EP2_READ_ENABLE_reg>.
    Summary:
	inferred   2 D-type flip-flop(s).
	inferred   6 Multiplexer(s).
Unit <daq_fifo_layer> synthesized.

Synthesizing Unit <usb_top>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\usb_interfaces\usb_top.v".
WARNING:Xst:653 - Signal <rst_external> is used but never assigned. This sourceless signal will be automatically connected to value GND.
    Summary:
	no macro.
Unit <usb_top> synthesized.

Synthesizing Unit <usb_slave_fifo_interface_io>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\usb_interfaces\usb_slave_fifo_interface_io.v".
    Summary:
	no macro.
Unit <usb_slave_fifo_interface_io> synthesized.

Synthesizing Unit <USB_IFCLK_XC3S400>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\usb_interfaces\USB_IFCLK_XC3S400.v".
    Summary:
	no macro.
Unit <USB_IFCLK_XC3S400> synthesized.

Synthesizing Unit <usb_slave_fifo_interface>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\usb_interfaces\usb_slave_fifo_interface.v".
        SIZE = 4
        IDLE = 0
        U2F_CS_ADR = 1
        U2F_CS_SLOE = 2
        U2F_CS_DATA = 3
        U2F_CS_WAIT = 4
        U2F_DATA_ADR = 5
        U2F_DATA_SLOE = 6
        U2F_DATA_DATA = 7
        U2F_DATA_WAIT = 8
        F2U_CS_ADR = 9
        F2U_CS_CHECK = 10
        F2U_CS_DATA = 11
        F2U_DATA_ADR = 12
        F2U_DATA_CHECK = 13
        F2U_DATA_DATA = 14
        F2U_PKTEND = 15
    Register <wr_data_fifo_data_reg> equivalent to <wr_cs_fifo_data_reg> has been removed
    Found 4-bit register for signal <state>.
    Found 2-bit register for signal <sl_fifo_adr>.
    Found 8-bit register for signal <u2f_cs_timeout_cnt>.
    Found 8-bit register for signal <u2f_data_timeout_cnt>.
    Found 8-bit register for signal <f2u_cs_timeout_cnt>.
    Found 8-bit register for signal <f2u_cs_transferred_length>.
    Found 8-bit register for signal <f2u_data_timeout_cnt>.
    Found 16-bit register for signal <wr_cs_fifo_data_reg>.
    Found 10-bit register for signal <u2f_data_transferred_length>.
    Found 10-bit register for signal <f2u_data_transferred_length>.
    Found 1-bit register for signal <sl_oe>.
    Found 1-bit register for signal <sl_wr>.
    Found 1-bit register for signal <sl_pktend>.
    Found 1-bit register for signal <wr_cs_fifo_we_reg>.
    Found 1-bit register for signal <wr_data_fifo_we_reg>.
    Found 1-bit register for signal <sl_data_fifo_empty_in>.
    Found 1-bit register for signal <sl_cs_fifo_empty_in>.
    Found 1-bit register for signal <f2u_switch>.
    Found finite state machine <FSM_1> for signal <state>.
    -----------------------------------------------------------------------
    | States             | 16                                             |
    | Transitions        | 58                                             |
    | Inputs             | 12                                             |
    | Outputs            | 18                                             |
    | Clock              | clk (rising_edge)                              |
    | Reset              | rst (positive)                                 |
    | Reset type         | asynchronous                                   |
    | Reset State        | 0000                                           |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found 8-bit adder for signal <u2f_cs_timeout_cnt[7]_GND_107_o_add_31_OUT> created at line 452.
    Found 8-bit adder for signal <u2f_data_timeout_cnt[7]_GND_107_o_add_52_OUT> created at line 506.
    Found 10-bit adder for signal <u2f_data_transferred_length[9]_GND_107_o_add_59_OUT> created at line 521.
    Found 8-bit adder for signal <f2u_cs_timeout_cnt[7]_GND_107_o_add_75_OUT> created at line 566.
    Found 8-bit adder for signal <f2u_cs_transferred_length[7]_GND_107_o_add_82_OUT> created at line 581.
    Found 8-bit adder for signal <f2u_data_timeout_cnt[7]_GND_107_o_add_92_OUT> created at line 604.
    Found 10-bit adder for signal <f2u_data_transferred_length[9]_GND_107_o_add_99_OUT> created at line 619.
    Found 8-bit comparator greater for signal <GND_107_o_f2u_cs_transferred_length[7]_LessThan_17_o> created at line 351
    Found 10-bit comparator greater for signal <GND_107_o_f2u_data_transferred_length[9]_LessThan_20_o> created at line 395
    Summary:
	inferred   7 Adder/Subtractor(s).
	inferred  86 D-type flip-flop(s).
	inferred   2 Comparator(s).
	inferred  32 Multiplexer(s).
	inferred   1 Finite State Machine(s).
Unit <usb_slave_fifo_interface> synthesized.

Synthesizing Unit <usb_init>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\usb_interfaces\usb_init.v".
WARNING:Xst:647 - Input <wakeup> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
    Found 32-bit register for signal <counter>.
    Found 1-bit register for signal <usb_clk_rst>.
    Found 1-bit register for signal <n_ready>.
    Found 32-bit register for signal <usb_clk_rst_cnt>.
    Found 32-bit adder for signal <usb_clk_rst_cnt[31]_GND_109_o_add_4_OUT> created at line 30.
    Found 32-bit adder for signal <counter[31]_GND_109_o_add_9_OUT> created at line 47.
    Summary:
	inferred   2 Adder/Subtractor(s).
	inferred  66 D-type flip-flop(s).
Unit <usb_init> synthesized.

Synthesizing Unit <detect_usb>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\detect_usb.vhd".
    Found 8-bit register for signal <internal_READ_ENABLE_COUNTER>.
    Found 1-bit register for signal <internal_READ_ENABLE>.
    Found 1-bit register for signal <internal_USB_PRESENT_reg>.
    Found 16-bit register for signal <internal_WATCHDOG_COUNTER_LAST>.
    Found 16-bit register for signal <internal_WATCHDOG_COUNTER>.
    Found 16-bit adder for signal <internal_WATCHDOG_COUNTER[15]_GND_110_o_add_0_OUT> created at line 1241.
    Found 8-bit adder for signal <internal_READ_ENABLE_COUNTER[7]_GND_110_o_add_2_OUT> created at line 1241.
    Found 16-bit comparator not equal for signal <internal_WATCHDOG_COUNTER[15]_internal_WATCHDOG_COUNTER_LAST[15]_equal_6_o> created at line 67
    Summary:
	inferred   2 Adder/Subtractor(s).
	inferred  42 D-type flip-flop(s).
	inferred   1 Comparator(s).
Unit <detect_usb> synthesized.

Synthesizing Unit <klm_scrod>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd".
        NUM_GTS = 1
        REVISION = "A4"
        CLKSRC = "FTSW"
        LINK_TEST = '0'
        B2TT_SIM_SPEEDUP = '0'
        DAQ_GEN_SIM_SPEEDUP = '0'
WARNING:Xst:647 - Input <target_tb<1>> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <target_tb<2>> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <target_tb<3>> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <target_tb<4>> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <target_tb<5>> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <target_tb<6>> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <target_tb<7>> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <target_tb<8>> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <target_tb<9>> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <target_tb<10>> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <target_tb16> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 678: Output port <b2ttver> of the instance <b2tt_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 678: Output port <utime> of the instance <b2tt_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 678: Output port <divclk1> of the instance <b2tt_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 678: Output port <divclk2> of the instance <b2tt_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 678: Output port <exprun> of the instance <b2tt_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 678: Output port <trgtyp> of the instance <b2tt_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 678: Output port <trgtag> of the instance <b2tt_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 678: Output port <revoclk> of the instance <b2tt_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 678: Output port <injveto> of the instance <b2tt_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 678: Output port <octet> of the instance <b2tt_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 678: Output port <cntbit2> of the instance <b2tt_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 678: Output port <sigbit2> of the instance <b2tt_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 678: Output port <dbglink> of the instance <b2tt_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 678: Output port <dbgerr> of the instance <b2tt_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 678: Output port <rawclk> of the instance <b2tt_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 678: Output port <revo> of the instance <b2tt_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 678: Output port <revo9> of the instance <b2tt_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 678: Output port <revogap> of the instance <b2tt_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 678: Output port <isk> of the instance <b2tt_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 678: Output port <bitddr> of the instance <b2tt_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 780: Output port <rx_rem> of the instance <aurora_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 828: Output port <rx_dst_rdy_n> of the instance <conc_intfc_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\klm_scrod.vhd" line 899: Output port <tx_rem> of the instance <PROD_GEN.daq_gen_ins> is unconnected or connected to loadless signal.
WARNING:Xst:653 - Signal <target_tb_i<1>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <target_tb_i<2>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <target_tb_i<3>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <target_tb_i<4>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <target_tb_i<5>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <target_tb_i<6>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <target_tb_i<7>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <target_tb_i<8>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <target_tb_i<9>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <target_tb_i<10>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <target_tb16_i> is used but never assigned. This sourceless signal will be automatically connected to value GND.
    Found 1-bit register for signal <mgtmod0_qi>.
    Found 1-bit register for signal <mgtlos_qi>.
    Found 1-bit register for signal <mgttxdis_iq>.
    Found 1-bit register for signal <mgtmod2_iq>.
    Found 1-bit register for signal <mgtmod1_iq>.
    Found 1-bit register for signal <b2tt_ctime_i>.
    Found 1-bit register for signal <b2tt_ctime_iq>.
    Found 1-bit register for signal <status_fake_iq>.
    Found 1-bit register for signal <control_fake_iq>.
    Found 1-bit register for signal <status_fake_i>.
    Found 2-bit register for signal <ctrl_vec_i>.
    Found 1-bit register for signal <control_fake_i>.
    Found 1-bit register for signal <mgttxfault_qi>.
    WARNING:Xst:2404 -  FFs/Latches <status_vec_i<1:310>> (without init value) have a constant value of 0 in block <klm_scrod>.
    Summary:
	inferred  14 D-type flip-flop(s).
Unit <klm_scrod> synthesized.

Synthesizing Unit <timing_ctrl>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\timing_ctrl.vhd".
WARNING:Xst:647 - Input <clk> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
    Found 40-bit register for signal <tdcrst_shift>.
    Found 1-bit register for signal <tce_cnt>.
    Found 1-bit register for signal <tce_2x_r>.
    Found 1-bit register for signal <tce_2x_q0>.
    Found 5-bit register for signal <tce_2x_i>.
    Found 4-bit register for signal <tdcrst_i>.
    Found 2-bit subtractor for signal <n0018> created at line 100.
    Summary:
	inferred   1 Adder/Subtractor(s).
	inferred  52 D-type flip-flop(s).
Unit <timing_ctrl> synthesized.

Synthesizing Unit <b2tt>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt.vhd".
        VERSION = 31
        DEFADDR = "00000000000000000000"
        FLIPCLK = '0'
        FLIPTRG = '0'
        FLIPACK = '0'
        USEFIFO = '1'
        CLKDIV1 = 2
        CLKDIV2 = 4
        USEPLL = '1'
        USEICTRL = '1'
        NBITTIM = 32
        NBITTAG = 32
        NBITID = 16
        B2LRATE = 4
        USEEXTCLK = '0'
        SIM_SPEEDUP = '0'
WARNING:Xst:647 - Input <regdbg<7:6>> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <extclk> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <extclkinv> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <extclkdbl> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <extdblinv> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <extclklck> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt.vhd" line 275: Output port <stat> of the instance <gen_useextclk0.map_clk> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt.vhd" line 305: Output port <drd> of the instance <map_fifo> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt.vhd" line 305: Output port <errs> of the instance <map_fifo> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt.vhd" line 305: Output port <dbg> of the instance <map_fifo> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt.vhd" line 305: Output port <empty> of the instance <map_fifo> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt.vhd" line 322: Output port <cntlinkrst> of the instance <map_decode> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt.vhd" line 322: Output port <payload> of the instance <map_decode> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt.vhd" line 322: Output port <bit10> of the instance <map_decode> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt.vhd" line 322: Output port <trgshort> of the instance <map_decode> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt.vhd" line 322: Output port <frame3> of the instance <map_decode> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt.vhd" line 322: Output port <comma> of the instance <map_decode> is unconnected or connected to loadless signal.
WARNING:Xst:653 - Signal <injveto> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <revogap> is used but never assigned. This sourceless signal will be automatically connected to value GND.
    Summary:
	inferred   1 Multiplexer(s).
Unit <b2tt> synthesized.

Synthesizing Unit <b2tt_clk>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_clk_s6.vhd".
        FLIPCLK = '0'
        USEPLL = '1'
        USEICTRL = '1'
    Summary:
	no macro.
Unit <b2tt_clk> synthesized.

Synthesizing Unit <b2tt_fifo>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_fifo_s6.vhd".
    Found 96-bit register for signal <buf_dout>.
    Found 1-bit register for signal <sta_dout>.
    Found 2-bit register for signal <cnt_skip>.
    Found 24-bit register for signal <sig_dbg>.
    Found 96-bit register for signal <buf_dwr>.
    Found 6-bit register for signal <seq_dwr>.
    Found 6-bit register for signal <seq_drd>.
    Found 1-bit register for signal <sta_drd>.
    Found 96-bit register for signal <buf_drd>.
    Found 1-bit register for signal <seq_wr>.
    Found 2-bit register for signal <seq_rd>.
    Found 10-bit register for signal <buf_addra>.
    Found 10-bit register for signal <buf_addrb>.
    Found 1-bit register for signal <sta_orun>.
    Found 1-bit register for signal <sta_full>.
    Found 3-bit register for signal <sta_err>.
    Found 11-bit adder for signal <n0140> created at line 100.
    Found 2-bit adder for signal <cnt_skip[1]_GND_127_o_add_20_OUT> created at line 150.
    Found 10-bit adder for signal <buf_addra[9]_GND_127_o_add_48_OUT> created at line 213.
    Found 10-bit adder for signal <buf_addrb[9]_GND_127_o_add_53_OUT> created at line 222.
    Found 10-bit subtractor for signal <GND_127_o_GND_127_o_sub_3_OUT<9:0>> created at line 100.
    Found 10-bit subtractor for signal <GND_127_o_GND_127_o_sub_4_OUT<9:0>> created at line 99.
    Found 2-bit subtractor for signal <GND_127_o_GND_127_o_sub_26_OUT<1:0>> created at line 156.
    Found 10-bit comparator lessequal for signal <n0000> created at line 99
    Found 10-bit comparator greater for signal <sta_empty> created at line 101
    Found 10-bit comparator greater for signal <sta_empty2> created at line 102
    Found 10-bit comparator lessequal for signal <n0086> created at line 235
    Summary:
	inferred   5 Adder/Subtractor(s).
	inferred 356 D-type flip-flop(s).
	inferred   4 Comparator(s).
	inferred  10 Multiplexer(s).
Unit <b2tt_fifo> synthesized.

Synthesizing Unit <b2tt_decode>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_decode.vhd".
        VERSION = 31
        FLIPTRG = '0'
        DEFADDR = "00000000000000000000"
        CLKDIV1 = 2
        CLKDIV2 = 4
        SIM_SPEEDUP = '0'
WARNING:Xst:647 - Input <regslip> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <decdelay> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_decode.vhd" line 1128: Output port <sigslip> of the instance <map_2b> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_decode.vhd" line 1147: Output port <dbg> of the instance <map_tr> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_decode.vhd" line 1160: Output port <incdelay> of the instance <map_oc> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_decode.vhd" line 1178: Output port <incdelay> of the instance <map_pa> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_decode.vhd" line 1213: Output port <dbg> of the instance <map_tt> is unconnected or connected to loadless signal.
    Summary:
	no macro.
Unit <b2tt_decode> synthesized.

Synthesizing Unit <b2tt_iddr>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_ddr_s6.vhd".
        FLIPIN = '0'
        REFFREQ = 203.546
        SLIPBIT = 0
        WRAPCOUNT = 170
        FULLCOUNT = 340
        SIM_SPEEDUP = '0'
WARNING:Xst:647 - Input <dblclock> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <dblclockb> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
    Found 1-bit register for signal <buf_bit>.
    Found 1-bit register for signal <sta_slip>.
    Found 1-bit register for signal <sig_caldelay>.
    Found 2-bit register for signal <seq_caldelay>.
    Found 2-bit register for signal <bit2>.
    Summary:
	inferred   7 D-type flip-flop(s).
	inferred   1 Multiplexer(s).
Unit <b2tt_iddr> synthesized.

Synthesizing Unit <b2tt_iscan>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_iscan.vhd".
        FLIPIN = '0'
        REFFREQ = 203.546
        SLIPBIT = 0
        FULLBIT = 9
        WRAPCOUNT = 170
        FULLCOUNT = 340
        SIM_SPEEDUP = '0'
    Found 10-bit register for signal <cnt_iddr>.
    Found 20-bit register for signal <cnt_cycle>.
    Found 340-bit register for signal <sta_ioctet>.
    Found 340-bit register for signal <sta_icrc8>.
    Found 10-bit register for signal <sta_spos>.
    Found 10-bit register for signal <sta_smax>.
    Found 10-bit register for signal <sta_ezero>.
    Found 10-bit register for signal <sta_lenmax>.
    Found 10-bit register for signal <sta_ibest>.
    Found 2-bit register for signal <seq_inc>.
    Found 1-bit register for signal <sig_islip>.
    Found 1-bit register for signal <sig_inc>.
    Found 1-bit register for signal <cnt_islip>.
    Found 1-bit register for signal <clr_islip>.
    Found 1-bit register for signal <clr_inc>.
    Found 8-bit register for signal <cnt_delay>.
    Found 2-bit register for signal <seq_iddr>.
    Found 6-bit register for signal <cnt_dbg>.
    Found 1-bit register for signal <iddrdbg<9>>.
    Found 1-bit register for signal <iddrdbg<8>>.
    Found 1-bit register for signal <iddrdbg<7>>.
    Found 1-bit register for signal <iddrdbg<6>>.
    Found 1-bit register for signal <iddrdbg<5>>.
    Found 1-bit register for signal <iddrdbg<4>>.
    Found 1-bit register for signal <iddrdbg<3>>.
    Found 2-bit register for signal <sta_iddr>.
    Found finite state machine <FSM_2> for signal <sta_iddr>.
    -----------------------------------------------------------------------
    | States             | 4                                              |
    | Transitions        | 13                                             |
    | Inputs             | 6                                              |
    | Outputs            | 6                                              |
    | Clock              | clock (rising_edge)                            |
    | Reset              | clrdelay (positive)                            |
    | Reset type         | synchronous                                    |
    | Reset State        | 00                                             |
    | Power Up State     | 00                                             |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found 10-bit adder for signal <cnt_iddr[9]_GND_134_o_add_23_OUT> created at line 134.
    Found 20-bit adder for signal <cnt_cycle[19]_GND_134_o_add_30_OUT> created at line 143.
    Found 10-bit adder for signal <sta_ezero[9]_GND_134_o_add_57_OUT> created at line 180.
    Found 10-bit adder for signal <sta_ezero[9]_GND_134_o_add_81_OUT> created at line 197.
    Found 10-bit adder for signal <sta_smax[9]_sta_lenhalf[9]_add_104_OUT> created at line 207.
    Found 1-bit adder for signal <cnt_islip[0]_PWR_127_o_add_118_OUT<0>> created at line 235.
    Found 8-bit adder for signal <cnt_delay[7]_GND_134_o_add_123_OUT> created at line 258.
    Found 6-bit adder for signal <cnt_dbg[5]_GND_134_o_add_127_OUT> created at line 266.
    Found 10-bit subtractor for signal <GND_134_o_GND_134_o_sub_64_OUT<9:0>> created at line 186.
    Found 10-bit subtractor for signal <GND_134_o_GND_134_o_sub_83_OUT<9:0>> created at line 197.
    Found 10-bit subtractor for signal <GND_134_o_GND_134_o_sub_104_OUT<9:0>> created at line 205.
    Found 1-bit 7-to-1 multiplexer for signal <cnt_cycle[6]_sta_ibest[8]_MUX_1561_o> created at line 269.
    Found 1-bit 7-to-1 multiplexer for signal <cnt_cycle[5]_sta_ibest[7]_MUX_1562_o> created at line 269.
    Found 1-bit 7-to-1 multiplexer for signal <cnt_cycle[4]_sta_ibest[6]_MUX_1563_o> created at line 269.
    Found 1-bit 7-to-1 multiplexer for signal <cnt_cycle[3]_sta_ibest[5]_MUX_1564_o> created at line 269.
    Found 1-bit 7-to-1 multiplexer for signal <cnt_cycle[2]_sta_ibest[4]_MUX_1565_o> created at line 269.
    Found 1-bit 7-to-1 multiplexer for signal <cnt_cycle[1]_sta_ibest[3]_MUX_1566_o> created at line 269.
    Found 1-bit 7-to-1 multiplexer for signal <cnt_cycle[0]_sta_ibest[2]_MUX_1567_o> created at line 269.
    Found 10-bit comparator greater for signal <sta_lenmax[9]_GND_134_o_LessThan_6_o> created at line 118
    Found 10-bit comparator equal for signal <cnt_iddr[9]_sta_ibest[9]_equal_8_o> created at line 120
    Found 10-bit comparator equal for signal <cnt_iddr[9]_sta_ezero[9]_equal_57_o> created at line 179
    Found 10-bit comparator lessequal for signal <sta_lenmax[9]_GND_134_o_LessThan_65_o> created at line 186
    Found 10-bit comparator greater for signal <sta_lenmax[9]_GND_134_o_LessThan_84_o> created at line 197
    Found 10-bit comparator lessequal for signal <n0095> created at line 204
    Found 2-bit comparator equal for signal <n0121> created at line 263
    Summary:
	inferred  11 Adder/Subtractor(s).
	inferred 790 D-type flip-flop(s).
	inferred   7 Comparator(s).
	inferred  18 Multiplexer(s).
	inferred   1 Finite State Machine(s).
Unit <b2tt_iscan> synthesized.

Synthesizing Unit <b2tt_decomma>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_decode.vhd".
    Summary:
	inferred   1 Multiplexer(s).
Unit <b2tt_decomma> synthesized.

Synthesizing Unit <b2tt_debit2>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_decode.vhd".
    Found 1-bit register for signal <buf_slip>.
    Found 1-bit register for signal <sigslip>.
    Found 3-bit register for signal <cnt_bit2>.
    Found 10-bit register for signal <buf_bit10>.
    Found 10-bit register for signal <buf_slip10>.
    Found 3-bit adder for signal <cnt_bit2[2]_GND_136_o_add_7_OUT> created at line 149.
    Summary:
	inferred   1 Adder/Subtractor(s).
	inferred  25 D-type flip-flop(s).
	inferred   2 Multiplexer(s).
Unit <b2tt_debit2> synthesized.

Synthesizing Unit <b2tt_debit10>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_decode.vhd".
WARNING:Xst:647 - Input <bit10<9:8>> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_decode.vhd" line 204: Output port <err> of the instance <map_de> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_decode.vhd" line 204: Output port <rdp> of the instance <map_de> is unconnected or connected to loadless signal.
    Found 1-bit register for signal <buf_isk>.
    Found 8-bit register for signal <buf_8b>.
    Summary:
	inferred   9 D-type flip-flop(s).
	inferred   2 Multiplexer(s).
Unit <b2tt_debit10> synthesized.

Synthesizing Unit <b2tt_de8b10b>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_8b10b.vhd".
    Found 1-bit register for signal <rd_defined>.
    Found 5-bit register for signal <err>.
    Found 1-bit register for signal <rdplus>.
    Summary:
	inferred   7 D-type flip-flop(s).
	inferred  46 Multiplexer(s).
Unit <b2tt_de8b10b> synthesized.

Synthesizing Unit <b2tt_detrig>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_decode.vhd".
    Found 1-bit register for signal <trgshort>.
    Found 1-bit register for signal <sig_trgout>.
    Found 32-bit register for signal <cnt_trig>.
    Found 16-bit register for signal <cnt_dbg1>.
    Found 16-bit register for signal <cnt_dbg2>.
    Found 4-bit register for signal <trgtyp>.
    Found 3-bit register for signal <buf_trgtim>.
    Found 5-bit register for signal <cnt_trginterval>.
    Found 5-bit adder for signal <cnt_trginterval[4]_GND_140_o_add_6_OUT> created at line 287.
    Found 5-bit adder for signal <cnt_trginterval[4]_GND_140_o_add_9_OUT> created at line 295.
    Found 16-bit adder for signal <cnt_dbg1[15]_GND_140_o_add_12_OUT> created at line 310.
    Found 16-bit adder for signal <cnt_dbg2[15]_GND_140_o_add_14_OUT> created at line 313.
    Found 32-bit adder for signal <cnt_trig[31]_GND_140_o_add_22_OUT> created at line 320.
    Found 5-bit comparator lessequal for signal <cnt_trginterval[4]_PWR_132_o_LessThan_3_o> created at line 275
    Found 5-bit comparator greater for signal <cnt_trginterval[4]_PWR_132_o_LessThan_8_o> created at line 287
    Found 5-bit comparator greater for signal <n0015> created at line 295
    Found 3-bit comparator equal for signal <cntbit2[2]_buf_trgtim[2]_equal_12_o> created at line 300
    Found 3-bit comparator lessequal for signal <n0037> created at line 334
    Found 3-bit comparator greater for signal <PWR_132_o_sig_trgtim[2]_LessThan_33_o> created at line 334
    Summary:
	inferred   5 Adder/Subtractor(s).
	inferred  78 D-type flip-flop(s).
	inferred   6 Comparator(s).
	inferred   5 Multiplexer(s).
Unit <b2tt_detrig> synthesized.

Synthesizing Unit <b2tt_deoctet>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_decode.vhd".
    Found 1-bit register for signal <nocomma>.
    Found 12-bit register for signal <cnt_invalid>.
    Found 1-bit register for signal <incdelay>.
    Found 8-bit register for signal <cnt_incdelay>.
    Found 6-bit register for signal <sig_rxerr>.
    Found 1-bit register for signal <sta_octet>.
    Found 5-bit register for signal <cnt_octet>.
    Found 1-bit register for signal <sta_crc8ok>.
    Found 8-bit register for signal <sta_crc8>.
    Found 77-bit register for signal <buf_payload>.
    Found 4-bit register for signal <cnt_datoctet>.
    Found 1-bit register for signal <sigpayload>.
    Found 77-bit register for signal <payload>.
    Found 1-bit register for signal <sigidle>.
    Found 1-bit register for signal <seq_octet>.
    Found 8-bit adder for signal <cnt_incdelay[7]_GND_141_o_add_0_OUT> created at line 446.
    Found 12-bit adder for signal <cnt_invalid[11]_GND_141_o_add_1_OUT> created at line 449.
    Found 5-bit adder for signal <cnt_octet[4]_GND_141_o_add_41_OUT> created at line 526.
    Found 4-bit adder for signal <cnt_datoctet[3]_GND_141_o_add_68_OUT> created at line 550.
    Found 7-bit comparator equal for signal <n0039> created at line 474
    Found 5-bit comparator greater for signal <cnt_octet[4]_GND_141_o_LessThan_41_o> created at line 524
    Found 4-bit comparator greater for signal <cnt_datoctet[3]_PWR_133_o_LessThan_68_o> created at line 548
    Summary:
	inferred   4 Adder/Subtractor(s).
	inferred 204 D-type flip-flop(s).
	inferred   3 Comparator(s).
	inferred  37 Multiplexer(s).
Unit <b2tt_deoctet> synthesized.

Synthesizing Unit <b2tt_depacket>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_decode.vhd".
        VERSION = 31
        CLKDIV1 = 2
        CLKDIV2 = 4
        DEFADDR = "00000000000000000000"
        SIM_SPEEDUP = '0'
WARNING:Xst:653 - Signal <stareset> is used but never assigned. This sourceless signal will be automatically connected to value GND.
    Found 1-bit register for signal <sta_link>.
    Found 3-bit register for signal <sigerr>.
    Found 20-bit register for signal <buf_myaddr>.
    Found 1-bit register for signal <badver>.
    Found 24-bit register for signal <buf_clkfreq>.
    Found 1-bit register for signal <feereset>.
    Found 1-bit register for signal <b2lreset>.
    Found 1-bit register for signal <gtpreset>.
    Found 1-bit register for signal <incdelay>.
    Found 1-bit register for signal <caldelay>.
    Found 1-bit register for signal <entagerr>.
    Found 1-bit register for signal <seq_entagerr>.
    Found 1-bit register for signal <seq_reset>.
    Found 1-bit register for signal <sig_reset>.
    Found 1-bit register for signal <sig_frame>.
    Found 1-bit register for signal <sig_frame3>.
    Found 1-bit register for signal <sig_frame9>.
    Found 7-bit register for signal <cnt_divseq1>.
    Found 2-bit register for signal <divclk1>.
    Found 7-bit register for signal <cnt_divseq2>.
    Found 2-bit register for signal <divclk2>.
    Found 32-bit register for signal <buf_utime>.
    Found 27-bit register for signal <buf_ctime>.
    Found 4-bit register for signal <cnt_timer>.
    Found 32-bit register for signal <cnt_utime>.
    Found 27-bit register for signal <cnt_ctime>.
    Found 1-bit register for signal <timerr>.
    Found 11-bit register for signal <cnt_revoclk>.
    Found 8-bit register for signal <cnt_packet>.
    Found 8-bit adder for signal <cnt_packet[7]_GND_142_o_add_18_OUT> created at line 704.
    Found 32-bit adder for signal <cnt_utime[31]_GND_142_o_add_66_OUT> created at line 824.
    Found 27-bit adder for signal <cnt_ctime[26]_GND_142_o_add_67_OUT> created at line 827.
    Found 27-bit adder for signal <buf_ctime[26]_GND_142_o_add_74_OUT> created at line 834.
    Found 11-bit adder for signal <cnt_revoclk[10]_GND_142_o_add_78_OUT> created at line 842.
    Found 27-bit subtractor for signal <reg_clkfreq> created at line 656.
    Found 7-bit subtractor for signal <GND_142_o_GND_142_o_sub_45_OUT<6:0>> created at line 783.
    Found 7-bit subtractor for signal <GND_142_o_GND_142_o_sub_53_OUT<6:0>> created at line 806.
    Found 4-bit subtractor for signal <GND_142_o_GND_142_o_sub_60_OUT<3:0>> created at line 816.
    Found 20-bit comparator equal for signal <buf_addr[19]_buf_myaddr[19]_equal_35_o> created at line 727
    Found 7-bit comparator greater for signal <cnt_divseq1[6]_GND_142_o_LessThan_43_o> created at line 776
    Found 7-bit comparator greater for signal <cnt_divseq2[6]_GND_142_o_LessThan_51_o> created at line 799
    Found 27-bit comparator equal for signal <cnt_ctime[26]_reg_clkfreq[26]_equal_66_o> created at line 823
    Found 32-bit comparator not equal for signal <n0102> created at line 834
    Found 27-bit comparator not equal for signal <n0105> created at line 834
    Summary:
	inferred   9 Adder/Subtractor(s).
	inferred 221 D-type flip-flop(s).
	inferred   6 Comparator(s).
	inferred  12 Multiplexer(s).
Unit <b2tt_depacket> synthesized.

Synthesizing Unit <b2tt_detag>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_decode.vhd".
    Found 32-bit register for signal <buf_exprun>.
    Found 1-bit register for signal <tagerr>.
    Found 32-bit register for signal <dbg>.
    Found 32-bit register for signal <buf_cnttrig>.
    Found 32-bit comparator equal for signal <n0010> created at line 926
    Summary:
	inferred  97 D-type flip-flop(s).
	inferred   1 Comparator(s).
Unit <b2tt_detag> synthesized.

Synthesizing Unit <b2tt_payload>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_payload.vhd".
WARNING:Xst:647 - Input <moreerrs> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <tag> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <cntwidth<0:0>> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <regdbg> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
    Found 16-bit register for signal <cnt_b2ltag>.
    Found 10-bit register for signal <cnt_seudet>.
    Found 2-bit register for signal <seq_seudet>.
    Found 8-bit register for signal <cnt_seuscan>.
    Found 2-bit register for signal <seq_seuscan>.
    Found 1-bit register for signal <sta_ttup>.
    Found 1-bit register for signal <sig_ttlost>.
    Found 1-bit register for signal <sta_err>.
    Found 1-bit register for signal <sta_fifoerr>.
    Found 1-bit register for signal <sta_fifoful>.
    Found 1-bit register for signal <sta_tagerr>.
    Found 1-bit register for signal <sta_timerr>.
    Found 1-bit register for signal <sta_ttlost>.
    Found 1-bit register for signal <sta_b2llost>.
    Found 112-bit register for signal <payload>.
    Found 8-bit register for signal <cnt_payload>.
    Found 16-bit register for signal <cnt_b2lwe>.
    Found 16-bit adder for signal <cnt_b2lwe[15]_GND_144_o_add_0_OUT> created at line 96.
    Found 16-bit adder for signal <cnt_b2ltag[15]_GND_144_o_add_2_OUT> created at line 99.
    Found 10-bit adder for signal <cnt_seudet[9]_GND_144_o_add_9_OUT> created at line 122.
    Found 8-bit adder for signal <cnt_seuscan[7]_GND_144_o_add_12_OUT> created at line 128.
    Found 8-bit adder for signal <cnt_payload[7]_GND_144_o_add_14_OUT> created at line 191.
    WARNING:Xst:2404 -  FFs/Latches <sig_b2llost<0:0>> (without init value) have a constant value of 0 in block <b2tt_payload>.
    Summary:
	inferred   5 Adder/Subtractor(s).
	inferred 183 D-type flip-flop(s).
	inferred  22 Multiplexer(s).
Unit <b2tt_payload> synthesized.

Synthesizing Unit <b2tt_encode>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_encode.vhd".
        FLIPACK = '0'
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_encode.vhd" line 372: Output port <cntpacket> of the instance <map_co> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_encode.vhd" line 372: Output port <staframe> of the instance <map_co> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_encode.vhd" line 391: Output port <validk> of the instance <map_b2> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_encode.vhd" line 391: Output port <rdnext> of the instance <map_b2> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_encode.vhd" line 391: Output port <rd6p> of the instance <map_b2> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_encode.vhd" line 391: Output port <rd4p> of the instance <map_b2> is unconnected or connected to loadless signal.
    Summary:
	no macro.
Unit <b2tt_encode> synthesized.

Synthesizing Unit <b2tt_encounter>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_encode.vhd".
    Found 3-bit register for signal <cnt_bit2>.
    Found 4-bit register for signal <cnt_octet>.
    Found 8-bit register for signal <cnt_packet>.
    Found 1-bit register for signal <sta_frame>.
    Found 3-bit adder for signal <cnt_bit2[2]_GND_156_o_add_4_OUT> created at line 59.
    Found 4-bit adder for signal <cnt_octet[3]_GND_156_o_add_7_OUT> created at line 66.
    Found 8-bit adder for signal <cnt_packet[7]_GND_156_o_add_12_OUT> created at line 73.
    Summary:
	inferred   3 Adder/Subtractor(s).
	inferred  16 D-type flip-flop(s).
Unit <b2tt_encounter> synthesized.

Synthesizing Unit <b2tt_enoctet>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_encode.vhd".
    Found 8-bit register for signal <sta_crc8>.
    Found 8-bit register for signal <octet>.
    Found 1-bit register for signal <isk>.
    Found 112-bit register for signal <buf_payload>.
    Found 1-bit register for signal <sta_defer>.
    Summary:
	inferred 130 D-type flip-flop(s).
	inferred   3 Multiplexer(s).
Unit <b2tt_enoctet> synthesized.

Synthesizing Unit <b2tt_enbit2>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_encode.vhd".
    Found 1-bit register for signal <sig_orbusy>.
    Found 1-bit register for signal <seq_reset>.
    Found 2-bit register for signal <seq_busy>.
    Found 2-bit register for signal <seq_err>.
    Found 8-bit register for signal <seq_k285>.
    Found 3-bit register for signal <cnt_k285>.
    Found 1-bit register for signal <obusy>.
    Found 8-bit register for signal <seq_10b>.
    Found 3-bit subtractor for signal <GND_158_o_GND_158_o_sub_13_OUT<2:0>> created at line 282.
    WARNING:Xst:2404 -  FFs/Latches <seq_orbusy<0:0>> (without init value) have a constant value of 0 in block <b2tt_enbit2>.
    Summary:
	inferred   1 Adder/Subtractor(s).
	inferred  26 D-type flip-flop(s).
	inferred   9 Multiplexer(s).
Unit <b2tt_enbit2> synthesized.

Synthesizing Unit <b2tt_en8b10b>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_8b10b.vhd".
    Found 1-bit register for signal <validk>.
    Found 1-bit register for signal <rd6psav>.
    Found 1-bit register for signal <rd4psav>.
    Found 1-bit register for signal <rdplus>.
    Summary:
	inferred   4 D-type flip-flop(s).
	inferred  13 Multiplexer(s).
Unit <b2tt_en8b10b> synthesized.

Synthesizing Unit <b2tt_oddr>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\b2tt\b2tt\b2tt_ddr_s6.vhd".
        FLIPOUT = '0'
        REFFREQ = 203.546
    Summary:
	no macro.
Unit <b2tt_oddr> synthesized.

Synthesizing Unit <klm_aurora_intfc>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora_intfc.vhd".
        SIM_GTPRESET_SPEEDUP = 1
WARNING:Xst:647 - Input <plllock> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora_intfc.vhd" line 158: Output port <DRPDO_OUT> of the instance <klm_aurora_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora_intfc.vhd" line 158: Output port <GTPCLKOUT> of the instance <klm_aurora_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora_intfc.vhd" line 158: Output port <DRDY_OUT> of the instance <klm_aurora_ins> is unconnected or connected to loadless signal.
    Found 1-bit register for signal <gtlock>.
    Found 1-bit register for signal <hard_err>.
    Found 1-bit register for signal <soft_err>.
    Found 1-bit register for signal <frame_err>.
    Found 1-bit register for signal <lane_up>.
    Found 1-bit register for signal <channel_up>.
    Found 1-bit register for signal <warn_cc>.
    Found 1-bit register for signal <do_cc>.
    Summary:
	inferred   8 D-type flip-flop(s).
Unit <klm_aurora_intfc> synthesized.

Synthesizing Unit <klm_aurora>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd".
        SIM_GTPRESET_SPEEDUP = 1
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" line 443: Output port <GOT_A> of the instance <aurora_lane_0_i> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" line 443: Output port <CHANNEL_BOND_LOAD> of the instance <aurora_lane_0_i> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" line 493: Output port <RXCHARISCOMMA_OUT_unused> of the instance <gtp_wrapper_i> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" line 493: Output port <RXCHARISK_OUT_unused> of the instance <gtp_wrapper_i> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" line 493: Output port <RXDISPERR_OUT_unused> of the instance <gtp_wrapper_i> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" line 493: Output port <RXNOTINTABLE_OUT_unused> of the instance <gtp_wrapper_i> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" line 493: Output port <RXDATA_OUT_unused> of the instance <gtp_wrapper_i> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" line 493: Output port <RXBUFERR_OUT_unused> of the instance <gtp_wrapper_i> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" line 493: Output port <TXBUFERR_OUT_unused> of the instance <gtp_wrapper_i> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" line 493: Output port <RXRECCLK1_OUT> of the instance <gtp_wrapper_i> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" line 493: Output port <RXRECCLK2_OUT> of the instance <gtp_wrapper_i> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" line 493: Output port <RXREALIGN_OUT_unused> of the instance <gtp_wrapper_i> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" line 493: Output port <CHBONDDONE_OUT_unused> of the instance <gtp_wrapper_i> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" line 493: Output port <TX1N_OUT_unused> of the instance <gtp_wrapper_i> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" line 493: Output port <TX1P_OUT_unused> of the instance <gtp_wrapper_i> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\klm_aurora.vhd" line 559: Output port <EN_CHAN_SYNC> of the instance <global_logic_i> is unconnected or connected to loadless signal.
WARNING:Xst:653 - Signal <RX1N_IN_unused> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <RX1P_IN_unused> is used but never assigned. This sourceless signal will be automatically connected to value GND.
    Summary:
	no macro.
Unit <klm_aurora> synthesized.

Synthesizing Unit <AURORA_LANE>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\aurora_lane.vhd".
WARNING:Xst:647 - Input <RESET_SYMGEN> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\aurora_lane.vhd" line 481: Output port <RX_CC> of the instance <sym_dec_i> is unconnected or connected to loadless signal.
    Summary:
	no macro.
Unit <AURORA_LANE> synthesized.

Synthesizing Unit <LANE_INIT_SM>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\lane_init_sm.vhd".
    Found 1-bit register for signal <rst_r>.
    Found 1-bit register for signal <align_r>.
    Found 1-bit register for signal <realign_r>.
    Found 1-bit register for signal <polarity_r>.
    Found 1-bit register for signal <ack_r>.
    Found 1-bit register for signal <ready_r>.
    Found 1-bit register for signal <ENABLE_ERR_DETECT_Buffer>.
    Found 1-bit register for signal <odd_word_r>.
    Found 8-bit register for signal <counter1_r>.
    Found 1-bit register for signal <reset_count_r>.
    Found 2-bit register for signal <RX_CHAR_IS_COMMA_R>.
    Found 1-bit register for signal <prev_char_was_comma_r>.
    Found 1-bit register for signal <comma_over_two_cycles_r>.
    Found 16-bit register for signal <counter2_r>.
    Found 4-bit register for signal <counter3_r>.
    Found 16-bit register for signal <counter4_r>.
    Found 16-bit register for signal <counter5_r>.
    Found 1-bit register for signal <prev_count_128d_done_r>.
    Found 1-bit register for signal <do_watchdog_count_r>.
    Found 1-bit register for signal <rx_polarity_r>.
    Found 1-bit register for signal <begin_r>.
    Found 8-bit adder for signal <counter1_r[0]_GND_192_o_add_2_OUT> created at line 380.
    Summary:
	inferred   1 Adder/Subtractor(s).
	inferred  77 D-type flip-flop(s).
	inferred   1 Multiplexer(s).
Unit <LANE_INIT_SM> synthesized.

Synthesizing Unit <CHBOND_COUNT_DEC>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\chbond_count_dec.vhd".
    WARNING:Xst:2404 -  FFs/Latches <CHANNEL_BOND_LOAD_Buffer<0:0>> (without init value) have a constant value of 0 in block <CHBOND_COUNT_DEC>.
    Summary:
	no macro.
Unit <CHBOND_COUNT_DEC> synthesized.

Synthesizing Unit <SYM_GEN>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\sym_gen.vhd".
    Found 1-bit register for signal <gen_ecp_r>.
    Found 1-bit register for signal <gen_pad_r>.
    Found 16-bit register for signal <tx_pe_data_r>.
    Found 1-bit register for signal <tx_pe_data_v_r>.
    Found 1-bit register for signal <gen_cc_r>.
    Found 1-bit register for signal <gen_a_r>.
    Found 2-bit register for signal <gen_k_r>.
    Found 2-bit register for signal <gen_r_r>.
    Found 2-bit register for signal <gen_v_r>.
    Found 1-bit register for signal <gen_k_fsm_r>.
    Found 2-bit register for signal <gen_sp_data_r>.
    Found 2-bit register for signal <gen_spa_data_r>.
    Found 1-bit register for signal <TX_DATA_Buffer<15>>.
    Found 1-bit register for signal <TX_DATA_Buffer<14>>.
    Found 1-bit register for signal <TX_DATA_Buffer<13>>.
    Found 1-bit register for signal <TX_DATA_Buffer<12>>.
    Found 1-bit register for signal <TX_DATA_Buffer<11>>.
    Found 1-bit register for signal <TX_DATA_Buffer<10>>.
    Found 1-bit register for signal <TX_DATA_Buffer<9>>.
    Found 1-bit register for signal <TX_DATA_Buffer<8>>.
    Found 1-bit register for signal <TX_CHAR_IS_K_Buffer<1>>.
    Found 1-bit register for signal <TX_DATA_Buffer<7>>.
    Found 1-bit register for signal <TX_DATA_Buffer<6>>.
    Found 1-bit register for signal <TX_DATA_Buffer<5>>.
    Found 1-bit register for signal <TX_DATA_Buffer<4>>.
    Found 1-bit register for signal <TX_DATA_Buffer<3>>.
    Found 1-bit register for signal <TX_DATA_Buffer<2>>.
    Found 1-bit register for signal <TX_DATA_Buffer<1>>.
    Found 1-bit register for signal <TX_DATA_Buffer<0>>.
    Found 1-bit register for signal <TX_CHAR_IS_K_Buffer<0>>.
    Found 1-bit register for signal <gen_scp_r>.
    Summary:
	inferred  51 D-type flip-flop(s).
	inferred  90 Multiplexer(s).
Unit <SYM_GEN> synthesized.

Synthesizing Unit <SYM_DEC>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\sym_dec.vhd".
    Found 1-bit register for signal <word_aligned_data_r<0>>.
    Found 1-bit register for signal <word_aligned_data_r<1>>.
    Found 1-bit register for signal <word_aligned_data_r<2>>.
    Found 1-bit register for signal <word_aligned_data_r<3>>.
    Found 1-bit register for signal <word_aligned_data_r<4>>.
    Found 1-bit register for signal <word_aligned_data_r<5>>.
    Found 1-bit register for signal <word_aligned_data_r<6>>.
    Found 1-bit register for signal <word_aligned_data_r<7>>.
    Found 1-bit register for signal <word_aligned_data_r<8>>.
    Found 1-bit register for signal <word_aligned_data_r<9>>.
    Found 1-bit register for signal <word_aligned_data_r<10>>.
    Found 1-bit register for signal <word_aligned_data_r<11>>.
    Found 1-bit register for signal <word_aligned_data_r<12>>.
    Found 1-bit register for signal <word_aligned_data_r<13>>.
    Found 1-bit register for signal <word_aligned_data_r<14>>.
    Found 1-bit register for signal <word_aligned_data_r<15>>.
    Found 1-bit register for signal <word_aligned_control_bits_r<0>>.
    Found 1-bit register for signal <word_aligned_control_bits_r<1>>.
    Found 16-bit register for signal <rx_pe_data_r>.
    Found 16-bit register for signal <RX_PE_DATA_Buffer>.
    Found 2-bit register for signal <rx_pe_control_r>.
    Found 2-bit register for signal <rx_pad_d_r>.
    Found 1-bit register for signal <RX_PAD_Buffer>.
    Found 1-bit register for signal <RX_PE_DATA_V_Buffer>.
    Found 4-bit register for signal <rx_scp_d_r>.
    Found 1-bit register for signal <RX_SCP_Buffer>.
    Found 4-bit register for signal <rx_ecp_d_r>.
    Found 1-bit register for signal <RX_ECP_Buffer>.
    Found 4-bit register for signal <prev_beat_sp_d_r>.
    Found 1-bit register for signal <prev_beat_sp_r>.
    Found 4-bit register for signal <prev_beat_spa_d_r>.
    Found 1-bit register for signal <prev_beat_spa_r>.
    Found 4-bit register for signal <rx_sp_d_r>.
    Found 1-bit register for signal <RX_SP_Buffer>.
    Found 4-bit register for signal <rx_spa_d_r>.
    Found 1-bit register for signal <RX_SPA_Buffer>.
    Found 2-bit register for signal <rx_sp_neg_d_r>.
    Found 2-bit register for signal <rx_spa_neg_d_r>.
    Found 1-bit register for signal <RX_NEG_Buffer>.
    Found 4-bit register for signal <got_a_d_r>.
    Found 2-bit register for signal <GOT_A_Buffer>.
    Found 4-bit register for signal <prev_beat_v_d_r>.
    Found 1-bit register for signal <prev_beat_v_r>.
    Found 4-bit register for signal <rx_v_d_r>.
    Found 1-bit register for signal <GOT_V_Buffer>.
    Found 1-bit register for signal <first_v_received_r>.
    Found 4-bit register for signal <rx_cc_r>.
    Found 1-bit register for signal <RX_CC_Buffer>.
    Found 1-bit register for signal <left_aligned_r>.
    Summary:
	inferred 114 D-type flip-flop(s).
	inferred  18 Multiplexer(s).
Unit <SYM_DEC> synthesized.

Synthesizing Unit <ERR_DETECT>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\err_detect.vhd".
    Found 1-bit register for signal <soft_err_flop_r>.
    Found 1-bit register for signal <SOFT_ERR_Buffer>.
    Found 1-bit register for signal <hard_err_flop_r>.
    Found 1-bit register for signal <HARD_ERR_Buffer>.
    Found 2-bit register for signal <good_count_r>.
    Found 2-bit register for signal <count_r>.
    Found 1-bit register for signal <bucket_full_r>.
    Found 2-bit register for signal <soft_err_r>.
    Found finite state machine <FSM_3> for signal <good_count_r>.
    -----------------------------------------------------------------------
    | States             | 4                                              |
    | Transitions        | 16                                             |
    | Inputs             | 3                                              |
    | Outputs            | 5                                              |
    | Clock              | USER_CLK (rising_edge)                         |
    | Reset              | ENABLE_ERR_DETECT_INV_930_o (positive)         |
    | Reset type         | synchronous                                    |
    | Reset State        | 00                                             |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found finite state machine <FSM_4> for signal <count_r>.
    -----------------------------------------------------------------------
    | States             | 4                                              |
    | Transitions        | 38                                             |
    | Inputs             | 9                                              |
    | Outputs            | 2                                              |
    | Clock              | USER_CLK (rising_edge)                         |
    | Reset              | ENABLE_ERR_DETECT_INV_930_o (positive)         |
    | Reset type         | synchronous                                    |
    | Reset State        | 00                                             |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Summary:
	inferred   7 D-type flip-flop(s).
	inferred   2 Multiplexer(s).
	inferred   2 Finite State Machine(s).
Unit <ERR_DETECT> synthesized.

Synthesizing Unit <GTP_WRAPPER>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\transceiver_wrapper.vhd".
        SIM_GTPRESET_SPEEDUP = 1
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\transceiver_wrapper.vhd" line 279: Output port <RXCLKCORCNT0_OUT> of the instance <GTP_TILE_INST> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\transceiver_wrapper.vhd" line 279: Output port <RXCLKCORCNT1_OUT> of the instance <GTP_TILE_INST> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\transceiver_wrapper.vhd" line 279: Output port <GTPCLKOUT1_OUT> of the instance <GTP_TILE_INST> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\transceiver_wrapper.vhd" line 279: Output port <PLLLKDET1_OUT> of the instance <GTP_TILE_INST> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\transceiver_wrapper.vhd" line 279: Output port <RESETDONE0_OUT> of the instance <GTP_TILE_INST> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\transceiver_wrapper.vhd" line 279: Output port <RESETDONE1_OUT> of the instance <GTP_TILE_INST> is unconnected or connected to loadless signal.
WARNING:Xst:653 - Signal <RXRECCLK1_OUT> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <RXRECCLK2_OUT> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <CHBONDDONE_OUT_unused> is used but never assigned. This sourceless signal will be automatically connected to value GND.
    Summary:
	no macro.
Unit <GTP_WRAPPER> synthesized.

Synthesizing Unit <AURORA_TILE>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\aurora_tile.vhd".
        TILE_SIM_GTPRESET_SPEEDUP = 1
        TILE_CLK25_DIVIDER_0 = 6
        TILE_CLK25_DIVIDER_1 = 6
        TILE_PLL_DIVSEL_FB_0 = 2
        TILE_PLL_DIVSEL_FB_1 = 2
        TILE_PLL_DIVSEL_REF_0 = 1
        TILE_PLL_DIVSEL_REF_1 = 1
        TILE_PLL_SOURCE_0 = "PLL0"
        TILE_PLL_SOURCE_1 = "PLL1"
    Summary:
	no macro.
Unit <AURORA_TILE> synthesized.

Synthesizing Unit <GLOBAL_LOGIC>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\global_logic.vhd".
    Summary:
	no macro.
Unit <GLOBAL_LOGIC> synthesized.

Synthesizing Unit <CHANNEL_INIT_SM>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\channel_init_sm.vhd".
    Found 1-bit register for signal <verify_r>.
    Found 1-bit register for signal <ready_r>.
    Found 1-bit register for signal <CHANNEL_UP_Buffer>.
    Found 1-bit register for signal <START_RX_Buffer>.
    Found 8-bit register for signal <free_count_r>.
    Found 16-bit register for signal <verify_watchdog_r>.
    Found 1-bit register for signal <all_lanes_v_r>.
    Found 1-bit register for signal <got_first_v_r>.
    Found 32-bit register for signal <v_count_r>.
    Found 1-bit register for signal <bad_v_r>.
    Found 3-bit register for signal <rxver_count_r>.
    Found 8-bit register for signal <txver_count_r>.
    Found 1-bit register for signal <wait_for_lane_up_r>.
    Found 8-bit adder for signal <free_count_r[0]_GND_239_o_add_0_OUT> created at line 305.
    Summary:
	inferred   1 Adder/Subtractor(s).
	inferred  75 D-type flip-flop(s).
Unit <CHANNEL_INIT_SM> synthesized.

Synthesizing Unit <IDLE_AND_VER_GEN>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\idle_and_ver_gen.vhd".
    Found 4-bit register for signal <downcounter_r>.
    Found 1-bit register for signal <prev_cycle_gen_ver_r>.
    Found 1-bit register for signal <gen_ver_word_2_r>.
    Found 4-bit register for signal <lfsr_shift_register_r>.
    Found 4-bit subtractor for signal <GND_240_o_GND_240_o_sub_6_OUT<3:0>> created at line 281.
    Summary:
	inferred   1 Adder/Subtractor(s).
	inferred  10 D-type flip-flop(s).
	inferred   1 Multiplexer(s).
Unit <IDLE_AND_VER_GEN> synthesized.

Synthesizing Unit <CHANNEL_ERR_DETECT>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\channel_err_detect.vhd".
    Found 1-bit register for signal <hard_err_r>.
    Found 1-bit register for signal <CHANNEL_SOFT_ERR_Buffer>.
    Found 1-bit register for signal <CHANNEL_HARD_ERR_Buffer>.
    Found 1-bit register for signal <lane_up_r>.
    Found 1-bit register for signal <RESET_CHANNEL_Buffer>.
    Found 1-bit register for signal <soft_err_r>.
    Summary:
	inferred   6 D-type flip-flop(s).
Unit <CHANNEL_ERR_DETECT> synthesized.

Synthesizing Unit <TX_LL>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\tx_ll.vhd".
WARNING:Xst:647 - Input <WARN_CC> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
    Summary:
	no macro.
Unit <TX_LL> synthesized.

Synthesizing Unit <TX_LL_DATAPATH>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\tx_ll_datapath.vhd".
    Found 16-bit register for signal <storage_r>.
    Found 16-bit register for signal <tx_pe_data_r>.
    Found 1-bit register for signal <storage_v_r>.
    Found 1-bit register for signal <tx_pe_data_v_r>.
    Found 1-bit register for signal <storage_pad_r>.
    Found 1-bit register for signal <gen_pad_r>.
    Found 16-bit register for signal <TX_PE_DATA_Buffer>.
    Found 1-bit register for signal <TX_PE_DATA_V_Buffer>.
    Found 1-bit register for signal <GEN_PAD_Buffer>.
    Found 1-bit register for signal <in_frame_r>.
    Summary:
	inferred  55 D-type flip-flop(s).
Unit <TX_LL_DATAPATH> synthesized.

Synthesizing Unit <TX_LL_CONTROL>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\tx_ll_control.vhd".
    Found 1-bit register for signal <idle_r>.
    Found 1-bit register for signal <sof_r>.
    Found 1-bit register for signal <sof_data_eof_1_r>.
    Found 1-bit register for signal <sof_data_eof_2_r>.
    Found 1-bit register for signal <sof_data_eof_3_r>.
    Found 1-bit register for signal <data_r>.
    Found 1-bit register for signal <data_eof_1_r>.
    Found 1-bit register for signal <data_eof_2_r>.
    Found 1-bit register for signal <data_eof_3_r>.
    Found 1-bit register for signal <GEN_SCP_Buffer>.
    Found 1-bit register for signal <GEN_ECP_Buffer>.
    Found 1-bit register for signal <TX_DST_RDY_N_Buffer>.
    Found 1-bit register for signal <do_cc_r>.
    Summary:
	inferred  13 D-type flip-flop(s).
Unit <TX_LL_CONTROL> synthesized.

Synthesizing Unit <RX_LL>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\rx_ll.vhd".
    Summary:
	no macro.
Unit <RX_LL> synthesized.

Synthesizing Unit <RX_LL_PDU_DATAPATH>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\rx_ll_pdu_datapath.vhd".
    Found 1-bit register for signal <storage_v_r>.
    Found 16-bit register for signal <RX_D_Buffer>.
    Found 1-bit register for signal <RX_SRC_RDY_N_Buffer>.
    Found 1-bit register for signal <in_frame_r>.
    Found 1-bit register for signal <sof_in_storage_r>.
    Found 1-bit register for signal <RX_SOF_N_Buffer>.
    Found 1-bit register for signal <RX_EOF_N_Buffer>.
    Found 1-bit register for signal <pad_in_storage_r>.
    Found 1-bit register for signal <RX_REM_Buffer>.
    Found 1-bit register for signal <FRAME_ERR_Buffer>.
    Found 16-bit register for signal <storage_r>.
    Summary:
	inferred  41 D-type flip-flop(s).
Unit <RX_LL_PDU_DATAPATH> synthesized.

Synthesizing Unit <STANDARD_CC_MODULE>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_aurora\source\standard_cc_module.vhd".
    Found 1-bit register for signal <count_13d_flop_r>.
    Found 15-bit register for signal <count_16d_srl_r>.
    Found 1-bit register for signal <count_16d_flop_r>.
    Found 23-bit register for signal <count_24d_srl_r>.
    Found 1-bit register for signal <count_24d_flop_r>.
    Found 10-bit register for signal <prepare_count_r>.
    Found 1-bit register for signal <WARN_CC>.
    Found 1-bit register for signal <reset_r>.
    Found 6-bit register for signal <cc_count_r>.
    Found 1-bit register for signal <DO_CC>.
    Found 12-bit register for signal <count_13d_srl_r>.
    Summary:
	inferred  72 D-type flip-flop(s).
Unit <STANDARD_CC_MODULE> synthesized.

Synthesizing Unit <conc_intfc>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\conc_intfc\source\conc_intfc.vhd".
WARNING:Xst:647 - Input <b2tt_fifodata<31:0>> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <b2tt_fifodata<95:48>> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <b2tt_gtpreset> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\conc_intfc\source\conc_intfc.vhd" line 312: Output port <almost_full> of the instance <trig_fifo_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\conc_intfc\source\conc_intfc.vhd" line 312: Output port <almost_empty> of the instance <trig_fifo_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\conc_intfc\source\conc_intfc.vhd" line 330: Output port <full> of the instance <daq_fifo_ins> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\conc_intfc\source\conc_intfc.vhd" line 330: Output port <almost_empty> of the instance <daq_fifo_ins> is unconnected or connected to loadless signal.
    Found 2-bit register for signal <to_valid>.
    Found 1-bit register for signal <trg_fifo_we>.
    Found 18-bit register for signal <trg_fifo_di>.
    Found 1-bit register for signal <trg_valid>.
    Found 8-bit register for signal <trgsof_ctr>.
    Found 8-bit register for signal <trgeof_ctr>.
    Found 1-bit register for signal <daq_dst_rdy_n>.
    Found 1-bit register for signal <zrlentrg>.
    Found 1-bit register for signal <ftrgtag>.
    Found 1-bit register for signal <daq_sof_q<1>>.
    Found 2-bit register for signal <daq_eof_q>.
    Found 2-bit register for signal <daq_src_rdy_q>.
    Found 16-bit register for signal <daq_data_q<1>>.
    Found 16-bit register for signal <daq_data_q<0>>.
    Found 1-bit register for signal <daq_fifo_we>.
    Found 18-bit register for signal <daq_fifo_di>.
    Found 4-bit register for signal <daq_pause>.
    Found 2-bit register for signal <sts_pause>.
    Found 2-bit register for signal <idl_pause>.
    Found 1-bit register for signal <sts_sof_q>.
    Found 16-bit register for signal <sts_data>.
    Found 5-bit register for signal <pkttp_ctr>.
    Found 1-bit register for signal <pkttp_ctr_tc>.
    Found 6-bit register for signal <trgpkt_ctr>.
    Found 1-bit register for signal <trgpkt_ctr_tc>.
    Found 9-bit register for signal <stspkt_ctr>.
    Found 1-bit register for signal <stspkt_ctr_tc>.
    Found 4-bit register for signal <tx_fsm_cs>.
    Found 1-bit register for signal <tx_src_rdy_n>.
    Found 1-bit register for signal <rx_dst_rdy_n>.
    Found 1-bit register for signal <rcl_sof_n>.
    Found 1-bit register for signal <rcl_eof_n>.
    Found 1-bit register for signal <rcl_src_rdy_n>.
    Found 16-bit register for signal <rcl_data>.
    Found 1-bit register for signal <b2tt_fifonext>.
    Found finite state machine <FSM_5> for signal <tx_fsm_cs>.
    -----------------------------------------------------------------------
    | States             | 9                                              |
    | Transitions        | 28                                             |
    | Inputs             | 13                                             |
    | Outputs            | 7                                              |
    | Clock              | sys_clk (rising_edge)                          |
    | Reset              | b2tt_runreset (positive)                       |
    | Reset type         | synchronous                                    |
    | Reset State        | clears                                         |
    | Power Up State     | clears                                         |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found 8-bit adder for signal <trgsof_ctr[7]_GND_252_o_add_3_OUT> created at line 415.
    Found 8-bit adder for signal <trgeof_ctr[7]_GND_252_o_add_5_OUT> created at line 418.
    Found 9-bit adder for signal <stspkt_ctr[8]_GND_252_o_add_33_OUT> created at line 539.
    Found 5-bit subtractor for signal <GND_252_o_GND_252_o_sub_26_OUT<4:0>> created at line 515.
    Found 6-bit subtractor for signal <GND_252_o_GND_252_o_sub_30_OUT<5:0>> created at line 527.
    Summary:
	inferred   5 Adder/Subtractor(s).
	inferred 167 D-type flip-flop(s).
	inferred  37 Multiplexer(s).
	inferred   1 Finite State Machine(s).
Unit <conc_intfc> synthesized.

Synthesizing Unit <tdc>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc.vhd".
    Found 10-bit register for signal <fifo_ept_q1>.
    Found 13-bit register for signal <tdc_dout_q1<1>>.
    Found 13-bit register for signal <tdc_dout_q1<2>>.
    Found 13-bit register for signal <tdc_dout_q1<3>>.
    Found 13-bit register for signal <tdc_dout_q1<4>>.
    Found 13-bit register for signal <tdc_dout_q1<5>>.
    Found 13-bit register for signal <tdc_dout_q1<6>>.
    Found 13-bit register for signal <tdc_dout_q1<7>>.
    Found 13-bit register for signal <tdc_dout_q1<8>>.
    Found 13-bit register for signal <tdc_dout_q1<9>>.
    Found 13-bit register for signal <tdc_dout_q1<10>>.
    Found 10-bit register for signal <tdc_clr_dlyln>.
    Summary:
	inferred 150 D-type flip-flop(s).
	inferred  10 Multiplexer(s).
Unit <tdc> synthesized.

Synthesizing Unit <tdc_channel_1>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_channel.vhd".
        INIT_VAL = "111111110"
WARNING:Xst:647 - Input <tb16> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
    Found 5-bit register for signal <tb_q4>.
    Found 1-bit register for signal <fifo_we_q0>.
    Found 4-bit register for signal <chan_q1>.
    Found 9-bit register for signal <counter_q0>.
    Found 9-bit register for signal <counter_q1>.
    Found 9-bit register for signal <counter>.
    Found 1-bit register for signal <trig_q0>.
    Found 4-bit register for signal <chan_q0>.
    Found 1-bit register for signal <tdc_rst_q0>.
    Found 9-bit adder for signal <counter[8]_GND_254_o_add_7_OUT> created at line 207.
    Found 32x5-bit Read Only RAM for signal <_n0069>
    Summary:
	inferred   1 RAM(s).
	inferred   1 Adder/Subtractor(s).
	inferred  43 D-type flip-flop(s).
	inferred   1 Multiplexer(s).
Unit <tdc_channel_1> synthesized.

Synthesizing Unit <tdc_fifo>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_fifo.vhd".
        DEPTH = 4
        DWIDTH = 13
    Found 4x13-bit dual-port RAM <Mram_dpram_t> for signal <dpram_t>.
    Found 13-bit register for signal <dout>.
    Found 1-bit register for signal <full>.
    Found 2-bit register for signal <wr_ptr>.
    Found 2-bit register for signal <rd_ptr>.
    Found 2-bit register for signal <flag_ptr>.
    Found 1-bit register for signal <dout_valid>.
    Found 2-bit adder for signal <wr_ptr[1]_GND_255_o_add_8_OUT> created at line 152.
    Found 2-bit adder for signal <rd_ptr[1]_GND_255_o_add_10_OUT> created at line 155.
    Found 2-bit adder for signal <flag_ptr[1]_GND_255_o_add_13_OUT> created at line 163.
    Found 2-bit subtractor for signal <GND_255_o_GND_255_o_sub_13_OUT<1:0>> created at line 161.
    Found 2-bit comparator greater for signal <afull_d> created at line 93
    Summary:
	inferred   1 RAM(s).
	inferred   3 Adder/Subtractor(s).
	inferred  21 D-type flip-flop(s).
	inferred   1 Comparator(s).
Unit <tdc_fifo> synthesized.

Synthesizing Unit <tdc_channel_2>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_channel.vhd".
        INIT_VAL = "111111101"
WARNING:Xst:647 - Input <tb16> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
    Found 5-bit register for signal <tb_q4>.
    Found 1-bit register for signal <fifo_we_q0>.
    Found 4-bit register for signal <chan_q1>.
    Found 9-bit register for signal <counter_q0>.
    Found 9-bit register for signal <counter_q1>.
    Found 9-bit register for signal <counter>.
    Found 1-bit register for signal <trig_q0>.
    Found 4-bit register for signal <chan_q0>.
    Found 1-bit register for signal <tdc_rst_q0>.
    Found 9-bit adder for signal <counter[8]_GND_271_o_add_7_OUT> created at line 207.
    Found 32x1-bit Read Only RAM for signal <tb_q4[5]_PWR_220_o_Mux_10_o>
    Found 32x4-bit Read Only RAM for signal <tb_q4[5]_GND_271_o_wide_mux_11_OUT>
    Summary:
	inferred   2 RAM(s).
	inferred   1 Adder/Subtractor(s).
	inferred  43 D-type flip-flop(s).
	inferred   1 Multiplexer(s).
Unit <tdc_channel_2> synthesized.

Synthesizing Unit <tdc_channel_3>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_channel.vhd".
        INIT_VAL = "111111100"
WARNING:Xst:647 - Input <tb16> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
    Found 5-bit register for signal <tb_q4>.
    Found 1-bit register for signal <fifo_we_q0>.
    Found 4-bit register for signal <chan_q1>.
    Found 9-bit register for signal <counter_q0>.
    Found 9-bit register for signal <counter_q1>.
    Found 9-bit register for signal <counter>.
    Found 1-bit register for signal <trig_q0>.
    Found 4-bit register for signal <chan_q0>.
    Found 1-bit register for signal <tdc_rst_q0>.
    Found 9-bit adder for signal <counter[8]_GND_287_o_add_7_OUT> created at line 207.
    Found 32x1-bit Read Only RAM for signal <tb_q4[5]_PWR_246_o_Mux_10_o>
    Found 32x4-bit Read Only RAM for signal <tb_q4[5]_GND_287_o_wide_mux_11_OUT>
    Summary:
	inferred   2 RAM(s).
	inferred   1 Adder/Subtractor(s).
	inferred  43 D-type flip-flop(s).
	inferred   1 Multiplexer(s).
Unit <tdc_channel_3> synthesized.

Synthesizing Unit <tdc_channel_4>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_channel.vhd".
        INIT_VAL = "111111011"
WARNING:Xst:647 - Input <tb16> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
    Found 5-bit register for signal <tb_q4>.
    Found 1-bit register for signal <fifo_we_q0>.
    Found 4-bit register for signal <chan_q1>.
    Found 9-bit register for signal <counter_q0>.
    Found 9-bit register for signal <counter_q1>.
    Found 9-bit register for signal <counter>.
    Found 1-bit register for signal <trig_q0>.
    Found 4-bit register for signal <chan_q0>.
    Found 1-bit register for signal <tdc_rst_q0>.
    Found 9-bit adder for signal <counter[8]_GND_303_o_add_7_OUT> created at line 207.
    Found 32x1-bit Read Only RAM for signal <tb_q4[5]_PWR_272_o_Mux_10_o>
    Found 32x4-bit Read Only RAM for signal <tb_q4[5]_GND_303_o_wide_mux_11_OUT>
    Summary:
	inferred   2 RAM(s).
	inferred   1 Adder/Subtractor(s).
	inferred  43 D-type flip-flop(s).
	inferred   1 Multiplexer(s).
Unit <tdc_channel_4> synthesized.

Synthesizing Unit <tdc_channel_5>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_channel.vhd".
        INIT_VAL = "111111010"
WARNING:Xst:647 - Input <tb16> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
    Found 5-bit register for signal <tb_q4>.
    Found 1-bit register for signal <fifo_we_q0>.
    Found 4-bit register for signal <chan_q1>.
    Found 9-bit register for signal <counter_q0>.
    Found 9-bit register for signal <counter_q1>.
    Found 9-bit register for signal <counter>.
    Found 1-bit register for signal <trig_q0>.
    Found 4-bit register for signal <chan_q0>.
    Found 1-bit register for signal <tdc_rst_q0>.
    Found 9-bit adder for signal <counter[8]_GND_319_o_add_7_OUT> created at line 207.
    Found 32x1-bit Read Only RAM for signal <tb_q4[5]_PWR_298_o_Mux_10_o>
    Found 32x4-bit Read Only RAM for signal <tb_q4[5]_GND_319_o_wide_mux_11_OUT>
    Summary:
	inferred   2 RAM(s).
	inferred   1 Adder/Subtractor(s).
	inferred  43 D-type flip-flop(s).
	inferred   1 Multiplexer(s).
Unit <tdc_channel_5> synthesized.

Synthesizing Unit <tdc_channel_6>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_channel.vhd".
        INIT_VAL = "111111001"
WARNING:Xst:647 - Input <tb16> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
    Found 5-bit register for signal <tb_q4>.
    Found 1-bit register for signal <fifo_we_q0>.
    Found 4-bit register for signal <chan_q1>.
    Found 9-bit register for signal <counter_q0>.
    Found 9-bit register for signal <counter_q1>.
    Found 9-bit register for signal <counter>.
    Found 1-bit register for signal <trig_q0>.
    Found 4-bit register for signal <chan_q0>.
    Found 1-bit register for signal <tdc_rst_q0>.
    Found 9-bit adder for signal <counter[8]_GND_335_o_add_7_OUT> created at line 207.
    Found 32x1-bit Read Only RAM for signal <tb_q4[5]_PWR_324_o_Mux_10_o>
    Found 32x4-bit Read Only RAM for signal <tb_q4[5]_GND_335_o_wide_mux_11_OUT>
    Summary:
	inferred   2 RAM(s).
	inferred   1 Adder/Subtractor(s).
	inferred  43 D-type flip-flop(s).
	inferred   1 Multiplexer(s).
Unit <tdc_channel_6> synthesized.

Synthesizing Unit <tdc_channel_7>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_channel.vhd".
        INIT_VAL = "111111000"
WARNING:Xst:647 - Input <tb16> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
    Found 5-bit register for signal <tb_q4>.
    Found 1-bit register for signal <fifo_we_q0>.
    Found 4-bit register for signal <chan_q1>.
    Found 9-bit register for signal <counter_q0>.
    Found 9-bit register for signal <counter_q1>.
    Found 9-bit register for signal <counter>.
    Found 1-bit register for signal <trig_q0>.
    Found 4-bit register for signal <chan_q0>.
    Found 1-bit register for signal <tdc_rst_q0>.
    Found 9-bit adder for signal <counter[8]_GND_351_o_add_7_OUT> created at line 207.
    Found 32x1-bit Read Only RAM for signal <tb_q4[5]_PWR_350_o_Mux_10_o>
    Found 32x4-bit Read Only RAM for signal <tb_q4[5]_GND_351_o_wide_mux_11_OUT>
    Summary:
	inferred   2 RAM(s).
	inferred   1 Adder/Subtractor(s).
	inferred  43 D-type flip-flop(s).
	inferred   1 Multiplexer(s).
Unit <tdc_channel_7> synthesized.

Synthesizing Unit <tdc_channel_8>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_channel.vhd".
        INIT_VAL = "111110111"
WARNING:Xst:647 - Input <tb16> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
    Found 5-bit register for signal <tb_q4>.
    Found 1-bit register for signal <fifo_we_q0>.
    Found 4-bit register for signal <chan_q1>.
    Found 9-bit register for signal <counter_q0>.
    Found 9-bit register for signal <counter_q1>.
    Found 9-bit register for signal <counter>.
    Found 1-bit register for signal <trig_q0>.
    Found 4-bit register for signal <chan_q0>.
    Found 1-bit register for signal <tdc_rst_q0>.
    Found 9-bit adder for signal <counter[8]_GND_367_o_add_7_OUT> created at line 207.
    Found 32x1-bit Read Only RAM for signal <tb_q4[5]_PWR_376_o_Mux_10_o>
    Found 32x4-bit Read Only RAM for signal <tb_q4[5]_GND_367_o_wide_mux_11_OUT>
    Summary:
	inferred   2 RAM(s).
	inferred   1 Adder/Subtractor(s).
	inferred  43 D-type flip-flop(s).
	inferred   1 Multiplexer(s).
Unit <tdc_channel_8> synthesized.

Synthesizing Unit <tdc_channel_9>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_channel.vhd".
        INIT_VAL = "111110110"
WARNING:Xst:647 - Input <tb16> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
    Found 5-bit register for signal <tb_q4>.
    Found 1-bit register for signal <fifo_we_q0>.
    Found 4-bit register for signal <chan_q1>.
    Found 9-bit register for signal <counter_q0>.
    Found 9-bit register for signal <counter_q1>.
    Found 9-bit register for signal <counter>.
    Found 1-bit register for signal <trig_q0>.
    Found 4-bit register for signal <chan_q0>.
    Found 1-bit register for signal <tdc_rst_q0>.
    Found 9-bit adder for signal <counter[8]_GND_383_o_add_7_OUT> created at line 207.
    Found 32x1-bit Read Only RAM for signal <tb_q4[5]_PWR_402_o_Mux_10_o>
    Found 32x4-bit Read Only RAM for signal <tb_q4[5]_GND_383_o_wide_mux_11_OUT>
    Summary:
	inferred   2 RAM(s).
	inferred   1 Adder/Subtractor(s).
	inferred  43 D-type flip-flop(s).
	inferred   1 Multiplexer(s).
Unit <tdc_channel_9> synthesized.

Synthesizing Unit <tdc_channel_10>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\tdc\source\tdc_channel.vhd".
        INIT_VAL = "111110101"
WARNING:Xst:647 - Input <tb16> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
    Found 5-bit register for signal <tb_q4>.
    Found 1-bit register for signal <fifo_we_q0>.
    Found 4-bit register for signal <chan_q1>.
    Found 9-bit register for signal <counter_q0>.
    Found 9-bit register for signal <counter_q1>.
    Found 9-bit register for signal <counter>.
    Found 1-bit register for signal <trig_q0>.
    Found 4-bit register for signal <chan_q0>.
    Found 1-bit register for signal <tdc_rst_q0>.
    Found 9-bit adder for signal <counter[8]_GND_399_o_add_7_OUT> created at line 207.
    Found 32x1-bit Read Only RAM for signal <tb_q4[5]_PWR_428_o_Mux_10_o>
    Found 32x4-bit Read Only RAM for signal <tb_q4[5]_GND_399_o_wide_mux_11_OUT>
    Summary:
	inferred   2 RAM(s).
	inferred   1 Adder/Subtractor(s).
	inferred  43 D-type flip-flop(s).
	inferred   1 Multiplexer(s).
Unit <tdc_channel_10> synthesized.

Synthesizing Unit <time_order>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\time_order\source\time_order.vhd".
WARNING:Xst:647 - Input <reset> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
    Found 17-bit register for signal <dout_q1>.
    Found 1-bit register for signal <out_cmp_q0>.
    Found 1-bit register for signal <out_cmp_q1>.
    Found 1-bit register for signal <out_cmp_q2>.
    Found 3-bit register for signal <rdfail_ctr>.
    Found 10-bit register for signal <rdfail>.
    Found 10-bit register for signal <src_re_q0>.
    Found 3-bit subtractor for signal <GND_418_o_GND_418_o_sub_34_OUT<2:0>> created at line 189.
    Found 17-bit comparator not equal for signal <dout_q0[16]_dout_q1[16]_equal_27_o> created at line 139
    Summary:
	inferred   1 Adder/Subtractor(s).
	inferred  43 D-type flip-flop(s).
	inferred   1 Comparator(s).
	inferred   1 Multiplexer(s).
Unit <time_order> synthesized.

Synthesizing Unit <tom_10_to_1>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\time_order\source\tom_10_to_1.vhd".
    Summary:
	no macro.
Unit <tom_10_to_1> synthesized.

Synthesizing Unit <tom_3_to_1>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\time_order\source\tom_3_to_1.vhd".
    Found 8-bit register for signal <cmin>.
    Found 9-bit register for signal <dmin>.
    Found 1-bit register for signal <emin>.
    Summary:
	inferred  18 D-type flip-flop(s).
Unit <tom_3_to_1> synthesized.

Synthesizing Unit <tom_2_to_1>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\time_order\source\tom_2_to_1.vhd".
    Found 8-bit comparator lessequal for signal <din[1][7]_din[2][7]_LessThan_1_o> created at line 60
    Summary:
	inferred   1 Comparator(s).
	inferred  27 Multiplexer(s).
Unit <tom_2_to_1> synthesized.

Synthesizing Unit <tom_4_to_1>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\time_order\source\tom_4_to_1.vhd".
    Found 8-bit register for signal <cmin>.
    Found 9-bit register for signal <dmin>.
    Found 1-bit register for signal <emin>.
    Summary:
	inferred  18 D-type flip-flop(s).
Unit <tom_4_to_1> synthesized.

Synthesizing Unit <trig_chan_calc>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\conc_intfc\source\trig_chan_calc.vhd".
        NUM_CHAN = 15
        LANEIW = 4
        CHANIW = 4
        CHANOW = 8
        AXIS_VAL = '0'
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\conc_intfc\source\trig_chan_calc.vhd" line 133: Output port <BCOUT> of the instance <DSP48A1_inst> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\conc_intfc\source\trig_chan_calc.vhd" line 133: Output port <M> of the instance <DSP48A1_inst> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\conc_intfc\source\trig_chan_calc.vhd" line 133: Output port <PCOUT> of the instance <DSP48A1_inst> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\conc_intfc\source\trig_chan_calc.vhd" line 133: Output port <CARRYOUT> of the instance <DSP48A1_inst> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\conc_intfc\source\trig_chan_calc.vhd" line 133: Output port <CARRYOUTF> of the instance <DSP48A1_inst> is unconnected or connected to loadless signal.
    Found 3-bit register for signal <valid_shift>.
    Found 1-bit register for signal <axis_bit>.
    Found 4-bit comparator greater for signal <lane[3]_lane_cval[3]_LessThan_9_o> created at line 225
    Summary:
	inferred   4 D-type flip-flop(s).
	inferred   1 Comparator(s).
Unit <trig_chan_calc> synthesized.

Synthesizing Unit <daq_gen>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\KLM_SCROD\source\daq_gen.vhd".
        SIM_SPEEDUP = '0'
    Register <pds_ctr_ld> equivalent to <pdw_ctr_ld> has been removed
    Found 8-bit register for signal <missed_trg>.
    Found 2-bit register for signal <trg_cs>.
    Found 1-bit register for signal <abd_ctr_ld>.
    Found 1-bit register for signal <pdw_ctr_ld>.
    Found 1-bit register for signal <zlt_en>.
    Found 1-bit register for signal <scint_trgrdy>.
    Found 3-bit register for signal <daq_fsm_cs_t>.
    Found 16-bit register for signal <abd_ctr>.
    Found 1-bit register for signal <abd_ctr_tc>.
    Found 1-bit register for signal <pdt_ctr_en>.
    Found 2-bit register for signal <pdt_ctr>.
    Found 1-bit register for signal <pdt_ctr_tc>.
    Found 2-bit register for signal <pdw_ctr>.
    Found 4-bit register for signal <pds_ctr>.
    Found 1-bit register for signal <pds_ctr_tc>.
    Found 11-bit register for signal <tdc_ctr>.
    Found 1-bit register for signal <tx_sof_n>.
    Found 1-bit register for signal <tx_eof_n>.
    Found 1-bit register for signal <tx_src_rdy_n>.
    Found 2-bit register for signal <ll_fsm_cs_t>.
    Found 16-bit register for signal <tx_d>.
    Found 1-bit register for signal <scint_trg>.
    Found finite state machine <FSM_6> for signal <trg_cs>.
    -----------------------------------------------------------------------
    | States             | 4                                              |
    | Transitions        | 8                                              |
    | Inputs             | 4                                              |
    | Outputs            | 3                                              |
    | Clock              | clk (rising_edge)                              |
    | Reset              | reset (positive)                               |
    | Reset type         | synchronous                                    |
    | Reset State        | idles                                          |
    | Power Up State     | idles                                          |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found finite state machine <FSM_7> for signal <daq_fsm_cs_t>.
    -----------------------------------------------------------------------
    | States             | 6                                              |
    | Transitions        | 13                                             |
    | Inputs             | 6                                              |
    | Outputs            | 7                                              |
    | Clock              | clk (rising_edge)                              |
    | Reset              | reset (positive)                               |
    | Reset type         | synchronous                                    |
    | Reset State        | idles                                          |
    | Power Up State     | idles                                          |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found finite state machine <FSM_8> for signal <ll_fsm_cs_t>.
    -----------------------------------------------------------------------
    | States             | 3                                              |
    | Transitions        | 7                                              |
    | Inputs             | 4                                              |
    | Outputs            | 2                                              |
    | Clock              | clk (rising_edge)                              |
    | Reset              | reset (positive)                               |
    | Reset type         | synchronous                                    |
    | Reset State        | sofs                                           |
    | Power Up State     | sofs                                           |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found 8-bit adder for signal <missed_trg[7]_GND_487_o_add_15_OUT> created at line 532.
    Found 8-bit subtractor for signal <GND_487_o_GND_487_o_sub_17_OUT<7:0>> created at line 535.
    Found 16-bit subtractor for signal <GND_487_o_GND_487_o_sub_42_OUT<15:0>> created at line 662.
    Found 2-bit subtractor for signal <GND_487_o_GND_487_o_sub_46_OUT<1:0>> created at line 684.
    Found 2-bit subtractor for signal <GND_487_o_GND_487_o_sub_51_OUT<1:0>> created at line 706.
    Found 4-bit subtractor for signal <GND_487_o_GND_487_o_sub_56_OUT<3:0>> created at line 728.
    Found 11-bit subtractor for signal <GND_487_o_GND_487_o_sub_62_OUT<10:0>> created at line 755.
    Found 1-bit 3-to-1 multiplexer for signal <ll_fsm_cs_t[1]_X_156_o_Mux_67_o> created at line 772.
    Found 1-bit 3-to-1 multiplexer for signal <ll_fsm_cs_t[1]_X_156_o_Mux_69_o> created at line 772.
    Found 16-bit 4-to-1 multiplexer for signal <pdw_ctr[1]_addr[0]_wide_mux_73_OUT> created at line 830.
    WARNING:Xst:2404 -  FFs/Latches <tx_rem<0:0>> (without init value) have a constant value of 0 in block <daq_gen>.
    Summary:
	inferred   6 Adder/Subtractor(s).
	inferred  71 D-type flip-flop(s).
	inferred  11 Multiplexer(s).
	inferred   3 Finite State Machine(s).
Unit <daq_gen> synthesized.

Synthesizing Unit <run_ctrl>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\run_ctrl.vhd".
    Register <ctrl_regs<0>> equivalent to <data_q2> has been removed
    Found 16-bit register for signal <data_q0>.
    Found 16-bit register for signal <data_q1>.
    Found 16-bit register for signal <data_q2>.
    Found 1-bit register for signal <rx_dst_rdy_n>.
    Found 16-bit register for signal <ctrl_regs<1>>.
    Found 1-bit register for signal <intfc_bit>.
    Summary:
	inferred  66 D-type flip-flop(s).
Unit <run_ctrl> synthesized.

Synthesizing Unit <sfp_stat_ctrl>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\KLM_SCROD_baseline\klm_scrod\source\sfp_stat_ctrl.vhd".
        NUM_GTS = 1
    Found 1-bit register for signal <mod_flag>.
    Found 1-bit register for signal <los_flag>.
    Found 1-bit register for signal <fault_flag>.
    Summary:
	inferred   3 D-type flip-flop(s).
Unit <sfp_stat_ctrl> synthesized.

Synthesizing Unit <update_status_regs>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\update_status_regs.vhd".
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\update_status_regs.vhd" line 83: Output port <enOutput> of the instance <inst_mpc_adc> is unconnected or connected to loadless signal.
    Found 1-bit register for signal <busy>.
    Found 1-bit register for signal <busy_i>.
    Found 1-bit register for signal <runADC_i>.
    Found 3-bit register for signal <next_st>.
    Found 1-bit register for signal <ADC_reset>.
    Found 8-bit register for signal <curreg>.
    Found 32-bit register for signal <cnt>.
    Found 8-bit register for signal <AMUX>.
    Found 8-bit register for signal <curreg_i>.
    Found 16-bit register for signal <status_regs<159>>.
    Found 16-bit register for signal <status_regs<158>>.
    Found 16-bit register for signal <status_regs<157>>.
    Found 16-bit register for signal <status_regs<156>>.
    Found 16-bit register for signal <status_regs<155>>.
    Found 16-bit register for signal <status_regs<154>>.
    Found 16-bit register for signal <status_regs<153>>.
    Found 16-bit register for signal <status_regs<152>>.
    Found 16-bit register for signal <status_regs<151>>.
    Found 16-bit register for signal <status_regs<150>>.
    Found 16-bit register for signal <status_regs<149>>.
    Found 16-bit register for signal <status_regs<148>>.
    Found 16-bit register for signal <status_regs<147>>.
    Found 16-bit register for signal <status_regs<146>>.
    Found 16-bit register for signal <status_regs<145>>.
    Found 16-bit register for signal <status_regs<144>>.
    Found 16-bit register for signal <status_regs<143>>.
    Found 16-bit register for signal <status_regs<142>>.
    Found 16-bit register for signal <status_regs<141>>.
    Found 16-bit register for signal <status_regs<140>>.
    Found 16-bit register for signal <status_regs<139>>.
    Found 16-bit register for signal <status_regs<138>>.
    Found 16-bit register for signal <status_regs<137>>.
    Found 16-bit register for signal <status_regs<136>>.
    Found 16-bit register for signal <status_regs<135>>.
    Found 16-bit register for signal <status_regs<134>>.
    Found 16-bit register for signal <status_regs<133>>.
    Found 16-bit register for signal <status_regs<132>>.
    Found 16-bit register for signal <status_regs<131>>.
    Found 16-bit register for signal <status_regs<130>>.
    Found 16-bit register for signal <status_regs<129>>.
    Found 16-bit register for signal <status_regs<128>>.
    Found 16-bit register for signal <status_regs<127>>.
    Found 16-bit register for signal <status_regs<126>>.
    Found 16-bit register for signal <status_regs<125>>.
    Found 16-bit register for signal <status_regs<124>>.
    Found 16-bit register for signal <status_regs<123>>.
    Found 16-bit register for signal <status_regs<122>>.
    Found 16-bit register for signal <status_regs<121>>.
    Found 16-bit register for signal <status_regs<120>>.
    Found 16-bit register for signal <status_regs<119>>.
    Found 16-bit register for signal <status_regs<118>>.
    Found 16-bit register for signal <status_regs<117>>.
    Found 16-bit register for signal <status_regs<116>>.
    Found 16-bit register for signal <status_regs<115>>.
    Found 16-bit register for signal <status_regs<114>>.
    Found 16-bit register for signal <status_regs<113>>.
    Found 16-bit register for signal <status_regs<112>>.
    Found 16-bit register for signal <status_regs<111>>.
    Found 16-bit register for signal <status_regs<110>>.
    Found 16-bit register for signal <status_regs<109>>.
    Found 16-bit register for signal <status_regs<108>>.
    Found 16-bit register for signal <status_regs<107>>.
    Found 16-bit register for signal <status_regs<106>>.
    Found 16-bit register for signal <status_regs<105>>.
    Found 16-bit register for signal <status_regs<104>>.
    Found 16-bit register for signal <status_regs<103>>.
    Found 16-bit register for signal <status_regs<102>>.
    Found 16-bit register for signal <status_regs<101>>.
    Found 16-bit register for signal <status_regs<100>>.
    Found 16-bit register for signal <status_regs<99>>.
    Found 16-bit register for signal <status_regs<98>>.
    Found 16-bit register for signal <status_regs<97>>.
    Found 16-bit register for signal <status_regs<96>>.
    Found 16-bit register for signal <status_regs<95>>.
    Found 16-bit register for signal <status_regs<94>>.
    Found 16-bit register for signal <status_regs<93>>.
    Found 16-bit register for signal <status_regs<92>>.
    Found 16-bit register for signal <status_regs<91>>.
    Found 16-bit register for signal <status_regs<90>>.
    Found 16-bit register for signal <status_regs<89>>.
    Found 16-bit register for signal <status_regs<88>>.
    Found 16-bit register for signal <status_regs<87>>.
    Found 16-bit register for signal <status_regs<86>>.
    Found 16-bit register for signal <status_regs<85>>.
    Found 16-bit register for signal <status_regs<84>>.
    Found 16-bit register for signal <status_regs<83>>.
    Found 16-bit register for signal <status_regs<82>>.
    Found 16-bit register for signal <status_regs<81>>.
    Found 16-bit register for signal <status_regs<80>>.
    Found 16-bit register for signal <status_regs<79>>.
    Found 16-bit register for signal <status_regs<78>>.
    Found 16-bit register for signal <status_regs<77>>.
    Found 16-bit register for signal <status_regs<76>>.
    Found 16-bit register for signal <status_regs<75>>.
    Found 16-bit register for signal <status_regs<74>>.
    Found 16-bit register for signal <status_regs<73>>.
    Found 16-bit register for signal <status_regs<72>>.
    Found 16-bit register for signal <status_regs<71>>.
    Found 16-bit register for signal <status_regs<70>>.
    Found 16-bit register for signal <status_regs<69>>.
    Found 16-bit register for signal <status_regs<68>>.
    Found 16-bit register for signal <status_regs<67>>.
    Found 16-bit register for signal <status_regs<66>>.
    Found 16-bit register for signal <status_regs<65>>.
    Found 16-bit register for signal <status_regs<64>>.
    Found 16-bit register for signal <status_regs<63>>.
    Found 16-bit register for signal <status_regs<62>>.
    Found 16-bit register for signal <status_regs<61>>.
    Found 16-bit register for signal <status_regs<60>>.
    Found 16-bit register for signal <status_regs<59>>.
    Found 16-bit register for signal <status_regs<58>>.
    Found 16-bit register for signal <status_regs<57>>.
    Found 16-bit register for signal <status_regs<56>>.
    Found 16-bit register for signal <status_regs<55>>.
    Found 16-bit register for signal <status_regs<54>>.
    Found 16-bit register for signal <status_regs<53>>.
    Found 16-bit register for signal <status_regs<52>>.
    Found 16-bit register for signal <status_regs<51>>.
    Found 16-bit register for signal <status_regs<50>>.
    Found 16-bit register for signal <status_regs<49>>.
    Found 16-bit register for signal <status_regs<48>>.
    Found 16-bit register for signal <status_regs<47>>.
    Found 16-bit register for signal <status_regs<46>>.
    Found 16-bit register for signal <status_regs<45>>.
    Found 16-bit register for signal <status_regs<44>>.
    Found 16-bit register for signal <status_regs<43>>.
    Found 16-bit register for signal <status_regs<42>>.
    Found 16-bit register for signal <status_regs<41>>.
    Found 16-bit register for signal <status_regs<40>>.
    Found 16-bit register for signal <status_regs<39>>.
    Found 16-bit register for signal <status_regs<38>>.
    Found 16-bit register for signal <status_regs<37>>.
    Found 16-bit register for signal <status_regs<36>>.
    Found 16-bit register for signal <status_regs<35>>.
    Found 16-bit register for signal <status_regs<34>>.
    Found 16-bit register for signal <status_regs<33>>.
    Found 16-bit register for signal <status_regs<32>>.
    Found 16-bit register for signal <status_regs<31>>.
    Found 16-bit register for signal <status_regs<30>>.
    Found 16-bit register for signal <status_regs<29>>.
    Found 16-bit register for signal <status_regs<28>>.
    Found 16-bit register for signal <status_regs<27>>.
    Found 16-bit register for signal <status_regs<26>>.
    Found 16-bit register for signal <status_regs<25>>.
    Found 16-bit register for signal <status_regs<24>>.
    Found 16-bit register for signal <status_regs<23>>.
    Found 16-bit register for signal <status_regs<22>>.
    Found 16-bit register for signal <status_regs<21>>.
    Found 16-bit register for signal <status_regs<20>>.
    Found 16-bit register for signal <status_regs<19>>.
    Found 16-bit register for signal <status_regs<18>>.
    Found 16-bit register for signal <status_regs<17>>.
    Found 16-bit register for signal <status_regs<16>>.
    Found 16-bit register for signal <status_regs<15>>.
    Found 16-bit register for signal <status_regs<14>>.
    Found 16-bit register for signal <status_regs<13>>.
    Found 16-bit register for signal <status_regs<12>>.
    Found 16-bit register for signal <status_regs<11>>.
    Found 16-bit register for signal <status_regs<10>>.
    Found 16-bit register for signal <status_regs<9>>.
    Found 16-bit register for signal <status_regs<8>>.
    Found 16-bit register for signal <status_regs<7>>.
    Found 16-bit register for signal <status_regs<6>>.
    Found 16-bit register for signal <status_regs<5>>.
    Found 16-bit register for signal <status_regs<4>>.
    Found 16-bit register for signal <status_regs<3>>.
    Found 16-bit register for signal <status_regs<2>>.
    Found 16-bit register for signal <status_regs<1>>.
    Found 16-bit register for signal <status_regs<0>>.
    Found 2-bit register for signal <update_i>.
INFO:Xst:1799 - State waitsetmux is never reached in FSM <next_st>.
INFO:Xst:1799 - State waitreadadc is never reached in FSM <next_st>.
    Found finite state machine <FSM_9> for signal <next_st>.
    -----------------------------------------------------------------------
    | States             | 8                                              |
    | Transitions        | 11                                             |
    | Inputs             | 3                                              |
    | Outputs            | 5                                              |
    | Clock              | clk (rising_edge)                              |
    | Power Up State     | idle                                           |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found 32-bit adder for signal <cnt[31]_GND_490_o_add_13_OUT> created at line 152.
    Found 8-bit adder for signal <curreg[7]_GND_490_o_add_338_OUT> created at line 1241.
    Found 32-bit comparator greater for signal <GND_490_o_cnt[31]_LessThan_15_o> created at line 154
    Found 8-bit comparator greater for signal <curreg[7]_PWR_487_o_LessThan_340_o> created at line 164
    Summary:
	inferred   2 Adder/Subtractor(s).
	inferred 2622 D-type flip-flop(s).
	inferred   2 Comparator(s).
	inferred   8 Multiplexer(s).
	inferred   1 Finite State Machine(s).
Unit <update_status_regs> synthesized.

Synthesizing Unit <Module_ADC_MCP3221_I2C_new>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\peripherals\Module_ADC_MCP3221_I2C_new.vhd".
WARNING:Xst:653 - Signal <enOutput> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:2999 - Signal 'dataToWrite', unconnected in block 'Module_ADC_MCP3221_I2C_new', is tied to its initial value.
    Found 8x1-bit single-port Read Only RAM <Mram_dataToWrite> for signal <dataToWrite>.
    Found 1-bit register for signal <readyForNextState>.
    Found 2-bit register for signal <idxCyc>.
    Found 4-bit register for signal <idxBit>.
    Found 3-bit register for signal <state>.
    Found 16-bit register for signal <clkCounter>.
    Found 1-bit register for signal <i_runADC>.
    Found 8-bit register for signal <upperDataByte>.
    Found 1-bit register for signal <readUpperByte>.
    Found 8-bit register for signal <LowerDataByte>.
    Found 1-bit register for signal <scl>.
    Found 1-bit register for signal <state[2]_clkCounter[12]_DFF_1887_q>.
    Found 8-bit register for signal <dataToRead>.
    Found 1-bit register for signal <state[2]_clkCounter[12]_DFF_1888>.
    Found finite state machine <FSM_10> for signal <state>.
    -----------------------------------------------------------------------
    | States             | 8                                              |
    | Transitions        | 18                                             |
    | Inputs             | 3                                              |
    | Outputs            | 8                                              |
    | Clock              | clkCounter<12> (rising_edge)                   |
    | Reset              | reset (positive)                               |
    | Reset type         | asynchronous                                   |
    | Reset State        | st_idle                                        |
    | Power Up State     | st_idle                                        |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found 16-bit adder for signal <clkCounter[15]_GND_491_o_add_0_OUT> created at line 1241.
    Found 4-bit adder for signal <idxBit[3]_GND_491_o_add_75_OUT> created at line 1241.
    Found 2-bit adder for signal <idxCyc[1]_GND_491_o_add_147_OUT> created at line 1241.
    Found 3-bit subtractor for signal <GND_491_o_GND_491_o_sub_70_OUT<2:0>> created at line 1314.
    Found 1-bit 7-to-1 multiplexer for signal <state[2]_idxCyc[1]_Mux_174_o> created at line 223.
    Found 1-bit tristate buffer for signal <sda> created at line 143
    Found 4-bit comparator greater for signal <idxBit[3]_PWR_488_o_LessThan_66_o> created at line 240
    Summary:
	inferred   1 RAM(s).
	inferred   4 Adder/Subtractor(s).
	inferred  55 D-type flip-flop(s).
	inferred   1 Comparator(s).
	inferred  62 Multiplexer(s).
	inferred   1 Tristate(s).
	inferred   1 Finite State Machine(s).
Unit <Module_ADC_MCP3221_I2C_new> synthesized.

Synthesizing Unit <TARGETX_DAC_CONTROL>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\TARGETX_DAC_CONTROL.vhd".
        REGISTER_WIDTH = 19
    Found 1-bit register for signal <SIN>.
    Found 1-bit register for signal <SCLK>.
    Found 1-bit register for signal <PCLK>.
    Found 2-bit register for signal <UPDATE_REG>.
    Found 1-bit register for signal <SIN_i>.
    Found 1-bit register for signal <SCLK_i>.
    Found 1-bit register for signal <PCLK_i>.
    Found 32-bit register for signal <cnt>.
    Found 1-bit register for signal <busy>.
    Found 1-bit register for signal <ENABLE_COUNTER>.
    Found 5-bit register for signal <STATE>.
    Found 16-bit register for signal <INTERNAL_COUNTER>.
    Found finite state machine <FSM_12> for signal <STATE>.
    -----------------------------------------------------------------------
    | States             | 25                                             |
    | Transitions        | 38                                             |
    | Inputs             | 4                                              |
    | Outputs            | 9                                              |
    | Clock              | CLK (rising_edge)                              |
    | Power Up State     | idle                                           |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found 16-bit adder for signal <INTERNAL_COUNTER[15]_GND_495_o_add_0_OUT> created at line 1241.
    Found 32-bit adder for signal <cnt[31]_GND_495_o_add_17_OUT> created at line 209.
    Found 5-bit subtractor for signal <GND_495_o_cnt[31]_sub_10_OUT<4:0>> created at line 171.
    Found 1-bit 19-to-1 multiplexer for signal <GND_495_o_X_163_o_Mux_10_o> created at line 171.
    Found 32-bit comparator greater for signal <GND_495_o_cnt[31]_LessThan_9_o> created at line 169
    Found 16-bit comparator greater for signal <LOAD_PERIOD[15]_INTERNAL_COUNTER[15]_LessThan_19_o> created at line 220
    Found 16-bit comparator greater for signal <LATCH_PERIOD[15]_INTERNAL_COUNTER[15]_LessThan_33_o> created at line 346
    Summary:
	inferred   3 Adder/Subtractor(s).
	inferred  58 D-type flip-flop(s).
	inferred   3 Comparator(s).
	inferred   7 Multiplexer(s).
	inferred   1 Finite State Machine(s).
Unit <TARGETX_DAC_CONTROL> synthesized.

Synthesizing Unit <ReadoutControl>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\ReadoutControl.vhd".
WARNING:Xst:647 - Input <use_fixed_dig_start_win<14:9>> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
    Found 32-bit register for signal <internal_EVENT_NUM>.
    Found 1-bit register for signal <internal_SmpClk_DIG_IDLE_status>.
    Found 1-bit register for signal <internal_SmpClk_SROUT_IDLE_status>.
    Found 1-bit register for signal <internal_SmpClk_fifo_empty>.
    Found 1-bit register for signal <internal_SmpClk_EVTBUILD_DONE_SENDING_EVENT>.
    Found 1-bit register for signal <internal_SmpClk_READOUT_RESET>.
    Found 2-bit register for signal <internal_SmpClk_trigger_reg>.
    Found 1-bit register for signal <internal_SmpClk_LATCH_DONE>.
    Found 9-bit register for signal <internal_SmpClk_LATCH_SMP_MAIN_CNT>.
    Found 1-bit register for signal <next_SmpClk_state>.
    Found 1-bit register for signal <internal_LATCH_DONE>.
    Found 9-bit register for signal <internal_LATCH_SMP_MAIN_CNT>.
    Found 1-bit register for signal <internal_DIG_IDLE_status>.
    Found 1-bit register for signal <internal_SROUT_IDLE_status>.
    Found 1-bit register for signal <internal_EVTBUILD_DONE_SENDING_EVENT>.
    Found 12-bit register for signal <internal_trig_delay>.
    Found 9-bit register for signal <internal_dig_offset>.
    Found 9-bit register for signal <internal_win_num_to_read>.
    Found 10-bit register for signal <internal_ASIC_SROUT_ENABLE_BITS>.
    Found 1-bit register for signal <internal_READOUT_CONTINUE>.
    Found 1-bit register for signal <internal_busy_status>.
    Found 1-bit register for signal <internal_smp_stop>.
    Found 1-bit register for signal <internal_dig_start>.
    Found 1-bit register for signal <internal_srout_start>.
    Found 1-bit register for signal <internal_EVTBUILD_start>.
    Found 1-bit register for signal <internal_EVTBUILD_MAKE_READY>.
    Found 9-bit register for signal <internal_win_cnt>.
    Found 32-bit register for signal <internal_asic_cnt>.
    Found 1-bit register for signal <internal_READOUT_DONE>.
    Found 5-bit register for signal <next_trig_state>.
    Found 16-bit register for signal <INTERNAL_COUNTER>.
    Found 9-bit register for signal <internal_dig_win_start>.
    Found 9-bit register for signal <internal_SMP_MAIN_CNT>.
    Found 1-bit register for signal <internal_SmpClk_trigger>.
INFO:Xst:1799 - State wait_sampling_idle is never reached in FSM <next_trig_state>.
INFO:Xst:1799 - State wait_readout_continue_high is never reached in FSM <next_trig_state>.
INFO:Xst:1799 - State wait_readout_continue_low is never reached in FSM <next_trig_state>.
INFO:Xst:1799 - State start_evtbuild is never reached in FSM <next_trig_state>.
INFO:Xst:1799 - State wait_evtbuild_done is never reached in FSM <next_trig_state>.
INFO:Xst:1799 - State set_evtbuild_make_ready is never reached in FSM <next_trig_state>.
    Found finite state machine <FSM_13> for signal <next_trig_state>.
    -----------------------------------------------------------------------
    | States             | 20                                             |
    | Transitions        | 25                                             |
    | Inputs             | 10                                             |
    | Outputs            | 11                                             |
    | Clock              | clk (rising_edge)                              |
    | Power Up State     | idle                                           |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found 32-bit adder for signal <internal_EVENT_NUM[31]_GND_496_o_add_14_OUT> created at line 1241.
    Found 9-bit adder for signal <internal_LATCH_SMP_MAIN_CNT[8]_internal_win_cnt[8]_add_27_OUT> created at line 311.
    Found 9-bit adder for signal <internal_win_cnt[8]_GND_496_o_add_31_OUT> created at line 1241.
    Found 16-bit adder for signal <INTERNAL_COUNTER[15]_GND_496_o_add_35_OUT> created at line 1241.
    Found 32-bit adder for signal <internal_asic_cnt[31]_GND_496_o_add_42_OUT> created at line 382.
    Found 9-bit subtractor for signal <GND_496_o_GND_496_o_sub_29_OUT<8:0>> created at line 311.
    Found 9-bit subtractor for signal <GND_496_o_GND_496_o_sub_30_OUT<8:0>> created at line 312.
    Found 1-bit 10-to-1 multiplexer for signal <internal_asic_cnt[3]_X_164_o_Mux_43_o> created at line 383.
    Found 16-bit comparator greater for signal <INTERNAL_COUNTER[15]_GND_496_o_LessThan_23_o> created at line 284
    Found 9-bit comparator greater for signal <internal_win_cnt[8]_internal_win_num_to_read[8]_LessThan_31_o> created at line 314
    Found 16-bit comparator greater for signal <INTERNAL_COUNTER[15]_GND_496_o_LessThan_35_o> created at line 324
    Found 32-bit comparator greater for signal <GND_496_o_internal_asic_cnt[31]_LessThan_41_o> created at line 369
    WARNING:Xst:2404 -  FFs/Latches <internal_SmpClk_SMP_IDLE_status<0:0>> (without init value) have a constant value of 0 in block <ReadoutControl>.
    Summary:
	inferred   7 Adder/Subtractor(s).
	inferred 186 D-type flip-flop(s).
	inferred   4 Comparator(s).
	inferred  10 Multiplexer(s).
	inferred   1 Finite State Machine(s).
Unit <ReadoutControl> synthesized.

Synthesizing Unit <WaveformDemuxPedsubDSPBRAM>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\WaveformDemuxPedsubDSPBRAM.vhd".
WARNING:Xst:647 - Input <fifo_clk> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\WaveformDemuxPedsubDSPBRAM.vhd" line 225: Output port <ram_dataw> of the instance <Inst_PedRAMaccess> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\WaveformDemuxPedsubDSPBRAM.vhd" line 225: Output port <ram_rw> of the instance <Inst_PedRAMaccess> is unconnected or connected to loadless signal.
    Found 16x16-bit dual-port RAM <Mram_ct_lpv> for signal <ct_lpv>.
    Found 16x16-bit dual-port RAM <Mram_ct_lpt> for signal <ct_lpt>.
    Found 32-bit register for signal <fifo_din_i>.
    Found 1-bit register for signal <enable_i>.
    Found 5-bit register for signal <sr_start_i>.
    Found 32-bit register for signal <win_addr_start_i>.
    Found 32-bit register for signal <ped_asic>.
    Found 32-bit register for signal <ped_ch>.
    Found 32-bit register for signal <ped_win>.
    Found 32-bit register for signal <ped_sa>.
    Found 4-bit register for signal <next_ped_st>.
    Found 1-bit register for signal <ped_sub_fetch_busy>.
    Found 22-bit register for signal <ped_sa_num>.
    Found 1-bit register for signal <ped_sa_update>.
    Found 1-bit register for signal <ped_wea>.
    Found 11-bit register for signal <ped_arr_addr>.
    Found 11-bit register for signal <ped_bram_addra>.
    Found 16-bit register for signal <ped_dina>.
    Found 32-bit register for signal <fifo_din_i2>.
    Found 1-bit register for signal <dmx_allwin_busy>.
    Found 32-bit register for signal <dmx_win>.
    Found 5-bit register for signal <dmx2_sa>.
    Found 2-bit register for signal <dmx2_win>.
    Found 11-bit register for signal <jdx<15>>.
    Found 11-bit register for signal <jdx<14>>.
    Found 11-bit register for signal <jdx<13>>.
    Found 11-bit register for signal <jdx<12>>.
    Found 11-bit register for signal <jdx<11>>.
    Found 11-bit register for signal <jdx<10>>.
    Found 11-bit register for signal <jdx<9>>.
    Found 11-bit register for signal <jdx<8>>.
    Found 11-bit register for signal <jdx<7>>.
    Found 11-bit register for signal <jdx<6>>.
    Found 11-bit register for signal <jdx<5>>.
    Found 11-bit register for signal <jdx<4>>.
    Found 11-bit register for signal <jdx<3>>.
    Found 11-bit register for signal <jdx<2>>.
    Found 11-bit register for signal <jdx<1>>.
    Found 11-bit register for signal <jdx<0>>.
    Found 11-bit register for signal <jdx2<15>>.
    Found 11-bit register for signal <jdx2<14>>.
    Found 11-bit register for signal <jdx2<13>>.
    Found 11-bit register for signal <jdx2<12>>.
    Found 11-bit register for signal <jdx2<11>>.
    Found 11-bit register for signal <jdx2<10>>.
    Found 11-bit register for signal <jdx2<9>>.
    Found 11-bit register for signal <jdx2<8>>.
    Found 11-bit register for signal <jdx2<7>>.
    Found 11-bit register for signal <jdx2<6>>.
    Found 11-bit register for signal <jdx2<5>>.
    Found 11-bit register for signal <jdx2<4>>.
    Found 11-bit register for signal <jdx2<3>>.
    Found 11-bit register for signal <jdx2<2>>.
    Found 11-bit register for signal <jdx2<1>>.
    Found 11-bit register for signal <jdx2<0>>.
    Found 16-bit register for signal <dmx_wav<15>>.
    Found 16-bit register for signal <dmx_wav<14>>.
    Found 16-bit register for signal <dmx_wav<13>>.
    Found 16-bit register for signal <dmx_wav<12>>.
    Found 16-bit register for signal <dmx_wav<11>>.
    Found 16-bit register for signal <dmx_wav<10>>.
    Found 16-bit register for signal <dmx_wav<9>>.
    Found 16-bit register for signal <dmx_wav<8>>.
    Found 16-bit register for signal <dmx_wav<7>>.
    Found 16-bit register for signal <dmx_wav<6>>.
    Found 16-bit register for signal <dmx_wav<5>>.
    Found 16-bit register for signal <dmx_wav<4>>.
    Found 16-bit register for signal <dmx_wav<3>>.
    Found 16-bit register for signal <dmx_wav<2>>.
    Found 16-bit register for signal <dmx_wav<1>>.
    Found 16-bit register for signal <dmx_wav<0>>.
    Found 16-bit register for signal <pedarray_tmp2<15>>.
    Found 16-bit register for signal <pedarray_tmp2<14>>.
    Found 16-bit register for signal <pedarray_tmp2<13>>.
    Found 16-bit register for signal <pedarray_tmp2<12>>.
    Found 16-bit register for signal <pedarray_tmp2<11>>.
    Found 16-bit register for signal <pedarray_tmp2<10>>.
    Found 16-bit register for signal <pedarray_tmp2<9>>.
    Found 16-bit register for signal <pedarray_tmp2<8>>.
    Found 16-bit register for signal <pedarray_tmp2<7>>.
    Found 16-bit register for signal <pedarray_tmp2<6>>.
    Found 16-bit register for signal <pedarray_tmp2<5>>.
    Found 16-bit register for signal <pedarray_tmp2<4>>.
    Found 16-bit register for signal <pedarray_tmp2<3>>.
    Found 16-bit register for signal <pedarray_tmp2<2>>.
    Found 16-bit register for signal <pedarray_tmp2<1>>.
    Found 16-bit register for signal <pedarray_tmp2<0>>.
    Found 2-bit register for signal <ped_sub_start>.
    Found 32-bit register for signal <sa_cnt>.
    Found 1-bit register for signal <pswfifo_en>.
    Found 3-bit register for signal <pedsub_st>.
    Found 11-bit register for signal <wav_bram_addrb>.
    Found 11-bit register for signal <ped_bram_addrb>.
    Found 32-bit register for signal <ct_ch>.
    Found 7-bit register for signal <ct_sa>.
    Found 16-bit register for signal <sapedsub>.
    Found 16-bit register for signal <samem<2>>.
    Found 16-bit register for signal <samem<1>>.
    Found 16-bit register for signal <samem<0>>.
    Found 32-bit register for signal <pswfifo_d>.
    Found 32-bit register for signal <ct_cnt>.
    Found 2-bit register for signal <st_tmp2bram>.
    Found 11-bit register for signal <wav_bram_addra>.
    Found 16-bit register for signal <wav_dina>.
    Found 1-bit register for signal <wav_wea>.
    Found 1-bit register for signal <fifo_en_i>.
    Found 1-bit register for signal <tmp2bram_ctr<7>>.
    Found 1-bit register for signal <tmp2bram_ctr<6>>.
    Found 1-bit register for signal <tmp2bram_ctr<5>>.
    Found 1-bit register for signal <tmp2bram_ctr<4>>.
    Found 1-bit register for signal <tmp2bram_ctr<3>>.
    Found 1-bit register for signal <tmp2bram_ctr<2>>.
    Found 1-bit register for signal <tmp2bram_ctr<1>>.
    Found 1-bit register for signal <tmp2bram_ctr<0>>.
INFO:Xst:1799 - State pedsfetchpedvalwaitsram3 is never reached in FSM <next_ped_st>.
    Found finite state machine <FSM_14> for signal <next_ped_st>.
    -----------------------------------------------------------------------
    | States             | 11                                             |
    | Transitions        | 16                                             |
    | Inputs             | 6                                              |
    | Outputs            | 7                                              |
    | Clock              | clk (rising_edge)                              |
    | Power Up State     | pedsidle                                       |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
INFO:Xst:1799 - State pedsub_wait_tmp2bram is never reached in FSM <pedsub_st>.
    Found finite state machine <FSM_15> for signal <pedsub_st>.
    -----------------------------------------------------------------------
    | States             | 7                                              |
    | Transitions        | 10                                             |
    | Inputs             | 5                                              |
    | Outputs            | 4                                              |
    | Clock              | clk (rising_edge)                              |
    | Power Up State     | pedsub_idle                                    |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found finite state machine <FSM_16> for signal <st_tmp2bram>.
    -----------------------------------------------------------------------
    | States             | 3                                              |
    | Transitions        | 4                                              |
    | Inputs             | 1                                              |
    | Outputs            | 2                                              |
    | Clock              | clk (rising_edge)                              |
    | Power Up State     | st_tmp2bram_check_ctr                          |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found 32-bit adder for signal <n0840> created at line 318.
    Found 32-bit adder for signal <ped_sa[31]_GND_498_o_add_15_OUT> created at line 337.
    Found 11-bit adder for signal <ped_arr_addr[10]_GND_498_o_add_20_OUT> created at line 342.
    Found 32-bit adder for signal <ped_win[31]_GND_498_o_add_22_OUT> created at line 358.
    Found 32-bit adder for signal <ped_ch[31]_GND_498_o_add_27_OUT> created at line 367.
    Found 32-bit adder for signal <sa_cnt[31]_GND_498_o_add_325_OUT> created at line 569.
    Found 32-bit adder for signal <ct_cnt[31]_GND_498_o_add_333_OUT> created at line 589.
    Found 32-bit subtractor for signal <GND_498_o_win_addr_start_i[31]_sub_57_OUT<31:0>> created at line 409.
    Found 16-bit subtractor for signal <GND_498_o_GND_498_o_sub_313_OUT<15:0>> created at line 538.
    Found 8-bit subtractor for signal <GND_498_o_GND_498_o_sub_436_OUT<7:0>> created at line 618.
INFO:Xst:3019 - HDL ADVISOR - 256 flip-flops were inferred for signal <pedarray_tmp2>. You may be trying to describe a RAM in a way that is incompatible with block and distributed RAM resources available on Xilinx devices, or with a specific template that is not supported. Please review the Xilinx resources documentation and the XST user manual for coding guidelines. Taking advantage of RAM resources will lead to improved device usage and reduced synthesis time.
    Found 11-bit 16-to-1 multiplexer for signal <tmp2bram_ctr[3]_jdx2[15][10]_wide_mux_440_OUT> created at line 625.
    Found 16-bit 16-to-1 multiplexer for signal <tmp2bram_ctr[3]_pedarray_tmp2[15][15]_wide_mux_441_OUT> created at line 626.
    Found 11-bit 3-to-1 multiplexer for signal <st_tmp2bram[1]_X_165_o_wide_mux_445_OUT> created at line 608.
    Found 16-bit 3-to-1 multiplexer for signal <st_tmp2bram[1]_X_165_o_wide_mux_446_OUT> created at line 608.
    Found 1-bit 3-to-1 multiplexer for signal <st_tmp2bram[1]_X_165_o_wide_mux_447_OUT<0>> created at line 608.
    Found 32-bit comparator greater for signal <GND_498_o_ped_sa[31]_LessThan_22_o> created at line 354
    Found 32-bit comparator greater for signal <GND_498_o_ped_win[31]_LessThan_27_o> created at line 363
    Found 32-bit comparator greater for signal <GND_498_o_ped_ch[31]_LessThan_32_o> created at line 372
    Found 16-bit comparator greater for signal <samem[2][15]_samem[1][15]_LessThan_320_o> created at line 554
    Found 16-bit comparator lessequal for signal <n0567> created at line 554
    Found 16-bit comparator greater for signal <BUS_0007_samem[1][15]_LessThan_323_o> created at line 555
    Found 32-bit comparator greater for signal <sa_cnt[31]_GND_498_o_LessThan_327_o> created at line 570
    Found 32-bit comparator greater for signal <GND_498_o_ct_cnt[31]_LessThan_330_o> created at line 581
    Found 8-bit comparator lessequal for signal <n0689> created at line 624
    Summary:
	inferred   2 RAM(s).
	inferred  10 Adder/Subtractor(s).
	inferred 1458 D-type flip-flop(s).
	inferred   9 Comparator(s).
	inferred 282 Multiplexer(s).
	inferred   3 Finite State Machine(s).
Unit <WaveformDemuxPedsubDSPBRAM> synthesized.

Synthesizing Unit <PedRAMaccess>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\ise-project\PedRAMaccess.vhd".
WARNING:Xst:647 - Input <addr<0:0>> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:653 - Signal <addrarr<3>> is used but never assigned. This sourceless signal will be automatically connected to value GND.
    Found 1-bit register for signal <rw_i>.
    Found 12-bit register for signal <wval0_i>.
    Found 12-bit register for signal <wval1_i>.
    Found 21-bit register for signal <addr_i<21:1>>.
    Found 1-bit register for signal <ram_update>.
    Found 32-bit register for signal <idx>.
    Found 1-bit register for signal <busy>.
    Found 24-bit register for signal <wbytes>.
    Found 3-bit register for signal <st>.
    Found 22-bit register for signal <addrarr<2>>.
    Found 22-bit register for signal <addrarr<1>>.
    Found 22-bit register for signal <addrarr<0>>.
    Found 1-bit register for signal <ram_rw>.
    Found 8-bit register for signal <ram_dataw>.
    Found 22-bit register for signal <ram_addr>.
    Found 24-bit register for signal <rbytes>.
    Found 12-bit register for signal <rval0>.
    Found 12-bit register for signal <rval1>.
    Found 1-bit register for signal <updates_i<0>>.
    Found finite state machine <FSM_17> for signal <st>.
    -----------------------------------------------------------------------
    | States             | 8                                              |
    | Transitions        | 12                                             |
    | Inputs             | 4                                              |
    | Outputs            | 4                                              |
    | Clock              | clk (rising_edge)                              |
    | Power Up State     | idle                                           |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found 24-bit adder for signal <n0107> created at line 133.
    Found 24-bit adder for signal <n0109> created at line 134.
    Found 32-bit adder for signal <idx[31]_GND_499_o_add_32_OUT> created at line 163.
    Found 6-bit subtractor for signal <GND_499_o_idx[28]_sub_13_OUT<5:0>> created at line 142.
    Found 22x2-bit multiplier for signal <n0106> created at line 134.
    Found 22-bit 4-to-1 multiplexer for signal <idx[1]_addrarr[3][21]_wide_mux_25_OUT> created at line 143.
    Found 32-bit comparator greater for signal <GND_499_o_idx[31]_LessThan_32_o> created at line 162
    Summary:
	inferred   1 Multiplier(s).
	inferred   4 Adder/Subtractor(s).
	inferred 250 D-type flip-flop(s).
	inferred   1 Comparator(s).
	inferred  27 Multiplexer(s).
	inferred   1 Finite State Machine(s).
Unit <PedRAMaccess> synthesized.

Synthesizing Unit <WaveformDemuxCalcPedsBRAM>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\WaveformDemuxCalcPedsBRAM.vhd".
WARNING:Xst:647 - Input <asic_no> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <fifo_clk> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\WaveformDemuxCalcPedsBRAM.vhd" line 236: Output port <rval0> of the instance <Inst_PedRAMaccess> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\WaveformDemuxCalcPedsBRAM.vhd" line 236: Output port <rval1> of the instance <Inst_PedRAMaccess> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\WaveformDemuxCalcPedsBRAM.vhd" line 236: Output port <ram_rw> of the instance <Inst_PedRAMaccess> is unconnected or connected to loadless signal.
WARNING:Xst:653 - Signal <ped_sa_wval0> is used but never assigned. This sourceless signal will be automatically connected to value GND.
WARNING:Xst:653 - Signal <ped_sa_wval1> is used but never assigned. This sourceless signal will be automatically connected to value GND.
    Found 5-bit register for signal <trigin_i>.
    Found 32-bit register for signal <win_addr_start_i>.
    Found 1-bit register for signal <st_bram2tmp>.
    Found 32-bit register for signal <bram2tmp_ctr>.
    Found 11-bit register for signal <bram_addrb>.
    Found 1-bit register for signal <wea_0>.
    Found 16-bit register for signal <pedarray_tmp<15>>.
    Found 16-bit register for signal <pedarray_tmp<14>>.
    Found 16-bit register for signal <pedarray_tmp<13>>.
    Found 16-bit register for signal <pedarray_tmp<12>>.
    Found 16-bit register for signal <pedarray_tmp<11>>.
    Found 16-bit register for signal <pedarray_tmp<10>>.
    Found 16-bit register for signal <pedarray_tmp<9>>.
    Found 16-bit register for signal <pedarray_tmp<8>>.
    Found 16-bit register for signal <pedarray_tmp<7>>.
    Found 16-bit register for signal <pedarray_tmp<6>>.
    Found 16-bit register for signal <pedarray_tmp<5>>.
    Found 16-bit register for signal <pedarray_tmp<4>>.
    Found 16-bit register for signal <pedarray_tmp<3>>.
    Found 16-bit register for signal <pedarray_tmp<2>>.
    Found 16-bit register for signal <pedarray_tmp<1>>.
    Found 16-bit register for signal <pedarray_tmp<0>>.
    Found 1-bit register for signal <st_tmp2bram>.
    Found 32-bit register for signal <tmp2bram_ctr>.
    Found 11-bit register for signal <bram_addra>.
    Found 16-bit register for signal <dina>.
    Found 16-bit register for signal <ncnt>.
    Found 5-bit register for signal <dmx_st>.
    Found 32-bit register for signal <ncnt_i>.
    Found 32-bit register for signal <ncnt_int>.
    Found 1-bit register for signal <busy_i>.
    Found 4-bit register for signal <navg_i>.
    Found 32-bit register for signal <fifo_din_i>.
    Found 32-bit register for signal <dmx_asic>.
    Found 32-bit register for signal <dmx_win>.
    Found 5-bit register for signal <dmx2_sa>.
    Found 2-bit register for signal <dmx2_win>.
    Found 11-bit register for signal <jdx<15>>.
    Found 11-bit register for signal <jdx<14>>.
    Found 11-bit register for signal <jdx<13>>.
    Found 11-bit register for signal <jdx<12>>.
    Found 11-bit register for signal <jdx<11>>.
    Found 11-bit register for signal <jdx<10>>.
    Found 11-bit register for signal <jdx<9>>.
    Found 11-bit register for signal <jdx<8>>.
    Found 11-bit register for signal <jdx<7>>.
    Found 11-bit register for signal <jdx<6>>.
    Found 11-bit register for signal <jdx<5>>.
    Found 11-bit register for signal <jdx<4>>.
    Found 11-bit register for signal <jdx<3>>.
    Found 11-bit register for signal <jdx<2>>.
    Found 11-bit register for signal <jdx<1>>.
    Found 11-bit register for signal <jdx<0>>.
    Found 11-bit register for signal <jdx2<15>>.
    Found 11-bit register for signal <jdx2<14>>.
    Found 11-bit register for signal <jdx2<13>>.
    Found 11-bit register for signal <jdx2<12>>.
    Found 11-bit register for signal <jdx2<11>>.
    Found 11-bit register for signal <jdx2<10>>.
    Found 11-bit register for signal <jdx2<9>>.
    Found 11-bit register for signal <jdx2<8>>.
    Found 11-bit register for signal <jdx2<7>>.
    Found 11-bit register for signal <jdx2<6>>.
    Found 11-bit register for signal <jdx2<5>>.
    Found 11-bit register for signal <jdx2<4>>.
    Found 11-bit register for signal <jdx2<3>>.
    Found 11-bit register for signal <jdx2<2>>.
    Found 11-bit register for signal <jdx2<1>>.
    Found 11-bit register for signal <jdx2<0>>.
    Found 16-bit register for signal <dmx_wav<15>>.
    Found 16-bit register for signal <dmx_wav<14>>.
    Found 16-bit register for signal <dmx_wav<13>>.
    Found 16-bit register for signal <dmx_wav<12>>.
    Found 16-bit register for signal <dmx_wav<11>>.
    Found 16-bit register for signal <dmx_wav<10>>.
    Found 16-bit register for signal <dmx_wav<9>>.
    Found 16-bit register for signal <dmx_wav<8>>.
    Found 16-bit register for signal <dmx_wav<7>>.
    Found 16-bit register for signal <dmx_wav<6>>.
    Found 16-bit register for signal <dmx_wav<5>>.
    Found 16-bit register for signal <dmx_wav<4>>.
    Found 16-bit register for signal <dmx_wav<3>>.
    Found 16-bit register for signal <dmx_wav<2>>.
    Found 16-bit register for signal <dmx_wav<1>>.
    Found 16-bit register for signal <dmx_wav<0>>.
    Found 16-bit register for signal <pedarray_tmp2<15>>.
    Found 16-bit register for signal <pedarray_tmp2<14>>.
    Found 16-bit register for signal <pedarray_tmp2<13>>.
    Found 16-bit register for signal <pedarray_tmp2<12>>.
    Found 16-bit register for signal <pedarray_tmp2<11>>.
    Found 16-bit register for signal <pedarray_tmp2<10>>.
    Found 16-bit register for signal <pedarray_tmp2<9>>.
    Found 16-bit register for signal <pedarray_tmp2<8>>.
    Found 16-bit register for signal <pedarray_tmp2<7>>.
    Found 16-bit register for signal <pedarray_tmp2<6>>.
    Found 16-bit register for signal <pedarray_tmp2<5>>.
    Found 16-bit register for signal <pedarray_tmp2<4>>.
    Found 16-bit register for signal <pedarray_tmp2<3>>.
    Found 16-bit register for signal <pedarray_tmp2<2>>.
    Found 16-bit register for signal <pedarray_tmp2<1>>.
    Found 16-bit register for signal <pedarray_tmp2<0>>.
    Found 32-bit register for signal <ped_ch>.
    Found 32-bit register for signal <ped_win>.
    Found 32-bit register for signal <ped_sa>.
    Found 22-bit register for signal <ped_sa_num>.
    Found 11-bit register for signal <ped_arr_addr>.
    Found 1-bit register for signal <ped_sa_update>.
    Found 2-bit register for signal <reset_i>.
INFO:Xst:1799 - State pedswrpedval is never reached in FSM <dmx_st>.
    Found finite state machine <FSM_18> for signal <dmx_st>.
    -----------------------------------------------------------------------
    | States             | 22                                             |
    | Transitions        | 31                                             |
    | Inputs             | 9                                              |
    | Outputs            | 7                                              |
    | Clock              | clk (rising_edge)                              |
    | Power Up State     | idle                                           |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found 16-bit adder for signal <dmx_wav[0][15]_pedarray_tmp[0][15]_add_238_OUT> created at line 495.
    Found 16-bit adder for signal <dmx_wav[1][15]_pedarray_tmp[1][15]_add_239_OUT> created at line 496.
    Found 16-bit adder for signal <dmx_wav[2][15]_pedarray_tmp[2][15]_add_240_OUT> created at line 497.
    Found 16-bit adder for signal <dmx_wav[3][15]_pedarray_tmp[3][15]_add_241_OUT> created at line 498.
    Found 16-bit adder for signal <dmx_wav[4][15]_pedarray_tmp[4][15]_add_242_OUT> created at line 499.
    Found 16-bit adder for signal <dmx_wav[5][15]_pedarray_tmp[5][15]_add_243_OUT> created at line 500.
    Found 16-bit adder for signal <dmx_wav[6][15]_pedarray_tmp[6][15]_add_244_OUT> created at line 501.
    Found 16-bit adder for signal <dmx_wav[7][15]_pedarray_tmp[7][15]_add_245_OUT> created at line 502.
    Found 16-bit adder for signal <dmx_wav[8][15]_pedarray_tmp[8][15]_add_246_OUT> created at line 503.
    Found 16-bit adder for signal <dmx_wav[9][15]_pedarray_tmp[9][15]_add_247_OUT> created at line 504.
    Found 16-bit adder for signal <dmx_wav[10][15]_pedarray_tmp[10][15]_add_248_OUT> created at line 505.
    Found 16-bit adder for signal <dmx_wav[11][15]_pedarray_tmp[11][15]_add_249_OUT> created at line 506.
    Found 16-bit adder for signal <dmx_wav[12][15]_pedarray_tmp[12][15]_add_250_OUT> created at line 507.
    Found 16-bit adder for signal <dmx_wav[13][15]_pedarray_tmp[13][15]_add_251_OUT> created at line 508.
    Found 16-bit adder for signal <dmx_wav[14][15]_pedarray_tmp[14][15]_add_252_OUT> created at line 509.
    Found 16-bit adder for signal <dmx_wav[15][15]_pedarray_tmp[15][15]_add_253_OUT> created at line 510.
    Found 32-bit adder for signal <n1270> created at line 563.
    Found 11-bit adder for signal <ped_arr_addr[10]_GND_527_o_add_389_OUT> created at line 586.
    Found 32-bit adder for signal <ped_sa[31]_GND_527_o_add_404_OUT> created at line 610.
    Found 32-bit adder for signal <ped_win[31]_GND_527_o_add_408_OUT> created at line 619.
    Found 32-bit adder for signal <ped_ch[31]_GND_527_o_add_413_OUT> created at line 628.
    Found 32-bit subtractor for signal <bram2tmp_ctr[31]_GND_527_o_sub_9_OUT<31:0>> created at line 325.
    Found 32-bit subtractor for signal <tmp2bram_ctr[31]_GND_527_o_sub_52_OUT<31:0>> created at line 344.
    Found 32-bit subtractor for signal <ncnt_i[31]_GND_527_o_sub_76_OUT<31:0>> created at line 404.
    Found 32-bit subtractor for signal <GND_527_o_win_addr_start_i[31]_sub_79_OUT<31:0>> created at line 411.
    Found 4-bit subtractor for signal <dmx_asic[31]_GND_527_o_sub_372_OUT<3:0>> created at line 561.
INFO:Xst:3019 - HDL ADVISOR - 256 flip-flops were inferred for signal <pedarray_tmp2>. You may be trying to describe a RAM in a way that is incompatible with block and distributed RAM resources available on Xilinx devices, or with a specific template that is not supported. Please review the Xilinx resources documentation and the XST user manual for coding guidelines. Taking advantage of RAM resources will lead to improved device usage and reduced synthesis time.
    Found 11-bit 16-to-1 multiplexer for signal <bram2tmp_ctr[31]_jdx[15][10]_wide_mux_10_OUT> created at line 326.
    Found 11-bit 16-to-1 multiplexer for signal <tmp2bram_ctr[31]_jdx2[15][10]_wide_mux_53_OUT> created at line 345.
    Found 16-bit 16-to-1 multiplexer for signal <tmp2bram_ctr[31]_pedarray_tmp2[15][15]_wide_mux_55_OUT> created at line 346.
    Found 32-bit comparator equal for signal <ncnt_int[31]_ncnt_i[31]_equal_238_o> created at line 475
    Found 32-bit comparator greater for signal <GND_527_o_ped_sa[31]_LessThan_408_o> created at line 615
    Found 32-bit comparator greater for signal <GND_527_o_ped_win[31]_LessThan_413_o> created at line 624
    Summary:
	inferred  26 Adder/Subtractor(s).
	inferred 1582 D-type flip-flop(s).
	inferred   3 Comparator(s).
	inferred 321 Multiplexer(s).
	inferred   1 Finite State Machine(s).
Unit <WaveformDemuxCalcPedsBRAM> synthesized.

Synthesizing Unit <SamplingLgc>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\SamplingLgc.vhd".
    Found 2-bit register for signal <clk_cntr>.
    Found 1-bit register for signal <sstin>.
    Found 2-bit register for signal <next_state>.
    Found 1-bit register for signal <wr_ena>.
    Found 1-bit register for signal <wr_addrclr>.
    Found 32-bit register for signal <started_cntr>.
    Found 9-bit register for signal <MAIN_CNT>.
    Found 1-bit register for signal <reset_i>.
INFO:Xst:1799 - State freerun is never reached in FSM <next_state>.
    Found finite state machine <FSM_19> for signal <next_state>.
    -----------------------------------------------------------------------
    | States             | 3                                              |
    | Transitions        | 6                                              |
    | Inputs             | 3                                              |
    | Outputs            | 1                                              |
    | Clock              | clk (rising_edge)                              |
    | Reset              | next_state<1> (positive)                       |
    | Reset type         | synchronous                                    |
    | Reset State        | resetting                                      |
    | Power Up State     | resetting                                      |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found 2-bit adder for signal <clk_cntr[1]_GND_536_o_add_6_OUT> created at line 1241.
    Found 32-bit adder for signal <started_cntr[31]_GND_536_o_add_8_OUT> created at line 122.
    Found 9-bit adder for signal <MAIN_CNT[8]_GND_536_o_add_16_OUT> created at line 1241.
    Found 9-bit 3-to-1 multiplexer for signal <next_state[1]_GND_536_o_wide_mux_21_OUT> created at line 116.
    Summary:
	inferred   3 Adder/Subtractor(s).
	inferred  47 D-type flip-flop(s).
	inferred   6 Multiplexer(s).
	inferred   1 Finite State Machine(s).
Unit <SamplingLgc> synthesized.

Synthesizing Unit <DigitizingLgcTX>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\DigitizingLgcTX.vhd".
    Found 1-bit register for signal <clr_out>.
    Found 1-bit register for signal <rd_ena_out>.
    Found 1-bit register for signal <startramp_out>.
    Found 13-bit register for signal <RAMP_CNT>.
    Found 1-bit register for signal <internal_IDLE_status>.
    Found 3-bit register for signal <next_state>.
    Found 1-bit register for signal <StartDig_in>.
INFO:Xst:1799 - State clrstate is never reached in FSM <next_state>.
    Found finite state machine <FSM_20> for signal <next_state>.
    -----------------------------------------------------------------------
    | States             | 6                                              |
    | Transitions        | 10                                             |
    | Inputs             | 4                                              |
    | Outputs            | 7                                              |
    | Clock              | clk (rising_edge)                              |
    | Power Up State     | idle                                           |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found 13-bit adder for signal <RAMP_CNT[12]_GND_537_o_add_12_OUT> created at line 149.
    Found 13-bit comparator greater for signal <RAMP_CNT[12]_ramp_start[12]_LessThan_4_o> created at line 124
    Found 13-bit comparator greater for signal <RAMP_CNT[12]_RDEN_LENGTH[12]_LessThan_8_o> created at line 136
    Found 13-bit comparator greater for signal <RAMP_CNT[12]_ramp_length[12]_LessThan_12_o> created at line 148
    Summary:
	inferred   1 Adder/Subtractor(s).
	inferred  18 D-type flip-flop(s).
	inferred   3 Comparator(s).
	inferred   7 Multiplexer(s).
	inferred   1 Finite State Machine(s).
Unit <DigitizingLgcTX> synthesized.

Synthesizing Unit <SerialDataRout>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\SerialDataRout.vhd".
WARNING:Xst:647 - Input <EVENT_NUM> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
    Found 1-bit register for signal <internal_start>.
    Found 2-bit register for signal <internal_start_reg>.
    Found 1-bit register for signal <internal_busy>.
    Found 6-bit register for signal <internal_samplesel>.
    Found 1-bit register for signal <internal_start_srout>.
    Found 1-bit register for signal <internal_idle>.
    Found 3-bit register for signal <next_overall>.
    Found 1-bit register for signal <sr_clk_i>.
    Found 1-bit register for signal <sr_sel>.
    Found 1-bit register for signal <SAMP_DONE_out>.
    Found 5-bit register for signal <Ev_CNT>.
    Found 5-bit register for signal <BIT_CNT>.
    Found 1-bit register for signal <smplsi_any>.
    Found 1-bit register for signal <fifo_wr_en>.
    Found 1-bit register for signal <internal_srout_busy>.
    Found 32-bit register for signal <internal_fifo_wr_din>.
    Found 4-bit register for signal <next_state>.
    Found finite state machine <FSM_21> for signal <next_overall>.
    -----------------------------------------------------------------------
    | States             | 5                                              |
    | Transitions        | 10                                             |
    | Inputs             | 3                                              |
    | Outputs            | 6                                              |
    | Clock              | clk (rising_edge)                              |
    | Power Up State     | idle                                           |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
INFO:Xst:1799 - State loadheader2 is never reached in FSM <next_state>.
INFO:Xst:1799 - State waitload1a is never reached in FSM <next_state>.
    Found finite state machine <FSM_22> for signal <next_state>.
    -----------------------------------------------------------------------
    | States             | 16                                             |
    | Transitions        | 23                                             |
    | Inputs             | 3                                              |
    | Outputs            | 8                                              |
    | Clock              | clk (rising_edge)                              |
    | Power Up State     | idle                                           |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found 6-bit adder for signal <internal_samplesel[5]_GND_538_o_add_9_OUT> created at line 182.
    Found 5-bit adder for signal <Ev_CNT[4]_GND_538_o_add_47_OUT> created at line 371.
    Found 5-bit adder for signal <BIT_CNT[4]_GND_538_o_add_50_OUT> created at line 394.
    Found 6-bit comparator greater for signal <n0013> created at line 161
    Found 5-bit comparator greater for signal <Ev_CNT[4]_GND_538_o_LessThan_33_o> created at line 298
    Found 5-bit comparator greater for signal <BIT_CNT[4]_GND_538_o_LessThan_41_o> created at line 332
    WARNING:Xst:2404 -  FFs/Latches <sr_clr<0:0>> (without init value) have a constant value of 0 in block <SerialDataRout>.
    Summary:
	inferred   3 Adder/Subtractor(s).
	inferred  60 D-type flip-flop(s).
	inferred   3 Comparator(s).
	inferred  28 Multiplexer(s).
	inferred   2 Finite State Machine(s).
Unit <SerialDataRout> synthesized.

Synthesizing Unit <OutputBufferControl>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\OutputBufferControl.vhd".
WARNING:Xst:647 - Input <WAVEFORM_FIFO_DATA_VALID> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
    Found 1-bit register for signal <internal_EVTBUILD_DONE>.
    Found 2-bit register for signal <internal_REQUEST_PACKET_reg>.
    Found 1-bit register for signal <WAVEFORM_FIFO_READ_ENABLE>.
    Found 1-bit register for signal <BUFFER_FIFO_WR_EN>.
    Found 1-bit register for signal <EVTBUILD_START>.
    Found 1-bit register for signal <EVTBUILD_MAKE_READY>.
    Found 16-bit register for signal <INTERNAL_COUNTER>.
    Found 3-bit register for signal <next_state>.
    Found 1-bit register for signal <internal_REQUEST_PACKET>.
    Found finite state machine <FSM_23> for signal <next_state>.
    -----------------------------------------------------------------------
    | States             | 7                                              |
    | Transitions        | 11                                             |
    | Inputs             | 4                                              |
    | Outputs            | 6                                              |
    | Clock              | clk (rising_edge)                              |
    | Power Up State     | idle                                           |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found 16-bit adder for signal <INTERNAL_COUNTER[15]_GND_541_o_add_7_OUT> created at line 1241.
    Found 16-bit comparator lessequal for signal <n0012> created at line 137
    Summary:
	inferred   1 Adder/Subtractor(s).
	inferred  24 D-type flip-flop(s).
	inferred   1 Comparator(s).
	inferred   4 Multiplexer(s).
	inferred   1 Finite State Machine(s).
Unit <OutputBufferControl> synthesized.

Synthesizing Unit <event_builder>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\asic_interfaces\event_builder.vhd".
    Found 8-bit register for signal <internal_PACKET_COUNTER>.
    Found 32-bit register for signal <internal_CHECKSUM>.
    Found 2-bit register for signal <internal_START_BUILDING_EVENT_REG>.
    Found 3-bit register for signal <internal_EVENT_BUILDER_STATE>.
    Found finite state machine <FSM_24> for signal <internal_EVENT_BUILDER_STATE>.
    -----------------------------------------------------------------------
    | States             | 5                                              |
    | Transitions        | 10                                             |
    | Inputs             | 5                                              |
    | Outputs            | 4                                              |
    | Clock              | READ_CLOCK (rising_edge)                       |
    | Power Up State     | idle                                           |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found 8-bit adder for signal <internal_PACKET_COUNTER[7]_GND_543_o_add_12_OUT> created at line 1241.
    Found 32-bit adder for signal <internal_CHECKSUM[31]_internal_EVENT_HEADER_DATA[31]_add_39_OUT> created at line 183.
    Found 8-bit comparator greater for signal <internal_EVENT_HEADER_DATA_VALID> created at line 156
    Summary:
	inferred   2 Adder/Subtractor(s).
	inferred  42 D-type flip-flop(s).
	inferred   1 Comparator(s).
	inferred  12 Multiplexer(s).
	inferred   1 Finite State Machine(s).
Unit <event_builder> synthesized.

Synthesizing Unit <trigger_scaler_single_channel_w_timing_gen>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\asic_interfaces\trigger_scalers.vhd".
WARNING:Xst:647 - Input <READ_ENABLE_IN> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
WARNING:Xst:647 - Input <RESET_COUNTER> is never used. This port will be preserved and left unconnected if it belongs to a top-level block or it belongs to a sub-block and the hierarchy of this sub-block is preserved.
    Summary:
	no macro.
Unit <trigger_scaler_single_channel_w_timing_gen> synthesized.

Synthesizing Unit <trigger_scaler_single_channel>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\asic_interfaces\trigger_scalers.vhd".
    Found 16-bit register for signal <internal_COUNTER_OUT>.
    Found 16-bit register for signal <internal_COUNTER>.
    Found 16-bit adder for signal <internal_COUNTER[15]_GND_623_o_add_1_OUT> created at line 1241.
    Summary:
	inferred   1 Adder/Subtractor(s).
	inferred  32 D-type flip-flop(s).
Unit <trigger_scaler_single_channel> synthesized.

Synthesizing Unit <edge_to_pulse_converter>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\utilities\edge_to_pulse_converter.vhd".
    Found 1-bit register for signal <output0>.
    Found 1-bit register for signal <output1>.
    Found 1-bit register for signal <output2>.
    Summary:
	inferred   3 D-type flip-flop(s).
Unit <edge_to_pulse_converter> synthesized.

Synthesizing Unit <trigger_scaler_timing_generator>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\asic_interfaces\trigger_scalers.vhd".
    Found 1-bit register for signal <internal_COUNTER_RESET>.
    Found 1-bit register for signal <internal_ENABLE_OUT_DELAY>.
    Found 25-bit register for signal <internal_COUNTER>.
    Found 25-bit adder for signal <internal_COUNTER[24]_GND_625_o_add_0_OUT> created at line 1241.
    Summary:
	inferred   1 Adder/Subtractor(s).
	inferred  27 D-type flip-flop(s).
Unit <trigger_scaler_timing_generator> synthesized.

Synthesizing Unit <mppc_dacs>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\mppc_dacs.vhd".
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\mppc_dacs.vhd" line 51: Output port <OUT_FALLING> of the instance <inst_write_edge> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\mppc_dacs.vhd" line 72: Output port <UPDATE_MPPCDAC_DONE> of the instance <inst_dac_controller> is unconnected or connected to loadless signal.
    Found 4-bit register for signal <i_dac_number>.
    Found 4-bit register for signal <i_dac_addr>.
    Found 8-bit register for signal <i_dac_value>.
    Found 1-bit register for signal <i_write_I>.
    Found 16x10-bit Read Only RAM for signal <i_dac_mask>
    Summary:
	inferred   1 RAM(s).
	inferred  17 D-type flip-flop(s).
Unit <mppc_dacs> synthesized.

Synthesizing Unit <TDC_MPPC_DAC>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\TDC_MPPC_DAC.vhd".
        MPPC_DACs_VALUE_WIDTH = 32
WARNING:Xst:2935 - Signal 'SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<31:30>', unconnected in block 'TDC_MPPC_DAC', is tied to its initial value (00).
WARNING:Xst:2935 - Signal 'SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<15:14>', unconnected in block 'TDC_MPPC_DAC', is tied to its initial value (00).
    Found 1-bit register for signal <DIN_DAC>.
    Found 1-bit register for signal <CS_DAC>.
    Found 6-bit register for signal <SERIAL_CONFIG_MPPC_DAC.bit_counter>.
    Found 1-bit register for signal <UPDATE_MPPCDAC_DONE>.
    Found 2-bit register for signal <state>.
    Found 2-bit register for signal <UPDATE_DACs_STATE>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<29>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<28>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<27>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<26>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<25>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<24>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<23>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<22>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<21>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<20>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<19>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<18>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<17>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<16>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<13>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<12>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<11>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<10>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<9>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<8>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<7>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<6>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<5>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<4>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<3>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<2>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<1>>.
    Found 1-bit register for signal <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data<0>>.
    Found 1-bit register for signal <SCK_DAC>.
    Found finite state machine <FSM_25> for signal <state>.
    -----------------------------------------------------------------------
    | States             | 4                                              |
    | Transitions        | 7                                              |
    | Inputs             | 2                                              |
    | Outputs            | 3                                              |
    | Clock              | CLK (rising_edge)                              |
    | Power Up State     | idle                                           |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found finite state machine <FSM_26> for signal <UPDATE_DACs_STATE>.
    -----------------------------------------------------------------------
    | States             | 4                                              |
    | Transitions        | 19                                             |
    | Inputs             | 4                                              |
    | Outputs            | 3                                              |
    | Clock              | CLK (rising_edge)                              |
    | Power Up State     | set_update_mode                                |
    | Encoding           | auto                                           |
    | Implementation     | LUT                                            |
    -----------------------------------------------------------------------
    Found 6-bit adder for signal <SERIAL_CONFIG_MPPC_DAC.bit_counter[5]_GND_627_o_add_8_OUT> created at line 155.
    Found 5-bit subtractor for signal <GND_627_o_GND_627_o_sub_7_OUT<4:0>> created at line 150.
    Found 1-bit 30-to-1 multiplexer for signal <GND_627_o_SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data[31]_Mux_7_o> created at line 150.
    Found 6-bit comparator greater for signal <SERIAL_CONFIG_MPPC_DAC.bit_counter[5]_PWR_532_o_LessThan_3_o> created at line 116
    Found 4-bit comparator greater for signal <ADDR_MPPC_DAC[3]_GND_627_o_MUX_3161_o> created at line 127
    Summary:
	inferred   2 Adder/Subtractor(s).
	inferred  38 D-type flip-flop(s).
	inferred   2 Comparator(s).
	inferred   8 Multiplexer(s).
	inferred   2 Finite State Machine(s).
Unit <TDC_MPPC_DAC> synthesized.

Synthesizing Unit <pulse_transition>.
    Related source file is "C:\Users\isar\Documents\code4\TX9UMB-3\src\pulse_transition.vhd".
        CLOCK_RATIO = 20
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\pulse_transition.vhd" line 47: Output port <OUT_FALLING> of the instance <inst_input_edge> is unconnected or connected to loadless signal.
INFO:Xst:3210 - "C:\Users\isar\Documents\code4\TX9UMB-3\src\pulse_transition.vhd" line 84: Output port <OUT_FALLING> of the instance <inst_ouput_edge> is unconnected or connected to loadless signal.
    Found 1-bit register for signal <i_extended>.
    Found 1-bit register for signal <i_state>.
    Found 1-bit register for signal <i_extended_slow<0>>.
    Found 1-bit register for signal <i_extended_slow<1>>.
    Found 32-bit register for signal <i_counter>.
    Found 32-bit adder for signal <i_counter[31]_GND_629_o_add_0_OUT> created at line 68.
    Summary:
	inferred   1 Adder/Subtractor(s).
	inferred  36 D-type flip-flop(s).
	inferred   1 Multiplexer(s).
Unit <pulse_transition> synthesized.

=========================================================================
HDL Synthesis Report

Macro Statistics
# RAMs                                                 : 34
 16x10-bit single-port Read Only RAM                   : 2
 16x16-bit dual-port RAM                               : 2
 32x1-bit single-port Read Only RAM                    : 9
 32x4-bit single-port Read Only RAM                    : 9
 32x5-bit single-port Read Only RAM                    : 1
 4x13-bit dual-port RAM                                : 10
 8x1-bit single-port Read Only RAM                     : 1
# Multipliers                                          : 2
 22x2-bit multiplier                                   : 2
# Adders/Subtractors                                   : 231
 1-bit adder                                           : 1
 10-bit adder                                          : 15
 10-bit subtractor                                     : 4
 11-bit adder                                          : 4
 11-bit subtractor                                     : 1
 12-bit adder                                          : 1
 13-bit adder                                          : 1
 16-bit adder                                          : 35
 16-bit subtractor                                     : 2
 2-bit adder                                           : 22
 2-bit addsub                                          : 11
 2-bit subtractor                                      : 3
 20-bit adder                                          : 1
 24-bit adder                                          : 4
 25-bit adder                                          : 10
 27-bit adder                                          : 2
 27-bit subtractor                                     : 1
 3-bit adder                                           : 2
 3-bit subtractor                                      : 3
 32-bit adder                                          : 43
 32-bit subtractor                                     : 6
 4-bit adder                                           : 3
 4-bit subtractor                                      : 4
 5-bit adder                                           : 5
 5-bit subtractor                                      : 3
 6-bit adder                                           : 3
 6-bit subtractor                                      : 3
 7-bit subtractor                                      : 2
 8-bit adder                                           : 18
 8-bit addsub                                          : 1
 8-bit subtractor                                      : 1
 9-bit adder                                           : 14
 9-bit subtractor                                      : 2
# Registers                                            : 1605
 1-bit register                                        : 541
 10-bit register                                       : 25
 11-bit register                                       : 74
 112-bit register                                      : 2
 12-bit register                                       : 7
 13-bit register                                       : 31
 15-bit register                                       : 1
 16-bit register                                       : 560
 17-bit register                                       : 1
 18-bit register                                       : 2
 2-bit register                                        : 77
 20-bit register                                       : 2
 21-bit register                                       : 2
 22-bit register                                       : 18
 23-bit register                                       : 1
 24-bit register                                       : 8
 25-bit register                                       : 10
 256-bit register                                      : 1
 27-bit register                                       : 2
 3-bit register                                        : 10
 32-bit register                                       : 65
 340-bit register                                      : 2
 4-bit register                                        : 36
 40-bit register                                       : 1
 5-bit register                                        : 22
 6-bit register                                        : 8
 7-bit register                                        : 3
 77-bit register                                       : 2
 8-bit register                                        : 55
 9-bit register                                        : 33
 96-bit register                                       : 3
# Latches                                              : 36
 1-bit latch                                           : 36
# Comparators                                          : 91
 10-bit comparator equal                               : 2
 10-bit comparator greater                             : 5
 10-bit comparator lessequal                           : 4
 13-bit comparator greater                             : 3
 16-bit comparator greater                             : 6
 16-bit comparator lessequal                           : 2
 16-bit comparator not equal                           : 1
 17-bit comparator not equal                           : 1
 2-bit comparator equal                                : 1
 2-bit comparator greater                              : 10
 20-bit comparator equal                               : 1
 27-bit comparator equal                               : 1
 27-bit comparator not equal                           : 1
 3-bit comparator equal                                : 1
 3-bit comparator greater                              : 1
 3-bit comparator lessequal                            : 1
 32-bit comparator equal                               : 2
 32-bit comparator greater                             : 17
 32-bit comparator not equal                           : 1
 4-bit comparator greater                              : 5
 5-bit comparator greater                              : 5
 5-bit comparator lessequal                            : 1
 6-bit comparator greater                              : 2
 7-bit comparator equal                                : 1
 7-bit comparator greater                              : 2
 8-bit comparator greater                              : 3
 8-bit comparator lessequal                            : 10
 9-bit comparator greater                              : 1
# Multiplexers                                         : 1935
 1-bit 10-to-1 multiplexer                             : 1
 1-bit 19-to-1 multiplexer                             : 1
 1-bit 2-to-1 multiplexer                              : 1222
 1-bit 3-to-1 multiplexer                              : 3
 1-bit 30-to-1 multiplexer                             : 1
 1-bit 4-to-1 multiplexer                              : 6
 1-bit 7-to-1 multiplexer                              : 8
 10-bit 2-to-1 multiplexer                             : 12
 11-bit 16-to-1 multiplexer                            : 3
 11-bit 2-to-1 multiplexer                             : 7
 11-bit 3-to-1 multiplexer                             : 1
 112-bit 2-to-1 multiplexer                            : 2
 13-bit 2-to-1 multiplexer                             : 7
 16-bit 16-to-1 multiplexer                            : 2
 16-bit 2-to-1 multiplexer                             : 42
 16-bit 3-to-1 multiplexer                             : 1
 16-bit 4-to-1 multiplexer                             : 1
 16-bit 446-to-1 multiplexer                           : 1
 18-bit 2-to-1 multiplexer                             : 8
 2-bit 2-to-1 multiplexer                              : 27
 20-bit 2-to-1 multiplexer                             : 2
 22-bit 2-to-1 multiplexer                             : 8
 22-bit 4-to-1 multiplexer                             : 3
 27-bit 2-to-1 multiplexer                             : 1
 3-bit 2-to-1 multiplexer                              : 29
 32-bit 2-to-1 multiplexer                             : 252
 4-bit 2-to-1 multiplexer                              : 16
 5-bit 2-to-1 multiplexer                              : 50
 6-bit 2-to-1 multiplexer                              : 10
 7-bit 2-to-1 multiplexer                              : 2
 77-bit 2-to-1 multiplexer                             : 1
 8-bit 2-to-1 multiplexer                              : 102
 8-bit 4-to-1 multiplexer                              : 1
 8-bit 8-to-1 multiplexer                              : 1
 9-bit 2-to-1 multiplexer                              : 95
 9-bit 3-to-1 multiplexer                              : 1
 96-bit 2-to-1 multiplexer                             : 5
# Tristates                                            : 7
 1-bit tristate buffer                                 : 7
# FSMs                                                 : 30
# Xors                                                 : 64
 1-bit xor2                                            : 38
 1-bit xor3                                            : 15
 1-bit xor4                                            : 8
 8-bit xor2                                            : 3

=========================================================================
INFO:Xst:1767 - HDL ADVISOR - Resource sharing has identified that some arithmetic operations in this design can share the same physical resources for reduced device utilization. For improved clock frequency you may try to disable resource sharing.

=========================================================================
*                       Advanced HDL Synthesis                          *
=========================================================================

Reading core <ipcore_dir/buffer_fifo_wr32_rd32.ngc>.
Reading core <ipcore_dir/waveform_fifo_wr32_rd32.ngc>.
Reading core <ipcore_dir/trig_fifo.ngc>.
Reading core <ipcore_dir/daq_fifo.ngc>.
Reading core <ipcore_dir/FIFO_OUT_0.ngc>.
Reading core <ipcore_dir/FIFO_OUT_1.ngc>.
Reading core <ipcore_dir/FIFO_INP_0.ngc>.
Reading core <ipcore_dir/fifo_wr16_rd32.ngc>.
Reading core <ipcore_dir/fifo_wr32_rd16.ngc>.
Reading core <ipcore_dir/blk_mem_gen_v7_3.ngc>.
Loading core <buffer_fifo_wr32_rd32> for timing and area information for instance <u_buffer_wr32_rd32>.
Loading core <waveform_fifo_wr32_rd32> for timing and area information for instance <u_waveform_fifo_wr32_rd32>.
Loading core <trig_fifo> for timing and area information for instance <trig_fifo_ins>.
Loading core <daq_fifo> for timing and area information for instance <daq_fifo_ins>.
Loading core <FIFO_OUT_0> for timing and area information for instance <map_output_fifo_0>.
Loading core <FIFO_OUT_1> for timing and area information for instance <map_output_fifo_1>.
Loading core <FIFO_INP_0> for timing and area information for instance <map_input_fifo_0>.
Loading core <FIFO_INP_0> for timing and area information for instance <map_input_fifo_1>.
Loading core <fifo_wr16_rd32> for timing and area information for instance <synthesize_with_usb.map_fifo_wr16_rd32_EP2>.
Loading core <fifo_wr16_rd32> for timing and area information for instance <synthesize_with_usb.map_fifo_wr16_rd32_EP4>.
Loading core <fifo_wr32_rd16> for timing and area information for instance <synthesize_with_usb.map_fifo_wr32_rd16_EP6>.
Loading core <fifo_wr32_rd16> for timing and area information for instance <synthesize_with_usb.map_fifo_wr32_rd16_EP8>.
Loading core <blk_mem_gen_v7_3> for timing and area information for instance <u_pedarr>.
Loading core <blk_mem_gen_v7_3> for timing and area information for instance <u_wavarr>.
Loading core <blk_mem_gen_v7_3> for timing and area information for instance <u_pedarr>.
WARNING:Xst:1290 - Hierarchical block <chbond_count_dec_i> is unconnected in block <aurora_lane_0_i>.
   It will be removed from the design.
WARNING:Xst:1290 - Hierarchical block <map_test_clock_enable> is unconnected in block <map_clock_gen>.
   It will be removed from the design.
WARNING:Xst:1290 - Hierarchical block <map_MPPC_ADC_clock_enable> is unconnected in block <map_clock_gen>.
   It will be removed from the design.
INFO:Xst:2261 - The FF/Latch <sig_dbg_10> in Unit <map_fifo> is equivalent to the following 3 FFs/Latches, which will be removed : <sig_dbg_11> <sig_dbg_22> <sig_dbg_23> 
INFO:Xst:2261 - The FF/Latch <prev_beat_sp_d_r_3> in Unit <sym_dec_i> is equivalent to the following FF/Latch, which will be removed : <rx_sp_d_r_3> 
INFO:Xst:2261 - The FF/Latch <prev_beat_sp_d_r_0> in Unit <sym_dec_i> is equivalent to the following 2 FFs/Latches, which will be removed : <prev_beat_spa_d_r_0> <prev_beat_v_d_r_0> 
INFO:Xst:2261 - The FF/Latch <rx_v_d_r_2> in Unit <sym_dec_i> is equivalent to the following FF/Latch, which will be removed : <prev_beat_v_d_r_2> 
INFO:Xst:2261 - The FF/Latch <rx_ecp_d_r_2> in Unit <sym_dec_i> is equivalent to the following FF/Latch, which will be removed : <rx_scp_d_r_2> 
INFO:Xst:2261 - The FF/Latch <prev_beat_sp_d_r_2> in Unit <sym_dec_i> is equivalent to the following FF/Latch, which will be removed : <rx_sp_d_r_2> 
INFO:Xst:2261 - The FF/Latch <prev_beat_spa_d_r_3> in Unit <sym_dec_i> is equivalent to the following FF/Latch, which will be removed : <rx_spa_d_r_3> 
INFO:Xst:2261 - The FF/Latch <rx_v_d_r_3> in Unit <sym_dec_i> is equivalent to the following FF/Latch, which will be removed : <prev_beat_v_d_r_3> 
INFO:Xst:2261 - The FF/Latch <prev_beat_spa_d_r_2> in Unit <sym_dec_i> is equivalent to the following FF/Latch, which will be removed : <rx_spa_d_r_2> 
INFO:Xst:2261 - The FF/Latch <rx_scp_d_r_1> in Unit <sym_dec_i> is equivalent to the following 4 FFs/Latches, which will be removed : <prev_beat_sp_d_r_1> <prev_beat_spa_d_r_1> <rx_spa_d_r_1> <prev_beat_v_d_r_1> 
INFO:Xst:2261 - The FF/Latch <rdfail_10> in Unit <tmodr_ins> is equivalent to the following 9 FFs/Latches, which will be removed : <rdfail_9> <rdfail_8> <rdfail_7> <rdfail_6> <rdfail_5> <rdfail_4> <rdfail_3> <rdfail_2> <rdfail_1> 
INFO:Xst:2261 - The FF/Latch <tce_2x_i_0> in Unit <tmg_ctrl_ins> is equivalent to the following 4 FFs/Latches, which will be removed : <tce_2x_i_1> <tce_2x_i_2> <tce_2x_i_3> <tce_2x_i_4> 
INFO:Xst:2261 - The FF/Latch <tdcrst_i_0> in Unit <tmg_ctrl_ins> is equivalent to the following 3 FFs/Latches, which will be removed : <tdcrst_i_1> <tdcrst_i_2> <tdcrst_i_3> 
INFO:Xst:2261 - The FF/Latch <status_regs_106_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_106_13> <status_regs_106_14> <status_regs_106_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_115_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_115_13> <status_regs_115_14> <status_regs_115_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_71_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_71_13> <status_regs_71_14> <status_regs_71_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_39_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_39_13> <status_regs_39_14> <status_regs_39_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_65_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_65_13> <status_regs_65_14> <status_regs_65_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_128_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_128_13> <status_regs_128_14> <status_regs_128_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_4_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_4_13> <status_regs_4_14> <status_regs_4_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_122_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_122_13> <status_regs_122_14> <status_regs_122_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_78_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_78_13> <status_regs_78_14> <status_regs_78_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_13_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_13_13> <status_regs_13_14> <status_regs_13_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_87_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_87_13> <status_regs_87_14> <status_regs_87_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_144_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_144_13> <status_regs_144_14> <status_regs_144_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_20_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_20_13> <status_regs_20_14> <status_regs_20_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_94_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_94_13> <status_regs_94_14> <status_regs_94_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_29_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_29_13> <status_regs_29_14> <status_regs_29_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_55_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_55_13> <status_regs_55_14> <status_regs_55_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_103_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_103_13> <status_regs_103_14> <status_regs_103_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_151_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_151_13> <status_regs_151_14> <status_regs_151_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_112_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_112_13> <status_regs_112_14> <status_regs_112_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_68_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_68_13> <status_regs_68_14> <status_regs_68_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_36_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_36_13> <status_regs_36_14> <status_regs_36_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_62_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_62_13> <status_regs_62_14> <status_regs_62_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_45_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_45_13> <status_regs_45_14> <status_regs_45_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_110_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_110_13> <status_regs_110_14> <status_regs_110_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_1_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_1_13> <status_regs_1_14> <status_regs_1_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_119_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_119_13> <status_regs_119_14> <status_regs_119_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_84_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_84_13> <status_regs_84_14> <status_regs_84_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_52_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_52_13> <status_regs_52_14> <status_regs_52_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_8_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_8_13> <status_regs_8_14> <status_regs_8_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_141_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_141_13> <status_regs_141_14> <status_regs_141_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_17_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_17_13> <status_regs_17_14> <status_regs_17_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_135_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_135_13> <status_regs_135_14> <status_regs_135_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_91_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_91_13> <status_regs_91_14> <status_regs_91_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_26_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_26_13> <status_regs_26_14> <status_regs_26_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_100_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_100_13> <status_regs_100_14> <status_regs_100_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_148_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_148_13> <status_regs_148_14> <status_regs_148_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_24_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_24_13> <status_regs_24_14> <status_regs_24_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_157_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_157_13> <status_regs_157_14> <status_regs_157_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_33_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_33_13> <status_regs_33_14> <status_regs_33_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_59_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_59_13> <status_regs_59_14> <status_regs_59_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_42_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_42_13> <status_regs_42_14> <status_regs_42_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_107_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_107_13> <status_regs_107_14> <status_regs_107_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_116_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_116_13> <status_regs_116_14> <status_regs_116_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_66_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_66_13> <status_regs_66_14> <status_regs_66_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_49_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_49_13> <status_regs_49_14> <status_regs_49_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_75_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_75_13> <status_regs_75_14> <status_regs_75_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_123_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_123_13> <status_regs_123_14> <status_regs_123_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_14_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_14_13> <status_regs_14_14> <status_regs_14_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_132_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_132_13> <status_regs_132_14> <status_regs_132_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_88_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_88_13> <status_regs_88_14> <status_regs_88_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_82_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_82_13> <status_regs_82_14> <status_regs_82_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_97_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_97_13> <status_regs_97_14> <status_regs_97_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_21_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_21_13> <status_regs_21_14> <status_regs_21_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_154_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_154_13> <status_regs_154_14> <status_regs_154_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_139_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_139_13> <status_regs_139_14> <status_regs_139_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_30_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_30_13> <status_regs_30_14> <status_regs_30_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_56_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_56_13> <status_regs_56_14> <status_regs_56_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_104_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_104_13> <status_regs_104_14> <status_regs_104_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_113_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_113_13> <status_regs_113_14> <status_regs_113_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_37_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_37_13> <status_regs_37_14> <status_regs_37_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_63_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_63_13> <status_regs_63_14> <status_regs_63_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_46_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_46_13> <status_regs_46_14> <status_regs_46_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_72_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_72_13> <status_regs_72_14> <status_regs_72_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_120_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_120_13> <status_regs_120_14> <status_regs_120_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_11_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_11_13> <status_regs_11_14> <status_regs_11_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_129_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_129_13> <status_regs_129_14> <status_regs_129_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_5_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_5_13> <status_regs_5_14> <status_regs_5_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_53_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_53_13> <status_regs_53_14> <status_regs_53_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_79_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_79_13> <status_regs_79_14> <status_regs_79_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_18_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_18_13> <status_regs_18_14> <status_regs_18_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_136_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_136_13> <status_regs_136_14> <status_regs_136_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_27_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_27_13> <status_regs_27_14> <status_regs_27_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_145_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_145_13> <status_regs_145_14> <status_regs_145_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_101_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_101_13> <status_regs_101_14> <status_regs_101_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_95_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_95_13> <status_regs_95_14> <status_regs_95_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_158_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_158_13> <status_regs_158_14> <status_regs_158_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_34_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_34_13> <status_regs_34_14> <status_regs_34_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_60_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_60_13> <status_regs_60_14> <status_regs_60_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_152_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_152_13> <status_regs_152_14> <status_regs_152_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_108_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_108_13> <status_regs_108_14> <status_regs_108_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_43_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_43_13> <status_regs_43_14> <status_regs_43_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_69_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_69_13> <status_regs_69_14> <status_regs_69_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_117_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_117_13> <status_regs_117_14> <status_regs_117_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_126_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_126_13> <status_regs_126_14> <status_regs_126_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_67_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_67_13> <status_regs_67_14> <status_regs_67_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_2_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_2_13> <status_regs_2_14> <status_regs_2_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_50_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_50_13> <status_regs_50_14> <status_regs_50_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_76_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_76_13> <status_regs_76_14> <status_regs_76_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_124_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_124_13> <status_regs_124_14> <status_regs_124_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_85_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_85_13> <status_regs_85_14> <status_regs_85_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_133_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_133_13> <status_regs_133_14> <status_regs_133_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_9_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_9_13> <status_regs_9_14> <status_regs_9_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_142_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_142_13> <status_regs_142_14> <status_regs_142_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_98_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_98_13> <status_regs_98_14> <status_regs_98_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_92_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_92_13> <status_regs_92_14> <status_regs_92_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_31_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_31_13> <status_regs_31_14> <status_regs_31_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_57_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_57_13> <status_regs_57_14> <status_regs_57_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_149_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_149_13> <status_regs_149_14> <status_regs_149_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_25_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_25_13> <status_regs_25_14> <status_regs_25_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_40_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_40_13> <status_regs_40_14> <status_regs_40_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_114_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_114_13> <status_regs_114_14> <status_regs_114_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_38_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_38_13> <status_regs_38_14> <status_regs_38_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_64_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_64_13> <status_regs_64_14> <status_regs_64_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_47_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_47_13> <status_regs_47_14> <status_regs_47_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_73_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_73_13> <status_regs_73_14> <status_regs_73_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_121_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_121_13> <status_regs_121_14> <status_regs_121_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_130_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_130_13> <status_regs_130_14> <status_regs_130_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_6_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_6_13> <status_regs_6_14> <status_regs_6_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_15_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_15_13> <status_regs_15_14> <status_regs_15_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_80_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_80_13> <status_regs_80_14> <status_regs_80_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_89_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_89_13> <status_regs_89_14> <status_regs_89_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_137_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_137_13> <status_regs_137_14> <status_regs_137_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_28_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_28_13> <status_regs_28_14> <status_regs_28_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_54_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_54_13> <status_regs_54_14> <status_regs_54_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_146_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_146_13> <status_regs_146_14> <status_regs_146_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_22_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_22_13> <status_regs_22_14> <status_regs_22_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_155_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_155_13> <status_regs_155_14> <status_regs_155_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_96_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_96_13> <status_regs_96_14> <status_regs_96_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_111_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_111_13> <status_regs_111_14> <status_regs_111_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_105_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_105_13> <status_regs_105_14> <status_regs_105_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_61_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_61_13> <status_regs_61_14> <status_regs_61_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_153_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_153_13> <status_regs_153_14> <status_regs_153_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_44_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_44_13> <status_regs_44_14> <status_regs_44_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_70_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_70_13> <status_regs_70_14> <status_regs_70_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_118_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_118_13> <status_regs_118_14> <status_regs_118_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_127_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_127_13> <status_regs_127_14> <status_regs_127_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_3_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_3_13> <status_regs_3_14> <status_regs_3_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_51_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_51_13> <status_regs_51_14> <status_regs_51_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_77_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_77_13> <status_regs_77_14> <status_regs_77_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_12_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_12_13> <status_regs_12_14> <status_regs_12_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_86_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_86_13> <status_regs_86_14> <status_regs_86_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_134_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_134_13> <status_regs_134_14> <status_regs_134_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_10_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_10_13> <status_regs_10_14> <status_regs_10_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_143_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_143_13> <status_regs_143_14> <status_regs_143_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_19_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_19_13> <status_regs_19_14> <status_regs_19_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_93_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_93_13> <status_regs_93_14> <status_regs_93_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_102_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_102_13> <status_regs_102_14> <status_regs_102_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_58_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_58_13> <status_regs_58_14> <status_regs_58_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_150_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_150_13> <status_regs_150_14> <status_regs_150_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_41_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_41_13> <status_regs_41_14> <status_regs_41_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_159_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_159_13> <status_regs_159_14> <status_regs_159_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_35_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_35_13> <status_regs_35_14> <status_regs_35_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_109_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_109_13> <status_regs_109_14> <status_regs_109_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_0_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_0_13> <status_regs_0_14> <status_regs_0_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_48_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_48_13> <status_regs_48_14> <status_regs_48_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_74_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_74_13> <status_regs_74_14> <status_regs_74_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_83_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_83_13> <status_regs_83_14> <status_regs_83_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_131_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_131_13> <status_regs_131_14> <status_regs_131_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_7_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_7_13> <status_regs_7_14> <status_regs_7_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_140_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_140_13> <status_regs_140_14> <status_regs_140_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_125_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_125_13> <status_regs_125_14> <status_regs_125_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_81_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_81_13> <status_regs_81_14> <status_regs_81_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_16_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_16_13> <status_regs_16_14> <status_regs_16_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_90_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_90_13> <status_regs_90_14> <status_regs_90_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_138_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_138_13> <status_regs_138_14> <status_regs_138_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_99_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_99_13> <status_regs_99_14> <status_regs_99_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_147_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_147_13> <status_regs_147_14> <status_regs_147_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_23_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_23_13> <status_regs_23_14> <status_regs_23_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_156_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_156_13> <status_regs_156_14> <status_regs_156_15> 
INFO:Xst:2261 - The FF/Latch <status_regs_32_12> in Unit <uut> is equivalent to the following 3 FFs/Latches, which will be removed : <status_regs_32_13> <status_regs_32_14> <status_regs_32_15> 
INFO:Xst:2261 - The FF/Latch <jdx_14_8> in Unit <u_wavedemux> is equivalent to the following 31 FFs/Latches, which will be removed : <jdx_14_9> <jdx_14_10> <jdx_15_7> <jdx_15_8> <jdx_15_9> <jdx_15_10> <jdx_13_7> <jdx_13_9> <jdx_13_10> <jdx_12_9> <jdx_12_10> <jdx_11_7> <jdx_11_8> <jdx_11_10> <jdx_10_8> <jdx_10_10> <jdx_7_7> <jdx_7_8> <jdx_7_9> <jdx_9_7> <jdx_9_10> <jdx_8_10> <jdx_4_9> <jdx_6_8> <jdx_6_9> <jdx_5_7> <jdx_5_9> <jdx_1_7> <jdx_3_7> <jdx_3_8> <jdx_2_8> 
INFO:Xst:2261 - The FF/Latch <jdx_14_7> in Unit <u_wavedemux> is equivalent to the following 31 FFs/Latches, which will be removed : <jdx_13_8> <jdx_12_7> <jdx_12_8> <jdx_11_9> <jdx_10_7> <jdx_10_9> <jdx_7_10> <jdx_9_8> <jdx_9_9> <jdx_8_7> <jdx_8_8> <jdx_8_9> <jdx_4_7> <jdx_4_8> <jdx_4_10> <jdx_6_7> <jdx_6_10> <jdx_5_8> <jdx_5_10> <jdx_1_8> <jdx_1_9> <jdx_1_10> <jdx_3_9> <jdx_3_10> <jdx_2_7> <jdx_2_9> <jdx_2_10> <jdx_0_7> <jdx_0_8> <jdx_0_9> <jdx_0_10> 
INFO:Xst:2261 - The FF/Latch <jdx_14_5> in Unit <u_wavedemux> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_15_5> <jdx_13_5> <jdx_12_5> <jdx_11_5> <jdx_10_5> <jdx_7_5> <jdx_9_5> <jdx_8_5> <jdx_4_5> <jdx_6_5> <jdx_5_5> <jdx_1_5> <jdx_3_5> <jdx_2_5> <jdx_0_5> 
INFO:Xst:2261 - The FF/Latch <jdx_14_6> in Unit <u_wavedemux> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_15_6> <jdx_13_6> <jdx_12_6> <jdx_11_6> <jdx_10_6> <jdx_7_6> <jdx_9_6> <jdx_8_6> <jdx_4_6> <jdx_6_6> <jdx_5_6> <jdx_1_6> <jdx_3_6> <jdx_2_6> <jdx_0_6> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_0> in Unit <u_wavedemux> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_0> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_1> in Unit <u_wavedemux> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_1> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_2> in Unit <u_wavedemux> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_2> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_3> in Unit <u_wavedemux> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_3> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_4> in Unit <u_wavedemux> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_4> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_5> in Unit <u_wavedemux> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_5> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_6> in Unit <u_wavedemux> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_6> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_7> in Unit <u_wavedemux> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_7> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_8> in Unit <u_wavedemux> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_8> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_9> in Unit <u_wavedemux> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_9> 
INFO:Xst:2261 - The FF/Latch <win_addr_start_i_9> in Unit <u_wavedemux> is equivalent to the following 21 FFs/Latches, which will be removed : <win_addr_start_i_10> <win_addr_start_i_11> <win_addr_start_i_12> <win_addr_start_i_13> <win_addr_start_i_14> <win_addr_start_i_15> <win_addr_start_i_16> <win_addr_start_i_17> <win_addr_start_i_18> <win_addr_start_i_19> <win_addr_start_i_20> <win_addr_start_i_21> <win_addr_start_i_22> <win_addr_start_i_23> <win_addr_start_i_24> <win_addr_start_i_25> <win_a
ddr_start_i_26> <win_addr_start_i_27> <win_addr_start_i_28> <win_addr_start_i_29> <win_addr_start_i_30> 
INFO:Xst:2261 - The FF/Latch <jdx_14_0> in Unit <u_wavedemux> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_15_0> <jdx_13_0> <jdx_12_0> <jdx_11_0> <jdx_10_0> <jdx_7_0> <jdx_9_0> <jdx_8_0> <jdx_4_0> <jdx_6_0> <jdx_5_0> <jdx_1_0> <jdx_3_0> <jdx_2_0> <jdx_0_0> 
INFO:Xst:2261 - The FF/Latch <jdx_14_1> in Unit <u_wavedemux> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_15_1> <jdx_13_1> <jdx_12_1> <jdx_11_1> <jdx_10_1> <jdx_7_1> <jdx_9_1> <jdx_8_1> <jdx_4_1> <jdx_6_1> <jdx_5_1> <jdx_1_1> <jdx_3_1> <jdx_2_1> <jdx_0_1> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_10> in Unit <u_wavedemux> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_10> 
INFO:Xst:2261 - The FF/Latch <jdx_14_2> in Unit <u_wavedemux> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_15_2> <jdx_13_2> <jdx_12_2> <jdx_11_2> <jdx_10_2> <jdx_7_2> <jdx_9_2> <jdx_8_2> <jdx_4_2> <jdx_6_2> <jdx_5_2> <jdx_1_2> <jdx_3_2> <jdx_2_2> <jdx_0_2> 
INFO:Xst:2261 - The FF/Latch <jdx_14_3> in Unit <u_wavedemux> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_15_3> <jdx_13_3> <jdx_12_3> <jdx_11_3> <jdx_10_3> <jdx_7_3> <jdx_9_3> <jdx_8_3> <jdx_4_3> <jdx_6_3> <jdx_5_3> <jdx_1_3> <jdx_3_3> <jdx_2_3> <jdx_0_3> 
INFO:Xst:2261 - The FF/Latch <jdx_14_4> in Unit <u_wavedemux> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_15_4> <jdx_13_4> <jdx_12_4> <jdx_11_4> <jdx_10_4> <jdx_7_4> <jdx_9_4> <jdx_8_4> <jdx_4_4> <jdx_6_4> <jdx_5_4> <jdx_1_4> <jdx_3_4> <jdx_2_4> <jdx_0_4> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_7> in Unit <u_wavedemux> is equivalent to the following 31 FFs/Latches, which will be removed : <jdx2_15_8> <jdx2_15_9> <jdx2_15_10> <jdx2_14_8> <jdx2_14_9> <jdx2_14_10> <jdx2_13_7> <jdx2_13_9> <jdx2_13_10> <jdx2_10_8> <jdx2_10_10> <jdx2_12_9> <jdx2_12_10> <jdx2_11_7> <jdx2_11_8> <jdx2_11_10> <jdx2_7_7> <jdx2_7_8> <jdx2_7_9> <jdx2_9_7> <jdx2_9_10> <jdx2_8_10> <jdx2_4_9> <jdx2_6_8> <jdx2_6_9> <jdx2_5_7> <jdx2_5_9> <jdx2_3_7> <jdx2_3_8> <jdx2_2_8> <jdx2_1_7> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_0> in Unit <u_wavedemux> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_14_0> <jdx2_13_0> <jdx2_10_0> <jdx2_12_0> <jdx2_11_0> <jdx2_7_0> <jdx2_9_0> <jdx2_8_0> <jdx2_4_0> <jdx2_6_0> <jdx2_5_0> <jdx2_3_0> <jdx2_2_0> <jdx2_1_0> <jdx2_0_0> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_1> in Unit <u_wavedemux> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_14_1> <jdx2_13_1> <jdx2_10_1> <jdx2_12_1> <jdx2_11_1> <jdx2_7_1> <jdx2_9_1> <jdx2_8_1> <jdx2_4_1> <jdx2_6_1> <jdx2_5_1> <jdx2_3_1> <jdx2_2_1> <jdx2_1_1> <jdx2_0_1> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_2> in Unit <u_wavedemux> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_14_2> <jdx2_13_2> <jdx2_10_2> <jdx2_12_2> <jdx2_11_2> <jdx2_7_2> <jdx2_9_2> <jdx2_8_2> <jdx2_4_2> <jdx2_6_2> <jdx2_5_2> <jdx2_3_2> <jdx2_2_2> <jdx2_1_2> <jdx2_0_2> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_3> in Unit <u_wavedemux> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_14_3> <jdx2_13_3> <jdx2_10_3> <jdx2_12_3> <jdx2_11_3> <jdx2_7_3> <jdx2_9_3> <jdx2_8_3> <jdx2_4_3> <jdx2_6_3> <jdx2_5_3> <jdx2_3_3> <jdx2_2_3> <jdx2_1_3> <jdx2_0_3> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_4> in Unit <u_wavedemux> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_14_4> <jdx2_13_4> <jdx2_10_4> <jdx2_12_4> <jdx2_11_4> <jdx2_7_4> <jdx2_9_4> <jdx2_8_4> <jdx2_4_4> <jdx2_6_4> <jdx2_5_4> <jdx2_3_4> <jdx2_2_4> <jdx2_1_4> <jdx2_0_4> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_5> in Unit <u_wavedemux> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_14_5> <jdx2_13_5> <jdx2_10_5> <jdx2_12_5> <jdx2_11_5> <jdx2_7_5> <jdx2_9_5> <jdx2_8_5> <jdx2_4_5> <jdx2_6_5> <jdx2_5_5> <jdx2_3_5> <jdx2_2_5> <jdx2_1_5> <jdx2_0_5> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_6> in Unit <u_wavedemux> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_14_6> <jdx2_13_6> <jdx2_10_6> <jdx2_12_6> <jdx2_11_6> <jdx2_7_6> <jdx2_9_6> <jdx2_8_6> <jdx2_4_6> <jdx2_6_6> <jdx2_5_6> <jdx2_3_6> <jdx2_2_6> <jdx2_1_6> <jdx2_0_6> 
INFO:Xst:2261 - The FF/Latch <jdx2_14_7> in Unit <u_wavedemux> is equivalent to the following 31 FFs/Latches, which will be removed : <jdx2_13_8> <jdx2_10_7> <jdx2_10_9> <jdx2_12_7> <jdx2_12_8> <jdx2_11_9> <jdx2_7_10> <jdx2_9_8> <jdx2_9_9> <jdx2_8_7> <jdx2_8_8> <jdx2_8_9> <jdx2_4_7> <jdx2_4_8> <jdx2_4_10> <jdx2_6_7> <jdx2_6_10> <jdx2_5_8> <jdx2_5_10> <jdx2_3_9> <jdx2_3_10> <jdx2_2_7> <jdx2_2_9> <jdx2_2_10> <jdx2_1_8> <jdx2_1_9> <jdx2_1_10> <jdx2_0_7> <jdx2_0_8> <jdx2_0_9> <jdx2_0_10> 
INFO:Xst:2261 - The FF/Latch <jdx_15_5> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_14_5> <jdx_13_5> <jdx_12_5> <jdx_11_5> <jdx_8_5> <jdx_10_5> <jdx_9_5> <jdx_7_5> <jdx_6_5> <jdx_5_5> <jdx_4_5> <jdx_1_5> <jdx_3_5> <jdx_2_5> <jdx_0_5> 
INFO:Xst:2261 - The FF/Latch <jdx_15_6> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_14_6> <jdx_13_6> <jdx_12_6> <jdx_11_6> <jdx_8_6> <jdx_10_6> <jdx_9_6> <jdx_7_6> <jdx_6_6> <jdx_5_6> <jdx_4_6> <jdx_1_6> <jdx_3_6> <jdx_2_6> <jdx_0_6> 
INFO:Xst:2261 - The FF/Latch <jdx_15_0> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_14_0> <jdx_13_0> <jdx_12_0> <jdx_11_0> <jdx_8_0> <jdx_10_0> <jdx_9_0> <jdx_7_0> <jdx_6_0> <jdx_5_0> <jdx_4_0> <jdx_1_0> <jdx_3_0> <jdx_2_0> <jdx_0_0> 
INFO:Xst:2261 - The FF/Latch <jdx_15_1> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_14_1> <jdx_13_1> <jdx_12_1> <jdx_11_1> <jdx_8_1> <jdx_10_1> <jdx_9_1> <jdx_7_1> <jdx_6_1> <jdx_5_1> <jdx_4_1> <jdx_1_1> <jdx_3_1> <jdx_2_1> <jdx_0_1> 
INFO:Xst:2261 - The FF/Latch <jdx_15_2> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_14_2> <jdx_13_2> <jdx_12_2> <jdx_11_2> <jdx_8_2> <jdx_10_2> <jdx_9_2> <jdx_7_2> <jdx_6_2> <jdx_5_2> <jdx_4_2> <jdx_1_2> <jdx_3_2> <jdx_2_2> <jdx_0_2> 
INFO:Xst:2261 - The FF/Latch <jdx_15_3> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_14_3> <jdx_13_3> <jdx_12_3> <jdx_11_3> <jdx_8_3> <jdx_10_3> <jdx_9_3> <jdx_7_3> <jdx_6_3> <jdx_5_3> <jdx_4_3> <jdx_1_3> <jdx_3_3> <jdx_2_3> <jdx_0_3> 
INFO:Xst:2261 - The FF/Latch <jdx_15_4> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_14_4> <jdx_13_4> <jdx_12_4> <jdx_11_4> <jdx_8_4> <jdx_10_4> <jdx_9_4> <jdx_7_4> <jdx_6_4> <jdx_5_4> <jdx_4_4> <jdx_1_4> <jdx_3_4> <jdx_2_4> <jdx_0_4> 
INFO:Xst:2261 - The FF/Latch <dmx_win_0> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following FF/Latch, which will be removed : <dmx2_win_0> 
INFO:Xst:2261 - The FF/Latch <dmx_win_1> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following FF/Latch, which will be removed : <dmx2_win_1> 
INFO:Xst:2261 - The FF/Latch <jdx_15_7> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following 31 FFs/Latches, which will be removed : <jdx_15_8> <jdx_15_9> <jdx_15_10> <jdx_14_8> <jdx_14_9> <jdx_14_10> <jdx_13_7> <jdx_13_9> <jdx_13_10> <jdx_12_9> <jdx_12_10> <jdx_11_7> <jdx_11_8> <jdx_11_10> <jdx_8_10> <jdx_10_8> <jdx_10_10> <jdx_9_7> <jdx_9_10> <jdx_7_7> <jdx_7_8> <jdx_7_9> <jdx_6_8> <jdx_6_9> <jdx_5_7> <jdx_5_9> <jdx_4_9> <jdx_1_7> <jdx_3_7> <jdx_3_8> <jdx_2_8> 
INFO:Xst:2261 - The FF/Latch <jdx_14_7> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following 31 FFs/Latches, which will be removed : <jdx_13_8> <jdx_12_7> <jdx_12_8> <jdx_11_9> <jdx_8_7> <jdx_8_8> <jdx_8_9> <jdx_10_7> <jdx_10_9> <jdx_9_8> <jdx_9_9> <jdx_7_10> <jdx_6_7> <jdx_6_10> <jdx_5_8> <jdx_5_10> <jdx_4_7> <jdx_4_8> <jdx_4_10> <jdx_1_8> <jdx_1_9> <jdx_1_10> <jdx_3_9> <jdx_3_10> <jdx_2_7> <jdx_2_9> <jdx_2_10> <jdx_0_7> <jdx_0_8> <jdx_0_9> <jdx_0_10> 
INFO:Xst:2261 - The FF/Latch <ncnt_int_16> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <ncnt_int_17> <ncnt_int_18> <ncnt_int_19> <ncnt_int_20> <ncnt_int_21> <ncnt_int_22> <ncnt_int_23> <ncnt_int_24> <ncnt_int_25> <ncnt_int_26> <ncnt_int_27> <ncnt_int_28> <ncnt_int_29> <ncnt_int_30> <ncnt_int_31> 
INFO:Xst:2261 - The FF/Latch <win_addr_start_i_9> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following 21 FFs/Latches, which will be removed : <win_addr_start_i_10> <win_addr_start_i_11> <win_addr_start_i_12> <win_addr_start_i_13> <win_addr_start_i_14> <win_addr_start_i_15> <win_addr_start_i_16> <win_addr_start_i_17> <win_addr_start_i_18> <win_addr_start_i_19> <win_addr_start_i_20> <win_addr_start_i_21> <win_addr_start_i_22> <win_addr_start_i_23> <win_addr_start_i_24> <win_addr
_start_i_25> <win_addr_start_i_26> <win_addr_start_i_27> <win_addr_start_i_28> <win_addr_start_i_29> <win_addr_start_i_30> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_4> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_14_4> <jdx2_13_4> <jdx2_10_4> <jdx2_12_4> <jdx2_11_4> <jdx2_9_4> <jdx2_8_4> <jdx2_7_4> <jdx2_6_4> <jdx2_5_4> <jdx2_4_4> <jdx2_3_4> <jdx2_2_4> <jdx2_1_4> <jdx2_0_4> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_5> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_14_5> <jdx2_13_5> <jdx2_10_5> <jdx2_12_5> <jdx2_11_5> <jdx2_9_5> <jdx2_8_5> <jdx2_7_5> <jdx2_6_5> <jdx2_5_5> <jdx2_4_5> <jdx2_3_5> <jdx2_2_5> <jdx2_1_5> <jdx2_0_5> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_6> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_14_6> <jdx2_13_6> <jdx2_10_6> <jdx2_12_6> <jdx2_11_6> <jdx2_9_6> <jdx2_8_6> <jdx2_7_6> <jdx2_6_6> <jdx2_5_6> <jdx2_4_6> <jdx2_3_6> <jdx2_2_6> <jdx2_1_6> <jdx2_0_6> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_7> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following 31 FFs/Latches, which will be removed : <jdx2_15_8> <jdx2_15_9> <jdx2_15_10> <jdx2_14_8> <jdx2_14_9> <jdx2_14_10> <jdx2_13_7> <jdx2_13_9> <jdx2_13_10> <jdx2_10_8> <jdx2_10_10> <jdx2_12_9> <jdx2_12_10> <jdx2_11_7> <jdx2_11_8> <jdx2_11_10> <jdx2_9_7> <jdx2_9_10> <jdx2_8_10> <jdx2_7_7> <jdx2_7_8> <jdx2_7_9> <jdx2_6_8> <jdx2_6_9> <jdx2_5_7> <jdx2_5_9> <jdx2_4_9> <jdx2_3_7> <jdx2_3_8> <jdx2
_2_8> <jdx2_1_7> 
INFO:Xst:2261 - The FF/Latch <jdx2_14_7> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following 31 FFs/Latches, which will be removed : <jdx2_13_8> <jdx2_10_7> <jdx2_10_9> <jdx2_12_7> <jdx2_12_8> <jdx2_11_9> <jdx2_9_8> <jdx2_9_9> <jdx2_8_7> <jdx2_8_8> <jdx2_8_9> <jdx2_7_10> <jdx2_6_7> <jdx2_6_10> <jdx2_5_8> <jdx2_5_10> <jdx2_4_7> <jdx2_4_8> <jdx2_4_10> <jdx2_3_9> <jdx2_3_10> <jdx2_2_7> <jdx2_2_9> <jdx2_2_10> <jdx2_1_8> <jdx2_1_9> <jdx2_1_10> <jdx2_0_7> <jdx2_0_8> <jdx2_0_9> <jdx2
_0_10> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_0> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_14_0> <jdx2_13_0> <jdx2_10_0> <jdx2_12_0> <jdx2_11_0> <jdx2_9_0> <jdx2_8_0> <jdx2_7_0> <jdx2_6_0> <jdx2_5_0> <jdx2_4_0> <jdx2_3_0> <jdx2_2_0> <jdx2_1_0> <jdx2_0_0> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_1> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_14_1> <jdx2_13_1> <jdx2_10_1> <jdx2_12_1> <jdx2_11_1> <jdx2_9_1> <jdx2_8_1> <jdx2_7_1> <jdx2_6_1> <jdx2_5_1> <jdx2_4_1> <jdx2_3_1> <jdx2_2_1> <jdx2_1_1> <jdx2_0_1> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_2> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_14_2> <jdx2_13_2> <jdx2_10_2> <jdx2_12_2> <jdx2_11_2> <jdx2_9_2> <jdx2_8_2> <jdx2_7_2> <jdx2_6_2> <jdx2_5_2> <jdx2_4_2> <jdx2_3_2> <jdx2_2_2> <jdx2_1_2> <jdx2_0_2> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_3> in Unit <Inst_WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_14_3> <jdx2_13_3> <jdx2_10_3> <jdx2_12_3> <jdx2_11_3> <jdx2_9_3> <jdx2_8_3> <jdx2_7_3> <jdx2_6_3> <jdx2_5_3> <jdx2_4_3> <jdx2_3_3> <jdx2_2_3> <jdx2_1_3> <jdx2_0_3> 
INFO:Xst:2261 - The FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_16> in Unit <inst_dac_controller> is equivalent to the following FF/Latch, which will be removed : <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_0> 
INFO:Xst:2261 - The FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_17> in Unit <inst_dac_controller> is equivalent to the following FF/Latch, which will be removed : <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_1> 
INFO:Xst:2261 - The FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_18> in Unit <inst_dac_controller> is equivalent to the following FF/Latch, which will be removed : <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_2> 
INFO:Xst:2261 - The FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_19> in Unit <inst_dac_controller> is equivalent to the following FF/Latch, which will be removed : <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_3> 
INFO:Xst:2261 - The FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_20> in Unit <inst_dac_controller> is equivalent to the following FF/Latch, which will be removed : <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_4> 
INFO:Xst:2261 - The FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_21> in Unit <inst_dac_controller> is equivalent to the following FF/Latch, which will be removed : <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_5> 
INFO:Xst:2261 - The FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_22> in Unit <inst_dac_controller> is equivalent to the following FF/Latch, which will be removed : <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_6> 
INFO:Xst:2261 - The FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_23> in Unit <inst_dac_controller> is equivalent to the following FF/Latch, which will be removed : <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_7> 
INFO:Xst:2261 - The FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_10> in Unit <inst_dac_controller> is equivalent to the following FF/Latch, which will be removed : <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_9> 
INFO:Xst:2261 - The FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_26> in Unit <inst_dac_controller> is equivalent to the following FF/Latch, which will be removed : <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_25> 
WARNING:Xst:1426 - The value init of the FF/Latch win_addr_start_i_31 hinder the constant cleaning in the block u_wavedemux.
   You should achieve better results by setting this init to 0.
WARNING:Xst:1426 - The value init of the FF/Latch win_addr_start_i_31 hinder the constant cleaning in the block Inst_WaveformDemuxCalcPedsBRAM.
   You should achieve better results by setting this init to 0.
WARNING:Xst:1426 - The value init of the FF/Latch rw_i hinder the constant cleaning in the block u_ram_iface[3].u_ri.
   You should achieve better results by setting this init to 1.
WARNING:Xst:1426 - The value init of the FF/Latch seq_caldelay_0 hinder the constant cleaning in the block map_is.
   You should achieve better results by setting this init to 0.
WARNING:Xst:1710 - FF/Latch <status_regs_59_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_60_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_58_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_62_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_63_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_61_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_65_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_66_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_64_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_68_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_69_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_67_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_71_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_72_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_70_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_74_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_75_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_73_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_77_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_36_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_40_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_41_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_39_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_43_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_44_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_42_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_45_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_46_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_48_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_49_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_47_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_51_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_52_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_50_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_54_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_55_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_53_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_56_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_57_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_95_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_99_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_100_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_98_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_101_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_102_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_104_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_105_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_103_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_107_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_108_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_106_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_110_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_111_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_109_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_112_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_113_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_115_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_116_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_78_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_76_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_79_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_80_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_82_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_83_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_81_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_85_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_86_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_84_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_88_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_89_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_87_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_90_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_91_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_93_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_94_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_92_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_96_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_97_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_9> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_8> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_7> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_6> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_5> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_4> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_3> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_2> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_1> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_0> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <ram_dataw_7> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <ram_dataw_6> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <ram_dataw_5> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <ram_dataw_4> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <ram_dataw_3> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <ram_dataw_2> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <ram_dataw_1> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <ram_dataw_0> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <jdx_14_8> (without init value) has a constant value of 1 in block <u_wavedemux>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_24> has a constant value of 0 in block <inst_dac_controller>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_8> has a constant value of 0 in block <inst_dac_controller>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <ncnt_int_16> has a constant value of 0 in block <Inst_WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <jdx_14_7> (without init value) has a constant value of 0 in block <Inst_WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <jdx_15_7> (without init value) has a constant value of 1 in block <Inst_WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <win_addr_start_i_9> has a constant value of 0 in block <Inst_WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_11> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_10> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_9> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_8> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_7> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_6> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_5> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_4> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_3> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_2> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_1> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_0> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_11> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_10> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_19_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_17_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_21_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_22_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_20_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_23_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_24_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_26_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_27_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_25_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_29_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_30_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_28_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_32_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_33_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_31_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_34_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_35_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_37_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_38_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <jdx_14_7> (without init value) has a constant value of 0 in block <u_wavedemux>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <win_addr_start_i_9> has a constant value of 0 in block <u_wavedemux>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_0_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_1_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_2_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_4_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_5_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_3_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_7_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_8_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_6_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_10_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_11_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_9_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_12_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_13_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_15_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_16_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_14_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_18_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_1> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_0> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <rw_i> has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_7> has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_6> has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_5> has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_4> has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_3> has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_2> has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_1> has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_0> has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_7> has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_6> has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_5> has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_4> has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_3> has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_2> has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_18> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_17> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_16> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_15> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_14> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_13> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_12> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_11> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_10> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_9> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_8> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_7> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_6> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_5> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_4> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_3> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_2> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seuscan_2> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seuscan_1> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seuscan_0> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seudet_9> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seudet_8> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seudet_7> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seudet_6> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seudet_5> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seudet_4> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seudet_3> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seudet_2> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seudet_1> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seudet_0> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <sta_b2llost> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <sta_err> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <seq_seuscan_0> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <seq_seudet_0> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_1> has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_0> has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_fake_i> (without init value) has a constant value of 0 in block <klm_scrod_trig_interface>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <mgtmod1_iq_1> (without init value) has a constant value of 1 in block <klm_scrod_trig_interface>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <mgtmod2_iq_1> (without init value) has a constant value of 1 in block <klm_scrod_trig_interface>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <mgttxdis_iq_1> (without init value) has a constant value of 0 in block <klm_scrod_trig_interface>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <gen_pad_r> (without init value) has a constant value of 0 in block <sym_gen_i>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <GEN_PAD_Buffer> (without init value) has a constant value of 0 in block <tx_ll_datapath_i>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <storage_pad_r> (without init value) has a constant value of 0 in block <tx_ll_datapath_i>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <sta_err> has a constant value of 0 in block <map_b2>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <seq_err_0> has a constant value of 0 in block <map_b2>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <sig_dbg_10> has a constant value of 0 in block <map_fifo>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seuscan_7> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seuscan_6> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seuscan_5> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seuscan_4> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seuscan_3> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_137_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_138_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_136_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_140_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_141_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_139_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_143_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_144_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_142_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_145_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_146_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_148_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_149_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_147_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_151_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_152_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_150_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_154_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_155_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_153_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_114_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_118_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_119_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_117_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_121_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_122_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_120_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_123_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_124_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_126_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_127_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_125_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_129_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_130_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_128_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_132_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_133_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_131_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_134_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_135_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_19> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_20> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_21> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_0> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_1> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_2> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_3> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_4> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_5> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_6> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_7> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <update_i> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <busy_i> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <rw_i> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <update_req_i0_1> (without init value) has a constant value of 0 in block <uut_pedram>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <update_req_edg_1> (without init value) has a constant value of 0 in block <uut_pedram>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_157_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_158_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_156_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <status_regs_159_12> (without init value) has a constant value of 0 in block <uut>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_3> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_4> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_5> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_6> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_7> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_8> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_9> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_10> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_11> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_12> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_13> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_14> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_4> (without init value) has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <seq_seudet_1> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_3> (without init value) has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_14_7> (without init value) has a constant value of 0 in block <Inst_WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_15_7> (without init value) has a constant value of 1 in block <Inst_WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <seq_seuscan_1> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_2> (without init value) has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_1> (without init value) has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_23> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_22> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_21> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_20> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_19> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_18> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_17> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_16> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_15> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <status_fake_iq> (without init value) has a constant value of 0 in block <klm_scrod_trig_interface>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <update_req_i1_1> (without init value) has a constant value of 0 in block <uut_pedram>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_7> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_6> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_0> (without init value) has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <gen_pad_r> (without init value) has a constant value of 0 in block <tx_ll_datapath_i>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_1> (without init value) has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_2> (without init value) has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_3> (without init value) has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <seq_err_1> has a constant value of 0 in block <map_b2>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_4> (without init value) has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_5> (without init value) has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_6> (without init value) has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_7> (without init value) has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_5> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_4> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_3> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_2> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_1> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_0> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_14_7> (without init value) has a constant value of 0 in block <u_wavedemux>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_15_7> (without init value) has a constant value of 1 in block <u_wavedemux>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_7> (without init value) has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_6> (without init value) has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_5> (without init value) has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_0> (without init value) has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_0> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_1> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_2> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:2677 - Node <buf_bit10_8> of sequential type is unconnected in block <map_2b>.
WARNING:Xst:2677 - Node <buf_bit10_9> of sequential type is unconnected in block <map_2b>.
WARNING:Xst:2677 - Node <buf_dout_0> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_1> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_2> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_3> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_4> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_5> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_6> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_7> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_8> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_9> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_10> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_11> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_12> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_13> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_14> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_15> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_16> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_17> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_18> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_19> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_20> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_21> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_22> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_23> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_24> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_25> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_26> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_27> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_28> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_29> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_30> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_31> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_48> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_49> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_50> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_51> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_52> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_53> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_54> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_55> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_56> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_57> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_58> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_59> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_60> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_61> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_62> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_63> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_64> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_65> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_66> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_67> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_68> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_69> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_70> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_71> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_72> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_73> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_74> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_75> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_76> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_77> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_78> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_79> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_80> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_81> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_82> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_83> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_84> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_85> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_86> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_87> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_88> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_89> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_90> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_91> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_92> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_93> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_94> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_95> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <internal_WAVEFORM_DATA_INTERFACE_1> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <internal_WAVEFORM_DATA_INTERFACE_2> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <internal_WAVEFORM_DATA_INTERFACE_3> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <internal_WAVEFORM_DATA_INTERFACE_4> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <internal_WAVEFORM_DATA_INTERFACE_5> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <internal_WAVEFORM_DATA_INTERFACE_6> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <internal_WAVEFORM_DATA_INTERFACE_7> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_0> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_1> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_2> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_3> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_4> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_5> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_6> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_7> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_8> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_9> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_10> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_11> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_12> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_13> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_14> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_15> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_16> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_17> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_18> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_19> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_20> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_21> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_22> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_23> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_24> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_25> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_26> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_27> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_28> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_29> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_30> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_31> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_32> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_33> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_34> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_35> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_36> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_37> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_38> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_39> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_40> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_41> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_42> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_43> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_44> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_45> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_46> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_47> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_48> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_49> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_50> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_51> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_52> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_53> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_54> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_55> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_56> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_57> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_58> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_59> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_61> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_62> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_63> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_64> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_65> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_66> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_67> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_68> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_69> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_70> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_71> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_72> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_73> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_74> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_75> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_76> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_77> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_78> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_79> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_80> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_81> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_82> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_83> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_84> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_85> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_86> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_87> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_88> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_89> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_90> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_91> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_92> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_93> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_94> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_95> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_96> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_97> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_98> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_99> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_100> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_101> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_102> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_103> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_104> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_105> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_106> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_107> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_108> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_109> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_110> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_111> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_112> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_113> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_114> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_115> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_116> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_117> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_118> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_119> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_120> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_121> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_122> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_123> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_124> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_125> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_126> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_127> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_128> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_129> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_130> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_131> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_132> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_133> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_134> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_135> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_136> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_137> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_138> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_139> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_140> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_141> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_142> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_143> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_144> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_145> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_146> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_147> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_148> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_149> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_150> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_151> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_152> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_153> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_154> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_155> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_156> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_157> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_158> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_159> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_160> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_161> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_162> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_163> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_164> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_165> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_166> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_167> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_168> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_169> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_170> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_171> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_172> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_173> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_174> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_175> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_176> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_177> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_178> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_179> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_180> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_181> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_182> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_183> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_184> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_185> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_186> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_187> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_188> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_189> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_190> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_191> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_192> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_193> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_194> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_195> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_196> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_197> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_198> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_199> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_200> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_201> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_202> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_203> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_204> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_205> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_206> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_207> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_208> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_209> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_210> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_211> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_212> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_213> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_214> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_215> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_216> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_217> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_218> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_219> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_220> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_221> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_222> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_223> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_224> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_225> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_226> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_227> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_228> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_229> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_230> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_231> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_232> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_233> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_234> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_235> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_236> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_237> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_238> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_239> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_240> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_241> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_242> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_243> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_244> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_245> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_246> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_247> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_248> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_249> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_250> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_251> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_252> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_253> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_254> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_255> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <upperDataByte_4> of sequential type is unconnected in block <inst_mpc_adc>.
WARNING:Xst:2677 - Node <upperDataByte_5> of sequential type is unconnected in block <inst_mpc_adc>.
WARNING:Xst:2677 - Node <upperDataByte_6> of sequential type is unconnected in block <inst_mpc_adc>.
WARNING:Xst:2677 - Node <upperDataByte_7> of sequential type is unconnected in block <inst_mpc_adc>.
WARNING:Xst:2677 - Node <ped_asic_4> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_5> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_6> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_7> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_8> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_9> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_10> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_11> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_12> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_13> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_14> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_15> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_16> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_17> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_18> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_19> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_20> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_21> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_22> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_23> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_24> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_25> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_26> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_27> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_28> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_29> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_30> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ped_asic_31> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_0> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_1> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_2> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_3> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_4> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_5> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_6> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_7> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_8> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_9> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_10> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_11> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_12> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_13> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_14> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_15> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_20> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_21> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_22> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_23> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_24> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_25> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_26> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_27> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_28> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_29> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_30> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i2_31> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <sapedsub_12> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <sapedsub_13> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <sapedsub_14> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <sapedsub_15> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_4> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_5> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_6> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_7> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_8> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_9> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_10> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_11> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_12> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_13> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_14> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_15> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_16> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_17> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_18> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_19> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_20> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_21> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_22> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_23> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_24> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_25> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_26> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_27> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_28> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_29> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_30> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <ct_ch_31> of sequential type is unconnected in block <u_wavedemux>.
WARNING:Xst:2677 - Node <fifo_din_i_0> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_1> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_2> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_3> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_4> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_5> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_6> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_7> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_8> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_9> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_10> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_11> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_12> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_13> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_14> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_15> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_20> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_21> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_22> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_23> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_24> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_25> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_26> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_27> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_28> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_29> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_30> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_31> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_4> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_5> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_6> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_7> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_8> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_9> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_10> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_11> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_12> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_13> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_14> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_15> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_16> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_17> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_18> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_19> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_20> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_21> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_22> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_23> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_24> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_25> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_26> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_27> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_28> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_29> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_30> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_31> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_159<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_157<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_158<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_156<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_154<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_155<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_153<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_151<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_152<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_150<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_149<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_148<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_146<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_147<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_145<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_143<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_144<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_142<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_140<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_141<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_139<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_137<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_138<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_136<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_134<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_135<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_133<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_131<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_132<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_130<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_128<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_129<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_127<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_126<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_125<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_123<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_124<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_122<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_120<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_121<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_119<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_117<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_118<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_116<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_114<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_115<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_113<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_111<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_112<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_110<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_108<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_109<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_107<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_105<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_106<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_104<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_103<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_102<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_100<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_101<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_99<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_97<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_98<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_96<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_94<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_95<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_93<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_91<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_92<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_90<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_88<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_89<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_87<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_85<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_86<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_84<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_82<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_83<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_81<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_80<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_79<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_77<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_78<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_76<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_74<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_75<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_73<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_71<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_72<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_70<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_68<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_69<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_67<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_65<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_66<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_64<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_62<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_63<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_61<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_59<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_60<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_58<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_57<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_56<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_54<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_55<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_53<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_51<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_52<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_50<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_48<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_49<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_47<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_45<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_46<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_44<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_42<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_43<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_41<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_39<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_40<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_38<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_36<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_37<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_35<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_34<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_33<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_31<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_32<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_30<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_28<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_29<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_27<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_25<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_26<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_24<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_22<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_23<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_21<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_19<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_20<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_18<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_16<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_17<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_15<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_13<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_14<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_12<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_11<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_10<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_8<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_9<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_7<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_5<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_6<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_4<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_2<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_3<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_1<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <status_regs_0<15:12>> (without init value) have a constant value of 0 in block <update_status_regs>.
WARNING:Xst:2404 -  FFs/Latches <jdx_7<10:10>> (without init value) have a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx_6<10:10>> (without init value) have a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx_4<10:10>> (without init value) have a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx_5<10:10>> (without init value) have a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx_3<10:9>> (without init value) have a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx_2<10:9>> (without init value) have a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx_1<10:8>> (without init value) have a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx_0<10:7>> (without init value) have a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx_7<10:10>> (without init value) have a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx_5<10:10>> (without init value) have a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx_6<10:10>> (without init value) have a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx_4<10:10>> (without init value) have a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx_3<10:9>> (without init value) have a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx_2<10:9>> (without init value) have a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx_1<10:8>> (without init value) have a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx_0<10:7>> (without init value) have a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx2_7<10:10>> (without init value) have a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx2_5<10:10>> (without init value) have a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx2_6<10:10>> (without init value) have a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx2_4<10:10>> (without init value) have a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx2_2<10:9>> (without init value) have a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx2_3<10:9>> (without init value) have a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx2_1<10:8>> (without init value) have a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx2_0<10:7>> (without init value) have a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx2_6<10:10>> (without init value) have a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx2_7<10:10>> (without init value) have a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx2_5<10:10>> (without init value) have a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx2_4<10:10>> (without init value) have a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx2_3<10:9>> (without init value) have a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx2_2<10:9>> (without init value) have a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx2_1<10:8>> (without init value) have a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2404 -  FFs/Latches <jdx2_0<10:7>> (without init value) have a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>.

Synthesizing (advanced) Unit <CHANNEL_INIT_SM>.
The following registers are absorbed into counter <free_count_r>: 1 register on signal <free_count_r>.
Unit <CHANNEL_INIT_SM> synthesized (advanced).

Synthesizing (advanced) Unit <IDLE_AND_VER_GEN>.
The following registers are absorbed into counter <downcounter_r>: 1 register on signal <downcounter_r>.
Unit <IDLE_AND_VER_GEN> synthesized (advanced).

Synthesizing (advanced) Unit <LANE_INIT_SM>.
The following registers are absorbed into counter <counter1_r>: 1 register on signal <counter1_r>.
Unit <LANE_INIT_SM> synthesized (advanced).

Synthesizing (advanced) Unit <Module_ADC_MCP3221_I2C_new>.
The following registers are absorbed into counter <clkCounter>: 1 register on signal <clkCounter>.
The following registers are absorbed into counter <idxBit>: 1 register on signal <idxBit>.
INFO:Xst:3218 - HDL ADVISOR - The RAM <Mram_dataToWrite> will be implemented on LUTs either because you have described an asynchronous read or because of currently unsupported block RAM features. If you have described an asynchronous read, making it synchronous would allow you to take advantage of available block RAM resources, for optimized device usage and improved timings. Please refer to your documentation for coding guidelines.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 8-word x 1-bit                      |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <GND_491_o_GND_491_o_sub_70_OUT> |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to internal node          |          |
    -----------------------------------------------------------------------
Unit <Module_ADC_MCP3221_I2C_new> synthesized (advanced).

Synthesizing (advanced) Unit <OutputBufferControl>.
The following registers are absorbed into counter <INTERNAL_COUNTER>: 1 register on signal <INTERNAL_COUNTER>.
Unit <OutputBufferControl> synthesized (advanced).

Synthesizing (advanced) Unit <PedRAMaccess>.
The following registers are absorbed into counter <idx>: 1 register on signal <idx>.
Unit <PedRAMaccess> synthesized (advanced).

Synthesizing (advanced) Unit <ReadoutControl>.
The following registers are absorbed into counter <internal_win_cnt>: 1 register on signal <internal_win_cnt>.
The following registers are absorbed into counter <internal_asic_cnt>: 1 register on signal <internal_asic_cnt>.
The following registers are absorbed into counter <internal_EVENT_NUM>: 1 register on signal <internal_EVENT_NUM>.
Unit <ReadoutControl> synthesized (advanced).

Synthesizing (advanced) Unit <SRAMiface2>.
The following registers are absorbed into counter <cnt_tHZOE>: 1 register on signal <cnt_tHZOE>.
The following registers are absorbed into counter <cnt_tWEND>: 1 register on signal <cnt_tWEND>.
The following registers are absorbed into counter <cnt_tRDOUT>: 1 register on signal <cnt_tRDOUT>.
The following registers are absorbed into counter <cnt_tREND>: 1 register on signal <cnt_tREND>.
Unit <SRAMiface2> synthesized (advanced).

Synthesizing (advanced) Unit <SamplingLgc>.
The following registers are absorbed into counter <started_cntr>: 1 register on signal <started_cntr>.
Unit <SamplingLgc> synthesized (advanced).

Synthesizing (advanced) Unit <SerialDataRout>.
The following registers are absorbed into counter <internal_samplesel>: 1 register on signal <internal_samplesel>.
The following registers are absorbed into counter <BIT_CNT>: 1 register on signal <BIT_CNT>.
Unit <SerialDataRout> synthesized (advanced).

Synthesizing (advanced) Unit <TARGETX_DAC_CONTROL>.
The following registers are absorbed into counter <INTERNAL_COUNTER>: 1 register on signal <INTERNAL_COUNTER>.
The following registers are absorbed into counter <cnt>: 1 register on signal <cnt>.
Unit <TARGETX_DAC_CONTROL> synthesized (advanced).

Synthesizing (advanced) Unit <WaveformDemuxCalcPedsBRAM>.
The following registers are absorbed into counter <ped_ch>: 1 register on signal <ped_ch>.
Unit <WaveformDemuxCalcPedsBRAM> synthesized (advanced).

Synthesizing (advanced) Unit <WaveformDemuxPedsubDSPBRAM>.
The following registers are absorbed into counter <ped_ch>: 1 register on signal <ped_ch>.
The following registers are absorbed into counter <sa_cnt>: 1 register on signal <sa_cnt>.
The following registers are absorbed into counter <ct_cnt>: 1 register on signal <ct_cnt>.
INFO:Xst:3231 - The small RAM <Mram_ct_lpt> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 16-word x 16-bit                    |          |
    |     clkA           | connected to signal <clk>           | rise     |
    |     weA            | connected to internal node          | high     |
    |     addrA          | connected to signal <ct_ch>         |          |
    |     diA            | connected to signal <("000000000",ct_sa)> |          |
    -----------------------------------------------------------------------
    | Port B                                                              |
    |     aspect ratio   | 16-word x 16-bit                    |          |
    |     addrB          | connected to signal <ct_cnt<3:0>>   |          |
    |     doB            | connected to internal node          |          |
    -----------------------------------------------------------------------
INFO:Xst:3231 - The small RAM <Mram_ct_lpv> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 16-word x 16-bit                    |          |
    |     clkA           | connected to signal <clk>           | rise     |
    |     weA            | connected to internal node          | high     |
    |     addrA          | connected to signal <ct_ch>         |          |
    |     diA            | connected to signal <samem<1>>      |          |
    |     doA            | connected to internal node          |          |
    -----------------------------------------------------------------------
    | Port B                                                              |
    |     aspect ratio   | 16-word x 16-bit                    |          |
    |     addrB          | connected to signal <ct_cnt<3:0>>   |          |
    |     doB            | connected to internal node          |          |
    -----------------------------------------------------------------------
Unit <WaveformDemuxPedsubDSPBRAM> synthesized (advanced).

Synthesizing (advanced) Unit <b2tt_deoctet>.
The following registers are absorbed into counter <cnt_incdelay>: 1 register on signal <cnt_incdelay>.
The following registers are absorbed into counter <cnt_invalid>: 1 register on signal <cnt_invalid>.
The following registers are absorbed into counter <cnt_datoctet>: 1 register on signal <cnt_datoctet>.
Unit <b2tt_deoctet> synthesized (advanced).

Synthesizing (advanced) Unit <b2tt_depacket>.
The following registers are absorbed into counter <cnt_divseq1>: 1 register on signal <cnt_divseq1>.
The following registers are absorbed into counter <cnt_divseq2>: 1 register on signal <cnt_divseq2>.
The following registers are absorbed into counter <cnt_ctime>: 1 register on signal <cnt_ctime>.
The following registers are absorbed into counter <cnt_timer>: 1 register on signal <cnt_timer>.
The following registers are absorbed into counter <cnt_utime>: 1 register on signal <cnt_utime>.
The following registers are absorbed into counter <cnt_revoclk>: 1 register on signal <cnt_revoclk>.
Unit <b2tt_depacket> synthesized (advanced).

Synthesizing (advanced) Unit <b2tt_detrig>.
The following registers are absorbed into counter <cnt_dbg1>: 1 register on signal <cnt_dbg1>.
The following registers are absorbed into counter <cnt_dbg2>: 1 register on signal <cnt_dbg2>.
The following registers are absorbed into counter <cnt_trig>: 1 register on signal <cnt_trig>.
Unit <b2tt_detrig> synthesized (advanced).

Synthesizing (advanced) Unit <b2tt_encounter>.
The following registers are absorbed into counter <cnt_octet>: 1 register on signal <cnt_octet>.
The following registers are absorbed into counter <cnt_bit2>: 1 register on signal <cnt_bit2>.
The following registers are absorbed into counter <cnt_packet>: 1 register on signal <cnt_packet>.
Unit <b2tt_encounter> synthesized (advanced).

Synthesizing (advanced) Unit <b2tt_fifo>.
The following registers are absorbed into counter <cnt_skip>: 1 register on signal <cnt_skip>.
The following registers are absorbed into counter <buf_addra>: 1 register on signal <buf_addra>.
The following registers are absorbed into counter <buf_addrb>: 1 register on signal <buf_addrb>.
Unit <b2tt_fifo> synthesized (advanced).

Synthesizing (advanced) Unit <b2tt_iscan>.
The following registers are absorbed into counter <cnt_dbg>: 1 register on signal <cnt_dbg>.
The following registers are absorbed into counter <sta_ezero>: 1 register on signal <sta_ezero>.
The following registers are absorbed into counter <cnt_islip_0>: 1 register on signal <cnt_islip_0>.
The following registers are absorbed into counter <cnt_delay>: 1 register on signal <cnt_delay>.
Unit <b2tt_iscan> synthesized (advanced).

Synthesizing (advanced) Unit <b2tt_payload>.
The following registers are absorbed into counter <cnt_seuscan>: 1 register on signal <cnt_seuscan>.
The following registers are absorbed into counter <cnt_seudet>: 1 register on signal <cnt_seudet>.
The following registers are absorbed into counter <cnt_payload>: 1 register on signal <cnt_payload>.
The following registers are absorbed into counter <cnt_b2lwe>: 1 register on signal <cnt_b2lwe>.
The following registers are absorbed into counter <cnt_b2ltag>: 1 register on signal <cnt_b2ltag>.
Unit <b2tt_payload> synthesized (advanced).

Synthesizing (advanced) Unit <clock_enable_generator_1>.
The following registers are absorbed into counter <internal_COUNTER>: 1 register on signal <internal_COUNTER>.
Unit <clock_enable_generator_1> synthesized (advanced).

Synthesizing (advanced) Unit <clock_enable_generator_2>.
The following registers are absorbed into counter <internal_COUNTER>: 1 register on signal <internal_COUNTER>.
Unit <clock_enable_generator_2> synthesized (advanced).

Synthesizing (advanced) Unit <conc_intfc>.
The following registers are absorbed into counter <stspkt_ctr>: 1 register on signal <stspkt_ctr>.
The following registers are absorbed into counter <trgsof_ctr>: 1 register on signal <trgsof_ctr>.
The following registers are absorbed into counter <pkttp_ctr>: 1 register on signal <pkttp_ctr>.
The following registers are absorbed into counter <trgeof_ctr>: 1 register on signal <trgeof_ctr>.
The following registers are absorbed into counter <trgpkt_ctr>: 1 register on signal <trgpkt_ctr>.
Unit <conc_intfc> synthesized (advanced).

Synthesizing (advanced) Unit <daq_gen>.
The following registers are absorbed into counter <missed_trg>: 1 register on signal <missed_trg>.
The following registers are absorbed into counter <tdc_ctr>: 1 register on signal <tdc_ctr>.
The following registers are absorbed into counter <abd_ctr>: 1 register on signal <abd_ctr>.
The following registers are absorbed into counter <pdt_ctr>: 1 register on signal <pdt_ctr>.
The following registers are absorbed into counter <pdw_ctr>: 1 register on signal <pdw_ctr>.
The following registers are absorbed into counter <pds_ctr>: 1 register on signal <pds_ctr>.
Unit <daq_gen> synthesized (advanced).

Synthesizing (advanced) Unit <detect_usb>.
The following registers are absorbed into counter <internal_WATCHDOG_COUNTER>: 1 register on signal <internal_WATCHDOG_COUNTER>.
The following registers are absorbed into counter <internal_READ_ENABLE_COUNTER>: 1 register on signal <internal_READ_ENABLE_COUNTER>.
Unit <detect_usb> synthesized (advanced).

Synthesizing (advanced) Unit <event_builder>.
The following registers are absorbed into accumulator <internal_CHECKSUM>: 1 register on signal <internal_CHECKSUM>.
The following registers are absorbed into counter <internal_PACKET_COUNTER>: 1 register on signal <internal_PACKET_COUNTER>.
Unit <event_builder> synthesized (advanced).

Synthesizing (advanced) Unit <mppc_dacs>.
INFO:Xst:3231 - The small RAM <Mram_i_dac_mask> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 16-word x 10-bit                    |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <i_dac_number>  |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to signal <i_dac_mask>    |          |
    -----------------------------------------------------------------------
Unit <mppc_dacs> synthesized (advanced).

Synthesizing (advanced) Unit <pulse_transition>.
The following registers are absorbed into counter <i_counter>: 1 register on signal <i_counter>.
Unit <pulse_transition> synthesized (advanced).

Synthesizing (advanced) Unit <scrod_top_A4>.
INFO:Xst:3218 - HDL ADVISOR - The RAM <Mram_internal_SROUT_ASIC_CONTROL_WORD> will be implemented on LUTs either because you have described an asynchronous read or because of currently unsupported block RAM features. If you have described an asynchronous read, making it synchronous would allow you to take advantage of available block RAM resources, for optimized device usage and improved timings. Please refer to your documentation for coding guidelines.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 16-word x 10-bit                    |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <internal_READCTRL_ASIC_NUM> |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to signal <internal_SROUT_ASIC_CONTROL_WORD> |          |
    -----------------------------------------------------------------------
Unit <scrod_top_A4> synthesized (advanced).

Synthesizing (advanced) Unit <tdc_channel_1>.
The following registers are absorbed into counter <counter>: 1 register on signal <counter>.
INFO:Xst:3231 - The small RAM <Mram__n0069> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 32-word x 5-bit                     |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <tb_q4>         |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to internal node          |          |
    -----------------------------------------------------------------------
Unit <tdc_channel_1> synthesized (advanced).

Synthesizing (advanced) Unit <tdc_channel_10>.
The following registers are absorbed into counter <counter>: 1 register on signal <counter>.
INFO:Xst:3231 - The small RAM <Mram_tb_q4[5]_PWR_428_o_Mux_10_o> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 32-word x 1-bit                     |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <tb_q4>         |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to internal node          |          |
    -----------------------------------------------------------------------
INFO:Xst:3231 - The small RAM <Mram_tb_q4[5]_GND_399_o_wide_mux_11_OUT> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 32-word x 4-bit                     |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <tb_q4>         |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to internal node          |          |
    -----------------------------------------------------------------------
Unit <tdc_channel_10> synthesized (advanced).

Synthesizing (advanced) Unit <tdc_channel_2>.
The following registers are absorbed into counter <counter>: 1 register on signal <counter>.
INFO:Xst:3231 - The small RAM <Mram_tb_q4[5]_PWR_220_o_Mux_10_o> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 32-word x 1-bit                     |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <tb_q4>         |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to internal node          |          |
    -----------------------------------------------------------------------
INFO:Xst:3231 - The small RAM <Mram_tb_q4[5]_GND_271_o_wide_mux_11_OUT> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 32-word x 4-bit                     |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <tb_q4>         |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to internal node          |          |
    -----------------------------------------------------------------------
Unit <tdc_channel_2> synthesized (advanced).

Synthesizing (advanced) Unit <tdc_channel_3>.
The following registers are absorbed into counter <counter>: 1 register on signal <counter>.
INFO:Xst:3231 - The small RAM <Mram_tb_q4[5]_PWR_246_o_Mux_10_o> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 32-word x 1-bit                     |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <tb_q4>         |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to internal node          |          |
    -----------------------------------------------------------------------
INFO:Xst:3231 - The small RAM <Mram_tb_q4[5]_GND_287_o_wide_mux_11_OUT> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 32-word x 4-bit                     |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <tb_q4>         |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to internal node          |          |
    -----------------------------------------------------------------------
Unit <tdc_channel_3> synthesized (advanced).

Synthesizing (advanced) Unit <tdc_channel_4>.
The following registers are absorbed into counter <counter>: 1 register on signal <counter>.
INFO:Xst:3231 - The small RAM <Mram_tb_q4[5]_PWR_272_o_Mux_10_o> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 32-word x 1-bit                     |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <tb_q4>         |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to internal node          |          |
    -----------------------------------------------------------------------
INFO:Xst:3231 - The small RAM <Mram_tb_q4[5]_GND_303_o_wide_mux_11_OUT> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 32-word x 4-bit                     |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <tb_q4>         |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to internal node          |          |
    -----------------------------------------------------------------------
Unit <tdc_channel_4> synthesized (advanced).

Synthesizing (advanced) Unit <tdc_channel_5>.
The following registers are absorbed into counter <counter>: 1 register on signal <counter>.
INFO:Xst:3231 - The small RAM <Mram_tb_q4[5]_PWR_298_o_Mux_10_o> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 32-word x 1-bit                     |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <tb_q4>         |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to internal node          |          |
    -----------------------------------------------------------------------
INFO:Xst:3231 - The small RAM <Mram_tb_q4[5]_GND_319_o_wide_mux_11_OUT> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 32-word x 4-bit                     |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <tb_q4>         |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to internal node          |          |
    -----------------------------------------------------------------------
Unit <tdc_channel_5> synthesized (advanced).

Synthesizing (advanced) Unit <tdc_channel_6>.
The following registers are absorbed into counter <counter>: 1 register on signal <counter>.
INFO:Xst:3231 - The small RAM <Mram_tb_q4[5]_PWR_324_o_Mux_10_o> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 32-word x 1-bit                     |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <tb_q4>         |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to internal node          |          |
    -----------------------------------------------------------------------
INFO:Xst:3231 - The small RAM <Mram_tb_q4[5]_GND_335_o_wide_mux_11_OUT> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 32-word x 4-bit                     |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <tb_q4>         |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to internal node          |          |
    -----------------------------------------------------------------------
Unit <tdc_channel_6> synthesized (advanced).

Synthesizing (advanced) Unit <tdc_channel_7>.
The following registers are absorbed into counter <counter>: 1 register on signal <counter>.
INFO:Xst:3231 - The small RAM <Mram_tb_q4[5]_PWR_350_o_Mux_10_o> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 32-word x 1-bit                     |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <tb_q4>         |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to internal node          |          |
    -----------------------------------------------------------------------
INFO:Xst:3231 - The small RAM <Mram_tb_q4[5]_GND_351_o_wide_mux_11_OUT> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 32-word x 4-bit                     |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <tb_q4>         |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to internal node          |          |
    -----------------------------------------------------------------------
Unit <tdc_channel_7> synthesized (advanced).

Synthesizing (advanced) Unit <tdc_channel_8>.
The following registers are absorbed into counter <counter>: 1 register on signal <counter>.
INFO:Xst:3231 - The small RAM <Mram_tb_q4[5]_PWR_376_o_Mux_10_o> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 32-word x 1-bit                     |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <tb_q4>         |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to internal node          |          |
    -----------------------------------------------------------------------
INFO:Xst:3231 - The small RAM <Mram_tb_q4[5]_GND_367_o_wide_mux_11_OUT> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 32-word x 4-bit                     |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <tb_q4>         |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to internal node          |          |
    -----------------------------------------------------------------------
Unit <tdc_channel_8> synthesized (advanced).

Synthesizing (advanced) Unit <tdc_channel_9>.
The following registers are absorbed into counter <counter>: 1 register on signal <counter>.
INFO:Xst:3231 - The small RAM <Mram_tb_q4[5]_PWR_402_o_Mux_10_o> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 32-word x 1-bit                     |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <tb_q4>         |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to internal node          |          |
    -----------------------------------------------------------------------
INFO:Xst:3231 - The small RAM <Mram_tb_q4[5]_GND_383_o_wide_mux_11_OUT> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 32-word x 4-bit                     |          |
    |     weA            | connected to signal <GND>           | high     |
    |     addrA          | connected to signal <tb_q4>         |          |
    |     diA            | connected to signal <GND>           |          |
    |     doA            | connected to internal node          |          |
    -----------------------------------------------------------------------
Unit <tdc_channel_9> synthesized (advanced).

Synthesizing (advanced) Unit <tdc_fifo>.
The following registers are absorbed into counter <wr_ptr>: 1 register on signal <wr_ptr>.
The following registers are absorbed into counter <rd_ptr>: 1 register on signal <rd_ptr>.
The following registers are absorbed into counter <flag_ptr>: 1 register on signal <flag_ptr>.
INFO:Xst:3231 - The small RAM <Mram_dpram_t> will be implemented on LUTs in order to maximize performance and save block RAM resources. If you want to force its implementation on block, use option/constraint ram_style.
    -----------------------------------------------------------------------
    | ram_type           | Distributed                         |          |
    -----------------------------------------------------------------------
    | Port A                                                              |
    |     aspect ratio   | 4-word x 13-bit                     |          |
    |     clkA           | connected to signal <clk>           | rise     |
    |     weA            | connected to signal <wr>            | high     |
    |     addrA          | connected to signal <wr_ptr>        |          |
    |     diA            | connected to signal <din>           |          |
    -----------------------------------------------------------------------
    | Port B                                                              |
    |     aspect ratio   | 4-word x 13-bit                     |          |
    |     addrB          | connected to signal <rd_ptr>        |          |
    |     doB            | connected to internal node          |          |
    -----------------------------------------------------------------------
Unit <tdc_fifo> synthesized (advanced).

Synthesizing (advanced) Unit <time_order>.
The following registers are absorbed into counter <rdfail_ctr>: 1 register on signal <rdfail_ctr>.
Unit <time_order> synthesized (advanced).

Synthesizing (advanced) Unit <timing_ctrl>.
The following registers are absorbed into counter <tce_cnt_0>: 1 register on signal <tce_cnt_0>.
Unit <timing_ctrl> synthesized (advanced).

Synthesizing (advanced) Unit <trigger_scaler_single_channel>.
The following registers are absorbed into counter <internal_COUNTER>: 1 register on signal <internal_COUNTER>.
Unit <trigger_scaler_single_channel> synthesized (advanced).

Synthesizing (advanced) Unit <trigger_scaler_timing_generator>.
The following registers are absorbed into counter <internal_COUNTER>: 1 register on signal <internal_COUNTER>.
Unit <trigger_scaler_timing_generator> synthesized (advanced).

Synthesizing (advanced) Unit <usb_init>.
The following registers are absorbed into counter <counter>: 1 register on signal <counter>.
The following registers are absorbed into counter <usb_clk_rst_cnt>: 1 register on signal <usb_clk_rst_cnt>.
Unit <usb_init> synthesized (advanced).

Synthesizing (advanced) Unit <usb_slave_fifo_interface>.
The following registers are absorbed into counter <u2f_cs_timeout_cnt>: 1 register on signal <u2f_cs_timeout_cnt>.
The following registers are absorbed into counter <u2f_data_timeout_cnt>: 1 register on signal <u2f_data_timeout_cnt>.
The following registers are absorbed into counter <f2u_cs_timeout_cnt>: 1 register on signal <f2u_cs_timeout_cnt>.
The following registers are absorbed into counter <f2u_cs_transferred_length>: 1 register on signal <f2u_cs_transferred_length>.
The following registers are absorbed into counter <u2f_data_transferred_length>: 1 register on signal <u2f_data_transferred_length>.
The following registers are absorbed into counter <f2u_data_timeout_cnt>: 1 register on signal <f2u_data_timeout_cnt>.
The following registers are absorbed into counter <f2u_data_transferred_length>: 1 register on signal <f2u_data_transferred_length>.
Unit <usb_slave_fifo_interface> synthesized (advanced).
WARNING:Xst:2677 - Node <internal_WAVEFORM_DATA_INTERFACE_2> of sequential type is unconnected in block <readout_interface>.
WARNING:Xst:2677 - Node <internal_WAVEFORM_DATA_INTERFACE_3> of sequential type is unconnected in block <readout_interface>.
WARNING:Xst:2677 - Node <internal_WAVEFORM_DATA_INTERFACE_4> of sequential type is unconnected in block <readout_interface>.
WARNING:Xst:2677 - Node <internal_WAVEFORM_DATA_INTERFACE_5> of sequential type is unconnected in block <readout_interface>.
WARNING:Xst:2677 - Node <internal_WAVEFORM_DATA_INTERFACE_6> of sequential type is unconnected in block <readout_interface>.
WARNING:Xst:2677 - Node <internal_WAVEFORM_DATA_INTERFACE_7> of sequential type is unconnected in block <readout_interface>.
WARNING:Xst:2677 - Node <upperDataByte_4> of sequential type is unconnected in block <Module_ADC_MCP3221_I2C_new>.
WARNING:Xst:2677 - Node <upperDataByte_5> of sequential type is unconnected in block <Module_ADC_MCP3221_I2C_new>.
WARNING:Xst:2677 - Node <upperDataByte_6> of sequential type is unconnected in block <Module_ADC_MCP3221_I2C_new>.
WARNING:Xst:2677 - Node <upperDataByte_7> of sequential type is unconnected in block <Module_ADC_MCP3221_I2C_new>.
WARNING:Xst:2677 - Node <ped_asic_4> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_5> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_6> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_7> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_8> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_9> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_10> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_11> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_12> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_13> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_14> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_15> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_16> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_17> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_18> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_19> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_20> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_21> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_22> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_23> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_24> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_25> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_26> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_27> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_28> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_29> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_30> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ped_asic_31> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_0> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_1> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_2> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_3> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_4> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_5> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_6> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_7> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_8> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_9> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_10> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_11> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_12> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_13> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_14> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_15> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_20> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_21> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_22> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_23> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_24> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_25> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_26> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_27> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_28> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_29> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_30> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i2_31> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_4> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_5> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_6> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_7> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_8> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_9> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_10> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_11> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_12> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_13> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_14> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_15> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_16> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_17> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_18> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_19> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_20> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_21> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_22> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_23> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_24> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_25> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_26> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_27> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_28> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_29> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_30> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <ct_ch_31> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <sapedsub_12> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <sapedsub_13> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <sapedsub_14> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <sapedsub_15> of sequential type is unconnected in block <WaveformDemuxPedsubDSPBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_0> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_1> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_2> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_3> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_4> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_5> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_6> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_7> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_8> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_9> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_10> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_11> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_12> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_13> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_14> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_15> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_20> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_21> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_22> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_23> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_24> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_25> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_26> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_27> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_28> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_29> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_30> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <fifo_din_i_31> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_4> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_5> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_6> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_7> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_8> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_9> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_10> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_11> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_12> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_13> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_14> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_15> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_16> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_17> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_18> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_19> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_20> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_21> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_22> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_23> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_24> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_25> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_26> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_27> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_28> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_29> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_30> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <dmx_asic_31> of sequential type is unconnected in block <WaveformDemuxCalcPedsBRAM>.

=========================================================================
Advanced HDL Synthesis Report

Macro Statistics
# RAMs                                                 : 34
 16x10-bit single-port distributed Read Only RAM       : 2
 16x16-bit dual-port distributed RAM                   : 2
 32x1-bit single-port distributed Read Only RAM        : 9
 32x4-bit single-port distributed Read Only RAM        : 9
 32x5-bit single-port distributed Read Only RAM        : 1
 4x13-bit dual-port distributed RAM                    : 10
 8x1-bit single-port distributed Read Only RAM         : 1
# Multipliers                                          : 2
 22x2-bit multiplier                                   : 2
# Adders/Subtractors                                   : 75
 10-bit adder                                          : 4
 10-bit subtractor                                     : 4
 11-bit adder                                          : 2
 13-bit adder                                          : 1
 16-bit adder                                          : 17
 16-bit subtractor                                     : 1
 2-bit adder                                           : 2
 20-bit adder                                          : 1
 22-bit adder                                          : 4
 27-bit adder                                          : 1
 27-bit subtractor                                     : 1
 3-bit adder                                           : 1
 3-bit subtractor                                      : 2
 32-bit adder                                          : 9
 32-bit subtractor                                     : 6
 4-bit subtractor                                      : 1
 5-bit adder                                           : 4
 5-bit subtractor                                      : 2
 6-bit adder                                           : 1
 6-bit subtractor                                      : 2
 8-bit adder                                           : 2
 8-bit subtractor                                      : 1
 9-bit adder                                           : 4
 9-bit subtractor                                      : 2
# Counters                                             : 155
 1-bit down counter                                    : 1
 1-bit up counter                                      : 1
 10-bit up counter                                     : 12
 11-bit down counter                                   : 1
 11-bit up counter                                     : 1
 12-bit up counter                                     : 1
 16-bit down counter                                   : 1
 16-bit up counter                                     : 18
 2-bit down counter                                    : 2
 2-bit up counter                                      : 20
 2-bit updown counter                                  : 11
 25-bit up counter                                     : 10
 27-bit up counter                                     : 1
 3-bit down counter                                    : 1
 3-bit up counter                                      : 1
 32-bit up counter                                     : 31
 4-bit down counter                                    : 3
 4-bit up counter                                      : 3
 5-bit down counter                                    : 1
 5-bit up counter                                      : 1
 6-bit down counter                                    : 1
 6-bit up counter                                      : 2
 7-bit down counter                                    : 2
 8-bit up counter                                      : 16
 8-bit updown counter                                  : 1
 9-bit up counter                                      : 12
# Accumulators                                         : 1
 32-bit up accumulator                                 : 1
# Registers                                            : 14383
 Flip-Flops                                            : 14383
# Comparators                                          : 91
 10-bit comparator equal                               : 2
 10-bit comparator greater                             : 5
 10-bit comparator lessequal                           : 4
 13-bit comparator greater                             : 3
 16-bit comparator greater                             : 6
 16-bit comparator lessequal                           : 2
 16-bit comparator not equal                           : 1
 17-bit comparator not equal                           : 1
 2-bit comparator equal                                : 1
 2-bit comparator greater                              : 10
 20-bit comparator equal                               : 1
 27-bit comparator equal                               : 1
 27-bit comparator not equal                           : 1
 3-bit comparator equal                                : 1
 3-bit comparator greater                              : 1
 3-bit comparator lessequal                            : 1
 32-bit comparator equal                               : 2
 32-bit comparator greater                             : 17
 32-bit comparator not equal                           : 1
 4-bit comparator greater                              : 5
 5-bit comparator greater                              : 5
 5-bit comparator lessequal                            : 1
 6-bit comparator greater                              : 2
 7-bit comparator equal                                : 1
 7-bit comparator greater                              : 2
 8-bit comparator greater                              : 3
 8-bit comparator lessequal                            : 10
 9-bit comparator greater                              : 1
# Multiplexers                                         : 2125
 1-bit 10-to-1 multiplexer                             : 1
 1-bit 16-to-1 multiplexer                             : 11
 1-bit 19-to-1 multiplexer                             : 1
 1-bit 2-to-1 multiplexer                              : 1470
 1-bit 3-to-1 multiplexer                              : 3
 1-bit 30-to-1 multiplexer                             : 1
 1-bit 4-to-1 multiplexer                              : 6
 1-bit 7-to-1 multiplexer                              : 8
 10-bit 2-to-1 multiplexer                             : 10
 11-bit 16-to-1 multiplexer                            : 2
 11-bit 2-to-1 multiplexer                             : 5
 11-bit 3-to-1 multiplexer                             : 1
 112-bit 2-to-1 multiplexer                            : 2
 13-bit 2-to-1 multiplexer                             : 7
 16-bit 16-to-1 multiplexer                            : 2
 16-bit 2-to-1 multiplexer                             : 38
 16-bit 3-to-1 multiplexer                             : 1
 16-bit 4-to-1 multiplexer                             : 1
 16-bit 446-to-1 multiplexer                           : 1
 18-bit 2-to-1 multiplexer                             : 8
 2-bit 2-to-1 multiplexer                              : 26
 20-bit 2-to-1 multiplexer                             : 2
 22-bit 2-to-1 multiplexer                             : 4
 22-bit 4-to-1 multiplexer                             : 3
 3-bit 2-to-1 multiplexer                              : 28
 32-bit 2-to-1 multiplexer                             : 226
 4-bit 2-to-1 multiplexer                              : 12
 5-bit 2-to-1 multiplexer                              : 49
 6-bit 2-to-1 multiplexer                              : 9
 77-bit 2-to-1 multiplexer                             : 1
 8-bit 2-to-1 multiplexer                              : 95
 8-bit 4-to-1 multiplexer                              : 1
 8-bit 8-to-1 multiplexer                              : 1
 9-bit 2-to-1 multiplexer                              : 84
 9-bit 3-to-1 multiplexer                              : 1
 96-bit 2-to-1 multiplexer                             : 4
# FSMs                                                 : 30
# Xors                                                 : 64
 1-bit xor2                                            : 38
 1-bit xor3                                            : 15
 1-bit xor4                                            : 8
 8-bit xor2                                            : 3

=========================================================================

=========================================================================
*                         Low Level Synthesis                           *
=========================================================================
WARNING:Xst:1989 - Unit <clock_gen>: instances <map_ASIC_CTRL_clock_enable>, <map_ASIC_CTRL_clock_enable_WILK> of unit <clock_enable_generator_1> are equivalent, second instance is removed
WARNING:Xst:1989 - Unit <clock_gen>: instances <map_ASIC_CTRL_clock_enable>, <map_test_clock_enable> of unit <clock_enable_generator_1> are equivalent, second instance is removed
WARNING:Xst:1989 - Unit <clock_gen>: instances <map_ASIC_CTRL_clock_enable>, <map_FPGA_LOGIC_clock_enable> of unit <clock_enable_generator_1> are equivalent, second instance is removed
WARNING:Xst:1989 - Unit <clock_gen>: instances <map_MPPC_DAC_clock_enable>, <map_MPPC_ADC_clock_enable> of unit <clock_enable_generator_2> are equivalent, second instance is removed
WARNING:Xst:1710 - FF/Latch <status_fake_i> (without init value) has a constant value of 0 in block <klm_scrod>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <status_fake_iq> (without init value) has a constant value of 0 in block <klm_scrod>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <sta_err> has a constant value of 0 in block <b2tt_payload>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <sta_b2llost> has a constant value of 0 in block <b2tt_payload>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1426 - The value init of the FF/Latch seq_caldelay_0 hinder the constant cleaning in the block b2tt_iddr.
   You should achieve better results by setting this init to 0.
WARNING:Xst:1293 - FF/Latch <sig_dbg_10> has a constant value of 0 in block <b2tt_fifo>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <sig_dbg_11> has a constant value of 0 in block <b2tt_fifo>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <sig_dbg_22> has a constant value of 0 in block <b2tt_fifo>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <sig_dbg_23> has a constant value of 0 in block <b2tt_fifo>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <seq_err_0> has a constant value of 0 in block <b2tt_enbit2>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <sta_err> has a constant value of 0 in block <b2tt_enbit2>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <seq_err_1> has a constant value of 0 in block <b2tt_enbit2>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <storage_pad_r> (without init value) has a constant value of 0 in block <TX_LL_DATAPATH>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <gen_pad_r> (without init value) has a constant value of 0 in block <TX_LL_DATAPATH>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <SAMP_DONE_out> has a constant value of 0 in block <SerialDataRout>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1426 - The value init of the FF/Latch win_addr_start_i_31 hinder the constant cleaning in the block WaveformDemuxPedsubDSPBRAM.
   You should achieve better results by setting this init to 0.
WARNING:Xst:1710 - FF/Latch <jdx_8_9> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_8_8> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_8_7> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_10_10> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_10_9> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_10_8> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_10_7> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_11_10> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_11_9> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_11_8> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_11_7> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_9_10> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_9_9> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_9_8> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_9_7> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_12_10> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_12_9> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_1_7> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_2_8> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_2_7> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_5_9> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_5_8> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_5_7> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_4_9> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_4_8> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_4_7> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_3_8> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_3_7> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_7_9> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_7_8> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_7_7> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_6_9> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_6_8> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_6_7> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_8_10> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_26> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_25> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_24> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_23> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_22> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_21> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_20> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_19> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_18> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_17> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_16> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_15> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_14> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_13> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_12> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_11> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_10> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_9> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_12_8> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_12_7> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_13_10> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_13_9> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_13_8> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_13_7> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_14_10> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_14_9> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_14_8> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_14_7> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_15_10> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_15_9> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_15_8> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_15_7> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_30> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_29> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_28> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_27> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_7_8> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_7_7> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_5_9> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_5_8> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_5_7> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_8_10> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_8_9> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_8_8> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_8_7> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_9_10> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_9_9> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_9_8> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_7_9> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_2_7> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_2_8> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_6_7> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_6_8> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_6_9> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_4_7> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_4_8> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_4_9> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_3_7> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_3_8> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_1_7> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_14_7> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_14_8> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_14_9> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_14_10> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_15_7> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_15_8> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_15_9> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_15_10> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_11_7> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_11_8> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_11_9> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_11_10> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_13_7> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_13_8> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_13_9> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_13_10> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_12_7> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_12_8> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_12_9> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_12_10> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_10_7> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_10_8> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_10_9> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_10_10> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_9_7> (without init value) has a constant value of 1 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1426 - The value init of the FF/Latch win_addr_start_i_31 hinder the constant cleaning in the block WaveformDemuxCalcPedsBRAM.
   You should achieve better results by setting this init to 0.
WARNING:Xst:1710 - FF/Latch <jdx_4_8> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_4_7> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_5_9> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_5_8> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_5_7> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_7_9> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_7_8> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_7_7> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_6_9> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_6_8> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_6_7> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_8_10> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_8_9> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_8_8> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_8_7> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_9_10> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_9_9> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_9_8> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_9_7> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_10_10> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_10_9> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <ncnt_int_31> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <ncnt_int_30> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <ncnt_int_29> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <ncnt_int_28> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <ncnt_int_27> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <ncnt_int_26> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <ncnt_int_25> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <ncnt_int_24> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <ncnt_int_23> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <ncnt_int_22> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <ncnt_int_21> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <ncnt_int_20> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <ncnt_int_19> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <ncnt_int_18> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <ncnt_int_17> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <ncnt_int_16> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_1_7> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_2_8> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_2_7> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_3_8> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_3_7> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_4_9> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_30> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_29> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_28> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_27> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_26> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_25> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_24> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_23> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_22> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_21> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_20> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_19> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_18> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_17> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_16> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_15> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_14> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_13> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_12> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_11> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_10> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <win_addr_start_i_9> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_10_8> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_10_7> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_12_10> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_12_9> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_12_8> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_12_7> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_13_10> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_13_9> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_13_8> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_13_7> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_11_10> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_11_9> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_11_8> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_11_7> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_14_10> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_14_9> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_15_7> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_15_8> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_15_9> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_15_10> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_14_7> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx_14_8> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_5_7> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_5_8> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_5_9> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_4_7> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_4_8> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_4_9> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_3_7> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_3_8> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_2_7> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_2_8> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_1_7> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_14_8> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_14_7> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_12_10> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_12_9> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_12_8> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_12_7> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_15_10> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_15_9> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_15_8> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_15_7> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_14_9> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_14_10> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_13_7> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_13_8> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_13_9> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_13_10> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_11_7> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_11_8> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_11_9> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_11_10> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_10_7> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_10_8> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_10_9> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_10_10> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_9_7> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_9_8> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_9_9> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_9_10> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_8_7> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_8_8> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_8_9> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_8_10> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_7_7> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_7_8> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_7_9> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_6_7> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_6_8> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <jdx2_6_9> (without init value) has a constant value of 1 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_8> has a constant value of 0 in block <TDC_MPPC_DAC>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_24> has a constant value of 0 in block <TDC_MPPC_DAC>. This FF/Latch will be trimmed during the optimization process.
INFO:Xst:2261 - The FF/Latch <prev_beat_sp_d_r_3> in Unit <SYM_DEC> is equivalent to the following FF/Latch, which will be removed : <rx_sp_d_r_3> 
INFO:Xst:2261 - The FF/Latch <rx_ecp_d_r_0> in Unit <SYM_DEC> is equivalent to the following FF/Latch, which will be removed : <rx_cc_r_0> 
INFO:Xst:2261 - The FF/Latch <prev_beat_spa_d_r_0> in Unit <SYM_DEC> is equivalent to the following 2 FFs/Latches, which will be removed : <prev_beat_sp_d_r_0> <prev_beat_v_d_r_0> 
INFO:Xst:2261 - The FF/Latch <rx_v_d_r_2> in Unit <SYM_DEC> is equivalent to the following FF/Latch, which will be removed : <prev_beat_v_d_r_2> 
INFO:Xst:2261 - The FF/Latch <rx_ecp_d_r_2> in Unit <SYM_DEC> is equivalent to the following 2 FFs/Latches, which will be removed : <rx_scp_d_r_2> <rx_cc_r_2> 
INFO:Xst:2261 - The FF/Latch <prev_beat_sp_d_r_2> in Unit <SYM_DEC> is equivalent to the following FF/Latch, which will be removed : <rx_sp_d_r_2> 
INFO:Xst:2261 - The FF/Latch <rx_pad_d_r_1> in Unit <SYM_DEC> is equivalent to the following 3 FFs/Latches, which will be removed : <prev_beat_spa_d_r_3> <rx_spa_d_r_3> <got_a_d_r_3> 
INFO:Xst:2261 - The FF/Latch <rx_v_d_r_3> in Unit <SYM_DEC> is equivalent to the following FF/Latch, which will be removed : <prev_beat_v_d_r_3> 
INFO:Xst:2261 - The FF/Latch <prev_beat_spa_d_r_2> in Unit <SYM_DEC> is equivalent to the following FF/Latch, which will be removed : <rx_spa_d_r_2> 
INFO:Xst:2261 - The FF/Latch <rx_scp_d_r_1> in Unit <SYM_DEC> is equivalent to the following 5 FFs/Latches, which will be removed : <prev_beat_spa_d_r_1> <prev_beat_sp_d_r_1> <rx_spa_d_r_1> <got_a_d_r_1> <prev_beat_v_d_r_1> 
INFO:Xst:2261 - The FF/Latch <rdfail_10> in Unit <time_order> is equivalent to the following 9 FFs/Latches, which will be removed : <rdfail_9> <rdfail_8> <rdfail_7> <rdfail_6> <rdfail_5> <rdfail_4> <rdfail_3> <rdfail_2> <rdfail_1> 
INFO:Xst:2261 - The FF/Latch <tce_2x_i_0> in Unit <timing_ctrl> is equivalent to the following 4 FFs/Latches, which will be removed : <tce_2x_i_1> <tce_2x_i_2> <tce_2x_i_3> <tce_2x_i_4> 
INFO:Xst:2261 - The FF/Latch <tdcrst_i_0> in Unit <timing_ctrl> is equivalent to the following 3 FFs/Latches, which will be removed : <tdcrst_i_1> <tdcrst_i_2> <tdcrst_i_3> 
INFO:Xst:2261 - The FF/Latch <jdx_15_5> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_14_5> <jdx_13_5> <jdx_12_5> <jdx_9_5> <jdx_11_5> <jdx_10_5> <jdx_8_5> <jdx_6_5> <jdx_7_5> <jdx_3_5> <jdx_4_5> <jdx_5_5> <jdx_0_5> <jdx_2_5> <jdx_1_5> 
INFO:Xst:2261 - The FF/Latch <jdx_15_6> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_14_6> <jdx_13_6> <jdx_12_6> <jdx_9_6> <jdx_11_6> <jdx_10_6> <jdx_8_6> <jdx_6_6> <jdx_7_6> <jdx_3_6> <jdx_4_6> <jdx_5_6> <jdx_0_6> <jdx_2_6> <jdx_1_6> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_0> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_0> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_1> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_1> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_2> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_2> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_3> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_3> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_4> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_4> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_5> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_5> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_6> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_6> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_7> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_7> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_8> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_8> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_9> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_9> 
INFO:Xst:2261 - The FF/Latch <jdx_15_0> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_14_0> <jdx_13_0> <jdx_12_0> <jdx_9_0> <jdx_11_0> <jdx_10_0> <jdx_8_0> <jdx_6_0> <jdx_7_0> <jdx_3_0> <jdx_4_0> <jdx_5_0> <jdx_0_0> <jdx_2_0> <jdx_1_0> 
INFO:Xst:2261 - The FF/Latch <jdx_15_1> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_14_1> <jdx_13_1> <jdx_12_1> <jdx_9_1> <jdx_11_1> <jdx_10_1> <jdx_8_1> <jdx_6_1> <jdx_7_1> <jdx_3_1> <jdx_4_1> <jdx_5_1> <jdx_0_1> <jdx_2_1> <jdx_1_1> 
INFO:Xst:2261 - The FF/Latch <wav_bram_addrb_10> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following FF/Latch, which will be removed : <ped_bram_addrb_10> 
INFO:Xst:2261 - The FF/Latch <jdx_15_2> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_14_2> <jdx_13_2> <jdx_12_2> <jdx_9_2> <jdx_11_2> <jdx_10_2> <jdx_8_2> <jdx_6_2> <jdx_7_2> <jdx_3_2> <jdx_4_2> <jdx_5_2> <jdx_0_2> <jdx_2_2> <jdx_1_2> 
INFO:Xst:2261 - The FF/Latch <jdx_15_3> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_14_3> <jdx_13_3> <jdx_12_3> <jdx_9_3> <jdx_11_3> <jdx_10_3> <jdx_8_3> <jdx_6_3> <jdx_7_3> <jdx_3_3> <jdx_4_3> <jdx_5_3> <jdx_0_3> <jdx_2_3> <jdx_1_3> 
INFO:Xst:2261 - The FF/Latch <jdx_15_4> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_14_4> <jdx_13_4> <jdx_12_4> <jdx_9_4> <jdx_11_4> <jdx_10_4> <jdx_8_4> <jdx_6_4> <jdx_7_4> <jdx_3_4> <jdx_4_4> <jdx_5_4> <jdx_0_4> <jdx_2_4> <jdx_1_4> 
INFO:Xst:2261 - The FF/Latch <jdx2_14_0> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_15_0> <jdx2_11_0> <jdx2_13_0> <jdx2_12_0> <jdx2_10_0> <jdx2_9_0> <jdx2_8_0> <jdx2_5_0> <jdx2_7_0> <jdx2_2_0> <jdx2_6_0> <jdx2_4_0> <jdx2_0_0> <jdx2_3_0> <jdx2_1_0> 
INFO:Xst:2261 - The FF/Latch <jdx2_14_1> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_15_1> <jdx2_11_1> <jdx2_13_1> <jdx2_12_1> <jdx2_10_1> <jdx2_9_1> <jdx2_8_1> <jdx2_5_1> <jdx2_7_1> <jdx2_2_1> <jdx2_6_1> <jdx2_4_1> <jdx2_0_1> <jdx2_3_1> <jdx2_1_1> 
INFO:Xst:2261 - The FF/Latch <jdx2_14_2> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_15_2> <jdx2_11_2> <jdx2_13_2> <jdx2_12_2> <jdx2_10_2> <jdx2_9_2> <jdx2_8_2> <jdx2_5_2> <jdx2_7_2> <jdx2_2_2> <jdx2_6_2> <jdx2_4_2> <jdx2_0_2> <jdx2_3_2> <jdx2_1_2> 
INFO:Xst:2261 - The FF/Latch <jdx2_14_3> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_15_3> <jdx2_11_3> <jdx2_13_3> <jdx2_12_3> <jdx2_10_3> <jdx2_9_3> <jdx2_8_3> <jdx2_5_3> <jdx2_7_3> <jdx2_2_3> <jdx2_6_3> <jdx2_4_3> <jdx2_0_3> <jdx2_3_3> <jdx2_1_3> 
INFO:Xst:2261 - The FF/Latch <jdx2_14_4> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_15_4> <jdx2_11_4> <jdx2_13_4> <jdx2_12_4> <jdx2_10_4> <jdx2_9_4> <jdx2_8_4> <jdx2_5_4> <jdx2_7_4> <jdx2_2_4> <jdx2_6_4> <jdx2_4_4> <jdx2_0_4> <jdx2_3_4> <jdx2_1_4> 
INFO:Xst:2261 - The FF/Latch <jdx2_14_5> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_15_5> <jdx2_11_5> <jdx2_13_5> <jdx2_12_5> <jdx2_10_5> <jdx2_9_5> <jdx2_8_5> <jdx2_5_5> <jdx2_7_5> <jdx2_2_5> <jdx2_6_5> <jdx2_4_5> <jdx2_0_5> <jdx2_3_5> <jdx2_1_5> 
INFO:Xst:2261 - The FF/Latch <jdx2_14_6> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_15_6> <jdx2_11_6> <jdx2_13_6> <jdx2_12_6> <jdx2_10_6> <jdx2_9_6> <jdx2_8_6> <jdx2_5_6> <jdx2_7_6> <jdx2_2_6> <jdx2_6_6> <jdx2_4_6> <jdx2_0_6> <jdx2_3_6> <jdx2_1_6> 
INFO:Xst:2261 - The FF/Latch <jdx_15_5> in Unit <WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_14_5> <jdx_11_5> <jdx_13_5> <jdx_12_5> <jdx_10_5> <jdx_9_5> <jdx_8_5> <jdx_6_5> <jdx_7_5> <jdx_5_5> <jdx_4_5> <jdx_3_5> <jdx_2_5> <jdx_1_5> <jdx_0_5> 
INFO:Xst:2261 - The FF/Latch <jdx_15_6> in Unit <WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_14_6> <jdx_11_6> <jdx_13_6> <jdx_12_6> <jdx_10_6> <jdx_9_6> <jdx_8_6> <jdx_6_6> <jdx_7_6> <jdx_5_6> <jdx_4_6> <jdx_3_6> <jdx_2_6> <jdx_1_6> <jdx_0_6> 
INFO:Xst:2261 - The FF/Latch <jdx_15_0> in Unit <WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_14_0> <jdx_11_0> <jdx_13_0> <jdx_12_0> <jdx_10_0> <jdx_9_0> <jdx_8_0> <jdx_6_0> <jdx_7_0> <jdx_5_0> <jdx_4_0> <jdx_3_0> <jdx_2_0> <jdx_1_0> <jdx_0_0> 
INFO:Xst:2261 - The FF/Latch <jdx_15_1> in Unit <WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_14_1> <jdx_11_1> <jdx_13_1> <jdx_12_1> <jdx_10_1> <jdx_9_1> <jdx_8_1> <jdx_6_1> <jdx_7_1> <jdx_5_1> <jdx_4_1> <jdx_3_1> <jdx_2_1> <jdx_1_1> <jdx_0_1> 
INFO:Xst:2261 - The FF/Latch <jdx_15_2> in Unit <WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_14_2> <jdx_11_2> <jdx_13_2> <jdx_12_2> <jdx_10_2> <jdx_9_2> <jdx_8_2> <jdx_6_2> <jdx_7_2> <jdx_5_2> <jdx_4_2> <jdx_3_2> <jdx_2_2> <jdx_1_2> <jdx_0_2> 
INFO:Xst:2261 - The FF/Latch <jdx_15_3> in Unit <WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_14_3> <jdx_11_3> <jdx_13_3> <jdx_12_3> <jdx_10_3> <jdx_9_3> <jdx_8_3> <jdx_6_3> <jdx_7_3> <jdx_5_3> <jdx_4_3> <jdx_3_3> <jdx_2_3> <jdx_1_3> <jdx_0_3> 
INFO:Xst:2261 - The FF/Latch <jdx_15_4> in Unit <WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx_14_4> <jdx_11_4> <jdx_13_4> <jdx_12_4> <jdx_10_4> <jdx_9_4> <jdx_8_4> <jdx_6_4> <jdx_7_4> <jdx_5_4> <jdx_4_4> <jdx_3_4> <jdx_2_4> <jdx_1_4> <jdx_0_4> 
INFO:Xst:2261 - The FF/Latch <dmx_win_0> in Unit <WaveformDemuxCalcPedsBRAM> is equivalent to the following FF/Latch, which will be removed : <dmx2_win_0> 
INFO:Xst:2261 - The FF/Latch <dmx_win_1> in Unit <WaveformDemuxCalcPedsBRAM> is equivalent to the following FF/Latch, which will be removed : <dmx2_win_1> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_4> in Unit <WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_12_4> <jdx2_14_4> <jdx2_13_4> <jdx2_11_4> <jdx2_10_4> <jdx2_9_4> <jdx2_8_4> <jdx2_7_4> <jdx2_6_4> <jdx2_5_4> <jdx2_4_4> <jdx2_3_4> <jdx2_2_4> <jdx2_1_4> <jdx2_0_4> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_5> in Unit <WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_12_5> <jdx2_14_5> <jdx2_13_5> <jdx2_11_5> <jdx2_10_5> <jdx2_9_5> <jdx2_8_5> <jdx2_7_5> <jdx2_6_5> <jdx2_5_5> <jdx2_4_5> <jdx2_3_5> <jdx2_2_5> <jdx2_1_5> <jdx2_0_5> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_6> in Unit <WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_12_6> <jdx2_14_6> <jdx2_13_6> <jdx2_11_6> <jdx2_10_6> <jdx2_9_6> <jdx2_8_6> <jdx2_7_6> <jdx2_6_6> <jdx2_5_6> <jdx2_4_6> <jdx2_3_6> <jdx2_2_6> <jdx2_1_6> <jdx2_0_6> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_0> in Unit <WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_12_0> <jdx2_14_0> <jdx2_13_0> <jdx2_11_0> <jdx2_10_0> <jdx2_9_0> <jdx2_8_0> <jdx2_7_0> <jdx2_6_0> <jdx2_5_0> <jdx2_4_0> <jdx2_3_0> <jdx2_2_0> <jdx2_1_0> <jdx2_0_0> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_1> in Unit <WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_12_1> <jdx2_14_1> <jdx2_13_1> <jdx2_11_1> <jdx2_10_1> <jdx2_9_1> <jdx2_8_1> <jdx2_7_1> <jdx2_6_1> <jdx2_5_1> <jdx2_4_1> <jdx2_3_1> <jdx2_2_1> <jdx2_1_1> <jdx2_0_1> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_2> in Unit <WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_12_2> <jdx2_14_2> <jdx2_13_2> <jdx2_11_2> <jdx2_10_2> <jdx2_9_2> <jdx2_8_2> <jdx2_7_2> <jdx2_6_2> <jdx2_5_2> <jdx2_4_2> <jdx2_3_2> <jdx2_2_2> <jdx2_1_2> <jdx2_0_2> 
INFO:Xst:2261 - The FF/Latch <jdx2_15_3> in Unit <WaveformDemuxCalcPedsBRAM> is equivalent to the following 15 FFs/Latches, which will be removed : <jdx2_12_3> <jdx2_14_3> <jdx2_13_3> <jdx2_11_3> <jdx2_10_3> <jdx2_9_3> <jdx2_8_3> <jdx2_7_3> <jdx2_6_3> <jdx2_5_3> <jdx2_4_3> <jdx2_3_3> <jdx2_2_3> <jdx2_1_3> <jdx2_0_3> 
INFO:Xst:2261 - The FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_16> in Unit <TDC_MPPC_DAC> is equivalent to the following FF/Latch, which will be removed : <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_0> 
INFO:Xst:2261 - The FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_17> in Unit <TDC_MPPC_DAC> is equivalent to the following FF/Latch, which will be removed : <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_1> 
INFO:Xst:2261 - The FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_18> in Unit <TDC_MPPC_DAC> is equivalent to the following FF/Latch, which will be removed : <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_2> 
INFO:Xst:2261 - The FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_19> in Unit <TDC_MPPC_DAC> is equivalent to the following FF/Latch, which will be removed : <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_3> 
INFO:Xst:2261 - The FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_20> in Unit <TDC_MPPC_DAC> is equivalent to the following FF/Latch, which will be removed : <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_4> 
INFO:Xst:2261 - The FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_21> in Unit <TDC_MPPC_DAC> is equivalent to the following FF/Latch, which will be removed : <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_5> 
INFO:Xst:2261 - The FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_22> in Unit <TDC_MPPC_DAC> is equivalent to the following FF/Latch, which will be removed : <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_6> 
INFO:Xst:2261 - The FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_23> in Unit <TDC_MPPC_DAC> is equivalent to the following FF/Latch, which will be removed : <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_7> 
INFO:Xst:2261 - The FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_10> in Unit <TDC_MPPC_DAC> is equivalent to the following FF/Latch, which will be removed : <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_9> 
INFO:Xst:2261 - The FF/Latch <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_25> in Unit <TDC_MPPC_DAC> is equivalent to the following FF/Latch, which will be removed : <SERIAL_CONFIG_MPPC_DAC.mppc_dac_shift_in_data_26> 
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <klm_scrod_trig_interface/b2tt_ins/map_decode/map_is/map_iscan/FSM_2> on signal <sta_iddr[1:2]> with user encoding.
-------------------
 State | Encoding
-------------------
 00    | 00
 11    | 11
 01    | 01
 10    | 10
-------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <klm_scrod_trig_interface/aurora_ins/klm_aurora_ins/aurora_lane_0_i/err_detect_i/FSM_3> on signal <good_count_r[1:2]> with user encoding.
-------------------
 State | Encoding
-------------------
 00    | 00
 11    | 11
 10    | 10
 01    | 01
-------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <klm_scrod_trig_interface/aurora_ins/klm_aurora_ins/aurora_lane_0_i/err_detect_i/FSM_4> on signal <count_r[1:2]> with gray encoding.
-------------------
 State | Encoding
-------------------
 00    | 00
 11    | 01
 10    | 11
 01    | 10
-------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <klm_scrod_trig_interface/conc_intfc_ins/FSM_5> on signal <tx_fsm_cs[1:4]> with user encoding.
----------------------
 State    | Encoding
----------------------
 clears   | 0000
 idles    | 0001
 trgsofs  | 0010
 trgplds  | 0011
 daqsofs  | 0100
 daqplds  | 0101
 trgeofs  | 0110
 statsofs | 0111
 statplds | 1000
----------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <klm_scrod_trig_interface/PROD_GEN.daq_gen_ins/FSM_7> on signal <daq_fsm_cs_t[1:3]> with user encoding.
----------------------
 State    | Encoding
----------------------
 idles    | 000
 triggers | 001
 asics    | 010
 payloads | 011
 zlts     | 100
 dones    | 101
----------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <klm_scrod_trig_interface/PROD_GEN.daq_gen_ins/FSM_6> on signal <trg_cs[1:2]> with gray encoding.
---------------------
 State   | Encoding
---------------------
 idles   | 00
 ttrdys  | 01
 scttrgs | 11
 dones   | 10
---------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <klm_scrod_trig_interface/PROD_GEN.daq_gen_ins/FSM_8> on signal <ll_fsm_cs_t[1:2]> with user encoding.
----------------------
 State    | Encoding
----------------------
 sofs     | 00
 payloads | 01
 eofs     | 10
----------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <map_readout_interfaces/map_daq_fifo_layer/synthesize_with_usb.map_usb_interface/u_usb_slave_fifo_interface/FSM_1> on signal <state[1:4]> with user encoding.
-------------------
 State | Encoding
-------------------
 0000  | 0000
 1100  | 1100
 0101  | 0101
 1001  | 1001
 0001  | 0001
 0010  | 0010
 0011  | 0011
 0100  | 0100
 0110  | 0110
 0111  | 0111
 1000  | 1000
 1010  | 1010
 1011  | 1011
 1111  | 1111
 1101  | 1101
 1110  | 1110
-------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <u_SerialDataRout/FSM_21> on signal <next_overall[1:3]> with user encoding.
-------------------------------
 State             | Encoding
-------------------------------
 idle              | 000
 checkbusy         | 001
 checksamplesel    | 010
 startsroutprocess | 011
 waitsroutprocess  | 100
-------------------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <u_SerialDataRout/FSM_22> on signal <next_state[1:4]> with user encoding.
----------------------------
 State          | Encoding
----------------------------
 idle           | 0000
 waitstart      | 0001
 loadheader     | 0010
 loadheader2    | unreached
 waitaddr       | 0100
 waitload       | 0101
 waitload1      | 0110
 waitload1a     | unreached
 waitload2      | 1000
 clkhigh        | 1001
 clkhighhold    | 1010
 clklow         | 1011
 clklowhold     | 1100
 storedatast    | 1101
 storedataend   | 1110
 checkwindowend | 1111
----------------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <uut_pedram/u_ram_iface[3].u_ri/FSM_0> on signal <next_state[1:4]> with user encoding.
Optimizing FSM <uut_pedram/u_ram_iface[2].u_ri/FSM_0> on signal <next_state[1:4]> with user encoding.
Optimizing FSM <uut_pedram/u_ram_iface[0].u_ri/FSM_0> on signal <next_state[1:4]> with user encoding.
Optimizing FSM <uut_pedram/u_ram_iface[1].u_ri/FSM_0> on signal <next_state[1:4]> with user encoding.
--------------------------
 State        | Encoding
--------------------------
 idle         | 0000
 waitstart    | 0001
 wstart       | 0010
 wstart2      | 0011
 wwait_thzoe  | 0100
 wdataout     | 0101
 wwaitend     | 0110
 rstart       | 0111
 rstart2      | 1000
 rwaitdataout | 1001
 rwaitend     | 1010
--------------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <uut/FSM_9> on signal <next_st[1:3]> with user encoding.
-------------------------
 State       | Encoding
-------------------------
 idle        | 000
 waitstart   | 001
 setmux      | 010
 waitsetmux  | unreached
 readadc     | 100
 waitreadadc | unreached
 increg      | 110
 done        | 111
-------------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <uut/inst_mpc_adc/FSM_10> on signal <state[1:3]> with user encoding.
-----------------------------
 State           | Encoding
-----------------------------
 st_idle         | 000
 st_start        | 001
 st_read_byte    | 010
 st_write_byte   | 011
 st_wait_for_ack | 100
 st_send_ack     | 101
 st_send_no_ack  | 110
 st_stop         | 111
-----------------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <u_TARGETX_DAC_CONTROL/FSM_12> on signal <STATE[1:5]> with user encoding.
---------------------------------
 State               | Encoding
---------------------------------
 idle                | 00000
 load_dac_low_set0   | 00001
 load_dac_low_wait0  | 00010
 load_dac_low_mid    | 00011
 load_dac_low_set1   | 00100
 load_dac_low_wait1  | 00101
 load_dac_high_set0  | 00110
 load_dac_high_wait0 | 00111
 load_dac_high_mid   | 01000
 load_dac_high_set1  | 01001
 load_dac_high_wait1 | 01010
 latch_set0          | 01011
 latch_wait0         | 01100
 latch_set1          | 01101
 latch_wait1         | 01110
 latch_set2          | 01111
 latch_wait2         | 10000
 latch_set3          | 10001
 latch_wait3         | 10010
 latch_set4          | 10011
 latch_wait4         | 10100
 latch_set5          | 10101
 latch_wait5         | 10110
 latch_set6          | 10111
 latch_wait6         | 11000
---------------------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <u_ReadoutControl/FSM_13> on signal <next_trig_state[1:5]> with user encoding.
-----------------------------------------
 State                       | Encoding
-----------------------------------------
 idle                        | 00000
 wait_trig_delay             | 00001
 stop_sampling               | 00010
 wait_sampling_idle          | unreached
 dig_window_loop             | 00100
 wait_dig_addr               | 00101
 start_dig                   | 00110
 wait_digitization_idle_low  | 00111
 wait_digitization_idle_high | 01000
 srout_asic_loop             | 01001
 srout_check_asic_enabled    | 01010
 wait_readout_reset          | 01011
 wait_readout_continue_high  | unreached
 wait_readout_continue_low   | unreached
 start_srout                 | 01110
 wait_srout_idle_low         | 01111
 wait_srout_idle_high        | 10000
 start_evtbuild              | unreached
 wait_evtbuild_done          | unreached
 set_evtbuild_make_ready     | unreached
-----------------------------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <u_wavedemux/FSM_16> on signal <st_tmp2bram[1:2]> with user encoding.
-----------------------------------
 State                 | Encoding
-----------------------------------
 st_tmp2bram_check_ctr | 00
 st_tmp2bram_fetch1    | 01
 st_tmp2bram_fetch2    | 10
-----------------------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <u_wavedemux/FSM_14> on signal <next_ped_st[1:4]> with user encoding.
--------------------------------------
 State                    | Encoding
--------------------------------------
 pedsidle                 | 0000
 pedsfetchpedval          | 0001
 pedsfetchpedvalwaitsram1 | 0010
 pedsfetchpedvalwaitsram2 | 0011
 pedsfetchpedvalwaitsram3 | unreached
 pedsfetchredvalwr1       | 0101
 pedsfetchredvalwr2       | 0110
 pedsfetchchecksample     | 0111
 pedsfetchcheckwin        | 1000
 pedsfetchcheckch         | 1001
 pedsfetchdone            | 1010
--------------------------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <u_wavedemux/FSM_15> on signal <pedsub_st[1:3]> with user encoding.
----------------------------------
 State                | Encoding
----------------------------------
 pedsub_idle          | 000
 pedsub_wait_tmp2bram | unreached
 pedsub_sub           | 010
 pedsub_sub1          | 011
 pedsub_sub2          | 100
 pedsub_dumpct        | 101
 pedsub_dumpct2       | 110
----------------------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <u_wavedemux/Inst_PedRAMaccess/FSM_17> on signal <st[1:3]> with user encoding.
Optimizing FSM <Inst_WaveformDemuxCalcPedsBRAM/Inst_PedRAMaccess/FSM_17> on signal <st[1:3]> with user encoding.
----------------------------
 State          | Encoding
----------------------------
 idle           | 000
 translate_addr | 001
 set_ram_addr   | 010
 wait_ram1      | 011
 wait_ram2      | 100
 wait_ram3      | 101
 wait_ram_busy  | 110
 populate_regs  | 111
----------------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <Inst_WaveformDemuxCalcPedsBRAM/FSM_18> on signal <dmx_st[1:5]> with user encoding.
-----------------------------------
 State                 | Encoding
-----------------------------------
 dmx_reset2            | 00000
 dmx_reset3            | 00001
 idle                  | 00010
 demuxing              | 00011
 dmx_wait_tmp2bram     | 00100
 peds_write            | 00101
 pedswrpedaddr1        | 00110
 pedswrpedaddr2        | 00111
 pedswrpedaddr3        | 01000
 pedswrpedval_rdtmp1   | 01001
 pedswrpedval_rdtmp2   | 01010
 pedswrpedval_rdtmp3   | 01011
 pedswrpedval_rdtmp4   | 01100
 pedswrpedval          | unreached
 pedswrpedval2         | 01110
 pedswrpedvalwaitsram1 | 01111
 pedswrpedvalwaitsram2 | 10000
 pedswrpedvalwaitsram3 | 10001
 pedswrchecksample     | 10010
 pedswrcheckwin        | 10011
 pedswrcheckch         | 10100
 pedswrdone            | 10101
-----------------------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <u_DigitizingLgc/FSM_20> on signal <next_state[1:3]> with user encoding.
-------------------------
 State       | Encoding
-------------------------
 idle        | 000
 waitaddress | 001
 waitread    | 010
 wconvert    | 011
 checkdone   | 100
 clrstate    | unreached
-------------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <u_OutputBufferControl/FSM_23> on signal <next_state[1:3]> with user encoding.
-------------------------------------
 State                   | Encoding
-------------------------------------
 idle                    | 000
 checkempty              | 001
 checkfooter             | 010
 load                    | 011
 start_evtbuild          | 100
 wait_evtbuild_done      | 101
 set_evtbuild_make_ready | 110
-------------------------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <inst_mpps_dacs/inst_dac_controller/FSM_25> on signal <state[1:2]> with gray encoding.
-------------------------
 State       | Encoding
-------------------------
 idle        | 00
 wait_cs     | 01
 update_dacs | 11
 wait_update | 10
-------------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <inst_mpps_dacs/inst_dac_controller/FSM_26> on signal <UPDATE_DACs_STATE[1:2]> with gray encoding.
-------------------------------
 State             | Encoding
-------------------------------
 set_update_mode   | 00
 set_sck_dac_low   | 01
 set_din_dac_input | 11
 set_sck_dac_high  | 10
-------------------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <u_SamplingLgc/FSM_19> on signal <next_state[1:1]> with sequential encoding.
-----------------------
 State     | Encoding
-----------------------
 resetting | 0
 sampling  | 1
 freerun   | unreached
-----------------------
Analyzing FSM <MFsm> for best encoding.
Optimizing FSM <map_event_builder/FSM_24> on signal <internal_EVENT_BUILDER_STATE[1:3]> with gray encoding.
-----------------------------------
 State                 | Encoding
-----------------------------------
 idle                  | 000
 start                 | 001
 send_header_packet    | 011
 send_waveform_packets | 010
 done                  | 110
-----------------------------------
WARNING:Xst:2677 - Node <internal_EVTBUILD_DONE_SENDING_EVENT> of sequential type is unconnected in block <ReadoutControl>.
WARNING:Xst:2677 - Node <internal_READOUT_CONTINUE> of sequential type is unconnected in block <ReadoutControl>.
WARNING:Xst:1710 - FF/Latch <payload_78> (without init value) has a constant value of 0 in block <b2tt_payload>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <payload_80> (without init value) has a constant value of 0 in block <b2tt_payload>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <payload_81> (without init value) has a constant value of 0 in block <b2tt_payload>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <seq_busy_0> has a constant value of 0 in block <b2tt_enbit2>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <seq_busy_1> has a constant value of 0 in block <b2tt_enbit2>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <seq_k285_0> has a constant value of 0 in block <b2tt_enbit2>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <seq_k285_1> has a constant value of 0 in block <b2tt_enbit2>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <seq_k285_2> has a constant value of 0 in block <b2tt_enbit2>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <seq_k285_3> has a constant value of 0 in block <b2tt_enbit2>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <seq_k285_4> has a constant value of 0 in block <b2tt_enbit2>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <seq_k285_5> has a constant value of 0 in block <b2tt_enbit2>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <seq_k285_6> has a constant value of 0 in block <b2tt_enbit2>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <seq_k285_7> has a constant value of 0 in block <b2tt_enbit2>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1898 - Due to constant pushing, FF/Latch <seq_reset> is unconnected in block <b2tt_enbit2>.
WARNING:Xst:1710 - FF/Latch <trg_fifo_di_9> (without init value) has a constant value of 0 in block <conc_intfc>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <trg_fifo_di_10> (without init value) has a constant value of 0 in block <conc_intfc>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <trg_fifo_di_11> (without init value) has a constant value of 0 in block <conc_intfc>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <trg_fifo_di_12> (without init value) has a constant value of 0 in block <conc_intfc>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <trg_fifo_di_13> (without init value) has a constant value of 0 in block <conc_intfc>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <trg_fifo_di_14> (without init value) has a constant value of 0 in block <conc_intfc>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <trg_fifo_di_15> (without init value) has a constant value of 0 in block <conc_intfc>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:2677 - Node <counter_26> of sequential type is unconnected in block <usb_init>.
WARNING:Xst:2677 - Node <counter_27> of sequential type is unconnected in block <usb_init>.
WARNING:Xst:2677 - Node <counter_28> of sequential type is unconnected in block <usb_init>.
WARNING:Xst:2677 - Node <counter_29> of sequential type is unconnected in block <usb_init>.
WARNING:Xst:2677 - Node <counter_30> of sequential type is unconnected in block <usb_init>.
WARNING:Xst:2677 - Node <counter_31> of sequential type is unconnected in block <usb_init>.
WARNING:Xst:2677 - Node <usb_clk_rst_cnt_17> of sequential type is unconnected in block <usb_init>.
WARNING:Xst:2677 - Node <usb_clk_rst_cnt_18> of sequential type is unconnected in block <usb_init>.
WARNING:Xst:2677 - Node <usb_clk_rst_cnt_19> of sequential type is unconnected in block <usb_init>.
WARNING:Xst:2677 - Node <usb_clk_rst_cnt_20> of sequential type is unconnected in block <usb_init>.
WARNING:Xst:2677 - Node <usb_clk_rst_cnt_21> of sequential type is unconnected in block <usb_init>.
WARNING:Xst:2677 - Node <usb_clk_rst_cnt_22> of sequential type is unconnected in block <usb_init>.
WARNING:Xst:2677 - Node <usb_clk_rst_cnt_23> of sequential type is unconnected in block <usb_init>.
WARNING:Xst:2677 - Node <usb_clk_rst_cnt_24> of sequential type is unconnected in block <usb_init>.
WARNING:Xst:2677 - Node <usb_clk_rst_cnt_25> of sequential type is unconnected in block <usb_init>.
WARNING:Xst:2677 - Node <usb_clk_rst_cnt_26> of sequential type is unconnected in block <usb_init>.
WARNING:Xst:2677 - Node <usb_clk_rst_cnt_27> of sequential type is unconnected in block <usb_init>.
WARNING:Xst:2677 - Node <usb_clk_rst_cnt_28> of sequential type is unconnected in block <usb_init>.
WARNING:Xst:2677 - Node <usb_clk_rst_cnt_29> of sequential type is unconnected in block <usb_init>.
WARNING:Xst:2677 - Node <usb_clk_rst_cnt_30> of sequential type is unconnected in block <usb_init>.
WARNING:Xst:2677 - Node <usb_clk_rst_cnt_31> of sequential type is unconnected in block <usb_init>.
WARNING:Xst:1293 - FF/Latch <queue_i_1_31> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_30> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_29> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_28> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_27> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_26> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_25> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_24> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_23> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_22> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_21> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_20> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_19> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_18> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_17> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_16> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_15> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_14> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_13> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_12> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_11> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_10> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_9> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_8> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_7> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_6> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_5> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_4> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_3> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_1_2> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_31> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_30> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_29> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_28> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_27> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_26> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_25> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_24> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_23> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_22> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_21> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_20> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_19> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_18> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_17> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_16> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_15> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_14> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_13> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_12> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_11> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_10> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_9> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_8> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_7> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_6> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_5> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_4> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_3> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_0_2> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_31> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_30> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_29> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_28> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_27> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_26> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_25> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_24> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_23> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_22> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_21> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_20> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_19> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_18> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_17> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_16> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_15> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_14> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_13> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_12> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_11> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_10> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_9> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_8> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_7> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_6> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_5> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_4> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_3> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_3_2> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_31> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_30> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_29> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_28> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_27> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_26> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_25> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_24> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_23> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_22> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_21> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_20> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_19> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_18> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_17> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_16> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_15> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_14> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_13> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_12> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_11> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_10> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_9> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_8> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_7> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_6> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_5> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_4> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_3> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <queue_i_2_2> has a constant value of 0 in block <SRAMscheduler>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:2677 - Node <clkCounter_13> of sequential type is unconnected in block <Module_ADC_MCP3221_I2C_new>.
WARNING:Xst:2677 - Node <clkCounter_14> of sequential type is unconnected in block <Module_ADC_MCP3221_I2C_new>.
WARNING:Xst:2677 - Node <clkCounter_15> of sequential type is unconnected in block <Module_ADC_MCP3221_I2C_new>.
WARNING:Xst:1293 - FF/Latch <ped_sa_0> has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <ped_dina_12> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <ped_dina_13> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <ped_dina_14> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <ped_dina_15> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <ped_sa_num_0> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <ped_arr_addr_0> (without init value) has a constant value of 0 in block <WaveformDemuxPedsubDSPBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <addrarr_0_0> (without init value) has a constant value of 0 in block <PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <addrarr_2_0> (without init value) has a constant value of 0 in block <PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <addrarr_1_0> (without init value) has a constant value of 1 in block <PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <ped_sa_0> has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <ped_sa_num_0> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <ped_arr_addr_0> (without init value) has a constant value of 0 in block <WaveformDemuxCalcPedsBRAM>. This FF/Latch will be trimmed during the optimization process.
INFO:Xst:1901 - Instance map_pll in unit map_pll of type PLL_BASE has been replaced by PLL_ADV
INFO:Xst:1901 - Instance DCM_INST in unit USB_IFCLK_XC3S400 of type DCM has been replaced by DCM_SP
INFO:Xst:2261 - The FF/Latch <payload_16> in Unit <b2tt_payload> is equivalent to the following FF/Latch, which will be removed : <payload_82> 
INFO:Xst:2261 - The FF/Latch <to_valid_0> in Unit <conc_intfc> is equivalent to the following FF/Latch, which will be removed : <trg_fifo_di_17> 
INFO:Xst:2261 - The FF/Latch <internal_fifo_wr_din_20> in Unit <SerialDataRout> is equivalent to the following 2 FFs/Latches, which will be removed : <internal_fifo_wr_din_21> <internal_fifo_wr_din_26> 
INFO:Xst:2261 - The FF/Latch <internal_fifo_wr_din_22> in Unit <SerialDataRout> is equivalent to the following 4 FFs/Latches, which will be removed : <internal_fifo_wr_din_23> <internal_fifo_wr_din_25> <internal_fifo_wr_din_27> <internal_fifo_wr_din_31> 
INFO:Xst:2261 - The FF/Latch <internal_fifo_wr_din_28> in Unit <SerialDataRout> is equivalent to the following FF/Latch, which will be removed : <internal_fifo_wr_din_30> 
INFO:Xst:2261 - The FF/Latch <dmx_win_10> in Unit <WaveformDemuxPedsubDSPBRAM> is equivalent to the following 20 FFs/Latches, which will be removed : <dmx_win_11> <dmx_win_12> <dmx_win_13> <dmx_win_14> <dmx_win_15> <dmx_win_16> <dmx_win_17> <dmx_win_18> <dmx_win_19> <dmx_win_20> <dmx_win_21> <dmx_win_22> <dmx_win_23> <dmx_win_24> <dmx_win_25> <dmx_win_26> <dmx_win_27> <dmx_win_28> <dmx_win_29> <dmx_win_30> 
INFO:Xst:2261 - The FF/Latch <addrarr_0_17> in Unit <PedRAMaccess> is equivalent to the following FF/Latch, which will be removed : <addrarr_1_17> 
INFO:Xst:2261 - The FF/Latch <addrarr_0_18> in Unit <PedRAMaccess> is equivalent to the following FF/Latch, which will be removed : <addrarr_1_18> 
INFO:Xst:2261 - The FF/Latch <addrarr_0_19> in Unit <PedRAMaccess> is equivalent to the following FF/Latch, which will be removed : <addrarr_1_19> 
INFO:Xst:2261 - The FF/Latch <addrarr_0_2> in Unit <PedRAMaccess> is equivalent to the following FF/Latch, which will be removed : <addrarr_1_2> 
INFO:Xst:2261 - The FF/Latch <addrarr_0_3> in Unit <PedRAMaccess> is equivalent to the following FF/Latch, which will be removed : <addrarr_1_3> 
INFO:Xst:2261 - The FF/Latch <addrarr_0_4> in Unit <PedRAMaccess> is equivalent to the following FF/Latch, which will be removed : <addrarr_1_4> 
INFO:Xst:2261 - The FF/Latch <addrarr_0_5> in Unit <PedRAMaccess> is equivalent to the following FF/Latch, which will be removed : <addrarr_1_5> 
INFO:Xst:2261 - The FF/Latch <addrarr_0_6> in Unit <PedRAMaccess> is equivalent to the following FF/Latch, which will be removed : <addrarr_1_6> 
INFO:Xst:2261 - The FF/Latch <addrarr_0_7> in Unit <PedRAMaccess> is equivalent to the following FF/Latch, which will be removed : <addrarr_1_7> 
INFO:Xst:2261 - The FF/Latch <addrarr_0_8> in Unit <PedRAMaccess> is equivalent to the following FF/Latch, which will be removed : <addrarr_1_8> 
INFO:Xst:2261 - The FF/Latch <addrarr_0_9> in Unit <PedRAMaccess> is equivalent to the following FF/Latch, which will be removed : <addrarr_1_9> 
INFO:Xst:2261 - The FF/Latch <addrarr_0_1> in Unit <PedRAMaccess> is equivalent to the following FF/Latch, which will be removed : <addrarr_1_1> 
INFO:Xst:2261 - The FF/Latch <addrarr_0_10> in Unit <PedRAMaccess> is equivalent to the following FF/Latch, which will be removed : <addrarr_1_10> 
INFO:Xst:2261 - The FF/Latch <addrarr_0_11> in Unit <PedRAMaccess> is equivalent to the following FF/Latch, which will be removed : <addrarr_1_11> 
INFO:Xst:2261 - The FF/Latch <addrarr_0_12> in Unit <PedRAMaccess> is equivalent to the following FF/Latch, which will be removed : <addrarr_1_12> 
INFO:Xst:2261 - The FF/Latch <addrarr_0_13> in Unit <PedRAMaccess> is equivalent to the following FF/Latch, which will be removed : <addrarr_1_13> 
INFO:Xst:2261 - The FF/Latch <addrarr_0_14> in Unit <PedRAMaccess> is equivalent to the following FF/Latch, which will be removed : <addrarr_1_14> 
INFO:Xst:2261 - The FF/Latch <addrarr_0_20> in Unit <PedRAMaccess> is equivalent to the following FF/Latch, which will be removed : <addrarr_1_20> 
INFO:Xst:2261 - The FF/Latch <addrarr_0_15> in Unit <PedRAMaccess> is equivalent to the following FF/Latch, which will be removed : <addrarr_1_15> 
INFO:Xst:2261 - The FF/Latch <addrarr_0_21> in Unit <PedRAMaccess> is equivalent to the following FF/Latch, which will be removed : <addrarr_1_21> 
INFO:Xst:2261 - The FF/Latch <addrarr_0_16> in Unit <PedRAMaccess> is equivalent to the following FF/Latch, which will be removed : <addrarr_1_16> 
INFO:Xst:2261 - The FF/Latch <dmx_win_10> in Unit <WaveformDemuxCalcPedsBRAM> is equivalent to the following 20 FFs/Latches, which will be removed : <dmx_win_11> <dmx_win_12> <dmx_win_13> <dmx_win_14> <dmx_win_15> <dmx_win_16> <dmx_win_17> <dmx_win_18> <dmx_win_19> <dmx_win_20> <dmx_win_21> <dmx_win_22> <dmx_win_23> <dmx_win_24> <dmx_win_25> <dmx_win_26> <dmx_win_27> <dmx_win_28> <dmx_win_29> <dmx_win_30> 
WARNING:Xst:3002 - This design contains one or more registers/latches that are directly
   incompatible with the Spartan6 architecture. The two primary causes of this is
   either a register or latch described with both an asynchronous set and
   asynchronous reset, or a register or latch described with an asynchronous
   set or reset which however has an initialization value of the opposite 
   polarity (i.e. asynchronous reset with an initialization value of 1).
    While this circuit can be built, it creates a sub-optimal implementation
   in terms of area, power and performance. For a more optimal implementation
   Xilinx highly recommends one of the following:

          1) Remove either the set or reset from all registers and latches
             if not needed for required functionality
          2) Modify the code in order to produce a synchronous set
             and/or reset (both is preferred)
          3) Ensure all registers have the same initialization value as the
             described asynchronous set or reset polarity
          4) Use the -async_to_sync option to transform the asynchronous
             set/reset to synchronous operation
             (timing simulation highly recommended when using this option)

  Please refer to http://www.xilinx.com search string "Spartan6 asynchronous set/reset" for more details.

  List of register instances with asynchronous set and reset:
    tmp2bram_ctr_0 in unit <WaveformDemuxPedsubDSPBRAM>
    tmp2bram_ctr_2 in unit <WaveformDemuxPedsubDSPBRAM>
    tmp2bram_ctr_3 in unit <WaveformDemuxPedsubDSPBRAM>
    tmp2bram_ctr_1 in unit <WaveformDemuxPedsubDSPBRAM>
    tmp2bram_ctr_4 in unit <WaveformDemuxPedsubDSPBRAM>
    tmp2bram_ctr_5 in unit <WaveformDemuxPedsubDSPBRAM>
    tmp2bram_ctr_6 in unit <WaveformDemuxPedsubDSPBRAM>
    tmp2bram_ctr_7 in unit <WaveformDemuxPedsubDSPBRAM>
    ram_wait_i_1 in unit <SRAMscheduler>
    ram_wait_i_0 in unit <SRAMscheduler>
    ram_wait_i_2 in unit <SRAMscheduler>
    ram_wait_i_3 in unit <SRAMscheduler>


Optimizing unit <b2tt_clk> ...

Optimizing unit <b2tt_oddr> ...

Optimizing unit <klm_aurora> ...

Optimizing unit <TX_LL> ...

Optimizing unit <GTP_WRAPPER> ...

Optimizing unit <AURORA_TILE> ...

Optimizing unit <AURORA_LANE> ...

Optimizing unit <CHBOND_COUNT_DEC> ...

Optimizing unit <GLOBAL_LOGIC> ...

Optimizing unit <sfp_stat_ctrl> ...

Optimizing unit <tdc> ...

Optimizing unit <tom_10_to_1> ...

Optimizing unit <tom_3_to_1> ...

Optimizing unit <tom_4_to_1> ...

Optimizing unit <clock_gen> ...

Optimizing unit <usb_top> ...

Optimizing unit <usb_slave_fifo_interface_io> ...

Optimizing unit <USB_IFCLK_XC3S400> ...

Optimizing unit <kcpsm6> ...

Optimizing unit <command_interpreter> ...

Optimizing unit <trigger_scaler_single_channel_w_timing_gen> ...

Optimizing unit <scrod_top_A4> ...

Optimizing unit <klm_scrod> ...

Optimizing unit <b2tt> ...

Optimizing unit <b2tt_payload> ...

Optimizing unit <b2tt_decode> ...

Optimizing unit <b2tt_iddr> ...

Optimizing unit <b2tt_iscan> ...

Optimizing unit <b2tt_debit2> ...

Optimizing unit <b2tt_debit10> ...

Optimizing unit <b2tt_de8b10b> ...

Optimizing unit <b2tt_detrig> ...

Optimizing unit <b2tt_deoctet> ...

Optimizing unit <b2tt_depacket> ...
WARNING:Xst:1710 - FF/Latch <divclk1_0> (without init value) has a constant value of 1 in block <b2tt_depacket>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <divclk1_1> (without init value) has a constant value of 1 in block <b2tt_depacket>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <cnt_divseq1_6> has a constant value of 0 in block <b2tt_depacket>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <cnt_divseq2_6> has a constant value of 0 in block <b2tt_depacket>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_divseq2_2> has a constant value of 0 in block <b2tt_depacket>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <cnt_divseq2_3> has a constant value of 0 in block <b2tt_depacket>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <cnt_divseq2_4> has a constant value of 0 in block <b2tt_depacket>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <cnt_divseq2_5> has a constant value of 0 in block <b2tt_depacket>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:2677 - Node <cnt_divseq1_0> of sequential type is unconnected in block <b2tt_depacket>.
WARNING:Xst:2677 - Node <cnt_divseq1_1> of sequential type is unconnected in block <b2tt_depacket>.
WARNING:Xst:2677 - Node <cnt_divseq1_2> of sequential type is unconnected in block <b2tt_depacket>.
WARNING:Xst:2677 - Node <cnt_divseq1_3> of sequential type is unconnected in block <b2tt_depacket>.
WARNING:Xst:2677 - Node <cnt_divseq1_4> of sequential type is unconnected in block <b2tt_depacket>.
WARNING:Xst:2677 - Node <cnt_divseq1_5> of sequential type is unconnected in block <b2tt_depacket>.

Optimizing unit <b2tt_detag> ...

Optimizing unit <b2tt_decomma> ...

Optimizing unit <b2tt_fifo> ...

Optimizing unit <b2tt_encode> ...

Optimizing unit <b2tt_enoctet> ...

Optimizing unit <b2tt_encounter> ...

Optimizing unit <b2tt_enbit2> ...

Optimizing unit <b2tt_en8b10b> ...

Optimizing unit <klm_aurora_intfc> ...

Optimizing unit <TX_LL_DATAPATH> ...

Optimizing unit <TX_LL_CONTROL> ...

Optimizing unit <LANE_INIT_SM> ...

Optimizing unit <SYM_GEN> ...

Optimizing unit <ERR_DETECT> ...

Optimizing unit <SYM_DEC> ...

Optimizing unit <CHANNEL_ERR_DETECT> ...

Optimizing unit <CHANNEL_INIT_SM> ...

Optimizing unit <IDLE_AND_VER_GEN> ...

Optimizing unit <RX_LL> ...

Optimizing unit <RX_LL_PDU_DATAPATH> ...

Optimizing unit <STANDARD_CC_MODULE> ...

Optimizing unit <conc_intfc> ...

Optimizing unit <tdc_channel_1> ...

Optimizing unit <tdc_fifo> ...

Optimizing unit <tdc_channel_2> ...

Optimizing unit <tdc_channel_3> ...

Optimizing unit <tdc_channel_4> ...

Optimizing unit <tdc_channel_5> ...

Optimizing unit <tdc_channel_6> ...

Optimizing unit <tdc_channel_7> ...

Optimizing unit <tdc_channel_8> ...

Optimizing unit <tdc_channel_9> ...

Optimizing unit <tdc_channel_10> ...

Optimizing unit <time_order> ...

Optimizing unit <tom_2_to_1> ...

Optimizing unit <trig_chan_calc> ...

Optimizing unit <timing_ctrl> ...

Optimizing unit <daq_gen> ...

Optimizing unit <run_ctrl> ...

Optimizing unit <clock_enable_generator_1> ...

Optimizing unit <clock_enable_generator_2> ...

Optimizing unit <readout_interface> ...

Optimizing unit <daq_fifo_layer> ...

Optimizing unit <detect_usb> ...

Optimizing unit <usb_slave_fifo_interface> ...

Optimizing unit <usb_init> ...

Optimizing unit <edge_detect> ...

Optimizing unit <SerialDataRout> ...
WARNING:Xst:1293 - FF/Latch <Ev_CNT_2> has a constant value of 0 in block <SerialDataRout>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <Ev_CNT_3> has a constant value of 0 in block <SerialDataRout>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <Ev_CNT_4> has a constant value of 0 in block <SerialDataRout>. This FF/Latch will be trimmed during the optimization process.

Optimizing unit <SRAMscheduler> ...

Optimizing unit <SRAMiface2> ...

Optimizing unit <update_status_regs> ...

Optimizing unit <Module_ADC_MCP3221_I2C_new> ...

Optimizing unit <TARGETX_DAC_CONTROL> ...

Optimizing unit <ReadoutControl> ...

Optimizing unit <WaveformDemuxPedsubDSPBRAM> ...

Optimizing unit <PedRAMaccess> ...

Optimizing unit <WaveformDemuxCalcPedsBRAM> ...

Optimizing unit <DigitizingLgcTX> ...

Optimizing unit <OutputBufferControl> ...

Optimizing unit <trigger_scaler_single_channel> ...

Optimizing unit <edge_to_pulse_converter> ...

Optimizing unit <trigger_scaler_timing_generator> ...

Optimizing unit <pulse_transition> ...

Optimizing unit <mppc_dacs> ...

Optimizing unit <TDC_MPPC_DAC> ...

Optimizing unit <SamplingLgc> ...

Optimizing unit <event_builder> ...
WARNING:Xst:1426 - The value init of the FF/Latch rw_i hinder the constant cleaning in the block u_ram_iface[3].u_ri.
   You should achieve better results by setting this init to 1.
WARNING:Xst:1710 - FF/Latch <A_10> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <A_11> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <A_12> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <A_13> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <A_14> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <A_15> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <A_16> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <A_17> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <A_18> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <A_19> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <A_20> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <A_21> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_0> has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_1> has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_2> has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_3> has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_4> has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_5> has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_6> has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_7> has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_1> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_2> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_3> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_4> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_5> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_6> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_7> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <update_i> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <busy_i> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <rw_i> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <A_0> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <A_1> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <A_2> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <A_3> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <A_4> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <A_5> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <A_6> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <A_7> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <A_8> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <A_9> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_4> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_5> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_6> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_7> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_8> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_9> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_10> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_11> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_0> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_1> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_2> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_3> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_4> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_5> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_6> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_7> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_8> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_9> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_10> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval0_i_11> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <rw_i> has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_0> has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_1> has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_2> has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_3> has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_4> has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_5> has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_6> has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_7> has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <ram_dataw_0> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <ram_dataw_1> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <ram_dataw_2> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <ram_dataw_3> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <ram_dataw_4> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <ram_dataw_5> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <ram_dataw_6> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <ram_dataw_7> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_0> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_1> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_2> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <wval1_i_3> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_33> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_34> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_35> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_68> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_69> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_70> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_71> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_72> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_73> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_74> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seudet_0> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seudet_1> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seudet_2> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seudet_3> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seudet_4> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seudet_5> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seudet_6> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seudet_7> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seudet_8> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seudet_9> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seuscan_0> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <mgtmod2_iq_1> (without init value) has a constant value of 1 in block <klm_scrod_trig_interface>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <mgttxdis_iq_1> (without init value) has a constant value of 0 in block <klm_scrod_trig_interface>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <mgtmod1_iq_1> (without init value) has a constant value of 1 in block <klm_scrod_trig_interface>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <seq_seudet_0> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <seq_seuscan_0> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_14> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_15> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_18> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_19> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_20> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_21> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_22> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_23> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_24> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_25> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_26> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_27> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_28> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_29> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_30> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_31> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <payload_32> (without init value) has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_1> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_2> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_3> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_4> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_5> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_6> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_7> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_8> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_9> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_10> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_11> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_12> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <dw_i_0> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_13> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_14> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_15> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_16> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_17> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_21> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_18> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_20> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_19> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seuscan_7> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <cmin_7> (without init value) has a constant value of 0 in block <tom_3_to_1_12>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <cmin_6> (without init value) has a constant value of 0 in block <tom_3_to_1_11>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <cmin_7> (without init value) has a constant value of 0 in block <tom_3_to_1_11>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <update_req_i0_1> (without init value) has a constant value of 0 in block <uut_pedram>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <update_req_edg_1> (without init value) has a constant value of 0 in block <uut_pedram>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <addr_i_0> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seuscan_6> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seuscan_5> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seuscan_4> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seuscan_3> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seuscan_2> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_seuscan_1> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_22> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_23> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_21> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_20> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_0> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_1> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_2> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_3> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_4> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_5> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_6> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_19> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_18> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_17> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_16> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_15> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_7> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_8> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_9> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_10> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_11> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_12> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_13> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <wbytes_14> (without init value) has a constant value of 0 in block <Inst_PedRAMaccess>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_0> (without init value) has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_1> (without init value) has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_2> (without init value) has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_3> (without init value) has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_4> (without init value) has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_5> (without init value) has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_6> (without init value) has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_7> (without init value) has a constant value of 0 in block <u_ram_iface[2].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <update_req_i1_1> (without init value) has a constant value of 0 in block <uut_pedram>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_0> (without init value) has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_1> (without init value) has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_2> (without init value) has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_3> (without init value) has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_4> (without init value) has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_5> (without init value) has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_6> (without init value) has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_7> (without init value) has a constant value of 0 in block <u_ram_iface[3].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_7> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_6> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_5> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_4> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_3> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_2> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_1> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1895 - Due to other FF/Latch trimming, FF/Latch <IOw_0> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <seq_seuscan_1> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1896 - Due to other FF/Latch trimming, FF/Latch <seq_seudet_1> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:2677 - Node <seq_iddr_0> of sequential type is unconnected in block <map_iscan>.
WARNING:Xst:2677 - Node <seq_iddr_1> of sequential type is unconnected in block <map_iscan>.
WARNING:Xst:2677 - Node <iddrdbg_9> of sequential type is unconnected in block <map_iscan>.
WARNING:Xst:2677 - Node <iddrdbg_8> of sequential type is unconnected in block <map_iscan>.
WARNING:Xst:2677 - Node <iddrdbg_7> of sequential type is unconnected in block <map_iscan>.
WARNING:Xst:2677 - Node <iddrdbg_6> of sequential type is unconnected in block <map_iscan>.
WARNING:Xst:2677 - Node <iddrdbg_5> of sequential type is unconnected in block <map_iscan>.
WARNING:Xst:2677 - Node <iddrdbg_4> of sequential type is unconnected in block <map_iscan>.
WARNING:Xst:2677 - Node <iddrdbg_3> of sequential type is unconnected in block <map_iscan>.
WARNING:Xst:2677 - Node <cnt_dbg_0> of sequential type is unconnected in block <map_iscan>.
WARNING:Xst:2677 - Node <cnt_dbg_1> of sequential type is unconnected in block <map_iscan>.
WARNING:Xst:2677 - Node <cnt_dbg_2> of sequential type is unconnected in block <map_iscan>.
WARNING:Xst:2677 - Node <cnt_dbg_3> of sequential type is unconnected in block <map_iscan>.
WARNING:Xst:2677 - Node <cnt_dbg_4> of sequential type is unconnected in block <map_iscan>.
WARNING:Xst:2677 - Node <cnt_dbg_5> of sequential type is unconnected in block <map_iscan>.
WARNING:Xst:2677 - Node <buf_slip> of sequential type is unconnected in block <map_2b>.
WARNING:Xst:2677 - Node <sigslip> of sequential type is unconnected in block <map_2b>.
WARNING:Xst:2677 - Node <buf_bit10_8> of sequential type is unconnected in block <map_2b>.
WARNING:Xst:2677 - Node <buf_bit10_9> of sequential type is unconnected in block <map_2b>.
WARNING:Xst:2677 - Node <buf_slip10_0> of sequential type is unconnected in block <map_2b>.
WARNING:Xst:2677 - Node <buf_slip10_1> of sequential type is unconnected in block <map_2b>.
WARNING:Xst:2677 - Node <buf_slip10_2> of sequential type is unconnected in block <map_2b>.
WARNING:Xst:2677 - Node <buf_slip10_3> of sequential type is unconnected in block <map_2b>.
WARNING:Xst:2677 - Node <buf_slip10_4> of sequential type is unconnected in block <map_2b>.
WARNING:Xst:2677 - Node <buf_slip10_5> of sequential type is unconnected in block <map_2b>.
WARNING:Xst:2677 - Node <buf_slip10_6> of sequential type is unconnected in block <map_2b>.
WARNING:Xst:2677 - Node <buf_slip10_7> of sequential type is unconnected in block <map_2b>.
WARNING:Xst:2677 - Node <buf_slip10_8> of sequential type is unconnected in block <map_2b>.
WARNING:Xst:2677 - Node <buf_slip10_9> of sequential type is unconnected in block <map_2b>.
WARNING:Xst:2677 - Node <rd_defined> of sequential type is unconnected in block <map_de>.
WARNING:Xst:2677 - Node <err_0> of sequential type is unconnected in block <map_de>.
WARNING:Xst:2677 - Node <err_1> of sequential type is unconnected in block <map_de>.
WARNING:Xst:2677 - Node <err_2> of sequential type is unconnected in block <map_de>.
WARNING:Xst:2677 - Node <err_3> of sequential type is unconnected in block <map_de>.
WARNING:Xst:2677 - Node <err_4> of sequential type is unconnected in block <map_de>.
WARNING:Xst:2677 - Node <rdplus> of sequential type is unconnected in block <map_de>.
WARNING:Xst:2677 - Node <trgshort> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg1_0> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg1_1> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg1_2> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg1_3> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg1_4> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg1_5> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg1_6> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg1_7> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg1_8> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg1_9> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg1_10> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg1_11> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg1_12> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg1_13> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg1_14> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg1_15> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg2_0> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg2_1> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg2_2> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg2_3> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg2_4> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg2_5> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg2_6> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg2_7> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg2_8> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg2_9> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg2_10> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg2_11> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg2_12> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg2_13> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg2_14> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <cnt_dbg2_15> of sequential type is unconnected in block <map_tr>.
WARNING:Xst:2677 - Node <incdelay> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <sig_rxerr_0> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <sig_rxerr_1> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <sig_rxerr_2> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <sig_rxerr_3> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <cnt_invalid_0> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <cnt_invalid_1> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <cnt_invalid_2> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <cnt_invalid_3> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <cnt_invalid_4> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <cnt_invalid_5> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <cnt_invalid_6> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <cnt_invalid_7> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <cnt_invalid_8> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <cnt_invalid_9> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <cnt_invalid_10> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <cnt_invalid_11> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <cnt_incdelay_0> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <cnt_incdelay_1> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <cnt_incdelay_2> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <cnt_incdelay_3> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <cnt_incdelay_4> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <cnt_incdelay_5> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <cnt_incdelay_6> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <cnt_incdelay_7> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <sig_rxerr_4> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <sig_rxerr_5> of sequential type is unconnected in block <map_oc>.
WARNING:Xst:2677 - Node <incdelay> of sequential type is unconnected in block <map_pa>.
WARNING:Xst:2677 - Node <sig_frame9> of sequential type is unconnected in block <map_pa>.
WARNING:Xst:2677 - Node <sig_frame3> of sequential type is unconnected in block <map_pa>.
WARNING:Xst:2677 - Node <divclk2_0> of sequential type is unconnected in block <map_pa>.
WARNING:Xst:2677 - Node <divclk2_1> of sequential type is unconnected in block <map_pa>.
WARNING:Xst:2677 - Node <sigerr_0> of sequential type is unconnected in block <map_pa>.
WARNING:Xst:2677 - Node <sigerr_1> of sequential type is unconnected in block <map_pa>.
WARNING:Xst:2677 - Node <sigerr_2> of sequential type is unconnected in block <map_pa>.
WARNING:Xst:2677 - Node <cnt_divseq2_0> of sequential type is unconnected in block <map_pa>.
WARNING:Xst:2677 - Node <cnt_divseq2_1> of sequential type is unconnected in block <map_pa>.
WARNING:Xst:2677 - Node <buf_exprun_0> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_1> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_2> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_3> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_4> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_5> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_6> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_7> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_8> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_9> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_10> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_11> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_12> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_13> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_14> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_15> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_16> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_17> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_18> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_19> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_20> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_21> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_22> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_23> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_24> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_25> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_26> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_27> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_28> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_29> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_30> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_exprun_31> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_0> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_1> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_2> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_3> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_4> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_5> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_6> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_7> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_8> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_9> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_10> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_11> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_12> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_13> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_14> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_15> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_16> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_17> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_18> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_19> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_20> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_21> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_22> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_23> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_24> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_25> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_26> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_27> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_28> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_29> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_30> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <dbg_31> of sequential type is unconnected in block <map_tt>.
WARNING:Xst:2677 - Node <buf_drd_48> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_49> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_50> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_51> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_52> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_53> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_54> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_55> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_56> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_57> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_58> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_59> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_60> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_61> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_62> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_63> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_64> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_65> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_66> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_67> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_68> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_69> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_70> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_71> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_72> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_73> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_74> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_75> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_76> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_77> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_78> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_79> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_80> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_81> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_82> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_83> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_84> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_85> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_86> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_87> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_88> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_89> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_90> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_91> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_92> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_93> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_94> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_drd_95> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_0> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_1> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_2> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_3> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_4> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_5> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_6> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_7> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_8> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_9> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_10> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_11> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_12> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_13> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_14> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_15> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_16> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_17> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_18> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_19> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_20> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_21> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_22> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_23> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_24> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_25> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_26> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_27> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_28> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_29> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_30> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_31> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_48> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_49> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_50> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_51> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_52> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_53> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_54> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_55> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_56> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_57> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_58> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_59> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_60> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_61> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_62> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_63> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_64> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_65> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_66> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_67> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_68> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_69> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_70> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_71> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_72> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_73> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_74> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_75> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_76> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_77> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_78> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_79> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_80> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_81> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_82> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_83> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_84> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_85> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_86> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_87> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_88> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_89> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_90> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_91> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_92> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_93> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_94> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <buf_dout_95> of sequential type is unconnected in block <map_fifo>.
WARNING:Xst:2677 - Node <sta_frame> of sequential type is unconnected in block <map_co>.
WARNING:Xst:2677 - Node <cnt_packet_0> of sequential type is unconnected in block <map_co>.
WARNING:Xst:2677 - Node <cnt_packet_1> of sequential type is unconnected in block <map_co>.
WARNING:Xst:2677 - Node <cnt_packet_2> of sequential type is unconnected in block <map_co>.
WARNING:Xst:2677 - Node <cnt_packet_3> of sequential type is unconnected in block <map_co>.
WARNING:Xst:2677 - Node <cnt_packet_4> of sequential type is unconnected in block <map_co>.
WARNING:Xst:2677 - Node <cnt_packet_5> of sequential type is unconnected in block <map_co>.
WARNING:Xst:2677 - Node <cnt_packet_6> of sequential type is unconnected in block <map_co>.
WARNING:Xst:2677 - Node <cnt_packet_7> of sequential type is unconnected in block <map_co>.
WARNING:Xst:2677 - Node <rd4psav> of sequential type is unconnected in block <map_en8b10b>.
WARNING:Xst:2677 - Node <validk> of sequential type is unconnected in block <map_en8b10b>.
WARNING:Xst:2677 - Node <rd6psav> of sequential type is unconnected in block <map_en8b10b>.
WARNING:Xst:1290 - Hierarchical block <chbond_count_dec_i> is unconnected in block <aurora_lane_0_i>.
   It will be removed from the design.
WARNING:Xst:2677 - Node <rx_pad_d_r_0> of sequential type is unconnected in block <sym_dec_i>.
WARNING:Xst:2677 - Node <got_a_d_r_2> of sequential type is unconnected in block <sym_dec_i>.
WARNING:Xst:2677 - Node <got_a_d_r_0> of sequential type is unconnected in block <sym_dec_i>.
WARNING:Xst:2677 - Node <GOT_A_Buffer_1> of sequential type is unconnected in block <sym_dec_i>.
WARNING:Xst:2677 - Node <GOT_A_Buffer_0> of sequential type is unconnected in block <sym_dec_i>.
WARNING:Xst:2677 - Node <rx_cc_r_3> of sequential type is unconnected in block <sym_dec_i>.
WARNING:Xst:2677 - Node <rx_cc_r_1> of sequential type is unconnected in block <sym_dec_i>.
WARNING:Xst:2677 - Node <RX_PAD_Buffer> of sequential type is unconnected in block <sym_dec_i>.
WARNING:Xst:2677 - Node <RX_CC_Buffer> of sequential type is unconnected in block <sym_dec_i>.
WARNING:Xst:2677 - Node <sof_in_storage_r> of sequential type is unconnected in block <rx_ll_pdu_datapath_i>.
WARNING:Xst:2677 - Node <pad_in_storage_r> of sequential type is unconnected in block <rx_ll_pdu_datapath_i>.
WARNING:Xst:2677 - Node <RX_SRC_RDY_N_Buffer> of sequential type is unconnected in block <rx_ll_pdu_datapath_i>.
WARNING:Xst:2677 - Node <RX_EOF_N_Buffer> of sequential type is unconnected in block <rx_ll_pdu_datapath_i>.
WARNING:Xst:2677 - Node <RX_SOF_N_Buffer> of sequential type is unconnected in block <rx_ll_pdu_datapath_i>.
WARNING:Xst:2677 - Node <RX_REM_Buffer> of sequential type is unconnected in block <rx_ll_pdu_datapath_i>.
WARNING:Xst:2677 - Node <rx_dst_rdy_n> of sequential type is unconnected in block <conc_intfc_ins>.
WARNING:Xst:2677 - Node <rcl_sof_n> of sequential type is unconnected in block <conc_intfc_ins>.
WARNING:Xst:2677 - Node <rcl_eof_n> of sequential type is unconnected in block <conc_intfc_ins>.
WARNING:Xst:2677 - Node <rcl_src_rdy_n> of sequential type is unconnected in block <conc_intfc_ins>.
WARNING:Xst:2677 - Node <intfc_bit> of sequential type is unconnected in block <run_ctrl_ins>.
WARNING:Xst:2677 - Node <rx_dst_rdy_n> of sequential type is unconnected in block <run_ctrl_ins>.
WARNING:Xst:2677 - Node <internal_WAVEFORM_DATA_INTERFACE_1> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_0> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_1> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_2> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_3> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_4> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_5> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_6> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_7> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_8> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_9> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_10> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_11> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_12> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_13> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_14> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_15> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_16> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_17> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_18> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_19> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_20> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_21> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_22> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_23> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_24> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_25> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_26> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_27> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_28> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_29> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_30> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_31> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_32> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_33> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_34> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_35> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_36> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_37> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_38> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_39> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_40> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_41> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_42> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_43> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_44> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_45> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_46> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_47> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_48> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_49> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_50> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_51> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_52> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_53> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_54> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_55> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_56> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_57> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_58> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_59> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_61> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_62> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_63> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_64> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_65> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_66> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_67> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_68> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_69> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_70> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_71> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_72> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_73> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_74> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_75> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_76> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_77> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_78> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_79> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_80> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_81> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_82> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_83> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_84> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_85> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_86> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_87> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_88> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_89> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_90> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_91> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_92> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_93> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_94> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_95> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_96> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_97> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_98> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_99> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_100> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_101> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_102> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_103> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_104> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_105> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_106> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_107> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_108> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_109> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_110> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_111> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_112> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_113> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_114> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_115> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_116> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_117> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_118> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_119> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_120> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_121> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_122> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_123> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_124> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_125> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_126> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_127> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_128> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_129> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_130> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_131> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_132> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_133> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_134> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_135> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_136> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_137> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_138> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_139> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_140> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_141> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_142> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_143> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_144> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_145> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_146> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_147> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_148> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_149> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_150> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_151> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_152> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_153> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_154> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_155> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_156> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_157> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_158> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_159> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_160> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_161> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_162> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_163> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_164> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_165> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_166> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_167> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_168> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_169> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_170> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_171> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_172> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_173> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_174> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_175> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_176> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_177> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_178> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_179> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_180> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_181> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_182> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_183> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_184> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_185> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_186> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_187> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_188> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_189> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_190> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_191> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_192> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_193> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_194> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_195> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_196> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_197> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_198> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_199> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_200> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_201> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_202> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_203> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_204> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_205> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_206> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_207> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_208> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_209> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_210> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_211> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_212> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_213> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_214> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_215> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_216> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_217> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_218> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_219> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_220> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_221> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_222> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_223> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_224> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_225> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_226> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_227> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_228> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_229> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_230> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_231> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_232> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_233> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_234> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_235> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_236> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_237> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_238> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_239> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_240> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_241> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_242> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_243> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_244> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_245> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_246> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_247> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_248> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_249> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_250> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_251> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_252> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_253> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_254> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <i_register_updated[255]_dff_3185_255> of sequential type is unconnected in block <map_readout_interfaces>.
WARNING:Xst:2677 - Node <OUT_FALLING> of sequential type is unconnected in block <inst_write_edge>.
WARNING:Xst:2677 - Node <internal_busy> of sequential type is unconnected in block <u_SerialDataRout>.
WARNING:Xst:2677 - Node <IOr_i<3>_7> of sequential type is unconnected in block <uut_pedram>.
WARNING:Xst:2677 - Node <IOr_i<1>_7> of sequential type is unconnected in block <uut_pedram>.
WARNING:Xst:2677 - Node <IOr_i<3>_6> of sequential type is unconnected in block <uut_pedram>.
WARNING:Xst:2677 - Node <IOr_i<1>_6> of sequential type is unconnected in block <uut_pedram>.
WARNING:Xst:2677 - Node <IOr_i<1>_5> of sequential type is unconnected in block <uut_pedram>.
WARNING:Xst:2677 - Node <IOr_i<3>_5> of sequential type is unconnected in block <uut_pedram>.
WARNING:Xst:2677 - Node <IOr_i<3>_4> of sequential type is unconnected in block <uut_pedram>.
WARNING:Xst:2677 - Node <IOr_i<1>_4> of sequential type is unconnected in block <uut_pedram>.
WARNING:Xst:2677 - Node <IOr_i<3>_3> of sequential type is unconnected in block <uut_pedram>.
WARNING:Xst:2677 - Node <IOr_i<1>_3> of sequential type is unconnected in block <uut_pedram>.
WARNING:Xst:2677 - Node <IOr_i<3>_2> of sequential type is unconnected in block <uut_pedram>.
WARNING:Xst:2677 - Node <IOr_i<1>_2> of sequential type is unconnected in block <uut_pedram>.
WARNING:Xst:2677 - Node <IOr_i<3>_1> of sequential type is unconnected in block <uut_pedram>.
WARNING:Xst:2677 - Node <IOr_i<1>_1> of sequential type is unconnected in block <uut_pedram>.
WARNING:Xst:2677 - Node <IOr_i<3>_0> of sequential type is unconnected in block <uut_pedram>.
WARNING:Xst:2677 - Node <IOr_i<1>_0> of sequential type is unconnected in block <uut_pedram>.
WARNING:Xst:2677 - Node <dr_i_0> of sequential type is unconnected in block <u_ram_iface[1].u_ri>.
WARNING:Xst:2677 - Node <dr_i_1> of sequential type is unconnected in block <u_ram_iface[1].u_ri>.
WARNING:Xst:2677 - Node <dr_i_2> of sequential type is unconnected in block <u_ram_iface[1].u_ri>.
WARNING:Xst:2677 - Node <dr_i_3> of sequential type is unconnected in block <u_ram_iface[1].u_ri>.
WARNING:Xst:2677 - Node <dr_i_4> of sequential type is unconnected in block <u_ram_iface[1].u_ri>.
WARNING:Xst:2677 - Node <dr_i_5> of sequential type is unconnected in block <u_ram_iface[1].u_ri>.
WARNING:Xst:2677 - Node <dr_i_6> of sequential type is unconnected in block <u_ram_iface[1].u_ri>.
WARNING:Xst:2677 - Node <dr_i_7> of sequential type is unconnected in block <u_ram_iface[1].u_ri>.
WARNING:Xst:2677 - Node <dr_0> of sequential type is unconnected in block <u_ram_iface[1].u_ri>.
WARNING:Xst:2677 - Node <dr_1> of sequential type is unconnected in block <u_ram_iface[1].u_ri>.
WARNING:Xst:2677 - Node <dr_2> of sequential type is unconnected in block <u_ram_iface[1].u_ri>.
WARNING:Xst:2677 - Node <dr_3> of sequential type is unconnected in block <u_ram_iface[1].u_ri>.
WARNING:Xst:2677 - Node <dr_4> of sequential type is unconnected in block <u_ram_iface[1].u_ri>.
WARNING:Xst:2677 - Node <dr_5> of sequential type is unconnected in block <u_ram_iface[1].u_ri>.
WARNING:Xst:2677 - Node <dr_6> of sequential type is unconnected in block <u_ram_iface[1].u_ri>.
WARNING:Xst:2677 - Node <dr_7> of sequential type is unconnected in block <u_ram_iface[1].u_ri>.
WARNING:Xst:2677 - Node <dr_i_0> of sequential type is unconnected in block <u_ram_iface[3].u_ri>.
WARNING:Xst:2677 - Node <dr_i_1> of sequential type is unconnected in block <u_ram_iface[3].u_ri>.
WARNING:Xst:2677 - Node <dr_i_2> of sequential type is unconnected in block <u_ram_iface[3].u_ri>.
WARNING:Xst:2677 - Node <dr_i_3> of sequential type is unconnected in block <u_ram_iface[3].u_ri>.
WARNING:Xst:2677 - Node <dr_i_4> of sequential type is unconnected in block <u_ram_iface[3].u_ri>.
WARNING:Xst:2677 - Node <dr_i_5> of sequential type is unconnected in block <u_ram_iface[3].u_ri>.
WARNING:Xst:2677 - Node <dr_i_6> of sequential type is unconnected in block <u_ram_iface[3].u_ri>.
WARNING:Xst:2677 - Node <dr_i_7> of sequential type is unconnected in block <u_ram_iface[3].u_ri>.
WARNING:Xst:2677 - Node <dr_0> of sequential type is unconnected in block <u_ram_iface[3].u_ri>.
WARNING:Xst:2677 - Node <dr_1> of sequential type is unconnected in block <u_ram_iface[3].u_ri>.
WARNING:Xst:2677 - Node <dr_2> of sequential type is unconnected in block <u_ram_iface[3].u_ri>.
WARNING:Xst:2677 - Node <dr_3> of sequential type is unconnected in block <u_ram_iface[3].u_ri>.
WARNING:Xst:2677 - Node <dr_4> of sequential type is unconnected in block <u_ram_iface[3].u_ri>.
WARNING:Xst:2677 - Node <dr_5> of sequential type is unconnected in block <u_ram_iface[3].u_ri>.
WARNING:Xst:2677 - Node <dr_6> of sequential type is unconnected in block <u_ram_iface[3].u_ri>.
WARNING:Xst:2677 - Node <dr_7> of sequential type is unconnected in block <u_ram_iface[3].u_ri>.
WARNING:Xst:2677 - Node <busy_i> of sequential type is unconnected in block <uut>.
WARNING:Xst:2677 - Node <busy> of sequential type is unconnected in block <uut>.
WARNING:Xst:2677 - Node <busy> of sequential type is unconnected in block <u_TARGETX_DAC_CONTROL>.
WARNING:Xst:2677 - Node <internal_smp_stop> of sequential type is unconnected in block <u_ReadoutControl>.
WARNING:Xst:2677 - Node <internal_EVTBUILD_start> of sequential type is unconnected in block <u_ReadoutControl>.
WARNING:Xst:2677 - Node <internal_READOUT_DONE> of sequential type is unconnected in block <u_ReadoutControl>.
WARNING:Xst:2677 - Node <rw_i> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <ram_dataw_0> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <ram_dataw_1> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <ram_dataw_2> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <ram_dataw_3> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <ram_dataw_4> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <ram_dataw_5> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <ram_dataw_6> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <ram_dataw_7> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval1_i_0> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval1_i_1> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval1_i_2> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval1_i_3> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval1_i_4> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval1_i_5> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval1_i_6> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval1_i_7> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval1_i_8> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval1_i_9> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval1_i_10> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval1_i_11> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval0_i_0> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval0_i_1> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval0_i_2> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval0_i_3> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval0_i_4> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval0_i_5> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval0_i_6> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval0_i_7> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval0_i_8> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval0_i_9> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval0_i_10> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wval0_i_11> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_0> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_1> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_2> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_3> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_4> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_5> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_6> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_7> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_8> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_9> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_10> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_11> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_12> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_13> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_14> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_15> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_16> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_17> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_18> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_19> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_20> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_21> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_22> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <wbytes_23> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <ram_rw> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <busy_i> of sequential type is unconnected in block <Inst_WaveformDemuxCalcPedsBRAM>.
WARNING:Xst:2677 - Node <rw_i> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <ram_rw> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_0> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_1> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_2> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_3> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_4> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_5> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_6> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_7> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_8> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_9> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_10> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_11> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_12> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_13> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_14> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_15> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_16> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_17> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_18> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_19> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_20> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_21> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_22> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rbytes_23> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval1_0> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval1_1> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval1_2> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval1_3> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval1_4> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval1_5> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval1_6> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval1_7> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval1_8> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval1_9> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval1_10> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval1_11> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval0_0> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval0_1> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval0_2> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval0_3> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval0_4> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval0_5> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval0_6> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval0_7> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval0_8> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval0_9> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval0_10> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <rval0_11> of sequential type is unconnected in block <Inst_PedRAMaccess>.
WARNING:Xst:2677 - Node <OUT_FALLING> of sequential type is unconnected in block <inst_ouput_edge>.
WARNING:Xst:2677 - Node <OUT_FALLING> of sequential type is unconnected in block <inst_input_edge>.
WARNING:Xst:2677 - Node <OUT_FALLING> of sequential type is unconnected in block <inst_write_edge>.
WARNING:Xst:2677 - Node <UPDATE_MPPCDAC_DONE> of sequential type is unconnected in block <inst_dac_controller>.
WARNING:Xst:1710 - FF/Latch <cmin_6> (without init value) has a constant value of 1 in block <tom_3_to_1_12>. This FF/Latch will be trimmed during the optimization process.
INFO:Xst:2399 - RAMs <Mram_ct_lpt32>, <Mram_ct_lpt31> are equivalent, second RAM is removed
INFO:Xst:2399 - RAMs <Mram_ct_lpt32>, <Mram_ct_lpt33> are equivalent, second RAM is removed
INFO:Xst:2399 - RAMs <Mram_ct_lpt32>, <Mram_ct_lpt34> are equivalent, second RAM is removed
WARNING:Xst:1293 - FF/Latch <seq_inc_1> has a constant value of 0 in block <map_iscan>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_timer_3> has a constant value of 0 in block <map_pa>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_k285_0> has a constant value of 0 in block <map_b2>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_k285_1> has a constant value of 0 in block <map_b2>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_k285_2> has a constant value of 0 in block <map_b2>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <obusy> (without init value) has a constant value of 0 in block <map_b2>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <sta_defer> has a constant value of 0 in block <map_oc>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <GEN_PAD_Buffer> (without init value) has a constant value of 0 in block <tx_ll_datapath_i>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <gen_pad_r> (without init value) has a constant value of 0 in block <sym_gen_i>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <internal_COUNTER_0> has a constant value of 0 in block <map_ASIC_CTRL_clock_enable>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <internal_COUNTER_1> has a constant value of 0 in block <map_ASIC_CTRL_clock_enable>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <internal_COUNTER_2> has a constant value of 0 in block <map_ASIC_CTRL_clock_enable>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <internal_COUNTER_3> has a constant value of 0 in block <map_ASIC_CTRL_clock_enable>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <internal_COUNTER_4> has a constant value of 0 in block <map_ASIC_CTRL_clock_enable>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <internal_COUNTER_5> has a constant value of 0 in block <map_ASIC_CTRL_clock_enable>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <internal_COUNTER_6> has a constant value of 0 in block <map_ASIC_CTRL_clock_enable>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <internal_COUNTER_7> has a constant value of 0 in block <map_ASIC_CTRL_clock_enable>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <internal_COUNTER_8> has a constant value of 0 in block <map_ASIC_CTRL_clock_enable>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <internal_COUNTER_9> has a constant value of 0 in block <map_ASIC_CTRL_clock_enable>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <internal_COUNTER_2> has a constant value of 0 in block <map_MPPC_DAC_clock_enable>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <internal_COUNTER_3> has a constant value of 0 in block <map_MPPC_DAC_clock_enable>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <internal_COUNTER_4> has a constant value of 0 in block <map_MPPC_DAC_clock_enable>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <internal_COUNTER_5> has a constant value of 0 in block <map_MPPC_DAC_clock_enable>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <internal_COUNTER_6> has a constant value of 0 in block <map_MPPC_DAC_clock_enable>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <internal_COUNTER_7> has a constant value of 0 in block <map_MPPC_DAC_clock_enable>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <internal_COUNTER_8> has a constant value of 0 in block <map_MPPC_DAC_clock_enable>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <internal_COUNTER_9> has a constant value of 0 in block <map_MPPC_DAC_clock_enable>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <sync_sleep_flop> has a constant value of 0 in block <command_interpreter_processor>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <sync_interrupt_flop> has a constant value of 0 in block <command_interpreter_processor>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <sync_sleep_flop> has a constant value of 0 in block <command_interpreter_processor>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <sync_interrupt_flop> has a constant value of 0 in block <command_interpreter_processor>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_29> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_28> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_27> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_26> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_25> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_24> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_23> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_22> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_21> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_20> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_19> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_18> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_17> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_16> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_15> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_14> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_29> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_30> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_31> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_0> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_1> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_2> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_3> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_4> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_5> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_6> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_7> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_8> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_9> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_10> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_11> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_12> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_13> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_15> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_16> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_17> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_18> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_19> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_20> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_21> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_22> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_23> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_24> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_25> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_26> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_27> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_28> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_29> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_30> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_31> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_30> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_31> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_0> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_1> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_2> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_3> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_4> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_5> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_6> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_7> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_8> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_9> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_10> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_11> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_12> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_13> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_14> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_26> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_25> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_24> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_23> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_22> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_21> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_20> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_19> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_18> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_17> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_16> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_15> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_14> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_13> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_12> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_11> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <bufstate> has a constant value of 1 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <CE2> (without init value) has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <next_state_FSM_FFd4> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <next_state_FSM_FFd3> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <next_state_FSM_FFd2> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <next_state_FSM_FFd1> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_0> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_1> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_2> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_3> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_4> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_5> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_6> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_7> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_8> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_9> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_10> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_12> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_13> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_14> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_15> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_16> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_17> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_18> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_19> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_20> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_21> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_22> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_23> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_24> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_25> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_26> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_27> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_28> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_27> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_28> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_29> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_30> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_31> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_0> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_1> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_2> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_3> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_4> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_5> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_6> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_7> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_8> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_9> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_10> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_11> has a constant value of 0 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1898 - Due to constant pushing, FF/Latch <ram_wait_i_1> is unconnected in block <uut_pedram>.
WARNING:Xst:1898 - Due to constant pushing, FF/Latch <ram_busy_i> is unconnected in block <u_ram_iface[1].u_ri>.
WARNING:Xst:1710 - FF/Latch <CE1b> (without init value) has a constant value of 1 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <WEb> (without init value) has a constant value of 1 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1710 - FF/Latch <OEb> (without init value) has a constant value of 1 in block <u_ram_iface[1].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_1> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_31> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_30> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_29> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_28> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_27> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_26> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_25> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_24> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_23> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_22> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_21> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_20> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_19> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_18> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_17> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_16> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_15> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_14> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_13> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_12> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_11> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_10> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_9> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_8> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_7> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_6> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_5> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_4> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tRDOUT_3> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_31> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_30> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_29> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_28> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_27> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_26> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_25> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_24> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_23> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_22> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_21> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_20> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_19> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_18> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_17> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_16> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_15> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_14> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_13> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_12> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_11> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_10> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_9> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_8> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_7> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_6> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_5> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_4> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_3> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tREND_2> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_30> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_29> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_28> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_27> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_26> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_25> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_24> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_23> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_22> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_21> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_20> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_19> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_18> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_17> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_16> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_15> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_14> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_13> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_12> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_11> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_10> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_9> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_8> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_7> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_6> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_5> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_4> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_3> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_2> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tHZOE_1> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_31> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_30> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_29> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_28> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_27> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_26> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_25> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_24> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_23> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_22> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_21> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_20> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_19> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_18> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
WARNING:Xst:1293 - FF/Latch <cnt_tWEND_17> has a constant value of 0 in block <u_ram_iface[0].u_ri>. This FF/Latch will be trimmed during the optimization process.
