CC32=riscv32-unknown-elf
CCFLAGS=-march=rv32imf -mabi=ilp32f -ffp-contract=off -mstrict-align -malign-data=xlen -O3 -fno-math-errno -T ../linksc.ld -nostartfiles -ffunction-sections -fdata-sections -Wl,--gc-sections -o nsl-kdd.elf


build:
	$(CC32)-gcc inference.c ../crt0.s $(CCFLAGS)
	$(CC32)-objcopy -O binary -j .init -j .text -j .rodata -j .sdata nsl-kdd.elf nsl-kdd.bin
	../rom_generator nsl-kdd.bin
	cp nsl-kdd.data ../memory_contents/instruction.data


comp:
	gcc inference.c -lm -o inference