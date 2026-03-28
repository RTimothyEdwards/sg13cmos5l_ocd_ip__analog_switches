#! /bin/bash
mkdir -p ../netlist/schematic

project=power_stage

echo ${PDK_ROOT:=/home/tim/gits} > /dev/null
echo ${PDK:=ihp-sg13cmos5l} > /dev/null

xschem -n -s -r -x -q --tcl "set top_is_subckt 1" --rcfile $PDK_ROOT/$PDK/libs.tech/xschem/xschemrc -o ../netlist/schematic -N $project.spice $project.sch

echo "Done!"
exit 0
