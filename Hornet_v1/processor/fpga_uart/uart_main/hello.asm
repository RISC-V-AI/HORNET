
uart_main.elf:     file format elf32-littleriscv


Disassembly of section .init:

00000000 <_start>:
   0:	00007117          	auipc	sp,0x7
   4:	40010113          	addi	sp,sp,1024 # 7400 <__stack_top>
   8:	00010433          	add	s0,sp,zero
   c:	0040006f          	j	10 <main>

Disassembly of section .text:

00000010 <main>:
  10:	fe010113          	addi	sp,sp,-32
  14:	000085b7          	lui	a1,0x8
  18:	00812c23          	sw	s0,24(sp)
  1c:	00c10513          	addi	a0,sp,12
  20:	01058593          	addi	a1,a1,16 # 8010 <__stack_top+0xc10>
  24:	00112e23          	sw	ra,28(sp)
  28:	0e400413          	li	s0,228
  2c:	028000ef          	jal	54 <uart_init>
  30:	00d00613          	li	a2,13
  34:	00040593          	mv	a1,s0
  38:	00c10513          	addi	a0,sp,12
  3c:	058000ef          	jal	94 <uart_transmit_string>
  40:	003d17b7          	lui	a5,0x3d1
  44:	90078793          	addi	a5,a5,-1792 # 3d0900 <__stack_top+0x3c9500>
  48:	fff78793          	addi	a5,a5,-1
  4c:	fe079ee3          	bnez	a5,48 <main+0x38>
  50:	fe1ff06f          	j	30 <main+0x20>

00000054 <uart_init>:
  54:	00b52023          	sw	a1,0(a0)
  58:	00008067          	ret

0000005c <uart_transmit_byte>:
  5c:	00008737          	lui	a4,0x8
  60:	01270713          	addi	a4,a4,18 # 8012 <__stack_top+0xc12>
  64:	00000013          	nop
  68:	00000013          	nop
  6c:	00075783          	lhu	a5,0(a4)
  70:	0027f793          	andi	a5,a5,2
  74:	fe0798e3          	bnez	a5,64 <uart_transmit_byte+0x8>
  78:	00000013          	nop
  7c:	00000013          	nop
  80:	00000013          	nop
  84:	00000013          	nop
  88:	000087b7          	lui	a5,0x8
  8c:	00b7a823          	sw	a1,16(a5) # 8010 <__stack_top+0xc10>
  90:	00008067          	ret

00000094 <uart_transmit_string>:
  94:	04060663          	beqz	a2,e0 <uart_transmit_string+0x4c>
  98:	00008737          	lui	a4,0x8
  9c:	00008537          	lui	a0,0x8
  a0:	00c58633          	add	a2,a1,a2
  a4:	01270713          	addi	a4,a4,18 # 8012 <__stack_top+0xc12>
  a8:	01050513          	addi	a0,a0,16 # 8010 <__stack_top+0xc10>
  ac:	0005c683          	lbu	a3,0(a1)
  b0:	00158593          	addi	a1,a1,1
  b4:	00000013          	nop
  b8:	00000013          	nop
  bc:	00075783          	lhu	a5,0(a4)
  c0:	0027f793          	andi	a5,a5,2
  c4:	fe0798e3          	bnez	a5,b4 <uart_transmit_string+0x20>
  c8:	00000013          	nop
  cc:	00000013          	nop
  d0:	00000013          	nop
  d4:	00000013          	nop
  d8:	00d52023          	sw	a3,0(a0)
  dc:	fcb618e3          	bne	a2,a1,ac <uart_transmit_string+0x18>
  e0:	00008067          	ret

Disassembly of section .rodata:

000000e4 <.rodata>:
  e4:	6548                	.insn	2, 0x6548
  e6:	6c6c                	.insn	2, 0x6c6c
  e8:	6f77206f          	j	72fde <__stack_top+0x6bbde>
  ec:	6c72                	.insn	2, 0x6c72
  ee:	2164                	.insn	2, 0x2164
  f0:	000a                	.insn	2, 0x000a

Disassembly of section .eh_frame:

000000f4 <__BSS_END__-0x1028>:
  f4:	0010                	.insn	2, 0x0010
  f6:	0000                	.insn	2, 0x0000
  f8:	0000                	.insn	2, 0x0000
  fa:	0000                	.insn	2, 0x0000
  fc:	00527a03          	.insn	4, 0x00527a03
 100:	7c01                	.insn	2, 0x7c01
 102:	0101                	.insn	2, 0x0101
 104:	00020c1b          	.insn	4, 0x00020c1b
 108:	0010                	.insn	2, 0x0010
 10a:	0000                	.insn	2, 0x0000
 10c:	0018                	.insn	2, 0x0018
 10e:	0000                	.insn	2, 0x0000
 110:	fef0                	.insn	2, 0xfef0
 112:	ffff                	.insn	2, 0xffff
 114:	0010                	.insn	2, 0x0010
 116:	0000                	.insn	2, 0x0000
 118:	0000                	.insn	2, 0x0000
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	.insn	4, 0x3a434347
   4:	2820                	.insn	2, 0x2820
   6:	33623167          	.insn	4, 0x33623167
   a:	3630                	.insn	2, 0x3630
   c:	3330                	.insn	2, 0x3330
   e:	6139                	.insn	2, 0x6139
  10:	20293463          	.insn	4, 0x20293463
  14:	3531                	.insn	2, 0x3531
  16:	312e                	.insn	2, 0x312e
  18:	302e                	.insn	2, 0x302e
	...

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	1b41                	.insn	2, 0x1b41
   2:	0000                	.insn	2, 0x0000
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	zero,a6,14 <main+0x4>
   c:	0011                	.insn	2, 0x0011
   e:	0000                	.insn	2, 0x0000
  10:	1004                	.insn	2, 0x1004
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	0031                	.insn	2, 0x0031
