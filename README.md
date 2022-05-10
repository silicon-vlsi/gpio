# ABOUT

Information related to GPIO and I3C Pad Design.

# RESOURCES

- **TEXTBOOKS**
  - [**Kang**] Leblebici, Yusuf, Chul Woo Kim, and Sung-Mo (Steve) Kang. CMOS Digital Integrated Circuits Analysis & Design. 4th ed. McGraw-Hill Education, 2014. [folder]/s/axtrki5yilzg8zs/Kang-CMOS-DigitalIC-4thIE-McGrawHill-2015.pdf.
  - [**Hodges**] Hodges, David A., and David. Analysis And Design Of Digital Integrated Circuits, In Deep Submicron Technology 2005. [folder]/s/olc3j7hkarlwila/HodgesJackson-DesignAndAnalysisOfDigitalIC-3Ed-McGraw-2005.pdf.
  - [**Weste**] Weste, Neil, and David Harris. CMOS VLSI Design: A Circuits and Systems Perspective. Pearson Education, 2011. [folder]/s/ard8jntcpq1pt45/Weste-Harris-CMOS-VLSI-design-Pearson-4thEd-2011.pdf.


- **APP-NOTES/WHITE PAPERS/PAPERS/THESIS/ETC**
  - **I3C**
    - [Introduction to the MIPI I3C Standardized Sensor Interface](docs/MIPI_Alliance_I3C_Whitepaper.pdf)
    - I3C Specs: [folder]/s/6ihhnpu53mopuvk/mipi_I3C_specification_v1-0.pdf

  - **PACKAGING**
    - Wichern, D. (2005). Chracterizating Cells and Writing a Technology Library File. [[PDF](https://www.dropbox.com/s/ob41tfqdnx8cjjj/Wichern-CharacterizingCellsWritingTechnologyLibraryFile-2005.pdf)]
    - Anne, N. (2010). Design and Characterization of a Standard Cell Library for the FREEPDK45 Process. [[PDF](https://www.dropbox.com/s/eju3312ptw0xr9k/Anne-DesignCharStdCells-OKSU-2010.pdf)]


- **LINKS**
  - [I3C Bus on Wikipedia](https://en.wikipedia.org/wiki/I3C_(bus))


# IO DESIGN

- [**SUGGESTED READING**]
  - [**Hodges**]:  **6.5** Gate Sizing for Optimal Delay. 
  - [**Kang**]: **13.1-4** ESD Protection, Input and Output circuits.
  - [**Weste**]: **13.6** Input/Output (I/O) subcircuits.  

# SIMULATION

**Eldo Quick Start**

- Load environment variables: `module load tools/amsv/2022-1-2`
  - For getting started on the `module` environment [see here](https://silicon-vlsi.github.io/wiki/wiki-it.html#getting-started) 
- Create a work area and `cd` into it:
  - `mkdir eldo`
  - `cd eldo`
- Copy an example **netlist**: `cp /home/nfs1/gits/gpio/netlists/inv-chain.cir`
- Run **Eldo** on it: `eldo inv-chain.cir`
  - The output file `inv-chain.chi` contains the log of the simulation as well as any output from simulation.
  - The output file `inv-chain.wdb` contains all the plot data which can be viewed using **EZWave**
- To check and analyze the plot use EZWave: `ezwave inv-chain.wdb`

**ASSIGNMENTS**

- Assignement-1:
  - Check the outputs and make sure the delays are reasonable.
  - Extract delay, rise/fall time and power using `.MEAS` statement.
  - Extract delay, rise/fall time and power using `.EXTRACT` statement.
  - Do PVT sims using `.ALTER` statements.
- Assignment-2:
  - Copy `/home/nfs1/gits/gpio/netlists/TB_BBC1FC.cir`
    - **NOTE** The PAD subcircuit is in HSPICE format so run `eldo` with the `-compat` option eg.
    - `eldo -compat -i TB_BBC1FC.cir`
  - Extract delay, rise/fall time and power using `.EXTRACT` statement.
  - Do PVT sims using `.STEP` function and then `.ALTER` (Check this [knowledgebase](eldo.md) for difference between `.STEP` and `.ALTER`)
    - Simulate for three corners: `tm,wp,ws`
      - Include param.lib to use other corners: `.LIB <path-to-file>/param.lib 3s`
    - Three temperatures: `-40, 25, 125`
    - Voltage: `5V +/- 10%`
    - Plot the corners in EZWave  

**Other Resources**
  - Example eldo netlists at `/CAD/mentor/amsv/amsv-2022-1-2/examples/eldo`
  - Example ngspice netlists: `/CAD/opensrc/eda-ngspice/examples`
  - Manuals, user guides etc: `/CAD/docs/public_html/index.html`

# PACKAGING

**Resources**
- [Library Exchange Format (LEF) in Physical Design](https://www.teamvlsi.com/2020/05/lef-lef-file-in-asic-design.html?m=1)

**Knowledge Base**

```verilog
`timescale 1ns/10ps

`celldefine

module PAD (A, EN, GNDO1V8, GNDR1V8, PAD, PI, PO, VDD, VDDO1V8, VDDR1V8, Y);
//*****************************************************************
//   cell_description : Bi-directional Buffer with Non-Inverting CMOS
//                      Input, Strength 16mA @ 1.8 V, Normal, High noise
//****************************************************************************

   input     A, EN, GNDO1V8, GNDR1V8, PI, VDD, VDDO1V8, VDDR1V8;
   inout     PAD;
   output    PO, Y;

   wire      ck_sub, ck_GNDO1V8, ck_GNDR1V8, ck_VDD, ck_VDDO1V8, ck_VDDR1V8;

   check_gnd i0  (ck_GNDO1V8, GNDO1V8);
   check_gnd i1  (ck_GNDR1V8, GNDR1V8);
   check_vdd i2  (ck_VDD, VDD);
   check_vdd i3  (ck_VDDO1V8, VDDO1V8);
   check_vdd i4  (ck_VDDR1V8, VDDR1V8);

   and       i5  (ck_sub, ck_GNDO1V8, ck_GNDR1V8, ck_VDD, ck_VDDO1V8, ck_VDDR1V8);

   check_buf i6  (ck_A, A, ck_sub);
   check_buf i7  (ck_EN, EN, ck_sub);
   check_buf i8  (ck_PAD, PAD, ck_sub);
   check_buf i9  (ck_PI, PI, ck_sub);
// Function PAD: A; Tristate function: EN
   bufif0    i10 (PAD, ck_A, ck_EN);

// Function PO: !(PAD&PI)
   nand      i11 (PO, ck_PAD, ck_PI);

// Function Y: PAD
   buf       i13 (Y, ck_PAD);

// timing section:
   specify

      (A +=> PAD) = (0.02, 0.02);
      (EN  => PAD) = (0.02, 0.02, 0.02, 0.02, 0.02, 0.02);

      (PAD -=> PO) = (0.02, 0.02);
      (PI -=> PO) = (0.02, 0.02);

      (PAD +=> Y) = (0.02, 0.02);

   endspecify
endmodule

`endcelldefine

```

- Some FAQ on a standard-cell library from a foundry.
  - Why we use `check_` command in functional section for `GND` and `VDD` ?
    - `check_vdd`, `check_gnd` are primitives defined by the foundry. Basically checks if the supply/ground has been provided or not.
    - Check_sub signal is 1 when all power supplies are provided properly.
  - What's the purpose of multiple `GND` and `VDD` ?
    - IO rails have provision for multiple power supplies. One for the IO itself and another for the Core. Core logic tends to pick power from one of these power/gnd rails
  - Why we define `sub wire` in wire section ?
    - `sub` signal is 1 when all power supplies are provided properly
  - Why we give ( and ) logic to all VDD and GND ?
    - To make sure all the power/ground are properly provided. `ck_gnd`, `ck_vdd` are all digital signals. they are 0 if power/ground is not provided and 1 if it’s provided.
  - What is `check_buf` command and what is use of this command with sub wire ?
    - The buffer works only when all power supplies are provided to the design properly
  - In `specify` command, `+ve` and `-ve` polarity how to assign it to which pin ?
    - `+, -` specifies polarity.. For an inverter you will have  `I -=> Z`, for a buffer you will have `I +=> Z`


# PRE-REQ

- [**Introduction to Linux**](https://github.com/silicon-vlsi-org/module-cs3-301)
- [**Introduction to text editor vim**](https://www.dropbox.com/s/9qqno50ls4sntlc/quickStartGuide-VIM.pdf)
- [**Electrical Fundamentals**]:
  - Electrostatics, Nodal and Mesh Analysis, Network Theorems: KCL, KVL, Superposition, Thevenin, Norton.
  - RC Circuits: Resistor networks, time-constant (open-circuit time-constant), Delays
  - Switching Behaviour, Boolean logic (different kind of gates), k-map, Boolean Decomposition, De Morgan's Laws
  - State Machine, Timing Diagram, D-Flip-flop, Clock divider, ripple counter, synchronous counter (assignment), sequence detector.
  - Concept of Delay, Dependence on Load and input rise/fall time, Setup Time, Hold Time.
  - [Assignment](docs/assignment-ee3-301-network-theory.pdf)
- [**Basic CMOS**]
  - Introduction to VLSI Disgn Flow.
  - CMOS Processing steps and layout basics.
  - Passive integrated circuits: resistor, capacitor and inductors.
  - MOSFET Basics: MOS structure, basic working principle, threshold voltage, I-V chracteristics, intrinsic and parasitic capacitance. 
  - MOSFET Modeling (Level-1,2,3, BSIM). Familiarity with SPICE netlist and running simulation in commandline. Parameter extraction for Level-1 modeling.
  - Interconnect effects and different methods of delay calculations (RC, Pi, T, Elmore, open-circuit) 
  - Short-channel effects: velocity saturation, DIBL, Hot-electron effect.
  - Resource: [Sevya Freshers Training](https://github.com/silicon-vlsi/Sevya-Freshers-Training) gitHub site is an excellent resource for it.
  - [Assignment](docs/assignment-ee4-301-cmos.pdf)
- [**Inverter Characterisitcs and CMOS Logic**]
  - Static chracteristics: Voltage Transfer Characteristics (VTC), noise margin, spice simulation.
  - Dynamic characterisitcs: delay and power analysis. 
  - Combinational Logic and Latch/Flip-Flop CMOS design.
  - Simulation to extract setup and hold time in Flip-Flops.
  - Resource: [Sevya Freshers Training](https://github.com/silicon-vlsi/Sevya-Freshers-Training) gitHub site is an excellent resource for it.




