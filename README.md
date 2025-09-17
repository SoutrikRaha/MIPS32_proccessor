# MIPS32 Pipeline (Verilog)

This repository contains my Verilog implementation of a 5-stage MIPS32 pipeline CPU.
The project was developed and simulated in **Xilinx Vivado** (no FPGA hardware used).

## 📂 Project Structure
- `src/` – Synthesizable design files (MIPS32 pipeline implementation)
- `tb/` – Testbench for simulation
- `screenshots/` – Simulation results and waveform captures

## 🖥️ Simulation
Simulation was run in Vivado Behavioral Simulation.  
Here is an example waveform of instruction execution:

![Pipeline Simulation](screenshots/waveform_1.png)

## 🛠️ Tools Used
- Xilinx Vivado 202x.x
- Verilog HDL
- GTKWave (optional, for viewing `.vcd` files)

## 📖 Notes
- No FPGA board was used – this is **simulation-only**.
- The testbench preloads memory with a small program and prints register contents.
