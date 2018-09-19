onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib udp_cmdrx_wr8rd32_opt

do {wave.do}

view wave
view structure
view signals

do {udp_cmdrx_wr8rd32.udo}

run -all

quit -force
