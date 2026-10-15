# VSD RTL Design & Verification Workshop

A hands-on record of my progress in **RTL design, functional verification, synthesis, gate-level simulation, standard-cell characterization, physical-design concepts, and static timing analysis** using open-source EDA tools and the SKY130 technology.

This repository brings together day-wise workshop notes, practical screenshots, command outputs, simulation results, and assessment reports. Each module has its own README, and screenshots are kept in that module's `images/` folder where applicable.

## Project Walkthrough Video

Watch my project walkthrough covering Days 1–10 and the BabySoC guided project, from RTL design and synthesis through pre-layout STA, physical design, and post-route STA.

**[Watch the Project Walkthrough Video](https://drive.google.com/file/d/19dX2ne2JLxojZk3ZUfVol3RJwQBXbefF/view?usp=sharing)**

---

## About the Workshop

The workshop follows the path from describing digital logic in Verilog to understanding how a design is synthesized, mapped to standard cells, checked through simulation, and analyzed during physical implementation.

The work documented here includes:

- RTL coding and testbench-based verification
- Waveform inspection and simulation/synthesis comparison
- Synthesis, logic optimization, and SKY130 technology mapping
- Timing-library concepts and sequential-cell behavior
- Open-source ASIC flow concepts
- Floorplanning, placement, clock distribution, and routing
- CMOS inverter layout and characterization
- Setup/hold analysis and multi-corner Static Timing Analysis (STA)

## Tools and Technologies

| Tool / Technology | Role |
|---|---|
| Verilog HDL | RTL hardware description |
| Icarus Verilog | RTL and gate-level simulation |
| GTKWave | Viewing VCD simulation waveforms |
| Yosys | Synthesis and logic optimization |
| ABC | Logic optimization and technology mapping |
| OpenLane / OpenROAD | ASIC physical-design flow concepts and implementation |
| OpenSTA | Static timing analysis |
| Magic | Layout viewing, DRC, and extraction |
| KLayout | Layout inspection |
| ngspice | SPICE simulation and circuit characterization |
| SKY130 PDK | 130 nm process technology and standard-cell libraries |

---

## Workshop Progress

| Module | Main topics | Documented status |
|---|---|---|
| [Day 1](Day-1/) | Verilog RTL design, testbenches, and functional simulation | Documented |
| [Day 2](Day-2/) | Timing libraries, synthesis, and flip-flop coding styles | Documented |
| [Day 3](Day-3/) | Combinational and sequential logic optimization | Documented |
| [Day 4](Day-4/) | RTL synthesis and gate-level simulation | Documented |
| [Day 5](Day-5/) | `if-else`, `case`, and looping constructs | Documented |
| [Day 6](Day-6/) | Open-source EDA setup, OpenLane, SKY130 PDK, synthesis results | Documented |
| [Day 7](Day-7/) | Floorplanning, placement, power distribution, and standard-cell concepts | Documented |
| [Day 8](Day-8/) | CMOS inverter layout with Magic and ngspice characterization | Documented |
| [Day 9](Day-9/) | Timing analysis, setup/hold, CTS, clock skew, and post-CTS timing | Documented |
| [Day 10](Day-10/) | Macro floorplanning, routing concepts, maze routing, and DRC | Documented |
| [BabySoC](BabySoc/) | VSDBabySoC RTL, synthesis, gate-level verification, and STA/physical-design investigation | Front-end work documented; timing/physical-design issues remain |
| [Assessments](Assessments/) | Assessment reports for RTL/GLS and multi-corner STA | Reports included |

> **Status note:** “Documented” means the repository contains notes or evidence for the topic; it does not imply that every possible implementation or sign-off stage has passed. In particular, the BabySoC work should not be described as a fully completed RTL-to-GDSII flow.

---

## Module Guide

### Day 1 — Verilog RTL Design and Functional Simulation

Introduction to RTL design, testbenches, functional simulation, and waveform analysis using a 2:1 multiplexer.

➡️ [Open Day 1](Day-1/)

### Day 2 — Timing Libraries, Synthesis and Flip-Flop Coding

Explores SKY130 timing-library information, hierarchical and flattened synthesis, and different flip-flop coding styles.

➡️ [Open Day 2](Day-2/)

### Day 3 — Combinational and Sequential Logic Optimization

Covers logic optimization, constant propagation, and the behavior of combinational and sequential circuits during synthesis.

➡️ [Open Day 3](Day-3/)

### Day 4 — RTL Synthesis and Gate-Level Simulation

Documents RTL simulation, Yosys synthesis, standard-cell mapping, gate-level netlists, functional GLS, blocking/non-blocking assignments, and simulation/synthesis mismatches.

➡️ [Open Day 4](Day-4/)

### Day 5 — RTL Coding Constructs

Covers `if-else`, `case`, inferred latches, overlapping case conditions, procedural loops, generate loops, and example combinational/sequential designs.

➡️ [Open Day 5](Day-5/)

### Day 6 — Open-Source EDA, OpenLane and SKY130

Introduces the open-source ASIC environment, OpenLane/SKY130 setup, design configuration, synthesis, and interpretation of synthesis and timing outputs. Refer to the Day 6 notes for the exact stages and results recorded there.

➡️ [Open Day 6](Day-6/)

### Day 7 — Sky130 Physical Design

Documents physical-design fundamentals including floorplanning, utilization, aspect ratio, core and die dimensions, pre-placed cells, decoupling capacitors, power distribution, placement, and standard-cell concepts.

➡️ [Open Day 7](Day-7/)

### Day 8 — Standard-Cell Layout and Characterization with Magic and ngspice

Focuses on CMOS inverter design and characterization using SKY130 tools and models. Topics include the voltage-transfer characteristic (VTC), switching threshold, layout and DRC, extraction, transient response, rise/fall time, and propagation delay.

The Day 8 README records its experiment-specific measurements and screenshots; consult that module for the exact conditions and values.

➡️ [Open Day 8](Day-8/)

### Day 9 — Timing Analysis, CTS and Post-CTS Timing

Studies the timing behavior that emerges as clock distribution becomes more realistic. Topics include standard-cell delay, setup and hold checks, ideal versus implemented clocks, Clock Tree Synthesis (CTS), clock buffers, H-tree distribution, shielding, placement, clock skew, slack, and STA report interpretation.

The screenshots are linked from the module's `images/` folder.

➡️ [Open Day 9](Day-9/)

### Day 10 — Physical Design: Routing and DRC

Documents macro-cell floorplanning, routing approaches, interconnect RC delay, routing-topology concepts, maze routing using Lee's algorithm, and Design Rule Checking (DRC).

The module's screenshots are stored in `Day-10/images/` and referenced from its README using relative links.

➡️ [Open Day 10](Day-10/)

---

## BabySoC — RTL, Synthesis, Gate-Level Verification and STA

The BabySoC section documents work around **VSDBabySoC**, a small mixed-signal SoC integrating the RVMYTH RISC-V processor with PLL and DAC blocks.

### Front-end stages documented

- RTL design and pre-synthesis simulation
- Yosys synthesis and SKY130 technology mapping
- Gate-level netlist generation
- Post-synthesis functional gate-level simulation
- RTL-versus-GLS behavior comparison for the documented test

### Timing and physical-design investigation

The repository also contains multi-corner STA work. Timing reports must be interpreted by corner and by check type: positive slack indicates margin for that analyzed check, while negative setup slack indicates a setup violation under the corresponding constraints.

The available reports describe timing and physical-design limitations. Therefore, the overall BabySoC effort should be presented as **front-end verification completed with timing/physical-design work and issues still to address**, not as a fully sign-off-clean RTL-to-GDSII implementation.

➡️ [Open BabySoC](BabySoc/)

---

## Assessments

The `Assessments/` folder contains three separate reports. They are retained as individual documents because they cover different stages and/or analysis contexts.

1. **Assessment 1 — RTL Simulation and Gate-Level Verification**  
   Documents simulation waveforms, synthesis evidence, netlist output, and the reported comparison between RTL and gate-level behavior.

2. **Assessment 2 — Post-Route Multi-Corner STA**  
   Documents a post-route multi-corner timing analysis, including setup/hold slack summaries and routed-layout evidence.

3. **Assessment 3 — VSDBabySoC Multi-Corner STA**  
   Documents a 16-corner SKY130 timing analysis with summary results and individual timing-report evidence.

The STA reports should not be treated as one identical run or have their numerical results combined without checking their setup, constraints, parasitics, corners, and report context.

➡️ [Open Assessments](Assessments/)

---

## RTL-to-Physical-Design Flow

The broad sequence explored across these modules can be represented as:

```text
Verilog RTL
    ↓
Testbench and RTL Simulation
    ↓
Waveform Analysis
    ↓
Synthesis and Logic Optimization
    ↓
Technology Mapping
    ↓
Gate-Level Netlist and GLS
    ↓
Floorplanning
    ↓
Placement
    ↓
Power Distribution
    ↓
Clock Tree Synthesis
    ↓
Global and Detailed Routing
    ↓
Parasitic Extraction
    ↓
Static Timing Analysis
    ↓
Physical Verification (DRC/LVS)
    ↓
GDSII
```

This is a conceptual end-to-end flow. **Not every stage is complete for every design in this repository.** Refer to the individual module documentation and assessment reports for the evidence and current status of each experiment.

---

## Key Learning Outcomes

Through the documented exercises, I developed practical familiarity with:

- Writing Verilog RTL and testbenches
- Running simulations and inspecting VCD waveforms
- Understanding timing libraries and sequential logic
- Using Yosys and ABC for synthesis and technology mapping
- Comparing RTL simulation with gate-level simulation
- Recognizing simulation/synthesis mismatches
- Understanding floorplanning, placement, power distribution, and CTS
- Explaining setup, hold, clock skew, slack, WNS, and TNS
- Understanding routing, interconnect RC effects, and DRC
- Creating and inspecting CMOS inverter layouts
- Using Magic and ngspice for layout and circuit characterization
- Reviewing multi-corner timing reports and identifying unresolved violations
- Organizing technical evidence in a version-controlled GitHub repository

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
├── Day-9/
│   ├── README.md
│   └── images/
├── Day-10/
│   ├── README.md
│   └── images/
├── BabySoc/
│   └── README.md
└── Assessments/
    ├── README.md
    ├── Assessment-1-RTL-Simulation.pdf
    ├── Assessment-2-Post-Route-STA.pdf
    └── Assessment-3-Multicorner-STA.pdf
```

Each module's screenshot directory is named **`images/`**. Keep that folder name and the image filenames unchanged so Markdown links such as `![Timing report](images/sta1.png)` continue to work.

---

## Workshop Environment

The work was performed in a Linux-based workshop environment using open-source EDA tools. Individual modules may use different scripts, versions, configurations, and design targets; follow the commands and setup documented in each module rather than assuming a single command applies to all exercises.

## Acknowledgement

I would like to thank **VLSI System Design (VSD)** and the workshop instructors for the learning resources and hands-on exposure to RTL design, verification, synthesis, timing analysis, and physical-design concepts using open-source EDA tools.

---

## Author

**S. N. Sriteja**  
VSD RTL Design & Verification Workshop

**Repository:** [VSD_WorkShop on GitHub](https://github.com/tejwho/VSD_WorkShop)
