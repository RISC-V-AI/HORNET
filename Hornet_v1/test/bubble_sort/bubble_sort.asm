
bubble_sort.elf:     file format elf32-littleriscv


Disassembly of section .init:

00000000 <_start>:
   0:	00200117          	auipc	sp,0x200
   4:	00010113          	mv	sp,sp
   8:	00010433          	add	s0,sp,zero
   c:	0040006f          	j	10 <main>

Disassembly of section .text:

00000010 <main>:
  10:	30000793          	li	a5,768
  14:	00c7a683          	lw	a3,12(a5)
  18:	0107a703          	lw	a4,16(a5)
  1c:	fb010113          	addi	sp,sp,-80 # 1fffb0 <__stack_size+0x1effb0>
  20:	0087a603          	lw	a2,8(a5)
  24:	00d12a23          	sw	a3,20(sp)
  28:	00e12c23          	sw	a4,24(sp)
  2c:	0187a683          	lw	a3,24(a5)
  30:	01c7a703          	lw	a4,28(a5)
  34:	00c12823          	sw	a2,16(sp)
  38:	02d12023          	sw	a3,32(sp)
  3c:	0147a603          	lw	a2,20(a5)
  40:	0247a683          	lw	a3,36(a5)
  44:	02e12223          	sw	a4,36(sp)
  48:	0287a703          	lw	a4,40(a5)
  4c:	00c12e23          	sw	a2,28(sp)
  50:	02d12623          	sw	a3,44(sp)
  54:	0207a603          	lw	a2,32(a5)
  58:	02c7a683          	lw	a3,44(a5)
  5c:	02e12823          	sw	a4,48(sp)
  60:	0307a703          	lw	a4,48(a5)
  64:	0347a783          	lw	a5,52(a5)
  68:	02c12423          	sw	a2,40(sp)
  6c:	02d12a23          	sw	a3,52(sp)
  70:	02e12c23          	sw	a4,56(sp)
  74:	02f12e23          	sw	a5,60(sp)
  78:	04112623          	sw	ra,76(sp)
  7c:	0b000713          	li	a4,176
  80:	0c300793          	li	a5,195
  84:	00000393          	li	t2,0
  88:	08000513          	li	a0,128
  8c:	00000f13          	li	t5,0
  90:	03600693          	li	a3,54
  94:	00000293          	li	t0,0
  98:	06700613          	li	a2,103
  9c:	00000e93          	li	t4,0
  a0:	02000593          	li	a1,32
  a4:	00000f93          	li	t6,0
  a8:	00200313          	li	t1,2
  ac:	00e00813          	li	a6,14
  b0:	00100e13          	li	t3,1
  b4:	04f74663          	blt	a4,a5,100 <main+0xf0>
  b8:	00070893          	mv	a7,a4
  bc:	00078713          	mv	a4,a5
  c0:	00088793          	mv	a5,a7
  c4:	000e0313          	mv	t1,t3
  c8:	04f65063          	bge	a2,a5,108 <main+0xf8>
  cc:	0af6ce63          	blt	a3,a5,188 <main+0x178>
  d0:	0ed5ca63          	blt	a1,a3,1c4 <main+0x1b4>
  d4:	12b54263          	blt	a0,a1,1f8 <main+0x1e8>
  d8:	00100293          	li	t0,1
  dc:	00060893          	mv	a7,a2
  e0:	00028f93          	mv	t6,t0
  e4:	00078613          	mv	a2,a5
  e8:	05074c63          	blt	a4,a6,140 <main+0x130>
  ec:	00070793          	mv	a5,a4
  f0:	00100313          	li	t1,1
  f4:	00000e13          	li	t3,0
  f8:	00088713          	mv	a4,a7
  fc:	faf75ee3          	bge	a4,a5,b8 <main+0xa8>
 100:	00100f93          	li	t6,1
 104:	fcf644e3          	blt	a2,a5,cc <main+0xbc>
 108:	08c6c863          	blt	a3,a2,198 <main+0x188>
 10c:	04d5ce63          	blt	a1,a3,168 <main+0x158>
 110:	10b55663          	bge	a0,a1,21c <main+0x20c>
 114:	00058893          	mv	a7,a1
 118:	00068593          	mv	a1,a3
 11c:	00088693          	mv	a3,a7
 120:	00050313          	mv	t1,a0
 124:	00100e93          	li	t4,1
 128:	00068513          	mv	a0,a3
 12c:	00078893          	mv	a7,a5
 130:	00058693          	mv	a3,a1
 134:	000e8393          	mv	t2,t4
 138:	00030593          	mv	a1,t1
 13c:	fb0758e3          	bge	a4,a6,ec <main+0xdc>
 140:	00080793          	mv	a5,a6
 144:	00200313          	li	t1,2
 148:	00070813          	mv	a6,a4
 14c:	00100e13          	li	t3,1
 150:	00088713          	mv	a4,a7
 154:	fa9ff06f          	j	fc <main+0xec>
 158:	00060893          	mv	a7,a2
 15c:	00100293          	li	t0,1
 160:	00068613          	mv	a2,a3
 164:	00088693          	mv	a3,a7
 168:	04d54a63          	blt	a0,a3,1bc <main+0x1ac>
 16c:	00058313          	mv	t1,a1
 170:	00100f13          	li	t5,1
 174:	00068593          	mv	a1,a3
 178:	00078893          	mv	a7,a5
 17c:	00030693          	mv	a3,t1
 180:	000f0e93          	mv	t4,t5
 184:	f65ff06f          	j	e8 <main+0xd8>
 188:	00078893          	mv	a7,a5
 18c:	00100f93          	li	t6,1
 190:	00060793          	mv	a5,a2
 194:	00088613          	mv	a2,a7
 198:	fcc5c0e3          	blt	a1,a2,158 <main+0x148>
 19c:	04b54063          	blt	a0,a1,1dc <main+0x1cc>
 1a0:	00060313          	mv	t1,a2
 1a4:	00100f13          	li	t5,1
 1a8:	00068613          	mv	a2,a3
 1ac:	00078893          	mv	a7,a5
 1b0:	00030693          	mv	a3,t1
 1b4:	000f0293          	mv	t0,t5
 1b8:	f31ff06f          	j	e8 <main+0xd8>
 1bc:	00100f13          	li	t5,1
 1c0:	f61ff06f          	j	120 <main+0x110>
 1c4:	00078893          	mv	a7,a5
 1c8:	00100293          	li	t0,1
 1cc:	00060793          	mv	a5,a2
 1d0:	00028f93          	mv	t6,t0
 1d4:	00088613          	mv	a2,a7
 1d8:	f91ff06f          	j	168 <main+0x158>
 1dc:	00060893          	mv	a7,a2
 1e0:	00100f13          	li	t5,1
 1e4:	00068613          	mv	a2,a3
 1e8:	000f0293          	mv	t0,t5
 1ec:	00058693          	mv	a3,a1
 1f0:	00088593          	mv	a1,a7
 1f4:	f2dff06f          	j	120 <main+0x110>
 1f8:	00058313          	mv	t1,a1
 1fc:	00078893          	mv	a7,a5
 200:	00100293          	li	t0,1
 204:	00068593          	mv	a1,a3
 208:	00060793          	mv	a5,a2
 20c:	00030693          	mv	a3,t1
 210:	00088613          	mv	a2,a7
 214:	00028f93          	mv	t6,t0
 218:	f09ff06f          	j	120 <main+0x110>
 21c:	06031863          	bnez	t1,28c <main+0x27c>
 220:	00038463          	beqz	t2,228 <main+0x218>
 224:	02a12023          	sw	a0,32(sp)
 228:	000e8463          	beqz	t4,230 <main+0x220>
 22c:	00b12e23          	sw	a1,28(sp)
 230:	000f0463          	beqz	t5,238 <main+0x228>
 234:	00d12c23          	sw	a3,24(sp)
 238:	00028463          	beqz	t0,240 <main+0x230>
 23c:	00c12a23          	sw	a2,20(sp)
 240:	000f8463          	beqz	t6,248 <main+0x238>
 244:	00f12823          	sw	a5,16(sp)
 248:	01c00613          	li	a2,28
 24c:	00810593          	addi	a1,sp,8
 250:	02410513          	addi	a0,sp,36
 254:	00e12623          	sw	a4,12(sp)
 258:	01012423          	sw	a6,8(sp)
 25c:	038000ef          	jal	294 <memcmp>
 260:	02051063          	bnez	a0,280 <main+0x270>
 264:	36002787          	flw	fa5,864(zero) # 360 <__SDATA_BEGIN__>
 268:	100087b7          	lui	a5,0x10008
 26c:	00f7a827          	fsw	fa5,16(a5) # 10008010 <__stack_top+0xfe08010>
 270:	04c12083          	lw	ra,76(sp)
 274:	00000513          	li	a0,0
 278:	05010113          	addi	sp,sp,80
 27c:	00008067          	ret
 280:	100087b7          	lui	a5,0x10008
 284:	0007a823          	sw	zero,16(a5) # 10008010 <__stack_top+0xfe08010>
 288:	fe9ff06f          	j	270 <main+0x260>
 28c:	00078893          	mv	a7,a5
 290:	e59ff06f          	j	e8 <main+0xd8>

00000294 <memcmp>:
 294:	00300693          	li	a3,3
 298:	04c6fe63          	bgeu	a3,a2,2f4 <memcmp+0x60>
 29c:	00a5e7b3          	or	a5,a1,a0
 2a0:	0037f793          	andi	a5,a5,3
 2a4:	02078a63          	beqz	a5,2d8 <memcmp+0x44>
 2a8:	fff60613          	addi	a2,a2,-1
 2ac:	00160613          	addi	a2,a2,1
 2b0:	00c50633          	add	a2,a0,a2
 2b4:	0080006f          	j	2bc <memcmp+0x28>
 2b8:	04a60063          	beq	a2,a0,2f8 <memcmp+0x64>
 2bc:	00054783          	lbu	a5,0(a0)
 2c0:	0005c703          	lbu	a4,0(a1)
 2c4:	00150513          	addi	a0,a0,1
 2c8:	00158593          	addi	a1,a1,1
 2cc:	fee786e3          	beq	a5,a4,2b8 <memcmp+0x24>
 2d0:	40e78533          	sub	a0,a5,a4
 2d4:	00008067          	ret
 2d8:	00052703          	lw	a4,0(a0)
 2dc:	0005a783          	lw	a5,0(a1)
 2e0:	fcf714e3          	bne	a4,a5,2a8 <memcmp+0x14>
 2e4:	ffc60613          	addi	a2,a2,-4
 2e8:	00450513          	addi	a0,a0,4
 2ec:	00458593          	addi	a1,a1,4
 2f0:	fec6e4e3          	bltu	a3,a2,2d8 <memcmp+0x44>
 2f4:	fa061ae3          	bnez	a2,2a8 <memcmp+0x14>
 2f8:	00000513          	li	a0,0
 2fc:	00008067          	ret

Disassembly of section .rodata:

00000300 <.rodata>:
 300:	000000c3          	.insn	4, 0x00c3
 304:	000e                	.insn	2, 0x000e
 306:	0000                	.insn	2, 0x0000
 308:	00b0                	.insn	2, 0x00b0
 30a:	0000                	.insn	2, 0x0000
 30c:	00000067          	jr	zero # 0 <_start>
 310:	0036                	.insn	2, 0x0036
 312:	0000                	.insn	2, 0x0000
 314:	0020                	.insn	2, 0x0020
 316:	0000                	.insn	2, 0x0000
 318:	0080                	.insn	2, 0x0080
 31a:	0000                	.insn	2, 0x0000
 31c:	000e                	.insn	2, 0x000e
 31e:	0000                	.insn	2, 0x0000
 320:	0020                	.insn	2, 0x0020
 322:	0000                	.insn	2, 0x0000
 324:	0036                	.insn	2, 0x0036
 326:	0000                	.insn	2, 0x0000
 328:	00000067          	jr	zero # 0 <_start>
 32c:	0080                	.insn	2, 0x0080
 32e:	0000                	.insn	2, 0x0000
 330:	00b0                	.insn	2, 0x00b0
 332:	0000                	.insn	2, 0x0000
 334:	000000c3          	.insn	4, 0x00c3

Disassembly of section .eh_frame:

00000338 <.eh_frame>:
 338:	0010                	.insn	2, 0x0010
 33a:	0000                	.insn	2, 0x0000
 33c:	0000                	.insn	2, 0x0000
 33e:	0000                	.insn	2, 0x0000
 340:	00527a03          	.insn	4, 0x00527a03
 344:	7c01                	.insn	2, 0x7c01
 346:	0101                	.insn	2, 0x0101
 348:	00020c1b          	.insn	4, 0x00020c1b
 34c:	0010                	.insn	2, 0x0010
 34e:	0000                	.insn	2, 0x0000
 350:	0018                	.insn	2, 0x0018
 352:	0000                	.insn	2, 0x0000
 354:	fcac                	.insn	2, 0xfcac
 356:	ffff                	.insn	2, 0xffff
 358:	0010                	.insn	2, 0x0010
 35a:	0000                	.insn	2, 0x0000
 35c:	0000                	.insn	2, 0x0000
	...

Disassembly of section .sdata:

00000360 <__SDATA_BEGIN__>:
 360:	199a                	.insn	2, 0x199a
 362:	4343                	.short	0x4343

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	.insn	4, 0x3a434347
   4:	2820                	.insn	2, 0x2820
   6:	33623167          	.insn	4, 0x33623167
   a:	3630                	.insn	2, 0x3630
   c:	3330                	.insn	2, 0x3330
   e:	6139                	.insn	2, 0x6139
  10:	31202963          	.insn	4, 0x31202963
  14:	2e35                	.insn	2, 0x2e35
  16:	2e31                	.insn	2, 0x2e31
  18:	0030                	.insn	2, 0x0030
  1a:	3a434347          	.insn	4, 0x3a434347
  1e:	2820                	.insn	2, 0x2820
  20:	29554e47          	.insn	4, 0x29554e47
  24:	3120                	.insn	2, 0x3120
  26:	2e35                	.insn	2, 0x2e35
  28:	2e31                	.insn	2, 0x2e31
  2a:	0030                	.insn	2, 0x0030

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	3741                	.insn	2, 0x3741
   2:	0000                	.insn	2, 0x0000
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	zero,a6,14 <main+0x4>
   c:	002d                	.insn	2, 0x002d
   e:	0000                	.insn	2, 0x0000
  10:	1004                	.insn	2, 0x1004
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	5f31                	.insn	2, 0x5f31
  1c:	326d                	.insn	2, 0x326d
  1e:	3070                	.insn	2, 0x3070
  20:	665f 7032 5f32      	.insn	6, 0x5f327032665f
  26:	697a                	.insn	2, 0x697a
  28:	32727363          	bgeu	tp,t2,34e <memcmp+0xba>
  2c:	3070                	.insn	2, 0x3070
  2e:	7a5f 6d6d 6c75      	.insn	6, 0x6c756d6d7a5f
  34:	7031                	.insn	2, 0x7031
  36:	0030                	.insn	2, 0x0030
