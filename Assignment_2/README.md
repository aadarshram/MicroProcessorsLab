# Assignment 2: Johnson Counter Simulation and Implementation

This repository contains Verilog code and testbenches for simulating and implementing a 3-bit Johnson counter, along with its supporting components. This was developed as part of **Assignment 2** in the **Microprocessors Lab (EE2016)** course.

## Components

The implementation includes the following modules:

- **D Flip-Flop**: Implemented with and without reset functionality.
- **Clock Divider**: Used to generate slower clock signals for the counter.
- **Decoder**: Converts the counter state to an active output representation.
- **3-bit Johnson Counter**: The main counter circuit demonstrating a Johnson counter's behavior.

## Tools Used

- **Xilinx Vivado**: For simulation, synthesis, and hardware testing.
- **FPGA Board**: For verifying the implementation on hardware.

## Repository Structure

The repository is organized as follows:

- **`src/`**: Contains Verilog module files for all components, such as `d_flip_flop.v`, `decoder.v`, `clock_divider.v`, and `johnson_counter.v`.
- **`testbench/`**: Includes testbench files to simulate and verify the behavior of each module (e.g., `d_flip_flop_tb.v`, `decoder_tb.v`).
- **`simulation/`**:
  - **`executable/`**: Stores compiled simulation files.
  - **`waveforms/`**: Contains `.vcd` files for visualizing waveforms in GTKWave.
- **`report`**: Includes the detailed assignment report.

## Simulation and Testing

Each module has been thoroughly tested with its respective testbench. Waveform outputs were generated using GTKWave to debug and verify functionality.

## Report

The comprehensive report for Assignment 2, detailing the implementation, simulation results, and hardware testing, can be found [here](https://github.com/aadarshram/MicroProcessorsLab_EE2016/blob/main/Assignment_2/Assgn2_Report.pdf).

---
