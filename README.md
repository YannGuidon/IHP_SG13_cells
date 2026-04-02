# IHP_SG13_cells
"small Verilog layer to easily switch between SG13G2 and SG13CMOS5L from the IHP PDK"

## That's useful if
* you code in Verilog
* you play with the TinyTapeout templates https://github.com/TinyTapeout/ttihp-verilog-template
* you use direct PDK cell instantiations (with the "(* keep *)" prefix)
* you want to easily switch between the 2 PDK variants so your design can go to either CMOSL5L or G2 with the least modifications

## Changes:
* The alias layer does the "(* keep *)" prefix so no need to specify it
* just remove the cmos5l or g2 from the cell name

## How to use:
* put the file sg13_cells_sim.v in your /test directory and add its path+name to the /test/Makefile in the sim section, as extra source.
* put either sg13_cells_sg13cmos5l.v or sg13_cells_sg13g2.v (depending on the target) in the /src directory and add the path+name as extra source in the /test/Makefile, in the synthesis section.

## Regenerate
cmos5l_gates.tgz contains the directory full of the original, individual gates. convert_ihp.sh parses them to create the 3 .v files.
These original files are derived from https://github.com/IHP-GmbH/IHP-Open-PDK/blob/main/ihp-sg13g2/libs.ref/sg13g2_stdcell/verilog/sg13g2_stdcell.v

## Warnings:
* untested so far.
* not all gates are converted but you usually don't care about the antennas.
* it's just a quick and dirty hack
* you're on your own
* there is some redundancy (the primitives) that I couldn't script out.
* It is just a little abstraction layer for convenience, it does not cover the project's configuration => check https://github.com/urish/tt-simon-game/commit/a3c405c62e63701978cb67e9c8f641f15a0e2907

## Licence:
It's based on the Free IHP PDK so their license applies: https://www.apache.org/licenses/LICENSE-2.0
See https://github.com/IHP-GmbH/IHP-Open-PDK
