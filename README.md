# IHP_SG13_cells
"small Verilog layer to easily switch between SG13G2 and SG13CMOS5L from the IHP PDK"

## That's useful if
* you code in Verilog
* you use direct PDK cell instantiations (with the "(* keep *)" prefix)
* you want to easily switch between the 2 PDK variants so your design can go to either CMOSL5L or G2 with the least modifications

## Changes:
* The alias layer does the "(* keep *)" prefix so no need to specify it
* just remove the cmos5l or g2 from the cell name

## Warnings:
* untested so far.
* not all gates are converted but you usually don't care about the antennas.
* it's just a quick and dirty hack
* you're on your own

## Licence:
It's based on the Free IHP PDK so their license applies.
Check https://github.com/IHP-GmbH/IHP-Open-PDK
