onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib eth_head_fifo_opt

do {wave.do}

view wave
view structure
view signals

do {eth_head_fifo.udo}

run -all

quit -force
