vlib work
vlib msim

vlib msim/blk_mem_gen_v8_3_0
vlib msim/xil_defaultlib

vmap blk_mem_gen_v8_3_0 msim/blk_mem_gen_v8_3_0
vmap xil_defaultlib msim/xil_defaultlib

vcom -work blk_mem_gen_v8_3_0 -64 -93 \
"./../../../ipstatic/blk_mem_gen_v8_3_0/simulation/blk_mem_gen_v8_3.vhd" \

vcom -work xil_defaultlib -64 -93 \
"./../../../../ac701_targetx.srcs/sources_1/ip/blk_mem_gen_0_2/sim/blk_mem_gen_0.vhd" \


quit -f

