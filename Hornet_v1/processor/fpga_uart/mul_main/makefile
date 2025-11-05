CC32=/home/gstl/opt/riscv/bin/riscv64-unknown-elf
CC64=/home/gstl/opt/riscv/bin/riscv64-unknown-elf
CCFLAGS=-march=rv32im_zicsr -mabi=ilp32 -O3 -T linksc.ld -nostartfiles -ffunction-sections -fdata-sections -Wl,--gc-sections -o aes_main.elf

build:
	$(CC32)-gcc aes_main.c ../../../lib/uart.c ../../../lib/irq.c crt0.s $(CCFLAGS)
	$(CC32)-objcopy -O binary -j .init -j .text -j .rodata aes_main.elf aes_main.bin
	../../../test/rom_generator aes_main.bin
	mv aes_main.data aes_main.mem 

multilib:
	$(CC64)-gcc aes_main.c ../../../lib/uart.c ../../../lib/irq.c crt0.s $(CCFLAGS)
	$(CC64)-objcopy -O binary -j .init -j .text -j .rodata aes_main.elf aes_main.bin
	../../../test/rom_generator aes_main.bin
	mv aes_main.data aes_main.mem

