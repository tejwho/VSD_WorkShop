# Day 1 – Verilog RTL Design and Functional Simulation

## Objective

The first session focused on understanding the basic RTL design and simulation workflow using Verilog HDL.

A simple **2:1 Multiplexer** was selected as the design example. The RTL was written in Verilog, simulated using Icarus Verilog, and the resulting signal transitions were analyzed using GTKWave.

The session also introduced the basic idea of synthesizing RTL using Yosys and observing how the design can be mapped toward standard-cell logic.

---

## 📑 Contents

1. Core Concepts
2. Functional Simulation Flow
3. Lab Environment and Execution
4. 2:1 Multiplexer Design
5. Synthesis Overview
6. Conclusion

---

# 1. Core Concepts

### Simulator

A simulator executes the Verilog design with different input conditions in a software environment. It allows the designer to verify whether the circuit behaves as expected before implementing it on actual hardware.

### Design

The design is the actual Verilog RTL module that describes the required hardware functionality.

### Testbench

A testbench is a separate Verilog module used for verification. It provides different input combinations to the design and allows the resulting outputs to be observed.

The testbench is normally not synthesized because its purpose is to verify the design rather than become part of the hardware.

---

# 2. Functional Simulation Flow

The basic simulation sequence used during the session was:

```text
Verilog Design + Testbench
          ↓
      Icarus Verilog
          ↓
      Simulation
          ↓
       .vcd File
          ↓
       GTKWave
          ↓
    Waveform Analysis

Icarus Verilog compiles the Verilog design together with its testbench.

The compiled simulation is then executed to generate a VCD (Value Change Dump) file. This file contains the changes in signal values during simulation.

GTKWave is then used to open the VCD file and visually examine the waveform.

3. Lab Environment and Execution
Environment

The workshop was performed using the Ubuntu-based VSDSquadron virtual machine environment.

Working directory:

~/sky130RTLDesignAndSynthesisWorkshop/verilog_files
Installing Icarus Verilog
sudo apt install iverilog
Installing GTKWave
sudo apt install gtkwave
Compiling the Design
cd sky130RTLDesignAndSynthesisWorkshop/verilog_files
iverilog good_mux.v tb_good_mux.v
Running the Simulation
./a.out

The simulation produces the corresponding VCD waveform file.

Opening the Waveform
gtkwave tb_good_mux.vcd

The waveform can then be examined to verify the behavior of the multiplexer.

4. 2:1 Multiplexer Design

A 2:1 multiplexer selects one of two input signals depending on the value of the select signal.

Verilog RTL
module good_mux (
    input i0,
    input i1,
    input sel,
    output reg y
);

always @ (*) begin
    if (sel)
        y <= i1;
    else
        y <= i0;
end

endmodule
Port Description
Signal	Direction	Function
i0	Input	Selected when sel = 0
i1	Input	Selected when sel = 1
sel	Input	Select/control signal
y	Output	Multiplexer output
Working

The always @(*) block is sensitive to changes in any signal used inside it.

When:

sel = 0 → y = i0
sel = 1 → y = i1

Therefore, the output always follows the input selected by the control signal.

5. Synthesis Using Yosys

After functional simulation, an introductory synthesis flow was performed using Yosys.

The Sky130 standard-cell library was loaded before technology mapping.

yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog good_mux.v
synth -top good_mux
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show

The show command generates a graphical representation of the synthesized design.

The synthesis step gives an initial understanding of how RTL logic can be transformed into lower-level standard-cell structures.

6. Conclusion

Day 1 introduced the fundamental RTL design and verification loop using a 2:1 multiplexer.

The complete process covered writing the Verilog design, creating a testbench, compiling with Icarus Verilog, generating a VCD file, inspecting the waveform using GTKWave, and performing an introductory synthesis using Yosys and the Sky130 library.

This session established the basic workflow required for the more advanced synthesis and sequential-logic concepts covered in the following sessions.
