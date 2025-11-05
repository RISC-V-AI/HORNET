CC32=riscv32-unknown-elf
CC64=riscv32-unknown-elf
CCFLAGS=-march=rv32imf_zicsr -mabi=ilp32f -O3 -T linksc.ld -nostartfiles -ffunction-sections -fdata-sections -Wl,--gc-sections -o uart_echo.elf

build:
	$(CC32)-gcc uart_echo.c uart.c irq.c ../crt0.s $(CCFLAGS)
	$(CC32)-objcopy -O binary -j .init -j .text -j .rodata -j .sdata uart_echo.elf uart_echo.bin
	../rom_generator uart_echo.bin
	cp inference_uart_echo.data ../memory_contents/instruction.data

comp:
	gcc uart_echo.c -lm -o uart_echo
	mv uart_echo.data instruction.mem



