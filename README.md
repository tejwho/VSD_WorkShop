# VSD RTL Design & Verification Workshop

A practical record of my learning and hands-on experiments in **RTL design, functional verification, logic synthesis, gate-level simulation, and ASIC physical design** using open-source EDA tools and the SKY130 technology.

This repository contains day-wise notes, commands, design outputs, waveforms, screenshots, and observations from the VSD RTL Design & Verification Workshop. Each day's folder keeps its own `README.md` and, where applicable, an `images/` directory for screenshots.

---

## About the Workshop

The workshop progressed from writing and simulating Verilog RTL to understanding synthesis, standard-cell mapping, timing libraries, physical-design stages, and CMOS library-cell characterization.

The practical environment used tools and technologies including:

- **Verilog HDL** — RTL design
- **Icarus Verilog** — RTL and gate-level simulation
- **GTKWave** — VCD waveform viewing
- **Yosys** — synthesis and logic optimization
- **ABC** — logic optimization and technology mapping
- **OpenLane / OpenROAD** — ASIC physical-design flow
- **OpenSTA** — static timing analysis
- **Magic** — layout inspection, DRC, and extraction
- **KLayout** — layout viewing
- **ngspice** — SPICE-level simulation and characterization
- **SKY130 PDK** — open-source 130 nm process technology and standard-cell libraries

## Workshop Objectives

- Describe digital hardware using Verilog RTL.
- Build testbenches and verify behavior through simulation.
- Inspect waveforms and reason about signal timing.
- Understand standard-cell timing libraries and flip-flop coding styles.
- Synthesize RTL, optimize logic, and inspect mapped netlists.
- Perform gate-level simulation and compare RTL and synthesized behavior.
- Understand synthesis-friendly coding, procedural constructs, and simulation/synthesis mismatches.
- Explore the RTL-to-GDSII flow, including floorplanning, placement, power planning, CTS, routing, and physical verification.
- Inspect layouts, perform DRC, extract circuit information, and simulate extracted circuits.
- Characterize a CMOS inverter using VTC, switching threshold, rise/fall time, and propagation delay.
- Use OpenSTA to inspect timing paths and reports.

---

## Workshop Progress

| Module | Topics | Status |
|---|---|---|
| [Day 1](Day-1/) | Verilog RTL Design & Functional Simulation | ✅ Completed |
| [Day 2](Day-2/) | Timing Libraries, Synthesis & Flip-Flop Coding | ✅ Completed |
| [Day 3](Day-3/) | Combinational & Sequential Logic Optimisation | ✅ Completed |
| [Day 4](Day-4/) | RTL Synthesis & Gate-Level Simulation | ✅ Completed |
| [Day 5](Day-5/) | `if-else`, `case`, and Looping Constructs | ✅ Completed |
| [Day 6](Day-6/) | Open-Source EDA, OpenLane & SKY130 PDK | ✅ Completed |
| [Day 7](Day-7/) | Sky130 Physical Design: Floorplanning, Placement & Library Cells | ✅ Completed |
| [Day 8](Day-8/) | Library-Cell Design using Magic Layout & ngspice Characterization | ✅ Completed |
| [Day 10](Day-10/) | Physical Design: Routing Concepts, Topology, Maze Routing & DRC | 📝 Documented |
| [BabySoC](BabySoc/) | RTL, synthesis, SKY130 mapping, functional GLS, and next physical-design stages | 🟡 Front-end complete; STA/physical design pending |

> **BabySoC status clarification:** The current BabySoC documentation reports RTL and pre-synthesis simulation, Yosys synthesis, SKY130 technology mapping, gate-level netlist generation, and functional GLS as completed. It lists Static Timing Analysis as the next step, with floorplanning, placement, CTS, routing, physical verification, and GDSII still pending. Therefore, the BabySoC project should **not** be marked fully completed yet.

---

## Repository Structure

```text
VSD_WorkShop/
├── README.md
├── Day-1/
│   └── README.md
├── Day-2/
│   └── README.md
├── Day-3/
│   ├── README.md
│   └── images/
├── Day-4/
│   ├── README.md
│   └── images/
├── Day-5/
│   ├── README.md
│   └── images/
├── Day-6/
│   ├── README.md
│   └── images/
├── Day-7/
│   ├── README.md
│   └── images/
├── Day-8/
│   ├── README.md
│   └── images/
├── Day-10/
│   ├── README.md
│   └── images/
└── BabySoc/
    └── README.md
```

Each module's screenshot directory is named **`images/`**. Keep that name unchanged, and use relative links such as `![Floorplan](images/floor_plan.png)` inside that module's README. The exact files inside each folder may vary by module.

---

# Table of Contents

## Day 1 – Verilog RTL Design & Functional Simulation

Introduction to RTL design, testbenches, functional simulation, and waveform analysis using a 2:1 multiplexer.

➡️ [**Open Day 1 →**](Day-1/)

## Day 2 – Timing Libraries, Synthesis & Flip-Flop Coding

Study of SKY130 timing libraries, hierarchical and flattened synthesis, and different flip-flop coding styles.

➡️ [**Open Day 2 →**](Day-2/)

## Day 3 – Combinational & Sequential Logic Optimisation

Exploration of constant propagation, Boolean optimization, and optimization of combinational and sequential logic.

➡️ [**Open Day 3 →**](Day-3/)

## Day 4 – RTL Synthesis & Gate-Level Simulation

Study of RTL simulation, Yosys synthesis, standard-cell mapping, gate-level netlists, Gate-Level Simulation (GLS), blocking and non-blocking assignments, and simulation/synthesis mismatch.

➡️ [**Open Day 4 →**](Day-4/)

## Day 5 – RTL Coding Constructs

Study of `if-else`, `case`, inferred latches, overlapping case conditions, procedural loops, generate loops, and example combinational/sequential designs.

➡️ [**Open Day 5 →**](Day-5/)

## Day 6 – Open-Source EDA, OpenLane & SKY130 PDK

Introduction to open-source ASIC design, OpenLane, the SKY130 PDK, RTL-to-GDS flow setup, design preparation, synthesis, and synthesis-result analysis.

➡️ [**Open Day 6 →**](Day-6/)

## Day 7 – Sky130 Physical Design

Study of floorplanning, utilization factor, aspect ratio, core and die, pre-placed cells, decoupling capacitors, power distribution, placement, standard-cell libraries, and timing characterization.

Practical work includes floorplanning, placement, power-distribution inspection, Magic layout viewing, and timing-report analysis.

➡️ [**Open Day 7 →**](Day-7/)

## Day 8 – Design Library Cell using Magic Layout & ngspice Characterization

This module focuses on designing, verifying, extracting, and characterizing a CMOS inverter using SKY130 technology, Magic, and ngspice.

Topics include:

- CMOS inverter structure and operation
- SPICE deck creation and DC simulation
- Voltage Transfer Characteristic (VTC)
- Switching-threshold voltage measurement
- CMOS fabrication and layout concepts
- Magic layout creation and Design Rule Checking (DRC)
- Metal3 design rules
- Layout extraction and SPICE netlist generation
- Post-layout transient simulation
- Dynamic characterization, rise/fall time, and propagation delay

The existing Day 8 notes record a DRC result of **0 errors**, a switching threshold of **1.329304 V**, and dynamic-characterization measurements. Refer to the Day 8 README for the context and reported values.

➡️ [**Open Day 8 →**](Day-8/)

## Day 10 – Physical Design

This module documents physical-design concepts using the available Day 10 workshop screenshots. Topics include:

- Macro-cell floorplanning
- Routing approaches and interconnect RC delay
- Routing-topology algorithms
- Maze routing using Lee's algorithm
- Design Rule Checking (DRC)

The folder includes the relevant explanations and images. Keep screenshots in `Day-10/images/` so that the relative links in the Day 10 README continue to work.

➡️ [**Open Day 10 →**](Day-10/)

## BabySoC – RTL to Post-Synthesis Gate-Level Verification

The BabySoC work integrates a RISC-V-based RVMyth processor with an AVSDPLL clock source and an AVSDAC output block. The current project notes describe the front-end flow through functional gate-level verification.

### Completed stages

- RTL design and pre-synthesis simulation
- Yosys logic synthesis
- SKY130 technology mapping
- Gate-level netlist generation
- Post-synthesis functional GLS
- RTL-versus-GLS functional comparison for the documented test

### Remaining stages

- Static Timing Analysis (STA)
- Floorplanning
- Placement
- Clock Tree Synthesis (CTS)
- Routing and parasitic extraction
- Physical verification and GDSII generation

The BabySoC README documents the detailed flow and its reported results. Based on that README, the **front-end functional flow is complete, but the full RTL-to-GDSII flow is still in progress**.

➡️ [**Open BabySoC →**](BabySoc/)

---

# RTL-to-Physical-Design Flow

The broad flow explored across the workshop can be summarized as:

```text
Verilog RTL
    ↓
Testbench & RTL Simulation
    ↓
Waveform Analysis
    ↓
Yosys Synthesis & Logic Optimisation
    ↓
Technology Mapping
    ↓
Gate-Level Netlist
    ↓
Gate-Level Simulation
    ↓
Floorplanning
    ↓
Placement
    ↓
Power Distribution
    ↓
Clock Tree Synthesis
    ↓
Global & Detailed Routing
    ↓
Parasitic Extraction
    ↓
Static Timing Analysis
    ↓
Physical Verification (DRC/LVS)
    ↓
GDSII
```

Not every stage is complete for every design in this repository. See the progress table and the individual module README files for the documented status of each experiment.

---

# Key Learning Outcomes

Through these experiments, I developed practical familiarity with:

- Verilog RTL design and testbench-based verification
- Functional simulation and VCD waveform analysis
- SKY130 timing libraries and standard cells
- Yosys synthesis, logic optimization, and technology mapping
- Hierarchical and flattened synthesis
- Flip-flop inference and sequential logic
- Gate-level netlist generation and functional GLS
- Blocking versus non-blocking assignments
- Sensitivity lists and simulation/synthesis mismatches
- `if-else`, `case`, procedural loops, and generate constructs
- OpenLane/OpenROAD and the SKY130 PDK
- Floorplanning, core utilization, aspect ratio, and die/core concepts
- Decoupling capacitors, power-distribution networks, and placement
- Routing, interconnect parasitics, and timing analysis concepts
- Magic layout inspection, DRC, and layout extraction
- CMOS inverter VTC and switching-threshold analysis
- ngspice post-layout simulation and dynamic characterization
- OpenSTA timing-report analysis

---

# Tools & Technologies

| Tool / Technology | Purpose |
|---|---|
| Verilog HDL | RTL hardware description |
| Icarus Verilog | RTL and gate-level simulation |
| GTKWave | Waveform viewing and analysis |
| Yosys | Synthesis and logic optimization |
| ABC | Logic optimization and technology mapping |
| OpenLane / OpenROAD | ASIC physical-design stages |
| OpenSTA | Static timing analysis |
| Magic | Layout viewing, DRC, and extraction |
| KLayout | Layout inspection |
| ngspice | SPICE simulation and circuit characterization |
| SKY130 PDK | 130 nm process technology and standard-cell libraries |

---

# Workshop Environment

The work was carried out in a Linux-based VSDSquadron workshop environment using open-source EDA tools. Individual modules may use different scripts or flow configurations, so use the commands documented in each module's README rather than assuming one command applies to every experiment.

## Screenshots and Results

Each module's README provides its own explanation of the experiments, commands, screenshots, and observations. Screenshots are stored in the corresponding module's `images/` directory where applicable.

---

# Acknowledgement

I would like to thank **VLSI System Design (VSD)** and the workshop instructors for the learning resources and hands-on exposure to RTL design, verification, synthesis, physical design, and standard-cell characterization using open-source EDA tools.

---

# Author

**S. N. Sriteja**  
VSD RTL Design & Verification Workshop

## Repository

[**VSD_WorkShop on GitHub**](https://github.com/tejwho/VSD_WorkShop)
