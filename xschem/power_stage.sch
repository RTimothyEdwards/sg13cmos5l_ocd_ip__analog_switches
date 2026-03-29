v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {48x48 grid} 1760 -880 0 0 0.4 0.4 {}
T {Power switch with waffle pFET power transistor} 930 -1120 0 0 0.4 0.4 {}
N 1630 -840 1630 -720 { lab=#net1}
N 1630 -920 1630 -900 { lab=IOVDD_IN}
N 1630 -870 1650 -870 { lab=IOVDD_IN}
N 1650 -920 1650 -870 { lab=IOVDD_IN}
N 1650 -920 1870 -920 {
lab=IOVDD_IN}
N 1060 -830 1080 -830 {
lab=IOVDD_IN}
N 1010 -810 1080 -810 {
lab=IOVSS}
N 430 -1040 480 -1040 {
lab=enable}
N 480 -1040 480 -1010 {
lab=enable}
N 480 -1010 730 -1010 {
lab=enable}
N 820 -1010 840 -1010 {
lab=#net2}
N 820 -1010 820 -870 {
lab=#net2}
N 820 -870 1080 -870 {
lab=#net2}
N 940 -1010 940 -850 {
lab=#net3}
N 1380 -870 1590 -870 {
lab=P_DRIVE}
N 1630 -920 1650 -920 {
lab=IOVDD_IN}
N 810 -1010 820 -1010 {
lab=#net2}
N 1060 -920 1630 -920 {lab=IOVDD_IN}
N 920 -1010 940 -1010 {
lab=#net3}
N 940 -850 1080 -850 {lab=#net3}
N 1060 -920 1060 -830 {lab=IOVDD_IN}
N 1010 -710 1050 -710 {lab=DVSS}
N 1010 -740 1050 -740 {lab=DVDD}
C {devices/ipin.sym} 430 -1040 0 0 {name=p5 lab=enable}
C {devices/ipin.sym} 1060 -920 0 0 {name=p1 lab=IOVDD_IN}
C {devices/ipin.sym} 1010 -710 0 0 {name=p3 lab=DVSS}
C {sg13cmos5l_pr/sg13_hv_pmos.sym} 1610 -870 0 0 {name=M14
l=0.4u
w=4.36u
ng=1
m=760
model=sg13_hv_pmos
spiceprefix=X
}
C {devices/lab_wire.sym} 1800 -920 0 0 {name=l10 sig_type=std_logic lab=IOVDD_IN}
C {gate_drive.sym} 1230 -830 0 0 {name=x2}
C {devices/lab_wire.sym} 1400 -870 0 1 {name=l30 sig_type=std_logic lab=P_DRIVE}
C {sg13cmos5l_stdcells/sg13cmos5l_inv_4.sym} 770 -1010 0 0 {name=x1 VDD=DVDD VSS=DVSS prefix=sg13cmos5l_ }
C {sg13cmos5l_stdcells/sg13cmos5l_inv_4.sym} 880 -1010 0 0 {name=x3 VDD=DVDD VSS=DVSS prefix=sg13cmos5l_ }
C {sg13cmos5l_stdcells/sg13cmos5l_decap_4.sym} 570 -900 0 0 {name=x4[1:0] VDD=DVDD VSS=DVSS prefix=sg13cmos5l_ }
C {sg13cmos5l_stdcells/sg13cmos5l_antennanp.sym} 570 -1040 0 0 {name=x9 VDD=DVDD VSS=DVSS prefix=sg13cmos5l_ }
C {devices/ipin.sym} 1010 -740 0 0 {name=p4 lab=DVDD}
C {devices/ipin.sym} 1010 -810 0 0 {name=p2 lab=IOVSS}
C {lab_pin.sym} 1050 -740 0 1 {name=p6 sig_type=std_logic lab=DVDD}
C {lab_pin.sym} 1050 -710 0 1 {name=p7 sig_type=std_logic lab=DVSS}
C {opin.sym} 1630 -720 0 0 {name=p8 lab=IOVDD_OUT}
