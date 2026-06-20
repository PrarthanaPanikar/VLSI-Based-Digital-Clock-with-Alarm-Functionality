# ⏰ VLSI-Based Digital Clock with Alarm Functionality

**Designed, simulated, and synthesized a VLSI-Based Digital Clock with Alarm Functionality using Verilog HDL, GTKWave, and Yosys. A great hands-on experience in counters, clock management, alarm logic, RTL verification, and synthesis. Special thanks to Umesh Yadav Sir for his guidance**. ⏰🚀 

<p align="center">
  <img src="https://img.shields.io/badge/Verilog-HDL-blue" />
  <img src="https://img.shields.io/badge/Yosys-Synthesis-green" />
  <img src="https://img.shields.io/badge/GTKWave-Verification-orange" />
  <img src="https://img.shields.io/badge/VLSI-Digital%20Design-red" />
</p>

---

# 📌 Navigation

* [Project Overview](#-project-overview)
* [Problem Statement](#-problem-statement)
* [Objectives](#-objectives)
* [Industry Relevance](#-industry-relevance)
* [System Architecture](#-system-architecture)
* [Design Flow](#-design-flow)
* [Project Structure](#-project-structure)
* [RTL Modules](#-rtl-modules)
* [Simulation Results](#-simulation-results)
* [How to Run](#-how-to-run)
* [Tools Used](#-tools-used)
* [Learning Outcomes](#-learning-outcomes)
* [Future Improvements](#-future-improvements)
* [Author](#-author)

---

# 📖 Project Overview

This project implements a **Digital Clock with Alarm Functionality** using **Verilog HDL** and verifies the design through simulation and synthesis.

The clock maintains:

* Hours (0–23)
* Minutes (0–59)
* Seconds (0–59)

The design also includes:

* Alarm Time Configuration
* Alarm Enable Logic
* Alarm Comparator
* Seven Segment Display Decoder
* RTL Verification
* Waveform Analysis
* Yosys Synthesis

---

# ❓ Problem Statement

Digital timing systems are fundamental components in:

* Digital Watches
* Real-Time Clock Systems
* FPGA Controllers
* Industrial Automation
* Embedded Systems

The objective is to design a synthesizable digital clock capable of maintaining accurate time and generating an alarm signal when a preset alarm time matches the current time.

---

# 🎯 Objectives

✔ Design a parameterized digital clock

✔ Implement HH:MM:SS counting

✔ Generate alarm trigger signal

✔ Verify functionality using GTKWave

✔ Synthesize using Yosys

✔ Create reusable RTL modules

✔ Demonstrate FPGA/VLSI design concepts

---

# 🏭 Industry Relevance

The concepts used in this project are widely adopted in:

| Application           | Usage              |
| --------------------- | ------------------ |
| Digital Watches       | Timekeeping        |
| Smart Appliances      | Scheduling         |
| Embedded Controllers  | Event Timing       |
| FPGA Systems          | Clock Management   |
| Industrial Automation | Timers & Alarms    |
| Consumer Electronics  | User Notifications |

---

# 🏗 System Architecture

```text
Clock Input
      │
      ▼
Clock Enable Generator
      │
      ▼
Time Core
(HH:MM:SS Counter)
      │
      ▼
Alarm Comparator
      │
      ▼
Alarm Output
```

---

# 🔄 Design Flow

```text
System Clock
     │
     ▼
Clock Enable Generator
     │
     ▼
Seconds Counter
     │
     ▼
Minutes Counter
     │
     ▼
Hours Counter
     │
     ▼
Alarm Comparator
     │
     ▼
Alarm Output
```

---

# 📂 Project Structure

```text
VLSI-Digital-Clock-Alarm/
│
├── rtl/
│   ├── clk_en.v
│   ├── time_core.v
│   ├── alarm_fsm.v
│   ├── seg_mux.v
│   ├── buzzer.v
│   └── top.v
│
├── tb/
│   ├── clock_tb.v
│   └── alarm_tb.v
│
├── scripts/
│   └── synth.ys
│
├── simulation/
│
├── reports/
│   ├── top.json
│   └── top_rtl.dot
│
├── images/
│
├── docs/
│
├── .gitignore
└── README.md
```

---

# 🧩 RTL Modules

## 1. Clock Enable Generator

**File:** `clk_en.v`

Generates periodic tick pulses from the system clock.

### Function

```text
System Clock
     ↓
 Tick Pulse
```

---

## 2. Time Core

**File:** `time_core.v`

Maintains:

```text
HH : MM : SS
```

Features:

* Second rollover
* Minute rollover
* Hour rollover
* 24-Hour Format

---

## 3. Alarm Comparator

**File:** `alarm_fsm.v`

Compares:

```text
Current Time
      ==
Alarm Time
```

If match occurs:

```text
alarm_out = 1
```

---

## 4. Seven Segment Decoder

**File:** `seg_mux.v`

Converts numerical values into seven-segment display outputs.

---

## 5. Top Module

**File:** `top.v`

Integrates all submodules into one synthesizable design.

---

# 📊 Simulation Results

## Clock Counting Verification

<p align="center">
  <img src="images/05_waveform_seconds_counting.png" width="900">
</p>

Verified:

* Second Increment
* Minute Increment
* Clock Progression

---

## Minute Rollover Verification

<p align="center">
  <img src="images/06_waveform_minute_rollover.png" width="900">
</p>

Verified:

```text
00:00:59
      ↓
00:01:00
```

---

## Alarm Trigger Verification

<p align="center">
  <img src="images/08_alarm_trigger_waveform.png" width="900">
</p>

Verified:

```text
Current Time = Alarm Time
```

Result:

```text
alarm_out = 1
```

---

# ▶️ How to Run

## Compile

```bash
iverilog -o simulation/clock_sim tb/clock_tb.v rtl/time_core.v
```

## Run

```bash
vvp simulation/clock_sim
```

## Open GTKWave

```bash
gtkwave simulation/clock.vcd
```

---

## Run Synthesis

```bash
yosys -s scripts/synth.ys
```

---

# 🛠 Tools Used

| Tool           | Purpose           |
| -------------- | ----------------- |
| Verilog HDL    | RTL Design        |
| Icarus Verilog | Simulation        |
| GTKWave        | Waveform Analysis |
| Yosys          | Synthesis         |
| Graphviz       | RTL Visualization |
| VS Code        | Development       |

---

# 📚 Learning Outcomes

Through this project I learned:

* Verilog RTL Design
* Counter Design
* Sequential Logic
* Comparator Design
* Digital Timekeeping Systems
* Waveform Debugging
* Yosys Synthesis Flow
* RTL Visualization
* FPGA Design Methodology

---

# 🚀 Future Improvements

* 12-Hour / 24-Hour Mode
* Snooze Functionality
* Multiple Alarms
* FPGA Board Deployment
* Buzzer Driver Integration
* Stopwatch Mode
* Date & Calendar Support
* LCD/OLED Interface

---

# 👩‍💻 Author

**Prarthana Panikar**

Second Year Computer Science Engineering Student

Passionate about:

* VLSI Design
* FPGA Development
* Embedded Systems
* Digital Design
* AIML

---

⭐ If you found this project useful, consider giving it a star!
