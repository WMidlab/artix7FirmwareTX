onerror { resume }
transcript off
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/tied_to_ground_i}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/tied_to_ground_vec_i}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/tied_to_vcc_i}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/open_rxbufstatus}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/open_txbufstatus}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/open_rxbufstatus_lane1}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/open_txbufstatus_lane1}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/plllkdet_i}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/plllkdet_lane1_i}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/resetdone0_i}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/resetdone1_i}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/LOOPBACK_IN}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RXCHARISCOMMA_OUT}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RXCHARISK_OUT}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RXDISPERR_OUT}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RXNOTINTABLE_OUT}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/ENCHANSYNC_IN}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/CHBONDDONE_OUT}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RXBUFERR_OUT}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RXREALIGN_OUT}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/ENMCOMMAALIGN_IN}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/ENPCOMMAALIGN_IN}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RXDATA_OUT}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RXRECCLK1_OUT}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RXRECCLK2_OUT}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RXRESET_IN}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RXUSRCLK_IN}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RXUSRCLK2_IN}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RXEQMIX_IN}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RX1N_IN}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RX1P_IN}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RXPOLARITY_IN}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/DADDR_IN}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/DCLK_IN}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/DEN_IN}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/DI_IN}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/DRDY_OUT}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/DRPDO_OUT}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/DWE_IN}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/REFSELDYPLL}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/REFCLK}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/GTPRESET_IN}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/PLLLKDET_OUT}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/TXCHARISK_IN}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/TXDATA_IN}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/GTPCLKOUT_OUT}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/TXRESET_IN}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/TXUSRCLK_IN}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/TXUSRCLK2_IN}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/TXBUFERR_OUT}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/TX1N_OUT}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/TX1P_OUT}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RXCHARISCOMMA_OUT_unused}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RXCHARISK_OUT_unused}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RXDISPERR_OUT_unused}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RXNOTINTABLE_OUT_unused}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RXREALIGN_OUT_unused}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RXDATA_OUT_unused}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RX1N_IN_unused}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RX1P_IN_unused}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/RXBUFERR_OUT_unused}
add wave -noreg -hexadecimal -literal {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/TXBUFERR_OUT_unused}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/CHBONDDONE_OUT_unused}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/TX1N_OUT_unused}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/TX1P_OUT_unused}
add wave -noreg -logic {/klm_aurora_tb/UUT1/klm_aurora_ins/gtp_wrapper_i/POWERDOWN_IN}
cursor "Cursor 1" 0ps  
transcript on
