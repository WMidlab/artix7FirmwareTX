vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xbip_pipe_v3_0
vlib msim/xbip_bram18k_v3_0
vlib msim/mult_gen_v12_0
vlib msim/axi_lite_ipif_v3_0
vlib msim/tri_mode_ethernet_mac_v9_0

vmap xil_defaultlib msim/xil_defaultlib
vmap xbip_pipe_v3_0 msim/xbip_pipe_v3_0
vmap xbip_bram18k_v3_0 msim/xbip_bram18k_v3_0
vmap mult_gen_v12_0 msim/mult_gen_v12_0
vmap axi_lite_ipif_v3_0 msim/axi_lite_ipif_v3_0
vmap tri_mode_ethernet_mac_v9_0 msim/tri_mode_ethernet_mac_v9_0

vcom -work xil_defaultlib -64 \
"./../../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/xbip_utils_v3_0/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0 -64 \
"./../../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/xbip_pipe_v3_0/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
"./../../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/xbip_pipe_v3_0/hdl/xbip_pipe_v3_0.vhd" \

vcom -work xbip_bram18k_v3_0 -64 \
"./../../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/xbip_bram18k_v3_0/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
"./../../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/xbip_bram18k_v3_0/hdl/xbip_bram18k_v3_0.vhd" \

vcom -work mult_gen_v12_0 -64 \
"./../../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/mult_gen_v12_0/hdl/mult_gen_v12_0_vh_rfs.vhd" \
"./../../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/mult_gen_v12_0/hdl/mult_gen_v12_0.vhd" \

vcom -work xil_defaultlib -64 \
"./../../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/axi_lite_ipif_v3_0/hdl/src/vhdl/ipif_pkg.vhd" \

vcom -work axi_lite_ipif_v3_0 -64 \
"./../../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/axi_lite_ipif_v3_0/hdl/src/vhdl/pselect_f.vhd" \
"./../../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/axi_lite_ipif_v3_0/hdl/src/vhdl/address_decoder.vhd" \
"./../../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/axi_lite_ipif_v3_0/hdl/src/vhdl/slave_attachment.vhd" \
"./../../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/axi_lite_ipif_v3_0/hdl/src/vhdl/axi_lite_ipif.vhd" \

vlog -work tri_mode_ethernet_mac_v9_0 -64 \
"./../../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/tri_mode_ethernet_mac_v9_0/hdl/tri_mode_ethernet_mac_v9_0_rfs.v" \

vcom -work tri_mode_ethernet_mac_v9_0 -64 \
"./../../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/tri_mode_ethernet_mac_v9_0/hdl/tri_mode_ethernet_mac_v9_0_rfs.vhd" \
"./../../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/synth/common/ac701_ethernet_rgmii_block_sync_block.vhd" \
"./../../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/synth/axi_ipif/ac701_ethernet_rgmii_axi4_lite_ipif_wrapper.vhd" \
"./../../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/synth/ac701_ethernet_rgmii_clk_en_gen.vhd" \
"./../../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/synth/physical/ac701_ethernet_rgmii_rgmii_v2_0_if.vhd" \
"./../../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/synth/ac701_ethernet_rgmii_block.vhd" \

vcom -work xil_defaultlib -64 \
"./../../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ac701_ethernet_rgmii/synth/ac701_ethernet_rgmii.vhd" \

vlog -work xil_defaultlib "glbl.v"

quit -f

