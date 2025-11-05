RISC-V Edge AI: C Firmware & Build System
=========================================

## Overview

This directory contains all the C source code, headers, and build scripts necessary to compile the firmware for the RISC-V processor. This firmware is responsible for running the "lightweight" neural network model (`model_infer`).

The C program's main function is to:
1.  Initialize the UART and interrupt controller.
2.  Run one hard-coded inference test at boot and send the result (for a quick self-test).
3.  Enter an infinite loop, enabling interrupts.
4.  Wait until the UART interrupt handler has received a full input vector (488 bytes) from the host PC.
5.  Run the `model_infer` function on the new data.
6.  Transmit the 1-byte result back to the host PC.
7.  Reset the counter and wait for the next vector.

---------------------------------

## Hardware & Clock Constraints

To ensure stable operation and meet timing, the RISC-V processor clock must be set to **10 MHz**.

The design **must** operate under a 20 MHz clock frequency to avoid timing failures.

---------------------------------

## Core Components & File Descriptions

* `inference_light.c`: This is the main firmware file. It contains the `main` loop, the `fast_irq0_handler` (Interrupt Service Routine), and the complete implementation of the neural network (`model_infer`). It orchestrates receiving data, running the model, and sending the result.

* `uart.c` / `uart.h`: These are the driver files for the UART peripheral. They provide low-level functions like `uart_init()` and `uart_transmit_byte()` that directly interact with the UART hardware's memory-mapped registers.

* `irq.c` / `irq.h`: These files manage the RISC-V's interrupt system. They are responsible for setting up the interrupt controller, defining the interrupt vector table (e.g., `fast_irq0_handler`), and providing functions to enable/disable interrupts (`ENABLE_GLOBAL_IRQ`, `DISABLE_GLOBAL_IRQ`, etc.).

* `crt0.s`: The "C Runtime" startup file. This is the very first code that runs on the CPU. Its job is to set up the stack pointer and call the `main` function in `inference_light.c`.

* `linksc.ld`: The linker script. This is a critical file that tells the compiler *how* to organize the final program in memory. (See "Memory Configuration" section).

* `Makefile`: The build automation script. (See "Makefile Specs" section).

* `inference_light.data`: This is an **output file**, not a source file. It is the final binary program (`.elf`) converted into a hex-text format that Vivado's BRAM can read to initialize its memory.

---------------------------------

## `inference_light.c` - Optimization

This firmware implements `model_infer`, a "lightweight" model that is significantly more efficient than previous versions. The optimization comes from the model's **architecture**, which is then implemented by this C code.

This new model uses techniques like Batch Normalization and a tuned 5-layer structure (122 -> 256 -> 128 -> 64 -> 32 -> 5). By "baking" normalization parameters into the model, the total size of the required weights and biases is dramatically reduced.

This allows the model's data file (which is compiled into the firmware) to be approximately **78k** instead of a much larger unoptimized version (e.g., 240k), all while maintaining the same prediction accuracy. The C code is a direct, efficient implementation of this new, smaller model.

---------------------------------

## Makefile Specs

The `Makefile` automates the entire compilation and deployment process.

* **`build` (Primary Target):** This is the main command to build the FPGA firmware.
    1.  `$(CC32)-gcc ...`: Compiles all C and assembly files (`.c`, `.s`) into a single `inference_light.elf` file.
        * `-O3`: Enables high-level code optimization.
        * `-T linksc.ld`: Tells the linker to use our custom `linksc.ld` memory map.
        * `-Wl,--gc-sections`: "Garbage collects" any unused functions or data, reducing the final file size.
    2.  `$(CC32)-objcopy ...`: Extracts the raw, runnable binary code and read-only data from the `.elf` file and saves it as `inference_light.bin`.
    3.  `../rom_generator ...`: A custom utility that converts the `.bin` file into the Verilog-readable hex format, creating `inference_light.data`.
    4.  `cp ...`: Copies the final `inference_light.data` file into the Vivado project's memory initialization directory.

* **`comp` (Test Target):**
    * `gcc inference_light.c ...`: A simple command to compile the C code *on your host PC* (Linux/Windows). This is used for **local debugging** of the `model_infer` logic, completely separate from the FPGA.

---------------------------------

## Memory Configuration (Vivado & Linker)

To fit the program, the C compiler (linker) and the Vivado hardware (BRAM) **must** have the exact same memory layout. This is configured in two places:

**Step 1: Vivado (Hardware)**
In your memory module's Verilog file (e.g., `memory_2rw_wb.v`), you must define the total size of the BRAM.
```verilog
parameter RAM_DEPTH = 120000;

WARNING: As noted, you must set this parameter directly in the memory module. Do not use a top-level ADDR_WIDTH parameter, as this is known to cause bugs in some Vivado versions.

**Step 2: Linker Script (Software) The linksc.ld file partitions the 480KB of hardware memory into two sections for the software:
MEMORY
{
    /* Code + Read-Only Data */
    ROM(RX)   : ORIGIN = 0x00000000, LENGTH = 0x00050000  /* 320 KB */
    
    /* Writable Data + Stack + Heap */
    RAM(WAIL) : ORIGIN = 0x00050000, LENGTH = 0x0001FFFC  /* ~128 KB */
}

ROM: The program code (.text) and constants (.rodata) are placed here. This 320KB region is what inference_light.data will initialize.RAM: This 128KB region starts immediately after the ROM. It is used for all read/write data (.data, .sdata, .bss), the stack, and the heap.The total 448KB (320KB + 128KB) fits inside the 480KB block defined in Vivado.