
uart_echo.elf:     file format elf32-littleriscv


Disassembly of section .init:

00000000 <_start>:
   0:	00020117          	auipc	sp,0x20
   4:	ffc10113          	addi	sp,sp,-4 # 1fffc <__stack_top>
   8:	00010433          	add	s0,sp,zero
   c:	0040006f          	j	10 <main>

Disassembly of section .text:

00000010 <main>:
  10:	fe010113          	addi	sp,sp,-32
  14:	00112e23          	sw	ra,28(sp)
  18:	00812c23          	sw	s0,24(sp)
  1c:	00912a23          	sw	s1,20(sp)
  20:	01212823          	sw	s2,16(sp)
  24:	01312623          	sw	s3,12(sp)
  28:	01412423          	sw	s4,8(sp)
  2c:	01512223          	sw	s5,4(sp)
  30:	238000ef          	jal	268 <SET_MTVEC_VECTOR_MODE>
  34:	000109b7          	lui	s3,0x10
  38:	00010437          	lui	s0,0x10
  3c:	100085b7          	lui	a1,0x10008
  40:	00098513          	mv	a0,s3
  44:	00042623          	sw	zero,12(s0) # 1000c <count>
  48:	01058593          	addi	a1,a1,16 # 10008010 <__stack_top+0xffe8014>
  4c:	00010937          	lui	s2,0x10
  50:	00400a13          	li	s4,4
  54:	01492423          	sw	s4,8(s2) # 10008 <result>
  58:	188000ef          	jal	1e0 <uart_init>
  5c:	00892583          	lw	a1,8(s2)
  60:	00098513          	mv	a0,s3
  64:	00010ab7          	lui	s5,0x10
  68:	0ff5f593          	zext.b	a1,a1
  6c:	17c000ef          	jal	1e8 <uart_transmit_byte>
  70:	00098993          	mv	s3,s3
  74:	01000493          	li	s1,16
  78:	30046073          	csrsi	mstatus,8
  7c:	304aa073          	csrs	mie,s5
  80:	00c42783          	lw	a5,12(s0)
  84:	fe979ee3          	bne	a5,s1,80 <main+0x70>
  88:	01492423          	sw	s4,8(s2)
  8c:	00892583          	lw	a1,8(s2)
  90:	00098513          	mv	a0,s3
  94:	0ff5f593          	zext.b	a1,a1
  98:	150000ef          	jal	1e8 <uart_transmit_byte>
  9c:	00042623          	sw	zero,12(s0)
  a0:	fd9ff06f          	j	78 <main+0x68>

000000a4 <mti_handler>:
  a4:	ff010113          	addi	sp,sp,-16
  a8:	00512623          	sw	t0,12(sp)
  ac:	00c12283          	lw	t0,12(sp)
  b0:	01010113          	addi	sp,sp,16
  b4:	30200073          	mret

000000b8 <exc_handler>:
  b8:	ff010113          	addi	sp,sp,-16
  bc:	00512623          	sw	t0,12(sp)
  c0:	00c12283          	lw	t0,12(sp)
  c4:	01010113          	addi	sp,sp,16
  c8:	30200073          	mret

000000cc <mei_handler>:
  cc:	ff010113          	addi	sp,sp,-16
  d0:	00512623          	sw	t0,12(sp)
  d4:	00c12283          	lw	t0,12(sp)
  d8:	01010113          	addi	sp,sp,16
  dc:	30200073          	mret

000000e0 <msi_handler>:
  e0:	ff010113          	addi	sp,sp,-16
  e4:	00512623          	sw	t0,12(sp)
  e8:	00c12283          	lw	t0,12(sp)
  ec:	01010113          	addi	sp,sp,16
  f0:	30200073          	mret

000000f4 <fast_irq0_handler>:
  f4:	fc010113          	addi	sp,sp,-64
  f8:	02512e23          	sw	t0,60(sp)
  fc:	003022f3          	frcsr	t0
 100:	02d12623          	sw	a3,44(sp)
 104:	000106b7          	lui	a3,0x10
 108:	02f12223          	sw	a5,36(sp)
 10c:	00c6a783          	lw	a5,12(a3) # 1000c <count>
 110:	02e12423          	sw	a4,40(sp)
 114:	00010737          	lui	a4,0x10
 118:	02c12823          	sw	a2,48(sp)
 11c:	00072603          	lw	a2,0(a4) # 10000 <uart0>
 120:	41f7d713          	srai	a4,a5,0x1f
 124:	01e75713          	srli	a4,a4,0x1e
 128:	00e787b3          	add	a5,a5,a4
 12c:	02b12a23          	sw	a1,52(sp)
 130:	00f12627          	fsw	fa5,12(sp)
 134:	02512c23          	sw	t0,56(sp)
 138:	0037f793          	andi	a5,a5,3
 13c:	00164603          	lbu	a2,1(a2)
 140:	40e787b3          	sub	a5,a5,a4
 144:	00010737          	lui	a4,0x10
 148:	00470593          	addi	a1,a4,4 # 10004 <rx_var>
 14c:	00b787b3          	add	a5,a5,a1
 150:	00c78023          	sb	a2,0(a5)
 154:	00472787          	flw	fa5,4(a4)
 158:	00c6a603          	lw	a2,12(a3)
 15c:	00010737          	lui	a4,0x10
 160:	c00795d3          	fcvt.w.s	a1,fa5,rtz
 164:	41f65793          	srai	a5,a2,0x1f
 168:	0037f793          	andi	a5,a5,3
 16c:	00c787b3          	add	a5,a5,a2
 170:	01070713          	addi	a4,a4,16 # 10010 <array>
 174:	ffc7f793          	andi	a5,a5,-4
 178:	00f707b3          	add	a5,a4,a5
 17c:	00b7a023          	sw	a1,0(a5)
 180:	00c6a703          	lw	a4,12(a3)
 184:	00f00793          	li	a5,15
 188:	02e7ce63          	blt	a5,a4,1c4 <fast_irq0_handler+0xd0>
 18c:	00c6a783          	lw	a5,12(a3)
 190:	00178793          	addi	a5,a5,1
 194:	00f6a623          	sw	a5,12(a3)
 198:	03812283          	lw	t0,56(sp)
 19c:	00329073          	fscsr	t0
 1a0:	03c12283          	lw	t0,60(sp)
 1a4:	03412583          	lw	a1,52(sp)
 1a8:	03012603          	lw	a2,48(sp)
 1ac:	02c12683          	lw	a3,44(sp)
 1b0:	02812703          	lw	a4,40(sp)
 1b4:	02412783          	lw	a5,36(sp)
 1b8:	00c12787          	flw	fa5,12(sp)
 1bc:	04010113          	addi	sp,sp,64
 1c0:	30200073          	mret
 1c4:	30047073          	csrci	mstatus,8
 1c8:	fd1ff06f          	j	198 <fast_irq0_handler+0xa4>

000001cc <fast_irq1_handler>:
 1cc:	ff010113          	addi	sp,sp,-16
 1d0:	00512623          	sw	t0,12(sp)
 1d4:	00c12283          	lw	t0,12(sp)
 1d8:	01010113          	addi	sp,sp,16
 1dc:	30200073          	mret

000001e0 <uart_init>:
 1e0:	00b52023          	sw	a1,0(a0)
 1e4:	00008067          	ret

000001e8 <uart_transmit_byte>:
 1e8:	10008737          	lui	a4,0x10008
 1ec:	01270713          	addi	a4,a4,18 # 10008012 <__stack_top+0xffe8016>
 1f0:	00000013          	nop
 1f4:	00000013          	nop
 1f8:	00075783          	lhu	a5,0(a4)
 1fc:	0027f793          	andi	a5,a5,2
 200:	fe0798e3          	bnez	a5,1f0 <uart_transmit_byte+0x8>
 204:	00000013          	nop
 208:	00000013          	nop
 20c:	00000013          	nop
 210:	00000013          	nop
 214:	100087b7          	lui	a5,0x10008
 218:	00b7a823          	sw	a1,16(a5) # 10008010 <__stack_top+0xffe8014>
 21c:	00008067          	ret

00000220 <exc>:
 220:	e99ff06f          	j	b8 <exc_handler>

00000224 <ssi>:
 224:	00000013          	nop

00000228 <hsi>:
 228:	00000013          	nop

0000022c <msi>:
 22c:	eb5ff06f          	j	e0 <msi_handler>

00000230 <uti>:
 230:	00000013          	nop

00000234 <sti>:
 234:	00000013          	nop

00000238 <hti>:
 238:	00000013          	nop

0000023c <mti>:
 23c:	e69ff06f          	j	a4 <mti_handler>

00000240 <uei>:
 240:	00000013          	nop

00000244 <sei>:
 244:	00000013          	nop

00000248 <hei>:
 248:	00000013          	nop

0000024c <mei>:
 24c:	e81ff06f          	j	cc <mei_handler>
 250:	00000013          	nop
 254:	00000013          	nop
 258:	00000013          	nop
 25c:	00000013          	nop

00000260 <fast_irq0>:
 260:	e95ff06f          	j	f4 <fast_irq0_handler>

00000264 <fast_irq1>:
 264:	f69ff06f          	j	1cc <fast_irq1_handler>

00000268 <SET_MTVEC_VECTOR_MODE>:
 268:	00000797          	auipc	a5,0x0
 26c:	fb878793          	addi	a5,a5,-72 # 220 <exc>
 270:	0017e793          	ori	a5,a5,1
 274:	30579073          	csrw	mtvec,a5
 278:	00008067          	ret
