#---------------------------------------------------------------------
# Generated device scripts for 5V pMOS waffle power FET in SG13CMOS5L
# Set variable "waffle_size" prior to sourcing this Tcl script in
# magic to get a power transistor of (waffle_size * waffle_size)
# units.
#
# Each transistor is width 4.36um;  the total number of transistors
# is 2 * $waffle_size * ($waffle_size - 1).
# So for waffle_size = 20, there are 760 transistors, or total width
# 3313.6um.
#
# Ports of the device are:
#
# A = high side power input (VDD), connected to the nwell bias.
# B = output
# GATE = power transistor enable, sense negative (0 = enabled)
# SUB = substrate connection (ground).
#
#---------------------------------------------------------------------
#
# The size of the power FET is effectively determined by the smallest
# area occupied by a top metal stripe at 45 degrees at minimum width
# and minimum spacing.  This size has been made slightly larger to
# make the unit cell pitch exactly 5um.
#
#---------------------------------------------------------------------

namespace path {::tcl::mathop ::tcl::mathfunc}

# This creates cell pmos_waffle_junction
set curdrc [drc status]
drc off
set curunits [units]
units microns

# The generator script is in the path of the main script
set script_path [file normalize [info script]]
set script_dir [file dirname $script_path]

# Generate the three parts of the waffle transistor base and
# record the size of each.

source ${script_dir}/pmos_waffle_junction.tcl
select top cell
set jheight [box height]
set jwidth [box width]

source ${script_dir}/pmos_waffle_side.tcl
select top cell
set sheight [box height]
set swidth [box width]

source ${script_dir}/pmos_waffle_corner.tcl
select top cell
set cheight [box height]
set cwidth [box width]

if {[catch {set waffle_size}]} {
    set waffle_size 20
    puts stdout "Waffle size set to default 20 x 20"
} else {
    puts stdout "Waffle size is $waffle_size x $waffle_size"
}
set waffle_max [- $waffle_size 2]

load pmos_waffle_$waffle_size -silent
box values 0 0 0 0
box size $cwidth $cheight

# Place the lower left corner
dump pmos_waffle_corner 180
box move e [box width]

# Place the bottom row edge
box size $swidth $sheight
for {set i 0} {$i < $waffle_max} {incr i} {
   if {[expr {$i % 2}] == 1} {set orient 90h} {set orient 90}
   dump pmos_waffle_side $orient
   box move e $jwidth
}
# Place the bottom right corner
dump pmos_waffle_corner 90

# Place the left row edge
box values 0 0 0 0
box size $cwidth $cheight
box move n [box height]
box size $swidth $sheight
for {set j 0} {$j < $waffle_max} {incr j} {
   if {[expr {$j % 2}] == 1} {set orient 180} {set orient 180v}
   dump pmos_waffle_side $orient
   box move n [box height]
}
# Place the top left corner
dump pmos_waffle_corner 270

# Place the main array
box values 0 0 0 0
box size $cwidth $cheight
box move e $cwidth
box move n $cheight
box size $jwidth $jheight

for {set i 0} {$i < $waffle_max} {incr i} {
    pushbox
    for {set j 0} {$j < $waffle_max} {incr j} {
	if {[expr {($j + $i) % 2}] == 1} {set orient h} {set orient 0}
	dump pmos_waffle_junction $orient
	box move e [box width]
    }
    # Place the end side
    if {[expr {$i % 2}] == 1} {set orient v} {set orient 0}
    dump pmos_waffle_side $orient
    popbox
    box move n [box height]
}

# Place the top row edge
box size $swidth $sheight
for {set i 0} {$i < $waffle_max} {incr i} {
    if {[expr {$i % 2}] == 1} {set orient 270} {set orient 270h}
    dump pmos_waffle_side $orient
    box move e $jwidth
}
# Place the top right corner
dump pmos_waffle_corner

# Generate the diagonal wires on top
foreach metal {m3 m4 m5} {
    if {$metal == "m5"} {set mwidth 1.7} {set mwidth 2.7}
    set ixy 0.62
    set osxy -1
    set olxy -5
    for {set i 0} {$i <= $waffle_max} {incr i} {
	# bxy is the X and Y position of the ends of the diagonal wire
	set bxy [+ $cwidth [* $i $jwidth]]
	if {[% $i 2] == 1} {
	    set o1xy $osxy
	    set o2xy $olxy
	} else {
	    set o1xy $olxy
	    set o2xy $osxy
	}
	wire segment $metal $mwidth $bxy $o1xy $bxy $ixy $ixy $bxy $o2xy $bxy
    }
    set maxxy [+ [* $cwidth 2] [* $jwidth $waffle_max]]
    set ixy [- $maxxy 0.62]
    set osxy [+ $maxxy 1]
    set olxy [+ $maxxy 5]
    for {set i $waffle_max} {$i >= 0} {incr i -1} {
	# bxy is the X and Y position of the ends of the diagonal wire
	set bxy [+ $cwidth [* $i $jwidth]]
	if {[% $i 2] == 1} {
	    set o1xy $osxy
	    set o2xy $olxy
	} else {
	    set o1xy $olxy
	    set o2xy $osxy
	}
	wire segment $metal $mwidth $o1xy $bxy $ixy $bxy $bxy $ixy $bxy $o2xy
    }
    # Last wire segment down the middle diagonal
    set i [+ $waffle_max 1]
    set bxy [+ $cwidth [* $i $jwidth]]
    set osxy -1
    set olxy [+ $maxxy 5]
    wire segment $metal $mwidth $bxy $osxy $bxy 0.62 0.62 $bxy 0.62 $olxy
}

# Connect power around the perimeter
select top cell
box width 2
box grow s -5
paint m3,m4,m5
label B FreeSans 2 270 0 0 c m5
select area label
setlabel sticky true
port make
box grow c -0.1
paint via3
box grow c -0.22
paint via4
select top cell
box move n [box height]
box move s 2
box height 2
box grow e -5
paint m3,m4,m5
box grow c -0.1
paint via3
box grow c -0.22
paint via4

select top cell
box height 2
box grow w -5
paint m3,m4,m5
box grow c -0.1
paint via3
box grow c -0.22
paint via4
select top cell
box move e [box width]
box move w 2
box width 2
box grow n -5
paint m3,m4,m5
label A FreeSans 2 90 0 0 c m5
select area label
setlabel sticky true
port make
box grow c -0.1
paint via3
box grow c -0.22
paint via4

# Last two labels---Put in lower left-hand corner so that the position
# is valid regardless of the size of the power transistor.  The position
# is sensitive to the corner cell layout.
box values 0.11 0.11 3.03 0.51
label SUB FreeSans 0.5 0 0 0 c hvpsc
select area label
setlabel sticky true
port make

box values 1.23 1.23 2.98 1.52
label GATE FreeSans 0.3 0 0 0 c m1
select area label
setlabel sticky true
port make

writeall force pmos_waffle_$waffle_size

units {*}$curunits
if {$curdrc == 0} {drc off} {drc on}

