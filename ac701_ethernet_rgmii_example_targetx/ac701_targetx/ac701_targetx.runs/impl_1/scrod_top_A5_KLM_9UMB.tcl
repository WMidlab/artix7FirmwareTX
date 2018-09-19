proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xc7a200tfbg676-2
  set_property board_part xilinx.com:ac701:part0:1.2 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir {C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.cache/wt} [current_project]
  set_property parent.project_path {C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.xpr} [current_project]
  set_property ip_repo_paths {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.cache/ip}} [current_project]
  set_property ip_output_repo {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.cache/ip}} [current_project]
  add_files -quiet {{C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.runs/synth_1/scrod_top_A5_KLM_9UMB.dcp}}
  add_files -quiet {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/ac701_ethernet_rgmii.dcp}}
  set_property netlist_only true [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/ac701_ethernet_rgmii.dcp}}]
  add_files -quiet {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/eth_head_fifo/eth_head_fifo.dcp}}
  set_property netlist_only true [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/eth_head_fifo/eth_head_fifo.dcp}}]
  add_files -quiet {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/tx_fifo/tx_fifo.dcp}}
  set_property netlist_only true [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/tx_fifo/tx_fifo.dcp}}]
  add_files -quiet {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/ip_rx_bram/ip_rx_bram.dcp}}
  set_property netlist_only true [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/ip_rx_bram/ip_rx_bram.dcp}}]
  add_files -quiet {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/blk_mem_gen_v8_3/blk_mem_gen_v8_3.dcp}}
  set_property netlist_only true [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/blk_mem_gen_v8_3/blk_mem_gen_v8_3.dcp}}]
  add_files -quiet {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/udp_wavtx_fifo_w32r8/udp_wavtx_fifo_w32r8.dcp}}
  set_property netlist_only true [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/udp_wavtx_fifo_w32r8/udp_wavtx_fifo_w32r8.dcp}}]
  add_files -quiet {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/udp_cmdrx_wr8rd32/udp_cmdrx_wr8rd32.dcp}}
  set_property netlist_only true [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/udp_cmdrx_wr8rd32/udp_cmdrx_wr8rd32.dcp}}]
  add_files -quiet {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/udp_stattx_fifo_wr32r8/udp_stattx_fifo_wr32r8.dcp}}
  set_property netlist_only true [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/udp_stattx_fifo_wr32r8/udp_stattx_fifo_wr32r8.dcp}}]
  add_files -quiet {{C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.runs/clkgen_synth_1/clkgen.dcp}}
  set_property netlist_only true [get_files {{C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.runs/clkgen_synth_1/clkgen.dcp}}]
  add_files -quiet {{C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.runs/blk_mem_gen_0_synth_1/blk_mem_gen_0.dcp}}
  set_property netlist_only true [get_files {{C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.runs/blk_mem_gen_0_synth_1/blk_mem_gen_0.dcp}}]
  add_files -quiet {{C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.runs/blk_mem_gen_1_synth_1/blk_mem_gen_1.dcp}}
  set_property netlist_only true [get_files {{C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.runs/blk_mem_gen_1_synth_1/blk_mem_gen_1.dcp}}]
  add_files -quiet {{C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.runs/blk_mem_gen_2_synth_1/blk_mem_gen_2.dcp}}
  set_property netlist_only true [get_files {{C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.runs/blk_mem_gen_2_synth_1/blk_mem_gen_2.dcp}}]
  add_files -quiet {{C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.runs/srout_bram_blkmem_synth_1/srout_bram_blkmem.dcp}}
  set_property netlist_only true [get_files {{C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.runs/srout_bram_blkmem_synth_1/srout_bram_blkmem.dcp}}]
  read_xdc -prop_thru_buffers -ref ac701_ethernet_rgmii -cells U0 {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/synth/ac701_ethernet_rgmii_board.xdc}}
  set_property processing_order EARLY [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/synth/ac701_ethernet_rgmii_board.xdc}}]
  read_xdc -ref ac701_ethernet_rgmii -cells U0 {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/synth/ac701_ethernet_rgmii.xdc}}
  set_property processing_order EARLY [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/synth/ac701_ethernet_rgmii.xdc}}]
  read_xdc -ref eth_head_fifo -cells U0 {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/eth_head_fifo/eth_head_fifo/eth_head_fifo.xdc}}
  set_property processing_order EARLY [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/eth_head_fifo/eth_head_fifo/eth_head_fifo.xdc}}]
  read_xdc -ref tx_fifo -cells U0 {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/tx_fifo/tx_fifo/tx_fifo.xdc}}
  set_property processing_order EARLY [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/tx_fifo/tx_fifo/tx_fifo.xdc}}]
  read_xdc -ref udp_wavtx_fifo_w32r8 -cells U0 {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/udp_wavtx_fifo_w32r8/udp_wavtx_fifo_w32r8/udp_wavtx_fifo_w32r8.xdc}}
  set_property processing_order EARLY [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/udp_wavtx_fifo_w32r8/udp_wavtx_fifo_w32r8/udp_wavtx_fifo_w32r8.xdc}}]
  read_xdc -ref udp_cmdrx_wr8rd32 -cells U0 {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/udp_cmdrx_wr8rd32/udp_cmdrx_wr8rd32/udp_cmdrx_wr8rd32.xdc}}
  set_property processing_order EARLY [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/udp_cmdrx_wr8rd32/udp_cmdrx_wr8rd32/udp_cmdrx_wr8rd32.xdc}}]
  read_xdc -ref udp_stattx_fifo_wr32r8 -cells U0 {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/udp_stattx_fifo_wr32r8/udp_stattx_fifo_wr32r8/udp_stattx_fifo_wr32r8.xdc}}
  set_property processing_order EARLY [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/udp_stattx_fifo_wr32r8/udp_stattx_fifo_wr32r8/udp_stattx_fifo_wr32r8.xdc}}]
  read_xdc -mode out_of_context -ref clkgen -cells inst {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.srcs/sources_1/ip/clkgen/clkgen_ooc.xdc}}
  set_property processing_order EARLY [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.srcs/sources_1/ip/clkgen/clkgen_ooc.xdc}}]
  read_xdc -prop_thru_buffers -ref clkgen -cells inst {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.srcs/sources_1/ip/clkgen/clkgen_board.xdc}}
  set_property processing_order EARLY [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.srcs/sources_1/ip/clkgen/clkgen_board.xdc}}]
  read_xdc -ref clkgen -cells inst {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.srcs/sources_1/ip/clkgen/clkgen.xdc}}
  set_property processing_order EARLY [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.srcs/sources_1/ip/clkgen/clkgen.xdc}}]
  read_xdc -mode out_of_context -ref blk_mem_gen_0 -cells U0 {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.srcs/sources_1/ip/blk_mem_gen_0_2/blk_mem_gen_0_ooc.xdc}}
  set_property processing_order EARLY [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.srcs/sources_1/ip/blk_mem_gen_0_2/blk_mem_gen_0_ooc.xdc}}]
  read_xdc -mode out_of_context -ref blk_mem_gen_1 -cells U0 {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.srcs/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1_ooc.xdc}}
  set_property processing_order EARLY [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.srcs/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1_ooc.xdc}}]
  read_xdc -mode out_of_context -ref blk_mem_gen_2 -cells U0 {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.srcs/sources_1/ip/blk_mem_gen_2/blk_mem_gen_2_ooc.xdc}}
  set_property processing_order EARLY [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.srcs/sources_1/ip/blk_mem_gen_2/blk_mem_gen_2_ooc.xdc}}]
  read_xdc -mode out_of_context -ref srout_bram_blkmem -cells U0 {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/srout_bram_blkmem/srout_bram_blkmem_ooc.xdc}}
  set_property processing_order EARLY [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/srout_bram_blkmem/srout_bram_blkmem_ooc.xdc}}]
  read_xdc {{C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/constrs_1/imports/example_design/ac701_ethernet_rgmii_example_design.xdc}}
  read_xdc -ref ac701_ethernet_rgmii -cells U0 {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/synth/ac701_ethernet_rgmii_clocks.xdc}}
  set_property processing_order LATE [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/synth/ac701_ethernet_rgmii_clocks.xdc}}]
  read_xdc -ref udp_wavtx_fifo_w32r8 -cells U0 {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/udp_wavtx_fifo_w32r8/udp_wavtx_fifo_w32r8/udp_wavtx_fifo_w32r8_clocks.xdc}}
  set_property processing_order LATE [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/udp_wavtx_fifo_w32r8/udp_wavtx_fifo_w32r8/udp_wavtx_fifo_w32r8_clocks.xdc}}]
  read_xdc -ref udp_cmdrx_wr8rd32 -cells U0 {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/udp_cmdrx_wr8rd32/udp_cmdrx_wr8rd32/udp_cmdrx_wr8rd32_clocks.xdc}}
  set_property processing_order LATE [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/udp_cmdrx_wr8rd32/udp_cmdrx_wr8rd32/udp_cmdrx_wr8rd32_clocks.xdc}}]
  read_xdc -ref udp_stattx_fifo_wr32r8 -cells U0 {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/udp_stattx_fifo_wr32r8/udp_stattx_fifo_wr32r8/udp_stattx_fifo_wr32r8_clocks.xdc}}
  set_property processing_order LATE [get_files {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/udp_stattx_fifo_wr32r8/udp_stattx_fifo_wr32r8/udp_stattx_fifo_wr32r8_clocks.xdc}}]
  link_design -top scrod_top_A5_KLM_9UMB -part xc7a200tfbg676-2
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force scrod_top_A5_KLM_9UMB_opt.dcp
  report_drc -file scrod_top_A5_KLM_9UMB_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  catch {write_hwdef -file scrod_top_A5_KLM_9UMB.hwdef}
  place_design 
  write_checkpoint -force scrod_top_A5_KLM_9UMB_placed.dcp
  report_io -file scrod_top_A5_KLM_9UMB_io_placed.rpt
  report_utilization -file scrod_top_A5_KLM_9UMB_utilization_placed.rpt -pb scrod_top_A5_KLM_9UMB_utilization_placed.pb
  report_control_sets -verbose -file scrod_top_A5_KLM_9UMB_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force scrod_top_A5_KLM_9UMB_routed.dcp
  report_drc -file scrod_top_A5_KLM_9UMB_drc_routed.rpt -pb scrod_top_A5_KLM_9UMB_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file scrod_top_A5_KLM_9UMB_timing_summary_routed.rpt -rpx scrod_top_A5_KLM_9UMB_timing_summary_routed.rpx
  report_power -file scrod_top_A5_KLM_9UMB_power_routed.rpt -pb scrod_top_A5_KLM_9UMB_power_summary_routed.pb
  report_route_status -file scrod_top_A5_KLM_9UMB_route_status.rpt -pb scrod_top_A5_KLM_9UMB_route_status.pb
  report_clock_utilization -file scrod_top_A5_KLM_9UMB_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

