vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"./../../../../ac701_targetx.srcs/sources_1/ip/clkgen/clkgen_clk_wiz.v" \
"./../../../../ac701_targetx.srcs/sources_1/ip/clkgen/clkgen.v" \


vlog -work xil_defaultlib "glbl.v"

quit -f

