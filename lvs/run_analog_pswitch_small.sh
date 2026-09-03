#!/bin/bash

echo ${PDK_ROOT:=/home/tim/gits} > /dev/null
echo ${PDK:=ihp-sg13cmos5l} > /dev/null

netgen -batch source run_analog_pswitch_small.tcl | tee netgen.log

