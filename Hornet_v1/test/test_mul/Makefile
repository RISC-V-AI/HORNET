# Toolchain
CC32    := riscv64-unknown-elf
CC      := $(CC32)-gcc
OBJCOPY := $(CC32)-objcopy
AR      := $(CC32)-ar

# Common flags
ARCHFLAGS := -march=rv32im_zicsr -mabi=ilp32 -mstrict-align -malign-data=xlen
INCLUDES  := -I.

# Default (O3) compile/link flags
CFLAGS   := $(ARCHFLAGS) -O3 -ffp-contract=off -fno-math-errno -ffunction-sections -fdata-sections $(INCLUDES)
LDFLAGS  := -T ../linksc-10000.ld -nostartfiles -Wl,--gc-sections
LIBS     := -lm

# 10K target flags (size/DBG oriented)
CFLAGS_10K  := $(ARCHFLAGS) -Os -ffp-contract=off -fno-math-errno -ffunction-sections -fdata-sections -g -ggdb $(INCLUDES)
LDFLAGS_10K := $(LDFLAGS)

# App / objects
APP     := test_mul.c
CRT     := ../crt0.s
ELF     := test_mul.elf
BIN     := test_mul.bin

# Dilithium / support sources (exclude any *:Zone.Identifier files)
DIL_SRCS := \
  aes256ctr.c fips202.c ntt.c poly.c packing.c polyvec.c \
  reduce.c rounding.c sign.c symmetric-aes.c symmetric-shake.c \
  randombytes.c
DIL_OBJS := $(DIL_SRCS:.c=.o)

# Default target
.PHONY: all
all: build

# -------- Normal build (O3) --------
.PHONY: build
build: $(ELF) $(BIN) rom

$(ELF): $(APP) $(CRT) $(DIL_OBJS)
	$(CC) $(CFLAGS) $^ $(LDFLAGS) $(LIBS) -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(BIN): $(ELF)
	$(OBJCOPY) -O binary -j .init -j .text -j .rodata -j .sdata $< $@

.PHONY: rom
rom: $(BIN)
	../rom_generator $(BIN)
	cp test_mul.data ../memory_contents/instruction.data

# -------- 10K build (size/DBG) --------
.PHONY: build-10k
build-10k: CFLAGS := $(CFLAGS_10K)
build-10k: LDFLAGS := $(LDFLAGS_10K)
build-10k: $(ELF) $(BIN) rom

# -------- Utilities --------
.PHONY: clean
clean:
	rm -f $(DIL_OBJS) $(ELF) $(BIN) test_mul.dis test_mul.map test_mul.mem
