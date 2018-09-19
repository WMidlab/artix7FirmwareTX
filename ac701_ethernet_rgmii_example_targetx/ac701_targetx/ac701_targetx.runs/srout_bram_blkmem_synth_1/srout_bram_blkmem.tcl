# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a200tfbg676-2

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir {C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.cache/wt} [current_project]
set_property parent.project_path {C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part xilinx.com:ac701:part0:1.2 [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_ip {{C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/srout_bram_blkmem/srout_bram_blkmem.xci}}
set_property used_in_implementation false [get_files -all {{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/srout_bram_blkmem/srout_bram_blkmem.dcp}}]
set_property is_locked true [get_files {{C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/srout_bram_blkmem/srout_bram_blkmem.xci}}]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
synth_design -top srout_bram_blkmem -part xc7a200tfbg676-2 -mode out_of_context
rename_ref -prefix_all srout_bram_blkmem_
write_checkpoint -noxdef srout_bram_blkmem.dcp
catch { report_utilization -file srout_bram_blkmem_utilization_synth.rpt -pb srout_bram_blkmem_utilization_synth.pb }
if { [catch {
  file copy -force {C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.runs/srout_bram_blkmem_synth_1/srout_bram_blkmem.dcp} {C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/srout_bram_blkmem/srout_bram_blkmem.dcp}
} _RESULT ] } { 
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}
if { [catch {
  write_verilog -force -mode synth_stub {C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/srout_bram_blkmem/srout_bram_blkmem_stub.v}
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}
if { [catch {
  write_vhdl -force -mode synth_stub {C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/srout_bram_blkmem/srout_bram_blkmem_stub.vhdl}
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}
if { [catch {
  write_verilog -force -mode funcsim {C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/srout_bram_blkmem/srout_bram_blkmem_sim_netlist.v}
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}
if { [catch {
  write_vhdl -force -mode funcsim {C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/srout_bram_blkmem/srout_bram_blkmem_sim_netlist.vhdl}
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if {[file isdir {C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.ip_user_files/ip/srout_bram_blkmem}]} {
  catch { 
    file copy -force {{C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/srout_bram_blkmem/srout_bram_blkmem_stub.v}} {C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.ip_user_files/ip/srout_bram_blkmem}
  }
}

if {[file isdir {C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.ip_user_files/ip/srout_bram_blkmem}]} {
  catch { 
    file copy -force {{C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/srout_bram_blkmem/srout_bram_blkmem_stub.vhdl}} {C:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.ip_user_files/ip/srout_bram_blkmem}
  }
}