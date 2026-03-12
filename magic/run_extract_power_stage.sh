#! /bin/bash

echo ${PDK_ROOT:=/home/tim/gits} > /dev/null
echo ${PDK:=ihp-sg13cmos5l} > /dev/null

magic -dnull -noconsole -rcfile $PDK_ROOT/$PDK/libs.tech/magic/sky130A.magicrc << EOF
load power_stage
select top cell
extract path extfiles
extract do unique
extract all
ext2spice lvs
ext2spice -p extfiles -o ../netlist/layout/power_stage.spice
quit -noprompt
EOF
rm -r extfiles
exit 0

