vlib work
vlib msim

vlib msim/blk_mem_gen_v8_2
vlib msim/xil_defaultlib

vmap blk_mem_gen_v8_2 msim/blk_mem_gen_v8_2
vmap xil_defaultlib msim/xil_defaultlib

vcom -work blk_mem_gen_v8_2 -64 \
"./../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ip_rx_bram/blk_mem_gen_v8_2/simulation/blk_mem_gen_v8_2.vhd" \

vcom -work xil_defaultlib -64 \
"./../../../../ac701_ethernet_rgmii_example.srcs/sources_1/ip/ip_rx_bram/sim/ip_rx_bram.vhd" \


quit -f

