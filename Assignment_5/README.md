# Assignment 5: Microprocessors (EE2016)

This repository contains the C code written for various microcontroller-based tasks as part of **Assignment 5** for the **Microprocessors Lab (EE2016)** course. The assignment involved writing and testing programs for a variety of tasks and verifying the functionality on a breadboard circuit.

## Tasks Implemented

1. **Johnson Counter**: Implemented a Johnson counter using assembly.
2. **LED Blinking**: A program to blink an LED at a defined frequency.
3. **LED Alternate Blinking**: Alternately blinking two LEDs in sequence.
4. **LED Counter**: Counting operations displayed using LEDs.
5. **Static LED On**: A program to switch on LEDs without blinking.
6. **Johnson Counter on Different Port**: A Johnson counter implementation using a different port on the microcontroller.
7. **Sum of Two Bits**: Calculating the sum of two bits on the same or different ports of the IC.
8. **Sum of Four-Bit Numbers**: Calculating the sum of two four-bit numbers.

## Tools Used

- **Microchip Studio**: For writing and building C code.
- **Burn-O-Mat**: To burn the program onto the microcontroller.

## Hardware Verification

All programs were tested on a breadboard circuit. The correctness of the implementation was verified through physical observations and debugging.

## Repository Structure

- **`src/`**: Contains all C source files for the tasks.

  - `johnson_counter.c`
  - `led_blink.c`
  - `led_alternate_blink.c`
  - `led_count.c`
  - `led_on.c`
  - `portC_johnson_counter.c`
  - `sum_two_bits.c`
  - `portC_sum_two_bits.c`
  - `sum_four_bits.c`

- **`report`**: Contains detailed documentation and results of the assignment.

## Report

The comprehensive report for Assignment 5, including circuit details, code explanations, and results, can be downloaded [here](https://github.com/aadarshram/MicroProcessorsLab_EE2016/blob/main/Assignment_5/Assgn5_Report.pdf).
