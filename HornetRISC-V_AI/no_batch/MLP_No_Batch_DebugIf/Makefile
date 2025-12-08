CC32=riscv32-unknown-elf
CCFLAGS=-march=rv32imf -mabi=ilp32f -ffp-contract=off -mstrict-align -malign-data=xlen -O3 -fno-math-errno -T ../linksc.ld -lm -nostartfiles -ffunction-sections -fdata-sections -Wl,--gc-sections -o inference_light_noBatch_DebugIf.elf



build:
	$(CC32)-gcc inference_light_noBatch_DebugIf.c ../crt0.s $(CCFLAGS)
	$(CC32)-objcopy -O binary -j .init -j .text -j .rodata -j .sdata inference_light_noBatch_DebugIf.elf inference_light_noBatch_DebugIf.bin
	../rom_generator inference_light_noBatch_DebugIf.bin
	cp inference_light_noBatch_DebugIf.data memory_init_tb.mem
