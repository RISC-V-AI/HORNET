 
# RISC-V Edge AI: Vivado Project Setup

This document provides the necessary instructions to set up the Vivado hardware project, configure the required IPs, and successfully synthesize the design for an FPGA.

## 1. Clocking Wizard (IP Configuration)

A Xilinx Clocking Wizard IP is required to generate the stable 10 MHz clock for the RISC-V core from the on-board oscillator.

When setting up the IP, use the following specifications:
* **Input Frequency:** 100 MHz (from the board's primary oscillator).
* **Output Frequency (clk_out1):** 10 MHz.
    * The design is tested and stable at 10 MHz and 20 MHz. It is currently set for 10 MHz.
* **Other Settings:** Keep the defaults. The output clock must be **Active High**, and the **`locked`** and **`reset`** pins must be enabled and used.

**Important:** If you want to change the clock frequency (e.g., to 20 MHz):
1.  You must **re-generate the Clocking Wizard IP** from the beginning with the new frequency.
2.  You must update the corresponding clock frequency parameter in the `fpga_top.v` module.

> **Note:** If you migrate this project to a different FPGA board or part, you **must** re-generate the Clocking Wizard IP to ensure compatibility.

---

## 2. Adding Sources

### Design Sources
Add all Verilog files from the `src/` folder to your Vivado project's **Design Sources**.

* **For Implementation:** `fpga_top.v` is the tested top module and is ready for synthesis and implementation. The `barebones_wb_top.v` module may require tweaks to work correctly.
* **Do NOT Add Testbenches:** Be sure *not* to add `barebones_wb_top_tb.v` or any other testbenches to the *design* sources.

### Simulation Sources
* `barebones_wb_top_tb.v` is the primary testbench file and should be added **only** to the **Simulation Sources** folder in Vivado.
* **Running Simulation:** The AI firmware (`inference_light.data`) is designed to work with `fpga_top.v`.
* To run behavioral simulations using `barebones_wb_top_tb.v`, you must:
    1.  Edit the `barebones` module to use the correct reset vectors for simulation.
    2.  Write and compile new C code (firmware) that is compatible with those simulation vectors.
    3.  Highly recommend to use debug interface to simulate. (For instants, check the Hornet_v1 for all the tests done)
    4.  Note that not all the tests are tested for AI or UART test environments in test folder. (only aes_main and HornetRISC-V_AI has been tested via implementation)


---

## 3. Constraints

* The `constraints/` folder contains an example `.xdc` file for a **Nexys Video** board.
* For many use cases, a **Nexys A7-100T** board is more than sufficient for this project.
* You **must** provide your own constraint file that correctly maps the top-level ports (clock, reset, UART, etc.) to your specific FPGA board's pins.

---

## 4. Memory Configuration & Optimization

The BRAM depth is a critical parameter that impacts resource usage and compilation time.

* The memory module is `memory_2rw_wb.v`.
* The default size is set to `parameter RAM_DEPTH = 120000;`.
* **Optimization:** If your C code (like the `inference_light.data` file) does not use all 120,000 registers, **you should make this memory smaller**.
* **Benefit:** Reducing `RAM_DEPTH` will significantly decrease synthesis, implementation, and simulation times.
* **Requirement:** If you change the `RAM_DEPTH` in the Verilog, you **must** update your C firmware's **linker script (`linksc.ld`)** and C code to match the new memory map.

---

## 5. Additional Test Notes

The bit files in this folder is working with Nexys Video for 10 and 20 MHz clock frequency, if you wanna test with implemented on FPGA.

For further testing and reference:
* The `aes_main` project from `Hornet_v1` was successfully tested on both the Nexys A7-100T and the Nexys Video.
* All test files, including the one for this AI project (named `NSL-KDD_UART(final)`), can be found in the main project folder.
