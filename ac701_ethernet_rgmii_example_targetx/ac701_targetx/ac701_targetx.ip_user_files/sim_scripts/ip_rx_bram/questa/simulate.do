onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ip_rx_bram_opt

do {wave.do}

view wave
view structure
view signals

do {ip_rx_bram.udo}

run -all

quit -force
