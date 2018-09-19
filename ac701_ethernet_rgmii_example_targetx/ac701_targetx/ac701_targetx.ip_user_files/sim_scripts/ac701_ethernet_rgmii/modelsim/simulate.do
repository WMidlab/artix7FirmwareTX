onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xbip_pipe_v3_0 -L xbip_bram18k_v3_0 -L mult_gen_v12_0 -L axi_lite_ipif_v3_0 -L tri_mode_ethernet_mac_v9_0 -lib xil_defaultlib xil_defaultlib.ac701_ethernet_rgmii xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {ac701_ethernet_rgmii.udo}

run -all

quit -force
