onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ac701_ethernet_rgmii_opt

do {wave.do}

view wave
view structure
view signals

do {ac701_ethernet_rgmii.udo}

run -all

quit -force
