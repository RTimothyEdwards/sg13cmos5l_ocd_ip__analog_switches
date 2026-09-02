v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {Power switch with waffle pFET power transistor (low voltage)} 940 -1010 0 0 0.4 0.4 {}
T {Switch is around 0.75 ohms at nominal conditions.} 940 -980 0 0 0.4 0.4 {}
N 1630 -840 1630 -720 { lab=DVDD_OUT}
N 1630 -920 1630 -900 { lab=DVDD_IN}
N 1630 -870 1650 -870 { lab=DVDD_IN}
N 1650 -920 1650 -870 { lab=DVDD_IN}
N 1060 -830 1080 -830 {
lab=DVDD_IN}
N 1010 -810 1080 -810 {
lab=DVSS}
N 1380 -870 1590 -870 {
lab=P_DRIVE}
N 1630 -920 1650 -920 {
lab=DVDD_IN}
N 1060 -920 1630 -920 {lab=DVDD_IN}
N 1020 -870 1080 -870 {lab=enable}
N 1060 -920 1060 -830 {lab=DVDD_IN}
C {devices/ipin.sym} 1020 -870 0 0 {name=p5 lab=enable}
C {devices/ipin.sym} 1060 -920 0 0 {name=p1 lab=DVDD_IN}
C {devices/lab_wire.sym} 1400 -870 0 1 {name=l30 sig_type=std_logic lab=P_DRIVE}
C {devices/ipin.sym} 1010 -810 0 0 {name=p2 lab=DVSS}
C {opin.sym} 1630 -720 0 0 {name=p8 lab=DVDD_OUT}
C {gate_drive_1v2.sym} 1230 -830 0 0 {name=x2}
C {sg13cmos5l_pr/sg13_lv_pmos.sym} 1610 -870 0 0 {name=M1
l=0.13u
w=5u
ng=1
m=500
model=sg13_lv_pmos
spiceprefix=X
}
