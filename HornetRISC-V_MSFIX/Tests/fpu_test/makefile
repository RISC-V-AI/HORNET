CC32=riscv32-unknown-elf
CCFLAGS=-march=rv32imf -mabi=ilp32f -O3 -fno-math-errno -T ../linksc.ld -lm -nostartfiles -ffunction-sections -fdata-sections -Wl,--gc-sections -g -ggdb -o sum.elf
10K-CCFLAGS=-march=rv32imf -mabi=ilp32f -O3 -fno-math-errno -T ../linksc-10000.ld -lm -nostartfiles -ffunction-sections -fdata-sections -Wl,--gc-sections -g -ggdb -o sum-10000.elf

build:
	$(CC32)-gcc sum.c ../crt0.s $(CCFLAGS)
	$(CC32)-objcopy -O binary -j .init -j .text -j .rodata -j .sdata sum.elf sum.bin
	../rom_generator sum.bin
	cp sum.data ../memory_contents


