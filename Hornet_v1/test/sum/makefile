CC32=riscv64-unknown-elf
CCFLAGS=-march=rv32imf -mabi=ilp32f -ffp-contract=off -mstrict-align -malign-data=xlen -O3 -fno-math-errno -T ../linksc-10000.ld -lm -nostartfiles -ffunction-sections -fdata-sections -Wl,--gc-sections -o sum.elf



build:
	$(CC32)-gcc sum.c ../crt0.s $(CCFLAGS)
	$(CC32)-objcopy -O binary -j .init -j .text -j .rodata -j .sdata sum.elf sum.bin
	../rom_generator sum.bin
	cp sum.data ../memory_contents
