CC32=riscv64-unknown-elf
CCFLAGS=-march=rv32im_zicsr -mabi=ilp32 -mstrict-align -malign-data=xlen -O3 -fno-math-errno -T ../linksc-10000.ld -lm -nostartfiles -ffunction-sections -fdata-sections -Wl,--gc-sections -o hello.elf


10K-CCFLAGS=-march=rv32im_zicsr -mabi=ilp32 -mstrict-align -malign-data=xlen -Os -fno-math-errno -T ../linksc-10000.ld -lm -nostartfiles -ffunction-sections -fdata-sections -Wl,--gc-sections -g -ggdb -o hello.elf

build:
	$(CC32)-gcc hello.c polyvec.c poly.c ntt.c reduce.c fips202.c sign.c packing.c rounding.c symmetric-shake.c ../crt0.s $(CCFLAGS)
	$(CC32)-objcopy -O binary -j .init -j .text -j .rodata -j .sdata hello.elf hello.bin
	../rom_generator hello.bin
	cp hello.data ../memory_contents
