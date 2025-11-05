
aes_main.elf:     file format elf32-littleriscv


Disassembly of section .init:

00000000 <_start>:
   0:	00020117          	auipc	sp,0x20
   4:	ffc10113          	addi	sp,sp,-4 # 1fffc <__stack_top>
   8:	00010433          	add	s0,sp,zero
   c:	0040006f          	j	10 <main>

Disassembly of section .text:

00000010 <main>:
  10:	f1010113          	addi	sp,sp,-240
  14:	0e112623          	sw	ra,236(sp)
  18:	0e812423          	sw	s0,232(sp)
  1c:	0e912223          	sw	s1,228(sp)
  20:	0f212023          	sw	s2,224(sp)
  24:	0d312e23          	sw	s3,220(sp)
  28:	0d412c23          	sw	s4,216(sp)
  2c:	0d512a23          	sw	s5,212(sp)
  30:	3d5000ef          	jal	c04 <SET_MTVEC_VECTOR_MODE>
  34:	000017b7          	lui	a5,0x1
  38:	c2878793          	addi	a5,a5,-984 # c28 <SET_MTVEC_VECTOR_MODE+0x24>
  3c:	0007a603          	lw	a2,0(a5)
  40:	0047a683          	lw	a3,4(a5)
  44:	0087a703          	lw	a4,8(a5)
  48:	00c7a783          	lw	a5,12(a5)
  4c:	01010513          	addi	a0,sp,16
  50:	00010593          	mv	a1,sp
  54:	0000a437          	lui	s0,0xa
  58:	00c12023          	sw	a2,0(sp)
  5c:	00d12223          	sw	a3,4(sp)
  60:	00e12423          	sw	a4,8(sp)
  64:	00f12623          	sw	a5,12(sp)
  68:	00042223          	sw	zero,4(s0) # a004 <count>
  6c:	2e5000ef          	jal	b50 <AES_init_ctx>
  70:	0000a9b7          	lui	s3,0xa
  74:	100085b7          	lui	a1,0x10008
  78:	00098513          	mv	a0,s3
  7c:	01058593          	addi	a1,a1,16 # 10008010 <__stack_top+0xffe8014>
  80:	2e5000ef          	jal	b64 <uart_init>
  84:	10008a37          	lui	s4,0x10008
  88:	00100793          	li	a5,1
  8c:	000015b7          	lui	a1,0x1
  90:	00098513          	mv	a0,s3
  94:	c1858593          	addi	a1,a1,-1000 # c18 <SET_MTVEC_VECTOR_MODE+0x14>
  98:	00c00613          	li	a2,12
  9c:	0000a4b7          	lui	s1,0xa
  a0:	02fa0023          	sb	a5,32(s4) # 10008020 <__stack_top+0xffe8024>
  a4:	020a0a13          	addi	s4,s4,32
  a8:	2c5000ef          	jal	b6c <uart_transmit_string>
  ac:	00098993          	mv	s3,s3
  b0:	00848493          	addi	s1,s1,8 # a008 <input_array>
  b4:	00010ab7          	lui	s5,0x10
  b8:	00f00913          	li	s2,15
  bc:	30046073          	csrsi	mstatus,8
  c0:	304aa073          	csrs	mie,s5
  c4:	000a0023          	sb	zero,0(s4)
  c8:	00442783          	lw	a5,4(s0)
  cc:	fef95ee3          	bge	s2,a5,c8 <main+0xb8>
  d0:	00048593          	mv	a1,s1
  d4:	01010513          	addi	a0,sp,16
  d8:	27d000ef          	jal	b54 <AES_ECB_encrypt>
  dc:	00048593          	mv	a1,s1
  e0:	00098513          	mv	a0,s3
  e4:	01000613          	li	a2,16
  e8:	285000ef          	jal	b6c <uart_transmit_string>
  ec:	00042223          	sw	zero,4(s0)
  f0:	fcdff06f          	j	bc <main+0xac>

000000f4 <mti_handler>:
  f4:	30200073          	mret

000000f8 <exc_handler>:
  f8:	30200073          	mret

000000fc <mei_handler>:
  fc:	30200073          	mret

00000100 <msi_handler>:
 100:	30200073          	mret

00000104 <fast_irq0_handler>:
 104:	ff010113          	addi	sp,sp,-16
 108:	00f12023          	sw	a5,0(sp)
 10c:	0000a7b7          	lui	a5,0xa
 110:	0007a783          	lw	a5,0(a5) # a000 <uart0>
 114:	00e12223          	sw	a4,4(sp)
 118:	0000a737          	lui	a4,0xa
 11c:	00c12623          	sw	a2,12(sp)
 120:	00d12423          	sw	a3,8(sp)
 124:	00472603          	lw	a2,4(a4) # a004 <count>
 128:	0017c683          	lbu	a3,1(a5)
 12c:	0000a7b7          	lui	a5,0xa
 130:	00878793          	addi	a5,a5,8 # a008 <input_array>
 134:	00c787b3          	add	a5,a5,a2
 138:	00d78023          	sb	a3,0(a5)
 13c:	00472683          	lw	a3,4(a4)
 140:	00f00793          	li	a5,15
 144:	02d7c463          	blt	a5,a3,16c <fast_irq0_handler+0x68>
 148:	00472783          	lw	a5,4(a4)
 14c:	00c12603          	lw	a2,12(sp)
 150:	00812683          	lw	a3,8(sp)
 154:	00178793          	addi	a5,a5,1
 158:	00f72223          	sw	a5,4(a4)
 15c:	00412703          	lw	a4,4(sp)
 160:	00012783          	lw	a5,0(sp)
 164:	01010113          	addi	sp,sp,16
 168:	30200073          	mret
 16c:	30047073          	csrci	mstatus,8
 170:	00c12603          	lw	a2,12(sp)
 174:	00812683          	lw	a3,8(sp)
 178:	00412703          	lw	a4,4(sp)
 17c:	00012783          	lw	a5,0(sp)
 180:	01010113          	addi	sp,sp,16
 184:	30200073          	mret

00000188 <fast_irq1_handler>:
 188:	30200073          	mret

0000018c <KeyExpansion>:
 18c:	00350793          	addi	a5,a0,3
 190:	fc010113          	addi	sp,sp,-64
 194:	40b787b3          	sub	a5,a5,a1
 198:	02812e23          	sw	s0,60(sp)
 19c:	02912c23          	sw	s1,56(sp)
 1a0:	03212a23          	sw	s2,52(sp)
 1a4:	03312823          	sw	s3,48(sp)
 1a8:	03412623          	sw	s4,44(sp)
 1ac:	03512423          	sw	s5,40(sp)
 1b0:	03612223          	sw	s6,36(sp)
 1b4:	03712023          	sw	s7,32(sp)
 1b8:	01812e23          	sw	s8,28(sp)
 1bc:	01912c23          	sw	s9,24(sp)
 1c0:	01a12a23          	sw	s10,20(sp)
 1c4:	01b12823          	sw	s11,16(sp)
 1c8:	0077b793          	sltiu	a5,a5,7
 1cc:	1c079463          	bnez	a5,394 <KeyExpansion+0x208>
 1d0:	00b567b3          	or	a5,a0,a1
 1d4:	0037f793          	andi	a5,a5,3
 1d8:	1a079e63          	bnez	a5,394 <KeyExpansion+0x208>
 1dc:	0005a783          	lw	a5,0(a1)
 1e0:	00f52023          	sw	a5,0(a0)
 1e4:	0045a783          	lw	a5,4(a1)
 1e8:	00f52223          	sw	a5,4(a0)
 1ec:	0085a783          	lw	a5,8(a1)
 1f0:	00f52423          	sw	a5,8(a0)
 1f4:	00c5a783          	lw	a5,12(a1)
 1f8:	00f52623          	sw	a5,12(a0)
 1fc:	000017b7          	lui	a5,0x1
 200:	00001eb7          	lui	t4,0x1
 204:	c3c78793          	addi	a5,a5,-964 # c3c <Rcon>
 208:	00354603          	lbu	a2,3(a0)
 20c:	00754b83          	lbu	s7,7(a0)
 210:	00b54b03          	lbu	s6,11(a0)
 214:	00f54383          	lbu	t2,15(a0)
 218:	00254803          	lbu	a6,2(a0)
 21c:	00654a83          	lbu	s5,6(a0)
 220:	00a54a03          	lbu	s4,10(a0)
 224:	00e54283          	lbu	t0,14(a0)
 228:	00154883          	lbu	a7,1(a0)
 22c:	00554983          	lbu	s3,5(a0)
 230:	00954903          	lbu	s2,9(a0)
 234:	00d54f83          	lbu	t6,13(a0)
 238:	00054703          	lbu	a4,0(a0)
 23c:	00454c83          	lbu	s9,4(a0)
 240:	00854c03          	lbu	s8,8(a0)
 244:	00c54f03          	lbu	t5,12(a0)
 248:	c48e8e93          	addi	t4,t4,-952 # c48 <sbox>
 24c:	00f12423          	sw	a5,8(sp)
 250:	01050313          	addi	t1,a0,16
 254:	00400e13          	li	t3,4
 258:	09c0006f          	j	2f4 <KeyExpansion+0x168>
 25c:	007e86b3          	add	a3,t4,t2
 260:	00044783          	lbu	a5,0(s0)
 264:	0006c583          	lbu	a1,0(a3)
 268:	000dc403          	lbu	s0,0(s11)
 26c:	01ee86b3          	add	a3,t4,t5
 270:	000d4503          	lbu	a0,0(s10)
 274:	0006c683          	lbu	a3,0(a3)
 278:	0087c7b3          	xor	a5,a5,s0
 27c:	00f747b3          	xor	a5,a4,a5
 280:	01154533          	xor	a0,a0,a7
 284:	00b845b3          	xor	a1,a6,a1
 288:	00c6c6b3          	xor	a3,a3,a2
 28c:	0ff7f793          	zext.b	a5,a5
 290:	0ff57513          	zext.b	a0,a0
 294:	0ff5f593          	zext.b	a1,a1
 298:	0ff6f693          	zext.b	a3,a3
 29c:	00f30023          	sb	a5,0(t1)
 2a0:	00a300a3          	sb	a0,1(t1)
 2a4:	00b30123          	sb	a1,2(t1)
 2a8:	00d301a3          	sb	a3,3(t1)
 2ac:	001e0e13          	addi	t3,t3,1
 2b0:	00430313          	addi	t1,t1,4
 2b4:	000c8713          	mv	a4,s9
 2b8:	00098893          	mv	a7,s3
 2bc:	000a8813          	mv	a6,s5
 2c0:	000b8613          	mv	a2,s7
 2c4:	000c0c93          	mv	s9,s8
 2c8:	00090993          	mv	s3,s2
 2cc:	000a0a93          	mv	s5,s4
 2d0:	000b0b93          	mv	s7,s6
 2d4:	000f0c13          	mv	s8,t5
 2d8:	000f8913          	mv	s2,t6
 2dc:	00028a13          	mv	s4,t0
 2e0:	00038b13          	mv	s6,t2
 2e4:	00078f13          	mv	t5,a5
 2e8:	00050f93          	mv	t6,a0
 2ec:	00058293          	mv	t0,a1
 2f0:	00068393          	mv	t2,a3
 2f4:	00812783          	lw	a5,8(sp)
 2f8:	002e5413          	srli	s0,t3,0x2
 2fc:	011fc533          	xor	a0,t6,a7
 300:	00878433          	add	s0,a5,s0
 304:	01ee87b3          	add	a5,t4,t5
 308:	00f12623          	sw	a5,12(sp)
 30c:	005845b3          	xor	a1,a6,t0
 310:	00ef47b3          	xor	a5,t5,a4
 314:	00c3c6b3          	xor	a3,t2,a2
 318:	003e7493          	andi	s1,t3,3
 31c:	01fe8db3          	add	s11,t4,t6
 320:	005e8d33          	add	s10,t4,t0
 324:	0ff7f793          	zext.b	a5,a5
 328:	0ff57513          	zext.b	a0,a0
 32c:	0ff5f593          	zext.b	a1,a1
 330:	0ff6f693          	zext.b	a3,a3
 334:	f20484e3          	beqz	s1,25c <KeyExpansion+0xd0>
 338:	00f30023          	sb	a5,0(t1)
 33c:	00a300a3          	sb	a0,1(t1)
 340:	00b30123          	sb	a1,2(t1)
 344:	00d301a3          	sb	a3,3(t1)
 348:	001e0e13          	addi	t3,t3,1
 34c:	02c00713          	li	a4,44
 350:	00ee0663          	beq	t3,a4,35c <KeyExpansion+0x1d0>
 354:	00430313          	addi	t1,t1,4
 358:	f5dff06f          	j	2b4 <KeyExpansion+0x128>
 35c:	03c12403          	lw	s0,60(sp)
 360:	03812483          	lw	s1,56(sp)
 364:	03412903          	lw	s2,52(sp)
 368:	03012983          	lw	s3,48(sp)
 36c:	02c12a03          	lw	s4,44(sp)
 370:	02812a83          	lw	s5,40(sp)
 374:	02412b03          	lw	s6,36(sp)
 378:	02012b83          	lw	s7,32(sp)
 37c:	01c12c03          	lw	s8,28(sp)
 380:	01812c83          	lw	s9,24(sp)
 384:	01412d03          	lw	s10,20(sp)
 388:	01012d83          	lw	s11,16(sp)
 38c:	04010113          	addi	sp,sp,64
 390:	00008067          	ret
 394:	0005c783          	lbu	a5,0(a1)
 398:	00f50023          	sb	a5,0(a0)
 39c:	0015c783          	lbu	a5,1(a1)
 3a0:	00f500a3          	sb	a5,1(a0)
 3a4:	0025c783          	lbu	a5,2(a1)
 3a8:	00f50123          	sb	a5,2(a0)
 3ac:	0035c783          	lbu	a5,3(a1)
 3b0:	00f501a3          	sb	a5,3(a0)
 3b4:	0045c783          	lbu	a5,4(a1)
 3b8:	00f50223          	sb	a5,4(a0)
 3bc:	0055c783          	lbu	a5,5(a1)
 3c0:	00f502a3          	sb	a5,5(a0)
 3c4:	0065c783          	lbu	a5,6(a1)
 3c8:	00f50323          	sb	a5,6(a0)
 3cc:	0075c783          	lbu	a5,7(a1)
 3d0:	00f503a3          	sb	a5,7(a0)
 3d4:	0085c783          	lbu	a5,8(a1)
 3d8:	00f50423          	sb	a5,8(a0)
 3dc:	0095c783          	lbu	a5,9(a1)
 3e0:	00f504a3          	sb	a5,9(a0)
 3e4:	00a5c783          	lbu	a5,10(a1)
 3e8:	00f50523          	sb	a5,10(a0)
 3ec:	00b5c783          	lbu	a5,11(a1)
 3f0:	00f505a3          	sb	a5,11(a0)
 3f4:	00c5c783          	lbu	a5,12(a1)
 3f8:	00f50623          	sb	a5,12(a0)
 3fc:	00d5c783          	lbu	a5,13(a1)
 400:	00f506a3          	sb	a5,13(a0)
 404:	00e5c783          	lbu	a5,14(a1)
 408:	00f50723          	sb	a5,14(a0)
 40c:	00f5c783          	lbu	a5,15(a1)
 410:	00f507a3          	sb	a5,15(a0)
 414:	de9ff06f          	j	1fc <KeyExpansion+0x70>

00000418 <Cipher>:
 418:	fd010113          	addi	sp,sp,-48
 41c:	00a5e7b3          	or	a5,a1,a0
 420:	01512c23          	sw	s5,24(sp)
 424:	02812623          	sw	s0,44(sp)
 428:	02912423          	sw	s1,40(sp)
 42c:	03212223          	sw	s2,36(sp)
 430:	03312023          	sw	s3,32(sp)
 434:	01412e23          	sw	s4,28(sp)
 438:	01612a23          	sw	s6,20(sp)
 43c:	01712823          	sw	s7,16(sp)
 440:	01812623          	sw	s8,12(sp)
 444:	01912423          	sw	s9,8(sp)
 448:	01a12223          	sw	s10,4(sp)
 44c:	0037f793          	andi	a5,a5,3
 450:	00058a93          	mv	s5,a1
 454:	52079a63          	bnez	a5,988 <Cipher+0x570>
 458:	00350793          	addi	a5,a0,3
 45c:	40b787b3          	sub	a5,a5,a1
 460:	0077b793          	sltiu	a5,a5,7
 464:	52079263          	bnez	a5,988 <Cipher+0x570>
 468:	0005a783          	lw	a5,0(a1)
 46c:	00052603          	lw	a2,0(a0)
 470:	00452683          	lw	a3,4(a0)
 474:	00852703          	lw	a4,8(a0)
 478:	00c7c7b3          	xor	a5,a5,a2
 47c:	00f52023          	sw	a5,0(a0)
 480:	0045a603          	lw	a2,4(a1)
 484:	00c52783          	lw	a5,12(a0)
 488:	00c6c6b3          	xor	a3,a3,a2
 48c:	00d52223          	sw	a3,4(a0)
 490:	0085a683          	lw	a3,8(a1)
 494:	00d74733          	xor	a4,a4,a3
 498:	00e52423          	sw	a4,8(a0)
 49c:	00c5a703          	lw	a4,12(a1)
 4a0:	00e7c7b3          	xor	a5,a5,a4
 4a4:	00f52623          	sw	a5,12(a0)
 4a8:	100087b7          	lui	a5,0x10008
 4ac:	00100713          	li	a4,1
 4b0:	02e78023          	sb	a4,32(a5) # 10008020 <__stack_top+0xffe8024>
 4b4:	00001737          	lui	a4,0x1
 4b8:	02078023          	sb	zero,32(a5)
 4bc:	c4870713          	addi	a4,a4,-952 # c48 <sbox>
 4c0:	010a8793          	addi	a5,s5,16 # 10010 <//__stack_size+0x10>
 4c4:	0a0a8b13          	addi	s6,s5,160
 4c8:	3180006f          	j	7e0 <Cipher+0x3c8>
 4cc:	0196c633          	xor	a2,a3,s9
 4d0:	00765993          	srli	s3,a2,0x7
 4d4:	00b94d33          	xor	s10,s2,a1
 4d8:	413009b3          	neg	s3,s3
 4dc:	00161413          	slli	s0,a2,0x1
 4e0:	01b9f993          	andi	s3,s3,27
 4e4:	00cd4633          	xor	a2,s10,a2
 4e8:	0089c9b3          	xor	s3,s3,s0
 4ec:	00d64433          	xor	s0,a2,a3
 4f0:	00b6c6b3          	xor	a3,a3,a1
 4f4:	0089c9b3          	xor	s3,s3,s0
 4f8:	0076d413          	srli	s0,a3,0x7
 4fc:	007d5493          	srli	s1,s10,0x7
 500:	40800433          	neg	s0,s0
 504:	00169693          	slli	a3,a3,0x1
 508:	01b47413          	andi	s0,s0,27
 50c:	409004b3          	neg	s1,s1
 510:	00b645b3          	xor	a1,a2,a1
 514:	00d44433          	xor	s0,s0,a3
 518:	001d1d13          	slli	s10,s10,0x1
 51c:	01b4f493          	andi	s1,s1,27
 520:	00b44433          	xor	s0,s0,a1
 524:	01a4c4b3          	xor	s1,s1,s10
 528:	012cc5b3          	xor	a1,s9,s2
 52c:	01264933          	xor	s2,a2,s2
 530:	0124c4b3          	xor	s1,s1,s2
 534:	0075d913          	srli	s2,a1,0x7
 538:	41200933          	neg	s2,s2
 53c:	007fc6b3          	xor	a3,t6,t2
 540:	00159593          	slli	a1,a1,0x1
 544:	01b97913          	andi	s2,s2,27
 548:	00b94933          	xor	s2,s2,a1
 54c:	0076d593          	srli	a1,a3,0x7
 550:	005f4d33          	xor	s10,t5,t0
 554:	01964633          	xor	a2,a2,s9
 558:	40b005b3          	neg	a1,a1
 55c:	00c94933          	xor	s2,s2,a2
 560:	00169c93          	slli	s9,a3,0x1
 564:	01a6c633          	xor	a2,a3,s10
 568:	01b5f593          	andi	a1,a1,27
 56c:	005fc6b3          	xor	a3,t6,t0
 570:	0195c5b3          	xor	a1,a1,s9
 574:	01f64cb3          	xor	s9,a2,t6
 578:	0076df93          	srli	t6,a3,0x7
 57c:	41f00fb3          	neg	t6,t6
 580:	00169693          	slli	a3,a3,0x1
 584:	01bfff93          	andi	t6,t6,27
 588:	005642b3          	xor	t0,a2,t0
 58c:	00dfcfb3          	xor	t6,t6,a3
 590:	005fcfb3          	xor	t6,t6,t0
 594:	007d5293          	srli	t0,s10,0x7
 598:	0195c5b3          	xor	a1,a1,s9
 59c:	405002b3          	neg	t0,t0
 5a0:	01e3ccb3          	xor	s9,t2,t5
 5a4:	001d1d13          	slli	s10,s10,0x1
 5a8:	01e64f33          	xor	t5,a2,t5
 5ac:	01b2f293          	andi	t0,t0,27
 5b0:	00764633          	xor	a2,a2,t2
 5b4:	007cd393          	srli	t2,s9,0x7
 5b8:	01d346b3          	xor	a3,t1,t4
 5bc:	01a2c2b3          	xor	t0,t0,s10
 5c0:	407003b3          	neg	t2,t2
 5c4:	01e2c2b3          	xor	t0,t0,t5
 5c8:	001c9c93          	slli	s9,s9,0x1
 5cc:	0076df13          	srli	t5,a3,0x7
 5d0:	01b3f393          	andi	t2,t2,27
 5d4:	0193c3b3          	xor	t2,t2,s9
 5d8:	41e00f33          	neg	t5,t5
 5dc:	01c8cd33          	xor	s10,a7,t3
 5e0:	00c3c3b3          	xor	t2,t2,a2
 5e4:	01bf7f13          	andi	t5,t5,27
 5e8:	00169613          	slli	a2,a3,0x1
 5ec:	00cf4f33          	xor	t5,t5,a2
 5f0:	00dd46b3          	xor	a3,s10,a3
 5f4:	01c34633          	xor	a2,t1,t3
 5f8:	0066ccb3          	xor	s9,a3,t1
 5fc:	00765313          	srli	t1,a2,0x7
 600:	40600333          	neg	t1,t1
 604:	00161613          	slli	a2,a2,0x1
 608:	01b37313          	andi	t1,t1,27
 60c:	01c6ce33          	xor	t3,a3,t3
 610:	00c34333          	xor	t1,t1,a2
 614:	01c34333          	xor	t1,t1,t3
 618:	007d5e13          	srli	t3,s10,0x7
 61c:	019f4f33          	xor	t5,t5,s9
 620:	41c00e33          	neg	t3,t3
 624:	011eccb3          	xor	s9,t4,a7
 628:	001d1d13          	slli	s10,s10,0x1
 62c:	0116c8b3          	xor	a7,a3,a7
 630:	01be7e13          	andi	t3,t3,27
 634:	01d6c6b3          	xor	a3,a3,t4
 638:	007cde93          	srli	t4,s9,0x7
 63c:	01ae4e33          	xor	t3,t3,s10
 640:	41d00eb3          	neg	t4,t4
 644:	01484d33          	xor	s10,a6,s4
 648:	011e4e33          	xor	t3,t3,a7
 64c:	001c9c93          	slli	s9,s9,0x1
 650:	007d5893          	srli	a7,s10,0x7
 654:	01befe93          	andi	t4,t4,27
 658:	017c4633          	xor	a2,s8,s7
 65c:	019eceb3          	xor	t4,t4,s9
 660:	411008b3          	neg	a7,a7
 664:	00deceb3          	xor	t4,t4,a3
 668:	01b8f893          	andi	a7,a7,27
 66c:	001d1693          	slli	a3,s10,0x1
 670:	01a64d33          	xor	s10,a2,s10
 674:	00d8c8b3          	xor	a7,a7,a3
 678:	010d46b3          	xor	a3,s10,a6
 67c:	01784833          	xor	a6,a6,s7
 680:	00d8c8b3          	xor	a7,a7,a3
 684:	00785693          	srli	a3,a6,0x7
 688:	40d006b3          	neg	a3,a3
 68c:	00181813          	slli	a6,a6,0x1
 690:	01b6f693          	andi	a3,a3,27
 694:	0106c6b3          	xor	a3,a3,a6
 698:	00765813          	srli	a6,a2,0x7
 69c:	41000833          	neg	a6,a6
 6a0:	018a4cb3          	xor	s9,s4,s8
 6a4:	01b87813          	andi	a6,a6,27
 6a8:	00161613          	slli	a2,a2,0x1
 6ac:	00c84633          	xor	a2,a6,a2
 6b0:	007cd813          	srli	a6,s9,0x7
 6b4:	41000833          	neg	a6,a6
 6b8:	01b87813          	andi	a6,a6,27
 6bc:	001c9c93          	slli	s9,s9,0x1
 6c0:	014d4a33          	xor	s4,s10,s4
 6c4:	017d4bb3          	xor	s7,s10,s7
 6c8:	018d4c33          	xor	s8,s10,s8
 6cc:	01984833          	xor	a6,a6,s9
 6d0:	01484833          	xor	a6,a6,s4
 6d4:	0176c6b3          	xor	a3,a3,s7
 6d8:	01864633          	xor	a2,a2,s8
 6dc:	01350023          	sb	s3,0(a0)
 6e0:	008501a3          	sb	s0,3(a0)
 6e4:	00950123          	sb	s1,2(a0)
 6e8:	012500a3          	sb	s2,1(a0)
 6ec:	00b50223          	sb	a1,4(a0)
 6f0:	01f503a3          	sb	t6,7(a0)
 6f4:	00550323          	sb	t0,6(a0)
 6f8:	007502a3          	sb	t2,5(a0)
 6fc:	01e50423          	sb	t5,8(a0)
 700:	006505a3          	sb	t1,11(a0)
 704:	01c50523          	sb	t3,10(a0)
 708:	01d504a3          	sb	t4,9(a0)
 70c:	01150623          	sb	a7,12(a0)
 710:	00d507a3          	sb	a3,15(a0)
 714:	00c50723          	sb	a2,14(a0)
 718:	010506a3          	sb	a6,13(a0)
 71c:	0007ca03          	lbu	s4,0(a5)
 720:	01078793          	addi	a5,a5,16
 724:	0149c9b3          	xor	s3,s3,s4
 728:	01350023          	sb	s3,0(a0)
 72c:	ff17c983          	lbu	s3,-15(a5)
 730:	01394933          	xor	s2,s2,s3
 734:	012500a3          	sb	s2,1(a0)
 738:	ff27c903          	lbu	s2,-14(a5)
 73c:	0124c4b3          	xor	s1,s1,s2
 740:	00950123          	sb	s1,2(a0)
 744:	ff37c483          	lbu	s1,-13(a5)
 748:	00944433          	xor	s0,s0,s1
 74c:	008501a3          	sb	s0,3(a0)
 750:	ff47c403          	lbu	s0,-12(a5)
 754:	0085c5b3          	xor	a1,a1,s0
 758:	00b50223          	sb	a1,4(a0)
 75c:	ff57c583          	lbu	a1,-11(a5)
 760:	00b3c3b3          	xor	t2,t2,a1
 764:	007502a3          	sb	t2,5(a0)
 768:	ff67c583          	lbu	a1,-10(a5)
 76c:	00b2c2b3          	xor	t0,t0,a1
 770:	00550323          	sb	t0,6(a0)
 774:	ff77c583          	lbu	a1,-9(a5)
 778:	00bfcfb3          	xor	t6,t6,a1
 77c:	01f503a3          	sb	t6,7(a0)
 780:	ff87c583          	lbu	a1,-8(a5)
 784:	00bf4f33          	xor	t5,t5,a1
 788:	01e50423          	sb	t5,8(a0)
 78c:	ff97c583          	lbu	a1,-7(a5)
 790:	00beceb3          	xor	t4,t4,a1
 794:	01d504a3          	sb	t4,9(a0)
 798:	ffa7c583          	lbu	a1,-6(a5)
 79c:	00be4e33          	xor	t3,t3,a1
 7a0:	01c50523          	sb	t3,10(a0)
 7a4:	ffb7c583          	lbu	a1,-5(a5)
 7a8:	00b34333          	xor	t1,t1,a1
 7ac:	006505a3          	sb	t1,11(a0)
 7b0:	ffc7c583          	lbu	a1,-4(a5)
 7b4:	00b8c8b3          	xor	a7,a7,a1
 7b8:	01150623          	sb	a7,12(a0)
 7bc:	ffd7c583          	lbu	a1,-3(a5)
 7c0:	00b84833          	xor	a6,a6,a1
 7c4:	010506a3          	sb	a6,13(a0)
 7c8:	ffe7c583          	lbu	a1,-2(a5)
 7cc:	00b64633          	xor	a2,a2,a1
 7d0:	00c50723          	sb	a2,14(a0)
 7d4:	fff7c603          	lbu	a2,-1(a5)
 7d8:	00c6c6b3          	xor	a3,a3,a2
 7dc:	00d507a3          	sb	a3,15(a0)
 7e0:	00000013          	nop
 7e4:	00054683          	lbu	a3,0(a0)
 7e8:	00454f83          	lbu	t6,4(a0)
 7ec:	00854303          	lbu	t1,8(a0)
 7f0:	00c54803          	lbu	a6,12(a0)
 7f4:	00154483          	lbu	s1,1(a0)
 7f8:	00554403          	lbu	s0,5(a0)
 7fc:	00954383          	lbu	t2,9(a0)
 800:	00d54e83          	lbu	t4,13(a0)
 804:	00254883          	lbu	a7,2(a0)
 808:	00654283          	lbu	t0,6(a0)
 80c:	00a54f03          	lbu	t5,10(a0)
 810:	00e54e03          	lbu	t3,14(a0)
 814:	00354583          	lbu	a1,3(a0)
 818:	00754603          	lbu	a2,7(a0)
 81c:	00d706b3          	add	a3,a4,a3
 820:	01f70fb3          	add	t6,a4,t6
 824:	00670333          	add	t1,a4,t1
 828:	01070833          	add	a6,a4,a6
 82c:	0006c683          	lbu	a3,0(a3)
 830:	000fcf83          	lbu	t6,0(t6)
 834:	00034303          	lbu	t1,0(t1)
 838:	00084803          	lbu	a6,0(a6)
 83c:	005702b3          	add	t0,a4,t0
 840:	01e70f33          	add	t5,a4,t5
 844:	01c70e33          	add	t3,a4,t3
 848:	00b705b3          	add	a1,a4,a1
 84c:	00c70633          	add	a2,a4,a2
 850:	009704b3          	add	s1,a4,s1
 854:	00870433          	add	s0,a4,s0
 858:	007703b3          	add	t2,a4,t2
 85c:	01d70eb3          	add	t4,a4,t4
 860:	011708b3          	add	a7,a4,a7
 864:	0002cc03          	lbu	s8,0(t0)
 868:	000f4903          	lbu	s2,0(t5)
 86c:	0004ca03          	lbu	s4,0(s1)
 870:	000e4f03          	lbu	t5,0(t3)
 874:	00044c83          	lbu	s9,0(s0)
 878:	00064e03          	lbu	t3,0(a2)
 87c:	0003c383          	lbu	t2,0(t2)
 880:	000ece83          	lbu	t4,0(t4)
 884:	0008c883          	lbu	a7,0(a7)
 888:	0005c283          	lbu	t0,0(a1)
 88c:	00d50023          	sb	a3,0(a0)
 890:	01f50223          	sb	t6,4(a0)
 894:	00650423          	sb	t1,8(a0)
 898:	01050623          	sb	a6,12(a0)
 89c:	00b54583          	lbu	a1,11(a0)
 8a0:	00f54603          	lbu	a2,15(a0)
 8a4:	019500a3          	sb	s9,1(a0)
 8a8:	00b705b3          	add	a1,a4,a1
 8ac:	00c70633          	add	a2,a4,a2
 8b0:	0005cb83          	lbu	s7,0(a1)
 8b4:	00064583          	lbu	a1,0(a2)
 8b8:	007502a3          	sb	t2,5(a0)
 8bc:	01d504a3          	sb	t4,9(a0)
 8c0:	014506a3          	sb	s4,13(a0)
 8c4:	01250123          	sb	s2,2(a0)
 8c8:	01150523          	sb	a7,10(a0)
 8cc:	01e50323          	sb	t5,6(a0)
 8d0:	01850723          	sb	s8,14(a0)
 8d4:	01c505a3          	sb	t3,11(a0)
 8d8:	005503a3          	sb	t0,7(a0)
 8dc:	017507a3          	sb	s7,15(a0)
 8e0:	00b501a3          	sb	a1,3(a0)
 8e4:	befb14e3          	bne	s6,a5,4cc <Cipher+0xb4>
 8e8:	00450793          	addi	a5,a0,4
 8ec:	0a4a8713          	addi	a4,s5,164
 8f0:	00fb37b3          	sltu	a5,s6,a5
 8f4:	00e53733          	sltu	a4,a0,a4
 8f8:	0017b793          	seqz	a5,a5
 8fc:	00173713          	seqz	a4,a4
 900:	00e7e7b3          	or	a5,a5,a4
 904:	18078463          	beqz	a5,a8c <Cipher+0x674>
 908:	00ab67b3          	or	a5,s6,a0
 90c:	0037f793          	andi	a5,a5,3
 910:	16079e63          	bnez	a5,a8c <Cipher+0x674>
 914:	0a0aa603          	lw	a2,160(s5)
 918:	00052783          	lw	a5,0(a0)
 91c:	00452683          	lw	a3,4(a0)
 920:	00852703          	lw	a4,8(a0)
 924:	00c7c7b3          	xor	a5,a5,a2
 928:	00f52023          	sw	a5,0(a0)
 92c:	0a4aa603          	lw	a2,164(s5)
 930:	00c52783          	lw	a5,12(a0)
 934:	00c6c6b3          	xor	a3,a3,a2
 938:	00d52223          	sw	a3,4(a0)
 93c:	0a8aa683          	lw	a3,168(s5)
 940:	00d74733          	xor	a4,a4,a3
 944:	00e52423          	sw	a4,8(a0)
 948:	0acaa703          	lw	a4,172(s5)
 94c:	00e7c7b3          	xor	a5,a5,a4
 950:	00f52623          	sw	a5,12(a0)
 954:	02c12403          	lw	s0,44(sp)
 958:	02812483          	lw	s1,40(sp)
 95c:	02412903          	lw	s2,36(sp)
 960:	02012983          	lw	s3,32(sp)
 964:	01c12a03          	lw	s4,28(sp)
 968:	01812a83          	lw	s5,24(sp)
 96c:	01412b03          	lw	s6,20(sp)
 970:	01012b83          	lw	s7,16(sp)
 974:	00c12c03          	lw	s8,12(sp)
 978:	00812c83          	lw	s9,8(sp)
 97c:	00412d03          	lw	s10,4(sp)
 980:	03010113          	addi	sp,sp,48
 984:	00008067          	ret
 988:	000ac603          	lbu	a2,0(s5)
 98c:	00054783          	lbu	a5,0(a0)
 990:	00154683          	lbu	a3,1(a0)
 994:	00254703          	lbu	a4,2(a0)
 998:	00c7c7b3          	xor	a5,a5,a2
 99c:	00f50023          	sb	a5,0(a0)
 9a0:	001ac603          	lbu	a2,1(s5)
 9a4:	00354783          	lbu	a5,3(a0)
 9a8:	00454883          	lbu	a7,4(a0)
 9ac:	00c6c6b3          	xor	a3,a3,a2
 9b0:	00d500a3          	sb	a3,1(a0)
 9b4:	002ac683          	lbu	a3,2(s5)
 9b8:	00554803          	lbu	a6,5(a0)
 9bc:	00654583          	lbu	a1,6(a0)
 9c0:	00d74733          	xor	a4,a4,a3
 9c4:	00e50123          	sb	a4,2(a0)
 9c8:	003ac703          	lbu	a4,3(s5)
 9cc:	00754603          	lbu	a2,7(a0)
 9d0:	00854683          	lbu	a3,8(a0)
 9d4:	00e7c7b3          	xor	a5,a5,a4
 9d8:	00f501a3          	sb	a5,3(a0)
 9dc:	004ac303          	lbu	t1,4(s5)
 9e0:	00954703          	lbu	a4,9(a0)
 9e4:	00a54783          	lbu	a5,10(a0)
 9e8:	0068c8b3          	xor	a7,a7,t1
 9ec:	01150223          	sb	a7,4(a0)
 9f0:	005ac883          	lbu	a7,5(s5)
 9f4:	01184833          	xor	a6,a6,a7
 9f8:	010502a3          	sb	a6,5(a0)
 9fc:	006ac803          	lbu	a6,6(s5)
 a00:	0105c5b3          	xor	a1,a1,a6
 a04:	00b50323          	sb	a1,6(a0)
 a08:	007ac583          	lbu	a1,7(s5)
 a0c:	00b64633          	xor	a2,a2,a1
 a10:	00c503a3          	sb	a2,7(a0)
 a14:	008ac603          	lbu	a2,8(s5)
 a18:	00c6c6b3          	xor	a3,a3,a2
 a1c:	00d50423          	sb	a3,8(a0)
 a20:	009ac683          	lbu	a3,9(s5)
 a24:	00d74733          	xor	a4,a4,a3
 a28:	00e504a3          	sb	a4,9(a0)
 a2c:	00aac703          	lbu	a4,10(s5)
 a30:	00e7c7b3          	xor	a5,a5,a4
 a34:	00f50523          	sb	a5,10(a0)
 a38:	00bac683          	lbu	a3,11(s5)
 a3c:	00b54783          	lbu	a5,11(a0)
 a40:	00c54583          	lbu	a1,12(a0)
 a44:	00d54703          	lbu	a4,13(a0)
 a48:	00d7c7b3          	xor	a5,a5,a3
 a4c:	00f505a3          	sb	a5,11(a0)
 a50:	00cac683          	lbu	a3,12(s5)
 a54:	00e54783          	lbu	a5,14(a0)
 a58:	00f54603          	lbu	a2,15(a0)
 a5c:	00b6c6b3          	xor	a3,a3,a1
 a60:	00d50623          	sb	a3,12(a0)
 a64:	00dac683          	lbu	a3,13(s5)
 a68:	00d74733          	xor	a4,a4,a3
 a6c:	00e506a3          	sb	a4,13(a0)
 a70:	00eac703          	lbu	a4,14(s5)
 a74:	00e7c7b3          	xor	a5,a5,a4
 a78:	00f50723          	sb	a5,14(a0)
 a7c:	00fac783          	lbu	a5,15(s5)
 a80:	00c7c7b3          	xor	a5,a5,a2
 a84:	00f507a3          	sb	a5,15(a0)
 a88:	a21ff06f          	j	4a8 <Cipher+0x90>
 a8c:	0a0ac783          	lbu	a5,160(s5)
 a90:	00f6c6b3          	xor	a3,a3,a5
 a94:	00d50023          	sb	a3,0(a0)
 a98:	0a1ac783          	lbu	a5,161(s5)
 a9c:	00fcccb3          	xor	s9,s9,a5
 aa0:	019500a3          	sb	s9,1(a0)
 aa4:	0a2ac783          	lbu	a5,162(s5)
 aa8:	00f94933          	xor	s2,s2,a5
 aac:	01250123          	sb	s2,2(a0)
 ab0:	0a3ac783          	lbu	a5,163(s5)
 ab4:	00f5c5b3          	xor	a1,a1,a5
 ab8:	00b501a3          	sb	a1,3(a0)
 abc:	0a4ac783          	lbu	a5,164(s5)
 ac0:	00ffc6b3          	xor	a3,t6,a5
 ac4:	00d50223          	sb	a3,4(a0)
 ac8:	0a5ac783          	lbu	a5,165(s5)
 acc:	00f3c3b3          	xor	t2,t2,a5
 ad0:	007502a3          	sb	t2,5(a0)
 ad4:	0a6ac783          	lbu	a5,166(s5)
 ad8:	00ff4f33          	xor	t5,t5,a5
 adc:	01e50323          	sb	t5,6(a0)
 ae0:	0a7ac783          	lbu	a5,167(s5)
 ae4:	00f2c2b3          	xor	t0,t0,a5
 ae8:	005503a3          	sb	t0,7(a0)
 aec:	0a8ac783          	lbu	a5,168(s5)
 af0:	00f34333          	xor	t1,t1,a5
 af4:	00650423          	sb	t1,8(a0)
 af8:	0a9ac783          	lbu	a5,169(s5)
 afc:	00feceb3          	xor	t4,t4,a5
 b00:	01d504a3          	sb	t4,9(a0)
 b04:	0aaac783          	lbu	a5,170(s5)
 b08:	00f8c8b3          	xor	a7,a7,a5
 b0c:	01150523          	sb	a7,10(a0)
 b10:	0abac783          	lbu	a5,171(s5)
 b14:	00fe4e33          	xor	t3,t3,a5
 b18:	01c505a3          	sb	t3,11(a0)
 b1c:	0acac783          	lbu	a5,172(s5)
 b20:	00f84833          	xor	a6,a6,a5
 b24:	01050623          	sb	a6,12(a0)
 b28:	0adac783          	lbu	a5,173(s5)
 b2c:	00fa4a33          	xor	s4,s4,a5
 b30:	014506a3          	sb	s4,13(a0)
 b34:	0aeac783          	lbu	a5,174(s5)
 b38:	00fc4c33          	xor	s8,s8,a5
 b3c:	01850723          	sb	s8,14(a0)
 b40:	0afac783          	lbu	a5,175(s5)
 b44:	00fbcbb3          	xor	s7,s7,a5
 b48:	017507a3          	sb	s7,15(a0)
 b4c:	e09ff06f          	j	954 <Cipher+0x53c>

00000b50 <AES_init_ctx>:
 b50:	e3cff06f          	j	18c <KeyExpansion>

00000b54 <AES_ECB_encrypt>:
 b54:	00050793          	mv	a5,a0
 b58:	00058513          	mv	a0,a1
 b5c:	00078593          	mv	a1,a5
 b60:	8b9ff06f          	j	418 <Cipher>

00000b64 <uart_init>:
 b64:	00b52023          	sw	a1,0(a0)
 b68:	00008067          	ret

00000b6c <uart_transmit_string>:
 b6c:	04060663          	beqz	a2,bb8 <uart_transmit_string+0x4c>
 b70:	10008737          	lui	a4,0x10008
 b74:	10008537          	lui	a0,0x10008
 b78:	00c58633          	add	a2,a1,a2
 b7c:	01270713          	addi	a4,a4,18 # 10008012 <__stack_top+0xffe8016>
 b80:	01050513          	addi	a0,a0,16 # 10008010 <__stack_top+0xffe8014>
 b84:	0005c683          	lbu	a3,0(a1)
 b88:	00158593          	addi	a1,a1,1
 b8c:	00000013          	nop
 b90:	00000013          	nop
 b94:	00075783          	lhu	a5,0(a4)
 b98:	0027f793          	andi	a5,a5,2
 b9c:	fe0798e3          	bnez	a5,b8c <uart_transmit_string+0x20>
 ba0:	00000013          	nop
 ba4:	00000013          	nop
 ba8:	00000013          	nop
 bac:	00000013          	nop
 bb0:	00d52023          	sw	a3,0(a0)
 bb4:	fcb618e3          	bne	a2,a1,b84 <uart_transmit_string+0x18>
 bb8:	00008067          	ret

00000bbc <exc>:
 bbc:	d3cff06f          	j	f8 <exc_handler>

00000bc0 <ssi>:
 bc0:	00000013          	nop

00000bc4 <hsi>:
 bc4:	00000013          	nop

00000bc8 <msi>:
 bc8:	d38ff06f          	j	100 <msi_handler>

00000bcc <uti>:
 bcc:	00000013          	nop

00000bd0 <sti>:
 bd0:	00000013          	nop

00000bd4 <hti>:
 bd4:	00000013          	nop

00000bd8 <mti>:
 bd8:	d1cff06f          	j	f4 <mti_handler>

00000bdc <uei>:
 bdc:	00000013          	nop

00000be0 <sei>:
 be0:	00000013          	nop

00000be4 <hei>:
 be4:	00000013          	nop

00000be8 <mei>:
 be8:	d14ff06f          	j	fc <mei_handler>
 bec:	00000013          	nop
 bf0:	00000013          	nop
 bf4:	00000013          	nop
 bf8:	00000013          	nop

00000bfc <fast_irq0>:
 bfc:	d08ff06f          	j	104 <fast_irq0_handler>

00000c00 <fast_irq1>:
 c00:	d88ff06f          	j	188 <fast_irq1_handler>

00000c04 <SET_MTVEC_VECTOR_MODE>:
 c04:	00000797          	auipc	a5,0x0
 c08:	fb878793          	addi	a5,a5,-72 # bbc <exc>
 c0c:	0017e793          	ori	a5,a5,1
 c10:	30579073          	csrw	mtvec,a5
 c14:	00008067          	ret

Disassembly of section .rodata:

00000c18 <Rcon-0x24>:
 c18:	5555                	.insn	2, 0x5555
 c1a:	5555                	.insn	2, 0x5555
 c1c:	5555                	.insn	2, 0x5555
 c1e:	5555                	.insn	2, 0x5555
 c20:	5555                	.insn	2, 0x5555
 c22:	5555                	.insn	2, 0x5555
 c24:	0000                	.insn	2, 0x0000
 c26:	0000                	.insn	2, 0x0000
 c28:	16157e2b          	.insn	4, 0x16157e2b
 c2c:	ae28                	.insn	2, 0xae28
 c2e:	a6d2                	.insn	2, 0xa6d2
 c30:	8815f7ab          	.insn	4, 0x8815f7ab
 c34:	cf09                	.insn	2, 0xcf09
 c36:	00003c4f          	.insn	4, 0x3c4f
	...

00000c3c <Rcon>:
 c3c:	018d                	.insn	2, 0x018d
 c3e:	0402                	.insn	2, 0x0402
 c40:	1008                	.insn	2, 0x1008
 c42:	4020                	.insn	2, 0x4020
 c44:	1b80                	.insn	2, 0x1b80
 c46:	0036                	.insn	2, 0x0036

00000c48 <sbox>:
 c48:	7b777c63          	bgeu	a4,s7,1400 <__DATA_BEGIN__+0x400>
 c4c:	6bf2                	.insn	2, 0x6bf2
 c4e:	0130c56f          	jal	a0,d460 <__BSS_END__+0x3448>
 c52:	d7fe2b67          	.insn	4, 0xd7fe2b67
 c56:	82ca76ab          	.insn	4, 0x82ca76ab
 c5a:	7dc9                	.insn	2, 0x7dc9
 c5c:	59fa                	.insn	2, 0x59fa
 c5e:	d4adf047          	.insn	4, 0xd4adf047
 c62:	afa2                	.insn	2, 0xafa2
 c64:	a49c                	.insn	2, 0xa49c
 c66:	c072                	.insn	2, 0xc072
 c68:	2693fdb7          	lui	s11,0x2693f
 c6c:	3f36                	.insn	2, 0x3f36
 c6e:	a534ccf7          	.insn	4, 0xa534ccf7
 c72:	f1e5                	.insn	2, 0xf1e5
 c74:	d871                	.insn	2, 0xd871
 c76:	1531                	.insn	2, 0x1531
 c78:	c704                	.insn	2, 0xc704
 c7a:	9618c323          	.insn	4, 0x9618c323
 c7e:	9a05                	.insn	2, 0x9a05
 c80:	e2801207          	.insn	4, 0xe2801207
 c84:	75b227eb          	.insn	4, 0x75b227eb
 c88:	8309                	.insn	2, 0x8309
 c8a:	1a2c                	.insn	2, 0x1a2c
 c8c:	a05a6e1b          	.insn	4, 0xa05a6e1b
 c90:	3b52                	.insn	2, 0x3b52
 c92:	b3d6                	.insn	2, 0xb3d6
 c94:	e329                	.insn	2, 0xe329
 c96:	d153842f          	.insn	4, 0xd153842f
 c9a:	ed00                	.insn	2, 0xed00
 c9c:	fc20                	.insn	2, 0xfc20
 c9e:	5bb1                	.insn	2, 0x5bb1
 ca0:	cb6a                	.insn	2, 0xcb6a
 ca2:	39be                	.insn	2, 0x39be
 ca4:	4c4a                	.insn	2, 0x4c4a
 ca6:	cf58                	.insn	2, 0xcf58
 ca8:	efd0                	.insn	2, 0xefd0
 caa:	fbaa                	.insn	2, 0xfbaa
 cac:	85334d43          	.insn	4, 0x85334d43
 cb0:	f945                	.insn	2, 0xf945
 cb2:	7f02                	.insn	2, 0x7f02
 cb4:	3c50                	.insn	2, 0x3c50
 cb6:	a89f a351 8f40      	.insn	6, 0x8f40a351a89f
 cbc:	9d92                	.insn	2, 0x9d92
 cbe:	f538                	.insn	2, 0xf538
 cc0:	b6bc                	.insn	2, 0xb6bc
 cc2:	21da                	.insn	2, 0x21da
 cc4:	ff10                	.insn	2, 0xff10
 cc6:	0ccdd2f3          	csrrwi	t0,0xcc,27
 cca:	975fec13          	ori	s8,t6,-1675
 cce:	1744                	.insn	2, 0x1744
 cd0:	a7c4                	.insn	2, 0xa7c4
 cd2:	3d7e                	.insn	2, 0x3d7e
 cd4:	5d64                	.insn	2, 0x5d64
 cd6:	7319                	.insn	2, 0x7319
 cd8:	8160                	.insn	2, 0x8160
 cda:	2a22dc4f          	.insn	4, 0x2a22dc4f
 cde:	8890                	.insn	2, 0x8890
 ce0:	ee46                	.insn	2, 0xee46
 ce2:	14b8                	.insn	2, 0x14b8
 ce4:	5ede                	.insn	2, 0x5ede
 ce6:	32e0db0b          	.insn	4, 0x32e0db0b
 cea:	0a3a                	.insn	2, 0x0a3a
 cec:	0649                	.insn	2, 0x0649
 cee:	5c24                	.insn	2, 0x5c24
 cf0:	d3c2                	.insn	2, 0xd3c2
 cf2:	62ac                	.insn	2, 0x62ac
 cf4:	9591                	.insn	2, 0x9591
 cf6:	79e4                	.insn	2, 0x79e4
 cf8:	6d37c8e7          	.insn	4, 0x6d37c8e7
 cfc:	d58d                	.insn	2, 0xd58d
 cfe:	a94e                	.insn	2, 0xa94e
 d00:	566c                	.insn	2, 0x566c
 d02:	eaf4                	.insn	2, 0xeaf4
 d04:	7a65                	.insn	2, 0x7a65
 d06:	08ae                	.insn	2, 0x08ae
 d08:	78ba                	.insn	2, 0x78ba
 d0a:	2e25                	.insn	2, 0x2e25
 d0c:	a61c                	.insn	2, 0xa61c
 d0e:	c6b4                	.insn	2, 0xc6b4
 d10:	dde8                	.insn	2, 0xdde8
 d12:	1f74                	.insn	2, 0x1f74
 d14:	8a8bbd4b          	.insn	4, 0x8a8bbd4b
 d18:	3e70                	.insn	2, 0x3e70
 d1a:	66b5                	.insn	2, 0x66b5
 d1c:	0348                	.insn	2, 0x0348
 d1e:	0ef6                	.insn	2, 0x0ef6
 d20:	3561                	.insn	2, 0x3561
 d22:	c186b957          	.insn	4, 0xc186b957
 d26:	9e1d                	.insn	2, 0x9e1d
 d28:	f8e1                	.insn	2, 0xf8e1
 d2a:	1198                	.insn	2, 0x1198
 d2c:	d969                	.insn	2, 0xd969
 d2e:	948e                	.insn	2, 0x948e
 d30:	e9871e9b          	.insn	4, 0xe9871e9b
 d34:	55ce                	.insn	2, 0x55ce
 d36:	df28                	.insn	2, 0xdf28
 d38:	a18c                	.insn	2, 0xa18c
 d3a:	0d89                	.insn	2, 0x0d89
 d3c:	6842e6bf 0f2d9941 	.insn	8, 0x0f2d99416842e6bf
 d44:	54b0                	.insn	2, 0x54b0
 d46:	16bb                	.short	0x16bb

Disassembly of section .eh_frame:

00000d48 <__DATA_BEGIN__-0x2b8>:
 d48:	0010                	.insn	2, 0x0010
 d4a:	0000                	.insn	2, 0x0000
 d4c:	0000                	.insn	2, 0x0000
 d4e:	0000                	.insn	2, 0x0000
 d50:	00527a03          	.insn	4, 0x00527a03
 d54:	7c01                	.insn	2, 0x7c01
 d56:	0101                	.insn	2, 0x0101
 d58:	00020c1b          	.insn	4, 0x00020c1b
 d5c:	0010                	.insn	2, 0x0010
 d5e:	0000                	.insn	2, 0x0000
 d60:	0018                	.insn	2, 0x0018
 d62:	0000                	.insn	2, 0x0000
 d64:	f29c                	.insn	2, 0xf29c
 d66:	ffff                	.insn	2, 0xffff
 d68:	0010                	.insn	2, 0x0010
 d6a:	0000                	.insn	2, 0x0000
 d6c:	0000                	.insn	2, 0x0000
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
