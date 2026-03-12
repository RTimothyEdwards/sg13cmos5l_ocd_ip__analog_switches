# Tcl script to run LVS on the power switch (power_stage)

if {[catch {set PDK_ROOT $::env(PDK_ROOT)}]} {set PDK_ROOT /home/tim/gits}
if {[catch {set PDK $::env(PDK)}]} {set PDK ihp-sg13cmos5l}

set project power_stage

set pdklib ${PDK_ROOT}/${PDK}
set techlibs ${pdklib}/libs.tech
set reflibs ${pdklib}/libs.ref

set setupfile ${techlibs}/netgen/${PDK}_setup.tcl

set circuit1 [readnet spice ../netlist/layout/${project}.spice]
set circuit2 [readnet spice \
	${PDK_ROOT}/${PDK}/libs.ref/sg13cmos5l_stdcell/spice/sg13cmos5l_stdcell.spice]
readnet spice ../netlist/schematic/${project}.spice $circuit2

lvs "$circuit1 $project" "$circuit2 $project" $setupfile ${project}_comp.out
