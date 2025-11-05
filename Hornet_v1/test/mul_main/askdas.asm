
aes_main.elf:     file format elf32-littleriscv


Disassembly of section .init:

00000000 <_start>:
   0:	00020117          	auipc	sp,0x20
   4:	ffc10113          	addi	sp,sp,-4 # 1fffc <__stack_top>
   8:	00010433          	add	s0,sp,zero
   c:	0040006f          	j	10 <main>

Disassembly of section .text:

00000010 <main>:
  10:	010207b7          	lui	a5,0x1020
  14:	fc010113          	addi	sp,sp,-64
  18:	30478793          	addi	a5,a5,772 # 1020304 <__stack_top+0x1000308>
  1c:	02112e23          	sw	ra,60(sp)
  20:	02812c23          	sw	s0,56(sp)
  24:	02912a23          	sw	s1,52(sp)
  28:	03412423          	sw	s4,40(sp)
  2c:	03512223          	sw	s5,36(sp)
  30:	03612023          	sw	s6,32(sp)
  34:	01712e23          	sw	s7,28(sp)
  38:	01812c23          	sw	s8,24(sp)
  3c:	00f12223          	sw	a5,4(sp)
  40:	03212823          	sw	s2,48(sp)
  44:	03312623          	sw	s3,44(sp)
  48:	1bc000ef          	jal	204 <SET_MTVEC_VECTOR_MODE>
  4c:	0000aab7          	lui	s5,0xa
  50:	100085b7          	lui	a1,0x10008
  54:	004a8513          	addi	a0,s5,4 # a004 <uart0>
  58:	01058593          	addi	a1,a1,16 # 10008010 <__stack_top+0xffe8014>
  5c:	0000a437          	lui	s0,0xa
  60:	100084b7          	lui	s1,0x10008
  64:	00042423          	sw	zero,8(s0) # a008 <count>
  68:	004a8a93          	addi	s5,s5,4
  6c:	0f8000ef          	jal	164 <uart_init>
  70:	02048493          	addi	s1,s1,32 # 10008020 <__stack_top+0xffe8024>
  74:	0000ac37          	lui	s8,0xa
  78:	00010bb7          	lui	s7,0x10
  7c:	00300a13          	li	s4,3
  80:	00100b13          	li	s6,1
  84:	30046073          	csrsi	mstatus,8
  88:	304ba073          	csrs	mie,s7
  8c:	00842783          	lw	a5,8(s0)
  90:	fefa5ee3          	bge	s4,a5,8c <main+0x7c>
  94:	01648023          	sb	s6,0(s1)
  98:	00048023          	sb	zero,0(s1)
  9c:	00412703          	lw	a4,4(sp)
  a0:	000c2783          	lw	a5,0(s8) # a000 <b>
  a4:	00800613          	li	a2,8
  a8:	00c105b3          	add	a1,sp,a2
  ac:	02f70933          	mul	s2,a4,a5
  b0:	000a8513          	mv	a0,s5
  b4:	02f719b3          	mulh	s3,a4,a5
  b8:	01212423          	sw	s2,8(sp)
  bc:	01312623          	sw	s3,12(sp)
  c0:	0ac000ef          	jal	16c <uart_transmit_string>
  c4:	00042423          	sw	zero,8(s0)
  c8:	fbdff06f          	j	84 <main+0x74>

000000cc <mti_handler>:
  cc:	30200073          	mret

000000d0 <exc_handler>:
  d0:	30200073          	mret

000000d4 <mei_handler>:
  d4:	30200073          	mret

000000d8 <msi_handler>:
  d8:	30200073          	mret

000000dc <fast_irq0_handler>:
  dc:	ff010113          	addi	sp,sp,-16
  e0:	00f12023          	sw	a5,0(sp)
  e4:	0000a7b7          	lui	a5,0xa
  e8:	00d12423          	sw	a3,8(sp)
  ec:	0047a683          	lw	a3,4(a5) # a004 <uart0>
  f0:	0000a7b7          	lui	a5,0xa
  f4:	00e12223          	sw	a4,4(sp)
  f8:	00c12623          	sw	a2,12(sp)
  fc:	0087a703          	lw	a4,8(a5) # a008 <count>
 100:	0016c603          	lbu	a2,1(a3)
 104:	0000a6b7          	lui	a3,0xa
 108:	00068693          	mv	a3,a3
 10c:	00d70733          	add	a4,a4,a3
 110:	00c70023          	sb	a2,0(a4)
 114:	0087a683          	lw	a3,8(a5)
 118:	00300713          	li	a4,3
 11c:	02d74463          	blt	a4,a3,144 <fast_irq0_handler+0x68>
 120:	0087a703          	lw	a4,8(a5)
 124:	00c12603          	lw	a2,12(sp)
 128:	00812683          	lw	a3,8(sp)
 12c:	00170713          	addi	a4,a4,1
 130:	00e7a423          	sw	a4,8(a5)
 134:	00412703          	lw	a4,4(sp)
 138:	00012783          	lw	a5,0(sp)
 13c:	01010113          	addi	sp,sp,16
 140:	30200073          	mret
 144:	30047073          	csrci	mstatus,8
 148:	00c12603          	lw	a2,12(sp)
 14c:	00812683          	lw	a3,8(sp)
 150:	00412703          	lw	a4,4(sp)
 154:	00012783          	lw	a5,0(sp)
 158:	01010113          	addi	sp,sp,16
 15c:	30200073          	mret

00000160 <fast_irq1_handler>:
 160:	30200073          	mret

00000164 <uart_init>:
 164:	00b52023          	sw	a1,0(a0)
 168:	00008067          	ret

0000016c <uart_transmit_string>:
 16c:	04060663          	beqz	a2,1b8 <uart_transmit_string+0x4c>
 170:	10008737          	lui	a4,0x10008
 174:	10008537          	lui	a0,0x10008
 178:	00c58633          	add	a2,a1,a2
 17c:	01270713          	addi	a4,a4,18 # 10008012 <__stack_top+0xffe8016>
 180:	01050513          	addi	a0,a0,16 # 10008010 <__stack_top+0xffe8014>
 184:	0005c683          	lbu	a3,0(a1)
 188:	00158593          	addi	a1,a1,1
 18c:	00000013          	nop
 190:	00000013          	nop
 194:	00075783          	lhu	a5,0(a4)
 198:	0027f793          	andi	a5,a5,2
 19c:	fe0798e3          	bnez	a5,18c <uart_transmit_string+0x20>
 1a0:	00000013          	nop
 1a4:	00000013          	nop
 1a8:	00000013          	nop
 1ac:	00000013          	nop
 1b0:	00d52023          	sw	a3,0(a0)
 1b4:	fcb618e3          	bne	a2,a1,184 <uart_transmit_string+0x18>
 1b8:	00008067          	ret

000001bc <exc>:
 1bc:	f15ff06f          	j	d0 <exc_handler>

000001c0 <ssi>:
 1c0:	00000013          	nop

000001c4 <hsi>:
 1c4:	00000013          	nop

000001c8 <msi>:
 1c8:	f11ff06f          	j	d8 <msi_handler>

000001cc <uti>:
 1cc:	00000013          	nop

000001d0 <sti>:
 1d0:	00000013          	nop

000001d4 <hti>:
 1d4:	00000013          	nop

000001d8 <mti>:
 1d8:	ef5ff06f          	j	cc <mti_handler>

000001dc <uei>:
 1dc:	00000013          	nop

000001e0 <sei>:
 1e0:	00000013          	nop

000001e4 <hei>:
 1e4:	00000013          	nop

000001e8 <mei>:
 1e8:	eedff06f          	j	d4 <mei_handler>
 1ec:	00000013          	nop
 1f0:	00000013          	nop
 1f4:	00000013          	nop
 1f8:	00000013          	nop

000001fc <fast_irq0>:
 1fc:	ee1ff06f          	j	dc <fast_irq0_handler>

00000200 <fast_irq1>:
 200:	f61ff06f          	j	160 <fast_irq1_handler>

00000204 <SET_MTVEC_VECTOR_MODE>:
 204:	00000797          	auipc	a5,0x0
 208:	fb878793          	addi	a5,a5,-72 # 1bc <exc>
 20c:	0017e793          	ori	a5,a5,1
 210:	30579073          	csrw	mtvec,a5
 214:	00008067          	ret

Disassembly of section .eh_frame:

00000218 <__DATA_BEGIN__-0xde8>:
 218:	0010                	.insn	2, 0x0010
 21a:	0000                	.insn	2, 0x0000
 21c:	0000                	.insn	2, 0x0000
 21e:	0000                	.insn	2, 0x0000
 220:	00527a03          	.insn	4, 0x00527a03
 224:	7c01                	.insn	2, 0x7c01
 226:	0101                	.insn	2, 0x0101
 228:	00020c1b          	.insn	4, 0x00020c1b
 22c:	0010                	.insn	2, 0x0010
 22e:	0000                	.insn	2, 0x0000
 230:	0018                	.insn	2, 0x0018
 232:	0000                	.insn	2, 0x0000
 234:	fdcc                	.insn	2, 0xfdcc
 236:	ffff                	.insn	2, 0xffff
 238:	0010                	.insn	2, 0x0010
 23a:	0000                	.insn	2, 0x0000
 23c:	0000                	.insn	2, 0x0000
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
   0:	3641                	.insn	2, 0x3641
   2:	0000                	.insn	2, 0x0000
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	zero,a6,14 <main+0x4>
   c:	002c                	.insn	2, 0x002c
   e:	0000                	.insn	2, 0x0000
  10:	1004                	.insn	2, 0x1004
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	5f31                	.insn	2, 0x5f31
  1c:	326d                	.insn	2, 0x326d
  1e:	3070                	.insn	2, 0x3070
  20:	7a5f 6369 7273      	.insn	6, 0x727363697a5f
  26:	7032                	.insn	2, 0x7032
  28:	5f30                	.insn	2, 0x5f30
  2a:	6d7a                	.insn	2, 0x6d7a
  2c:	756d                	.insn	2, 0x756d
  2e:	316c                	.insn	2, 0x316c
  30:	3070                	.insn	2, 0x3070
  32:	0800                	.insn	2, 0x0800
  34:	0a01                	.insn	2, 0x0a01
  36:	0b                	.byte	0x0b
