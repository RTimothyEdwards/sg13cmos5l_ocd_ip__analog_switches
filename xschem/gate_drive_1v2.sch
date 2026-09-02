v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {(effectively inv_32, or two inv_16 in parallel)} 760 -630 0 0 0.3 0.3 {}
T {Gate driver for 1.2V power pFET switch} 200 -1010 0 0 0.3 0.3 {}
N 230 -780 260 -780 {lab=in}
N 480 -780 550 -780 {lab=#net1}
N 630 -780 710 -780 {lab=#net2}
N 340 -780 400 -780 {lab=#net3}
N 790 -780 870 -780 {lab=#net4}
N 120 -910 170 -910 {lab=dvdd}
N 120 -880 170 -880 {lab=dvss}
N 230 -780 230 -700 {lab=in}
N 220 -780 230 -780 {lab=in}
N 230 -700 270 -700 {lab=in}
N 950 -780 950 -740 {lab=out}
N 950 -680 950 -660 {lab=dvss}
N 910 -660 950 -660 {lab=dvss}
N 950 -900 950 -870 {lab=dvdd}
N 910 -900 950 -900 {lab=dvdd}
N 950 -840 1020 -840 {lab=dvdd}
N 1020 -900 1020 -840 {lab=dvdd}
N 950 -900 1020 -900 {lab=dvdd}
N 950 -710 1040 -710 {lab=dvss}
N 1040 -710 1040 -660 {lab=dvss}
N 950 -660 1040 -660 {lab=dvss}
N 950 -780 1050 -780 {lab=out}
N 950 -810 950 -780 {lab=out}
N 870 -840 910 -840 {lab=#net4}
N 870 -780 870 -710 {lab=#net4}
N 870 -840 870 -780 {lab=#net4}
N 870 -710 910 -710 {lab=#net4}
C {devices/opin.sym} 1050 -780 0 0 {name=p4 lab=out}
C {sg13cmos5l_stdcells/sg13cmos5l_inv_2.sym} 440 -780 0 0 {name=x2 VDD=dvdd VSS=dvss prefix=sg13cmos5l_ }
C {sg13cmos5l_stdcells/sg13cmos5l_inv_8.sym} 590 -780 0 0 {name=x3 VDD=dvdd VSS=dvss prefix=sg13cmos5l_ }
C {sg13cmos5l_stdcells/sg13cmos5l_inv_16.sym} 750 -780 0 0 {name=x4 VDD=dvdd VSS=dvss prefix=sg13cmos5l_ }
C {ipin.sym} 220 -780 0 0 {name=p1 lab=in}
C {iopin.sym} 120 -910 0 1 {name=p3 lab=dvdd}
C {iopin.sym} 120 -880 0 1 {name=p5 lab=dvss}
C {sg13cmos5l_stdcells/sg13cmos5l_inv_1.sym} 300 -780 0 0 {name=x6 VDD=dvdd VSS=dvss prefix=sg13cmos5l_ }
C {lab_pin.sym} 170 -910 0 1 {name=p6 sig_type=std_logic lab=dvdd}
C {lab_pin.sym} 170 -880 0 1 {name=p7 sig_type=std_logic lab=dvss}
C {sg13cmos5l_stdcells/sg13cmos5l_antennanp.sym} 360 -700 0 0 {name=x7 VDD=dvdd VSS=dvss prefix=sg13cmos5l_ }
C {sg13cmos5l_stdcells/sg13cmos5l_decap_4.sym} 360 -640 0 0 {name=x8[1:0] VDD=dvdd VSS=dvss prefix=sg13cmos5l_ }
C {sg13cmos5l_pr/sg13_lv_nmos.sym} 930 -710 0 0 {name=M1
l=0.13u
w=26.64u
ng=36
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_lv_pmos.sym} 930 -840 0 0 {name=M2
l=0.13u
w=40.32u
ng=36
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 910 -660 0 0 {name=p2 sig_type=std_logic lab=dvss}
C {lab_pin.sym} 910 -900 0 0 {name=p8 sig_type=std_logic lab=dvdd}
