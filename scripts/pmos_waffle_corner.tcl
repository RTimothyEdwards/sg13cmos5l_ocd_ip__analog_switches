# Command script for generating cell pmos_waffle_corner

suspendall
tech unlock *
set curunits [units]
units internal
load pmos_waffle_corner -silent
box values 0 0 0 0
box values -1616 2888 2422 3124
paint checkpaint
box values -1616 2634 2540 2888
paint checkpaint
box values -1634 2540 2540 2634
paint checkpaint
box values -1634 2422 2888 2540
paint checkpaint
box values -1634 2180 3124 2422
paint checkpaint
box values -2000 -1616 3124 2180
paint checkpaint
box values -2000 -1634 2634 -1616
paint checkpaint
box values -2000 -2000 2180 -1634
paint checkpaint
box values 0 0 876 876
paint nwell
box values 0 460 436 540
paint hvpmos
box values 460 0 540 436
paint hvpmos
box values 0 594 436 620
paint hvpdiff
box values 380 562 436 594
paint hvpdiff
box values 0 540 436 562
paint hvpdiff
box values 0 438 436 460
paint hvpdiff
box values 380 436 436 438
paint hvpdiff
box values 380 406 460 436
paint hvpdiff
box values 0 380 460 406
paint hvpdiff
box values 0 366 406 380
paint hvpdiff
box values 0 320 334 334
paint hvpdiff
box values 320 0 334 320
paint hvpdiff
box values 366 0 406 366
paint hvpdiff
box values 438 0 460 380
paint hvpdiff
box values 540 380 620 436
paint hvpdiff
box values 540 0 562 380
paint hvpdiff
box values 594 0 620 380
paint hvpdiff
box values 0 562 380 594
paint hvpdiffc
box values 0 406 380 438
paint hvpdiffc
box values 0 334 366 366
paint hvpdiffc
box values 334 0 366 334
paint hvpdiffc
box values 406 0 438 380
paint hvpdiffc
box values 562 0 594 380
paint hvpdiffc
box values 0 1102 1124 1124
paint hvpsubdiff
box values 0 1000 1022 1022
paint hvpsubdiff
box values 1000 0 1022 1000
paint hvpsubdiff
box values 1102 0 1124 1102
paint hvpsubdiff
box values 0 666 436 680
paint hvnsubdiff
box values 380 634 436 666
paint hvnsubdiff
box values 0 620 436 634
paint hvnsubdiff
box values 620 380 680 436
paint hvnsubdiff
box values 620 0 634 380
paint hvnsubdiff
box values 666 0 680 380
paint hvnsubdiff
box values 0 1022 1102 1102
paint hvpsubdiffcont
box values 1022 0 1102 1022
paint hvpsubdiffcont
box values 0 634 380 666
paint hvnsubdiffcont
box values 634 0 666 380
paint hvnsubdiffcont
box values 0 864 512 888
paint poly
box values 422 860 512 864
paint poly
box values 512 860 540 888
splitpaint sw poly
box values 422 832 540 860
paint poly
box values 0 808 540 832
paint poly
box values 460 540 540 808
paint poly
box values 436 530 860 540
paint poly
box values 436 470 470 530
paint poly
box values 530 512 860 530
paint poly
box values 860 512 888 540
splitpaint sw poly
box values 530 470 888 512
paint poly
box values 436 460 888 470
paint poly
box values 460 436 540 460
paint poly
box values 808 422 888 460
paint poly
box values 808 0 832 422
paint poly
box values 864 0 888 422
paint poly
box values 0 832 422 864
paint polycont
box values 470 470 530 530
paint polycont
box values 832 0 864 422
paint polycont
box values 0 1102 1124 1124
paint metal1
box values 0 1000 1022 1022
paint metal1
box values 0 876 878 878
paint metal1
box values 0 864 472 876
paint metal1
box values 422 832 472 864
paint metal1
box values 0 820 472 832
paint metal1
box values 528 820 878 876
paint metal1
box values 0 818 878 820
paint metal1
box values 0 716 452 726
paint metal1
box values 406 676 452 716
paint metal1
box values 0 666 452 676
paint metal1
box values 380 634 452 666
paint metal1
box values 334 616 452 634
paint metal1
box values 334 594 384 616
paint metal1
box values 380 562 384 594
paint metal1
box values 0 548 384 562
paint metal1
box values 384 548 452 616
splitpaint nw metal1
box values 460 540 474 554
splitpaint se metal1
box values 474 540 526 554
paint metal1
box values 526 540 540 554
splitpaint sw metal1
box values 446 526 460 540
splitpaint se metal1
box values 460 530 540 540
paint metal1
box values 460 526 470 530
paint metal1
box values 446 474 470 526
paint metal1
box values 446 452 468 474
splitpaint ne metal1
box values 468 470 470 474
paint metal1
box values 530 526 540 530
paint metal1
box values 540 526 554 540
splitpaint sw metal1
box values 530 474 554 526
paint metal1
box values 530 470 532 474
paint metal1
box values 468 452 532 470
paint metal1
box values 532 452 554 474
splitpaint nw metal1
box values 818 528 878 818
paint metal1
box values 818 472 820 528
paint metal1
box values 876 472 878 528
paint metal1
box values 0 438 384 452
paint metal1
box values 380 406 384 438
paint metal1
box values 334 384 384 406
paint metal1
box values 384 384 452 452
splitpaint sw metal1
box values 468 446 474 452
splitpaint ne metal1
box values 474 446 526 452
paint metal1
box values 526 446 532 452
splitpaint nw metal1
box values 334 380 452 384
paint metal1
box values 334 366 406 380
paint metal1
box values 366 334 406 366
paint metal1
box values 0 324 334 334
paint metal1
box values 0 274 284 284
paint metal1
box values 274 0 284 274
paint metal1
box values 324 0 334 324
paint metal1
box values 438 0 452 380
paint metal1
box values 548 384 616 452
splitpaint se metal1
box values 616 406 726 452
paint metal1
box values 616 384 676 406
paint metal1
box values 548 380 676 384
paint metal1
box values 548 0 562 380
paint metal1
box values 594 334 634 380
paint metal1
box values 666 0 676 380
paint metal1
box values 716 0 726 406
paint metal1
box values 818 422 878 472
paint metal1
box values 818 0 832 422
paint metal1
box values 864 0 878 422
paint metal1
box values 1000 0 1022 1000
paint metal1
box values 1102 0 1124 1102
paint metal1
box values 472 820 528 876
paint via1
box values 0 676 406 716
paint via1
box values 0 594 334 634
paint via1
box values 470 470 530 530
paint pc+v
box values 820 472 876 528
paint via1
box values 0 366 334 406
paint via1
box values 0 284 324 324
paint via1
box values 284 0 324 284
paint via1
box values 366 0 406 334
paint via1
box values 594 0 634 334
paint via1
box values 676 0 716 406
paint via1
box values 0 1104 384 1124
paint metal2
box values 180 1086 384 1104
paint metal2
box values 384 1086 422 1124
splitpaint sw metal2
box values 180 820 422 1086
paint metal2
box values 0 716 422 820
paint metal2
box values 406 676 422 716
paint metal2
box values 0 634 422 676
paint metal2
box values 334 594 366 634
paint metal2
box values 0 578 366 594
paint metal2
box values 366 578 422 634
splitpaint nw metal2
box values 470 876 530 888
paint metal2
box values 470 820 472 876
paint metal2
box values 528 820 530 876
paint metal2
box values 470 530 530 820
paint metal2
box values 0 470 470 530
paint metal2
box values 530 528 888 530
paint metal2
box values 530 472 820 528
paint metal2
box values 876 472 888 528
paint metal2
box values 530 470 888 472
paint metal2
box values 0 406 366 422
paint metal2
box values 334 366 366 406
paint metal2
box values 366 366 422 422
splitpaint sw metal2
box values 0 334 422 366
paint metal2
box values 0 324 366 334
paint metal2
box values 0 180 284 284
paint metal2
box values 180 0 284 180
paint metal2
box values 324 0 366 324
paint metal2
box values 406 0 422 334
paint metal2
box values 470 0 530 470
paint metal2
box values 578 366 634 422
splitpaint se metal2
box values 634 406 1086 422
paint metal2
box values 634 366 676 406
paint metal2
box values 578 334 676 366
paint metal2
box values 578 0 594 334
paint metal2
box values 634 0 676 334
paint metal2
box values 716 384 1086 406
paint metal2
box values 1086 384 1124 422
splitpaint sw metal2
box values 716 180 1124 384
paint metal2
box values 716 0 820 180
paint metal2
box values 1104 0 1124 180
paint metal2
box values 0 820 180 1104
paint via2
box values 0 0 180 180
paint via2
box values 820 0 1104 180
paint via2
box values 0 860 140 1084
paint v2+v3
box values 0 0 140 140
paint v2+v3
box values 860 0 1084 140
paint v2+v3
box values 0 938 62 1062
paint v3+v4
box values 0 0 62 62
paint v3+v4
box values 938 0 1062 62
paint v3+v4
select clear
view
tech revert
units {*}$curunits
resumeall
