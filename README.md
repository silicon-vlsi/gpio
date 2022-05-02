# ABOUT

Information related to GPIO and I3C Pad Design.

# RESOURCES

- **TEXTBOOKS**
  - [**Kang**] Leblebici, Yusuf, Chul Woo Kim, and Sung-Mo (Steve) Kang. CMOS Digital Integrated Circuits Analysis & Design. 4th ed. McGraw-Hill Education, 2014. [folder]/s/axtrki5yilzg8zs/Kang-CMOS-DigitalIC-4thIE-McGrawHill-2015.pdf.
  - [**Hodges**] Hodges, David A., and David. Analysis And Design Of Digital Integrated Circuits, In Deep Submicron Technology 2005. [folder]/s/olc3j7hkarlwila/HodgesJackson-DesignAndAnalysisOfDigitalIC-3Ed-McGraw-2005.pdf.
  - [**Weste**] Weste, Neil, and David Harris. CMOS VLSI Design: A Circuits and Systems Perspective. Pearson Education, 2011. [folder]/s/ard8jntcpq1pt45/Weste-Harris-CMOS-VLSI-design-Pearson-4thEd-2011.pdf.

- **APP-NOTES/WHITE PAPERS/PAPERS**
  - [Introduction to the MIPI I3C Standardized Sensor Interface](docs/MIPI_Alliance_I3C_Whitepaper.pdf)
  - I3C Specs: [folder]/s/6ihhnpu53mopuvk/mipi_I3C_specification_v1-0.pdf

- **LINKS**
  - [I3C Bus on Wikipedia](https://en.wikipedia.org/wiki/I3C_(bus))


# IO Design

- [**SUGGESTED READING**]
  - [**Hodges**]:  **6.5** Gate Sizing for Optimal Delay. 
  - [**Kang**]: **13.1-4** ESD Protection, Input and Output circuits.
  - [**Weste**]: **13.6** Input/Output (I/O) subcircuits.  

# Simulation

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
  - Extract delay, rise/fall time and power using `.EXTRACT` statement.
  - Do PVT sims using `.STEP` function and then `.ALTER` (Check this [knowledgebase](eldo.md) for difference between `.STEP` and `.ALTER`)
    - Simulate for three corners: `tm,wp,ws`
    - Three temperatures: `-40, 25, 125`
    - Voltage: `5V +/- 10%`
    - Plot the corners in EZWave  

**Other Resources**
  - Example eldo netlists at `/CAD/mentor/amsv/amsv-2022-1-2/examples/eldo`
  - Example ngspice netlists: `/CAD/opensrc/eda-ngspice/examples`
  - Manuals, user guides etc: `/CAD/docs/public_html/index.html`




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




