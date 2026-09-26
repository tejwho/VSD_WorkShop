# VSD Physical Design – Module 3

## Design Library Cell using Magic Layout and ngspice Characterization

This repository contains the work completed for **VSD Physical Design Module 3**, covering CMOS inverter design, SPICE simulation, switching-threshold characterization, Magic layout, DRC verification, SPICE extraction and post-layout simulation using the SKY130A technology.

---

## Module Coverage

### SK1 – Labs for CMOS
- CMOS inverter SPICE deck creation
- DC analysis and simulation
- Voltage Transfer Characteristic (VTC)
- Switching Threshold Voltage (Vm)
- Static characterization
- Transient simulation
- Dynamic characterization

### SK2 – Inception of Layout
- CMOS fabrication process
- N-well and P-well formation
- Active region formation
- Gate formation
- Source and drain formation
- Local interconnect
- Higher-level metal layers

### SK3 – SKY130 Technology Files
- SKY130A technology and layout layers
- Magic layout environment
- DRC verification
- Metal3 design rules
- Layout extraction
- Extracted SPICE netlist
- Post-layout transient simulation
- Dynamic characterization

---

## CMOS Inverter Design Flow

```text
CMOS Inverter
      ↓
SPICE Deck
      ↓
DC Simulation
      ↓
VTC Characterization
      ↓
Switching Threshold (Vm)
      ↓
Magic Layout
      ↓
DRC Verification
      ↓
SPICE Extraction
      ↓
Post-Layout Simulation
      ↓
Rise/Fall Time
      ↓
Propagation Delay
```

---

## Practical Results

### Switching Threshold

The switching threshold was measured from the DC voltage-transfer characteristic.

**Vm = 1.329304 V**

### Dynamic Characterization

| Parameter | Measured Value |
|-----------|---------------:|
| Rise Time | 57.99 ps |
| Fall Time | 39.90 ps |
| TPHL | 26.19 ps |
| TPLH | 55.23 ps |

---

## Layout Verification

The CMOS inverter layout was created and verified using **Magic** with the **SKY130A** technology file.

DRC verification was performed using:

```text
drc check
drc count
drc why
```

The final layout verification reported:

```text
Total DRC errors found: 0
```

### Magic Layout / DRC

![Magic Layout and DRC](images/SK3_Magic_Layout_DRC_Clean.png)

---

## SPICE Extraction

The layout was extracted using Magic:

```text
extract all
```

The extracted layout was converted into a SPICE-compatible netlist using:

```text
ext2spice cthresh 0 rthresh 0
ext2spice
```

### SPICE Extraction

![SPICE Extraction](images/SK3_SPICE_Extraction.png)

---

## SPICE Deck and DC Characterization

### SPICE Deck

![SPICE Deck](images/SK1_SPICE_Deck.png)

### Switching Threshold (Vm)

![Switching Threshold](images/SK1_Switching_Threshold_Vm.png)

### VTC Characterization

![VTC Characterization](images/SK1_VTC_Characterization.png)

---

## CMOS Fabrication and Layout Concepts

### CMOS Inverter Structure

![CMOS Inverter Structure](images/CMOS_Inverter_Fabrication_Structure.png)

### Complete CMOS Process Flow

![CMOS Process Flow](images/SK2_Complete_CMOS_Process_Flow.png)

### SKY130 Metal3 Design Rules

![Metal3 Design Rules](images/SK3_Metal3_DRC_Rules.png)

---

## Post-Layout Simulation

The extracted netlist was used for post-layout transient simulation with ngspice.

### Post-Layout Transient Simulation

![Post Layout Transient Simulation](images/SK3_Post_Layout_Transient.png)

### Dynamic Characterization

![Dynamic Characterization](images/SK3_Dynamic_Characterization.png)

---

## Simulation

ngspice was used for:

- DC VTC analysis
- Switching threshold measurement
- Transient analysis
- Rise-time measurement
- Fall-time measurement
- Propagation-delay measurement

---

## Tools and Technology

- **Magic**
- **ngspice**
- **SKY130A PDK**
- **OpenLane environment**
- **Ubuntu Linux**

---

## Repository Structure

```text
VSD-Physical-Design-Module-3/
│
├── README.md
│
└── images/
    ├── CMOS_Inverter_Fabrication_Structure.png
    ├── SK1_SPICE_Deck.png
    ├── SK1_Switching_Threshold_Vm.png
    ├── SK1_VTC_Characterization.png
    ├── SK2_Complete_CMOS_Process_Flow.png
    ├── SK3_Magic_Layout_DRC_Clean.png
    ├── SK3_SPICE_Extraction.png
    ├── SK3_Post_Layout_Transient.png
    ├── SK3_Dynamic_Characterization.png
    └── SK3_Metal3_DRC_Rules.png
```

---

## References

The `images/` folder contains theory/reference figures and practical screenshots used to document the learning and implementation process.

The practical screenshots correspond to the CMOS inverter layout, DRC, extraction and ngspice characterization performed during the workshop.

---

## Conclusion

This module demonstrates the complete flow from **CMOS inverter design and SPICE characterization to physical layout, DRC verification, layout extraction and post-layout simulation** using open-source VLSI design tools and the SKY130A technology.
