# ECE2700J Lab 6: Keypad Scanner Design

**Authors:** Arsen Boyajyan, Zimo Wang

**Date:** 7/15/2024

**Lab Description:** Implementation of a keypad scanner using a Finite State Machine (FSM).  The scanner reads inputs from a 4x4 hexadecimal keypad and displays the corresponding hexadecimal value on an SSD.


## 1. Objective

The goal of this lab was to design a Finite State Machine (FSM) that reads key presses from a 4x4 keypad and displays the corresponding hexadecimal value on a seven-segment display (SSD).

## 2. Design

The keypad scanner is implemented as a Finite State Machine (FSM) with the following key features:

* **Pull-down Circuit:**  A pull-down resistor is used on each row of the keypad to ensure a defined low state when no key is pressed.
* **Key Detection Algorithm:** The FSM sequentially activates columns to detect a pressed key, then identifies the row and column corresponding to the press.
* **Hexadecimal Code Generation:** The FSM generates the 4-bit hexadecimal code representing the pressed key.
* **SSD Driver:** The output is sent to a pre-existing SSD driver (from Lab 5) for display on the seven-segment display.
* **State Diagram:** A state diagram (Figure 3 in the lab document) outlines the FSM's behavior.


## 3. Implementation

* **Verilog HDL:** The FSM is implemented using Verilog HDL.
* **Simulation:** The design was simulated using HDL Bencher to verify functionality.
* **Synthesis and FPGA Implementation:** The design was synthesized and implemented on a Basys 3 FPGA board.

