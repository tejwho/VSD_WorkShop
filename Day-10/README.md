# Day 10 – Physical Design Capstone: Power Planning, CTS, Timing & Routing

## Objective

This session brings together key physical-design concepts from the RTL-to-GDSII flow. The focus is on routing and its relationship with power planning, clock tree synthesis (CTS), setup/hold timing, interconnect RC delay, maze routing, and physical verification.

The supplied screenshots are organized below and linked from the local `images/` folder. Keep this folder alongside the README so that all images render correctly on GitHub.

---

## Contents

1. [Where Routing Sits in the Flow](#1-where-routing-sits-in-the-flow)
2. [Power Planning](#2-power-planning)
3. [Clock Tree Synthesis and Clock-Net Protection](#3-clock-tree-synthesis-and-clock-net-protection)
4. [Setup and Hold Timing](#4-setup-and-hold-timing)
5. [RC Delay Modeling](#5-rc-delay-modeling)
6. [Global Routing and Detailed Routing](#6-global-routing-and-detailed-routing)
7. [Maze Routing – Lee's Algorithm](#7-maze-routing--lees-algorithm)
8. [Routing Topology](#8-routing-topology)
9. [Design Rule Checking](#9-design-rule-checking)
10. [Summary](#10-summary)

---

## 1. Where Routing Sits in the Flow

A typical RTL-to-GDSII flow is:

```text
RTL
 ↓
Synthesis
 ↓
Floorplanning
 ↓
Power Planning
 ↓
Placement
 ↓
Clock Tree Synthesis (CTS)
 ↓
Global Routing
 ↓
Detailed Routing
 ↓
Parasitic Extraction
 ↓
Post-route Static Timing Analysis
 ↓
Physical Verification (DRC/LVS)
 ↓
GDSII
```

Placement determines where cells are located; routing then creates physical metal connections between their pins. Routing must obey technology design rules while balancing wirelength, congestion, timing, and access to pins.

## 2. Power Planning

Power planning builds the power distribution network (PDN) that supplies VDD and ground to the design. A typical network includes power rings, straps/mesh, and standard-cell rails.

Wire resistance causes voltage drop when current flows through the network:

\[
V_{drop} = I \times R
\]

A well-designed PDN provides reliable power to the cells while leaving sufficient routing resources for signal nets. Power structures and signal routing share the available metal layers, so their planning affects congestion.

## 3. Clock Tree Synthesis and Clock-Net Protection

Clock tree synthesis inserts buffers and builds a clock distribution network so the clock reaches sequential cells with controlled skew and transition time.

Clock nets are timing-sensitive because clock arrival differences affect setup and hold checks. Depending on the technology and design requirements, clock routing may use dedicated layers, wider wires, or shielding to reduce coupling and improve signal integrity.

## 4. Setup and Hold Timing

- **Setup check:** data must arrive early enough before the capturing clock edge. Setup analysis considers maximum data-path delay.
- **Hold check:** data must remain stable for the required interval after the capturing clock edge. Hold analysis considers minimum data-path delay.

A design must satisfy both checks. Passing setup does not guarantee hold closure, so both timing classes need to be examined.

## 5. RC Delay Modeling

Interconnects have resistance and capacitance. These parasitics contribute to signal delay, and their effect depends on wire length, geometry, layer, vias, and load.

The supplied RC-delay illustration is shown below.

![RC delay modeling](images/rc_delay.png)

Post-route parasitic extraction uses the routed geometry to support more realistic timing analysis than estimates based only on placement.

## 6. Global Routing and Detailed Routing

Routing is generally divided into two stages:

| Stage | Purpose |
|---|---|
| **Global routing** | Finds approximate paths and allocates routing resources across coarse routing regions. It helps estimate congestion and guide detailed routing. |
| **Detailed routing** | Converts the global route into exact wires and vias on specific tracks and metal layers while satisfying design rules. |

Global routing prioritizes whole-design planning and congestion awareness. Detailed routing handles geometric precision and design-rule legality.

## 7. Maze Routing – Lee's Algorithm

Lee's algorithm is a grid-based path-search method. It expands outward from a source, labeling reachable grid locations in successive wavefronts. When the target is reached, the route is reconstructed by tracing back through decreasing labels.

1. Start at the source grid cell.
2. Expand through legal neighboring cells, avoiding blocked cells.
3. Stop when the target is reached or no legal path remains.
4. Backtrace from target to source to recover the route.

![Maze routing – Lee's algorithm](images/maze_rout.png)

The method finds a shortest path in grid steps when movement costs are equal, but it can consume substantial time and memory on large grids.

## 8. Routing Topology

Routing topology describes how a net's pins are connected by a routing tree or path structure. A suitable topology can reduce wirelength and improve routability, especially for nets with multiple pins.

The workshop's routing-topology illustration is included below.

![Routing topology](images/routing_topo.png)

Topology selection is only one part of routing: the selected structure must still be assigned to legal routing tracks and implemented with wires and vias that satisfy the technology rules.

## 9. Design Rule Checking

Design Rule Checking (DRC) checks layout geometry against manufacturing constraints such as minimum width, spacing, via rules, and enclosure requirements. DRC is important because a visually plausible layout may still violate process rules.

### DRC result view

![DRC result view](images/drc_res.png)

### Final DRC view

![Final DRC view](images/final_drc.png)

These screenshots are included as the supplied workshop illustrations. A complete sign-off claim should be supported by the actual DRC tool report and its final violation count. DRC cleanliness alone does not establish timing closure or LVS correctness.

### Macro-cell floorplanning illustration

Macro placement affects routing access, congestion, and power connectivity. Macros should be placed with appropriate spacing and sufficient access for signal and power routing.

![Macro-cell floorplanning](images/macro_cell.png)

## 10. Summary

This session connects several physical-design stages:

- Power planning provides a reliable supply network.
- CTS distributes the clock while managing skew and transition time.
- Setup and hold checks verify timing constraints.
- RC parasitics explain why routed wires affect timing.
- Global routing plans approximate paths and routing resources.
- Detailed routing creates exact, design-rule-aware geometry.
- Maze routing and routing topology are important concepts behind path selection.
- DRC checks the final layout against manufacturing constraints.

The overall flow is iterative: floorplanning and placement influence congestion, routing affects parasitics and timing, and physical verification checks the resulting geometry.

---

**Images:** All screenshots used in this README are stored in the `images/` directory and referenced using relative Markdown paths.
