set_property SRC_FILE_INFO {cfile:{c:/Users/Jose Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_targetx/ac701_targetx.srcs/sources_1/ip/clkgen/clkgen.xdc} rfile:../../../ac701_targetx.srcs/sources_1/ip/clkgen/clkgen.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.08
