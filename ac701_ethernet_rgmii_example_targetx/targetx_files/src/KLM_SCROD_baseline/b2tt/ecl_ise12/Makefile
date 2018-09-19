#
#  Makefile to replace ISE GUI
#
#  M.Nakao
#

ISE = /home/xilinx/ise12.4/ISE

PATH:=$(ISE)/bin/lin64:$(ISE)/bin/lin:$(PATH)

SRC    = ecl_b2tt
NAME   = ecl_b2tt
PART   = xc6slx150t-fgg900-3

#-- input and output
VHDL  = ../main/ecl_b2tt.vhd
UCF   = ../main/ecl_b2tt.ucf
BIT   = $(NAME).bit
NGDDIR = -sd ../b2tts6-coregen
ADD   = \
	../b2tt/b2tt_symbols.vhd \
	../b2tt/b2tt_iscan.vhd \
	../b2tt/b2tt_ddr_s6.vhd \
	../b2tt/b2tt_8b10b.vhd \
	../b2tt/b2tt_fifo_s6.vhd \
	../b2tt/b2tt_encode.vhd \
	../b2tt/b2tt_decode.vhd \
	../b2tt/b2tt_clk_s6.vhd \
	../b2tt/b2tt.vhd

#-- commands
XSTCMD = xst
NGDCMD = ngdbuild
MAPCMD = map
PARCMD = par
RPTCMD = reportgen
TRCCMD = trce
GENCMD = bitgen

#-- command options
ISEOPT = -intstyle ise
XSTOPT = $(ISEOPT)
NGDOPT = $(ISEOPT) -dd _ngo $(NGDDIR) -nt timestamp -uc $(UCF) -p $(PART)
MAPOPT1 = -w -logic_opt off -ol high -xe n -t 1 -xt 0 -register_duplication on
MAPOPT2 = -r 8 -global_opt speed -equivalent_register_removal on -mt off
MAPOPT3 = -ir off -pr off -lc off -power off
MAPOPT = $(ISEOPT) -p $(PART) $(MAPOPT1) $(MAPOPT2) $(MAPOPT3)
PAROPT = $(ISEOPT) -w -ol high -xe n -mt 4
TRCOPT = $(ISEOPT) -v 3 -s 3 -n 3 -fastpaths
GENOPT = $(ISEOPT)
RPTOPT = $(ISEOPT)

#-- intermediate files
NGC   = $(NAME).ngc
XSTIN = $(NAME).xst
NGD   = $(NAME).ngd
MAP   = $(NAME)_map.ncd
NCD   = $(NAME).ncd
PCF   = $(NAME).pcf
TWR   = $(NAME).twr
NPL   = $(NAME).npl
UTF   = $(NAME).ut

#-- log files
SYR   = $(NAME).syr
BLD   = $(NAME).bld
MRP   = $(NAME).mrp


all: $(BIT)

clean:
	-rm -fr _ngo _xmsgs xlnx_auto_0_xdb iseconfig xst
	-rm -f *.bgn *.bld *.dly *.drc *.lso *.ncd *.ngc *.ngd *.ngr
	-rm -f *.pad *.par *.pcf *.ptwx *.syr *.twx *.unroutes *.xpi
	-rm -f *.map *.mrp *.ngm *.psr *.xrpt *_pad.{csv,txt} *.xml *.log
	-rm -f  *.stx *.xwbt *.html *.cmd_log
	-rm -f *~ *.bak

backup:
	sh make-backup.sh

$(BIT): $(VHDL) $(ADD) $(UCF)
	-mkdir -p xst/projnav.tmp >/dev/null
	$(XSTCMD) $(XSTOPT) -ifn $(XSTIN) -ofn $(SYR)
	$(NGDCMD) $(NGDOPT) $(NGC) $(NGD)
	$(MAPCMD) $(MAPOPT) -o $(MAP) $(NGD) $(PCF)
	$(PARCMD) $(PAROPT) $(MAP) $(NCD) $(PCF)
	$(RPTCMD) $(RPTOPT) -delay $(NCD)
	$(GENCMD) $(GENOPT) -f $(UTF) $(NCD)
	$(TRCCMD) $(TRCOPT) $(NCD) -o $(TWR) $(PCF) -ucf $(UCF)
	grep 'Maximum frequency' $(TWR)
	grep 'failing' $(TWR)

# $(NGC): $(VHDL) $(ADD)
# 	-mkdir -p xst/projnav.tmp >/dev/null
# 	$(XSTCMD) $(XSTOPT) -ifn $(XSTIN) -ofn $(SYR)
# 
# $(NGD): $(NGC) $(UCF)
# 	$(NGDCMD) $(NGDOPT) $(NGC) $(NGD)
# 
# $(PCF): $(NGD)
# 	$(MAPCMD) $(MAPOPT) -o $(MAP) $(NGD) $(PCF)
# 
# $(NCD): $(PCF)
# 	$(PARCMD) $(PAROPT) $(MAP) $(NCD) $(PCF)
# 	$(RPTCMD) $(RPTOPT) -delay $(NCD)
# 
# $(BIT): $(NCD)
# 	$(GENCMD) $(GENOPT) -f $(UTF) $(NCD)
# 
# $(TWR): $(NCD)
# 	$(TRCCMD) $(TRCOPT) $(NCD) -o $(TWR) $(PCF) -ucf $(UCF)
# 	grep 'Maximum frequency' $(TWR)
# 	grep 'failing' $(TWR)
