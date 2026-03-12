# Command script for generating cell pmos_waffle_junction

suspendall
tech unlock *
set curunits [units]
units internal
load pmos_waffle_junction -silent
box values 0 0 0 0
box values -1634 -1634 2634 2634
paint checkpaint
box values 0 0 1000 1000
paint nwell
box values 460 564 540 1000
paint hvpmos
box values 0 460 436 540
paint hvpmos
box values 564 460 1000 540
paint hvpmos
box values 460 0 540 436
paint hvpmos
box values 380 620 406 1000
paint hvpdiff
box values 438 620 460 1000
paint hvpdiff
box values 0 594 460 620
paint hvpdiff
box values 380 564 460 594
paint hvpdiff
box values 540 620 562 1000
paint hvpdiff
box values 594 634 634 1000
paint hvpdiff
box values 666 680 680 1000
paint hvpdiff
box values 666 666 1000 680
paint hvpdiff
box values 594 620 1000 634
paint hvpdiff
box values 540 594 1000 620
paint hvpdiff
box values 540 564 620 594
paint hvpdiff
box values 380 562 436 564
paint hvpdiff
box values 0 540 436 562
paint hvpdiff
box values 564 562 620 564
paint hvpdiff
box values 564 540 1000 562
paint hvpdiff
box values 0 438 436 460
paint hvpdiff
box values 380 436 436 438
paint hvpdiff
box values 564 438 1000 460
paint hvpdiff
box values 564 436 620 438
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
box values 540 406 620 436
paint hvpdiff
box values 540 380 1000 406
paint hvpdiff
box values 540 0 562 380
paint hvpdiff
box values 594 0 620 380
paint hvpdiff
box values 406 620 438 1000
paint hvpdiffc
box values 0 562 380 594
paint hvpdiffc
box values 562 620 594 1000
paint hvpdiffc
box values 634 666 666 1000
paint hvpdiffc
box values 634 634 1000 666
paint hvpdiffc
box values 620 562 1000 594
paint hvpdiffc
box values 0 406 380 438
paint hvpdiffc
box values 0 334 366 366
paint hvpdiffc
box values 334 0 366 334
paint hvpdiffc
box values 406 0 438 380
paint hvpdiffc
box values 620 406 1000 438
paint hvpdiffc
box values 562 0 594 380
paint hvpdiffc
box values 320 680 334 1000
paint hvnsubdiff
box values 0 666 334 680
paint hvnsubdiff
box values 366 634 380 1000
paint hvnsubdiff
box values 0 620 380 634
paint hvnsubdiff
box values 620 366 1000 380
paint hvnsubdiff
box values 620 0 634 366
paint hvnsubdiff
box values 666 320 1000 334
paint hvnsubdiff
box values 666 0 680 320
paint hvnsubdiff
box values 334 666 366 1000
paint hvnsubdiffcont
box values 0 634 366 666
paint hvnsubdiffcont
box values 634 334 1000 366
paint hvnsubdiffcont
box values 634 0 666 334
paint hvnsubdiffcont
box values 460 540 540 564
paint poly
box values 436 530 564 540
paint poly
box values 436 470 470 530
paint poly
box values 530 470 564 530
paint poly
box values 436 460 564 470
paint poly
box values 460 436 540 460
paint poly
box values 470 470 530 530
paint polycont
box values 274 726 284 1000
paint metal1
box values 0 716 284 726
paint metal1
box values 324 676 334 1000
paint metal1
box values 0 666 334 676
paint metal1
box values 366 634 406 666
paint metal1
box values 334 620 406 634
paint metal1
box values 438 620 452 1000
paint metal1
box values 334 616 452 620
paint metal1
box values 334 594 384 616
paint metal1
box values 380 562 384 594
paint metal1
box values 0 548 384 562
paint metal1
box values 384 548 452 616
splitpaint nw metal1
box values 548 620 562 1000
paint metal1
box values 666 676 676 1000
paint metal1
box values 716 726 726 1000
paint metal1
box values 716 716 1000 726
paint metal1
box values 666 666 1000 676
paint metal1
box values 594 634 634 666
paint metal1
box values 594 620 666 634
paint metal1
box values 548 616 666 620
paint metal1
box values 460 540 474 554
splitpaint se metal1
box values 474 540 526 554
paint metal1
box values 526 540 540 554
splitpaint sw metal1
box values 548 548 616 616
splitpaint ne metal1
box values 616 594 666 616
paint metal1
box values 616 562 620 594
paint metal1
box values 616 548 1000 562
paint metal1
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
box values 616 438 1000 452
paint metal1
box values 616 406 620 438
paint metal1
box values 616 384 666 406
paint metal1
box values 548 380 666 384
paint metal1
box values 548 0 562 380
paint metal1
box values 594 366 666 380
paint metal1
box values 594 334 634 366
paint metal1
box values 666 324 1000 334
paint metal1
box values 666 0 676 324
paint metal1
box values 716 274 1000 284
paint metal1
box values 716 0 726 274
paint metal1
box values 284 716 324 1000
paint via1
box values 0 676 324 716
paint via1
box values 366 666 406 1000
paint via1
box values 0 594 334 634
paint via1
box values 594 666 634 1000
paint via1
box values 676 716 716 1000
paint via1
box values 676 676 1000 716
paint via1
box values 666 594 1000 634
paint via1
box values 470 470 530 530
paint pc+v
box values 0 366 334 406
paint via1
box values 0 284 324 324
paint via1
box values 284 0 324 284
paint via1
box values 366 0 406 334
paint via1
box values 666 366 1000 406
paint via1
box values 594 0 634 334
paint via1
box values 676 284 1000 324
paint via1
box values 676 0 716 284
paint via1
box values 180 820 284 1000
paint metal2
box values 0 716 284 820
paint metal2
box values 324 676 366 1000
paint metal2
box values 0 666 366 676
paint metal2
box values 406 666 422 1000
paint metal2
box values 0 634 422 666
paint metal2
box values 334 594 366 634
paint metal2
box values 0 578 366 594
paint metal2
box values 366 578 422 634
splitpaint nw metal2
box values 470 530 530 1000
paint metal2
box values 578 666 594 1000
paint metal2
box values 634 676 676 1000
paint metal2
box values 716 820 820 1000
paint metal2
box values 716 716 1000 820
paint metal2
box values 634 666 1000 676
paint metal2
box values 578 634 1000 666
paint metal2
box values 578 578 634 634
splitpaint ne metal2
box values 634 594 666 634
paint metal2
box values 634 578 1000 594
paint metal2
box values 0 470 470 530
paint metal2
box values 530 470 1000 530
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
box values 634 406 1000 422
paint metal2
box values 634 366 666 406
paint metal2
box values 578 334 1000 366
paint metal2
box values 578 0 594 334
paint metal2
box values 634 324 1000 334
paint metal2
box values 634 0 676 324
paint metal2
box values 716 180 1000 284
paint metal2
box values 716 0 820 180
paint metal2
box values 0 820 180 1000
paint via2
box values 820 820 1000 1000
paint via2
box values 0 0 180 180
paint via2
box values 820 0 1000 180
paint via2
box values 0 860 140 1000
paint v2+v3
box values 860 860 1000 1000
paint v2+v3
box values 0 0 140 140
paint v2+v3
box values 860 0 1000 140
paint v2+v3
box values 0 938 62 1000
paint v3+v4
box values 938 938 1000 1000
paint v3+v4
box values 0 0 62 62
paint v3+v4
box values 938 0 1000 62
paint v3+v4
select clear
view
tech revert
units {*}$curunits
resumeall
