# Day-8 - Design Library Cell using Magic Layout and ngspice Characterization

## Overview

This module focuses on the design and characterization of a CMOS standard-cell inverter using the **SKY130A technology** and open-source VLSI tools.

The practical work covers:

- CMOS inverter SPICE deck creation
- DC simulation and Voltage Transfer Characteristic (VTC)
- Switching threshold measurement
- CMOS fabrication and layout concepts
- Magic layout and DRC verification
- Layout-to-SPICE extraction
- Post-layout transient simulation
- Dynamic characterization
- Rise time, fall time and propagation delay measurement

The overall objective is to understand the flow from a **transistor-level CMOS circuit to a verified physical layout and characterized cell**.

---

# 1. CMOS Inverter Fundamentals

A CMOS inverter consists of a PMOS pull-up device and an NMOS pull-down device.

The input is connected to both transistor gates and the output is taken from the common drain connection.

### CMOS Inverter Structure

![CMOS Inverter Structure](images/cmos_inverter_structure.png)

The inverter performs the following logic operation:

| Input | Output |
|:---:|:---:|
| 0 | 1 |
| 1 | 0 |

The PMOS pulls the output towards VDD when the input is low, while the NMOS pulls the output towards ground when the input is high.

---

# 2. SK1 – Labs for CMOS

## 2.1 SPICE Deck Creation

A SPICE deck describes the CMOS inverter at the circuit level and defines:

- PMOS and NMOS devices
- Transistor dimensions
- Supply voltage
- Input stimulus
- Output load
- Simulation commands
- Technology models

### SPICE Deck

![SPICE Deck](images/SK1_SPICE_Deck_and_Simulation.png)

A typical CMOS inverter netlist contains the PMOS and NMOS connected between the supply rails with the common node forming the output.

---

## 2.2 DC Simulation and VTC

A DC sweep was performed by varying the input voltage and observing the output voltage.

The resulting **Voltage Transfer Characteristic (VTC)** shows the transition from the logic-high output region to the logic-low output region.

### VTC Characterization

![VTC Characterization](images/SK1_L3_Switching_Threshold_VTC.png)

The VTC is useful for identifying the switching behaviour and voltage characteristics of the inverter.

---

## 2.3 Switching Threshold Voltage (Vm)

The switching threshold voltage is the input voltage at which the inverter changes its dominant logic state.

For the performed SKY130A DC characterization:

```text
Vm = 1.329304 V
```

The value was measured using ngspice from the DC simulation.

### Switching Threshold Measurement

![Switching Threshold Vm](images/SK1_L3_Switching_Threshold_Vm.jpg)

---

## 2.4 Static Characterization

The DC characteristics of the CMOS inverter can be used to study:

- Switching threshold voltage
- Input/output voltage levels
- Logic-high and logic-low behaviour
- Noise-margin-related voltage regions

The VTC provides the main graphical representation of these static characteristics.

---

# 3. SK2 – Inception of Layout

## 3.1 CMOS Fabrication Process

The physical CMOS structure is formed through a sequence of semiconductor fabrication steps involving:

- Oxidation
- Photolithography
- Well formation
- Doping
- Etching
- Gate formation
- Source/drain formation
- Metallization

### Complete CMOS Process Flow

![Complete CMOS Process Flow](images/SK2_Complete_CMOS_Process_Flow.png)

The fabrication sequence converts the device structure from a semiconductor substrate into a complete interconnected CMOS circuit.

---

## 3.2 CMOS Layout Concept

At the layout level, the transistor structure is represented using technology-specific layers.

Important layout regions include:

- N-well
- P-well / substrate
- Active regions
- Polysilicon
- Contacts
- Metal interconnects

The layout must follow the design rules defined by the selected process technology.

---

# 4. SK3 – SKY130 Technology and Magic Layout

## 4.1 SKY130A Technology

The practical layout was performed using the **SKY130A** technology information with Magic.

Magic provides a graphical environment for creating and checking physical layout geometry.

The technology file defines the available layers and their associated design rules.

---

## 4.2 Magic CMOS Inverter Layout

The CMOS inverter layout was opened in Magic using the SKY130A technology file.

The layout contains the physical structures corresponding to the CMOS inverter.

### Magic Layout

![Magic Layout](images/SK3_L1_Magic_Layout_DRC_Clean.png)

---

## 4.3 DRC Verification

Design Rule Checking (DRC) was performed in Magic to verify that the layout satisfies the technology design rules.

The following commands were used:

```text
drc check
drc count
```

The final verification reported:

```text
Total DRC errors found: 0
```

Therefore, the inverter layout passed the performed Magic DRC check.

---

## 4.4 Metal3 Design Rules

The SKY130 technology contains multiple metal layers with specific geometrical and spacing requirements.

The Metal3 examples below illustrate correct and incorrect geometries according to the applicable design rules.

### Metal3 DRC Rules

![Metal3 DRC Rules](images/SK3_Metal3_DRC_Rules.png)

---

# 5. Layout Extraction

After DRC verification, the physical layout was extracted to generate an electrical representation of the layout.

The Magic extraction command used was:

```text
extract all
```

The extracted file was then converted into a SPICE-compatible representation using:

```text
ext2spice cthresh 0 rthresh 0
ext2spice
```

### SPICE Extraction

![SPICE Extraction](images/SK3_L2_SPICE_Extraction.png)

This produces a netlist containing the devices and parasitic information represented by the extracted layout.

---

# 6. Post-Layout SPICE Simulation

The extracted SPICE representation was used for post-layout simulation with ngspice.

This step verifies the electrical behaviour of the physical layout rather than only the ideal transistor-level circuit.

The transient simulation applies a switching input and observes the corresponding output response.

### Post-Layout Transient Simulation

![Post-Layout Transient Simulation](images/SK3_L3_Post_Layout_Transient.png)

The waveform shows the expected complementary behaviour of the CMOS inverter:

- Input HIGH → Output LOW
- Input LOW → Output HIGH

---

# 7. Dynamic Characterization

Dynamic characterization determines how quickly the inverter responds to changes at its input.

The important parameters measured are:

- Rise time
- Fall time
- Low-to-high propagation delay
- High-to-low propagation delay

### Dynamic Characterization

![Dynamic Characterization](images/SK3_L4_Dynamic_Characterization.jpg)

Measured values from the ngspice simulation:

| Parameter | Value |
|---|---:|
| Rise Time | 57.99 ps |
| Fall Time | 39.90 ps |
| TPHL | 26.19 ps |
| TPLH | 55.23 ps |

The measurements were obtained using ngspice `.meas tran` commands with defined voltage thresholds.

---

# 8. Complete Practical Flow

The practical flow followed in this module can be summarized as:

```text
CMOS Inverter Design
        ↓
SPICE Deck Creation
        ↓
DC Simulation
        ↓
VTC Characterization
        ↓
Switching Threshold (Vm)
        ↓
CMOS Layout in Magic
        ↓
DRC Verification
        ↓
SPICE Extraction
        ↓
Post-Layout Simulation
        ↓
Dynamic Characterization
        ↓
Rise/Fall Time & Propagation Delay
```

---

# 9. Important Commands

## Open the SKY130A Layout

```bash
magic -T $PDK_ROOT/sky130A/libs.tech/magic/sky130A.tech sky130_inv.mag &
```

## Magic DRC

```text
drc check
drc count
```

## Layout Extraction

```text
extract all
```

## Convert Extraction to SPICE

```text
ext2spice cthresh 0 rthresh 0
ext2spice
```

## Run ngspice

```bash
ngspice sky130_inv.spice
```

---

# 10. Characterization Results

### Static Characterization

```text
Switching Threshold (Vm) = 1.329304 V
```

### Dynamic Characterization

```text
Rise Time  = 57.99 ps
Fall Time  = 39.90 ps
TPHL       = 26.19 ps
TPLH       = 55.23 ps
```

### DRC

```text
Total DRC errors found: 0
```

These results document the electrical characterization and physical verification performed for the CMOS inverter.

---

# 11. Tools and Technology

| Tool / Technology | Purpose |
|---|---|
| Magic | Physical layout and DRC |
| ngspice | SPICE simulation and characterization |
| SKY130A | Semiconductor process technology |
| OpenLane environment | VLSI physical-design environment |
| Ubuntu Linux | Development environment |

---

# 12. Repository Structure

```text
Day-8/
│
├── README.md
│
└── images/
    ├── cmos_inverter_structure.png
    ├── SK1_L3_Switching_Threshold_Vm.jpg
    ├── SK1_L3_Switching_Threshold_VTC.png
    ├── SK1_SPICE_Deck_and_Simulation.png
    ├── SK2_Complete_CMOS_Process_Flow.png
    ├── SK3_L1_Magic_Layout_DRC_Clean.png
    ├── SK3_L2_SPICE_Extraction.png
    ├── SK3_L3_Post_Layout_Transient.png
    ├── SK3_L4_Dynamic_Characterization.jpg
    └── SK3_Metal3_DRC_Rules.png
```

---

# 13. Key Learnings

- A CMOS inverter can be characterized at both static and dynamic levels.
- SPICE decks define the transistor-level circuit, stimulus, load and simulation conditions.
- DC analysis provides the Voltage Transfer Characteristic.
- The switching threshold can be extracted from the inverter VTC.
- Physical layout converts the transistor-level circuit into technology-specific geometry.
- Magic can be used for SKY130A layout inspection and DRC verification.
- Layout extraction converts physical geometry into an electrical netlist.
- Post-layout simulation includes the extracted layout representation in the electrical analysis.
- Rise time, fall time and propagation delay are important dynamic characterization parameters.
- Characterization data forms an important part of standard-cell library development.

---

# Conclusion

This module demonstrates the practical flow of designing and characterizing a CMOS inverter using open-source VLSI tools.

The work progresses from **SPICE circuit design and DC characterization to Magic physical layout, DRC verification, SPICE extraction and post-layout transient characterization** using the SKY130A technology.

The final results include a measured switching threshold of **1.329304 V**, zero reported DRC errors, and measured dynamic timing parameters from the ngspice simulation.
