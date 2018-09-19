onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L secureip -L fifo_generator_v12_0 -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.udp_cmdrx_wr8rd32

do {wave.do}

view wave
view structure
view signals

do {udp_cmdrx_wr8rd32.udo}

run -all

quit -force
