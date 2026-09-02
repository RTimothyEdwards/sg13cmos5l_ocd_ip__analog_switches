v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -110 20 -80 20 {lab=#net1}
N -220 20 -170 20 {lab=vout}
N -220 80 -220 110 {lab=GND}
N -400 -60 -80 -60 {lab=vin}
N -400 -60 -400 20 {lab=vin}
N -270 110 -220 110 {lab=GND}
N -400 80 -400 110 {lab=GND}
N -400 110 -270 110 {lab=GND}
N -270 -20 -80 -20 {lab=GND}
N -270 -20 -270 110 {lab=GND}
N -450 80 -450 110 {lab=GND}
N -450 110 -400 110 {lab=GND}
N -450 -80 -80 -80 {lab=#net2}
N -450 -80 -450 20 {lab=#net2}
C {ammeter.sym} -140 20 1 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {res.sym} -220 50 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {gnd.sym} -220 110 0 0 {name=l1 lab=GND}
C {vsource.sym} -400 50 0 0 {name=V2 value=1.2 savecurrent=false}
C {code_shown.sym} -390 190 0 0 {name=s1 only_toplevel=false value=".option savecurrents
.control
save all
tran 1n 2u
* Switch resistance
plot (V(vin) - V(vout)) / I(Vmeas)
.endc"}
C {code_shown.sym} -390 370 0 0 {name=s2 only_toplevel=false value=".lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerMOShv.lib mos_tt
.lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerMOSlv.lib mos_tt
.lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerDIO.lib dio_tt
.lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerRES.lib res_typ

.include $PDK_ROOT/ihp-sg13cmos5l/libs.ref/sg13cmos5l_stdcell/spice/sg13cmos5l_stdcell.spice"}
C {lab_wire.sym} -210 20 0 0 {name=p1 sig_type=std_logic lab=vout}
C {lab_wire.sym} -360 -60 0 0 {name=p2 sig_type=std_logic lab=vin}
C {vsource.sym} -450 50 0 1 {name=V3 value="PWL(0 0 200n 0 400n 1.2)" savecurrent=false}
C {power_stage1v2.sym} 70 -30 0 0 {name=x2}
