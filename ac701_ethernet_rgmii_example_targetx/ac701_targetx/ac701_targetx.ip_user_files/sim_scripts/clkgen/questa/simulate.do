onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib clkgen_opt

do {wave.do}

view wave
view structure
view signals

do {clkgen.udo}

run -all

quit -force
