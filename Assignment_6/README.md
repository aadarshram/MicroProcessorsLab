# Assignment 6: AVR Interrupt Handling with ATmega8

This contains the implementation and documentation for an assignment on **AVR Interrupt Handling** using the **ATmega8 microcontroller**, a **USBASP board**, and a breadboard in the course **Microprocessors Lab (EE2016)**. The assignment involved designing circuits and writing programs to demonstrate interrupt-based functionality.

## Tasks Implemented

1. **Red LED Blinking on Interrupt**:

   - Implemented in AVR assembly.
   - The circuit blinks a red LED upon receiving an interrupt.

2. **White LED Glow When No Interrupt**:
   - Extended the previous circuit to include a white LED that glows when no interrupt is detected while red glows on interrupt.
   - Implemented in both AVR assembly and C.

## Tools Used

- **Microchip Studio**: For writing and building both C and assembly programs.
- **Burn-O-Mat**: For flashing the microcontroller using a USBASP programmer.
- **Breadboard**: For building and testing the circuits.

## Programming and Debugging

The assignment provided hands-on experience in:

- Writing efficient interrupt-handling routines in assembly and C.
- Debugging interrupt-driven systems on hardware.
- Observing the behavior of LEDs under different interrupt scenarios.

## Repository Structure

- **`src/`**: Contains the source code files for the tasks:

  - `red_led_interrupt.asm`
  - `white_led_no_interrupt.asm`
  - `white_led_no_interrupt.c`

- **`report`**: Contains the detailed assignment report with observations, debugging notes, and solutions.

## Report

The complete report for this assignment, including design details, observations, and programming insights, can be accessed [here](https://github.com/aadarshram/MicroProcessorsLab_EE2016/blob/main/Assignment_6/Assgn6_Report.pdf).
