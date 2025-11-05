CC32=riscv64-unknown-elf
CCFLAGS=-march=rv32imf -mabi=ilp32f -ffp-contract=off -mstrict-align -malign-data=xlen -O3 -fno-math-errno -T linksc.ld -lm -nostartfiles -ffunction-sections -fdata-sections -Wl,--gc-sections -o mnist.elf


10K-CCFLAGS=-march=rv32imf -mabi=ilp32f -ffp-contract=off -mstrict-align -malign-data=xlen -Os -fno-math-errno -T ../linksc-10000.ld -lm -nostartfiles -ffunction-sections -fdata-sections -Wl,--gc-sections -g -ggdb -o fpu_filter.elf

build:
	$(CC32)-gcc mnist.c uart.c irq.c crt0.s $(CCFLAGS)
	$(CC32)-objcopy -O binary -j .init -j .text -j .rodata -j .sdata mnist.elf mnist.bin
	../rom_generator mnist.bin
	cp mnist.data ../memory_contents/instruction.data


comp:
	gcc mnist.c -lm -o mnist