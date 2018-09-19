onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L secureip -L blk_mem_gen_v8_2 -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.ip_rx_bram

do {wave.do}

view wave
view structure
view signals

do {ip_rx_bram.udo}

run -all

quit -force
