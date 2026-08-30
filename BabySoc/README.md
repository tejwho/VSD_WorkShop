# BabySoC – From RTL to Post-Synthesis Gate-Level Verification

This work documents the front-end ASIC design flow of a small RISC-V-based SoC, **BabySoC**, from its original RTL description through logic synthesis, SKY130 technology mapping, and post-synthesis gate-level simulation. The purpose of the flow is to verify that the synthesized implementation preserves the functional behavior of the original RTL design.

---

## 1. Design Overview

BabySoC is a minimal SoC consisting of three main blocks instantiated inside the top-level module `vsdbabysoc`.

| Block       | Role                                                      |
| ----------- | --------------------------------------------------------- |
| **RVMyth**  | RISC-V based CPU core and main digital processing element |
| **AVSDPLL** | Generates the clock used by the CPU                       |
| **AVSDAC**  | Converts the CPU's digital output into an analog output   |

The overall signal flow is:

```text
REF, VCO_IN, ENb_CP, ENb_VCO
              │
              ▼
           AVSDPLL
              │
              ▼
             CLK
              │
              ▼
           RVMyth
              │
         RV_TO_DAC[9:0]
              │
              ▼
           AVSDAC
              │
             OUT
```

The main digital signal observed during simulation is `RV_TO_DAC[9:0]`, as it provides a useful indication of whether the CPU logic continues to behave correctly after synthesis.

### Design Hierarchy

```text
vsdbabysoc
├── avsddpll
├── rvmyth
└── avsddac
```

---

# 2. ASIC Design Flow

The project was carried out progressively through the following stages:

```text
RTL Design
    ↓
Pre-Synthesis Simulation
    ↓
Logic Synthesis
    ↓
SKY130 Technology Mapping
    ↓
Gate-Level Netlist
    ↓
Post-Synthesis Functional GLS
    ↓
RTL vs Gate-Level Comparison
    ↓
Static Timing Analysis
    ↓
Physical Design
```

### Progress Status

| Stage                         | Status      |
| ----------------------------- | ----------- |
| RTL Design                    | ✅ Completed |
| Pre-Synthesis Simulation      | ✅ Completed |
| Logic Synthesis using Yosys   | ✅ Completed |
| SKY130 Technology Mapping     | ✅ Completed |
| Gate-Level Netlist Generation | ✅ Completed |
| Post-Synthesis Functional GLS | ✅ Completed |
| RTL vs GLS Verification       | ✅ Completed |
| Static Timing Analysis        | 🔜 Next     |
| Floorplanning                 | ⏳ Later     |
| Placement                     | ⏳ Later     |
| Clock Tree Synthesis          | ⏳ Later     |
| Routing                       | ⏳ Later     |
| Physical Verification / GDSII | ⏳ Later     |

---

# 3. RTL Design

The BabySoC RTL consists of the top-level `vsdbabysoc` module together with the `rvmyth`, `clk_gate`, PLL, and DAC components.

At this stage, the design is represented using behavioral and RTL-level Verilog constructs rather than physical standard-cell implementations.

The main objective of this stage was to ensure that the original RTL design was syntactically correct and functionally operational before proceeding to synthesis.

**Status: ✅ RTL design completed.**

---

# 4. Pre-Synthesis Simulation

Before synthesis, the original RTL design was simulated using **Icarus Verilog**.

The simulation testbench was used to provide the required clock, reset, and input conditions and to observe the behavior of the SoC.

The important signals monitored were:

* `CLK`
* `REF`
* `reset`
* `VCO_IN`
* `VREFH`
* `RV_TO_DAC[9:0]`
* `OUT`

The generated VCD file was examined using **GTKWave** to verify the expected RTL behavior.

This established the functional reference against which the later gate-level simulation could be compared.

**Status: ✅ Pre-synthesis simulation completed successfully.**

---

# 5. Logic Synthesis with Yosys

After confirming the RTL functionality, the design was synthesized using **Yosys**.

The RTL source files were read into Yosys and synthesized with the SKY130 standard-cell library.

The target technology library used was:

```text
sky130_fd_sc_hd
```

with the following Liberty file:

```text
sky130_fd_sc_hd__tt_025C_1v80.lib
```

The synthesis flow included reading the required RTL modules and libraries, synthesizing the top-level design, mapping sequential elements, performing technology mapping, flattening the hierarchy, removing unused logic, resolving undefined values, and generating the synthesized netlist.

### Important Yosys Commands

| Command                 | Function                                                                    |
| ----------------------- | --------------------------------------------------------------------------- |
| `read_verilog`          | Reads the Verilog RTL source files                                          |
| `read_liberty`          | Loads the standard-cell timing/library information                          |
| `synth -top vsdbabysoc` | Synthesizes the design with `vsdbabysoc` as the top module                  |
| `dfflibmap`             | Maps flip-flops to available library flip-flop cells                        |
| `abc`                   | Performs combinational logic optimization and technology mapping            |
| `flatten`               | Removes module hierarchy by combining the design into a flat representation |
| `setundef -zero`        | Resolves undefined signals to logic 0                                       |
| `clean -purge`          | Removes unused cells and wires                                              |
| `rename -enumerate`     | Assigns systematic names to generated internal signals                      |
| `stat`                  | Displays synthesis statistics                                               |
| `write_verilog`         | Generates the synthesized Verilog netlist                                   |
| `show`                  | Generates a graphical representation of the synthesized design              |

During synthesis, Yosys performed several optimization passes including constant propagation, multiplexer optimization, dead-branch removal, DFF optimization, and removal of unused cells and wires.

The synthesis completed successfully without errors.

**Status: ✅ Logic synthesis completed.**

---

# 6. SKY130 Technology Mapping

Following synthesis and optimization, the generic logic was mapped to actual **SKY130 standard cells**.

Examples of cells appearing in the synthesized implementation include:

```text
sky130_fd_sc_hd__nand2_1
sky130_fd_sc_hd__nor2_1
sky130_fd_sc_hd__and2_0
sky130_fd_sc_hd__mux2_1
sky130_fd_sc_hd__xor2_1
sky130_fd_sc_hd__dfrtp_1
```

This stage converts the abstract synthesized logic into an implementation composed of cells available in the selected physical technology library.

The generated netlist therefore represents the design much more closely to how it would be implemented in an ASIC.

The synthesized design statistics also confirmed the presence of sequential and combinational cells.

For example, the synthesized `sequence_detector` design contained:

```text
Number of cells: 20

$logic_not
$mux
$not
$pmux
$reduce_or
$dff
```

The generated synthesized netlist was subsequently inspected to verify the mapped cell structure.

**Status: ✅ SKY130 technology mapping completed.**

---

# 7. Gate-Level Netlist Generation

After technology mapping and optimization, the final synthesized Verilog netlist was generated.

The netlist contains the actual mapped standard-cell instances instead of the original RTL behavioral descriptions.

The synthesized design was also inspected at different levels to verify:

* Top-level BabySoC structure
* RVMyth implementation
* Clock-gating logic
* Standard-cell based sequential logic
* Standard-cell based combinational logic

The generated netlist became the input for the next verification stage.

**Status: ✅ Gate-level netlist generated successfully.**

---

# 8. Post-Synthesis Gate-Level Simulation

The synthesized netlist was then verified using **post-synthesis gate-level simulation (GLS)**.

The same testbench used for functional verification was used with the synthesized design. However, instead of simulating the original RTL implementation, the simulator was given the synthesized gate-level netlist together with the required SKY130 Verilog cell models.

The basic verification structure was:

```text
Synthesized Gate-Level Netlist
             +
      SKY130 Cell Models
             +
          Testbench
             │
             ▼
       Icarus Verilog
             │
             ▼
       GLS Simulation
             │
             ▼
          VCD File
             │
             ▼
          GTKWave
```

The simulation was run using post-synthesis simulation options such as:

```text
-DPOST_SYNTH_SIM
-DFUNCTIONAL
-DUNIT_DELAY=#1
```

The resulting VCD file was opened in GTKWave and the important signals were examined.

The GLS waveform included signals such as:

* `clk`
* `reset`
* `din`
* `detected`
* `state`

For the BabySoC-level verification, the relevant output signals were also examined to compare the behavior against the RTL simulation.

**Status: ✅ Post-synthesis functional GLS completed.**

---

# 9. GLS Detection Results

During the gate-level simulation, the testbench successfully executed and produced detection events.

The simulation output reported detection events at multiple simulation times. The final simulation output showed:

```text
FINAL_DETECTION_COUNT=5
```

Therefore, the synthesized gate-level implementation produced **5 detection events** during the test.

The first observed detection event occurred at:

```text
TIME=343000 NS
```

with:

```text
DIN=0
DETECTED=1
```

This confirms that the synthesized implementation was able to reproduce the expected sequence-detection functionality during gate-level simulation.

**Status: ✅ GLS detection verified.**

---

# 10. RTL vs. Gate-Level Behavior

The RTL simulation and post-synthesis GLS were compared using the important functional signals.

The comparison focused on whether the same logical sequence and detection behavior were preserved after synthesis.

The gate-level simulation produced the expected detection sequence, demonstrating that the synthesis and technology-mapping process did not alter the intended functional behavior of the design for the given testbench.

Any differences observed at the exact transition level are associated with the gate-level representation and simulation model rather than a change in the intended logical functionality.

**Result: RTL functionality was preserved after synthesis for the tested simulation.**

---

# 11. Functional GLS vs. Timing GLS

The simulation performed in this project is **Functional Gate-Level Simulation (Functional GLS)**.

### Functional GLS

Functional GLS verifies that the synthesized standard-cell implementation performs the same logical operations as the RTL design.

It primarily checks:

* Correct state transitions
* Correct logical outputs
* Correct detection behavior
* Functional equivalence of the synthesized implementation

The simulation used functional standard-cell models and did not represent the complete physical interconnect delay of the final ASIC.

### Timing GLS

Timing GLS would additionally use timing information associated with the synthesized or physically implemented design.

It can be used to investigate:

* Propagation delays
* Setup violations
* Hold violations
* Clock-related timing behavior
* Effects of interconnect delays

Timing analysis and timing closure are therefore separate stages from the functional GLS performed here.

---

# 12. Synthesis Verification

The successful synthesis run was confirmed through the Yosys synthesis output and the generated synthesized netlist.

The netlist contained mapped sequential elements, including D-type flip-flops, demonstrating that the state-holding portions of the design were correctly inferred and mapped.

For the synthesized `sequence_detector`, the generated netlist contained **3 state-storage bits**.

Three bits are sufficient because an FSM with three state bits can represent up to:

```text
2³ = 8 states
```

which is sufficient for the FSM used in this sequence detector.

**Status: ✅ Sequential logic successfully inferred and mapped.**

---

# 13. Output Statistics

The Yosys synthesis statistics provide information about the resulting implementation, including:

* Number of wires
* Number of wire bits
* Number of public wires
* Number of ports
* Number of cells
* Sequential cells
* Combinational cells

For the synthesized `sequence_detector`, the reported design contained:

```text
Number of wires:       23
Number of wire bits:   39
Number of public wires: 6
Number of public bits: 10
Number of ports:       4
Number of port bits:   4
Number of cells:       20
```

The synthesis output also showed the inferred cell types, including:

```text
$dff
$logic_not
$mux
$not
$pmux
$reduce_or
```

These statistics were obtained from the synthesized design rather than the original RTL description.

---

# 14. Verification Progress

The project has progressed through the complete front-end verification flow:

```text
┌─────────────────────────────┐
│       RTL Design            │
└──────────────┬──────────────┘
               ↓
┌─────────────────────────────┐
│   RTL Functional Simulation │
└──────────────┬──────────────┘
               ↓
┌─────────────────────────────┐
│      Yosys Synthesis        │
└──────────────┬──────────────┘
               ↓
┌─────────────────────────────┐
│   SKY130 Technology Mapping │
└──────────────┬──────────────┘
               ↓
┌─────────────────────────────┐
│   Gate-Level Netlist        │
└──────────────┬──────────────┘
               ↓
┌─────────────────────────────┐
│   Functional GLS            │
└──────────────┬──────────────┘
               ↓
┌─────────────────────────────┐
│   RTL vs GLS Verification   │
└──────────────┬──────────────┘
               ↓
        ✅ FUNCTIONAL FLOW
          COMPLETED
               ↓
        🔜 STATIC TIMING
           ANALYSIS
```

---

# 15. Tools Used

The following tools and technologies were used throughout the flow:

* **Verilog HDL** – RTL design and hardware description
* **Icarus Verilog** – RTL and gate-level simulation
* **GTKWave** – VCD waveform analysis
* **Yosys** – RTL synthesis and optimization
* **ABC** – Logic optimization and technology mapping
* **SKY130** – Target ASIC standard-cell technology
* **Linux** – Development and execution environment
* **Oracle VirtualBox** – Virtualized Linux development environment

---

# 16. Current Status and Next Steps

The front-end ASIC flow has now been completed through functional gate-level verification.

### Completed

```text
RTL
 ↓
RTL Simulation
 ↓
Synthesis
 ↓
Technology Mapping
 ↓
Gate-Level Netlist
 ↓
Functional GLS
 ↓
Verification
```

### Next Stage

The next step is **Static Timing Analysis (STA)**.

After STA, the design can proceed toward the physical implementation stages:

```text
Static Timing Analysis
        ↓
Floorplanning
        ↓
Placement
        ↓
Clock Tree Synthesis
        ↓
Routing
        ↓
Physical Verification
        ↓
GDSII
```

---

# 17. Final Conclusion

The BabySoC design was successfully taken from RTL through synthesis, SKY130 technology mapping, gate-level netlist generation, and functional gate-level simulation. The GLS results, including the observed detection events, demonstrate that the synthesized implementation preserves the intended functional behavior of the RTL for the given testbench.

The project has therefore successfully completed the **RTL-to-functional-GLS stage**, with **Static Timing Analysis as the next step toward complete ASIC implementation and physical verification**.

