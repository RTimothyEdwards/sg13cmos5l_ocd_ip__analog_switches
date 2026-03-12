# Command script for generating cell pmos_waffle_corner2

suspendall
tech unlock *
set curunits [units]
units internal
load pmos_waffle_corner2 -silent
box values 0 0 0 0
box values -2000 -2000 2588 2588
paint checkpaint
box values 0 0 588 588
paint nwell
box values 0 224 200 304
paint hvpmos
box values 224 0 304 200
paint hvpmos
box values 0 430 200 444
paint hvpdiff
box values 144 398 200 430
paint hvpdiff
box values 0 358 200 398
paint hvpdiff
box values 144 326 200 358
paint hvpdiff
box values 0 304 200 326
paint hvpdiff
box values 0 202 200 224
paint hvpdiff
box values 144 200 200 202
paint hvpdiff
box values 144 170 224 200
paint hvpdiff
box values 0 144 224 170
paint hvpdiff
box values 144 0 170 144
paint hvpdiff
box values 202 0 224 144
paint hvpdiff
box values 304 144 444 200
paint hvpdiff
box values 304 0 326 144
paint hvpdiff
box values 358 0 398 144
paint hvpdiff
box values 430 0 444 144
paint hvpdiff
box values 0 398 144 430
paint hvpdiffc
box values 0 326 144 358
paint hvpdiffc
box values 0 170 144 202
paint hvpdiffc
box values 170 0 202 144
paint hvpdiffc
box values 326 0 358 144
paint hvpdiffc
box values 398 0 430 144
paint hvpdiffc
box values 0 130 144 144
paint hvnsubdiff
box values 0 84 98 98
paint hvnsubdiff
box values 84 0 98 84
paint hvnsubdiff
box values 130 0 144 130
paint hvnsubdiff
box values 0 98 130 130
paint hvnsubdiffcont
box values 98 0 130 98
paint hvnsubdiffcont
box values 224 304 304 444
paint poly
box values 200 294 444 304
paint poly
box values 200 234 234 294
paint poly
box values 294 234 444 294
paint poly
box values 200 224 444 234
paint poly
box values 224 200 304 224
paint poly
box values 234 234 294 294
paint polycont
box values 0 430 216 438
paint metal1
box values 144 398 216 430
paint metal1
box values 0 380 216 398
paint metal1
box values 0 358 148 380
paint metal1
box values 144 326 148 358
paint metal1
box values 0 312 148 326
paint metal1
box values 148 312 216 380
splitpaint nw metal1
box values 224 304 238 318
splitpaint se metal1
box values 238 304 290 318
paint metal1
box values 290 304 304 318
splitpaint sw metal1
box values 210 290 224 304
splitpaint se metal1
box values 224 294 304 304
paint metal1
box values 224 290 234 294
paint metal1
box values 210 238 234 290
paint metal1
box values 210 216 232 238
splitpaint ne metal1
box values 232 234 234 238
paint metal1
box values 294 290 304 294
paint metal1
box values 304 290 318 304
splitpaint sw metal1
box values 294 238 318 290
paint metal1
box values 294 234 296 238
paint metal1
box values 232 216 296 234
paint metal1
box values 296 216 318 238
splitpaint nw metal1
box values 0 202 148 216
paint metal1
box values 144 170 148 202
paint metal1
box values 0 148 148 170
paint metal1
box values 148 148 216 216
splitpaint sw metal1
box values 232 210 238 216
splitpaint ne metal1
box values 238 210 290 216
paint metal1
box values 290 210 296 216
splitpaint nw metal1
box values 0 144 216 148
paint metal1
box values 0 130 170 144
paint metal1
box values 0 90 98 98
paint metal1
box values 90 0 98 90
paint metal1
box values 130 0 170 130
paint metal1
box values 202 0 216 144
paint metal1
box values 312 148 380 216
splitpaint se metal1
box values 380 148 438 216
paint metal1
box values 312 144 438 148
paint metal1
box values 312 0 326 144
paint metal1
box values 358 0 398 144
paint metal1
box values 430 0 438 144
paint metal1
select clear
view
tech revert
units {*}$curunits
resumeall
