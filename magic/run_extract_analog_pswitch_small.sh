#! /bin/bash

echo ${PDK_ROOT:=/home/tim/gits} > /dev/null
echo ${PDK:=ihp-sg13cmos5l} > /dev/null

magic -dnull -noconsole -rcfile $PDK_ROOT/$PDK/libs.tech/magic/${PDK}.magicrc << EOF
addpath ../../../magic/sg13cmos5l_stdcell
load analog_pswitch_small
select top cell
extract path extfiles
extract do unique
extract all
ext2spice lvs
ext2spice -p extfiles -o ../netlist/layout/analog_pswitch_small.spice
quit -noprompt
EOF
rm -r extfiles
exit 0

