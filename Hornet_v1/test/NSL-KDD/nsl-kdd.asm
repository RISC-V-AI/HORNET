
nsl-kdd.elf:     file format elf32-littleriscv


Disassembly of section .init:

00000000 <_start>:
   0:	00200117          	auipc	sp,0x200
   4:	00010113          	mv	sp,sp
   8:	00010433          	add	s0,sp,zero
   c:	0040006f          	j	10 <main>

Disassembly of section .text:

00000010 <main>:
  10:	e0010113          	addi	sp,sp,-512 # 1ffe00 <__DATA_BEGIN__+0x1143b0>
  14:	00810513          	addi	a0,sp,8
  18:	1e800613          	li	a2,488
  1c:	00000593          	li	a1,0
  20:	1e112e23          	sw	ra,508(sp)
  24:	115000ef          	jal	938 <memset>
  28:	00810513          	addi	a0,sp,8
  2c:	02c000ef          	jal	58 <model_infer>
  30:	00a12223          	sw	a0,4(sp)
  34:	00412783          	lw	a5,4(sp)
  38:	10008737          	lui	a4,0x10008
  3c:	00000513          	li	a0,0
  40:	00f037b3          	snez	a5,a5
  44:	00178793          	addi	a5,a5,1
  48:	00f70823          	sb	a5,16(a4) # 10008010 <__stack_top+0xfe08010>
  4c:	1fc12083          	lw	ra,508(sp)
  50:	20010113          	addi	sp,sp,512
  54:	00008067          	ret

00000058 <model_infer>:
  58:	ffffd2b7          	lui	t0,0xffffd
  5c:	2d028293          	addi	t0,t0,720 # ffffd2d0 <__stack_top+0xffdfd2d0>
  60:	000017b7          	lui	a5,0x1
  64:	00510133          	add	sp,sp,t0
  68:	53078793          	addi	a5,a5,1328 # 1530 <layer3_weights+0x108>
  6c:	00f107b3          	add	a5,sp,a5
  70:	000ad5b7          	lui	a1,0xad
  74:	000eb637          	lui	a2,0xeb
  78:	00078893          	mv	a7,a5
  7c:	22858593          	addi	a1,a1,552 # ad228 <layer0_biases>
  80:	a2860613          	addi	a2,a2,-1496 # eaa28 <layer0_weights+0x3d000>
  84:	00000813          	li	a6,0
  88:	fffc3e37          	lui	t3,0xfffc3
  8c:	20000313          	li	t1,512
  90:	0005a707          	flw	fa4,0(a1)
  94:	00050693          	mv	a3,a0
  98:	01c60733          	add	a4,a2,t3
  9c:	00072687          	flw	fa3,0(a4)
  a0:	0006a787          	flw	fa5,0(a3)
  a4:	7ff70713          	addi	a4,a4,2047
  a8:	00170713          	addi	a4,a4,1
  ac:	10d7f7d3          	fmul.s	fa5,fa5,fa3
  b0:	00468693          	addi	a3,a3,4
  b4:	00f77753          	fadd.s	fa4,fa4,fa5
  b8:	fee612e3          	bne	a2,a4,9c <model_infer+0x44>
  bc:	00e8a027          	fsw	fa4,0(a7)
  c0:	00180813          	addi	a6,a6,1
  c4:	00458593          	addi	a1,a1,4
  c8:	00488893          	addi	a7,a7,4
  cc:	00460613          	addi	a2,a2,4
  d0:	fc6810e3          	bne	a6,t1,90 <model_infer+0x38>
  d4:	00002737          	lui	a4,0x2
  d8:	53070713          	addi	a4,a4,1328 # 2530 <layer3_weights+0x1108>
  dc:	00e10833          	add	a6,sp,a4
  e0:	f00006d3          	fmv.w.x	fa3,zero
  e4:	80080813          	addi	a6,a6,-2048
  e8:	7ff78613          	addi	a2,a5,2047
  ec:	00080713          	mv	a4,a6
  f0:	00160613          	addi	a2,a2,1
  f4:	0007a707          	flw	fa4,0(a5)
  f8:	f00007d3          	fmv.w.x	fa5,zero
  fc:	00478793          	addi	a5,a5,4
 100:	a0e696d3          	flt.s	a3,fa3,fa4
 104:	00068463          	beqz	a3,10c <model_infer+0xb4>
 108:	20e707d3          	fmv.s	fa5,fa4
 10c:	00f72027          	fsw	fa5,0(a4)
 110:	00470713          	addi	a4,a4,4
 114:	fef610e3          	bne	a2,a5,f4 <model_infer+0x9c>
 118:	000ab7b7          	lui	a5,0xab
 11c:	000eb537          	lui	a0,0xeb
 120:	000eb5b7          	lui	a1,0xeb
 124:	000eb737          	lui	a4,0xeb
 128:	22878793          	addi	a5,a5,552 # ab228 <bn0_var>
 12c:	000028b7          	lui	a7,0x2
 130:	a5c52007          	flw	ft0,-1444(a0) # eaa5c <__SDATA_BEGIN__+0xc>
 134:	a505a587          	flw	fa1,-1456(a1) # eaa50 <__SDATA_BEGIN__>
 138:	f0000553          	fmv.w.x	fa0,zero
 13c:	a5472707          	flw	fa4,-1452(a4) # eaa54 <__SDATA_BEGIN__+0x4>
 140:	000ad637          	lui	a2,0xad
 144:	000ac6b7          	lui	a3,0xac
 148:	000ac737          	lui	a4,0xac
 14c:	7ff78e13          	addi	t3,a5,2047
 150:	53088893          	addi	a7,a7,1328 # 2530 <layer3_weights+0x1108>
 154:	001e0e13          	addi	t3,t3,1 # fffc3001 <__stack_top+0xffdc3001>
 158:	a2860613          	addi	a2,a2,-1496 # aca28 <bn0_gamma>
 15c:	a2868693          	addi	a3,a3,-1496 # aba28 <bn0_mean>
 160:	22870713          	addi	a4,a4,552 # ac228 <bn0_beta>
 164:	011108b3          	add	a7,sp,a7
 168:	0007a787          	flw	fa5,0(a5)
 16c:	f00006d3          	fmv.w.x	fa3,zero
 170:	20b58653          	fmv.s	fa2,fa1
 174:	0007f7d3          	fadd.s	fa5,fa5,ft0
 178:	00478793          	addi	a5,a5,4
 17c:	a0a78353          	fle.s	t1,fa5,fa0
 180:	08031463          	bnez	t1,208 <model_infer+0x1b0>
 184:	a0f59353          	flt.s	t1,fa1,fa5
 188:	00030463          	beqz	t1,190 <model_infer+0x138>
 18c:	20f78653          	fmv.s	fa2,fa5
 190:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 194:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 198:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 19c:	18d7f653          	fdiv.s	fa2,fa5,fa3
 1a0:	00d67653          	fadd.s	fa2,fa2,fa3
 1a4:	10e67653          	fmul.s	fa2,fa2,fa4
 1a8:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 1ac:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 1b0:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 1b4:	18d7f653          	fdiv.s	fa2,fa5,fa3
 1b8:	00d67653          	fadd.s	fa2,fa2,fa3
 1bc:	10e67653          	fmul.s	fa2,fa2,fa4
 1c0:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 1c4:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 1c8:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 1cc:	18d7f653          	fdiv.s	fa2,fa5,fa3
 1d0:	00d67653          	fadd.s	fa2,fa2,fa3
 1d4:	10e67653          	fmul.s	fa2,fa2,fa4
 1d8:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 1dc:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 1e0:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 1e4:	18d7f653          	fdiv.s	fa2,fa5,fa3
 1e8:	00d67653          	fadd.s	fa2,fa2,fa3
 1ec:	10e67653          	fmul.s	fa2,fa2,fa4
 1f0:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 1f4:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 1f8:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 1fc:	18d7f7d3          	fdiv.s	fa5,fa5,fa3
 200:	00d7f7d3          	fadd.s	fa5,fa5,fa3
 204:	10e7f6d3          	fmul.s	fa3,fa5,fa4
 208:	18d5f6d3          	fdiv.s	fa3,fa1,fa3
 20c:	00082787          	flw	fa5,0(a6)
 210:	0006a107          	flw	ft2,0(a3)
 214:	00062087          	flw	ft1,0(a2)
 218:	00072607          	flw	fa2,0(a4)
 21c:	0827f7d3          	fsub.s	fa5,fa5,ft2
 220:	00480813          	addi	a6,a6,4
 224:	00468693          	addi	a3,a3,4
 228:	00460613          	addi	a2,a2,4
 22c:	00470713          	addi	a4,a4,4
 230:	1017f7d3          	fmul.s	fa5,fa5,ft1
 234:	00488893          	addi	a7,a7,4
 238:	10d7f7d3          	fmul.s	fa5,fa5,fa3
 23c:	00c7f7d3          	fadd.s	fa5,fa5,fa2
 240:	fef8ae27          	fsw	fa5,-4(a7)
 244:	f2fe12e3          	bne	t3,a5,168 <model_infer+0x110>
 248:	7ff10793          	addi	a5,sp,2047
 24c:	13178793          	addi	a5,a5,305
 250:	0002b837          	lui	a6,0x2b
 254:	0002b637          	lui	a2,0x2b
 258:	00078313          	mv	t1,a5
 25c:	e2880813          	addi	a6,a6,-472 # 2ae28 <layer1_biases>
 260:	22860613          	addi	a2,a2,552 # 2b228 <layer1_weights>
 264:	00000893          	li	a7,0
 268:	10000e13          	li	t3,256
 26c:	00002737          	lui	a4,0x2
 270:	00082707          	flw	fa4,0(a6)
 274:	53070713          	addi	a4,a4,1328 # 2530 <layer3_weights+0x1108>
 278:	00060693          	mv	a3,a2
 27c:	00e10733          	add	a4,sp,a4
 280:	00072787          	flw	fa5,0(a4)
 284:	0006a687          	flw	fa3,0(a3)
 288:	00003eb7          	lui	t4,0x3
 28c:	d30e8e93          	addi	t4,t4,-720 # 2d30 <layer3_weights+0x1908>
 290:	10d7f7d3          	fmul.s	fa5,fa5,fa3
 294:	00470713          	addi	a4,a4,4
 298:	002e8eb3          	add	t4,t4,sp
 29c:	40068693          	addi	a3,a3,1024
 2a0:	00f77753          	fadd.s	fa4,fa4,fa5
 2a4:	fcee9ee3          	bne	t4,a4,280 <model_infer+0x228>
 2a8:	00e32027          	fsw	fa4,0(t1)
 2ac:	00188893          	addi	a7,a7,1
 2b0:	00480813          	addi	a6,a6,4
 2b4:	00430313          	addi	t1,t1,4
 2b8:	00460613          	addi	a2,a2,4
 2bc:	fbc898e3          	bne	a7,t3,26c <model_infer+0x214>
 2c0:	7ff10813          	addi	a6,sp,2047
 2c4:	f00006d3          	fmv.w.x	fa3,zero
 2c8:	53180813          	addi	a6,a6,1329
 2cc:	00080713          	mv	a4,a6
 2d0:	40078613          	addi	a2,a5,1024
 2d4:	0007a707          	flw	fa4,0(a5)
 2d8:	f00007d3          	fmv.w.x	fa5,zero
 2dc:	00478793          	addi	a5,a5,4
 2e0:	a0e696d3          	flt.s	a3,fa3,fa4
 2e4:	00068463          	beqz	a3,2ec <model_infer+0x294>
 2e8:	20e707d3          	fmv.s	fa5,fa4
 2ec:	00f72027          	fsw	fa5,0(a4)
 2f0:	00470713          	addi	a4,a4,4
 2f4:	fef610e3          	bne	a2,a5,2d4 <model_infer+0x27c>
 2f8:	000eb7b7          	lui	a5,0xeb
 2fc:	00001737          	lui	a4,0x1
 300:	13070713          	addi	a4,a4,304 # 1130 <bn3_beta+0x8>
 304:	a547a707          	flw	fa4,-1452(a5) # eaa54 <__SDATA_BEGIN__+0x4>
 308:	a5c52007          	flw	ft0,-1444(a0)
 30c:	0002a7b7          	lui	a5,0x2a
 310:	f0000553          	fmv.w.x	fa0,zero
 314:	a505a587          	flw	fa1,-1456(a1)
 318:	00e10eb3          	add	t4,sp,a4
 31c:	e2878793          	addi	a5,a5,-472 # 29e28 <bn1_var>
 320:	0002b637          	lui	a2,0x2b
 324:	0002a6b7          	lui	a3,0x2a
 328:	0002a737          	lui	a4,0x2a
 32c:	000e8893          	mv	a7,t4
 330:	40078e13          	addi	t3,a5,1024
 334:	a2860613          	addi	a2,a2,-1496 # 2aa28 <bn1_gamma>
 338:	22868693          	addi	a3,a3,552 # 2a228 <bn1_mean>
 33c:	62870713          	addi	a4,a4,1576 # 2a628 <bn1_beta>
 340:	0007a787          	flw	fa5,0(a5)
 344:	f00006d3          	fmv.w.x	fa3,zero
 348:	20b58653          	fmv.s	fa2,fa1
 34c:	0007f7d3          	fadd.s	fa5,fa5,ft0
 350:	00478793          	addi	a5,a5,4
 354:	a0a78353          	fle.s	t1,fa5,fa0
 358:	08031463          	bnez	t1,3e0 <model_infer+0x388>
 35c:	a0f59353          	flt.s	t1,fa1,fa5
 360:	00030463          	beqz	t1,368 <model_infer+0x310>
 364:	20f78653          	fmv.s	fa2,fa5
 368:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 36c:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 370:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 374:	18d7f653          	fdiv.s	fa2,fa5,fa3
 378:	00d67653          	fadd.s	fa2,fa2,fa3
 37c:	10e67653          	fmul.s	fa2,fa2,fa4
 380:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 384:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 388:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 38c:	18d7f653          	fdiv.s	fa2,fa5,fa3
 390:	00d67653          	fadd.s	fa2,fa2,fa3
 394:	10e67653          	fmul.s	fa2,fa2,fa4
 398:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 39c:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 3a0:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 3a4:	18d7f653          	fdiv.s	fa2,fa5,fa3
 3a8:	00d67653          	fadd.s	fa2,fa2,fa3
 3ac:	10e67653          	fmul.s	fa2,fa2,fa4
 3b0:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 3b4:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 3b8:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 3bc:	18d7f653          	fdiv.s	fa2,fa5,fa3
 3c0:	00d67653          	fadd.s	fa2,fa2,fa3
 3c4:	10e67653          	fmul.s	fa2,fa2,fa4
 3c8:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 3cc:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 3d0:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 3d4:	18d7f7d3          	fdiv.s	fa5,fa5,fa3
 3d8:	00d7f7d3          	fadd.s	fa5,fa5,fa3
 3dc:	10e7f6d3          	fmul.s	fa3,fa5,fa4
 3e0:	18d5f6d3          	fdiv.s	fa3,fa1,fa3
 3e4:	00082787          	flw	fa5,0(a6)
 3e8:	0006a107          	flw	ft2,0(a3)
 3ec:	00062087          	flw	ft1,0(a2)
 3f0:	00072607          	flw	fa2,0(a4)
 3f4:	0827f7d3          	fsub.s	fa5,fa5,ft2
 3f8:	00480813          	addi	a6,a6,4
 3fc:	00468693          	addi	a3,a3,4
 400:	00460613          	addi	a2,a2,4
 404:	00470713          	addi	a4,a4,4
 408:	1017f7d3          	fmul.s	fa5,fa5,ft1
 40c:	00488893          	addi	a7,a7,4
 410:	10d7f7d3          	fmul.s	fa5,fa5,fa3
 414:	00c7f7d3          	fadd.s	fa5,fa5,fa2
 418:	fef8ae27          	fsw	fa5,-4(a7)
 41c:	f2fe12e3          	bne	t3,a5,340 <model_infer+0x2e8>
 420:	33010793          	addi	a5,sp,816
 424:	0000a8b7          	lui	a7,0xa
 428:	0000a837          	lui	a6,0xa
 42c:	00078e13          	mv	t3,a5
 430:	c2888893          	addi	a7,a7,-984 # 9c28 <layer2_biases>
 434:	e2880813          	addi	a6,a6,-472 # 9e28 <layer2_weights>
 438:	00000313          	li	t1,0
 43c:	400e8613          	addi	a2,t4,1024
 440:	08000f13          	li	t5,128
 444:	0008a707          	flw	fa4,0(a7)
 448:	00080693          	mv	a3,a6
 44c:	000e8713          	mv	a4,t4
 450:	00072787          	flw	fa5,0(a4)
 454:	0006a687          	flw	fa3,0(a3)
 458:	00470713          	addi	a4,a4,4
 45c:	20068693          	addi	a3,a3,512
 460:	10d7f7d3          	fmul.s	fa5,fa5,fa3
 464:	00f77753          	fadd.s	fa4,fa4,fa5
 468:	fee614e3          	bne	a2,a4,450 <model_infer+0x3f8>
 46c:	00ee2027          	fsw	fa4,0(t3)
 470:	00130313          	addi	t1,t1,1
 474:	00488893          	addi	a7,a7,4
 478:	004e0e13          	addi	t3,t3,4
 47c:	00480813          	addi	a6,a6,4
 480:	fde312e3          	bne	t1,t5,444 <model_infer+0x3ec>
 484:	f00006d3          	fmv.w.x	fa3,zero
 488:	53010813          	addi	a6,sp,1328
 48c:	00080713          	mv	a4,a6
 490:	20078613          	addi	a2,a5,512
 494:	0007a707          	flw	fa4,0(a5)
 498:	f00007d3          	fmv.w.x	fa5,zero
 49c:	00478793          	addi	a5,a5,4
 4a0:	a0e696d3          	flt.s	a3,fa3,fa4
 4a4:	00068463          	beqz	a3,4ac <model_infer+0x454>
 4a8:	20e707d3          	fmv.s	fa5,fa4
 4ac:	00f72027          	fsw	fa5,0(a4)
 4b0:	00470713          	addi	a4,a4,4
 4b4:	fef610e3          	bne	a2,a5,494 <model_infer+0x43c>
 4b8:	000eb7b7          	lui	a5,0xeb
 4bc:	a547a707          	flw	fa4,-1452(a5) # eaa54 <__SDATA_BEGIN__+0x4>
 4c0:	a5c52007          	flw	ft0,-1444(a0)
 4c4:	000097b7          	lui	a5,0x9
 4c8:	f0000553          	fmv.w.x	fa0,zero
 4cc:	a505a587          	flw	fa1,-1456(a1)
 4d0:	73010e93          	addi	t4,sp,1840
 4d4:	42878793          	addi	a5,a5,1064 # 9428 <bn2_var>
 4d8:	0000a637          	lui	a2,0xa
 4dc:	000096b7          	lui	a3,0x9
 4e0:	0000a737          	lui	a4,0xa
 4e4:	000e8893          	mv	a7,t4
 4e8:	20078e13          	addi	t3,a5,512
 4ec:	a2860613          	addi	a2,a2,-1496 # 9a28 <bn2_gamma>
 4f0:	62868693          	addi	a3,a3,1576 # 9628 <bn2_mean>
 4f4:	82870713          	addi	a4,a4,-2008 # 9828 <bn2_beta>
 4f8:	0007a787          	flw	fa5,0(a5)
 4fc:	f00006d3          	fmv.w.x	fa3,zero
 500:	20b58653          	fmv.s	fa2,fa1
 504:	0007f7d3          	fadd.s	fa5,fa5,ft0
 508:	00478793          	addi	a5,a5,4
 50c:	a0a78353          	fle.s	t1,fa5,fa0
 510:	08031463          	bnez	t1,598 <model_infer+0x540>
 514:	a0f59353          	flt.s	t1,fa1,fa5
 518:	00030463          	beqz	t1,520 <model_infer+0x4c8>
 51c:	20f78653          	fmv.s	fa2,fa5
 520:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 524:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 528:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 52c:	18d7f653          	fdiv.s	fa2,fa5,fa3
 530:	00d67653          	fadd.s	fa2,fa2,fa3
 534:	10e67653          	fmul.s	fa2,fa2,fa4
 538:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 53c:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 540:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 544:	18d7f653          	fdiv.s	fa2,fa5,fa3
 548:	00d67653          	fadd.s	fa2,fa2,fa3
 54c:	10e67653          	fmul.s	fa2,fa2,fa4
 550:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 554:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 558:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 55c:	18d7f653          	fdiv.s	fa2,fa5,fa3
 560:	00d67653          	fadd.s	fa2,fa2,fa3
 564:	10e67653          	fmul.s	fa2,fa2,fa4
 568:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 56c:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 570:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 574:	18d7f653          	fdiv.s	fa2,fa5,fa3
 578:	00d67653          	fadd.s	fa2,fa2,fa3
 57c:	10e67653          	fmul.s	fa2,fa2,fa4
 580:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 584:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 588:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 58c:	18d7f7d3          	fdiv.s	fa5,fa5,fa3
 590:	00d7f7d3          	fadd.s	fa5,fa5,fa3
 594:	10e7f6d3          	fmul.s	fa3,fa5,fa4
 598:	18d5f6d3          	fdiv.s	fa3,fa1,fa3
 59c:	00082787          	flw	fa5,0(a6)
 5a0:	0006a107          	flw	ft2,0(a3)
 5a4:	00062087          	flw	ft1,0(a2)
 5a8:	00072607          	flw	fa2,0(a4)
 5ac:	0827f7d3          	fsub.s	fa5,fa5,ft2
 5b0:	00480813          	addi	a6,a6,4
 5b4:	00468693          	addi	a3,a3,4
 5b8:	00460613          	addi	a2,a2,4
 5bc:	00470713          	addi	a4,a4,4
 5c0:	1017f7d3          	fmul.s	fa5,fa5,ft1
 5c4:	00488893          	addi	a7,a7,4
 5c8:	10d7f7d3          	fmul.s	fa5,fa5,fa3
 5cc:	00c7f7d3          	fadd.s	fa5,fa5,fa2
 5d0:	fef8ae27          	fsw	fa5,-4(a7)
 5d4:	f3c792e3          	bne	a5,t3,4f8 <model_infer+0x4a0>
 5d8:	03010713          	addi	a4,sp,48
 5dc:	000018b7          	lui	a7,0x1
 5e0:	00001837          	lui	a6,0x1
 5e4:	00070e13          	mv	t3,a4
 5e8:	32888893          	addi	a7,a7,808 # 1328 <layer3_biases>
 5ec:	42880813          	addi	a6,a6,1064 # 1428 <layer3_weights>
 5f0:	00000313          	li	t1,0
 5f4:	200e8613          	addi	a2,t4,512
 5f8:	04000f13          	li	t5,64
 5fc:	0008a707          	flw	fa4,0(a7)
 600:	00080693          	mv	a3,a6
 604:	000e8793          	mv	a5,t4
 608:	0007a787          	flw	fa5,0(a5)
 60c:	0006a687          	flw	fa3,0(a3)
 610:	00478793          	addi	a5,a5,4
 614:	10068693          	addi	a3,a3,256
 618:	10d7f7d3          	fmul.s	fa5,fa5,fa3
 61c:	00f77753          	fadd.s	fa4,fa4,fa5
 620:	fec794e3          	bne	a5,a2,608 <model_infer+0x5b0>
 624:	00ee2027          	fsw	fa4,0(t3)
 628:	00130313          	addi	t1,t1,1
 62c:	00488893          	addi	a7,a7,4
 630:	004e0e13          	addi	t3,t3,4
 634:	00480813          	addi	a6,a6,4
 638:	fde312e3          	bne	t1,t5,5fc <model_infer+0x5a4>
 63c:	f00006d3          	fmv.w.x	fa3,zero
 640:	13010813          	addi	a6,sp,304
 644:	00080793          	mv	a5,a6
 648:	10070613          	addi	a2,a4,256
 64c:	00072707          	flw	fa4,0(a4)
 650:	f00007d3          	fmv.w.x	fa5,zero
 654:	00470713          	addi	a4,a4,4
 658:	a0e696d3          	flt.s	a3,fa3,fa4
 65c:	00068463          	beqz	a3,664 <model_infer+0x60c>
 660:	20e707d3          	fmv.s	fa5,fa4
 664:	00f7a027          	fsw	fa5,0(a5)
 668:	00478793          	addi	a5,a5,4
 66c:	fec710e3          	bne	a4,a2,64c <model_infer+0x5f4>
 670:	000eb7b7          	lui	a5,0xeb
 674:	a547a707          	flw	fa4,-1452(a5) # eaa54 <__SDATA_BEGIN__+0x4>
 678:	f0000553          	fmv.w.x	fa0,zero
 67c:	000017b7          	lui	a5,0x1
 680:	a505a587          	flw	fa1,-1456(a1)
 684:	23010e13          	addi	t3,sp,560
 688:	f2878793          	addi	a5,a5,-216 # f28 <bn3_var>
 68c:	00001637          	lui	a2,0x1
 690:	000016b7          	lui	a3,0x1
 694:	00001737          	lui	a4,0x1
 698:	a5c52007          	flw	ft0,-1444(a0)
 69c:	10078313          	addi	t1,a5,256
 6a0:	000e0513          	mv	a0,t3
 6a4:	22860613          	addi	a2,a2,552 # 1228 <bn3_gamma>
 6a8:	02868693          	addi	a3,a3,40 # 1028 <bn3_mean>
 6ac:	12870713          	addi	a4,a4,296 # 1128 <bn3_beta>
 6b0:	0007a787          	flw	fa5,0(a5)
 6b4:	f00006d3          	fmv.w.x	fa3,zero
 6b8:	20b58653          	fmv.s	fa2,fa1
 6bc:	0007f7d3          	fadd.s	fa5,fa5,ft0
 6c0:	00478793          	addi	a5,a5,4
 6c4:	a0a788d3          	fle.s	a7,fa5,fa0
 6c8:	08089463          	bnez	a7,750 <model_infer+0x6f8>
 6cc:	a0f598d3          	flt.s	a7,fa1,fa5
 6d0:	00088463          	beqz	a7,6d8 <model_infer+0x680>
 6d4:	20f78653          	fmv.s	fa2,fa5
 6d8:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 6dc:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 6e0:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 6e4:	18d7f653          	fdiv.s	fa2,fa5,fa3
 6e8:	00d67653          	fadd.s	fa2,fa2,fa3
 6ec:	10e67653          	fmul.s	fa2,fa2,fa4
 6f0:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 6f4:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 6f8:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 6fc:	18d7f653          	fdiv.s	fa2,fa5,fa3
 700:	00d67653          	fadd.s	fa2,fa2,fa3
 704:	10e67653          	fmul.s	fa2,fa2,fa4
 708:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 70c:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 710:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 714:	18d7f653          	fdiv.s	fa2,fa5,fa3
 718:	00d67653          	fadd.s	fa2,fa2,fa3
 71c:	10e67653          	fmul.s	fa2,fa2,fa4
 720:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 724:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 728:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 72c:	18d7f653          	fdiv.s	fa2,fa5,fa3
 730:	00d67653          	fadd.s	fa2,fa2,fa3
 734:	10e67653          	fmul.s	fa2,fa2,fa4
 738:	18c7f6d3          	fdiv.s	fa3,fa5,fa2
 73c:	00c6f6d3          	fadd.s	fa3,fa3,fa2
 740:	10e6f6d3          	fmul.s	fa3,fa3,fa4
 744:	18d7f7d3          	fdiv.s	fa5,fa5,fa3
 748:	00d7f7d3          	fadd.s	fa5,fa5,fa3
 74c:	10e7f6d3          	fmul.s	fa3,fa5,fa4
 750:	18d5f6d3          	fdiv.s	fa3,fa1,fa3
 754:	00082787          	flw	fa5,0(a6)
 758:	0006a107          	flw	ft2,0(a3)
 75c:	00062087          	flw	ft1,0(a2)
 760:	00072607          	flw	fa2,0(a4)
 764:	0827f7d3          	fsub.s	fa5,fa5,ft2
 768:	00480813          	addi	a6,a6,4
 76c:	00468693          	addi	a3,a3,4
 770:	00460613          	addi	a2,a2,4
 774:	00470713          	addi	a4,a4,4
 778:	1017f7d3          	fmul.s	fa5,fa5,ft1
 77c:	00450513          	addi	a0,a0,4
 780:	10d7f7d3          	fmul.s	fa5,fa5,fa3
 784:	00c7f7d3          	fadd.s	fa5,fa5,fa2
 788:	fef52e27          	fsw	fa5,-4(a0)
 78c:	f2f312e3          	bne	t1,a5,6b0 <model_infer+0x658>
 790:	00810613          	addi	a2,sp,8
 794:	00001837          	lui	a6,0x1
 798:	00001537          	lui	a0,0x1
 79c:	00060313          	mv	t1,a2
 7a0:	a1480813          	addi	a6,a6,-1516 # a14 <layer4_biases>
 7a4:	a2850513          	addi	a0,a0,-1496 # a28 <layer4_weights>
 7a8:	00000893          	li	a7,0
 7ac:	100e0693          	addi	a3,t3,256
 7b0:	00500e93          	li	t4,5
 7b4:	00082707          	flw	fa4,0(a6)
 7b8:	00050713          	mv	a4,a0
 7bc:	000e0793          	mv	a5,t3
 7c0:	0007a787          	flw	fa5,0(a5)
 7c4:	00072687          	flw	fa3,0(a4)
 7c8:	00478793          	addi	a5,a5,4
 7cc:	01470713          	addi	a4,a4,20
 7d0:	10d7f7d3          	fmul.s	fa5,fa5,fa3
 7d4:	00f77753          	fadd.s	fa4,fa4,fa5
 7d8:	fef694e3          	bne	a3,a5,7c0 <model_infer+0x768>
 7dc:	00e32027          	fsw	fa4,0(t1)
 7e0:	00188893          	addi	a7,a7,1
 7e4:	00480813          	addi	a6,a6,4
 7e8:	00430313          	addi	t1,t1,4
 7ec:	00450513          	addi	a0,a0,4
 7f0:	fdd892e3          	bne	a7,t4,7b4 <model_infer+0x75c>
 7f4:	000eb737          	lui	a4,0xeb
 7f8:	00812707          	flw	fa4,8(sp)
 7fc:	a5872787          	flw	fa5,-1448(a4) # eaa58 <__SDATA_BEGIN__+0x8>
 800:	a0e797d3          	flt.s	a5,fa5,fa4
 804:	00078463          	beqz	a5,80c <model_infer+0x7b4>
 808:	20e707d3          	fmv.s	fa5,fa4
 80c:	00c12707          	flw	fa4,12(sp)
 810:	20f786d3          	fmv.s	fa3,fa5
 814:	a0e797d3          	flt.s	a5,fa5,fa4
 818:	00078463          	beqz	a5,820 <model_infer+0x7c8>
 81c:	20e706d3          	fmv.s	fa3,fa4
 820:	01012787          	flw	fa5,16(sp)
 824:	20d68753          	fmv.s	fa4,fa3
 828:	a0f697d3          	flt.s	a5,fa3,fa5
 82c:	00078463          	beqz	a5,834 <model_infer+0x7dc>
 830:	20f78753          	fmv.s	fa4,fa5
 834:	01412687          	flw	fa3,20(sp)
 838:	20e707d3          	fmv.s	fa5,fa4
 83c:	a0d717d3          	flt.s	a5,fa4,fa3
 840:	00078463          	beqz	a5,848 <model_infer+0x7f0>
 844:	20d687d3          	fmv.s	fa5,fa3
 848:	01812707          	flw	fa4,24(sp)
 84c:	20f78553          	fmv.s	fa0,fa5
 850:	a0e797d3          	flt.s	a5,fa5,fa4
 854:	00078463          	beqz	a5,85c <model_infer+0x804>
 858:	20e70553          	fmv.s	fa0,fa4
 85c:	f00005d3          	fmv.w.x	fa1,zero
 860:	01c10693          	addi	a3,sp,28
 864:	01460513          	addi	a0,a2,20
 868:	03300713          	li	a4,51
 86c:	00062607          	flw	fa2,0(a2)
 870:	a505a687          	flw	fa3,-1456(a1)
 874:	00100793          	li	a5,1
 878:	08a67653          	fsub.s	fa2,fa2,fa0
 87c:	20d68753          	fmv.s	fa4,fa3
 880:	d007f7d3          	fcvt.s.w	fa5,a5
 884:	00178793          	addi	a5,a5,1
 888:	18f677d3          	fdiv.s	fa5,fa2,fa5
 88c:	10f77753          	fmul.s	fa4,fa4,fa5
 890:	00e6f6d3          	fadd.s	fa3,fa3,fa4
 894:	fee796e3          	bne	a5,a4,880 <model_infer+0x828>
 898:	00d6a027          	fsw	fa3,0(a3)
 89c:	00460613          	addi	a2,a2,4
 8a0:	00d5f5d3          	fadd.s	fa1,fa1,fa3
 8a4:	00468693          	addi	a3,a3,4
 8a8:	fcc512e3          	bne	a0,a2,86c <model_infer+0x814>
 8ac:	f00007d3          	fmv.w.x	fa5,zero
 8b0:	a0b797d3          	flt.s	a5,fa5,fa1
 8b4:	a505a787          	flw	fa5,-1456(a1)
 8b8:	00078463          	beqz	a5,8c0 <model_infer+0x868>
 8bc:	18b7f7d3          	fdiv.s	fa5,fa5,fa1
 8c0:	01c12707          	flw	fa4,28(sp)
 8c4:	02012587          	flw	fa1,32(sp)
 8c8:	02412607          	flw	fa2,36(sp)
 8cc:	10e7f753          	fmul.s	fa4,fa5,fa4
 8d0:	10b7f5d3          	fmul.s	fa1,fa5,fa1
 8d4:	02812687          	flw	fa3,40(sp)
 8d8:	02c12507          	flw	fa0,44(sp)
 8dc:	10c7f653          	fmul.s	fa2,fa5,fa2
 8e0:	10d7f6d3          	fmul.s	fa3,fa5,fa3
 8e4:	a0b717d3          	flt.s	a5,fa4,fa1
 8e8:	10a7f7d3          	fmul.s	fa5,fa5,fa0
 8ec:	00000513          	li	a0,0
 8f0:	00078663          	beqz	a5,8fc <model_infer+0x8a4>
 8f4:	20b58753          	fmv.s	fa4,fa1
 8f8:	00100513          	li	a0,1
 8fc:	a0c717d3          	flt.s	a5,fa4,fa2
 900:	00078663          	beqz	a5,90c <model_infer+0x8b4>
 904:	20c60753          	fmv.s	fa4,fa2
 908:	00200513          	li	a0,2
 90c:	a0d717d3          	flt.s	a5,fa4,fa3
 910:	00078663          	beqz	a5,91c <model_infer+0x8c4>
 914:	20d68753          	fmv.s	fa4,fa3
 918:	00300513          	li	a0,3
 91c:	a0f717d3          	flt.s	a5,fa4,fa5
 920:	00078463          	beqz	a5,928 <model_infer+0x8d0>
 924:	00400513          	li	a0,4
 928:	000032b7          	lui	t0,0x3
 92c:	d3028293          	addi	t0,t0,-720 # 2d30 <layer3_weights+0x1908>
 930:	00510133          	add	sp,sp,t0
 934:	00008067          	ret

00000938 <memset>:
 938:	00f00313          	li	t1,15
 93c:	00050713          	mv	a4,a0
 940:	02c37e63          	bgeu	t1,a2,97c <memset+0x44>
 944:	00f77793          	andi	a5,a4,15
 948:	0a079063          	bnez	a5,9e8 <memset+0xb0>
 94c:	08059263          	bnez	a1,9d0 <memset+0x98>
 950:	ff067693          	andi	a3,a2,-16
 954:	00f67613          	andi	a2,a2,15
 958:	00e686b3          	add	a3,a3,a4
 95c:	00b72023          	sw	a1,0(a4)
 960:	00b72223          	sw	a1,4(a4)
 964:	00b72423          	sw	a1,8(a4)
 968:	00b72623          	sw	a1,12(a4)
 96c:	01070713          	addi	a4,a4,16
 970:	fed766e3          	bltu	a4,a3,95c <memset+0x24>
 974:	00061463          	bnez	a2,97c <memset+0x44>
 978:	00008067          	ret
 97c:	40c306b3          	sub	a3,t1,a2
 980:	00269693          	slli	a3,a3,0x2
 984:	00000297          	auipc	t0,0x0
 988:	005686b3          	add	a3,a3,t0
 98c:	00c68067          	jr	12(a3)
 990:	00b70723          	sb	a1,14(a4)
 994:	00b706a3          	sb	a1,13(a4)
 998:	00b70623          	sb	a1,12(a4)
 99c:	00b705a3          	sb	a1,11(a4)
 9a0:	00b70523          	sb	a1,10(a4)
 9a4:	00b704a3          	sb	a1,9(a4)
 9a8:	00b70423          	sb	a1,8(a4)
 9ac:	00b703a3          	sb	a1,7(a4)
 9b0:	00b70323          	sb	a1,6(a4)
 9b4:	00b702a3          	sb	a1,5(a4)
 9b8:	00b70223          	sb	a1,4(a4)
 9bc:	00b701a3          	sb	a1,3(a4)
 9c0:	00b70123          	sb	a1,2(a4)
 9c4:	00b700a3          	sb	a1,1(a4)
 9c8:	00b70023          	sb	a1,0(a4)
 9cc:	00008067          	ret
 9d0:	0ff5f593          	zext.b	a1,a1
 9d4:	00859693          	slli	a3,a1,0x8
 9d8:	00d5e5b3          	or	a1,a1,a3
 9dc:	01059693          	slli	a3,a1,0x10
 9e0:	00d5e5b3          	or	a1,a1,a3
 9e4:	f6dff06f          	j	950 <memset+0x18>
 9e8:	00279693          	slli	a3,a5,0x2
 9ec:	00000297          	auipc	t0,0x0
 9f0:	005686b3          	add	a3,a3,t0
 9f4:	00008293          	mv	t0,ra
 9f8:	fa0680e7          	jalr	-96(a3)
 9fc:	00028093          	mv	ra,t0
 a00:	ff078793          	addi	a5,a5,-16
 a04:	40f70733          	sub	a4,a4,a5
 a08:	00f60633          	add	a2,a2,a5
 a0c:	f6c378e3          	bgeu	t1,a2,97c <memset+0x44>
 a10:	f3dff06f          	j	94c <memset+0x14>
