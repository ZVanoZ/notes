# CW100 Series Frequency Inverter User Manual

**CTRL-DRIVE CW100 Series VFD English Manual V1.0**

Thank you for purchasing the VFD.

Read and understand the manual before use and forward the manual to the end user.

Before use, please read **the safety precautions** carefully.

Please keep this manual carefully for consulting if necessary. If you have any doubt, please contact our customer service or technical support, our professional will serve you wholeheartedly.

This manual provides information about CW100 series frequency inverters, including:

- Safety information and precautions
- Installation and inspection
- Wiring instruction
- Operation instruction
- Communication protocol specification
- Maintenance and troubleshooting

This manual is suitable for the following users:

- System design and selection personnel
- Installation or wiring personnel
- Debugging personnel
- Maintenance personnel

> Source: [Scribd — CTRL-DRIVE CW100 Series VFD English Manual V1.0](https://ru.scribd.com/document/713397016/CTRL-DRIVE-CW100-Series-VFD-English-Manual-V1-0-Replicable4). Full text converted from the identical 44-page manufacturer PDF: [CNCDrive VFD CW100 manual](https://shop.cncdrive.hu/cmproductsdownloader.php?field=document1&product=1265-cw-100-frekvenciavalto-4-kw-motorhoz-3-fazisu) (also published as `https://cncdrive.com/downloads/VFD%20CW100_manual.pdf`).

---

## Contents

- [Chapter 1 Safety Information and Precautions](#chapter-1-safety-information-and-precautions)
  - [1.1 Safety Information and Precautions](#11-safety-information-and-precautions)
  - [1.2 Operation Precautions](#12-operation-precautions)
- [Chapter 2 Product Information](#chapter-2-product-information)
  - [2.1 Designation Rules](#21-designation-rules)
  - [2.2 Technical Specifications](#22-technical-specifications)
  - [2.3 Installation Environment Requirements](#23-installation-environment-requirements)
- [Chapter 3 Installation Guide](#chapter-3-installation-guide)
  - [3.1 Product Size Diagram](#31-product-size-diagram)
  - [3.2 Product Installation Diagram](#32-product-installation-diagram)
- [Chapter 4 Wiring Instructions](#chapter-4-wiring-instructions)
  - [4.1 Interface and Terminal Instructions](#41-interface-and-terminal-instructions)
  - [4.2 Reference Wiring Diagram](#42-reference-wiring-diagram)
- [Chapter 5 Operation Panel](#chapter-5-operation-panel)
  - [5.1 Appearance Diagram](#51-appearance-diagram)
  - [5.2 Description of Indicators](#52-description-of-indicators)
  - [5.3 Description of Keys on the Operation Panel](#53-description-of-keys-on-the-operation-panel)
- [Chapter 6 Function Parameter Table](#chapter-6-function-parameter-table)
- [Chapter 7 Maintenance and Troubleshooting](#chapter-7-maintenance-and-troubleshooting)
  - [7.1 Fault Description](#71-fault-description)
  - [7.2 Troubleshooting List](#72-troubleshooting-list)
  - [7.3 Faults and Solutions](#73-faults-and-solutions)
  - [7.4 Braking Resistance Specification](#74-braking-resistance-specification)

---

## Chapter 1 Safety Information and Precautions

### 1.1 Safety Information and Precautions

- It is forbidden to use the device near water, corrosive gas, combustible gas, inflammable and explosive materials, otherwise it will cause electric shock, combustion or explosion.
- Prohibit the use of this device in places that restrict or prohibit the use of this device, otherwise it may lead to an accident.
- The high voltage of the frequency inverter will remain for a period of time after the power is off. Please do not remove the wire or touch the terminal within 3 minutes of power off, otherwise there is a danger of electric shock.
- Make sure that the earth terminal of the inverter is grounded reliably. Otherwise, there is a risk of electric shock.
- Do not contact with the internal components and circuits of the frequency inverter. Otherwise, there is a risk of electric shock.
- It is forbidden to modify the internal parts or circuits of the frequency inverter.
- This series of inverters are used to control ordinary asynchronous motor and frequency conversion asynchronous motor, not for single-phase motor and other applications.
- Do not use damaged inverter, otherwise it may cause an accident.
- Please select a safe position to install servo inverter to prevent direct exposure to high temperature and sunlight, avoid dampness, splash of water droplets and erosion of various oils, avoid metal powder or iron chips into the inverter.

### 1.2 Operation Precautions

- It must be connected, installed and operated by a professional.
- Wiring shall not be connected when the power supply is turned on, otherwise it may cause electrical shock or injury to personnel.
- Terminal voltage and polarity must be applied to prevent damage to equipment or injury to personnel.
- Please do not pass the power line and signal line through the same pipe, and do not tie them together.
- Frequency inverter must be matched with the asynchronous motor, and maintain good heat-dissipation conditions.
- Do not touch the heat sink and brake resistor of the inverter while running, otherwise you may burn.
- Please do not switch power supply frequently, it is best to control the interval of more than 1 minute.
- The AC power supply is prohibited from being connected to the output terminals U, V, W of the frequency inverter, otherwise the internal damage of the frequency inverter can be caused.

---

## Chapter 2 Product Information

Upon receipt of the goods, please examine the following items carefully:

- Whether the type of frequency inverter is correct.
- Whether the appearance is damaged.

### 2.1 Designation Rules

**Model Number Instruction**

![Model number instruction for CW100 series](assets/model-number-instruction.png)

Example: `CW100-T2.2GB`

| Segment | Meaning | Codes |
| --- | --- | --- |
| CW100 | Model series | CW100 |
| T | Input level | **S** — 1 phase 220 V; **T** — 3 phase 380 V |
| 2.2GB | Rated power | **0.7GB** — 0.75 kW; **1.5GB** — 1.5 kW; **2.2GB** — 2.2 kW; **4.0GB** — 4 kW; **5.5GB** — 5.5 kW; **7.5GB** — 7.5 kW; **11.0GB** — 11 kW |

### 2.2 Technical Specifications

| Model | Power supply capacity (kVA) | Input current (A) | Output current (A) | Adaptable motor (kW) | Adaptable motor (HP) |
| --- | ---: | ---: | ---: | ---: | ---: |
| **One-phase power supply: 220 V, 50 Hz / 60 Hz** | | | | | |
| CW100-0D75-1 | 1.5 | 8.2 | 4.0 | 0.75 | 1 |
| CW100-1D5-1 | 3.0 | 14.0 | 7.0 | 1.5 | 2 |
| CW100-2D2-1 | 4.0 | 23.0 | 9.6 | 2.2 | 3 |
| **Three-phase power supply: 380 V, 50 Hz / 60 Hz** | | | | | |
| CW100-0D75-4 | 1.5 | 3.4 | 2.1 | 0.75 | 1 |
| CW100-1D5-4 | 3.0 | 5.0 | 3.8 | 1.5 | 2 |
| CW100-2D2-4 | 4.0 | 5.8 | 5.1 | 2.2 | 3 |
| CW100-4D0-4 | 5.9 | 10.5 | 9.0 | 4.0 | 5 |
| CW100-5D5-4 | 8.9 | 14.6 | 13.0 | 5.5 | 7.5 |
| CW100-7D5-4 | 11.0 | 20.5 | 17.0 | 7.5 | 10 |
| CW100-11D0-4 | 17.0 | 26.0 | 25.0 | 11.0 | 15 |

### 2.3 Installation Environment Requirements

| Item | Requirement |
| --- | --- |
| Ingress protection grade | IP20 |
| Installation height | The maximum is 1000 m (3280 ft) at sea level. If the installation height is above this value, the current should be reduced by 1.2% for every 10 m (328 ft) increase in height. |
| Ambient temperature at running | 0–40 °C (32–104 °F) |
| Temperature at storage | −20–55 °C (−4–131 °F) |
| Temperature at transportation | −20–60 °C (−4–140 °F) |
| Air humidity at running | 5%–85%, no condensation or freezing |
| Air humidity at storage | 5%–95% |

---

## Chapter 3 Installation Guide

### 3.1 Product Size Diagram

Installation dimension diagram of outer panel. Mounting hole dimension: **82 × 61 mm**.

![Outer panel mounting dimensions](assets/outer-panel-mounting.png)

Outer panel outline: **66 × 87 mm**, with four corner mounting holes.

### 3.2 Product Installation Diagram

#### CW100-0.75 kW–2.2 kW

![Product dimensions, CW100 0.75–2.2 kW](assets/dimensions-0.75-2.2kw.png)

Approximate dimensions from the drawing: width **85 mm**, height **142 mm**, depth about **110.5–116.35 mm** (including panel knob). Mounting hole spacing about **79 × 136 mm**.

#### CW100-4 kW–5.5 kW

![Product dimensions, CW100 4–5.5 kW](assets/dimensions-4-5.5kw.png)

Approximate dimensions from the drawing: width **95 mm**, height **180 mm**, depth about **96.5–120 mm**. Mounting hole spacing about **88.5 × 174 mm**.

#### CW100-7.5 kW–11.0 kW

![Product dimensions, CW100 7.5–11.0 kW](assets/dimensions-7.5-11kw.png)

Approximate dimensions from the drawing: width **107 mm**, height **240 mm**, mounting hole spacing about **96 × 230 mm**.

---

## Chapter 4 Wiring Instructions

### 4.1 Interface and Terminal Instructions

#### 4.1.1 Main Circuit Terminals

**Table 4-1. Interface and terminal function description**

| Terminal | Name | Function description |
| --- | --- | --- |
| R, S, T | AC power input terminal | Connect the input three-phase AC power supply. For 220 V single-phase, connect R and T. |
| P+, PB | Brake resistor terminal | Connect brake resistor. |
| U, V, W | Output terminal | Connect three-phase motor. |
| ⊕ | Earth terminal | Grounding connection. |

#### 4.1.2 Control Circuit Terminals

![Sketch 4-1. Control circuit terminal diagram](assets/control-circuit-terminals.png)

**Table 4-2. CW100 description of control circuit terminals**

| Item | Terminal | Name | Function description |
| --- | --- | --- | --- |
| Power supply | 10V–GND | External 10 V power supply | Provide +10 V power supply to external unit. Generally, it provides power supply to external potentiometer with resistance range of 1–5 kΩ. Maximum output current: 10 mA. |
| Power supply | 24V–GND | External 24 V power supply | Provide +24 V power supply to external unit. Generally, it provides power supply to DI/DO terminals and external sensors. Maximum output current: 200 mA. |
| Analog input | AI1–GND | Analog input terminal 1 | Input range: DC 0 V–10 V / 0 mA–20 mA, decided by P4-39. Resistance input: 22 kΩ (voltage input), 500 Ω (current input). |
| Digital input | DI1–GND | Digital input 1 | Resistance input: 1 kΩ. |
| Digital input | DI2–GND | Digital input 2 | Voltage range for level input: 5–30 V. |
| Digital input | DI3–GND | Digital input 3 | Voltage range for level input: 5–30 V. |
| Digital input | DI4–GND | Digital input 4 | Voltage range for level input: 5–30 V. |
| Digital input | DI5–GND | High-speed pulse input terminal | Besides features of DI1–DI4, it can be used for high-speed pulse input. Maximum input frequency: 20 kHz. |
| Analog output | AOV–GND | Analog output | Output voltage range: 0–10 V. |
| Analog output | AOI–GND | Analog output | Output current range: 0–20 mA. |
| Digital output | DO1–GND | Digital output 1 | Optical coupling isolation, dual polarity open collector output. Output voltage range: 0–24 V. Output current range: 0–50 mA. |
| Digital output | FM–GND | High-speed pulse output | It is limited by F5-00 (FM terminal output mode selection). As high-speed pulse output, the maximum frequency hits 20 kHz. As open-collector output, its specification is the same as that of DO1. |
| Relay | TA–TC | Relay NO terminal | Contact driving capacity: 250 Vac, 3 A, COSØ = 0.4; 30 Vdc, 1 A. |
| Communication | A+–B− | 485 communication terminal | MODBUS-RTU protocol communication input and output signal terminals. |

### 4.2 Reference Wiring Diagram

![Reference wiring diagram](assets/reference-wiring-diagram.png)

Power and motor (top of the drive):

- **R, S, T** — three-phase 380 V power input (or single-phase 220 V on R and T).
- **P+, BR/PB** — braking resistor.
- **U, V, W** — motor **M**.
- Chassis and motor earth terminals must be grounded.

Control terminals (typical layout on the drawing):

- **DI1–DI4** — multifunctional terminal signal inputs 1–4.
- **DI5** — high-speed pulse input HDI.
- **+10V, AI1, AI2, GND** — analog reference and analog inputs 0–10 V / 0–20 mA (AI1 shown with a potentiometer).
- **A+, B−** — RS485 communication.
- **AOV** — voltage-type analog output 0–10 V; **AOI** — current-type analog output 0–20 mA.
- **FM, CME** — high-speed pulse output (optocoupler).
- **DO1, GND** — open-collector output (optocoupler).
- **TA, TC** — relay output 1 (normally open).

---

## Chapter 5 Operation Panel

### 5.1 Appearance Diagram

![Operation panel appearance](assets/operation-panel.png)

### 5.2 Description of Indicators

1. **RUN:** ON indicates that the AC drive is in the running state, and OFF indicates that the AC drive is in the stop state.
2. **LOC:** It indicates whether the AC drive is operated by means of operation panel, terminals or communication.
3. **F/R:** ON indicates reverse rotation.
4. **Hz, A, V:** Unit indicators. They indicate the temporary display unit, which has the following units:
   - **Hz:** unit of frequency
   - **A:** unit of current
   - **V:** unit of voltage
   - **Hz + A:** unit of rotational speed
   - **A + V:** % percentage

### 5.3 Description of Keys on the Operation Panel

| Key | Name | Function |
| --- | --- | --- |
| PROG / PRG | Programming | Enter or exit Level I menu. |
| M-FUN | Multifunction selection | Function switch selection. It can be defined as a command source, or as a fast direction switch, according to P7-01. |
| ▲ | Increment | Increase data or function code. |
| ▼ | Decrement | Decrease data or function code. |
| SHIFT | Shift | Select the displayed parameters in turn in the stop or running state, and select the digit to be modified when modifying parameters. |
| ENTER | Confirm | Enter the menu interfaces level by level, and confirm the parameter setting. |
| RUN | Run | Start the AC drive in the operation panel control mode. |
| STOP / REST | Stop | Stop the AC drive when it is in the running state and perform the reset operation when it is in the fault state. The functions of this key are restricted in P7-02. |

---

## Chapter 6 Function Parameter Table

### 6.1 Brief introduction of function code

If **PP-00** is set to a non-zero number, parameter protection is enabled. You must enter the correct user password to enter the menu. To cancel the password protection function, enter with password and set **PP-00** to 0.

> The printed manual also writes “FP-00” in this sentence; the function-code table itself uses **PP-00** for the user password.

Group **P** and Group **A** are standard function parameters. Group **U** is the monitoring function parameters.

The symbols in the function code table are described as follows:

| Symbol | Meaning |
| --- | --- |
| ☆ | The parameter can be modified when the AC drive is in either stop or running state. |
| ★ | The parameter cannot be modified when the AC drive is in the running state. |
| ● | The parameter is the actually measured value and cannot be modified. |
| \* | The parameter is factory parameter and can be set only by the manufacturer. |

**Table 6-1. Standard function parameters**

### P0 Standard Function Parameters

| Function code | Parameter name | Setting range | Default | Property |
| --- | --- | --- | --- | --- |
| P0-01 | Motor control mode | 0: Sensorless flux vector control (SFVC)<br>2: V/F control | 2 | ★ |
| P0-02 | Command source selection | 0: Operation panel control (LED off)<br>1: Terminal control (LED on)<br>2: Communication control (LED blinking) | 0 | ☆ |
| P0-03 | Main frequency source X selection | 0: Digital setting (preset frequency P0-08, press UP/DOWN to modify, non-retentive at power failure)<br>1: Digital setting (preset frequency P0-08, press UP/DOWN to modify, retentive at power failure)<br>2: AI1<br>3: AI2 local potentiometer<br>4: Panel potentiometer / external keyboard potentiometer<br>5: HDI pulse setting (DI5)<br>6: Multi-command<br>7: Simple PLC<br>8: PID<br>9: Communication setting | 3 | ★ |
| P0-04 | Auxiliary frequency source Y selection | The same as P0-03 (Main frequency source X selection) | 0 | ★ |
| P0-05 | Selection of Y range of auxiliary frequency source in superposition | 0: Relative to maximum frequency<br>1: Relative to main frequency X | 0 | ☆ |
| P0-06 | Selection of Y range of auxiliary frequency source in superposition | 0% ～ 150% | 100% | ☆ |
| P0-07 | Frequency source superposition selection | Unit's digit (Frequency source selection)<br>0: Main frequency source X<br>1: X and Y operation (operation relationship determined by ten's digit)<br>2: Switchover between X and Y<br>3: Switchover between X and “X and Y operation”<br>4: Switchover between Y and “X and Y operation”<br>Ten's digit (X and Y operation relationship)<br>0: X+Y<br>1: X−Y<br>2: Maximum<br>3: Minimum | 00 | ☆ |
| P0-08 | Preset frequency | 0.00 Hz ～ maximum frequency (P0-10) | 50.00 Hz | ☆ |
| P0-09 | Rotation direction | 0: Same direction<br>1: Reverse direction | 0 | ☆ |
| P0-10 | Maximum frequency | 5.00 Hz ～ 500.00 Hz | 50.00 Hz | ★ |
| P0-11 | Source of frequency upper limit | 0: Set by P0-12<br>1: AI1<br>2: AI2 local potentiometer<br>3: AI3 panel potentiometer / external keyboard potentiometer<br>4: HDI pulse setting<br>5: Communication setting | 0 | ★ |
| P0-12 | Frequency upper limit | Frequency lower limit (P0-14) to maximum frequency (P0-10) | 50.00 Hz | ☆ |
| P0-13 | Frequency upper limit offset | 0.00 Hz ～ maximum frequency P0-10 | 0.00 Hz | ☆ |
| P0-14 | Frequency lower limit | 0.00 Hz ～ frequency upper limit P0-12 | 0.00 Hz | ☆ |
| P0-15 | Carrier frequency | 2.0 kHz ～ 8.0 kHz | Model dependent | ☆ |
| P0-16 | Carrier frequency adjustment with temperature | 0: No<br>1: Yes | 1 | ☆ |
| P0-17 | Acceleration time 1 | 0.00 s ～ 650.00 s (P0-19=2)<br>0.0 s ～ 6500.0 s (P0-19=1)<br>0 s ～ 65000 s (P0-19=0) | Model dependent | ☆ |
| P0-18 | Deceleration time 1 | 0.00 s ～ 650.00 s (P0-19=2)<br>0.0 s ～ 6500.0 s (P0-19=1)<br>0 s ～ 65000 s (P0-19=0) | Model dependent | ☆ |
| P0-19 | Acceleration/Deceleration time unit | 0: 1 s<br>1: 0.1 s<br>2: 0.01 s | 1 | ★ |
| P0-21 | Frequency offset of auxiliary frequency source for X and Y operation | 0.00 Hz ～ maximum frequency P0-10 | 0.00 Hz | ☆ |
| P0-22 | Frequency reference resolution | 2: 0.01 Hz | 2 | ★ |
| P0-23 | Retentive of digital setting frequency upon power failure | 0: Not retentive<br>1: Retentive | 1 | ☆ |
| P0-25 | Acceleration/Deceleration time base frequency | 0: Maximum frequency (P0-10)<br>1: Set frequency<br>2: 100 Hz | 0 | ★ |
| P0-26 | Base frequency for UP/DOWN modification during running | 0: Running frequency<br>1: Set frequency | 0 | ★ |
| P0-27 | Binding command source to frequency source | Unit's digit (Binding operation panel command to frequency source)<br>0: No binding<br>1: Frequency source by digital setting<br>2: AI1<br>3: AI2<br>4: Panel potentiometer / external keyboard potentiometer<br>5: HDI Pulse setting (DI5)<br>6: Multi-command<br>7: Simple PLC<br>8: PID<br>9: Communication setting<br>Ten's digit (Binding terminal command to frequency source)<br>Hundred's digit (Binding communication command to frequency source) | 0000 | ☆ |

### P1 Motor Parameters

| Function code | Parameter name | Setting range | Default | Property |
| --- | --- | --- | --- | --- |
| P1-00 | Motor type selection | 0: Common asynchronous motor<br>2: Permanent magnetic synchronous motor | 0 | ★ |
| P1-01 | Rated motor power | 0.1 kW ～ 1000.0 kW | Model dependent | ★ |
| P1-02 | Rated motor voltage | 1 V ～ 2000 V | Model dependent | ★ |
| P1-03 | Rated motor current | 0.01 A ～ 10.00 A (AC drive power ≤ 2.2 kW) | Model dependent | ★ |
| P1-04 | Rated motor frequency | 0.01 Hz ～ maximum frequency | Model dependent | ★ |
| P1-05 | Rated motor rotational speed | 1 rpm ～ 65535 rpm | Model dependent | ★ |
| P1-10 | No-load current (asynchronous motor) | 0.01 A ～ P1-03 | Model dependent | ★ |
| P1-37 | Auto-tuning selection | 0: No auto-tuning<br>1: Asynchronous motor static auto-tuning<br>2: Asynchronous motor complete auto-tuning | 0 | ★ |

### P2 Vector Control Parameters

| Function code | Parameter name | Setting range | Default | Property |
| --- | --- | --- | --- | --- |
| P2-00 | Speed loop proportional gain 1 | 1 ～ 100 | 30 | ☆ |
| P2-01 | Speed loop integral time 1 | 0.01 s ～ 10.00 s | 0.50 s | ☆ |
| P2-02 | Switchover frequency 1 | 0.00 ～ P2-05 | 5.00 Hz | ☆ |
| P2-03 | Speed loop proportional gain 2 | 1 ～ 100 | 20 | ☆ |
| P2-04 | Speed loop integral time 2 | 0.01 s ～ 10.00 s | 1.00 s | ☆ |
| P2-05 | Switchover frequency 2 | P2-02 ～ maximum output frequency | 10.00 Hz | ☆ |
| P2-06 | Vector control slip gain | 50% ～ 200% | 100% | ☆ |
| P2-07 | Time constant of speed loop filter | 0.000 s ～ 1.000 s | 0.050 s | ☆ |
| P2-09 | Torque upper limit source in speed control mode | 0: Function code setting at P2-10<br>1: AI1<br>2: AI2<br>3: Panel potentiometer / external keyboard potentiometer<br>4: HDI Pulse setting<br>5: Communication setting<br>6: MIN(AI1,AI2)<br>7: MAX(AI1,AI2)<br>1–7: The full range of options corresponds to P2-10 | 0 | ☆ |
| P2-10 | Digital setting of torque upper limit in speed control mode | 0.0% ～ 200.0% | 150.0% | ☆ |
| P2-13 | Excitation adjustment proportional gain | 0 ～ 60000 | 2000 | ☆ |
| P2-14 | Excitation adjustment integral gain | 0 ～ 60000 | 1300 | ☆ |
| P2-15 | Torque adjustment proportional gain | 0 ～ 60000 | 2000 | ☆ |
| P2-16 | Torque adjustment integral gain | 0 ～ 60000 | 1300 | ☆ |
| P2-17 | Speed loop integral property | Unit's digit: integral separation<br>0: Disabled<br>1: Enabled | 0 | ☆ |
| P2-20 | Maximum output voltage coefficient | 100% ～ 110% | 105% | ★ |
| P2-21 | Maximum torque coefficient in weak magnetic field | 50% ～ 200% | 100% | ☆ |

### P3 V/F Control Parameters

| Function code | Parameter name | Setting range | Default | Property |
| --- | --- | --- | --- | --- |
| P3-00 | VF curve setting | 0: Linear V/F<br>1: Multi-point V/F<br>2: Square V/F<br>3: 1.2 power V/F<br>4: 1.4 power V/F<br>6: 1.6 power V/F<br>8: 1.8 power V/F<br>9: Reserved<br>10: V/F complete separation<br>11: V/F half separation | 0 | ★ |
| P3-01 | Torque boost | 0.0%: (Automatic torque boost)<br>0.1% ～ 30.0% | Model dependent | ☆ |
| P3-02 | Cut-off frequency of torque boost | 0.00 Hz ～ maximum frequency | 50.00 Hz | ★ |
| P3-03 | Multi-point V/F frequency 1 | 0.00 Hz ～ P3-05 | 0.00 Hz | ★ |
| P3-04 | Multi-point V/F voltage 1 | 0.0% ～ 100.0% | 0.0% | ★ |
| P3-05 | Multi-point V/F frequency 2 | P3-03 ～ P3-07 | 0.00 Hz | ★ |
| P3-06 | Multi-point V/F voltage 2 | 0.0% ～ 100.0% | 0.0% | ★ |
| P3-07 | Multi-point V/F frequency 3 | P3-05 ～ rated motor frequency (P1-04) | 0.00 Hz | ★ |
| P3-08 | Multi-point V/F voltage 3 | 0.0% ～ 100.0% | 0.0% | ★ |
| P3-09 | V/F slip compensation gain | 0.0% ～ 200.0% | 0.0% | ☆ |
| P3-10 | VF over-excitation gain | 0 ～ 200 | 64 | ☆ |
| P3-11 | VF oscillation suppression gain | 0 ～ 100 | Model dependent | ☆ |

### P4 Input Terminals

DI1–DI5 share the same function list. Factory defaults: P4-00 = 1, P4-01 = 2, P4-02 = 4, P4-03 = 9, P4-04 = 12.

| Function code | Parameter name | Setting range | Default | Property |
| --- | --- | --- | --- | --- |
| P4-00 | DI1 terminal function selection | 0: No function<br>1: Forward RUN (FWD) or RUN<br>2: Reverse RUN (REV) or RUN direction<br>3: Three-line control<br>4: Forward JOG (FJOG)<br>5: Reverse JOG (RJOG)<br>6: Terminal UP<br>7: Terminal DOWN<br>8: Coast to stop<br>9: Fault reset (RESET)<br>10: RUN pause<br>11: Normally open (NO) input of external fault<br>12: Multi-reference terminal 1<br>13: Multi-reference terminal 2<br>14: Multi-reference terminal 3<br>15: Multi-reference terminal 4<br>16: Terminal 1 for acceleration/deceleration time selection<br>17: Terminal 2 for acceleration/deceleration time selection<br>18: Frequency source switchover<br>19: UP and DOWN setting clear (terminal, operation panel)<br>20: Command source switchover terminal 1<br>21: Acceleration/Deceleration prohibited<br>22: PID pause<br>23: PLC status reset<br>24: Swing pause<br>25: Counter input<br>26: Counter reset<br>27: Length count input<br>28: Length reset<br>29: Torque control prohibited<br>30: Pulse input (enabled only for DI5)<br>31: Reserved<br>32: Immediate DC braking<br>33: Normally closed (NC) input of external fault<br>34: Frequency modification enable<br>35: Reverse PID action direction<br>36: External STOP terminal 1<br>37: Command source switchover terminal 2<br>38: PID integral pause<br>39: Switchover between main frequency source X and preset frequency<br>40: Switchover between auxiliary frequency source Y and preset frequency<br>41: Reserved<br>42: Reserved<br>43: PID parameter switchover<br>44: User-defined fault 1<br>45: User-defined fault 2<br>46: Speed control/Torque control switchover<br>47: Emergency stop<br>48: External STOP terminal 2<br>49: Deceleration DC braking<br>50: Clear the current running time<br>51–59: Reserved | 1 | ★ |
| P4-01 | DI2 terminal function selection | Same as P4-00 | 2 | ★ |
| P4-02 | DI3 terminal function selection | Same as P4-00 | 4 | ★ |
| P4-03 | DI4 terminal function selection | Same as P4-00 | 9 | ★ |
| P4-04 | DI5 terminal function selection | Same as P4-00 | 12 | ★ |
| P4-10 | DI filter time | 0.000 s ～ 1.000 s | 0.01 s | ☆ |
| P4-11 | Terminal command mode | 0: Two-line mode 1<br>1: Two-line mode 2<br>2: Three-line mode 1 | 1 | ★ |
| P4-12 | Terminal UP/DOWN rate | 0.001 Hz/s ～ 65.535 Hz/s | 1.00 Hz/s | ☆ |
| P4-13 | AI curve 1 minimum input | 0.00 V ～ P4-15 | 0.00 V | ☆ |
| P4-14 | Corresponding setting of AI curve 1 minimum input | −100.0% ～ +100.0% | 0.0% | ☆ |
| P4-15 | AI curve 1 maximum input | P4-13 ～ +10.00 V | 10.00 V | ☆ |
| P4-16 | Corresponding setting of AI curve 1 maximum input | −100.0% ～ +100.0% | 100.0% | ☆ |
| P4-17 | AI1 filter time | 0.00 s ～ 10.00 s | 0.10 s | ☆ |
| P4-18 | AI curve 2 minimum input | 0.00 V ～ P4-20 | 0.00 V | ☆ |
| P4-19 | Corresponding setting of AI curve 2 minimum input | −100.0% ～ +100.0% | 0.0% | ☆ |
| P4-20 | AI curve 2 maximum input | P4-18 ～ +10.00 V | 10.00 V | ☆ |
| P4-21 | Corresponding setting of AI curve 2 maximum input | −100.0% ～ +100.0% | 100.0% | ☆ |
| P4-22 | AI2 filter time | 0.00 s ～ 10.00 s | 0.10 s | ☆ |
| P4-23 | AI curve 3 minimum input | −10.00 V ～ P4-25 | −10.00 V | ☆ |
| P4-24 | Corresponding setting of AI curve 3 minimum input | −100.0% ～ +100.0% | −100.0% | ☆ |
| P4-25 | AI curve 3 maximum input | P4-23 ～ +10.00 V | 10.00 V | ☆ |
| P4-26 | Corresponding setting of AI curve 3 maximum input | −100.0% ～ +100.0% | 100.0% | ☆ |
| P4-27 | Panel potentiometer filter time | 0.00 s ～ 10.00 s | 0.10 s | ☆ |
| P4-28 | HDI Pulse minimum input | 0.00 kHz ～ P4-30 | 0.00 kHz | ☆ |
| P4-29 | Corresponding setting of HDI minimum input | −100.0% ～ 100.0% | 0.0% | ☆ |
| P4-30 | HDI maximum input | P4-28 ～ 100.00 kHz | 50.00 kHz | ☆ |
| P4-31 | Corresponding setting of HDI pulse maximum input | −100.0% ～ 100.0% | 100.0% | ☆ |
| P4-32 | HDI filter time | 0.00 s ～ 10.00 s | 0.10 s | ☆ |
| P4-33 | AI curve selection | Unit's digit (AI1 curve selection)<br>Curve 1 (2 points, see P4-13 to P4-16)<br>Curve 2 (2 points, see P4-18 to P4-21)<br>Curve 3 (2 points, see P4-23 to P4-26)<br>Curve 4 (4 points, see A6-00 to A6-07)<br>Curve 5 (4 points, see A6-08 to A6-15)<br>Ten's digit (AI2 curve selection): Curve 1 to curve 5 (same as AI1)<br>Hundred's digit (AI3 curve selection): Curve 1 to curve 5 (same as AI1) | 321 | ☆ |
| P4-34 | Setting for AI less than minimum input | Unit's digit (Setting for AI1 less than minimum input)<br>0: Minimum value<br>1: 0.0%<br>Ten's digit (Setting for AI2 less than minimum input): 0, 1 (same as AI1)<br>Hundred's digit (Setting for AI3 less than minimum input): 0, 1 (same as AI1) | 000 | ☆ |
| P4-35 | DI1 delay time | 0.0 s ～ 3600.0 s | 0.0 s | ★ |
| P4-36 | DI2 delay time | 0.0 s ～ 3600.0 s | 0.0 s | ★ |
| P4-37 | DI3 delay time | 0.0 s ～ 3600.0 s | 0.0 s | ★ |
| P4-38 | DI valid mode selection | 0: High level valid<br>1: Low level valid<br>Unit's digit (DI1 valid mode)<br>Ten's digit (DI2 valid mode)<br>Hundred's digit (DI3 valid mode)<br>Thousand's digit (DI4 valid mode)<br>Ten thousand's digit (DI5 valid mode) | 00000 | ★ |
| P4-39 | AI1 input voltage/current selection | 0: Voltage input<br>1: Current input | 0 | ★ |

### P5 Output Terminals

| Function code | Parameter name | Setting range | Default | Property |
| --- | --- | --- | --- | --- |
| P5-00 | FM terminal output mode | 0: Pulse output (FMP)<br>1: Switch signal output (FMR) | 0 | ☆ |
| P5-01 | FMR output function selection | 0: No output<br>1: AC drive running<br>2: Fault output (stop)<br>3: Frequency-level detection FDT1 output<br>4: Frequency reached<br>5: Zero-speed running (no output at stop)<br>6: Motor overload pre-warning<br>7: AC drive overload pre-warning<br>8: Set count value reached<br>9: Designated count value reached<br>10: Length reached<br>11: PLC cycle complete<br>12: Accumulative running time reached<br>13: Frequency limited<br>14: Torque limited<br>15: Ready for RUN<br>16: AI1 > AI2<br>17: Frequency upper limit reached<br>18: Frequency lower limit reached (operation related)<br>19: Undervoltage state output<br>20: Communication setting<br>21: Reserved<br>22: Reserved<br>23: Zero-speed running 2 (having output at stop)<br>24: Accumulative power-on time reached<br>25: Frequency level detection FDT2 output<br>26: Frequency 1 reached output<br>27: Frequency 2 reached output<br>28: Current 1 reached output<br>29: Current 2 reached output<br>30: Timing reached output<br>31: AI1 input limit exceeded<br>32: Load becoming 0<br>33: Reverse running<br>34: Zero current state<br>35: IGBT temperature reached<br>36: Current limit exceeded<br>37: Frequency lower limit reached (having output at stop)<br>38: Alarm output<br>39: Motor overheat warning<br>40: Current running time reached<br>41: Fault output (There is no output if it is the coast to stop fault and undervoltage occurs.) | 2 | ☆ |
| P5-02 | Relay function (T/A–T/C) | Same list as P5-01 | 0 | ☆ |
| P5-04 | DO1 output function selection | Same list as P5-01 | 1 | ☆ |
| P5-06 | FMP output function selection | 0: Running frequency<br>1: Set frequency<br>2: Output current<br>3: Output torque (absolute value)<br>4: Output power<br>5: Output voltage<br>6: HDI input (100.0% corresponds to 100.0 kHz)<br>7: AI1<br>8: AI2<br>11: Count value<br>12: Communication setting<br>13: Motor rotational speed<br>14: Output current (100.0% corresponds to 1000.0 A)<br>15: Output voltage (100.0% corresponds to 1000.0 V)<br>16: Output torque (actual value) | 0 | ☆ |
| P5-08 | AO1 output function selection | Same list as P5-06 | 0 | ☆ |
| P5-09 | Maximum FMP output frequency | 0.01 kHz ～ 100.00 kHz | 50.00 kHz | ☆ |
| P5-12 | AO1 offset coefficient | −100.0% ～ +100.0% | 0.0% | ☆ |
| P5-13 | AO1 gain | −10.00 ～ +10.00 | 1.00 | ☆ |
| P5-17 | FMR output delay time | 0.0 s ～ 3600.0 s | 0.0 s | ☆ |
| P5-18 | Relay 1 output delay time | 0.0 s ～ 3600.0 s | 0.0 s | ☆ |
| P5-19 | Relay 2 output delay time | 0.0 s ～ 3600.0 s | 0.0 s | ☆ |
| P5-20 | DO1 output delay time | 0.0 s ～ 3600.0 s | 0.0 s | ☆ |

### P6 Start/Stop Control

| Function code | Parameter name | Setting range | Default | Property |
| --- | --- | --- | --- | --- |
| P6-00 | Start mode | 0: Direct start<br>1: Rotational speed tracking restart<br>2: Pre-excited start (asynchronous motor) | 0 | ☆ |
| P6-01 | Rotational speed tracking mode | 0: From frequency at stop<br>1: From power frequency<br>2: From maximum frequency | 0 | ★ |
| P6-02 | Rotational speed tracking speed | 1 ～ 100 | 20 | ☆ |
| P6-03 | Startup frequency | 0.00 Hz ～ 10.00 Hz | 0.00 Hz | ☆ |
| P6-04 | Startup frequency holding time | 0.0 s ～ 100.0 s | 0.0 s | ★ |
| P6-05 | Startup DC braking current / Pre-excited current | 0% ～ 100% | 0% | ★ |
| P6-06 | Startup DC braking time / Pre-excited time | 0.0 s ～ 100.0 s | 0.0 s | ★ |
| P6-07 | Acceleration/Deceleration mode | 0: Linear acceleration/deceleration<br>1: Static S-curve<br>2: Dynamic S-curve | 0 | ★ |
| P6-08 | Time proportion of S-curve start segment | 0.0% ～ (100% − P6-09) | 30.0% | ★ |
| P6-09 | Time proportion of S-curve end segment | 0.0% ～ (100% − P6-08) | 30.0% | ★ |
| P6-10 | Stop mode | 0: Decelerate to stop<br>1: Coast to stop | 0 | ☆ |
| P6-11 | Initial frequency of stop DC braking | 0.00 Hz ～ maximum frequency | 0.00 Hz | ☆ |
| P6-12 | Waiting time of stop DC braking | 0.0 s ～ 100.0 s | 0.0 s | ☆ |
| P6-13 | Stop DC braking current | 0% ～ 100% | 0% | ☆ |
| P6-14 | Stop DC braking time | 0.0 s ～ 100.0 s | 0.0 s | ☆ |
| P6-15 | Brake use ratio | 0% ～ 100% | 100% | ☆ |

### P7 Operation Panel and Display

| Function code | Parameter name | Setting range | Default | Property |
| --- | --- | --- | --- | --- |
| P7-01 | MF.K Key function selection | 0: MF.K key disabled<br>1: Switchover between operation panel control and remote command control (terminal or communication)<br>2: Switchover between forward rotation and reverse rotation<br>3: Forward JOG<br>4: Reverse JOG | 0 | ★ |
| P7-02 | STOP/RESET key function | 0: STOP/RESET key enabled only in operation panel control<br>1: STOP/RESET key enabled in any operation mode | 1 | ☆ |
| P7-03 | LED display running parameters 1 | 0000–FFFF<br>Bit00: Running frequency 1 (Hz)<br>Bit01: Set frequency (Hz)<br>Bit02: Bus voltage (V)<br>Bit03: Output voltage (V)<br>Bit04: Output current (A)<br>Bit05: Output power (kW)<br>Bit06: Output torque (%)<br>Bit07: DI input status<br>Bit08: DO output status<br>Bit09: AI1 voltage (V)<br>Bit10: AI2 voltage (V)<br>Bit11: Panel potentiometer voltage (V)<br>Bit12: Count value<br>Bit13: Length value<br>Bit14: Load speed display<br>Bit15: PID setting | 1F | ☆ |
| P7-04 | LED display running parameters 2 | 0000–FFFF<br>Bit00: PID feedback<br>Bit01: PLC stage<br>Bit02: HDI setting frequency (kHz)<br>Bit03: Running frequency 2 (Hz)<br>Bit04: Remaining running time<br>Bit05: AI1 voltage before correction (V)<br>Bit06: AI2<br>Bit07: Panel potentiometer voltage before correction (V)<br>Bit08: Linear speed<br>Bit09: Current power-on time (Hour)<br>Bit10: Current running time (Min)<br>Bit11: HDI setting frequency (Hz)<br>Bit12: Communication setting value<br>Bit13: Encoder feedback speed (Hz)<br>Bit14: Main frequency X display (Hz)<br>Bit15: Auxiliary frequency Y display (Hz) | 0 | ☆ |
| P7-05 | LED display stop parameters | 0000–FFFF<br>Bit00: Set frequency (Hz)<br>Bit01: Bus voltage (V)<br>Bit02: DI input status<br>Bit03: DO output status<br>Bit04: AI1 voltage (V)<br>Bit05: AI2 voltage (V)<br>Bit06: Potentiometer voltage (V)<br>Bit07: Count value<br>Bit08: Length value<br>Bit09: PLC stage<br>Bit10: Load speed<br>Bit11: PID setting<br>Bit12: HDI setting frequency (kHz) | 33 | ☆ |
| P7-06 | Load speed display coefficient | 0.0001 ～ 6.5000 | 1.0000 | ☆ |
| P7-07 | Heatsink temperature of AC drive IGBT | 0 °C ～ 120 °C | — | ● |
| P7-09 | Accumulative running time | 0 h ～ 65535 h | — | ● |
| P7-12 | Number of decimal places for load speed display | Unit's digit: U0-14 decimal number<br>0: 0 decimal place<br>1: 1 decimal place<br>2: 2 decimal places<br>3: 3 decimal places<br>Ten's digit: U0-19 / U0-29 decimal number<br>0: 0 decimal place<br>1: 1 decimal place | 21 | ☆ |
| P7-13 | Accumulative power-on time | 0 ～ 65535 h | — | ● |
| P7-14 | Accumulative power consumption | 0 ～ 65535 kWh | — | ● |

### P8 Auxiliary Functions

| Function code | Parameter name | Setting range | Default | Property |
| --- | --- | --- | --- | --- |
| P8-00 | JOG running frequency | 0.00 Hz ～ maximum frequency | 2.00 Hz | ☆ |
| P8-01 | JOG acceleration time | 0.0 s ～ 6500.0 s | 20.0 s | ☆ |
| P8-02 | JOG deceleration time | 0.0 s ～ 6500.0 s | 20.0 s | ☆ |
| P8-03 | Acceleration time 2 | 0.0 s ～ 6500.0 s | Model dependent | ☆ |
| P8-04 | Deceleration time 2 | 0.0 s ～ 6500.0 s | Model dependent | ☆ |
| P8-05 | Acceleration time 3 | 0.0 s ～ 6500.0 s | Model dependent | ☆ |
| P8-06 | Deceleration time 3 | 0.0 s ～ 6500.0 s | Model dependent | ☆ |
| P8-07 | Acceleration time 4 | 0.0 s ～ 6500.0 s | Model dependent | ☆ |
| P8-08 | Deceleration time 4 | 0.0 s ～ 6500.0 s | Model dependent | ☆ |
| P8-09 | Jump frequency 1 | 0.00 Hz ～ maximum frequency | 0.00 Hz | ☆ |
| P8-10 | Jump frequency 2 | 0.00 Hz ～ maximum frequency | 0.00 Hz | ☆ |
| P8-11 | Frequency jump amplitude | 0.00 Hz ～ maximum frequency | 0.01 Hz | ☆ |
| P8-12 | Forward/Reverse rotation dead-zone time | 0.0 s ～ 3000.0 s | 0.0 s | ☆ |
| P8-13 | Reverse control | 0: Enabled<br>1: Disabled | 0 | ☆ |
| P8-14 | Running mode when set frequency lower than frequency lower limit | 0: Run at frequency lower limit<br>1: Stop<br>2: Run at zero speed | 0 | ☆ |
| P8-15 | Droop control | 0.00 Hz ～ 10.00 Hz | 0.00 Hz | ☆ |
| P8-16 | Accumulative power-on time threshold | 0 h ～ 65000 h | 0 h | ☆ |
| P8-17 | Accumulative running time threshold | 0 h ～ 65000 h | 0 h | ☆ |
| P8-18 | Startup protection | 0: No<br>1: Yes | 0 | ☆ |
| P8-19 | Frequency detection value (FDT1) | 0.00 Hz ～ maximum frequency | 50.00 Hz | ☆ |
| P8-20 | Frequency detection hysteresis (FDT hysteresis 1) | 0.0% ～ 100.0% (FDT1 electrical level) | 5.0% | ☆ |
| P8-21 | Detection range of frequency reached | 0.0% ～ 100.0% (maximum frequency) | 0.0% | ☆ |
| P8-25 | Frequency switchover point between acceleration time 1 and acceleration time 2 | 0.00 Hz ～ maximum frequency | 0.00 Hz | ☆ |
| P8-26 | Frequency switchover point between deceleration time 1 and deceleration time 2 | 0.00 Hz ～ maximum frequency | 0.00 Hz | ☆ |
| P8-27 | Terminal JOG preferred | 0: Disabled<br>1: Enabled | 0 | ☆ |
| P8-28 | Frequency detection value (FDT2) | 0.00 Hz ～ maximum frequency | 50.00 Hz | ☆ |
| P8-29 | Frequency detection hysteresis (FDT hysteresis 2) | 0.0% ～ 100.0% (FDT2 electrical level) | 5.0% | ☆ |
| P8-30 | Any frequency reaching detection value 1 | 0.00 Hz ～ maximum frequency | 50.00 Hz | ☆ |
| P8-31 | Any frequency reaching detection amplitude 1 | 0.0% ～ 100.0% (maximum frequency) | 0.0% | ☆ |
| P8-32 | Any frequency reaching detection value 2 | 0.00 Hz ～ maximum frequency | 50.00 Hz | ☆ |
| P8-33 | Any frequency reaching detection amplitude 2 | 0.0% ～ 100.0% (maximum frequency) | 5.0% | ☆ |
| P8-34 | Zero current detection level | 0.0% ～ 300.0% rated motor current | 5.0% | ☆ |
| P8-35 | Zero current detection delay time | 0.01 s ～ 600.00 s | 0.10 s | ☆ |
| P8-36 | Output overcurrent threshold | 0.0% (no detection)<br>0.1%–300.0% (rated motor current) | 200.0% | ☆ |
| P8-37 | Output overcurrent detection delay time | 0.00 s ～ 600.00 s | 0.00 s | ☆ |
| P8-38 | Any current reaching 1 | 0.0%–300.0% (rated motor current) | 100.0% | ☆ |
| P8-39 | Any current reaching 1 amplitude | 0.0% ～ 300.0% (rated motor current) | 0.0% | ☆ |
| P8-40 | Any current reaching 2 | 0.0% ～ 300.0% (rated motor current) | 100.0% | ☆ |
| P8-41 | Any current reaching 2 amplitude | 0.0% ～ 300.0% (rated motor current) | 0.0% | ☆ |
| P8-42 | Timing function | 0: Disabled<br>1: Enabled | 0 | ☆ |
| P8-43 | Timing duration source | 0: P8-44<br>1: AI1<br>2: AI2<br>3: Panel potentiometer (analog input corresponds to the value of P8-44 / printed as F8-44) | 0 | ☆ |
| P8-44 | Timing duration | 0.0 Min ～ 6500.0 Min | 0.0 Min | ☆ |
| P8-45 | AI1 input voltage lower limit | 0.00 V ～ P8-46 | 3.10 V | ☆ |
| P8-46 | AI1 input voltage upper limit | P8-45 ～ 10.00 V | 6.80 V | ☆ |
| P8-47 | IGBT temperature threshold | 0 °C ～ 100 °C | 75 °C | ☆ |
| P8-49 | Wakeup frequency | Dormant frequency (P8-51) ～ maximum frequency (P0-10) | 0.00 Hz | ☆ |
| P8-50 | Wakeup delay time | 0.0 s ～ 6500.0 s | 0.0 s | ☆ |
| P8-51 | Dormant frequency | 0.00 Hz ～ wakeup frequency (P8-49) | 0.00 Hz | ☆ |
| P8-52 | Dormant delay time | 0.0 s ～ 6500.0 s | 0.0 s | ☆ |
| P8-53 | Current running time reached | 0.0 ～ 6500.0 min | 0.0 Min | ☆ |
| P8-54 | Output power correction coefficient | 0.00% ～ 200.0% | 100.0% | ☆ |

### P9 Fault and Protection

| Function code | Parameter name | Setting range | Default | Property |
| --- | --- | --- | --- | --- |
| P9-00 | Motor overload protection selection | 0: Disabled<br>1: Enabled | 1 | ● |
| P9-01 | Motor overload protection gain | 0.20 ～ 10.00 | 1.00 | ● |
| P9-02 | Motor overload warning coefficient | 50% ～ 100% | 80% | ● |
| P9-03 | Overvoltage stall gain | 0 ～ 100 | 0 | ● |
| P9-04 | Overvoltage stall protective voltage | 650 ～ 780 V | 760 V | ● |
| P9-05 | Overcurrent stall gain | 0 ～ 100 | 20 | ● |
| P9-06 | Overcurrent stall protective current | 100% ～ 200% | 150% | ● |
| P9-07 | Short-circuit to ground upon power-on | 0: Disabled<br>1: Enabled | 1 | ● |
| P9-08 | Brake unit action starting voltage | 700 ～ 800 V | 750 V | ● |
| P9-09 | Fault auto reset times | 0 ～ 20 | 0 | ● |
| P9-10 | DO action during fault auto reset | 0: Not act<br>1: Act | 0 | ● |
| P9-11 | Time interval of fault auto reset | 0.1 s ～ 100.0 s | 1.0 s | ● |
| P9-12 | Input phase loss protection / contactor energizing protection selection | Unit's digit: Input phase loss protection<br>Ten's digit: Contactor energizing protection<br>0: Disabled<br>1: Enabled | 11 | ● |
| P9-13 | Output phase loss protection selection | 0: Disabled<br>1: Enabled | 1 | ● |
| P9-14 | 1st fault type | 0: No fault<br>1: Reserved<br>2: Overcurrent during acceleration<br>3: Overcurrent during deceleration<br>4: Overcurrent at constant speed<br>5: Overvoltage during acceleration<br>6: Overvoltage during deceleration<br>7: Overvoltage at constant speed<br>8: Buffer resistance overload<br>9: Undervoltage<br>10: AC drive overload<br>11: Motor overload<br>12: Power input phase loss<br>13: Power output phase loss<br>14: IGBT overheat<br>15: External equipment fault<br>16: Communication fault<br>17: Contactor fault<br>18: Current detection fault<br>19: Motor auto-tuning fault<br>21: EEPROM read-write fault<br>22: AC drive hardware fault<br>23: Short circuit to ground<br>24: Reserved<br>25: Reserved<br>26: Accumulative running time reached<br>27: User-defined fault 1<br>28: User-defined fault 2<br>29: Accumulative power-on time reached<br>30: Load becoming 0<br>31: PID feedback lost during running<br>40: Current limit fault<br>41: Motor switchover fault during running<br>42: Too large speed deviation<br>43: Motor over-speed | — | ● |
| P9-15 | 2nd fault type | Same list as P9-14 | — | ● |
| P9-16 | 3rd (latest) fault type | Same list as P9-14 | — | ● |
| P9-17 | Frequency upon 3rd fault | — | — | ● |
| P9-18 | Current upon 3rd fault | — | — | ● |
| P9-19 | Bus voltage upon 3rd fault | — | — | ● |
| P9-20 | Input terminal status upon 3rd fault | — | — | ● |
| P9-21 | Output terminal status upon 3rd fault | — | — | ● |
| P9-22 | AC drive status upon 3rd fault | — | — | ● |
| P9-23 | Power-on time upon 3rd fault | — | — | ● |
| P9-24 | Running time upon 3rd fault | — | — | ● |
| P9-27 | Frequency upon 2nd fault | — | — | ● |
| P9-28 | Current upon 2nd fault | — | — | ● |
| P9-29 | Bus voltage upon 2nd fault | — | — | ● |
| P9-30 | Input terminal status upon 2nd fault | — | — | ● |
| P9-31 | Output terminal status upon 2nd fault | — | — | ● |
| P9-32 | AC drive status upon 2nd fault | — | — | ● |
| P9-33 | Power-on time upon 2nd fault | — | — | ● |
| P9-34 | Running time upon 2nd fault | — | — | ● |
| P9-37 | Frequency upon 1st fault | — | — | ● |
| P9-38 | Current upon 1st fault | — | — | ● |
| P9-39 | Bus voltage upon 1st fault | — | — | ● |
| P9-40 | Input terminal status upon 1st fault | — | — | ● |
| P9-41 | Output terminal status upon 1st fault | — | — | ● |
| P9-42 | AC drive status upon 1st fault | — | — | ● |
| P9-43 | Power-on time upon 1st fault | — | — | ● |
| P9-44 | Running time upon 1st fault | — | — | ● |
| P9-47 | Fault protection action selection 1 | Unit's digit (Motor overload, 11)<br>0: Coast to stop<br>1: Stop according to the stop mode<br>2: Continue to run<br>Ten's digit (Power input phase loss, 12)<br>Hundred's digit (Power output phase loss, 13)<br>Thousand's digit (External equipment fault, 15)<br>Ten thousand's digit (Communication fault, 16) | 00000 | ☆ |
| P9-54 | Frequency selection for continuing to run upon fault | 0: Current running frequency<br>1: Set frequency<br>2: Frequency upper limit<br>3: Frequency lower limit<br>4: Backup frequency upon abnormality | 00000 | ☆ |
| P9-55 | Backup frequency upon abnormality | 0.0% ～ 100.0% (100.0% corresponds to maximum frequency P0-10) | 100.0% | ☆ |
| P9-59 | Action selection at instantaneous power failure | 0: Invalid<br>1: Bus voltage constant control<br>2: Decelerate to stop | 0 | ★ |
| P9-60 | Action pause judging voltage at instantaneous power failure | 80% ～ 100.0% | 85.0% | ★ |
| P9-61 | Voltage rally judging time at instantaneous power failure | 0.5 s | 0.5 s | ★ |
| P9-62 | Action judging bus voltage at instantaneous power failure | 80% ～ 100.0% | 80.0% | ★ |
| P9-63 | Protection upon load becoming 0 | 0: Disabled<br>1: Enabled | 0 | ☆ |
| P9-64 | Detection level of load becoming 0 | 0.0 ～ 100.0% | 10.0% | ☆ |
| P9-65 | Detection time of load becoming 0 | 0.0 ～ 60.0 s | 1.0 s | ☆ |

### PA PID Function

| Function code | Parameter name | Setting range | Default | Property |
| --- | --- | --- | --- | --- |
| PA-00 | PID setting source | 0: PA-01<br>1: AI1<br>2: AI2<br>3: Panel potentiometer<br>4: HDI Pulse setting (DI5)<br>5: Communication setting<br>6: Multi-reference | 0 | ☆ |
| PA-01 | PID digital setting | 0.0% ～ 100.0% | 50.0% | ☆ |
| PA-02 | PID feedback source | 0: AI1<br>1: AI2<br>2: Panel potentiometer<br>3: AI1 − AI2<br>4: HDI Pulse setting (DI5)<br>5: Communication setting<br>6: AI1 + AI2<br>7: MAX (|AI1|, |AI2|)<br>8: MIN (|AI1|, |AI2|) | 0 | ☆ |
| PA-03 | PID action direction | 0: Forward action<br>1: Reverse action | 0 | ☆ |
| PA-04 | PID setting feedback range | 0 ～ 65535 | 1000 | ☆ |
| PA-05 | Proportional gain Kp1 | 0.0 ～ 100.0 | 20.0 | ☆ |
| PA-06 | Integral time Ti1 | 0.01 s ～ 10.00 s | 2.00 s | ☆ |
| PA-07 | Differential time Td1 | 0.000 s ～ 10.000 s | 0.000 s | ☆ |
| PA-08 | Cut-off frequency of PID reverse rotation | 0.00 ～ maximum frequency | 2.00 Hz | ☆ |
| PA-09 | PID deviation limit | 0.0% ～ 100.0% | 0.0% | ☆ |
| PA-10 | PID differential limit | 0.00% ～ 100.00% | 0.10% | ☆ |
| PA-11 | PID setting change time | 0.00 ～ 650.00 s | 0.00 s | ☆ |
| PA-12 | PID feedback filter time | 0.00 ～ 60.00 s | 0.00 s | ☆ |
| PA-13 | PID output filter time | 0.00 ～ 60.00 s | 0.00 s | ☆ |
| PA-15 | Proportional gain Kp2 | 0.0 ～ 100.0 | 20.0 | ☆ |
| PA-16 | Integral time Ti2 | 0.01 s ～ 10.00 s | 2.00 s | ☆ |
| PA-17 | Differential time Td2 | 0.000 s ～ 10.000 s | 0.000 s | ☆ |
| PA-18 | PID parameter switchover condition | 0: No switchover<br>1: Switchover via DI<br>2: Automatic switchover based on Deviation<br>3: Automatic switchover based on running frequency | 0 | ☆ |
| PA-19 | PID parameter switchover deviation 1 | 0.0% ～ PA-20 | 20.0% | ☆ |
| PA-20 | PID parameter switchover deviation 2 | PA-19 ～ 100.0% | 80.0% | ☆ |
| PA-21 | PID initial value | 0.0% ～ 100.0% | 0.0% | ☆ |
| PA-22 | PID initial value holding time | 0.00 ～ 650.00 s | 0.00 s | ☆ |
| PA-23 | Maximum deviation between two PID outputs in forward direction | 0.00% ～ 100.00% | 1.00% | ☆ |
| PA-24 | Maximum deviation between two PID outputs in reverse direction | 0.00% ～ 100.00% | 1.00% | ☆ |
| PA-25 | PID integral property | Unit's digit (Integral separated)<br>0: Invalid<br>1: Valid<br>Ten's digit (Whether to stop integral operation when the output reaches the limit)<br>0: Continue integral operation<br>1: Stop integral operation | 00 | ☆ |
| PA-26 | Detection value of PID feedback loss | 0.0%: Not judging feedback loss<br>0.1%–100.0% | 0.0% | ☆ |
| PA-27 | Detection time of PID feedback loss | 0.0 s ～ 20.0 s | 0.0 s | ☆ |
| PA-28 | PID operation at stop | 0: No PID operation at stop<br>1: PID operation at stop | 0 | ☆ |

### PB Swing Frequency, Fixed Length and Count

| Function code | Parameter name | Setting range | Default | Property |
| --- | --- | --- | --- | --- |
| PB-00 | Swing frequency setting mode | 0: Relative to the central frequency<br>1: Relative to the maximum frequency | 0 | ☆ |
| PB-01 | Swing frequency amplitude | 0.0% ～ 100.0% | 0.0% | ☆ |
| PB-02 | Jump frequency amplitude | 0.0% ～ 50.0% | 0.0% | ☆ |
| PB-03 | Swing frequency cycle | 0.1 s ～ 3000.0 s | 10.0 s | ☆ |
| PB-04 | Triangular wave rising time coefficient | 0.1% ～ 100.0% | 50.0% | ☆ |
| PB-05 | Set length | 0 m ～ 65535 m | 1000 m | ☆ |
| PB-06 | Actual length | 0 m ～ 65535 m | 0 m | ☆ |
| PB-07 | Number of pulses per meter | 0.1 ～ 6553.5 | 100.0 | ☆ |
| PB-08 | Set count value | 1 ～ 65535 | 1000 | ☆ |
| PB-09 | Designated count value | 1 ～ 65535 | 1000 | ☆ |

### PC Multi-Reference and Simple PLC Function

| Function code | Parameter name | Setting range | Default | Property |
| --- | --- | --- | --- | --- |
| PC-00 | Reference 0 | −100.0% ～ 100.0% | 0.0% | ☆ |
| PC-01 | Reference 1 | −100.0% ～ 100.0% | 0.0% | ☆ |
| PC-02 | Reference 2 | −100.0% ～ 100.0% | 0.0% | ☆ |
| PC-03 | Reference 3 | −100.0% ～ 100.0% | 0.0% | ☆ |
| PC-04 | Reference 4 | −100.0% ～ 100.0% | 0.0% | ☆ |
| PC-05 | Reference 5 | −100.0% ～ 100.0% | 0.0% | ☆ |
| PC-06 | Reference 6 | −100.0% ～ 100.0% | 0.0% | ☆ |
| PC-07 | Reference 7 | −100.0% ～ 100.0% | 0.0% | ☆ |
| PC-08 | Reference 8 | −100.0% ～ 100.0% | 0.0% | ☆ |
| PC-09 | Reference 9 | −100.0% ～ 100.0% | 0.0% | ☆ |
| PC-10 | Reference 10 | −100.0% ～ 100.0% | 0.0% | ☆ |
| PC-11 | Reference 11 | −100.0% ～ 100.0% | 0.0% | ☆ |
| PC-12 | Reference 12 | −100.0% ～ 100.0% | 0.0% | ☆ |
| PC-13 | Reference 13 | −100.0% ～ 100.0% | 0.0% | ☆ |
| PC-14 | Reference 14 | −100.0% ～ 100.0% | 0.0% | ☆ |
| PC-15 | Reference 15 | −100.0% ～ 100.0% | 0.0% | ☆ |
| PC-16 | Simple PLC running mode | 0: Stop after the AC drive runs one cycle<br>1: Keep final values after the AC drive runs one cycle<br>2: Repeat after the AC drive runs one cycle | 0 | ☆ |
| PC-17 | Simple PLC retentive selection | Unit's digit (Retentive upon power failure)<br>0: No<br>1: Yes<br>Ten's digit (Retentive upon stop)<br>0: No<br>1: Yes | 00 | ☆ |
| PC-18 | Running time of simple PLC reference 0 | 0.0 s(h) ～ 6553.5 s(h) | 0.0 s(h) | ☆ |
| PC-19 | Acceleration/deceleration time of simple PLC reference 0 | 0 ～ 3 | 0 | ☆ |
| PC-20 | Running time of simple PLC reference 1 | 0.0 s(h) ～ 6553.5 s(h) | 0.0 s(h) | ☆ |
| PC-21 | Acceleration/deceleration time of simple PLC reference 1 | 0 ～ 3 | 0 | ☆ |
| PC-22 | Running time of simple PLC reference 2 | 0.0 s(h) ～ 6553.5 s(h) | 0.0 s(h) | ☆ |
| PC-23 | Acceleration/deceleration time of simple PLC reference 2 | 0 ～ 3 | 0 | ☆ |
| PC-24 | Running time of simple PLC reference 3 | 0.0 s(h) ～ 6553.5 s(h) | 0.0 s(h) | ☆ |
| PC-25 | Acceleration/deceleration time of simple PLC reference 3 | 0 ～ 3 | 0 | ☆ |
| PC-26 | Running time of simple PLC reference 4 | 0.0 s(h) ～ 6553.5 s(h) | 0.0 s(h) | ☆ |
| PC-27 | Acceleration/deceleration time of simple PLC reference 4 | 0 ～ 3 | 0 | ☆ |
| PC-28 | Running time of simple PLC reference 5 | 0.0 s(h) ～ 6553.5 s(h) | 0.0 s(h) | ☆ |
| PC-29 | Acceleration/deceleration time of simple PLC reference 5 | 0 ～ 3 | 0 | ☆ |
| PC-30 | Running time of simple PLC reference 6 | 0.0 s(h) ～ 6553.5 s(h) | 0.0 s(h) | ☆ |
| PC-31 | Acceleration/deceleration time of simple PLC reference 6 | 0 ～ 3 | 0 | ☆ |
| PC-32 | Running time of simple PLC reference 7 | 0.0 s(h) ～ 6553.5 s(h) | 0.0 s(h) | ☆ |
| PC-33 | Acceleration/deceleration time of simple PLC reference 7 | 0 ～ 3 | 0 | ☆ |
| PC-34 | Running time of simple PLC reference 8 | 0.0 s(h) ～ 6553.5 s(h) | 0.0 s(h) | ☆ |
| PC-35 | Acceleration/deceleration time of simple PLC reference 8 | 0 ～ 3 | 0 | ☆ |
| PC-36 | Running time of simple PLC reference 9 | 0.0 s(h) ～ 6553.5 s(h) | 0.0 s(h) | ☆ |
| PC-37 | Acceleration/deceleration time of simple PLC reference 9 | 0 ～ 3 | 0 | ☆ |
| PC-38 | Running time of simple PLC reference 10 | 0.0 s(h) ～ 6553.5 s(h) | 0.0 s(h) | ☆ |
| PC-39 | Acceleration/deceleration time of simple PLC reference 10 | 0 ～ 3 | 0 | ☆ |
| PC-40 | Running time of simple PLC reference 11 | 0.0 s(h) ～ 6553.5 s(h) | 0.0 s(h) | ☆ |
| PC-41 | Acceleration/deceleration time of simple PLC reference 11 | 0 ～ 3 | 0 | ☆ |
| PC-42 | Running time of simple PLC reference 12 | 0.0 s(h) ～ 6553.5 s(h) | 0.0 s(h) | ☆ |
| PC-43 | Acceleration/deceleration time of simple PLC reference 12 | 0 ～ 3 | 0 | ☆ |
| PC-44 | Running time of simple PLC reference 13 | 0.0 s(h) ～ 6553.5 s(h) | 0.0 s(h) | ☆ |
| PC-45 | Acceleration/deceleration time of simple PLC reference 13 | 0 ～ 3 | 0 | ☆ |
| PC-46 | Running time of simple PLC reference 14 | 0.0 s(h) ～ 6553.5 s(h) | 0.0 s(h) | ☆ |
| PC-47 | Acceleration/deceleration time of simple PLC reference 14 | 0 ～ 3 | 0 | ☆ |
| PC-48 | Running time of simple PLC reference 15 | 0.0 s(h) ～ 6553.5 s(h) | 0.0 s(h) | ☆ |
| PC-49 | Acceleration/deceleration time of simple PLC reference 15 | 0 ～ 3 | 0 | ☆ |
| PC-50 | Time unit of simple PLC running | 0: second<br>1: hour | 0 | ☆ |
| PC-51 | Reference 0 source | 0: Set by PC-00<br>1: AI1<br>2: AI2<br>3: Panel potentiometer<br>4: HDI pulse setting<br>5: PID<br>6: Set by preset frequency (P0-08), modified via UP/DOWN | 0 | ☆ |

### PD Communication Parameters

| Function code | Parameter name | Setting range | Default | Property |
| --- | --- | --- | --- | --- |
| PD-00 | Baud rate | Unit's digit: MODBUS<br>0: 300 BPS<br>1: 600 BPS<br>2: 1200 BPS<br>3: 2400 BPS<br>4: 4800 BPS<br>5: 9600 BPS<br>6: 19200 BPS<br>7: 38400 BPS<br>8: 57600 BPS<br>9: 115200 BPS<br>Ten's digit: PROFIBUS-DP<br>0: 115200 BPS<br>1: 208300 BPS<br>2: 256000 BPS<br>3: 512000 BPS<br>Hundred's digit (reserved)<br>Thousand's digit: CANlink<br>0: 20<br>1: 50<br>2: 100<br>3: 125<br>4: 250<br>5: 500<br>6: 1M | 6005 | ☆ |
| PD-01 | MODBUS data format | 0: No check, data format &lt;8,N,2&gt;<br>1: Even parity check, data format &lt;8,E,1&gt;<br>2: Odd parity check, data format &lt;8,O,1&gt;<br>3: No check, data format &lt;8,N,1&gt; | 0 | ☆ |
| PD-02 | Local address | Valid for Modbus<br>0: Broadcast address<br>1 ～ 247 | 1 | ☆ |
| PD-03 | MODBUS response delay | 0 ～ 20 ms | 2 | ☆ |
| PD-04 | Communication timeout | 0.0: invalid<br>0.1 ～ 60.0 s | 0.0 | ☆ |
| PD-05 | Modbus protocol selection and PROFIBUS-DP data format | Unit's digit: Modbus protocol<br>0: Non-standard Modbus protocol<br>1: Standard Modbus protocol<br>Ten's digit: PROFIBUS-DP data format<br>0: PPO1 format<br>1: PPO2 format<br>2: PPO3 format<br>3: PPO5 format | 30 | ☆ |
| PD-06 | Communication reading current resolution | 0: 0.01 A<br>1: 0.1 A | 0 | ☆ |

### PP Function Code Management

| Function code | Parameter name | Setting range | Default | Property |
| --- | --- | --- | --- | --- |
| PP-00 | User password | 0 ～ 65535 | 0 | ☆ |
| PP-01 | Restore default settings | 0: No operation<br>01: Restore factory settings except motor parameters<br>02: Clear records | 0 | ★ |
| PP-02 | AC drive parameter display property | Unit's digit (Group U display selection)<br>0: Not display<br>1: Display<br>Ten's digit (Group A display selection)<br>0: Not display<br>1: Display | 11 | ★ |
| PP-03 | Individualized parameter display property | Unit's digit (User-defined parameter display selection)<br>0: Not display<br>1: Display<br>Ten's digit (User-modified parameter display selection)<br>0: Not display<br>1: Display | 00 | ☆ |
| PP-04 | Parameter modification property | 0: Modifiable<br>1: Not modifiable | 0 | ☆ |

### A0 Torque Control Parameters

| Function code | Parameter name | Setting range | Default | Property |
| --- | --- | --- | --- | --- |
| A0-00 | Speed/Torque control selection | 0: Speed control<br>1: Torque control | 0 | ★ |
| A0-01 | Torque setting source in torque control | 0: Digital setting (A0-03)<br>1: AI1<br>2: AI2<br>3: Panel potentiometer<br>4: HDI pulse setting (DI5)<br>5: Communication setting<br>6: MIN(AI1,AI2)<br>7: MAX(AI1,AI2)<br>Full range of values 1–7 corresponds to the digital setting of A0-03. | 0 | ★ |
| A0-03 | Torque digital setting in torque control | −200.0% ～ 200.0% | 150.0% | ☆ |
| A0-05 | Forward maximum frequency in torque control | 0.00 Hz ～ maximum frequency | 50.00 Hz | ☆ |
| A0-06 | Reverse maximum frequency in torque control | 0.00 Hz ～ maximum frequency | 50.00 Hz | ☆ |
| A0-07 | Acceleration time in torque control | 0.00 s ～ 65000 s | 0.00 s | ☆ |
| A0-08 | Deceleration time in torque control | 0.00 s ～ 65000 s | 0.00 s | ☆ |

### A5 Control Optimization Parameters

| Function code | Parameter name | Setting range | Default | Property |
| --- | --- | --- | --- | --- |
| A5-00 | DPWM switchover frequency upper limit | 5.00 Hz ～ maximum frequency | 8.00 Hz | ☆ |
| A5-01 | PWM modulation mode | 0: Asynchronous modulation<br>1: Synchronous modulation | 0 | ☆ |
| A5-02 | Dead zone compensation mode selection | 0: No compensation<br>1: Compensation mode 1 | 1 | ☆ |
| A5-03 | Random PWM depth | 0: Random PWM invalid<br>1 ～ 10: PWM carrier frequency random depth | 0 | ☆ |
| A5-04 | Rapid current limit | 0: Disabled<br>1: Enabled | 1 | ☆ |
| A5-05 | Current detection compensation | 0 ～ 100 | 5 | ☆ |
| A5-06 | Undervoltage threshold | 210 ～ 420 V | 350 V | ☆ |
| A5-07 | SVC optimization mode selection | 1: Optimization mode 1<br>2: Optimization mode 2 | 1 | ☆ |
| A5-08 | Dead-zone time adjustment | 100% ～ 200% | 150% | ★ |
| A5-09 | Overvoltage threshold | 200.0 V ～ 2500.0 V | Model dependent | ★ |

### U0 Monitoring Parameters

| Function code | Parameter name | Min. unit | Property |
| --- | --- | --- | --- |
| U0-00 | Running frequency (Hz) | 0.01 Hz | ● |
| U0-01 | Set frequency (Hz) | 0.01 Hz | ● |
| U0-02 | Bus voltage (V) | 0.1 V | ● |
| U0-03 | Output voltage (V) | 1 V | ● |
| U0-04 | Output current (A) | 0.01 A | ● |
| U0-05 | Output power (kW) | 0.1 kW | ● |
| U0-06 | Output torque (%) | 0.1% | ● |
| U0-07 | DI input state | 1 | ● |
| U0-08 | DO output state | 1 | ● |
| U0-09 | AI1 voltage (V) | 0.01 V | ● |
| U0-10 | AI2 voltage (V) / current (mA) | 0.01 V / 0.01 mA | ● |
| U0-11 | Panel potentiometer voltage (V) | 0.01 V | ● |
| U0-12 | Count value | 1 | ● |
| U0-13 | Length value | 1 | ● |
| U0-14 | Load speed display | 1 | ● |
| U0-15 | PID setting | 1 | ● |
| U0-16 | PID feedback | 1 | ● |
| U0-17 | PLC stage | 1 | ● |
| U0-18 | HDI input pulse frequency (Hz) | 0.01 kHz | ● |
| U0-19 | Feedback speed (Hz) | 0.01 Hz | ● |
| U0-20 | Remaining running time | 0.1 Min | ● |
| U0-21 | AI1 voltage before correction | 0.001 V | ● |
| U0-22 | AI2 voltage (V) / current (mA) before correction | 0.001 V / 0.01 mA | ● |
| U0-23 | Panel potentiometer voltage before correction | 0.001 V | ● |
| U0-24 | Linear speed | 1 m/Min | ● |
| U0-25 | Accumulative power-on time | 1 Min | ● |
| U0-26 | Accumulative running time | 0.1 Min | ● |
| U0-27 | HDI pulse input frequency | 1 Hz | ● |
| U0-28 | Communication setting value | 0.01% | ● |
| U0-30 | Main frequency X | 0.01 Hz | ● |
| U0-31 | Auxiliary frequency Y | 0.01 Hz | ● |
| U0-32 | Viewing any register address value | 1 | ● |
| U0-35 | Target torque (%) | 0.1% | ● |
| U0-36 | Rotation position | 1 | ● |
| U0-37 | Power factor angle | 0.1° | ● |
| U0-39 | Target voltage upon V/F separation | 1 V | ● |
| U0-40 | Output voltage upon V/F separation | 1 V | ● |
| U0-41 | DI state visual display | 1 | ● |
| U0-42 | DO state visual display | 1 | ● |
| U0-43 | DI function state visual display 1 (function 01–40) | 1 | ● |
| U0-44 | DI function state visual display 2 (function 41–80) | 1 | ● |
| U0-45 | Fault information | 1 | ● |
| U0-59 | Current set frequency (%) | 0.01% | ● |
| U0-60 | Current running frequency (%) | 0.01% | ● |
| U0-61 | AC drive running state | 1 | ● |
| U0-62 | Current fault code | 1 | ● |
| U0-65 | Torque upper limit | 0.1% | ● |

---

## Chapter 7 Maintenance and Troubleshooting

### 7.1 Fault Description

If fault happens during the operation of the CW100 inverter system, the inverter will stop the output immediately, and the inverter fault relay will make contact action. The inverter panel displays the fault code. The corresponding fault types and common solutions are shown in the table below.

The list is for reference only. Please do not repair or modify. If unable to troubleshoot, please seek technical support from the company or product agent.

### 7.2 Troubleshooting List

| Fault name | Display | Possible causes | Solutions |
| --- | --- | --- | --- |
| Inverter Unit Protection | Err01 | 1. The output circuit is grounded or short circuited.<br>2. The connecting cable of the motor is too long.<br>3. The IGBT overheats.<br>4. The internal connections become loose.<br>5. The main control board is faulty.<br>6. The drive board is faulty.<br>7. The AC drive IGBT is faulty. | 1. Eliminate external faults.<br>2. Install a reactor or an output filter.<br>3. Check the air filter and the cooling fan.<br>4. Connect all cables properly.<br>5. Contact technical support. |
| Overcurrent during acceleration | Err02 | 1. The output circuit is grounded or short circuited.<br>2. Motor auto-tuning is not performed.<br>3. The acceleration time is too short.<br>4. Manual torque boost or V/F curve is not appropriate.<br>5. The voltage is too low.<br>6. The startup operation is performed on the rotating motor.<br>7. A sudden load is added during acceleration.<br>8. The AC drive model is of too small power class. | 1. Eliminate external faults.<br>2. Perform the motor auto-tuning.<br>3. Increase the acceleration time.<br>4. Adjust the manual torque boost or V/F curve.<br>5. Adjust the voltage to normal range.<br>6. Select rotational speed tracking restart or start the motor after it stops.<br>7. Remove the added load.<br>8. Select an AC drive of higher power class. |
| Overcurrent during deceleration | Err03 | 1. The output circuit is grounded or short circuited.<br>2. Motor auto-tuning is not performed.<br>3. The deceleration time is too short.<br>4. The voltage is too low.<br>5. A sudden load is added during deceleration.<br>6. The braking unit and braking resistor are not installed. | 1. Eliminate external faults.<br>2. Perform the motor auto-tuning.<br>3. Increase the deceleration time.<br>4. Adjust the voltage to normal range.<br>5. Remove the added load.<br>6. Install the braking unit and braking resistor. |
| Overcurrent at constant speed | Err04 | 1. The output circuit is grounded or short circuited.<br>2. Motor auto-tuning is not performed.<br>3. The voltage is too low.<br>4. A sudden load is added during operation.<br>5. The AC drive model is of too small power class. | 1. Eliminate external faults.<br>2. Perform the motor auto-tuning.<br>3. Adjust the voltage to normal range.<br>4. Remove the added load.<br>5. Select an AC drive of higher power class. |
| Overvoltage during acceleration | Err05 | 1. The input voltage is too high.<br>2. An external force drives the motor during acceleration.<br>3. The acceleration time is too short.<br>4. The braking unit and braking resistor are not installed. | 1. Adjust the voltage to normal range.<br>2. Cancel the external force or install a braking resistor.<br>3. Increase the acceleration time.<br>4. Install the braking unit and braking resistor. |
| Overvoltage during deceleration | Err06 | 1. The input voltage is too high.<br>2. An external force drives the motor during deceleration.<br>3. The deceleration time is too short.<br>4. The braking unit and braking resistor are not installed. | 1. Adjust the voltage to normal range.<br>2. Cancel the external force or install the braking resistor.<br>3. Increase the deceleration time.<br>4. Install the braking unit and braking resistor. |
| Overvoltage at constant speed | Err07 | 1. The input voltage is too high.<br>2. An external force drives the motor during deceleration. | 1. Adjust the voltage to normal range.<br>2. Cancel the external force or install the braking resistor. |
| Control power supply fault | Err08 | The input voltage is not within the allowable range. | Adjust the input voltage to the allowable range. |
| Undervoltage | Err09 | 1. Instantaneous power failure occurs on the input power supply.<br>2. The AC drive's input voltage is not within the allowable range.<br>3. The bus voltage is abnormal.<br>4. The rectifier bridge and buffer resistor are faulty.<br>5. The drive board is faulty.<br>6. The main control board is faulty. | 1. Reset the fault.<br>2. Adjust the voltage to normal range.<br>3. Contact technical support. |
| AC drive overload | Err10 | 1. The load is too heavy or locked-rotor occurs on the motor.<br>2. The AC drive model is of too small power class. | 1. Reduce the load and check the motor and mechanical condition.<br>2. Select an AC drive of higher power class. |
| Motor overload | Err11 | 1. P9-01 is set improperly.<br>2. The load is too heavy or locked-rotor occurs on the motor.<br>3. The AC drive model is of too small power class. | 1. Set P9-01 correctly.<br>2. Reduce the load and check the motor and the mechanical condition.<br>3. Select an AC drive of higher power class. |
| Power input phase loss | Err12 | 1. The three-phase power input is abnormal.<br>2. The drive board is faulty.<br>3. The lightning board is faulty.<br>4. The main control board is faulty. | 1. Eliminate external faults.<br>2. Contact technical support. |
| Power output phase loss | Err13 | 1. The cable connecting the AC drive and the motor is faulty.<br>2. The AC drive's three-phase outputs are unbalanced when the motor is running.<br>3. The drive board is faulty.<br>4. The IGBT is faulty. | 1. Eliminate external faults.<br>2. Check whether the motor three-phase winding is normal.<br>3. Contact technical support. |
| IGBT overheat | Err14 | 1. The ambient temperature is too high.<br>2. The air filter is blocked.<br>3. The fan is damaged.<br>4. The thermally sensitive resistor of the IGBT is damaged.<br>5. The AC drive IGBT is damaged. | 1. Lower the ambient temperature.<br>2. Clean the air filter.<br>3. Replace the damaged fan.<br>4. Replace the damaged thermally sensitive resistor.<br>5. Replace the AC drive IGBT. |
| External equipment fault | Err15 | 1. External fault signal is input via DI.<br>2. External fault signal is input via virtual I/O. | Reset the operation. |
| Communication fault | Err16 | 1. The host computer is in abnormal state.<br>2. The communication cable is faulty.<br>3. The communication parameters in group FD are set improperly. | 1. Check the cabling of host computer.<br>2. Check the communication cabling.<br>3. Set the communication parameters properly. |
| Contactor fault | Err17 | 1. The drive board and power supply are faulty.<br>2. The contactor is faulty. | 1. Replace the faulty drive board or power supply board.<br>2. Replace the faulty contactor. |
| Current detection fault | Err18 | 1. The HALL device is faulty.<br>2. The drive board is faulty. | 1. Replace the faulty HALL device.<br>2. Replace the faulty drive board. |
| Motor auto-tuning fault | Err19 | 1. The motor parameters are not set according to the nameplate.<br>2. The motor auto-tuning times out. | 1. Set the motor parameters according to the nameplate properly.<br>2. Check the cable connecting the AC drive and the motor. |
| EEPROM read-write fault | Err21 | The EEPROM chip is damaged. | Replace the main control board. |
| AC drive hardware fault | Err22 | 1. Overvoltage exists.<br>2. Overcurrent exists. | 1. Handle based on overvoltage.<br>2. Handle based on overcurrent. |
| Short circuit to ground | Err23 | The motor is short circuited to the ground. | Replace the cable or motor. |
| Accumulative running time reached | Err26 | The accumulative running time reaches the setting value. | Clear the record through the parameter initialization function. |
| User-defined fault 1 | Err27 | 1. The user-defined fault 1 signal is input via DI.<br>2. User-defined fault 1 signal is input via virtual I/O. | Reset the operation. |
| User-defined fault 2 | Err28 | 1. The user-defined fault 2 signal is input via DI.<br>2. The user-defined fault 2 signal is input via virtual I/O. | Reset the operation. |
| Accumulative power-on time reached | Err29 | The accumulative power-on time reaches the setting value. | Clear the record through the parameter initialization function. |
| Load becoming 0 | Err30 | The AC drive running current is lower than P9-64. | Check that the load is disconnected or the setting of P9-64 and P9-65 is correct. |
| PID feedback lost during running | Err31 | The PID feedback is lower than the setting of PA-26. | Check the PID feedback signal or set PA-26 to a proper value. |
| Pulse-by-pulse current limit fault | Err40 | 1. The load is too heavy or locked-rotor occurs on the motor.<br>2. The AC drive model is of too small power class. | 1. Reduce the load and check the motor and mechanical condition.<br>2. Select an AC drive of higher power class. |
| Motor switchover fault during running | Err41 | Change the selection of the motor via terminal during running of the AC drive. | Perform motor switchover after the AC drive stops. |
| Motor overheat | Err45 | 1. The cabling of the temperature sensor becomes loose.<br>2. The motor temperature is too high. | 1. Check the temperature sensor cabling and eliminate the cabling fault.<br>2. Lower the carrier frequency or adopt other heat radiation measures. |
| Initial position fault | Err51 | The motor parameters are not set based on the actual situation. | Check that the motor parameters are set correctly and whether the setting of rated current is too small. |

### 7.3 Faults and Solutions

| No. | Symptom | Possible causes | Solutions |
| ---: | --- | --- | --- |
| 1 | No display at power-on. | 1. There is no power supply to the AC drive or the power input to the AC drive is too low.<br>2. The power supply of the switch on the drive board of the AC drive is faulty.<br>3. The rectifier bridge is damaged.<br>4. Inverter buffer resistance damage.<br>5. The control board or the operation panel is faulty.<br>6. The cable connecting the control board and the drive board and the operation panel breaks. | 1. Check the power supply.<br>2. Check the bus voltage.<br>3. Re-connect the 8-core and 28-core cables.<br>4. Contact technical support. |
| 2 | “100” is displayed at power-on. | 1. The cable between the drive board and the control board is in poor contact.<br>2. Related components on the control board are damaged.<br>3. The motor or the motor cable is short circuited to the ground.<br>4. The HALL device is faulty.<br>5. The power input to the AC drive is too low. | 1. Re-connect the 8-core and 28-core cables.<br>2. Contact technical support. |
| 3 | “Err23” is displayed at power-on. | 1. The motor or the motor output cable is short-circuited to the ground.<br>2. The AC drive is damaged. | 1. Measure the insulation of the motor and the output cable with a megger.<br>2. Contact technical support. |
| 4 | The AC drive display is normal upon power-on. But “100” is displayed after running and stops immediately. | 1. The cooling fan is damaged or locked-rotor occurs.<br>2. The external control terminal cable is short circuited. | 1. Replace the damaged fan.<br>2. Eliminate external fault. |
| 5 | Err14 (IGBT overheat) fault is reported frequently. | 1. The setting of carrier frequency is too high.<br>2. The cooling fan is damaged, or the air filter is blocked.<br>3. Components inside the AC drive are damaged (thermal coupler or others). | 1. Reduce the carrier frequency (P0-15).<br>2. Replace the fan and clean the air filter.<br>3. Contact technical support. |
| 6 | The motor does not rotate after the AC drive runs. | 1. Check the motor and the motor cables.<br>2. The AC drive parameters are set improperly (motor parameters).<br>3. The cable between the drive board and the control board is in poor contact.<br>4. The drive board is faulty. | 1. Ensure the cable between the AC drive and the motor is normal.<br>2. Replace the motor or clear mechanical faults.<br>3. Check and re-set motor parameters. |
| 7 | The AC drive reports overcurrent and overvoltage frequently. | 1. The motor parameters are set improperly.<br>2. The acceleration/deceleration time is improper.<br>3. The load fluctuates. | 1. Re-set motor parameters or re-perform the motor auto-tuning.<br>2. Set proper acceleration/deceleration time.<br>3. Contact technical support. |
| 8 | No display upon power-on. | Related component on the control board is damaged. | Replace the control board. |

### 7.4 Braking Resistance Specification

| VFD model | VFD specification | Recommended power | Recommended resistance | Braking unit | Remark |
| --- | --- | --- | --- | --- | --- |
| **Single phase 220 V input, three phase 220 V output** | | | | | |
| CW100-S0.7GB | 0.75 kW 220 V | 80 W | ≥ 150 Ω | Built-in (standard) | No special description |
| CW100-S1.5GB | 1.5 kW 220 V | 100 W | ≥ 100 Ω | Built-in (standard) | No special description |
| CW100-S2.2GB | 2.2 kW 220 V | 100 W | ≥ 70 Ω | Built-in (standard) | No special description |
| **Three phase 380 V input, three phase 380 V output** | | | | | |
| CW100-T0.7GB | 0.75 kW 380 V | 150 W | ≥ 300 Ω | Built-in (standard) | No special description |
| CW100-T1.5GB | 1.5 kW 380 V | 150 W | ≥ 220 Ω | Built-in (standard) | No special description |
| CW100-T2.2GB | 2.2 kW 380 V | 250 W | ≥ 200 Ω | Built-in (standard) | No special description |
| CW100-T4.0GB | 4 kW 380 V | 300 W | ≥ 130 Ω | Built-in (standard) | No special description |
| CW100-T5.5GB | 5.5 kW 380 V | 400 W | ≥ 90 Ω | Built-in (standard) | No special description |
| CW100-T7.5GB | 7.5 kW 380 V | 500 W | ≥ 65 Ω | Built-in (standard) | No special description |
| CW100-T11.0GB | 11 kW 380 V | 800 W | ≥ 43 Ω | Built-in (standard) | No special description |
