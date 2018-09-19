onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib udp_wavtx_fifo_w32r8_opt

do {wave.do}

view wave
view structure
view signals

do {udp_wavtx_fifo_w32r8.udo}

run -all

quit -force
