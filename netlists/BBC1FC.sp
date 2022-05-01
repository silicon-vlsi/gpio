* SPICE export by:      S-Edit 2020.3.3
* Export time:          Sun May  1 20:52:10 2022
* Design path:          /home/nfs1/projects/FEYNMAN/REV2/work/tt-srout/lib.defs
* Library:              IO_CELLS_FC5V
* Cell:                 BBC1FC
* Testbench:            Spice
* View:                 cmos_sch
* Export as:            top-level cell
* Export mode:          hierarchical
* Exclude empty:        yes
* Exclude .model:       no
* Exclude .hdl:         no
* Exclude .end:         no
* Expand paths:         yes
* Wrap lines:           no
* Exclude simulator commands:  no
* Exclude global pins:         no
* Exclude instance locations:  no
* Control property name(s):    SPICE

********* Simulation Settings - General Section *********
*************** Subcircuits ***************
.subckt io_pe5_fc B D G S 
* PORT=D TYPE=InOut
* PORT=G TYPE=InOut
* PORT=B TYPE=InOut
* PORT=S TYPE=InOut

XMPX N_1 G S B pe5 w=3e-05 l=5.5e-07 as=1.44e-11 ad=1.44e-11 ps=6.096e-05 pd=6.096e-05 nrs=0.009 nrd=0.009 m=1 par1=1 xf_subext=0 $ $x=890 $y=740 $w=40 $h=60
XR0 N_1 D B rdp5 l=2.15e-06 w=3e-05 m=1 pm=63 par1=1 $ $x=915 $y=630 $w=30 $h=60
.ends

.subckt io_ne5_fc B D G S 
* PORT=B TYPE=InOut
* PORT=G TYPE=InOut
* PORT=S TYPE=InOut
* PORT=D TYPE=InOut

XMNX N_1 G S B ne5 w=3e-05 l=5.5e-07 as=1.44e-11 ad=1.44e-11 ps=6.096e-05 pd=6.096e-05 nrs=0.009 nrd=0.009 m=1 par1=1 xf_subext=0 $ $x=890 $y=790 $w=40 $h=60
XR0 D N_1 B rdn5 l=3.35e-06 w=3e-05 m=1 pm=63 par1=1 $ $x=915 $y=890 $w=30 $h=60
.ends

.subckt io_tsctrl_fc A EN GND GNDO NG PG VDD VDDO 
* PORT=EN TYPE=In
* PORT=A TYPE=In
* PORT=VDDO TYPE=In
* PORT=NG TYPE=Out
* PORT=PG TYPE=Out
* PORT=VDD TYPE=In
* PORT=GND TYPE=In
* PORT=GNDO TYPE=In

XM0 ENB EN VDD VDD pe5 w=2.1e-06 l=5e-07 as=1.008e-12 ad=1.008e-12 ps=5.16e-06 pd=5.16e-06 nrs=0.128571 nrd=0.128571 m=1 par1=1 xf_subext=0 $ $x=700 $y=1080 $w=40 $h=60
XM1 ENB EN GND GND ne5 w=9e-07 l=5e-07 as=4.32e-13 ad=4.32e-13 ps=2.76e-06 pd=2.76e-06 nrs=0.3 nrd=0.3 m=1 par1=1 xf_subext=0 $ $x=700 $y=890 $w=40 $h=60
XM2 PGB A VDD VDD pe5 w=1.12e-06 l=5e-07 as=5.376e-13 ad=5.376e-13 ps=3.2e-06 pd=3.2e-06 nrs=0.241071 nrd=0.241071 m=1 par1=1 xf_subext=0 $ $x=900 $y=1080 $w=40 $h=60
XM3 NGB A GND GND ne5 w=1.4e-06 l=5e-07 as=6.72e-13 ad=6.72e-13 ps=3.76e-06 pd=3.76e-06 nrs=0.192857 nrd=0.192857 m=1 par1=1 xf_subext=0 $ $x=900 $y=490 $w=40 $h=60
XM4 N_1 A VDD VDD pe5 w=1.6e-06 l=5e-07 as=7.68e-13 ad=7.68e-13 ps=4.16e-06 pd=4.16e-06 nrs=0.16875 nrd=0.16875 m=1 par1=1 xf_subext=0 $ $x=1040 $y=700 $w=40 $h=60
XM5 PGB ENB VDD VDD pe5 w=1.12e-06 l=5e-07 as=5.376e-13 ad=5.376e-13 ps=3.2e-06 pd=3.2e-06 nrs=0.241071 nrd=0.241071 m=1 par1=1 xf_subext=0 $ $x=1040 $y=1080 $w=40 $h=60
XM6 NGB EN N_1 VDD pe5 w=1.6e-06 l=5e-07 as=7.68e-13 ad=7.68e-13 ps=4.16e-06 pd=4.16e-06 nrs=0.16875 nrd=0.16875 m=1 par1=1 xf_subext=0 $ $x=1040 $y=610 $w=40 $h=60
XM7 N_2 A GND GND ne5 w=9.6e-07 l=5e-07 as=4.608e-13 ad=4.608e-13 ps=2.88e-06 pd=2.88e-06 nrs=0.28125 nrd=0.28125 m=1 par1=1 xf_subext=0 $ $x=1040 $y=890 $w=40 $h=60
XM8 PGB ENB N_2 GND ne5 w=9.6e-07 l=5e-07 as=4.608e-13 ad=4.608e-13 ps=2.88e-06 pd=2.88e-06 nrs=0.28125 nrd=0.28125 m=1 par1=1 xf_subext=0 $ $x=1040 $y=980 $w=40 $h=60
XM9 NGB EN GND GND ne5 w=1.4e-06 l=5e-07 as=6.72e-13 ad=6.72e-13 ps=3.76e-06 pd=3.76e-06 nrs=0.192857 nrd=0.192857 m=1 par1=1 xf_subext=0 $ $x=1040 $y=490 $w=40 $h=60
XM10 NG NGB VDD VDD pe5 w=1.24e-06 l=5e-07 as=4.65e-13 ad=3.348e-13 ps=2.61e-06 pd=1.78e-06 nrs=0.217742 nrd=0.217742 m=4 par1=4 xf_subext=0 $ $x=1310 $y=710 $w=40 $h=60
XM11 PG PGB VDD VDD pe5 w=4.96e-06 l=5e-07 as=2.3808e-12 ad=2.3808e-12 ps=1.088e-05 pd=1.088e-05 nrs=0.0544355 nrd=0.0544355 m=1 par1=1 xf_subext=0 $ $x=1310 $y=1080 $w=40 $h=60
XM12 PG PGB GND GND ne5 w=2.88e-06 l=5e-07 as=1.3824e-12 ad=1.3824e-12 ps=6.72e-06 pd=6.72e-06 nrs=0.09375 nrd=0.09375 m=1 par1=1 xf_subext=0 $ $x=1310 $y=890 $w=40 $h=60
XM13 NG NGB GND GND ne5 w=7.2e-07 l=5e-07 as=2.7e-13 ad=1.944e-13 ps=1.83e-06 pd=1.26e-06 nrs=0.375 nrd=0.375 m=4 par1=4 xf_subext=0 $ $x=1310 $y=490 $w=40 $h=60
.ends

.subckt io_ts1_fc A EN GND GNDO PAD VDD VDDO 
* PORT=A TYPE=In
* PORT=EN TYPE=In
* PORT=PAD TYPE=Out
* PORT=GND TYPE=In
* PORT=VDD TYPE=In
* PORT=GNDO TYPE=In
* PORT=VDDO TYPE=In

XI1 A EN GND GNDO ng pg VDD VDDO io_tsctrl_fc $ $x=335 $y=760 $w=150 $h=160
XM10 pg1 pg VDDO VDDO pe5 w=1e-05 l=5e-07 as=4.8e-12 ad=2.7e-12 ps=2.096e-05 pd=1.054e-05 nrs=0.027 nrd=0.027 m=2 par1=2 xf_subext=0 $ $x=710 $y=1050 $w=40 $h=60
XM11 pg1 pg GNDO GNDO ne5 w=8.6e-06 l=5e-07 as=4.128e-12 ad=4.128e-12 ps=1.816e-05 pd=1.816e-05 nrs=0.0313953 nrd=0.0313953 m=1 par1=1 xf_subext=0 $ $x=710 $y=950 $w=40 $h=60
XM20 ng1 ng VDDO VDDO pe5 w=6e-06 l=5e-07 as=2.88e-12 ad=2.88e-12 ps=1.296e-05 pd=1.296e-05 nrs=0.045 nrd=0.045 m=1 par1=1 xf_subext=0 $ $x=720 $y=550 $w=40 $h=60
XM21 ng1 ng GNDO GNDO ne5 w=1.1e-05 l=5e-07 as=5.28e-12 ad=5.28e-12 ps=2.296e-05 pd=2.296e-05 nrs=0.0245455 nrd=0.0245455 m=1 par1=1 xf_subext=0 $ $x=720 $y=450 $w=40 $h=60
XM25 ng3 N_1 GNDO GNDO ne5 w=2e-06 l=5e-07 as=9.6e-13 ad=9.6e-13 ps=4.96e-06 pd=4.96e-06 nrs=0.135 nrd=0.135 m=1 par1=1 xf_subext=0 $ $x=1360 $y=450 $w=40 $h=60
XMN1 GNDO PAD ng1 GNDO io_ne5_fc $ $x=840 $y=500 $w=40 $h=60
XMN3<1> GNDO PAD ng3 GNDO io_ne5_fc $ $x=1440 $y=500 $w=40 $h=60
XMN3<2> GNDO PAD ng3 GNDO io_ne5_fc $ $x=1440 $y=500 $w=40 $h=60
XMN3<3> GNDO PAD ng3 GNDO io_ne5_fc $ $x=1440 $y=500 $w=40 $h=60
XMN3<4> GNDO PAD ng3 GNDO io_ne5_fc $ $x=1440 $y=500 $w=40 $h=60
XMN3<5> GNDO PAD ng3 GNDO io_ne5_fc $ $x=1440 $y=500 $w=40 $h=60
XMN3<6> GNDO PAD ng3 GNDO io_ne5_fc $ $x=1440 $y=500 $w=40 $h=60
XMN3<7> GNDO PAD ng3 GNDO io_ne5_fc $ $x=1440 $y=500 $w=40 $h=60
XMN3<8> GNDO PAD ng3 GNDO io_ne5_fc $ $x=1440 $y=500 $w=40 $h=60
XMN3<9> GNDO PAD ng3 GNDO io_ne5_fc $ $x=1440 $y=500 $w=40 $h=60
XMN3<10> GNDO PAD ng3 GNDO io_ne5_fc $ $x=1440 $y=500 $w=40 $h=60
XMN3<11> GNDO PAD ng3 GNDO io_ne5_fc $ $x=1440 $y=500 $w=40 $h=60
XMN3<12> GNDO PAD ng3 GNDO io_ne5_fc $ $x=1440 $y=500 $w=40 $h=60
XMN3<13> GNDO PAD ng3 GNDO io_ne5_fc $ $x=1440 $y=500 $w=40 $h=60
XMN3<14> GNDO PAD ng3 GNDO io_ne5_fc $ $x=1440 $y=500 $w=40 $h=60
XMN3<15> GNDO PAD ng3 GNDO io_ne5_fc $ $x=1440 $y=500 $w=40 $h=60
XMP1<1> VDDO PAD pg1 VDDO io_pe5_fc $ $x=830 $y=1000 $w=40 $h=60
XMP1<2> VDDO PAD pg1 VDDO io_pe5_fc $ $x=830 $y=1000 $w=40 $h=60
XMP3<1> VDDO PAD pg3 VDDO io_pe5_fc $ $x=1430 $y=1000 $w=40 $h=60
XMP3<2> VDDO PAD pg3 VDDO io_pe5_fc $ $x=1430 $y=1000 $w=40 $h=60
XMP3<3> VDDO PAD pg3 VDDO io_pe5_fc $ $x=1430 $y=1000 $w=40 $h=60
XMP3<4> VDDO PAD pg3 VDDO io_pe5_fc $ $x=1430 $y=1000 $w=40 $h=60
XMP3<5> VDDO PAD pg3 VDDO io_pe5_fc $ $x=1430 $y=1000 $w=40 $h=60
XMP3<6> VDDO PAD pg3 VDDO io_pe5_fc $ $x=1430 $y=1000 $w=40 $h=60
XMP3<7> VDDO PAD pg3 VDDO io_pe5_fc $ $x=1430 $y=1000 $w=40 $h=60
XMP3<8> VDDO PAD pg3 VDDO io_pe5_fc $ $x=1430 $y=1000 $w=40 $h=60
XMP3<9> VDDO PAD pg3 VDDO io_pe5_fc $ $x=1430 $y=1000 $w=40 $h=60
XMP3<10> VDDO PAD pg3 VDDO io_pe5_fc $ $x=1430 $y=1000 $w=40 $h=60
XMP3<11> VDDO PAD pg3 VDDO io_pe5_fc $ $x=1430 $y=1000 $w=40 $h=60
XMP3<12> VDDO PAD pg3 VDDO io_pe5_fc $ $x=1430 $y=1000 $w=40 $h=60
XMP3<13> VDDO PAD pg3 VDDO io_pe5_fc $ $x=1430 $y=1000 $w=40 $h=60
XMP3<14> VDDO PAD pg3 VDDO io_pe5_fc $ $x=1430 $y=1000 $w=40 $h=60
XMP3<15> VDDO PAD pg3 VDDO io_pe5_fc $ $x=1430 $y=1000 $w=40 $h=60
XMP3<16> VDDO PAD pg3 VDDO io_pe5_fc $ $x=1430 $y=1000 $w=40 $h=60
XR1 VDDO pg3 rnp1 l=2.4e-06 w=2.4e-06 m=1 pm=5 par1=1 $ $x=1360 $y=1060 $w=20 $h=60
XR2 VDDO N_1 rpp1 l=3.75e-06 w=3e-06 m=1 pm=6 par1=1 $ $x=1320 $y=570 $w=20 $h=60
.ends

.subckt io_bufc_fc A GNDO GNDR VDDR Y 
* PORT=VDDR TYPE=In
* PORT=GNDR TYPE=In
* PORT=Y TYPE=Out
* PORT=A TYPE=In
* PORT=GNDO TYPE=In

XM0 Y A GNDR GNDR ne5 w=2e-06 l=5e-07 as=6.8e-13 ad=6.8e-13 ps=3.34667e-06 pd=3.34667e-06 nrs=0.135 nrd=0.135 m=3 par1=3 xf_subext=0 $ $x=940 $y=690 $w=40 $h=60
XM3 Y A VDDR VDDR pe5 w=1.82e-06 l=5e-07 as=5.6784e-13 ad=4.914e-13 ps=2.808e-06 pd=2.36e-06 nrs=0.148352 nrd=0.148352 m=10 par1=10 xf_subext=0 $ $x=940 $y=910 $w=40 $h=60
.ends

.subckt io_ndtr_fc GND PI PO VDD Y YN 
* PORT=Y TYPE=Out
* PORT=PO TYPE=Out
* PORT=VDD TYPE=In
* PORT=GND TYPE=In
* PORT=PI TYPE=In
* PORT=YN TYPE=In

XM0 N_2 YN GND GND ne5 w=1.4e-06 l=5e-07 as=6.72e-13 ad=6.72e-13 ps=3.76e-06 pd=3.76e-06 nrs=0.192857 nrd=0.192857 m=1 par1=1 xf_subext=0 $ $x=580 $y=680 $w=40 $h=60
XM11 N_2 YN VDD VDD pe5 w=2.8e-06 l=5e-07 as=1.344e-12 ad=1.344e-12 ps=6.56e-06 pd=6.56e-06 nrs=0.0964286 nrd=0.0964286 m=1 par1=1 xf_subext=0 $ $x=580 $y=870 $w=40 $h=60
XM12 N_1 N_2 VDD VDD pe5 w=2.8e-06 l=5e-07 as=1.344e-12 ad=7.56e-13 ps=6.56e-06 pd=3.34e-06 nrs=0.0964286 nrd=0.0964286 m=2 par1=2 xf_subext=0 $ $x=730 $y=870 $w=40 $h=60
XM13 N_1 N_2 GND GND ne5 w=1.4e-06 l=5e-07 as=6.72e-13 ad=3.78e-13 ps=3.76e-06 pd=1.94e-06 nrs=0.192857 nrd=0.192857 m=2 par1=2 xf_subext=0 $ $x=730 $y=680 $w=40 $h=60
XM14 Y N_1 VDD VDD pe5 w=2.8e-06 l=5e-07 as=8.736e-13 ad=8.736e-13 ps=3.984e-06 pd=3.984e-06 nrs=0.0964286 nrd=0.0964286 m=5 par1=5 xf_subext=0 $ $x=880 $y=870 $w=40 $h=60
XM15 Y N_1 GND GND ne5 w=1.4e-06 l=5e-07 as=5.25e-13 ad=3.78e-13 ps=2.85e-06 pd=1.94e-06 nrs=0.192857 nrd=0.192857 m=4 par1=4 xf_subext=0 $ $x=880 $y=680 $w=40 $h=60
XM16 PO PI VDD VDD pe5 w=1.12e-06 l=5e-07 as=5.376e-13 ad=3.024e-13 ps=3.2e-06 pd=1.66e-06 nrs=0.241071 nrd=0.241071 m=2 par1=2 xf_subext=0 $ $x=1170 $y=890 $w=40 $h=60
XM17 PO N_2 VDD VDD pe5 w=1.12e-06 l=5e-07 as=5.376e-13 ad=3.024e-13 ps=3.2e-06 pd=1.66e-06 nrs=0.241071 nrd=0.241071 m=2 par1=2 xf_subext=0 $ $x=1310 $y=890 $w=40 $h=60
XM18 N_3 PI GND GND ne5 w=9.6e-07 l=5e-07 as=4.608e-13 ad=2.592e-13 ps=2.88e-06 pd=1.5e-06 nrs=0.28125 nrd=0.28125 m=2 par1=2 xf_subext=0 $ $x=1310 $y=630 $w=40 $h=60
XM19 PO N_2 N_3 GND ne5 w=9.6e-07 l=5e-07 as=4.608e-13 ad=2.592e-13 ps=2.88e-06 pd=1.5e-06 nrs=0.28125 nrd=0.28125 m=2 par1=2 xf_subext=0 $ $x=1310 $y=740 $w=40 $h=60
.ends

.subckt io_esd2_fc A GNDO GNDR VDDR Y 
* PORT=VDDR TYPE=In
* PORT=A TYPE=In
* PORT=GNDR TYPE=In
* PORT=GNDO TYPE=In
* PORT=Y TYPE=Out

XM0 Y VDDR VDDR VDDR pe5 w=8e-06 l=5e-07 as=2.72e-12 ad=2.72e-12 ps=1.13467e-05 pd=1.13467e-05 nrs=0.03375 nrd=0.03375 m=3 par1=3 xf_subext=0 $ $x=930 $y=880 $w=40 $h=60
XM1 Y GNDR GNDR GNDO ne5 w=1.2e-05 l=5e-07 as=5.76e-12 ad=3.24e-12 ps=2.496e-05 pd=1.254e-05 nrs=0.0225 nrd=0.0225 m=2 par1=2 xf_subext=0 $ $x=930 $y=680 $w=40 $h=60
XR1 A Y rnp1 l=3.87e-06 w=2e-06 m=1 pm=4 par1=1 $ $x=820 $y=800 $w=60 $h=20 $r=270
.ends

.subckt io_ic_fc GND GNDO GNDR PAD PI PO VDD VDDR Y 
* PORT=VDDR TYPE=In
* PORT=PAD TYPE=In
* PORT=Y TYPE=Out
* PORT=PO TYPE=Out
* PORT=VDD TYPE=In
* PORT=GNDO TYPE=In
* PORT=PI TYPE=In
* PORT=GNDR TYPE=In
* PORT=GND TYPE=In

XI1 PAD GNDO GNDR VDDR N_1 io_esd2_fc $ $x=-465 $y=150 $w=150 $h=160
XI3 N_1 GNDO GNDR VDDR N_2 io_bufc_fc $ $x=-140 $y=150 $w=120 $h=160
XI4 GND PI PO VDD Y N_2 io_ndtr_fc $ $x=160 $y=120 $w=200 $h=220
.ends


***** Top Level *****
.subckt BBC1FC_5V PAD PI PO Y A EN GNDO GNDR VDDO VDDR VDD5
*
XI0 GNDO GNDO GNDR PAD PI PO VDD5 VDDR Y io_ic_fc $ $x=1100 $y=650 $w=280 $h=180 $m
XI1 A EN GNDO GNDO PAD VDD5 VDDO io_ts1_fc $ $x=755 $y=865 $w=230 $h=130
.ends
