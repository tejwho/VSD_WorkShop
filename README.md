# VSD RTL Design & Verification Workshop

## About the Workshop

This repository documents my learning and hands-on work completed during the **VSD RTL Design & Verification Workshop**.

The workshop focuses on RTL design using Verilog, functional simulation, synthesis, logic optimisation, gate-level simulation, and synthesis-friendly RTL coding practices using open-source EDA tools.

The practical experiments were performed using the **VSDSquadron environment** and tools such as:

- Icarus Verilog
- GTKWave
- Yosys
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
- Develop synthesis-friendly and scalable RTL coding practices

---

# Workshop Progress

| Day | Topics Covered | Status |
|-----|----------------|--------|
| Day 1 | Verilog RTL Design & Functional Simulation | ✅ Completed |
| Day 2 | Timing Libraries, Synthesis & Flip-Flop Coding | ✅ Completed |
| Day 3 | Combinational & Sequential Logic Optimisation | ✅ Completed |
| Day 4 | RTL Synthesis & Gate-Level Simulation | ✅ Completed |
| Day 5 | IF-ELSE, CASE & Looping Constructs | ✅ Completed |
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

### SKY130

Open-source 130 nm process technology and standard-cell libraries used during synthesis and technology mapping.

---

# RTL Design Flow

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
Waveform Verification
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

---

# Screenshots & Results

Each day's folder contains the corresponding experiment documentation, simulation waveforms, synthesized netlists and other supporting screenshots.

The individual README files provide detailed explanations of the experiments and their results.

---

# Workshop Environment

The experiments were carried out in the **VSDSquadron virtual machine environment** using open-source RTL design and synthesis tools.

---

# Acknowledgement

I would like to thank **VLSI System Design (VSD)** and the workshop instructors for providing the learning resources and practical exposure to RTL design, simulation and synthesis using open-source EDA tools.

---

# Author

**S.N. Sriteja**

VLSI / RTL Design Workshop

---

## Repository

🔗 [VSD_WorkShop](https://github.com/tejwho/VSD_WorkShop)

```

### One important correction

I checked your actual Day folders too, so the descriptions above match what you currently have:

- **Day 1:** 2:1 MUX, Icarus Verilog, GTKWave, introductory Yosys synthesis. :contentReference[oaicite:2]{index=2}
- **Day 2:** SKY130 `.lib`, hierarchical/flattened synthesis and DFF coding. :contentReference[oaicite:3]{index=3}
- **Day 3:** combinational/sequential optimisation and constant propagation. :contentReference[oaicite:4]{index=4}
- **Day 4:** RTL → synthesis → gate-level simulation, blocking/non-blocking, sensitivity lists and mismatch. :contentReference[oaicite:5]{index=5}
- **Day 5:** `if-else`, `case`, latches, loops, MUX/DEMUX and Ripple Carry Adder. :contentReference[oaicite:6]{index=6}

**So don't create another README inside a Day folder.** This one is specifically for the **root of the repository**, alongside `Day-1`, `Day-2`, etc.

Also, I would change the final **Author** line from `S.N. Sriteja` if that's not the exact name you want publicly displayed.
```

[1]: https://github.com/tejwho/VSD_WorkShop "GitHub - tejwho/VSD_WorkShop: Verilog RTL design, simulation & synthesis using open-source tools — Icarus Verilog, GTKWave, Yosys, Sky130. · GitHub"
