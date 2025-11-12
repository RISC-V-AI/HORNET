RISC-V Edge AI: C Firmware & Build System
=========================================

## Overview

This directory contains all the C source code, headers, and build scripts necessary to compile the firmware for the Hornet processor. This firmware is responsible for running the "lightweight" neural network model (`model_infer`).

This project is divided into two main workflows:
1.  **`fpga_top/`**: A full-featured build designed for FPGA synthesis and implementation. It includes UART, interrupts, and all peripherals.
2.  **`barebones_tb/`**: A lightweight build for fast behavioral simulation. It removes complex peripherals (like UART/IRQ) and uses a special debug interface to control the testbench.

**NOTE:** UART and other peripherals can be implement in the barebones_tb since its still a part of the Hornet-Wishbone structure.

---------------------------------

## ⏱️ Hardware & Clock Constraints

To ensure stable operation and meet timing, the RISC-V processor clock of Hornet is set to be 20 MHz.

The design **must** operate in under 20MHz clock frequency to avoid timing failures for designs using Floating-Point-Unit (FPU). For RV32IM designs and designs that not going to implement on a FPGA (simulation only workflows), it is verified to be working 40MHz and under  

---------------------------------

## 🛠️ RISC-V Toolchain Installation

Before you can build, you need the RISC-V cross-compiler (e.g., `riscv32-unknown-elf-gcc`) to compile your C codes into Machine Code (or Assemly if needed).

### 1. Install Prerequisites

```
sudo apt-get install autoconf automake autotools-dev curl python3 python3-pip python3-tomli libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build git cmake libglib2.0-dev libslirp-dev
```
### 2. Download and Configure

```
git clone https://github.com/riscv/riscv-gnu-toolchain 
cd riscv-gnu-toolchain 
git submodule update --init --recursive
```
Configure for RV32IMF (Integer, Multiply, Single-Float)
```
./configure --prefix=/opt/riscv --enable-multilib --with-arch=rv32imf --with-abi=ilp32f
```

### 3. Compile (This takes a long time!) ☕

```
make -j$(nproc)
```
### 4. Update Your PATH

Add this line to the end of your ~/.bashrc file
```
export PATH="$PATH:/opt/riscv/bin"
```

Apply the change to your current terminal
```
source ~/.bashrc
```

Check if it worked
```
riscv32-unknown-elf-gcc --version
```

**NOTE:** For further details: [riscv-gnu-toolchain GitHub](https://github.com/riscv-collab/riscv-gnu-toolchain)
---------------------------------

## ⚙️ Workflow 1: FPGA Implementation (fpga_top)

This build is for the full hardware implementation on an FPGA.

### Core Components
Located in `fpga_top/`, this build includes:

| File | Description |
| :--- | :--- |
| `inference_light.c` | Main firmware with `main` loop and AI model. |
| `uart.c` / `uart.h` | Drivers for the UART peripheral (for PC communication). |
| `irq.c` / `irq.h` | Handlers for the interrupt system. |
| `crt0.s` | C runtime startup file, no need to touch. |
| `Makefile` | Builds firmware and creates the `memory_init.mem` for Vivado. |
| `rom_generator` | Builds ROM from `.bin` to `.data`, other than extremely large Instruction Memory needed projects, no need to touch. |
| `linksc.ld` | Linker script to bound the C to Machine Code in terms of memory. Required to generate `memory_init.mem`. Edit if RAM/ROM ratio or capacity differs for your project.|

The C program's main function is to:
1.  Initialize UART and interrupts.
2.  Run one hard-coded inference test at boot.
3.  Enter an infinite loop, waiting for UART interrupts.
4.  Receive a full input vector (488 bytes) from the host PC.
5.  Run the `model_infer` function on the new data.
6.  Transmit the 1-byte result back to the host PC.

### Makefile Specs (`fpga_top/Makefile`)
* **`build` (Primary Target):**
    1.  `$(CC32)-gcc ...`: Compiles all C/assembly files into `inference_light.elf`.
    2.  `$(CC32)-objcopy ...`: Extracts the binary into `inference_light.bin`.
    3.  `../rom_generator ...`: Converts the `.bin` to `inference_light.data`.
    4.  `cp ...`: Copies `inference_light.data` to the Vivado project's memory initialization file (e.g., `memory_init.mem`).

---------------------------------

## 🔬 Workflow 2: Behavioral Simulation (barebones_tb)

This build is for running fast behavioral simulations in Vivado/XSim. It is a minimal system that **does not use UART or interrupts**. Of course any peripheral can be implemented, but in this case, it does not necessary due to the existance of FPGA test suit.  

### Core Components
Located in `barebones_tb/`:

| File | Description |
| :--- | :--- |
| `inference_light.c` | A modified main program with same functions. Runs the AI model and ends the simulation. |
| `Makefile` | Builds the simulation-specific firmware (`memory_init_tb.mem`).  |

### Peripherals
The `barebones_wb_top` Verilog module is minimal and contains 3 peripherals:
1.  Memory
2.  `mtime` (Machine Timer)
3.  `debug_if` (Debug Interface)

### 🐞 Simulation Control via Debug Interface
This build uses a custom debug peripheral to control the simulation.
* **Address:** The debug interface (`debug_if`) is mapped to address `0x10008010`.
* **C Code:** The `barebones_tb/inference_light.c` file writes a value (e.g., `1`) to this address after its tasks are complete. You can send any char only if the barebones_top_tb.v changed accordingly.
* **Verilog Testbench:** The `barebones_top_tb.v` testbench monitors this address. When it detects a write to the debug adress, it calls `$finish` to end the simulation gracefully.

> **Check `barebones_tb/inference_light.c`** for the specific implementation of this debug feature.

### Makefile Specs (`barebones_tb/Makefile`)
* **`build` (Primary Target):**
    ```
    CC32=riscv32-unknown-elf
    CCFLAGS=-march=rv32imf -mabi=ilp32f -ffp-contract=off -mstrict-align -malign-data=xlen -O3 -fno-math-errno -T ../linksc.ld -lm -nostartfiles -ffunction-sections -fdata-sections -Wl,--gc-sections -o inference_light.elf
    
    build:
        $(CC32)-gcc inference_light.c ../crt0.s $(CCFLAGS)
        $(CC32)-objcopy -O binary -j .init -j .text -j .rodata -j .sdata inference_light.elf inference_light.bin
        ../rom_generator inference_light.bin
        cp inference_light.data memory_init_tb.mem
    ```
* **Key Difference:** This makefile creates `inference_light.data` and **copies it to `memory_init_tb.mem`**. This is the memory file you must use for your behavioral simulation. It is separate from the `memory_init.mem` used for the FPGA. This `.mem` file is not for the source but rather simulation source. Add accordingly.

---------------------------------

## 📦 Common Components

### 🧠 `inference_light.c` - AI Model Optimization
Both firmware versions implement `model_infer`, a "lightweight" neural network model.
* The model uses Batch Normalization and a 5-layer structure (122 -> 256 -> 128 -> 64 -> 32 -> 5).
* By "baking" normalization parameters into the model, the total size of the weights is reduced to approximately **78k**.
* The C code is a direct implementation of this new, smaller model.

### 💾 Memory Configuration (Vivado & Linker)
The C compiler (linker) and the Vivado hardware (BRAM) **must** have the same memory layout. This is defined by `linksc.ld` (used by both builds) and the Verilog hardware.

**Step 1: Vivado (Hardware)**
In your memory module (`memory_2rw_wb.v`), you must define the total BRAM size.
```verilog
parameter RAM_DEPTH = 120000;
```

WARNING: You must set this parameter directly in the memory module. Do not use a top-level ADDR_WIDTH parameter, as this is known to cause bugs in some Vivado versions. However, your ADDR_WIDTH in the top_module must contain (or overflow) your memory by the means of log2. (e.g. 2^18 = 262144 > 120000) 

**Step 2: Linker Script (Software) The linksc.ld file partitions the 480KB of hardware memory:**
```
MEMORY
{
    /* Code + Read-Only Data */
    ROM(RX)   : ORIGIN = 0x00000000, LENGTH = 0x00050000  /* 320 KB */
    
    /* Writable Data + Stack + Heap */
    RAM(WAIL) : ORIGIN = 0x00050000, LENGTH = 0x0001FFFC  /* ~128 KB */
}
```
ROM: The program code (.text) and constants (.rodata). This 320KB region is initialized by inference_light.data.

RAM: The 128KB region for all read/write data (.data, .bss), the stack, and the heap.

The total 448KB fits inside the 480KB block defined in Vivado.

### 🧩 Customizing Peripherals
The barebones module is intentionally simple. If you wish to add more peripherals (like UART, IRQ, etc.) for simulation, you can, manually. Use fpga_top Verilog files as a reference for how to instantiate and connect them.
