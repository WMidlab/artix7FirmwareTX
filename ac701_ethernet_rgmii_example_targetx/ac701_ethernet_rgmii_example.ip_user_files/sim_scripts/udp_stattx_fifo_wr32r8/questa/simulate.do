onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib udp_stattx_fifo_wr32r8_opt

do {wave.do}

view wave
view structure
view signals

do {udp_stattx_fifo_wr32r8.udo}

run -all

quit -force
