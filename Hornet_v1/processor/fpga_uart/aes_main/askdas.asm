
aes_main.elf:     file format elf32-littleriscv


Disassembly of section .init:

00000000 <_start>:
   0:	00020117          	auipc	sp,0x20
   4:	ffc10113          	addi	sp,sp,-4 # 1fffc <__stack_top>
   8:	00010433          	add	s0,sp,zero
   c:	0040006f          	j	10 <main>

Disassembly of section .text:

00000010 <main>:
      10:	c2010113          	addi	sp,sp,-992
      14:	3c112e23          	sw	ra,988(sp)
      18:	3c812c23          	sw	s0,984(sp)
      1c:	3c912a23          	sw	s1,980(sp)
      20:	3d312623          	sw	s3,972(sp)
      24:	3d512223          	sw	s5,964(sp)
      28:	3d612023          	sw	s6,960(sp)
      2c:	3b712e23          	sw	s7,956(sp)
      30:	3b812c23          	sw	s8,952(sp)
      34:	3b912a23          	sw	s9,948(sp)
      38:	3d212823          	sw	s2,976(sp)
      3c:	3d412423          	sw	s4,968(sp)
      40:	80010113          	addi	sp,sp,-2048
      44:	80010113          	addi	sp,sp,-2048
      48:	7ff10513          	addi	a0,sp,2047
      4c:	00400793          	li	a5,4
      50:	3b150513          	addi	a0,a0,945
      54:	00001637          	lui	a2,0x1
      58:	e0f52823          	sw	a5,-496(a0)
      5c:	9ec60613          	addi	a2,a2,-1556 # 9ec <pqcrystals_dilithium2_ref_poly_caddq+0x3c>
      60:	00000593          	li	a1,0
      64:	e1450513          	addi	a0,a0,-492
      68:	789040ef          	jal	4ff0 <memset>
      6c:	771040ef          	jal	4fdc <SET_MTVEC_VECTOR_MODE>
      70:	10008437          	lui	s0,0x10008
      74:	0000ab37          	lui	s6,0xa
      78:	100085b7          	lui	a1,0x10008
      7c:	01058593          	addi	a1,a1,16 # 10008010 <__stack_top+0xffe8014>
      80:	03cb0513          	addi	a0,s6,60 # a03c <uart0>
      84:	0000a4b7          	lui	s1,0xa
      88:	02040413          	addi	s0,s0,32 # 10008020 <__stack_top+0xffe8024>
      8c:	00100b93          	li	s7,1
      90:	7ff10a93          	addi	s5,sp,2047
      94:	0404a023          	sw	zero,64(s1) # a040 <count>
      98:	1c1a8a93          	addi	s5,s5,449
      9c:	6a1040ef          	jal	4f3c <uart_init>
      a0:	0000acb7          	lui	s9,0xa
      a4:	01740023          	sb	s7,0(s0)
      a8:	00010c37          	lui	s8,0x10
      ac:	03a00993          	li	s3,58
      b0:	30046073          	csrsi	mstatus,8
      b4:	304c2073          	csrs	mie,s8
      b8:	00040023          	sb	zero,0(s0)
      bc:	0404a783          	lw	a5,64(s1)
      c0:	fef9dee3          	bge	s3,a5,bc <main+0xac>
      c4:	000a8713          	mv	a4,s5
      c8:	03b00693          	li	a3,59
      cc:	000c8613          	mv	a2,s9
      d0:	00c10593          	addi	a1,sp,12
      d4:	01740023          	sb	s7,0(s0)
      d8:	01010513          	addi	a0,sp,16
      dc:	0f1040ef          	jal	49cc <pqcrystals_dilithium2_ref>
      e0:	01010593          	addi	a1,sp,16
      e4:	00040023          	sb	zero,0(s0)
      e8:	03cb0513          	addi	a0,s6,60
      ec:	03b00613          	li	a2,59
      f0:	655040ef          	jal	4f44 <uart_transmit_string>
      f4:	0404a023          	sw	zero,64(s1)
      f8:	fb9ff06f          	j	b0 <main+0xa0>

000000fc <mti_handler>:
      fc:	30200073          	mret

00000100 <exc_handler>:
     100:	30200073          	mret

00000104 <mei_handler>:
     104:	30200073          	mret

00000108 <msi_handler>:
     108:	30200073          	mret

0000010c <fast_irq0_handler>:
     10c:	ff010113          	addi	sp,sp,-16
     110:	00f12023          	sw	a5,0(sp)
     114:	0000a7b7          	lui	a5,0xa
     118:	03c7a783          	lw	a5,60(a5) # a03c <uart0>
     11c:	00e12223          	sw	a4,4(sp)
     120:	0000a737          	lui	a4,0xa
     124:	00c12623          	sw	a2,12(sp)
     128:	00d12423          	sw	a3,8(sp)
     12c:	04072603          	lw	a2,64(a4) # a040 <count>
     130:	0017c683          	lbu	a3,1(a5)
     134:	0000a7b7          	lui	a5,0xa
     138:	00078793          	mv	a5,a5
     13c:	00c787b3          	add	a5,a5,a2
     140:	00d78023          	sb	a3,0(a5) # a000 <input_array>
     144:	04072683          	lw	a3,64(a4)
     148:	03a00793          	li	a5,58
     14c:	02d7c463          	blt	a5,a3,174 <fast_irq0_handler+0x68>
     150:	04072783          	lw	a5,64(a4)
     154:	00c12603          	lw	a2,12(sp)
     158:	00812683          	lw	a3,8(sp)
     15c:	00178793          	addi	a5,a5,1
     160:	04f72023          	sw	a5,64(a4)
     164:	00412703          	lw	a4,4(sp)
     168:	00012783          	lw	a5,0(sp)
     16c:	01010113          	addi	sp,sp,16
     170:	30200073          	mret
     174:	30047073          	csrci	mstatus,8
     178:	00c12603          	lw	a2,12(sp)
     17c:	00812683          	lw	a3,8(sp)
     180:	00412703          	lw	a4,4(sp)
     184:	00012783          	lw	a5,0(sp)
     188:	01010113          	addi	sp,sp,16
     18c:	30200073          	mret

00000190 <fast_irq1_handler>:
     190:	30200073          	mret

00000194 <pqcrystals_dilithium2_ref_polyvec_matrix_expand>:
     194:	fe010113          	addi	sp,sp,-32
     198:	01512223          	sw	s5,4(sp)
     19c:	00001ab7          	lui	s5,0x1
     1a0:	01212823          	sw	s2,16(sp)
     1a4:	01312623          	sw	s3,12(sp)
     1a8:	01412423          	sw	s4,8(sp)
     1ac:	01612023          	sw	s6,0(sp)
     1b0:	00112e23          	sw	ra,28(sp)
     1b4:	00812c23          	sw	s0,24(sp)
     1b8:	00912a23          	sw	s1,20(sp)
     1bc:	00058a13          	mv	s4,a1
     1c0:	01550933          	add	s2,a0,s5
     1c4:	00000993          	li	s3,0
     1c8:	40000b13          	li	s6,1024
     1cc:	80090493          	addi	s1,s2,-2048
     1d0:	80048493          	addi	s1,s1,-2048
     1d4:	00098413          	mv	s0,s3
     1d8:	00040613          	mv	a2,s0
     1dc:	00140413          	addi	s0,s0,1
     1e0:	00048513          	mv	a0,s1
     1e4:	000a0593          	mv	a1,s4
     1e8:	01041413          	slli	s0,s0,0x10
     1ec:	40048493          	addi	s1,s1,1024
     1f0:	221000ef          	jal	c10 <pqcrystals_dilithium2_ref_poly_uniform>
     1f4:	01045413          	srli	s0,s0,0x10
     1f8:	ff2490e3          	bne	s1,s2,1d8 <pqcrystals_dilithium2_ref_polyvec_matrix_expand+0x44>
     1fc:	10098993          	addi	s3,s3,256
     200:	01099993          	slli	s3,s3,0x10
     204:	0109d993          	srli	s3,s3,0x10
     208:	01548933          	add	s2,s1,s5
     20c:	fd6990e3          	bne	s3,s6,1cc <pqcrystals_dilithium2_ref_polyvec_matrix_expand+0x38>
     210:	01c12083          	lw	ra,28(sp)
     214:	01812403          	lw	s0,24(sp)
     218:	01412483          	lw	s1,20(sp)
     21c:	01012903          	lw	s2,16(sp)
     220:	00c12983          	lw	s3,12(sp)
     224:	00812a03          	lw	s4,8(sp)
     228:	00412a83          	lw	s5,4(sp)
     22c:	00012b03          	lw	s6,0(sp)
     230:	02010113          	addi	sp,sp,32
     234:	00008067          	ret

00000238 <pqcrystals_dilithium2_ref_polyvecl_uniform_gamma1>:
     238:	fe010113          	addi	sp,sp,-32
     23c:	00812c23          	sw	s0,24(sp)
     240:	00261413          	slli	s0,a2,0x2
     244:	01212823          	sw	s2,16(sp)
     248:	01041413          	slli	s0,s0,0x10
     24c:	00001937          	lui	s2,0x1
     250:	00912a23          	sw	s1,20(sp)
     254:	01312623          	sw	s3,12(sp)
     258:	00112e23          	sw	ra,28(sp)
     25c:	01045413          	srli	s0,s0,0x10
     260:	00050493          	mv	s1,a0
     264:	00058993          	mv	s3,a1
     268:	01250933          	add	s2,a0,s2
     26c:	00040613          	mv	a2,s0
     270:	00140413          	addi	s0,s0,1
     274:	00048513          	mv	a0,s1
     278:	00098593          	mv	a1,s3
     27c:	01041413          	slli	s0,s0,0x10
     280:	40048493          	addi	s1,s1,1024
     284:	0b8010ef          	jal	133c <pqcrystals_dilithium2_ref_poly_uniform_gamma1>
     288:	01045413          	srli	s0,s0,0x10
     28c:	ff2490e3          	bne	s1,s2,26c <pqcrystals_dilithium2_ref_polyvecl_uniform_gamma1+0x34>
     290:	01c12083          	lw	ra,28(sp)
     294:	01812403          	lw	s0,24(sp)
     298:	01412483          	lw	s1,20(sp)
     29c:	01012903          	lw	s2,16(sp)
     2a0:	00c12983          	lw	s3,12(sp)
     2a4:	02010113          	addi	sp,sp,32
     2a8:	00008067          	ret

000002ac <pqcrystals_dilithium2_ref_polyvecl_reduce>:
     2ac:	ff010113          	addi	sp,sp,-16
     2b0:	00912223          	sw	s1,4(sp)
     2b4:	000014b7          	lui	s1,0x1
     2b8:	00812423          	sw	s0,8(sp)
     2bc:	00112623          	sw	ra,12(sp)
     2c0:	00050413          	mv	s0,a0
     2c4:	009504b3          	add	s1,a0,s1
     2c8:	00040513          	mv	a0,s0
     2cc:	40040413          	addi	s0,s0,1024
     2d0:	6a0000ef          	jal	970 <pqcrystals_dilithium2_ref_poly_reduce>
     2d4:	fe941ae3          	bne	s0,s1,2c8 <pqcrystals_dilithium2_ref_polyvecl_reduce+0x1c>
     2d8:	00c12083          	lw	ra,12(sp)
     2dc:	00812403          	lw	s0,8(sp)
     2e0:	00412483          	lw	s1,4(sp)
     2e4:	01010113          	addi	sp,sp,16
     2e8:	00008067          	ret

000002ec <pqcrystals_dilithium2_ref_polyvecl_add>:
     2ec:	fe010113          	addi	sp,sp,-32
     2f0:	00812c23          	sw	s0,24(sp)
     2f4:	00912a23          	sw	s1,20(sp)
     2f8:	01212823          	sw	s2,16(sp)
     2fc:	01312623          	sw	s3,12(sp)
     300:	01412423          	sw	s4,8(sp)
     304:	00112e23          	sw	ra,28(sp)
     308:	00050a13          	mv	s4,a0
     30c:	00058993          	mv	s3,a1
     310:	00060913          	mv	s2,a2
     314:	00000413          	li	s0,0
     318:	000014b7          	lui	s1,0x1
     31c:	00890633          	add	a2,s2,s0
     320:	008985b3          	add	a1,s3,s0
     324:	008a0533          	add	a0,s4,s0
     328:	40040413          	addi	s0,s0,1024
     32c:	6c4000ef          	jal	9f0 <pqcrystals_dilithium2_ref_poly_add>
     330:	fe9416e3          	bne	s0,s1,31c <pqcrystals_dilithium2_ref_polyvecl_add+0x30>
     334:	01c12083          	lw	ra,28(sp)
     338:	01812403          	lw	s0,24(sp)
     33c:	01412483          	lw	s1,20(sp)
     340:	01012903          	lw	s2,16(sp)
     344:	00c12983          	lw	s3,12(sp)
     348:	00812a03          	lw	s4,8(sp)
     34c:	02010113          	addi	sp,sp,32
     350:	00008067          	ret

00000354 <pqcrystals_dilithium2_ref_polyvecl_ntt>:
     354:	ff010113          	addi	sp,sp,-16
     358:	00912223          	sw	s1,4(sp)
     35c:	000014b7          	lui	s1,0x1
     360:	00812423          	sw	s0,8(sp)
     364:	00112623          	sw	ra,12(sp)
     368:	00050413          	mv	s0,a0
     36c:	009504b3          	add	s1,a0,s1
     370:	00040513          	mv	a0,s0
     374:	40040413          	addi	s0,s0,1024
     378:	6d8000ef          	jal	a50 <pqcrystals_dilithium2_ref_poly_ntt>
     37c:	fe941ae3          	bne	s0,s1,370 <pqcrystals_dilithium2_ref_polyvecl_ntt+0x1c>
     380:	00c12083          	lw	ra,12(sp)
     384:	00812403          	lw	s0,8(sp)
     388:	00412483          	lw	s1,4(sp)
     38c:	01010113          	addi	sp,sp,16
     390:	00008067          	ret

00000394 <pqcrystals_dilithium2_ref_polyvecl_invntt_tomont>:
     394:	ff010113          	addi	sp,sp,-16
     398:	00912223          	sw	s1,4(sp)
     39c:	000014b7          	lui	s1,0x1
     3a0:	00812423          	sw	s0,8(sp)
     3a4:	00112623          	sw	ra,12(sp)
     3a8:	00050413          	mv	s0,a0
     3ac:	009504b3          	add	s1,a0,s1
     3b0:	00040513          	mv	a0,s0
     3b4:	40040413          	addi	s0,s0,1024
     3b8:	69c000ef          	jal	a54 <pqcrystals_dilithium2_ref_poly_invntt_tomont>
     3bc:	fe941ae3          	bne	s0,s1,3b0 <pqcrystals_dilithium2_ref_polyvecl_invntt_tomont+0x1c>
     3c0:	00c12083          	lw	ra,12(sp)
     3c4:	00812403          	lw	s0,8(sp)
     3c8:	00412483          	lw	s1,4(sp)
     3cc:	01010113          	addi	sp,sp,16
     3d0:	00008067          	ret

000003d4 <pqcrystals_dilithium2_ref_polyvecl_pointwise_poly_montgomery>:
     3d4:	fe010113          	addi	sp,sp,-32
     3d8:	00812c23          	sw	s0,24(sp)
     3dc:	00912a23          	sw	s1,20(sp)
     3e0:	01212823          	sw	s2,16(sp)
     3e4:	01312623          	sw	s3,12(sp)
     3e8:	01412423          	sw	s4,8(sp)
     3ec:	00112e23          	sw	ra,28(sp)
     3f0:	00050a13          	mv	s4,a0
     3f4:	00058993          	mv	s3,a1
     3f8:	00060913          	mv	s2,a2
     3fc:	00000413          	li	s0,0
     400:	000014b7          	lui	s1,0x1
     404:	00890633          	add	a2,s2,s0
     408:	008a0533          	add	a0,s4,s0
     40c:	00098593          	mv	a1,s3
     410:	40040413          	addi	s0,s0,1024
     414:	644000ef          	jal	a58 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery>
     418:	fe9416e3          	bne	s0,s1,404 <pqcrystals_dilithium2_ref_polyvecl_pointwise_poly_montgomery+0x30>
     41c:	01c12083          	lw	ra,28(sp)
     420:	01812403          	lw	s0,24(sp)
     424:	01412483          	lw	s1,20(sp)
     428:	01012903          	lw	s2,16(sp)
     42c:	00c12983          	lw	s3,12(sp)
     430:	00812a03          	lw	s4,8(sp)
     434:	02010113          	addi	sp,sp,32
     438:	00008067          	ret

0000043c <pqcrystals_dilithium2_ref_polyvecl_pointwise_acc_montgomery>:
     43c:	be010113          	addi	sp,sp,-1056
     440:	40812c23          	sw	s0,1048(sp)
     444:	40912a23          	sw	s1,1044(sp)
     448:	41212823          	sw	s2,1040(sp)
     44c:	41312623          	sw	s3,1036(sp)
     450:	00058913          	mv	s2,a1
     454:	40112e23          	sw	ra,1052(sp)
     458:	00050993          	mv	s3,a0
     45c:	40060493          	addi	s1,a2,1024
     460:	5f8000ef          	jal	a58 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery>
     464:	000017b7          	lui	a5,0x1
     468:	40090413          	addi	s0,s2,1024 # 1400 <pqcrystals_dilithium2_ref_ntt+0x1c>
     46c:	00f90933          	add	s2,s2,a5
     470:	00048613          	mv	a2,s1
     474:	00040593          	mv	a1,s0
     478:	00010513          	mv	a0,sp
     47c:	5dc000ef          	jal	a58 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery>
     480:	00010613          	mv	a2,sp
     484:	00098593          	mv	a1,s3
     488:	00098513          	mv	a0,s3
     48c:	40040413          	addi	s0,s0,1024
     490:	560000ef          	jal	9f0 <pqcrystals_dilithium2_ref_poly_add>
     494:	40048493          	addi	s1,s1,1024 # 1400 <pqcrystals_dilithium2_ref_ntt+0x1c>
     498:	fd241ce3          	bne	s0,s2,470 <pqcrystals_dilithium2_ref_polyvecl_pointwise_acc_montgomery+0x34>
     49c:	41c12083          	lw	ra,1052(sp)
     4a0:	41812403          	lw	s0,1048(sp)
     4a4:	41412483          	lw	s1,1044(sp)
     4a8:	41012903          	lw	s2,1040(sp)
     4ac:	40c12983          	lw	s3,1036(sp)
     4b0:	42010113          	addi	sp,sp,1056
     4b4:	00008067          	ret

000004b8 <pqcrystals_dilithium2_ref_polyvec_matrix_pointwise_montgomery>:
     4b8:	fe010113          	addi	sp,sp,-32
     4bc:	01212823          	sw	s2,16(sp)
     4c0:	00001937          	lui	s2,0x1
     4c4:	00812c23          	sw	s0,24(sp)
     4c8:	00912a23          	sw	s1,20(sp)
     4cc:	01312623          	sw	s3,12(sp)
     4d0:	01412423          	sw	s4,8(sp)
     4d4:	00112e23          	sw	ra,28(sp)
     4d8:	00050413          	mv	s0,a0
     4dc:	00058493          	mv	s1,a1
     4e0:	00060a13          	mv	s4,a2
     4e4:	012509b3          	add	s3,a0,s2
     4e8:	00048593          	mv	a1,s1
     4ec:	00040513          	mv	a0,s0
     4f0:	000a0613          	mv	a2,s4
     4f4:	40040413          	addi	s0,s0,1024
     4f8:	f45ff0ef          	jal	43c <pqcrystals_dilithium2_ref_polyvecl_pointwise_acc_montgomery>
     4fc:	012484b3          	add	s1,s1,s2
     500:	ff3414e3          	bne	s0,s3,4e8 <pqcrystals_dilithium2_ref_polyvec_matrix_pointwise_montgomery+0x30>
     504:	01c12083          	lw	ra,28(sp)
     508:	01812403          	lw	s0,24(sp)
     50c:	01412483          	lw	s1,20(sp)
     510:	01012903          	lw	s2,16(sp)
     514:	00c12983          	lw	s3,12(sp)
     518:	00812a03          	lw	s4,8(sp)
     51c:	02010113          	addi	sp,sp,32
     520:	00008067          	ret

00000524 <pqcrystals_dilithium2_ref_polyvecl_chknorm>:
     524:	ff010113          	addi	sp,sp,-16
     528:	00912223          	sw	s1,4(sp)
     52c:	000014b7          	lui	s1,0x1
     530:	00812423          	sw	s0,8(sp)
     534:	01212023          	sw	s2,0(sp)
     538:	00112623          	sw	ra,12(sp)
     53c:	00050413          	mv	s0,a0
     540:	00058913          	mv	s2,a1
     544:	009504b3          	add	s1,a0,s1
     548:	00040513          	mv	a0,s0
     54c:	00090593          	mv	a1,s2
     550:	67c000ef          	jal	bcc <pqcrystals_dilithium2_ref_poly_chknorm>
     554:	40040413          	addi	s0,s0,1024
     558:	02051063          	bnez	a0,578 <pqcrystals_dilithium2_ref_polyvecl_chknorm+0x54>
     55c:	fe9416e3          	bne	s0,s1,548 <pqcrystals_dilithium2_ref_polyvecl_chknorm+0x24>
     560:	00c12083          	lw	ra,12(sp)
     564:	00812403          	lw	s0,8(sp)
     568:	00412483          	lw	s1,4(sp)
     56c:	00012903          	lw	s2,0(sp)
     570:	01010113          	addi	sp,sp,16
     574:	00008067          	ret
     578:	00c12083          	lw	ra,12(sp)
     57c:	00812403          	lw	s0,8(sp)
     580:	00412483          	lw	s1,4(sp)
     584:	00012903          	lw	s2,0(sp)
     588:	00100513          	li	a0,1
     58c:	01010113          	addi	sp,sp,16
     590:	00008067          	ret

00000594 <pqcrystals_dilithium2_ref_polyveck_reduce>:
     594:	ff010113          	addi	sp,sp,-16
     598:	00912223          	sw	s1,4(sp)
     59c:	000014b7          	lui	s1,0x1
     5a0:	00812423          	sw	s0,8(sp)
     5a4:	00112623          	sw	ra,12(sp)
     5a8:	00050413          	mv	s0,a0
     5ac:	009504b3          	add	s1,a0,s1
     5b0:	00040513          	mv	a0,s0
     5b4:	40040413          	addi	s0,s0,1024
     5b8:	3b8000ef          	jal	970 <pqcrystals_dilithium2_ref_poly_reduce>
     5bc:	fe941ae3          	bne	s0,s1,5b0 <pqcrystals_dilithium2_ref_polyveck_reduce+0x1c>
     5c0:	00c12083          	lw	ra,12(sp)
     5c4:	00812403          	lw	s0,8(sp)
     5c8:	00412483          	lw	s1,4(sp)
     5cc:	01010113          	addi	sp,sp,16
     5d0:	00008067          	ret

000005d4 <pqcrystals_dilithium2_ref_polyveck_caddq>:
     5d4:	ff010113          	addi	sp,sp,-16
     5d8:	00912223          	sw	s1,4(sp)
     5dc:	000014b7          	lui	s1,0x1
     5e0:	00812423          	sw	s0,8(sp)
     5e4:	00112623          	sw	ra,12(sp)
     5e8:	00050413          	mv	s0,a0
     5ec:	009504b3          	add	s1,a0,s1
     5f0:	00040513          	mv	a0,s0
     5f4:	40040413          	addi	s0,s0,1024
     5f8:	3b8000ef          	jal	9b0 <pqcrystals_dilithium2_ref_poly_caddq>
     5fc:	fe941ae3          	bne	s0,s1,5f0 <pqcrystals_dilithium2_ref_polyveck_caddq+0x1c>
     600:	00c12083          	lw	ra,12(sp)
     604:	00812403          	lw	s0,8(sp)
     608:	00412483          	lw	s1,4(sp)
     60c:	01010113          	addi	sp,sp,16
     610:	00008067          	ret

00000614 <pqcrystals_dilithium2_ref_polyveck_add>:
     614:	fe010113          	addi	sp,sp,-32
     618:	00812c23          	sw	s0,24(sp)
     61c:	00912a23          	sw	s1,20(sp)
     620:	01212823          	sw	s2,16(sp)
     624:	01312623          	sw	s3,12(sp)
     628:	01412423          	sw	s4,8(sp)
     62c:	00112e23          	sw	ra,28(sp)
     630:	00050a13          	mv	s4,a0
     634:	00058993          	mv	s3,a1
     638:	00060913          	mv	s2,a2
     63c:	00000413          	li	s0,0
     640:	000014b7          	lui	s1,0x1
     644:	00890633          	add	a2,s2,s0
     648:	008985b3          	add	a1,s3,s0
     64c:	008a0533          	add	a0,s4,s0
     650:	40040413          	addi	s0,s0,1024
     654:	39c000ef          	jal	9f0 <pqcrystals_dilithium2_ref_poly_add>
     658:	fe9416e3          	bne	s0,s1,644 <pqcrystals_dilithium2_ref_polyveck_add+0x30>
     65c:	01c12083          	lw	ra,28(sp)
     660:	01812403          	lw	s0,24(sp)
     664:	01412483          	lw	s1,20(sp)
     668:	01012903          	lw	s2,16(sp)
     66c:	00c12983          	lw	s3,12(sp)
     670:	00812a03          	lw	s4,8(sp)
     674:	02010113          	addi	sp,sp,32
     678:	00008067          	ret

0000067c <pqcrystals_dilithium2_ref_polyveck_sub>:
     67c:	fe010113          	addi	sp,sp,-32
     680:	00812c23          	sw	s0,24(sp)
     684:	00912a23          	sw	s1,20(sp)
     688:	01212823          	sw	s2,16(sp)
     68c:	01312623          	sw	s3,12(sp)
     690:	01412423          	sw	s4,8(sp)
     694:	00112e23          	sw	ra,28(sp)
     698:	00050a13          	mv	s4,a0
     69c:	00058993          	mv	s3,a1
     6a0:	00060913          	mv	s2,a2
     6a4:	00000413          	li	s0,0
     6a8:	000014b7          	lui	s1,0x1
     6ac:	00890633          	add	a2,s2,s0
     6b0:	008985b3          	add	a1,s3,s0
     6b4:	008a0533          	add	a0,s4,s0
     6b8:	40040413          	addi	s0,s0,1024
     6bc:	364000ef          	jal	a20 <pqcrystals_dilithium2_ref_poly_sub>
     6c0:	fe9416e3          	bne	s0,s1,6ac <pqcrystals_dilithium2_ref_polyveck_sub+0x30>
     6c4:	01c12083          	lw	ra,28(sp)
     6c8:	01812403          	lw	s0,24(sp)
     6cc:	01412483          	lw	s1,20(sp)
     6d0:	01012903          	lw	s2,16(sp)
     6d4:	00c12983          	lw	s3,12(sp)
     6d8:	00812a03          	lw	s4,8(sp)
     6dc:	02010113          	addi	sp,sp,32
     6e0:	00008067          	ret

000006e4 <pqcrystals_dilithium2_ref_polyveck_ntt>:
     6e4:	ff010113          	addi	sp,sp,-16
     6e8:	00912223          	sw	s1,4(sp)
     6ec:	000014b7          	lui	s1,0x1
     6f0:	00812423          	sw	s0,8(sp)
     6f4:	00112623          	sw	ra,12(sp)
     6f8:	00050413          	mv	s0,a0
     6fc:	009504b3          	add	s1,a0,s1
     700:	00040513          	mv	a0,s0
     704:	40040413          	addi	s0,s0,1024
     708:	348000ef          	jal	a50 <pqcrystals_dilithium2_ref_poly_ntt>
     70c:	fe941ae3          	bne	s0,s1,700 <pqcrystals_dilithium2_ref_polyveck_ntt+0x1c>
     710:	00c12083          	lw	ra,12(sp)
     714:	00812403          	lw	s0,8(sp)
     718:	00412483          	lw	s1,4(sp)
     71c:	01010113          	addi	sp,sp,16
     720:	00008067          	ret

00000724 <pqcrystals_dilithium2_ref_polyveck_invntt_tomont>:
     724:	ff010113          	addi	sp,sp,-16
     728:	00912223          	sw	s1,4(sp)
     72c:	000014b7          	lui	s1,0x1
     730:	00812423          	sw	s0,8(sp)
     734:	00112623          	sw	ra,12(sp)
     738:	00050413          	mv	s0,a0
     73c:	009504b3          	add	s1,a0,s1
     740:	00040513          	mv	a0,s0
     744:	40040413          	addi	s0,s0,1024
     748:	30c000ef          	jal	a54 <pqcrystals_dilithium2_ref_poly_invntt_tomont>
     74c:	fe941ae3          	bne	s0,s1,740 <pqcrystals_dilithium2_ref_polyveck_invntt_tomont+0x1c>
     750:	00c12083          	lw	ra,12(sp)
     754:	00812403          	lw	s0,8(sp)
     758:	00412483          	lw	s1,4(sp)
     75c:	01010113          	addi	sp,sp,16
     760:	00008067          	ret

00000764 <pqcrystals_dilithium2_ref_polyveck_pointwise_poly_montgomery>:
     764:	fe010113          	addi	sp,sp,-32
     768:	00812c23          	sw	s0,24(sp)
     76c:	00912a23          	sw	s1,20(sp)
     770:	01212823          	sw	s2,16(sp)
     774:	01312623          	sw	s3,12(sp)
     778:	01412423          	sw	s4,8(sp)
     77c:	00112e23          	sw	ra,28(sp)
     780:	00050a13          	mv	s4,a0
     784:	00058993          	mv	s3,a1
     788:	00060913          	mv	s2,a2
     78c:	00000413          	li	s0,0
     790:	000014b7          	lui	s1,0x1
     794:	00890633          	add	a2,s2,s0
     798:	008a0533          	add	a0,s4,s0
     79c:	00098593          	mv	a1,s3
     7a0:	40040413          	addi	s0,s0,1024
     7a4:	2b4000ef          	jal	a58 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery>
     7a8:	fe9416e3          	bne	s0,s1,794 <pqcrystals_dilithium2_ref_polyveck_pointwise_poly_montgomery+0x30>
     7ac:	01c12083          	lw	ra,28(sp)
     7b0:	01812403          	lw	s0,24(sp)
     7b4:	01412483          	lw	s1,20(sp)
     7b8:	01012903          	lw	s2,16(sp)
     7bc:	00c12983          	lw	s3,12(sp)
     7c0:	00812a03          	lw	s4,8(sp)
     7c4:	02010113          	addi	sp,sp,32
     7c8:	00008067          	ret

000007cc <pqcrystals_dilithium2_ref_polyveck_chknorm>:
     7cc:	ff010113          	addi	sp,sp,-16
     7d0:	00912223          	sw	s1,4(sp)
     7d4:	000014b7          	lui	s1,0x1
     7d8:	00812423          	sw	s0,8(sp)
     7dc:	01212023          	sw	s2,0(sp)
     7e0:	00112623          	sw	ra,12(sp)
     7e4:	00050413          	mv	s0,a0
     7e8:	00058913          	mv	s2,a1
     7ec:	009504b3          	add	s1,a0,s1
     7f0:	00040513          	mv	a0,s0
     7f4:	00090593          	mv	a1,s2
     7f8:	3d4000ef          	jal	bcc <pqcrystals_dilithium2_ref_poly_chknorm>
     7fc:	40040413          	addi	s0,s0,1024
     800:	02051063          	bnez	a0,820 <pqcrystals_dilithium2_ref_polyveck_chknorm+0x54>
     804:	fe9416e3          	bne	s0,s1,7f0 <pqcrystals_dilithium2_ref_polyveck_chknorm+0x24>
     808:	00c12083          	lw	ra,12(sp)
     80c:	00812403          	lw	s0,8(sp)
     810:	00412483          	lw	s1,4(sp)
     814:	00012903          	lw	s2,0(sp)
     818:	01010113          	addi	sp,sp,16
     81c:	00008067          	ret
     820:	00c12083          	lw	ra,12(sp)
     824:	00812403          	lw	s0,8(sp)
     828:	00412483          	lw	s1,4(sp)
     82c:	00012903          	lw	s2,0(sp)
     830:	00100513          	li	a0,1
     834:	01010113          	addi	sp,sp,16
     838:	00008067          	ret

0000083c <pqcrystals_dilithium2_ref_polyveck_decompose>:
     83c:	fe010113          	addi	sp,sp,-32
     840:	00812c23          	sw	s0,24(sp)
     844:	00912a23          	sw	s1,20(sp)
     848:	01212823          	sw	s2,16(sp)
     84c:	01312623          	sw	s3,12(sp)
     850:	01412423          	sw	s4,8(sp)
     854:	00112e23          	sw	ra,28(sp)
     858:	00050a13          	mv	s4,a0
     85c:	00058993          	mv	s3,a1
     860:	00060913          	mv	s2,a2
     864:	00000413          	li	s0,0
     868:	000014b7          	lui	s1,0x1
     86c:	00890633          	add	a2,s2,s0
     870:	008985b3          	add	a1,s3,s0
     874:	008a0533          	add	a0,s4,s0
     878:	40040413          	addi	s0,s0,1024
     87c:	258000ef          	jal	ad4 <pqcrystals_dilithium2_ref_poly_decompose>
     880:	fe9416e3          	bne	s0,s1,86c <pqcrystals_dilithium2_ref_polyveck_decompose+0x30>
     884:	01c12083          	lw	ra,28(sp)
     888:	01812403          	lw	s0,24(sp)
     88c:	01412483          	lw	s1,20(sp)
     890:	01012903          	lw	s2,16(sp)
     894:	00c12983          	lw	s3,12(sp)
     898:	00812a03          	lw	s4,8(sp)
     89c:	02010113          	addi	sp,sp,32
     8a0:	00008067          	ret

000008a4 <pqcrystals_dilithium2_ref_polyveck_make_hint>:
     8a4:	fe010113          	addi	sp,sp,-32
     8a8:	00812c23          	sw	s0,24(sp)
     8ac:	00912a23          	sw	s1,20(sp)
     8b0:	01212823          	sw	s2,16(sp)
     8b4:	01312623          	sw	s3,12(sp)
     8b8:	01412423          	sw	s4,8(sp)
     8bc:	01512223          	sw	s5,4(sp)
     8c0:	00112e23          	sw	ra,28(sp)
     8c4:	00050a93          	mv	s5,a0
     8c8:	00058a13          	mv	s4,a1
     8cc:	00060993          	mv	s3,a2
     8d0:	00000413          	li	s0,0
     8d4:	00000493          	li	s1,0
     8d8:	00001937          	lui	s2,0x1
     8dc:	00898633          	add	a2,s3,s0
     8e0:	008a05b3          	add	a1,s4,s0
     8e4:	008a8533          	add	a0,s5,s0
     8e8:	25c000ef          	jal	b44 <pqcrystals_dilithium2_ref_poly_make_hint>
     8ec:	40040413          	addi	s0,s0,1024
     8f0:	00a484b3          	add	s1,s1,a0
     8f4:	ff2414e3          	bne	s0,s2,8dc <pqcrystals_dilithium2_ref_polyveck_make_hint+0x38>
     8f8:	01c12083          	lw	ra,28(sp)
     8fc:	01812403          	lw	s0,24(sp)
     900:	01012903          	lw	s2,16(sp)
     904:	00c12983          	lw	s3,12(sp)
     908:	00812a03          	lw	s4,8(sp)
     90c:	00412a83          	lw	s5,4(sp)
     910:	00048513          	mv	a0,s1
     914:	01412483          	lw	s1,20(sp)
     918:	02010113          	addi	sp,sp,32
     91c:	00008067          	ret

00000920 <pqcrystals_dilithium2_ref_polyveck_pack_w1>:
     920:	ff010113          	addi	sp,sp,-16
     924:	00812423          	sw	s0,8(sp)
     928:	00912223          	sw	s1,4(sp)
     92c:	01212023          	sw	s2,0(sp)
     930:	00112623          	sw	ra,12(sp)
     934:	00050413          	mv	s0,a0
     938:	00058493          	mv	s1,a1
     93c:	30050913          	addi	s2,a0,768
     940:	00048593          	mv	a1,s1
     944:	00040513          	mv	a0,s0
     948:	0c040413          	addi	s0,s0,192
     94c:	235000ef          	jal	1380 <pqcrystals_dilithium2_ref_polyw1_pack>
     950:	40048493          	addi	s1,s1,1024 # 1400 <pqcrystals_dilithium2_ref_ntt+0x1c>
     954:	ff2416e3          	bne	s0,s2,940 <pqcrystals_dilithium2_ref_polyveck_pack_w1+0x20>
     958:	00c12083          	lw	ra,12(sp)
     95c:	00812403          	lw	s0,8(sp)
     960:	00412483          	lw	s1,4(sp)
     964:	00012903          	lw	s2,0(sp)
     968:	01010113          	addi	sp,sp,16
     96c:	00008067          	ret

00000970 <pqcrystals_dilithium2_ref_poly_reduce>:
     970:	ff010113          	addi	sp,sp,-16
     974:	00812423          	sw	s0,8(sp)
     978:	00912223          	sw	s1,4(sp)
     97c:	00112623          	sw	ra,12(sp)
     980:	00050413          	mv	s0,a0
     984:	40050493          	addi	s1,a0,1024
     988:	00042503          	lw	a0,0(s0)
     98c:	00440413          	addi	s0,s0,4
     990:	591000ef          	jal	1720 <pqcrystals_dilithium2_ref_reduce32>
     994:	fea42e23          	sw	a0,-4(s0)
     998:	fe9418e3          	bne	s0,s1,988 <pqcrystals_dilithium2_ref_poly_reduce+0x18>
     99c:	00c12083          	lw	ra,12(sp)
     9a0:	00812403          	lw	s0,8(sp)
     9a4:	00412483          	lw	s1,4(sp)
     9a8:	01010113          	addi	sp,sp,16
     9ac:	00008067          	ret

000009b0 <pqcrystals_dilithium2_ref_poly_caddq>:
     9b0:	ff010113          	addi	sp,sp,-16
     9b4:	00812423          	sw	s0,8(sp)
     9b8:	00912223          	sw	s1,4(sp)
     9bc:	00112623          	sw	ra,12(sp)
     9c0:	00050413          	mv	s0,a0
     9c4:	40050493          	addi	s1,a0,1024
     9c8:	00042503          	lw	a0,0(s0)
     9cc:	00440413          	addi	s0,s0,4
     9d0:	571000ef          	jal	1740 <pqcrystals_dilithium2_ref_caddq>
     9d4:	fea42e23          	sw	a0,-4(s0)
     9d8:	fe9418e3          	bne	s0,s1,9c8 <pqcrystals_dilithium2_ref_poly_caddq+0x18>
     9dc:	00c12083          	lw	ra,12(sp)
     9e0:	00812403          	lw	s0,8(sp)
     9e4:	00412483          	lw	s1,4(sp)
     9e8:	01010113          	addi	sp,sp,16
     9ec:	00008067          	ret

000009f0 <pqcrystals_dilithium2_ref_poly_add>:
     9f0:	00000793          	li	a5,0
     9f4:	40000893          	li	a7,1024
     9f8:	00f606b3          	add	a3,a2,a5
     9fc:	00f58733          	add	a4,a1,a5
     a00:	0006a803          	lw	a6,0(a3)
     a04:	00072703          	lw	a4,0(a4)
     a08:	00f506b3          	add	a3,a0,a5
     a0c:	00478793          	addi	a5,a5,4 # 1004 <pqcrystals_dilithium2_ref_polyeta_unpack+0xc8>
     a10:	01070733          	add	a4,a4,a6
     a14:	00e6a023          	sw	a4,0(a3)
     a18:	ff1790e3          	bne	a5,a7,9f8 <pqcrystals_dilithium2_ref_poly_add+0x8>
     a1c:	00008067          	ret

00000a20 <pqcrystals_dilithium2_ref_poly_sub>:
     a20:	00000793          	li	a5,0
     a24:	40000893          	li	a7,1024
     a28:	00f606b3          	add	a3,a2,a5
     a2c:	00f58733          	add	a4,a1,a5
     a30:	0006a803          	lw	a6,0(a3)
     a34:	00072703          	lw	a4,0(a4)
     a38:	00f506b3          	add	a3,a0,a5
     a3c:	00478793          	addi	a5,a5,4
     a40:	41070733          	sub	a4,a4,a6
     a44:	00e6a023          	sw	a4,0(a3)
     a48:	ff1790e3          	bne	a5,a7,a28 <pqcrystals_dilithium2_ref_poly_sub+0x8>
     a4c:	00008067          	ret

00000a50 <pqcrystals_dilithium2_ref_poly_ntt>:
     a50:	1950006f          	j	13e4 <pqcrystals_dilithium2_ref_ntt>

00000a54 <pqcrystals_dilithium2_ref_poly_invntt_tomont>:
     a54:	3090006f          	j	155c <pqcrystals_dilithium2_ref_invntt_tomont>

00000a58 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery>:
     a58:	fe010113          	addi	sp,sp,-32
     a5c:	00812c23          	sw	s0,24(sp)
     a60:	00912a23          	sw	s1,20(sp)
     a64:	01212823          	sw	s2,16(sp)
     a68:	01312623          	sw	s3,12(sp)
     a6c:	01412423          	sw	s4,8(sp)
     a70:	00112e23          	sw	ra,28(sp)
     a74:	00050a13          	mv	s4,a0
     a78:	00058993          	mv	s3,a1
     a7c:	00060913          	mv	s2,a2
     a80:	00000413          	li	s0,0
     a84:	40000493          	li	s1,1024
     a88:	00898733          	add	a4,s3,s0
     a8c:	008907b3          	add	a5,s2,s0
     a90:	0007a783          	lw	a5,0(a5)
     a94:	00072503          	lw	a0,0(a4)
     a98:	02f515b3          	mulh	a1,a0,a5
     a9c:	02f50533          	mul	a0,a0,a5
     aa0:	41d000ef          	jal	16bc <pqcrystals_dilithium2_ref_montgomery_reduce>
     aa4:	008a07b3          	add	a5,s4,s0
     aa8:	00a7a023          	sw	a0,0(a5)
     aac:	00440413          	addi	s0,s0,4
     ab0:	fc941ce3          	bne	s0,s1,a88 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery+0x30>
     ab4:	01c12083          	lw	ra,28(sp)
     ab8:	01812403          	lw	s0,24(sp)
     abc:	01412483          	lw	s1,20(sp)
     ac0:	01012903          	lw	s2,16(sp)
     ac4:	00c12983          	lw	s3,12(sp)
     ac8:	00812a03          	lw	s4,8(sp)
     acc:	02010113          	addi	sp,sp,32
     ad0:	00008067          	ret

00000ad4 <pqcrystals_dilithium2_ref_poly_decompose>:
     ad4:	fe010113          	addi	sp,sp,-32
     ad8:	00812c23          	sw	s0,24(sp)
     adc:	00912a23          	sw	s1,20(sp)
     ae0:	01212823          	sw	s2,16(sp)
     ae4:	01312623          	sw	s3,12(sp)
     ae8:	01412423          	sw	s4,8(sp)
     aec:	00112e23          	sw	ra,28(sp)
     af0:	00050a13          	mv	s4,a0
     af4:	00058993          	mv	s3,a1
     af8:	00060913          	mv	s2,a2
     afc:	00000413          	li	s0,0
     b00:	40000493          	li	s1,1024
     b04:	008907b3          	add	a5,s2,s0
     b08:	0007a583          	lw	a1,0(a5)
     b0c:	00898533          	add	a0,s3,s0
     b10:	2d8040ef          	jal	4de8 <pqcrystals_dilithium2_ref_decompose>
     b14:	008a07b3          	add	a5,s4,s0
     b18:	00a7a023          	sw	a0,0(a5)
     b1c:	00440413          	addi	s0,s0,4
     b20:	fe9412e3          	bne	s0,s1,b04 <pqcrystals_dilithium2_ref_poly_decompose+0x30>
     b24:	01c12083          	lw	ra,28(sp)
     b28:	01812403          	lw	s0,24(sp)
     b2c:	01412483          	lw	s1,20(sp)
     b30:	01012903          	lw	s2,16(sp)
     b34:	00c12983          	lw	s3,12(sp)
     b38:	00812a03          	lw	s4,8(sp)
     b3c:	02010113          	addi	sp,sp,32
     b40:	00008067          	ret

00000b44 <pqcrystals_dilithium2_ref_poly_make_hint>:
     b44:	fe010113          	addi	sp,sp,-32
     b48:	00812c23          	sw	s0,24(sp)
     b4c:	00912a23          	sw	s1,20(sp)
     b50:	01212823          	sw	s2,16(sp)
     b54:	01312623          	sw	s3,12(sp)
     b58:	01412423          	sw	s4,8(sp)
     b5c:	01512223          	sw	s5,4(sp)
     b60:	00112e23          	sw	ra,28(sp)
     b64:	00050a93          	mv	s5,a0
     b68:	00058a13          	mv	s4,a1
     b6c:	00060993          	mv	s3,a2
     b70:	00000413          	li	s0,0
     b74:	00000493          	li	s1,0
     b78:	40000913          	li	s2,1024
     b7c:	008a07b3          	add	a5,s4,s0
     b80:	00898733          	add	a4,s3,s0
     b84:	0007a503          	lw	a0,0(a5)
     b88:	00072583          	lw	a1,0(a4)
     b8c:	2c8040ef          	jal	4e54 <pqcrystals_dilithium2_ref_make_hint>
     b90:	008a87b3          	add	a5,s5,s0
     b94:	00a7a023          	sw	a0,0(a5)
     b98:	00440413          	addi	s0,s0,4
     b9c:	00a484b3          	add	s1,s1,a0
     ba0:	fd241ee3          	bne	s0,s2,b7c <pqcrystals_dilithium2_ref_poly_make_hint+0x38>
     ba4:	01c12083          	lw	ra,28(sp)
     ba8:	01812403          	lw	s0,24(sp)
     bac:	01012903          	lw	s2,16(sp)
     bb0:	00c12983          	lw	s3,12(sp)
     bb4:	00812a03          	lw	s4,8(sp)
     bb8:	00412a83          	lw	s5,4(sp)
     bbc:	00048513          	mv	a0,s1
     bc0:	01412483          	lw	s1,20(sp)
     bc4:	02010113          	addi	sp,sp,32
     bc8:	00008067          	ret

00000bcc <pqcrystals_dilithium2_ref_poly_chknorm>:
     bcc:	001007b7          	lui	a5,0x100
     bd0:	c0078793          	addi	a5,a5,-1024 # ffc00 <__stack_top+0xdfc04>
     bd4:	02b7c663          	blt	a5,a1,c00 <pqcrystals_dilithium2_ref_poly_chknorm+0x34>
     bd8:	40050613          	addi	a2,a0,1024
     bdc:	0080006f          	j	be4 <pqcrystals_dilithium2_ref_poly_chknorm+0x18>
     be0:	02a60463          	beq	a2,a0,c08 <pqcrystals_dilithium2_ref_poly_chknorm+0x3c>
     be4:	00052783          	lw	a5,0(a0)
     be8:	00450513          	addi	a0,a0,4
     bec:	00179713          	slli	a4,a5,0x1
     bf0:	41f7d693          	srai	a3,a5,0x1f
     bf4:	00d77733          	and	a4,a4,a3
     bf8:	40e787b3          	sub	a5,a5,a4
     bfc:	feb7c2e3          	blt	a5,a1,be0 <pqcrystals_dilithium2_ref_poly_chknorm+0x14>
     c00:	00100513          	li	a0,1
     c04:	00008067          	ret
     c08:	00000513          	li	a0,0
     c0c:	00008067          	ret

00000c10 <pqcrystals_dilithium2_ref_poly_uniform>:
     c10:	bb010113          	addi	sp,sp,-1104
     c14:	43312e23          	sw	s3,1084(sp)
     c18:	00050993          	mv	s3,a0
     c1c:	00010513          	mv	a0,sp
     c20:	44112623          	sw	ra,1100(sp)
     c24:	45212023          	sw	s2,1088(sp)
     c28:	43612823          	sw	s6,1072(sp)
     c2c:	268040ef          	jal	4e94 <pqcrystals_dilithium2_ref_dilithium_shake128_stream_init>
     c30:	0d410b13          	addi	s6,sp,212
     c34:	000b0513          	mv	a0,s6
     c38:	00500593          	li	a1,5
     c3c:	00010613          	mv	a2,sp
     c40:	65c030ef          	jal	429c <pqcrystals_fips202_ref_shake128_squeezeblocks>
     c44:	008005b7          	lui	a1,0x800
     c48:	41c10813          	addi	a6,sp,1052
     c4c:	000b0713          	mv	a4,s6
     c50:	fff58593          	addi	a1,a1,-1 # 7fffff <__stack_top+0x7e0003>
     c54:	00000913          	li	s2,0
     c58:	007fe537          	lui	a0,0x7fe
     c5c:	10000893          	li	a7,256
     c60:	00174783          	lbu	a5,1(a4)
     c64:	00274683          	lbu	a3,2(a4)
     c68:	00074603          	lbu	a2,0(a4)
     c6c:	00879793          	slli	a5,a5,0x8
     c70:	01069693          	slli	a3,a3,0x10
     c74:	00d7e7b3          	or	a5,a5,a3
     c78:	00c7e7b3          	or	a5,a5,a2
     c7c:	00291693          	slli	a3,s2,0x2
     c80:	00b7f7b3          	and	a5,a5,a1
     c84:	00d986b3          	add	a3,s3,a3
     c88:	00370713          	addi	a4,a4,3
     c8c:	00190613          	addi	a2,s2,1 # 1001 <pqcrystals_dilithium2_ref_polyeta_unpack+0xc5>
     c90:	00f56863          	bltu	a0,a5,ca0 <pqcrystals_dilithium2_ref_poly_uniform+0x90>
     c94:	00f6a023          	sw	a5,0(a3)
     c98:	11160463          	beq	a2,a7,da0 <pqcrystals_dilithium2_ref_poly_uniform+0x190>
     c9c:	00060913          	mv	s2,a2
     ca0:	fce810e3          	bne	a6,a4,c60 <pqcrystals_dilithium2_ref_poly_uniform+0x50>
     ca4:	44812423          	sw	s0,1096(sp)
     ca8:	43412c23          	sw	s4,1080(sp)
     cac:	43512a23          	sw	s5,1076(sp)
     cb0:	aaaab437          	lui	s0,0xaaaab
     cb4:	00800ab7          	lui	s5,0x800
     cb8:	00300a13          	li	s4,3
     cbc:	44912223          	sw	s1,1092(sp)
     cc0:	43712623          	sw	s7,1068(sp)
     cc4:	aab40413          	addi	s0,s0,-1365 # aaaaaaab <__stack_top+0xaaa8aaaf>
     cc8:	fffa8a93          	addi	s5,s5,-1 # 7fffff <__stack_top+0x7e0003>
     ccc:	416a0a33          	sub	s4,s4,s6
     cd0:	34800513          	li	a0,840
     cd4:	00200493          	li	s1,2
     cd8:	028537b3          	mulhu	a5,a0,s0
     cdc:	0017db93          	srli	s7,a5,0x1
     ce0:	ffe7f793          	andi	a5,a5,-2
     ce4:	017787b3          	add	a5,a5,s7
     ce8:	40f50bb3          	sub	s7,a0,a5
     cec:	02f50263          	beq	a0,a5,d10 <pqcrystals_dilithium2_ref_poly_uniform+0x100>
     cf0:	41750533          	sub	a0,a0,s7
     cf4:	42050793          	addi	a5,a0,1056 # 7fe420 <__stack_top+0x7de424>
     cf8:	00278533          	add	a0,a5,sp
     cfc:	cb454783          	lbu	a5,-844(a0)
     d00:	0cf10a23          	sb	a5,212(sp)
     d04:	009b9663          	bne	s7,s1,d10 <pqcrystals_dilithium2_ref_poly_uniform+0x100>
     d08:	cb554783          	lbu	a5,-843(a0)
     d0c:	0cf10aa3          	sb	a5,213(sp)
     d10:	00010613          	mv	a2,sp
     d14:	017b0533          	add	a0,s6,s7
     d18:	00100593          	li	a1,1
     d1c:	580030ef          	jal	429c <pqcrystals_fips202_ref_shake128_squeezeblocks>
     d20:	10000813          	li	a6,256
     d24:	0a8b8513          	addi	a0,s7,168
     d28:	41280833          	sub	a6,a6,s2
     d2c:	000b0693          	mv	a3,s6
     d30:	00000613          	li	a2,0
     d34:	007fe8b7          	lui	a7,0x7fe
     d38:	0016c783          	lbu	a5,1(a3)
     d3c:	0026c703          	lbu	a4,2(a3)
     d40:	0006c583          	lbu	a1,0(a3)
     d44:	00879793          	slli	a5,a5,0x8
     d48:	01071713          	slli	a4,a4,0x10
     d4c:	00e7e7b3          	or	a5,a5,a4
     d50:	00b7e7b3          	or	a5,a5,a1
     d54:	00c90733          	add	a4,s2,a2
     d58:	00368693          	addi	a3,a3,3
     d5c:	00271713          	slli	a4,a4,0x2
     d60:	0157f7b3          	and	a5,a5,s5
     d64:	00da05b3          	add	a1,s4,a3
     d68:	00e98733          	add	a4,s3,a4
     d6c:	00f8e663          	bltu	a7,a5,d78 <pqcrystals_dilithium2_ref_poly_uniform+0x168>
     d70:	00160613          	addi	a2,a2,1
     d74:	00f72023          	sw	a5,0(a4)
     d78:	01067463          	bgeu	a2,a6,d80 <pqcrystals_dilithium2_ref_poly_uniform+0x170>
     d7c:	fab57ee3          	bgeu	a0,a1,d38 <pqcrystals_dilithium2_ref_poly_uniform+0x128>
     d80:	00c90933          	add	s2,s2,a2
     d84:	0ff00793          	li	a5,255
     d88:	f527f8e3          	bgeu	a5,s2,cd8 <pqcrystals_dilithium2_ref_poly_uniform+0xc8>
     d8c:	44812403          	lw	s0,1096(sp)
     d90:	44412483          	lw	s1,1092(sp)
     d94:	43812a03          	lw	s4,1080(sp)
     d98:	43412a83          	lw	s5,1076(sp)
     d9c:	42c12b83          	lw	s7,1068(sp)
     da0:	44c12083          	lw	ra,1100(sp)
     da4:	44012903          	lw	s2,1088(sp)
     da8:	43c12983          	lw	s3,1084(sp)
     dac:	43012b03          	lw	s6,1072(sp)
     db0:	45010113          	addi	sp,sp,1104
     db4:	00008067          	ret

00000db8 <pqcrystals_dilithium2_ref_poly_challenge>:
     db8:	e7010113          	addi	sp,sp,-400
     dbc:	17412c23          	sw	s4,376(sp)
     dc0:	00050a13          	mv	s4,a0
     dc4:	09010513          	addi	a0,sp,144
     dc8:	18112623          	sw	ra,396(sp)
     dcc:	18812423          	sw	s0,392(sp)
     dd0:	18912223          	sw	s1,388(sp)
     dd4:	00058413          	mv	s0,a1
     dd8:	19212023          	sw	s2,384(sp)
     ddc:	17312e23          	sw	s3,380(sp)
     de0:	17512a23          	sw	s5,372(sp)
     de4:	17612823          	sw	s6,368(sp)
     de8:	17712623          	sw	s7,364(sp)
     dec:	57c030ef          	jal	4368 <pqcrystals_fips202_ref_shake256_init>
     df0:	00040593          	mv	a1,s0
     df4:	02000613          	li	a2,32
     df8:	09010513          	addi	a0,sp,144
     dfc:	590030ef          	jal	438c <pqcrystals_fips202_ref_shake256_absorb>
     e00:	09010513          	addi	a0,sp,144
     e04:	5c0030ef          	jal	43c4 <pqcrystals_fips202_ref_shake256_finalize>
     e08:	00810513          	addi	a0,sp,8
     e0c:	09010613          	addi	a2,sp,144
     e10:	00100593          	li	a1,1
     e14:	620030ef          	jal	4434 <pqcrystals_fips202_ref_shake256_squeezeblocks>
     e18:	00a14783          	lbu	a5,10(sp)
     e1c:	00914603          	lbu	a2,9(sp)
     e20:	00d14683          	lbu	a3,13(sp)
     e24:	00c14503          	lbu	a0,12(sp)
     e28:	00e14703          	lbu	a4,14(sp)
     e2c:	00814583          	lbu	a1,8(sp)
     e30:	00b14483          	lbu	s1,11(sp)
     e34:	00f14903          	lbu	s2,15(sp)
     e38:	00861613          	slli	a2,a2,0x8
     e3c:	01079793          	slli	a5,a5,0x10
     e40:	00869693          	slli	a3,a3,0x8
     e44:	00a6e6b3          	or	a3,a3,a0
     e48:	00c7e7b3          	or	a5,a5,a2
     e4c:	01071713          	slli	a4,a4,0x10
     e50:	00b7e7b3          	or	a5,a5,a1
     e54:	00d76733          	or	a4,a4,a3
     e58:	01849493          	slli	s1,s1,0x18
     e5c:	01891913          	slli	s2,s2,0x18
     e60:	000a0513          	mv	a0,s4
     e64:	40000613          	li	a2,1024
     e68:	00000593          	li	a1,0
     e6c:	00f4e4b3          	or	s1,s1,a5
     e70:	00e96933          	or	s2,s2,a4
     e74:	17c040ef          	jal	4ff0 <memset>
     e78:	364a0993          	addi	s3,s4,868
     e7c:	00800793          	li	a5,8
     e80:	0d900413          	li	s0,217
     e84:	08800b93          	li	s7,136
     e88:	00100b13          	li	s6,1
     e8c:	10000a93          	li	s5,256
     e90:	07778e63          	beq	a5,s7,f0c <pqcrystals_dilithium2_ref_poly_challenge+0x154>
     e94:	00278733          	add	a4,a5,sp
     e98:	00874703          	lbu	a4,8(a4)
     e9c:	00178793          	addi	a5,a5,1
     ea0:	fee468e3          	bltu	s0,a4,e90 <pqcrystals_dilithium2_ref_poly_challenge+0xd8>
     ea4:	00271713          	slli	a4,a4,0x2
     ea8:	00ea0733          	add	a4,s4,a4
     eac:	00072603          	lw	a2,0(a4)
     eb0:	0014f693          	andi	a3,s1,1
     eb4:	00169693          	slli	a3,a3,0x1
     eb8:	00c9a023          	sw	a2,0(s3)
     ebc:	40db06b3          	sub	a3,s6,a3
     ec0:	00d72023          	sw	a3,0(a4)
     ec4:	0014d493          	srli	s1,s1,0x1
     ec8:	01f91713          	slli	a4,s2,0x1f
     ecc:	00140413          	addi	s0,s0,1
     ed0:	00498993          	addi	s3,s3,4
     ed4:	009704b3          	add	s1,a4,s1
     ed8:	00195913          	srli	s2,s2,0x1
     edc:	fb541ae3          	bne	s0,s5,e90 <pqcrystals_dilithium2_ref_poly_challenge+0xd8>
     ee0:	18c12083          	lw	ra,396(sp)
     ee4:	18812403          	lw	s0,392(sp)
     ee8:	18412483          	lw	s1,388(sp)
     eec:	18012903          	lw	s2,384(sp)
     ef0:	17c12983          	lw	s3,380(sp)
     ef4:	17812a03          	lw	s4,376(sp)
     ef8:	17412a83          	lw	s5,372(sp)
     efc:	17012b03          	lw	s6,368(sp)
     f00:	16c12b83          	lw	s7,364(sp)
     f04:	19010113          	addi	sp,sp,400
     f08:	00008067          	ret
     f0c:	09010613          	addi	a2,sp,144
     f10:	00100593          	li	a1,1
     f14:	00810513          	addi	a0,sp,8
     f18:	51c030ef          	jal	4434 <pqcrystals_fips202_ref_shake256_squeezeblocks>
     f1c:	00814703          	lbu	a4,8(sp)
     f20:	00200793          	li	a5,2
     f24:	00e47863          	bgeu	s0,a4,f34 <pqcrystals_dilithium2_ref_poly_challenge+0x17c>
     f28:	00914703          	lbu	a4,9(sp)
     f2c:	f6e464e3          	bltu	s0,a4,e94 <pqcrystals_dilithium2_ref_poly_challenge+0xdc>
     f30:	f75ff06f          	j	ea4 <pqcrystals_dilithium2_ref_poly_challenge+0xec>
     f34:	00100793          	li	a5,1
     f38:	f6dff06f          	j	ea4 <pqcrystals_dilithium2_ref_poly_challenge+0xec>

00000f3c <pqcrystals_dilithium2_ref_polyeta_unpack>:
     f3c:	40050e93          	addi	t4,a0,1024
     f40:	00200313          	li	t1,2
     f44:	0005ce03          	lbu	t3,0(a1)
     f48:	02050513          	addi	a0,a0,32
     f4c:	00358593          	addi	a1,a1,3
     f50:	007e7e13          	andi	t3,t3,7
     f54:	ffc52023          	sw	t3,-32(a0)
     f58:	ffd5c883          	lbu	a7,-3(a1)
     f5c:	41c30e33          	sub	t3,t1,t3
     f60:	0038d893          	srli	a7,a7,0x3
     f64:	0078f893          	andi	a7,a7,7
     f68:	ff152223          	sw	a7,-28(a0)
     f6c:	ffd5c703          	lbu	a4,-3(a1)
     f70:	ffe5c783          	lbu	a5,-2(a1)
     f74:	411308b3          	sub	a7,t1,a7
     f78:	00675713          	srli	a4,a4,0x6
     f7c:	00279793          	slli	a5,a5,0x2
     f80:	00f76733          	or	a4,a4,a5
     f84:	00777713          	andi	a4,a4,7
     f88:	fee52423          	sw	a4,-24(a0)
     f8c:	ffe5c783          	lbu	a5,-2(a1)
     f90:	40e30833          	sub	a6,t1,a4
     f94:	0017d793          	srli	a5,a5,0x1
     f98:	0077f793          	andi	a5,a5,7
     f9c:	fef52623          	sw	a5,-20(a0)
     fa0:	ffe5c683          	lbu	a3,-2(a1)
     fa4:	40f30733          	sub	a4,t1,a5
     fa8:	0046d693          	srli	a3,a3,0x4
     fac:	0076f693          	andi	a3,a3,7
     fb0:	fed52823          	sw	a3,-16(a0)
     fb4:	ffe5c783          	lbu	a5,-2(a1)
     fb8:	fff5c603          	lbu	a2,-1(a1)
     fbc:	40d306b3          	sub	a3,t1,a3
     fc0:	0077d793          	srli	a5,a5,0x7
     fc4:	00161613          	slli	a2,a2,0x1
     fc8:	00c7e7b3          	or	a5,a5,a2
     fcc:	0077f793          	andi	a5,a5,7
     fd0:	fef52a23          	sw	a5,-12(a0)
     fd4:	fff5c603          	lbu	a2,-1(a1)
     fd8:	40f307b3          	sub	a5,t1,a5
     fdc:	00265613          	srli	a2,a2,0x2
     fe0:	00767613          	andi	a2,a2,7
     fe4:	fec52c23          	sw	a2,-8(a0)
     fe8:	fff5cf03          	lbu	t5,-1(a1)
     fec:	ffc52023          	sw	t3,-32(a0)
     ff0:	40c30633          	sub	a2,t1,a2
     ff4:	005f5e13          	srli	t3,t5,0x5
     ff8:	41c30e33          	sub	t3,t1,t3
     ffc:	ffc52e23          	sw	t3,-4(a0)
    1000:	fec52c23          	sw	a2,-8(a0)
    1004:	fef52a23          	sw	a5,-12(a0)
    1008:	fed52823          	sw	a3,-16(a0)
    100c:	fee52623          	sw	a4,-20(a0)
    1010:	ff052423          	sw	a6,-24(a0)
    1014:	ff152223          	sw	a7,-28(a0)
    1018:	f3d516e3          	bne	a0,t4,f44 <pqcrystals_dilithium2_ref_polyeta_unpack+0x8>
    101c:	00008067          	ret

00001020 <pqcrystals_dilithium2_ref_polyt0_unpack>:
    1020:	00002eb7          	lui	t4,0x2
    1024:	1a058f13          	addi	t5,a1,416
    1028:	fffe8e93          	addi	t4,t4,-1 # 1fff <KeccakF1600_StatePermute+0x8a7>
    102c:	00001e37          	lui	t3,0x1
    1030:	0005c783          	lbu	a5,0(a1)
    1034:	00d58593          	addi	a1,a1,13
    1038:	02050513          	addi	a0,a0,32
    103c:	fef52023          	sw	a5,-32(a0)
    1040:	ff45c303          	lbu	t1,-12(a1)
    1044:	00831313          	slli	t1,t1,0x8
    1048:	00f36333          	or	t1,t1,a5
    104c:	01d37333          	and	t1,t1,t4
    1050:	fe652023          	sw	t1,-32(a0)
    1054:	ff45c783          	lbu	a5,-12(a1)
    1058:	406e0333          	sub	t1,t3,t1
    105c:	0057d793          	srli	a5,a5,0x5
    1060:	fef52223          	sw	a5,-28(a0)
    1064:	ff55c703          	lbu	a4,-11(a1)
    1068:	00371713          	slli	a4,a4,0x3
    106c:	00f76733          	or	a4,a4,a5
    1070:	fee52223          	sw	a4,-28(a0)
    1074:	ff65c783          	lbu	a5,-10(a1)
    1078:	00b79793          	slli	a5,a5,0xb
    107c:	00e7e7b3          	or	a5,a5,a4
    1080:	01d7f7b3          	and	a5,a5,t4
    1084:	fef52223          	sw	a5,-28(a0)
    1088:	ff65c683          	lbu	a3,-10(a1)
    108c:	40fe07b3          	sub	a5,t3,a5
    1090:	0026d693          	srli	a3,a3,0x2
    1094:	fed52423          	sw	a3,-24(a0)
    1098:	ff75c703          	lbu	a4,-9(a1)
    109c:	00671713          	slli	a4,a4,0x6
    10a0:	00d76733          	or	a4,a4,a3
    10a4:	01d77733          	and	a4,a4,t4
    10a8:	fee52423          	sw	a4,-24(a0)
    10ac:	ff75c683          	lbu	a3,-9(a1)
    10b0:	40ee0733          	sub	a4,t3,a4
    10b4:	0076d693          	srli	a3,a3,0x7
    10b8:	fed52623          	sw	a3,-20(a0)
    10bc:	ff85c603          	lbu	a2,-8(a1)
    10c0:	00161613          	slli	a2,a2,0x1
    10c4:	00d66633          	or	a2,a2,a3
    10c8:	fec52623          	sw	a2,-20(a0)
    10cc:	ff95c683          	lbu	a3,-7(a1)
    10d0:	00969693          	slli	a3,a3,0x9
    10d4:	00c6e6b3          	or	a3,a3,a2
    10d8:	01d6f6b3          	and	a3,a3,t4
    10dc:	fed52623          	sw	a3,-20(a0)
    10e0:	ff95c603          	lbu	a2,-7(a1)
    10e4:	40de08b3          	sub	a7,t3,a3
    10e8:	00465693          	srli	a3,a2,0x4
    10ec:	fed52823          	sw	a3,-16(a0)
    10f0:	ffa5c603          	lbu	a2,-6(a1)
    10f4:	00461613          	slli	a2,a2,0x4
    10f8:	00d66633          	or	a2,a2,a3
    10fc:	fec52823          	sw	a2,-16(a0)
    1100:	ffb5c683          	lbu	a3,-5(a1)
    1104:	00c69693          	slli	a3,a3,0xc
    1108:	00c6e6b3          	or	a3,a3,a2
    110c:	01d6f6b3          	and	a3,a3,t4
    1110:	fed52823          	sw	a3,-16(a0)
    1114:	ffb5c603          	lbu	a2,-5(a1)
    1118:	40de0833          	sub	a6,t3,a3
    111c:	00165613          	srli	a2,a2,0x1
    1120:	fec52a23          	sw	a2,-12(a0)
    1124:	ffc5c683          	lbu	a3,-4(a1)
    1128:	00769693          	slli	a3,a3,0x7
    112c:	00c6e6b3          	or	a3,a3,a2
    1130:	01d6f6b3          	and	a3,a3,t4
    1134:	fed52a23          	sw	a3,-12(a0)
    1138:	ffc5c603          	lbu	a2,-4(a1)
    113c:	40de06b3          	sub	a3,t3,a3
    1140:	00665613          	srli	a2,a2,0x6
    1144:	fec52c23          	sw	a2,-8(a0)
    1148:	ffd5cf83          	lbu	t6,-3(a1)
    114c:	002f9f93          	slli	t6,t6,0x2
    1150:	00cfefb3          	or	t6,t6,a2
    1154:	fff52c23          	sw	t6,-8(a0)
    1158:	ffe5c603          	lbu	a2,-2(a1)
    115c:	00a61613          	slli	a2,a2,0xa
    1160:	01f66633          	or	a2,a2,t6
    1164:	01d67633          	and	a2,a2,t4
    1168:	fec52c23          	sw	a2,-8(a0)
    116c:	ffe5c283          	lbu	t0,-2(a1)
    1170:	40ce0633          	sub	a2,t3,a2
    1174:	0032d293          	srli	t0,t0,0x3
    1178:	fe552e23          	sw	t0,-4(a0)
    117c:	fff5cf83          	lbu	t6,-1(a1)
    1180:	fec52c23          	sw	a2,-8(a0)
    1184:	fe652023          	sw	t1,-32(a0)
    1188:	005f9613          	slli	a2,t6,0x5
    118c:	00566633          	or	a2,a2,t0
    1190:	40ce0633          	sub	a2,t3,a2
    1194:	fec52e23          	sw	a2,-4(a0)
    1198:	fed52a23          	sw	a3,-12(a0)
    119c:	ff052823          	sw	a6,-16(a0)
    11a0:	ff152623          	sw	a7,-20(a0)
    11a4:	fee52423          	sw	a4,-24(a0)
    11a8:	fef52223          	sw	a5,-28(a0)
    11ac:	e8bf12e3          	bne	t5,a1,1030 <pqcrystals_dilithium2_ref_polyt0_unpack+0x10>
    11b0:	00008067          	ret

000011b4 <pqcrystals_dilithium2_ref_polyz_pack>:
    11b4:	24050293          	addi	t0,a0,576
    11b8:	00020837          	lui	a6,0x20
    11bc:	0005a603          	lw	a2,0(a1)
    11c0:	0045a683          	lw	a3,4(a1)
    11c4:	0085a703          	lw	a4,8(a1)
    11c8:	00c5a783          	lw	a5,12(a1)
    11cc:	40c80633          	sub	a2,a6,a2
    11d0:	40d806b3          	sub	a3,a6,a3
    11d4:	40e80733          	sub	a4,a6,a4
    11d8:	40f807b3          	sub	a5,a6,a5
    11dc:	00269f13          	slli	t5,a3,0x2
    11e0:	00679e93          	slli	t4,a5,0x6
    11e4:	00e6d313          	srli	t1,a3,0xe
    11e8:	00471f93          	slli	t6,a4,0x4
    11ec:	00c75893          	srli	a7,a4,0xc
    11f0:	01065e13          	srli	t3,a2,0x10
    11f4:	01ee6e33          	or	t3,t3,t5
    11f8:	01d8e8b3          	or	a7,a7,t4
    11fc:	00865f13          	srli	t5,a2,0x8
    1200:	0027de93          	srli	t4,a5,0x2
    1204:	0066d693          	srli	a3,a3,0x6
    1208:	01f36333          	or	t1,t1,t6
    120c:	00475713          	srli	a4,a4,0x4
    1210:	00a7d793          	srli	a5,a5,0xa
    1214:	01c50123          	sb	t3,2(a0)
    1218:	00c50023          	sb	a2,0(a0)
    121c:	01e500a3          	sb	t5,1(a0)
    1220:	00d501a3          	sb	a3,3(a0)
    1224:	00650223          	sb	t1,4(a0)
    1228:	00e502a3          	sb	a4,5(a0)
    122c:	01150323          	sb	a7,6(a0)
    1230:	01d503a3          	sb	t4,7(a0)
    1234:	00f50423          	sb	a5,8(a0)
    1238:	00950513          	addi	a0,a0,9
    123c:	01058593          	addi	a1,a1,16
    1240:	f6a29ee3          	bne	t0,a0,11bc <pqcrystals_dilithium2_ref_polyz_pack+0x8>
    1244:	00008067          	ret

00001248 <pqcrystals_dilithium2_ref_polyz_unpack>:
    1248:	00040337          	lui	t1,0x40
    124c:	24058e13          	addi	t3,a1,576
    1250:	fff30313          	addi	t1,t1,-1 # 3ffff <__stack_top+0x20003>
    1254:	000208b7          	lui	a7,0x20
    1258:	0005c783          	lbu	a5,0(a1)
    125c:	00958593          	addi	a1,a1,9
    1260:	01050513          	addi	a0,a0,16
    1264:	fef52823          	sw	a5,-16(a0)
    1268:	ff85c703          	lbu	a4,-8(a1)
    126c:	00871713          	slli	a4,a4,0x8
    1270:	00f76733          	or	a4,a4,a5
    1274:	fee52823          	sw	a4,-16(a0)
    1278:	ff95c783          	lbu	a5,-7(a1)
    127c:	01079793          	slli	a5,a5,0x10
    1280:	00e7e7b3          	or	a5,a5,a4
    1284:	0067f7b3          	and	a5,a5,t1
    1288:	fef52823          	sw	a5,-16(a0)
    128c:	ff95c703          	lbu	a4,-7(a1)
    1290:	40f886b3          	sub	a3,a7,a5
    1294:	00275793          	srli	a5,a4,0x2
    1298:	fef52a23          	sw	a5,-12(a0)
    129c:	ffa5c703          	lbu	a4,-6(a1)
    12a0:	00671713          	slli	a4,a4,0x6
    12a4:	00f76733          	or	a4,a4,a5
    12a8:	fee52a23          	sw	a4,-12(a0)
    12ac:	ffb5c783          	lbu	a5,-5(a1)
    12b0:	00e79793          	slli	a5,a5,0xe
    12b4:	00e7e7b3          	or	a5,a5,a4
    12b8:	0067f7b3          	and	a5,a5,t1
    12bc:	fef52a23          	sw	a5,-12(a0)
    12c0:	ffb5c703          	lbu	a4,-5(a1)
    12c4:	40f887b3          	sub	a5,a7,a5
    12c8:	00475713          	srli	a4,a4,0x4
    12cc:	fee52c23          	sw	a4,-8(a0)
    12d0:	ffc5c603          	lbu	a2,-4(a1)
    12d4:	00461613          	slli	a2,a2,0x4
    12d8:	00e66633          	or	a2,a2,a4
    12dc:	fec52c23          	sw	a2,-8(a0)
    12e0:	ffd5c703          	lbu	a4,-3(a1)
    12e4:	00c71713          	slli	a4,a4,0xc
    12e8:	00c76733          	or	a4,a4,a2
    12ec:	00677733          	and	a4,a4,t1
    12f0:	fee52c23          	sw	a4,-8(a0)
    12f4:	ffd5c603          	lbu	a2,-3(a1)
    12f8:	40e88733          	sub	a4,a7,a4
    12fc:	00665613          	srli	a2,a2,0x6
    1300:	fec52e23          	sw	a2,-4(a0)
    1304:	ffe5c803          	lbu	a6,-2(a1)
    1308:	00281813          	slli	a6,a6,0x2
    130c:	00c86833          	or	a6,a6,a2
    1310:	ff052e23          	sw	a6,-4(a0)
    1314:	fff5c603          	lbu	a2,-1(a1)
    1318:	fee52c23          	sw	a4,-8(a0)
    131c:	fed52823          	sw	a3,-16(a0)
    1320:	00a61713          	slli	a4,a2,0xa
    1324:	01076733          	or	a4,a4,a6
    1328:	40e88733          	sub	a4,a7,a4
    132c:	fee52e23          	sw	a4,-4(a0)
    1330:	fef52a23          	sw	a5,-12(a0)
    1334:	f3c592e3          	bne	a1,t3,1258 <pqcrystals_dilithium2_ref_polyz_unpack+0x10>
    1338:	00008067          	ret

0000133c <pqcrystals_dilithium2_ref_poly_uniform_gamma1>:
    133c:	c7010113          	addi	sp,sp,-912
    1340:	38812423          	sw	s0,904(sp)
    1344:	00050413          	mv	s0,a0
    1348:	00810513          	addi	a0,sp,8
    134c:	38112623          	sw	ra,908(sp)
    1350:	399030ef          	jal	4ee8 <pqcrystals_dilithium2_ref_dilithium_shake256_stream_init>
    1354:	00810613          	addi	a2,sp,8
    1358:	0d810513          	addi	a0,sp,216
    135c:	00500593          	li	a1,5
    1360:	0d4030ef          	jal	4434 <pqcrystals_fips202_ref_shake256_squeezeblocks>
    1364:	0d810593          	addi	a1,sp,216
    1368:	00040513          	mv	a0,s0
    136c:	eddff0ef          	jal	1248 <pqcrystals_dilithium2_ref_polyz_unpack>
    1370:	38c12083          	lw	ra,908(sp)
    1374:	38812403          	lw	s0,904(sp)
    1378:	39010113          	addi	sp,sp,912
    137c:	00008067          	ret

00001380 <pqcrystals_dilithium2_ref_polyw1_pack>:
    1380:	0c050693          	addi	a3,a0,192
    1384:	0005a783          	lw	a5,0(a1)
    1388:	00350513          	addi	a0,a0,3
    138c:	01058593          	addi	a1,a1,16
    1390:	fef50ea3          	sb	a5,-3(a0)
    1394:	ff45a703          	lw	a4,-12(a1)
    1398:	00671713          	slli	a4,a4,0x6
    139c:	00e7e7b3          	or	a5,a5,a4
    13a0:	fef50ea3          	sb	a5,-3(a0)
    13a4:	ff45a783          	lw	a5,-12(a1)
    13a8:	4027d793          	srai	a5,a5,0x2
    13ac:	fef50f23          	sb	a5,-2(a0)
    13b0:	ff85a703          	lw	a4,-8(a1)
    13b4:	00471713          	slli	a4,a4,0x4
    13b8:	00e7e7b3          	or	a5,a5,a4
    13bc:	fef50f23          	sb	a5,-2(a0)
    13c0:	ff85a783          	lw	a5,-8(a1)
    13c4:	4047d793          	srai	a5,a5,0x4
    13c8:	fef50fa3          	sb	a5,-1(a0)
    13cc:	ffc5a703          	lw	a4,-4(a1)
    13d0:	00271713          	slli	a4,a4,0x2
    13d4:	00e7e7b3          	or	a5,a5,a4
    13d8:	fef50fa3          	sb	a5,-1(a0)
    13dc:	fad514e3          	bne	a0,a3,1384 <pqcrystals_dilithium2_ref_polyw1_pack+0x4>
    13e0:	00008067          	ret

000013e4 <pqcrystals_dilithium2_ref_ntt>:
    13e4:	000057b7          	lui	a5,0x5
    13e8:	fb010113          	addi	sp,sp,-80
    13ec:	1f878793          	addi	a5,a5,504 # 51f8 <zetas>
    13f0:	00005737          	lui	a4,0x5
    13f4:	00f12623          	sw	a5,12(sp)
    13f8:	20070793          	addi	a5,a4,512 # 5200 <zetas+0x8>
    13fc:	01b12e23          	sw	s11,28(sp)
    1400:	00f12423          	sw	a5,8(sp)
    1404:	00006db7          	lui	s11,0x6
    1408:	00800793          	li	a5,8
    140c:	03312e23          	sw	s3,60(sp)
    1410:	03412c23          	sw	s4,56(sp)
    1414:	03612823          	sw	s6,48(sp)
    1418:	04112623          	sw	ra,76(sp)
    141c:	04812423          	sw	s0,72(sp)
    1420:	04912223          	sw	s1,68(sp)
    1424:	05212023          	sw	s2,64(sp)
    1428:	03512a23          	sw	s5,52(sp)
    142c:	03712623          	sw	s7,44(sp)
    1430:	03812423          	sw	s8,40(sp)
    1434:	03912223          	sw	s9,36(sp)
    1438:	03a12023          	sw	s10,32(sp)
    143c:	00050a13          	mv	s4,a0
    1440:	4f7d8d93          	addi	s11,s11,1271 # 64f7 <__SDATA_BEGIN__+0x4f7>
    1444:	00f12223          	sw	a5,4(sp)
    1448:	00000993          	li	s3,0
    144c:	08000b13          	li	s6,128
    1450:	00812783          	lw	a5,8(sp)
    1454:	00299913          	slli	s2,s3,0x2
    1458:	00000493          	li	s1,0
    145c:	01278933          	add	s2,a5,s2
    1460:	fffb0793          	addi	a5,s6,-1
    1464:	001b0b93          	addi	s7,s6,1
    1468:	00f12023          	sw	a5,0(sp)
    146c:	009b0433          	add	s0,s6,s1
    1470:	00241713          	slli	a4,s0,0x2
    1474:	00249793          	slli	a5,s1,0x2
    1478:	00ea0c33          	add	s8,s4,a4
    147c:	00fa0cb3          	add	s9,s4,a5
    1480:	00198a93          	addi	s5,s3,1
    1484:	00048d13          	mv	s10,s1
    1488:	000c2503          	lw	a0,0(s8) # 10000 <//__stack_size>
    148c:	001d0d13          	addi	s10,s10,1
    1490:	004c0c13          	addi	s8,s8,4
    1494:	02ad95b3          	mulh	a1,s11,a0
    1498:	004c8c93          	addi	s9,s9,4 # a004 <input_array+0x4>
    149c:	02ad8533          	mul	a0,s11,a0
    14a0:	21c000ef          	jal	16bc <pqcrystals_dilithium2_ref_montgomery_reduce>
    14a4:	ffcca683          	lw	a3,-4(s9)
    14a8:	40a686b3          	sub	a3,a3,a0
    14ac:	fedc2e23          	sw	a3,-4(s8)
    14b0:	ffcca683          	lw	a3,-4(s9)
    14b4:	00a686b3          	add	a3,a3,a0
    14b8:	fedcae23          	sw	a3,-4(s9)
    14bc:	fc8d66e3          	bltu	s10,s0,1488 <pqcrystals_dilithium2_ref_ntt+0xa4>
    14c0:	00148793          	addi	a5,s1,1
    14c4:	00000713          	li	a4,0
    14c8:	00f46463          	bltu	s0,a5,14d0 <pqcrystals_dilithium2_ref_ntt+0xec>
    14cc:	00012703          	lw	a4,0(sp)
    14d0:	009b84b3          	add	s1,s7,s1
    14d4:	009704b3          	add	s1,a4,s1
    14d8:	0ff00793          	li	a5,255
    14dc:	0097ea63          	bltu	a5,s1,14f0 <pqcrystals_dilithium2_ref_ntt+0x10c>
    14e0:	00092d83          	lw	s11,0(s2)
    14e4:	000a8993          	mv	s3,s5
    14e8:	00490913          	addi	s2,s2,4
    14ec:	f81ff06f          	j	146c <pqcrystals_dilithium2_ref_ntt+0x88>
    14f0:	00412783          	lw	a5,4(sp)
    14f4:	fff78793          	addi	a5,a5,-1
    14f8:	00f12223          	sw	a5,4(sp)
    14fc:	02078263          	beqz	a5,1520 <pqcrystals_dilithium2_ref_ntt+0x13c>
    1500:	00c12703          	lw	a4,12(sp)
    1504:	00298793          	addi	a5,s3,2
    1508:	00279793          	slli	a5,a5,0x2
    150c:	00f707b3          	add	a5,a4,a5
    1510:	0007ad83          	lw	s11,0(a5)
    1514:	001b5b13          	srli	s6,s6,0x1
    1518:	000a8993          	mv	s3,s5
    151c:	f35ff06f          	j	1450 <pqcrystals_dilithium2_ref_ntt+0x6c>
    1520:	04c12083          	lw	ra,76(sp)
    1524:	04812403          	lw	s0,72(sp)
    1528:	04412483          	lw	s1,68(sp)
    152c:	04012903          	lw	s2,64(sp)
    1530:	03c12983          	lw	s3,60(sp)
    1534:	03812a03          	lw	s4,56(sp)
    1538:	03412a83          	lw	s5,52(sp)
    153c:	03012b03          	lw	s6,48(sp)
    1540:	02c12b83          	lw	s7,44(sp)
    1544:	02812c03          	lw	s8,40(sp)
    1548:	02412c83          	lw	s9,36(sp)
    154c:	02012d03          	lw	s10,32(sp)
    1550:	01c12d83          	lw	s11,28(sp)
    1554:	05010113          	addi	sp,sp,80
    1558:	00008067          	ret

0000155c <pqcrystals_dilithium2_ref_invntt_tomont>:
    155c:	fb010113          	addi	sp,sp,-80
    1560:	03912223          	sw	s9,36(sp)
    1564:	00005cb7          	lui	s9,0x5
    1568:	1f4c8793          	addi	a5,s9,500 # 51f4 <memcpy+0x128>
    156c:	05212023          	sw	s2,64(sp)
    1570:	03512a23          	sw	s5,52(sp)
    1574:	03612823          	sw	s6,48(sp)
    1578:	03712623          	sw	s7,44(sp)
    157c:	03812423          	sw	s8,40(sp)
    1580:	04112623          	sw	ra,76(sp)
    1584:	04812423          	sw	s0,72(sp)
    1588:	04912223          	sw	s1,68(sp)
    158c:	03312e23          	sw	s3,60(sp)
    1590:	03412c23          	sw	s4,56(sp)
    1594:	03a12023          	sw	s10,32(sp)
    1598:	01b12e23          	sw	s11,28(sp)
    159c:	00050913          	mv	s2,a0
    15a0:	00f12623          	sw	a5,12(sp)
    15a4:	00800c13          	li	s8,8
    15a8:	10000b13          	li	s6,256
    15ac:	00100a93          	li	s5,1
    15b0:	0ff00b93          	li	s7,255
    15b4:	00c12783          	lw	a5,12(sp)
    15b8:	002b1a13          	slli	s4,s6,0x2
    15bc:	00000d93          	li	s11,0
    15c0:	01478a33          	add	s4,a5,s4
    15c4:	015d89b3          	add	s3,s11,s5
    15c8:	fffb0b13          	addi	s6,s6,-1
    15cc:	073dfa63          	bgeu	s11,s3,1640 <pqcrystals_dilithium2_ref_invntt_tomont+0xe4>
    15d0:	000a2703          	lw	a4,0(s4)
    15d4:	00299413          	slli	s0,s3,0x2
    15d8:	002d9d93          	slli	s11,s11,0x2
    15dc:	00890433          	add	s0,s2,s0
    15e0:	01b90db3          	add	s11,s2,s11
    15e4:	00040d13          	mv	s10,s0
    15e8:	40e00cb3          	neg	s9,a4
    15ec:	00090493          	mv	s1,s2
    15f0:	000da503          	lw	a0,0(s11)
    15f4:	000d2783          	lw	a5,0(s10)
    15f8:	004d8d93          	addi	s11,s11,4
    15fc:	004d0d13          	addi	s10,s10,4
    1600:	00a787b3          	add	a5,a5,a0
    1604:	fefdae23          	sw	a5,-4(s11)
    1608:	ffcd2783          	lw	a5,-4(s10)
    160c:	40f50533          	sub	a0,a0,a5
    1610:	fead2e23          	sw	a0,-4(s10)
    1614:	039515b3          	mulh	a1,a0,s9
    1618:	03950533          	mul	a0,a0,s9
    161c:	0a0000ef          	jal	16bc <pqcrystals_dilithium2_ref_montgomery_reduce>
    1620:	fead2e23          	sw	a0,-4(s10)
    1624:	fdb416e3          	bne	s0,s11,15f0 <pqcrystals_dilithium2_ref_invntt_tomont+0x94>
    1628:	01598db3          	add	s11,s3,s5
    162c:	03bbe063          	bltu	s7,s11,164c <pqcrystals_dilithium2_ref_invntt_tomont+0xf0>
    1630:	015d89b3          	add	s3,s11,s5
    1634:	ffca0a13          	addi	s4,s4,-4
    1638:	fffb0b13          	addi	s6,s6,-1
    163c:	f93deae3          	bltu	s11,s3,15d0 <pqcrystals_dilithium2_ref_invntt_tomont+0x74>
    1640:	ffca0a13          	addi	s4,s4,-4
    1644:	00098d93          	mv	s11,s3
    1648:	f7dff06f          	j	15c4 <pqcrystals_dilithium2_ref_invntt_tomont+0x68>
    164c:	fffc0c13          	addi	s8,s8,-1
    1650:	001a9a93          	slli	s5,s5,0x1
    1654:	f60c10e3          	bnez	s8,15b4 <pqcrystals_dilithium2_ref_invntt_tomont+0x58>
    1658:	0000a437          	lui	s0,0xa
    165c:	40090913          	addi	s2,s2,1024
    1660:	3fa40413          	addi	s0,s0,1018 # a3fa <__BSS_END__+0x3b6>
    1664:	0004a503          	lw	a0,0(s1)
    1668:	00448493          	addi	s1,s1,4
    166c:	028515b3          	mulh	a1,a0,s0
    1670:	02850533          	mul	a0,a0,s0
    1674:	048000ef          	jal	16bc <pqcrystals_dilithium2_ref_montgomery_reduce>
    1678:	fea4ae23          	sw	a0,-4(s1)
    167c:	ff2494e3          	bne	s1,s2,1664 <pqcrystals_dilithium2_ref_invntt_tomont+0x108>
    1680:	04c12083          	lw	ra,76(sp)
    1684:	04812403          	lw	s0,72(sp)
    1688:	04412483          	lw	s1,68(sp)
    168c:	04012903          	lw	s2,64(sp)
    1690:	03c12983          	lw	s3,60(sp)
    1694:	03812a03          	lw	s4,56(sp)
    1698:	03412a83          	lw	s5,52(sp)
    169c:	03012b03          	lw	s6,48(sp)
    16a0:	02c12b83          	lw	s7,44(sp)
    16a4:	02812c03          	lw	s8,40(sp)
    16a8:	02412c83          	lw	s9,36(sp)
    16ac:	02012d03          	lw	s10,32(sp)
    16b0:	01c12d83          	lw	s11,28(sp)
    16b4:	05010113          	addi	sp,sp,80
    16b8:	00008067          	ret

000016bc <pqcrystals_dilithium2_ref_montgomery_reduce>:
    16bc:	03802737          	lui	a4,0x3802
    16c0:	00170713          	addi	a4,a4,1 # 3802001 <__stack_top+0x37e2005>
    16c4:	02e50733          	mul	a4,a0,a4
    16c8:	41f75613          	srai	a2,a4,0x1f
    16cc:	01675693          	srli	a3,a4,0x16
    16d0:	00a61793          	slli	a5,a2,0xa
    16d4:	00f687b3          	add	a5,a3,a5
    16d8:	00a71693          	slli	a3,a4,0xa
    16dc:	40d706b3          	sub	a3,a4,a3
    16e0:	00d73833          	sltu	a6,a4,a3
    16e4:	40f607b3          	sub	a5,a2,a5
    16e8:	410787b3          	sub	a5,a5,a6
    16ec:	00d79793          	slli	a5,a5,0xd
    16f0:	0136d813          	srli	a6,a3,0x13
    16f4:	00d69693          	slli	a3,a3,0xd
    16f8:	40e68733          	sub	a4,a3,a4
    16fc:	00f807b3          	add	a5,a6,a5
    1700:	40c787b3          	sub	a5,a5,a2
    1704:	00e6b6b3          	sltu	a3,a3,a4
    1708:	40d787b3          	sub	a5,a5,a3
    170c:	00a70533          	add	a0,a4,a0
    1710:	00b787b3          	add	a5,a5,a1
    1714:	00e53533          	sltu	a0,a0,a4
    1718:	00f50533          	add	a0,a0,a5
    171c:	00008067          	ret

00001720 <pqcrystals_dilithium2_ref_reduce32>:
    1720:	004007b7          	lui	a5,0x400
    1724:	00f507b3          	add	a5,a0,a5
    1728:	ff802737          	lui	a4,0xff802
    172c:	fff70713          	addi	a4,a4,-1 # ff801fff <__stack_top+0xff7e2003>
    1730:	4177d793          	srai	a5,a5,0x17
    1734:	02e787b3          	mul	a5,a5,a4
    1738:	00a78533          	add	a0,a5,a0
    173c:	00008067          	ret

00001740 <pqcrystals_dilithium2_ref_caddq>:
    1740:	007fe737          	lui	a4,0x7fe
    1744:	41f55793          	srai	a5,a0,0x1f
    1748:	00170713          	addi	a4,a4,1 # 7fe001 <__stack_top+0x7de005>
    174c:	00e7f7b3          	and	a5,a5,a4
    1750:	00a78533          	add	a0,a5,a0
    1754:	00008067          	ret

00001758 <KeccakF1600_StatePermute>:
    1758:	00052783          	lw	a5,0(a0)
    175c:	eb010113          	addi	sp,sp,-336
    1760:	15312023          	sw	s3,320(sp)
    1764:	0cf12223          	sw	a5,196(sp)
    1768:	00452783          	lw	a5,4(a0)
    176c:	15212223          	sw	s2,324(sp)
    1770:	13412e23          	sw	s4,316(sp)
    1774:	0cf12423          	sw	a5,200(sp)
    1778:	00852783          	lw	a5,8(a0)
    177c:	13512c23          	sw	s5,312(sp)
    1780:	13612a23          	sw	s6,308(sp)
    1784:	00f12a23          	sw	a5,20(sp)
    1788:	00c52783          	lw	a5,12(a0)
    178c:	13712823          	sw	s7,304(sp)
    1790:	13812623          	sw	s8,300(sp)
    1794:	00f12c23          	sw	a5,24(sp)
    1798:	01052783          	lw	a5,16(a0)
    179c:	13912423          	sw	s9,296(sp)
    17a0:	13a12223          	sw	s10,292(sp)
    17a4:	0cf12623          	sw	a5,204(sp)
    17a8:	01452783          	lw	a5,20(a0)
    17ac:	13b12023          	sw	s11,288(sp)
    17b0:	14812623          	sw	s0,332(sp)
    17b4:	0cf12823          	sw	a5,208(sp)
    17b8:	01852783          	lw	a5,24(a0)
    17bc:	14912423          	sw	s1,328(sp)
    17c0:	02f12023          	sw	a5,32(sp)
    17c4:	01c52783          	lw	a5,28(a0)
    17c8:	00078993          	mv	s3,a5
    17cc:	02052783          	lw	a5,32(a0)
    17d0:	0cf12a23          	sw	a5,212(sp)
    17d4:	02452783          	lw	a5,36(a0)
    17d8:	0cf12c23          	sw	a5,216(sp)
    17dc:	02852783          	lw	a5,40(a0)
    17e0:	06052c03          	lw	s8,96(a0)
    17e4:	05052d03          	lw	s10,80(a0)
    17e8:	0cf12e23          	sw	a5,220(sp)
    17ec:	02c52783          	lw	a5,44(a0)
    17f0:	06852c83          	lw	s9,104(a0)
    17f4:	05452b83          	lw	s7,84(a0)
    17f8:	0ef12023          	sw	a5,224(sp)
    17fc:	03052783          	lw	a5,48(a0)
    1800:	00f12e23          	sw	a5,28(sp)
    1804:	03452783          	lw	a5,52(a0)
    1808:	02f12223          	sw	a5,36(sp)
    180c:	03852783          	lw	a5,56(a0)
    1810:	02f12823          	sw	a5,48(sp)
    1814:	03c52783          	lw	a5,60(a0)
    1818:	02f12a23          	sw	a5,52(sp)
    181c:	04052783          	lw	a5,64(a0)
    1820:	0ef12223          	sw	a5,228(sp)
    1824:	04452783          	lw	a5,68(a0)
    1828:	0ef12423          	sw	a5,232(sp)
    182c:	04852783          	lw	a5,72(a0)
    1830:	02f12423          	sw	a5,40(sp)
    1834:	04c52783          	lw	a5,76(a0)
    1838:	00078613          	mv	a2,a5
    183c:	05852783          	lw	a5,88(a0)
    1840:	06f12023          	sw	a5,96(sp)
    1844:	05c52783          	lw	a5,92(a0)
    1848:	04f12e23          	sw	a5,92(sp)
    184c:	06452783          	lw	a5,100(a0)
    1850:	02f12623          	sw	a5,44(sp)
    1854:	06c52783          	lw	a5,108(a0)
    1858:	02f12c23          	sw	a5,56(sp)
    185c:	07052783          	lw	a5,112(a0)
    1860:	06f12c23          	sw	a5,120(sp)
    1864:	08852703          	lw	a4,136(a0)
    1868:	07452783          	lw	a5,116(a0)
    186c:	0b052383          	lw	t2,176(a0)
    1870:	06e12423          	sw	a4,104(sp)
    1874:	08c52703          	lw	a4,140(a0)
    1878:	06f12223          	sw	a5,100(sp)
    187c:	07852783          	lw	a5,120(a0)
    1880:	06e12623          	sw	a4,108(sp)
    1884:	09852703          	lw	a4,152(a0)
    1888:	06f12a23          	sw	a5,116(sp)
    188c:	07c52783          	lw	a5,124(a0)
    1890:	02e12e23          	sw	a4,60(sp)
    1894:	09c52703          	lw	a4,156(a0)
    1898:	06f12e23          	sw	a5,124(sp)
    189c:	08052b03          	lw	s6,128(a0)
    18a0:	04e12023          	sw	a4,64(sp)
    18a4:	0a052703          	lw	a4,160(a0)
    18a8:	08452903          	lw	s2,132(a0)
    18ac:	09052a83          	lw	s5,144(a0)
    18b0:	04e12223          	sw	a4,68(sp)
    18b4:	0a452703          	lw	a4,164(a0)
    18b8:	09452283          	lw	t0,148(a0)
    18bc:	0b452a03          	lw	s4,180(a0)
    18c0:	04e12423          	sw	a4,72(sp)
    18c4:	0a852703          	lw	a4,168(a0)
    18c8:	000057b7          	lui	a5,0x5
    18cc:	5f878793          	addi	a5,a5,1528 # 55f8 <KeccakF_RoundConstants>
    18d0:	06e12823          	sw	a4,112(sp)
    18d4:	0ac52703          	lw	a4,172(a0)
    18d8:	00038e93          	mv	t4,t2
    18dc:	08e12023          	sw	a4,128(sp)
    18e0:	0b852703          	lw	a4,184(a0)
    18e4:	08e12223          	sw	a4,132(sp)
    18e8:	0bc52703          	lw	a4,188(a0)
    18ec:	08e12423          	sw	a4,136(sp)
    18f0:	0c052703          	lw	a4,192(a0)
    18f4:	0c452d83          	lw	s11,196(a0)
    18f8:	00f12623          	sw	a5,12(sp)
    18fc:	05812823          	sw	s8,80(sp)
    1900:	05a12623          	sw	s10,76(sp)
    1904:	00060c13          	mv	s8,a2
    1908:	05912a23          	sw	s9,84(sp)
    190c:	00070793          	mv	a5,a4
    1910:	10a12e23          	sw	a0,284(sp)
    1914:	0c412703          	lw	a4,196(sp)
    1918:	0dc12683          	lw	a3,220(sp)
    191c:	0e012603          	lw	a2,224(sp)
    1920:	00d746b3          	xor	a3,a4,a3
    1924:	0c812703          	lw	a4,200(sp)
    1928:	00c748b3          	xor	a7,a4,a2
    192c:	02012703          	lw	a4,32(sp)
    1930:	0e412603          	lw	a2,228(sp)
    1934:	0178c8b3          	xor	a7,a7,s7
    1938:	00c74f33          	xor	t5,a4,a2
    193c:	0e812703          	lw	a4,232(sp)
    1940:	03012603          	lw	a2,48(sp)
    1944:	00e9c3b3          	xor	t2,s3,a4
    1948:	0cc12703          	lw	a4,204(sp)
    194c:	00c74833          	xor	a6,a4,a2
    1950:	0d012703          	lw	a4,208(sp)
    1954:	03412603          	lw	a2,52(sp)
    1958:	00c74433          	xor	s0,a4,a2
    195c:	0d412703          	lw	a4,212(sp)
    1960:	02812603          	lw	a2,40(sp)
    1964:	00c74533          	xor	a0,a4,a2
    1968:	0d812703          	lw	a4,216(sp)
    196c:	01c12603          	lw	a2,28(sp)
    1970:	018745b3          	xor	a1,a4,s8
    1974:	01412703          	lw	a4,20(sp)
    1978:	00c74fb3          	xor	t6,a4,a2
    197c:	02412603          	lw	a2,36(sp)
    1980:	01812703          	lw	a4,24(sp)
    1984:	00c74733          	xor	a4,a4,a2
    1988:	04c12603          	lw	a2,76(sp)
    198c:	00c6c6b3          	xor	a3,a3,a2
    1990:	05412603          	lw	a2,84(sp)
    1994:	00cf4f33          	xor	t5,t5,a2
    1998:	03812603          	lw	a2,56(sp)
    199c:	015f4f33          	xor	t5,t5,s5
    19a0:	00c3c3b3          	xor	t2,t2,a2
    19a4:	05012603          	lw	a2,80(sp)
    19a8:	0053c3b3          	xor	t2,t2,t0
    19ac:	00c84833          	xor	a6,a6,a2
    19b0:	02c12603          	lw	a2,44(sp)
    19b4:	00c44433          	xor	s0,s0,a2
    19b8:	07812603          	lw	a2,120(sp)
    19bc:	00c54533          	xor	a0,a0,a2
    19c0:	06412603          	lw	a2,100(sp)
    19c4:	00c5c5b3          	xor	a1,a1,a2
    19c8:	06012603          	lw	a2,96(sp)
    19cc:	00cfcfb3          	xor	t6,t6,a2
    19d0:	05c12603          	lw	a2,92(sp)
    19d4:	016fcfb3          	xor	t6,t6,s6
    19d8:	00c74733          	xor	a4,a4,a2
    19dc:	07412603          	lw	a2,116(sp)
    19e0:	01274733          	xor	a4,a4,s2
    19e4:	00c6c6b3          	xor	a3,a3,a2
    19e8:	07c12603          	lw	a2,124(sp)
    19ec:	00c8c8b3          	xor	a7,a7,a2
    19f0:	06812603          	lw	a2,104(sp)
    19f4:	00c84833          	xor	a6,a6,a2
    19f8:	06c12603          	lw	a2,108(sp)
    19fc:	01d84833          	xor	a6,a6,t4
    1a00:	00181493          	slli	s1,a6,0x1
    1a04:	00c44433          	xor	s0,s0,a2
    1a08:	03c12603          	lw	a2,60(sp)
    1a0c:	01444433          	xor	s0,s0,s4
    1a10:	00c54533          	xor	a0,a0,a2
    1a14:	04012603          	lw	a2,64(sp)
    1a18:	00f54533          	xor	a0,a0,a5
    1a1c:	00c5c5b3          	xor	a1,a1,a2
    1a20:	04412603          	lw	a2,68(sp)
    1a24:	01b5c5b3          	xor	a1,a1,s11
    1a28:	00c6c6b3          	xor	a3,a3,a2
    1a2c:	04812603          	lw	a2,72(sp)
    1a30:	01f6d313          	srli	t1,a3,0x1f
    1a34:	00c8c8b3          	xor	a7,a7,a2
    1a38:	08412603          	lw	a2,132(sp)
    1a3c:	01f8de13          	srli	t3,a7,0x1f
    1a40:	00cf4f33          	xor	t5,t5,a2
    1a44:	08812603          	lw	a2,136(sp)
    1a48:	00c3c3b3          	xor	t2,t2,a2
    1a4c:	07012603          	lw	a2,112(sp)
    1a50:	00cfcfb3          	xor	t6,t6,a2
    1a54:	08012603          	lw	a2,128(sp)
    1a58:	00c74733          	xor	a4,a4,a2
    1a5c:	00169613          	slli	a2,a3,0x1
    1a60:	00ce0e33          	add	t3,t3,a2
    1a64:	00189613          	slli	a2,a7,0x1
    1a68:	00c30333          	add	t1,t1,a2
    1a6c:	01f45613          	srli	a2,s0,0x1f
    1a70:	00960633          	add	a2,a2,s1
    1a74:	00d64633          	xor	a2,a2,a3
    1a78:	00141493          	slli	s1,s0,0x1
    1a7c:	01f85693          	srli	a3,a6,0x1f
    1a80:	009686b3          	add	a3,a3,s1
    1a84:	0116c6b3          	xor	a3,a3,a7
    1a88:	00151493          	slli	s1,a0,0x1
    1a8c:	01f5d893          	srli	a7,a1,0x1f
    1a90:	009888b3          	add	a7,a7,s1
    1a94:	0108c8b3          	xor	a7,a7,a6
    1a98:	00159493          	slli	s1,a1,0x1
    1a9c:	01f55813          	srli	a6,a0,0x1f
    1aa0:	00980833          	add	a6,a6,s1
    1aa4:	00884833          	xor	a6,a6,s0
    1aa8:	001f9493          	slli	s1,t6,0x1
    1aac:	01f75413          	srli	s0,a4,0x1f
    1ab0:	00940433          	add	s0,s0,s1
    1ab4:	00a44533          	xor	a0,s0,a0
    1ab8:	00a12823          	sw	a0,16(sp)
    1abc:	00171413          	slli	s0,a4,0x1
    1ac0:	01ffd513          	srli	a0,t6,0x1f
    1ac4:	00850533          	add	a0,a0,s0
    1ac8:	00b54cb3          	xor	s9,a0,a1
    1acc:	001f1593          	slli	a1,t5,0x1
    1ad0:	01f3d513          	srli	a0,t2,0x1f
    1ad4:	00139413          	slli	s0,t2,0x1
    1ad8:	00b50533          	add	a0,a0,a1
    1adc:	01ff5593          	srli	a1,t5,0x1f
    1ae0:	008585b3          	add	a1,a1,s0
    1ae4:	00e5c5b3          	xor	a1,a1,a4
    1ae8:	02812703          	lw	a4,40(sp)
    1aec:	01ee4e33          	xor	t3,t3,t5
    1af0:	00734333          	xor	t1,t1,t2
    1af4:	00ee4733          	xor	a4,t3,a4
    1af8:	08e12623          	sw	a4,140(sp)
    1afc:	02012703          	lw	a4,32(sp)
    1b00:	01f54533          	xor	a0,a0,t6
    1b04:	01834fb3          	xor	t6,t1,s8
    1b08:	00e8c733          	xor	a4,a7,a4
    1b0c:	04e12c23          	sw	a4,88(sp)
    1b10:	01c12703          	lw	a4,28(sp)
    1b14:	01384c33          	xor	s8,a6,s3
    1b18:	04c12f03          	lw	t5,76(sp)
    1b1c:	00e64433          	xor	s0,a2,a4
    1b20:	01412703          	lw	a4,20(sp)
    1b24:	00fe47b3          	xor	a5,t3,a5
    1b28:	01b34db3          	xor	s11,t1,s11
    1b2c:	00e649b3          	xor	s3,a2,a4
    1b30:	02412703          	lw	a4,36(sp)
    1b34:	00e79d13          	slli	s10,a5,0xe
    1b38:	0127d793          	srli	a5,a5,0x12
    1b3c:	00e6c3b3          	xor	t2,a3,a4
    1b40:	01812703          	lw	a4,24(sp)
    1b44:	0158cab3          	xor	s5,a7,s5
    1b48:	005842b3          	xor	t0,a6,t0
    1b4c:	00e6c4b3          	xor	s1,a3,a4
    1b50:	01012703          	lw	a4,16(sp)
    1b54:	01664b33          	xor	s6,a2,s6
    1b58:	0126c933          	xor	s2,a3,s2
    1b5c:	01e74733          	xor	a4,a4,t5
    1b60:	08e12823          	sw	a4,144(sp)
    1b64:	017cc733          	xor	a4,s9,s7
    1b68:	08e12a23          	sw	a4,148(sp)
    1b6c:	05012703          	lw	a4,80(sp)
    1b70:	01d54bb3          	xor	s7,a0,t4
    1b74:	0145ca33          	xor	s4,a1,s4
    1b78:	00e54f33          	xor	t5,a0,a4
    1b7c:	02c12703          	lw	a4,44(sp)
    1b80:	00e5ceb3          	xor	t4,a1,a4
    1b84:	012dd713          	srli	a4,s11,0x12
    1b88:	00ed9d93          	slli	s11,s11,0xe
    1b8c:	01b787b3          	add	a5,a5,s11
    1b90:	02f12623          	sw	a5,44(sp)
    1b94:	03c12783          	lw	a5,60(sp)
    1b98:	01a70733          	add	a4,a4,s10
    1b9c:	02e12423          	sw	a4,40(sp)
    1ba0:	00fe47b3          	xor	a5,t3,a5
    1ba4:	0af12423          	sw	a5,168(sp)
    1ba8:	04012783          	lw	a5,64(sp)
    1bac:	00f34d33          	xor	s10,t1,a5
    1bb0:	05412783          	lw	a5,84(sp)
    1bb4:	00f8c7b3          	xor	a5,a7,a5
    1bb8:	0af12023          	sw	a5,160(sp)
    1bbc:	03812783          	lw	a5,56(sp)
    1bc0:	00f847b3          	xor	a5,a6,a5
    1bc4:	0af12223          	sw	a5,164(sp)
    1bc8:	01012783          	lw	a5,16(sp)
    1bcc:	04412703          	lw	a4,68(sp)
    1bd0:	00e7c7b3          	xor	a5,a5,a4
    1bd4:	0af12623          	sw	a5,172(sp)
    1bd8:	04812783          	lw	a5,72(sp)
    1bdc:	015a9713          	slli	a4,s5,0x15
    1be0:	00bada93          	srli	s5,s5,0xb
    1be4:	00fccdb3          	xor	s11,s9,a5
    1be8:	03012783          	lw	a5,48(sp)
    1bec:	00f547b3          	xor	a5,a0,a5
    1bf0:	08f12c23          	sw	a5,152(sp)
    1bf4:	03412783          	lw	a5,52(sp)
    1bf8:	00f5c7b3          	xor	a5,a1,a5
    1bfc:	08f12e23          	sw	a5,156(sp)
    1c00:	00b2d793          	srli	a5,t0,0xb
    1c04:	00e787b3          	add	a5,a5,a4
    1c08:	05812703          	lw	a4,88(sp)
    1c0c:	01529293          	slli	t0,t0,0x15
    1c10:	02f12023          	sw	a5,32(sp)
    1c14:	005a87b3          	add	a5,s5,t0
    1c18:	02f12223          	sw	a5,36(sp)
    1c1c:	01c71713          	slli	a4,a4,0x1c
    1c20:	004c5793          	srli	a5,s8,0x4
    1c24:	00e787b3          	add	a5,a5,a4
    1c28:	02f12823          	sw	a5,48(sp)
    1c2c:	05812783          	lw	a5,88(sp)
    1c30:	01cc1c13          	slli	s8,s8,0x1c
    1c34:	013b5713          	srli	a4,s6,0x13
    1c38:	0047d793          	srli	a5,a5,0x4
    1c3c:	018787b3          	add	a5,a5,s8
    1c40:	02f12a23          	sw	a5,52(sp)
    1c44:	00db1b13          	slli	s6,s6,0xd
    1c48:	00d91793          	slli	a5,s2,0xd
    1c4c:	01395913          	srli	s2,s2,0x13
    1c50:	00e78ab3          	add	s5,a5,a4
    1c54:	012b07b3          	add	a5,s6,s2
    1c58:	003bd713          	srli	a4,s7,0x3
    1c5c:	04f12423          	sw	a5,72(sp)
    1c60:	01da1793          	slli	a5,s4,0x1d
    1c64:	00e787b3          	add	a5,a5,a4
    1c68:	003a5a13          	srli	s4,s4,0x3
    1c6c:	01db9b93          	slli	s7,s7,0x1d
    1c70:	04f12623          	sw	a5,76(sp)
    1c74:	014b87b3          	add	a5,s7,s4
    1c78:	00199713          	slli	a4,s3,0x1
    1c7c:	04f12823          	sw	a5,80(sp)
    1c80:	01f4d793          	srli	a5,s1,0x1f
    1c84:	00e787b3          	add	a5,a5,a4
    1c88:	00149493          	slli	s1,s1,0x1
    1c8c:	01f9d993          	srli	s3,s3,0x1f
    1c90:	04f12a23          	sw	a5,84(sp)
    1c94:	009987b3          	add	a5,s3,s1
    1c98:	01445713          	srli	a4,s0,0x14
    1c9c:	04f12c23          	sw	a5,88(sp)
    1ca0:	00c39793          	slli	a5,t2,0xc
    1ca4:	00e787b3          	add	a5,a5,a4
    1ca8:	08c12703          	lw	a4,140(sp)
    1cac:	0143d393          	srli	t2,t2,0x14
    1cb0:	00c41413          	slli	s0,s0,0xc
    1cb4:	00f12a23          	sw	a5,20(sp)
    1cb8:	007407b3          	add	a5,s0,t2
    1cbc:	00f12c23          	sw	a5,24(sp)
    1cc0:	01471713          	slli	a4,a4,0x14
    1cc4:	00cfd793          	srli	a5,t6,0xc
    1cc8:	00e787b3          	add	a5,a5,a4
    1ccc:	02f12c23          	sw	a5,56(sp)
    1cd0:	08c12783          	lw	a5,140(sp)
    1cd4:	014f9f93          	slli	t6,t6,0x14
    1cd8:	00be9713          	slli	a4,t4,0xb
    1cdc:	00c7d793          	srli	a5,a5,0xc
    1ce0:	01f787b3          	add	a5,a5,t6
    1ce4:	02f12e23          	sw	a5,60(sp)
    1ce8:	015ede93          	srli	t4,t4,0x15
    1cec:	015f5793          	srli	a5,t5,0x15
    1cf0:	00bf1f13          	slli	t5,t5,0xb
    1cf4:	00f70733          	add	a4,a4,a5
    1cf8:	01df07b3          	add	a5,t5,t4
    1cfc:	00f12e23          	sw	a5,28(sp)
    1d00:	09012f03          	lw	t5,144(sp)
    1d04:	09412783          	lw	a5,148(sp)
    1d08:	018d5493          	srli	s1,s10,0x18
    1d0c:	003f1f13          	slli	t5,t5,0x3
    1d10:	01d7de93          	srli	t4,a5,0x1d
    1d14:	01ee8eb3          	add	t4,t4,t5
    1d18:	05d12023          	sw	t4,64(sp)
    1d1c:	09012e83          	lw	t4,144(sp)
    1d20:	00379793          	slli	a5,a5,0x3
    1d24:	008d1d13          	slli	s10,s10,0x8
    1d28:	01dede93          	srli	t4,t4,0x1d
    1d2c:	00fe87b3          	add	a5,t4,a5
    1d30:	04f12223          	sw	a5,68(sp)
    1d34:	0d412783          	lw	a5,212(sp)
    1d38:	00edd993          	srli	s3,s11,0xe
    1d3c:	012d9d93          	slli	s11,s11,0x12
    1d40:	00fe4eb3          	xor	t4,t3,a5
    1d44:	07812783          	lw	a5,120(sp)
    1d48:	00fe47b3          	xor	a5,t3,a5
    1d4c:	0af12c23          	sw	a5,184(sp)
    1d50:	0d812783          	lw	a5,216(sp)
    1d54:	0dc12f83          	lw	t6,220(sp)
    1d58:	09812b03          	lw	s6,152(sp)
    1d5c:	00f34e33          	xor	t3,t1,a5
    1d60:	06412783          	lw	a5,100(sp)
    1d64:	006b1b13          	slli	s6,s6,0x6
    1d68:	00f347b3          	xor	a5,t1,a5
    1d6c:	0af12e23          	sw	a5,188(sp)
    1d70:	08412783          	lw	a5,132(sp)
    1d74:	00f8c333          	xor	t1,a7,a5
    1d78:	0e412783          	lw	a5,228(sp)
    1d7c:	00f8c7b3          	xor	a5,a7,a5
    1d80:	0af12a23          	sw	a5,180(sp)
    1d84:	08812783          	lw	a5,136(sp)
    1d88:	00f84f33          	xor	t5,a6,a5
    1d8c:	0e812783          	lw	a5,232(sp)
    1d90:	00f84933          	xor	s2,a6,a5
    1d94:	06012783          	lw	a5,96(sp)
    1d98:	00f648b3          	xor	a7,a2,a5
    1d9c:	07012783          	lw	a5,112(sp)
    1da0:	00f64633          	xor	a2,a2,a5
    1da4:	05c12783          	lw	a5,92(sp)
    1da8:	00f6c833          	xor	a6,a3,a5
    1dac:	08012783          	lw	a5,128(sp)
    1db0:	00f6c6b3          	xor	a3,a3,a5
    1db4:	01012783          	lw	a5,16(sp)
    1db8:	01f7c2b3          	xor	t0,a5,t6
    1dbc:	0e012783          	lw	a5,224(sp)
    1dc0:	00fccfb3          	xor	t6,s9,a5
    1dc4:	06812783          	lw	a5,104(sp)
    1dc8:	00f543b3          	xor	t2,a0,a5
    1dcc:	0cc12783          	lw	a5,204(sp)
    1dd0:	00f54533          	xor	a0,a0,a5
    1dd4:	06c12783          	lw	a5,108(sp)
    1dd8:	00f5c433          	xor	s0,a1,a5
    1ddc:	0d012783          	lw	a5,208(sp)
    1de0:	00f5c5b3          	xor	a1,a1,a5
    1de4:	0a812783          	lw	a5,168(sp)
    1de8:	00879793          	slli	a5,a5,0x8
    1dec:	00f487b3          	add	a5,s1,a5
    1df0:	0a812483          	lw	s1,168(sp)
    1df4:	0184d493          	srli	s1,s1,0x18
    1df8:	01a484b3          	add	s1,s1,s10
    1dfc:	06912623          	sw	s1,108(sp)
    1e00:	0ac12483          	lw	s1,172(sp)
    1e04:	005e5d13          	srli	s10,t3,0x5
    1e08:	01be1e13          	slli	t3,t3,0x1b
    1e0c:	01249493          	slli	s1,s1,0x12
    1e10:	009984b3          	add	s1,s3,s1
    1e14:	0ac12983          	lw	s3,172(sp)
    1e18:	00e9d993          	srli	s3,s3,0xe
    1e1c:	01b989b3          	add	s3,s3,s11
    1e20:	07312823          	sw	s3,112(sp)
    1e24:	09c12983          	lw	s3,156(sp)
    1e28:	01be9d93          	slli	s11,t4,0x1b
    1e2c:	005ede93          	srli	t4,t4,0x5
    1e30:	01a9da13          	srli	s4,s3,0x1a
    1e34:	016a0a33          	add	s4,s4,s6
    1e38:	05412e23          	sw	s4,92(sp)
    1e3c:	09812a03          	lw	s4,152(sp)
    1e40:	00699993          	slli	s3,s3,0x6
    1e44:	0a012b03          	lw	s6,160(sp)
    1e48:	01aa5a13          	srli	s4,s4,0x1a
    1e4c:	013a09b3          	add	s3,s4,s3
    1e50:	07312023          	sw	s3,96(sp)
    1e54:	0a412983          	lw	s3,164(sp)
    1e58:	019b1b13          	slli	s6,s6,0x19
    1e5c:	01ce8e33          	add	t3,t4,t3
    1e60:	0079da13          	srli	s4,s3,0x7
    1e64:	016a0a33          	add	s4,s4,s6
    1e68:	07412223          	sw	s4,100(sp)
    1e6c:	00f39e93          	slli	t4,t2,0xf
    1e70:	07412b03          	lw	s6,116(sp)
    1e74:	07c12a23          	sw	t3,116(sp)
    1e78:	01145e13          	srli	t3,s0,0x11
    1e7c:	01de0e33          	add	t3,t3,t4
    1e80:	00f41413          	slli	s0,s0,0xf
    1e84:	0113d393          	srli	t2,t2,0x11
    1e88:	09c12223          	sw	t3,132(sp)
    1e8c:	00838e33          	add	t3,t2,s0
    1e90:	0a012a03          	lw	s4,160(sp)
    1e94:	00835e93          	srli	t4,t1,0x8
    1e98:	09c12423          	sw	t3,136(sp)
    1e9c:	01831313          	slli	t1,t1,0x18
    1ea0:	018f1e13          	slli	t3,t5,0x18
    1ea4:	008f5f13          	srli	t5,t5,0x8
    1ea8:	01e30333          	add	t1,t1,t5
    1eac:	08612823          	sw	t1,144(sp)
    1eb0:	02c12303          	lw	t1,44(sp)
    1eb4:	007a5a13          	srli	s4,s4,0x7
    1eb8:	01999993          	slli	s3,s3,0x19
    1ebc:	013a09b3          	add	s3,s4,s3
    1ec0:	01bd0d33          	add	s10,s10,s11
    1ec4:	07312423          	sw	s3,104(sp)
    1ec8:	01012983          	lw	s3,16(sp)
    1ecc:	01a12823          	sw	s10,16(sp)
    1ed0:	fff34d13          	not	s10,t1
    1ed4:	05012303          	lw	t1,80(sp)
    1ed8:	0c412a03          	lw	s4,196(sp)
    1edc:	0169cbb3          	xor	s7,s3,s6
    1ee0:	fff34413          	not	s0,t1
    1ee4:	02012303          	lw	t1,32(sp)
    1ee8:	0149ca33          	xor	s4,s3,s4
    1eec:	07c12b03          	lw	s6,124(sp)
    1ef0:	fff34f13          	not	t5,t1
    1ef4:	04012303          	lw	t1,64(sp)
    1ef8:	02812c03          	lw	s8,40(sp)
    1efc:	0c812983          	lw	s3,200(sp)
    1f00:	01de0e33          	add	t3,t3,t4
    1f04:	01c2dd93          	srli	s11,t0,0x1c
    1f08:	fff34e93          	not	t4,t1
    1f0c:	00429293          	slli	t0,t0,0x4
    1f10:	004f9313          	slli	t1,t6,0x4
    1f14:	01cfdf93          	srli	t6,t6,0x1c
    1f18:	01b30db3          	add	s11,t1,s11
    1f1c:	01f28333          	add	t1,t0,t6
    1f20:	013cc9b3          	xor	s3,s9,s3
    1f24:	016ccb33          	xor	s6,s9,s6
    1f28:	00a89f93          	slli	t6,a7,0xa
    1f2c:	fffc4c93          	not	s9,s8
    1f30:	06612c23          	sw	t1,120(sp)
    1f34:	04c12c03          	lw	s8,76(sp)
    1f38:	01685313          	srli	t1,a6,0x16
    1f3c:	0168d893          	srli	a7,a7,0x16
    1f40:	00a81813          	slli	a6,a6,0xa
    1f44:	01088833          	add	a6,a7,a6
    1f48:	03012883          	lw	a7,48(sp)
    1f4c:	01f30333          	add	t1,t1,t6
    1f50:	fffc4c13          	not	s8,s8
    1f54:	011c7c33          	and	s8,s8,a7
    1f58:	06612e23          	sw	t1,124(sp)
    1f5c:	01e59893          	slli	a7,a1,0x1e
    1f60:	00255313          	srli	t1,a0,0x2
    1f64:	0025d593          	srli	a1,a1,0x2
    1f68:	01e51513          	slli	a0,a0,0x1e
    1f6c:	00b505b3          	add	a1,a0,a1
    1f70:	006888b3          	add	a7,a7,t1
    1f74:	08b12c23          	sw	a1,152(sp)
    1f78:	009b1313          	slli	t1,s6,0x9
    1f7c:	017bd593          	srli	a1,s7,0x17
    1f80:	00b30333          	add	t1,t1,a1
    1f84:	01e6d513          	srli	a0,a3,0x1e
    1f88:	00261593          	slli	a1,a2,0x2
    1f8c:	00269693          	slli	a3,a3,0x2
    1f90:	01e65613          	srli	a2,a2,0x1e
    1f94:	00b505b3          	add	a1,a0,a1
    1f98:	00d606b3          	add	a3,a2,a3
    1f9c:	009b9b93          	slli	s7,s7,0x9
    1fa0:	017b5b13          	srli	s6,s6,0x17
    1fa4:	0ab12023          	sw	a1,160(sp)
    1fa8:	0ad12223          	sw	a3,164(sp)
    1fac:	016b85b3          	add	a1,s7,s6
    1fb0:	02012683          	lw	a3,32(sp)
    1fb4:	08b12e23          	sw	a1,156(sp)
    1fb8:	03412583          	lw	a1,52(sp)
    1fbc:	014cfcb3          	and	s9,s9,s4
    1fc0:	fff74393          	not	t2,a4
    1fc4:	00d3f3b3          	and	t2,t2,a3
    1fc8:	09c12623          	sw	t3,140(sp)
    1fcc:	00dcc6b3          	xor	a3,s9,a3
    1fd0:	09012023          	sw	a6,128(sp)
    1fd4:	09112a23          	sw	a7,148(sp)
    1fd8:	01412803          	lw	a6,20(sp)
    1fdc:	00b47433          	and	s0,s0,a1
    1fe0:	07012583          	lw	a1,112(sp)
    1fe4:	0ad12823          	sw	a3,176(sp)
    1fe8:	02812683          	lw	a3,40(sp)
    1fec:	fff84813          	not	a6,a6
    1ff0:	ffface13          	not	t3,s5
    1ff4:	00df7f33          	and	t5,t5,a3
    1ff8:	015efeb3          	and	t4,t4,s5
    1ffc:	015c46b3          	xor	a3,s8,s5
    2000:	00e87ab3          	and	s5,a6,a4
    2004:	05412803          	lw	a6,84(sp)
    2008:	fff4cf93          	not	t6,s1
    200c:	013d7d33          	and	s10,s10,s3
    2010:	010fffb3          	and	t6,t6,a6
    2014:	08c12803          	lw	a6,140(sp)
    2018:	0b412503          	lw	a0,180(sp)
    201c:	00ef4733          	xor	a4,t5,a4
    2020:	fff84c93          	not	s9,a6
    2024:	02412803          	lw	a6,36(sp)
    2028:	fff5c293          	not	t0,a1
    202c:	0ae12623          	sw	a4,172(sp)
    2030:	010d4833          	xor	a6,s10,a6
    2034:	0b012a23          	sw	a6,180(sp)
    2038:	04812803          	lw	a6,72(sp)
    203c:	00c12703          	lw	a4,12(sp)
    2040:	0cd12023          	sw	a3,192(sp)
    2044:	01044833          	xor	a6,s0,a6
    2048:	0d012223          	sw	a6,196(sp)
    204c:	05812803          	lw	a6,88(sp)
    2050:	04c12683          	lw	a3,76(sp)
    2054:	00072703          	lw	a4,0(a4)
    2058:	0102f2b3          	and	t0,t0,a6
    205c:	09012803          	lw	a6,144(sp)
    2060:	03812403          	lw	s0,56(sp)
    2064:	00995593          	srli	a1,s2,0x9
    2068:	fff84b93          	not	s7,a6
    206c:	01791893          	slli	a7,s2,0x17
    2070:	01412803          	lw	a6,20(sp)
    2074:	00955913          	srli	s2,a0,0x9
    2078:	01751513          	slli	a0,a0,0x17
    207c:	00b50533          	add	a0,a0,a1
    2080:	0bc12583          	lw	a1,188(sp)
    2084:	00de7e33          	and	t3,t3,a3
    2088:	01474733          	xor	a4,a4,s4
    208c:	06412683          	lw	a3,100(sp)
    2090:	0103c833          	xor	a6,t2,a6
    2094:	008eceb3          	xor	t4,t4,s0
    2098:	01574733          	xor	a4,a4,s5
    209c:	0b012423          	sw	a6,168(sp)
    20a0:	02e12023          	sw	a4,32(sp)
    20a4:	00759813          	slli	a6,a1,0x7
    20a8:	00c12703          	lw	a4,12(sp)
    20ac:	0b812583          	lw	a1,184(sp)
    20b0:	0bd12c23          	sw	t4,184(sp)
    20b4:	04012e83          	lw	t4,64(sp)
    20b8:	fff6c613          	not	a2,a3
    20bc:	00f67633          	and	a2,a2,a5
    20c0:	fff7c693          	not	a3,a5
    20c4:	00ffc7b3          	xor	a5,t6,a5
    20c8:	01de4e33          	xor	t3,t3,t4
    20cc:	0cf12423          	sw	a5,200(sp)
    20d0:	00472e83          	lw	t4,4(a4)
    20d4:	07c12783          	lw	a5,124(sp)
    20d8:	01412703          	lw	a4,20(sp)
    20dc:	fffa4a13          	not	s4,s4
    20e0:	012888b3          	add	a7,a7,s2
    20e4:	0bc12f03          	lw	t5,188(sp)
    20e8:	00ea7a33          	and	s4,s4,a4
    20ec:	0bc12e23          	sw	t3,188(sp)
    20f0:	fff7c913          	not	s2,a5
    20f4:	08412783          	lw	a5,132(sp)
    20f8:	04012703          	lw	a4,64(sp)
    20fc:	fff44e13          	not	t3,s0
    2100:	05412f83          	lw	t6,84(sp)
    2104:	00ee7e33          	and	t3,t3,a4
    2108:	03012703          	lw	a4,48(sp)
    210c:	0096f6b3          	and	a3,a3,s1
    2110:	0195d393          	srli	t2,a1,0x19
    2114:	fff74713          	not	a4,a4
    2118:	00877733          	and	a4,a4,s0
    211c:	ffffc413          	not	s0,t6
    2120:	05c12f83          	lw	t6,92(sp)
    2124:	019f5f13          	srli	t5,t5,0x19
    2128:	00759593          	slli	a1,a1,0x7
    212c:	01f47433          	and	s0,s0,t6
    2130:	00944433          	xor	s0,s0,s1
    2134:	013ecfb3          	xor	t6,t4,s3
    2138:	03012e83          	lw	t4,48(sp)
    213c:	0c812623          	sw	s0,204(sp)
    2140:	01812403          	lw	s0,24(sp)
    2144:	01c12483          	lw	s1,28(sp)
    2148:	01de4e33          	xor	t3,t3,t4
    214c:	01e585b3          	add	a1,a1,t5
    2150:	03c12823          	sw	t3,48(sp)
    2154:	03c12f03          	lw	t5,60(sp)
    2158:	01c12e03          	lw	t3,28(sp)
    215c:	fff44413          	not	s0,s0
    2160:	00947433          	and	s0,s0,s1
    2164:	04412483          	lw	s1,68(sp)
    2168:	fffe4e93          	not	t4,t3
    216c:	ffff4f13          	not	t5,t5
    2170:	02412e03          	lw	t3,36(sp)
    2174:	00780833          	add	a6,a6,t2
    2178:	009f7f33          	and	t5,t5,s1
    217c:	02c12383          	lw	t2,44(sp)
    2180:	01812483          	lw	s1,24(sp)
    2184:	01cefeb3          	and	t4,t4,t3
    2188:	fffe4e13          	not	t3,t3
    218c:	009eceb3          	xor	t4,t4,s1
    2190:	007e7e33          	and	t3,t3,t2
    2194:	04c12383          	lw	t2,76(sp)
    2198:	03d12223          	sw	t4,36(sp)
    219c:	01c12e83          	lw	t4,28(sp)
    21a0:	00774733          	xor	a4,a4,t2
    21a4:	04e12023          	sw	a4,64(sp)
    21a8:	01de4e33          	xor	t3,t3,t4
    21ac:	04412703          	lw	a4,68(sp)
    21b0:	01c12e23          	sw	t3,28(sp)
    21b4:	03412e03          	lw	t3,52(sp)
    21b8:	fff74393          	not	t2,a4
    21bc:	04812703          	lw	a4,72(sp)
    21c0:	fffe4e93          	not	t4,t3
    21c4:	03c12e03          	lw	t3,60(sp)
    21c8:	00e3f3b3          	and	t2,t2,a4
    21cc:	05012a83          	lw	s5,80(sp)
    21d0:	01cefeb3          	and	t4,t4,t3
    21d4:	01c3ce33          	xor	t3,t2,t3
    21d8:	03c12c23          	sw	t3,56(sp)
    21dc:	05812e03          	lw	t3,88(sp)
    21e0:	06012383          	lw	t2,96(sp)
    21e4:	fff74713          	not	a4,a4
    21e8:	fffe4e13          	not	t3,t3
    21ec:	007e7e33          	and	t3,t3,t2
    21f0:	04412383          	lw	t2,68(sp)
    21f4:	01577733          	and	a4,a4,s5
    21f8:	008fcfb3          	xor	t6,t6,s0
    21fc:	00774733          	xor	a4,a4,t2
    2200:	02e12e23          	sw	a4,60(sp)
    2204:	02812703          	lw	a4,40(sp)
    2208:	015eceb3          	xor	t4,t4,s5
    220c:	fff9c993          	not	s3,s3
    2210:	00ea4733          	xor	a4,s4,a4
    2214:	02e12423          	sw	a4,40(sp)
    2218:	05c12703          	lw	a4,92(sp)
    221c:	06412483          	lw	s1,100(sp)
    2220:	01f12a23          	sw	t6,20(sp)
    2224:	06012f83          	lw	t6,96(sp)
    2228:	fff74393          	not	t2,a4
    222c:	0093f3b3          	and	t2,t2,s1
    2230:	05d12223          	sw	t4,68(sp)
    2234:	06c12483          	lw	s1,108(sp)
    2238:	06812e83          	lw	t4,104(sp)
    223c:	ffffcb13          	not	s6,t6
    2240:	01812f83          	lw	t6,24(sp)
    2244:	0092c2b3          	xor	t0,t0,s1
    2248:	01db7b33          	and	s6,s6,t4
    224c:	07012e83          	lw	t4,112(sp)
    2250:	00e64733          	xor	a4,a2,a4
    2254:	01f9f9b3          	and	s3,s3,t6
    2258:	06c12603          	lw	a2,108(sp)
    225c:	08812f83          	lw	t6,136(sp)
    2260:	06512623          	sw	t0,108(sp)
    2264:	06412283          	lw	t0,100(sp)
    2268:	01de4e33          	xor	t3,t3,t4
    226c:	07c12223          	sw	t3,100(sp)
    2270:	0056c6b3          	xor	a3,a3,t0
    2274:	07812e03          	lw	t3,120(sp)
    2278:	ffffc293          	not	t0,t6
    227c:	03412f83          	lw	t6,52(sp)
    2280:	04d12e23          	sw	a3,92(sp)
    2284:	05412683          	lw	a3,84(sp)
    2288:	01ff4f33          	xor	t5,t5,t6
    228c:	fffe4f93          	not	t6,t3
    2290:	07412e03          	lw	t3,116(sp)
    2294:	0c012e83          	lw	t4,192(sp)
    2298:	03e12a23          	sw	t5,52(sp)
    229c:	fffe4f13          	not	t5,t3
    22a0:	0b012e03          	lw	t3,176(sp)
    22a4:	00d3c6b3          	xor	a3,t2,a3
    22a8:	04e12623          	sw	a4,76(sp)
    22ac:	06812703          	lw	a4,104(sp)
    22b0:	01de4c33          	xor	s8,t3,t4
    22b4:	04d12423          	sw	a3,72(sp)
    22b8:	0a012e83          	lw	t4,160(sp)
    22bc:	01012683          	lw	a3,16(sp)
    22c0:	fff74713          	not	a4,a4
    22c4:	00977733          	and	a4,a4,s1
    22c8:	fff6c393          	not	t2,a3
    22cc:	0c412483          	lw	s1,196(sp)
    22d0:	07012683          	lw	a3,112(sp)
    22d4:	fffec413          	not	s0,t4
    22d8:	0b412e83          	lw	t4,180(sp)
    22dc:	fff64613          	not	a2,a2
    22e0:	01012e03          	lw	t3,16(sp)
    22e4:	009ecab3          	xor	s5,t4,s1
    22e8:	00d67633          	and	a2,a2,a3
    22ec:	08012683          	lw	a3,128(sp)
    22f0:	07412e83          	lw	t4,116(sp)
    22f4:	0a812483          	lw	s1,168(sp)
    22f8:	01ccfe33          	and	t3,s9,t3
    22fc:	01dbfeb3          	and	t4,s7,t4
    2300:	0b812b83          	lw	s7,184(sp)
    2304:	fff7c793          	not	a5,a5
    2308:	fffdca13          	not	s4,s11
    230c:	0174cd33          	xor	s10,s1,s7
    2310:	08412483          	lw	s1,132(sp)
    2314:	07d12823          	sw	t4,112(sp)
    2318:	fff84b93          	not	s7,a6
    231c:	009e4e33          	xor	t3,t3,s1
    2320:	00997933          	and	s2,s2,s1
    2324:	09012483          	lw	s1,144(sp)
    2328:	09c12223          	sw	t3,132(sp)
    232c:	08c12e03          	lw	t3,140(sp)
    2330:	0092f2b3          	and	t0,t0,s1
    2334:	02c12483          	lw	s1,44(sp)
    2338:	01c7f7b3          	and	a5,a5,t3
    233c:	07c12e03          	lw	t3,124(sp)
    2340:	0099c4b3          	xor	s1,s3,s1
    2344:	00912c23          	sw	s1,24(sp)
    2348:	0bc12983          	lw	s3,188(sp)
    234c:	0ac12483          	lw	s1,172(sp)
    2350:	01ca7a33          	and	s4,s4,t3
    2354:	06012e03          	lw	t3,96(sp)
    2358:	0134c4b3          	xor	s1,s1,s3
    235c:	05812983          	lw	s3,88(sp)
    2360:	01c74733          	xor	a4,a4,t3
    2364:	06812e03          	lw	t3,104(sp)
    2368:	013b49b3          	xor	s3,s6,s3
    236c:	03312623          	sw	s3,44(sp)
    2370:	03812b03          	lw	s6,56(sp)
    2374:	02412983          	lw	s3,36(sp)
    2378:	01c64633          	xor	a2,a2,t3
    237c:	04c12a23          	sw	a2,84(sp)
    2380:	0169ccb3          	xor	s9,s3,s6
    2384:	08012983          	lw	s3,128(sp)
    2388:	08812b03          	lw	s6,136(sp)
    238c:	08812603          	lw	a2,136(sp)
    2390:	013fffb3          	and	t6,t6,s3
    2394:	07812983          	lw	s3,120(sp)
    2398:	04e12823          	sw	a4,80(sp)
    239c:	006bfbb3          	and	s7,s7,t1
    23a0:	013f7f33          	and	t5,t5,s3
    23a4:	0c812983          	lw	s3,200(sp)
    23a8:	fff34713          	not	a4,t1
    23ac:	fff6c693          	not	a3,a3
    23b0:	013c4c33          	xor	s8,s8,s3
    23b4:	09412983          	lw	s3,148(sp)
    23b8:	0a412e83          	lw	t4,164(sp)
    23bc:	00c6f6b3          	and	a3,a3,a2
    23c0:	01347433          	and	s0,s0,s3
    23c4:	06c12983          	lw	s3,108(sp)
    23c8:	00644333          	xor	t1,s0,t1
    23cc:	09412603          	lw	a2,148(sp)
    23d0:	013acab3          	xor	s5,s5,s3
    23d4:	07012983          	lw	s3,112(sp)
    23d8:	fffece93          	not	t4,t4
    23dc:	01b3f3b3          	and	t2,t2,s11
    23e0:	0169c9b3          	xor	s3,s3,s6
    23e4:	09312423          	sw	s3,136(sp)
    23e8:	09812983          	lw	s3,152(sp)
    23ec:	03c12403          	lw	s0,60(sp)
    23f0:	0c612823          	sw	t1,208(sp)
    23f4:	01c12303          	lw	t1,28(sp)
    23f8:	013efeb3          	and	t4,t4,s3
    23fc:	04c12983          	lw	s3,76(sp)
    2400:	00834433          	xor	s0,t1,s0
    2404:	0a012303          	lw	t1,160(sp)
    2408:	013d4d33          	xor	s10,s10,s3
    240c:	07c12983          	lw	s3,124(sp)
    2410:	00677733          	and	a4,a4,t1
    2414:	01012303          	lw	t1,16(sp)
    2418:	0137c7b3          	xor	a5,a5,s3
    241c:	03412983          	lw	s3,52(sp)
    2420:	006a4333          	xor	t1,s4,t1
    2424:	00612823          	sw	t1,16(sp)
    2428:	01412303          	lw	t1,20(sp)
    242c:	01b94933          	xor	s2,s2,s11
    2430:	07212023          	sw	s2,96(sp)
    2434:	013349b3          	xor	s3,t1,s3
    2438:	08c12303          	lw	t1,140(sp)
    243c:	fff5c913          	not	s2,a1
    2440:	06f12823          	sw	a5,112(sp)
    2444:	0063c333          	xor	t1,t2,t1
    2448:	05c12383          	lw	t2,92(sp)
    244c:	09c12783          	lw	a5,156(sp)
    2450:	06612e23          	sw	t1,124(sp)
    2454:	0074c4b3          	xor	s1,s1,t2
    2458:	05012383          	lw	t2,80(sp)
    245c:	fff7c793          	not	a5,a5
    2460:	fff54313          	not	t1,a0
    2464:	007cccb3          	xor	s9,s9,t2
    2468:	07812383          	lw	t2,120(sp)
    246c:	00b37333          	and	t1,t1,a1
    2470:	fff8ce13          	not	t3,a7
    2474:	0076c6b3          	xor	a3,a3,t2
    2478:	08012383          	lw	t2,128(sp)
    247c:	06d12423          	sw	a3,104(sp)
    2480:	09812683          	lw	a3,152(sp)
    2484:	0072c2b3          	xor	t0,t0,t2
    2488:	06512c23          	sw	t0,120(sp)
    248c:	03012383          	lw	t2,48(sp)
    2490:	02012283          	lw	t0,32(sp)
    2494:	fff6c693          	not	a3,a3
    2498:	00a6f6b3          	and	a3,a3,a0
    249c:	0072ca33          	xor	s4,t0,t2
    24a0:	09c12283          	lw	t0,156(sp)
    24a4:	0cc12383          	lw	t2,204(sp)
    24a8:	010e7e33          	and	t3,t3,a6
    24ac:	00597933          	and	s2,s2,t0
    24b0:	04012283          	lw	t0,64(sp)
    24b4:	01074733          	xor	a4,a4,a6
    24b8:	fff64613          	not	a2,a2
    24bc:	0072c3b3          	xor	t2,t0,t2
    24c0:	0a412283          	lw	t0,164(sp)
    24c4:	01167633          	and	a2,a2,a7
    24c8:	011bcbb3          	xor	s7,s7,a7
    24cc:	0057f7b3          	and	a5,a5,t0
    24d0:	05412283          	lw	t0,84(sp)
    24d4:	00b7c7b3          	xor	a5,a5,a1
    24d8:	00a94933          	xor	s2,s2,a0
    24dc:	00544433          	xor	s0,s0,t0
    24e0:	02c12283          	lw	t0,44(sp)
    24e4:	0059c9b3          	xor	s3,s3,t0
    24e8:	07412283          	lw	t0,116(sp)
    24ec:	005fcfb3          	xor	t6,t6,t0
    24f0:	05f12c23          	sw	t6,88(sp)
    24f4:	04412f83          	lw	t6,68(sp)
    24f8:	06412283          	lw	t0,100(sp)
    24fc:	07812583          	lw	a1,120(sp)
    2500:	09412803          	lw	a6,148(sp)
    2504:	005fc2b3          	xor	t0,t6,t0
    2508:	09012f83          	lw	t6,144(sp)
    250c:	00b44433          	xor	s0,s0,a1
    2510:	05812583          	lw	a1,88(sp)
    2514:	01ff4f33          	xor	t5,t5,t6
    2518:	07e12a23          	sw	t5,116(sp)
    251c:	04812f03          	lw	t5,72(sp)
    2520:	00b9c9b3          	xor	s3,s3,a1
    2524:	09812583          	lw	a1,152(sp)
    2528:	01ea4a33          	xor	s4,s4,t5
    252c:	02812f03          	lw	t5,40(sp)
    2530:	00b345b3          	xor	a1,t1,a1
    2534:	08b12623          	sw	a1,140(sp)
    2538:	0a412583          	lw	a1,164(sp)
    253c:	01e3c3b3          	xor	t2,t2,t5
    2540:	01812f03          	lw	t5,24(sp)
    2544:	00b6c6b3          	xor	a3,a3,a1
    2548:	01012583          	lw	a1,16(sp)
    254c:	01e2c2b3          	xor	t0,t0,t5
    2550:	08412f03          	lw	t5,132(sp)
    2554:	00ba4a33          	xor	s4,s4,a1
    2558:	07c12583          	lw	a1,124(sp)
    255c:	01ec4c33          	xor	s8,s8,t5
    2560:	08812f03          	lw	t5,136(sp)
    2564:	00b3c3b3          	xor	t2,t2,a1
    2568:	07412583          	lw	a1,116(sp)
    256c:	01eacab3          	xor	s5,s5,t5
    2570:	09c12f03          	lw	t5,156(sp)
    2574:	00b2c2b3          	xor	t0,t0,a1
    2578:	0d012583          	lw	a1,208(sp)
    257c:	01eeceb3          	xor	t4,t4,t5
    2580:	09d12823          	sw	t4,144(sp)
    2584:	00bc4c33          	xor	s8,s8,a1
    2588:	010e4833          	xor	a6,t3,a6
    258c:	09012583          	lw	a1,144(sp)
    2590:	09012023          	sw	a6,128(sp)
    2594:	0a012803          	lw	a6,160(sp)
    2598:	00bacab3          	xor	s5,s5,a1
    259c:	08c12583          	lw	a1,140(sp)
    25a0:	01064633          	xor	a2,a2,a6
    25a4:	07012803          	lw	a6,112(sp)
    25a8:	00b9c9b3          	xor	s3,s3,a1
    25ac:	08012583          	lw	a1,128(sp)
    25b0:	06012e83          	lw	t4,96(sp)
    25b4:	0104c4b3          	xor	s1,s1,a6
    25b8:	06812803          	lw	a6,104(sp)
    25bc:	00e4c4b3          	xor	s1,s1,a4
    25c0:	00f44433          	xor	s0,s0,a5
    25c4:	00ba4a33          	xor	s4,s4,a1
    25c8:	01fadf93          	srli	t6,s5,0x1f
    25cc:	001c1593          	slli	a1,s8,0x1
    25d0:	00c3c3b3          	xor	t2,t2,a2
    25d4:	00d2c2b3          	xor	t0,t0,a3
    25d8:	001a1513          	slli	a0,s4,0x1
    25dc:	00199893          	slli	a7,s3,0x1
    25e0:	00141b13          	slli	s6,s0,0x1
    25e4:	01dd4d33          	xor	s10,s10,t4
    25e8:	010cccb3          	xor	s9,s9,a6
    25ec:	00bf8fb3          	add	t6,t6,a1
    25f0:	00149813          	slli	a6,s1,0x1
    25f4:	01f9de13          	srli	t3,s3,0x1f
    25f8:	01fa5313          	srli	t1,s4,0x1f
    25fc:	01f45593          	srli	a1,s0,0x1f
    2600:	01f4de93          	srli	t4,s1,0x1f
    2604:	017d4d33          	xor	s10,s10,s7
    2608:	012cccb3          	xor	s9,s9,s2
    260c:	00ae0e33          	add	t3,t3,a0
    2610:	01130333          	add	t1,t1,a7
    2614:	00139513          	slli	a0,t2,0x1
    2618:	01f2d893          	srli	a7,t0,0x1f
    261c:	010585b3          	add	a1,a1,a6
    2620:	016e8eb3          	add	t4,t4,s6
    2624:	01f3d813          	srli	a6,t2,0x1f
    2628:	00129b13          	slli	s6,t0,0x1
    262c:	001a9d93          	slli	s11,s5,0x1
    2630:	01fc5f13          	srli	t5,s8,0x1f
    2634:	00a888b3          	add	a7,a7,a0
    2638:	01680833          	add	a6,a6,s6
    263c:	01fcd513          	srli	a0,s9,0x1f
    2640:	001d1b13          	slli	s6,s10,0x1
    2644:	01bf0f33          	add	t5,t5,s11
    2648:	01650533          	add	a0,a0,s6
    264c:	001c9d93          	slli	s11,s9,0x1
    2650:	01fd5b13          	srli	s6,s10,0x1f
    2654:	01bb0b33          	add	s6,s6,s11
    2658:	005b4b33          	xor	s6,s6,t0
    265c:	05c12283          	lw	t0,92(sp)
    2660:	01afcfb3          	xor	t6,t6,s10
    2664:	01534333          	xor	t1,t1,s5
    2668:	01f2cab3          	xor	s5,t0,t6
    266c:	0bc12283          	lw	t0,188(sp)
    2670:	019f4f33          	xor	t5,t5,s9
    2674:	01f74733          	xor	a4,a4,t6
    2678:	01f2cdb3          	xor	s11,t0,t6
    267c:	0ac12283          	lw	t0,172(sp)
    2680:	0145c5b3          	xor	a1,a1,s4
    2684:	01e7c7b3          	xor	a5,a5,t5
    2688:	01f2c2b3          	xor	t0,t0,t6
    268c:	08512a23          	sw	t0,148(sp)
    2690:	07012283          	lw	t0,112(sp)
    2694:	0098c8b3          	xor	a7,a7,s1
    2698:	00754533          	xor	a0,a0,t2
    269c:	01f2ccb3          	xor	s9,t0,t6
    26a0:	05412f83          	lw	t6,84(sp)
    26a4:	013eceb3          	xor	t4,t4,s3
    26a8:	018e4e33          	xor	t3,t3,s8
    26ac:	01efca33          	xor	s4,t6,t5
    26b0:	03c12f83          	lw	t6,60(sp)
    26b4:	00884833          	xor	a6,a6,s0
    26b8:	01c64633          	xor	a2,a2,t3
    26bc:	01efcfb3          	xor	t6,t6,t5
    26c0:	05f12a23          	sw	t6,84(sp)
    26c4:	01c12f83          	lw	t6,28(sp)
    26c8:	0066c6b3          	xor	a3,a3,t1
    26cc:	01efcfb3          	xor	t6,t6,t5
    26d0:	09f12c23          	sw	t6,152(sp)
    26d4:	07812f83          	lw	t6,120(sp)
    26d8:	01efcfb3          	xor	t6,t6,t5
    26dc:	0b812f03          	lw	t5,184(sp)
    26e0:	07f12823          	sw	t6,112(sp)
    26e4:	00bf44b3          	xor	s1,t5,a1
    26e8:	06012f03          	lw	t5,96(sp)
    26ec:	00bf43b3          	xor	t2,t5,a1
    26f0:	0a812f03          	lw	t5,168(sp)
    26f4:	00bf4f33          	xor	t5,t5,a1
    26f8:	03e12e23          	sw	t5,60(sp)
    26fc:	04c12f03          	lw	t5,76(sp)
    2700:	00bf4f33          	xor	t5,t5,a1
    2704:	07e12023          	sw	t5,96(sp)
    2708:	02412f03          	lw	t5,36(sp)
    270c:	00bbc5b3          	xor	a1,s7,a1
    2710:	0ab12223          	sw	a1,164(sp)
    2714:	01df42b3          	xor	t0,t5,t4
    2718:	05012f03          	lw	t5,80(sp)
    271c:	03812583          	lw	a1,56(sp)
    2720:	01df4d33          	xor	s10,t5,t4
    2724:	07c12f03          	lw	t5,124(sp)
    2728:	01d5c433          	xor	s0,a1,t4
    272c:	06812583          	lw	a1,104(sp)
    2730:	01cf4f33          	xor	t5,t5,t3
    2734:	05e12623          	sw	t5,76(sp)
    2738:	02812f03          	lw	t5,40(sp)
    273c:	01d5c5b3          	xor	a1,a1,t4
    2740:	01d94eb3          	xor	t4,s2,t4
    2744:	01cf4c33          	xor	s8,t5,t3
    2748:	0bd12423          	sw	t4,168(sp)
    274c:	0cc12f03          	lw	t5,204(sp)
    2750:	04012e83          	lw	t4,64(sp)
    2754:	01ceceb3          	xor	t4,t4,t3
    2758:	01cf4e33          	xor	t3,t5,t3
    275c:	07412f03          	lw	t5,116(sp)
    2760:	09c12e23          	sw	t3,156(sp)
    2764:	04412e03          	lw	t3,68(sp)
    2768:	006f4f33          	xor	t5,t5,t1
    276c:	05e12223          	sw	t5,68(sp)
    2770:	01812f03          	lw	t5,24(sp)
    2774:	006e4e33          	xor	t3,t3,t1
    2778:	006f4f33          	xor	t5,t5,t1
    277c:	05e12823          	sw	t5,80(sp)
    2780:	06412f03          	lw	t5,100(sp)
    2784:	006f4333          	xor	t1,t5,t1
    2788:	0a612023          	sw	t1,160(sp)
    278c:	08412303          	lw	t1,132(sp)
    2790:	03412b83          	lw	s7,52(sp)
    2794:	011349b3          	xor	s3,t1,a7
    2798:	0b012303          	lw	t1,176(sp)
    279c:	016bcbb3          	xor	s7,s7,s6
    27a0:	05712e23          	sw	s7,92(sp)
    27a4:	01134fb3          	xor	t6,t1,a7
    27a8:	0c812303          	lw	t1,200(sp)
    27ac:	05812b83          	lw	s7,88(sp)
    27b0:	01134333          	xor	t1,t1,a7
    27b4:	02612c23          	sw	t1,56(sp)
    27b8:	0d012303          	lw	t1,208(sp)
    27bc:	016bcbb3          	xor	s7,s7,s6
    27c0:	01134333          	xor	t1,t1,a7
    27c4:	06612223          	sw	t1,100(sp)
    27c8:	0c012303          	lw	t1,192(sp)
    27cc:	011348b3          	xor	a7,t1,a7
    27d0:	07112a23          	sw	a7,116(sp)
    27d4:	08812883          	lw	a7,136(sp)
    27d8:	03012303          	lw	t1,48(sp)
    27dc:	09712423          	sw	s7,136(sp)
    27e0:	0108c933          	xor	s2,a7,a6
    27e4:	0b412883          	lw	a7,180(sp)
    27e8:	00a34333          	xor	t1,t1,a0
    27ec:	01412b83          	lw	s7,20(sp)
    27f0:	0108cf33          	xor	t5,a7,a6
    27f4:	06c12883          	lw	a7,108(sp)
    27f8:	0108c8b3          	xor	a7,a7,a6
    27fc:	05112023          	sw	a7,64(sp)
    2800:	09012883          	lw	a7,144(sp)
    2804:	0108c8b3          	xor	a7,a7,a6
    2808:	07112423          	sw	a7,104(sp)
    280c:	0c412883          	lw	a7,196(sp)
    2810:	0108c833          	xor	a6,a7,a6
    2814:	07012623          	sw	a6,108(sp)
    2818:	04812803          	lw	a6,72(sp)
    281c:	04612423          	sw	t1,72(sp)
    2820:	01012303          	lw	t1,16(sp)
    2824:	08012883          	lw	a7,128(sp)
    2828:	00a84833          	xor	a6,a6,a0
    282c:	00a34333          	xor	t1,t1,a0
    2830:	08612823          	sw	t1,144(sp)
    2834:	02012303          	lw	t1,32(sp)
    2838:	00a8c8b3          	xor	a7,a7,a0
    283c:	00a34533          	xor	a0,t1,a0
    2840:	00a12823          	sw	a0,16(sp)
    2844:	08c12303          	lw	t1,140(sp)
    2848:	02c12503          	lw	a0,44(sp)
    284c:	01634333          	xor	t1,t1,s6
    2850:	01654533          	xor	a0,a0,s6
    2854:	016bcb33          	xor	s6,s7,s6
    2858:	01612a23          	sw	s6,20(sp)
    285c:	00ba1b93          	slli	s7,s4,0xb
    2860:	015adb13          	srli	s6,s5,0x15
    2864:	015a5a13          	srli	s4,s4,0x15
    2868:	00ba9a93          	slli	s5,s5,0xb
    286c:	016b8b33          	add	s6,s7,s6
    2870:	014a8a33          	add	s4,s5,s4
    2874:	03612023          	sw	s6,32(sp)
    2878:	01599a93          	slli	s5,s3,0x15
    287c:	03412223          	sw	s4,36(sp)
    2880:	00b95a13          	srli	s4,s2,0xb
    2884:	015a0a33          	add	s4,s4,s5
    2888:	00b9d993          	srli	s3,s3,0xb
    288c:	01d79a93          	slli	s5,a5,0x1d
    2890:	01591913          	slli	s2,s2,0x15
    2894:	0037d793          	srli	a5,a5,0x3
    2898:	01298933          	add	s2,s3,s2
    289c:	08f12023          	sw	a5,128(sp)
    28a0:	03c12783          	lw	a5,60(sp)
    28a4:	0144d993          	srli	s3,s1,0x14
    28a8:	03212623          	sw	s2,44(sp)
    28ac:	00c49493          	slli	s1,s1,0xc
    28b0:	00c41913          	slli	s2,s0,0xc
    28b4:	01445413          	srli	s0,s0,0x14
    28b8:	00848433          	add	s0,s1,s0
    28bc:	00812e23          	sw	s0,28(sp)
    28c0:	01f7d793          	srli	a5,a5,0x1f
    28c4:	00c12403          	lw	s0,12(sp)
    28c8:	08f12623          	sw	a5,140(sp)
    28cc:	05412783          	lw	a5,84(sp)
    28d0:	00842403          	lw	s0,8(s0)
    28d4:	01390933          	add	s2,s2,s3
    28d8:	01a7d793          	srli	a5,a5,0x1a
    28dc:	0af12623          	sw	a5,172(sp)
    28e0:	05412783          	lw	a5,84(sp)
    28e4:	0c812223          	sw	s0,196(sp)
    28e8:	0126d413          	srli	s0,a3,0x12
    28ec:	02812823          	sw	s0,48(sp)
    28f0:	00e61413          	slli	s0,a2,0xe
    28f4:	02812a23          	sw	s0,52(sp)
    28f8:	00679793          	slli	a5,a5,0x6
    28fc:	00c12403          	lw	s0,12(sp)
    2900:	0af12c23          	sw	a5,184(sp)
    2904:	006d9793          	slli	a5,s11,0x6
    2908:	0af12823          	sw	a5,176(sp)
    290c:	01add793          	srli	a5,s11,0x1a
    2910:	00c42403          	lw	s0,12(s0)
    2914:	0af12a23          	sw	a5,180(sp)
    2918:	00e35793          	srli	a5,t1,0xe
    291c:	03412d83          	lw	s11,52(sp)
    2920:	0cf12e23          	sw	a5,220(sp)
    2924:	03012783          	lw	a5,48(sp)
    2928:	0c812423          	sw	s0,200(sp)
    292c:	004f5413          	srli	s0,t5,0x4
    2930:	01b78db3          	add	s11,a5,s11
    2934:	00e69693          	slli	a3,a3,0xe
    2938:	01289793          	slli	a5,a7,0x12
    293c:	01265613          	srli	a2,a2,0x12
    2940:	04812c23          	sw	s0,88(sp)
    2944:	01cf9413          	slli	s0,t6,0x1c
    2948:	01f2db93          	srli	s7,t0,0x1f
    294c:	06812c23          	sw	s0,120(sp)
    2950:	0ef12023          	sw	a5,224(sp)
    2954:	00ce5413          	srli	s0,t3,0xc
    2958:	00d607b3          	add	a5,a2,a3
    295c:	03412423          	sw	s4,40(sp)
    2960:	01212c23          	sw	s2,24(sp)
    2964:	06812e23          	sw	s0,124(sp)
    2968:	09712223          	sw	s7,132(sp)
    296c:	02f12823          	sw	a5,48(sp)
    2970:	00129b93          	slli	s7,t0,0x1
    2974:	03c12283          	lw	t0,60(sp)
    2978:	04012783          	lw	a5,64(sp)
    297c:	07812683          	lw	a3,120(sp)
    2980:	01cf1f13          	slli	t5,t5,0x1c
    2984:	0077d793          	srli	a5,a5,0x7
    2988:	0af12e23          	sw	a5,188(sp)
    298c:	04012783          	lw	a5,64(sp)
    2990:	004fdf93          	srli	t6,t6,0x4
    2994:	014e9b13          	slli	s6,t4,0x14
    2998:	01979793          	slli	a5,a5,0x19
    299c:	0cf12623          	sw	a5,204(sp)
    29a0:	05812783          	lw	a5,88(sp)
    29a4:	014e1e13          	slli	t3,t3,0x14
    29a8:	00cede93          	srli	t4,t4,0xc
    29ac:	00d787b3          	add	a5,a5,a3
    29b0:	02f12a23          	sw	a5,52(sp)
    29b4:	03812783          	lw	a5,56(sp)
    29b8:	00375a13          	srli	s4,a4,0x3
    29bc:	01d71713          	slli	a4,a4,0x1d
    29c0:	01979693          	slli	a3,a5,0x19
    29c4:	0077d793          	srli	a5,a5,0x7
    29c8:	0cf12023          	sw	a5,192(sp)
    29cc:	01ef87b3          	add	a5,t6,t5
    29d0:	02f12c23          	sw	a5,56(sp)
    29d4:	04412783          	lw	a5,68(sp)
    29d8:	01d55993          	srli	s3,a0,0x1d
    29dc:	00381913          	slli	s2,a6,0x3
    29e0:	0187d793          	srli	a5,a5,0x18
    29e4:	0cf12823          	sw	a5,208(sp)
    29e8:	04412783          	lw	a5,68(sp)
    29ec:	00351513          	slli	a0,a0,0x3
    29f0:	01d85813          	srli	a6,a6,0x1d
    29f4:	00879793          	slli	a5,a5,0x8
    29f8:	0cf12c23          	sw	a5,216(sp)
    29fc:	07c12783          	lw	a5,124(sp)
    2a00:	00d59493          	slli	s1,a1,0xd
    2a04:	0133d413          	srli	s0,t2,0x13
    2a08:	016787b3          	add	a5,a5,s6
    2a0c:	02f12e23          	sw	a5,60(sp)
    2a10:	04c12783          	lw	a5,76(sp)
    2a14:	0135d593          	srli	a1,a1,0x13
    2a18:	00d39393          	slli	t2,t2,0xd
    2a1c:	00879613          	slli	a2,a5,0x8
    2a20:	0187d793          	srli	a5,a5,0x18
    2a24:	0cf12a23          	sw	a5,212(sp)
    2a28:	01ce87b3          	add	a5,t4,t3
    2a2c:	04f12023          	sw	a5,64(sp)
    2a30:	05012783          	lw	a5,80(sp)
    2a34:	00129293          	slli	t0,t0,0x1
    2a38:	011cdf93          	srli	t6,s9,0x11
    2a3c:	0057d793          	srli	a5,a5,0x5
    2a40:	0ef12223          	sw	a5,228(sp)
    2a44:	05012783          	lw	a5,80(sp)
    2a48:	01231313          	slli	t1,t1,0x12
    2a4c:	00e8d893          	srli	a7,a7,0xe
    2a50:	01b79793          	slli	a5,a5,0x1b
    2a54:	0ef12823          	sw	a5,240(sp)
    2a58:	014a87b3          	add	a5,s5,s4
    2a5c:	04f12a23          	sw	a5,84(sp)
    2a60:	01bc1793          	slli	a5,s8,0x1b
    2a64:	0ef12423          	sw	a5,232(sp)
    2a68:	005c5793          	srli	a5,s8,0x5
    2a6c:	0ef12623          	sw	a5,236(sp)
    2a70:	08012783          	lw	a5,128(sp)
    2a74:	00f70c33          	add	s8,a4,a5
    2a78:	05c12783          	lw	a5,92(sp)
    2a7c:	00479793          	slli	a5,a5,0x4
    2a80:	0ef12a23          	sw	a5,244(sp)
    2a84:	05c12783          	lw	a5,92(sp)
    2a88:	01c7d793          	srli	a5,a5,0x1c
    2a8c:	10f12023          	sw	a5,256(sp)
    2a90:	012987b3          	add	a5,s3,s2
    2a94:	04f12223          	sw	a5,68(sp)
    2a98:	04812783          	lw	a5,72(sp)
    2a9c:	0b012703          	lw	a4,176(sp)
    2aa0:	01c7d793          	srli	a5,a5,0x1c
    2aa4:	0ef12c23          	sw	a5,248(sp)
    2aa8:	04812783          	lw	a5,72(sp)
    2aac:	00479793          	slli	a5,a5,0x4
    2ab0:	0ef12e23          	sw	a5,252(sp)
    2ab4:	00a807b3          	add	a5,a6,a0
    2ab8:	04f12423          	sw	a5,72(sp)
    2abc:	06812783          	lw	a5,104(sp)
    2ac0:	01879793          	slli	a5,a5,0x18
    2ac4:	10f12623          	sw	a5,268(sp)
    2ac8:	06812783          	lw	a5,104(sp)
    2acc:	0087d793          	srli	a5,a5,0x8
    2ad0:	10f12c23          	sw	a5,280(sp)
    2ad4:	008487b3          	add	a5,s1,s0
    2ad8:	04f12623          	sw	a5,76(sp)
    2adc:	06412783          	lw	a5,100(sp)
    2ae0:	0087d793          	srli	a5,a5,0x8
    2ae4:	10f12823          	sw	a5,272(sp)
    2ae8:	06412783          	lw	a5,100(sp)
    2aec:	01879793          	slli	a5,a5,0x18
    2af0:	10f12a23          	sw	a5,276(sp)
    2af4:	00b387b3          	add	a5,t2,a1
    2af8:	04f12823          	sw	a5,80(sp)
    2afc:	016d5793          	srli	a5,s10,0x16
    2b00:	10f12223          	sw	a5,260(sp)
    2b04:	00ad1793          	slli	a5,s10,0xa
    2b08:	10f12423          	sw	a5,264(sp)
    2b0c:	08412783          	lw	a5,132(sp)
    2b10:	0b812583          	lw	a1,184(sp)
    2b14:	005787b3          	add	a5,a5,t0
    2b18:	04f12c23          	sw	a5,88(sp)
    2b1c:	06012783          	lw	a5,96(sp)
    2b20:	0167d293          	srli	t0,a5,0x16
    2b24:	00a79d13          	slli	s10,a5,0xa
    2b28:	08c12783          	lw	a5,140(sp)
    2b2c:	017787b3          	add	a5,a5,s7
    2b30:	04f12e23          	sw	a5,92(sp)
    2b34:	07012783          	lw	a5,112(sp)
    2b38:	0117da93          	srli	s5,a5,0x11
    2b3c:	00f79f13          	slli	t5,a5,0xf
    2b40:	0ac12783          	lw	a5,172(sp)
    2b44:	01ef8f33          	add	t5,t6,t5
    2b48:	00e787b3          	add	a5,a5,a4
    2b4c:	0b412703          	lw	a4,180(sp)
    2b50:	06f12023          	sw	a5,96(sp)
    2b54:	00fc9793          	slli	a5,s9,0xf
    2b58:	00b70733          	add	a4,a4,a1
    2b5c:	06e12223          	sw	a4,100(sp)
    2b60:	09812703          	lw	a4,152(sp)
    2b64:	0af12623          	sw	a5,172(sp)
    2b68:	01e71c93          	slli	s9,a4,0x1e
    2b6c:	00275e13          	srli	t3,a4,0x2
    2b70:	0dc12703          	lw	a4,220(sp)
    2b74:	0e012583          	lw	a1,224(sp)
    2b78:	00b70733          	add	a4,a4,a1
    2b7c:	06e12c23          	sw	a4,120(sp)
    2b80:	09412703          	lw	a4,148(sp)
    2b84:	00275713          	srli	a4,a4,0x2
    2b88:	0ae12823          	sw	a4,176(sp)
    2b8c:	09412703          	lw	a4,148(sp)
    2b90:	01e71e93          	slli	t4,a4,0x1e
    2b94:	00688733          	add	a4,a7,t1
    2b98:	06e12e23          	sw	a4,124(sp)
    2b9c:	06c12703          	lw	a4,108(sp)
    2ba0:	01ce8e33          	add	t3,t4,t3
    2ba4:	fffc4e93          	not	t4,s8
    2ba8:	01771713          	slli	a4,a4,0x17
    2bac:	0ae12a23          	sw	a4,180(sp)
    2bb0:	06c12703          	lw	a4,108(sp)
    2bb4:	00975893          	srli	a7,a4,0x9
    2bb8:	0bc12703          	lw	a4,188(sp)
    2bbc:	00d70733          	add	a4,a4,a3
    2bc0:	06e12423          	sw	a4,104(sp)
    2bc4:	07412703          	lw	a4,116(sp)
    2bc8:	0cc12683          	lw	a3,204(sp)
    2bcc:	00975b13          	srli	s6,a4,0x9
    2bd0:	01771313          	slli	t1,a4,0x17
    2bd4:	0c012703          	lw	a4,192(sp)
    2bd8:	011308b3          	add	a7,t1,a7
    2bdc:	00d70733          	add	a4,a4,a3
    2be0:	06e12623          	sw	a4,108(sp)
    2be4:	0a812703          	lw	a4,168(sp)
    2be8:	0d812683          	lw	a3,216(sp)
    2bec:	01e75a13          	srli	s4,a4,0x1e
    2bf0:	00271513          	slli	a0,a4,0x2
    2bf4:	0d012703          	lw	a4,208(sp)
    2bf8:	00c70733          	add	a4,a4,a2
    2bfc:	06e12823          	sw	a4,112(sp)
    2c00:	0a412703          	lw	a4,164(sp)
    2c04:	00271993          	slli	s3,a4,0x2
    2c08:	01e75813          	srli	a6,a4,0x1e
    2c0c:	0d412703          	lw	a4,212(sp)
    2c10:	00a80533          	add	a0,a6,a0
    2c14:	00d70733          	add	a4,a4,a3
    2c18:	06e12a23          	sw	a4,116(sp)
    2c1c:	0a012703          	lw	a4,160(sp)
    2c20:	0e812683          	lw	a3,232(sp)
    2c24:	00771913          	slli	s2,a4,0x7
    2c28:	01975613          	srli	a2,a4,0x19
    2c2c:	0e412703          	lw	a4,228(sp)
    2c30:	00d70733          	add	a4,a4,a3
    2c34:	08e12023          	sw	a4,128(sp)
    2c38:	09c12703          	lw	a4,156(sp)
    2c3c:	0f012683          	lw	a3,240(sp)
    2c40:	01975493          	srli	s1,a4,0x19
    2c44:	00771593          	slli	a1,a4,0x7
    2c48:	0ec12703          	lw	a4,236(sp)
    2c4c:	00c58633          	add	a2,a1,a2
    2c50:	fffdc593          	not	a1,s11
    2c54:	00d70733          	add	a4,a4,a3
    2c58:	08e12223          	sw	a4,132(sp)
    2c5c:	0f412683          	lw	a3,244(sp)
    2c60:	08812703          	lw	a4,136(sp)
    2c64:	0f812383          	lw	t2,248(sp)
    2c68:	10012783          	lw	a5,256(sp)
    2c6c:	0fc12b83          	lw	s7,252(sp)
    2c70:	007686b3          	add	a3,a3,t2
    2c74:	08d12423          	sw	a3,136(sp)
    2c78:	00fb8bb3          	add	s7,s7,a5
    2c7c:	09712623          	sw	s7,140(sp)
    2c80:	10c12783          	lw	a5,268(sp)
    2c84:	11012b83          	lw	s7,272(sp)
    2c88:	09012683          	lw	a3,144(sp)
    2c8c:	00971413          	slli	s0,a4,0x9
    2c90:	017787b3          	add	a5,a5,s7
    2c94:	0176d393          	srli	t2,a3,0x17
    2c98:	11812b83          	lw	s7,280(sp)
    2c9c:	00969693          	slli	a3,a3,0x9
    2ca0:	08f12c23          	sw	a5,152(sp)
    2ca4:	01775713          	srli	a4,a4,0x17
    2ca8:	11412783          	lw	a5,276(sp)
    2cac:	00e68733          	add	a4,a3,a4
    2cb0:	0ae12c23          	sw	a4,184(sp)
    2cb4:	02012703          	lw	a4,32(sp)
    2cb8:	017787b3          	add	a5,a5,s7
    2cbc:	08f12e23          	sw	a5,156(sp)
    2cc0:	10412783          	lw	a5,260(sp)
    2cc4:	fff74313          	not	t1,a4
    2cc8:	01812703          	lw	a4,24(sp)
    2ccc:	01a78d33          	add	s10,a5,s10
    2cd0:	0b112423          	sw	a7,168(sp)
    2cd4:	10812783          	lw	a5,264(sp)
    2cd8:	013a08b3          	add	a7,s4,s3
    2cdc:	0b112e23          	sw	a7,188(sp)
    2ce0:	fff74893          	not	a7,a4
    2ce4:	01012703          	lw	a4,16(sp)
    2ce8:	00f287b3          	add	a5,t0,a5
    2cec:	0bc12023          	sw	t3,160(sp)
    2cf0:	0ca12023          	sw	a0,192(sp)
    2cf4:	0b412e03          	lw	t3,180(sp)
    2cf8:	00990533          	add	a0,s2,s1
    2cfc:	08f12823          	sw	a5,144(sp)
    2d00:	0ac12783          	lw	a5,172(sp)
    2d04:	0aa12623          	sw	a0,172(sp)
    2d08:	fff74513          	not	a0,a4
    2d0c:	02812703          	lw	a4,40(sp)
    2d10:	016e0e33          	add	t3,t3,s6
    2d14:	09e12a23          	sw	t5,148(sp)
    2d18:	0b012f03          	lw	t5,176(sp)
    2d1c:	0ac12823          	sw	a2,176(sp)
    2d20:	00740633          	add	a2,s0,t2
    2d24:	0bc12223          	sw	t3,164(sp)
    2d28:	0ac12a23          	sw	a2,180(sp)
    2d2c:	fff74813          	not	a6,a4
    2d30:	01c12703          	lw	a4,28(sp)
    2d34:	00fa87b3          	add	a5,s5,a5
    2d38:	01ec8cb3          	add	s9,s9,t5
    2d3c:	fff74a13          	not	s4,a4
    2d40:	02412703          	lw	a4,36(sp)
    2d44:	01012e03          	lw	t3,16(sp)
    2d48:	01412b83          	lw	s7,20(sp)
    2d4c:	fff74613          	not	a2,a4
    2d50:	01412703          	lw	a4,20(sp)
    2d54:	01c5f5b3          	and	a1,a1,t3
    2d58:	01b87833          	and	a6,a6,s11
    2d5c:	fff74693          	not	a3,a4
    2d60:	02c12703          	lw	a4,44(sp)
    2d64:	fff74993          	not	s3,a4
    2d68:	03012703          	lw	a4,48(sp)
    2d6c:	fff74493          	not	s1,a4
    2d70:	03412703          	lw	a4,52(sp)
    2d74:	0174f4b3          	and	s1,s1,s7
    2d78:	fff74413          	not	s0,a4
    2d7c:	03c12703          	lw	a4,60(sp)
    2d80:	fff74b13          	not	s6,a4
    2d84:	04412703          	lw	a4,68(sp)
    2d88:	fff74a93          	not	s5,a4
    2d8c:	05412703          	lw	a4,84(sp)
    2d90:	fff74393          	not	t2,a4
    2d94:	04c12703          	lw	a4,76(sp)
    2d98:	fff74f93          	not	t6,a4
    2d9c:	04012703          	lw	a4,64(sp)
    2da0:	fff74913          	not	s2,a4
    2da4:	04812703          	lw	a4,72(sp)
    2da8:	fff74f13          	not	t5,a4
    2dac:	03812703          	lw	a4,56(sp)
    2db0:	fff74293          	not	t0,a4
    2db4:	02812703          	lw	a4,40(sp)
    2db8:	00e37333          	and	t1,t1,a4
    2dbc:	02012703          	lw	a4,32(sp)
    2dc0:	00e8f8b3          	and	a7,a7,a4
    2dc4:	0c412703          	lw	a4,196(sp)
    2dc8:	01c74733          	xor	a4,a4,t3
    2dcc:	02412e03          	lw	t3,36(sp)
    2dd0:	0ce12223          	sw	a4,196(sp)
    2dd4:	01812703          	lw	a4,24(sp)
    2dd8:	01ca7a33          	and	s4,s4,t3
    2ddc:	0c812e03          	lw	t3,200(sp)
    2de0:	00e57533          	and	a0,a0,a4
    2de4:	05012703          	lw	a4,80(sp)
    2de8:	017e4e33          	xor	t3,t3,s7
    2dec:	01c12823          	sw	t3,16(sp)
    2df0:	00c12e03          	lw	t3,12(sp)
    2df4:	03c12b83          	lw	s7,60(sp)
    2df8:	01b54533          	xor	a0,a0,s11
    2dfc:	010e0e13          	addi	t3,t3,16 # 1010 <pqcrystals_dilithium2_ref_polyeta_unpack+0xd4>
    2e00:	01c12623          	sw	t3,12(sp)
    2e04:	02c12e03          	lw	t3,44(sp)
    2e08:	01747433          	and	s0,s0,s7
    2e0c:	04412b83          	lw	s7,68(sp)
    2e10:	01c67633          	and	a2,a2,t3
    2e14:	01c12e03          	lw	t3,28(sp)
    2e18:	017b7b33          	and	s6,s6,s7
    2e1c:	fff74713          	not	a4,a4
    2e20:	01c6f6b3          	and	a3,a3,t3
    2e24:	03012e03          	lw	t3,48(sp)
    2e28:	01877733          	and	a4,a4,s8
    2e2c:	01c9f9b3          	and	s3,s3,t3
    2e30:	05812e03          	lw	t3,88(sp)
    2e34:	04c12b83          	lw	s7,76(sp)
    2e38:	0ca12a23          	sw	a0,212(sp)
    2e3c:	fffe4e13          	not	t3,t3
    2e40:	017afab3          	and	s5,s5,s7
    2e44:	03412b83          	lw	s7,52(sp)
    2e48:	07012503          	lw	a0,112(sp)
    2e4c:	0173f3b3          	and	t2,t2,s7
    2e50:	05412b83          	lw	s7,84(sp)
    2e54:	fff54513          	not	a0,a0
    2e58:	017fffb3          	and	t6,t6,s7
    2e5c:	04812b83          	lw	s7,72(sp)
    2e60:	01797933          	and	s2,s2,s7
    2e64:	05012b83          	lw	s7,80(sp)
    2e68:	017f7f33          	and	t5,t5,s7
    2e6c:	04012b83          	lw	s7,64(sp)
    2e70:	0172f2b3          	and	t0,t0,s7
    2e74:	03812b83          	lw	s7,56(sp)
    2e78:	0182cc33          	xor	s8,t0,s8
    2e7c:	017efeb3          	and	t4,t4,s7
    2e80:	06012b83          	lw	s7,96(sp)
    2e84:	017e7e33          	and	t3,t3,s7
    2e88:	01812b83          	lw	s7,24(sp)
    2e8c:	01734333          	xor	t1,t1,s7
    2e90:	00612a23          	sw	t1,20(sp)
    2e94:	06012303          	lw	t1,96(sp)
    2e98:	06812b83          	lw	s7,104(sp)
    2e9c:	fff34313          	not	t1,t1
    2ea0:	01737333          	and	t1,t1,s7
    2ea4:	0c412b83          	lw	s7,196(sp)
    2ea8:	011bc8b3          	xor	a7,s7,a7
    2eac:	0d112223          	sw	a7,196(sp)
    2eb0:	06812883          	lw	a7,104(sp)
    2eb4:	07012b83          	lw	s7,112(sp)
    2eb8:	fff8c893          	not	a7,a7
    2ebc:	0178f8b3          	and	a7,a7,s7
    2ec0:	02012b83          	lw	s7,32(sp)
    2ec4:	01784833          	xor	a6,a6,s7
    2ec8:	0d012623          	sw	a6,204(sp)
    2ecc:	07812803          	lw	a6,120(sp)
    2ed0:	05812b83          	lw	s7,88(sp)
    2ed4:	fff84813          	not	a6,a6
    2ed8:	01787833          	and	a6,a6,s7
    2edc:	07812b83          	lw	s7,120(sp)
    2ee0:	01757533          	and	a0,a0,s7
    2ee4:	02812b83          	lw	s7,40(sp)
    2ee8:	0175c5b3          	xor	a1,a1,s7
    2eec:	02b12023          	sw	a1,32(sp)
    2ef0:	06412583          	lw	a1,100(sp)
    2ef4:	06c12b83          	lw	s7,108(sp)
    2ef8:	fff5c593          	not	a1,a1
    2efc:	0175f5b3          	and	a1,a1,s7
    2f00:	01012b83          	lw	s7,16(sp)
    2f04:	014bca33          	xor	s4,s7,s4
    2f08:	0d412423          	sw	s4,200(sp)
    2f0c:	06c12a03          	lw	s4,108(sp)
    2f10:	07412b83          	lw	s7,116(sp)
    2f14:	fffa4a13          	not	s4,s4
    2f18:	017a7a33          	and	s4,s4,s7
    2f1c:	01c12b83          	lw	s7,28(sp)
    2f20:	01764633          	xor	a2,a2,s7
    2f24:	00c12c23          	sw	a2,24(sp)
    2f28:	05c12603          	lw	a2,92(sp)
    2f2c:	06412b83          	lw	s7,100(sp)
    2f30:	fff64613          	not	a2,a2
    2f34:	01767633          	and	a2,a2,s7
    2f38:	03012b83          	lw	s7,48(sp)
    2f3c:	0176c6b3          	xor	a3,a3,s7
    2f40:	0cd12c23          	sw	a3,216(sp)
    2f44:	07c12683          	lw	a3,124(sp)
    2f48:	05c12b83          	lw	s7,92(sp)
    2f4c:	fff6c693          	not	a3,a3
    2f50:	0176f6b3          	and	a3,a3,s7
    2f54:	02412b83          	lw	s7,36(sp)
    2f58:	0179c9b3          	xor	s3,s3,s7
    2f5c:	0d312823          	sw	s3,208(sp)
    2f60:	07412983          	lw	s3,116(sp)
    2f64:	07c12b83          	lw	s7,124(sp)
    2f68:	fff9c993          	not	s3,s3
    2f6c:	0179f9b3          	and	s3,s3,s7
    2f70:	01312823          	sw	s3,16(sp)
    2f74:	02c12983          	lw	s3,44(sp)
    2f78:	08812b83          	lw	s7,136(sp)
    2f7c:	0134c9b3          	xor	s3,s1,s3
    2f80:	08012483          	lw	s1,128(sp)
    2f84:	fff4c493          	not	s1,s1
    2f88:	0174f4b3          	and	s1,s1,s7
    2f8c:	05412b83          	lw	s7,84(sp)
    2f90:	01744433          	xor	s0,s0,s7
    2f94:	03412b83          	lw	s7,52(sp)
    2f98:	02812423          	sw	s0,40(sp)
    2f9c:	08812403          	lw	s0,136(sp)
    2fa0:	017b4b33          	xor	s6,s6,s7
    2fa4:	03c12b83          	lw	s7,60(sp)
    2fa8:	0d612e23          	sw	s6,220(sp)
    2fac:	fffd4b13          	not	s6,s10
    2fb0:	017acab3          	xor	s5,s5,s7
    2fb4:	01512e23          	sw	s5,28(sp)
    2fb8:	09812a83          	lw	s5,152(sp)
    2fbc:	08012b83          	lw	s7,128(sp)
    2fc0:	00fb7b33          	and	s6,s6,a5
    2fc4:	fffaca93          	not	s5,s5
    2fc8:	017afab3          	and	s5,s5,s7
    2fcc:	04c12b83          	lw	s7,76(sp)
    2fd0:	00facab3          	xor	s5,s5,a5
    2fd4:	fff44413          	not	s0,s0
    2fd8:	0173c3b3          	xor	t2,t2,s7
    2fdc:	09812b83          	lw	s7,152(sp)
    2fe0:	0e712223          	sw	t2,228(sp)
    2fe4:	fff7c393          	not	t2,a5
    2fe8:	0173f3b3          	and	t2,t2,s7
    2fec:	04412b83          	lw	s7,68(sp)
    2ff0:	01a3c7b3          	xor	a5,t2,s10
    2ff4:	01a47433          	and	s0,s0,s10
    2ff8:	017fcfb3          	xor	t6,t6,s7
    2ffc:	03f12823          	sw	t6,48(sp)
    3000:	08c12f83          	lw	t6,140(sp)
    3004:	09012b83          	lw	s7,144(sp)
    3008:	ffffcf93          	not	t6,t6
    300c:	017fffb3          	and	t6,t6,s7
    3010:	03812b83          	lw	s7,56(sp)
    3014:	01794933          	xor	s2,s2,s7
    3018:	0f212023          	sw	s2,224(sp)
    301c:	09012903          	lw	s2,144(sp)
    3020:	09412b83          	lw	s7,148(sp)
    3024:	09c12283          	lw	t0,156(sp)
    3028:	fff94913          	not	s2,s2
    302c:	01797933          	and	s2,s2,s7
    3030:	04012b83          	lw	s7,64(sp)
    3034:	fff2c293          	not	t0,t0
    3038:	017f4f33          	xor	t5,t5,s7
    303c:	03e12223          	sw	t5,36(sp)
    3040:	08412f03          	lw	t5,132(sp)
    3044:	08c12b83          	lw	s7,140(sp)
    3048:	ffff4f13          	not	t5,t5
    304c:	017f7f33          	and	t5,t5,s7
    3050:	08412b83          	lw	s7,132(sp)
    3054:	0172f2b3          	and	t0,t0,s7
    3058:	05012b83          	lw	s7,80(sp)
    305c:	017eceb3          	xor	t4,t4,s7
    3060:	0fd12423          	sw	t4,232(sp)
    3064:	09412e83          	lw	t4,148(sp)
    3068:	09c12b83          	lw	s7,156(sp)
    306c:	fffece93          	not	t4,t4
    3070:	017efeb3          	and	t4,t4,s7
    3074:	04812b83          	lw	s7,72(sp)
    3078:	01774733          	xor	a4,a4,s7
    307c:	0a412b83          	lw	s7,164(sp)
    3080:	02e12a23          	sw	a4,52(sp)
    3084:	fffcc713          	not	a4,s9
    3088:	01777733          	and	a4,a4,s7
    308c:	07812b83          	lw	s7,120(sp)
    3090:	04e12223          	sw	a4,68(sp)
    3094:	017e4e33          	xor	t3,t3,s7
    3098:	07c12c23          	sw	t3,120(sp)
    309c:	0a412e03          	lw	t3,164(sp)
    30a0:	0ac12b83          	lw	s7,172(sp)
    30a4:	fffe4e13          	not	t3,t3
    30a8:	017e7e33          	and	t3,t3,s7
    30ac:	05812b83          	lw	s7,88(sp)
    30b0:	01734333          	xor	t1,t1,s7
    30b4:	04612623          	sw	t1,76(sp)
    30b8:	0ac12303          	lw	t1,172(sp)
    30bc:	0b412b83          	lw	s7,180(sp)
    30c0:	fff34313          	not	t1,t1
    30c4:	01737333          	and	t1,t1,s7
    30c8:	06012b83          	lw	s7,96(sp)
    30cc:	0178c8b3          	xor	a7,a7,s7
    30d0:	07012b83          	lw	s7,112(sp)
    30d4:	07112023          	sw	a7,96(sp)
    30d8:	0bc12883          	lw	a7,188(sp)
    30dc:	01784833          	xor	a6,a6,s7
    30e0:	05012a23          	sw	a6,84(sp)
    30e4:	0b412803          	lw	a6,180(sp)
    30e8:	0bc12b83          	lw	s7,188(sp)
    30ec:	fff8c893          	not	a7,a7
    30f0:	fff84813          	not	a6,a6
    30f4:	01787833          	and	a6,a6,s7
    30f8:	06812b83          	lw	s7,104(sp)
    30fc:	0198f8b3          	and	a7,a7,s9
    3100:	01754533          	xor	a0,a0,s7
    3104:	04a12823          	sw	a0,80(sp)
    3108:	0a812503          	lw	a0,168(sp)
    310c:	05c12703          	lw	a4,92(sp)
    3110:	0b012b83          	lw	s7,176(sp)
    3114:	fff54513          	not	a0,a0
    3118:	0b812d83          	lw	s11,184(sp)
    311c:	01757533          	and	a0,a0,s7
    3120:	00e5cbb3          	xor	s7,a1,a4
    3124:	0b012583          	lw	a1,176(sp)
    3128:	06f12423          	sw	a5,104(sp)
    312c:	08412783          	lw	a5,132(sp)
    3130:	fff5c593          	not	a1,a1
    3134:	01b5f5b3          	and	a1,a1,s11
    3138:	06412d83          	lw	s11,100(sp)
    313c:	06c12703          	lw	a4,108(sp)
    3140:	00ffc7b3          	xor	a5,t6,a5
    3144:	01ba4a33          	xor	s4,s4,s11
    3148:	05412e23          	sw	s4,92(sp)
    314c:	0a012a03          	lw	s4,160(sp)
    3150:	fffa4d93          	not	s11,s4
    3154:	0a812a03          	lw	s4,168(sp)
    3158:	014dfdb3          	and	s11,s11,s4
    315c:	07c12a03          	lw	s4,124(sp)
    3160:	06f12e23          	sw	a5,124(sp)
    3164:	08c12783          	lw	a5,140(sp)
    3168:	01464633          	xor	a2,a2,s4
    316c:	06c12223          	sw	a2,100(sp)
    3170:	0c012603          	lw	a2,192(sp)
    3174:	0a012a03          	lw	s4,160(sp)
    3178:	00f94933          	xor	s2,s2,a5
    317c:	fff64613          	not	a2,a2
    3180:	01467633          	and	a2,a2,s4
    3184:	07412a03          	lw	s4,116(sp)
    3188:	09c12783          	lw	a5,156(sp)
    318c:	0146c6b3          	xor	a3,a3,s4
    3190:	02d12c23          	sw	a3,56(sp)
    3194:	0b812683          	lw	a3,184(sp)
    3198:	0c012a03          	lw	s4,192(sp)
    319c:	00ff47b3          	xor	a5,t5,a5
    31a0:	fff6c693          	not	a3,a3
    31a4:	0146f6b3          	and	a3,a3,s4
    31a8:	01012a03          	lw	s4,16(sp)
    31ac:	04f12023          	sw	a5,64(sp)
    31b0:	09412783          	lw	a5,148(sp)
    31b4:	00ea4a33          	xor	s4,s4,a4
    31b8:	09812703          	lw	a4,152(sp)
    31bc:	03412623          	sw	s4,44(sp)
    31c0:	00f2c2b3          	xor	t0,t0,a5
    31c4:	00e4c733          	xor	a4,s1,a4
    31c8:	02e12e23          	sw	a4,60(sp)
    31cc:	08012703          	lw	a4,128(sp)
    31d0:	00e44733          	xor	a4,s0,a4
    31d4:	06e12a23          	sw	a4,116(sp)
    31d8:	08812703          	lw	a4,136(sp)
    31dc:	09012783          	lw	a5,144(sp)
    31e0:	00eb4b33          	xor	s6,s6,a4
    31e4:	00fec7b3          	xor	a5,t4,a5
    31e8:	04412703          	lw	a4,68(sp)
    31ec:	06f12623          	sw	a5,108(sp)
    31f0:	0bc12783          	lw	a5,188(sp)
    31f4:	00f747b3          	xor	a5,a4,a5
    31f8:	019e4733          	xor	a4,t3,s9
    31fc:	04e12223          	sw	a4,68(sp)
    3200:	0a412703          	lw	a4,164(sp)
    3204:	00e34733          	xor	a4,t1,a4
    3208:	06e12823          	sw	a4,112(sp)
    320c:	0b412703          	lw	a4,180(sp)
    3210:	00e8c733          	xor	a4,a7,a4
    3214:	08e12223          	sw	a4,132(sp)
    3218:	0ac12703          	lw	a4,172(sp)
    321c:	00e84eb3          	xor	t4,a6,a4
    3220:	0a012703          	lw	a4,160(sp)
    3224:	00e54733          	xor	a4,a0,a4
    3228:	04e12423          	sw	a4,72(sp)
    322c:	0a812703          	lw	a4,168(sp)
    3230:	00e5c733          	xor	a4,a1,a4
    3234:	08e12023          	sw	a4,128(sp)
    3238:	0c012703          	lw	a4,192(sp)
    323c:	00edcdb3          	xor	s11,s11,a4
    3240:	0b812703          	lw	a4,184(sp)
    3244:	00e64733          	xor	a4,a2,a4
    3248:	08e12423          	sw	a4,136(sp)
    324c:	0b012703          	lw	a4,176(sp)
    3250:	00e6ca33          	xor	s4,a3,a4
    3254:	00c12683          	lw	a3,12(sp)
    3258:	00005737          	lui	a4,0x5
    325c:	6b870713          	addi	a4,a4,1720 # 56b8 <KeccakF_RoundConstants+0xc0>
    3260:	00d70463          	beq	a4,a3,3268 <KeccakF1600_StatePermute+0x1b10>
    3264:	eb0fe06f          	j	1914 <KeccakF1600_StatePermute+0x1bc>
    3268:	11c12503          	lw	a0,284(sp)
    326c:	00078713          	mv	a4,a5
    3270:	0c412783          	lw	a5,196(sp)
    3274:	01352e23          	sw	s3,28(a0)
    3278:	04c12d03          	lw	s10,76(sp)
    327c:	00f52023          	sw	a5,0(a0)
    3280:	0c812783          	lw	a5,200(sp)
    3284:	05412c83          	lw	s9,84(sp)
    3288:	000c0693          	mv	a3,s8
    328c:	00f52223          	sw	a5,4(a0)
    3290:	01412783          	lw	a5,20(sp)
    3294:	05012c03          	lw	s8,80(sp)
    3298:	00f52423          	sw	a5,8(a0)
    329c:	01812783          	lw	a5,24(sp)
    32a0:	00f52623          	sw	a5,12(a0)
    32a4:	0cc12783          	lw	a5,204(sp)
    32a8:	00f52823          	sw	a5,16(a0)
    32ac:	0d012783          	lw	a5,208(sp)
    32b0:	00f52a23          	sw	a5,20(a0)
    32b4:	02012783          	lw	a5,32(sp)
    32b8:	00f52c23          	sw	a5,24(a0)
    32bc:	0d412783          	lw	a5,212(sp)
    32c0:	02f52023          	sw	a5,32(a0)
    32c4:	0d812783          	lw	a5,216(sp)
    32c8:	02f52223          	sw	a5,36(a0)
    32cc:	0dc12783          	lw	a5,220(sp)
    32d0:	02f52423          	sw	a5,40(a0)
    32d4:	0e012783          	lw	a5,224(sp)
    32d8:	02f52623          	sw	a5,44(a0)
    32dc:	01c12783          	lw	a5,28(sp)
    32e0:	02f52823          	sw	a5,48(a0)
    32e4:	02412783          	lw	a5,36(sp)
    32e8:	02f52a23          	sw	a5,52(a0)
    32ec:	03012783          	lw	a5,48(sp)
    32f0:	02f52c23          	sw	a5,56(a0)
    32f4:	03412783          	lw	a5,52(sp)
    32f8:	05a52823          	sw	s10,80(a0)
    32fc:	05752a23          	sw	s7,84(a0)
    3300:	02f52e23          	sw	a5,60(a0)
    3304:	0e412783          	lw	a5,228(sp)
    3308:	07852023          	sw	s8,96(a0)
    330c:	07952423          	sw	s9,104(a0)
    3310:	04f52023          	sw	a5,64(a0)
    3314:	0e812783          	lw	a5,232(sp)
    3318:	09652023          	sw	s6,128(a0)
    331c:	09252223          	sw	s2,132(a0)
    3320:	04f52223          	sw	a5,68(a0)
    3324:	02812783          	lw	a5,40(sp)
    3328:	04d52623          	sw	a3,76(a0)
    332c:	04f52423          	sw	a5,72(a0)
    3330:	06012783          	lw	a5,96(sp)
    3334:	04f52c23          	sw	a5,88(a0)
    3338:	05c12783          	lw	a5,92(sp)
    333c:	04f52e23          	sw	a5,92(a0)
    3340:	02c12783          	lw	a5,44(sp)
    3344:	06f52223          	sw	a5,100(a0)
    3348:	03812783          	lw	a5,56(sp)
    334c:	06f52623          	sw	a5,108(a0)
    3350:	07812783          	lw	a5,120(sp)
    3354:	06f52823          	sw	a5,112(a0)
    3358:	06412783          	lw	a5,100(sp)
    335c:	06f52a23          	sw	a5,116(a0)
    3360:	07412783          	lw	a5,116(sp)
    3364:	06f52c23          	sw	a5,120(a0)
    3368:	07c12783          	lw	a5,124(sp)
    336c:	06f52e23          	sw	a5,124(a0)
    3370:	06812783          	lw	a5,104(sp)
    3374:	08f52423          	sw	a5,136(a0)
    3378:	06c12783          	lw	a5,108(sp)
    337c:	14c12403          	lw	s0,332(sp)
    3380:	14812483          	lw	s1,328(sp)
    3384:	08f52623          	sw	a5,140(a0)
    3388:	03c12783          	lw	a5,60(sp)
    338c:	14412903          	lw	s2,324(sp)
    3390:	14012983          	lw	s3,320(sp)
    3394:	08f52c23          	sw	a5,152(a0)
    3398:	04012783          	lw	a5,64(sp)
    339c:	13412b03          	lw	s6,308(sp)
    33a0:	13012b83          	lw	s7,304(sp)
    33a4:	08f52e23          	sw	a5,156(a0)
    33a8:	04412783          	lw	a5,68(sp)
    33ac:	09552823          	sw	s5,144(a0)
    33b0:	0b452a23          	sw	s4,180(a0)
    33b4:	0af52023          	sw	a5,160(a0)
    33b8:	04812783          	lw	a5,72(sp)
    33bc:	13c12a03          	lw	s4,316(sp)
    33c0:	13812a83          	lw	s5,312(sp)
    33c4:	0af52223          	sw	a5,164(a0)
    33c8:	07012783          	lw	a5,112(sp)
    33cc:	0db52223          	sw	s11,196(a0)
    33d0:	08552a23          	sw	t0,148(a0)
    33d4:	0af52423          	sw	a5,168(a0)
    33d8:	08012783          	lw	a5,128(sp)
    33dc:	0bd52823          	sw	t4,176(a0)
    33e0:	0ce52023          	sw	a4,192(a0)
    33e4:	0af52623          	sw	a5,172(a0)
    33e8:	08412783          	lw	a5,132(sp)
    33ec:	0af52c23          	sw	a5,184(a0)
    33f0:	08812783          	lw	a5,136(sp)
    33f4:	0af52e23          	sw	a5,188(a0)
    33f8:	12c12c03          	lw	s8,300(sp)
    33fc:	12812c83          	lw	s9,296(sp)
    3400:	12412d03          	lw	s10,292(sp)
    3404:	12012d83          	lw	s11,288(sp)
    3408:	15010113          	addi	sp,sp,336
    340c:	00008067          	ret

00003410 <keccak_squeeze.constprop.1>:
    3410:	fd010113          	addi	sp,sp,-48
    3414:	02812423          	sw	s0,40(sp)
    3418:	01412c23          	sw	s4,24(sp)
    341c:	01512a23          	sw	s5,20(sp)
    3420:	02112623          	sw	ra,44(sp)
    3424:	02912223          	sw	s1,36(sp)
    3428:	0076f713          	andi	a4,a3,7
    342c:	00068a93          	mv	s5,a3
    3430:	00050413          	mv	s0,a0
    3434:	00058a13          	mv	s4,a1
    3438:	1a070063          	beqz	a4,35d8 <keccak_squeeze.constprop.1+0x1c8>
    343c:	ff86f693          	andi	a3,a3,-8
    3440:	00d606b3          	add	a3,a2,a3
    3444:	0046a783          	lw	a5,4(a3)
    3448:	0006a803          	lw	a6,0(a3)
    344c:	0087d513          	srli	a0,a5,0x8
    3450:	0107d593          	srli	a1,a5,0x10
    3454:	0187d693          	srli	a3,a5,0x18
    3458:	00f10623          	sb	a5,12(sp)
    345c:	01012423          	sw	a6,8(sp)
    3460:	00a106a3          	sb	a0,13(sp)
    3464:	00b10723          	sb	a1,14(sp)
    3468:	00d107a3          	sb	a3,15(sp)
    346c:	320a0e63          	beqz	s4,37a8 <keccak_squeeze.constprop.1+0x398>
    3470:	03212023          	sw	s2,32(sp)
    3474:	002707b3          	add	a5,a4,sp
    3478:	0087c503          	lbu	a0,8(a5)
    347c:	fffa0593          	addi	a1,s4,-1
    3480:	00a40023          	sb	a0,0(s0)
    3484:	34058063          	beqz	a1,37c4 <keccak_squeeze.constprop.1+0x3b4>
    3488:	ff970513          	addi	a0,a4,-7
    348c:	32050c63          	beqz	a0,37c4 <keccak_squeeze.constprop.1+0x3b4>
    3490:	002707b3          	add	a5,a4,sp
    3494:	0097c503          	lbu	a0,9(a5)
    3498:	ffea0593          	addi	a1,s4,-2
    349c:	00a400a3          	sb	a0,1(s0)
    34a0:	34058c63          	beqz	a1,37f8 <keccak_squeeze.constprop.1+0x3e8>
    34a4:	ffa70513          	addi	a0,a4,-6
    34a8:	34050863          	beqz	a0,37f8 <keccak_squeeze.constprop.1+0x3e8>
    34ac:	002707b3          	add	a5,a4,sp
    34b0:	00a7c503          	lbu	a0,10(a5)
    34b4:	ffda0593          	addi	a1,s4,-3
    34b8:	00a40123          	sb	a0,2(s0)
    34bc:	34058663          	beqz	a1,3808 <keccak_squeeze.constprop.1+0x3f8>
    34c0:	ffb70513          	addi	a0,a4,-5
    34c4:	34050263          	beqz	a0,3808 <keccak_squeeze.constprop.1+0x3f8>
    34c8:	002707b3          	add	a5,a4,sp
    34cc:	00b7c503          	lbu	a0,11(a5)
    34d0:	ffca0593          	addi	a1,s4,-4
    34d4:	00a401a3          	sb	a0,3(s0)
    34d8:	34058063          	beqz	a1,3818 <keccak_squeeze.constprop.1+0x408>
    34dc:	ffc70513          	addi	a0,a4,-4
    34e0:	32050c63          	beqz	a0,3818 <keccak_squeeze.constprop.1+0x408>
    34e4:	002707b3          	add	a5,a4,sp
    34e8:	00c7c503          	lbu	a0,12(a5)
    34ec:	ffba0593          	addi	a1,s4,-5
    34f0:	00a40223          	sb	a0,4(s0)
    34f4:	2e058063          	beqz	a1,37d4 <keccak_squeeze.constprop.1+0x3c4>
    34f8:	ffd70513          	addi	a0,a4,-3
    34fc:	2c050c63          	beqz	a0,37d4 <keccak_squeeze.constprop.1+0x3c4>
    3500:	002707b3          	add	a5,a4,sp
    3504:	00d7c583          	lbu	a1,13(a5)
    3508:	ffaa0793          	addi	a5,s4,-6
    350c:	00b402a3          	sb	a1,5(s0)
    3510:	30078c63          	beqz	a5,3828 <keccak_squeeze.constprop.1+0x418>
    3514:	ffe70713          	addi	a4,a4,-2
    3518:	30070863          	beqz	a4,3828 <keccak_squeeze.constprop.1+0x418>
    351c:	00d40323          	sb	a3,6(s0)
    3520:	007a8a93          	addi	s5,s5,7
    3524:	ff9a0a13          	addi	s4,s4,-7
    3528:	00740413          	addi	s0,s0,7
    352c:	00060913          	mv	s2,a2
    3530:	0a0a8a63          	beqz	s5,35e4 <keccak_squeeze.constprop.1+0x1d4>
    3534:	08800513          	li	a0,136
    3538:	41550533          	sub	a0,a0,s5
    353c:	24aa6a63          	bltu	s4,a0,3790 <keccak_squeeze.constprop.1+0x380>
    3540:	00355793          	srli	a5,a0,0x3
    3544:	06078263          	beqz	a5,35a8 <keccak_squeeze.constprop.1+0x198>
    3548:	00379793          	slli	a5,a5,0x3
    354c:	ff8af713          	andi	a4,s5,-8
    3550:	008785b3          	add	a1,a5,s0
    3554:	00e60733          	add	a4,a2,a4
    3558:	00040793          	mv	a5,s0
    355c:	00072603          	lw	a2,0(a4)
    3560:	00472683          	lw	a3,4(a4)
    3564:	00878793          	addi	a5,a5,8
    3568:	00865f13          	srli	t5,a2,0x8
    356c:	01065e93          	srli	t4,a2,0x10
    3570:	01865e13          	srli	t3,a2,0x18
    3574:	0086d313          	srli	t1,a3,0x8
    3578:	0106d893          	srli	a7,a3,0x10
    357c:	0186d813          	srli	a6,a3,0x18
    3580:	ffe78ca3          	sb	t5,-7(a5)
    3584:	fec78c23          	sb	a2,-8(a5)
    3588:	fed78e23          	sb	a3,-4(a5)
    358c:	ffd78d23          	sb	t4,-6(a5)
    3590:	ffc78da3          	sb	t3,-5(a5)
    3594:	fe678ea3          	sb	t1,-3(a5)
    3598:	ff178f23          	sb	a7,-2(a5)
    359c:	ff078fa3          	sb	a6,-1(a5)
    35a0:	00870713          	addi	a4,a4,8
    35a4:	faf59ce3          	bne	a1,a5,355c <keccak_squeeze.constprop.1+0x14c>
    35a8:	014a8ab3          	add	s5,s5,s4
    35ac:	f78a8a13          	addi	s4,s5,-136
    35b0:	08700793          	li	a5,135
    35b4:	00a40433          	add	s0,s0,a0
    35b8:	00000a93          	li	s5,0
    35bc:	0347e863          	bltu	a5,s4,35ec <keccak_squeeze.constprop.1+0x1dc>
    35c0:	220a0663          	beqz	s4,37ec <keccak_squeeze.constprop.1+0x3dc>
    35c4:	000a0493          	mv	s1,s4
    35c8:	00090513          	mv	a0,s2
    35cc:	98cfe0ef          	jal	1758 <KeccakF1600_StatePermute>
    35d0:	00000a93          	li	s5,0
    35d4:	0b80006f          	j	368c <keccak_squeeze.constprop.1+0x27c>
    35d8:	03212023          	sw	s2,32(sp)
    35dc:	00060913          	mv	s2,a2
    35e0:	f40a9ae3          	bnez	s5,3534 <keccak_squeeze.constprop.1+0x124>
    35e4:	08700793          	li	a5,135
    35e8:	1f47fe63          	bgeu	a5,s4,37e4 <keccak_squeeze.constprop.1+0x3d4>
    35ec:	01612823          	sw	s6,16(sp)
    35f0:	08840b13          	addi	s6,s0,136
    35f4:	01312e23          	sw	s3,28(sp)
    35f8:	08700493          	li	s1,135
    35fc:	000b0993          	mv	s3,s6
    3600:	00090513          	mv	a0,s2
    3604:	954fe0ef          	jal	1758 <KeccakF1600_StatePermute>
    3608:	00040793          	mv	a5,s0
    360c:	00090613          	mv	a2,s2
    3610:	00062683          	lw	a3,0(a2)
    3614:	00462703          	lw	a4,4(a2)
    3618:	00878793          	addi	a5,a5,8
    361c:	0086de93          	srli	t4,a3,0x8
    3620:	0106de13          	srli	t3,a3,0x10
    3624:	0186d313          	srli	t1,a3,0x18
    3628:	00875893          	srli	a7,a4,0x8
    362c:	01075813          	srli	a6,a4,0x10
    3630:	01875593          	srli	a1,a4,0x18
    3634:	ffd78ca3          	sb	t4,-7(a5)
    3638:	fed78c23          	sb	a3,-8(a5)
    363c:	fee78e23          	sb	a4,-4(a5)
    3640:	ffc78d23          	sb	t3,-6(a5)
    3644:	fe678da3          	sb	t1,-5(a5)
    3648:	ff178ea3          	sb	a7,-3(a5)
    364c:	ff078f23          	sb	a6,-2(a5)
    3650:	feb78fa3          	sb	a1,-1(a5)
    3654:	00860613          	addi	a2,a2,8
    3658:	faf99ce3          	bne	s3,a5,3610 <keccak_squeeze.constprop.1+0x200>
    365c:	f78a0a13          	addi	s4,s4,-136
    3660:	08898993          	addi	s3,s3,136
    3664:	000b0413          	mv	s0,s6
    3668:	0144f663          	bgeu	s1,s4,3674 <keccak_squeeze.constprop.1+0x264>
    366c:	088b0b13          	addi	s6,s6,136
    3670:	f91ff06f          	j	3600 <keccak_squeeze.constprop.1+0x1f0>
    3674:	000a8493          	mv	s1,s5
    3678:	0e0a0663          	beqz	s4,3764 <keccak_squeeze.constprop.1+0x354>
    367c:	01c12983          	lw	s3,28(sp)
    3680:	01012b03          	lw	s6,16(sp)
    3684:	015a04b3          	add	s1,s4,s5
    3688:	f40a80e3          	beqz	s5,35c8 <keccak_squeeze.constprop.1+0x1b8>
    368c:	003a5513          	srli	a0,s4,0x3
    3690:	06050663          	beqz	a0,36fc <keccak_squeeze.constprop.1+0x2ec>
    3694:	00351513          	slli	a0,a0,0x3
    3698:	ff8af613          	andi	a2,s5,-8
    369c:	00a40f33          	add	t5,s0,a0
    36a0:	00c90633          	add	a2,s2,a2
    36a4:	00040793          	mv	a5,s0
    36a8:	00062683          	lw	a3,0(a2)
    36ac:	00462703          	lw	a4,4(a2)
    36b0:	00878793          	addi	a5,a5,8
    36b4:	0086de93          	srli	t4,a3,0x8
    36b8:	0106de13          	srli	t3,a3,0x10
    36bc:	0186d313          	srli	t1,a3,0x18
    36c0:	00875893          	srli	a7,a4,0x8
    36c4:	01075813          	srli	a6,a4,0x10
    36c8:	01875593          	srli	a1,a4,0x18
    36cc:	ffd78ca3          	sb	t4,-7(a5)
    36d0:	fed78c23          	sb	a3,-8(a5)
    36d4:	fee78e23          	sb	a4,-4(a5)
    36d8:	ffc78d23          	sb	t3,-6(a5)
    36dc:	fe678da3          	sb	t1,-5(a5)
    36e0:	ff178ea3          	sb	a7,-3(a5)
    36e4:	ff078f23          	sb	a6,-2(a5)
    36e8:	feb78fa3          	sb	a1,-1(a5)
    36ec:	00860613          	addi	a2,a2,8
    36f0:	fbe79ce3          	bne	a5,t5,36a8 <keccak_squeeze.constprop.1+0x298>
    36f4:	40aa0a33          	sub	s4,s4,a0
    36f8:	00aa8ab3          	add	s5,s5,a0
    36fc:	ff8afa93          	andi	s5,s5,-8
    3700:	01590933          	add	s2,s2,s5
    3704:	00492783          	lw	a5,4(s2)
    3708:	00092583          	lw	a1,0(s2)
    370c:	0087d613          	srli	a2,a5,0x8
    3710:	0107d693          	srli	a3,a5,0x10
    3714:	0187d713          	srli	a4,a5,0x18
    3718:	00f10623          	sb	a5,12(sp)
    371c:	00b12423          	sw	a1,8(sp)
    3720:	00c106a3          	sb	a2,13(sp)
    3724:	00d10723          	sb	a3,14(sp)
    3728:	00e107a3          	sb	a4,15(sp)
    372c:	080a0863          	beqz	s4,37bc <keccak_squeeze.constprop.1+0x3ac>
    3730:	000a0613          	mv	a2,s4
    3734:	00a40533          	add	a0,s0,a0
    3738:	00810593          	addi	a1,sp,8
    373c:	191010ef          	jal	50cc <memcpy>
    3740:	02012903          	lw	s2,32(sp)
    3744:	02c12083          	lw	ra,44(sp)
    3748:	02812403          	lw	s0,40(sp)
    374c:	01812a03          	lw	s4,24(sp)
    3750:	01412a83          	lw	s5,20(sp)
    3754:	00048513          	mv	a0,s1
    3758:	02412483          	lw	s1,36(sp)
    375c:	03010113          	addi	sp,sp,48
    3760:	00008067          	ret
    3764:	02c12083          	lw	ra,44(sp)
    3768:	02812403          	lw	s0,40(sp)
    376c:	02012903          	lw	s2,32(sp)
    3770:	01c12983          	lw	s3,28(sp)
    3774:	01012b03          	lw	s6,16(sp)
    3778:	01812a03          	lw	s4,24(sp)
    377c:	01412a83          	lw	s5,20(sp)
    3780:	00048513          	mv	a0,s1
    3784:	02412483          	lw	s1,36(sp)
    3788:	03010113          	addi	sp,sp,48
    378c:	00008067          	ret
    3790:	08700793          	li	a5,135
    3794:	e547ece3          	bltu	a5,s4,35ec <keccak_squeeze.constprop.1+0x1dc>
    3798:	000a8493          	mv	s1,s5
    379c:	020a0063          	beqz	s4,37bc <keccak_squeeze.constprop.1+0x3ac>
    37a0:	014a84b3          	add	s1,s5,s4
    37a4:	ee9ff06f          	j	368c <keccak_squeeze.constprop.1+0x27c>
    37a8:	08800793          	li	a5,136
    37ac:	000a8493          	mv	s1,s5
    37b0:	f8fa9ae3          	bne	s5,a5,3744 <keccak_squeeze.constprop.1+0x334>
    37b4:	00000493          	li	s1,0
    37b8:	f8dff06f          	j	3744 <keccak_squeeze.constprop.1+0x334>
    37bc:	02012903          	lw	s2,32(sp)
    37c0:	f85ff06f          	j	3744 <keccak_squeeze.constprop.1+0x334>
    37c4:	00140413          	addi	s0,s0,1
    37c8:	001a8a93          	addi	s5,s5,1
    37cc:	00058a13          	mv	s4,a1
    37d0:	e0dff06f          	j	35dc <keccak_squeeze.constprop.1+0x1cc>
    37d4:	00540413          	addi	s0,s0,5
    37d8:	005a8a93          	addi	s5,s5,5
    37dc:	00058a13          	mv	s4,a1
    37e0:	dfdff06f          	j	35dc <keccak_squeeze.constprop.1+0x1cc>
    37e4:	000a0493          	mv	s1,s4
    37e8:	de0a10e3          	bnez	s4,35c8 <keccak_squeeze.constprop.1+0x1b8>
    37ec:	02012903          	lw	s2,32(sp)
    37f0:	00000493          	li	s1,0
    37f4:	f51ff06f          	j	3744 <keccak_squeeze.constprop.1+0x334>
    37f8:	00240413          	addi	s0,s0,2
    37fc:	002a8a93          	addi	s5,s5,2
    3800:	00058a13          	mv	s4,a1
    3804:	dd9ff06f          	j	35dc <keccak_squeeze.constprop.1+0x1cc>
    3808:	00340413          	addi	s0,s0,3
    380c:	003a8a93          	addi	s5,s5,3
    3810:	00058a13          	mv	s4,a1
    3814:	dc9ff06f          	j	35dc <keccak_squeeze.constprop.1+0x1cc>
    3818:	00440413          	addi	s0,s0,4
    381c:	004a8a93          	addi	s5,s5,4
    3820:	00058a13          	mv	s4,a1
    3824:	db9ff06f          	j	35dc <keccak_squeeze.constprop.1+0x1cc>
    3828:	00640413          	addi	s0,s0,6
    382c:	006a8a93          	addi	s5,s5,6
    3830:	00078a13          	mv	s4,a5
    3834:	da9ff06f          	j	35dc <keccak_squeeze.constprop.1+0x1cc>

00003838 <keccak_absorb.constprop.1>:
    3838:	fd010113          	addi	sp,sp,-48
    383c:	02812423          	sw	s0,40(sp)
    3840:	02912223          	sw	s1,36(sp)
    3844:	01312e23          	sw	s3,28(sp)
    3848:	01612823          	sw	s6,16(sp)
    384c:	02112623          	sw	ra,44(sp)
    3850:	03212023          	sw	s2,32(sp)
    3854:	00012423          	sw	zero,8(sp)
    3858:	00012623          	sw	zero,12(sp)
    385c:	0075f713          	andi	a4,a1,7
    3860:	00058493          	mv	s1,a1
    3864:	00060b13          	mv	s6,a2
    3868:	00068993          	mv	s3,a3
    386c:	00050413          	mv	s0,a0
    3870:	14070a63          	beqz	a4,39c4 <keccak_absorb.constprop.1+0x18c>
    3874:	0c068e63          	beqz	a3,3950 <keccak_absorb.constprop.1+0x118>
    3878:	00064603          	lbu	a2,0(a2)
    387c:	002707b3          	add	a5,a4,sp
    3880:	fff68693          	addi	a3,a3,-1
    3884:	00c78423          	sb	a2,8(a5)
    3888:	00170793          	addi	a5,a4,1
    388c:	40068263          	beqz	a3,3c90 <keccak_absorb.constprop.1+0x458>
    3890:	ff970613          	addi	a2,a4,-7
    3894:	3e060e63          	beqz	a2,3c90 <keccak_absorb.constprop.1+0x458>
    3898:	001b4603          	lbu	a2,1(s6)
    389c:	002787b3          	add	a5,a5,sp
    38a0:	ffe98693          	addi	a3,s3,-2
    38a4:	00c78423          	sb	a2,8(a5)
    38a8:	00270793          	addi	a5,a4,2
    38ac:	40068663          	beqz	a3,3cb8 <keccak_absorb.constprop.1+0x480>
    38b0:	ffa70613          	addi	a2,a4,-6
    38b4:	40060263          	beqz	a2,3cb8 <keccak_absorb.constprop.1+0x480>
    38b8:	002b4603          	lbu	a2,2(s6)
    38bc:	002787b3          	add	a5,a5,sp
    38c0:	ffd98693          	addi	a3,s3,-3
    38c4:	00c78423          	sb	a2,8(a5)
    38c8:	00370793          	addi	a5,a4,3
    38cc:	40068063          	beqz	a3,3ccc <keccak_absorb.constprop.1+0x494>
    38d0:	ffb70613          	addi	a2,a4,-5
    38d4:	3e060c63          	beqz	a2,3ccc <keccak_absorb.constprop.1+0x494>
    38d8:	003b4603          	lbu	a2,3(s6)
    38dc:	002787b3          	add	a5,a5,sp
    38e0:	ffc98693          	addi	a3,s3,-4
    38e4:	00c78423          	sb	a2,8(a5)
    38e8:	00470793          	addi	a5,a4,4
    38ec:	3e068a63          	beqz	a3,3ce0 <keccak_absorb.constprop.1+0x4a8>
    38f0:	ffc70613          	addi	a2,a4,-4
    38f4:	3e060663          	beqz	a2,3ce0 <keccak_absorb.constprop.1+0x4a8>
    38f8:	004b4603          	lbu	a2,4(s6)
    38fc:	002787b3          	add	a5,a5,sp
    3900:	ffb98693          	addi	a3,s3,-5
    3904:	00c78423          	sb	a2,8(a5)
    3908:	00570793          	addi	a5,a4,5
    390c:	38068c63          	beqz	a3,3ca4 <keccak_absorb.constprop.1+0x46c>
    3910:	ffd70613          	addi	a2,a4,-3
    3914:	38060863          	beqz	a2,3ca4 <keccak_absorb.constprop.1+0x46c>
    3918:	005b4603          	lbu	a2,5(s6)
    391c:	002787b3          	add	a5,a5,sp
    3920:	ffa98693          	addi	a3,s3,-6
    3924:	00c78423          	sb	a2,8(a5)
    3928:	00670713          	addi	a4,a4,6
    392c:	3c068463          	beqz	a3,3cf4 <keccak_absorb.constprop.1+0x4bc>
    3930:	ff870793          	addi	a5,a4,-8
    3934:	3c078063          	beqz	a5,3cf4 <keccak_absorb.constprop.1+0x4bc>
    3938:	006b4783          	lbu	a5,6(s6)
    393c:	ff998993          	addi	s3,s3,-7
    3940:	00758493          	addi	s1,a1,7
    3944:	00f107a3          	sb	a5,15(sp)
    3948:	007b0b13          	addi	s6,s6,7
    394c:	00800713          	li	a4,8
    3950:	00a14683          	lbu	a3,10(sp)
    3954:	00d14803          	lbu	a6,13(sp)
    3958:	00914883          	lbu	a7,9(sp)
    395c:	40e487b3          	sub	a5,s1,a4
    3960:	00c14e03          	lbu	t3,12(sp)
    3964:	00e14503          	lbu	a0,14(sp)
    3968:	00f14603          	lbu	a2,15(sp)
    396c:	00814303          	lbu	t1,8(sp)
    3970:	00b14583          	lbu	a1,11(sp)
    3974:	ff87f793          	andi	a5,a5,-8
    3978:	00f407b3          	add	a5,s0,a5
    397c:	01069713          	slli	a4,a3,0x10
    3980:	00889893          	slli	a7,a7,0x8
    3984:	00881693          	slli	a3,a6,0x8
    3988:	01176733          	or	a4,a4,a7
    398c:	0047a803          	lw	a6,4(a5)
    3990:	0007a883          	lw	a7,0(a5)
    3994:	01c6e6b3          	or	a3,a3,t3
    3998:	01051513          	slli	a0,a0,0x10
    399c:	00676733          	or	a4,a4,t1
    39a0:	00d56533          	or	a0,a0,a3
    39a4:	01859593          	slli	a1,a1,0x18
    39a8:	01861693          	slli	a3,a2,0x18
    39ac:	00e5e633          	or	a2,a1,a4
    39b0:	00a6e733          	or	a4,a3,a0
    39b4:	00e84733          	xor	a4,a6,a4
    39b8:	00c8c6b3          	xor	a3,a7,a2
    39bc:	00d7a023          	sw	a3,0(a5)
    39c0:	00e7a223          	sw	a4,4(a5)
    39c4:	00048863          	beqz	s1,39d4 <keccak_absorb.constprop.1+0x19c>
    39c8:	08800313          	li	t1,136
    39cc:	40930333          	sub	t1,t1,s1
    39d0:	2069f463          	bgeu	s3,t1,3bd8 <keccak_absorb.constprop.1+0x3a0>
    39d4:	08700913          	li	s2,135
    39d8:	0b397c63          	bgeu	s2,s3,3a90 <keccak_absorb.constprop.1+0x258>
    39dc:	01512a23          	sw	s5,20(sp)
    39e0:	088b0a93          	addi	s5,s6,136
    39e4:	01412c23          	sw	s4,24(sp)
    39e8:	000a8a13          	mv	s4,s5
    39ec:	000b0793          	mv	a5,s6
    39f0:	00040693          	mv	a3,s0
    39f4:	0017c703          	lbu	a4,1(a5)
    39f8:	0027c883          	lbu	a7,2(a5)
    39fc:	0057c803          	lbu	a6,5(a5)
    3a00:	0047ce83          	lbu	t4,4(a5)
    3a04:	0067c503          	lbu	a0,6(a5)
    3a08:	0007ce03          	lbu	t3,0(a5)
    3a0c:	0037c583          	lbu	a1,3(a5)
    3a10:	0077c603          	lbu	a2,7(a5)
    3a14:	01089893          	slli	a7,a7,0x10
    3a18:	00871713          	slli	a4,a4,0x8
    3a1c:	00881813          	slli	a6,a6,0x8
    3a20:	0006a303          	lw	t1,0(a3)
    3a24:	01176733          	or	a4,a4,a7
    3a28:	01d86833          	or	a6,a6,t4
    3a2c:	0046a883          	lw	a7,4(a3)
    3a30:	01051513          	slli	a0,a0,0x10
    3a34:	01c76733          	or	a4,a4,t3
    3a38:	01861613          	slli	a2,a2,0x18
    3a3c:	01859593          	slli	a1,a1,0x18
    3a40:	01056533          	or	a0,a0,a6
    3a44:	00e5e5b3          	or	a1,a1,a4
    3a48:	00a66733          	or	a4,a2,a0
    3a4c:	00e8c733          	xor	a4,a7,a4
    3a50:	00b34633          	xor	a2,t1,a1
    3a54:	00c6a023          	sw	a2,0(a3)
    3a58:	00e6a223          	sw	a4,4(a3)
    3a5c:	00878793          	addi	a5,a5,8
    3a60:	00868693          	addi	a3,a3,8
    3a64:	f94798e3          	bne	a5,s4,39f4 <keccak_absorb.constprop.1+0x1bc>
    3a68:	00040513          	mv	a0,s0
    3a6c:	f7898993          	addi	s3,s3,-136
    3a70:	000a8b13          	mv	s6,s5
    3a74:	ce5fd0ef          	jal	1758 <KeccakF1600_StatePermute>
    3a78:	088a0a13          	addi	s4,s4,136
    3a7c:	01397663          	bgeu	s2,s3,3a88 <keccak_absorb.constprop.1+0x250>
    3a80:	088a8a93          	addi	s5,s5,136
    3a84:	f69ff06f          	j	39ec <keccak_absorb.constprop.1+0x1b4>
    3a88:	01812a03          	lw	s4,24(sp)
    3a8c:	01412a83          	lw	s5,20(sp)
    3a90:	0039d593          	srli	a1,s3,0x3
    3a94:	1e058863          	beqz	a1,3c84 <keccak_absorb.constprop.1+0x44c>
    3a98:	00359593          	slli	a1,a1,0x3
    3a9c:	ff84f613          	andi	a2,s1,-8
    3aa0:	00bb0e33          	add	t3,s6,a1
    3aa4:	00c40633          	add	a2,s0,a2
    3aa8:	000b0713          	mv	a4,s6
    3aac:	00174683          	lbu	a3,1(a4)
    3ab0:	00274783          	lbu	a5,2(a4)
    3ab4:	00574303          	lbu	t1,5(a4)
    3ab8:	00474f83          	lbu	t6,4(a4)
    3abc:	00674883          	lbu	a7,6(a4)
    3ac0:	00074f03          	lbu	t5,0(a4)
    3ac4:	00374803          	lbu	a6,3(a4)
    3ac8:	00774503          	lbu	a0,7(a4)
    3acc:	01079793          	slli	a5,a5,0x10
    3ad0:	00869693          	slli	a3,a3,0x8
    3ad4:	00831313          	slli	t1,t1,0x8
    3ad8:	00062e83          	lw	t4,0(a2)
    3adc:	00f6e6b3          	or	a3,a3,a5
    3ae0:	01f36333          	or	t1,t1,t6
    3ae4:	00462783          	lw	a5,4(a2)
    3ae8:	01089893          	slli	a7,a7,0x10
    3aec:	01e6e6b3          	or	a3,a3,t5
    3af0:	01851513          	slli	a0,a0,0x18
    3af4:	01881813          	slli	a6,a6,0x18
    3af8:	0068e8b3          	or	a7,a7,t1
    3afc:	00d86833          	or	a6,a6,a3
    3b00:	011566b3          	or	a3,a0,a7
    3b04:	00d7c7b3          	xor	a5,a5,a3
    3b08:	010ec533          	xor	a0,t4,a6
    3b0c:	00a62023          	sw	a0,0(a2)
    3b10:	00f62223          	sw	a5,4(a2)
    3b14:	00870713          	addi	a4,a4,8
    3b18:	00860613          	addi	a2,a2,8
    3b1c:	f9c718e3          	bne	a4,t3,3aac <keccak_absorb.constprop.1+0x274>
    3b20:	40b98633          	sub	a2,s3,a1
    3b24:	00b48933          	add	s2,s1,a1
    3b28:	08060663          	beqz	a2,3bb4 <keccak_absorb.constprop.1+0x37c>
    3b2c:	00bb05b3          	add	a1,s6,a1
    3b30:	00810513          	addi	a0,sp,8
    3b34:	00012423          	sw	zero,8(sp)
    3b38:	00012623          	sw	zero,12(sp)
    3b3c:	590010ef          	jal	50cc <memcpy>
    3b40:	00a14783          	lbu	a5,10(sp)
    3b44:	00914503          	lbu	a0,9(sp)
    3b48:	00d14583          	lbu	a1,13(sp)
    3b4c:	00c14303          	lbu	t1,12(sp)
    3b50:	00e14603          	lbu	a2,14(sp)
    3b54:	ff897913          	andi	s2,s2,-8
    3b58:	00814883          	lbu	a7,8(sp)
    3b5c:	00b14683          	lbu	a3,11(sp)
    3b60:	00f14703          	lbu	a4,15(sp)
    3b64:	01240433          	add	s0,s0,s2
    3b68:	00851513          	slli	a0,a0,0x8
    3b6c:	01079793          	slli	a5,a5,0x10
    3b70:	00859593          	slli	a1,a1,0x8
    3b74:	00042803          	lw	a6,0(s0)
    3b78:	00a7e7b3          	or	a5,a5,a0
    3b7c:	0065e5b3          	or	a1,a1,t1
    3b80:	00442503          	lw	a0,4(s0)
    3b84:	01061613          	slli	a2,a2,0x10
    3b88:	0117e7b3          	or	a5,a5,a7
    3b8c:	01871713          	slli	a4,a4,0x18
    3b90:	01869693          	slli	a3,a3,0x18
    3b94:	00b66633          	or	a2,a2,a1
    3b98:	00f6e6b3          	or	a3,a3,a5
    3b9c:	00c767b3          	or	a5,a4,a2
    3ba0:	00f547b3          	xor	a5,a0,a5
    3ba4:	00d84733          	xor	a4,a6,a3
    3ba8:	01348933          	add	s2,s1,s3
    3bac:	00e42023          	sw	a4,0(s0)
    3bb0:	00f42223          	sw	a5,4(s0)
    3bb4:	02c12083          	lw	ra,44(sp)
    3bb8:	02812403          	lw	s0,40(sp)
    3bbc:	02412483          	lw	s1,36(sp)
    3bc0:	01c12983          	lw	s3,28(sp)
    3bc4:	01012b03          	lw	s6,16(sp)
    3bc8:	00090513          	mv	a0,s2
    3bcc:	02012903          	lw	s2,32(sp)
    3bd0:	03010113          	addi	sp,sp,48
    3bd4:	00008067          	ret
    3bd8:	00335793          	srli	a5,t1,0x3
    3bdc:	08078663          	beqz	a5,3c68 <keccak_absorb.constprop.1+0x430>
    3be0:	00379793          	slli	a5,a5,0x3
    3be4:	ff84f693          	andi	a3,s1,-8
    3be8:	01678e33          	add	t3,a5,s6
    3bec:	00d406b3          	add	a3,s0,a3
    3bf0:	000b0793          	mv	a5,s6
    3bf4:	0017c703          	lbu	a4,1(a5)
    3bf8:	0027c883          	lbu	a7,2(a5)
    3bfc:	0057c803          	lbu	a6,5(a5)
    3c00:	0047cf83          	lbu	t6,4(a5)
    3c04:	0067c503          	lbu	a0,6(a5)
    3c08:	0007cf03          	lbu	t5,0(a5)
    3c0c:	0037c583          	lbu	a1,3(a5)
    3c10:	0077c603          	lbu	a2,7(a5)
    3c14:	01089893          	slli	a7,a7,0x10
    3c18:	00871713          	slli	a4,a4,0x8
    3c1c:	00881813          	slli	a6,a6,0x8
    3c20:	0006ae83          	lw	t4,0(a3)
    3c24:	01176733          	or	a4,a4,a7
    3c28:	01f86833          	or	a6,a6,t6
    3c2c:	0046a883          	lw	a7,4(a3)
    3c30:	01051513          	slli	a0,a0,0x10
    3c34:	01e76733          	or	a4,a4,t5
    3c38:	01861613          	slli	a2,a2,0x18
    3c3c:	01859593          	slli	a1,a1,0x18
    3c40:	01056533          	or	a0,a0,a6
    3c44:	00e5e5b3          	or	a1,a1,a4
    3c48:	00a66733          	or	a4,a2,a0
    3c4c:	00e8c733          	xor	a4,a7,a4
    3c50:	00bec633          	xor	a2,t4,a1
    3c54:	00c6a023          	sw	a2,0(a3)
    3c58:	00e6a223          	sw	a4,4(a3)
    3c5c:	00878793          	addi	a5,a5,8
    3c60:	00868693          	addi	a3,a3,8
    3c64:	f9c798e3          	bne	a5,t3,3bf4 <keccak_absorb.constprop.1+0x3bc>
    3c68:	013489b3          	add	s3,s1,s3
    3c6c:	00040513          	mv	a0,s0
    3c70:	006b0b33          	add	s6,s6,t1
    3c74:	f7898993          	addi	s3,s3,-136
    3c78:	ae1fd0ef          	jal	1758 <KeccakF1600_StatePermute>
    3c7c:	00000493          	li	s1,0
    3c80:	d55ff06f          	j	39d4 <keccak_absorb.constprop.1+0x19c>
    3c84:	00048913          	mv	s2,s1
    3c88:	00098613          	mv	a2,s3
    3c8c:	e9dff06f          	j	3b28 <keccak_absorb.constprop.1+0x2f0>
    3c90:	001b0b13          	addi	s6,s6,1
    3c94:	00148493          	addi	s1,s1,1
    3c98:	00068993          	mv	s3,a3
    3c9c:	00078713          	mv	a4,a5
    3ca0:	cb1ff06f          	j	3950 <keccak_absorb.constprop.1+0x118>
    3ca4:	005b0b13          	addi	s6,s6,5
    3ca8:	00548493          	addi	s1,s1,5
    3cac:	00068993          	mv	s3,a3
    3cb0:	00078713          	mv	a4,a5
    3cb4:	c9dff06f          	j	3950 <keccak_absorb.constprop.1+0x118>
    3cb8:	002b0b13          	addi	s6,s6,2
    3cbc:	00248493          	addi	s1,s1,2
    3cc0:	00068993          	mv	s3,a3
    3cc4:	00078713          	mv	a4,a5
    3cc8:	c89ff06f          	j	3950 <keccak_absorb.constprop.1+0x118>
    3ccc:	003b0b13          	addi	s6,s6,3
    3cd0:	00348493          	addi	s1,s1,3
    3cd4:	00068993          	mv	s3,a3
    3cd8:	00078713          	mv	a4,a5
    3cdc:	c75ff06f          	j	3950 <keccak_absorb.constprop.1+0x118>
    3ce0:	004b0b13          	addi	s6,s6,4
    3ce4:	00448493          	addi	s1,s1,4
    3ce8:	00068993          	mv	s3,a3
    3cec:	00078713          	mv	a4,a5
    3cf0:	c61ff06f          	j	3950 <keccak_absorb.constprop.1+0x118>
    3cf4:	006b0b13          	addi	s6,s6,6
    3cf8:	00648493          	addi	s1,s1,6
    3cfc:	00068993          	mv	s3,a3
    3d00:	c51ff06f          	j	3950 <keccak_absorb.constprop.1+0x118>

00003d04 <keccak_absorb.constprop.2>:
    3d04:	fd010113          	addi	sp,sp,-48
    3d08:	02812423          	sw	s0,40(sp)
    3d0c:	02912223          	sw	s1,36(sp)
    3d10:	01312e23          	sw	s3,28(sp)
    3d14:	01612823          	sw	s6,16(sp)
    3d18:	02112623          	sw	ra,44(sp)
    3d1c:	03212023          	sw	s2,32(sp)
    3d20:	00012423          	sw	zero,8(sp)
    3d24:	00012623          	sw	zero,12(sp)
    3d28:	0075f713          	andi	a4,a1,7
    3d2c:	00058493          	mv	s1,a1
    3d30:	00060b13          	mv	s6,a2
    3d34:	00068993          	mv	s3,a3
    3d38:	00050413          	mv	s0,a0
    3d3c:	14070a63          	beqz	a4,3e90 <keccak_absorb.constprop.2+0x18c>
    3d40:	0c068e63          	beqz	a3,3e1c <keccak_absorb.constprop.2+0x118>
    3d44:	00064603          	lbu	a2,0(a2)
    3d48:	002707b3          	add	a5,a4,sp
    3d4c:	fff68693          	addi	a3,a3,-1
    3d50:	00c78423          	sb	a2,8(a5)
    3d54:	00170793          	addi	a5,a4,1
    3d58:	40068263          	beqz	a3,415c <keccak_absorb.constprop.2+0x458>
    3d5c:	ff970613          	addi	a2,a4,-7
    3d60:	3e060e63          	beqz	a2,415c <keccak_absorb.constprop.2+0x458>
    3d64:	001b4603          	lbu	a2,1(s6)
    3d68:	002787b3          	add	a5,a5,sp
    3d6c:	ffe98693          	addi	a3,s3,-2
    3d70:	00c78423          	sb	a2,8(a5)
    3d74:	00270793          	addi	a5,a4,2
    3d78:	40068663          	beqz	a3,4184 <keccak_absorb.constprop.2+0x480>
    3d7c:	ffa70613          	addi	a2,a4,-6
    3d80:	40060263          	beqz	a2,4184 <keccak_absorb.constprop.2+0x480>
    3d84:	002b4603          	lbu	a2,2(s6)
    3d88:	002787b3          	add	a5,a5,sp
    3d8c:	ffd98693          	addi	a3,s3,-3
    3d90:	00c78423          	sb	a2,8(a5)
    3d94:	00370793          	addi	a5,a4,3
    3d98:	40068063          	beqz	a3,4198 <keccak_absorb.constprop.2+0x494>
    3d9c:	ffb70613          	addi	a2,a4,-5
    3da0:	3e060c63          	beqz	a2,4198 <keccak_absorb.constprop.2+0x494>
    3da4:	003b4603          	lbu	a2,3(s6)
    3da8:	002787b3          	add	a5,a5,sp
    3dac:	ffc98693          	addi	a3,s3,-4
    3db0:	00c78423          	sb	a2,8(a5)
    3db4:	00470793          	addi	a5,a4,4
    3db8:	3e068a63          	beqz	a3,41ac <keccak_absorb.constprop.2+0x4a8>
    3dbc:	ffc70613          	addi	a2,a4,-4
    3dc0:	3e060663          	beqz	a2,41ac <keccak_absorb.constprop.2+0x4a8>
    3dc4:	004b4603          	lbu	a2,4(s6)
    3dc8:	002787b3          	add	a5,a5,sp
    3dcc:	ffb98693          	addi	a3,s3,-5
    3dd0:	00c78423          	sb	a2,8(a5)
    3dd4:	00570793          	addi	a5,a4,5
    3dd8:	38068c63          	beqz	a3,4170 <keccak_absorb.constprop.2+0x46c>
    3ddc:	ffd70613          	addi	a2,a4,-3
    3de0:	38060863          	beqz	a2,4170 <keccak_absorb.constprop.2+0x46c>
    3de4:	005b4603          	lbu	a2,5(s6)
    3de8:	002787b3          	add	a5,a5,sp
    3dec:	ffa98693          	addi	a3,s3,-6
    3df0:	00c78423          	sb	a2,8(a5)
    3df4:	00670713          	addi	a4,a4,6
    3df8:	3c068463          	beqz	a3,41c0 <keccak_absorb.constprop.2+0x4bc>
    3dfc:	ff870793          	addi	a5,a4,-8
    3e00:	3c078063          	beqz	a5,41c0 <keccak_absorb.constprop.2+0x4bc>
    3e04:	006b4783          	lbu	a5,6(s6)
    3e08:	ff998993          	addi	s3,s3,-7
    3e0c:	00758493          	addi	s1,a1,7
    3e10:	00f107a3          	sb	a5,15(sp)
    3e14:	007b0b13          	addi	s6,s6,7
    3e18:	00800713          	li	a4,8
    3e1c:	00a14683          	lbu	a3,10(sp)
    3e20:	00d14803          	lbu	a6,13(sp)
    3e24:	00914883          	lbu	a7,9(sp)
    3e28:	40e487b3          	sub	a5,s1,a4
    3e2c:	00c14e03          	lbu	t3,12(sp)
    3e30:	00e14503          	lbu	a0,14(sp)
    3e34:	00f14603          	lbu	a2,15(sp)
    3e38:	00814303          	lbu	t1,8(sp)
    3e3c:	00b14583          	lbu	a1,11(sp)
    3e40:	ff87f793          	andi	a5,a5,-8
    3e44:	00f407b3          	add	a5,s0,a5
    3e48:	01069713          	slli	a4,a3,0x10
    3e4c:	00889893          	slli	a7,a7,0x8
    3e50:	00881693          	slli	a3,a6,0x8
    3e54:	01176733          	or	a4,a4,a7
    3e58:	0047a803          	lw	a6,4(a5)
    3e5c:	0007a883          	lw	a7,0(a5)
    3e60:	01c6e6b3          	or	a3,a3,t3
    3e64:	01051513          	slli	a0,a0,0x10
    3e68:	00676733          	or	a4,a4,t1
    3e6c:	00d56533          	or	a0,a0,a3
    3e70:	01859593          	slli	a1,a1,0x18
    3e74:	01861693          	slli	a3,a2,0x18
    3e78:	00e5e633          	or	a2,a1,a4
    3e7c:	00a6e733          	or	a4,a3,a0
    3e80:	00e84733          	xor	a4,a6,a4
    3e84:	00c8c6b3          	xor	a3,a7,a2
    3e88:	00d7a023          	sw	a3,0(a5)
    3e8c:	00e7a223          	sw	a4,4(a5)
    3e90:	00048863          	beqz	s1,3ea0 <keccak_absorb.constprop.2+0x19c>
    3e94:	0a800313          	li	t1,168
    3e98:	40930333          	sub	t1,t1,s1
    3e9c:	2069f463          	bgeu	s3,t1,40a4 <keccak_absorb.constprop.2+0x3a0>
    3ea0:	0a700913          	li	s2,167
    3ea4:	0b397c63          	bgeu	s2,s3,3f5c <keccak_absorb.constprop.2+0x258>
    3ea8:	01512a23          	sw	s5,20(sp)
    3eac:	0a8b0a93          	addi	s5,s6,168
    3eb0:	01412c23          	sw	s4,24(sp)
    3eb4:	000a8a13          	mv	s4,s5
    3eb8:	000b0793          	mv	a5,s6
    3ebc:	00040693          	mv	a3,s0
    3ec0:	0017c703          	lbu	a4,1(a5)
    3ec4:	0027c883          	lbu	a7,2(a5)
    3ec8:	0057c803          	lbu	a6,5(a5)
    3ecc:	0047ce83          	lbu	t4,4(a5)
    3ed0:	0067c503          	lbu	a0,6(a5)
    3ed4:	0007ce03          	lbu	t3,0(a5)
    3ed8:	0037c583          	lbu	a1,3(a5)
    3edc:	0077c603          	lbu	a2,7(a5)
    3ee0:	01089893          	slli	a7,a7,0x10
    3ee4:	00871713          	slli	a4,a4,0x8
    3ee8:	00881813          	slli	a6,a6,0x8
    3eec:	0006a303          	lw	t1,0(a3)
    3ef0:	01176733          	or	a4,a4,a7
    3ef4:	01d86833          	or	a6,a6,t4
    3ef8:	0046a883          	lw	a7,4(a3)
    3efc:	01051513          	slli	a0,a0,0x10
    3f00:	01c76733          	or	a4,a4,t3
    3f04:	01861613          	slli	a2,a2,0x18
    3f08:	01859593          	slli	a1,a1,0x18
    3f0c:	01056533          	or	a0,a0,a6
    3f10:	00e5e5b3          	or	a1,a1,a4
    3f14:	00a66733          	or	a4,a2,a0
    3f18:	00e8c733          	xor	a4,a7,a4
    3f1c:	00b34633          	xor	a2,t1,a1
    3f20:	00c6a023          	sw	a2,0(a3)
    3f24:	00e6a223          	sw	a4,4(a3)
    3f28:	00878793          	addi	a5,a5,8
    3f2c:	00868693          	addi	a3,a3,8
    3f30:	f94798e3          	bne	a5,s4,3ec0 <keccak_absorb.constprop.2+0x1bc>
    3f34:	00040513          	mv	a0,s0
    3f38:	f5898993          	addi	s3,s3,-168
    3f3c:	000a8b13          	mv	s6,s5
    3f40:	819fd0ef          	jal	1758 <KeccakF1600_StatePermute>
    3f44:	0a8a0a13          	addi	s4,s4,168
    3f48:	01397663          	bgeu	s2,s3,3f54 <keccak_absorb.constprop.2+0x250>
    3f4c:	0a8a8a93          	addi	s5,s5,168
    3f50:	f69ff06f          	j	3eb8 <keccak_absorb.constprop.2+0x1b4>
    3f54:	01812a03          	lw	s4,24(sp)
    3f58:	01412a83          	lw	s5,20(sp)
    3f5c:	0039d593          	srli	a1,s3,0x3
    3f60:	1e058863          	beqz	a1,4150 <keccak_absorb.constprop.2+0x44c>
    3f64:	00359593          	slli	a1,a1,0x3
    3f68:	ff84f613          	andi	a2,s1,-8
    3f6c:	00bb0e33          	add	t3,s6,a1
    3f70:	00c40633          	add	a2,s0,a2
    3f74:	000b0713          	mv	a4,s6
    3f78:	00174683          	lbu	a3,1(a4)
    3f7c:	00274783          	lbu	a5,2(a4)
    3f80:	00574303          	lbu	t1,5(a4)
    3f84:	00474f83          	lbu	t6,4(a4)
    3f88:	00674883          	lbu	a7,6(a4)
    3f8c:	00074f03          	lbu	t5,0(a4)
    3f90:	00374803          	lbu	a6,3(a4)
    3f94:	00774503          	lbu	a0,7(a4)
    3f98:	01079793          	slli	a5,a5,0x10
    3f9c:	00869693          	slli	a3,a3,0x8
    3fa0:	00831313          	slli	t1,t1,0x8
    3fa4:	00062e83          	lw	t4,0(a2)
    3fa8:	00f6e6b3          	or	a3,a3,a5
    3fac:	01f36333          	or	t1,t1,t6
    3fb0:	00462783          	lw	a5,4(a2)
    3fb4:	01089893          	slli	a7,a7,0x10
    3fb8:	01e6e6b3          	or	a3,a3,t5
    3fbc:	01851513          	slli	a0,a0,0x18
    3fc0:	01881813          	slli	a6,a6,0x18
    3fc4:	0068e8b3          	or	a7,a7,t1
    3fc8:	00d86833          	or	a6,a6,a3
    3fcc:	011566b3          	or	a3,a0,a7
    3fd0:	00d7c7b3          	xor	a5,a5,a3
    3fd4:	010ec533          	xor	a0,t4,a6
    3fd8:	00a62023          	sw	a0,0(a2)
    3fdc:	00f62223          	sw	a5,4(a2)
    3fe0:	00870713          	addi	a4,a4,8
    3fe4:	00860613          	addi	a2,a2,8
    3fe8:	f9c718e3          	bne	a4,t3,3f78 <keccak_absorb.constprop.2+0x274>
    3fec:	40b98633          	sub	a2,s3,a1
    3ff0:	00b48933          	add	s2,s1,a1
    3ff4:	08060663          	beqz	a2,4080 <keccak_absorb.constprop.2+0x37c>
    3ff8:	00bb05b3          	add	a1,s6,a1
    3ffc:	00810513          	addi	a0,sp,8
    4000:	00012423          	sw	zero,8(sp)
    4004:	00012623          	sw	zero,12(sp)
    4008:	0c4010ef          	jal	50cc <memcpy>
    400c:	00a14783          	lbu	a5,10(sp)
    4010:	00914503          	lbu	a0,9(sp)
    4014:	00d14583          	lbu	a1,13(sp)
    4018:	00c14303          	lbu	t1,12(sp)
    401c:	00e14603          	lbu	a2,14(sp)
    4020:	ff897913          	andi	s2,s2,-8
    4024:	00814883          	lbu	a7,8(sp)
    4028:	00b14683          	lbu	a3,11(sp)
    402c:	00f14703          	lbu	a4,15(sp)
    4030:	01240433          	add	s0,s0,s2
    4034:	00851513          	slli	a0,a0,0x8
    4038:	01079793          	slli	a5,a5,0x10
    403c:	00859593          	slli	a1,a1,0x8
    4040:	00042803          	lw	a6,0(s0)
    4044:	00a7e7b3          	or	a5,a5,a0
    4048:	0065e5b3          	or	a1,a1,t1
    404c:	00442503          	lw	a0,4(s0)
    4050:	01061613          	slli	a2,a2,0x10
    4054:	0117e7b3          	or	a5,a5,a7
    4058:	01871713          	slli	a4,a4,0x18
    405c:	01869693          	slli	a3,a3,0x18
    4060:	00b66633          	or	a2,a2,a1
    4064:	00f6e6b3          	or	a3,a3,a5
    4068:	00c767b3          	or	a5,a4,a2
    406c:	00f547b3          	xor	a5,a0,a5
    4070:	00d84733          	xor	a4,a6,a3
    4074:	01348933          	add	s2,s1,s3
    4078:	00e42023          	sw	a4,0(s0)
    407c:	00f42223          	sw	a5,4(s0)
    4080:	02c12083          	lw	ra,44(sp)
    4084:	02812403          	lw	s0,40(sp)
    4088:	02412483          	lw	s1,36(sp)
    408c:	01c12983          	lw	s3,28(sp)
    4090:	01012b03          	lw	s6,16(sp)
    4094:	00090513          	mv	a0,s2
    4098:	02012903          	lw	s2,32(sp)
    409c:	03010113          	addi	sp,sp,48
    40a0:	00008067          	ret
    40a4:	00335793          	srli	a5,t1,0x3
    40a8:	08078663          	beqz	a5,4134 <keccak_absorb.constprop.2+0x430>
    40ac:	00379793          	slli	a5,a5,0x3
    40b0:	ff84f693          	andi	a3,s1,-8
    40b4:	01678e33          	add	t3,a5,s6
    40b8:	00d406b3          	add	a3,s0,a3
    40bc:	000b0793          	mv	a5,s6
    40c0:	0017c703          	lbu	a4,1(a5)
    40c4:	0027c883          	lbu	a7,2(a5)
    40c8:	0057c803          	lbu	a6,5(a5)
    40cc:	0047cf83          	lbu	t6,4(a5)
    40d0:	0067c503          	lbu	a0,6(a5)
    40d4:	0007cf03          	lbu	t5,0(a5)
    40d8:	0037c583          	lbu	a1,3(a5)
    40dc:	0077c603          	lbu	a2,7(a5)
    40e0:	01089893          	slli	a7,a7,0x10
    40e4:	00871713          	slli	a4,a4,0x8
    40e8:	00881813          	slli	a6,a6,0x8
    40ec:	0006ae83          	lw	t4,0(a3)
    40f0:	01176733          	or	a4,a4,a7
    40f4:	01f86833          	or	a6,a6,t6
    40f8:	0046a883          	lw	a7,4(a3)
    40fc:	01051513          	slli	a0,a0,0x10
    4100:	01e76733          	or	a4,a4,t5
    4104:	01861613          	slli	a2,a2,0x18
    4108:	01859593          	slli	a1,a1,0x18
    410c:	01056533          	or	a0,a0,a6
    4110:	00e5e5b3          	or	a1,a1,a4
    4114:	00a66733          	or	a4,a2,a0
    4118:	00e8c733          	xor	a4,a7,a4
    411c:	00bec633          	xor	a2,t4,a1
    4120:	00c6a023          	sw	a2,0(a3)
    4124:	00e6a223          	sw	a4,4(a3)
    4128:	00878793          	addi	a5,a5,8
    412c:	00868693          	addi	a3,a3,8
    4130:	f9c798e3          	bne	a5,t3,40c0 <keccak_absorb.constprop.2+0x3bc>
    4134:	013489b3          	add	s3,s1,s3
    4138:	00040513          	mv	a0,s0
    413c:	006b0b33          	add	s6,s6,t1
    4140:	f5898993          	addi	s3,s3,-168
    4144:	e14fd0ef          	jal	1758 <KeccakF1600_StatePermute>
    4148:	00000493          	li	s1,0
    414c:	d55ff06f          	j	3ea0 <keccak_absorb.constprop.2+0x19c>
    4150:	00048913          	mv	s2,s1
    4154:	00098613          	mv	a2,s3
    4158:	e9dff06f          	j	3ff4 <keccak_absorb.constprop.2+0x2f0>
    415c:	001b0b13          	addi	s6,s6,1
    4160:	00148493          	addi	s1,s1,1
    4164:	00068993          	mv	s3,a3
    4168:	00078713          	mv	a4,a5
    416c:	cb1ff06f          	j	3e1c <keccak_absorb.constprop.2+0x118>
    4170:	005b0b13          	addi	s6,s6,5
    4174:	00548493          	addi	s1,s1,5
    4178:	00068993          	mv	s3,a3
    417c:	00078713          	mv	a4,a5
    4180:	c9dff06f          	j	3e1c <keccak_absorb.constprop.2+0x118>
    4184:	002b0b13          	addi	s6,s6,2
    4188:	00248493          	addi	s1,s1,2
    418c:	00068993          	mv	s3,a3
    4190:	00078713          	mv	a4,a5
    4194:	c89ff06f          	j	3e1c <keccak_absorb.constprop.2+0x118>
    4198:	003b0b13          	addi	s6,s6,3
    419c:	00348493          	addi	s1,s1,3
    41a0:	00068993          	mv	s3,a3
    41a4:	00078713          	mv	a4,a5
    41a8:	c75ff06f          	j	3e1c <keccak_absorb.constprop.2+0x118>
    41ac:	004b0b13          	addi	s6,s6,4
    41b0:	00448493          	addi	s1,s1,4
    41b4:	00068993          	mv	s3,a3
    41b8:	00078713          	mv	a4,a5
    41bc:	c61ff06f          	j	3e1c <keccak_absorb.constprop.2+0x118>
    41c0:	006b0b13          	addi	s6,s6,6
    41c4:	00648493          	addi	s1,s1,6
    41c8:	00068993          	mv	s3,a3
    41cc:	c51ff06f          	j	3e1c <keccak_absorb.constprop.2+0x118>

000041d0 <pqcrystals_fips202_ref_shake128_init>:
    41d0:	ff010113          	addi	sp,sp,-16
    41d4:	0c800613          	li	a2,200
    41d8:	00000593          	li	a1,0
    41dc:	00112623          	sw	ra,12(sp)
    41e0:	611000ef          	jal	4ff0 <memset>
    41e4:	00c12083          	lw	ra,12(sp)
    41e8:	0c052423          	sw	zero,200(a0)
    41ec:	01010113          	addi	sp,sp,16
    41f0:	00008067          	ret

000041f4 <pqcrystals_fips202_ref_shake128_absorb>:
    41f4:	00058793          	mv	a5,a1
    41f8:	0c852583          	lw	a1,200(a0)
    41fc:	ff010113          	addi	sp,sp,-16
    4200:	00060693          	mv	a3,a2
    4204:	00078613          	mv	a2,a5
    4208:	00812423          	sw	s0,8(sp)
    420c:	00112623          	sw	ra,12(sp)
    4210:	00050413          	mv	s0,a0
    4214:	af1ff0ef          	jal	3d04 <keccak_absorb.constprop.2>
    4218:	00c12083          	lw	ra,12(sp)
    421c:	0ca42423          	sw	a0,200(s0)
    4220:	00812403          	lw	s0,8(sp)
    4224:	01010113          	addi	sp,sp,16
    4228:	00008067          	ret

0000422c <pqcrystals_fips202_ref_shake128_finalize>:
    422c:	0c852783          	lw	a5,200(a0)
    4230:	0077f713          	andi	a4,a5,7
    4234:	00371713          	slli	a4,a4,0x3
    4238:	ff87f793          	andi	a5,a5,-8
    423c:	fe070693          	addi	a3,a4,-32
    4240:	00f507b3          	add	a5,a0,a5
    4244:	0406c063          	bltz	a3,4284 <pqcrystals_fips202_ref_shake128_finalize+0x58>
    4248:	01f00613          	li	a2,31
    424c:	00d61633          	sll	a2,a2,a3
    4250:	00000593          	li	a1,0
    4254:	0007a683          	lw	a3,0(a5)
    4258:	0047a703          	lw	a4,4(a5)
    425c:	80000837          	lui	a6,0x80000
    4260:	00b6c6b3          	xor	a3,a3,a1
    4264:	00c74733          	xor	a4,a4,a2
    4268:	00d7a023          	sw	a3,0(a5)
    426c:	00e7a223          	sw	a4,4(a5)
    4270:	0a452783          	lw	a5,164(a0)
    4274:	0c052423          	sw	zero,200(a0)
    4278:	0107c7b3          	xor	a5,a5,a6
    427c:	0af52223          	sw	a5,164(a0)
    4280:	00008067          	ret
    4284:	01f00593          	li	a1,31
    4288:	40e586b3          	sub	a3,a1,a4
    428c:	00f00613          	li	a2,15
    4290:	00e595b3          	sll	a1,a1,a4
    4294:	00d65633          	srl	a2,a2,a3
    4298:	fbdff06f          	j	4254 <pqcrystals_fips202_ref_shake128_finalize+0x28>

0000429c <pqcrystals_fips202_ref_shake128_squeezeblocks>:
    429c:	0c058463          	beqz	a1,4364 <pqcrystals_fips202_ref_shake128_squeezeblocks+0xc8>
    42a0:	fe010113          	addi	sp,sp,-32
    42a4:	01412423          	sw	s4,8(sp)
    42a8:	0a850a13          	addi	s4,a0,168
    42ac:	00812c23          	sw	s0,24(sp)
    42b0:	00912a23          	sw	s1,20(sp)
    42b4:	01212823          	sw	s2,16(sp)
    42b8:	01312623          	sw	s3,12(sp)
    42bc:	00112e23          	sw	ra,28(sp)
    42c0:	00058993          	mv	s3,a1
    42c4:	00050413          	mv	s0,a0
    42c8:	00060913          	mv	s2,a2
    42cc:	000a0493          	mv	s1,s4
    42d0:	00090513          	mv	a0,s2
    42d4:	c84fd0ef          	jal	1758 <KeccakF1600_StatePermute>
    42d8:	00040793          	mv	a5,s0
    42dc:	00090613          	mv	a2,s2
    42e0:	00062683          	lw	a3,0(a2)
    42e4:	00462703          	lw	a4,4(a2)
    42e8:	00878793          	addi	a5,a5,8
    42ec:	0086de93          	srli	t4,a3,0x8
    42f0:	0106de13          	srli	t3,a3,0x10
    42f4:	0186d313          	srli	t1,a3,0x18
    42f8:	00875893          	srli	a7,a4,0x8
    42fc:	01075813          	srli	a6,a4,0x10
    4300:	01875593          	srli	a1,a4,0x18
    4304:	ffd78ca3          	sb	t4,-7(a5)
    4308:	fed78c23          	sb	a3,-8(a5)
    430c:	fee78e23          	sb	a4,-4(a5)
    4310:	ffc78d23          	sb	t3,-6(a5)
    4314:	fe678da3          	sb	t1,-5(a5)
    4318:	ff178ea3          	sb	a7,-3(a5)
    431c:	ff078f23          	sb	a6,-2(a5)
    4320:	feb78fa3          	sb	a1,-1(a5)
    4324:	00860613          	addi	a2,a2,8
    4328:	faf49ce3          	bne	s1,a5,42e0 <pqcrystals_fips202_ref_shake128_squeezeblocks+0x44>
    432c:	fff98993          	addi	s3,s3,-1
    4330:	0a848493          	addi	s1,s1,168
    4334:	000a0413          	mv	s0,s4
    4338:	00098663          	beqz	s3,4344 <pqcrystals_fips202_ref_shake128_squeezeblocks+0xa8>
    433c:	0a8a0a13          	addi	s4,s4,168
    4340:	f91ff06f          	j	42d0 <pqcrystals_fips202_ref_shake128_squeezeblocks+0x34>
    4344:	01c12083          	lw	ra,28(sp)
    4348:	01812403          	lw	s0,24(sp)
    434c:	01412483          	lw	s1,20(sp)
    4350:	01012903          	lw	s2,16(sp)
    4354:	00c12983          	lw	s3,12(sp)
    4358:	00812a03          	lw	s4,8(sp)
    435c:	02010113          	addi	sp,sp,32
    4360:	00008067          	ret
    4364:	00008067          	ret

00004368 <pqcrystals_fips202_ref_shake256_init>:
    4368:	ff010113          	addi	sp,sp,-16
    436c:	0c800613          	li	a2,200
    4370:	00000593          	li	a1,0
    4374:	00112623          	sw	ra,12(sp)
    4378:	479000ef          	jal	4ff0 <memset>
    437c:	00c12083          	lw	ra,12(sp)
    4380:	0c052423          	sw	zero,200(a0)
    4384:	01010113          	addi	sp,sp,16
    4388:	00008067          	ret

0000438c <pqcrystals_fips202_ref_shake256_absorb>:
    438c:	00058793          	mv	a5,a1
    4390:	0c852583          	lw	a1,200(a0)
    4394:	ff010113          	addi	sp,sp,-16
    4398:	00060693          	mv	a3,a2
    439c:	00078613          	mv	a2,a5
    43a0:	00812423          	sw	s0,8(sp)
    43a4:	00112623          	sw	ra,12(sp)
    43a8:	00050413          	mv	s0,a0
    43ac:	c8cff0ef          	jal	3838 <keccak_absorb.constprop.1>
    43b0:	00c12083          	lw	ra,12(sp)
    43b4:	0ca42423          	sw	a0,200(s0)
    43b8:	00812403          	lw	s0,8(sp)
    43bc:	01010113          	addi	sp,sp,16
    43c0:	00008067          	ret

000043c4 <pqcrystals_fips202_ref_shake256_finalize>:
    43c4:	0c852783          	lw	a5,200(a0)
    43c8:	0077f713          	andi	a4,a5,7
    43cc:	00371713          	slli	a4,a4,0x3
    43d0:	ff87f793          	andi	a5,a5,-8
    43d4:	fe070693          	addi	a3,a4,-32
    43d8:	00f507b3          	add	a5,a0,a5
    43dc:	0406c063          	bltz	a3,441c <pqcrystals_fips202_ref_shake256_finalize+0x58>
    43e0:	01f00613          	li	a2,31
    43e4:	00d61633          	sll	a2,a2,a3
    43e8:	00000593          	li	a1,0
    43ec:	0007a683          	lw	a3,0(a5)
    43f0:	0047a703          	lw	a4,4(a5)
    43f4:	80000837          	lui	a6,0x80000
    43f8:	00b6c6b3          	xor	a3,a3,a1
    43fc:	00c74733          	xor	a4,a4,a2
    4400:	00d7a023          	sw	a3,0(a5)
    4404:	00e7a223          	sw	a4,4(a5)
    4408:	08452783          	lw	a5,132(a0)
    440c:	0c052423          	sw	zero,200(a0)
    4410:	0107c7b3          	xor	a5,a5,a6
    4414:	08f52223          	sw	a5,132(a0)
    4418:	00008067          	ret
    441c:	01f00593          	li	a1,31
    4420:	40e586b3          	sub	a3,a1,a4
    4424:	00f00613          	li	a2,15
    4428:	00e595b3          	sll	a1,a1,a4
    442c:	00d65633          	srl	a2,a2,a3
    4430:	fbdff06f          	j	43ec <pqcrystals_fips202_ref_shake256_finalize+0x28>

00004434 <pqcrystals_fips202_ref_shake256_squeezeblocks>:
    4434:	0c058463          	beqz	a1,44fc <pqcrystals_fips202_ref_shake256_squeezeblocks+0xc8>
    4438:	fe010113          	addi	sp,sp,-32
    443c:	01412423          	sw	s4,8(sp)
    4440:	08850a13          	addi	s4,a0,136
    4444:	00812c23          	sw	s0,24(sp)
    4448:	00912a23          	sw	s1,20(sp)
    444c:	01212823          	sw	s2,16(sp)
    4450:	01312623          	sw	s3,12(sp)
    4454:	00112e23          	sw	ra,28(sp)
    4458:	00058993          	mv	s3,a1
    445c:	00050413          	mv	s0,a0
    4460:	00060913          	mv	s2,a2
    4464:	000a0493          	mv	s1,s4
    4468:	00090513          	mv	a0,s2
    446c:	aecfd0ef          	jal	1758 <KeccakF1600_StatePermute>
    4470:	00040793          	mv	a5,s0
    4474:	00090613          	mv	a2,s2
    4478:	00062683          	lw	a3,0(a2)
    447c:	00462703          	lw	a4,4(a2)
    4480:	00878793          	addi	a5,a5,8
    4484:	0086de93          	srli	t4,a3,0x8
    4488:	0106de13          	srli	t3,a3,0x10
    448c:	0186d313          	srli	t1,a3,0x18
    4490:	00875893          	srli	a7,a4,0x8
    4494:	01075813          	srli	a6,a4,0x10
    4498:	01875593          	srli	a1,a4,0x18
    449c:	ffd78ca3          	sb	t4,-7(a5)
    44a0:	fed78c23          	sb	a3,-8(a5)
    44a4:	fee78e23          	sb	a4,-4(a5)
    44a8:	ffc78d23          	sb	t3,-6(a5)
    44ac:	fe678da3          	sb	t1,-5(a5)
    44b0:	ff178ea3          	sb	a7,-3(a5)
    44b4:	ff078f23          	sb	a6,-2(a5)
    44b8:	feb78fa3          	sb	a1,-1(a5)
    44bc:	00860613          	addi	a2,a2,8
    44c0:	faf49ce3          	bne	s1,a5,4478 <pqcrystals_fips202_ref_shake256_squeezeblocks+0x44>
    44c4:	fff98993          	addi	s3,s3,-1
    44c8:	08848493          	addi	s1,s1,136
    44cc:	000a0413          	mv	s0,s4
    44d0:	00098663          	beqz	s3,44dc <pqcrystals_fips202_ref_shake256_squeezeblocks+0xa8>
    44d4:	088a0a13          	addi	s4,s4,136
    44d8:	f91ff06f          	j	4468 <pqcrystals_fips202_ref_shake256_squeezeblocks+0x34>
    44dc:	01c12083          	lw	ra,28(sp)
    44e0:	01812403          	lw	s0,24(sp)
    44e4:	01412483          	lw	s1,20(sp)
    44e8:	01012903          	lw	s2,16(sp)
    44ec:	00c12983          	lw	s3,12(sp)
    44f0:	00812a03          	lw	s4,8(sp)
    44f4:	02010113          	addi	sp,sp,32
    44f8:	00008067          	ret
    44fc:	00008067          	ret

00004500 <pqcrystals_fips202_ref_shake256_squeeze>:
    4500:	0c862683          	lw	a3,200(a2)
    4504:	fe010113          	addi	sp,sp,-32
    4508:	00112e23          	sw	ra,28(sp)
    450c:	00c12623          	sw	a2,12(sp)
    4510:	f01fe0ef          	jal	3410 <keccak_squeeze.constprop.1>
    4514:	00c12603          	lw	a2,12(sp)
    4518:	01c12083          	lw	ra,28(sp)
    451c:	0ca62423          	sw	a0,200(a2)
    4520:	02010113          	addi	sp,sp,32
    4524:	00008067          	ret

00004528 <pqcrystals_fips202_ref_shake256>:
    4528:	f0010113          	addi	sp,sp,-256
    452c:	0e812c23          	sw	s0,248(sp)
    4530:	01010413          	addi	s0,sp,16
    4534:	0e912a23          	sw	s1,244(sp)
    4538:	0f212823          	sw	s2,240(sp)
    453c:	0f312623          	sw	s3,236(sp)
    4540:	00060493          	mv	s1,a2
    4544:	00050913          	mv	s2,a0
    4548:	0c800613          	li	a2,200
    454c:	00058993          	mv	s3,a1
    4550:	00040513          	mv	a0,s0
    4554:	00000593          	li	a1,0
    4558:	0e112e23          	sw	ra,252(sp)
    455c:	00d12623          	sw	a3,12(sp)
    4560:	291000ef          	jal	4ff0 <memset>
    4564:	00c12683          	lw	a3,12(sp)
    4568:	00048613          	mv	a2,s1
    456c:	00040513          	mv	a0,s0
    4570:	00000593          	li	a1,0
    4574:	0c012c23          	sw	zero,216(sp)
    4578:	ac0ff0ef          	jal	3838 <keccak_absorb.constprop.1>
    457c:	00757713          	andi	a4,a0,7
    4580:	00371713          	slli	a4,a4,0x3
    4584:	ff857793          	andi	a5,a0,-8
    4588:	fe070693          	addi	a3,a4,-32
    458c:	00f407b3          	add	a5,s0,a5
    4590:	0606c463          	bltz	a3,45f8 <pqcrystals_fips202_ref_shake256+0xd0>
    4594:	01f00613          	li	a2,31
    4598:	00d61633          	sll	a2,a2,a3
    459c:	00000593          	li	a1,0
    45a0:	0007a683          	lw	a3,0(a5)
    45a4:	0047a703          	lw	a4,4(a5)
    45a8:	80000837          	lui	a6,0x80000
    45ac:	00b6c6b3          	xor	a3,a3,a1
    45b0:	00c74733          	xor	a4,a4,a2
    45b4:	00d7a023          	sw	a3,0(a5)
    45b8:	00e7a223          	sw	a4,4(a5)
    45bc:	09412783          	lw	a5,148(sp)
    45c0:	00040613          	mv	a2,s0
    45c4:	00098593          	mv	a1,s3
    45c8:	00090513          	mv	a0,s2
    45cc:	0107c7b3          	xor	a5,a5,a6
    45d0:	00000693          	li	a3,0
    45d4:	08f12a23          	sw	a5,148(sp)
    45d8:	e39fe0ef          	jal	3410 <keccak_squeeze.constprop.1>
    45dc:	0fc12083          	lw	ra,252(sp)
    45e0:	0f812403          	lw	s0,248(sp)
    45e4:	0f412483          	lw	s1,244(sp)
    45e8:	0f012903          	lw	s2,240(sp)
    45ec:	0ec12983          	lw	s3,236(sp)
    45f0:	10010113          	addi	sp,sp,256
    45f4:	00008067          	ret
    45f8:	01f00593          	li	a1,31
    45fc:	40e586b3          	sub	a3,a1,a4
    4600:	00f00613          	li	a2,15
    4604:	00e595b3          	sll	a1,a1,a4
    4608:	00d65633          	srl	a2,a2,a3
    460c:	f95ff06f          	j	45a0 <pqcrystals_fips202_ref_shake256+0x78>

00004610 <pqcrystals_dilithium2_ref_signature>:
    4610:	a1010113          	addi	sp,sp,-1520
    4614:	ffff42b7          	lui	t0,0xffff4
    4618:	5e112623          	sw	ra,1516(sp)
    461c:	5e812423          	sw	s0,1512(sp)
    4620:	5e912223          	sw	s1,1508(sp)
    4624:	5f212023          	sw	s2,1504(sp)
    4628:	5d312e23          	sw	s3,1500(sp)
    462c:	5d412c23          	sw	s4,1496(sp)
    4630:	5d512a23          	sw	s5,1492(sp)
    4634:	5d812423          	sw	s8,1480(sp)
    4638:	5bb12e23          	sw	s11,1468(sp)
    463c:	5d612823          	sw	s6,1488(sp)
    4640:	5d712623          	sw	s7,1484(sp)
    4644:	5d912223          	sw	s9,1476(sp)
    4648:	5da12023          	sw	s10,1472(sp)
    464c:	00058d93          	mv	s11,a1
    4650:	00510133          	add	sp,sp,t0
    4654:	100085b7          	lui	a1,0x10008
    4658:	01058593          	addi	a1,a1,16 # 10008010 <__stack_top+0xffe8014>
    465c:	00050a93          	mv	s5,a0
    4660:	00c10513          	addi	a0,sp,12
    4664:	00060993          	mv	s3,a2
    4668:	00068a13          	mv	s4,a3
    466c:	00070413          	mv	s0,a4
    4670:	0cd000ef          	jal	4f3c <uart_init>
    4674:	000047b7          	lui	a5,0x4
    4678:	5b078793          	addi	a5,a5,1456 # 45b0 <pqcrystals_fips202_ref_shake256+0x88>
    467c:	00f10933          	add	s2,sp,a5
    4680:	000037b7          	lui	a5,0x3
    4684:	5b078793          	addi	a5,a5,1456 # 35b0 <keccak_squeeze.constprop.1+0x1a0>
    4688:	00f104b3          	add	s1,sp,a5
    468c:	00040813          	mv	a6,s0
    4690:	5b010713          	addi	a4,sp,1456
    4694:	00090793          	mv	a5,s2
    4698:	00048693          	mv	a3,s1
    469c:	13010613          	addi	a2,sp,304
    46a0:	10010593          	addi	a1,sp,256
    46a4:	0e010513          	addi	a0,sp,224
    46a8:	390000ef          	jal	4a38 <pqcrystals_dilithium2_ref_upack_sk>
    46ac:	01010413          	addi	s0,sp,16
    46b0:	00040513          	mv	a0,s0
    46b4:	cb5ff0ef          	jal	4368 <pqcrystals_fips202_ref_shake256_init>
    46b8:	00040513          	mv	a0,s0
    46bc:	10010593          	addi	a1,sp,256
    46c0:	03000613          	li	a2,48
    46c4:	cc9ff0ef          	jal	438c <pqcrystals_fips202_ref_shake256_absorb>
    46c8:	000a0613          	mv	a2,s4
    46cc:	00098593          	mv	a1,s3
    46d0:	00040513          	mv	a0,s0
    46d4:	cb9ff0ef          	jal	438c <pqcrystals_fips202_ref_shake256_absorb>
    46d8:	00040513          	mv	a0,s0
    46dc:	ce9ff0ef          	jal	43c4 <pqcrystals_fips202_ref_shake256_finalize>
    46e0:	00040613          	mv	a2,s0
    46e4:	15010513          	addi	a0,sp,336
    46e8:	03000593          	li	a1,48
    46ec:	e15ff0ef          	jal	4500 <pqcrystals_fips202_ref_shake256_squeeze>
    46f0:	13010613          	addi	a2,sp,304
    46f4:	05000693          	li	a3,80
    46f8:	18010513          	addi	a0,sp,384
    46fc:	03000593          	li	a1,48
    4700:	e29ff0ef          	jal	4528 <pqcrystals_fips202_ref_shake256>
    4704:	000087b7          	lui	a5,0x8
    4708:	5b078793          	addi	a5,a5,1456 # 85b0 <__SDATA_BEGIN__+0x25b0>
    470c:	00f10c33          	add	s8,sp,a5
    4710:	0e010593          	addi	a1,sp,224
    4714:	000c0513          	mv	a0,s8
    4718:	a7dfb0ef          	jal	194 <pqcrystals_dilithium2_ref_polyvec_matrix_expand>
    471c:	5b010513          	addi	a0,sp,1456
    4720:	c35fb0ef          	jal	354 <pqcrystals_dilithium2_ref_polyvecl_ntt>
    4724:	00090513          	mv	a0,s2
    4728:	fbdfb0ef          	jal	6e4 <pqcrystals_dilithium2_ref_polyveck_ntt>
    472c:	00048513          	mv	a0,s1
    4730:	fb5fb0ef          	jal	6e4 <pqcrystals_dilithium2_ref_polyveck_ntt>
    4734:	000017b7          	lui	a5,0x1
    4738:	5b078793          	addi	a5,a5,1456 # 15b0 <pqcrystals_dilithium2_ref_invntt_tomont+0x54>
    473c:	00f10a33          	add	s4,sp,a5
    4740:	000027b7          	lui	a5,0x2
    4744:	5b078793          	addi	a5,a5,1456 # 25b0 <KeccakF1600_StatePermute+0xe58>
    4748:	00f104b3          	add	s1,sp,a5
    474c:	000057b7          	lui	a5,0x5
    4750:	5b078793          	addi	a5,a5,1456 # 55b0 <zetas+0x3b8>
    4754:	00f109b3          	add	s3,sp,a5
    4758:	000067b7          	lui	a5,0x6
    475c:	5b078793          	addi	a5,a5,1456 # 65b0 <__SDATA_BEGIN__+0x5b0>
    4760:	00f10933          	add	s2,sp,a5
    4764:	00000413          	li	s0,0
    4768:	00040613          	mv	a2,s0
    476c:	18010593          	addi	a1,sp,384
    4770:	000a0513          	mv	a0,s4
    4774:	ac5fb0ef          	jal	238 <pqcrystals_dilithium2_ref_polyvecl_uniform_gamma1>
    4778:	000a0793          	mv	a5,s4
    477c:	00048713          	mv	a4,s1
    4780:	0087a683          	lw	a3,8(a5)
    4784:	0007a583          	lw	a1,0(a5)
    4788:	0047a603          	lw	a2,4(a5)
    478c:	00d72423          	sw	a3,8(a4)
    4790:	00b72023          	sw	a1,0(a4)
    4794:	00c72223          	sw	a2,4(a4)
    4798:	00c7a683          	lw	a3,12(a5)
    479c:	01078793          	addi	a5,a5,16
    47a0:	01070713          	addi	a4,a4,16
    47a4:	fed72e23          	sw	a3,-4(a4)
    47a8:	fc979ce3          	bne	a5,s1,4780 <pqcrystals_dilithium2_ref_signature+0x170>
    47ac:	00048513          	mv	a0,s1
    47b0:	ba5fb0ef          	jal	354 <pqcrystals_dilithium2_ref_polyvecl_ntt>
    47b4:	00048613          	mv	a2,s1
    47b8:	000c0593          	mv	a1,s8
    47bc:	00098513          	mv	a0,s3
    47c0:	cf9fb0ef          	jal	4b8 <pqcrystals_dilithium2_ref_polyvec_matrix_pointwise_montgomery>
    47c4:	00098513          	mv	a0,s3
    47c8:	dcdfb0ef          	jal	594 <pqcrystals_dilithium2_ref_polyveck_reduce>
    47cc:	00098513          	mv	a0,s3
    47d0:	f55fb0ef          	jal	724 <pqcrystals_dilithium2_ref_polyveck_invntt_tomont>
    47d4:	00098513          	mv	a0,s3
    47d8:	dfdfb0ef          	jal	5d4 <pqcrystals_dilithium2_ref_polyveck_caddq>
    47dc:	00098613          	mv	a2,s3
    47e0:	00090593          	mv	a1,s2
    47e4:	00098513          	mv	a0,s3
    47e8:	854fc0ef          	jal	83c <pqcrystals_dilithium2_ref_polyveck_decompose>
    47ec:	00098593          	mv	a1,s3
    47f0:	000a8513          	mv	a0,s5
    47f4:	92cfc0ef          	jal	920 <pqcrystals_dilithium2_ref_polyveck_pack_w1>
    47f8:	01010513          	addi	a0,sp,16
    47fc:	b6dff0ef          	jal	4368 <pqcrystals_fips202_ref_shake256_init>
    4800:	15010593          	addi	a1,sp,336
    4804:	01010513          	addi	a0,sp,16
    4808:	03000613          	li	a2,48
    480c:	b81ff0ef          	jal	438c <pqcrystals_fips202_ref_shake256_absorb>
    4810:	000a8593          	mv	a1,s5
    4814:	30000613          	li	a2,768
    4818:	01010513          	addi	a0,sp,16
    481c:	b71ff0ef          	jal	438c <pqcrystals_fips202_ref_shake256_absorb>
    4820:	01010513          	addi	a0,sp,16
    4824:	ba1ff0ef          	jal	43c4 <pqcrystals_fips202_ref_shake256_finalize>
    4828:	01010613          	addi	a2,sp,16
    482c:	000a8513          	mv	a0,s5
    4830:	02000593          	li	a1,32
    4834:	ccdff0ef          	jal	4500 <pqcrystals_fips202_ref_shake256_squeeze>
    4838:	000a8593          	mv	a1,s5
    483c:	1b010513          	addi	a0,sp,432
    4840:	d78fc0ef          	jal	db8 <pqcrystals_dilithium2_ref_poly_challenge>
    4844:	1b010513          	addi	a0,sp,432
    4848:	a08fc0ef          	jal	a50 <pqcrystals_dilithium2_ref_poly_ntt>
    484c:	5b010613          	addi	a2,sp,1456
    4850:	1b010593          	addi	a1,sp,432
    4854:	00048513          	mv	a0,s1
    4858:	b7dfb0ef          	jal	3d4 <pqcrystals_dilithium2_ref_polyvecl_pointwise_poly_montgomery>
    485c:	00048513          	mv	a0,s1
    4860:	b35fb0ef          	jal	394 <pqcrystals_dilithium2_ref_polyvecl_invntt_tomont>
    4864:	00048593          	mv	a1,s1
    4868:	000a0613          	mv	a2,s4
    486c:	00048513          	mv	a0,s1
    4870:	a7dfb0ef          	jal	2ec <pqcrystals_dilithium2_ref_polyvecl_add>
    4874:	00048513          	mv	a0,s1
    4878:	a35fb0ef          	jal	2ac <pqcrystals_dilithium2_ref_polyvecl_reduce>
    487c:	000205b7          	lui	a1,0x20
    4880:	00048513          	mv	a0,s1
    4884:	fb258593          	addi	a1,a1,-78 # 1ffb2 <//__stack_size+0xffb2>
    4888:	c9dfb0ef          	jal	524 <pqcrystals_dilithium2_ref_polyvecl_chknorm>
    488c:	0c051463          	bnez	a0,4954 <pqcrystals_dilithium2_ref_signature+0x344>
    4890:	000077b7          	lui	a5,0x7
    4894:	5b078793          	addi	a5,a5,1456 # 75b0 <__SDATA_BEGIN__+0x15b0>
    4898:	00f10cb3          	add	s9,sp,a5
    489c:	000047b7          	lui	a5,0x4
    48a0:	5b078793          	addi	a5,a5,1456 # 45b0 <pqcrystals_fips202_ref_shake256+0x88>
    48a4:	00f10633          	add	a2,sp,a5
    48a8:	1b010593          	addi	a1,sp,432
    48ac:	000c8513          	mv	a0,s9
    48b0:	eb5fb0ef          	jal	764 <pqcrystals_dilithium2_ref_polyveck_pointwise_poly_montgomery>
    48b4:	000c8513          	mv	a0,s9
    48b8:	e6dfb0ef          	jal	724 <pqcrystals_dilithium2_ref_polyveck_invntt_tomont>
    48bc:	00090593          	mv	a1,s2
    48c0:	000c8613          	mv	a2,s9
    48c4:	00090513          	mv	a0,s2
    48c8:	db5fb0ef          	jal	67c <pqcrystals_dilithium2_ref_polyveck_sub>
    48cc:	00090513          	mv	a0,s2
    48d0:	cc5fb0ef          	jal	594 <pqcrystals_dilithium2_ref_polyveck_reduce>
    48d4:	000175b7          	lui	a1,0x17
    48d8:	00090513          	mv	a0,s2
    48dc:	3b258593          	addi	a1,a1,946 # 173b2 <//__stack_size+0x73b2>
    48e0:	eedfb0ef          	jal	7cc <pqcrystals_dilithium2_ref_polyveck_chknorm>
    48e4:	06051863          	bnez	a0,4954 <pqcrystals_dilithium2_ref_signature+0x344>
    48e8:	000037b7          	lui	a5,0x3
    48ec:	5b078793          	addi	a5,a5,1456 # 35b0 <keccak_squeeze.constprop.1+0x1a0>
    48f0:	1b010593          	addi	a1,sp,432
    48f4:	00f10633          	add	a2,sp,a5
    48f8:	000c8513          	mv	a0,s9
    48fc:	e69fb0ef          	jal	764 <pqcrystals_dilithium2_ref_polyveck_pointwise_poly_montgomery>
    4900:	000c8513          	mv	a0,s9
    4904:	e21fb0ef          	jal	724 <pqcrystals_dilithium2_ref_polyveck_invntt_tomont>
    4908:	000c8513          	mv	a0,s9
    490c:	c89fb0ef          	jal	594 <pqcrystals_dilithium2_ref_polyveck_reduce>
    4910:	000175b7          	lui	a1,0x17
    4914:	000c8513          	mv	a0,s9
    4918:	40058593          	addi	a1,a1,1024 # 17400 <//__stack_size+0x7400>
    491c:	eb1fb0ef          	jal	7cc <pqcrystals_dilithium2_ref_polyveck_chknorm>
    4920:	02051a63          	bnez	a0,4954 <pqcrystals_dilithium2_ref_signature+0x344>
    4924:	000c8613          	mv	a2,s9
    4928:	00090593          	mv	a1,s2
    492c:	00090513          	mv	a0,s2
    4930:	ce5fb0ef          	jal	614 <pqcrystals_dilithium2_ref_polyveck_add>
    4934:	00090513          	mv	a0,s2
    4938:	c9dfb0ef          	jal	5d4 <pqcrystals_dilithium2_ref_polyveck_caddq>
    493c:	00098613          	mv	a2,s3
    4940:	00090593          	mv	a1,s2
    4944:	000c8513          	mv	a0,s9
    4948:	f5dfb0ef          	jal	8a4 <pqcrystals_dilithium2_ref_polyveck_make_hint>
    494c:	05000793          	li	a5,80
    4950:	00a7fa63          	bgeu	a5,a0,4964 <pqcrystals_dilithium2_ref_signature+0x354>
    4954:	00140413          	addi	s0,s0,1
    4958:	01041413          	slli	s0,s0,0x10
    495c:	01045413          	srli	s0,s0,0x10
    4960:	e09ff06f          	j	4768 <pqcrystals_dilithium2_ref_signature+0x158>
    4964:	000a8513          	mv	a0,s5
    4968:	000c8693          	mv	a3,s9
    496c:	00048613          	mv	a2,s1
    4970:	000a8593          	mv	a1,s5
    4974:	324000ef          	jal	4c98 <pqcrystals_dilithium2_ref_pack_sig>
    4978:	000017b7          	lui	a5,0x1
    497c:	97478793          	addi	a5,a5,-1676 # 974 <pqcrystals_dilithium2_ref_poly_reduce+0x4>
    4980:	00fda023          	sw	a5,0(s11)
    4984:	0000c2b7          	lui	t0,0xc
    4988:	00510133          	add	sp,sp,t0
    498c:	5ec12083          	lw	ra,1516(sp)
    4990:	5e812403          	lw	s0,1512(sp)
    4994:	5e412483          	lw	s1,1508(sp)
    4998:	5e012903          	lw	s2,1504(sp)
    499c:	5dc12983          	lw	s3,1500(sp)
    49a0:	5d812a03          	lw	s4,1496(sp)
    49a4:	5d412a83          	lw	s5,1492(sp)
    49a8:	5d012b03          	lw	s6,1488(sp)
    49ac:	5cc12b83          	lw	s7,1484(sp)
    49b0:	5c812c03          	lw	s8,1480(sp)
    49b4:	5c412c83          	lw	s9,1476(sp)
    49b8:	5c012d03          	lw	s10,1472(sp)
    49bc:	5bc12d83          	lw	s11,1468(sp)
    49c0:	00000513          	li	a0,0
    49c4:	5f010113          	addi	sp,sp,1520
    49c8:	00008067          	ret

000049cc <pqcrystals_dilithium2_ref>:
    49cc:	fe010113          	addi	sp,sp,-32
    49d0:	00112e23          	sw	ra,28(sp)
    49d4:	02068663          	beqz	a3,4a00 <pqcrystals_dilithium2_ref+0x34>
    49d8:	00d50833          	add	a6,a0,a3
    49dc:	fff60613          	addi	a2,a2,-1
    49e0:	7ff80813          	addi	a6,a6,2047 # 800007ff <__stack_top+0x7ffe0803>
    49e4:	17480813          	addi	a6,a6,372
    49e8:	00d607b3          	add	a5,a2,a3
    49ec:	0007c883          	lbu	a7,0(a5)
    49f0:	fff78793          	addi	a5,a5,-1
    49f4:	fff80813          	addi	a6,a6,-1
    49f8:	011800a3          	sb	a7,1(a6)
    49fc:	fef618e3          	bne	a2,a5,49ec <pqcrystals_dilithium2_ref+0x20>
    4a00:	7ff50613          	addi	a2,a0,2047
    4a04:	17560613          	addi	a2,a2,373
    4a08:	00d12623          	sw	a3,12(sp)
    4a0c:	00b12423          	sw	a1,8(sp)
    4a10:	c01ff0ef          	jal	4610 <pqcrystals_dilithium2_ref_signature>
    4a14:	00812583          	lw	a1,8(sp)
    4a18:	00c12683          	lw	a3,12(sp)
    4a1c:	01c12083          	lw	ra,28(sp)
    4a20:	0005a783          	lw	a5,0(a1)
    4a24:	00000513          	li	a0,0
    4a28:	00d787b3          	add	a5,a5,a3
    4a2c:	00f5a023          	sw	a5,0(a1)
    4a30:	02010113          	addi	sp,sp,32
    4a34:	00008067          	ret

00004a38 <pqcrystals_dilithium2_ref_upack_sk>:
    4a38:	fe010113          	addi	sp,sp,-32
    4a3c:	00812c23          	sw	s0,24(sp)
    4a40:	00080413          	mv	s0,a6
    4a44:	00a86833          	or	a6,a6,a0
    4a48:	01412423          	sw	s4,8(sp)
    4a4c:	01512223          	sw	s5,4(sp)
    4a50:	00112e23          	sw	ra,28(sp)
    4a54:	00912a23          	sw	s1,20(sp)
    4a58:	01212823          	sw	s2,16(sp)
    4a5c:	01312623          	sw	s3,12(sp)
    4a60:	00387813          	andi	a6,a6,3
    4a64:	00078a93          	mv	s5,a5
    4a68:	00068a13          	mv	s4,a3
    4a6c:	00050793          	mv	a5,a0
    4a70:	1c081463          	bnez	a6,4c38 <pqcrystals_dilithium2_ref_upack_sk+0x200>
    4a74:	fff50693          	addi	a3,a0,-1
    4a78:	408686b3          	sub	a3,a3,s0
    4a7c:	0036b693          	sltiu	a3,a3,3
    4a80:	1a069c63          	bnez	a3,4c38 <pqcrystals_dilithium2_ref_upack_sk+0x200>
    4a84:	00042783          	lw	a5,0(s0)
    4a88:	02040813          	addi	a6,s0,32
    4a8c:	00f52023          	sw	a5,0(a0)
    4a90:	00442783          	lw	a5,4(s0)
    4a94:	00f52223          	sw	a5,4(a0)
    4a98:	00842783          	lw	a5,8(s0)
    4a9c:	00f52423          	sw	a5,8(a0)
    4aa0:	00c42783          	lw	a5,12(s0)
    4aa4:	00f52623          	sw	a5,12(a0)
    4aa8:	01042783          	lw	a5,16(s0)
    4aac:	00f52823          	sw	a5,16(a0)
    4ab0:	01442783          	lw	a5,20(s0)
    4ab4:	00f52a23          	sw	a5,20(a0)
    4ab8:	01842783          	lw	a5,24(s0)
    4abc:	00f52c23          	sw	a5,24(a0)
    4ac0:	01c42783          	lw	a5,28(s0)
    4ac4:	00f52e23          	sw	a5,28(a0)
    4ac8:	010666b3          	or	a3,a2,a6
    4acc:	0036f693          	andi	a3,a3,3
    4ad0:	00060793          	mv	a5,a2
    4ad4:	1a069263          	bnez	a3,4c78 <pqcrystals_dilithium2_ref_upack_sk+0x240>
    4ad8:	fdf60693          	addi	a3,a2,-33
    4adc:	408686b3          	sub	a3,a3,s0
    4ae0:	0036b693          	sltiu	a3,a3,3
    4ae4:	18069a63          	bnez	a3,4c78 <pqcrystals_dilithium2_ref_upack_sk+0x240>
    4ae8:	02042783          	lw	a5,32(s0)
    4aec:	04040893          	addi	a7,s0,64
    4af0:	00f62023          	sw	a5,0(a2)
    4af4:	02442783          	lw	a5,36(s0)
    4af8:	00f62223          	sw	a5,4(a2)
    4afc:	02842783          	lw	a5,40(s0)
    4b00:	00f62423          	sw	a5,8(a2)
    4b04:	02c42783          	lw	a5,44(s0)
    4b08:	00f62623          	sw	a5,12(a2)
    4b0c:	03042783          	lw	a5,48(s0)
    4b10:	00f62823          	sw	a5,16(a2)
    4b14:	03442783          	lw	a5,52(s0)
    4b18:	00f62a23          	sw	a5,20(a2)
    4b1c:	03842783          	lw	a5,56(s0)
    4b20:	00f62c23          	sw	a5,24(a2)
    4b24:	03c42783          	lw	a5,60(s0)
    4b28:	00f62e23          	sw	a5,28(a2)
    4b2c:	0115e7b3          	or	a5,a1,a7
    4b30:	0037f793          	andi	a5,a5,3
    4b34:	00058813          	mv	a6,a1
    4b38:	12079063          	bnez	a5,4c58 <pqcrystals_dilithium2_ref_upack_sk+0x220>
    4b3c:	fbf58793          	addi	a5,a1,-65
    4b40:	408787b3          	sub	a5,a5,s0
    4b44:	0037b793          	sltiu	a5,a5,3
    4b48:	10079863          	bnez	a5,4c58 <pqcrystals_dilithium2_ref_upack_sk+0x220>
    4b4c:	04042783          	lw	a5,64(s0)
    4b50:	07040493          	addi	s1,s0,112
    4b54:	00f5a023          	sw	a5,0(a1)
    4b58:	04442783          	lw	a5,68(s0)
    4b5c:	00f5a223          	sw	a5,4(a1)
    4b60:	04842783          	lw	a5,72(s0)
    4b64:	00f5a423          	sw	a5,8(a1)
    4b68:	04c42783          	lw	a5,76(s0)
    4b6c:	00f5a623          	sw	a5,12(a1)
    4b70:	05042783          	lw	a5,80(s0)
    4b74:	00f5a823          	sw	a5,16(a1)
    4b78:	05442783          	lw	a5,84(s0)
    4b7c:	00f5aa23          	sw	a5,20(a1)
    4b80:	05842783          	lw	a5,88(s0)
    4b84:	00f5ac23          	sw	a5,24(a1)
    4b88:	05c42783          	lw	a5,92(s0)
    4b8c:	00f5ae23          	sw	a5,28(a1)
    4b90:	06042783          	lw	a5,96(s0)
    4b94:	02f5a023          	sw	a5,32(a1)
    4b98:	06442783          	lw	a5,100(s0)
    4b9c:	02f5a223          	sw	a5,36(a1)
    4ba0:	06842783          	lw	a5,104(s0)
    4ba4:	02f5a423          	sw	a5,40(a1)
    4ba8:	06c42783          	lw	a5,108(s0)
    4bac:	02f5a623          	sw	a5,44(a1)
    4bb0:	00070993          	mv	s3,a4
    4bb4:	1f040913          	addi	s2,s0,496
    4bb8:	00048593          	mv	a1,s1
    4bbc:	00098513          	mv	a0,s3
    4bc0:	06048493          	addi	s1,s1,96
    4bc4:	b78fc0ef          	jal	f3c <pqcrystals_dilithium2_ref_polyeta_unpack>
    4bc8:	40098993          	addi	s3,s3,1024
    4bcc:	fe9916e3          	bne	s2,s1,4bb8 <pqcrystals_dilithium2_ref_upack_sk+0x180>
    4bd0:	000a8993          	mv	s3,s5
    4bd4:	37040493          	addi	s1,s0,880
    4bd8:	00090593          	mv	a1,s2
    4bdc:	00098513          	mv	a0,s3
    4be0:	06090913          	addi	s2,s2,96
    4be4:	b58fc0ef          	jal	f3c <pqcrystals_dilithium2_ref_polyeta_unpack>
    4be8:	40098993          	addi	s3,s3,1024
    4bec:	ff2496e3          	bne	s1,s2,4bd8 <pqcrystals_dilithium2_ref_upack_sk+0x1a0>
    4bf0:	7ff40413          	addi	s0,s0,2047
    4bf4:	1f140413          	addi	s0,s0,497
    4bf8:	000a0913          	mv	s2,s4
    4bfc:	00048593          	mv	a1,s1
    4c00:	00090513          	mv	a0,s2
    4c04:	1a048493          	addi	s1,s1,416
    4c08:	c18fc0ef          	jal	1020 <pqcrystals_dilithium2_ref_polyt0_unpack>
    4c0c:	40090913          	addi	s2,s2,1024
    4c10:	fe8496e3          	bne	s1,s0,4bfc <pqcrystals_dilithium2_ref_upack_sk+0x1c4>
    4c14:	01c12083          	lw	ra,28(sp)
    4c18:	01812403          	lw	s0,24(sp)
    4c1c:	01412483          	lw	s1,20(sp)
    4c20:	01012903          	lw	s2,16(sp)
    4c24:	00c12983          	lw	s3,12(sp)
    4c28:	00812a03          	lw	s4,8(sp)
    4c2c:	00412a83          	lw	s5,4(sp)
    4c30:	02010113          	addi	sp,sp,32
    4c34:	00008067          	ret
    4c38:	02040813          	addi	a6,s0,32
    4c3c:	00040893          	mv	a7,s0
    4c40:	0008c683          	lbu	a3,0(a7) # 20000 <__stack_top+0x4>
    4c44:	00188893          	addi	a7,a7,1
    4c48:	00178793          	addi	a5,a5,1
    4c4c:	fed78fa3          	sb	a3,-1(a5)
    4c50:	ff1818e3          	bne	a6,a7,4c40 <pqcrystals_dilithium2_ref_upack_sk+0x208>
    4c54:	e75ff06f          	j	4ac8 <pqcrystals_dilithium2_ref_upack_sk+0x90>
    4c58:	00088613          	mv	a2,a7
    4c5c:	07040493          	addi	s1,s0,112
    4c60:	00064783          	lbu	a5,0(a2)
    4c64:	00160613          	addi	a2,a2,1
    4c68:	00180813          	addi	a6,a6,1
    4c6c:	fef80fa3          	sb	a5,-1(a6)
    4c70:	fe9618e3          	bne	a2,s1,4c60 <pqcrystals_dilithium2_ref_upack_sk+0x228>
    4c74:	f3dff06f          	j	4bb0 <pqcrystals_dilithium2_ref_upack_sk+0x178>
    4c78:	00080613          	mv	a2,a6
    4c7c:	04040893          	addi	a7,s0,64
    4c80:	00064683          	lbu	a3,0(a2)
    4c84:	00160613          	addi	a2,a2,1
    4c88:	00178793          	addi	a5,a5,1
    4c8c:	fed78fa3          	sb	a3,-1(a5)
    4c90:	ff1618e3          	bne	a2,a7,4c80 <pqcrystals_dilithium2_ref_upack_sk+0x248>
    4c94:	e99ff06f          	j	4b2c <pqcrystals_dilithium2_ref_upack_sk+0xf4>

00004c98 <pqcrystals_dilithium2_ref_pack_sig>:
    4c98:	fe010113          	addi	sp,sp,-32
    4c9c:	00a5e733          	or	a4,a1,a0
    4ca0:	00912a23          	sw	s1,20(sp)
    4ca4:	01412423          	sw	s4,8(sp)
    4ca8:	00112e23          	sw	ra,28(sp)
    4cac:	00812c23          	sw	s0,24(sp)
    4cb0:	01212823          	sw	s2,16(sp)
    4cb4:	01312623          	sw	s3,12(sp)
    4cb8:	00377713          	andi	a4,a4,3
    4cbc:	00050493          	mv	s1,a0
    4cc0:	00068a13          	mv	s4,a3
    4cc4:	00058793          	mv	a5,a1
    4cc8:	10071063          	bnez	a4,4dc8 <pqcrystals_dilithium2_ref_pack_sig+0x130>
    4ccc:	40b50733          	sub	a4,a0,a1
    4cd0:	fff70713          	addi	a4,a4,-1
    4cd4:	00373713          	sltiu	a4,a4,3
    4cd8:	0e071863          	bnez	a4,4dc8 <pqcrystals_dilithium2_ref_pack_sig+0x130>
    4cdc:	0005a783          	lw	a5,0(a1)
    4ce0:	00f52023          	sw	a5,0(a0)
    4ce4:	0045a783          	lw	a5,4(a1)
    4ce8:	00f52223          	sw	a5,4(a0)
    4cec:	0085a783          	lw	a5,8(a1)
    4cf0:	00f52423          	sw	a5,8(a0)
    4cf4:	00c5a783          	lw	a5,12(a1)
    4cf8:	00f52623          	sw	a5,12(a0)
    4cfc:	0105a783          	lw	a5,16(a1)
    4d00:	00f52823          	sw	a5,16(a0)
    4d04:	0145a783          	lw	a5,20(a1)
    4d08:	00f52a23          	sw	a5,20(a0)
    4d0c:	0185a783          	lw	a5,24(a1)
    4d10:	00f52c23          	sw	a5,24(a0)
    4d14:	01c5a783          	lw	a5,28(a1)
    4d18:	00f52e23          	sw	a5,28(a0)
    4d1c:	7ff48413          	addi	s0,s1,2047
    4d20:	00060993          	mv	s3,a2
    4d24:	12140413          	addi	s0,s0,289
    4d28:	02048913          	addi	s2,s1,32
    4d2c:	00098593          	mv	a1,s3
    4d30:	00090513          	mv	a0,s2
    4d34:	24090913          	addi	s2,s2,576
    4d38:	c7cfc0ef          	jal	11b4 <pqcrystals_dilithium2_ref_polyz_pack>
    4d3c:	40098993          	addi	s3,s3,1024
    4d40:	ff2416e3          	bne	s0,s2,4d2c <pqcrystals_dilithium2_ref_pack_sig+0x94>
    4d44:	05400613          	li	a2,84
    4d48:	00000593          	li	a1,0
    4d4c:	00040513          	mv	a0,s0
    4d50:	2a0000ef          	jal	4ff0 <memset>
    4d54:	00001937          	lui	s2,0x1
    4d58:	7ff48893          	addi	a7,s1,2047
    4d5c:	000a0693          	mv	a3,s4
    4d60:	17188893          	addi	a7,a7,369
    4d64:	012a0333          	add	t1,s4,s2
    4d68:	00000613          	li	a2,0
    4d6c:	10000813          	li	a6,256
    4d70:	00068713          	mv	a4,a3
    4d74:	00000793          	li	a5,0
    4d78:	00072583          	lw	a1,0(a4)
    4d7c:	00c40533          	add	a0,s0,a2
    4d80:	00470713          	addi	a4,a4,4
    4d84:	00058663          	beqz	a1,4d90 <pqcrystals_dilithium2_ref_pack_sig+0xf8>
    4d88:	00f50023          	sb	a5,0(a0)
    4d8c:	00160613          	addi	a2,a2,1
    4d90:	00178793          	addi	a5,a5,1
    4d94:	ff0792e3          	bne	a5,a6,4d78 <pqcrystals_dilithium2_ref_pack_sig+0xe0>
    4d98:	00c88023          	sb	a2,0(a7)
    4d9c:	40068693          	addi	a3,a3,1024
    4da0:	00188893          	addi	a7,a7,1
    4da4:	fcd316e3          	bne	t1,a3,4d70 <pqcrystals_dilithium2_ref_pack_sig+0xd8>
    4da8:	01c12083          	lw	ra,28(sp)
    4dac:	01812403          	lw	s0,24(sp)
    4db0:	01412483          	lw	s1,20(sp)
    4db4:	01012903          	lw	s2,16(sp)
    4db8:	00c12983          	lw	s3,12(sp)
    4dbc:	00812a03          	lw	s4,8(sp)
    4dc0:	02010113          	addi	sp,sp,32
    4dc4:	00008067          	ret
    4dc8:	02058593          	addi	a1,a1,32
    4dcc:	00048713          	mv	a4,s1
    4dd0:	0007c683          	lbu	a3,0(a5)
    4dd4:	00178793          	addi	a5,a5,1
    4dd8:	00170713          	addi	a4,a4,1
    4ddc:	fed70fa3          	sb	a3,-1(a4)
    4de0:	fef598e3          	bne	a1,a5,4dd0 <pqcrystals_dilithium2_ref_pack_sig+0x138>
    4de4:	f39ff06f          	j	4d1c <pqcrystals_dilithium2_ref_pack_sig+0x84>

00004de8 <pqcrystals_dilithium2_ref_decompose>:
    4de8:	07f58693          	addi	a3,a1,127
    4dec:	000037b7          	lui	a5,0x3
    4df0:	c0b78793          	addi	a5,a5,-1013 # 2c0b <KeccakF1600_StatePermute+0x14b3>
    4df4:	4076d693          	srai	a3,a3,0x7
    4df8:	02f686b3          	mul	a3,a3,a5
    4dfc:	00800337          	lui	t1,0x800
    4e00:	02b00713          	li	a4,43
    4e04:	00050893          	mv	a7,a0
    4e08:	fffd27b7          	lui	a5,0xfffd2
    4e0c:	80078793          	addi	a5,a5,-2048 # fffd1800 <__stack_top+0xfffb1804>
    4e10:	003ff637          	lui	a2,0x3ff
    4e14:	007fe837          	lui	a6,0x7fe
    4e18:	00180813          	addi	a6,a6,1 # 7fe001 <__stack_top+0x7de005>
    4e1c:	006686b3          	add	a3,a3,t1
    4e20:	4186d693          	srai	a3,a3,0x18
    4e24:	40d70533          	sub	a0,a4,a3
    4e28:	41f55513          	srai	a0,a0,0x1f
    4e2c:	fff54513          	not	a0,a0
    4e30:	00d57533          	and	a0,a0,a3
    4e34:	02f507b3          	mul	a5,a0,a5
    4e38:	00b785b3          	add	a1,a5,a1
    4e3c:	40b60633          	sub	a2,a2,a1
    4e40:	41f65613          	srai	a2,a2,0x1f
    4e44:	01067633          	and	a2,a2,a6
    4e48:	40c585b3          	sub	a1,a1,a2
    4e4c:	00b8a023          	sw	a1,0(a7)
    4e50:	00008067          	ret

00004e54 <pqcrystals_dilithium2_ref_make_hint>:
    4e54:	fffe97b7          	lui	a5,0xfffe9
    4e58:	bff78793          	addi	a5,a5,-1025 # fffe8bff <__stack_top+0xfffc8c03>
    4e5c:	007d0737          	lui	a4,0x7d0
    4e60:	00f507b3          	add	a5,a0,a5
    4e64:	80070713          	addi	a4,a4,-2048 # 7cf800 <__stack_top+0x7af804>
    4e68:	02f76263          	bltu	a4,a5,4e8c <pqcrystals_dilithium2_ref_make_hint+0x38>
    4e6c:	ff8197b7          	lui	a5,0xff819
    4e70:	3ff78793          	addi	a5,a5,1023 # ff8193ff <__stack_top+0xff7f9403>
    4e74:	00f50533          	add	a0,a0,a5
    4e78:	0015b593          	seqz	a1,a1
    4e7c:	00153513          	seqz	a0,a0
    4e80:	00b57533          	and	a0,a0,a1
    4e84:	00154513          	xori	a0,a0,1
    4e88:	00008067          	ret
    4e8c:	00000513          	li	a0,0
    4e90:	00008067          	ret

00004e94 <pqcrystals_dilithium2_ref_dilithium_shake128_stream_init>:
    4e94:	fd010113          	addi	sp,sp,-48
    4e98:	02112623          	sw	ra,44(sp)
    4e9c:	02812423          	sw	s0,40(sp)
    4ea0:	00c11e23          	sh	a2,28(sp)
    4ea4:	00050413          	mv	s0,a0
    4ea8:	00b12623          	sw	a1,12(sp)
    4eac:	b24ff0ef          	jal	41d0 <pqcrystals_fips202_ref_shake128_init>
    4eb0:	00c12583          	lw	a1,12(sp)
    4eb4:	00040513          	mv	a0,s0
    4eb8:	02000613          	li	a2,32
    4ebc:	b38ff0ef          	jal	41f4 <pqcrystals_fips202_ref_shake128_absorb>
    4ec0:	01c10593          	addi	a1,sp,28
    4ec4:	00040513          	mv	a0,s0
    4ec8:	00200613          	li	a2,2
    4ecc:	b28ff0ef          	jal	41f4 <pqcrystals_fips202_ref_shake128_absorb>
    4ed0:	00040513          	mv	a0,s0
    4ed4:	b58ff0ef          	jal	422c <pqcrystals_fips202_ref_shake128_finalize>
    4ed8:	02c12083          	lw	ra,44(sp)
    4edc:	02812403          	lw	s0,40(sp)
    4ee0:	03010113          	addi	sp,sp,48
    4ee4:	00008067          	ret

00004ee8 <pqcrystals_dilithium2_ref_dilithium_shake256_stream_init>:
    4ee8:	fd010113          	addi	sp,sp,-48
    4eec:	02112623          	sw	ra,44(sp)
    4ef0:	02812423          	sw	s0,40(sp)
    4ef4:	00c11e23          	sh	a2,28(sp)
    4ef8:	00050413          	mv	s0,a0
    4efc:	00b12623          	sw	a1,12(sp)
    4f00:	c68ff0ef          	jal	4368 <pqcrystals_fips202_ref_shake256_init>
    4f04:	00c12583          	lw	a1,12(sp)
    4f08:	00040513          	mv	a0,s0
    4f0c:	03000613          	li	a2,48
    4f10:	c7cff0ef          	jal	438c <pqcrystals_fips202_ref_shake256_absorb>
    4f14:	01c10593          	addi	a1,sp,28
    4f18:	00040513          	mv	a0,s0
    4f1c:	00200613          	li	a2,2
    4f20:	c6cff0ef          	jal	438c <pqcrystals_fips202_ref_shake256_absorb>
    4f24:	00040513          	mv	a0,s0
    4f28:	c9cff0ef          	jal	43c4 <pqcrystals_fips202_ref_shake256_finalize>
    4f2c:	02c12083          	lw	ra,44(sp)
    4f30:	02812403          	lw	s0,40(sp)
    4f34:	03010113          	addi	sp,sp,48
    4f38:	00008067          	ret

00004f3c <uart_init>:
    4f3c:	00b52023          	sw	a1,0(a0)
    4f40:	00008067          	ret

00004f44 <uart_transmit_string>:
    4f44:	04060663          	beqz	a2,4f90 <uart_transmit_string+0x4c>
    4f48:	10008737          	lui	a4,0x10008
    4f4c:	10008537          	lui	a0,0x10008
    4f50:	00c58633          	add	a2,a1,a2
    4f54:	01270713          	addi	a4,a4,18 # 10008012 <__stack_top+0xffe8016>
    4f58:	01050513          	addi	a0,a0,16 # 10008010 <__stack_top+0xffe8014>
    4f5c:	0005c683          	lbu	a3,0(a1)
    4f60:	00158593          	addi	a1,a1,1
    4f64:	00000013          	nop
    4f68:	00000013          	nop
    4f6c:	00075783          	lhu	a5,0(a4)
    4f70:	0027f793          	andi	a5,a5,2
    4f74:	fe0798e3          	bnez	a5,4f64 <uart_transmit_string+0x20>
    4f78:	00000013          	nop
    4f7c:	00000013          	nop
    4f80:	00000013          	nop
    4f84:	00000013          	nop
    4f88:	00d52023          	sw	a3,0(a0)
    4f8c:	fcb618e3          	bne	a2,a1,4f5c <uart_transmit_string+0x18>
    4f90:	00008067          	ret

00004f94 <exc>:
    4f94:	96cfb06f          	j	100 <exc_handler>

00004f98 <ssi>:
    4f98:	00000013          	nop

00004f9c <hsi>:
    4f9c:	00000013          	nop

00004fa0 <msi>:
    4fa0:	968fb06f          	j	108 <msi_handler>

00004fa4 <uti>:
    4fa4:	00000013          	nop

00004fa8 <sti>:
    4fa8:	00000013          	nop

00004fac <hti>:
    4fac:	00000013          	nop

00004fb0 <mti>:
    4fb0:	94cfb06f          	j	fc <mti_handler>

00004fb4 <uei>:
    4fb4:	00000013          	nop

00004fb8 <sei>:
    4fb8:	00000013          	nop

00004fbc <hei>:
    4fbc:	00000013          	nop

00004fc0 <mei>:
    4fc0:	944fb06f          	j	104 <mei_handler>
    4fc4:	00000013          	nop
    4fc8:	00000013          	nop
    4fcc:	00000013          	nop
    4fd0:	00000013          	nop

00004fd4 <fast_irq0>:
    4fd4:	938fb06f          	j	10c <fast_irq0_handler>

00004fd8 <fast_irq1>:
    4fd8:	9b8fb06f          	j	190 <fast_irq1_handler>

00004fdc <SET_MTVEC_VECTOR_MODE>:
    4fdc:	00000797          	auipc	a5,0x0
    4fe0:	fb878793          	addi	a5,a5,-72 # 4f94 <exc>
    4fe4:	0017e793          	ori	a5,a5,1
    4fe8:	30579073          	csrw	mtvec,a5
    4fec:	00008067          	ret

00004ff0 <memset>:
    4ff0:	00f00313          	li	t1,15
    4ff4:	00050713          	mv	a4,a0
    4ff8:	02c37e63          	bgeu	t1,a2,5034 <memset+0x44>
    4ffc:	00f77793          	andi	a5,a4,15
    5000:	0a079063          	bnez	a5,50a0 <memset+0xb0>
    5004:	08059263          	bnez	a1,5088 <memset+0x98>
    5008:	ff067693          	andi	a3,a2,-16
    500c:	00f67613          	andi	a2,a2,15
    5010:	00e686b3          	add	a3,a3,a4
    5014:	00b72023          	sw	a1,0(a4)
    5018:	00b72223          	sw	a1,4(a4)
    501c:	00b72423          	sw	a1,8(a4)
    5020:	00b72623          	sw	a1,12(a4)
    5024:	01070713          	addi	a4,a4,16
    5028:	fed766e3          	bltu	a4,a3,5014 <memset+0x24>
    502c:	00061463          	bnez	a2,5034 <memset+0x44>
    5030:	00008067          	ret
    5034:	40c306b3          	sub	a3,t1,a2
    5038:	00269693          	slli	a3,a3,0x2
    503c:	00000297          	auipc	t0,0x0
    5040:	005686b3          	add	a3,a3,t0
    5044:	00c68067          	jr	12(a3)
    5048:	00b70723          	sb	a1,14(a4)
    504c:	00b706a3          	sb	a1,13(a4)
    5050:	00b70623          	sb	a1,12(a4)
    5054:	00b705a3          	sb	a1,11(a4)
    5058:	00b70523          	sb	a1,10(a4)
    505c:	00b704a3          	sb	a1,9(a4)
    5060:	00b70423          	sb	a1,8(a4)
    5064:	00b703a3          	sb	a1,7(a4)
    5068:	00b70323          	sb	a1,6(a4)
    506c:	00b702a3          	sb	a1,5(a4)
    5070:	00b70223          	sb	a1,4(a4)
    5074:	00b701a3          	sb	a1,3(a4)
    5078:	00b70123          	sb	a1,2(a4)
    507c:	00b700a3          	sb	a1,1(a4)
    5080:	00b70023          	sb	a1,0(a4)
    5084:	00008067          	ret
    5088:	0ff5f593          	zext.b	a1,a1
    508c:	00859693          	slli	a3,a1,0x8
    5090:	00d5e5b3          	or	a1,a1,a3
    5094:	01059693          	slli	a3,a1,0x10
    5098:	00d5e5b3          	or	a1,a1,a3
    509c:	f6dff06f          	j	5008 <memset+0x18>
    50a0:	00279693          	slli	a3,a5,0x2
    50a4:	00000297          	auipc	t0,0x0
    50a8:	005686b3          	add	a3,a3,t0
    50ac:	00008293          	mv	t0,ra
    50b0:	fa0680e7          	jalr	-96(a3)
    50b4:	00028093          	mv	ra,t0
    50b8:	ff078793          	addi	a5,a5,-16
    50bc:	40f70733          	sub	a4,a4,a5
    50c0:	00f60633          	add	a2,a2,a5
    50c4:	f6c378e3          	bgeu	t1,a2,5034 <memset+0x44>
    50c8:	f3dff06f          	j	5004 <memset+0x14>

000050cc <memcpy>:
    50cc:	00a5c7b3          	xor	a5,a1,a0
    50d0:	0037f793          	andi	a5,a5,3
    50d4:	00c508b3          	add	a7,a0,a2
    50d8:	06079663          	bnez	a5,5144 <memcpy+0x78>
    50dc:	00463613          	sltiu	a2,a2,4
    50e0:	06061263          	bnez	a2,5144 <memcpy+0x78>
    50e4:	00357793          	andi	a5,a0,3
    50e8:	00050713          	mv	a4,a0
    50ec:	0c079a63          	bnez	a5,51c0 <memcpy+0xf4>
    50f0:	ffc8f613          	andi	a2,a7,-4
    50f4:	40e606b3          	sub	a3,a2,a4
    50f8:	02000793          	li	a5,32
    50fc:	06d7c463          	blt	a5,a3,5164 <memcpy+0x98>
    5100:	00058693          	mv	a3,a1
    5104:	00070793          	mv	a5,a4
    5108:	02c77a63          	bgeu	a4,a2,513c <memcpy+0x70>
    510c:	0006a803          	lw	a6,0(a3)
    5110:	00478793          	addi	a5,a5,4
    5114:	00468693          	addi	a3,a3,4
    5118:	ff07ae23          	sw	a6,-4(a5)
    511c:	fec7e8e3          	bltu	a5,a2,510c <memcpy+0x40>
    5120:	fff60613          	addi	a2,a2,-1 # 3fefff <__stack_top+0x3df003>
    5124:	40e60633          	sub	a2,a2,a4
    5128:	ffc67613          	andi	a2,a2,-4
    512c:	00458593          	addi	a1,a1,4
    5130:	00470713          	addi	a4,a4,4
    5134:	00c585b3          	add	a1,a1,a2
    5138:	00c70733          	add	a4,a4,a2
    513c:	01176863          	bltu	a4,a7,514c <memcpy+0x80>
    5140:	00008067          	ret
    5144:	00050713          	mv	a4,a0
    5148:	ff157ce3          	bgeu	a0,a7,5140 <memcpy+0x74>
    514c:	0005c783          	lbu	a5,0(a1)
    5150:	00170713          	addi	a4,a4,1
    5154:	00158593          	addi	a1,a1,1
    5158:	fef70fa3          	sb	a5,-1(a4)
    515c:	fee898e3          	bne	a7,a4,514c <memcpy+0x80>
    5160:	00008067          	ret
    5164:	0005a683          	lw	a3,0(a1)
    5168:	0045a283          	lw	t0,4(a1)
    516c:	0085af83          	lw	t6,8(a1)
    5170:	00c5af03          	lw	t5,12(a1)
    5174:	0105ae83          	lw	t4,16(a1)
    5178:	0145ae03          	lw	t3,20(a1)
    517c:	0185a303          	lw	t1,24(a1)
    5180:	01c5a803          	lw	a6,28(a1)
    5184:	00d72023          	sw	a3,0(a4)
    5188:	0205a683          	lw	a3,32(a1)
    518c:	02470713          	addi	a4,a4,36
    5190:	fe572023          	sw	t0,-32(a4)
    5194:	fed72e23          	sw	a3,-4(a4)
    5198:	fff72223          	sw	t6,-28(a4)
    519c:	40e606b3          	sub	a3,a2,a4
    51a0:	ffe72423          	sw	t5,-24(a4)
    51a4:	ffd72623          	sw	t4,-20(a4)
    51a8:	ffc72823          	sw	t3,-16(a4)
    51ac:	fe672a23          	sw	t1,-12(a4)
    51b0:	ff072c23          	sw	a6,-8(a4)
    51b4:	02458593          	addi	a1,a1,36
    51b8:	fad7c6e3          	blt	a5,a3,5164 <memcpy+0x98>
    51bc:	f45ff06f          	j	5100 <memcpy+0x34>
    51c0:	0005c683          	lbu	a3,0(a1)
    51c4:	00170713          	addi	a4,a4,1
    51c8:	00377793          	andi	a5,a4,3
    51cc:	fed70fa3          	sb	a3,-1(a4)
    51d0:	00158593          	addi	a1,a1,1
    51d4:	f0078ee3          	beqz	a5,50f0 <memcpy+0x24>
    51d8:	0005c683          	lbu	a3,0(a1)
    51dc:	00170713          	addi	a4,a4,1
    51e0:	00377793          	andi	a5,a4,3
    51e4:	fed70fa3          	sb	a3,-1(a4)
    51e8:	00158593          	addi	a1,a1,1
    51ec:	fc079ae3          	bnez	a5,51c0 <memcpy+0xf4>
    51f0:	f01ff06f          	j	50f0 <memcpy+0x24>

Disassembly of section .rodata:

000051f8 <zetas>:
    51f8:	0000                	.insn	2, 0x0000
    51fa:	0000                	.insn	2, 0x0000
    51fc:	000064f7          	.insn	4, 0x64f7
    5200:	3102                	.insn	2, 0x3102
    5202:	ffd8                	.insn	2, 0xffd8
    5204:	fff81503          	lh	a0,-1(a6)
    5208:	9e44                	.insn	2, 0x9e44
    520a:	21180003          	lb	zero,529(a6)
    520e:	fff4                	.insn	2, 0xfff4
    5210:	a128                	.insn	2, 0xa128
    5212:	fff2                	.insn	2, 0xfff2
    5214:	1e24                	.insn	2, 0x1e24
    5216:	de2b0007          	.insn	4, 0xde2b0007
    521a:	e92b001b          	.insn	4, 0xe92b001b
    521e:	84ad0023          	sb	a0,-1984(s10)
    5222:	fffa                	.insn	2, 0xfffa
    5224:	ffe0147f 002f9a75 	.insn	12, 0xffd3fb09002f9a75ffe0147f
    522c:	ffd3fb09 
    5230:	7a49                	.insn	2, 0x7a49
    5232:	e527002f          	.insn	4, 0xe527002f
    5236:	0028                	.insn	2, 0x0028
    5238:	9658                	.insn	2, 0x9658
    523a:	0029                	.insn	2, 0x0029
    523c:	a070                	.insn	2, 0xa070
    523e:	85a4000f          	.insn	4, 0x85a4000f
    5242:	b788ffef          	jal	t6,fff945ba <__stack_top+0xfff745be>
    5246:	0036                	.insn	2, 0x0036
    5248:	9d90                	.insn	2, 0x9d90
    524a:	eaa0fff7          	.insn	4, 0xeaa0fff7
    524e:	ffee                	.insn	2, 0xffee
    5250:	f968                	.insn	2, 0xf968
    5252:	d37b0027          	.insn	4, 0xd37b0027
    5256:	ffdf add6 ffdf      	.insn	6, 0xffdfadd6ffdf
    525c:	ffc51ae7          	.insn	4, 0xffc51ae7
    5260:	ffeaa4f7          	.insn	4, 0xffeaa4f7
    5264:	fc98                	.insn	2, 0xfc98
    5266:	ffcd                	.insn	2, 0xffcd
    5268:	d035                	.insn	2, 0xd035
    526a:	001a                	.insn	2, 0x001a
    526c:	b422                	.insn	2, 0xb422
    526e:	ffff                	.insn	2, 0xffff
    5270:	3201                	.insn	2, 0x3201
    5272:	003d                	.insn	2, 0x003d
    5274:	45c5                	.insn	2, 0x45c5
    5276:	0004                	.insn	2, 0x0004
    5278:	00294a67          	.insn	4, 0x00294a67
    527c:	7620                	.insn	2, 0x7620
    527e:	0001                	.insn	2, 0x0001
    5280:	f4cd                	.insn	2, 0xf4cd
    5282:	002e                	.insn	2, 0x002e
    5284:	dec5                	.insn	2, 0xdec5
    5286:	0035                	.insn	2, 0x0035
    5288:	ffe6a503          	lw	a0,-2(a3)
    528c:	302c                	.insn	2, 0x302c
    528e:	ffc9                	.insn	2, 0xffc9
    5290:	47d4                	.insn	2, 0x47d4
    5292:	ffd9                	.insn	2, 0xffd9
    5294:	003bbeaf          	.insn	4, 0x003bbeaf
    5298:	1585                	.insn	2, 0x1585
    529a:	ffc5                	.insn	2, 0xffc5
    529c:	8e7c                	.insn	2, 0x8e7c
    529e:	ffd1                	.insn	2, 0xffd1
    52a0:	8a96                	.insn	2, 0x8a96
    52a2:	0036                	.insn	2, 0x0036
    52a4:	3e41                	.insn	2, 0x3e41
    52a6:	ffd4                	.insn	2, 0xffd4
    52a8:	0400                	.insn	2, 0x0400
    52aa:	0036                	.insn	2, 0x0036
    52ac:	6a4d                	.insn	2, 0x6a4d
    52ae:	d69cfffb          	.insn	4, 0xd69cfffb
    52b2:	c55d0023          	sb	s5,-960(s10)
    52b6:	123dfff7          	.insn	4, 0x123dfff7
    52ba:	ffe6                	.insn	2, 0xffe6
    52bc:	ead6                	.insn	2, 0xead6
    52be:	ffe6                	.insn	2, 0xffe6
    52c0:	7e1e                	.insn	2, 0x7e1e
    52c2:	0035                	.insn	2, 0x0035
    52c4:	af59                	.insn	2, 0xaf59
    52c6:	ffc5                	.insn	2, 0xffc5
    52c8:	0035843f ffdf5617 	.insn	8, 0xffdf56170035843f
    52d0:	945c                	.insn	2, 0x945c
    52d2:	738cffe7          	.insn	4, 0x738cffe7
    52d6:	0038                	.insn	2, 0x0038
    52d8:	63a8                	.insn	2, 0x63a8
    52da:	000c                	.insn	2, 0x000c
    52dc:	1b9a                	.insn	2, 0x1b9a
    52de:	0008                	.insn	2, 0x0008
    52e0:	8f76                	.insn	2, 0x8f76
    52e2:	000e                	.insn	2, 0x000e
    52e4:	003b3853          	.insn	4, 0x003b3853
    52e8:	8534                	.insn	2, 0x8534
    52ea:	fc30003b          	.insn	4, 0xfc30003b
    52ee:	ffd8                	.insn	2, 0xffd8
    52f0:	9d54                	.insn	2, 0x9d54
    52f2:	001f 4f2d ffd5      	.insn	6, 0xffd54f2d001f
    52f8:	06e5                	.insn	2, 0x06e5
    52fa:	ffc4                	.insn	2, 0xffc4
    52fc:	ac81                	.insn	2, 0xac81
    52fe:	ffe8                	.insn	2, 0xffe8
    5300:	ffc7e1cf          	.insn	4, 0xffc7e1cf
    5304:	9819                	.insn	2, 0x9819
    5306:	ffd1                	.insn	2, 0xffd1
    5308:	d65d                	.insn	2, 0xd65d
    530a:	ffe9                	.insn	2, 0xffe9
    530c:	09ee                	.insn	2, 0x09ee
    530e:	0035                	.insn	2, 0x0035
    5310:	002135c7          	.insn	4, 0x002135c7
    5314:	ffe7cfbb          	.insn	4, 0xffe7cfbb
    5318:	cf75                	.insn	2, 0xcf75
    531a:	ffec                	.insn	2, 0xffec
    531c:	9772                	.insn	2, 0x9772
    531e:	001d                	.insn	2, 0x001d
    5320:	b072                	.insn	2, 0xb072
    5322:	ffc1                	.insn	2, 0xffc1
    5324:	bcf6                	.insn	2, 0xbcf6
    5326:	fff0                	.insn	2, 0xfff0
    5328:	5280                	.insn	2, 0x5280
    532a:	d2aeffcf          	.insn	4, 0xd2aeffcf
    532e:	90e0ffcf          	.insn	4, 0x90e0ffcf
    5332:	ffc8                	.insn	2, 0xffc8
    5334:	efca                	.insn	2, 0xefca
    5336:	0001                	.insn	2, 0x0001
    5338:	10f2                	.insn	2, 0x10f2
    533a:	0034                	.insn	2, 0x0034
    533c:	fe85                	.insn	2, 0xfe85
    533e:	fff0                	.insn	2, 0xfff0
    5340:	c638                	.insn	2, 0xc638
    5342:	0020                	.insn	2, 0x0020
    5344:	6e9f 0029 b7a3      	.insn	6, 0xb7a300296e9f
    534a:	ffd2                	.insn	2, 0xffd2
    534c:	ffc7a44b          	.insn	4, 0xffc7a44b
    5350:	ba6d                	.insn	2, 0xba6d
    5352:	fff9                	.insn	2, 0xfff9
    5354:	3409                	.insn	2, 0x3409
    5356:	ffda                	.insn	2, 0xffda
    5358:	c282                	.insn	2, 0xc282
    535a:	fff5                	.insn	2, 0xfff5
    535c:	ffed4113          	xori	sp,s10,-2
    5360:	ffffa63b          	.insn	4, 0xffffa63b
    5364:	ffec09f7          	.insn	4, 0xffec09f7
    5368:	2bdd                	.insn	2, 0x2bdd
    536a:	fffa                	.insn	2, 0xfffa
    536c:	95d4                	.insn	2, 0x95d4
    536e:	0014                	.insn	2, 0x0014
    5370:	001c4563          	blt	s8,ra,537a <zetas+0x182>
    5374:	2c62                	.insn	2, 0x2c62
    5376:	ffea                	.insn	2, 0xffea
    5378:	fbe9                	.insn	2, 0xfbe9
    537a:	ffcc                	.insn	2, 0xffcc
    537c:	0af0                	.insn	2, 0x0af0
    537e:	0004                	.insn	2, 0x0004
    5380:	0007c417          	auipc	s0,0x7c
    5384:	4588                	.insn	2, 0x4588
    5386:	ad00002f          	.insn	4, 0xad00002f
    538a:	0000                	.insn	2, 0x0000
    538c:	36be                	.insn	2, 0x36be
    538e:	cd44ffef          	jal	t6,fff54862 <__stack_top+0xfff34866>
    5392:	000d                	.insn	2, 0x000d
    5394:	675a                	.insn	2, 0x675a
    5396:	003c                	.insn	2, 0x003c
    5398:	2bca                	.insn	2, 0x2bca
    539a:	de7effc7          	.insn	4, 0xde7effc7
    539e:	ffff                	.insn	2, 0xffff
    53a0:	3948                	.insn	2, 0x3948
    53a2:	0019                	.insn	2, 0x0019
    53a4:	69c0                	.insn	2, 0x69c0
    53a6:	ffce                	.insn	2, 0xffce
    53a8:	756c                	.insn	2, 0x756c
    53aa:	0024                	.insn	2, 0x0024
    53ac:	c7df fffc 98a1      	.insn	6, 0x98a1fffcc7df
    53b2:	e808000b          	.insn	4, 0xe808000b
    53b6:	e46cffeb          	.insn	4, 0xe46cffeb
    53ba:	0002                	.insn	2, 0x0002
    53bc:	c808                	.insn	2, 0xc808
    53be:	ffc9                	.insn	2, 0xffc9
    53c0:	36c2                	.insn	2, 0x36c2
    53c2:	0030                	.insn	2, 0x0030
    53c4:	bff6                	.insn	2, 0xbff6
    53c6:	3c93ffe3          	bgeu	t2,s1,5fa4 <KeccakF_RoundConstants+0x9ac>
    53ca:	4ae0ffdb          	.insn	4, 0x4ae0ffdb
    53ce:	fffd                	.insn	2, 0xfffd
    53d0:	1305                	.insn	2, 0x1305
    53d2:	0014                	.insn	2, 0x0014
    53d4:	7792                	.insn	2, 0x7792
    53d6:	0014                	.insn	2, 0x0014
    53d8:	9e25                	.insn	2, 0x9e25
    53da:	d0e00013          	li	zero,-754
    53de:	9944ffe7          	.insn	4, 0x9944ffe7
    53e2:	0802fff3          	.insn	4, 0x0802fff3
    53e6:	ffea                	.insn	2, 0xffea
    53e8:	eea2                	.insn	2, 0xeea2
    53ea:	ffd1                	.insn	2, 0xffd1
    53ec:	c79c                	.insn	2, 0xc79c
    53ee:	ffc4                	.insn	2, 0xffc4
    53f0:	ffc8a057          	.insn	4, 0xffc8a057
    53f4:	97d9                	.insn	2, 0x97d9
    53f6:	003a                	.insn	2, 0x003a
    53f8:	001fea93          	ori	s5,t6,1
    53fc:	ff5a                	.insn	2, 0xff5a
    53fe:	58d40033          	.insn	4, 0x58d40033
    5402:	41f80023          	sb	t6,1024(a6)
    5406:	003a                	.insn	2, 0x003a
    5408:	ff72                	.insn	2, 0xff72
    540a:	ffcc                	.insn	2, 0xffcc
    540c:	00223dfb          	.insn	4, 0x00223dfb
    5410:	ab9f ffda a422      	.insn	6, 0xa422ffdaab9f
    5416:	ffc9                	.insn	2, 0xffc9
    5418:	12f5                	.insn	2, 0x12f5
    541a:	0004                	.insn	2, 0x0004
    541c:	00252587          	.insn	4, 0x00252587
    5420:	24f0                	.insn	2, 0x24f0
    5422:	ffed                	.insn	2, 0xffed
    5424:	9b5d                	.insn	2, 0x9b5d
    5426:	0035                	.insn	2, 0x0035
    5428:	48a0                	.insn	2, 0x48a0
    542a:	ffca                	.insn	2, 0xffca
    542c:	a2fc                	.insn	2, 0xa2fc
    542e:	ffc6                	.insn	2, 0xffc6
    5430:	bb56                	.insn	2, 0xbb56
    5432:	ffed                	.insn	2, 0xffed
    5434:	45de                	.insn	2, 0x45de
    5436:	be5effcf          	.insn	4, 0xbe5effcf
    543a:	000d                	.insn	2, 0x000d
    543c:	5e1a                	.insn	2, 0x5e1a
    543e:	001c                	.insn	2, 0x001c
    5440:	e0e6                	.insn	2, 0xe0e6
    5442:	000d                	.insn	2, 0x000d
    5444:	7f5a                	.insn	2, 0x7f5a
    5446:	000c                	.insn	2, 0x000c
    5448:	00078f83          	lb	t6,0(a5)
    544c:	628a                	.insn	2, 0x628a
    544e:	5704ffe7          	.insn	4, 0x5704ffe7
    5452:	ffff                	.insn	2, 0xffff
    5454:	06fc                	.insn	2, 0x06fc
    5456:	fff8                	.insn	2, 0xfff8
    5458:	0021                	.insn	2, 0x0021
    545a:	fff6                	.insn	2, 0xfff6
    545c:	5af6                	.insn	2, 0x5af6
    545e:	ffd0                	.insn	2, 0xffd0
    5460:	0084                	.insn	2, 0x0084
    5462:	001f ef86 0030      	.insn	6, 0x0030ef86001f
    5468:	b97d                	.insn	2, 0xb97d
    546a:	ffc9                	.insn	2, 0xffc9
    546c:	fcd6                	.insn	2, 0xfcd6
    546e:	4592fff7          	.insn	4, 0x4592fff7
    5472:	fff4                	.insn	2, 0xfff4
    5474:	21c2                	.insn	2, 0x21c2
    5476:	ffc9                	.insn	2, 0xffc9
    5478:	3919                	.insn	2, 0x3919
    547a:	0005                	.insn	2, 0x0005
    547c:	610c                	.insn	2, 0x610c
    547e:	0004                	.insn	2, 0x0004
    5480:	cd41                	.insn	2, 0xcd41
    5482:	ffda                	.insn	2, 0xffda
    5484:	003eb01b          	.insn	4, 0x003eb01b
    5488:	003472e7          	.insn	4, 0x003472e7
    548c:	ffcd003b          	.insn	4, 0xffcd003b
    5490:	001a7cc7          	.insn	4, 0x001a7cc7
    5494:	1924                	.insn	2, 0x1924
    5496:	5ee50003          	lb	zero,1518(a0)
    549a:	1199002b          	.insn	4, 0x1199002b
    549e:	0029                	.insn	2, 0x0029
    54a0:	7a3a                	.insn	2, 0x7a3a
    54a2:	ffd8                	.insn	2, 0xffd8
    54a4:	4d71                	.insn	2, 0x4d71
    54a6:	e11c0013          	addi	zero,s8,-495
    54aa:	003d                	.insn	2, 0x003d
    54ac:	0984                	.insn	2, 0x0984
    54ae:	f0510013          	addi	zero,sp,-251
    54b2:	0025                	.insn	2, 0x0025
    54b4:	5a46                	.insn	2, 0x5a46
    54b6:	0018                	.insn	2, 0x0018
    54b8:	8518                	.insn	2, 0x8518
    54ba:	ffc6                	.insn	2, 0xffc6
    54bc:	14be                	.insn	2, 0x14be
    54be:	38910013          	addi	zero,sp,905
    54c2:	0028                	.insn	2, 0x0028
    54c4:	db90                	.insn	2, 0xdb90
    54c6:	ffc9                	.insn	2, 0xffc9
    54c8:	5089                	.insn	2, 0x5089
    54ca:	ffd2                	.insn	2, 0xffd2
    54cc:	001c853f 001d0b4b 	.insn	8, 0x001d0b4b001c853f
    54d4:	f6a6                	.insn	2, 0xf6a6
    54d6:	a8beffef          	jal	t6,ffff4f60 <__stack_top+0xfffd4f64>
    54da:	e11bffeb          	.insn	4, 0xe11bffeb
    54de:	0012                	.insn	2, 0x0012
    54e0:	5e3e                	.insn	2, 0x5e3e
    54e2:	ffcd                	.insn	2, 0xffcd
    54e4:	ffea2d2f          	.insn	4, 0xffea2d2f
    54e8:	1de4                	.insn	2, 0x1de4
    54ea:	fff9                	.insn	2, 0xfff9
    54ec:	001406c7          	.insn	4, 0x001406c7
    54f0:	00327283          	.insn	4, 0x00327283
    54f4:	0d6e                	.insn	2, 0x0d6e
    54f6:	ffe2                	.insn	2, 0xffe2
    54f8:	ffec7953          	.insn	4, 0xffec7953
    54fc:	4099                	.insn	2, 0x4099
    54fe:	001d                	.insn	2, 0x001d
    5500:	2578                	.insn	2, 0x2578
    5502:	ffd9                	.insn	2, 0xffd9
    5504:	05ad                	.insn	2, 0x05ad
    5506:	e405ffeb          	.insn	4, 0xe405ffeb
    550a:	0016                	.insn	2, 0x0016
    550c:	000bdbe7          	.insn	4, 0x000bdbe7
    5510:	1de8                	.insn	2, 0x1de8
    5512:	0022                	.insn	2, 0x0022
    5514:	0033f8cf          	.insn	4, 0x0033f8cf
    5518:	b934                	.insn	2, 0xb934
    551a:	ca0cfff7          	.insn	4, 0xca0cfff7
    551e:	ffd4                	.insn	2, 0xffd4
    5520:	7ff8                	.insn	2, 0x7ff8
    5522:	ffe6                	.insn	2, 0xffe6
    5524:	ffe3d157          	.insn	4, 0xffe3d157
    5528:	ffd8911b          	.insn	4, 0xffd8911b
    552c:	2c12                	.insn	2, 0x2c12
    552e:	10d8ffc7          	.insn	4, 0x10d8ffc7
    5532:	0009                	.insn	2, 0x0009
    5534:	5e1f ffc6 4658      	.insn	6, 0x4658ffc65e1f
    553a:	ffe1                	.insn	2, 0xffe1
    553c:	00251d8b          	.insn	4, 0x00251d8b
    5540:	002573b7          	lui	t2,0x257
    5544:	fffd7c8f          	.insn	4, 0xfffd7c8f
    5548:	dd98                	.insn	2, 0xdd98
    554a:	001d                	.insn	2, 0x001d
    554c:	6898                	.insn	2, 0x6898
    554e:	d4bb0033          	.insn	4, 0xd4bb0033
    5552:	0002                	.insn	2, 0x0002
    5554:	ffed93a7          	.insn	4, 0xffed93a7
    5558:	6cbe                	.insn	2, 0x6cbe
    555a:	7c1cffcf          	.insn	4, 0x7c1cffcf
    555e:	0002                	.insn	2, 0x0002
    5560:	aa08                	.insn	2, 0xaa08
    5562:	0018                	.insn	2, 0x0018
    5564:	fd71                	.insn	2, 0xfd71
    5566:	002d                	.insn	2, 0x002d
    5568:	5ca5                	.insn	2, 0x5ca5
    556a:	000c                	.insn	2, 0x000c
    556c:	379a                	.insn	2, 0x379a
    556e:	0019                	.insn	2, 0x0019
    5570:	ffc7a167          	.insn	4, 0xffc7a167
    5574:	8c3d                	.insn	2, 0x8c3d
    5576:	ffe4                	.insn	2, 0xffe4
    5578:	a13c                	.insn	2, 0xa13c
    557a:	ffd1                	.insn	2, 0xffd1
    557c:	c539                	.insn	2, 0xc539
    557e:	0035                	.insn	2, 0x0035
    5580:	0115                	.insn	2, 0x0115
    5582:	1dc0003b          	.insn	4, 0x1dc0003b
    5586:	0004                	.insn	2, 0x0004
    5588:	0021c4f7          	.insn	4, 0x0021c4f7
    558c:	1bf4                	.insn	2, 0x1bf4
    558e:	fff1                	.insn	2, 0xfff1
    5590:	001a35e7          	.insn	4, 0x001a35e7
    5594:	340e                	.insn	2, 0x340e
    5596:	7d450007          	.insn	4, 0x7d450007
    559a:	fff9                	.insn	2, 0xfff9
    559c:	4cd0                	.insn	2, 0x4cd0
    559e:	001a                	.insn	2, 0x001a
    55a0:	7cae                	.insn	2, 0x7cae
    55a2:	ffe4                	.insn	2, 0xffe4
    55a4:	2668                	.insn	2, 0x2668
    55a6:	001d                	.insn	2, 0x001d
    55a8:	8e98                	.insn	2, 0x8e98
    55aa:	ffe6                	.insn	2, 0xffe6
    55ac:	ffef2633          	.insn	4, 0xffef2633
    55b0:	05da                	.insn	2, 0x05da
    55b2:	fffc                	.insn	2, 0xfffc
    55b4:	ffc57fdb          	.insn	4, 0xffc57fdb
    55b8:	2764                	.insn	2, 0x2764
    55ba:	e1afffd3          	.insn	4, 0xe1afffd3
    55be:	ffdd                	.insn	2, 0xffdd
    55c0:	93dd                	.insn	2, 0x93dd
    55c2:	fff9                	.insn	2, 0xfff9
    55c4:	1d09                	.insn	2, 0x1d09
    55c6:	ffdd                	.insn	2, 0xffdd
    55c8:	0002cc93          	xori	s9,t0,0
    55cc:	1805                	.insn	2, 0x1805
    55ce:	fff1                	.insn	2, 0xfff1
    55d0:	9c2a                	.insn	2, 0x9c2a
    55d2:	0018                	.insn	2, 0x0018
    55d4:	e5a9                	.insn	2, 0xe5a9
    55d6:	ffc9                	.insn	2, 0xffc9
    55d8:	8a50                	.insn	2, 0x8a50
    55da:	cf2cfff7          	.insn	4, 0xcf2cfff7
    55de:	434e003b          	.insn	4, 0x434e003b
    55e2:	ffff                	.insn	2, 0xffff
    55e4:	36df ffeb 15ca      	.insn	6, 0x15caffeb36df
    55ea:	003c                	.insn	2, 0x003c
    55ec:	5e68                	.insn	2, 0x5e68
    55ee:	0015                	.insn	2, 0x0015
    55f0:	16b6                	.insn	2, 0x16b6
    55f2:	29cefff3          	.insn	4, 0x29cefff3
    55f6:	001e                	.insn	2, 0x001e

000055f8 <KeccakF_RoundConstants>:
    55f8:	0001                	.insn	2, 0x0001
    55fa:	0000                	.insn	2, 0x0000
    55fc:	0000                	.insn	2, 0x0000
    55fe:	0000                	.insn	2, 0x0000
    5600:	8082                	.insn	2, 0x8082
    5602:	0000                	.insn	2, 0x0000
    5604:	0000                	.insn	2, 0x0000
    5606:	0000                	.insn	2, 0x0000
    5608:	808a                	.insn	2, 0x808a
    560a:	0000                	.insn	2, 0x0000
    560c:	0000                	.insn	2, 0x0000
    560e:	8000                	.insn	2, 0x8000
    5610:	8000                	.insn	2, 0x8000
    5612:	8000                	.insn	2, 0x8000
    5614:	0000                	.insn	2, 0x0000
    5616:	8000                	.insn	2, 0x8000
    5618:	0000808b          	.insn	4, 0x808b
    561c:	0000                	.insn	2, 0x0000
    561e:	0000                	.insn	2, 0x0000
    5620:	0001                	.insn	2, 0x0001
    5622:	8000                	.insn	2, 0x8000
    5624:	0000                	.insn	2, 0x0000
    5626:	0000                	.insn	2, 0x0000
    5628:	8081                	.insn	2, 0x8081
    562a:	8000                	.insn	2, 0x8000
    562c:	0000                	.insn	2, 0x0000
    562e:	8000                	.insn	2, 0x8000
    5630:	8009                	.insn	2, 0x8009
    5632:	0000                	.insn	2, 0x0000
    5634:	0000                	.insn	2, 0x0000
    5636:	8000                	.insn	2, 0x8000
    5638:	008a                	.insn	2, 0x008a
    563a:	0000                	.insn	2, 0x0000
    563c:	0000                	.insn	2, 0x0000
    563e:	0000                	.insn	2, 0x0000
    5640:	0088                	.insn	2, 0x0088
    5642:	0000                	.insn	2, 0x0000
    5644:	0000                	.insn	2, 0x0000
    5646:	0000                	.insn	2, 0x0000
    5648:	8009                	.insn	2, 0x8009
    564a:	8000                	.insn	2, 0x8000
    564c:	0000                	.insn	2, 0x0000
    564e:	0000                	.insn	2, 0x0000
    5650:	000a                	.insn	2, 0x000a
    5652:	8000                	.insn	2, 0x8000
    5654:	0000                	.insn	2, 0x0000
    5656:	0000                	.insn	2, 0x0000
    5658:	8000808b          	.insn	4, 0x8000808b
    565c:	0000                	.insn	2, 0x0000
    565e:	0000                	.insn	2, 0x0000
    5660:	0000008b          	.insn	4, 0x008b
    5664:	0000                	.insn	2, 0x0000
    5666:	8000                	.insn	2, 0x8000
    5668:	8089                	.insn	2, 0x8089
    566a:	0000                	.insn	2, 0x0000
    566c:	0000                	.insn	2, 0x0000
    566e:	8000                	.insn	2, 0x8000
    5670:	00008003          	lb	zero,0(ra)
    5674:	0000                	.insn	2, 0x0000
    5676:	8000                	.insn	2, 0x8000
    5678:	8002                	.insn	2, 0x8002
    567a:	0000                	.insn	2, 0x0000
    567c:	0000                	.insn	2, 0x0000
    567e:	8000                	.insn	2, 0x8000
    5680:	0080                	.insn	2, 0x0080
    5682:	0000                	.insn	2, 0x0000
    5684:	0000                	.insn	2, 0x0000
    5686:	8000                	.insn	2, 0x8000
    5688:	800a                	.insn	2, 0x800a
    568a:	0000                	.insn	2, 0x0000
    568c:	0000                	.insn	2, 0x0000
    568e:	0000                	.insn	2, 0x0000
    5690:	000a                	.insn	2, 0x000a
    5692:	8000                	.insn	2, 0x8000
    5694:	0000                	.insn	2, 0x0000
    5696:	8000                	.insn	2, 0x8000
    5698:	8081                	.insn	2, 0x8081
    569a:	8000                	.insn	2, 0x8000
    569c:	0000                	.insn	2, 0x0000
    569e:	8000                	.insn	2, 0x8000
    56a0:	8080                	.insn	2, 0x8080
    56a2:	0000                	.insn	2, 0x0000
    56a4:	0000                	.insn	2, 0x0000
    56a6:	8000                	.insn	2, 0x8000
    56a8:	0001                	.insn	2, 0x0001
    56aa:	8000                	.insn	2, 0x8000
    56ac:	0000                	.insn	2, 0x0000
    56ae:	0000                	.insn	2, 0x0000
    56b0:	8008                	.insn	2, 0x8008
    56b2:	8000                	.insn	2, 0x8000
    56b4:	0000                	.insn	2, 0x0000
    56b6:	8000                	.insn	2, 0x8000

Disassembly of section .eh_frame:

000056b8 <.eh_frame>:
    56b8:	0010                	.insn	2, 0x0010
    56ba:	0000                	.insn	2, 0x0000
    56bc:	0000                	.insn	2, 0x0000
    56be:	0000                	.insn	2, 0x0000
    56c0:	00527a03          	.insn	4, 0x00527a03
    56c4:	7c01                	.insn	2, 0x7c01
    56c6:	0101                	.insn	2, 0x0101
    56c8:	00020c1b          	.insn	4, 0x00020c1b
    56cc:	0010                	.insn	2, 0x0010
    56ce:	0000                	.insn	2, 0x0000
    56d0:	0018                	.insn	2, 0x0018
    56d2:	0000                	.insn	2, 0x0000
    56d4:	a92c                	.insn	2, 0xa92c
    56d6:	ffff                	.insn	2, 0xffff
    56d8:	0010                	.insn	2, 0x0010
    56da:	0000                	.insn	2, 0x0000
    56dc:	0000                	.insn	2, 0x0000
	...

Disassembly of section .data:

0000a000 <input_array>:
    a000:	ff00                	.insn	2, 0xff00
    a002:	f1697847          	.insn	4, 0xf1697847
    a006:	54842dbb          	.insn	4, 0x54842dbb
    a00a:	30a4                	.insn	2, 0x30a4
    a00c:	d8a2                	.insn	2, 0xd8a2
    a00e:	b599                	.insn	2, 0xb599
    a010:	8268                	.insn	2, 0x8268
    a012:	5ff6                	.insn	2, 0x5ff6
    a014:	3080                	.insn	2, 0x3080
    a016:	5dd2d1cb          	.insn	4, 0x5dd2d1cb
    a01a:	ff96                	.insn	2, 0xff96
    a01c:	55a4                	.insn	2, 0x55a4
    a01e:	2e56                	.insn	2, 0x2e56
    a020:	55b4                	.insn	2, 0x55b4
    a022:	792a                	.insn	2, 0x792a
    a024:	8c92                	.insn	2, 0x8c92
    a026:	1dca                	.insn	2, 0x1dca
    a028:	2863f6ab          	.insn	4, 0x2863f6ab
    a02c:	7406                	.insn	2, 0x7406
    a02e:	ce02                	.insn	2, 0xce02
    a030:	9cb8b45b          	.insn	4, 0x9cb8b45b
    a034:	9be1                	.insn	2, 0x9be1
    a036:	2786                	.insn	2, 0x2786
    a038:	848e                	.insn	2, 0x848e
    a03a:	6b                	.byte	0x6b

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
  1a:	4700                	.insn	2, 0x4700
  1c:	203a4343          	.insn	4, 0x203a4343
  20:	4728                	.insn	2, 0x4728
  22:	554e                	.insn	2, 0x554e
  24:	2029                	.insn	2, 0x2029
  26:	3531                	.insn	2, 0x3531
  28:	312e                	.insn	2, 0x312e
  2a:	302e                	.insn	2, 0x302e
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
