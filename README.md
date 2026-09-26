# VSD RTL Design & Verification Workshop

## About the Workshop

This repository documents my learning and hands-on work completed during the **VSD RTL Design & Verification Workshop**.

The workshop covers RTL design using Verilog, functional simulation, waveform analysis, synthesis, logic optimisation, Gate-Level Simulation (GLS), synthesis-friendly RTL coding practices, and introductory physical design using open-source EDA tools.

The practical experiments were performed using the **VSDSquadron environment** with tools and technologies including:

- Icarus Verilog
- GTKWave
- Yosys
- OpenLane
- OpenROAD
- Magic
- KLayout
- OpenSTA
- ngspice
- SKY130 standard-cell libraries

---

## Workshop Objectives

The main objectives of this workshop were to:

- Understand the RTL design flow using Verilog HDL
- Perform functional simulation and waveform analysis
- Understand standard-cell timing libraries
- Perform RTL synthesis using Yosys
- Study hierarchical and flattened synthesis
- Understand flip-flop coding styles
- Explore combinational and sequential logic optimisation
- Perform Gate-Level Simulation (GLS)
- Understand RTL versus synthesized hardware behaviour
- Study blocking and non-blocking assignments
- Understand incomplete sensitivity lists and simulation-synthesis mismatch
- Learn proper use of `if-else`, `case`, procedural loops and generate loops
- Understand the RTL-to-GDS physical design flow
- Explore the OpenLane ASIC design flow
- Understand the SKY130 PDK and standard-cell libraries
- Study floorplanning, placement and power distribution
- Understand core, die, utilization factor and aspect ratio
- Study decoupling capacitors and power planning
- Understand standard-cell characterization and timing parameters
- Perform physical layout inspection using Magic
- Perform Design Rule Check (DRC) using Magic
- Extract layout information into a SPICE-compatible netlist
- Perform post-layout SPICE simulation using ngspice
- Characterize a CMOS inverter using Voltage Transfer Characteristics (VTC)
- Measure switching threshold voltage, rise time, fall time and propagation delays
- Analyse timing reports using OpenSTA

---

# Workshop Progress

| Day | Topics Covered | Status |
|-----|----------------|--------|
| Day 1 | Verilog RTL Design & Functional Simulation | ✅ Completed |
| Day 2 | Timing Libraries, Synthesis & Flip-Flop Coding | ✅ Completed |
| Day 3 | Combinational & Sequential Logic Optimisation | ✅ Completed |
| Day 4 | RTL Synthesis & Gate-Level Simulation | ✅ Completed |
| Day 5 | IF-ELSE, CASE & Looping Constructs | ✅ Completed |
| Day 6 | Open-Source EDA, OpenLane & SKY130 PDK | ✅ Completed |
| Day 7 | Sky130 Physical Design: Floorplanning, Placement & Library Cells | ✅ Completed |
| Day 8 | Design Library Cell using Magic Layout & ngspice Characterization | ✅ Completed |
| BabySoC | BabySoC Simulation and Related Experiments | 🔄 Ongoing |

---

# Repository Structure

```text
VSD_WorkShop/
│
├── Day-1/
│   ├── README.md
│   ├── Netlist.png
│   └── Simulation WF.png
│
├── Day-2/
│   ├── README.md
│   ├── Async FF Netlist.png
│   ├── Complete Netlist.png
│   ├── DFF_waveform.png
│   ├── Flatten Netlist.png
│   ├── Hierarchial Modules.png
│   └── SKY130DK.png
│
├── Day-3/
│   ├── README.md
│   └── images/
│
├── Day-4/
│   ├── README.md
│   └── images/
│
├── Day-5/
│   ├── README.md
│   └── images/
│
├── Day-6/
│   ├── README.md
│   └── images/
│
├── Day-7/
│   ├── README.md
│   └── images/
│       ├── cell_design.png
│       ├── core_die.png
│       ├── decoupling_cap.png
│       ├── floor_plan.png
│       ├── floor_plan_comp.png
│       ├── floorplanning_con.png
│       ├── magic_res.png
│       ├── placement_run.png
│       ├── placement_vis.png
│       ├── supply_lines.png
│       ├── synth_comp.png
│       └── timing_report.png
│
├── Day-8/
│   ├── README.md
│   └── images/
│       ├── cmos_inverter_structure.png
│       ├── SK1_SPICE_Deck_and_Simulation.png
│       ├── SK1_L3_Switching_Threshold_Vm.jpg
│       ├── SK1_L3_Switching_Threshold_VTC.png
│       ├── SK2_Complete_CMOS_Process_Flow.png
│       ├── SK3_L1_Magic_Layout_DRC_Clean.png
│       ├── SK3_L2_SPICE_Extraction.png
│       ├── SK3_L3_Post_Layout_Transient.png
│       ├── SK3_L4_Dynamic_Characterization.jpg
│       └── SK3_Metal3_DRC_Rules.png
│
└── BabySoc/
````

---

# Table of Contents

## Day 1 – Verilog RTL Design & Functional Simulation

Introduction to RTL design, testbenches, functional simulation and waveform analysis using a 2:1 multiplexer.

➡️ **[Open Day 1 →](Day-1/)**

---

## Day 2 – Timing Libraries, Synthesis & Flip-Flop Coding

Study of SKY130 timing libraries, hierarchical and flattened synthesis, and different flip-flop coding styles.

➡️ **[Open Day 2 →](Day-2/)**

---

## Day 3 – Logic Optimisation

Study of combinational and sequential logic optimisation, constant propagation, Boolean optimisation and optimisation of sequential logic.

➡️ **[Open Day 3 →](Day-3/)**

---

## Day 4 – RTL to Gate-Level Simulation

Study of RTL simulation, Yosys synthesis, standard-cell mapping, gate-level netlists, Gate-Level Simulation, blocking/non-blocking assignments and simulation-synthesis mismatch.

➡️ **[Open Day 4 →](Day-4/)**

---

## Day 5 – RTL Coding Constructs

Study of `if-else`, `case`, inferred latches, overlapping case conditions, synthesis optimisation, procedural loops, generate loops, MUX, DEMUX and Ripple Carry Adder designs.

➡️ **[Open Day 5 →](Day-5/)**

---

## Day 6 – Open-Source EDA, OpenLane & SKY130 PDK

Introduction to open-source ASIC design, OpenLane, the SKY130 PDK, RTL-to-GDS flow, design preparation, synthesis and synthesis result analysis using the PicoRV32 design.

➡️ **[Open Day 6 →](Day-6/)**

---

## Day 7 – Sky130 Physical Design

Study of floorplanning, utilization factor, aspect ratio, core and die, pre-placed cells, decoupling capacitors, power planning, placement, standard-cell libraries, cell design and timing characterization.

Practical work includes OpenLane floorplanning, placement, power distribution, Magic layout inspection and timing analysis.

➡️ **[Open Day 7 →](Day-7/)**

---

## Day 8 – Design Library Cell using Magic Layout and ngspice Characterization

This module focuses on the design, layout verification, extraction and characterization of a CMOS inverter using the **SKY130A technology**, **Magic** and **ngspice**.

The practical work covers:

* CMOS inverter structure and operation
* SPICE deck creation
* DC simulation
* Voltage Transfer Characteristic (VTC)
* Switching threshold voltage measurement
* CMOS fabrication and layout concepts
* SKY130 technology
* CMOS inverter layout using Magic
* Design Rule Check (DRC)
* Metal3 design rules
* Layout extraction
* SPICE netlist generation
* Post-layout transient simulation
* Dynamic characterization
* Rise time and fall time measurement
* Propagation delay measurement

The final layout verification reported:

```text
Total DRC errors found: 0
```

The measured switching threshold voltage was:

```text
Vm = 1.329304 V
```

The dynamic characterization results were:

| Parameter | Measured Value |
| --------- | -------------- |
| Rise Time | 57.99 ps       |
| Fall Time | 39.90 ps       |
| TPHL      | 26.19 ps       |
| TPLH      | 55.23 ps       |

➡️ **[Open Day 8 →](Day-8/)**

---

## BabySoC

The BabySoC section contains experiments and simulations related to the BabySoC design and its verification flow.

➡️ **[Open BabySoC →](BabySoc/)**

---

# Tools & Technologies

### Verilog HDL

Used for describing digital hardware at the Register Transfer Level (RTL).

### Icarus Verilog

Used for compiling and simulating Verilog RTL designs.

### GTKWave

Used to visualize and analyse simulation waveforms generated in VCD format.

### Yosys

Used for RTL synthesis, logic optimisation and generation of gate-level netlists.

### OpenLane

Used for the automated RTL-to-GDSII physical design flow, including synthesis, floorplanning, placement and related physical-design stages.

### OpenROAD

Used for physical-design operations such as floorplanning, placement and power distribution.

### Magic

Used for physical layout viewing, inspection, Design Rule Check (DRC), layout extraction and interaction with SKY130 technology files.

### KLayout

Used for viewing and generating layout screenshots during the physical-design flow.

### OpenSTA

Used for Static Timing Analysis and timing-report generation.

### ngspice

Used for SPICE-level circuit simulation, Voltage Transfer Characteristic analysis, post-layout simulation and dynamic characterization of the CMOS inverter library cell.

### SKY130

Open-source 130 nm process technology and standard-cell libraries used during synthesis, technology mapping, physical design, layout and cell characterization.

---

# RTL to Physical Design Flow

The overall flow explored during the workshop can be summarized as:

```text
Verilog RTL
     │
     ▼
Testbench
     │
     ▼
RTL Simulation
     │
     ▼
Waveform Analysis
     │
     ▼
Yosys Synthesis
     │
     ▼
Logic Optimisation
     │
     ▼
Technology Mapping
     │
     ▼
Gate-Level Netlist
     │
     ▼
Gate-Level Simulation
     │
     ▼
OpenLane / SKY130
     │
     ▼
Floorplanning
     │
     ▼
Placement
     │
     ▼
Power Distribution
     │
     ▼
Physical Layout
     │
     ▼
Magic DRC
     │
     ▼
Layout Extraction
     │
     ▼
Post-Layout SPICE
     │
     ▼
ngspice Characterization
     │
     ▼
Static Timing Analysis
```

---

# Key Learning Outcomes

Through the workshop, I gained practical understanding of:

* RTL design using Verilog
* Testbench-based verification
* Functional simulation
* VCD waveform generation
* GTKWave waveform analysis
* SKY130 timing libraries
* RTL synthesis using Yosys
* Hierarchical and flattened synthesis
* Flip-flop inference
* Combinational logic optimisation
* Sequential logic optimisation
* Gate-level netlist generation
* Gate-Level Simulation
* Blocking vs non-blocking assignments
* Sensitivity lists
* Simulation-synthesis mismatch
* `if-else` and `case` coding styles
* Loop-based RTL design
* Generate constructs
* Synthesis-friendly RTL coding
* Open-source ASIC design flow
* OpenLane and SKY130 PDK
* Floorplanning and core utilization
* Aspect ratio and die/core concepts
* Pre-placed cells and decoupling capacitors
* Power distribution networks
* Standard-cell placement
* Congestion-aware placement
* Standard-cell characterization
* Propagation delay and transition time
* Static Timing Analysis
* CMOS inverter structure and operation
* CMOS fabrication and layout concepts
* SKY130 technology files
* Physical layout using Magic
* Design Rule Check (DRC)
* Metal3 design rules
* Layout extraction
* SPICE netlist generation
* Post-layout SPICE simulation
* ngspice-based cell characterization
* Switching threshold voltage measurement
* Rise time and fall time measurement
* Propagation delay measurement

---

# Screenshots & Results

Each day's folder contains the corresponding experiment documentation, simulation waveforms, synthesized netlists, physical-design results and supporting screenshots.

The individual README files provide detailed explanations of the experiments, practical procedures and observed results.

### Day 7

The repository includes practical outputs from:

* Synthesis
* Floorplanning
* Placement
* Power distribution
* Physical layout inspection
* Standard-cell characterization
* Timing analysis

### Day 8

The repository includes practical outputs from:

* CMOS inverter structure
* SPICE deck creation
* DC simulation and VTC
* Switching threshold measurement
* CMOS process flow
* Magic layout
* DRC verification
* Metal3 design rules
* SPICE extraction
* Post-layout transient simulation
* Dynamic characterization

---

# Workshop Environment

The experiments were carried out in the **VSDSquadron virtual machine environment** using open-source RTL design, synthesis, physical-design and circuit-simulation tools.

The workshop progressed from RTL-level design and verification to synthesis, ASIC physical design, custom library-cell layout and SPICE characterization using the SKY130 technology.

---

# Acknowledgement

I would like to thank **VLSI System Design (VSD)** and the workshop instructors for providing the learning resources and practical exposure to RTL design, simulation, synthesis, physical design and standard-cell characterization using open-source EDA tools.

---

# Author

**S.N. Sriteja**

VLSI / RTL Design Workshop

---

## Repository

[VSD_WorkShop on GitHub](https://github.com/tejwho/VSD_WorkShop)
