
inference_uart_echo.elf:     file format elf32-littleriscv


Disassembly of section .init:

00000000 <_start>:
   0:	00186117          	auipc	sp,0x186
   4:	ee010113          	addi	sp,sp,-288 # 185ee0 <__stack_top>
   8:	00010433          	add	s0,sp,zero
   c:	0040006f          	j	10 <main>

Disassembly of section .text:

00000010 <main>:
  10:	e0010113          	addi	sp,sp,-512
  14:	1e112e23          	sw	ra,508(sp)
  18:	1e812c23          	sw	s0,504(sp)
  1c:	204000ef          	jal	220 <SET_MTVEC_VECTOR_MODE>
  20:	00100437          	lui	s0,0x100
  24:	100085b7          	lui	a1,0x10008
  28:	01058593          	addi	a1,a1,16 # 10008010 <__stack_top+0xfe82130>
  2c:	00040513          	mv	a0,s0
  30:	118000ef          	jal	148 <uart_init>
  34:	000eb7b7          	lui	a5,0xeb
  38:	b3c78793          	addi	a5,a5,-1220 # eab3c <layer0_weights+0x3d000>
  3c:	00810713          	addi	a4,sp,8
  40:	1e078693          	addi	a3,a5,480
  44:	0007a803          	lw	a6,0(a5)
  48:	0047a503          	lw	a0,4(a5)
  4c:	0087a583          	lw	a1,8(a5)
  50:	00c7a603          	lw	a2,12(a5)
  54:	01072023          	sw	a6,0(a4)
  58:	00a72223          	sw	a0,4(a4)
  5c:	00b72423          	sw	a1,8(a4)
  60:	00c72623          	sw	a2,12(a4)
  64:	01078793          	addi	a5,a5,16
  68:	01070713          	addi	a4,a4,16
  6c:	fcd79ce3          	bne	a5,a3,44 <main+0x34>
  70:	0007a683          	lw	a3,0(a5)
  74:	0047a783          	lw	a5,4(a5)
  78:	000015b7          	lui	a1,0x1
  7c:	00d72023          	sw	a3,0(a4)
  80:	00f72223          	sw	a5,4(a4)
  84:	b2058593          	addi	a1,a1,-1248 # b20 <model_infer+0x8ec>
  88:	00500613          	li	a2,5
  8c:	00040513          	mv	a0,s0
  90:	0f8000ef          	jal	188 <uart_transmit_string>
  94:	00810513          	addi	a0,sp,8
  98:	19c000ef          	jal	234 <model_infer>
  9c:	00a103a3          	sb	a0,7(sp)
  a0:	00710593          	addi	a1,sp,7
  a4:	00040513          	mv	a0,s0
  a8:	00100613          	li	a2,1
  ac:	0dc000ef          	jal	188 <uart_transmit_string>
  b0:	00714583          	lbu	a1,7(sp)
  b4:	00040513          	mv	a0,s0
  b8:	098000ef          	jal	150 <uart_transmit_byte>
  bc:	1fc12083          	lw	ra,508(sp)
  c0:	1f812403          	lw	s0,504(sp)
  c4:	00000513          	li	a0,0
  c8:	20010113          	addi	sp,sp,512
  cc:	00008067          	ret

000000d0 <mti_handler>:
  d0:	ff010113          	addi	sp,sp,-16
  d4:	00512623          	sw	t0,12(sp)
  d8:	00c12283          	lw	t0,12(sp)
  dc:	01010113          	addi	sp,sp,16
  e0:	30200073          	mret

000000e4 <exc_handler>:
  e4:	ff010113          	addi	sp,sp,-16
  e8:	00512623          	sw	t0,12(sp)
  ec:	00c12283          	lw	t0,12(sp)
  f0:	01010113          	addi	sp,sp,16
  f4:	30200073          	mret

000000f8 <mei_handler>:
  f8:	ff010113          	addi	sp,sp,-16
  fc:	00512623          	sw	t0,12(sp)
 100:	00c12283          	lw	t0,12(sp)
 104:	01010113          	addi	sp,sp,16
 108:	30200073          	mret

0000010c <msi_handler>:
 10c:	ff010113          	addi	sp,sp,-16
 110:	00512623          	sw	t0,12(sp)
 114:	00c12283          	lw	t0,12(sp)
 118:	01010113          	addi	sp,sp,16
 11c:	30200073          	mret

00000120 <fast_irq0_handler>:
 120:	ff010113          	addi	sp,sp,-16
 124:	00512623          	sw	t0,12(sp)
 128:	00c12283          	lw	t0,12(sp)
 12c:	01010113          	addi	sp,sp,16
 130:	30200073          	mret

00000134 <fast_irq1_handler>:
 134:	ff010113          	addi	sp,sp,-16
 138:	00512623          	sw	t0,12(sp)
 13c:	00c12283          	lw	t0,12(sp)
 140:	01010113          	addi	sp,sp,16
 144:	30200073          	mret

00000148 <uart_init>:
 148:	00b52023          	sw	a1,0(a0)
 14c:	00008067          	ret

00000150 <uart_transmit_byte>:
 150:	10008737          	lui	a4,0x10008
 154:	01270713          	addi	a4,a4,18 # 10008012 <__stack_top+0xfe82132>
 158:	00000013          	nop
 15c:	00000013          	nop
 160:	00075783          	lhu	a5,0(a4)
 164:	0027f793          	andi	a5,a5,2
 168:	fe0798e3          	bnez	a5,158 <uart_transmit_byte+0x8>
 16c:	00000013          	nop
 170:	00000013          	nop
 174:	00000013          	nop
 178:	00000013          	nop
 17c:	100087b7          	lui	a5,0x10008
 180:	00b7a823          	sw	a1,16(a5) # 10008010 <__stack_top+0xfe82130>
 184:	00008067          	ret

00000188 <uart_transmit_string>:
 188:	04060663          	beqz	a2,1d4 <uart_transmit_string+0x4c>
 18c:	10008737          	lui	a4,0x10008
 190:	10008537          	lui	a0,0x10008
 194:	00c58633          	add	a2,a1,a2
 198:	01270713          	addi	a4,a4,18 # 10008012 <__stack_top+0xfe82132>
 19c:	01050513          	addi	a0,a0,16 # 10008010 <__stack_top+0xfe82130>
 1a0:	0005c683          	lbu	a3,0(a1)
 1a4:	00158593          	addi	a1,a1,1
 1a8:	00000013          	nop
 1ac:	00000013          	nop
 1b0:	00075783          	lhu	a5,0(a4)
 1b4:	0027f793          	andi	a5,a5,2
 1b8:	fe0798e3          	bnez	a5,1a8 <uart_transmit_string+0x20>
 1bc:	00000013          	nop
 1c0:	00000013          	nop
 1c4:	00000013          	nop
 1c8:	00000013          	nop
 1cc:	00d52023          	sw	a3,0(a0)
 1d0:	fcb618e3          	bne	a2,a1,1a0 <uart_transmit_string+0x18>
 1d4:	00008067          	ret

000001d8 <exc>:
 1d8:	f0dff06f          	j	e4 <exc_handler>

000001dc <ssi>:
 1dc:	00000013          	nop

000001e0 <hsi>:
 1e0:	00000013          	nop

000001e4 <msi>:
 1e4:	f29ff06f          	j	10c <msi_handler>

000001e8 <uti>:
 1e8:	00000013          	nop

000001ec <sti>:
 1ec:	00000013          	nop

000001f0 <hti>:
 1f0:	00000013          	nop

000001f4 <mti>:
 1f4:	eddff06f          	j	d0 <mti_handler>

000001f8 <uei>:
 1f8:	00000013          	nop

000001fc <sei>:
 1fc:	00000013          	nop

00000200 <hei>:
 200:	00000013          	nop

00000204 <mei>:
 204:	ef5ff06f          	j	f8 <mei_handler>
 208:	00000013          	nop
 20c:	00000013          	nop
 210:	00000013          	nop
 214:	00000013          	nop

00000218 <fast_irq0>:
 218:	f09ff06f          	j	120 <fast_irq0_handler>

0000021c <fast_irq1>:
 21c:	f19ff06f          	j	134 <fast_irq1_handler>

00000220 <SET_MTVEC_VECTOR_MODE>:
 220:	00000797          	auipc	a5,0x0
 224:	fb878793          	addi	a5,a5,-72 # 1d8 <exc>
 228:	0017e793          	ori	a5,a5,1
 22c:	30579073          	csrw	mtvec,a5
 230:	00008067          	ret

00000234 <model_infer>:
 234:	ffffd2b7          	lui	t0,0xffffd
 238:	2d028293          	addi	t0,t0,720 # ffffd2d0 <__stack_top+0xffe773f0>
 23c:	000017b7          	lui	a5,0x1
 240:	00510133          	add	sp,sp,t0
 244:	53078793          	addi	a5,a5,1328 # 1530 <layer3_biases+0xf4>
 248:	00f107b3          	add	a5,sp,a5
 24c:	000ad5b7          	lui	a1,0xad
 250:	000eb637          	lui	a2,0xeb
 254:	00078893          	mv	a7,a5
 258:	33c58593          	addi	a1,a1,828 # ad33c <layer0_biases>
 25c:	b3c60613          	addi	a2,a2,-1220 # eab3c <layer0_weights+0x3d000>
 260:	00000813          	li	a6,0
 264:	fffc3e37          	lui	t3,0xfffc3
 268:	20000313          	li	t1,512
 26c:	0005a707          	flw	fa4,0(a1)
 270:	00050693          	mv	a3,a0
 274:	01c60733          	add	a4,a2,t3
 278:	00072687          	flw	fa3,0(a4)
 27c:	0006a787          	flw	fa5,0(a3)
 280:	7ff70713          	addi	a4,a4,2047
 284:	00170713          	addi	a4,a4,1
 288:	10d7f7d3          	fmul.s	fa5,fa5,fa3
 28c:	00468693          	addi	a3,a3,4
 290:	00f77753          	fadd.s	fa4,fa4,fa5
 294:	fee612e3          	bne	a2,a4,278 <model_infer+0x44>
 298:	00e8a027          	fsw	fa4,0(a7)
 29c:	00180813          	addi	a6,a6,1
 2a0:	00458593          	addi	a1,a1,4
 2a4:	00488893          	addi	a7,a7,4
 2a8:	00460613          	addi	a2,a2,4
 2ac:	fc6810e3          	bne	a6,t1,26c <model_infer+0x38>
 2b0:	00002737          	lui	a4,0x2
 2b4:	53070713          	addi	a4,a4,1328 # 2530 <layer3_weights+0xff4>
 2b8:	00e10533          	add	a0,sp,a4
 2bc:	f00006d3          	fmv.w.x	fa3,zero
 2c0:	80050513          	addi	a0,a0,-2048
 2c4:	7ff78613          	addi	a2,a5,2047
 2c8:	00050713          	mv	a4,a0
 2cc:	00160613          	addi	a2,a2,1
 2d0:	0007a707          	flw	fa4,0(a5)
 2d4:	f00007d3          	fmv.w.x	fa5,zero
 2d8:	00478793          	addi	a5,a5,4
 2dc:	a0e696d3          	flt.s	a3,fa3,fa4
 2e0:	00068463          	beqz	a3,2e8 <model_infer+0xb4>
 2e4:	20e707d3          	fmv.s	fa5,fa4
 2e8:	00f72027          	fsw	fa5,0(a4)
 2ec:	00470713          	addi	a4,a4,4
 2f0:	fef610e3          	bne	a2,a5,2d0 <model_infer+0x9c>
 2f4:	000eb737          	lui	a4,0xeb
 2f8:	000ab7b7          	lui	a5,0xab
 2fc:	000eb5b7          	lui	a1,0xeb
 300:	d6472007          	flw	ft0,-668(a4) # ead64 <bn0_eps>
 304:	33c78793          	addi	a5,a5,828 # ab33c <bn0_var>
 308:	000eb737          	lui	a4,0xeb
 30c:	00002837          	lui	a6,0x2
 310:	d4c5a587          	flw	fa1,-692(a1) # ead4c <__SDATA_BEGIN__>
 314:	f0000553          	fmv.w.x	fa0,zero
 318:	d5072707          	flw	fa4,-688(a4) # ead50 <__SDATA_BEGIN__+0x4>
 31c:	000ad637          	lui	a2,0xad
 320:	000ac6b7          	lui	a3,0xac
 324:	000ac737          	lui	a4,0xac
 328:	7ff78313          	addi	t1,a5,2047
 32c:	53080813          	addi	a6,a6,1328 # 2530 <layer3_weights+0xff4>
 330:	00130313          	addi	t1,t1,1
 334:	b3c60613          	addi	a2,a2,-1220 # acb3c <bn0_gamma>
 338:	b3c68693          	addi	a3,a3,-1220 # abb3c <bn0_mean>
 33c:	33c70713          	addi	a4,a4,828 # ac33c <bn0_beta>
 340:	01010833          	add	a6,sp,a6
 344:	0007a787          	flw	fa5,0(a5)
 348:	f00006d3          	fmv.w.x	fa3,zero
 34c:	20b58653          	fmv.s	fa2,fa1
 350:	00f077d3          	fadd.s	fa5,ft0,fa5
 354:	00478793          	addi	a5,a5,4
 358:	a0a788d3          	fle.s	a7,fa5,fa0
 35c:	08089463          	bnez	a7,3e4 <model_infer+0x1b0>
 360:	a0f598d3          	flt.s	a7,fa1,fa5
 364:	00088463          	beqz	a7,36c <model_infer+0x138>
 368:	20f78653          	fmv.s	fa2,fa5
 36c:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 370:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 374:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 378:	18d7f653          	fdiv.s	fa2,fa5,fa3
 37c:	00d67653          	fadd.s	fa2,fa2,fa3
 380:	10e67653          	fmul.s	fa2,fa2,fa4
 384:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 388:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 38c:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 390:	18d7f653          	fdiv.s	fa2,fa5,fa3
 394:	00d67653          	fadd.s	fa2,fa2,fa3
 398:	10e67653          	fmul.s	fa2,fa2,fa4
 39c:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 3a0:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 3a4:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 3a8:	18d7f653          	fdiv.s	fa2,fa5,fa3
 3ac:	00d67653          	fadd.s	fa2,fa2,fa3
 3b0:	10e67653          	fmul.s	fa2,fa2,fa4
 3b4:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 3b8:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 3bc:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 3c0:	18d7f653          	fdiv.s	fa2,fa5,fa3
 3c4:	00d67653          	fadd.s	fa2,fa2,fa3
 3c8:	10e67653          	fmul.s	fa2,fa2,fa4
 3cc:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 3d0:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 3d4:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 3d8:	18d7f7d3          	fdiv.s	fa5,fa5,fa3
 3dc:	00d7f7d3          	fadd.s	fa5,fa5,fa3
 3e0:	10e7f6d3          	fmul.s	fa3,fa5,fa4
 3e4:	18d5f6d3          	fdiv.s	fa3,fa1,fa3
 3e8:	00052787          	flw	fa5,0(a0)
 3ec:	0006a107          	flw	ft2,0(a3)
 3f0:	00062087          	flw	ft1,0(a2)
 3f4:	00072607          	flw	fa2,0(a4)
 3f8:	0827f7d3          	fsub.s	fa5,fa5,ft2
 3fc:	00450513          	addi	a0,a0,4
 400:	00468693          	addi	a3,a3,4
 404:	00460613          	addi	a2,a2,4
 408:	00470713          	addi	a4,a4,4
 40c:	1017f7d3          	fmul.s	fa5,fa5,ft1
 410:	00480813          	addi	a6,a6,4
 414:	10d7f7d3          	fmul.s	fa5,fa5,fa3
 418:	00c7f7d3          	fadd.s	fa5,fa5,fa2
 41c:	fef82e27          	fsw	fa5,-4(a6)
 420:	f2f312e3          	bne	t1,a5,344 <model_infer+0x110>
 424:	7ff10793          	addi	a5,sp,2047
 428:	13178793          	addi	a5,a5,305
 42c:	0002b537          	lui	a0,0x2b
 430:	0002b637          	lui	a2,0x2b
 434:	00078893          	mv	a7,a5
 438:	f3c50513          	addi	a0,a0,-196 # 2af3c <layer1_biases>
 43c:	33c60613          	addi	a2,a2,828 # 2b33c <layer1_weights>
 440:	00000813          	li	a6,0
 444:	10000313          	li	t1,256
 448:	00002737          	lui	a4,0x2
 44c:	00052707          	flw	fa4,0(a0)
 450:	53070713          	addi	a4,a4,1328 # 2530 <layer3_weights+0xff4>
 454:	00060693          	mv	a3,a2
 458:	00e10733          	add	a4,sp,a4
 45c:	00072787          	flw	fa5,0(a4)
 460:	0006a687          	flw	fa3,0(a3)
 464:	00003e37          	lui	t3,0x3
 468:	d30e0e13          	addi	t3,t3,-720 # 2d30 <layer3_weights+0x17f4>
 46c:	10d7f7d3          	fmul.s	fa5,fa5,fa3
 470:	00470713          	addi	a4,a4,4
 474:	002e0e33          	add	t3,t3,sp
 478:	40068693          	addi	a3,a3,1024
 47c:	00f77753          	fadd.s	fa4,fa4,fa5
 480:	fcee1ee3          	bne	t3,a4,45c <model_infer+0x228>
 484:	00e8a027          	fsw	fa4,0(a7)
 488:	00180813          	addi	a6,a6,1
 48c:	00450513          	addi	a0,a0,4
 490:	00488893          	addi	a7,a7,4
 494:	00460613          	addi	a2,a2,4
 498:	fa6818e3          	bne	a6,t1,448 <model_infer+0x214>
 49c:	7ff10513          	addi	a0,sp,2047
 4a0:	f00006d3          	fmv.w.x	fa3,zero
 4a4:	53150513          	addi	a0,a0,1329
 4a8:	00050713          	mv	a4,a0
 4ac:	40078613          	addi	a2,a5,1024
 4b0:	0007a707          	flw	fa4,0(a5)
 4b4:	f00007d3          	fmv.w.x	fa5,zero
 4b8:	00478793          	addi	a5,a5,4
 4bc:	a0e696d3          	flt.s	a3,fa3,fa4
 4c0:	00068463          	beqz	a3,4c8 <model_infer+0x294>
 4c4:	20e707d3          	fmv.s	fa5,fa4
 4c8:	00f72027          	fsw	fa5,0(a4)
 4cc:	00470713          	addi	a4,a4,4
 4d0:	fef610e3          	bne	a2,a5,4b0 <model_infer+0x27c>
 4d4:	000eb7b7          	lui	a5,0xeb
 4d8:	d607a007          	flw	ft0,-672(a5) # ead60 <bn1_eps>
 4dc:	00001737          	lui	a4,0x1
 4e0:	000eb7b7          	lui	a5,0xeb
 4e4:	13070713          	addi	a4,a4,304 # 1130 <bn3_var+0xf4>
 4e8:	d507a707          	flw	fa4,-688(a5) # ead50 <__SDATA_BEGIN__+0x4>
 4ec:	f0000553          	fmv.w.x	fa0,zero
 4f0:	0002a7b7          	lui	a5,0x2a
 4f4:	d4c5a587          	flw	fa1,-692(a1)
 4f8:	00e10e33          	add	t3,sp,a4
 4fc:	f3c78793          	addi	a5,a5,-196 # 29f3c <bn1_var>
 500:	0002b637          	lui	a2,0x2b
 504:	0002a6b7          	lui	a3,0x2a
 508:	0002a737          	lui	a4,0x2a
 50c:	000e0813          	mv	a6,t3
 510:	40078313          	addi	t1,a5,1024
 514:	b3c60613          	addi	a2,a2,-1220 # 2ab3c <bn1_gamma>
 518:	33c68693          	addi	a3,a3,828 # 2a33c <bn1_mean>
 51c:	73c70713          	addi	a4,a4,1852 # 2a73c <bn1_beta>
 520:	0007a787          	flw	fa5,0(a5)
 524:	f00006d3          	fmv.w.x	fa3,zero
 528:	20b58653          	fmv.s	fa2,fa1
 52c:	00f077d3          	fadd.s	fa5,ft0,fa5
 530:	00478793          	addi	a5,a5,4
 534:	a0a788d3          	fle.s	a7,fa5,fa0
 538:	08089463          	bnez	a7,5c0 <model_infer+0x38c>
 53c:	a0f598d3          	flt.s	a7,fa1,fa5
 540:	00088463          	beqz	a7,548 <model_infer+0x314>
 544:	20f78653          	fmv.s	fa2,fa5
 548:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 54c:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 550:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 554:	18d7f653          	fdiv.s	fa2,fa5,fa3
 558:	00d67653          	fadd.s	fa2,fa2,fa3
 55c:	10e67653          	fmul.s	fa2,fa2,fa4
 560:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 564:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 568:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 56c:	18d7f653          	fdiv.s	fa2,fa5,fa3
 570:	00d67653          	fadd.s	fa2,fa2,fa3
 574:	10e67653          	fmul.s	fa2,fa2,fa4
 578:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 57c:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 580:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 584:	18d7f653          	fdiv.s	fa2,fa5,fa3
 588:	00d67653          	fadd.s	fa2,fa2,fa3
 58c:	10e67653          	fmul.s	fa2,fa2,fa4
 590:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 594:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 598:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 59c:	18d7f653          	fdiv.s	fa2,fa5,fa3
 5a0:	00d67653          	fadd.s	fa2,fa2,fa3
 5a4:	10e67653          	fmul.s	fa2,fa2,fa4
 5a8:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 5ac:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 5b0:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 5b4:	18d7f7d3          	fdiv.s	fa5,fa5,fa3
 5b8:	00d7f7d3          	fadd.s	fa5,fa5,fa3
 5bc:	10e7f6d3          	fmul.s	fa3,fa5,fa4
 5c0:	18d5f6d3          	fdiv.s	fa3,fa1,fa3
 5c4:	00052787          	flw	fa5,0(a0)
 5c8:	0006a107          	flw	ft2,0(a3)
 5cc:	00062087          	flw	ft1,0(a2)
 5d0:	00072607          	flw	fa2,0(a4)
 5d4:	0827f7d3          	fsub.s	fa5,fa5,ft2
 5d8:	00450513          	addi	a0,a0,4
 5dc:	00468693          	addi	a3,a3,4
 5e0:	00460613          	addi	a2,a2,4
 5e4:	00470713          	addi	a4,a4,4
 5e8:	1017f7d3          	fmul.s	fa5,fa5,ft1
 5ec:	00480813          	addi	a6,a6,4
 5f0:	10d7f7d3          	fmul.s	fa5,fa5,fa3
 5f4:	00c7f7d3          	fadd.s	fa5,fa5,fa2
 5f8:	fef82e27          	fsw	fa5,-4(a6)
 5fc:	f2f312e3          	bne	t1,a5,520 <model_infer+0x2ec>
 600:	33010793          	addi	a5,sp,816
 604:	0000a837          	lui	a6,0xa
 608:	0000a537          	lui	a0,0xa
 60c:	00078313          	mv	t1,a5
 610:	d3c80813          	addi	a6,a6,-708 # 9d3c <layer2_biases>
 614:	f3c50513          	addi	a0,a0,-196 # 9f3c <layer2_weights>
 618:	00000893          	li	a7,0
 61c:	400e0613          	addi	a2,t3,1024
 620:	08000e93          	li	t4,128
 624:	00082707          	flw	fa4,0(a6)
 628:	00050693          	mv	a3,a0
 62c:	000e0713          	mv	a4,t3
 630:	00072787          	flw	fa5,0(a4)
 634:	0006a687          	flw	fa3,0(a3)
 638:	00470713          	addi	a4,a4,4
 63c:	20068693          	addi	a3,a3,512
 640:	10d7f7d3          	fmul.s	fa5,fa5,fa3
 644:	00f77753          	fadd.s	fa4,fa4,fa5
 648:	fee614e3          	bne	a2,a4,630 <model_infer+0x3fc>
 64c:	00e32027          	fsw	fa4,0(t1)
 650:	00188893          	addi	a7,a7,1
 654:	00480813          	addi	a6,a6,4
 658:	00430313          	addi	t1,t1,4
 65c:	00450513          	addi	a0,a0,4
 660:	fdd892e3          	bne	a7,t4,624 <model_infer+0x3f0>
 664:	f00006d3          	fmv.w.x	fa3,zero
 668:	53010513          	addi	a0,sp,1328
 66c:	00050713          	mv	a4,a0
 670:	20078613          	addi	a2,a5,512
 674:	0007a707          	flw	fa4,0(a5)
 678:	f00007d3          	fmv.w.x	fa5,zero
 67c:	00478793          	addi	a5,a5,4
 680:	a0e696d3          	flt.s	a3,fa3,fa4
 684:	00068463          	beqz	a3,68c <model_infer+0x458>
 688:	20e707d3          	fmv.s	fa5,fa4
 68c:	00f72027          	fsw	fa5,0(a4)
 690:	00470713          	addi	a4,a4,4
 694:	fef610e3          	bne	a2,a5,674 <model_infer+0x440>
 698:	000eb7b7          	lui	a5,0xeb
 69c:	d5c7a007          	flw	ft0,-676(a5) # ead5c <bn2_eps>
 6a0:	000eb7b7          	lui	a5,0xeb
 6a4:	d507a707          	flw	fa4,-688(a5) # ead50 <__SDATA_BEGIN__+0x4>
 6a8:	f0000553          	fmv.w.x	fa0,zero
 6ac:	000097b7          	lui	a5,0x9
 6b0:	d4c5a587          	flw	fa1,-692(a1)
 6b4:	73010e13          	addi	t3,sp,1840
 6b8:	53c78793          	addi	a5,a5,1340 # 953c <bn2_var>
 6bc:	0000a637          	lui	a2,0xa
 6c0:	000096b7          	lui	a3,0x9
 6c4:	0000a737          	lui	a4,0xa
 6c8:	000e0813          	mv	a6,t3
 6cc:	20078313          	addi	t1,a5,512
 6d0:	b3c60613          	addi	a2,a2,-1220 # 9b3c <bn2_gamma>
 6d4:	73c68693          	addi	a3,a3,1852 # 973c <bn2_mean>
 6d8:	93c70713          	addi	a4,a4,-1732 # 993c <bn2_beta>
 6dc:	0007a787          	flw	fa5,0(a5)
 6e0:	f00006d3          	fmv.w.x	fa3,zero
 6e4:	20b58653          	fmv.s	fa2,fa1
 6e8:	00f077d3          	fadd.s	fa5,ft0,fa5
 6ec:	00478793          	addi	a5,a5,4
 6f0:	a0a788d3          	fle.s	a7,fa5,fa0
 6f4:	08089463          	bnez	a7,77c <model_infer+0x548>
 6f8:	a0f598d3          	flt.s	a7,fa1,fa5
 6fc:	00088463          	beqz	a7,704 <model_infer+0x4d0>
 700:	20f78653          	fmv.s	fa2,fa5
 704:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 708:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 70c:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 710:	18d7f653          	fdiv.s	fa2,fa5,fa3
 714:	00d67653          	fadd.s	fa2,fa2,fa3
 718:	10e67653          	fmul.s	fa2,fa2,fa4
 71c:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 720:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 724:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 728:	18d7f653          	fdiv.s	fa2,fa5,fa3
 72c:	00d67653          	fadd.s	fa2,fa2,fa3
 730:	10e67653          	fmul.s	fa2,fa2,fa4
 734:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 738:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 73c:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 740:	18d7f653          	fdiv.s	fa2,fa5,fa3
 744:	00d67653          	fadd.s	fa2,fa2,fa3
 748:	10e67653          	fmul.s	fa2,fa2,fa4
 74c:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 750:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 754:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 758:	18d7f653          	fdiv.s	fa2,fa5,fa3
 75c:	00d67653          	fadd.s	fa2,fa2,fa3
 760:	10e67653          	fmul.s	fa2,fa2,fa4
 764:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 768:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 76c:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 770:	18d7f7d3          	fdiv.s	fa5,fa5,fa3
 774:	00d7f7d3          	fadd.s	fa5,fa5,fa3
 778:	10e7f6d3          	fmul.s	fa3,fa5,fa4
 77c:	18d5f6d3          	fdiv.s	fa3,fa1,fa3
 780:	00052787          	flw	fa5,0(a0)
 784:	0006a107          	flw	ft2,0(a3)
 788:	00062087          	flw	ft1,0(a2)
 78c:	00072607          	flw	fa2,0(a4)
 790:	0827f7d3          	fsub.s	fa5,fa5,ft2
 794:	00450513          	addi	a0,a0,4
 798:	00468693          	addi	a3,a3,4
 79c:	00460613          	addi	a2,a2,4
 7a0:	00470713          	addi	a4,a4,4
 7a4:	1017f7d3          	fmul.s	fa5,fa5,ft1
 7a8:	00480813          	addi	a6,a6,4
 7ac:	10d7f7d3          	fmul.s	fa5,fa5,fa3
 7b0:	00c7f7d3          	fadd.s	fa5,fa5,fa2
 7b4:	fef82e27          	fsw	fa5,-4(a6)
 7b8:	f26792e3          	bne	a5,t1,6dc <model_infer+0x4a8>
 7bc:	03010713          	addi	a4,sp,48
 7c0:	00001837          	lui	a6,0x1
 7c4:	00001537          	lui	a0,0x1
 7c8:	00070313          	mv	t1,a4
 7cc:	43c80813          	addi	a6,a6,1084 # 143c <layer3_biases>
 7d0:	53c50513          	addi	a0,a0,1340 # 153c <layer3_weights>
 7d4:	00000893          	li	a7,0
 7d8:	200e0613          	addi	a2,t3,512
 7dc:	04000e93          	li	t4,64
 7e0:	00082707          	flw	fa4,0(a6)
 7e4:	00050693          	mv	a3,a0
 7e8:	000e0793          	mv	a5,t3
 7ec:	0007a787          	flw	fa5,0(a5)
 7f0:	0006a687          	flw	fa3,0(a3)
 7f4:	00478793          	addi	a5,a5,4
 7f8:	10068693          	addi	a3,a3,256
 7fc:	10d7f7d3          	fmul.s	fa5,fa5,fa3
 800:	00f77753          	fadd.s	fa4,fa4,fa5
 804:	fec794e3          	bne	a5,a2,7ec <model_infer+0x5b8>
 808:	00e32027          	fsw	fa4,0(t1)
 80c:	00188893          	addi	a7,a7,1
 810:	00480813          	addi	a6,a6,4
 814:	00430313          	addi	t1,t1,4
 818:	00450513          	addi	a0,a0,4
 81c:	fdd892e3          	bne	a7,t4,7e0 <model_infer+0x5ac>
 820:	f00006d3          	fmv.w.x	fa3,zero
 824:	13010513          	addi	a0,sp,304
 828:	00050793          	mv	a5,a0
 82c:	10070613          	addi	a2,a4,256
 830:	00072707          	flw	fa4,0(a4)
 834:	f00007d3          	fmv.w.x	fa5,zero
 838:	00470713          	addi	a4,a4,4
 83c:	a0e696d3          	flt.s	a3,fa3,fa4
 840:	00068463          	beqz	a3,848 <model_infer+0x614>
 844:	20e707d3          	fmv.s	fa5,fa4
 848:	00f7a027          	fsw	fa5,0(a5)
 84c:	00478793          	addi	a5,a5,4
 850:	fec710e3          	bne	a4,a2,830 <model_infer+0x5fc>
 854:	000eb7b7          	lui	a5,0xeb
 858:	d587a007          	flw	ft0,-680(a5) # ead58 <bn3_eps>
 85c:	000eb7b7          	lui	a5,0xeb
 860:	d507a707          	flw	fa4,-688(a5) # ead50 <__SDATA_BEGIN__+0x4>
 864:	f0000553          	fmv.w.x	fa0,zero
 868:	000017b7          	lui	a5,0x1
 86c:	d4c5a587          	flw	fa1,-692(a1)
 870:	23010e13          	addi	t3,sp,560
 874:	03c78793          	addi	a5,a5,60 # 103c <bn3_var>
 878:	00001637          	lui	a2,0x1
 87c:	000016b7          	lui	a3,0x1
 880:	00001737          	lui	a4,0x1
 884:	000e0813          	mv	a6,t3
 888:	10078313          	addi	t1,a5,256
 88c:	33c60613          	addi	a2,a2,828 # 133c <bn3_gamma>
 890:	13c68693          	addi	a3,a3,316 # 113c <bn3_mean>
 894:	23c70713          	addi	a4,a4,572 # 123c <bn3_beta>
 898:	0007a787          	flw	fa5,0(a5)
 89c:	f00006d3          	fmv.w.x	fa3,zero
 8a0:	20b58653          	fmv.s	fa2,fa1
 8a4:	00f077d3          	fadd.s	fa5,ft0,fa5
 8a8:	00478793          	addi	a5,a5,4
 8ac:	a0a788d3          	fle.s	a7,fa5,fa0
 8b0:	08089463          	bnez	a7,938 <model_infer+0x704>
 8b4:	a0f598d3          	flt.s	a7,fa1,fa5
 8b8:	00088463          	beqz	a7,8c0 <model_infer+0x68c>
 8bc:	20f78653          	fmv.s	fa2,fa5
 8c0:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 8c4:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 8c8:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 8cc:	18d7f653          	fdiv.s	fa2,fa5,fa3
 8d0:	00d67653          	fadd.s	fa2,fa2,fa3
 8d4:	10e67653          	fmul.s	fa2,fa2,fa4
 8d8:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 8dc:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 8e0:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 8e4:	18d7f653          	fdiv.s	fa2,fa5,fa3
 8e8:	00d67653          	fadd.s	fa2,fa2,fa3
 8ec:	10e67653          	fmul.s	fa2,fa2,fa4
 8f0:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 8f4:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 8f8:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 8fc:	18d7f653          	fdiv.s	fa2,fa5,fa3
 900:	00d67653          	fadd.s	fa2,fa2,fa3
 904:	10e67653          	fmul.s	fa2,fa2,fa4
 908:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 90c:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 910:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 914:	18d7f653          	fdiv.s	fa2,fa5,fa3
 918:	00d67653          	fadd.s	fa2,fa2,fa3
 91c:	10e67653          	fmul.s	fa2,fa2,fa4
 920:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 924:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 928:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 92c:	18d7f7d3          	fdiv.s	fa5,fa5,fa3
 930:	00d7f7d3          	fadd.s	fa5,fa5,fa3
 934:	10e7f6d3          	fmul.s	fa3,fa5,fa4
 938:	18d5f6d3          	fdiv.s	fa3,fa1,fa3
 93c:	00052787          	flw	fa5,0(a0)
 940:	0006a107          	flw	ft2,0(a3)
 944:	00062087          	flw	ft1,0(a2)
 948:	00072607          	flw	fa2,0(a4)
 94c:	0827f7d3          	fsub.s	fa5,fa5,ft2
 950:	00450513          	addi	a0,a0,4
 954:	00468693          	addi	a3,a3,4
 958:	00460613          	addi	a2,a2,4
 95c:	00470713          	addi	a4,a4,4
 960:	1017f7d3          	fmul.s	fa5,fa5,ft1
 964:	00480813          	addi	a6,a6,4
 968:	10d7f7d3          	fmul.s	fa5,fa5,fa3
 96c:	00c7f7d3          	fadd.s	fa5,fa5,fa2
 970:	fef82e27          	fsw	fa5,-4(a6)
 974:	f2f312e3          	bne	t1,a5,898 <model_infer+0x664>
 978:	00810613          	addi	a2,sp,8
 97c:	00001837          	lui	a6,0x1
 980:	00001537          	lui	a0,0x1
 984:	00060313          	mv	t1,a2
 988:	b2880813          	addi	a6,a6,-1240 # b28 <layer4_biases>
 98c:	b3c50513          	addi	a0,a0,-1220 # b3c <layer4_weights>
 990:	00000893          	li	a7,0
 994:	100e0693          	addi	a3,t3,256
 998:	00500e93          	li	t4,5
 99c:	00082707          	flw	fa4,0(a6)
 9a0:	00050713          	mv	a4,a0
 9a4:	000e0793          	mv	a5,t3
 9a8:	0007a787          	flw	fa5,0(a5)
 9ac:	00072687          	flw	fa3,0(a4)
 9b0:	00478793          	addi	a5,a5,4
 9b4:	01470713          	addi	a4,a4,20
 9b8:	10d7f7d3          	fmul.s	fa5,fa5,fa3
 9bc:	00f77753          	fadd.s	fa4,fa4,fa5
 9c0:	fef694e3          	bne	a3,a5,9a8 <model_infer+0x774>
 9c4:	00e32027          	fsw	fa4,0(t1)
 9c8:	00188893          	addi	a7,a7,1
 9cc:	00480813          	addi	a6,a6,4
 9d0:	00430313          	addi	t1,t1,4
 9d4:	00450513          	addi	a0,a0,4
 9d8:	fdd892e3          	bne	a7,t4,99c <model_infer+0x768>
 9dc:	000eb737          	lui	a4,0xeb
 9e0:	00812707          	flw	fa4,8(sp)
 9e4:	d5472787          	flw	fa5,-684(a4) # ead54 <__SDATA_BEGIN__+0x8>
 9e8:	a0e797d3          	flt.s	a5,fa5,fa4
 9ec:	00078463          	beqz	a5,9f4 <model_infer+0x7c0>
 9f0:	20e707d3          	fmv.s	fa5,fa4
 9f4:	00c12707          	flw	fa4,12(sp)
 9f8:	20f786d3          	fmv.s	fa3,fa5
 9fc:	a0e797d3          	flt.s	a5,fa5,fa4
 a00:	00078463          	beqz	a5,a08 <model_infer+0x7d4>
 a04:	20e706d3          	fmv.s	fa3,fa4
 a08:	01012787          	flw	fa5,16(sp)
 a0c:	20d68753          	fmv.s	fa4,fa3
 a10:	a0f697d3          	flt.s	a5,fa3,fa5
 a14:	00078463          	beqz	a5,a1c <model_infer+0x7e8>
 a18:	20f78753          	fmv.s	fa4,fa5
 a1c:	01412687          	flw	fa3,20(sp)
 a20:	20e707d3          	fmv.s	fa5,fa4
 a24:	a0d717d3          	flt.s	a5,fa4,fa3
 a28:	00078463          	beqz	a5,a30 <model_infer+0x7fc>
 a2c:	20d687d3          	fmv.s	fa5,fa3
 a30:	01812707          	flw	fa4,24(sp)
 a34:	20f78553          	fmv.s	fa0,fa5
 a38:	a0e797d3          	flt.s	a5,fa5,fa4
 a3c:	00078463          	beqz	a5,a44 <model_infer+0x810>
 a40:	20e70553          	fmv.s	fa0,fa4
 a44:	f00005d3          	fmv.w.x	fa1,zero
 a48:	01c10693          	addi	a3,sp,28
 a4c:	01460513          	addi	a0,a2,20
 a50:	03300713          	li	a4,51
 a54:	00062607          	flw	fa2,0(a2)
 a58:	d4c5a687          	flw	fa3,-692(a1)
 a5c:	00100793          	li	a5,1
 a60:	08a67653          	fsub.s	fa2,fa2,fa0
 a64:	20d68753          	fmv.s	fa4,fa3
 a68:	d007f7d3          	fcvt.s.w	fa5,a5
 a6c:	00178793          	addi	a5,a5,1
 a70:	18f677d3          	fdiv.s	fa5,fa2,fa5
 a74:	10f77753          	fmul.s	fa4,fa4,fa5
 a78:	00e6f6d3          	fadd.s	fa3,fa3,fa4
 a7c:	fee796e3          	bne	a5,a4,a68 <model_infer+0x834>
 a80:	00d6a027          	fsw	fa3,0(a3)
 a84:	00460613          	addi	a2,a2,4
 a88:	00d5f5d3          	fadd.s	fa1,fa1,fa3
 a8c:	00468693          	addi	a3,a3,4
 a90:	fcc512e3          	bne	a0,a2,a54 <model_infer+0x820>
 a94:	f00007d3          	fmv.w.x	fa5,zero
 a98:	a0b797d3          	flt.s	a5,fa5,fa1
 a9c:	d4c5a787          	flw	fa5,-692(a1)
 aa0:	00078463          	beqz	a5,aa8 <model_infer+0x874>
 aa4:	18b7f7d3          	fdiv.s	fa5,fa5,fa1
 aa8:	01c12707          	flw	fa4,28(sp)
 aac:	02012587          	flw	fa1,32(sp)
 ab0:	02412607          	flw	fa2,36(sp)
 ab4:	10e7f753          	fmul.s	fa4,fa5,fa4
 ab8:	10b7f5d3          	fmul.s	fa1,fa5,fa1
 abc:	02812687          	flw	fa3,40(sp)
 ac0:	02c12507          	flw	fa0,44(sp)
 ac4:	10c7f653          	fmul.s	fa2,fa5,fa2
 ac8:	10d7f6d3          	fmul.s	fa3,fa5,fa3
 acc:	a0b717d3          	flt.s	a5,fa4,fa1
 ad0:	10a7f7d3          	fmul.s	fa5,fa5,fa0
 ad4:	00000513          	li	a0,0
 ad8:	00078663          	beqz	a5,ae4 <model_infer+0x8b0>
 adc:	20b58753          	fmv.s	fa4,fa1
 ae0:	00100513          	li	a0,1
 ae4:	a0c717d3          	flt.s	a5,fa4,fa2
 ae8:	00078663          	beqz	a5,af4 <model_infer+0x8c0>
 aec:	20c60753          	fmv.s	fa4,fa2
 af0:	00200513          	li	a0,2
 af4:	a0d717d3          	flt.s	a5,fa4,fa3
 af8:	00078663          	beqz	a5,b04 <model_infer+0x8d0>
 afc:	20d68753          	fmv.s	fa4,fa3
 b00:	00300513          	li	a0,3
 b04:	a0f717d3          	flt.s	a5,fa4,fa5
 b08:	00078463          	beqz	a5,b10 <model_infer+0x8dc>
 b0c:	00400513          	li	a0,4
 b10:	000032b7          	lui	t0,0x3
 b14:	d3028293          	addi	t0,t0,-720 # 2d30 <layer3_weights+0x17f4>
 b18:	00510133          	add	sp,sp,t0
 b1c:	00008067          	ret
