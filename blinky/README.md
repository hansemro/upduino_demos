# `blinky` Demo for Upduino

`blinky` cycles through 8 color states at roughly 1.5 Hz.

This design was tested with Upduino v3.

# Setup

Arch-based distributions:

```
sudo pacman -S gtkwave iverilog
yay -S yosys-git arachne-pnr-git nextpnr-git icestorm-git
git clone https://github.com/hansemro/upduino_demos.git
cd upduino_demos/blinky
```

# Build Guide

Provided `Makefile` contains two build flows that can be configured by setting
`PNR_METHOD` variable:

1. `make PNR_METHOD=arachne-pnr build`:  yosys -> arachne-pnr -> icepack
2. `make PNR_METHOD=nextpnr`: yosys -> nextpnr -> icepack

By default, `make build` will use arachne-pnr method.

# Simulation and Viewing Waveform

```
make sim    # simulate design with testbench
make wave   # view waveform with gtkwave
```

# Uploading Design to Upduino

With the upduino connected to the computer via USB port, run `make upload` to
upload the bitstream to the FPGA. Once successful, Upduino should be cycling
through colors.

# Resources/Credits

`blinky.v` derives from idorobots' tutorial.

- [Upduino FPGA tutorial by idorobots](https://blog.idorobots.org/entries/upduino-fpga-tutorial.html)
- [Project Icestorm](http://www.clifford.at/icestorm/)
