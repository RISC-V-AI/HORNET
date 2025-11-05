CC32=riscv32-unknown-elf
CCFLAGS=-march=rv32imf -mabi=ilp32f -ffp-contract=off -mstrict-align -malign-data=xlen -O3 -fno-math-errno -T linksc.ld -lm -nostartfiles -ffunction-sections -fdata-sections -Wl,--gc-sections -o inference.elf



build:
	$(CC32)-gcc inference.c uart.c irq.c crt0.s $(CCFLAGS)
	$(CC32)-objcopy -O binary -j .init -j .text -j .rodata -j .sdata inference.elf inference.bin
	./rom_generator inference.bin
	cp inference.data ../../memory_contents/instruction.data


comp:
	gcc inference.c -lm -o inference