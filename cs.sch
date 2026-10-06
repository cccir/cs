v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -310 -20 -310 -0 {lab=VDD}
N -310 60 -310 80 {lab=0}
N -240 60 -240 80 {lab=0}
N -240 -30 -240 -0 {lab=Vin}
N -170 60 -170 80 {lab=0}
N -170 -30 -170 -0 {lab=Vout}
N 10 -170 10 -150 {lab=VDD}
N 10 -90 10 -60 {lab=Vout}
N -70 -30 -30 -30 {lab=Vin}
N 10 -80 50 -80 {lab=Vout}
N 10 -0 10 20 {lab=0}
N 10 -30 90 -30 {lab=0}
N 90 -30 90 10 {lab=0}
N 10 10 90 10 {lab=0}
C {sky130_fd_pr/nfet_01v8_lvt.sym} -10 -30 0 0 {name=M1
W=W
L=L
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {res.sym} 10 -120 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} -70 -30 0 0 {name=p1 sig_type=std_logic lab=Vin}
C {vsource.sym} -310 30 0 0 {name=VDD value=1.8 savecurrent=false}
C {vsource.sym} -240 30 0 0 {name=Vin value="DC Vib AC 1" savecurrent=false}
C {gnd.sym} -310 80 0 0 {name=l3 lab=0}
C {gnd.sym} -240 80 0 0 {name=l4 lab=0}
C {vdd.sym} -310 -20 0 0 {name=l5 lab=VDD}
C {lab_pin.sym} -240 -30 1 0 {name=p2 sig_type=std_logic lab=Vin}
C {capa.sym} -170 30 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -170 80 0 0 {name=l6 lab=0}
C {lab_pin.sym} 50 -80 2 0 {name=p3 sig_type=std_logic lab=Vout}
C {lab_pin.sym} -170 -30 1 0 {name=p4 sig_type=std_logic lab=Vout}
C {code_shown.sym} -370 -180 0 0 {name=param only_toplevel=false value=".param L=0.15
.param W=15
.param Vib=1.0"}
C {code_shown.sym} -460 120 0 0 {name=measure only_toplevel=false value=".measure dc gm find @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gm] at=Vib
.measure dc gds find @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gds] at=Vib
.measure ac gain find Vdb(vout) at=1e6
.measure ac ugf when Vdb(vout)=0"
}
C {code_shown.sym} 160 -190 0 0 {name=spice only_toplevel=false value=".option savecurrent
.control
save all
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gds]

* DC analysis (I/O curve)
dc vin 0 1.8 0.01
plot vout

* AC analysis
set units=degree
ac dec 20 1e6 1e10
plot vdb(vout)
plot vp(vout)
.endc"}
C {sky130_fd_pr/corner.sym} -200 -200 0 0 {name=CORNER only_toplevel=true corner=tt}
C {vdd.sym} 10 -170 0 0 {name=l7 lab=VDD}
C {gnd.sym} 10 20 0 0 {name=l1 lab=0}
