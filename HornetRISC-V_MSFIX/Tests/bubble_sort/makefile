CC32=riscv32-unknown-elf
CCFLAGS=-march=rv32imf -mabi=ilp32f -O3 -fno-math-errno -T ../linksc.ld -lm -nostartfiles -ffunction-sections -fdata-sections -Wl,--gc-sections -g -ggdb -o bubble_sort.elf
build:
	$(CC32)-gcc bubble_sort.c ../crt0.s $(CCFLAGS)
	$(CC32)-objcopy -O binary -j .init -j .text -j .rodata -j .sdata bubble_sort.elf bubble_sort.bin
	../rom_generator bubble_sort.bin
	cp bubble_sort.data ../memory_contents