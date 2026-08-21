# Day 3 – RTL Synthesis Optimizations

## Overview

Day 3 of the VSDIAT RTL Design and Synthesis Workshop focused on understanding how synthesis tools optimize RTL and convert the design into an efficient gate-level implementation.

The experiments covered:

* Combinational logic optimization
* Boolean simplification
* Constant propagation
* Sequential logic optimization
* Optimization of constant-driven flip-flops
* Optimization across multiple modules
* Removal of unused sequential logic
* SKY130 standard-cell technology mapping

Tools used during the experiments:

* **Verilog HDL** – RTL design
* **Icarus Verilog** – RTL simulation
* **GTKWave** – waveform analysis
* **Yosys** – RTL synthesis and optimization
* **SKY130 HD** – standard-cell technology mapping

---

## 1. Combinational Logic Optimization

### Experiments

* `opt_check`
* `opt_check2`
* `opt_check3`
* `opt_check4`
* `multiple_module_opt`

These experiments demonstrate how synthesis optimizes combinational RTL by applying Boolean simplification and mapping the resulting logic to standard cells.

### Key observations

* Simplification of Boolean expressions
* Removal of redundant logic
* Mapping of optimized logic to appropriate SKY130 cells
* Optimization across module boundaries

### SKY130 Technology Mapping

The synthesized designs demonstrate mapping to cells such as:

* `sky130_fd_sc_hd__and2_0`
* `sky130_fd_sc_hd__or2_0`
* `sky130_fd_sc_hd__and3_1`
* `sky130_fd_sc_hd__xnor2_1`
* `sky130_fd_sc_hd__a21o_1`

---

## 2. Sequential Logic Optimization

### Experiments

* `dff_const1`
* `dff_const2`
* `dff_const3`
* `dff_const4`
* `dff_const5`

These experiments investigate how synthesis optimizes sequential circuits when constant values or constant relationships are present.

RTL simulations were analyzed using GTKWave, followed by synthesis and SKY130 technology mapping using Yosys.

### Key observations

The experiments demonstrate different synthesis outcomes depending on how the flip-flop outputs and sequential states are used.

In some cases, synthesis can propagate constant values and eliminate unnecessary sequential hardware.

In other cases, flip-flops must be retained because their state contributes to the observable behavior of the design.

This provides an important understanding of **sequential constant propagation and state optimization**.

---

## 3. Counter Optimization

### Experiments

* `counter_opt`
* `counter_opt2`

These experiments demonstrate how synthesis analyzes the observability of sequential state.

### `counter_opt`

The synthesized schematic shows that unnecessary counter state can be removed when it does not contribute to the required output.

### `counter_opt2`

The synthesized schematic retains multiple flip-flops because the corresponding counter state is required by the design outputs.

### Key learning

The amount of hardware synthesized depends not only on the RTL description but also on **which signals are actually observable and required by the design**.

---

## 4. RTL to ASIC Synthesis Flow

The experiments followed the RTL-to-gate synthesis flow:

```text
Verilog RTL
     ↓
RTL Simulation
     ↓
Icarus Verilog
     ↓
GTKWave
     ↓
Yosys Synthesis
     ↓
Logic Optimization
     ↓
SKY130 Technology Mapping
     ↓
Standard-Cell Implementation
```

---

## 5. VLSI / ASIC Perspective

These experiments demonstrate an important principle of RTL design:

> **The way RTL is written directly affects the hardware that synthesis produces.**

Synthesis performs several transformations to generate an efficient implementation, including:

* Constant propagation
* Boolean simplification
* Redundant logic removal
* Sequential optimization
* Dead-state elimination
* Logic restructuring
* Technology mapping

The final synthesized schematics show how the optimized RTL is implemented using cells from the **SKY130 HD standard-cell library**.

Understanding these optimizations is essential for writing RTL that is both **functionally correct and synthesis-friendly**.

---

## 6. Key Takeaways

### Combinational Optimization

* Synthesis can simplify Boolean expressions.
* Redundant logic can be eliminated.
* Equivalent logic can be mapped to efficient standard cells.

### Sequential Optimization

* Constant values can propagate through sequential logic.
* Unnecessary flip-flops can be removed.
* Functionally important state must be preserved.

### Counter Optimization

* Unused counter bits may be eliminated.
* Observable counter outputs require the corresponding state elements.
* Synthesis optimizes hardware based on functional requirements.

### Technology Mapping

* Optimized generic logic is mapped to cells available in the target technology.
* SKY130 standard cells provide the physical gate-level building blocks for the synthesized design.

---

## 7. Day 3 Completion

**Status: Completed**

Day 3 provided practical understanding of how RTL descriptions are transformed and optimized during synthesis, and how the optimized logic is mapped to SKY130 standard cells.
