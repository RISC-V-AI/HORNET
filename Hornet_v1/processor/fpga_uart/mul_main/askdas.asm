
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
  20:	00f12223          	sw	a5,4(sp)
  24:	02812c23          	sw	s0,56(sp)
  28:	02912a23          	sw	s1,52(sp)
  2c:	03412423          	sw	s4,40(sp)
  30:	03512223          	sw	s5,36(sp)
  34:	03612023          	sw	s6,32(sp)
  38:	01712e23          	sw	s7,28(sp)
  3c:	01812c23          	sw	s8,24(sp)
  40:	03212823          	sw	s2,48(sp)
  44:	03312623          	sw	s3,44(sp)
  48:	1d4000ef          	jal	21c <SET_MTVEC_VECTOR_MODE>
  4c:	0000aab7          	lui	s5,0xa
  50:	100085b7          	lui	a1,0x10008
  54:	004a8513          	addi	a0,s5,4 # a004 <uart0>
  58:	01058593          	addi	a1,a1,16 # 10008010 <__stack_top+0xffe8014>
  5c:	0000a4b7          	lui	s1,0xa
  60:	10008437          	lui	s0,0x10008
  64:	0004a423          	sw	zero,8(s1) # a008 <count>
  68:	114000ef          	jal	17c <uart_init>
  6c:	02040413          	addi	s0,s0,32 # 10008020 <__stack_top+0xffe8024>
  70:	00100b13          	li	s6,1
  74:	004a8513          	addi	a0,s5,4
  78:	01640023          	sb	s6,0(s0)
  7c:	23000593          	li	a1,560
  80:	00c00613          	li	a2,12
  84:	100000ef          	jal	184 <uart_transmit_string>
  88:	004a8a93          	addi	s5,s5,4
  8c:	0000ac37          	lui	s8,0xa
  90:	00010bb7          	lui	s7,0x10
  94:	00300a13          	li	s4,3
  98:	30046073          	csrsi	mstatus,8
  9c:	304ba073          	csrs	mie,s7
  a0:	00040023          	sb	zero,0(s0)
  a4:	0084a783          	lw	a5,8(s1)
  a8:	fefa5ee3          	bge	s4,a5,a4 <main+0x94>
  ac:	01640023          	sb	s6,0(s0)
  b0:	00040023          	sb	zero,0(s0)
  b4:	00412703          	lw	a4,4(sp)
  b8:	000c2783          	lw	a5,0(s8) # a000 <b>
  bc:	00800613          	li	a2,8
  c0:	00c105b3          	add	a1,sp,a2
  c4:	02f70933          	mul	s2,a4,a5
  c8:	000a8513          	mv	a0,s5
  cc:	02f719b3          	mulh	s3,a4,a5
  d0:	01212423          	sw	s2,8(sp)
  d4:	01312623          	sw	s3,12(sp)
  d8:	0ac000ef          	jal	184 <uart_transmit_string>
  dc:	0004a423          	sw	zero,8(s1)
  e0:	fb9ff06f          	j	98 <main+0x88>

000000e4 <mti_handler>:
  e4:	30200073          	mret

000000e8 <exc_handler>:
  e8:	30200073          	mret

000000ec <mei_handler>:
  ec:	30200073          	mret

000000f0 <msi_handler>:
  f0:	30200073          	mret

000000f4 <fast_irq0_handler>:
  f4:	ff010113          	addi	sp,sp,-16
  f8:	00f12023          	sw	a5,0(sp)
  fc:	0000a7b7          	lui	a5,0xa
 100:	00d12423          	sw	a3,8(sp)
 104:	0047a683          	lw	a3,4(a5) # a004 <uart0>
 108:	0000a7b7          	lui	a5,0xa
 10c:	00e12223          	sw	a4,4(sp)
 110:	00c12623          	sw	a2,12(sp)
 114:	0087a703          	lw	a4,8(a5) # a008 <count>
 118:	0016c603          	lbu	a2,1(a3)
 11c:	0000a6b7          	lui	a3,0xa
 120:	00068693          	mv	a3,a3
 124:	00d70733          	add	a4,a4,a3
 128:	00c70023          	sb	a2,0(a4)
 12c:	0087a683          	lw	a3,8(a5)
 130:	00300713          	li	a4,3
 134:	02d74463          	blt	a4,a3,15c <fast_irq0_handler+0x68>
 138:	0087a703          	lw	a4,8(a5)
 13c:	00c12603          	lw	a2,12(sp)
 140:	00812683          	lw	a3,8(sp)
 144:	00170713          	addi	a4,a4,1
 148:	00e7a423          	sw	a4,8(a5)
 14c:	00412703          	lw	a4,4(sp)
 150:	00012783          	lw	a5,0(sp)
 154:	01010113          	addi	sp,sp,16
 158:	30200073          	mret
 15c:	30047073          	csrci	mstatus,8
 160:	00c12603          	lw	a2,12(sp)
 164:	00812683          	lw	a3,8(sp)
 168:	00412703          	lw	a4,4(sp)
 16c:	00012783          	lw	a5,0(sp)
 170:	01010113          	addi	sp,sp,16
 174:	30200073          	mret

00000178 <fast_irq1_handler>:
 178:	30200073          	mret

0000017c <uart_init>:
 17c:	00b52023          	sw	a1,0(a0)
 180:	00008067          	ret

00000184 <uart_transmit_string>:
 184:	04060663          	beqz	a2,1d0 <uart_transmit_string+0x4c>
 188:	10008737          	lui	a4,0x10008
 18c:	10008537          	lui	a0,0x10008
 190:	00c58633          	add	a2,a1,a2
 194:	01270713          	addi	a4,a4,18 # 10008012 <__stack_top+0xffe8016>
 198:	01050513          	addi	a0,a0,16 # 10008010 <__stack_top+0xffe8014>
 19c:	0005c683          	lbu	a3,0(a1)
 1a0:	00158593          	addi	a1,a1,1
 1a4:	00000013          	nop
 1a8:	00000013          	nop
 1ac:	00075783          	lhu	a5,0(a4)
 1b0:	0027f793          	andi	a5,a5,2
 1b4:	fe0798e3          	bnez	a5,1a4 <uart_transmit_string+0x20>
 1b8:	00000013          	nop
 1bc:	00000013          	nop
 1c0:	00000013          	nop
 1c4:	00000013          	nop
 1c8:	00d52023          	sw	a3,0(a0)
 1cc:	fcb618e3          	bne	a2,a1,19c <uart_transmit_string+0x18>
 1d0:	00008067          	ret

000001d4 <exc>:
 1d4:	f15ff06f          	j	e8 <exc_handler>

000001d8 <ssi>:
 1d8:	00000013          	nop

000001dc <hsi>:
 1dc:	00000013          	nop

000001e0 <msi>:
 1e0:	f11ff06f          	j	f0 <msi_handler>

000001e4 <uti>:
 1e4:	00000013          	nop

000001e8 <sti>:
 1e8:	00000013          	nop

000001ec <hti>:
 1ec:	00000013          	nop

000001f0 <mti>:
 1f0:	ef5ff06f          	j	e4 <mti_handler>

000001f4 <uei>:
 1f4:	00000013          	nop

000001f8 <sei>:
 1f8:	00000013          	nop

000001fc <hei>:
 1fc:	00000013          	nop

00000200 <mei>:
 200:	eedff06f          	j	ec <mei_handler>
 204:	00000013          	nop
 208:	00000013          	nop
 20c:	00000013          	nop
 210:	00000013          	nop

00000214 <fast_irq0>:
 214:	ee1ff06f          	j	f4 <fast_irq0_handler>

00000218 <fast_irq1>:
 218:	f61ff06f          	j	178 <fast_irq1_handler>

0000021c <SET_MTVEC_VECTOR_MODE>:
 21c:	00000797          	auipc	a5,0x0
 220:	fb878793          	addi	a5,a5,-72 # 1d4 <exc>
 224:	0017e793          	ori	a5,a5,1
 228:	30579073          	csrw	mtvec,a5
 22c:	00008067          	ret

Disassembly of section .rodata:

00000230 <.rodata>:
 230:	5555                	.insn	2, 0x5555
 232:	5555                	.insn	2, 0x5555
 234:	5555                	.insn	2, 0x5555
 236:	5555                	.insn	2, 0x5555
 238:	5555                	.insn	2, 0x5555
 23a:	5555                	.insn	2, 0x5555
	...

Disassembly of section .eh_frame:

00000240 <__DATA_BEGIN__-0xdc0>:
 240:	0010                	.insn	2, 0x0010
 242:	0000                	.insn	2, 0x0000
 244:	0000                	.insn	2, 0x0000
 246:	0000                	.insn	2, 0x0000
 248:	00527a03          	.insn	4, 0x00527a03
 24c:	7c01                	.insn	2, 0x7c01
 24e:	0101                	.insn	2, 0x0101
 250:	00020c1b          	.insn	4, 0x00020c1b
 254:	0010                	.insn	2, 0x0010
 256:	0000                	.insn	2, 0x0000
 258:	0018                	.insn	2, 0x0018
 25a:	0000                	.insn	2, 0x0000
 25c:	fda4                	.insn	2, 0xfda4
 25e:	ffff                	.insn	2, 0xffff
 260:	0010                	.insn	2, 0x0010
 262:	0000                	.insn	2, 0x0000
 264:	0000                	.insn	2, 0x0000
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
