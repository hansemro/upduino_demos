# Blinky Makefile for upduino v3.0

.PHONY: all
all: build

PNR_METHOD ?= arachne-pnr# or nextpnr
PCF_FILE = up5k.pcf

# Yosys-Arachne-Icepack Flow
blinky_top.blif: blinky.v top.v
	yosys -p "synth_ice40 -blif $@" $^

blinky_top.arachne-pnr.asc: blinky_top.blif
	arachne-pnr -d 5k -p $(PCF_FILE) -o $@ $<

# Yosys-Nextpnr-Icepack Flow
blinky_top.json: blinky.v top.v
	yosys -p "synth_ice40 -json $@" $^

blinky_top.nextpnr.asc: blinky_top.json
	nextpnr-ice40 --up5k --pcf $(PCF_FILE) --asc $@ --json $<

blinky_top.$(PNR_METHOD).bin: blinky_top.$(PNR_METHOD).asc
	icepack $< $@

build_top.bin: blinky_top.$(PNR_METHOD).bin
	-rm -f blinky_top.bin
	ln -s $< blinky_top.bin

.PHONY: build build_arachne-pnr build_nextpnr
build: build_top.bin

.PHONY: sim wave
sim: blinky.v blinky_tb.v
	iverilog -o blinky_tb.out -D VCD_OUTPUT=blinky_tb $^
	vvp blinky_tb.out
wave: sim
	gtkwave blinky_tb.vcd

.PHONY: upload
upload: blinky_top.bin
	# TODO: ask user to confirm
	iceprog $< | tee iceprog.log

.PHONY: clean
clean:
	-rm -f *.vcd
	-rm -f *.log
	-rm -f blinky_top.blif
	-rm -f blinky_top.json
	-rm -f blinky_top.*.asc
	-rm -f blinky_top*.bin
	-rm -f blinky_tb.out
	-rm -f blinky_tb.gtkw

.PHONY: help
help:
	@echo "make"
	@echo "make build"
	@echo "make sim"
	@echo "make upload"
	@echo "make clean"
	@echo "make help"
