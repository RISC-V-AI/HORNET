
aes_main.elf:     file format elf32-littleriscv


Disassembly of section .init:

00000000 <_start>:
   0:	00007117          	auipc	sp,0x7
   4:	7fc10113          	addi	sp,sp,2044 # 77fc <__stack_top>
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
      30:	01612023          	sw	s6,0(sp)
      34:	07c050ef          	jal	50b0 <SET_MTVEC_VECTOR_MODE>
      38:	000079b7          	lui	s3,0x7
      3c:	100085b7          	lui	a1,0x10008
      40:	a2c98513          	addi	a0,s3,-1492 # 6a2c <uart0>
      44:	01058593          	addi	a1,a1,16 # 10008010 <__stack_size+0xfff8010>
      48:	000074b7          	lui	s1,0x7
      4c:	a204aa23          	sw	zero,-1484(s1) # 6a34 <count>
      50:	789040ef          	jal	4fd8 <uart_init>
      54:	000055b7          	lui	a1,0x5
      58:	a2c98513          	addi	a0,s3,-1492
      5c:	2c858593          	addi	a1,a1,712 # 52c8 <memcpy+0x128>
      60:	00c00613          	li	a2,12
      64:	7b5040ef          	jal	5018 <uart_transmit_string>
      68:	00007937          	lui	s2,0x7
      6c:	00006b37          	lui	s6,0x6
      70:	00007ab7          	lui	s5,0x7
      74:	00007a37          	lui	s4,0x7
      78:	000b0713          	mv	a4,s6
      7c:	9f0a8613          	addi	a2,s5,-1552 # 69f0 <input_array>
      80:	a30a0593          	addi	a1,s4,-1488 # 6a30 <smlen>
      84:	a3890513          	addi	a0,s2,-1480 # 6a38 <sm>
      88:	03b00693          	li	a3,59
      8c:	1dd040ef          	jal	4a68 <pqcrystals_dilithium2_ref>
      90:	a3890593          	addi	a1,s2,-1480
      94:	a2c98513          	addi	a0,s3,-1492
      98:	03b00613          	li	a2,59
      9c:	77d040ef          	jal	5018 <uart_transmit_string>
      a0:	000b0b13          	mv	s6,s6
      a4:	9f0a8a93          	addi	s5,s5,-1552
      a8:	a30a0a13          	addi	s4,s4,-1488
      ac:	a3890913          	addi	s2,s2,-1480
      b0:	a2c98993          	addi	s3,s3,-1492
      b4:	03b00413          	li	s0,59
      b8:	30046073          	csrsi	mstatus,8
      bc:	a344a783          	lw	a5,-1484(s1)
      c0:	fe879ee3          	bne	a5,s0,bc <main+0xac>
      c4:	000b0713          	mv	a4,s6
      c8:	00040693          	mv	a3,s0
      cc:	000a8613          	mv	a2,s5
      d0:	000a0593          	mv	a1,s4
      d4:	00090513          	mv	a0,s2
      d8:	191040ef          	jal	4a68 <pqcrystals_dilithium2_ref>
      dc:	00040613          	mv	a2,s0
      e0:	00090593          	mv	a1,s2
      e4:	00098513          	mv	a0,s3
      e8:	731040ef          	jal	5018 <uart_transmit_string>
      ec:	a204aa23          	sw	zero,-1484(s1)
      f0:	fc9ff06f          	j	b8 <main+0xa8>

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
     10c:	000077b7          	lui	a5,0x7
     110:	a2c7a783          	lw	a5,-1492(a5) # 6a2c <uart0>
     114:	00e12223          	sw	a4,4(sp)
     118:	00007737          	lui	a4,0x7
     11c:	00c12623          	sw	a2,12(sp)
     120:	00d12423          	sw	a3,8(sp)
     124:	a3472603          	lw	a2,-1484(a4) # 6a34 <count>
     128:	0017c683          	lbu	a3,1(a5)
     12c:	000077b7          	lui	a5,0x7
     130:	9f078793          	addi	a5,a5,-1552 # 69f0 <input_array>
     134:	00c787b3          	add	a5,a5,a2
     138:	00d78023          	sb	a3,0(a5)
     13c:	a3472783          	lw	a5,-1484(a4)
     140:	03b00693          	li	a3,59
     144:	00178793          	addi	a5,a5,1
     148:	a2f72a23          	sw	a5,-1484(a4)
     14c:	a3472783          	lw	a5,-1484(a4)
     150:	00d79463          	bne	a5,a3,158 <fast_irq0_handler+0x54>
     154:	30047073          	csrci	mstatus,8
     158:	00c12603          	lw	a2,12(sp)
     15c:	00812683          	lw	a3,8(sp)
     160:	00412703          	lw	a4,4(sp)
     164:	00012783          	lw	a5,0(sp)
     168:	01010113          	addi	sp,sp,16
     16c:	30200073          	mret

00000170 <fast_irq1_handler>:
     170:	30200073          	mret

00000174 <pqcrystals_dilithium2_ref_polyvec_matrix_expand>:
     174:	fe010113          	addi	sp,sp,-32
     178:	01512223          	sw	s5,4(sp)
     17c:	00001ab7          	lui	s5,0x1
     180:	01212823          	sw	s2,16(sp)
     184:	01312623          	sw	s3,12(sp)
     188:	01412423          	sw	s4,8(sp)
     18c:	01612023          	sw	s6,0(sp)
     190:	00112e23          	sw	ra,28(sp)
     194:	00812c23          	sw	s0,24(sp)
     198:	00912a23          	sw	s1,20(sp)
     19c:	00058a13          	mv	s4,a1
     1a0:	01550933          	add	s2,a0,s5
     1a4:	00000993          	li	s3,0
     1a8:	40000b13          	li	s6,1024
     1ac:	80090493          	addi	s1,s2,-2048
     1b0:	80048493          	addi	s1,s1,-2048
     1b4:	00098413          	mv	s0,s3
     1b8:	00040613          	mv	a2,s0
     1bc:	00140413          	addi	s0,s0,1
     1c0:	00048513          	mv	a0,s1
     1c4:	000a0593          	mv	a1,s4
     1c8:	01041413          	slli	s0,s0,0x10
     1cc:	40048493          	addi	s1,s1,1024
     1d0:	221000ef          	jal	bf0 <pqcrystals_dilithium2_ref_poly_uniform>
     1d4:	01045413          	srli	s0,s0,0x10
     1d8:	ff2490e3          	bne	s1,s2,1b8 <pqcrystals_dilithium2_ref_polyvec_matrix_expand+0x44>
     1dc:	10098993          	addi	s3,s3,256
     1e0:	01099993          	slli	s3,s3,0x10
     1e4:	0109d993          	srli	s3,s3,0x10
     1e8:	01548933          	add	s2,s1,s5
     1ec:	fd6990e3          	bne	s3,s6,1ac <pqcrystals_dilithium2_ref_polyvec_matrix_expand+0x38>
     1f0:	01c12083          	lw	ra,28(sp)
     1f4:	01812403          	lw	s0,24(sp)
     1f8:	01412483          	lw	s1,20(sp)
     1fc:	01012903          	lw	s2,16(sp)
     200:	00c12983          	lw	s3,12(sp)
     204:	00812a03          	lw	s4,8(sp)
     208:	00412a83          	lw	s5,4(sp)
     20c:	00012b03          	lw	s6,0(sp)
     210:	02010113          	addi	sp,sp,32
     214:	00008067          	ret

00000218 <pqcrystals_dilithium2_ref_polyvecl_uniform_gamma1>:
     218:	fe010113          	addi	sp,sp,-32
     21c:	00812c23          	sw	s0,24(sp)
     220:	00261413          	slli	s0,a2,0x2
     224:	01212823          	sw	s2,16(sp)
     228:	01041413          	slli	s0,s0,0x10
     22c:	00001937          	lui	s2,0x1
     230:	00912a23          	sw	s1,20(sp)
     234:	01312623          	sw	s3,12(sp)
     238:	00112e23          	sw	ra,28(sp)
     23c:	01045413          	srli	s0,s0,0x10
     240:	00050493          	mv	s1,a0
     244:	00058993          	mv	s3,a1
     248:	01250933          	add	s2,a0,s2
     24c:	00040613          	mv	a2,s0
     250:	00140413          	addi	s0,s0,1
     254:	00048513          	mv	a0,s1
     258:	00098593          	mv	a1,s3
     25c:	01041413          	slli	s0,s0,0x10
     260:	40048493          	addi	s1,s1,1024
     264:	0b8010ef          	jal	131c <pqcrystals_dilithium2_ref_poly_uniform_gamma1>
     268:	01045413          	srli	s0,s0,0x10
     26c:	ff2490e3          	bne	s1,s2,24c <pqcrystals_dilithium2_ref_polyvecl_uniform_gamma1+0x34>
     270:	01c12083          	lw	ra,28(sp)
     274:	01812403          	lw	s0,24(sp)
     278:	01412483          	lw	s1,20(sp)
     27c:	01012903          	lw	s2,16(sp)
     280:	00c12983          	lw	s3,12(sp)
     284:	02010113          	addi	sp,sp,32
     288:	00008067          	ret

0000028c <pqcrystals_dilithium2_ref_polyvecl_reduce>:
     28c:	ff010113          	addi	sp,sp,-16
     290:	00912223          	sw	s1,4(sp)
     294:	000014b7          	lui	s1,0x1
     298:	00812423          	sw	s0,8(sp)
     29c:	00112623          	sw	ra,12(sp)
     2a0:	00050413          	mv	s0,a0
     2a4:	009504b3          	add	s1,a0,s1
     2a8:	00040513          	mv	a0,s0
     2ac:	40040413          	addi	s0,s0,1024
     2b0:	6a0000ef          	jal	950 <pqcrystals_dilithium2_ref_poly_reduce>
     2b4:	fe941ae3          	bne	s0,s1,2a8 <pqcrystals_dilithium2_ref_polyvecl_reduce+0x1c>
     2b8:	00c12083          	lw	ra,12(sp)
     2bc:	00812403          	lw	s0,8(sp)
     2c0:	00412483          	lw	s1,4(sp)
     2c4:	01010113          	addi	sp,sp,16
     2c8:	00008067          	ret

000002cc <pqcrystals_dilithium2_ref_polyvecl_add>:
     2cc:	fe010113          	addi	sp,sp,-32
     2d0:	00812c23          	sw	s0,24(sp)
     2d4:	00912a23          	sw	s1,20(sp)
     2d8:	01212823          	sw	s2,16(sp)
     2dc:	01312623          	sw	s3,12(sp)
     2e0:	01412423          	sw	s4,8(sp)
     2e4:	00112e23          	sw	ra,28(sp)
     2e8:	00050a13          	mv	s4,a0
     2ec:	00058993          	mv	s3,a1
     2f0:	00060913          	mv	s2,a2
     2f4:	00000413          	li	s0,0
     2f8:	000014b7          	lui	s1,0x1
     2fc:	00890633          	add	a2,s2,s0
     300:	008985b3          	add	a1,s3,s0
     304:	008a0533          	add	a0,s4,s0
     308:	40040413          	addi	s0,s0,1024
     30c:	6c4000ef          	jal	9d0 <pqcrystals_dilithium2_ref_poly_add>
     310:	fe9416e3          	bne	s0,s1,2fc <pqcrystals_dilithium2_ref_polyvecl_add+0x30>
     314:	01c12083          	lw	ra,28(sp)
     318:	01812403          	lw	s0,24(sp)
     31c:	01412483          	lw	s1,20(sp)
     320:	01012903          	lw	s2,16(sp)
     324:	00c12983          	lw	s3,12(sp)
     328:	00812a03          	lw	s4,8(sp)
     32c:	02010113          	addi	sp,sp,32
     330:	00008067          	ret

00000334 <pqcrystals_dilithium2_ref_polyvecl_ntt>:
     334:	ff010113          	addi	sp,sp,-16
     338:	00912223          	sw	s1,4(sp)
     33c:	000014b7          	lui	s1,0x1
     340:	00812423          	sw	s0,8(sp)
     344:	00112623          	sw	ra,12(sp)
     348:	00050413          	mv	s0,a0
     34c:	009504b3          	add	s1,a0,s1
     350:	00040513          	mv	a0,s0
     354:	40040413          	addi	s0,s0,1024
     358:	6d8000ef          	jal	a30 <pqcrystals_dilithium2_ref_poly_ntt>
     35c:	fe941ae3          	bne	s0,s1,350 <pqcrystals_dilithium2_ref_polyvecl_ntt+0x1c>
     360:	00c12083          	lw	ra,12(sp)
     364:	00812403          	lw	s0,8(sp)
     368:	00412483          	lw	s1,4(sp)
     36c:	01010113          	addi	sp,sp,16
     370:	00008067          	ret

00000374 <pqcrystals_dilithium2_ref_polyvecl_invntt_tomont>:
     374:	ff010113          	addi	sp,sp,-16
     378:	00912223          	sw	s1,4(sp)
     37c:	000014b7          	lui	s1,0x1
     380:	00812423          	sw	s0,8(sp)
     384:	00112623          	sw	ra,12(sp)
     388:	00050413          	mv	s0,a0
     38c:	009504b3          	add	s1,a0,s1
     390:	00040513          	mv	a0,s0
     394:	40040413          	addi	s0,s0,1024
     398:	69c000ef          	jal	a34 <pqcrystals_dilithium2_ref_poly_invntt_tomont>
     39c:	fe941ae3          	bne	s0,s1,390 <pqcrystals_dilithium2_ref_polyvecl_invntt_tomont+0x1c>
     3a0:	00c12083          	lw	ra,12(sp)
     3a4:	00812403          	lw	s0,8(sp)
     3a8:	00412483          	lw	s1,4(sp)
     3ac:	01010113          	addi	sp,sp,16
     3b0:	00008067          	ret

000003b4 <pqcrystals_dilithium2_ref_polyvecl_pointwise_poly_montgomery>:
     3b4:	fe010113          	addi	sp,sp,-32
     3b8:	00812c23          	sw	s0,24(sp)
     3bc:	00912a23          	sw	s1,20(sp)
     3c0:	01212823          	sw	s2,16(sp)
     3c4:	01312623          	sw	s3,12(sp)
     3c8:	01412423          	sw	s4,8(sp)
     3cc:	00112e23          	sw	ra,28(sp)
     3d0:	00050a13          	mv	s4,a0
     3d4:	00058993          	mv	s3,a1
     3d8:	00060913          	mv	s2,a2
     3dc:	00000413          	li	s0,0
     3e0:	000014b7          	lui	s1,0x1
     3e4:	00890633          	add	a2,s2,s0
     3e8:	008a0533          	add	a0,s4,s0
     3ec:	00098593          	mv	a1,s3
     3f0:	40040413          	addi	s0,s0,1024
     3f4:	644000ef          	jal	a38 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery>
     3f8:	fe9416e3          	bne	s0,s1,3e4 <pqcrystals_dilithium2_ref_polyvecl_pointwise_poly_montgomery+0x30>
     3fc:	01c12083          	lw	ra,28(sp)
     400:	01812403          	lw	s0,24(sp)
     404:	01412483          	lw	s1,20(sp)
     408:	01012903          	lw	s2,16(sp)
     40c:	00c12983          	lw	s3,12(sp)
     410:	00812a03          	lw	s4,8(sp)
     414:	02010113          	addi	sp,sp,32
     418:	00008067          	ret

0000041c <pqcrystals_dilithium2_ref_polyvecl_pointwise_acc_montgomery>:
     41c:	be010113          	addi	sp,sp,-1056
     420:	40812c23          	sw	s0,1048(sp)
     424:	40912a23          	sw	s1,1044(sp)
     428:	41212823          	sw	s2,1040(sp)
     42c:	41312623          	sw	s3,1036(sp)
     430:	00058913          	mv	s2,a1
     434:	40112e23          	sw	ra,1052(sp)
     438:	00050993          	mv	s3,a0
     43c:	40060493          	addi	s1,a2,1024
     440:	5f8000ef          	jal	a38 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery>
     444:	000017b7          	lui	a5,0x1
     448:	40090413          	addi	s0,s2,1024 # 1400 <pqcrystals_dilithium2_ref_ntt+0x3c>
     44c:	00f90933          	add	s2,s2,a5
     450:	00048613          	mv	a2,s1
     454:	00040593          	mv	a1,s0
     458:	00010513          	mv	a0,sp
     45c:	5dc000ef          	jal	a38 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery>
     460:	00010613          	mv	a2,sp
     464:	00098593          	mv	a1,s3
     468:	00098513          	mv	a0,s3
     46c:	40040413          	addi	s0,s0,1024
     470:	560000ef          	jal	9d0 <pqcrystals_dilithium2_ref_poly_add>
     474:	40048493          	addi	s1,s1,1024 # 1400 <pqcrystals_dilithium2_ref_ntt+0x3c>
     478:	fd241ce3          	bne	s0,s2,450 <pqcrystals_dilithium2_ref_polyvecl_pointwise_acc_montgomery+0x34>
     47c:	41c12083          	lw	ra,1052(sp)
     480:	41812403          	lw	s0,1048(sp)
     484:	41412483          	lw	s1,1044(sp)
     488:	41012903          	lw	s2,1040(sp)
     48c:	40c12983          	lw	s3,1036(sp)
     490:	42010113          	addi	sp,sp,1056
     494:	00008067          	ret

00000498 <pqcrystals_dilithium2_ref_polyvec_matrix_pointwise_montgomery>:
     498:	fe010113          	addi	sp,sp,-32
     49c:	01212823          	sw	s2,16(sp)
     4a0:	00001937          	lui	s2,0x1
     4a4:	00812c23          	sw	s0,24(sp)
     4a8:	00912a23          	sw	s1,20(sp)
     4ac:	01312623          	sw	s3,12(sp)
     4b0:	01412423          	sw	s4,8(sp)
     4b4:	00112e23          	sw	ra,28(sp)
     4b8:	00050413          	mv	s0,a0
     4bc:	00058493          	mv	s1,a1
     4c0:	00060a13          	mv	s4,a2
     4c4:	012509b3          	add	s3,a0,s2
     4c8:	00048593          	mv	a1,s1
     4cc:	00040513          	mv	a0,s0
     4d0:	000a0613          	mv	a2,s4
     4d4:	40040413          	addi	s0,s0,1024
     4d8:	f45ff0ef          	jal	41c <pqcrystals_dilithium2_ref_polyvecl_pointwise_acc_montgomery>
     4dc:	012484b3          	add	s1,s1,s2
     4e0:	ff3414e3          	bne	s0,s3,4c8 <pqcrystals_dilithium2_ref_polyvec_matrix_pointwise_montgomery+0x30>
     4e4:	01c12083          	lw	ra,28(sp)
     4e8:	01812403          	lw	s0,24(sp)
     4ec:	01412483          	lw	s1,20(sp)
     4f0:	01012903          	lw	s2,16(sp)
     4f4:	00c12983          	lw	s3,12(sp)
     4f8:	00812a03          	lw	s4,8(sp)
     4fc:	02010113          	addi	sp,sp,32
     500:	00008067          	ret

00000504 <pqcrystals_dilithium2_ref_polyvecl_chknorm>:
     504:	ff010113          	addi	sp,sp,-16
     508:	00912223          	sw	s1,4(sp)
     50c:	000014b7          	lui	s1,0x1
     510:	00812423          	sw	s0,8(sp)
     514:	01212023          	sw	s2,0(sp)
     518:	00112623          	sw	ra,12(sp)
     51c:	00050413          	mv	s0,a0
     520:	00058913          	mv	s2,a1
     524:	009504b3          	add	s1,a0,s1
     528:	00040513          	mv	a0,s0
     52c:	00090593          	mv	a1,s2
     530:	67c000ef          	jal	bac <pqcrystals_dilithium2_ref_poly_chknorm>
     534:	40040413          	addi	s0,s0,1024
     538:	02051063          	bnez	a0,558 <pqcrystals_dilithium2_ref_polyvecl_chknorm+0x54>
     53c:	fe9416e3          	bne	s0,s1,528 <pqcrystals_dilithium2_ref_polyvecl_chknorm+0x24>
     540:	00c12083          	lw	ra,12(sp)
     544:	00812403          	lw	s0,8(sp)
     548:	00412483          	lw	s1,4(sp)
     54c:	00012903          	lw	s2,0(sp)
     550:	01010113          	addi	sp,sp,16
     554:	00008067          	ret
     558:	00c12083          	lw	ra,12(sp)
     55c:	00812403          	lw	s0,8(sp)
     560:	00412483          	lw	s1,4(sp)
     564:	00012903          	lw	s2,0(sp)
     568:	00100513          	li	a0,1
     56c:	01010113          	addi	sp,sp,16
     570:	00008067          	ret

00000574 <pqcrystals_dilithium2_ref_polyveck_reduce>:
     574:	ff010113          	addi	sp,sp,-16
     578:	00912223          	sw	s1,4(sp)
     57c:	000014b7          	lui	s1,0x1
     580:	00812423          	sw	s0,8(sp)
     584:	00112623          	sw	ra,12(sp)
     588:	00050413          	mv	s0,a0
     58c:	009504b3          	add	s1,a0,s1
     590:	00040513          	mv	a0,s0
     594:	40040413          	addi	s0,s0,1024
     598:	3b8000ef          	jal	950 <pqcrystals_dilithium2_ref_poly_reduce>
     59c:	fe941ae3          	bne	s0,s1,590 <pqcrystals_dilithium2_ref_polyveck_reduce+0x1c>
     5a0:	00c12083          	lw	ra,12(sp)
     5a4:	00812403          	lw	s0,8(sp)
     5a8:	00412483          	lw	s1,4(sp)
     5ac:	01010113          	addi	sp,sp,16
     5b0:	00008067          	ret

000005b4 <pqcrystals_dilithium2_ref_polyveck_caddq>:
     5b4:	ff010113          	addi	sp,sp,-16
     5b8:	00912223          	sw	s1,4(sp)
     5bc:	000014b7          	lui	s1,0x1
     5c0:	00812423          	sw	s0,8(sp)
     5c4:	00112623          	sw	ra,12(sp)
     5c8:	00050413          	mv	s0,a0
     5cc:	009504b3          	add	s1,a0,s1
     5d0:	00040513          	mv	a0,s0
     5d4:	40040413          	addi	s0,s0,1024
     5d8:	3b8000ef          	jal	990 <pqcrystals_dilithium2_ref_poly_caddq>
     5dc:	fe941ae3          	bne	s0,s1,5d0 <pqcrystals_dilithium2_ref_polyveck_caddq+0x1c>
     5e0:	00c12083          	lw	ra,12(sp)
     5e4:	00812403          	lw	s0,8(sp)
     5e8:	00412483          	lw	s1,4(sp)
     5ec:	01010113          	addi	sp,sp,16
     5f0:	00008067          	ret

000005f4 <pqcrystals_dilithium2_ref_polyveck_add>:
     5f4:	fe010113          	addi	sp,sp,-32
     5f8:	00812c23          	sw	s0,24(sp)
     5fc:	00912a23          	sw	s1,20(sp)
     600:	01212823          	sw	s2,16(sp)
     604:	01312623          	sw	s3,12(sp)
     608:	01412423          	sw	s4,8(sp)
     60c:	00112e23          	sw	ra,28(sp)
     610:	00050a13          	mv	s4,a0
     614:	00058993          	mv	s3,a1
     618:	00060913          	mv	s2,a2
     61c:	00000413          	li	s0,0
     620:	000014b7          	lui	s1,0x1
     624:	00890633          	add	a2,s2,s0
     628:	008985b3          	add	a1,s3,s0
     62c:	008a0533          	add	a0,s4,s0
     630:	40040413          	addi	s0,s0,1024
     634:	39c000ef          	jal	9d0 <pqcrystals_dilithium2_ref_poly_add>
     638:	fe9416e3          	bne	s0,s1,624 <pqcrystals_dilithium2_ref_polyveck_add+0x30>
     63c:	01c12083          	lw	ra,28(sp)
     640:	01812403          	lw	s0,24(sp)
     644:	01412483          	lw	s1,20(sp)
     648:	01012903          	lw	s2,16(sp)
     64c:	00c12983          	lw	s3,12(sp)
     650:	00812a03          	lw	s4,8(sp)
     654:	02010113          	addi	sp,sp,32
     658:	00008067          	ret

0000065c <pqcrystals_dilithium2_ref_polyveck_sub>:
     65c:	fe010113          	addi	sp,sp,-32
     660:	00812c23          	sw	s0,24(sp)
     664:	00912a23          	sw	s1,20(sp)
     668:	01212823          	sw	s2,16(sp)
     66c:	01312623          	sw	s3,12(sp)
     670:	01412423          	sw	s4,8(sp)
     674:	00112e23          	sw	ra,28(sp)
     678:	00050a13          	mv	s4,a0
     67c:	00058993          	mv	s3,a1
     680:	00060913          	mv	s2,a2
     684:	00000413          	li	s0,0
     688:	000014b7          	lui	s1,0x1
     68c:	00890633          	add	a2,s2,s0
     690:	008985b3          	add	a1,s3,s0
     694:	008a0533          	add	a0,s4,s0
     698:	40040413          	addi	s0,s0,1024
     69c:	364000ef          	jal	a00 <pqcrystals_dilithium2_ref_poly_sub>
     6a0:	fe9416e3          	bne	s0,s1,68c <pqcrystals_dilithium2_ref_polyveck_sub+0x30>
     6a4:	01c12083          	lw	ra,28(sp)
     6a8:	01812403          	lw	s0,24(sp)
     6ac:	01412483          	lw	s1,20(sp)
     6b0:	01012903          	lw	s2,16(sp)
     6b4:	00c12983          	lw	s3,12(sp)
     6b8:	00812a03          	lw	s4,8(sp)
     6bc:	02010113          	addi	sp,sp,32
     6c0:	00008067          	ret

000006c4 <pqcrystals_dilithium2_ref_polyveck_ntt>:
     6c4:	ff010113          	addi	sp,sp,-16
     6c8:	00912223          	sw	s1,4(sp)
     6cc:	000014b7          	lui	s1,0x1
     6d0:	00812423          	sw	s0,8(sp)
     6d4:	00112623          	sw	ra,12(sp)
     6d8:	00050413          	mv	s0,a0
     6dc:	009504b3          	add	s1,a0,s1
     6e0:	00040513          	mv	a0,s0
     6e4:	40040413          	addi	s0,s0,1024
     6e8:	348000ef          	jal	a30 <pqcrystals_dilithium2_ref_poly_ntt>
     6ec:	fe941ae3          	bne	s0,s1,6e0 <pqcrystals_dilithium2_ref_polyveck_ntt+0x1c>
     6f0:	00c12083          	lw	ra,12(sp)
     6f4:	00812403          	lw	s0,8(sp)
     6f8:	00412483          	lw	s1,4(sp)
     6fc:	01010113          	addi	sp,sp,16
     700:	00008067          	ret

00000704 <pqcrystals_dilithium2_ref_polyveck_invntt_tomont>:
     704:	ff010113          	addi	sp,sp,-16
     708:	00912223          	sw	s1,4(sp)
     70c:	000014b7          	lui	s1,0x1
     710:	00812423          	sw	s0,8(sp)
     714:	00112623          	sw	ra,12(sp)
     718:	00050413          	mv	s0,a0
     71c:	009504b3          	add	s1,a0,s1
     720:	00040513          	mv	a0,s0
     724:	40040413          	addi	s0,s0,1024
     728:	30c000ef          	jal	a34 <pqcrystals_dilithium2_ref_poly_invntt_tomont>
     72c:	fe941ae3          	bne	s0,s1,720 <pqcrystals_dilithium2_ref_polyveck_invntt_tomont+0x1c>
     730:	00c12083          	lw	ra,12(sp)
     734:	00812403          	lw	s0,8(sp)
     738:	00412483          	lw	s1,4(sp)
     73c:	01010113          	addi	sp,sp,16
     740:	00008067          	ret

00000744 <pqcrystals_dilithium2_ref_polyveck_pointwise_poly_montgomery>:
     744:	fe010113          	addi	sp,sp,-32
     748:	00812c23          	sw	s0,24(sp)
     74c:	00912a23          	sw	s1,20(sp)
     750:	01212823          	sw	s2,16(sp)
     754:	01312623          	sw	s3,12(sp)
     758:	01412423          	sw	s4,8(sp)
     75c:	00112e23          	sw	ra,28(sp)
     760:	00050a13          	mv	s4,a0
     764:	00058993          	mv	s3,a1
     768:	00060913          	mv	s2,a2
     76c:	00000413          	li	s0,0
     770:	000014b7          	lui	s1,0x1
     774:	00890633          	add	a2,s2,s0
     778:	008a0533          	add	a0,s4,s0
     77c:	00098593          	mv	a1,s3
     780:	40040413          	addi	s0,s0,1024
     784:	2b4000ef          	jal	a38 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery>
     788:	fe9416e3          	bne	s0,s1,774 <pqcrystals_dilithium2_ref_polyveck_pointwise_poly_montgomery+0x30>
     78c:	01c12083          	lw	ra,28(sp)
     790:	01812403          	lw	s0,24(sp)
     794:	01412483          	lw	s1,20(sp)
     798:	01012903          	lw	s2,16(sp)
     79c:	00c12983          	lw	s3,12(sp)
     7a0:	00812a03          	lw	s4,8(sp)
     7a4:	02010113          	addi	sp,sp,32
     7a8:	00008067          	ret

000007ac <pqcrystals_dilithium2_ref_polyveck_chknorm>:
     7ac:	ff010113          	addi	sp,sp,-16
     7b0:	00912223          	sw	s1,4(sp)
     7b4:	000014b7          	lui	s1,0x1
     7b8:	00812423          	sw	s0,8(sp)
     7bc:	01212023          	sw	s2,0(sp)
     7c0:	00112623          	sw	ra,12(sp)
     7c4:	00050413          	mv	s0,a0
     7c8:	00058913          	mv	s2,a1
     7cc:	009504b3          	add	s1,a0,s1
     7d0:	00040513          	mv	a0,s0
     7d4:	00090593          	mv	a1,s2
     7d8:	3d4000ef          	jal	bac <pqcrystals_dilithium2_ref_poly_chknorm>
     7dc:	40040413          	addi	s0,s0,1024
     7e0:	02051063          	bnez	a0,800 <pqcrystals_dilithium2_ref_polyveck_chknorm+0x54>
     7e4:	fe9416e3          	bne	s0,s1,7d0 <pqcrystals_dilithium2_ref_polyveck_chknorm+0x24>
     7e8:	00c12083          	lw	ra,12(sp)
     7ec:	00812403          	lw	s0,8(sp)
     7f0:	00412483          	lw	s1,4(sp)
     7f4:	00012903          	lw	s2,0(sp)
     7f8:	01010113          	addi	sp,sp,16
     7fc:	00008067          	ret
     800:	00c12083          	lw	ra,12(sp)
     804:	00812403          	lw	s0,8(sp)
     808:	00412483          	lw	s1,4(sp)
     80c:	00012903          	lw	s2,0(sp)
     810:	00100513          	li	a0,1
     814:	01010113          	addi	sp,sp,16
     818:	00008067          	ret

0000081c <pqcrystals_dilithium2_ref_polyveck_decompose>:
     81c:	fe010113          	addi	sp,sp,-32
     820:	00812c23          	sw	s0,24(sp)
     824:	00912a23          	sw	s1,20(sp)
     828:	01212823          	sw	s2,16(sp)
     82c:	01312623          	sw	s3,12(sp)
     830:	01412423          	sw	s4,8(sp)
     834:	00112e23          	sw	ra,28(sp)
     838:	00050a13          	mv	s4,a0
     83c:	00058993          	mv	s3,a1
     840:	00060913          	mv	s2,a2
     844:	00000413          	li	s0,0
     848:	000014b7          	lui	s1,0x1
     84c:	00890633          	add	a2,s2,s0
     850:	008985b3          	add	a1,s3,s0
     854:	008a0533          	add	a0,s4,s0
     858:	40040413          	addi	s0,s0,1024
     85c:	258000ef          	jal	ab4 <pqcrystals_dilithium2_ref_poly_decompose>
     860:	fe9416e3          	bne	s0,s1,84c <pqcrystals_dilithium2_ref_polyveck_decompose+0x30>
     864:	01c12083          	lw	ra,28(sp)
     868:	01812403          	lw	s0,24(sp)
     86c:	01412483          	lw	s1,20(sp)
     870:	01012903          	lw	s2,16(sp)
     874:	00c12983          	lw	s3,12(sp)
     878:	00812a03          	lw	s4,8(sp)
     87c:	02010113          	addi	sp,sp,32
     880:	00008067          	ret

00000884 <pqcrystals_dilithium2_ref_polyveck_make_hint>:
     884:	fe010113          	addi	sp,sp,-32
     888:	00812c23          	sw	s0,24(sp)
     88c:	00912a23          	sw	s1,20(sp)
     890:	01212823          	sw	s2,16(sp)
     894:	01312623          	sw	s3,12(sp)
     898:	01412423          	sw	s4,8(sp)
     89c:	01512223          	sw	s5,4(sp)
     8a0:	00112e23          	sw	ra,28(sp)
     8a4:	00050a93          	mv	s5,a0
     8a8:	00058a13          	mv	s4,a1
     8ac:	00060993          	mv	s3,a2
     8b0:	00000413          	li	s0,0
     8b4:	00000493          	li	s1,0
     8b8:	00001937          	lui	s2,0x1
     8bc:	00898633          	add	a2,s3,s0
     8c0:	008a05b3          	add	a1,s4,s0
     8c4:	008a8533          	add	a0,s5,s0
     8c8:	25c000ef          	jal	b24 <pqcrystals_dilithium2_ref_poly_make_hint>
     8cc:	40040413          	addi	s0,s0,1024
     8d0:	00a484b3          	add	s1,s1,a0
     8d4:	ff2414e3          	bne	s0,s2,8bc <pqcrystals_dilithium2_ref_polyveck_make_hint+0x38>
     8d8:	01c12083          	lw	ra,28(sp)
     8dc:	01812403          	lw	s0,24(sp)
     8e0:	01012903          	lw	s2,16(sp)
     8e4:	00c12983          	lw	s3,12(sp)
     8e8:	00812a03          	lw	s4,8(sp)
     8ec:	00412a83          	lw	s5,4(sp)
     8f0:	00048513          	mv	a0,s1
     8f4:	01412483          	lw	s1,20(sp)
     8f8:	02010113          	addi	sp,sp,32
     8fc:	00008067          	ret

00000900 <pqcrystals_dilithium2_ref_polyveck_pack_w1>:
     900:	ff010113          	addi	sp,sp,-16
     904:	00812423          	sw	s0,8(sp)
     908:	00912223          	sw	s1,4(sp)
     90c:	01212023          	sw	s2,0(sp)
     910:	00112623          	sw	ra,12(sp)
     914:	00050413          	mv	s0,a0
     918:	00058493          	mv	s1,a1
     91c:	30050913          	addi	s2,a0,768
     920:	00048593          	mv	a1,s1
     924:	00040513          	mv	a0,s0
     928:	0c040413          	addi	s0,s0,192
     92c:	235000ef          	jal	1360 <pqcrystals_dilithium2_ref_polyw1_pack>
     930:	40048493          	addi	s1,s1,1024 # 1400 <pqcrystals_dilithium2_ref_ntt+0x3c>
     934:	ff2416e3          	bne	s0,s2,920 <pqcrystals_dilithium2_ref_polyveck_pack_w1+0x20>
     938:	00c12083          	lw	ra,12(sp)
     93c:	00812403          	lw	s0,8(sp)
     940:	00412483          	lw	s1,4(sp)
     944:	00012903          	lw	s2,0(sp)
     948:	01010113          	addi	sp,sp,16
     94c:	00008067          	ret

00000950 <pqcrystals_dilithium2_ref_poly_reduce>:
     950:	ff010113          	addi	sp,sp,-16
     954:	00812423          	sw	s0,8(sp)
     958:	00912223          	sw	s1,4(sp)
     95c:	00112623          	sw	ra,12(sp)
     960:	00050413          	mv	s0,a0
     964:	40050493          	addi	s1,a0,1024
     968:	00042503          	lw	a0,0(s0)
     96c:	00440413          	addi	s0,s0,4
     970:	591000ef          	jal	1700 <pqcrystals_dilithium2_ref_reduce32>
     974:	fea42e23          	sw	a0,-4(s0)
     978:	fe9418e3          	bne	s0,s1,968 <pqcrystals_dilithium2_ref_poly_reduce+0x18>
     97c:	00c12083          	lw	ra,12(sp)
     980:	00812403          	lw	s0,8(sp)
     984:	00412483          	lw	s1,4(sp)
     988:	01010113          	addi	sp,sp,16
     98c:	00008067          	ret

00000990 <pqcrystals_dilithium2_ref_poly_caddq>:
     990:	ff010113          	addi	sp,sp,-16
     994:	00812423          	sw	s0,8(sp)
     998:	00912223          	sw	s1,4(sp)
     99c:	00112623          	sw	ra,12(sp)
     9a0:	00050413          	mv	s0,a0
     9a4:	40050493          	addi	s1,a0,1024
     9a8:	00042503          	lw	a0,0(s0)
     9ac:	00440413          	addi	s0,s0,4
     9b0:	571000ef          	jal	1720 <pqcrystals_dilithium2_ref_caddq>
     9b4:	fea42e23          	sw	a0,-4(s0)
     9b8:	fe9418e3          	bne	s0,s1,9a8 <pqcrystals_dilithium2_ref_poly_caddq+0x18>
     9bc:	00c12083          	lw	ra,12(sp)
     9c0:	00812403          	lw	s0,8(sp)
     9c4:	00412483          	lw	s1,4(sp)
     9c8:	01010113          	addi	sp,sp,16
     9cc:	00008067          	ret

000009d0 <pqcrystals_dilithium2_ref_poly_add>:
     9d0:	00000793          	li	a5,0
     9d4:	40000893          	li	a7,1024
     9d8:	00f606b3          	add	a3,a2,a5
     9dc:	00f58733          	add	a4,a1,a5
     9e0:	0006a803          	lw	a6,0(a3)
     9e4:	00072703          	lw	a4,0(a4)
     9e8:	00f506b3          	add	a3,a0,a5
     9ec:	00478793          	addi	a5,a5,4 # 1004 <pqcrystals_dilithium2_ref_polyt0_unpack+0x4>
     9f0:	01070733          	add	a4,a4,a6
     9f4:	00e6a023          	sw	a4,0(a3)
     9f8:	ff1790e3          	bne	a5,a7,9d8 <pqcrystals_dilithium2_ref_poly_add+0x8>
     9fc:	00008067          	ret

00000a00 <pqcrystals_dilithium2_ref_poly_sub>:
     a00:	00000793          	li	a5,0
     a04:	40000893          	li	a7,1024
     a08:	00f606b3          	add	a3,a2,a5
     a0c:	00f58733          	add	a4,a1,a5
     a10:	0006a803          	lw	a6,0(a3)
     a14:	00072703          	lw	a4,0(a4)
     a18:	00f506b3          	add	a3,a0,a5
     a1c:	00478793          	addi	a5,a5,4
     a20:	41070733          	sub	a4,a4,a6
     a24:	00e6a023          	sw	a4,0(a3)
     a28:	ff1790e3          	bne	a5,a7,a08 <pqcrystals_dilithium2_ref_poly_sub+0x8>
     a2c:	00008067          	ret

00000a30 <pqcrystals_dilithium2_ref_poly_ntt>:
     a30:	1950006f          	j	13c4 <pqcrystals_dilithium2_ref_ntt>

00000a34 <pqcrystals_dilithium2_ref_poly_invntt_tomont>:
     a34:	3090006f          	j	153c <pqcrystals_dilithium2_ref_invntt_tomont>

00000a38 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery>:
     a38:	fe010113          	addi	sp,sp,-32
     a3c:	00812c23          	sw	s0,24(sp)
     a40:	00912a23          	sw	s1,20(sp)
     a44:	01212823          	sw	s2,16(sp)
     a48:	01312623          	sw	s3,12(sp)
     a4c:	01412423          	sw	s4,8(sp)
     a50:	00112e23          	sw	ra,28(sp)
     a54:	00050a13          	mv	s4,a0
     a58:	00058993          	mv	s3,a1
     a5c:	00060913          	mv	s2,a2
     a60:	00000413          	li	s0,0
     a64:	40000493          	li	s1,1024
     a68:	00898733          	add	a4,s3,s0
     a6c:	008907b3          	add	a5,s2,s0
     a70:	0007a783          	lw	a5,0(a5)
     a74:	00072503          	lw	a0,0(a4)
     a78:	02f515b3          	mulh	a1,a0,a5
     a7c:	02f50533          	mul	a0,a0,a5
     a80:	41d000ef          	jal	169c <pqcrystals_dilithium2_ref_montgomery_reduce>
     a84:	008a07b3          	add	a5,s4,s0
     a88:	00a7a023          	sw	a0,0(a5)
     a8c:	00440413          	addi	s0,s0,4
     a90:	fc941ce3          	bne	s0,s1,a68 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery+0x30>
     a94:	01c12083          	lw	ra,28(sp)
     a98:	01812403          	lw	s0,24(sp)
     a9c:	01412483          	lw	s1,20(sp)
     aa0:	01012903          	lw	s2,16(sp)
     aa4:	00c12983          	lw	s3,12(sp)
     aa8:	00812a03          	lw	s4,8(sp)
     aac:	02010113          	addi	sp,sp,32
     ab0:	00008067          	ret

00000ab4 <pqcrystals_dilithium2_ref_poly_decompose>:
     ab4:	fe010113          	addi	sp,sp,-32
     ab8:	00812c23          	sw	s0,24(sp)
     abc:	00912a23          	sw	s1,20(sp)
     ac0:	01212823          	sw	s2,16(sp)
     ac4:	01312623          	sw	s3,12(sp)
     ac8:	01412423          	sw	s4,8(sp)
     acc:	00112e23          	sw	ra,28(sp)
     ad0:	00050a13          	mv	s4,a0
     ad4:	00058993          	mv	s3,a1
     ad8:	00060913          	mv	s2,a2
     adc:	00000413          	li	s0,0
     ae0:	40000493          	li	s1,1024
     ae4:	008907b3          	add	a5,s2,s0
     ae8:	0007a583          	lw	a1,0(a5)
     aec:	00898533          	add	a0,s3,s0
     af0:	394040ef          	jal	4e84 <pqcrystals_dilithium2_ref_decompose>
     af4:	008a07b3          	add	a5,s4,s0
     af8:	00a7a023          	sw	a0,0(a5)
     afc:	00440413          	addi	s0,s0,4
     b00:	fe9412e3          	bne	s0,s1,ae4 <pqcrystals_dilithium2_ref_poly_decompose+0x30>
     b04:	01c12083          	lw	ra,28(sp)
     b08:	01812403          	lw	s0,24(sp)
     b0c:	01412483          	lw	s1,20(sp)
     b10:	01012903          	lw	s2,16(sp)
     b14:	00c12983          	lw	s3,12(sp)
     b18:	00812a03          	lw	s4,8(sp)
     b1c:	02010113          	addi	sp,sp,32
     b20:	00008067          	ret

00000b24 <pqcrystals_dilithium2_ref_poly_make_hint>:
     b24:	fe010113          	addi	sp,sp,-32
     b28:	00812c23          	sw	s0,24(sp)
     b2c:	00912a23          	sw	s1,20(sp)
     b30:	01212823          	sw	s2,16(sp)
     b34:	01312623          	sw	s3,12(sp)
     b38:	01412423          	sw	s4,8(sp)
     b3c:	01512223          	sw	s5,4(sp)
     b40:	00112e23          	sw	ra,28(sp)
     b44:	00050a93          	mv	s5,a0
     b48:	00058a13          	mv	s4,a1
     b4c:	00060993          	mv	s3,a2
     b50:	00000413          	li	s0,0
     b54:	00000493          	li	s1,0
     b58:	40000913          	li	s2,1024
     b5c:	008a07b3          	add	a5,s4,s0
     b60:	00898733          	add	a4,s3,s0
     b64:	0007a503          	lw	a0,0(a5)
     b68:	00072583          	lw	a1,0(a4)
     b6c:	384040ef          	jal	4ef0 <pqcrystals_dilithium2_ref_make_hint>
     b70:	008a87b3          	add	a5,s5,s0
     b74:	00a7a023          	sw	a0,0(a5)
     b78:	00440413          	addi	s0,s0,4
     b7c:	00a484b3          	add	s1,s1,a0
     b80:	fd241ee3          	bne	s0,s2,b5c <pqcrystals_dilithium2_ref_poly_make_hint+0x38>
     b84:	01c12083          	lw	ra,28(sp)
     b88:	01812403          	lw	s0,24(sp)
     b8c:	01012903          	lw	s2,16(sp)
     b90:	00c12983          	lw	s3,12(sp)
     b94:	00812a03          	lw	s4,8(sp)
     b98:	00412a83          	lw	s5,4(sp)
     b9c:	00048513          	mv	a0,s1
     ba0:	01412483          	lw	s1,20(sp)
     ba4:	02010113          	addi	sp,sp,32
     ba8:	00008067          	ret

00000bac <pqcrystals_dilithium2_ref_poly_chknorm>:
     bac:	001007b7          	lui	a5,0x100
     bb0:	c0078793          	addi	a5,a5,-1024 # ffc00 <__stack_size+0xefc00>
     bb4:	02b7c663          	blt	a5,a1,be0 <pqcrystals_dilithium2_ref_poly_chknorm+0x34>
     bb8:	40050613          	addi	a2,a0,1024
     bbc:	0080006f          	j	bc4 <pqcrystals_dilithium2_ref_poly_chknorm+0x18>
     bc0:	02a60463          	beq	a2,a0,be8 <pqcrystals_dilithium2_ref_poly_chknorm+0x3c>
     bc4:	00052783          	lw	a5,0(a0)
     bc8:	00450513          	addi	a0,a0,4
     bcc:	00179713          	slli	a4,a5,0x1
     bd0:	41f7d693          	srai	a3,a5,0x1f
     bd4:	00d77733          	and	a4,a4,a3
     bd8:	40e787b3          	sub	a5,a5,a4
     bdc:	feb7c2e3          	blt	a5,a1,bc0 <pqcrystals_dilithium2_ref_poly_chknorm+0x14>
     be0:	00100513          	li	a0,1
     be4:	00008067          	ret
     be8:	00000513          	li	a0,0
     bec:	00008067          	ret

00000bf0 <pqcrystals_dilithium2_ref_poly_uniform>:
     bf0:	bb010113          	addi	sp,sp,-1104
     bf4:	43312e23          	sw	s3,1084(sp)
     bf8:	00050993          	mv	s3,a0
     bfc:	00010513          	mv	a0,sp
     c00:	44112623          	sw	ra,1100(sp)
     c04:	45212023          	sw	s2,1088(sp)
     c08:	43612823          	sw	s6,1072(sp)
     c0c:	324040ef          	jal	4f30 <pqcrystals_dilithium2_ref_dilithium_shake128_stream_init>
     c10:	0d410b13          	addi	s6,sp,212
     c14:	000b0513          	mv	a0,s6
     c18:	00500593          	li	a1,5
     c1c:	00010613          	mv	a2,sp
     c20:	65c030ef          	jal	427c <pqcrystals_fips202_ref_shake128_squeezeblocks>
     c24:	008005b7          	lui	a1,0x800
     c28:	41c10813          	addi	a6,sp,1052
     c2c:	000b0713          	mv	a4,s6
     c30:	fff58593          	addi	a1,a1,-1 # 7fffff <__stack_size+0x7effff>
     c34:	00000913          	li	s2,0
     c38:	007fe537          	lui	a0,0x7fe
     c3c:	10000893          	li	a7,256
     c40:	00174783          	lbu	a5,1(a4)
     c44:	00274683          	lbu	a3,2(a4)
     c48:	00074603          	lbu	a2,0(a4)
     c4c:	00879793          	slli	a5,a5,0x8
     c50:	01069693          	slli	a3,a3,0x10
     c54:	00d7e7b3          	or	a5,a5,a3
     c58:	00c7e7b3          	or	a5,a5,a2
     c5c:	00291693          	slli	a3,s2,0x2
     c60:	00b7f7b3          	and	a5,a5,a1
     c64:	00d986b3          	add	a3,s3,a3
     c68:	00370713          	addi	a4,a4,3
     c6c:	00190613          	addi	a2,s2,1 # 1001 <pqcrystals_dilithium2_ref_polyt0_unpack+0x1>
     c70:	00f56863          	bltu	a0,a5,c80 <pqcrystals_dilithium2_ref_poly_uniform+0x90>
     c74:	00f6a023          	sw	a5,0(a3)
     c78:	11160463          	beq	a2,a7,d80 <pqcrystals_dilithium2_ref_poly_uniform+0x190>
     c7c:	00060913          	mv	s2,a2
     c80:	fce810e3          	bne	a6,a4,c40 <pqcrystals_dilithium2_ref_poly_uniform+0x50>
     c84:	44812423          	sw	s0,1096(sp)
     c88:	43412c23          	sw	s4,1080(sp)
     c8c:	43512a23          	sw	s5,1076(sp)
     c90:	aaaab437          	lui	s0,0xaaaab
     c94:	00800ab7          	lui	s5,0x800
     c98:	00300a13          	li	s4,3
     c9c:	44912223          	sw	s1,1092(sp)
     ca0:	43712623          	sw	s7,1068(sp)
     ca4:	aab40413          	addi	s0,s0,-1365 # aaaaaaab <__stack_size+0xaaa9aaab>
     ca8:	fffa8a93          	addi	s5,s5,-1 # 7fffff <__stack_size+0x7effff>
     cac:	416a0a33          	sub	s4,s4,s6
     cb0:	34800513          	li	a0,840
     cb4:	00200493          	li	s1,2
     cb8:	028537b3          	mulhu	a5,a0,s0
     cbc:	0017db93          	srli	s7,a5,0x1
     cc0:	ffe7f793          	andi	a5,a5,-2
     cc4:	017787b3          	add	a5,a5,s7
     cc8:	40f50bb3          	sub	s7,a0,a5
     ccc:	02f50263          	beq	a0,a5,cf0 <pqcrystals_dilithium2_ref_poly_uniform+0x100>
     cd0:	41750533          	sub	a0,a0,s7
     cd4:	42050793          	addi	a5,a0,1056 # 7fe420 <__stack_size+0x7ee420>
     cd8:	00278533          	add	a0,a5,sp
     cdc:	cb454783          	lbu	a5,-844(a0)
     ce0:	0cf10a23          	sb	a5,212(sp)
     ce4:	009b9663          	bne	s7,s1,cf0 <pqcrystals_dilithium2_ref_poly_uniform+0x100>
     ce8:	cb554783          	lbu	a5,-843(a0)
     cec:	0cf10aa3          	sb	a5,213(sp)
     cf0:	00010613          	mv	a2,sp
     cf4:	017b0533          	add	a0,s6,s7
     cf8:	00100593          	li	a1,1
     cfc:	580030ef          	jal	427c <pqcrystals_fips202_ref_shake128_squeezeblocks>
     d00:	10000813          	li	a6,256
     d04:	0a8b8513          	addi	a0,s7,168
     d08:	41280833          	sub	a6,a6,s2
     d0c:	000b0693          	mv	a3,s6
     d10:	00000613          	li	a2,0
     d14:	007fe8b7          	lui	a7,0x7fe
     d18:	0016c783          	lbu	a5,1(a3)
     d1c:	0026c703          	lbu	a4,2(a3)
     d20:	0006c583          	lbu	a1,0(a3)
     d24:	00879793          	slli	a5,a5,0x8
     d28:	01071713          	slli	a4,a4,0x10
     d2c:	00e7e7b3          	or	a5,a5,a4
     d30:	00b7e7b3          	or	a5,a5,a1
     d34:	00c90733          	add	a4,s2,a2
     d38:	00368693          	addi	a3,a3,3
     d3c:	00271713          	slli	a4,a4,0x2
     d40:	0157f7b3          	and	a5,a5,s5
     d44:	00da05b3          	add	a1,s4,a3
     d48:	00e98733          	add	a4,s3,a4
     d4c:	00f8e663          	bltu	a7,a5,d58 <pqcrystals_dilithium2_ref_poly_uniform+0x168>
     d50:	00160613          	addi	a2,a2,1
     d54:	00f72023          	sw	a5,0(a4)
     d58:	01067463          	bgeu	a2,a6,d60 <pqcrystals_dilithium2_ref_poly_uniform+0x170>
     d5c:	fab57ee3          	bgeu	a0,a1,d18 <pqcrystals_dilithium2_ref_poly_uniform+0x128>
     d60:	00c90933          	add	s2,s2,a2
     d64:	0ff00793          	li	a5,255
     d68:	f527f8e3          	bgeu	a5,s2,cb8 <pqcrystals_dilithium2_ref_poly_uniform+0xc8>
     d6c:	44812403          	lw	s0,1096(sp)
     d70:	44412483          	lw	s1,1092(sp)
     d74:	43812a03          	lw	s4,1080(sp)
     d78:	43412a83          	lw	s5,1076(sp)
     d7c:	42c12b83          	lw	s7,1068(sp)
     d80:	44c12083          	lw	ra,1100(sp)
     d84:	44012903          	lw	s2,1088(sp)
     d88:	43c12983          	lw	s3,1084(sp)
     d8c:	43012b03          	lw	s6,1072(sp)
     d90:	45010113          	addi	sp,sp,1104
     d94:	00008067          	ret

00000d98 <pqcrystals_dilithium2_ref_poly_challenge>:
     d98:	e7010113          	addi	sp,sp,-400
     d9c:	17412c23          	sw	s4,376(sp)
     da0:	00050a13          	mv	s4,a0
     da4:	09010513          	addi	a0,sp,144
     da8:	18112623          	sw	ra,396(sp)
     dac:	18812423          	sw	s0,392(sp)
     db0:	18912223          	sw	s1,388(sp)
     db4:	00058413          	mv	s0,a1
     db8:	19212023          	sw	s2,384(sp)
     dbc:	17312e23          	sw	s3,380(sp)
     dc0:	17512a23          	sw	s5,372(sp)
     dc4:	17612823          	sw	s6,368(sp)
     dc8:	17712623          	sw	s7,364(sp)
     dcc:	57c030ef          	jal	4348 <pqcrystals_fips202_ref_shake256_init>
     dd0:	00040593          	mv	a1,s0
     dd4:	02000613          	li	a2,32
     dd8:	09010513          	addi	a0,sp,144
     ddc:	590030ef          	jal	436c <pqcrystals_fips202_ref_shake256_absorb>
     de0:	09010513          	addi	a0,sp,144
     de4:	5c0030ef          	jal	43a4 <pqcrystals_fips202_ref_shake256_finalize>
     de8:	00810513          	addi	a0,sp,8
     dec:	09010613          	addi	a2,sp,144
     df0:	00100593          	li	a1,1
     df4:	620030ef          	jal	4414 <pqcrystals_fips202_ref_shake256_squeezeblocks>
     df8:	00a14783          	lbu	a5,10(sp)
     dfc:	00914603          	lbu	a2,9(sp)
     e00:	00d14683          	lbu	a3,13(sp)
     e04:	00c14503          	lbu	a0,12(sp)
     e08:	00e14703          	lbu	a4,14(sp)
     e0c:	00814583          	lbu	a1,8(sp)
     e10:	00b14483          	lbu	s1,11(sp)
     e14:	00f14903          	lbu	s2,15(sp)
     e18:	00861613          	slli	a2,a2,0x8
     e1c:	01079793          	slli	a5,a5,0x10
     e20:	00869693          	slli	a3,a3,0x8
     e24:	00a6e6b3          	or	a3,a3,a0
     e28:	00c7e7b3          	or	a5,a5,a2
     e2c:	01071713          	slli	a4,a4,0x10
     e30:	00b7e7b3          	or	a5,a5,a1
     e34:	00d76733          	or	a4,a4,a3
     e38:	01849493          	slli	s1,s1,0x18
     e3c:	01891913          	slli	s2,s2,0x18
     e40:	000a0513          	mv	a0,s4
     e44:	40000613          	li	a2,1024
     e48:	00000593          	li	a1,0
     e4c:	00f4e4b3          	or	s1,s1,a5
     e50:	00e96933          	or	s2,s2,a4
     e54:	270040ef          	jal	50c4 <memset>
     e58:	364a0993          	addi	s3,s4,868
     e5c:	00800793          	li	a5,8
     e60:	0d900413          	li	s0,217
     e64:	08800b93          	li	s7,136
     e68:	00100b13          	li	s6,1
     e6c:	10000a93          	li	s5,256
     e70:	07778e63          	beq	a5,s7,eec <pqcrystals_dilithium2_ref_poly_challenge+0x154>
     e74:	00278733          	add	a4,a5,sp
     e78:	00874703          	lbu	a4,8(a4)
     e7c:	00178793          	addi	a5,a5,1
     e80:	fee468e3          	bltu	s0,a4,e70 <pqcrystals_dilithium2_ref_poly_challenge+0xd8>
     e84:	00271713          	slli	a4,a4,0x2
     e88:	00ea0733          	add	a4,s4,a4
     e8c:	00072603          	lw	a2,0(a4)
     e90:	0014f693          	andi	a3,s1,1
     e94:	00169693          	slli	a3,a3,0x1
     e98:	00c9a023          	sw	a2,0(s3)
     e9c:	40db06b3          	sub	a3,s6,a3
     ea0:	00d72023          	sw	a3,0(a4)
     ea4:	0014d493          	srli	s1,s1,0x1
     ea8:	01f91713          	slli	a4,s2,0x1f
     eac:	00140413          	addi	s0,s0,1
     eb0:	00498993          	addi	s3,s3,4
     eb4:	009704b3          	add	s1,a4,s1
     eb8:	00195913          	srli	s2,s2,0x1
     ebc:	fb541ae3          	bne	s0,s5,e70 <pqcrystals_dilithium2_ref_poly_challenge+0xd8>
     ec0:	18c12083          	lw	ra,396(sp)
     ec4:	18812403          	lw	s0,392(sp)
     ec8:	18412483          	lw	s1,388(sp)
     ecc:	18012903          	lw	s2,384(sp)
     ed0:	17c12983          	lw	s3,380(sp)
     ed4:	17812a03          	lw	s4,376(sp)
     ed8:	17412a83          	lw	s5,372(sp)
     edc:	17012b03          	lw	s6,368(sp)
     ee0:	16c12b83          	lw	s7,364(sp)
     ee4:	19010113          	addi	sp,sp,400
     ee8:	00008067          	ret
     eec:	09010613          	addi	a2,sp,144
     ef0:	00100593          	li	a1,1
     ef4:	00810513          	addi	a0,sp,8
     ef8:	51c030ef          	jal	4414 <pqcrystals_fips202_ref_shake256_squeezeblocks>
     efc:	00814703          	lbu	a4,8(sp)
     f00:	00200793          	li	a5,2
     f04:	00e47863          	bgeu	s0,a4,f14 <pqcrystals_dilithium2_ref_poly_challenge+0x17c>
     f08:	00914703          	lbu	a4,9(sp)
     f0c:	f6e464e3          	bltu	s0,a4,e74 <pqcrystals_dilithium2_ref_poly_challenge+0xdc>
     f10:	f75ff06f          	j	e84 <pqcrystals_dilithium2_ref_poly_challenge+0xec>
     f14:	00100793          	li	a5,1
     f18:	f6dff06f          	j	e84 <pqcrystals_dilithium2_ref_poly_challenge+0xec>

00000f1c <pqcrystals_dilithium2_ref_polyeta_unpack>:
     f1c:	40050e93          	addi	t4,a0,1024
     f20:	00200313          	li	t1,2
     f24:	0005ce03          	lbu	t3,0(a1)
     f28:	02050513          	addi	a0,a0,32
     f2c:	00358593          	addi	a1,a1,3
     f30:	007e7e13          	andi	t3,t3,7
     f34:	ffc52023          	sw	t3,-32(a0)
     f38:	ffd5c883          	lbu	a7,-3(a1)
     f3c:	41c30e33          	sub	t3,t1,t3
     f40:	0038d893          	srli	a7,a7,0x3
     f44:	0078f893          	andi	a7,a7,7
     f48:	ff152223          	sw	a7,-28(a0)
     f4c:	ffd5c703          	lbu	a4,-3(a1)
     f50:	ffe5c783          	lbu	a5,-2(a1)
     f54:	411308b3          	sub	a7,t1,a7
     f58:	00675713          	srli	a4,a4,0x6
     f5c:	00279793          	slli	a5,a5,0x2
     f60:	00f76733          	or	a4,a4,a5
     f64:	00777713          	andi	a4,a4,7
     f68:	fee52423          	sw	a4,-24(a0)
     f6c:	ffe5c783          	lbu	a5,-2(a1)
     f70:	40e30833          	sub	a6,t1,a4
     f74:	0017d793          	srli	a5,a5,0x1
     f78:	0077f793          	andi	a5,a5,7
     f7c:	fef52623          	sw	a5,-20(a0)
     f80:	ffe5c683          	lbu	a3,-2(a1)
     f84:	40f30733          	sub	a4,t1,a5
     f88:	0046d693          	srli	a3,a3,0x4
     f8c:	0076f693          	andi	a3,a3,7
     f90:	fed52823          	sw	a3,-16(a0)
     f94:	ffe5c783          	lbu	a5,-2(a1)
     f98:	fff5c603          	lbu	a2,-1(a1)
     f9c:	40d306b3          	sub	a3,t1,a3
     fa0:	0077d793          	srli	a5,a5,0x7
     fa4:	00161613          	slli	a2,a2,0x1
     fa8:	00c7e7b3          	or	a5,a5,a2
     fac:	0077f793          	andi	a5,a5,7
     fb0:	fef52a23          	sw	a5,-12(a0)
     fb4:	fff5c603          	lbu	a2,-1(a1)
     fb8:	40f307b3          	sub	a5,t1,a5
     fbc:	00265613          	srli	a2,a2,0x2
     fc0:	00767613          	andi	a2,a2,7
     fc4:	fec52c23          	sw	a2,-8(a0)
     fc8:	fff5cf03          	lbu	t5,-1(a1)
     fcc:	ffc52023          	sw	t3,-32(a0)
     fd0:	40c30633          	sub	a2,t1,a2
     fd4:	005f5e13          	srli	t3,t5,0x5
     fd8:	41c30e33          	sub	t3,t1,t3
     fdc:	ffc52e23          	sw	t3,-4(a0)
     fe0:	fec52c23          	sw	a2,-8(a0)
     fe4:	fef52a23          	sw	a5,-12(a0)
     fe8:	fed52823          	sw	a3,-16(a0)
     fec:	fee52623          	sw	a4,-20(a0)
     ff0:	ff052423          	sw	a6,-24(a0)
     ff4:	ff152223          	sw	a7,-28(a0)
     ff8:	f3d516e3          	bne	a0,t4,f24 <pqcrystals_dilithium2_ref_polyeta_unpack+0x8>
     ffc:	00008067          	ret

00001000 <pqcrystals_dilithium2_ref_polyt0_unpack>:
    1000:	00002eb7          	lui	t4,0x2
    1004:	1a058f13          	addi	t5,a1,416
    1008:	fffe8e93          	addi	t4,t4,-1 # 1fff <KeccakF1600_StatePermute+0x8c7>
    100c:	00001e37          	lui	t3,0x1
    1010:	0005c783          	lbu	a5,0(a1)
    1014:	00d58593          	addi	a1,a1,13
    1018:	02050513          	addi	a0,a0,32
    101c:	fef52023          	sw	a5,-32(a0)
    1020:	ff45c303          	lbu	t1,-12(a1)
    1024:	00831313          	slli	t1,t1,0x8
    1028:	00f36333          	or	t1,t1,a5
    102c:	01d37333          	and	t1,t1,t4
    1030:	fe652023          	sw	t1,-32(a0)
    1034:	ff45c783          	lbu	a5,-12(a1)
    1038:	406e0333          	sub	t1,t3,t1
    103c:	0057d793          	srli	a5,a5,0x5
    1040:	fef52223          	sw	a5,-28(a0)
    1044:	ff55c703          	lbu	a4,-11(a1)
    1048:	00371713          	slli	a4,a4,0x3
    104c:	00f76733          	or	a4,a4,a5
    1050:	fee52223          	sw	a4,-28(a0)
    1054:	ff65c783          	lbu	a5,-10(a1)
    1058:	00b79793          	slli	a5,a5,0xb
    105c:	00e7e7b3          	or	a5,a5,a4
    1060:	01d7f7b3          	and	a5,a5,t4
    1064:	fef52223          	sw	a5,-28(a0)
    1068:	ff65c683          	lbu	a3,-10(a1)
    106c:	40fe07b3          	sub	a5,t3,a5
    1070:	0026d693          	srli	a3,a3,0x2
    1074:	fed52423          	sw	a3,-24(a0)
    1078:	ff75c703          	lbu	a4,-9(a1)
    107c:	00671713          	slli	a4,a4,0x6
    1080:	00d76733          	or	a4,a4,a3
    1084:	01d77733          	and	a4,a4,t4
    1088:	fee52423          	sw	a4,-24(a0)
    108c:	ff75c683          	lbu	a3,-9(a1)
    1090:	40ee0733          	sub	a4,t3,a4
    1094:	0076d693          	srli	a3,a3,0x7
    1098:	fed52623          	sw	a3,-20(a0)
    109c:	ff85c603          	lbu	a2,-8(a1)
    10a0:	00161613          	slli	a2,a2,0x1
    10a4:	00d66633          	or	a2,a2,a3
    10a8:	fec52623          	sw	a2,-20(a0)
    10ac:	ff95c683          	lbu	a3,-7(a1)
    10b0:	00969693          	slli	a3,a3,0x9
    10b4:	00c6e6b3          	or	a3,a3,a2
    10b8:	01d6f6b3          	and	a3,a3,t4
    10bc:	fed52623          	sw	a3,-20(a0)
    10c0:	ff95c603          	lbu	a2,-7(a1)
    10c4:	40de08b3          	sub	a7,t3,a3
    10c8:	00465693          	srli	a3,a2,0x4
    10cc:	fed52823          	sw	a3,-16(a0)
    10d0:	ffa5c603          	lbu	a2,-6(a1)
    10d4:	00461613          	slli	a2,a2,0x4
    10d8:	00d66633          	or	a2,a2,a3
    10dc:	fec52823          	sw	a2,-16(a0)
    10e0:	ffb5c683          	lbu	a3,-5(a1)
    10e4:	00c69693          	slli	a3,a3,0xc
    10e8:	00c6e6b3          	or	a3,a3,a2
    10ec:	01d6f6b3          	and	a3,a3,t4
    10f0:	fed52823          	sw	a3,-16(a0)
    10f4:	ffb5c603          	lbu	a2,-5(a1)
    10f8:	40de0833          	sub	a6,t3,a3
    10fc:	00165613          	srli	a2,a2,0x1
    1100:	fec52a23          	sw	a2,-12(a0)
    1104:	ffc5c683          	lbu	a3,-4(a1)
    1108:	00769693          	slli	a3,a3,0x7
    110c:	00c6e6b3          	or	a3,a3,a2
    1110:	01d6f6b3          	and	a3,a3,t4
    1114:	fed52a23          	sw	a3,-12(a0)
    1118:	ffc5c603          	lbu	a2,-4(a1)
    111c:	40de06b3          	sub	a3,t3,a3
    1120:	00665613          	srli	a2,a2,0x6
    1124:	fec52c23          	sw	a2,-8(a0)
    1128:	ffd5cf83          	lbu	t6,-3(a1)
    112c:	002f9f93          	slli	t6,t6,0x2
    1130:	00cfefb3          	or	t6,t6,a2
    1134:	fff52c23          	sw	t6,-8(a0)
    1138:	ffe5c603          	lbu	a2,-2(a1)
    113c:	00a61613          	slli	a2,a2,0xa
    1140:	01f66633          	or	a2,a2,t6
    1144:	01d67633          	and	a2,a2,t4
    1148:	fec52c23          	sw	a2,-8(a0)
    114c:	ffe5c283          	lbu	t0,-2(a1)
    1150:	40ce0633          	sub	a2,t3,a2
    1154:	0032d293          	srli	t0,t0,0x3
    1158:	fe552e23          	sw	t0,-4(a0)
    115c:	fff5cf83          	lbu	t6,-1(a1)
    1160:	fec52c23          	sw	a2,-8(a0)
    1164:	fe652023          	sw	t1,-32(a0)
    1168:	005f9613          	slli	a2,t6,0x5
    116c:	00566633          	or	a2,a2,t0
    1170:	40ce0633          	sub	a2,t3,a2
    1174:	fec52e23          	sw	a2,-4(a0)
    1178:	fed52a23          	sw	a3,-12(a0)
    117c:	ff052823          	sw	a6,-16(a0)
    1180:	ff152623          	sw	a7,-20(a0)
    1184:	fee52423          	sw	a4,-24(a0)
    1188:	fef52223          	sw	a5,-28(a0)
    118c:	e8bf12e3          	bne	t5,a1,1010 <pqcrystals_dilithium2_ref_polyt0_unpack+0x10>
    1190:	00008067          	ret

00001194 <pqcrystals_dilithium2_ref_polyz_pack>:
    1194:	24050293          	addi	t0,a0,576
    1198:	00020837          	lui	a6,0x20
    119c:	0005a603          	lw	a2,0(a1)
    11a0:	0045a683          	lw	a3,4(a1)
    11a4:	0085a703          	lw	a4,8(a1)
    11a8:	00c5a783          	lw	a5,12(a1)
    11ac:	40c80633          	sub	a2,a6,a2
    11b0:	40d806b3          	sub	a3,a6,a3
    11b4:	40e80733          	sub	a4,a6,a4
    11b8:	40f807b3          	sub	a5,a6,a5
    11bc:	00269f13          	slli	t5,a3,0x2
    11c0:	00679e93          	slli	t4,a5,0x6
    11c4:	00e6d313          	srli	t1,a3,0xe
    11c8:	00471f93          	slli	t6,a4,0x4
    11cc:	00c75893          	srli	a7,a4,0xc
    11d0:	01065e13          	srli	t3,a2,0x10
    11d4:	01ee6e33          	or	t3,t3,t5
    11d8:	01d8e8b3          	or	a7,a7,t4
    11dc:	00865f13          	srli	t5,a2,0x8
    11e0:	0027de93          	srli	t4,a5,0x2
    11e4:	0066d693          	srli	a3,a3,0x6
    11e8:	01f36333          	or	t1,t1,t6
    11ec:	00475713          	srli	a4,a4,0x4
    11f0:	00a7d793          	srli	a5,a5,0xa
    11f4:	01c50123          	sb	t3,2(a0)
    11f8:	00c50023          	sb	a2,0(a0)
    11fc:	01e500a3          	sb	t5,1(a0)
    1200:	00d501a3          	sb	a3,3(a0)
    1204:	00650223          	sb	t1,4(a0)
    1208:	00e502a3          	sb	a4,5(a0)
    120c:	01150323          	sb	a7,6(a0)
    1210:	01d503a3          	sb	t4,7(a0)
    1214:	00f50423          	sb	a5,8(a0)
    1218:	00950513          	addi	a0,a0,9
    121c:	01058593          	addi	a1,a1,16
    1220:	f6a29ee3          	bne	t0,a0,119c <pqcrystals_dilithium2_ref_polyz_pack+0x8>
    1224:	00008067          	ret

00001228 <pqcrystals_dilithium2_ref_polyz_unpack>:
    1228:	00040337          	lui	t1,0x40
    122c:	24058e13          	addi	t3,a1,576
    1230:	fff30313          	addi	t1,t1,-1 # 3ffff <__stack_size+0x2ffff>
    1234:	000208b7          	lui	a7,0x20
    1238:	0005c783          	lbu	a5,0(a1)
    123c:	00958593          	addi	a1,a1,9
    1240:	01050513          	addi	a0,a0,16
    1244:	fef52823          	sw	a5,-16(a0)
    1248:	ff85c703          	lbu	a4,-8(a1)
    124c:	00871713          	slli	a4,a4,0x8
    1250:	00f76733          	or	a4,a4,a5
    1254:	fee52823          	sw	a4,-16(a0)
    1258:	ff95c783          	lbu	a5,-7(a1)
    125c:	01079793          	slli	a5,a5,0x10
    1260:	00e7e7b3          	or	a5,a5,a4
    1264:	0067f7b3          	and	a5,a5,t1
    1268:	fef52823          	sw	a5,-16(a0)
    126c:	ff95c703          	lbu	a4,-7(a1)
    1270:	40f886b3          	sub	a3,a7,a5
    1274:	00275793          	srli	a5,a4,0x2
    1278:	fef52a23          	sw	a5,-12(a0)
    127c:	ffa5c703          	lbu	a4,-6(a1)
    1280:	00671713          	slli	a4,a4,0x6
    1284:	00f76733          	or	a4,a4,a5
    1288:	fee52a23          	sw	a4,-12(a0)
    128c:	ffb5c783          	lbu	a5,-5(a1)
    1290:	00e79793          	slli	a5,a5,0xe
    1294:	00e7e7b3          	or	a5,a5,a4
    1298:	0067f7b3          	and	a5,a5,t1
    129c:	fef52a23          	sw	a5,-12(a0)
    12a0:	ffb5c703          	lbu	a4,-5(a1)
    12a4:	40f887b3          	sub	a5,a7,a5
    12a8:	00475713          	srli	a4,a4,0x4
    12ac:	fee52c23          	sw	a4,-8(a0)
    12b0:	ffc5c603          	lbu	a2,-4(a1)
    12b4:	00461613          	slli	a2,a2,0x4
    12b8:	00e66633          	or	a2,a2,a4
    12bc:	fec52c23          	sw	a2,-8(a0)
    12c0:	ffd5c703          	lbu	a4,-3(a1)
    12c4:	00c71713          	slli	a4,a4,0xc
    12c8:	00c76733          	or	a4,a4,a2
    12cc:	00677733          	and	a4,a4,t1
    12d0:	fee52c23          	sw	a4,-8(a0)
    12d4:	ffd5c603          	lbu	a2,-3(a1)
    12d8:	40e88733          	sub	a4,a7,a4
    12dc:	00665613          	srli	a2,a2,0x6
    12e0:	fec52e23          	sw	a2,-4(a0)
    12e4:	ffe5c803          	lbu	a6,-2(a1)
    12e8:	00281813          	slli	a6,a6,0x2
    12ec:	00c86833          	or	a6,a6,a2
    12f0:	ff052e23          	sw	a6,-4(a0)
    12f4:	fff5c603          	lbu	a2,-1(a1)
    12f8:	fee52c23          	sw	a4,-8(a0)
    12fc:	fed52823          	sw	a3,-16(a0)
    1300:	00a61713          	slli	a4,a2,0xa
    1304:	01076733          	or	a4,a4,a6
    1308:	40e88733          	sub	a4,a7,a4
    130c:	fee52e23          	sw	a4,-4(a0)
    1310:	fef52a23          	sw	a5,-12(a0)
    1314:	f3c592e3          	bne	a1,t3,1238 <pqcrystals_dilithium2_ref_polyz_unpack+0x10>
    1318:	00008067          	ret

0000131c <pqcrystals_dilithium2_ref_poly_uniform_gamma1>:
    131c:	c7010113          	addi	sp,sp,-912
    1320:	38812423          	sw	s0,904(sp)
    1324:	00050413          	mv	s0,a0
    1328:	00810513          	addi	a0,sp,8
    132c:	38112623          	sw	ra,908(sp)
    1330:	455030ef          	jal	4f84 <pqcrystals_dilithium2_ref_dilithium_shake256_stream_init>
    1334:	00810613          	addi	a2,sp,8
    1338:	0d810513          	addi	a0,sp,216
    133c:	00500593          	li	a1,5
    1340:	0d4030ef          	jal	4414 <pqcrystals_fips202_ref_shake256_squeezeblocks>
    1344:	0d810593          	addi	a1,sp,216
    1348:	00040513          	mv	a0,s0
    134c:	eddff0ef          	jal	1228 <pqcrystals_dilithium2_ref_polyz_unpack>
    1350:	38c12083          	lw	ra,908(sp)
    1354:	38812403          	lw	s0,904(sp)
    1358:	39010113          	addi	sp,sp,912
    135c:	00008067          	ret

00001360 <pqcrystals_dilithium2_ref_polyw1_pack>:
    1360:	0c050693          	addi	a3,a0,192
    1364:	0005a783          	lw	a5,0(a1)
    1368:	00350513          	addi	a0,a0,3
    136c:	01058593          	addi	a1,a1,16
    1370:	fef50ea3          	sb	a5,-3(a0)
    1374:	ff45a703          	lw	a4,-12(a1)
    1378:	00671713          	slli	a4,a4,0x6
    137c:	00e7e7b3          	or	a5,a5,a4
    1380:	fef50ea3          	sb	a5,-3(a0)
    1384:	ff45a783          	lw	a5,-12(a1)
    1388:	4027d793          	srai	a5,a5,0x2
    138c:	fef50f23          	sb	a5,-2(a0)
    1390:	ff85a703          	lw	a4,-8(a1)
    1394:	00471713          	slli	a4,a4,0x4
    1398:	00e7e7b3          	or	a5,a5,a4
    139c:	fef50f23          	sb	a5,-2(a0)
    13a0:	ff85a783          	lw	a5,-8(a1)
    13a4:	4047d793          	srai	a5,a5,0x4
    13a8:	fef50fa3          	sb	a5,-1(a0)
    13ac:	ffc5a703          	lw	a4,-4(a1)
    13b0:	00271713          	slli	a4,a4,0x2
    13b4:	00e7e7b3          	or	a5,a5,a4
    13b8:	fef50fa3          	sb	a5,-1(a0)
    13bc:	fad514e3          	bne	a0,a3,1364 <pqcrystals_dilithium2_ref_polyw1_pack+0x4>
    13c0:	00008067          	ret

000013c4 <pqcrystals_dilithium2_ref_ntt>:
    13c4:	000057b7          	lui	a5,0x5
    13c8:	fb010113          	addi	sp,sp,-80
    13cc:	2d878793          	addi	a5,a5,728 # 52d8 <zetas>
    13d0:	00005737          	lui	a4,0x5
    13d4:	00f12623          	sw	a5,12(sp)
    13d8:	2e070793          	addi	a5,a4,736 # 52e0 <zetas+0x8>
    13dc:	01b12e23          	sw	s11,28(sp)
    13e0:	00f12423          	sw	a5,8(sp)
    13e4:	00006db7          	lui	s11,0x6
    13e8:	00800793          	li	a5,8
    13ec:	03312e23          	sw	s3,60(sp)
    13f0:	03412c23          	sw	s4,56(sp)
    13f4:	03612823          	sw	s6,48(sp)
    13f8:	04112623          	sw	ra,76(sp)
    13fc:	04812423          	sw	s0,72(sp)
    1400:	04912223          	sw	s1,68(sp)
    1404:	05212023          	sw	s2,64(sp)
    1408:	03512a23          	sw	s5,52(sp)
    140c:	03712623          	sw	s7,44(sp)
    1410:	03812423          	sw	s8,40(sp)
    1414:	03912223          	sw	s9,36(sp)
    1418:	03a12023          	sw	s10,32(sp)
    141c:	00050a13          	mv	s4,a0
    1420:	4f7d8d93          	addi	s11,s11,1271 # 64f7 <sk+0x4f7>
    1424:	00f12223          	sw	a5,4(sp)
    1428:	00000993          	li	s3,0
    142c:	08000b13          	li	s6,128
    1430:	00812783          	lw	a5,8(sp)
    1434:	00299913          	slli	s2,s3,0x2
    1438:	00000493          	li	s1,0
    143c:	01278933          	add	s2,a5,s2
    1440:	fffb0793          	addi	a5,s6,-1 # 5fff <KeccakF_RoundConstants+0x927>
    1444:	001b0b93          	addi	s7,s6,1
    1448:	00f12023          	sw	a5,0(sp)
    144c:	009b0433          	add	s0,s6,s1
    1450:	00241713          	slli	a4,s0,0x2
    1454:	00249793          	slli	a5,s1,0x2
    1458:	00ea0c33          	add	s8,s4,a4
    145c:	00fa0cb3          	add	s9,s4,a5
    1460:	00198a93          	addi	s5,s3,1
    1464:	00048d13          	mv	s10,s1
    1468:	000c2503          	lw	a0,0(s8)
    146c:	001d0d13          	addi	s10,s10,1
    1470:	004c0c13          	addi	s8,s8,4
    1474:	02ad95b3          	mulh	a1,s11,a0
    1478:	004c8c93          	addi	s9,s9,4
    147c:	02ad8533          	mul	a0,s11,a0
    1480:	21c000ef          	jal	169c <pqcrystals_dilithium2_ref_montgomery_reduce>
    1484:	ffcca683          	lw	a3,-4(s9)
    1488:	40a686b3          	sub	a3,a3,a0
    148c:	fedc2e23          	sw	a3,-4(s8)
    1490:	ffcca683          	lw	a3,-4(s9)
    1494:	00a686b3          	add	a3,a3,a0
    1498:	fedcae23          	sw	a3,-4(s9)
    149c:	fc8d66e3          	bltu	s10,s0,1468 <pqcrystals_dilithium2_ref_ntt+0xa4>
    14a0:	00148793          	addi	a5,s1,1
    14a4:	00000713          	li	a4,0
    14a8:	00f46463          	bltu	s0,a5,14b0 <pqcrystals_dilithium2_ref_ntt+0xec>
    14ac:	00012703          	lw	a4,0(sp)
    14b0:	009b84b3          	add	s1,s7,s1
    14b4:	009704b3          	add	s1,a4,s1
    14b8:	0ff00793          	li	a5,255
    14bc:	0097ea63          	bltu	a5,s1,14d0 <pqcrystals_dilithium2_ref_ntt+0x10c>
    14c0:	00092d83          	lw	s11,0(s2)
    14c4:	000a8993          	mv	s3,s5
    14c8:	00490913          	addi	s2,s2,4
    14cc:	f81ff06f          	j	144c <pqcrystals_dilithium2_ref_ntt+0x88>
    14d0:	00412783          	lw	a5,4(sp)
    14d4:	fff78793          	addi	a5,a5,-1
    14d8:	00f12223          	sw	a5,4(sp)
    14dc:	02078263          	beqz	a5,1500 <pqcrystals_dilithium2_ref_ntt+0x13c>
    14e0:	00c12703          	lw	a4,12(sp)
    14e4:	00298793          	addi	a5,s3,2
    14e8:	00279793          	slli	a5,a5,0x2
    14ec:	00f707b3          	add	a5,a4,a5
    14f0:	0007ad83          	lw	s11,0(a5)
    14f4:	001b5b13          	srli	s6,s6,0x1
    14f8:	000a8993          	mv	s3,s5
    14fc:	f35ff06f          	j	1430 <pqcrystals_dilithium2_ref_ntt+0x6c>
    1500:	04c12083          	lw	ra,76(sp)
    1504:	04812403          	lw	s0,72(sp)
    1508:	04412483          	lw	s1,68(sp)
    150c:	04012903          	lw	s2,64(sp)
    1510:	03c12983          	lw	s3,60(sp)
    1514:	03812a03          	lw	s4,56(sp)
    1518:	03412a83          	lw	s5,52(sp)
    151c:	03012b03          	lw	s6,48(sp)
    1520:	02c12b83          	lw	s7,44(sp)
    1524:	02812c03          	lw	s8,40(sp)
    1528:	02412c83          	lw	s9,36(sp)
    152c:	02012d03          	lw	s10,32(sp)
    1530:	01c12d83          	lw	s11,28(sp)
    1534:	05010113          	addi	sp,sp,80
    1538:	00008067          	ret

0000153c <pqcrystals_dilithium2_ref_invntt_tomont>:
    153c:	fb010113          	addi	sp,sp,-80
    1540:	03912223          	sw	s9,36(sp)
    1544:	00005cb7          	lui	s9,0x5
    1548:	2d4c8793          	addi	a5,s9,724 # 52d4 <memcpy+0x134>
    154c:	05212023          	sw	s2,64(sp)
    1550:	03512a23          	sw	s5,52(sp)
    1554:	03612823          	sw	s6,48(sp)
    1558:	03712623          	sw	s7,44(sp)
    155c:	03812423          	sw	s8,40(sp)
    1560:	04112623          	sw	ra,76(sp)
    1564:	04812423          	sw	s0,72(sp)
    1568:	04912223          	sw	s1,68(sp)
    156c:	03312e23          	sw	s3,60(sp)
    1570:	03412c23          	sw	s4,56(sp)
    1574:	03a12023          	sw	s10,32(sp)
    1578:	01b12e23          	sw	s11,28(sp)
    157c:	00050913          	mv	s2,a0
    1580:	00f12623          	sw	a5,12(sp)
    1584:	00800c13          	li	s8,8
    1588:	10000b13          	li	s6,256
    158c:	00100a93          	li	s5,1
    1590:	0ff00b93          	li	s7,255
    1594:	00c12783          	lw	a5,12(sp)
    1598:	002b1a13          	slli	s4,s6,0x2
    159c:	00000d93          	li	s11,0
    15a0:	01478a33          	add	s4,a5,s4
    15a4:	015d89b3          	add	s3,s11,s5
    15a8:	fffb0b13          	addi	s6,s6,-1
    15ac:	073dfa63          	bgeu	s11,s3,1620 <pqcrystals_dilithium2_ref_invntt_tomont+0xe4>
    15b0:	000a2703          	lw	a4,0(s4)
    15b4:	00299413          	slli	s0,s3,0x2
    15b8:	002d9d93          	slli	s11,s11,0x2
    15bc:	00890433          	add	s0,s2,s0
    15c0:	01b90db3          	add	s11,s2,s11
    15c4:	00040d13          	mv	s10,s0
    15c8:	40e00cb3          	neg	s9,a4
    15cc:	00090493          	mv	s1,s2
    15d0:	000da503          	lw	a0,0(s11)
    15d4:	000d2783          	lw	a5,0(s10)
    15d8:	004d8d93          	addi	s11,s11,4
    15dc:	004d0d13          	addi	s10,s10,4
    15e0:	00a787b3          	add	a5,a5,a0
    15e4:	fefdae23          	sw	a5,-4(s11)
    15e8:	ffcd2783          	lw	a5,-4(s10)
    15ec:	40f50533          	sub	a0,a0,a5
    15f0:	fead2e23          	sw	a0,-4(s10)
    15f4:	039515b3          	mulh	a1,a0,s9
    15f8:	03950533          	mul	a0,a0,s9
    15fc:	0a0000ef          	jal	169c <pqcrystals_dilithium2_ref_montgomery_reduce>
    1600:	fead2e23          	sw	a0,-4(s10)
    1604:	fdb416e3          	bne	s0,s11,15d0 <pqcrystals_dilithium2_ref_invntt_tomont+0x94>
    1608:	01598db3          	add	s11,s3,s5
    160c:	03bbe063          	bltu	s7,s11,162c <pqcrystals_dilithium2_ref_invntt_tomont+0xf0>
    1610:	015d89b3          	add	s3,s11,s5
    1614:	ffca0a13          	addi	s4,s4,-4
    1618:	fffb0b13          	addi	s6,s6,-1
    161c:	f93deae3          	bltu	s11,s3,15b0 <pqcrystals_dilithium2_ref_invntt_tomont+0x74>
    1620:	ffca0a13          	addi	s4,s4,-4
    1624:	00098d93          	mv	s11,s3
    1628:	f7dff06f          	j	15a4 <pqcrystals_dilithium2_ref_invntt_tomont+0x68>
    162c:	fffc0c13          	addi	s8,s8,-1
    1630:	001a9a93          	slli	s5,s5,0x1
    1634:	f60c10e3          	bnez	s8,1594 <pqcrystals_dilithium2_ref_invntt_tomont+0x58>
    1638:	0000a437          	lui	s0,0xa
    163c:	40090913          	addi	s2,s2,1024
    1640:	3fa40413          	addi	s0,s0,1018 # a3fa <__stack_top+0x2bfe>
    1644:	0004a503          	lw	a0,0(s1)
    1648:	00448493          	addi	s1,s1,4
    164c:	028515b3          	mulh	a1,a0,s0
    1650:	02850533          	mul	a0,a0,s0
    1654:	048000ef          	jal	169c <pqcrystals_dilithium2_ref_montgomery_reduce>
    1658:	fea4ae23          	sw	a0,-4(s1)
    165c:	ff2494e3          	bne	s1,s2,1644 <pqcrystals_dilithium2_ref_invntt_tomont+0x108>
    1660:	04c12083          	lw	ra,76(sp)
    1664:	04812403          	lw	s0,72(sp)
    1668:	04412483          	lw	s1,68(sp)
    166c:	04012903          	lw	s2,64(sp)
    1670:	03c12983          	lw	s3,60(sp)
    1674:	03812a03          	lw	s4,56(sp)
    1678:	03412a83          	lw	s5,52(sp)
    167c:	03012b03          	lw	s6,48(sp)
    1680:	02c12b83          	lw	s7,44(sp)
    1684:	02812c03          	lw	s8,40(sp)
    1688:	02412c83          	lw	s9,36(sp)
    168c:	02012d03          	lw	s10,32(sp)
    1690:	01c12d83          	lw	s11,28(sp)
    1694:	05010113          	addi	sp,sp,80
    1698:	00008067          	ret

0000169c <pqcrystals_dilithium2_ref_montgomery_reduce>:
    169c:	03802737          	lui	a4,0x3802
    16a0:	00170713          	addi	a4,a4,1 # 3802001 <__stack_size+0x37f2001>
    16a4:	02e50733          	mul	a4,a0,a4
    16a8:	41f75613          	srai	a2,a4,0x1f
    16ac:	01675693          	srli	a3,a4,0x16
    16b0:	00a61793          	slli	a5,a2,0xa
    16b4:	00f687b3          	add	a5,a3,a5
    16b8:	00a71693          	slli	a3,a4,0xa
    16bc:	40d706b3          	sub	a3,a4,a3
    16c0:	00d73833          	sltu	a6,a4,a3
    16c4:	40f607b3          	sub	a5,a2,a5
    16c8:	410787b3          	sub	a5,a5,a6
    16cc:	00d79793          	slli	a5,a5,0xd
    16d0:	0136d813          	srli	a6,a3,0x13
    16d4:	00d69693          	slli	a3,a3,0xd
    16d8:	40e68733          	sub	a4,a3,a4
    16dc:	00f807b3          	add	a5,a6,a5
    16e0:	40c787b3          	sub	a5,a5,a2
    16e4:	00e6b6b3          	sltu	a3,a3,a4
    16e8:	40d787b3          	sub	a5,a5,a3
    16ec:	00a70533          	add	a0,a4,a0
    16f0:	00b787b3          	add	a5,a5,a1
    16f4:	00e53533          	sltu	a0,a0,a4
    16f8:	00f50533          	add	a0,a0,a5
    16fc:	00008067          	ret

00001700 <pqcrystals_dilithium2_ref_reduce32>:
    1700:	004007b7          	lui	a5,0x400
    1704:	00f507b3          	add	a5,a0,a5
    1708:	ff802737          	lui	a4,0xff802
    170c:	fff70713          	addi	a4,a4,-1 # ff801fff <__stack_size+0xff7f1fff>
    1710:	4177d793          	srai	a5,a5,0x17
    1714:	02e787b3          	mul	a5,a5,a4
    1718:	00a78533          	add	a0,a5,a0
    171c:	00008067          	ret

00001720 <pqcrystals_dilithium2_ref_caddq>:
    1720:	007fe737          	lui	a4,0x7fe
    1724:	41f55793          	srai	a5,a0,0x1f
    1728:	00170713          	addi	a4,a4,1 # 7fe001 <__stack_size+0x7ee001>
    172c:	00e7f7b3          	and	a5,a5,a4
    1730:	00a78533          	add	a0,a5,a0
    1734:	00008067          	ret

00001738 <KeccakF1600_StatePermute>:
    1738:	00052783          	lw	a5,0(a0)
    173c:	eb010113          	addi	sp,sp,-336
    1740:	15312023          	sw	s3,320(sp)
    1744:	0cf12223          	sw	a5,196(sp)
    1748:	00452783          	lw	a5,4(a0)
    174c:	15212223          	sw	s2,324(sp)
    1750:	13412e23          	sw	s4,316(sp)
    1754:	0cf12423          	sw	a5,200(sp)
    1758:	00852783          	lw	a5,8(a0)
    175c:	13512c23          	sw	s5,312(sp)
    1760:	13612a23          	sw	s6,308(sp)
    1764:	00f12a23          	sw	a5,20(sp)
    1768:	00c52783          	lw	a5,12(a0)
    176c:	13712823          	sw	s7,304(sp)
    1770:	13812623          	sw	s8,300(sp)
    1774:	00f12c23          	sw	a5,24(sp)
    1778:	01052783          	lw	a5,16(a0)
    177c:	13912423          	sw	s9,296(sp)
    1780:	13a12223          	sw	s10,292(sp)
    1784:	0cf12623          	sw	a5,204(sp)
    1788:	01452783          	lw	a5,20(a0)
    178c:	13b12023          	sw	s11,288(sp)
    1790:	14812623          	sw	s0,332(sp)
    1794:	0cf12823          	sw	a5,208(sp)
    1798:	01852783          	lw	a5,24(a0)
    179c:	14912423          	sw	s1,328(sp)
    17a0:	02f12023          	sw	a5,32(sp)
    17a4:	01c52783          	lw	a5,28(a0)
    17a8:	00078993          	mv	s3,a5
    17ac:	02052783          	lw	a5,32(a0)
    17b0:	0cf12a23          	sw	a5,212(sp)
    17b4:	02452783          	lw	a5,36(a0)
    17b8:	0cf12c23          	sw	a5,216(sp)
    17bc:	02852783          	lw	a5,40(a0)
    17c0:	06052c03          	lw	s8,96(a0)
    17c4:	05052d03          	lw	s10,80(a0)
    17c8:	0cf12e23          	sw	a5,220(sp)
    17cc:	02c52783          	lw	a5,44(a0)
    17d0:	06852c83          	lw	s9,104(a0)
    17d4:	05452b83          	lw	s7,84(a0)
    17d8:	0ef12023          	sw	a5,224(sp)
    17dc:	03052783          	lw	a5,48(a0)
    17e0:	00f12e23          	sw	a5,28(sp)
    17e4:	03452783          	lw	a5,52(a0)
    17e8:	02f12223          	sw	a5,36(sp)
    17ec:	03852783          	lw	a5,56(a0)
    17f0:	02f12823          	sw	a5,48(sp)
    17f4:	03c52783          	lw	a5,60(a0)
    17f8:	02f12a23          	sw	a5,52(sp)
    17fc:	04052783          	lw	a5,64(a0)
    1800:	0ef12223          	sw	a5,228(sp)
    1804:	04452783          	lw	a5,68(a0)
    1808:	0ef12423          	sw	a5,232(sp)
    180c:	04852783          	lw	a5,72(a0)
    1810:	02f12423          	sw	a5,40(sp)
    1814:	04c52783          	lw	a5,76(a0)
    1818:	00078613          	mv	a2,a5
    181c:	05852783          	lw	a5,88(a0)
    1820:	06f12023          	sw	a5,96(sp)
    1824:	05c52783          	lw	a5,92(a0)
    1828:	04f12e23          	sw	a5,92(sp)
    182c:	06452783          	lw	a5,100(a0)
    1830:	02f12623          	sw	a5,44(sp)
    1834:	06c52783          	lw	a5,108(a0)
    1838:	02f12c23          	sw	a5,56(sp)
    183c:	07052783          	lw	a5,112(a0)
    1840:	06f12c23          	sw	a5,120(sp)
    1844:	08852703          	lw	a4,136(a0)
    1848:	07452783          	lw	a5,116(a0)
    184c:	0b052383          	lw	t2,176(a0)
    1850:	06e12423          	sw	a4,104(sp)
    1854:	08c52703          	lw	a4,140(a0)
    1858:	06f12223          	sw	a5,100(sp)
    185c:	07852783          	lw	a5,120(a0)
    1860:	06e12623          	sw	a4,108(sp)
    1864:	09852703          	lw	a4,152(a0)
    1868:	06f12a23          	sw	a5,116(sp)
    186c:	07c52783          	lw	a5,124(a0)
    1870:	02e12e23          	sw	a4,60(sp)
    1874:	09c52703          	lw	a4,156(a0)
    1878:	06f12e23          	sw	a5,124(sp)
    187c:	08052b03          	lw	s6,128(a0)
    1880:	04e12023          	sw	a4,64(sp)
    1884:	0a052703          	lw	a4,160(a0)
    1888:	08452903          	lw	s2,132(a0)
    188c:	09052a83          	lw	s5,144(a0)
    1890:	04e12223          	sw	a4,68(sp)
    1894:	0a452703          	lw	a4,164(a0)
    1898:	09452283          	lw	t0,148(a0)
    189c:	0b452a03          	lw	s4,180(a0)
    18a0:	04e12423          	sw	a4,72(sp)
    18a4:	0a852703          	lw	a4,168(a0)
    18a8:	000057b7          	lui	a5,0x5
    18ac:	6d878793          	addi	a5,a5,1752 # 56d8 <KeccakF_RoundConstants>
    18b0:	06e12823          	sw	a4,112(sp)
    18b4:	0ac52703          	lw	a4,172(a0)
    18b8:	00038e93          	mv	t4,t2
    18bc:	08e12023          	sw	a4,128(sp)
    18c0:	0b852703          	lw	a4,184(a0)
    18c4:	08e12223          	sw	a4,132(sp)
    18c8:	0bc52703          	lw	a4,188(a0)
    18cc:	08e12423          	sw	a4,136(sp)
    18d0:	0c052703          	lw	a4,192(a0)
    18d4:	0c452d83          	lw	s11,196(a0)
    18d8:	00f12623          	sw	a5,12(sp)
    18dc:	05812823          	sw	s8,80(sp)
    18e0:	05a12623          	sw	s10,76(sp)
    18e4:	00060c13          	mv	s8,a2
    18e8:	05912a23          	sw	s9,84(sp)
    18ec:	00070793          	mv	a5,a4
    18f0:	10a12e23          	sw	a0,284(sp)
    18f4:	0c412703          	lw	a4,196(sp)
    18f8:	0dc12683          	lw	a3,220(sp)
    18fc:	0e012603          	lw	a2,224(sp)
    1900:	00d746b3          	xor	a3,a4,a3
    1904:	0c812703          	lw	a4,200(sp)
    1908:	00c748b3          	xor	a7,a4,a2
    190c:	02012703          	lw	a4,32(sp)
    1910:	0e412603          	lw	a2,228(sp)
    1914:	0178c8b3          	xor	a7,a7,s7
    1918:	00c74f33          	xor	t5,a4,a2
    191c:	0e812703          	lw	a4,232(sp)
    1920:	03012603          	lw	a2,48(sp)
    1924:	00e9c3b3          	xor	t2,s3,a4
    1928:	0cc12703          	lw	a4,204(sp)
    192c:	00c74833          	xor	a6,a4,a2
    1930:	0d012703          	lw	a4,208(sp)
    1934:	03412603          	lw	a2,52(sp)
    1938:	00c74433          	xor	s0,a4,a2
    193c:	0d412703          	lw	a4,212(sp)
    1940:	02812603          	lw	a2,40(sp)
    1944:	00c74533          	xor	a0,a4,a2
    1948:	0d812703          	lw	a4,216(sp)
    194c:	01c12603          	lw	a2,28(sp)
    1950:	018745b3          	xor	a1,a4,s8
    1954:	01412703          	lw	a4,20(sp)
    1958:	00c74fb3          	xor	t6,a4,a2
    195c:	02412603          	lw	a2,36(sp)
    1960:	01812703          	lw	a4,24(sp)
    1964:	00c74733          	xor	a4,a4,a2
    1968:	04c12603          	lw	a2,76(sp)
    196c:	00c6c6b3          	xor	a3,a3,a2
    1970:	05412603          	lw	a2,84(sp)
    1974:	00cf4f33          	xor	t5,t5,a2
    1978:	03812603          	lw	a2,56(sp)
    197c:	015f4f33          	xor	t5,t5,s5
    1980:	00c3c3b3          	xor	t2,t2,a2
    1984:	05012603          	lw	a2,80(sp)
    1988:	0053c3b3          	xor	t2,t2,t0
    198c:	00c84833          	xor	a6,a6,a2
    1990:	02c12603          	lw	a2,44(sp)
    1994:	00c44433          	xor	s0,s0,a2
    1998:	07812603          	lw	a2,120(sp)
    199c:	00c54533          	xor	a0,a0,a2
    19a0:	06412603          	lw	a2,100(sp)
    19a4:	00c5c5b3          	xor	a1,a1,a2
    19a8:	06012603          	lw	a2,96(sp)
    19ac:	00cfcfb3          	xor	t6,t6,a2
    19b0:	05c12603          	lw	a2,92(sp)
    19b4:	016fcfb3          	xor	t6,t6,s6
    19b8:	00c74733          	xor	a4,a4,a2
    19bc:	07412603          	lw	a2,116(sp)
    19c0:	01274733          	xor	a4,a4,s2
    19c4:	00c6c6b3          	xor	a3,a3,a2
    19c8:	07c12603          	lw	a2,124(sp)
    19cc:	00c8c8b3          	xor	a7,a7,a2
    19d0:	06812603          	lw	a2,104(sp)
    19d4:	00c84833          	xor	a6,a6,a2
    19d8:	06c12603          	lw	a2,108(sp)
    19dc:	01d84833          	xor	a6,a6,t4
    19e0:	00181493          	slli	s1,a6,0x1
    19e4:	00c44433          	xor	s0,s0,a2
    19e8:	03c12603          	lw	a2,60(sp)
    19ec:	01444433          	xor	s0,s0,s4
    19f0:	00c54533          	xor	a0,a0,a2
    19f4:	04012603          	lw	a2,64(sp)
    19f8:	00f54533          	xor	a0,a0,a5
    19fc:	00c5c5b3          	xor	a1,a1,a2
    1a00:	04412603          	lw	a2,68(sp)
    1a04:	01b5c5b3          	xor	a1,a1,s11
    1a08:	00c6c6b3          	xor	a3,a3,a2
    1a0c:	04812603          	lw	a2,72(sp)
    1a10:	01f6d313          	srli	t1,a3,0x1f
    1a14:	00c8c8b3          	xor	a7,a7,a2
    1a18:	08412603          	lw	a2,132(sp)
    1a1c:	01f8de13          	srli	t3,a7,0x1f
    1a20:	00cf4f33          	xor	t5,t5,a2
    1a24:	08812603          	lw	a2,136(sp)
    1a28:	00c3c3b3          	xor	t2,t2,a2
    1a2c:	07012603          	lw	a2,112(sp)
    1a30:	00cfcfb3          	xor	t6,t6,a2
    1a34:	08012603          	lw	a2,128(sp)
    1a38:	00c74733          	xor	a4,a4,a2
    1a3c:	00169613          	slli	a2,a3,0x1
    1a40:	00ce0e33          	add	t3,t3,a2
    1a44:	00189613          	slli	a2,a7,0x1
    1a48:	00c30333          	add	t1,t1,a2
    1a4c:	01f45613          	srli	a2,s0,0x1f
    1a50:	00960633          	add	a2,a2,s1
    1a54:	00d64633          	xor	a2,a2,a3
    1a58:	00141493          	slli	s1,s0,0x1
    1a5c:	01f85693          	srli	a3,a6,0x1f
    1a60:	009686b3          	add	a3,a3,s1
    1a64:	0116c6b3          	xor	a3,a3,a7
    1a68:	00151493          	slli	s1,a0,0x1
    1a6c:	01f5d893          	srli	a7,a1,0x1f
    1a70:	009888b3          	add	a7,a7,s1
    1a74:	0108c8b3          	xor	a7,a7,a6
    1a78:	00159493          	slli	s1,a1,0x1
    1a7c:	01f55813          	srli	a6,a0,0x1f
    1a80:	00980833          	add	a6,a6,s1
    1a84:	00884833          	xor	a6,a6,s0
    1a88:	001f9493          	slli	s1,t6,0x1
    1a8c:	01f75413          	srli	s0,a4,0x1f
    1a90:	00940433          	add	s0,s0,s1
    1a94:	00a44533          	xor	a0,s0,a0
    1a98:	00a12823          	sw	a0,16(sp)
    1a9c:	00171413          	slli	s0,a4,0x1
    1aa0:	01ffd513          	srli	a0,t6,0x1f
    1aa4:	00850533          	add	a0,a0,s0
    1aa8:	00b54cb3          	xor	s9,a0,a1
    1aac:	001f1593          	slli	a1,t5,0x1
    1ab0:	01f3d513          	srli	a0,t2,0x1f
    1ab4:	00139413          	slli	s0,t2,0x1
    1ab8:	00b50533          	add	a0,a0,a1
    1abc:	01ff5593          	srli	a1,t5,0x1f
    1ac0:	008585b3          	add	a1,a1,s0
    1ac4:	00e5c5b3          	xor	a1,a1,a4
    1ac8:	02812703          	lw	a4,40(sp)
    1acc:	01ee4e33          	xor	t3,t3,t5
    1ad0:	00734333          	xor	t1,t1,t2
    1ad4:	00ee4733          	xor	a4,t3,a4
    1ad8:	08e12623          	sw	a4,140(sp)
    1adc:	02012703          	lw	a4,32(sp)
    1ae0:	01f54533          	xor	a0,a0,t6
    1ae4:	01834fb3          	xor	t6,t1,s8
    1ae8:	00e8c733          	xor	a4,a7,a4
    1aec:	04e12c23          	sw	a4,88(sp)
    1af0:	01c12703          	lw	a4,28(sp)
    1af4:	01384c33          	xor	s8,a6,s3
    1af8:	04c12f03          	lw	t5,76(sp)
    1afc:	00e64433          	xor	s0,a2,a4
    1b00:	01412703          	lw	a4,20(sp)
    1b04:	00fe47b3          	xor	a5,t3,a5
    1b08:	01b34db3          	xor	s11,t1,s11
    1b0c:	00e649b3          	xor	s3,a2,a4
    1b10:	02412703          	lw	a4,36(sp)
    1b14:	00e79d13          	slli	s10,a5,0xe
    1b18:	0127d793          	srli	a5,a5,0x12
    1b1c:	00e6c3b3          	xor	t2,a3,a4
    1b20:	01812703          	lw	a4,24(sp)
    1b24:	0158cab3          	xor	s5,a7,s5
    1b28:	005842b3          	xor	t0,a6,t0
    1b2c:	00e6c4b3          	xor	s1,a3,a4
    1b30:	01012703          	lw	a4,16(sp)
    1b34:	01664b33          	xor	s6,a2,s6
    1b38:	0126c933          	xor	s2,a3,s2
    1b3c:	01e74733          	xor	a4,a4,t5
    1b40:	08e12823          	sw	a4,144(sp)
    1b44:	017cc733          	xor	a4,s9,s7
    1b48:	08e12a23          	sw	a4,148(sp)
    1b4c:	05012703          	lw	a4,80(sp)
    1b50:	01d54bb3          	xor	s7,a0,t4
    1b54:	0145ca33          	xor	s4,a1,s4
    1b58:	00e54f33          	xor	t5,a0,a4
    1b5c:	02c12703          	lw	a4,44(sp)
    1b60:	00e5ceb3          	xor	t4,a1,a4
    1b64:	012dd713          	srli	a4,s11,0x12
    1b68:	00ed9d93          	slli	s11,s11,0xe
    1b6c:	01b787b3          	add	a5,a5,s11
    1b70:	02f12623          	sw	a5,44(sp)
    1b74:	03c12783          	lw	a5,60(sp)
    1b78:	01a70733          	add	a4,a4,s10
    1b7c:	02e12423          	sw	a4,40(sp)
    1b80:	00fe47b3          	xor	a5,t3,a5
    1b84:	0af12423          	sw	a5,168(sp)
    1b88:	04012783          	lw	a5,64(sp)
    1b8c:	00f34d33          	xor	s10,t1,a5
    1b90:	05412783          	lw	a5,84(sp)
    1b94:	00f8c7b3          	xor	a5,a7,a5
    1b98:	0af12023          	sw	a5,160(sp)
    1b9c:	03812783          	lw	a5,56(sp)
    1ba0:	00f847b3          	xor	a5,a6,a5
    1ba4:	0af12223          	sw	a5,164(sp)
    1ba8:	01012783          	lw	a5,16(sp)
    1bac:	04412703          	lw	a4,68(sp)
    1bb0:	00e7c7b3          	xor	a5,a5,a4
    1bb4:	0af12623          	sw	a5,172(sp)
    1bb8:	04812783          	lw	a5,72(sp)
    1bbc:	015a9713          	slli	a4,s5,0x15
    1bc0:	00bada93          	srli	s5,s5,0xb
    1bc4:	00fccdb3          	xor	s11,s9,a5
    1bc8:	03012783          	lw	a5,48(sp)
    1bcc:	00f547b3          	xor	a5,a0,a5
    1bd0:	08f12c23          	sw	a5,152(sp)
    1bd4:	03412783          	lw	a5,52(sp)
    1bd8:	00f5c7b3          	xor	a5,a1,a5
    1bdc:	08f12e23          	sw	a5,156(sp)
    1be0:	00b2d793          	srli	a5,t0,0xb
    1be4:	00e787b3          	add	a5,a5,a4
    1be8:	05812703          	lw	a4,88(sp)
    1bec:	01529293          	slli	t0,t0,0x15
    1bf0:	02f12023          	sw	a5,32(sp)
    1bf4:	005a87b3          	add	a5,s5,t0
    1bf8:	02f12223          	sw	a5,36(sp)
    1bfc:	01c71713          	slli	a4,a4,0x1c
    1c00:	004c5793          	srli	a5,s8,0x4
    1c04:	00e787b3          	add	a5,a5,a4
    1c08:	02f12823          	sw	a5,48(sp)
    1c0c:	05812783          	lw	a5,88(sp)
    1c10:	01cc1c13          	slli	s8,s8,0x1c
    1c14:	013b5713          	srli	a4,s6,0x13
    1c18:	0047d793          	srli	a5,a5,0x4
    1c1c:	018787b3          	add	a5,a5,s8
    1c20:	02f12a23          	sw	a5,52(sp)
    1c24:	00db1b13          	slli	s6,s6,0xd
    1c28:	00d91793          	slli	a5,s2,0xd
    1c2c:	01395913          	srli	s2,s2,0x13
    1c30:	00e78ab3          	add	s5,a5,a4
    1c34:	012b07b3          	add	a5,s6,s2
    1c38:	003bd713          	srli	a4,s7,0x3
    1c3c:	04f12423          	sw	a5,72(sp)
    1c40:	01da1793          	slli	a5,s4,0x1d
    1c44:	00e787b3          	add	a5,a5,a4
    1c48:	003a5a13          	srli	s4,s4,0x3
    1c4c:	01db9b93          	slli	s7,s7,0x1d
    1c50:	04f12623          	sw	a5,76(sp)
    1c54:	014b87b3          	add	a5,s7,s4
    1c58:	00199713          	slli	a4,s3,0x1
    1c5c:	04f12823          	sw	a5,80(sp)
    1c60:	01f4d793          	srli	a5,s1,0x1f
    1c64:	00e787b3          	add	a5,a5,a4
    1c68:	00149493          	slli	s1,s1,0x1
    1c6c:	01f9d993          	srli	s3,s3,0x1f
    1c70:	04f12a23          	sw	a5,84(sp)
    1c74:	009987b3          	add	a5,s3,s1
    1c78:	01445713          	srli	a4,s0,0x14
    1c7c:	04f12c23          	sw	a5,88(sp)
    1c80:	00c39793          	slli	a5,t2,0xc
    1c84:	00e787b3          	add	a5,a5,a4
    1c88:	08c12703          	lw	a4,140(sp)
    1c8c:	0143d393          	srli	t2,t2,0x14
    1c90:	00c41413          	slli	s0,s0,0xc
    1c94:	00f12a23          	sw	a5,20(sp)
    1c98:	007407b3          	add	a5,s0,t2
    1c9c:	00f12c23          	sw	a5,24(sp)
    1ca0:	01471713          	slli	a4,a4,0x14
    1ca4:	00cfd793          	srli	a5,t6,0xc
    1ca8:	00e787b3          	add	a5,a5,a4
    1cac:	02f12c23          	sw	a5,56(sp)
    1cb0:	08c12783          	lw	a5,140(sp)
    1cb4:	014f9f93          	slli	t6,t6,0x14
    1cb8:	00be9713          	slli	a4,t4,0xb
    1cbc:	00c7d793          	srli	a5,a5,0xc
    1cc0:	01f787b3          	add	a5,a5,t6
    1cc4:	02f12e23          	sw	a5,60(sp)
    1cc8:	015ede93          	srli	t4,t4,0x15
    1ccc:	015f5793          	srli	a5,t5,0x15
    1cd0:	00bf1f13          	slli	t5,t5,0xb
    1cd4:	00f70733          	add	a4,a4,a5
    1cd8:	01df07b3          	add	a5,t5,t4
    1cdc:	00f12e23          	sw	a5,28(sp)
    1ce0:	09012f03          	lw	t5,144(sp)
    1ce4:	09412783          	lw	a5,148(sp)
    1ce8:	018d5493          	srli	s1,s10,0x18
    1cec:	003f1f13          	slli	t5,t5,0x3
    1cf0:	01d7de93          	srli	t4,a5,0x1d
    1cf4:	01ee8eb3          	add	t4,t4,t5
    1cf8:	05d12023          	sw	t4,64(sp)
    1cfc:	09012e83          	lw	t4,144(sp)
    1d00:	00379793          	slli	a5,a5,0x3
    1d04:	008d1d13          	slli	s10,s10,0x8
    1d08:	01dede93          	srli	t4,t4,0x1d
    1d0c:	00fe87b3          	add	a5,t4,a5
    1d10:	04f12223          	sw	a5,68(sp)
    1d14:	0d412783          	lw	a5,212(sp)
    1d18:	00edd993          	srli	s3,s11,0xe
    1d1c:	012d9d93          	slli	s11,s11,0x12
    1d20:	00fe4eb3          	xor	t4,t3,a5
    1d24:	07812783          	lw	a5,120(sp)
    1d28:	00fe47b3          	xor	a5,t3,a5
    1d2c:	0af12c23          	sw	a5,184(sp)
    1d30:	0d812783          	lw	a5,216(sp)
    1d34:	0dc12f83          	lw	t6,220(sp)
    1d38:	09812b03          	lw	s6,152(sp)
    1d3c:	00f34e33          	xor	t3,t1,a5
    1d40:	06412783          	lw	a5,100(sp)
    1d44:	006b1b13          	slli	s6,s6,0x6
    1d48:	00f347b3          	xor	a5,t1,a5
    1d4c:	0af12e23          	sw	a5,188(sp)
    1d50:	08412783          	lw	a5,132(sp)
    1d54:	00f8c333          	xor	t1,a7,a5
    1d58:	0e412783          	lw	a5,228(sp)
    1d5c:	00f8c7b3          	xor	a5,a7,a5
    1d60:	0af12a23          	sw	a5,180(sp)
    1d64:	08812783          	lw	a5,136(sp)
    1d68:	00f84f33          	xor	t5,a6,a5
    1d6c:	0e812783          	lw	a5,232(sp)
    1d70:	00f84933          	xor	s2,a6,a5
    1d74:	06012783          	lw	a5,96(sp)
    1d78:	00f648b3          	xor	a7,a2,a5
    1d7c:	07012783          	lw	a5,112(sp)
    1d80:	00f64633          	xor	a2,a2,a5
    1d84:	05c12783          	lw	a5,92(sp)
    1d88:	00f6c833          	xor	a6,a3,a5
    1d8c:	08012783          	lw	a5,128(sp)
    1d90:	00f6c6b3          	xor	a3,a3,a5
    1d94:	01012783          	lw	a5,16(sp)
    1d98:	01f7c2b3          	xor	t0,a5,t6
    1d9c:	0e012783          	lw	a5,224(sp)
    1da0:	00fccfb3          	xor	t6,s9,a5
    1da4:	06812783          	lw	a5,104(sp)
    1da8:	00f543b3          	xor	t2,a0,a5
    1dac:	0cc12783          	lw	a5,204(sp)
    1db0:	00f54533          	xor	a0,a0,a5
    1db4:	06c12783          	lw	a5,108(sp)
    1db8:	00f5c433          	xor	s0,a1,a5
    1dbc:	0d012783          	lw	a5,208(sp)
    1dc0:	00f5c5b3          	xor	a1,a1,a5
    1dc4:	0a812783          	lw	a5,168(sp)
    1dc8:	00879793          	slli	a5,a5,0x8
    1dcc:	00f487b3          	add	a5,s1,a5
    1dd0:	0a812483          	lw	s1,168(sp)
    1dd4:	0184d493          	srli	s1,s1,0x18
    1dd8:	01a484b3          	add	s1,s1,s10
    1ddc:	06912623          	sw	s1,108(sp)
    1de0:	0ac12483          	lw	s1,172(sp)
    1de4:	005e5d13          	srli	s10,t3,0x5
    1de8:	01be1e13          	slli	t3,t3,0x1b
    1dec:	01249493          	slli	s1,s1,0x12
    1df0:	009984b3          	add	s1,s3,s1
    1df4:	0ac12983          	lw	s3,172(sp)
    1df8:	00e9d993          	srli	s3,s3,0xe
    1dfc:	01b989b3          	add	s3,s3,s11
    1e00:	07312823          	sw	s3,112(sp)
    1e04:	09c12983          	lw	s3,156(sp)
    1e08:	01be9d93          	slli	s11,t4,0x1b
    1e0c:	005ede93          	srli	t4,t4,0x5
    1e10:	01a9da13          	srli	s4,s3,0x1a
    1e14:	016a0a33          	add	s4,s4,s6
    1e18:	05412e23          	sw	s4,92(sp)
    1e1c:	09812a03          	lw	s4,152(sp)
    1e20:	00699993          	slli	s3,s3,0x6
    1e24:	0a012b03          	lw	s6,160(sp)
    1e28:	01aa5a13          	srli	s4,s4,0x1a
    1e2c:	013a09b3          	add	s3,s4,s3
    1e30:	07312023          	sw	s3,96(sp)
    1e34:	0a412983          	lw	s3,164(sp)
    1e38:	019b1b13          	slli	s6,s6,0x19
    1e3c:	01ce8e33          	add	t3,t4,t3
    1e40:	0079da13          	srli	s4,s3,0x7
    1e44:	016a0a33          	add	s4,s4,s6
    1e48:	07412223          	sw	s4,100(sp)
    1e4c:	00f39e93          	slli	t4,t2,0xf
    1e50:	07412b03          	lw	s6,116(sp)
    1e54:	07c12a23          	sw	t3,116(sp)
    1e58:	01145e13          	srli	t3,s0,0x11
    1e5c:	01de0e33          	add	t3,t3,t4
    1e60:	00f41413          	slli	s0,s0,0xf
    1e64:	0113d393          	srli	t2,t2,0x11
    1e68:	09c12223          	sw	t3,132(sp)
    1e6c:	00838e33          	add	t3,t2,s0
    1e70:	0a012a03          	lw	s4,160(sp)
    1e74:	00835e93          	srli	t4,t1,0x8
    1e78:	09c12423          	sw	t3,136(sp)
    1e7c:	01831313          	slli	t1,t1,0x18
    1e80:	018f1e13          	slli	t3,t5,0x18
    1e84:	008f5f13          	srli	t5,t5,0x8
    1e88:	01e30333          	add	t1,t1,t5
    1e8c:	08612823          	sw	t1,144(sp)
    1e90:	02c12303          	lw	t1,44(sp)
    1e94:	007a5a13          	srli	s4,s4,0x7
    1e98:	01999993          	slli	s3,s3,0x19
    1e9c:	013a09b3          	add	s3,s4,s3
    1ea0:	01bd0d33          	add	s10,s10,s11
    1ea4:	07312423          	sw	s3,104(sp)
    1ea8:	01012983          	lw	s3,16(sp)
    1eac:	01a12823          	sw	s10,16(sp)
    1eb0:	fff34d13          	not	s10,t1
    1eb4:	05012303          	lw	t1,80(sp)
    1eb8:	0c412a03          	lw	s4,196(sp)
    1ebc:	0169cbb3          	xor	s7,s3,s6
    1ec0:	fff34413          	not	s0,t1
    1ec4:	02012303          	lw	t1,32(sp)
    1ec8:	0149ca33          	xor	s4,s3,s4
    1ecc:	07c12b03          	lw	s6,124(sp)
    1ed0:	fff34f13          	not	t5,t1
    1ed4:	04012303          	lw	t1,64(sp)
    1ed8:	02812c03          	lw	s8,40(sp)
    1edc:	0c812983          	lw	s3,200(sp)
    1ee0:	01de0e33          	add	t3,t3,t4
    1ee4:	01c2dd93          	srli	s11,t0,0x1c
    1ee8:	fff34e93          	not	t4,t1
    1eec:	00429293          	slli	t0,t0,0x4
    1ef0:	004f9313          	slli	t1,t6,0x4
    1ef4:	01cfdf93          	srli	t6,t6,0x1c
    1ef8:	01b30db3          	add	s11,t1,s11
    1efc:	01f28333          	add	t1,t0,t6
    1f00:	013cc9b3          	xor	s3,s9,s3
    1f04:	016ccb33          	xor	s6,s9,s6
    1f08:	00a89f93          	slli	t6,a7,0xa
    1f0c:	fffc4c93          	not	s9,s8
    1f10:	06612c23          	sw	t1,120(sp)
    1f14:	04c12c03          	lw	s8,76(sp)
    1f18:	01685313          	srli	t1,a6,0x16
    1f1c:	0168d893          	srli	a7,a7,0x16
    1f20:	00a81813          	slli	a6,a6,0xa
    1f24:	01088833          	add	a6,a7,a6
    1f28:	03012883          	lw	a7,48(sp)
    1f2c:	01f30333          	add	t1,t1,t6
    1f30:	fffc4c13          	not	s8,s8
    1f34:	011c7c33          	and	s8,s8,a7
    1f38:	06612e23          	sw	t1,124(sp)
    1f3c:	01e59893          	slli	a7,a1,0x1e
    1f40:	00255313          	srli	t1,a0,0x2
    1f44:	0025d593          	srli	a1,a1,0x2
    1f48:	01e51513          	slli	a0,a0,0x1e
    1f4c:	00b505b3          	add	a1,a0,a1
    1f50:	006888b3          	add	a7,a7,t1
    1f54:	08b12c23          	sw	a1,152(sp)
    1f58:	009b1313          	slli	t1,s6,0x9
    1f5c:	017bd593          	srli	a1,s7,0x17
    1f60:	00b30333          	add	t1,t1,a1
    1f64:	01e6d513          	srli	a0,a3,0x1e
    1f68:	00261593          	slli	a1,a2,0x2
    1f6c:	00269693          	slli	a3,a3,0x2
    1f70:	01e65613          	srli	a2,a2,0x1e
    1f74:	00b505b3          	add	a1,a0,a1
    1f78:	00d606b3          	add	a3,a2,a3
    1f7c:	009b9b93          	slli	s7,s7,0x9
    1f80:	017b5b13          	srli	s6,s6,0x17
    1f84:	0ab12023          	sw	a1,160(sp)
    1f88:	0ad12223          	sw	a3,164(sp)
    1f8c:	016b85b3          	add	a1,s7,s6
    1f90:	02012683          	lw	a3,32(sp)
    1f94:	08b12e23          	sw	a1,156(sp)
    1f98:	03412583          	lw	a1,52(sp)
    1f9c:	014cfcb3          	and	s9,s9,s4
    1fa0:	fff74393          	not	t2,a4
    1fa4:	00d3f3b3          	and	t2,t2,a3
    1fa8:	09c12623          	sw	t3,140(sp)
    1fac:	00dcc6b3          	xor	a3,s9,a3
    1fb0:	09012023          	sw	a6,128(sp)
    1fb4:	09112a23          	sw	a7,148(sp)
    1fb8:	01412803          	lw	a6,20(sp)
    1fbc:	00b47433          	and	s0,s0,a1
    1fc0:	07012583          	lw	a1,112(sp)
    1fc4:	0ad12823          	sw	a3,176(sp)
    1fc8:	02812683          	lw	a3,40(sp)
    1fcc:	fff84813          	not	a6,a6
    1fd0:	ffface13          	not	t3,s5
    1fd4:	00df7f33          	and	t5,t5,a3
    1fd8:	015efeb3          	and	t4,t4,s5
    1fdc:	015c46b3          	xor	a3,s8,s5
    1fe0:	00e87ab3          	and	s5,a6,a4
    1fe4:	05412803          	lw	a6,84(sp)
    1fe8:	fff4cf93          	not	t6,s1
    1fec:	013d7d33          	and	s10,s10,s3
    1ff0:	010fffb3          	and	t6,t6,a6
    1ff4:	08c12803          	lw	a6,140(sp)
    1ff8:	0b412503          	lw	a0,180(sp)
    1ffc:	00ef4733          	xor	a4,t5,a4
    2000:	fff84c93          	not	s9,a6
    2004:	02412803          	lw	a6,36(sp)
    2008:	fff5c293          	not	t0,a1
    200c:	0ae12623          	sw	a4,172(sp)
    2010:	010d4833          	xor	a6,s10,a6
    2014:	0b012a23          	sw	a6,180(sp)
    2018:	04812803          	lw	a6,72(sp)
    201c:	00c12703          	lw	a4,12(sp)
    2020:	0cd12023          	sw	a3,192(sp)
    2024:	01044833          	xor	a6,s0,a6
    2028:	0d012223          	sw	a6,196(sp)
    202c:	05812803          	lw	a6,88(sp)
    2030:	04c12683          	lw	a3,76(sp)
    2034:	00072703          	lw	a4,0(a4)
    2038:	0102f2b3          	and	t0,t0,a6
    203c:	09012803          	lw	a6,144(sp)
    2040:	03812403          	lw	s0,56(sp)
    2044:	00995593          	srli	a1,s2,0x9
    2048:	fff84b93          	not	s7,a6
    204c:	01791893          	slli	a7,s2,0x17
    2050:	01412803          	lw	a6,20(sp)
    2054:	00955913          	srli	s2,a0,0x9
    2058:	01751513          	slli	a0,a0,0x17
    205c:	00b50533          	add	a0,a0,a1
    2060:	0bc12583          	lw	a1,188(sp)
    2064:	00de7e33          	and	t3,t3,a3
    2068:	01474733          	xor	a4,a4,s4
    206c:	06412683          	lw	a3,100(sp)
    2070:	0103c833          	xor	a6,t2,a6
    2074:	008eceb3          	xor	t4,t4,s0
    2078:	01574733          	xor	a4,a4,s5
    207c:	0b012423          	sw	a6,168(sp)
    2080:	02e12023          	sw	a4,32(sp)
    2084:	00759813          	slli	a6,a1,0x7
    2088:	00c12703          	lw	a4,12(sp)
    208c:	0b812583          	lw	a1,184(sp)
    2090:	0bd12c23          	sw	t4,184(sp)
    2094:	04012e83          	lw	t4,64(sp)
    2098:	fff6c613          	not	a2,a3
    209c:	00f67633          	and	a2,a2,a5
    20a0:	fff7c693          	not	a3,a5
    20a4:	00ffc7b3          	xor	a5,t6,a5
    20a8:	01de4e33          	xor	t3,t3,t4
    20ac:	0cf12423          	sw	a5,200(sp)
    20b0:	00472e83          	lw	t4,4(a4)
    20b4:	07c12783          	lw	a5,124(sp)
    20b8:	01412703          	lw	a4,20(sp)
    20bc:	fffa4a13          	not	s4,s4
    20c0:	012888b3          	add	a7,a7,s2
    20c4:	0bc12f03          	lw	t5,188(sp)
    20c8:	00ea7a33          	and	s4,s4,a4
    20cc:	0bc12e23          	sw	t3,188(sp)
    20d0:	fff7c913          	not	s2,a5
    20d4:	08412783          	lw	a5,132(sp)
    20d8:	04012703          	lw	a4,64(sp)
    20dc:	fff44e13          	not	t3,s0
    20e0:	05412f83          	lw	t6,84(sp)
    20e4:	00ee7e33          	and	t3,t3,a4
    20e8:	03012703          	lw	a4,48(sp)
    20ec:	0096f6b3          	and	a3,a3,s1
    20f0:	0195d393          	srli	t2,a1,0x19
    20f4:	fff74713          	not	a4,a4
    20f8:	00877733          	and	a4,a4,s0
    20fc:	ffffc413          	not	s0,t6
    2100:	05c12f83          	lw	t6,92(sp)
    2104:	019f5f13          	srli	t5,t5,0x19
    2108:	00759593          	slli	a1,a1,0x7
    210c:	01f47433          	and	s0,s0,t6
    2110:	00944433          	xor	s0,s0,s1
    2114:	013ecfb3          	xor	t6,t4,s3
    2118:	03012e83          	lw	t4,48(sp)
    211c:	0c812623          	sw	s0,204(sp)
    2120:	01812403          	lw	s0,24(sp)
    2124:	01c12483          	lw	s1,28(sp)
    2128:	01de4e33          	xor	t3,t3,t4
    212c:	01e585b3          	add	a1,a1,t5
    2130:	03c12823          	sw	t3,48(sp)
    2134:	03c12f03          	lw	t5,60(sp)
    2138:	01c12e03          	lw	t3,28(sp)
    213c:	fff44413          	not	s0,s0
    2140:	00947433          	and	s0,s0,s1
    2144:	04412483          	lw	s1,68(sp)
    2148:	fffe4e93          	not	t4,t3
    214c:	ffff4f13          	not	t5,t5
    2150:	02412e03          	lw	t3,36(sp)
    2154:	00780833          	add	a6,a6,t2
    2158:	009f7f33          	and	t5,t5,s1
    215c:	02c12383          	lw	t2,44(sp)
    2160:	01812483          	lw	s1,24(sp)
    2164:	01cefeb3          	and	t4,t4,t3
    2168:	fffe4e13          	not	t3,t3
    216c:	009eceb3          	xor	t4,t4,s1
    2170:	007e7e33          	and	t3,t3,t2
    2174:	04c12383          	lw	t2,76(sp)
    2178:	03d12223          	sw	t4,36(sp)
    217c:	01c12e83          	lw	t4,28(sp)
    2180:	00774733          	xor	a4,a4,t2
    2184:	04e12023          	sw	a4,64(sp)
    2188:	01de4e33          	xor	t3,t3,t4
    218c:	04412703          	lw	a4,68(sp)
    2190:	01c12e23          	sw	t3,28(sp)
    2194:	03412e03          	lw	t3,52(sp)
    2198:	fff74393          	not	t2,a4
    219c:	04812703          	lw	a4,72(sp)
    21a0:	fffe4e93          	not	t4,t3
    21a4:	03c12e03          	lw	t3,60(sp)
    21a8:	00e3f3b3          	and	t2,t2,a4
    21ac:	05012a83          	lw	s5,80(sp)
    21b0:	01cefeb3          	and	t4,t4,t3
    21b4:	01c3ce33          	xor	t3,t2,t3
    21b8:	03c12c23          	sw	t3,56(sp)
    21bc:	05812e03          	lw	t3,88(sp)
    21c0:	06012383          	lw	t2,96(sp)
    21c4:	fff74713          	not	a4,a4
    21c8:	fffe4e13          	not	t3,t3
    21cc:	007e7e33          	and	t3,t3,t2
    21d0:	04412383          	lw	t2,68(sp)
    21d4:	01577733          	and	a4,a4,s5
    21d8:	008fcfb3          	xor	t6,t6,s0
    21dc:	00774733          	xor	a4,a4,t2
    21e0:	02e12e23          	sw	a4,60(sp)
    21e4:	02812703          	lw	a4,40(sp)
    21e8:	015eceb3          	xor	t4,t4,s5
    21ec:	fff9c993          	not	s3,s3
    21f0:	00ea4733          	xor	a4,s4,a4
    21f4:	02e12423          	sw	a4,40(sp)
    21f8:	05c12703          	lw	a4,92(sp)
    21fc:	06412483          	lw	s1,100(sp)
    2200:	01f12a23          	sw	t6,20(sp)
    2204:	06012f83          	lw	t6,96(sp)
    2208:	fff74393          	not	t2,a4
    220c:	0093f3b3          	and	t2,t2,s1
    2210:	05d12223          	sw	t4,68(sp)
    2214:	06c12483          	lw	s1,108(sp)
    2218:	06812e83          	lw	t4,104(sp)
    221c:	ffffcb13          	not	s6,t6
    2220:	01812f83          	lw	t6,24(sp)
    2224:	0092c2b3          	xor	t0,t0,s1
    2228:	01db7b33          	and	s6,s6,t4
    222c:	07012e83          	lw	t4,112(sp)
    2230:	00e64733          	xor	a4,a2,a4
    2234:	01f9f9b3          	and	s3,s3,t6
    2238:	06c12603          	lw	a2,108(sp)
    223c:	08812f83          	lw	t6,136(sp)
    2240:	06512623          	sw	t0,108(sp)
    2244:	06412283          	lw	t0,100(sp)
    2248:	01de4e33          	xor	t3,t3,t4
    224c:	07c12223          	sw	t3,100(sp)
    2250:	0056c6b3          	xor	a3,a3,t0
    2254:	07812e03          	lw	t3,120(sp)
    2258:	ffffc293          	not	t0,t6
    225c:	03412f83          	lw	t6,52(sp)
    2260:	04d12e23          	sw	a3,92(sp)
    2264:	05412683          	lw	a3,84(sp)
    2268:	01ff4f33          	xor	t5,t5,t6
    226c:	fffe4f93          	not	t6,t3
    2270:	07412e03          	lw	t3,116(sp)
    2274:	0c012e83          	lw	t4,192(sp)
    2278:	03e12a23          	sw	t5,52(sp)
    227c:	fffe4f13          	not	t5,t3
    2280:	0b012e03          	lw	t3,176(sp)
    2284:	00d3c6b3          	xor	a3,t2,a3
    2288:	04e12623          	sw	a4,76(sp)
    228c:	06812703          	lw	a4,104(sp)
    2290:	01de4c33          	xor	s8,t3,t4
    2294:	04d12423          	sw	a3,72(sp)
    2298:	0a012e83          	lw	t4,160(sp)
    229c:	01012683          	lw	a3,16(sp)
    22a0:	fff74713          	not	a4,a4
    22a4:	00977733          	and	a4,a4,s1
    22a8:	fff6c393          	not	t2,a3
    22ac:	0c412483          	lw	s1,196(sp)
    22b0:	07012683          	lw	a3,112(sp)
    22b4:	fffec413          	not	s0,t4
    22b8:	0b412e83          	lw	t4,180(sp)
    22bc:	fff64613          	not	a2,a2
    22c0:	01012e03          	lw	t3,16(sp)
    22c4:	009ecab3          	xor	s5,t4,s1
    22c8:	00d67633          	and	a2,a2,a3
    22cc:	08012683          	lw	a3,128(sp)
    22d0:	07412e83          	lw	t4,116(sp)
    22d4:	0a812483          	lw	s1,168(sp)
    22d8:	01ccfe33          	and	t3,s9,t3
    22dc:	01dbfeb3          	and	t4,s7,t4
    22e0:	0b812b83          	lw	s7,184(sp)
    22e4:	fff7c793          	not	a5,a5
    22e8:	fffdca13          	not	s4,s11
    22ec:	0174cd33          	xor	s10,s1,s7
    22f0:	08412483          	lw	s1,132(sp)
    22f4:	07d12823          	sw	t4,112(sp)
    22f8:	fff84b93          	not	s7,a6
    22fc:	009e4e33          	xor	t3,t3,s1
    2300:	00997933          	and	s2,s2,s1
    2304:	09012483          	lw	s1,144(sp)
    2308:	09c12223          	sw	t3,132(sp)
    230c:	08c12e03          	lw	t3,140(sp)
    2310:	0092f2b3          	and	t0,t0,s1
    2314:	02c12483          	lw	s1,44(sp)
    2318:	01c7f7b3          	and	a5,a5,t3
    231c:	07c12e03          	lw	t3,124(sp)
    2320:	0099c4b3          	xor	s1,s3,s1
    2324:	00912c23          	sw	s1,24(sp)
    2328:	0bc12983          	lw	s3,188(sp)
    232c:	0ac12483          	lw	s1,172(sp)
    2330:	01ca7a33          	and	s4,s4,t3
    2334:	06012e03          	lw	t3,96(sp)
    2338:	0134c4b3          	xor	s1,s1,s3
    233c:	05812983          	lw	s3,88(sp)
    2340:	01c74733          	xor	a4,a4,t3
    2344:	06812e03          	lw	t3,104(sp)
    2348:	013b49b3          	xor	s3,s6,s3
    234c:	03312623          	sw	s3,44(sp)
    2350:	03812b03          	lw	s6,56(sp)
    2354:	02412983          	lw	s3,36(sp)
    2358:	01c64633          	xor	a2,a2,t3
    235c:	04c12a23          	sw	a2,84(sp)
    2360:	0169ccb3          	xor	s9,s3,s6
    2364:	08012983          	lw	s3,128(sp)
    2368:	08812b03          	lw	s6,136(sp)
    236c:	08812603          	lw	a2,136(sp)
    2370:	013fffb3          	and	t6,t6,s3
    2374:	07812983          	lw	s3,120(sp)
    2378:	04e12823          	sw	a4,80(sp)
    237c:	006bfbb3          	and	s7,s7,t1
    2380:	013f7f33          	and	t5,t5,s3
    2384:	0c812983          	lw	s3,200(sp)
    2388:	fff34713          	not	a4,t1
    238c:	fff6c693          	not	a3,a3
    2390:	013c4c33          	xor	s8,s8,s3
    2394:	09412983          	lw	s3,148(sp)
    2398:	0a412e83          	lw	t4,164(sp)
    239c:	00c6f6b3          	and	a3,a3,a2
    23a0:	01347433          	and	s0,s0,s3
    23a4:	06c12983          	lw	s3,108(sp)
    23a8:	00644333          	xor	t1,s0,t1
    23ac:	09412603          	lw	a2,148(sp)
    23b0:	013acab3          	xor	s5,s5,s3
    23b4:	07012983          	lw	s3,112(sp)
    23b8:	fffece93          	not	t4,t4
    23bc:	01b3f3b3          	and	t2,t2,s11
    23c0:	0169c9b3          	xor	s3,s3,s6
    23c4:	09312423          	sw	s3,136(sp)
    23c8:	09812983          	lw	s3,152(sp)
    23cc:	03c12403          	lw	s0,60(sp)
    23d0:	0c612823          	sw	t1,208(sp)
    23d4:	01c12303          	lw	t1,28(sp)
    23d8:	013efeb3          	and	t4,t4,s3
    23dc:	04c12983          	lw	s3,76(sp)
    23e0:	00834433          	xor	s0,t1,s0
    23e4:	0a012303          	lw	t1,160(sp)
    23e8:	013d4d33          	xor	s10,s10,s3
    23ec:	07c12983          	lw	s3,124(sp)
    23f0:	00677733          	and	a4,a4,t1
    23f4:	01012303          	lw	t1,16(sp)
    23f8:	0137c7b3          	xor	a5,a5,s3
    23fc:	03412983          	lw	s3,52(sp)
    2400:	006a4333          	xor	t1,s4,t1
    2404:	00612823          	sw	t1,16(sp)
    2408:	01412303          	lw	t1,20(sp)
    240c:	01b94933          	xor	s2,s2,s11
    2410:	07212023          	sw	s2,96(sp)
    2414:	013349b3          	xor	s3,t1,s3
    2418:	08c12303          	lw	t1,140(sp)
    241c:	fff5c913          	not	s2,a1
    2420:	06f12823          	sw	a5,112(sp)
    2424:	0063c333          	xor	t1,t2,t1
    2428:	05c12383          	lw	t2,92(sp)
    242c:	09c12783          	lw	a5,156(sp)
    2430:	06612e23          	sw	t1,124(sp)
    2434:	0074c4b3          	xor	s1,s1,t2
    2438:	05012383          	lw	t2,80(sp)
    243c:	fff7c793          	not	a5,a5
    2440:	fff54313          	not	t1,a0
    2444:	007cccb3          	xor	s9,s9,t2
    2448:	07812383          	lw	t2,120(sp)
    244c:	00b37333          	and	t1,t1,a1
    2450:	fff8ce13          	not	t3,a7
    2454:	0076c6b3          	xor	a3,a3,t2
    2458:	08012383          	lw	t2,128(sp)
    245c:	06d12423          	sw	a3,104(sp)
    2460:	09812683          	lw	a3,152(sp)
    2464:	0072c2b3          	xor	t0,t0,t2
    2468:	06512c23          	sw	t0,120(sp)
    246c:	03012383          	lw	t2,48(sp)
    2470:	02012283          	lw	t0,32(sp)
    2474:	fff6c693          	not	a3,a3
    2478:	00a6f6b3          	and	a3,a3,a0
    247c:	0072ca33          	xor	s4,t0,t2
    2480:	09c12283          	lw	t0,156(sp)
    2484:	0cc12383          	lw	t2,204(sp)
    2488:	010e7e33          	and	t3,t3,a6
    248c:	00597933          	and	s2,s2,t0
    2490:	04012283          	lw	t0,64(sp)
    2494:	01074733          	xor	a4,a4,a6
    2498:	fff64613          	not	a2,a2
    249c:	0072c3b3          	xor	t2,t0,t2
    24a0:	0a412283          	lw	t0,164(sp)
    24a4:	01167633          	and	a2,a2,a7
    24a8:	011bcbb3          	xor	s7,s7,a7
    24ac:	0057f7b3          	and	a5,a5,t0
    24b0:	05412283          	lw	t0,84(sp)
    24b4:	00b7c7b3          	xor	a5,a5,a1
    24b8:	00a94933          	xor	s2,s2,a0
    24bc:	00544433          	xor	s0,s0,t0
    24c0:	02c12283          	lw	t0,44(sp)
    24c4:	0059c9b3          	xor	s3,s3,t0
    24c8:	07412283          	lw	t0,116(sp)
    24cc:	005fcfb3          	xor	t6,t6,t0
    24d0:	05f12c23          	sw	t6,88(sp)
    24d4:	04412f83          	lw	t6,68(sp)
    24d8:	06412283          	lw	t0,100(sp)
    24dc:	07812583          	lw	a1,120(sp)
    24e0:	09412803          	lw	a6,148(sp)
    24e4:	005fc2b3          	xor	t0,t6,t0
    24e8:	09012f83          	lw	t6,144(sp)
    24ec:	00b44433          	xor	s0,s0,a1
    24f0:	05812583          	lw	a1,88(sp)
    24f4:	01ff4f33          	xor	t5,t5,t6
    24f8:	07e12a23          	sw	t5,116(sp)
    24fc:	04812f03          	lw	t5,72(sp)
    2500:	00b9c9b3          	xor	s3,s3,a1
    2504:	09812583          	lw	a1,152(sp)
    2508:	01ea4a33          	xor	s4,s4,t5
    250c:	02812f03          	lw	t5,40(sp)
    2510:	00b345b3          	xor	a1,t1,a1
    2514:	08b12623          	sw	a1,140(sp)
    2518:	0a412583          	lw	a1,164(sp)
    251c:	01e3c3b3          	xor	t2,t2,t5
    2520:	01812f03          	lw	t5,24(sp)
    2524:	00b6c6b3          	xor	a3,a3,a1
    2528:	01012583          	lw	a1,16(sp)
    252c:	01e2c2b3          	xor	t0,t0,t5
    2530:	08412f03          	lw	t5,132(sp)
    2534:	00ba4a33          	xor	s4,s4,a1
    2538:	07c12583          	lw	a1,124(sp)
    253c:	01ec4c33          	xor	s8,s8,t5
    2540:	08812f03          	lw	t5,136(sp)
    2544:	00b3c3b3          	xor	t2,t2,a1
    2548:	07412583          	lw	a1,116(sp)
    254c:	01eacab3          	xor	s5,s5,t5
    2550:	09c12f03          	lw	t5,156(sp)
    2554:	00b2c2b3          	xor	t0,t0,a1
    2558:	0d012583          	lw	a1,208(sp)
    255c:	01eeceb3          	xor	t4,t4,t5
    2560:	09d12823          	sw	t4,144(sp)
    2564:	00bc4c33          	xor	s8,s8,a1
    2568:	010e4833          	xor	a6,t3,a6
    256c:	09012583          	lw	a1,144(sp)
    2570:	09012023          	sw	a6,128(sp)
    2574:	0a012803          	lw	a6,160(sp)
    2578:	00bacab3          	xor	s5,s5,a1
    257c:	08c12583          	lw	a1,140(sp)
    2580:	01064633          	xor	a2,a2,a6
    2584:	07012803          	lw	a6,112(sp)
    2588:	00b9c9b3          	xor	s3,s3,a1
    258c:	08012583          	lw	a1,128(sp)
    2590:	06012e83          	lw	t4,96(sp)
    2594:	0104c4b3          	xor	s1,s1,a6
    2598:	06812803          	lw	a6,104(sp)
    259c:	00e4c4b3          	xor	s1,s1,a4
    25a0:	00f44433          	xor	s0,s0,a5
    25a4:	00ba4a33          	xor	s4,s4,a1
    25a8:	01fadf93          	srli	t6,s5,0x1f
    25ac:	001c1593          	slli	a1,s8,0x1
    25b0:	00c3c3b3          	xor	t2,t2,a2
    25b4:	00d2c2b3          	xor	t0,t0,a3
    25b8:	001a1513          	slli	a0,s4,0x1
    25bc:	00199893          	slli	a7,s3,0x1
    25c0:	00141b13          	slli	s6,s0,0x1
    25c4:	01dd4d33          	xor	s10,s10,t4
    25c8:	010cccb3          	xor	s9,s9,a6
    25cc:	00bf8fb3          	add	t6,t6,a1
    25d0:	00149813          	slli	a6,s1,0x1
    25d4:	01f9de13          	srli	t3,s3,0x1f
    25d8:	01fa5313          	srli	t1,s4,0x1f
    25dc:	01f45593          	srli	a1,s0,0x1f
    25e0:	01f4de93          	srli	t4,s1,0x1f
    25e4:	017d4d33          	xor	s10,s10,s7
    25e8:	012cccb3          	xor	s9,s9,s2
    25ec:	00ae0e33          	add	t3,t3,a0
    25f0:	01130333          	add	t1,t1,a7
    25f4:	00139513          	slli	a0,t2,0x1
    25f8:	01f2d893          	srli	a7,t0,0x1f
    25fc:	010585b3          	add	a1,a1,a6
    2600:	016e8eb3          	add	t4,t4,s6
    2604:	01f3d813          	srli	a6,t2,0x1f
    2608:	00129b13          	slli	s6,t0,0x1
    260c:	001a9d93          	slli	s11,s5,0x1
    2610:	01fc5f13          	srli	t5,s8,0x1f
    2614:	00a888b3          	add	a7,a7,a0
    2618:	01680833          	add	a6,a6,s6
    261c:	01fcd513          	srli	a0,s9,0x1f
    2620:	001d1b13          	slli	s6,s10,0x1
    2624:	01bf0f33          	add	t5,t5,s11
    2628:	01650533          	add	a0,a0,s6
    262c:	001c9d93          	slli	s11,s9,0x1
    2630:	01fd5b13          	srli	s6,s10,0x1f
    2634:	01bb0b33          	add	s6,s6,s11
    2638:	005b4b33          	xor	s6,s6,t0
    263c:	05c12283          	lw	t0,92(sp)
    2640:	01afcfb3          	xor	t6,t6,s10
    2644:	01534333          	xor	t1,t1,s5
    2648:	01f2cab3          	xor	s5,t0,t6
    264c:	0bc12283          	lw	t0,188(sp)
    2650:	019f4f33          	xor	t5,t5,s9
    2654:	01f74733          	xor	a4,a4,t6
    2658:	01f2cdb3          	xor	s11,t0,t6
    265c:	0ac12283          	lw	t0,172(sp)
    2660:	0145c5b3          	xor	a1,a1,s4
    2664:	01e7c7b3          	xor	a5,a5,t5
    2668:	01f2c2b3          	xor	t0,t0,t6
    266c:	08512a23          	sw	t0,148(sp)
    2670:	07012283          	lw	t0,112(sp)
    2674:	0098c8b3          	xor	a7,a7,s1
    2678:	00754533          	xor	a0,a0,t2
    267c:	01f2ccb3          	xor	s9,t0,t6
    2680:	05412f83          	lw	t6,84(sp)
    2684:	013eceb3          	xor	t4,t4,s3
    2688:	018e4e33          	xor	t3,t3,s8
    268c:	01efca33          	xor	s4,t6,t5
    2690:	03c12f83          	lw	t6,60(sp)
    2694:	00884833          	xor	a6,a6,s0
    2698:	01c64633          	xor	a2,a2,t3
    269c:	01efcfb3          	xor	t6,t6,t5
    26a0:	05f12a23          	sw	t6,84(sp)
    26a4:	01c12f83          	lw	t6,28(sp)
    26a8:	0066c6b3          	xor	a3,a3,t1
    26ac:	01efcfb3          	xor	t6,t6,t5
    26b0:	09f12c23          	sw	t6,152(sp)
    26b4:	07812f83          	lw	t6,120(sp)
    26b8:	01efcfb3          	xor	t6,t6,t5
    26bc:	0b812f03          	lw	t5,184(sp)
    26c0:	07f12823          	sw	t6,112(sp)
    26c4:	00bf44b3          	xor	s1,t5,a1
    26c8:	06012f03          	lw	t5,96(sp)
    26cc:	00bf43b3          	xor	t2,t5,a1
    26d0:	0a812f03          	lw	t5,168(sp)
    26d4:	00bf4f33          	xor	t5,t5,a1
    26d8:	03e12e23          	sw	t5,60(sp)
    26dc:	04c12f03          	lw	t5,76(sp)
    26e0:	00bf4f33          	xor	t5,t5,a1
    26e4:	07e12023          	sw	t5,96(sp)
    26e8:	02412f03          	lw	t5,36(sp)
    26ec:	00bbc5b3          	xor	a1,s7,a1
    26f0:	0ab12223          	sw	a1,164(sp)
    26f4:	01df42b3          	xor	t0,t5,t4
    26f8:	05012f03          	lw	t5,80(sp)
    26fc:	03812583          	lw	a1,56(sp)
    2700:	01df4d33          	xor	s10,t5,t4
    2704:	07c12f03          	lw	t5,124(sp)
    2708:	01d5c433          	xor	s0,a1,t4
    270c:	06812583          	lw	a1,104(sp)
    2710:	01cf4f33          	xor	t5,t5,t3
    2714:	05e12623          	sw	t5,76(sp)
    2718:	02812f03          	lw	t5,40(sp)
    271c:	01d5c5b3          	xor	a1,a1,t4
    2720:	01d94eb3          	xor	t4,s2,t4
    2724:	01cf4c33          	xor	s8,t5,t3
    2728:	0bd12423          	sw	t4,168(sp)
    272c:	0cc12f03          	lw	t5,204(sp)
    2730:	04012e83          	lw	t4,64(sp)
    2734:	01ceceb3          	xor	t4,t4,t3
    2738:	01cf4e33          	xor	t3,t5,t3
    273c:	07412f03          	lw	t5,116(sp)
    2740:	09c12e23          	sw	t3,156(sp)
    2744:	04412e03          	lw	t3,68(sp)
    2748:	006f4f33          	xor	t5,t5,t1
    274c:	05e12223          	sw	t5,68(sp)
    2750:	01812f03          	lw	t5,24(sp)
    2754:	006e4e33          	xor	t3,t3,t1
    2758:	006f4f33          	xor	t5,t5,t1
    275c:	05e12823          	sw	t5,80(sp)
    2760:	06412f03          	lw	t5,100(sp)
    2764:	006f4333          	xor	t1,t5,t1
    2768:	0a612023          	sw	t1,160(sp)
    276c:	08412303          	lw	t1,132(sp)
    2770:	03412b83          	lw	s7,52(sp)
    2774:	011349b3          	xor	s3,t1,a7
    2778:	0b012303          	lw	t1,176(sp)
    277c:	016bcbb3          	xor	s7,s7,s6
    2780:	05712e23          	sw	s7,92(sp)
    2784:	01134fb3          	xor	t6,t1,a7
    2788:	0c812303          	lw	t1,200(sp)
    278c:	05812b83          	lw	s7,88(sp)
    2790:	01134333          	xor	t1,t1,a7
    2794:	02612c23          	sw	t1,56(sp)
    2798:	0d012303          	lw	t1,208(sp)
    279c:	016bcbb3          	xor	s7,s7,s6
    27a0:	01134333          	xor	t1,t1,a7
    27a4:	06612223          	sw	t1,100(sp)
    27a8:	0c012303          	lw	t1,192(sp)
    27ac:	011348b3          	xor	a7,t1,a7
    27b0:	07112a23          	sw	a7,116(sp)
    27b4:	08812883          	lw	a7,136(sp)
    27b8:	03012303          	lw	t1,48(sp)
    27bc:	09712423          	sw	s7,136(sp)
    27c0:	0108c933          	xor	s2,a7,a6
    27c4:	0b412883          	lw	a7,180(sp)
    27c8:	00a34333          	xor	t1,t1,a0
    27cc:	01412b83          	lw	s7,20(sp)
    27d0:	0108cf33          	xor	t5,a7,a6
    27d4:	06c12883          	lw	a7,108(sp)
    27d8:	0108c8b3          	xor	a7,a7,a6
    27dc:	05112023          	sw	a7,64(sp)
    27e0:	09012883          	lw	a7,144(sp)
    27e4:	0108c8b3          	xor	a7,a7,a6
    27e8:	07112423          	sw	a7,104(sp)
    27ec:	0c412883          	lw	a7,196(sp)
    27f0:	0108c833          	xor	a6,a7,a6
    27f4:	07012623          	sw	a6,108(sp)
    27f8:	04812803          	lw	a6,72(sp)
    27fc:	04612423          	sw	t1,72(sp)
    2800:	01012303          	lw	t1,16(sp)
    2804:	08012883          	lw	a7,128(sp)
    2808:	00a84833          	xor	a6,a6,a0
    280c:	00a34333          	xor	t1,t1,a0
    2810:	08612823          	sw	t1,144(sp)
    2814:	02012303          	lw	t1,32(sp)
    2818:	00a8c8b3          	xor	a7,a7,a0
    281c:	00a34533          	xor	a0,t1,a0
    2820:	00a12823          	sw	a0,16(sp)
    2824:	08c12303          	lw	t1,140(sp)
    2828:	02c12503          	lw	a0,44(sp)
    282c:	01634333          	xor	t1,t1,s6
    2830:	01654533          	xor	a0,a0,s6
    2834:	016bcb33          	xor	s6,s7,s6
    2838:	01612a23          	sw	s6,20(sp)
    283c:	00ba1b93          	slli	s7,s4,0xb
    2840:	015adb13          	srli	s6,s5,0x15
    2844:	015a5a13          	srli	s4,s4,0x15
    2848:	00ba9a93          	slli	s5,s5,0xb
    284c:	016b8b33          	add	s6,s7,s6
    2850:	014a8a33          	add	s4,s5,s4
    2854:	03612023          	sw	s6,32(sp)
    2858:	01599a93          	slli	s5,s3,0x15
    285c:	03412223          	sw	s4,36(sp)
    2860:	00b95a13          	srli	s4,s2,0xb
    2864:	015a0a33          	add	s4,s4,s5
    2868:	00b9d993          	srli	s3,s3,0xb
    286c:	01d79a93          	slli	s5,a5,0x1d
    2870:	01591913          	slli	s2,s2,0x15
    2874:	0037d793          	srli	a5,a5,0x3
    2878:	01298933          	add	s2,s3,s2
    287c:	08f12023          	sw	a5,128(sp)
    2880:	03c12783          	lw	a5,60(sp)
    2884:	0144d993          	srli	s3,s1,0x14
    2888:	03212623          	sw	s2,44(sp)
    288c:	00c49493          	slli	s1,s1,0xc
    2890:	00c41913          	slli	s2,s0,0xc
    2894:	01445413          	srli	s0,s0,0x14
    2898:	00848433          	add	s0,s1,s0
    289c:	00812e23          	sw	s0,28(sp)
    28a0:	01f7d793          	srli	a5,a5,0x1f
    28a4:	00c12403          	lw	s0,12(sp)
    28a8:	08f12623          	sw	a5,140(sp)
    28ac:	05412783          	lw	a5,84(sp)
    28b0:	00842403          	lw	s0,8(s0)
    28b4:	01390933          	add	s2,s2,s3
    28b8:	01a7d793          	srli	a5,a5,0x1a
    28bc:	0af12623          	sw	a5,172(sp)
    28c0:	05412783          	lw	a5,84(sp)
    28c4:	0c812223          	sw	s0,196(sp)
    28c8:	0126d413          	srli	s0,a3,0x12
    28cc:	02812823          	sw	s0,48(sp)
    28d0:	00e61413          	slli	s0,a2,0xe
    28d4:	02812a23          	sw	s0,52(sp)
    28d8:	00679793          	slli	a5,a5,0x6
    28dc:	00c12403          	lw	s0,12(sp)
    28e0:	0af12c23          	sw	a5,184(sp)
    28e4:	006d9793          	slli	a5,s11,0x6
    28e8:	0af12823          	sw	a5,176(sp)
    28ec:	01add793          	srli	a5,s11,0x1a
    28f0:	00c42403          	lw	s0,12(s0)
    28f4:	0af12a23          	sw	a5,180(sp)
    28f8:	00e35793          	srli	a5,t1,0xe
    28fc:	03412d83          	lw	s11,52(sp)
    2900:	0cf12e23          	sw	a5,220(sp)
    2904:	03012783          	lw	a5,48(sp)
    2908:	0c812423          	sw	s0,200(sp)
    290c:	004f5413          	srli	s0,t5,0x4
    2910:	01b78db3          	add	s11,a5,s11
    2914:	00e69693          	slli	a3,a3,0xe
    2918:	01289793          	slli	a5,a7,0x12
    291c:	01265613          	srli	a2,a2,0x12
    2920:	04812c23          	sw	s0,88(sp)
    2924:	01cf9413          	slli	s0,t6,0x1c
    2928:	01f2db93          	srli	s7,t0,0x1f
    292c:	06812c23          	sw	s0,120(sp)
    2930:	0ef12023          	sw	a5,224(sp)
    2934:	00ce5413          	srli	s0,t3,0xc
    2938:	00d607b3          	add	a5,a2,a3
    293c:	03412423          	sw	s4,40(sp)
    2940:	01212c23          	sw	s2,24(sp)
    2944:	06812e23          	sw	s0,124(sp)
    2948:	09712223          	sw	s7,132(sp)
    294c:	02f12823          	sw	a5,48(sp)
    2950:	00129b93          	slli	s7,t0,0x1
    2954:	03c12283          	lw	t0,60(sp)
    2958:	04012783          	lw	a5,64(sp)
    295c:	07812683          	lw	a3,120(sp)
    2960:	01cf1f13          	slli	t5,t5,0x1c
    2964:	0077d793          	srli	a5,a5,0x7
    2968:	0af12e23          	sw	a5,188(sp)
    296c:	04012783          	lw	a5,64(sp)
    2970:	004fdf93          	srli	t6,t6,0x4
    2974:	014e9b13          	slli	s6,t4,0x14
    2978:	01979793          	slli	a5,a5,0x19
    297c:	0cf12623          	sw	a5,204(sp)
    2980:	05812783          	lw	a5,88(sp)
    2984:	014e1e13          	slli	t3,t3,0x14
    2988:	00cede93          	srli	t4,t4,0xc
    298c:	00d787b3          	add	a5,a5,a3
    2990:	02f12a23          	sw	a5,52(sp)
    2994:	03812783          	lw	a5,56(sp)
    2998:	00375a13          	srli	s4,a4,0x3
    299c:	01d71713          	slli	a4,a4,0x1d
    29a0:	01979693          	slli	a3,a5,0x19
    29a4:	0077d793          	srli	a5,a5,0x7
    29a8:	0cf12023          	sw	a5,192(sp)
    29ac:	01ef87b3          	add	a5,t6,t5
    29b0:	02f12c23          	sw	a5,56(sp)
    29b4:	04412783          	lw	a5,68(sp)
    29b8:	01d55993          	srli	s3,a0,0x1d
    29bc:	00381913          	slli	s2,a6,0x3
    29c0:	0187d793          	srli	a5,a5,0x18
    29c4:	0cf12823          	sw	a5,208(sp)
    29c8:	04412783          	lw	a5,68(sp)
    29cc:	00351513          	slli	a0,a0,0x3
    29d0:	01d85813          	srli	a6,a6,0x1d
    29d4:	00879793          	slli	a5,a5,0x8
    29d8:	0cf12c23          	sw	a5,216(sp)
    29dc:	07c12783          	lw	a5,124(sp)
    29e0:	00d59493          	slli	s1,a1,0xd
    29e4:	0133d413          	srli	s0,t2,0x13
    29e8:	016787b3          	add	a5,a5,s6
    29ec:	02f12e23          	sw	a5,60(sp)
    29f0:	04c12783          	lw	a5,76(sp)
    29f4:	0135d593          	srli	a1,a1,0x13
    29f8:	00d39393          	slli	t2,t2,0xd
    29fc:	00879613          	slli	a2,a5,0x8
    2a00:	0187d793          	srli	a5,a5,0x18
    2a04:	0cf12a23          	sw	a5,212(sp)
    2a08:	01ce87b3          	add	a5,t4,t3
    2a0c:	04f12023          	sw	a5,64(sp)
    2a10:	05012783          	lw	a5,80(sp)
    2a14:	00129293          	slli	t0,t0,0x1
    2a18:	011cdf93          	srli	t6,s9,0x11
    2a1c:	0057d793          	srli	a5,a5,0x5
    2a20:	0ef12223          	sw	a5,228(sp)
    2a24:	05012783          	lw	a5,80(sp)
    2a28:	01231313          	slli	t1,t1,0x12
    2a2c:	00e8d893          	srli	a7,a7,0xe
    2a30:	01b79793          	slli	a5,a5,0x1b
    2a34:	0ef12823          	sw	a5,240(sp)
    2a38:	014a87b3          	add	a5,s5,s4
    2a3c:	04f12a23          	sw	a5,84(sp)
    2a40:	01bc1793          	slli	a5,s8,0x1b
    2a44:	0ef12423          	sw	a5,232(sp)
    2a48:	005c5793          	srli	a5,s8,0x5
    2a4c:	0ef12623          	sw	a5,236(sp)
    2a50:	08012783          	lw	a5,128(sp)
    2a54:	00f70c33          	add	s8,a4,a5
    2a58:	05c12783          	lw	a5,92(sp)
    2a5c:	00479793          	slli	a5,a5,0x4
    2a60:	0ef12a23          	sw	a5,244(sp)
    2a64:	05c12783          	lw	a5,92(sp)
    2a68:	01c7d793          	srli	a5,a5,0x1c
    2a6c:	10f12023          	sw	a5,256(sp)
    2a70:	012987b3          	add	a5,s3,s2
    2a74:	04f12223          	sw	a5,68(sp)
    2a78:	04812783          	lw	a5,72(sp)
    2a7c:	0b012703          	lw	a4,176(sp)
    2a80:	01c7d793          	srli	a5,a5,0x1c
    2a84:	0ef12c23          	sw	a5,248(sp)
    2a88:	04812783          	lw	a5,72(sp)
    2a8c:	00479793          	slli	a5,a5,0x4
    2a90:	0ef12e23          	sw	a5,252(sp)
    2a94:	00a807b3          	add	a5,a6,a0
    2a98:	04f12423          	sw	a5,72(sp)
    2a9c:	06812783          	lw	a5,104(sp)
    2aa0:	01879793          	slli	a5,a5,0x18
    2aa4:	10f12623          	sw	a5,268(sp)
    2aa8:	06812783          	lw	a5,104(sp)
    2aac:	0087d793          	srli	a5,a5,0x8
    2ab0:	10f12c23          	sw	a5,280(sp)
    2ab4:	008487b3          	add	a5,s1,s0
    2ab8:	04f12623          	sw	a5,76(sp)
    2abc:	06412783          	lw	a5,100(sp)
    2ac0:	0087d793          	srli	a5,a5,0x8
    2ac4:	10f12823          	sw	a5,272(sp)
    2ac8:	06412783          	lw	a5,100(sp)
    2acc:	01879793          	slli	a5,a5,0x18
    2ad0:	10f12a23          	sw	a5,276(sp)
    2ad4:	00b387b3          	add	a5,t2,a1
    2ad8:	04f12823          	sw	a5,80(sp)
    2adc:	016d5793          	srli	a5,s10,0x16
    2ae0:	10f12223          	sw	a5,260(sp)
    2ae4:	00ad1793          	slli	a5,s10,0xa
    2ae8:	10f12423          	sw	a5,264(sp)
    2aec:	08412783          	lw	a5,132(sp)
    2af0:	0b812583          	lw	a1,184(sp)
    2af4:	005787b3          	add	a5,a5,t0
    2af8:	04f12c23          	sw	a5,88(sp)
    2afc:	06012783          	lw	a5,96(sp)
    2b00:	0167d293          	srli	t0,a5,0x16
    2b04:	00a79d13          	slli	s10,a5,0xa
    2b08:	08c12783          	lw	a5,140(sp)
    2b0c:	017787b3          	add	a5,a5,s7
    2b10:	04f12e23          	sw	a5,92(sp)
    2b14:	07012783          	lw	a5,112(sp)
    2b18:	0117da93          	srli	s5,a5,0x11
    2b1c:	00f79f13          	slli	t5,a5,0xf
    2b20:	0ac12783          	lw	a5,172(sp)
    2b24:	01ef8f33          	add	t5,t6,t5
    2b28:	00e787b3          	add	a5,a5,a4
    2b2c:	0b412703          	lw	a4,180(sp)
    2b30:	06f12023          	sw	a5,96(sp)
    2b34:	00fc9793          	slli	a5,s9,0xf
    2b38:	00b70733          	add	a4,a4,a1
    2b3c:	06e12223          	sw	a4,100(sp)
    2b40:	09812703          	lw	a4,152(sp)
    2b44:	0af12623          	sw	a5,172(sp)
    2b48:	01e71c93          	slli	s9,a4,0x1e
    2b4c:	00275e13          	srli	t3,a4,0x2
    2b50:	0dc12703          	lw	a4,220(sp)
    2b54:	0e012583          	lw	a1,224(sp)
    2b58:	00b70733          	add	a4,a4,a1
    2b5c:	06e12c23          	sw	a4,120(sp)
    2b60:	09412703          	lw	a4,148(sp)
    2b64:	00275713          	srli	a4,a4,0x2
    2b68:	0ae12823          	sw	a4,176(sp)
    2b6c:	09412703          	lw	a4,148(sp)
    2b70:	01e71e93          	slli	t4,a4,0x1e
    2b74:	00688733          	add	a4,a7,t1
    2b78:	06e12e23          	sw	a4,124(sp)
    2b7c:	06c12703          	lw	a4,108(sp)
    2b80:	01ce8e33          	add	t3,t4,t3
    2b84:	fffc4e93          	not	t4,s8
    2b88:	01771713          	slli	a4,a4,0x17
    2b8c:	0ae12a23          	sw	a4,180(sp)
    2b90:	06c12703          	lw	a4,108(sp)
    2b94:	00975893          	srli	a7,a4,0x9
    2b98:	0bc12703          	lw	a4,188(sp)
    2b9c:	00d70733          	add	a4,a4,a3
    2ba0:	06e12423          	sw	a4,104(sp)
    2ba4:	07412703          	lw	a4,116(sp)
    2ba8:	0cc12683          	lw	a3,204(sp)
    2bac:	00975b13          	srli	s6,a4,0x9
    2bb0:	01771313          	slli	t1,a4,0x17
    2bb4:	0c012703          	lw	a4,192(sp)
    2bb8:	011308b3          	add	a7,t1,a7
    2bbc:	00d70733          	add	a4,a4,a3
    2bc0:	06e12623          	sw	a4,108(sp)
    2bc4:	0a812703          	lw	a4,168(sp)
    2bc8:	0d812683          	lw	a3,216(sp)
    2bcc:	01e75a13          	srli	s4,a4,0x1e
    2bd0:	00271513          	slli	a0,a4,0x2
    2bd4:	0d012703          	lw	a4,208(sp)
    2bd8:	00c70733          	add	a4,a4,a2
    2bdc:	06e12823          	sw	a4,112(sp)
    2be0:	0a412703          	lw	a4,164(sp)
    2be4:	00271993          	slli	s3,a4,0x2
    2be8:	01e75813          	srli	a6,a4,0x1e
    2bec:	0d412703          	lw	a4,212(sp)
    2bf0:	00a80533          	add	a0,a6,a0
    2bf4:	00d70733          	add	a4,a4,a3
    2bf8:	06e12a23          	sw	a4,116(sp)
    2bfc:	0a012703          	lw	a4,160(sp)
    2c00:	0e812683          	lw	a3,232(sp)
    2c04:	00771913          	slli	s2,a4,0x7
    2c08:	01975613          	srli	a2,a4,0x19
    2c0c:	0e412703          	lw	a4,228(sp)
    2c10:	00d70733          	add	a4,a4,a3
    2c14:	08e12023          	sw	a4,128(sp)
    2c18:	09c12703          	lw	a4,156(sp)
    2c1c:	0f012683          	lw	a3,240(sp)
    2c20:	01975493          	srli	s1,a4,0x19
    2c24:	00771593          	slli	a1,a4,0x7
    2c28:	0ec12703          	lw	a4,236(sp)
    2c2c:	00c58633          	add	a2,a1,a2
    2c30:	fffdc593          	not	a1,s11
    2c34:	00d70733          	add	a4,a4,a3
    2c38:	08e12223          	sw	a4,132(sp)
    2c3c:	0f412683          	lw	a3,244(sp)
    2c40:	08812703          	lw	a4,136(sp)
    2c44:	0f812383          	lw	t2,248(sp)
    2c48:	10012783          	lw	a5,256(sp)
    2c4c:	0fc12b83          	lw	s7,252(sp)
    2c50:	007686b3          	add	a3,a3,t2
    2c54:	08d12423          	sw	a3,136(sp)
    2c58:	00fb8bb3          	add	s7,s7,a5
    2c5c:	09712623          	sw	s7,140(sp)
    2c60:	10c12783          	lw	a5,268(sp)
    2c64:	11012b83          	lw	s7,272(sp)
    2c68:	09012683          	lw	a3,144(sp)
    2c6c:	00971413          	slli	s0,a4,0x9
    2c70:	017787b3          	add	a5,a5,s7
    2c74:	0176d393          	srli	t2,a3,0x17
    2c78:	11812b83          	lw	s7,280(sp)
    2c7c:	00969693          	slli	a3,a3,0x9
    2c80:	08f12c23          	sw	a5,152(sp)
    2c84:	01775713          	srli	a4,a4,0x17
    2c88:	11412783          	lw	a5,276(sp)
    2c8c:	00e68733          	add	a4,a3,a4
    2c90:	0ae12c23          	sw	a4,184(sp)
    2c94:	02012703          	lw	a4,32(sp)
    2c98:	017787b3          	add	a5,a5,s7
    2c9c:	08f12e23          	sw	a5,156(sp)
    2ca0:	10412783          	lw	a5,260(sp)
    2ca4:	fff74313          	not	t1,a4
    2ca8:	01812703          	lw	a4,24(sp)
    2cac:	01a78d33          	add	s10,a5,s10
    2cb0:	0b112423          	sw	a7,168(sp)
    2cb4:	10812783          	lw	a5,264(sp)
    2cb8:	013a08b3          	add	a7,s4,s3
    2cbc:	0b112e23          	sw	a7,188(sp)
    2cc0:	fff74893          	not	a7,a4
    2cc4:	01012703          	lw	a4,16(sp)
    2cc8:	00f287b3          	add	a5,t0,a5
    2ccc:	0bc12023          	sw	t3,160(sp)
    2cd0:	0ca12023          	sw	a0,192(sp)
    2cd4:	0b412e03          	lw	t3,180(sp)
    2cd8:	00990533          	add	a0,s2,s1
    2cdc:	08f12823          	sw	a5,144(sp)
    2ce0:	0ac12783          	lw	a5,172(sp)
    2ce4:	0aa12623          	sw	a0,172(sp)
    2ce8:	fff74513          	not	a0,a4
    2cec:	02812703          	lw	a4,40(sp)
    2cf0:	016e0e33          	add	t3,t3,s6
    2cf4:	09e12a23          	sw	t5,148(sp)
    2cf8:	0b012f03          	lw	t5,176(sp)
    2cfc:	0ac12823          	sw	a2,176(sp)
    2d00:	00740633          	add	a2,s0,t2
    2d04:	0bc12223          	sw	t3,164(sp)
    2d08:	0ac12a23          	sw	a2,180(sp)
    2d0c:	fff74813          	not	a6,a4
    2d10:	01c12703          	lw	a4,28(sp)
    2d14:	00fa87b3          	add	a5,s5,a5
    2d18:	01ec8cb3          	add	s9,s9,t5
    2d1c:	fff74a13          	not	s4,a4
    2d20:	02412703          	lw	a4,36(sp)
    2d24:	01012e03          	lw	t3,16(sp)
    2d28:	01412b83          	lw	s7,20(sp)
    2d2c:	fff74613          	not	a2,a4
    2d30:	01412703          	lw	a4,20(sp)
    2d34:	01c5f5b3          	and	a1,a1,t3
    2d38:	01b87833          	and	a6,a6,s11
    2d3c:	fff74693          	not	a3,a4
    2d40:	02c12703          	lw	a4,44(sp)
    2d44:	fff74993          	not	s3,a4
    2d48:	03012703          	lw	a4,48(sp)
    2d4c:	fff74493          	not	s1,a4
    2d50:	03412703          	lw	a4,52(sp)
    2d54:	0174f4b3          	and	s1,s1,s7
    2d58:	fff74413          	not	s0,a4
    2d5c:	03c12703          	lw	a4,60(sp)
    2d60:	fff74b13          	not	s6,a4
    2d64:	04412703          	lw	a4,68(sp)
    2d68:	fff74a93          	not	s5,a4
    2d6c:	05412703          	lw	a4,84(sp)
    2d70:	fff74393          	not	t2,a4
    2d74:	04c12703          	lw	a4,76(sp)
    2d78:	fff74f93          	not	t6,a4
    2d7c:	04012703          	lw	a4,64(sp)
    2d80:	fff74913          	not	s2,a4
    2d84:	04812703          	lw	a4,72(sp)
    2d88:	fff74f13          	not	t5,a4
    2d8c:	03812703          	lw	a4,56(sp)
    2d90:	fff74293          	not	t0,a4
    2d94:	02812703          	lw	a4,40(sp)
    2d98:	00e37333          	and	t1,t1,a4
    2d9c:	02012703          	lw	a4,32(sp)
    2da0:	00e8f8b3          	and	a7,a7,a4
    2da4:	0c412703          	lw	a4,196(sp)
    2da8:	01c74733          	xor	a4,a4,t3
    2dac:	02412e03          	lw	t3,36(sp)
    2db0:	0ce12223          	sw	a4,196(sp)
    2db4:	01812703          	lw	a4,24(sp)
    2db8:	01ca7a33          	and	s4,s4,t3
    2dbc:	0c812e03          	lw	t3,200(sp)
    2dc0:	00e57533          	and	a0,a0,a4
    2dc4:	05012703          	lw	a4,80(sp)
    2dc8:	017e4e33          	xor	t3,t3,s7
    2dcc:	01c12823          	sw	t3,16(sp)
    2dd0:	00c12e03          	lw	t3,12(sp)
    2dd4:	03c12b83          	lw	s7,60(sp)
    2dd8:	01b54533          	xor	a0,a0,s11
    2ddc:	010e0e13          	addi	t3,t3,16 # 1010 <pqcrystals_dilithium2_ref_polyt0_unpack+0x10>
    2de0:	01c12623          	sw	t3,12(sp)
    2de4:	02c12e03          	lw	t3,44(sp)
    2de8:	01747433          	and	s0,s0,s7
    2dec:	04412b83          	lw	s7,68(sp)
    2df0:	01c67633          	and	a2,a2,t3
    2df4:	01c12e03          	lw	t3,28(sp)
    2df8:	017b7b33          	and	s6,s6,s7
    2dfc:	fff74713          	not	a4,a4
    2e00:	01c6f6b3          	and	a3,a3,t3
    2e04:	03012e03          	lw	t3,48(sp)
    2e08:	01877733          	and	a4,a4,s8
    2e0c:	01c9f9b3          	and	s3,s3,t3
    2e10:	05812e03          	lw	t3,88(sp)
    2e14:	04c12b83          	lw	s7,76(sp)
    2e18:	0ca12a23          	sw	a0,212(sp)
    2e1c:	fffe4e13          	not	t3,t3
    2e20:	017afab3          	and	s5,s5,s7
    2e24:	03412b83          	lw	s7,52(sp)
    2e28:	07012503          	lw	a0,112(sp)
    2e2c:	0173f3b3          	and	t2,t2,s7
    2e30:	05412b83          	lw	s7,84(sp)
    2e34:	fff54513          	not	a0,a0
    2e38:	017fffb3          	and	t6,t6,s7
    2e3c:	04812b83          	lw	s7,72(sp)
    2e40:	01797933          	and	s2,s2,s7
    2e44:	05012b83          	lw	s7,80(sp)
    2e48:	017f7f33          	and	t5,t5,s7
    2e4c:	04012b83          	lw	s7,64(sp)
    2e50:	0172f2b3          	and	t0,t0,s7
    2e54:	03812b83          	lw	s7,56(sp)
    2e58:	0182cc33          	xor	s8,t0,s8
    2e5c:	017efeb3          	and	t4,t4,s7
    2e60:	06012b83          	lw	s7,96(sp)
    2e64:	017e7e33          	and	t3,t3,s7
    2e68:	01812b83          	lw	s7,24(sp)
    2e6c:	01734333          	xor	t1,t1,s7
    2e70:	00612a23          	sw	t1,20(sp)
    2e74:	06012303          	lw	t1,96(sp)
    2e78:	06812b83          	lw	s7,104(sp)
    2e7c:	fff34313          	not	t1,t1
    2e80:	01737333          	and	t1,t1,s7
    2e84:	0c412b83          	lw	s7,196(sp)
    2e88:	011bc8b3          	xor	a7,s7,a7
    2e8c:	0d112223          	sw	a7,196(sp)
    2e90:	06812883          	lw	a7,104(sp)
    2e94:	07012b83          	lw	s7,112(sp)
    2e98:	fff8c893          	not	a7,a7
    2e9c:	0178f8b3          	and	a7,a7,s7
    2ea0:	02012b83          	lw	s7,32(sp)
    2ea4:	01784833          	xor	a6,a6,s7
    2ea8:	0d012623          	sw	a6,204(sp)
    2eac:	07812803          	lw	a6,120(sp)
    2eb0:	05812b83          	lw	s7,88(sp)
    2eb4:	fff84813          	not	a6,a6
    2eb8:	01787833          	and	a6,a6,s7
    2ebc:	07812b83          	lw	s7,120(sp)
    2ec0:	01757533          	and	a0,a0,s7
    2ec4:	02812b83          	lw	s7,40(sp)
    2ec8:	0175c5b3          	xor	a1,a1,s7
    2ecc:	02b12023          	sw	a1,32(sp)
    2ed0:	06412583          	lw	a1,100(sp)
    2ed4:	06c12b83          	lw	s7,108(sp)
    2ed8:	fff5c593          	not	a1,a1
    2edc:	0175f5b3          	and	a1,a1,s7
    2ee0:	01012b83          	lw	s7,16(sp)
    2ee4:	014bca33          	xor	s4,s7,s4
    2ee8:	0d412423          	sw	s4,200(sp)
    2eec:	06c12a03          	lw	s4,108(sp)
    2ef0:	07412b83          	lw	s7,116(sp)
    2ef4:	fffa4a13          	not	s4,s4
    2ef8:	017a7a33          	and	s4,s4,s7
    2efc:	01c12b83          	lw	s7,28(sp)
    2f00:	01764633          	xor	a2,a2,s7
    2f04:	00c12c23          	sw	a2,24(sp)
    2f08:	05c12603          	lw	a2,92(sp)
    2f0c:	06412b83          	lw	s7,100(sp)
    2f10:	fff64613          	not	a2,a2
    2f14:	01767633          	and	a2,a2,s7
    2f18:	03012b83          	lw	s7,48(sp)
    2f1c:	0176c6b3          	xor	a3,a3,s7
    2f20:	0cd12c23          	sw	a3,216(sp)
    2f24:	07c12683          	lw	a3,124(sp)
    2f28:	05c12b83          	lw	s7,92(sp)
    2f2c:	fff6c693          	not	a3,a3
    2f30:	0176f6b3          	and	a3,a3,s7
    2f34:	02412b83          	lw	s7,36(sp)
    2f38:	0179c9b3          	xor	s3,s3,s7
    2f3c:	0d312823          	sw	s3,208(sp)
    2f40:	07412983          	lw	s3,116(sp)
    2f44:	07c12b83          	lw	s7,124(sp)
    2f48:	fff9c993          	not	s3,s3
    2f4c:	0179f9b3          	and	s3,s3,s7
    2f50:	01312823          	sw	s3,16(sp)
    2f54:	02c12983          	lw	s3,44(sp)
    2f58:	08812b83          	lw	s7,136(sp)
    2f5c:	0134c9b3          	xor	s3,s1,s3
    2f60:	08012483          	lw	s1,128(sp)
    2f64:	fff4c493          	not	s1,s1
    2f68:	0174f4b3          	and	s1,s1,s7
    2f6c:	05412b83          	lw	s7,84(sp)
    2f70:	01744433          	xor	s0,s0,s7
    2f74:	03412b83          	lw	s7,52(sp)
    2f78:	02812423          	sw	s0,40(sp)
    2f7c:	08812403          	lw	s0,136(sp)
    2f80:	017b4b33          	xor	s6,s6,s7
    2f84:	03c12b83          	lw	s7,60(sp)
    2f88:	0d612e23          	sw	s6,220(sp)
    2f8c:	fffd4b13          	not	s6,s10
    2f90:	017acab3          	xor	s5,s5,s7
    2f94:	01512e23          	sw	s5,28(sp)
    2f98:	09812a83          	lw	s5,152(sp)
    2f9c:	08012b83          	lw	s7,128(sp)
    2fa0:	00fb7b33          	and	s6,s6,a5
    2fa4:	fffaca93          	not	s5,s5
    2fa8:	017afab3          	and	s5,s5,s7
    2fac:	04c12b83          	lw	s7,76(sp)
    2fb0:	00facab3          	xor	s5,s5,a5
    2fb4:	fff44413          	not	s0,s0
    2fb8:	0173c3b3          	xor	t2,t2,s7
    2fbc:	09812b83          	lw	s7,152(sp)
    2fc0:	0e712223          	sw	t2,228(sp)
    2fc4:	fff7c393          	not	t2,a5
    2fc8:	0173f3b3          	and	t2,t2,s7
    2fcc:	04412b83          	lw	s7,68(sp)
    2fd0:	01a3c7b3          	xor	a5,t2,s10
    2fd4:	01a47433          	and	s0,s0,s10
    2fd8:	017fcfb3          	xor	t6,t6,s7
    2fdc:	03f12823          	sw	t6,48(sp)
    2fe0:	08c12f83          	lw	t6,140(sp)
    2fe4:	09012b83          	lw	s7,144(sp)
    2fe8:	ffffcf93          	not	t6,t6
    2fec:	017fffb3          	and	t6,t6,s7
    2ff0:	03812b83          	lw	s7,56(sp)
    2ff4:	01794933          	xor	s2,s2,s7
    2ff8:	0f212023          	sw	s2,224(sp)
    2ffc:	09012903          	lw	s2,144(sp)
    3000:	09412b83          	lw	s7,148(sp)
    3004:	09c12283          	lw	t0,156(sp)
    3008:	fff94913          	not	s2,s2
    300c:	01797933          	and	s2,s2,s7
    3010:	04012b83          	lw	s7,64(sp)
    3014:	fff2c293          	not	t0,t0
    3018:	017f4f33          	xor	t5,t5,s7
    301c:	03e12223          	sw	t5,36(sp)
    3020:	08412f03          	lw	t5,132(sp)
    3024:	08c12b83          	lw	s7,140(sp)
    3028:	ffff4f13          	not	t5,t5
    302c:	017f7f33          	and	t5,t5,s7
    3030:	08412b83          	lw	s7,132(sp)
    3034:	0172f2b3          	and	t0,t0,s7
    3038:	05012b83          	lw	s7,80(sp)
    303c:	017eceb3          	xor	t4,t4,s7
    3040:	0fd12423          	sw	t4,232(sp)
    3044:	09412e83          	lw	t4,148(sp)
    3048:	09c12b83          	lw	s7,156(sp)
    304c:	fffece93          	not	t4,t4
    3050:	017efeb3          	and	t4,t4,s7
    3054:	04812b83          	lw	s7,72(sp)
    3058:	01774733          	xor	a4,a4,s7
    305c:	0a412b83          	lw	s7,164(sp)
    3060:	02e12a23          	sw	a4,52(sp)
    3064:	fffcc713          	not	a4,s9
    3068:	01777733          	and	a4,a4,s7
    306c:	07812b83          	lw	s7,120(sp)
    3070:	04e12223          	sw	a4,68(sp)
    3074:	017e4e33          	xor	t3,t3,s7
    3078:	07c12c23          	sw	t3,120(sp)
    307c:	0a412e03          	lw	t3,164(sp)
    3080:	0ac12b83          	lw	s7,172(sp)
    3084:	fffe4e13          	not	t3,t3
    3088:	017e7e33          	and	t3,t3,s7
    308c:	05812b83          	lw	s7,88(sp)
    3090:	01734333          	xor	t1,t1,s7
    3094:	04612623          	sw	t1,76(sp)
    3098:	0ac12303          	lw	t1,172(sp)
    309c:	0b412b83          	lw	s7,180(sp)
    30a0:	fff34313          	not	t1,t1
    30a4:	01737333          	and	t1,t1,s7
    30a8:	06012b83          	lw	s7,96(sp)
    30ac:	0178c8b3          	xor	a7,a7,s7
    30b0:	07012b83          	lw	s7,112(sp)
    30b4:	07112023          	sw	a7,96(sp)
    30b8:	0bc12883          	lw	a7,188(sp)
    30bc:	01784833          	xor	a6,a6,s7
    30c0:	05012a23          	sw	a6,84(sp)
    30c4:	0b412803          	lw	a6,180(sp)
    30c8:	0bc12b83          	lw	s7,188(sp)
    30cc:	fff8c893          	not	a7,a7
    30d0:	fff84813          	not	a6,a6
    30d4:	01787833          	and	a6,a6,s7
    30d8:	06812b83          	lw	s7,104(sp)
    30dc:	0198f8b3          	and	a7,a7,s9
    30e0:	01754533          	xor	a0,a0,s7
    30e4:	04a12823          	sw	a0,80(sp)
    30e8:	0a812503          	lw	a0,168(sp)
    30ec:	05c12703          	lw	a4,92(sp)
    30f0:	0b012b83          	lw	s7,176(sp)
    30f4:	fff54513          	not	a0,a0
    30f8:	0b812d83          	lw	s11,184(sp)
    30fc:	01757533          	and	a0,a0,s7
    3100:	00e5cbb3          	xor	s7,a1,a4
    3104:	0b012583          	lw	a1,176(sp)
    3108:	06f12423          	sw	a5,104(sp)
    310c:	08412783          	lw	a5,132(sp)
    3110:	fff5c593          	not	a1,a1
    3114:	01b5f5b3          	and	a1,a1,s11
    3118:	06412d83          	lw	s11,100(sp)
    311c:	06c12703          	lw	a4,108(sp)
    3120:	00ffc7b3          	xor	a5,t6,a5
    3124:	01ba4a33          	xor	s4,s4,s11
    3128:	05412e23          	sw	s4,92(sp)
    312c:	0a012a03          	lw	s4,160(sp)
    3130:	fffa4d93          	not	s11,s4
    3134:	0a812a03          	lw	s4,168(sp)
    3138:	014dfdb3          	and	s11,s11,s4
    313c:	07c12a03          	lw	s4,124(sp)
    3140:	06f12e23          	sw	a5,124(sp)
    3144:	08c12783          	lw	a5,140(sp)
    3148:	01464633          	xor	a2,a2,s4
    314c:	06c12223          	sw	a2,100(sp)
    3150:	0c012603          	lw	a2,192(sp)
    3154:	0a012a03          	lw	s4,160(sp)
    3158:	00f94933          	xor	s2,s2,a5
    315c:	fff64613          	not	a2,a2
    3160:	01467633          	and	a2,a2,s4
    3164:	07412a03          	lw	s4,116(sp)
    3168:	09c12783          	lw	a5,156(sp)
    316c:	0146c6b3          	xor	a3,a3,s4
    3170:	02d12c23          	sw	a3,56(sp)
    3174:	0b812683          	lw	a3,184(sp)
    3178:	0c012a03          	lw	s4,192(sp)
    317c:	00ff47b3          	xor	a5,t5,a5
    3180:	fff6c693          	not	a3,a3
    3184:	0146f6b3          	and	a3,a3,s4
    3188:	01012a03          	lw	s4,16(sp)
    318c:	04f12023          	sw	a5,64(sp)
    3190:	09412783          	lw	a5,148(sp)
    3194:	00ea4a33          	xor	s4,s4,a4
    3198:	09812703          	lw	a4,152(sp)
    319c:	03412623          	sw	s4,44(sp)
    31a0:	00f2c2b3          	xor	t0,t0,a5
    31a4:	00e4c733          	xor	a4,s1,a4
    31a8:	02e12e23          	sw	a4,60(sp)
    31ac:	08012703          	lw	a4,128(sp)
    31b0:	00e44733          	xor	a4,s0,a4
    31b4:	06e12a23          	sw	a4,116(sp)
    31b8:	08812703          	lw	a4,136(sp)
    31bc:	09012783          	lw	a5,144(sp)
    31c0:	00eb4b33          	xor	s6,s6,a4
    31c4:	00fec7b3          	xor	a5,t4,a5
    31c8:	04412703          	lw	a4,68(sp)
    31cc:	06f12623          	sw	a5,108(sp)
    31d0:	0bc12783          	lw	a5,188(sp)
    31d4:	00f747b3          	xor	a5,a4,a5
    31d8:	019e4733          	xor	a4,t3,s9
    31dc:	04e12223          	sw	a4,68(sp)
    31e0:	0a412703          	lw	a4,164(sp)
    31e4:	00e34733          	xor	a4,t1,a4
    31e8:	06e12823          	sw	a4,112(sp)
    31ec:	0b412703          	lw	a4,180(sp)
    31f0:	00e8c733          	xor	a4,a7,a4
    31f4:	08e12223          	sw	a4,132(sp)
    31f8:	0ac12703          	lw	a4,172(sp)
    31fc:	00e84eb3          	xor	t4,a6,a4
    3200:	0a012703          	lw	a4,160(sp)
    3204:	00e54733          	xor	a4,a0,a4
    3208:	04e12423          	sw	a4,72(sp)
    320c:	0a812703          	lw	a4,168(sp)
    3210:	00e5c733          	xor	a4,a1,a4
    3214:	08e12023          	sw	a4,128(sp)
    3218:	0c012703          	lw	a4,192(sp)
    321c:	00edcdb3          	xor	s11,s11,a4
    3220:	0b812703          	lw	a4,184(sp)
    3224:	00e64733          	xor	a4,a2,a4
    3228:	08e12423          	sw	a4,136(sp)
    322c:	0b012703          	lw	a4,176(sp)
    3230:	00e6ca33          	xor	s4,a3,a4
    3234:	00c12683          	lw	a3,12(sp)
    3238:	00005737          	lui	a4,0x5
    323c:	79870713          	addi	a4,a4,1944 # 5798 <KeccakF_RoundConstants+0xc0>
    3240:	00d70463          	beq	a4,a3,3248 <KeccakF1600_StatePermute+0x1b10>
    3244:	eb0fe06f          	j	18f4 <KeccakF1600_StatePermute+0x1bc>
    3248:	11c12503          	lw	a0,284(sp)
    324c:	00078713          	mv	a4,a5
    3250:	0c412783          	lw	a5,196(sp)
    3254:	01352e23          	sw	s3,28(a0)
    3258:	04c12d03          	lw	s10,76(sp)
    325c:	00f52023          	sw	a5,0(a0)
    3260:	0c812783          	lw	a5,200(sp)
    3264:	05412c83          	lw	s9,84(sp)
    3268:	000c0693          	mv	a3,s8
    326c:	00f52223          	sw	a5,4(a0)
    3270:	01412783          	lw	a5,20(sp)
    3274:	05012c03          	lw	s8,80(sp)
    3278:	00f52423          	sw	a5,8(a0)
    327c:	01812783          	lw	a5,24(sp)
    3280:	00f52623          	sw	a5,12(a0)
    3284:	0cc12783          	lw	a5,204(sp)
    3288:	00f52823          	sw	a5,16(a0)
    328c:	0d012783          	lw	a5,208(sp)
    3290:	00f52a23          	sw	a5,20(a0)
    3294:	02012783          	lw	a5,32(sp)
    3298:	00f52c23          	sw	a5,24(a0)
    329c:	0d412783          	lw	a5,212(sp)
    32a0:	02f52023          	sw	a5,32(a0)
    32a4:	0d812783          	lw	a5,216(sp)
    32a8:	02f52223          	sw	a5,36(a0)
    32ac:	0dc12783          	lw	a5,220(sp)
    32b0:	02f52423          	sw	a5,40(a0)
    32b4:	0e012783          	lw	a5,224(sp)
    32b8:	02f52623          	sw	a5,44(a0)
    32bc:	01c12783          	lw	a5,28(sp)
    32c0:	02f52823          	sw	a5,48(a0)
    32c4:	02412783          	lw	a5,36(sp)
    32c8:	02f52a23          	sw	a5,52(a0)
    32cc:	03012783          	lw	a5,48(sp)
    32d0:	02f52c23          	sw	a5,56(a0)
    32d4:	03412783          	lw	a5,52(sp)
    32d8:	05a52823          	sw	s10,80(a0)
    32dc:	05752a23          	sw	s7,84(a0)
    32e0:	02f52e23          	sw	a5,60(a0)
    32e4:	0e412783          	lw	a5,228(sp)
    32e8:	07852023          	sw	s8,96(a0)
    32ec:	07952423          	sw	s9,104(a0)
    32f0:	04f52023          	sw	a5,64(a0)
    32f4:	0e812783          	lw	a5,232(sp)
    32f8:	09652023          	sw	s6,128(a0)
    32fc:	09252223          	sw	s2,132(a0)
    3300:	04f52223          	sw	a5,68(a0)
    3304:	02812783          	lw	a5,40(sp)
    3308:	04d52623          	sw	a3,76(a0)
    330c:	04f52423          	sw	a5,72(a0)
    3310:	06012783          	lw	a5,96(sp)
    3314:	04f52c23          	sw	a5,88(a0)
    3318:	05c12783          	lw	a5,92(sp)
    331c:	04f52e23          	sw	a5,92(a0)
    3320:	02c12783          	lw	a5,44(sp)
    3324:	06f52223          	sw	a5,100(a0)
    3328:	03812783          	lw	a5,56(sp)
    332c:	06f52623          	sw	a5,108(a0)
    3330:	07812783          	lw	a5,120(sp)
    3334:	06f52823          	sw	a5,112(a0)
    3338:	06412783          	lw	a5,100(sp)
    333c:	06f52a23          	sw	a5,116(a0)
    3340:	07412783          	lw	a5,116(sp)
    3344:	06f52c23          	sw	a5,120(a0)
    3348:	07c12783          	lw	a5,124(sp)
    334c:	06f52e23          	sw	a5,124(a0)
    3350:	06812783          	lw	a5,104(sp)
    3354:	08f52423          	sw	a5,136(a0)
    3358:	06c12783          	lw	a5,108(sp)
    335c:	14c12403          	lw	s0,332(sp)
    3360:	14812483          	lw	s1,328(sp)
    3364:	08f52623          	sw	a5,140(a0)
    3368:	03c12783          	lw	a5,60(sp)
    336c:	14412903          	lw	s2,324(sp)
    3370:	14012983          	lw	s3,320(sp)
    3374:	08f52c23          	sw	a5,152(a0)
    3378:	04012783          	lw	a5,64(sp)
    337c:	13412b03          	lw	s6,308(sp)
    3380:	13012b83          	lw	s7,304(sp)
    3384:	08f52e23          	sw	a5,156(a0)
    3388:	04412783          	lw	a5,68(sp)
    338c:	09552823          	sw	s5,144(a0)
    3390:	0b452a23          	sw	s4,180(a0)
    3394:	0af52023          	sw	a5,160(a0)
    3398:	04812783          	lw	a5,72(sp)
    339c:	13c12a03          	lw	s4,316(sp)
    33a0:	13812a83          	lw	s5,312(sp)
    33a4:	0af52223          	sw	a5,164(a0)
    33a8:	07012783          	lw	a5,112(sp)
    33ac:	0db52223          	sw	s11,196(a0)
    33b0:	08552a23          	sw	t0,148(a0)
    33b4:	0af52423          	sw	a5,168(a0)
    33b8:	08012783          	lw	a5,128(sp)
    33bc:	0bd52823          	sw	t4,176(a0)
    33c0:	0ce52023          	sw	a4,192(a0)
    33c4:	0af52623          	sw	a5,172(a0)
    33c8:	08412783          	lw	a5,132(sp)
    33cc:	0af52c23          	sw	a5,184(a0)
    33d0:	08812783          	lw	a5,136(sp)
    33d4:	0af52e23          	sw	a5,188(a0)
    33d8:	12c12c03          	lw	s8,300(sp)
    33dc:	12812c83          	lw	s9,296(sp)
    33e0:	12412d03          	lw	s10,292(sp)
    33e4:	12012d83          	lw	s11,288(sp)
    33e8:	15010113          	addi	sp,sp,336
    33ec:	00008067          	ret

000033f0 <keccak_squeeze.constprop.1>:
    33f0:	fd010113          	addi	sp,sp,-48
    33f4:	02812423          	sw	s0,40(sp)
    33f8:	01412c23          	sw	s4,24(sp)
    33fc:	01512a23          	sw	s5,20(sp)
    3400:	02112623          	sw	ra,44(sp)
    3404:	02912223          	sw	s1,36(sp)
    3408:	0076f713          	andi	a4,a3,7
    340c:	00068a93          	mv	s5,a3
    3410:	00050413          	mv	s0,a0
    3414:	00058a13          	mv	s4,a1
    3418:	1a070063          	beqz	a4,35b8 <keccak_squeeze.constprop.1+0x1c8>
    341c:	ff86f693          	andi	a3,a3,-8
    3420:	00d606b3          	add	a3,a2,a3
    3424:	0046a783          	lw	a5,4(a3)
    3428:	0006a803          	lw	a6,0(a3)
    342c:	0087d513          	srli	a0,a5,0x8
    3430:	0107d593          	srli	a1,a5,0x10
    3434:	0187d693          	srli	a3,a5,0x18
    3438:	00f10623          	sb	a5,12(sp)
    343c:	01012423          	sw	a6,8(sp)
    3440:	00a106a3          	sb	a0,13(sp)
    3444:	00b10723          	sb	a1,14(sp)
    3448:	00d107a3          	sb	a3,15(sp)
    344c:	320a0e63          	beqz	s4,3788 <keccak_squeeze.constprop.1+0x398>
    3450:	03212023          	sw	s2,32(sp)
    3454:	002707b3          	add	a5,a4,sp
    3458:	0087c503          	lbu	a0,8(a5)
    345c:	fffa0593          	addi	a1,s4,-1
    3460:	00a40023          	sb	a0,0(s0)
    3464:	34058063          	beqz	a1,37a4 <keccak_squeeze.constprop.1+0x3b4>
    3468:	ff970513          	addi	a0,a4,-7
    346c:	32050c63          	beqz	a0,37a4 <keccak_squeeze.constprop.1+0x3b4>
    3470:	002707b3          	add	a5,a4,sp
    3474:	0097c503          	lbu	a0,9(a5)
    3478:	ffea0593          	addi	a1,s4,-2
    347c:	00a400a3          	sb	a0,1(s0)
    3480:	34058c63          	beqz	a1,37d8 <keccak_squeeze.constprop.1+0x3e8>
    3484:	ffa70513          	addi	a0,a4,-6
    3488:	34050863          	beqz	a0,37d8 <keccak_squeeze.constprop.1+0x3e8>
    348c:	002707b3          	add	a5,a4,sp
    3490:	00a7c503          	lbu	a0,10(a5)
    3494:	ffda0593          	addi	a1,s4,-3
    3498:	00a40123          	sb	a0,2(s0)
    349c:	34058663          	beqz	a1,37e8 <keccak_squeeze.constprop.1+0x3f8>
    34a0:	ffb70513          	addi	a0,a4,-5
    34a4:	34050263          	beqz	a0,37e8 <keccak_squeeze.constprop.1+0x3f8>
    34a8:	002707b3          	add	a5,a4,sp
    34ac:	00b7c503          	lbu	a0,11(a5)
    34b0:	ffca0593          	addi	a1,s4,-4
    34b4:	00a401a3          	sb	a0,3(s0)
    34b8:	34058063          	beqz	a1,37f8 <keccak_squeeze.constprop.1+0x408>
    34bc:	ffc70513          	addi	a0,a4,-4
    34c0:	32050c63          	beqz	a0,37f8 <keccak_squeeze.constprop.1+0x408>
    34c4:	002707b3          	add	a5,a4,sp
    34c8:	00c7c503          	lbu	a0,12(a5)
    34cc:	ffba0593          	addi	a1,s4,-5
    34d0:	00a40223          	sb	a0,4(s0)
    34d4:	2e058063          	beqz	a1,37b4 <keccak_squeeze.constprop.1+0x3c4>
    34d8:	ffd70513          	addi	a0,a4,-3
    34dc:	2c050c63          	beqz	a0,37b4 <keccak_squeeze.constprop.1+0x3c4>
    34e0:	002707b3          	add	a5,a4,sp
    34e4:	00d7c583          	lbu	a1,13(a5)
    34e8:	ffaa0793          	addi	a5,s4,-6
    34ec:	00b402a3          	sb	a1,5(s0)
    34f0:	30078c63          	beqz	a5,3808 <keccak_squeeze.constprop.1+0x418>
    34f4:	ffe70713          	addi	a4,a4,-2
    34f8:	30070863          	beqz	a4,3808 <keccak_squeeze.constprop.1+0x418>
    34fc:	00d40323          	sb	a3,6(s0)
    3500:	007a8a93          	addi	s5,s5,7
    3504:	ff9a0a13          	addi	s4,s4,-7
    3508:	00740413          	addi	s0,s0,7
    350c:	00060913          	mv	s2,a2
    3510:	0a0a8a63          	beqz	s5,35c4 <keccak_squeeze.constprop.1+0x1d4>
    3514:	08800513          	li	a0,136
    3518:	41550533          	sub	a0,a0,s5
    351c:	24aa6a63          	bltu	s4,a0,3770 <keccak_squeeze.constprop.1+0x380>
    3520:	00355793          	srli	a5,a0,0x3
    3524:	06078263          	beqz	a5,3588 <keccak_squeeze.constprop.1+0x198>
    3528:	00379793          	slli	a5,a5,0x3
    352c:	ff8af713          	andi	a4,s5,-8
    3530:	008785b3          	add	a1,a5,s0
    3534:	00e60733          	add	a4,a2,a4
    3538:	00040793          	mv	a5,s0
    353c:	00072603          	lw	a2,0(a4)
    3540:	00472683          	lw	a3,4(a4)
    3544:	00878793          	addi	a5,a5,8
    3548:	00865f13          	srli	t5,a2,0x8
    354c:	01065e93          	srli	t4,a2,0x10
    3550:	01865e13          	srli	t3,a2,0x18
    3554:	0086d313          	srli	t1,a3,0x8
    3558:	0106d893          	srli	a7,a3,0x10
    355c:	0186d813          	srli	a6,a3,0x18
    3560:	ffe78ca3          	sb	t5,-7(a5)
    3564:	fec78c23          	sb	a2,-8(a5)
    3568:	fed78e23          	sb	a3,-4(a5)
    356c:	ffd78d23          	sb	t4,-6(a5)
    3570:	ffc78da3          	sb	t3,-5(a5)
    3574:	fe678ea3          	sb	t1,-3(a5)
    3578:	ff178f23          	sb	a7,-2(a5)
    357c:	ff078fa3          	sb	a6,-1(a5)
    3580:	00870713          	addi	a4,a4,8
    3584:	faf59ce3          	bne	a1,a5,353c <keccak_squeeze.constprop.1+0x14c>
    3588:	014a8ab3          	add	s5,s5,s4
    358c:	f78a8a13          	addi	s4,s5,-136
    3590:	08700793          	li	a5,135
    3594:	00a40433          	add	s0,s0,a0
    3598:	00000a93          	li	s5,0
    359c:	0347e863          	bltu	a5,s4,35cc <keccak_squeeze.constprop.1+0x1dc>
    35a0:	220a0663          	beqz	s4,37cc <keccak_squeeze.constprop.1+0x3dc>
    35a4:	000a0493          	mv	s1,s4
    35a8:	00090513          	mv	a0,s2
    35ac:	98cfe0ef          	jal	1738 <KeccakF1600_StatePermute>
    35b0:	00000a93          	li	s5,0
    35b4:	0b80006f          	j	366c <keccak_squeeze.constprop.1+0x27c>
    35b8:	03212023          	sw	s2,32(sp)
    35bc:	00060913          	mv	s2,a2
    35c0:	f40a9ae3          	bnez	s5,3514 <keccak_squeeze.constprop.1+0x124>
    35c4:	08700793          	li	a5,135
    35c8:	1f47fe63          	bgeu	a5,s4,37c4 <keccak_squeeze.constprop.1+0x3d4>
    35cc:	01612823          	sw	s6,16(sp)
    35d0:	08840b13          	addi	s6,s0,136
    35d4:	01312e23          	sw	s3,28(sp)
    35d8:	08700493          	li	s1,135
    35dc:	000b0993          	mv	s3,s6
    35e0:	00090513          	mv	a0,s2
    35e4:	954fe0ef          	jal	1738 <KeccakF1600_StatePermute>
    35e8:	00040793          	mv	a5,s0
    35ec:	00090613          	mv	a2,s2
    35f0:	00062683          	lw	a3,0(a2)
    35f4:	00462703          	lw	a4,4(a2)
    35f8:	00878793          	addi	a5,a5,8
    35fc:	0086de93          	srli	t4,a3,0x8
    3600:	0106de13          	srli	t3,a3,0x10
    3604:	0186d313          	srli	t1,a3,0x18
    3608:	00875893          	srli	a7,a4,0x8
    360c:	01075813          	srli	a6,a4,0x10
    3610:	01875593          	srli	a1,a4,0x18
    3614:	ffd78ca3          	sb	t4,-7(a5)
    3618:	fed78c23          	sb	a3,-8(a5)
    361c:	fee78e23          	sb	a4,-4(a5)
    3620:	ffc78d23          	sb	t3,-6(a5)
    3624:	fe678da3          	sb	t1,-5(a5)
    3628:	ff178ea3          	sb	a7,-3(a5)
    362c:	ff078f23          	sb	a6,-2(a5)
    3630:	feb78fa3          	sb	a1,-1(a5)
    3634:	00860613          	addi	a2,a2,8
    3638:	faf99ce3          	bne	s3,a5,35f0 <keccak_squeeze.constprop.1+0x200>
    363c:	f78a0a13          	addi	s4,s4,-136
    3640:	08898993          	addi	s3,s3,136
    3644:	000b0413          	mv	s0,s6
    3648:	0144f663          	bgeu	s1,s4,3654 <keccak_squeeze.constprop.1+0x264>
    364c:	088b0b13          	addi	s6,s6,136
    3650:	f91ff06f          	j	35e0 <keccak_squeeze.constprop.1+0x1f0>
    3654:	000a8493          	mv	s1,s5
    3658:	0e0a0663          	beqz	s4,3744 <keccak_squeeze.constprop.1+0x354>
    365c:	01c12983          	lw	s3,28(sp)
    3660:	01012b03          	lw	s6,16(sp)
    3664:	015a04b3          	add	s1,s4,s5
    3668:	f40a80e3          	beqz	s5,35a8 <keccak_squeeze.constprop.1+0x1b8>
    366c:	003a5513          	srli	a0,s4,0x3
    3670:	06050663          	beqz	a0,36dc <keccak_squeeze.constprop.1+0x2ec>
    3674:	00351513          	slli	a0,a0,0x3
    3678:	ff8af613          	andi	a2,s5,-8
    367c:	00a40f33          	add	t5,s0,a0
    3680:	00c90633          	add	a2,s2,a2
    3684:	00040793          	mv	a5,s0
    3688:	00062683          	lw	a3,0(a2)
    368c:	00462703          	lw	a4,4(a2)
    3690:	00878793          	addi	a5,a5,8
    3694:	0086de93          	srli	t4,a3,0x8
    3698:	0106de13          	srli	t3,a3,0x10
    369c:	0186d313          	srli	t1,a3,0x18
    36a0:	00875893          	srli	a7,a4,0x8
    36a4:	01075813          	srli	a6,a4,0x10
    36a8:	01875593          	srli	a1,a4,0x18
    36ac:	ffd78ca3          	sb	t4,-7(a5)
    36b0:	fed78c23          	sb	a3,-8(a5)
    36b4:	fee78e23          	sb	a4,-4(a5)
    36b8:	ffc78d23          	sb	t3,-6(a5)
    36bc:	fe678da3          	sb	t1,-5(a5)
    36c0:	ff178ea3          	sb	a7,-3(a5)
    36c4:	ff078f23          	sb	a6,-2(a5)
    36c8:	feb78fa3          	sb	a1,-1(a5)
    36cc:	00860613          	addi	a2,a2,8
    36d0:	fbe79ce3          	bne	a5,t5,3688 <keccak_squeeze.constprop.1+0x298>
    36d4:	40aa0a33          	sub	s4,s4,a0
    36d8:	00aa8ab3          	add	s5,s5,a0
    36dc:	ff8afa93          	andi	s5,s5,-8
    36e0:	01590933          	add	s2,s2,s5
    36e4:	00492783          	lw	a5,4(s2)
    36e8:	00092583          	lw	a1,0(s2)
    36ec:	0087d613          	srli	a2,a5,0x8
    36f0:	0107d693          	srli	a3,a5,0x10
    36f4:	0187d713          	srli	a4,a5,0x18
    36f8:	00f10623          	sb	a5,12(sp)
    36fc:	00b12423          	sw	a1,8(sp)
    3700:	00c106a3          	sb	a2,13(sp)
    3704:	00d10723          	sb	a3,14(sp)
    3708:	00e107a3          	sb	a4,15(sp)
    370c:	080a0863          	beqz	s4,379c <keccak_squeeze.constprop.1+0x3ac>
    3710:	000a0613          	mv	a2,s4
    3714:	00a40533          	add	a0,s0,a0
    3718:	00810593          	addi	a1,sp,8
    371c:	285010ef          	jal	51a0 <memcpy>
    3720:	02012903          	lw	s2,32(sp)
    3724:	02c12083          	lw	ra,44(sp)
    3728:	02812403          	lw	s0,40(sp)
    372c:	01812a03          	lw	s4,24(sp)
    3730:	01412a83          	lw	s5,20(sp)
    3734:	00048513          	mv	a0,s1
    3738:	02412483          	lw	s1,36(sp)
    373c:	03010113          	addi	sp,sp,48
    3740:	00008067          	ret
    3744:	02c12083          	lw	ra,44(sp)
    3748:	02812403          	lw	s0,40(sp)
    374c:	02012903          	lw	s2,32(sp)
    3750:	01c12983          	lw	s3,28(sp)
    3754:	01012b03          	lw	s6,16(sp)
    3758:	01812a03          	lw	s4,24(sp)
    375c:	01412a83          	lw	s5,20(sp)
    3760:	00048513          	mv	a0,s1
    3764:	02412483          	lw	s1,36(sp)
    3768:	03010113          	addi	sp,sp,48
    376c:	00008067          	ret
    3770:	08700793          	li	a5,135
    3774:	e547ece3          	bltu	a5,s4,35cc <keccak_squeeze.constprop.1+0x1dc>
    3778:	000a8493          	mv	s1,s5
    377c:	020a0063          	beqz	s4,379c <keccak_squeeze.constprop.1+0x3ac>
    3780:	014a84b3          	add	s1,s5,s4
    3784:	ee9ff06f          	j	366c <keccak_squeeze.constprop.1+0x27c>
    3788:	08800793          	li	a5,136
    378c:	000a8493          	mv	s1,s5
    3790:	f8fa9ae3          	bne	s5,a5,3724 <keccak_squeeze.constprop.1+0x334>
    3794:	00000493          	li	s1,0
    3798:	f8dff06f          	j	3724 <keccak_squeeze.constprop.1+0x334>
    379c:	02012903          	lw	s2,32(sp)
    37a0:	f85ff06f          	j	3724 <keccak_squeeze.constprop.1+0x334>
    37a4:	00140413          	addi	s0,s0,1
    37a8:	001a8a93          	addi	s5,s5,1
    37ac:	00058a13          	mv	s4,a1
    37b0:	e0dff06f          	j	35bc <keccak_squeeze.constprop.1+0x1cc>
    37b4:	00540413          	addi	s0,s0,5
    37b8:	005a8a93          	addi	s5,s5,5
    37bc:	00058a13          	mv	s4,a1
    37c0:	dfdff06f          	j	35bc <keccak_squeeze.constprop.1+0x1cc>
    37c4:	000a0493          	mv	s1,s4
    37c8:	de0a10e3          	bnez	s4,35a8 <keccak_squeeze.constprop.1+0x1b8>
    37cc:	02012903          	lw	s2,32(sp)
    37d0:	00000493          	li	s1,0
    37d4:	f51ff06f          	j	3724 <keccak_squeeze.constprop.1+0x334>
    37d8:	00240413          	addi	s0,s0,2
    37dc:	002a8a93          	addi	s5,s5,2
    37e0:	00058a13          	mv	s4,a1
    37e4:	dd9ff06f          	j	35bc <keccak_squeeze.constprop.1+0x1cc>
    37e8:	00340413          	addi	s0,s0,3
    37ec:	003a8a93          	addi	s5,s5,3
    37f0:	00058a13          	mv	s4,a1
    37f4:	dc9ff06f          	j	35bc <keccak_squeeze.constprop.1+0x1cc>
    37f8:	00440413          	addi	s0,s0,4
    37fc:	004a8a93          	addi	s5,s5,4
    3800:	00058a13          	mv	s4,a1
    3804:	db9ff06f          	j	35bc <keccak_squeeze.constprop.1+0x1cc>
    3808:	00640413          	addi	s0,s0,6
    380c:	006a8a93          	addi	s5,s5,6
    3810:	00078a13          	mv	s4,a5
    3814:	da9ff06f          	j	35bc <keccak_squeeze.constprop.1+0x1cc>

00003818 <keccak_absorb.constprop.1>:
    3818:	fd010113          	addi	sp,sp,-48
    381c:	02812423          	sw	s0,40(sp)
    3820:	02912223          	sw	s1,36(sp)
    3824:	01312e23          	sw	s3,28(sp)
    3828:	01612823          	sw	s6,16(sp)
    382c:	02112623          	sw	ra,44(sp)
    3830:	03212023          	sw	s2,32(sp)
    3834:	00012423          	sw	zero,8(sp)
    3838:	00012623          	sw	zero,12(sp)
    383c:	0075f713          	andi	a4,a1,7
    3840:	00058493          	mv	s1,a1
    3844:	00060b13          	mv	s6,a2
    3848:	00068993          	mv	s3,a3
    384c:	00050413          	mv	s0,a0
    3850:	14070a63          	beqz	a4,39a4 <keccak_absorb.constprop.1+0x18c>
    3854:	0c068e63          	beqz	a3,3930 <keccak_absorb.constprop.1+0x118>
    3858:	00064603          	lbu	a2,0(a2)
    385c:	002707b3          	add	a5,a4,sp
    3860:	fff68693          	addi	a3,a3,-1
    3864:	00c78423          	sb	a2,8(a5)
    3868:	00170793          	addi	a5,a4,1
    386c:	40068263          	beqz	a3,3c70 <keccak_absorb.constprop.1+0x458>
    3870:	ff970613          	addi	a2,a4,-7
    3874:	3e060e63          	beqz	a2,3c70 <keccak_absorb.constprop.1+0x458>
    3878:	001b4603          	lbu	a2,1(s6)
    387c:	002787b3          	add	a5,a5,sp
    3880:	ffe98693          	addi	a3,s3,-2
    3884:	00c78423          	sb	a2,8(a5)
    3888:	00270793          	addi	a5,a4,2
    388c:	40068663          	beqz	a3,3c98 <keccak_absorb.constprop.1+0x480>
    3890:	ffa70613          	addi	a2,a4,-6
    3894:	40060263          	beqz	a2,3c98 <keccak_absorb.constprop.1+0x480>
    3898:	002b4603          	lbu	a2,2(s6)
    389c:	002787b3          	add	a5,a5,sp
    38a0:	ffd98693          	addi	a3,s3,-3
    38a4:	00c78423          	sb	a2,8(a5)
    38a8:	00370793          	addi	a5,a4,3
    38ac:	40068063          	beqz	a3,3cac <keccak_absorb.constprop.1+0x494>
    38b0:	ffb70613          	addi	a2,a4,-5
    38b4:	3e060c63          	beqz	a2,3cac <keccak_absorb.constprop.1+0x494>
    38b8:	003b4603          	lbu	a2,3(s6)
    38bc:	002787b3          	add	a5,a5,sp
    38c0:	ffc98693          	addi	a3,s3,-4
    38c4:	00c78423          	sb	a2,8(a5)
    38c8:	00470793          	addi	a5,a4,4
    38cc:	3e068a63          	beqz	a3,3cc0 <keccak_absorb.constprop.1+0x4a8>
    38d0:	ffc70613          	addi	a2,a4,-4
    38d4:	3e060663          	beqz	a2,3cc0 <keccak_absorb.constprop.1+0x4a8>
    38d8:	004b4603          	lbu	a2,4(s6)
    38dc:	002787b3          	add	a5,a5,sp
    38e0:	ffb98693          	addi	a3,s3,-5
    38e4:	00c78423          	sb	a2,8(a5)
    38e8:	00570793          	addi	a5,a4,5
    38ec:	38068c63          	beqz	a3,3c84 <keccak_absorb.constprop.1+0x46c>
    38f0:	ffd70613          	addi	a2,a4,-3
    38f4:	38060863          	beqz	a2,3c84 <keccak_absorb.constprop.1+0x46c>
    38f8:	005b4603          	lbu	a2,5(s6)
    38fc:	002787b3          	add	a5,a5,sp
    3900:	ffa98693          	addi	a3,s3,-6
    3904:	00c78423          	sb	a2,8(a5)
    3908:	00670713          	addi	a4,a4,6
    390c:	3c068463          	beqz	a3,3cd4 <keccak_absorb.constprop.1+0x4bc>
    3910:	ff870793          	addi	a5,a4,-8
    3914:	3c078063          	beqz	a5,3cd4 <keccak_absorb.constprop.1+0x4bc>
    3918:	006b4783          	lbu	a5,6(s6)
    391c:	ff998993          	addi	s3,s3,-7
    3920:	00758493          	addi	s1,a1,7
    3924:	00f107a3          	sb	a5,15(sp)
    3928:	007b0b13          	addi	s6,s6,7
    392c:	00800713          	li	a4,8
    3930:	00a14683          	lbu	a3,10(sp)
    3934:	00d14803          	lbu	a6,13(sp)
    3938:	00914883          	lbu	a7,9(sp)
    393c:	40e487b3          	sub	a5,s1,a4
    3940:	00c14e03          	lbu	t3,12(sp)
    3944:	00e14503          	lbu	a0,14(sp)
    3948:	00f14603          	lbu	a2,15(sp)
    394c:	00814303          	lbu	t1,8(sp)
    3950:	00b14583          	lbu	a1,11(sp)
    3954:	ff87f793          	andi	a5,a5,-8
    3958:	00f407b3          	add	a5,s0,a5
    395c:	01069713          	slli	a4,a3,0x10
    3960:	00889893          	slli	a7,a7,0x8
    3964:	00881693          	slli	a3,a6,0x8
    3968:	01176733          	or	a4,a4,a7
    396c:	0047a803          	lw	a6,4(a5)
    3970:	0007a883          	lw	a7,0(a5)
    3974:	01c6e6b3          	or	a3,a3,t3
    3978:	01051513          	slli	a0,a0,0x10
    397c:	00676733          	or	a4,a4,t1
    3980:	00d56533          	or	a0,a0,a3
    3984:	01859593          	slli	a1,a1,0x18
    3988:	01861693          	slli	a3,a2,0x18
    398c:	00e5e633          	or	a2,a1,a4
    3990:	00a6e733          	or	a4,a3,a0
    3994:	00e84733          	xor	a4,a6,a4
    3998:	00c8c6b3          	xor	a3,a7,a2
    399c:	00d7a023          	sw	a3,0(a5)
    39a0:	00e7a223          	sw	a4,4(a5)
    39a4:	00048863          	beqz	s1,39b4 <keccak_absorb.constprop.1+0x19c>
    39a8:	08800313          	li	t1,136
    39ac:	40930333          	sub	t1,t1,s1
    39b0:	2069f463          	bgeu	s3,t1,3bb8 <keccak_absorb.constprop.1+0x3a0>
    39b4:	08700913          	li	s2,135
    39b8:	0b397c63          	bgeu	s2,s3,3a70 <keccak_absorb.constprop.1+0x258>
    39bc:	01512a23          	sw	s5,20(sp)
    39c0:	088b0a93          	addi	s5,s6,136
    39c4:	01412c23          	sw	s4,24(sp)
    39c8:	000a8a13          	mv	s4,s5
    39cc:	000b0793          	mv	a5,s6
    39d0:	00040693          	mv	a3,s0
    39d4:	0017c703          	lbu	a4,1(a5)
    39d8:	0027c883          	lbu	a7,2(a5)
    39dc:	0057c803          	lbu	a6,5(a5)
    39e0:	0047ce83          	lbu	t4,4(a5)
    39e4:	0067c503          	lbu	a0,6(a5)
    39e8:	0007ce03          	lbu	t3,0(a5)
    39ec:	0037c583          	lbu	a1,3(a5)
    39f0:	0077c603          	lbu	a2,7(a5)
    39f4:	01089893          	slli	a7,a7,0x10
    39f8:	00871713          	slli	a4,a4,0x8
    39fc:	00881813          	slli	a6,a6,0x8
    3a00:	0006a303          	lw	t1,0(a3)
    3a04:	01176733          	or	a4,a4,a7
    3a08:	01d86833          	or	a6,a6,t4
    3a0c:	0046a883          	lw	a7,4(a3)
    3a10:	01051513          	slli	a0,a0,0x10
    3a14:	01c76733          	or	a4,a4,t3
    3a18:	01861613          	slli	a2,a2,0x18
    3a1c:	01859593          	slli	a1,a1,0x18
    3a20:	01056533          	or	a0,a0,a6
    3a24:	00e5e5b3          	or	a1,a1,a4
    3a28:	00a66733          	or	a4,a2,a0
    3a2c:	00e8c733          	xor	a4,a7,a4
    3a30:	00b34633          	xor	a2,t1,a1
    3a34:	00c6a023          	sw	a2,0(a3)
    3a38:	00e6a223          	sw	a4,4(a3)
    3a3c:	00878793          	addi	a5,a5,8
    3a40:	00868693          	addi	a3,a3,8
    3a44:	f94798e3          	bne	a5,s4,39d4 <keccak_absorb.constprop.1+0x1bc>
    3a48:	00040513          	mv	a0,s0
    3a4c:	f7898993          	addi	s3,s3,-136
    3a50:	000a8b13          	mv	s6,s5
    3a54:	ce5fd0ef          	jal	1738 <KeccakF1600_StatePermute>
    3a58:	088a0a13          	addi	s4,s4,136
    3a5c:	01397663          	bgeu	s2,s3,3a68 <keccak_absorb.constprop.1+0x250>
    3a60:	088a8a93          	addi	s5,s5,136
    3a64:	f69ff06f          	j	39cc <keccak_absorb.constprop.1+0x1b4>
    3a68:	01812a03          	lw	s4,24(sp)
    3a6c:	01412a83          	lw	s5,20(sp)
    3a70:	0039d593          	srli	a1,s3,0x3
    3a74:	1e058863          	beqz	a1,3c64 <keccak_absorb.constprop.1+0x44c>
    3a78:	00359593          	slli	a1,a1,0x3
    3a7c:	ff84f613          	andi	a2,s1,-8
    3a80:	00bb0e33          	add	t3,s6,a1
    3a84:	00c40633          	add	a2,s0,a2
    3a88:	000b0713          	mv	a4,s6
    3a8c:	00174683          	lbu	a3,1(a4)
    3a90:	00274783          	lbu	a5,2(a4)
    3a94:	00574303          	lbu	t1,5(a4)
    3a98:	00474f83          	lbu	t6,4(a4)
    3a9c:	00674883          	lbu	a7,6(a4)
    3aa0:	00074f03          	lbu	t5,0(a4)
    3aa4:	00374803          	lbu	a6,3(a4)
    3aa8:	00774503          	lbu	a0,7(a4)
    3aac:	01079793          	slli	a5,a5,0x10
    3ab0:	00869693          	slli	a3,a3,0x8
    3ab4:	00831313          	slli	t1,t1,0x8
    3ab8:	00062e83          	lw	t4,0(a2)
    3abc:	00f6e6b3          	or	a3,a3,a5
    3ac0:	01f36333          	or	t1,t1,t6
    3ac4:	00462783          	lw	a5,4(a2)
    3ac8:	01089893          	slli	a7,a7,0x10
    3acc:	01e6e6b3          	or	a3,a3,t5
    3ad0:	01851513          	slli	a0,a0,0x18
    3ad4:	01881813          	slli	a6,a6,0x18
    3ad8:	0068e8b3          	or	a7,a7,t1
    3adc:	00d86833          	or	a6,a6,a3
    3ae0:	011566b3          	or	a3,a0,a7
    3ae4:	00d7c7b3          	xor	a5,a5,a3
    3ae8:	010ec533          	xor	a0,t4,a6
    3aec:	00a62023          	sw	a0,0(a2)
    3af0:	00f62223          	sw	a5,4(a2)
    3af4:	00870713          	addi	a4,a4,8
    3af8:	00860613          	addi	a2,a2,8
    3afc:	f9c718e3          	bne	a4,t3,3a8c <keccak_absorb.constprop.1+0x274>
    3b00:	40b98633          	sub	a2,s3,a1
    3b04:	00b48933          	add	s2,s1,a1
    3b08:	08060663          	beqz	a2,3b94 <keccak_absorb.constprop.1+0x37c>
    3b0c:	00bb05b3          	add	a1,s6,a1
    3b10:	00810513          	addi	a0,sp,8
    3b14:	00012423          	sw	zero,8(sp)
    3b18:	00012623          	sw	zero,12(sp)
    3b1c:	684010ef          	jal	51a0 <memcpy>
    3b20:	00a14783          	lbu	a5,10(sp)
    3b24:	00914503          	lbu	a0,9(sp)
    3b28:	00d14583          	lbu	a1,13(sp)
    3b2c:	00c14303          	lbu	t1,12(sp)
    3b30:	00e14603          	lbu	a2,14(sp)
    3b34:	ff897913          	andi	s2,s2,-8
    3b38:	00814883          	lbu	a7,8(sp)
    3b3c:	00b14683          	lbu	a3,11(sp)
    3b40:	00f14703          	lbu	a4,15(sp)
    3b44:	01240433          	add	s0,s0,s2
    3b48:	00851513          	slli	a0,a0,0x8
    3b4c:	01079793          	slli	a5,a5,0x10
    3b50:	00859593          	slli	a1,a1,0x8
    3b54:	00042803          	lw	a6,0(s0)
    3b58:	00a7e7b3          	or	a5,a5,a0
    3b5c:	0065e5b3          	or	a1,a1,t1
    3b60:	00442503          	lw	a0,4(s0)
    3b64:	01061613          	slli	a2,a2,0x10
    3b68:	0117e7b3          	or	a5,a5,a7
    3b6c:	01871713          	slli	a4,a4,0x18
    3b70:	01869693          	slli	a3,a3,0x18
    3b74:	00b66633          	or	a2,a2,a1
    3b78:	00f6e6b3          	or	a3,a3,a5
    3b7c:	00c767b3          	or	a5,a4,a2
    3b80:	00f547b3          	xor	a5,a0,a5
    3b84:	00d84733          	xor	a4,a6,a3
    3b88:	01348933          	add	s2,s1,s3
    3b8c:	00e42023          	sw	a4,0(s0)
    3b90:	00f42223          	sw	a5,4(s0)
    3b94:	02c12083          	lw	ra,44(sp)
    3b98:	02812403          	lw	s0,40(sp)
    3b9c:	02412483          	lw	s1,36(sp)
    3ba0:	01c12983          	lw	s3,28(sp)
    3ba4:	01012b03          	lw	s6,16(sp)
    3ba8:	00090513          	mv	a0,s2
    3bac:	02012903          	lw	s2,32(sp)
    3bb0:	03010113          	addi	sp,sp,48
    3bb4:	00008067          	ret
    3bb8:	00335793          	srli	a5,t1,0x3
    3bbc:	08078663          	beqz	a5,3c48 <keccak_absorb.constprop.1+0x430>
    3bc0:	00379793          	slli	a5,a5,0x3
    3bc4:	ff84f693          	andi	a3,s1,-8
    3bc8:	01678e33          	add	t3,a5,s6
    3bcc:	00d406b3          	add	a3,s0,a3
    3bd0:	000b0793          	mv	a5,s6
    3bd4:	0017c703          	lbu	a4,1(a5)
    3bd8:	0027c883          	lbu	a7,2(a5)
    3bdc:	0057c803          	lbu	a6,5(a5)
    3be0:	0047cf83          	lbu	t6,4(a5)
    3be4:	0067c503          	lbu	a0,6(a5)
    3be8:	0007cf03          	lbu	t5,0(a5)
    3bec:	0037c583          	lbu	a1,3(a5)
    3bf0:	0077c603          	lbu	a2,7(a5)
    3bf4:	01089893          	slli	a7,a7,0x10
    3bf8:	00871713          	slli	a4,a4,0x8
    3bfc:	00881813          	slli	a6,a6,0x8
    3c00:	0006ae83          	lw	t4,0(a3)
    3c04:	01176733          	or	a4,a4,a7
    3c08:	01f86833          	or	a6,a6,t6
    3c0c:	0046a883          	lw	a7,4(a3)
    3c10:	01051513          	slli	a0,a0,0x10
    3c14:	01e76733          	or	a4,a4,t5
    3c18:	01861613          	slli	a2,a2,0x18
    3c1c:	01859593          	slli	a1,a1,0x18
    3c20:	01056533          	or	a0,a0,a6
    3c24:	00e5e5b3          	or	a1,a1,a4
    3c28:	00a66733          	or	a4,a2,a0
    3c2c:	00e8c733          	xor	a4,a7,a4
    3c30:	00bec633          	xor	a2,t4,a1
    3c34:	00c6a023          	sw	a2,0(a3)
    3c38:	00e6a223          	sw	a4,4(a3)
    3c3c:	00878793          	addi	a5,a5,8
    3c40:	00868693          	addi	a3,a3,8
    3c44:	f9c798e3          	bne	a5,t3,3bd4 <keccak_absorb.constprop.1+0x3bc>
    3c48:	013489b3          	add	s3,s1,s3
    3c4c:	00040513          	mv	a0,s0
    3c50:	006b0b33          	add	s6,s6,t1
    3c54:	f7898993          	addi	s3,s3,-136
    3c58:	ae1fd0ef          	jal	1738 <KeccakF1600_StatePermute>
    3c5c:	00000493          	li	s1,0
    3c60:	d55ff06f          	j	39b4 <keccak_absorb.constprop.1+0x19c>
    3c64:	00048913          	mv	s2,s1
    3c68:	00098613          	mv	a2,s3
    3c6c:	e9dff06f          	j	3b08 <keccak_absorb.constprop.1+0x2f0>
    3c70:	001b0b13          	addi	s6,s6,1
    3c74:	00148493          	addi	s1,s1,1
    3c78:	00068993          	mv	s3,a3
    3c7c:	00078713          	mv	a4,a5
    3c80:	cb1ff06f          	j	3930 <keccak_absorb.constprop.1+0x118>
    3c84:	005b0b13          	addi	s6,s6,5
    3c88:	00548493          	addi	s1,s1,5
    3c8c:	00068993          	mv	s3,a3
    3c90:	00078713          	mv	a4,a5
    3c94:	c9dff06f          	j	3930 <keccak_absorb.constprop.1+0x118>
    3c98:	002b0b13          	addi	s6,s6,2
    3c9c:	00248493          	addi	s1,s1,2
    3ca0:	00068993          	mv	s3,a3
    3ca4:	00078713          	mv	a4,a5
    3ca8:	c89ff06f          	j	3930 <keccak_absorb.constprop.1+0x118>
    3cac:	003b0b13          	addi	s6,s6,3
    3cb0:	00348493          	addi	s1,s1,3
    3cb4:	00068993          	mv	s3,a3
    3cb8:	00078713          	mv	a4,a5
    3cbc:	c75ff06f          	j	3930 <keccak_absorb.constprop.1+0x118>
    3cc0:	004b0b13          	addi	s6,s6,4
    3cc4:	00448493          	addi	s1,s1,4
    3cc8:	00068993          	mv	s3,a3
    3ccc:	00078713          	mv	a4,a5
    3cd0:	c61ff06f          	j	3930 <keccak_absorb.constprop.1+0x118>
    3cd4:	006b0b13          	addi	s6,s6,6
    3cd8:	00648493          	addi	s1,s1,6
    3cdc:	00068993          	mv	s3,a3
    3ce0:	c51ff06f          	j	3930 <keccak_absorb.constprop.1+0x118>

00003ce4 <keccak_absorb.constprop.2>:
    3ce4:	fd010113          	addi	sp,sp,-48
    3ce8:	02812423          	sw	s0,40(sp)
    3cec:	02912223          	sw	s1,36(sp)
    3cf0:	01312e23          	sw	s3,28(sp)
    3cf4:	01612823          	sw	s6,16(sp)
    3cf8:	02112623          	sw	ra,44(sp)
    3cfc:	03212023          	sw	s2,32(sp)
    3d00:	00012423          	sw	zero,8(sp)
    3d04:	00012623          	sw	zero,12(sp)
    3d08:	0075f713          	andi	a4,a1,7
    3d0c:	00058493          	mv	s1,a1
    3d10:	00060b13          	mv	s6,a2
    3d14:	00068993          	mv	s3,a3
    3d18:	00050413          	mv	s0,a0
    3d1c:	14070a63          	beqz	a4,3e70 <keccak_absorb.constprop.2+0x18c>
    3d20:	0c068e63          	beqz	a3,3dfc <keccak_absorb.constprop.2+0x118>
    3d24:	00064603          	lbu	a2,0(a2)
    3d28:	002707b3          	add	a5,a4,sp
    3d2c:	fff68693          	addi	a3,a3,-1
    3d30:	00c78423          	sb	a2,8(a5)
    3d34:	00170793          	addi	a5,a4,1
    3d38:	40068263          	beqz	a3,413c <keccak_absorb.constprop.2+0x458>
    3d3c:	ff970613          	addi	a2,a4,-7
    3d40:	3e060e63          	beqz	a2,413c <keccak_absorb.constprop.2+0x458>
    3d44:	001b4603          	lbu	a2,1(s6)
    3d48:	002787b3          	add	a5,a5,sp
    3d4c:	ffe98693          	addi	a3,s3,-2
    3d50:	00c78423          	sb	a2,8(a5)
    3d54:	00270793          	addi	a5,a4,2
    3d58:	40068663          	beqz	a3,4164 <keccak_absorb.constprop.2+0x480>
    3d5c:	ffa70613          	addi	a2,a4,-6
    3d60:	40060263          	beqz	a2,4164 <keccak_absorb.constprop.2+0x480>
    3d64:	002b4603          	lbu	a2,2(s6)
    3d68:	002787b3          	add	a5,a5,sp
    3d6c:	ffd98693          	addi	a3,s3,-3
    3d70:	00c78423          	sb	a2,8(a5)
    3d74:	00370793          	addi	a5,a4,3
    3d78:	40068063          	beqz	a3,4178 <keccak_absorb.constprop.2+0x494>
    3d7c:	ffb70613          	addi	a2,a4,-5
    3d80:	3e060c63          	beqz	a2,4178 <keccak_absorb.constprop.2+0x494>
    3d84:	003b4603          	lbu	a2,3(s6)
    3d88:	002787b3          	add	a5,a5,sp
    3d8c:	ffc98693          	addi	a3,s3,-4
    3d90:	00c78423          	sb	a2,8(a5)
    3d94:	00470793          	addi	a5,a4,4
    3d98:	3e068a63          	beqz	a3,418c <keccak_absorb.constprop.2+0x4a8>
    3d9c:	ffc70613          	addi	a2,a4,-4
    3da0:	3e060663          	beqz	a2,418c <keccak_absorb.constprop.2+0x4a8>
    3da4:	004b4603          	lbu	a2,4(s6)
    3da8:	002787b3          	add	a5,a5,sp
    3dac:	ffb98693          	addi	a3,s3,-5
    3db0:	00c78423          	sb	a2,8(a5)
    3db4:	00570793          	addi	a5,a4,5
    3db8:	38068c63          	beqz	a3,4150 <keccak_absorb.constprop.2+0x46c>
    3dbc:	ffd70613          	addi	a2,a4,-3
    3dc0:	38060863          	beqz	a2,4150 <keccak_absorb.constprop.2+0x46c>
    3dc4:	005b4603          	lbu	a2,5(s6)
    3dc8:	002787b3          	add	a5,a5,sp
    3dcc:	ffa98693          	addi	a3,s3,-6
    3dd0:	00c78423          	sb	a2,8(a5)
    3dd4:	00670713          	addi	a4,a4,6
    3dd8:	3c068463          	beqz	a3,41a0 <keccak_absorb.constprop.2+0x4bc>
    3ddc:	ff870793          	addi	a5,a4,-8
    3de0:	3c078063          	beqz	a5,41a0 <keccak_absorb.constprop.2+0x4bc>
    3de4:	006b4783          	lbu	a5,6(s6)
    3de8:	ff998993          	addi	s3,s3,-7
    3dec:	00758493          	addi	s1,a1,7
    3df0:	00f107a3          	sb	a5,15(sp)
    3df4:	007b0b13          	addi	s6,s6,7
    3df8:	00800713          	li	a4,8
    3dfc:	00a14683          	lbu	a3,10(sp)
    3e00:	00d14803          	lbu	a6,13(sp)
    3e04:	00914883          	lbu	a7,9(sp)
    3e08:	40e487b3          	sub	a5,s1,a4
    3e0c:	00c14e03          	lbu	t3,12(sp)
    3e10:	00e14503          	lbu	a0,14(sp)
    3e14:	00f14603          	lbu	a2,15(sp)
    3e18:	00814303          	lbu	t1,8(sp)
    3e1c:	00b14583          	lbu	a1,11(sp)
    3e20:	ff87f793          	andi	a5,a5,-8
    3e24:	00f407b3          	add	a5,s0,a5
    3e28:	01069713          	slli	a4,a3,0x10
    3e2c:	00889893          	slli	a7,a7,0x8
    3e30:	00881693          	slli	a3,a6,0x8
    3e34:	01176733          	or	a4,a4,a7
    3e38:	0047a803          	lw	a6,4(a5)
    3e3c:	0007a883          	lw	a7,0(a5)
    3e40:	01c6e6b3          	or	a3,a3,t3
    3e44:	01051513          	slli	a0,a0,0x10
    3e48:	00676733          	or	a4,a4,t1
    3e4c:	00d56533          	or	a0,a0,a3
    3e50:	01859593          	slli	a1,a1,0x18
    3e54:	01861693          	slli	a3,a2,0x18
    3e58:	00e5e633          	or	a2,a1,a4
    3e5c:	00a6e733          	or	a4,a3,a0
    3e60:	00e84733          	xor	a4,a6,a4
    3e64:	00c8c6b3          	xor	a3,a7,a2
    3e68:	00d7a023          	sw	a3,0(a5)
    3e6c:	00e7a223          	sw	a4,4(a5)
    3e70:	00048863          	beqz	s1,3e80 <keccak_absorb.constprop.2+0x19c>
    3e74:	0a800313          	li	t1,168
    3e78:	40930333          	sub	t1,t1,s1
    3e7c:	2069f463          	bgeu	s3,t1,4084 <keccak_absorb.constprop.2+0x3a0>
    3e80:	0a700913          	li	s2,167
    3e84:	0b397c63          	bgeu	s2,s3,3f3c <keccak_absorb.constprop.2+0x258>
    3e88:	01512a23          	sw	s5,20(sp)
    3e8c:	0a8b0a93          	addi	s5,s6,168
    3e90:	01412c23          	sw	s4,24(sp)
    3e94:	000a8a13          	mv	s4,s5
    3e98:	000b0793          	mv	a5,s6
    3e9c:	00040693          	mv	a3,s0
    3ea0:	0017c703          	lbu	a4,1(a5)
    3ea4:	0027c883          	lbu	a7,2(a5)
    3ea8:	0057c803          	lbu	a6,5(a5)
    3eac:	0047ce83          	lbu	t4,4(a5)
    3eb0:	0067c503          	lbu	a0,6(a5)
    3eb4:	0007ce03          	lbu	t3,0(a5)
    3eb8:	0037c583          	lbu	a1,3(a5)
    3ebc:	0077c603          	lbu	a2,7(a5)
    3ec0:	01089893          	slli	a7,a7,0x10
    3ec4:	00871713          	slli	a4,a4,0x8
    3ec8:	00881813          	slli	a6,a6,0x8
    3ecc:	0006a303          	lw	t1,0(a3)
    3ed0:	01176733          	or	a4,a4,a7
    3ed4:	01d86833          	or	a6,a6,t4
    3ed8:	0046a883          	lw	a7,4(a3)
    3edc:	01051513          	slli	a0,a0,0x10
    3ee0:	01c76733          	or	a4,a4,t3
    3ee4:	01861613          	slli	a2,a2,0x18
    3ee8:	01859593          	slli	a1,a1,0x18
    3eec:	01056533          	or	a0,a0,a6
    3ef0:	00e5e5b3          	or	a1,a1,a4
    3ef4:	00a66733          	or	a4,a2,a0
    3ef8:	00e8c733          	xor	a4,a7,a4
    3efc:	00b34633          	xor	a2,t1,a1
    3f00:	00c6a023          	sw	a2,0(a3)
    3f04:	00e6a223          	sw	a4,4(a3)
    3f08:	00878793          	addi	a5,a5,8
    3f0c:	00868693          	addi	a3,a3,8
    3f10:	f94798e3          	bne	a5,s4,3ea0 <keccak_absorb.constprop.2+0x1bc>
    3f14:	00040513          	mv	a0,s0
    3f18:	f5898993          	addi	s3,s3,-168
    3f1c:	000a8b13          	mv	s6,s5
    3f20:	819fd0ef          	jal	1738 <KeccakF1600_StatePermute>
    3f24:	0a8a0a13          	addi	s4,s4,168
    3f28:	01397663          	bgeu	s2,s3,3f34 <keccak_absorb.constprop.2+0x250>
    3f2c:	0a8a8a93          	addi	s5,s5,168
    3f30:	f69ff06f          	j	3e98 <keccak_absorb.constprop.2+0x1b4>
    3f34:	01812a03          	lw	s4,24(sp)
    3f38:	01412a83          	lw	s5,20(sp)
    3f3c:	0039d593          	srli	a1,s3,0x3
    3f40:	1e058863          	beqz	a1,4130 <keccak_absorb.constprop.2+0x44c>
    3f44:	00359593          	slli	a1,a1,0x3
    3f48:	ff84f613          	andi	a2,s1,-8
    3f4c:	00bb0e33          	add	t3,s6,a1
    3f50:	00c40633          	add	a2,s0,a2
    3f54:	000b0713          	mv	a4,s6
    3f58:	00174683          	lbu	a3,1(a4)
    3f5c:	00274783          	lbu	a5,2(a4)
    3f60:	00574303          	lbu	t1,5(a4)
    3f64:	00474f83          	lbu	t6,4(a4)
    3f68:	00674883          	lbu	a7,6(a4)
    3f6c:	00074f03          	lbu	t5,0(a4)
    3f70:	00374803          	lbu	a6,3(a4)
    3f74:	00774503          	lbu	a0,7(a4)
    3f78:	01079793          	slli	a5,a5,0x10
    3f7c:	00869693          	slli	a3,a3,0x8
    3f80:	00831313          	slli	t1,t1,0x8
    3f84:	00062e83          	lw	t4,0(a2)
    3f88:	00f6e6b3          	or	a3,a3,a5
    3f8c:	01f36333          	or	t1,t1,t6
    3f90:	00462783          	lw	a5,4(a2)
    3f94:	01089893          	slli	a7,a7,0x10
    3f98:	01e6e6b3          	or	a3,a3,t5
    3f9c:	01851513          	slli	a0,a0,0x18
    3fa0:	01881813          	slli	a6,a6,0x18
    3fa4:	0068e8b3          	or	a7,a7,t1
    3fa8:	00d86833          	or	a6,a6,a3
    3fac:	011566b3          	or	a3,a0,a7
    3fb0:	00d7c7b3          	xor	a5,a5,a3
    3fb4:	010ec533          	xor	a0,t4,a6
    3fb8:	00a62023          	sw	a0,0(a2)
    3fbc:	00f62223          	sw	a5,4(a2)
    3fc0:	00870713          	addi	a4,a4,8
    3fc4:	00860613          	addi	a2,a2,8
    3fc8:	f9c718e3          	bne	a4,t3,3f58 <keccak_absorb.constprop.2+0x274>
    3fcc:	40b98633          	sub	a2,s3,a1
    3fd0:	00b48933          	add	s2,s1,a1
    3fd4:	08060663          	beqz	a2,4060 <keccak_absorb.constprop.2+0x37c>
    3fd8:	00bb05b3          	add	a1,s6,a1
    3fdc:	00810513          	addi	a0,sp,8
    3fe0:	00012423          	sw	zero,8(sp)
    3fe4:	00012623          	sw	zero,12(sp)
    3fe8:	1b8010ef          	jal	51a0 <memcpy>
    3fec:	00a14783          	lbu	a5,10(sp)
    3ff0:	00914503          	lbu	a0,9(sp)
    3ff4:	00d14583          	lbu	a1,13(sp)
    3ff8:	00c14303          	lbu	t1,12(sp)
    3ffc:	00e14603          	lbu	a2,14(sp)
    4000:	ff897913          	andi	s2,s2,-8
    4004:	00814883          	lbu	a7,8(sp)
    4008:	00b14683          	lbu	a3,11(sp)
    400c:	00f14703          	lbu	a4,15(sp)
    4010:	01240433          	add	s0,s0,s2
    4014:	00851513          	slli	a0,a0,0x8
    4018:	01079793          	slli	a5,a5,0x10
    401c:	00859593          	slli	a1,a1,0x8
    4020:	00042803          	lw	a6,0(s0)
    4024:	00a7e7b3          	or	a5,a5,a0
    4028:	0065e5b3          	or	a1,a1,t1
    402c:	00442503          	lw	a0,4(s0)
    4030:	01061613          	slli	a2,a2,0x10
    4034:	0117e7b3          	or	a5,a5,a7
    4038:	01871713          	slli	a4,a4,0x18
    403c:	01869693          	slli	a3,a3,0x18
    4040:	00b66633          	or	a2,a2,a1
    4044:	00f6e6b3          	or	a3,a3,a5
    4048:	00c767b3          	or	a5,a4,a2
    404c:	00f547b3          	xor	a5,a0,a5
    4050:	00d84733          	xor	a4,a6,a3
    4054:	01348933          	add	s2,s1,s3
    4058:	00e42023          	sw	a4,0(s0)
    405c:	00f42223          	sw	a5,4(s0)
    4060:	02c12083          	lw	ra,44(sp)
    4064:	02812403          	lw	s0,40(sp)
    4068:	02412483          	lw	s1,36(sp)
    406c:	01c12983          	lw	s3,28(sp)
    4070:	01012b03          	lw	s6,16(sp)
    4074:	00090513          	mv	a0,s2
    4078:	02012903          	lw	s2,32(sp)
    407c:	03010113          	addi	sp,sp,48
    4080:	00008067          	ret
    4084:	00335793          	srli	a5,t1,0x3
    4088:	08078663          	beqz	a5,4114 <keccak_absorb.constprop.2+0x430>
    408c:	00379793          	slli	a5,a5,0x3
    4090:	ff84f693          	andi	a3,s1,-8
    4094:	01678e33          	add	t3,a5,s6
    4098:	00d406b3          	add	a3,s0,a3
    409c:	000b0793          	mv	a5,s6
    40a0:	0017c703          	lbu	a4,1(a5)
    40a4:	0027c883          	lbu	a7,2(a5)
    40a8:	0057c803          	lbu	a6,5(a5)
    40ac:	0047cf83          	lbu	t6,4(a5)
    40b0:	0067c503          	lbu	a0,6(a5)
    40b4:	0007cf03          	lbu	t5,0(a5)
    40b8:	0037c583          	lbu	a1,3(a5)
    40bc:	0077c603          	lbu	a2,7(a5)
    40c0:	01089893          	slli	a7,a7,0x10
    40c4:	00871713          	slli	a4,a4,0x8
    40c8:	00881813          	slli	a6,a6,0x8
    40cc:	0006ae83          	lw	t4,0(a3)
    40d0:	01176733          	or	a4,a4,a7
    40d4:	01f86833          	or	a6,a6,t6
    40d8:	0046a883          	lw	a7,4(a3)
    40dc:	01051513          	slli	a0,a0,0x10
    40e0:	01e76733          	or	a4,a4,t5
    40e4:	01861613          	slli	a2,a2,0x18
    40e8:	01859593          	slli	a1,a1,0x18
    40ec:	01056533          	or	a0,a0,a6
    40f0:	00e5e5b3          	or	a1,a1,a4
    40f4:	00a66733          	or	a4,a2,a0
    40f8:	00e8c733          	xor	a4,a7,a4
    40fc:	00bec633          	xor	a2,t4,a1
    4100:	00c6a023          	sw	a2,0(a3)
    4104:	00e6a223          	sw	a4,4(a3)
    4108:	00878793          	addi	a5,a5,8
    410c:	00868693          	addi	a3,a3,8
    4110:	f9c798e3          	bne	a5,t3,40a0 <keccak_absorb.constprop.2+0x3bc>
    4114:	013489b3          	add	s3,s1,s3
    4118:	00040513          	mv	a0,s0
    411c:	006b0b33          	add	s6,s6,t1
    4120:	f5898993          	addi	s3,s3,-168
    4124:	e14fd0ef          	jal	1738 <KeccakF1600_StatePermute>
    4128:	00000493          	li	s1,0
    412c:	d55ff06f          	j	3e80 <keccak_absorb.constprop.2+0x19c>
    4130:	00048913          	mv	s2,s1
    4134:	00098613          	mv	a2,s3
    4138:	e9dff06f          	j	3fd4 <keccak_absorb.constprop.2+0x2f0>
    413c:	001b0b13          	addi	s6,s6,1
    4140:	00148493          	addi	s1,s1,1
    4144:	00068993          	mv	s3,a3
    4148:	00078713          	mv	a4,a5
    414c:	cb1ff06f          	j	3dfc <keccak_absorb.constprop.2+0x118>
    4150:	005b0b13          	addi	s6,s6,5
    4154:	00548493          	addi	s1,s1,5
    4158:	00068993          	mv	s3,a3
    415c:	00078713          	mv	a4,a5
    4160:	c9dff06f          	j	3dfc <keccak_absorb.constprop.2+0x118>
    4164:	002b0b13          	addi	s6,s6,2
    4168:	00248493          	addi	s1,s1,2
    416c:	00068993          	mv	s3,a3
    4170:	00078713          	mv	a4,a5
    4174:	c89ff06f          	j	3dfc <keccak_absorb.constprop.2+0x118>
    4178:	003b0b13          	addi	s6,s6,3
    417c:	00348493          	addi	s1,s1,3
    4180:	00068993          	mv	s3,a3
    4184:	00078713          	mv	a4,a5
    4188:	c75ff06f          	j	3dfc <keccak_absorb.constprop.2+0x118>
    418c:	004b0b13          	addi	s6,s6,4
    4190:	00448493          	addi	s1,s1,4
    4194:	00068993          	mv	s3,a3
    4198:	00078713          	mv	a4,a5
    419c:	c61ff06f          	j	3dfc <keccak_absorb.constprop.2+0x118>
    41a0:	006b0b13          	addi	s6,s6,6
    41a4:	00648493          	addi	s1,s1,6
    41a8:	00068993          	mv	s3,a3
    41ac:	c51ff06f          	j	3dfc <keccak_absorb.constprop.2+0x118>

000041b0 <pqcrystals_fips202_ref_shake128_init>:
    41b0:	ff010113          	addi	sp,sp,-16
    41b4:	0c800613          	li	a2,200
    41b8:	00000593          	li	a1,0
    41bc:	00112623          	sw	ra,12(sp)
    41c0:	705000ef          	jal	50c4 <memset>
    41c4:	00c12083          	lw	ra,12(sp)
    41c8:	0c052423          	sw	zero,200(a0)
    41cc:	01010113          	addi	sp,sp,16
    41d0:	00008067          	ret

000041d4 <pqcrystals_fips202_ref_shake128_absorb>:
    41d4:	00058793          	mv	a5,a1
    41d8:	0c852583          	lw	a1,200(a0)
    41dc:	ff010113          	addi	sp,sp,-16
    41e0:	00060693          	mv	a3,a2
    41e4:	00078613          	mv	a2,a5
    41e8:	00812423          	sw	s0,8(sp)
    41ec:	00112623          	sw	ra,12(sp)
    41f0:	00050413          	mv	s0,a0
    41f4:	af1ff0ef          	jal	3ce4 <keccak_absorb.constprop.2>
    41f8:	00c12083          	lw	ra,12(sp)
    41fc:	0ca42423          	sw	a0,200(s0)
    4200:	00812403          	lw	s0,8(sp)
    4204:	01010113          	addi	sp,sp,16
    4208:	00008067          	ret

0000420c <pqcrystals_fips202_ref_shake128_finalize>:
    420c:	0c852783          	lw	a5,200(a0)
    4210:	0077f713          	andi	a4,a5,7
    4214:	00371713          	slli	a4,a4,0x3
    4218:	ff87f793          	andi	a5,a5,-8
    421c:	fe070693          	addi	a3,a4,-32
    4220:	00f507b3          	add	a5,a0,a5
    4224:	0406c063          	bltz	a3,4264 <pqcrystals_fips202_ref_shake128_finalize+0x58>
    4228:	01f00613          	li	a2,31
    422c:	00d61633          	sll	a2,a2,a3
    4230:	00000593          	li	a1,0
    4234:	0007a683          	lw	a3,0(a5)
    4238:	0047a703          	lw	a4,4(a5)
    423c:	80000837          	lui	a6,0x80000
    4240:	00b6c6b3          	xor	a3,a3,a1
    4244:	00c74733          	xor	a4,a4,a2
    4248:	00d7a023          	sw	a3,0(a5)
    424c:	00e7a223          	sw	a4,4(a5)
    4250:	0a452783          	lw	a5,164(a0)
    4254:	0c052423          	sw	zero,200(a0)
    4258:	0107c7b3          	xor	a5,a5,a6
    425c:	0af52223          	sw	a5,164(a0)
    4260:	00008067          	ret
    4264:	01f00593          	li	a1,31
    4268:	40e586b3          	sub	a3,a1,a4
    426c:	00f00613          	li	a2,15
    4270:	00e595b3          	sll	a1,a1,a4
    4274:	00d65633          	srl	a2,a2,a3
    4278:	fbdff06f          	j	4234 <pqcrystals_fips202_ref_shake128_finalize+0x28>

0000427c <pqcrystals_fips202_ref_shake128_squeezeblocks>:
    427c:	0c058463          	beqz	a1,4344 <pqcrystals_fips202_ref_shake128_squeezeblocks+0xc8>
    4280:	fe010113          	addi	sp,sp,-32
    4284:	01412423          	sw	s4,8(sp)
    4288:	0a850a13          	addi	s4,a0,168
    428c:	00812c23          	sw	s0,24(sp)
    4290:	00912a23          	sw	s1,20(sp)
    4294:	01212823          	sw	s2,16(sp)
    4298:	01312623          	sw	s3,12(sp)
    429c:	00112e23          	sw	ra,28(sp)
    42a0:	00058993          	mv	s3,a1
    42a4:	00050413          	mv	s0,a0
    42a8:	00060913          	mv	s2,a2
    42ac:	000a0493          	mv	s1,s4
    42b0:	00090513          	mv	a0,s2
    42b4:	c84fd0ef          	jal	1738 <KeccakF1600_StatePermute>
    42b8:	00040793          	mv	a5,s0
    42bc:	00090613          	mv	a2,s2
    42c0:	00062683          	lw	a3,0(a2)
    42c4:	00462703          	lw	a4,4(a2)
    42c8:	00878793          	addi	a5,a5,8
    42cc:	0086de93          	srli	t4,a3,0x8
    42d0:	0106de13          	srli	t3,a3,0x10
    42d4:	0186d313          	srli	t1,a3,0x18
    42d8:	00875893          	srli	a7,a4,0x8
    42dc:	01075813          	srli	a6,a4,0x10
    42e0:	01875593          	srli	a1,a4,0x18
    42e4:	ffd78ca3          	sb	t4,-7(a5)
    42e8:	fed78c23          	sb	a3,-8(a5)
    42ec:	fee78e23          	sb	a4,-4(a5)
    42f0:	ffc78d23          	sb	t3,-6(a5)
    42f4:	fe678da3          	sb	t1,-5(a5)
    42f8:	ff178ea3          	sb	a7,-3(a5)
    42fc:	ff078f23          	sb	a6,-2(a5)
    4300:	feb78fa3          	sb	a1,-1(a5)
    4304:	00860613          	addi	a2,a2,8
    4308:	faf49ce3          	bne	s1,a5,42c0 <pqcrystals_fips202_ref_shake128_squeezeblocks+0x44>
    430c:	fff98993          	addi	s3,s3,-1
    4310:	0a848493          	addi	s1,s1,168
    4314:	000a0413          	mv	s0,s4
    4318:	00098663          	beqz	s3,4324 <pqcrystals_fips202_ref_shake128_squeezeblocks+0xa8>
    431c:	0a8a0a13          	addi	s4,s4,168
    4320:	f91ff06f          	j	42b0 <pqcrystals_fips202_ref_shake128_squeezeblocks+0x34>
    4324:	01c12083          	lw	ra,28(sp)
    4328:	01812403          	lw	s0,24(sp)
    432c:	01412483          	lw	s1,20(sp)
    4330:	01012903          	lw	s2,16(sp)
    4334:	00c12983          	lw	s3,12(sp)
    4338:	00812a03          	lw	s4,8(sp)
    433c:	02010113          	addi	sp,sp,32
    4340:	00008067          	ret
    4344:	00008067          	ret

00004348 <pqcrystals_fips202_ref_shake256_init>:
    4348:	ff010113          	addi	sp,sp,-16
    434c:	0c800613          	li	a2,200
    4350:	00000593          	li	a1,0
    4354:	00112623          	sw	ra,12(sp)
    4358:	56d000ef          	jal	50c4 <memset>
    435c:	00c12083          	lw	ra,12(sp)
    4360:	0c052423          	sw	zero,200(a0)
    4364:	01010113          	addi	sp,sp,16
    4368:	00008067          	ret

0000436c <pqcrystals_fips202_ref_shake256_absorb>:
    436c:	00058793          	mv	a5,a1
    4370:	0c852583          	lw	a1,200(a0)
    4374:	ff010113          	addi	sp,sp,-16
    4378:	00060693          	mv	a3,a2
    437c:	00078613          	mv	a2,a5
    4380:	00812423          	sw	s0,8(sp)
    4384:	00112623          	sw	ra,12(sp)
    4388:	00050413          	mv	s0,a0
    438c:	c8cff0ef          	jal	3818 <keccak_absorb.constprop.1>
    4390:	00c12083          	lw	ra,12(sp)
    4394:	0ca42423          	sw	a0,200(s0)
    4398:	00812403          	lw	s0,8(sp)
    439c:	01010113          	addi	sp,sp,16
    43a0:	00008067          	ret

000043a4 <pqcrystals_fips202_ref_shake256_finalize>:
    43a4:	0c852783          	lw	a5,200(a0)
    43a8:	0077f713          	andi	a4,a5,7
    43ac:	00371713          	slli	a4,a4,0x3
    43b0:	ff87f793          	andi	a5,a5,-8
    43b4:	fe070693          	addi	a3,a4,-32
    43b8:	00f507b3          	add	a5,a0,a5
    43bc:	0406c063          	bltz	a3,43fc <pqcrystals_fips202_ref_shake256_finalize+0x58>
    43c0:	01f00613          	li	a2,31
    43c4:	00d61633          	sll	a2,a2,a3
    43c8:	00000593          	li	a1,0
    43cc:	0007a683          	lw	a3,0(a5)
    43d0:	0047a703          	lw	a4,4(a5)
    43d4:	80000837          	lui	a6,0x80000
    43d8:	00b6c6b3          	xor	a3,a3,a1
    43dc:	00c74733          	xor	a4,a4,a2
    43e0:	00d7a023          	sw	a3,0(a5)
    43e4:	00e7a223          	sw	a4,4(a5)
    43e8:	08452783          	lw	a5,132(a0)
    43ec:	0c052423          	sw	zero,200(a0)
    43f0:	0107c7b3          	xor	a5,a5,a6
    43f4:	08f52223          	sw	a5,132(a0)
    43f8:	00008067          	ret
    43fc:	01f00593          	li	a1,31
    4400:	40e586b3          	sub	a3,a1,a4
    4404:	00f00613          	li	a2,15
    4408:	00e595b3          	sll	a1,a1,a4
    440c:	00d65633          	srl	a2,a2,a3
    4410:	fbdff06f          	j	43cc <pqcrystals_fips202_ref_shake256_finalize+0x28>

00004414 <pqcrystals_fips202_ref_shake256_squeezeblocks>:
    4414:	0c058463          	beqz	a1,44dc <pqcrystals_fips202_ref_shake256_squeezeblocks+0xc8>
    4418:	fe010113          	addi	sp,sp,-32
    441c:	01412423          	sw	s4,8(sp)
    4420:	08850a13          	addi	s4,a0,136
    4424:	00812c23          	sw	s0,24(sp)
    4428:	00912a23          	sw	s1,20(sp)
    442c:	01212823          	sw	s2,16(sp)
    4430:	01312623          	sw	s3,12(sp)
    4434:	00112e23          	sw	ra,28(sp)
    4438:	00058993          	mv	s3,a1
    443c:	00050413          	mv	s0,a0
    4440:	00060913          	mv	s2,a2
    4444:	000a0493          	mv	s1,s4
    4448:	00090513          	mv	a0,s2
    444c:	aecfd0ef          	jal	1738 <KeccakF1600_StatePermute>
    4450:	00040793          	mv	a5,s0
    4454:	00090613          	mv	a2,s2
    4458:	00062683          	lw	a3,0(a2)
    445c:	00462703          	lw	a4,4(a2)
    4460:	00878793          	addi	a5,a5,8
    4464:	0086de93          	srli	t4,a3,0x8
    4468:	0106de13          	srli	t3,a3,0x10
    446c:	0186d313          	srli	t1,a3,0x18
    4470:	00875893          	srli	a7,a4,0x8
    4474:	01075813          	srli	a6,a4,0x10
    4478:	01875593          	srli	a1,a4,0x18
    447c:	ffd78ca3          	sb	t4,-7(a5)
    4480:	fed78c23          	sb	a3,-8(a5)
    4484:	fee78e23          	sb	a4,-4(a5)
    4488:	ffc78d23          	sb	t3,-6(a5)
    448c:	fe678da3          	sb	t1,-5(a5)
    4490:	ff178ea3          	sb	a7,-3(a5)
    4494:	ff078f23          	sb	a6,-2(a5)
    4498:	feb78fa3          	sb	a1,-1(a5)
    449c:	00860613          	addi	a2,a2,8
    44a0:	faf49ce3          	bne	s1,a5,4458 <pqcrystals_fips202_ref_shake256_squeezeblocks+0x44>
    44a4:	fff98993          	addi	s3,s3,-1
    44a8:	08848493          	addi	s1,s1,136
    44ac:	000a0413          	mv	s0,s4
    44b0:	00098663          	beqz	s3,44bc <pqcrystals_fips202_ref_shake256_squeezeblocks+0xa8>
    44b4:	088a0a13          	addi	s4,s4,136
    44b8:	f91ff06f          	j	4448 <pqcrystals_fips202_ref_shake256_squeezeblocks+0x34>
    44bc:	01c12083          	lw	ra,28(sp)
    44c0:	01812403          	lw	s0,24(sp)
    44c4:	01412483          	lw	s1,20(sp)
    44c8:	01012903          	lw	s2,16(sp)
    44cc:	00c12983          	lw	s3,12(sp)
    44d0:	00812a03          	lw	s4,8(sp)
    44d4:	02010113          	addi	sp,sp,32
    44d8:	00008067          	ret
    44dc:	00008067          	ret

000044e0 <pqcrystals_fips202_ref_shake256_squeeze>:
    44e0:	0c862683          	lw	a3,200(a2)
    44e4:	fe010113          	addi	sp,sp,-32
    44e8:	00112e23          	sw	ra,28(sp)
    44ec:	00c12623          	sw	a2,12(sp)
    44f0:	f01fe0ef          	jal	33f0 <keccak_squeeze.constprop.1>
    44f4:	00c12603          	lw	a2,12(sp)
    44f8:	01c12083          	lw	ra,28(sp)
    44fc:	0ca62423          	sw	a0,200(a2)
    4500:	02010113          	addi	sp,sp,32
    4504:	00008067          	ret

00004508 <pqcrystals_fips202_ref_shake256>:
    4508:	f0010113          	addi	sp,sp,-256
    450c:	0e812c23          	sw	s0,248(sp)
    4510:	01010413          	addi	s0,sp,16
    4514:	0e912a23          	sw	s1,244(sp)
    4518:	0f212823          	sw	s2,240(sp)
    451c:	0f312623          	sw	s3,236(sp)
    4520:	00060493          	mv	s1,a2
    4524:	00050913          	mv	s2,a0
    4528:	0c800613          	li	a2,200
    452c:	00058993          	mv	s3,a1
    4530:	00040513          	mv	a0,s0
    4534:	00000593          	li	a1,0
    4538:	0e112e23          	sw	ra,252(sp)
    453c:	00d12623          	sw	a3,12(sp)
    4540:	385000ef          	jal	50c4 <memset>
    4544:	00c12683          	lw	a3,12(sp)
    4548:	00048613          	mv	a2,s1
    454c:	00040513          	mv	a0,s0
    4550:	00000593          	li	a1,0
    4554:	0c012c23          	sw	zero,216(sp)
    4558:	ac0ff0ef          	jal	3818 <keccak_absorb.constprop.1>
    455c:	00757713          	andi	a4,a0,7
    4560:	00371713          	slli	a4,a4,0x3
    4564:	ff857793          	andi	a5,a0,-8
    4568:	fe070693          	addi	a3,a4,-32
    456c:	00f407b3          	add	a5,s0,a5
    4570:	0606c463          	bltz	a3,45d8 <pqcrystals_fips202_ref_shake256+0xd0>
    4574:	01f00613          	li	a2,31
    4578:	00d61633          	sll	a2,a2,a3
    457c:	00000593          	li	a1,0
    4580:	0007a683          	lw	a3,0(a5)
    4584:	0047a703          	lw	a4,4(a5)
    4588:	80000837          	lui	a6,0x80000
    458c:	00b6c6b3          	xor	a3,a3,a1
    4590:	00c74733          	xor	a4,a4,a2
    4594:	00d7a023          	sw	a3,0(a5)
    4598:	00e7a223          	sw	a4,4(a5)
    459c:	09412783          	lw	a5,148(sp)
    45a0:	00040613          	mv	a2,s0
    45a4:	00098593          	mv	a1,s3
    45a8:	00090513          	mv	a0,s2
    45ac:	0107c7b3          	xor	a5,a5,a6
    45b0:	00000693          	li	a3,0
    45b4:	08f12a23          	sw	a5,148(sp)
    45b8:	e39fe0ef          	jal	33f0 <keccak_squeeze.constprop.1>
    45bc:	0fc12083          	lw	ra,252(sp)
    45c0:	0f812403          	lw	s0,248(sp)
    45c4:	0f412483          	lw	s1,244(sp)
    45c8:	0f012903          	lw	s2,240(sp)
    45cc:	0ec12983          	lw	s3,236(sp)
    45d0:	10010113          	addi	sp,sp,256
    45d4:	00008067          	ret
    45d8:	01f00593          	li	a1,31
    45dc:	40e586b3          	sub	a3,a1,a4
    45e0:	00f00613          	li	a2,15
    45e4:	00e595b3          	sll	a1,a1,a4
    45e8:	00d65633          	srl	a2,a2,a3
    45ec:	f95ff06f          	j	4580 <pqcrystals_fips202_ref_shake256+0x78>

000045f0 <pqcrystals_dilithium2_ref_signature>:
    45f0:	ffff42b7          	lui	t0,0xffff4
    45f4:	a1010113          	addi	sp,sp,-1520
    45f8:	5e112623          	sw	ra,1516(sp)
    45fc:	5e812423          	sw	s0,1512(sp)
    4600:	5e912223          	sw	s1,1508(sp)
    4604:	5f212023          	sw	s2,1504(sp)
    4608:	5d312e23          	sw	s3,1500(sp)
    460c:	5d412c23          	sw	s4,1496(sp)
    4610:	5d612823          	sw	s6,1488(sp)
    4614:	5d712623          	sw	s7,1484(sp)
    4618:	5d812423          	sw	s8,1480(sp)
    461c:	5bb12e23          	sw	s11,1468(sp)
    4620:	5d512a23          	sw	s5,1492(sp)
    4624:	5d912223          	sw	s9,1476(sp)
    4628:	5da12023          	sw	s10,1472(sp)
    462c:	00058d93          	mv	s11,a1
    4630:	00510133          	add	sp,sp,t0
    4634:	100085b7          	lui	a1,0x10008
    4638:	01058593          	addi	a1,a1,16 # 10008010 <__stack_size+0xfff8010>
    463c:	00050c13          	mv	s8,a0
    4640:	00c10513          	addi	a0,sp,12
    4644:	00060993          	mv	s3,a2
    4648:	00070413          	mv	s0,a4
    464c:	00068a13          	mv	s4,a3
    4650:	189000ef          	jal	4fd8 <uart_init>
    4654:	00c10513          	addi	a0,sp,12
    4658:	04100593          	li	a1,65
    465c:	185000ef          	jal	4fe0 <uart_transmit_byte>
    4660:	00c10513          	addi	a0,sp,12
    4664:	04200593          	li	a1,66
    4668:	179000ef          	jal	4fe0 <uart_transmit_byte>
    466c:	000047b7          	lui	a5,0x4
    4670:	5b078793          	addi	a5,a5,1456 # 45b0 <pqcrystals_fips202_ref_shake256+0xa8>
    4674:	00f10933          	add	s2,sp,a5
    4678:	000037b7          	lui	a5,0x3
    467c:	5b078793          	addi	a5,a5,1456 # 35b0 <keccak_squeeze.constprop.1+0x1c0>
    4680:	00f104b3          	add	s1,sp,a5
    4684:	00040813          	mv	a6,s0
    4688:	00090793          	mv	a5,s2
    468c:	5b010713          	addi	a4,sp,1456
    4690:	00048693          	mv	a3,s1
    4694:	13010613          	addi	a2,sp,304
    4698:	10010593          	addi	a1,sp,256
    469c:	0e010513          	addi	a0,sp,224
    46a0:	434000ef          	jal	4ad4 <pqcrystals_dilithium2_ref_upack_sk>
    46a4:	01010413          	addi	s0,sp,16
    46a8:	00040513          	mv	a0,s0
    46ac:	c9dff0ef          	jal	4348 <pqcrystals_fips202_ref_shake256_init>
    46b0:	00c10513          	addi	a0,sp,12
    46b4:	04300593          	li	a1,67
    46b8:	129000ef          	jal	4fe0 <uart_transmit_byte>
    46bc:	10010593          	addi	a1,sp,256
    46c0:	00040513          	mv	a0,s0
    46c4:	03000613          	li	a2,48
    46c8:	ca5ff0ef          	jal	436c <pqcrystals_fips202_ref_shake256_absorb>
    46cc:	00098593          	mv	a1,s3
    46d0:	000a0613          	mv	a2,s4
    46d4:	00040513          	mv	a0,s0
    46d8:	c95ff0ef          	jal	436c <pqcrystals_fips202_ref_shake256_absorb>
    46dc:	00040513          	mv	a0,s0
    46e0:	cc5ff0ef          	jal	43a4 <pqcrystals_fips202_ref_shake256_finalize>
    46e4:	00040613          	mv	a2,s0
    46e8:	15010513          	addi	a0,sp,336
    46ec:	03000593          	li	a1,48
    46f0:	df1ff0ef          	jal	44e0 <pqcrystals_fips202_ref_shake256_squeeze>
    46f4:	13010613          	addi	a2,sp,304
    46f8:	05000693          	li	a3,80
    46fc:	18010513          	addi	a0,sp,384
    4700:	03000593          	li	a1,48
    4704:	e05ff0ef          	jal	4508 <pqcrystals_fips202_ref_shake256>
    4708:	00c10513          	addi	a0,sp,12
    470c:	04400593          	li	a1,68
    4710:	0d1000ef          	jal	4fe0 <uart_transmit_byte>
    4714:	00008537          	lui	a0,0x8
    4718:	5b050513          	addi	a0,a0,1456 # 85b0 <__stack_top+0xdb4>
    471c:	00250533          	add	a0,a0,sp
    4720:	0e010593          	addi	a1,sp,224
    4724:	a51fb0ef          	jal	174 <pqcrystals_dilithium2_ref_polyvec_matrix_expand>
    4728:	06100593          	li	a1,97
    472c:	00c10513          	addi	a0,sp,12
    4730:	0b1000ef          	jal	4fe0 <uart_transmit_byte>
    4734:	5b010513          	addi	a0,sp,1456
    4738:	bfdfb0ef          	jal	334 <pqcrystals_dilithium2_ref_polyvecl_ntt>
    473c:	06200593          	li	a1,98
    4740:	00c10513          	addi	a0,sp,12
    4744:	09d000ef          	jal	4fe0 <uart_transmit_byte>
    4748:	00090513          	mv	a0,s2
    474c:	f79fb0ef          	jal	6c4 <pqcrystals_dilithium2_ref_polyveck_ntt>
    4750:	06300593          	li	a1,99
    4754:	00c10513          	addi	a0,sp,12
    4758:	089000ef          	jal	4fe0 <uart_transmit_byte>
    475c:	00048513          	mv	a0,s1
    4760:	f65fb0ef          	jal	6c4 <pqcrystals_dilithium2_ref_polyveck_ntt>
    4764:	00c10513          	addi	a0,sp,12
    4768:	04600593          	li	a1,70
    476c:	075000ef          	jal	4fe0 <uart_transmit_byte>
    4770:	000017b7          	lui	a5,0x1
    4774:	5b078793          	addi	a5,a5,1456 # 15b0 <pqcrystals_dilithium2_ref_invntt_tomont+0x74>
    4778:	00f10bb3          	add	s7,sp,a5
    477c:	000027b7          	lui	a5,0x2
    4780:	5b078793          	addi	a5,a5,1456 # 25b0 <KeccakF1600_StatePermute+0xe78>
    4784:	00f109b3          	add	s3,sp,a5
    4788:	000057b7          	lui	a5,0x5
    478c:	5b078793          	addi	a5,a5,1456 # 55b0 <zetas+0x2d8>
    4790:	00f10b33          	add	s6,sp,a5
    4794:	00000913          	li	s2,0
    4798:	05200593          	li	a1,82
    479c:	00c10513          	addi	a0,sp,12
    47a0:	041000ef          	jal	4fe0 <uart_transmit_byte>
    47a4:	00090613          	mv	a2,s2
    47a8:	18010593          	addi	a1,sp,384
    47ac:	000b8513          	mv	a0,s7
    47b0:	a69fb0ef          	jal	218 <pqcrystals_dilithium2_ref_polyvecl_uniform_gamma1>
    47b4:	000b8793          	mv	a5,s7
    47b8:	00098713          	mv	a4,s3
    47bc:	0087a683          	lw	a3,8(a5)
    47c0:	0007a583          	lw	a1,0(a5)
    47c4:	0047a603          	lw	a2,4(a5)
    47c8:	00d72423          	sw	a3,8(a4)
    47cc:	00b72023          	sw	a1,0(a4)
    47d0:	00c72223          	sw	a2,4(a4)
    47d4:	00c7a683          	lw	a3,12(a5)
    47d8:	01078793          	addi	a5,a5,16
    47dc:	01070713          	addi	a4,a4,16
    47e0:	fed72e23          	sw	a3,-4(a4)
    47e4:	fd379ce3          	bne	a5,s3,47bc <pqcrystals_dilithium2_ref_signature+0x1cc>
    47e8:	00098513          	mv	a0,s3
    47ec:	b49fb0ef          	jal	334 <pqcrystals_dilithium2_ref_polyvecl_ntt>
    47f0:	000085b7          	lui	a1,0x8
    47f4:	5b058593          	addi	a1,a1,1456 # 85b0 <__stack_top+0xdb4>
    47f8:	00098613          	mv	a2,s3
    47fc:	002585b3          	add	a1,a1,sp
    4800:	000b0513          	mv	a0,s6
    4804:	c95fb0ef          	jal	498 <pqcrystals_dilithium2_ref_polyvec_matrix_pointwise_montgomery>
    4808:	04700593          	li	a1,71
    480c:	00c10513          	addi	a0,sp,12
    4810:	7d0000ef          	jal	4fe0 <uart_transmit_byte>
    4814:	000b0513          	mv	a0,s6
    4818:	d5dfb0ef          	jal	574 <pqcrystals_dilithium2_ref_polyveck_reduce>
    481c:	000b0513          	mv	a0,s6
    4820:	ee5fb0ef          	jal	704 <pqcrystals_dilithium2_ref_polyveck_invntt_tomont>
    4824:	000b0513          	mv	a0,s6
    4828:	d8dfb0ef          	jal	5b4 <pqcrystals_dilithium2_ref_polyveck_caddq>
    482c:	000067b7          	lui	a5,0x6
    4830:	5b078793          	addi	a5,a5,1456 # 65b0 <sk+0x5b0>
    4834:	00f104b3          	add	s1,sp,a5
    4838:	000b0613          	mv	a2,s6
    483c:	00048593          	mv	a1,s1
    4840:	000b0513          	mv	a0,s6
    4844:	fd9fb0ef          	jal	81c <pqcrystals_dilithium2_ref_polyveck_decompose>
    4848:	000b0593          	mv	a1,s6
    484c:	000c0513          	mv	a0,s8
    4850:	8b0fc0ef          	jal	900 <pqcrystals_dilithium2_ref_polyveck_pack_w1>
    4854:	04a00593          	li	a1,74
    4858:	00c10513          	addi	a0,sp,12
    485c:	01010413          	addi	s0,sp,16
    4860:	780000ef          	jal	4fe0 <uart_transmit_byte>
    4864:	00040513          	mv	a0,s0
    4868:	ae1ff0ef          	jal	4348 <pqcrystals_fips202_ref_shake256_init>
    486c:	15010593          	addi	a1,sp,336
    4870:	00040513          	mv	a0,s0
    4874:	03000613          	li	a2,48
    4878:	af5ff0ef          	jal	436c <pqcrystals_fips202_ref_shake256_absorb>
    487c:	000c0593          	mv	a1,s8
    4880:	30000613          	li	a2,768
    4884:	00040513          	mv	a0,s0
    4888:	ae5ff0ef          	jal	436c <pqcrystals_fips202_ref_shake256_absorb>
    488c:	00040513          	mv	a0,s0
    4890:	b15ff0ef          	jal	43a4 <pqcrystals_fips202_ref_shake256_finalize>
    4894:	00040613          	mv	a2,s0
    4898:	000c0513          	mv	a0,s8
    489c:	02000593          	li	a1,32
    48a0:	c41ff0ef          	jal	44e0 <pqcrystals_fips202_ref_shake256_squeeze>
    48a4:	000c0593          	mv	a1,s8
    48a8:	1b010513          	addi	a0,sp,432
    48ac:	cecfc0ef          	jal	d98 <pqcrystals_dilithium2_ref_poly_challenge>
    48b0:	1b010513          	addi	a0,sp,432
    48b4:	97cfc0ef          	jal	a30 <pqcrystals_dilithium2_ref_poly_ntt>
    48b8:	00c10513          	addi	a0,sp,12
    48bc:	04b00593          	li	a1,75
    48c0:	720000ef          	jal	4fe0 <uart_transmit_byte>
    48c4:	5b010613          	addi	a2,sp,1456
    48c8:	1b010593          	addi	a1,sp,432
    48cc:	00098513          	mv	a0,s3
    48d0:	ae5fb0ef          	jal	3b4 <pqcrystals_dilithium2_ref_polyvecl_pointwise_poly_montgomery>
    48d4:	00098513          	mv	a0,s3
    48d8:	a9dfb0ef          	jal	374 <pqcrystals_dilithium2_ref_polyvecl_invntt_tomont>
    48dc:	00098593          	mv	a1,s3
    48e0:	000b8613          	mv	a2,s7
    48e4:	00098513          	mv	a0,s3
    48e8:	9e5fb0ef          	jal	2cc <pqcrystals_dilithium2_ref_polyvecl_add>
    48ec:	00098513          	mv	a0,s3
    48f0:	99dfb0ef          	jal	28c <pqcrystals_dilithium2_ref_polyvecl_reduce>
    48f4:	000205b7          	lui	a1,0x20
    48f8:	00098513          	mv	a0,s3
    48fc:	fb258593          	addi	a1,a1,-78 # 1ffb2 <__stack_size+0xffb2>
    4900:	c05fb0ef          	jal	504 <pqcrystals_dilithium2_ref_polyvecl_chknorm>
    4904:	0e051063          	bnez	a0,49e4 <pqcrystals_dilithium2_ref_signature+0x3f4>
    4908:	000077b7          	lui	a5,0x7
    490c:	5b078793          	addi	a5,a5,1456 # 75b0 <__BSS_END__+0x1c8>
    4910:	00f10433          	add	s0,sp,a5
    4914:	000047b7          	lui	a5,0x4
    4918:	5b078793          	addi	a5,a5,1456 # 45b0 <pqcrystals_fips202_ref_shake256+0xa8>
    491c:	00f10633          	add	a2,sp,a5
    4920:	1b010593          	addi	a1,sp,432
    4924:	00040513          	mv	a0,s0
    4928:	e1dfb0ef          	jal	744 <pqcrystals_dilithium2_ref_polyveck_pointwise_poly_montgomery>
    492c:	00040513          	mv	a0,s0
    4930:	dd5fb0ef          	jal	704 <pqcrystals_dilithium2_ref_polyveck_invntt_tomont>
    4934:	00048593          	mv	a1,s1
    4938:	00040613          	mv	a2,s0
    493c:	00048513          	mv	a0,s1
    4940:	d1dfb0ef          	jal	65c <pqcrystals_dilithium2_ref_polyveck_sub>
    4944:	00048513          	mv	a0,s1
    4948:	c2dfb0ef          	jal	574 <pqcrystals_dilithium2_ref_polyveck_reduce>
    494c:	000175b7          	lui	a1,0x17
    4950:	00048513          	mv	a0,s1
    4954:	3b258593          	addi	a1,a1,946 # 173b2 <__stack_size+0x73b2>
    4958:	e55fb0ef          	jal	7ac <pqcrystals_dilithium2_ref_polyveck_chknorm>
    495c:	08051463          	bnez	a0,49e4 <pqcrystals_dilithium2_ref_signature+0x3f4>
    4960:	04c00593          	li	a1,76
    4964:	00c10513          	addi	a0,sp,12
    4968:	678000ef          	jal	4fe0 <uart_transmit_byte>
    496c:	000037b7          	lui	a5,0x3
    4970:	5b078793          	addi	a5,a5,1456 # 35b0 <keccak_squeeze.constprop.1+0x1c0>
    4974:	1b010593          	addi	a1,sp,432
    4978:	00f10633          	add	a2,sp,a5
    497c:	00040513          	mv	a0,s0
    4980:	dc5fb0ef          	jal	744 <pqcrystals_dilithium2_ref_polyveck_pointwise_poly_montgomery>
    4984:	00040513          	mv	a0,s0
    4988:	d7dfb0ef          	jal	704 <pqcrystals_dilithium2_ref_polyveck_invntt_tomont>
    498c:	00040513          	mv	a0,s0
    4990:	be5fb0ef          	jal	574 <pqcrystals_dilithium2_ref_polyveck_reduce>
    4994:	000175b7          	lui	a1,0x17
    4998:	00040513          	mv	a0,s0
    499c:	40058593          	addi	a1,a1,1024 # 17400 <__stack_size+0x7400>
    49a0:	e0dfb0ef          	jal	7ac <pqcrystals_dilithium2_ref_polyveck_chknorm>
    49a4:	04051063          	bnez	a0,49e4 <pqcrystals_dilithium2_ref_signature+0x3f4>
    49a8:	04d00593          	li	a1,77
    49ac:	00c10513          	addi	a0,sp,12
    49b0:	630000ef          	jal	4fe0 <uart_transmit_byte>
    49b4:	00040613          	mv	a2,s0
    49b8:	00048593          	mv	a1,s1
    49bc:	00048513          	mv	a0,s1
    49c0:	c35fb0ef          	jal	5f4 <pqcrystals_dilithium2_ref_polyveck_add>
    49c4:	00048513          	mv	a0,s1
    49c8:	bedfb0ef          	jal	5b4 <pqcrystals_dilithium2_ref_polyveck_caddq>
    49cc:	000b0613          	mv	a2,s6
    49d0:	00048593          	mv	a1,s1
    49d4:	00040513          	mv	a0,s0
    49d8:	eadfb0ef          	jal	884 <pqcrystals_dilithium2_ref_polyveck_make_hint>
    49dc:	05000793          	li	a5,80
    49e0:	00a7fa63          	bgeu	a5,a0,49f4 <pqcrystals_dilithium2_ref_signature+0x404>
    49e4:	00190913          	addi	s2,s2,1
    49e8:	01091913          	slli	s2,s2,0x10
    49ec:	01095913          	srli	s2,s2,0x10
    49f0:	da9ff06f          	j	4798 <pqcrystals_dilithium2_ref_signature+0x1a8>
    49f4:	00040693          	mv	a3,s0
    49f8:	00098613          	mv	a2,s3
    49fc:	000c0593          	mv	a1,s8
    4a00:	000c0513          	mv	a0,s8
    4a04:	330000ef          	jal	4d34 <pqcrystals_dilithium2_ref_pack_sig>
    4a08:	000017b7          	lui	a5,0x1
    4a0c:	97478793          	addi	a5,a5,-1676 # 974 <pqcrystals_dilithium2_ref_poly_reduce+0x24>
    4a10:	00c10513          	addi	a0,sp,12
    4a14:	00fda023          	sw	a5,0(s11)
    4a18:	04e00593          	li	a1,78
    4a1c:	5c4000ef          	jal	4fe0 <uart_transmit_byte>
    4a20:	0000c2b7          	lui	t0,0xc
    4a24:	00510133          	add	sp,sp,t0
    4a28:	5ec12083          	lw	ra,1516(sp)
    4a2c:	5e812403          	lw	s0,1512(sp)
    4a30:	5e412483          	lw	s1,1508(sp)
    4a34:	5e012903          	lw	s2,1504(sp)
    4a38:	5dc12983          	lw	s3,1500(sp)
    4a3c:	5d812a03          	lw	s4,1496(sp)
    4a40:	5d412a83          	lw	s5,1492(sp)
    4a44:	5d012b03          	lw	s6,1488(sp)
    4a48:	5cc12b83          	lw	s7,1484(sp)
    4a4c:	5c812c03          	lw	s8,1480(sp)
    4a50:	5c412c83          	lw	s9,1476(sp)
    4a54:	5c012d03          	lw	s10,1472(sp)
    4a58:	5bc12d83          	lw	s11,1468(sp)
    4a5c:	00000513          	li	a0,0
    4a60:	5f010113          	addi	sp,sp,1520
    4a64:	00008067          	ret

00004a68 <pqcrystals_dilithium2_ref>:
    4a68:	fe010113          	addi	sp,sp,-32
    4a6c:	00112e23          	sw	ra,28(sp)
    4a70:	02068663          	beqz	a3,4a9c <pqcrystals_dilithium2_ref+0x34>
    4a74:	00d50833          	add	a6,a0,a3
    4a78:	fff60613          	addi	a2,a2,-1
    4a7c:	7ff80813          	addi	a6,a6,2047 # 800007ff <__stack_size+0x7fff07ff>
    4a80:	17480813          	addi	a6,a6,372
    4a84:	00d607b3          	add	a5,a2,a3
    4a88:	0007c883          	lbu	a7,0(a5)
    4a8c:	fff78793          	addi	a5,a5,-1
    4a90:	fff80813          	addi	a6,a6,-1
    4a94:	011800a3          	sb	a7,1(a6)
    4a98:	fef618e3          	bne	a2,a5,4a88 <pqcrystals_dilithium2_ref+0x20>
    4a9c:	7ff50613          	addi	a2,a0,2047
    4aa0:	17560613          	addi	a2,a2,373
    4aa4:	00d12623          	sw	a3,12(sp)
    4aa8:	00b12423          	sw	a1,8(sp)
    4aac:	b45ff0ef          	jal	45f0 <pqcrystals_dilithium2_ref_signature>
    4ab0:	00812583          	lw	a1,8(sp)
    4ab4:	00c12683          	lw	a3,12(sp)
    4ab8:	01c12083          	lw	ra,28(sp)
    4abc:	0005a783          	lw	a5,0(a1)
    4ac0:	00000513          	li	a0,0
    4ac4:	00d787b3          	add	a5,a5,a3
    4ac8:	00f5a023          	sw	a5,0(a1)
    4acc:	02010113          	addi	sp,sp,32
    4ad0:	00008067          	ret

00004ad4 <pqcrystals_dilithium2_ref_upack_sk>:
    4ad4:	fe010113          	addi	sp,sp,-32
    4ad8:	00812c23          	sw	s0,24(sp)
    4adc:	00080413          	mv	s0,a6
    4ae0:	00a86833          	or	a6,a6,a0
    4ae4:	01412423          	sw	s4,8(sp)
    4ae8:	01512223          	sw	s5,4(sp)
    4aec:	00112e23          	sw	ra,28(sp)
    4af0:	00912a23          	sw	s1,20(sp)
    4af4:	01212823          	sw	s2,16(sp)
    4af8:	01312623          	sw	s3,12(sp)
    4afc:	00387813          	andi	a6,a6,3
    4b00:	00078a93          	mv	s5,a5
    4b04:	00068a13          	mv	s4,a3
    4b08:	00050793          	mv	a5,a0
    4b0c:	1c081463          	bnez	a6,4cd4 <pqcrystals_dilithium2_ref_upack_sk+0x200>
    4b10:	fff50693          	addi	a3,a0,-1
    4b14:	408686b3          	sub	a3,a3,s0
    4b18:	0036b693          	sltiu	a3,a3,3
    4b1c:	1a069c63          	bnez	a3,4cd4 <pqcrystals_dilithium2_ref_upack_sk+0x200>
    4b20:	00042783          	lw	a5,0(s0)
    4b24:	02040813          	addi	a6,s0,32
    4b28:	00f52023          	sw	a5,0(a0)
    4b2c:	00442783          	lw	a5,4(s0)
    4b30:	00f52223          	sw	a5,4(a0)
    4b34:	00842783          	lw	a5,8(s0)
    4b38:	00f52423          	sw	a5,8(a0)
    4b3c:	00c42783          	lw	a5,12(s0)
    4b40:	00f52623          	sw	a5,12(a0)
    4b44:	01042783          	lw	a5,16(s0)
    4b48:	00f52823          	sw	a5,16(a0)
    4b4c:	01442783          	lw	a5,20(s0)
    4b50:	00f52a23          	sw	a5,20(a0)
    4b54:	01842783          	lw	a5,24(s0)
    4b58:	00f52c23          	sw	a5,24(a0)
    4b5c:	01c42783          	lw	a5,28(s0)
    4b60:	00f52e23          	sw	a5,28(a0)
    4b64:	010666b3          	or	a3,a2,a6
    4b68:	0036f693          	andi	a3,a3,3
    4b6c:	00060793          	mv	a5,a2
    4b70:	1a069263          	bnez	a3,4d14 <pqcrystals_dilithium2_ref_upack_sk+0x240>
    4b74:	fdf60693          	addi	a3,a2,-33
    4b78:	408686b3          	sub	a3,a3,s0
    4b7c:	0036b693          	sltiu	a3,a3,3
    4b80:	18069a63          	bnez	a3,4d14 <pqcrystals_dilithium2_ref_upack_sk+0x240>
    4b84:	02042783          	lw	a5,32(s0)
    4b88:	04040893          	addi	a7,s0,64
    4b8c:	00f62023          	sw	a5,0(a2)
    4b90:	02442783          	lw	a5,36(s0)
    4b94:	00f62223          	sw	a5,4(a2)
    4b98:	02842783          	lw	a5,40(s0)
    4b9c:	00f62423          	sw	a5,8(a2)
    4ba0:	02c42783          	lw	a5,44(s0)
    4ba4:	00f62623          	sw	a5,12(a2)
    4ba8:	03042783          	lw	a5,48(s0)
    4bac:	00f62823          	sw	a5,16(a2)
    4bb0:	03442783          	lw	a5,52(s0)
    4bb4:	00f62a23          	sw	a5,20(a2)
    4bb8:	03842783          	lw	a5,56(s0)
    4bbc:	00f62c23          	sw	a5,24(a2)
    4bc0:	03c42783          	lw	a5,60(s0)
    4bc4:	00f62e23          	sw	a5,28(a2)
    4bc8:	0115e7b3          	or	a5,a1,a7
    4bcc:	0037f793          	andi	a5,a5,3
    4bd0:	00058813          	mv	a6,a1
    4bd4:	12079063          	bnez	a5,4cf4 <pqcrystals_dilithium2_ref_upack_sk+0x220>
    4bd8:	fbf58793          	addi	a5,a1,-65
    4bdc:	408787b3          	sub	a5,a5,s0
    4be0:	0037b793          	sltiu	a5,a5,3
    4be4:	10079863          	bnez	a5,4cf4 <pqcrystals_dilithium2_ref_upack_sk+0x220>
    4be8:	04042783          	lw	a5,64(s0)
    4bec:	07040493          	addi	s1,s0,112
    4bf0:	00f5a023          	sw	a5,0(a1)
    4bf4:	04442783          	lw	a5,68(s0)
    4bf8:	00f5a223          	sw	a5,4(a1)
    4bfc:	04842783          	lw	a5,72(s0)
    4c00:	00f5a423          	sw	a5,8(a1)
    4c04:	04c42783          	lw	a5,76(s0)
    4c08:	00f5a623          	sw	a5,12(a1)
    4c0c:	05042783          	lw	a5,80(s0)
    4c10:	00f5a823          	sw	a5,16(a1)
    4c14:	05442783          	lw	a5,84(s0)
    4c18:	00f5aa23          	sw	a5,20(a1)
    4c1c:	05842783          	lw	a5,88(s0)
    4c20:	00f5ac23          	sw	a5,24(a1)
    4c24:	05c42783          	lw	a5,92(s0)
    4c28:	00f5ae23          	sw	a5,28(a1)
    4c2c:	06042783          	lw	a5,96(s0)
    4c30:	02f5a023          	sw	a5,32(a1)
    4c34:	06442783          	lw	a5,100(s0)
    4c38:	02f5a223          	sw	a5,36(a1)
    4c3c:	06842783          	lw	a5,104(s0)
    4c40:	02f5a423          	sw	a5,40(a1)
    4c44:	06c42783          	lw	a5,108(s0)
    4c48:	02f5a623          	sw	a5,44(a1)
    4c4c:	00070993          	mv	s3,a4
    4c50:	1f040913          	addi	s2,s0,496
    4c54:	00048593          	mv	a1,s1
    4c58:	00098513          	mv	a0,s3
    4c5c:	06048493          	addi	s1,s1,96
    4c60:	abcfc0ef          	jal	f1c <pqcrystals_dilithium2_ref_polyeta_unpack>
    4c64:	40098993          	addi	s3,s3,1024
    4c68:	fe9916e3          	bne	s2,s1,4c54 <pqcrystals_dilithium2_ref_upack_sk+0x180>
    4c6c:	000a8993          	mv	s3,s5
    4c70:	37040493          	addi	s1,s0,880
    4c74:	00090593          	mv	a1,s2
    4c78:	00098513          	mv	a0,s3
    4c7c:	06090913          	addi	s2,s2,96
    4c80:	a9cfc0ef          	jal	f1c <pqcrystals_dilithium2_ref_polyeta_unpack>
    4c84:	40098993          	addi	s3,s3,1024
    4c88:	ff2496e3          	bne	s1,s2,4c74 <pqcrystals_dilithium2_ref_upack_sk+0x1a0>
    4c8c:	7ff40413          	addi	s0,s0,2047
    4c90:	1f140413          	addi	s0,s0,497
    4c94:	000a0913          	mv	s2,s4
    4c98:	00048593          	mv	a1,s1
    4c9c:	00090513          	mv	a0,s2
    4ca0:	1a048493          	addi	s1,s1,416
    4ca4:	b5cfc0ef          	jal	1000 <pqcrystals_dilithium2_ref_polyt0_unpack>
    4ca8:	40090913          	addi	s2,s2,1024
    4cac:	fe8496e3          	bne	s1,s0,4c98 <pqcrystals_dilithium2_ref_upack_sk+0x1c4>
    4cb0:	01c12083          	lw	ra,28(sp)
    4cb4:	01812403          	lw	s0,24(sp)
    4cb8:	01412483          	lw	s1,20(sp)
    4cbc:	01012903          	lw	s2,16(sp)
    4cc0:	00c12983          	lw	s3,12(sp)
    4cc4:	00812a03          	lw	s4,8(sp)
    4cc8:	00412a83          	lw	s5,4(sp)
    4ccc:	02010113          	addi	sp,sp,32
    4cd0:	00008067          	ret
    4cd4:	02040813          	addi	a6,s0,32
    4cd8:	00040893          	mv	a7,s0
    4cdc:	0008c683          	lbu	a3,0(a7) # 20000 <__stack_size+0x10000>
    4ce0:	00188893          	addi	a7,a7,1
    4ce4:	00178793          	addi	a5,a5,1
    4ce8:	fed78fa3          	sb	a3,-1(a5)
    4cec:	ff1818e3          	bne	a6,a7,4cdc <pqcrystals_dilithium2_ref_upack_sk+0x208>
    4cf0:	e75ff06f          	j	4b64 <pqcrystals_dilithium2_ref_upack_sk+0x90>
    4cf4:	00088613          	mv	a2,a7
    4cf8:	07040493          	addi	s1,s0,112
    4cfc:	00064783          	lbu	a5,0(a2)
    4d00:	00160613          	addi	a2,a2,1
    4d04:	00180813          	addi	a6,a6,1
    4d08:	fef80fa3          	sb	a5,-1(a6)
    4d0c:	fe9618e3          	bne	a2,s1,4cfc <pqcrystals_dilithium2_ref_upack_sk+0x228>
    4d10:	f3dff06f          	j	4c4c <pqcrystals_dilithium2_ref_upack_sk+0x178>
    4d14:	00080613          	mv	a2,a6
    4d18:	04040893          	addi	a7,s0,64
    4d1c:	00064683          	lbu	a3,0(a2)
    4d20:	00160613          	addi	a2,a2,1
    4d24:	00178793          	addi	a5,a5,1
    4d28:	fed78fa3          	sb	a3,-1(a5)
    4d2c:	ff1618e3          	bne	a2,a7,4d1c <pqcrystals_dilithium2_ref_upack_sk+0x248>
    4d30:	e99ff06f          	j	4bc8 <pqcrystals_dilithium2_ref_upack_sk+0xf4>

00004d34 <pqcrystals_dilithium2_ref_pack_sig>:
    4d34:	fe010113          	addi	sp,sp,-32
    4d38:	00a5e733          	or	a4,a1,a0
    4d3c:	00912a23          	sw	s1,20(sp)
    4d40:	01412423          	sw	s4,8(sp)
    4d44:	00112e23          	sw	ra,28(sp)
    4d48:	00812c23          	sw	s0,24(sp)
    4d4c:	01212823          	sw	s2,16(sp)
    4d50:	01312623          	sw	s3,12(sp)
    4d54:	00377713          	andi	a4,a4,3
    4d58:	00050493          	mv	s1,a0
    4d5c:	00068a13          	mv	s4,a3
    4d60:	00058793          	mv	a5,a1
    4d64:	10071063          	bnez	a4,4e64 <pqcrystals_dilithium2_ref_pack_sig+0x130>
    4d68:	40b50733          	sub	a4,a0,a1
    4d6c:	fff70713          	addi	a4,a4,-1
    4d70:	00373713          	sltiu	a4,a4,3
    4d74:	0e071863          	bnez	a4,4e64 <pqcrystals_dilithium2_ref_pack_sig+0x130>
    4d78:	0005a783          	lw	a5,0(a1)
    4d7c:	00f52023          	sw	a5,0(a0)
    4d80:	0045a783          	lw	a5,4(a1)
    4d84:	00f52223          	sw	a5,4(a0)
    4d88:	0085a783          	lw	a5,8(a1)
    4d8c:	00f52423          	sw	a5,8(a0)
    4d90:	00c5a783          	lw	a5,12(a1)
    4d94:	00f52623          	sw	a5,12(a0)
    4d98:	0105a783          	lw	a5,16(a1)
    4d9c:	00f52823          	sw	a5,16(a0)
    4da0:	0145a783          	lw	a5,20(a1)
    4da4:	00f52a23          	sw	a5,20(a0)
    4da8:	0185a783          	lw	a5,24(a1)
    4dac:	00f52c23          	sw	a5,24(a0)
    4db0:	01c5a783          	lw	a5,28(a1)
    4db4:	00f52e23          	sw	a5,28(a0)
    4db8:	7ff48413          	addi	s0,s1,2047
    4dbc:	00060993          	mv	s3,a2
    4dc0:	12140413          	addi	s0,s0,289
    4dc4:	02048913          	addi	s2,s1,32
    4dc8:	00098593          	mv	a1,s3
    4dcc:	00090513          	mv	a0,s2
    4dd0:	24090913          	addi	s2,s2,576
    4dd4:	bc0fc0ef          	jal	1194 <pqcrystals_dilithium2_ref_polyz_pack>
    4dd8:	40098993          	addi	s3,s3,1024
    4ddc:	ff2416e3          	bne	s0,s2,4dc8 <pqcrystals_dilithium2_ref_pack_sig+0x94>
    4de0:	05400613          	li	a2,84
    4de4:	00000593          	li	a1,0
    4de8:	00040513          	mv	a0,s0
    4dec:	2d8000ef          	jal	50c4 <memset>
    4df0:	00001937          	lui	s2,0x1
    4df4:	7ff48893          	addi	a7,s1,2047
    4df8:	000a0693          	mv	a3,s4
    4dfc:	17188893          	addi	a7,a7,369
    4e00:	012a0333          	add	t1,s4,s2
    4e04:	00000613          	li	a2,0
    4e08:	10000813          	li	a6,256
    4e0c:	00068713          	mv	a4,a3
    4e10:	00000793          	li	a5,0
    4e14:	00072583          	lw	a1,0(a4)
    4e18:	00c40533          	add	a0,s0,a2
    4e1c:	00470713          	addi	a4,a4,4
    4e20:	00058663          	beqz	a1,4e2c <pqcrystals_dilithium2_ref_pack_sig+0xf8>
    4e24:	00f50023          	sb	a5,0(a0)
    4e28:	00160613          	addi	a2,a2,1
    4e2c:	00178793          	addi	a5,a5,1
    4e30:	ff0792e3          	bne	a5,a6,4e14 <pqcrystals_dilithium2_ref_pack_sig+0xe0>
    4e34:	00c88023          	sb	a2,0(a7)
    4e38:	40068693          	addi	a3,a3,1024
    4e3c:	00188893          	addi	a7,a7,1
    4e40:	fcd316e3          	bne	t1,a3,4e0c <pqcrystals_dilithium2_ref_pack_sig+0xd8>
    4e44:	01c12083          	lw	ra,28(sp)
    4e48:	01812403          	lw	s0,24(sp)
    4e4c:	01412483          	lw	s1,20(sp)
    4e50:	01012903          	lw	s2,16(sp)
    4e54:	00c12983          	lw	s3,12(sp)
    4e58:	00812a03          	lw	s4,8(sp)
    4e5c:	02010113          	addi	sp,sp,32
    4e60:	00008067          	ret
    4e64:	02058593          	addi	a1,a1,32
    4e68:	00048713          	mv	a4,s1
    4e6c:	0007c683          	lbu	a3,0(a5)
    4e70:	00178793          	addi	a5,a5,1
    4e74:	00170713          	addi	a4,a4,1
    4e78:	fed70fa3          	sb	a3,-1(a4)
    4e7c:	fef598e3          	bne	a1,a5,4e6c <pqcrystals_dilithium2_ref_pack_sig+0x138>
    4e80:	f39ff06f          	j	4db8 <pqcrystals_dilithium2_ref_pack_sig+0x84>

00004e84 <pqcrystals_dilithium2_ref_decompose>:
    4e84:	07f58693          	addi	a3,a1,127
    4e88:	000037b7          	lui	a5,0x3
    4e8c:	c0b78793          	addi	a5,a5,-1013 # 2c0b <KeccakF1600_StatePermute+0x14d3>
    4e90:	4076d693          	srai	a3,a3,0x7
    4e94:	02f686b3          	mul	a3,a3,a5
    4e98:	00800337          	lui	t1,0x800
    4e9c:	02b00713          	li	a4,43
    4ea0:	00050893          	mv	a7,a0
    4ea4:	fffd27b7          	lui	a5,0xfffd2
    4ea8:	80078793          	addi	a5,a5,-2048 # fffd1800 <__stack_size+0xfffc1800>
    4eac:	003ff637          	lui	a2,0x3ff
    4eb0:	007fe837          	lui	a6,0x7fe
    4eb4:	00180813          	addi	a6,a6,1 # 7fe001 <__stack_size+0x7ee001>
    4eb8:	006686b3          	add	a3,a3,t1
    4ebc:	4186d693          	srai	a3,a3,0x18
    4ec0:	40d70533          	sub	a0,a4,a3
    4ec4:	41f55513          	srai	a0,a0,0x1f
    4ec8:	fff54513          	not	a0,a0
    4ecc:	00d57533          	and	a0,a0,a3
    4ed0:	02f507b3          	mul	a5,a0,a5
    4ed4:	00b785b3          	add	a1,a5,a1
    4ed8:	40b60633          	sub	a2,a2,a1
    4edc:	41f65613          	srai	a2,a2,0x1f
    4ee0:	01067633          	and	a2,a2,a6
    4ee4:	40c585b3          	sub	a1,a1,a2
    4ee8:	00b8a023          	sw	a1,0(a7)
    4eec:	00008067          	ret

00004ef0 <pqcrystals_dilithium2_ref_make_hint>:
    4ef0:	fffe97b7          	lui	a5,0xfffe9
    4ef4:	bff78793          	addi	a5,a5,-1025 # fffe8bff <__stack_size+0xfffd8bff>
    4ef8:	007d0737          	lui	a4,0x7d0
    4efc:	00f507b3          	add	a5,a0,a5
    4f00:	80070713          	addi	a4,a4,-2048 # 7cf800 <__stack_size+0x7bf800>
    4f04:	02f76263          	bltu	a4,a5,4f28 <pqcrystals_dilithium2_ref_make_hint+0x38>
    4f08:	ff8197b7          	lui	a5,0xff819
    4f0c:	3ff78793          	addi	a5,a5,1023 # ff8193ff <__stack_size+0xff8093ff>
    4f10:	00f50533          	add	a0,a0,a5
    4f14:	0015b593          	seqz	a1,a1
    4f18:	00153513          	seqz	a0,a0
    4f1c:	00b57533          	and	a0,a0,a1
    4f20:	00154513          	xori	a0,a0,1
    4f24:	00008067          	ret
    4f28:	00000513          	li	a0,0
    4f2c:	00008067          	ret

00004f30 <pqcrystals_dilithium2_ref_dilithium_shake128_stream_init>:
    4f30:	fd010113          	addi	sp,sp,-48
    4f34:	02112623          	sw	ra,44(sp)
    4f38:	02812423          	sw	s0,40(sp)
    4f3c:	00c11e23          	sh	a2,28(sp)
    4f40:	00050413          	mv	s0,a0
    4f44:	00b12623          	sw	a1,12(sp)
    4f48:	a68ff0ef          	jal	41b0 <pqcrystals_fips202_ref_shake128_init>
    4f4c:	00c12583          	lw	a1,12(sp)
    4f50:	00040513          	mv	a0,s0
    4f54:	02000613          	li	a2,32
    4f58:	a7cff0ef          	jal	41d4 <pqcrystals_fips202_ref_shake128_absorb>
    4f5c:	01c10593          	addi	a1,sp,28
    4f60:	00040513          	mv	a0,s0
    4f64:	00200613          	li	a2,2
    4f68:	a6cff0ef          	jal	41d4 <pqcrystals_fips202_ref_shake128_absorb>
    4f6c:	00040513          	mv	a0,s0
    4f70:	a9cff0ef          	jal	420c <pqcrystals_fips202_ref_shake128_finalize>
    4f74:	02c12083          	lw	ra,44(sp)
    4f78:	02812403          	lw	s0,40(sp)
    4f7c:	03010113          	addi	sp,sp,48
    4f80:	00008067          	ret

00004f84 <pqcrystals_dilithium2_ref_dilithium_shake256_stream_init>:
    4f84:	fd010113          	addi	sp,sp,-48
    4f88:	02112623          	sw	ra,44(sp)
    4f8c:	02812423          	sw	s0,40(sp)
    4f90:	00c11e23          	sh	a2,28(sp)
    4f94:	00050413          	mv	s0,a0
    4f98:	00b12623          	sw	a1,12(sp)
    4f9c:	bacff0ef          	jal	4348 <pqcrystals_fips202_ref_shake256_init>
    4fa0:	00c12583          	lw	a1,12(sp)
    4fa4:	00040513          	mv	a0,s0
    4fa8:	03000613          	li	a2,48
    4fac:	bc0ff0ef          	jal	436c <pqcrystals_fips202_ref_shake256_absorb>
    4fb0:	01c10593          	addi	a1,sp,28
    4fb4:	00040513          	mv	a0,s0
    4fb8:	00200613          	li	a2,2
    4fbc:	bb0ff0ef          	jal	436c <pqcrystals_fips202_ref_shake256_absorb>
    4fc0:	00040513          	mv	a0,s0
    4fc4:	be0ff0ef          	jal	43a4 <pqcrystals_fips202_ref_shake256_finalize>
    4fc8:	02c12083          	lw	ra,44(sp)
    4fcc:	02812403          	lw	s0,40(sp)
    4fd0:	03010113          	addi	sp,sp,48
    4fd4:	00008067          	ret

00004fd8 <uart_init>:
    4fd8:	00b52023          	sw	a1,0(a0)
    4fdc:	00008067          	ret

00004fe0 <uart_transmit_byte>:
    4fe0:	10008737          	lui	a4,0x10008
    4fe4:	01270713          	addi	a4,a4,18 # 10008012 <__stack_size+0xfff8012>
    4fe8:	00000013          	nop
    4fec:	00000013          	nop
    4ff0:	00075783          	lhu	a5,0(a4)
    4ff4:	0027f793          	andi	a5,a5,2
    4ff8:	fe0798e3          	bnez	a5,4fe8 <uart_transmit_byte+0x8>
    4ffc:	00000013          	nop
    5000:	00000013          	nop
    5004:	00000013          	nop
    5008:	00000013          	nop
    500c:	100087b7          	lui	a5,0x10008
    5010:	00b7a823          	sw	a1,16(a5) # 10008010 <__stack_size+0xfff8010>
    5014:	00008067          	ret

00005018 <uart_transmit_string>:
    5018:	04060663          	beqz	a2,5064 <uart_transmit_string+0x4c>
    501c:	10008737          	lui	a4,0x10008
    5020:	10008537          	lui	a0,0x10008
    5024:	00c58633          	add	a2,a1,a2
    5028:	01270713          	addi	a4,a4,18 # 10008012 <__stack_size+0xfff8012>
    502c:	01050513          	addi	a0,a0,16 # 10008010 <__stack_size+0xfff8010>
    5030:	0005c683          	lbu	a3,0(a1)
    5034:	00158593          	addi	a1,a1,1
    5038:	00000013          	nop
    503c:	00000013          	nop
    5040:	00075783          	lhu	a5,0(a4)
    5044:	0027f793          	andi	a5,a5,2
    5048:	fe0798e3          	bnez	a5,5038 <uart_transmit_string+0x20>
    504c:	00000013          	nop
    5050:	00000013          	nop
    5054:	00000013          	nop
    5058:	00000013          	nop
    505c:	00d52023          	sw	a3,0(a0)
    5060:	fcb618e3          	bne	a2,a1,5030 <uart_transmit_string+0x18>
    5064:	00008067          	ret

00005068 <exc>:
    5068:	890fb06f          	j	f8 <exc_handler>

0000506c <ssi>:
    506c:	00000013          	nop

00005070 <hsi>:
    5070:	00000013          	nop

00005074 <msi>:
    5074:	88cfb06f          	j	100 <msi_handler>

00005078 <uti>:
    5078:	00000013          	nop

0000507c <sti>:
    507c:	00000013          	nop

00005080 <hti>:
    5080:	00000013          	nop

00005084 <mti>:
    5084:	870fb06f          	j	f4 <mti_handler>

00005088 <uei>:
    5088:	00000013          	nop

0000508c <sei>:
    508c:	00000013          	nop

00005090 <hei>:
    5090:	00000013          	nop

00005094 <mei>:
    5094:	868fb06f          	j	fc <mei_handler>
    5098:	00000013          	nop
    509c:	00000013          	nop
    50a0:	00000013          	nop
    50a4:	00000013          	nop

000050a8 <fast_irq0>:
    50a8:	85cfb06f          	j	104 <fast_irq0_handler>

000050ac <fast_irq1>:
    50ac:	8c4fb06f          	j	170 <fast_irq1_handler>

000050b0 <SET_MTVEC_VECTOR_MODE>:
    50b0:	00000797          	auipc	a5,0x0
    50b4:	fb878793          	addi	a5,a5,-72 # 5068 <exc>
    50b8:	0017e793          	ori	a5,a5,1
    50bc:	30579073          	csrw	mtvec,a5
    50c0:	00008067          	ret

000050c4 <memset>:
    50c4:	00f00313          	li	t1,15
    50c8:	00050713          	mv	a4,a0
    50cc:	02c37e63          	bgeu	t1,a2,5108 <memset+0x44>
    50d0:	00f77793          	andi	a5,a4,15
    50d4:	0a079063          	bnez	a5,5174 <memset+0xb0>
    50d8:	08059263          	bnez	a1,515c <memset+0x98>
    50dc:	ff067693          	andi	a3,a2,-16
    50e0:	00f67613          	andi	a2,a2,15
    50e4:	00e686b3          	add	a3,a3,a4
    50e8:	00b72023          	sw	a1,0(a4)
    50ec:	00b72223          	sw	a1,4(a4)
    50f0:	00b72423          	sw	a1,8(a4)
    50f4:	00b72623          	sw	a1,12(a4)
    50f8:	01070713          	addi	a4,a4,16
    50fc:	fed766e3          	bltu	a4,a3,50e8 <memset+0x24>
    5100:	00061463          	bnez	a2,5108 <memset+0x44>
    5104:	00008067          	ret
    5108:	40c306b3          	sub	a3,t1,a2
    510c:	00269693          	slli	a3,a3,0x2
    5110:	00000297          	auipc	t0,0x0
    5114:	005686b3          	add	a3,a3,t0
    5118:	00c68067          	jr	12(a3)
    511c:	00b70723          	sb	a1,14(a4)
    5120:	00b706a3          	sb	a1,13(a4)
    5124:	00b70623          	sb	a1,12(a4)
    5128:	00b705a3          	sb	a1,11(a4)
    512c:	00b70523          	sb	a1,10(a4)
    5130:	00b704a3          	sb	a1,9(a4)
    5134:	00b70423          	sb	a1,8(a4)
    5138:	00b703a3          	sb	a1,7(a4)
    513c:	00b70323          	sb	a1,6(a4)
    5140:	00b702a3          	sb	a1,5(a4)
    5144:	00b70223          	sb	a1,4(a4)
    5148:	00b701a3          	sb	a1,3(a4)
    514c:	00b70123          	sb	a1,2(a4)
    5150:	00b700a3          	sb	a1,1(a4)
    5154:	00b70023          	sb	a1,0(a4)
    5158:	00008067          	ret
    515c:	0ff5f593          	zext.b	a1,a1
    5160:	00859693          	slli	a3,a1,0x8
    5164:	00d5e5b3          	or	a1,a1,a3
    5168:	01059693          	slli	a3,a1,0x10
    516c:	00d5e5b3          	or	a1,a1,a3
    5170:	f6dff06f          	j	50dc <memset+0x18>
    5174:	00279693          	slli	a3,a5,0x2
    5178:	00000297          	auipc	t0,0x0
    517c:	005686b3          	add	a3,a3,t0
    5180:	00008293          	mv	t0,ra
    5184:	fa0680e7          	jalr	-96(a3)
    5188:	00028093          	mv	ra,t0
    518c:	ff078793          	addi	a5,a5,-16
    5190:	40f70733          	sub	a4,a4,a5
    5194:	00f60633          	add	a2,a2,a5
    5198:	f6c378e3          	bgeu	t1,a2,5108 <memset+0x44>
    519c:	f3dff06f          	j	50d8 <memset+0x14>

000051a0 <memcpy>:
    51a0:	00a5c7b3          	xor	a5,a1,a0
    51a4:	0037f793          	andi	a5,a5,3
    51a8:	00c508b3          	add	a7,a0,a2
    51ac:	06079663          	bnez	a5,5218 <memcpy+0x78>
    51b0:	00463613          	sltiu	a2,a2,4
    51b4:	06061263          	bnez	a2,5218 <memcpy+0x78>
    51b8:	00357793          	andi	a5,a0,3
    51bc:	00050713          	mv	a4,a0
    51c0:	0c079a63          	bnez	a5,5294 <memcpy+0xf4>
    51c4:	ffc8f613          	andi	a2,a7,-4
    51c8:	40e606b3          	sub	a3,a2,a4
    51cc:	02000793          	li	a5,32
    51d0:	06d7c463          	blt	a5,a3,5238 <memcpy+0x98>
    51d4:	00058693          	mv	a3,a1
    51d8:	00070793          	mv	a5,a4
    51dc:	02c77a63          	bgeu	a4,a2,5210 <memcpy+0x70>
    51e0:	0006a803          	lw	a6,0(a3)
    51e4:	00478793          	addi	a5,a5,4
    51e8:	00468693          	addi	a3,a3,4
    51ec:	ff07ae23          	sw	a6,-4(a5)
    51f0:	fec7e8e3          	bltu	a5,a2,51e0 <memcpy+0x40>
    51f4:	fff60613          	addi	a2,a2,-1 # 3fefff <__stack_size+0x3eefff>
    51f8:	40e60633          	sub	a2,a2,a4
    51fc:	ffc67613          	andi	a2,a2,-4
    5200:	00458593          	addi	a1,a1,4
    5204:	00470713          	addi	a4,a4,4
    5208:	00c585b3          	add	a1,a1,a2
    520c:	00c70733          	add	a4,a4,a2
    5210:	01176863          	bltu	a4,a7,5220 <memcpy+0x80>
    5214:	00008067          	ret
    5218:	00050713          	mv	a4,a0
    521c:	ff157ce3          	bgeu	a0,a7,5214 <memcpy+0x74>
    5220:	0005c783          	lbu	a5,0(a1)
    5224:	00170713          	addi	a4,a4,1
    5228:	00158593          	addi	a1,a1,1
    522c:	fef70fa3          	sb	a5,-1(a4)
    5230:	fee898e3          	bne	a7,a4,5220 <memcpy+0x80>
    5234:	00008067          	ret
    5238:	0005a683          	lw	a3,0(a1)
    523c:	0045a283          	lw	t0,4(a1)
    5240:	0085af83          	lw	t6,8(a1)
    5244:	00c5af03          	lw	t5,12(a1)
    5248:	0105ae83          	lw	t4,16(a1)
    524c:	0145ae03          	lw	t3,20(a1)
    5250:	0185a303          	lw	t1,24(a1)
    5254:	01c5a803          	lw	a6,28(a1)
    5258:	00d72023          	sw	a3,0(a4)
    525c:	0205a683          	lw	a3,32(a1)
    5260:	02470713          	addi	a4,a4,36
    5264:	fe572023          	sw	t0,-32(a4)
    5268:	fed72e23          	sw	a3,-4(a4)
    526c:	fff72223          	sw	t6,-28(a4)
    5270:	40e606b3          	sub	a3,a2,a4
    5274:	ffe72423          	sw	t5,-24(a4)
    5278:	ffd72623          	sw	t4,-20(a4)
    527c:	ffc72823          	sw	t3,-16(a4)
    5280:	fe672a23          	sw	t1,-12(a4)
    5284:	ff072c23          	sw	a6,-8(a4)
    5288:	02458593          	addi	a1,a1,36
    528c:	fad7c6e3          	blt	a5,a3,5238 <memcpy+0x98>
    5290:	f45ff06f          	j	51d4 <memcpy+0x34>
    5294:	0005c683          	lbu	a3,0(a1)
    5298:	00170713          	addi	a4,a4,1
    529c:	00377793          	andi	a5,a4,3
    52a0:	fed70fa3          	sb	a3,-1(a4)
    52a4:	00158593          	addi	a1,a1,1
    52a8:	f0078ee3          	beqz	a5,51c4 <memcpy+0x24>
    52ac:	0005c683          	lbu	a3,0(a1)
    52b0:	00170713          	addi	a4,a4,1
    52b4:	00377793          	andi	a5,a4,3
    52b8:	fed70fa3          	sb	a3,-1(a4)
    52bc:	00158593          	addi	a1,a1,1
    52c0:	fc079ae3          	bnez	a5,5294 <memcpy+0xf4>
    52c4:	f01ff06f          	j	51c4 <memcpy+0x24>

Disassembly of section .rodata:

000052c8 <zetas-0x10>:
    52c8:	20544f47          	.insn	4, 0x20544f47
    52cc:	4f48                	.insn	2, 0x4f48
    52ce:	4e52                	.insn	2, 0x4e52
    52d0:	5445                	.insn	2, 0x5445
    52d2:	0a21                	.insn	2, 0x0a21
    52d4:	0000                	.insn	2, 0x0000
	...

000052d8 <zetas>:
    52d8:	0000                	.insn	2, 0x0000
    52da:	0000                	.insn	2, 0x0000
    52dc:	000064f7          	.insn	4, 0x64f7
    52e0:	3102                	.insn	2, 0x3102
    52e2:	ffd8                	.insn	2, 0xffd8
    52e4:	fff81503          	lh	a0,-1(a6)
    52e8:	9e44                	.insn	2, 0x9e44
    52ea:	21180003          	lb	zero,529(a6)
    52ee:	fff4                	.insn	2, 0xfff4
    52f0:	a128                	.insn	2, 0xa128
    52f2:	fff2                	.insn	2, 0xfff2
    52f4:	1e24                	.insn	2, 0x1e24
    52f6:	de2b0007          	.insn	4, 0xde2b0007
    52fa:	e92b001b          	.insn	4, 0xe92b001b
    52fe:	84ad0023          	sb	a0,-1984(s10)
    5302:	fffa                	.insn	2, 0xfffa
    5304:	ffe0147f 002f9a75 	.insn	12, 0xffd3fb09002f9a75ffe0147f
    530c:	ffd3fb09 
    5310:	7a49                	.insn	2, 0x7a49
    5312:	e527002f          	.insn	4, 0xe527002f
    5316:	0028                	.insn	2, 0x0028
    5318:	9658                	.insn	2, 0x9658
    531a:	0029                	.insn	2, 0x0029
    531c:	a070                	.insn	2, 0xa070
    531e:	85a4000f          	.insn	4, 0x85a4000f
    5322:	b788ffef          	jal	t6,fff9469a <__stack_size+0xfff8469a>
    5326:	0036                	.insn	2, 0x0036
    5328:	9d90                	.insn	2, 0x9d90
    532a:	eaa0fff7          	.insn	4, 0xeaa0fff7
    532e:	ffee                	.insn	2, 0xffee
    5330:	f968                	.insn	2, 0xf968
    5332:	d37b0027          	.insn	4, 0xd37b0027
    5336:	ffdf add6 ffdf      	.insn	6, 0xffdfadd6ffdf
    533c:	ffc51ae7          	.insn	4, 0xffc51ae7
    5340:	ffeaa4f7          	.insn	4, 0xffeaa4f7
    5344:	fc98                	.insn	2, 0xfc98
    5346:	ffcd                	.insn	2, 0xffcd
    5348:	d035                	.insn	2, 0xd035
    534a:	001a                	.insn	2, 0x001a
    534c:	b422                	.insn	2, 0xb422
    534e:	ffff                	.insn	2, 0xffff
    5350:	3201                	.insn	2, 0x3201
    5352:	003d                	.insn	2, 0x003d
    5354:	45c5                	.insn	2, 0x45c5
    5356:	0004                	.insn	2, 0x0004
    5358:	00294a67          	.insn	4, 0x00294a67
    535c:	7620                	.insn	2, 0x7620
    535e:	0001                	.insn	2, 0x0001
    5360:	f4cd                	.insn	2, 0xf4cd
    5362:	002e                	.insn	2, 0x002e
    5364:	dec5                	.insn	2, 0xdec5
    5366:	0035                	.insn	2, 0x0035
    5368:	ffe6a503          	lw	a0,-2(a3)
    536c:	302c                	.insn	2, 0x302c
    536e:	ffc9                	.insn	2, 0xffc9
    5370:	47d4                	.insn	2, 0x47d4
    5372:	ffd9                	.insn	2, 0xffd9
    5374:	003bbeaf          	.insn	4, 0x003bbeaf
    5378:	1585                	.insn	2, 0x1585
    537a:	ffc5                	.insn	2, 0xffc5
    537c:	8e7c                	.insn	2, 0x8e7c
    537e:	ffd1                	.insn	2, 0xffd1
    5380:	8a96                	.insn	2, 0x8a96
    5382:	0036                	.insn	2, 0x0036
    5384:	3e41                	.insn	2, 0x3e41
    5386:	ffd4                	.insn	2, 0xffd4
    5388:	0400                	.insn	2, 0x0400
    538a:	0036                	.insn	2, 0x0036
    538c:	6a4d                	.insn	2, 0x6a4d
    538e:	d69cfffb          	.insn	4, 0xd69cfffb
    5392:	c55d0023          	sb	s5,-960(s10)
    5396:	123dfff7          	.insn	4, 0x123dfff7
    539a:	ffe6                	.insn	2, 0xffe6
    539c:	ead6                	.insn	2, 0xead6
    539e:	ffe6                	.insn	2, 0xffe6
    53a0:	7e1e                	.insn	2, 0x7e1e
    53a2:	0035                	.insn	2, 0x0035
    53a4:	af59                	.insn	2, 0xaf59
    53a6:	ffc5                	.insn	2, 0xffc5
    53a8:	0035843f ffdf5617 	.insn	8, 0xffdf56170035843f
    53b0:	945c                	.insn	2, 0x945c
    53b2:	738cffe7          	.insn	4, 0x738cffe7
    53b6:	0038                	.insn	2, 0x0038
    53b8:	63a8                	.insn	2, 0x63a8
    53ba:	000c                	.insn	2, 0x000c
    53bc:	1b9a                	.insn	2, 0x1b9a
    53be:	0008                	.insn	2, 0x0008
    53c0:	8f76                	.insn	2, 0x8f76
    53c2:	000e                	.insn	2, 0x000e
    53c4:	003b3853          	.insn	4, 0x003b3853
    53c8:	8534                	.insn	2, 0x8534
    53ca:	fc30003b          	.insn	4, 0xfc30003b
    53ce:	ffd8                	.insn	2, 0xffd8
    53d0:	9d54                	.insn	2, 0x9d54
    53d2:	001f 4f2d ffd5      	.insn	6, 0xffd54f2d001f
    53d8:	06e5                	.insn	2, 0x06e5
    53da:	ffc4                	.insn	2, 0xffc4
    53dc:	ac81                	.insn	2, 0xac81
    53de:	ffe8                	.insn	2, 0xffe8
    53e0:	ffc7e1cf          	.insn	4, 0xffc7e1cf
    53e4:	9819                	.insn	2, 0x9819
    53e6:	ffd1                	.insn	2, 0xffd1
    53e8:	d65d                	.insn	2, 0xd65d
    53ea:	ffe9                	.insn	2, 0xffe9
    53ec:	09ee                	.insn	2, 0x09ee
    53ee:	0035                	.insn	2, 0x0035
    53f0:	002135c7          	.insn	4, 0x002135c7
    53f4:	ffe7cfbb          	.insn	4, 0xffe7cfbb
    53f8:	cf75                	.insn	2, 0xcf75
    53fa:	ffec                	.insn	2, 0xffec
    53fc:	9772                	.insn	2, 0x9772
    53fe:	001d                	.insn	2, 0x001d
    5400:	b072                	.insn	2, 0xb072
    5402:	ffc1                	.insn	2, 0xffc1
    5404:	bcf6                	.insn	2, 0xbcf6
    5406:	fff0                	.insn	2, 0xfff0
    5408:	5280                	.insn	2, 0x5280
    540a:	d2aeffcf          	.insn	4, 0xd2aeffcf
    540e:	90e0ffcf          	.insn	4, 0x90e0ffcf
    5412:	ffc8                	.insn	2, 0xffc8
    5414:	efca                	.insn	2, 0xefca
    5416:	0001                	.insn	2, 0x0001
    5418:	10f2                	.insn	2, 0x10f2
    541a:	0034                	.insn	2, 0x0034
    541c:	fe85                	.insn	2, 0xfe85
    541e:	fff0                	.insn	2, 0xfff0
    5420:	c638                	.insn	2, 0xc638
    5422:	0020                	.insn	2, 0x0020
    5424:	6e9f 0029 b7a3      	.insn	6, 0xb7a300296e9f
    542a:	ffd2                	.insn	2, 0xffd2
    542c:	ffc7a44b          	.insn	4, 0xffc7a44b
    5430:	ba6d                	.insn	2, 0xba6d
    5432:	fff9                	.insn	2, 0xfff9
    5434:	3409                	.insn	2, 0x3409
    5436:	ffda                	.insn	2, 0xffda
    5438:	c282                	.insn	2, 0xc282
    543a:	fff5                	.insn	2, 0xfff5
    543c:	ffed4113          	xori	sp,s10,-2
    5440:	ffffa63b          	.insn	4, 0xffffa63b
    5444:	ffec09f7          	.insn	4, 0xffec09f7
    5448:	2bdd                	.insn	2, 0x2bdd
    544a:	fffa                	.insn	2, 0xfffa
    544c:	95d4                	.insn	2, 0x95d4
    544e:	0014                	.insn	2, 0x0014
    5450:	001c4563          	blt	s8,ra,545a <zetas+0x182>
    5454:	2c62                	.insn	2, 0x2c62
    5456:	ffea                	.insn	2, 0xffea
    5458:	fbe9                	.insn	2, 0xfbe9
    545a:	ffcc                	.insn	2, 0xffcc
    545c:	0af0                	.insn	2, 0x0af0
    545e:	0004                	.insn	2, 0x0004
    5460:	0007c417          	auipc	s0,0x7c
    5464:	4588                	.insn	2, 0x4588
    5466:	ad00002f          	.insn	4, 0xad00002f
    546a:	0000                	.insn	2, 0x0000
    546c:	36be                	.insn	2, 0x36be
    546e:	cd44ffef          	jal	t6,fff54942 <__stack_size+0xfff44942>
    5472:	000d                	.insn	2, 0x000d
    5474:	675a                	.insn	2, 0x675a
    5476:	003c                	.insn	2, 0x003c
    5478:	2bca                	.insn	2, 0x2bca
    547a:	de7effc7          	.insn	4, 0xde7effc7
    547e:	ffff                	.insn	2, 0xffff
    5480:	3948                	.insn	2, 0x3948
    5482:	0019                	.insn	2, 0x0019
    5484:	69c0                	.insn	2, 0x69c0
    5486:	ffce                	.insn	2, 0xffce
    5488:	756c                	.insn	2, 0x756c
    548a:	0024                	.insn	2, 0x0024
    548c:	c7df fffc 98a1      	.insn	6, 0x98a1fffcc7df
    5492:	e808000b          	.insn	4, 0xe808000b
    5496:	e46cffeb          	.insn	4, 0xe46cffeb
    549a:	0002                	.insn	2, 0x0002
    549c:	c808                	.insn	2, 0xc808
    549e:	ffc9                	.insn	2, 0xffc9
    54a0:	36c2                	.insn	2, 0x36c2
    54a2:	0030                	.insn	2, 0x0030
    54a4:	bff6                	.insn	2, 0xbff6
    54a6:	3c93ffe3          	bgeu	t2,s1,6084 <sk+0x84>
    54aa:	4ae0ffdb          	.insn	4, 0x4ae0ffdb
    54ae:	fffd                	.insn	2, 0xfffd
    54b0:	1305                	.insn	2, 0x1305
    54b2:	0014                	.insn	2, 0x0014
    54b4:	7792                	.insn	2, 0x7792
    54b6:	0014                	.insn	2, 0x0014
    54b8:	9e25                	.insn	2, 0x9e25
    54ba:	d0e00013          	li	zero,-754
    54be:	9944ffe7          	.insn	4, 0x9944ffe7
    54c2:	0802fff3          	.insn	4, 0x0802fff3
    54c6:	ffea                	.insn	2, 0xffea
    54c8:	eea2                	.insn	2, 0xeea2
    54ca:	ffd1                	.insn	2, 0xffd1
    54cc:	c79c                	.insn	2, 0xc79c
    54ce:	ffc4                	.insn	2, 0xffc4
    54d0:	ffc8a057          	.insn	4, 0xffc8a057
    54d4:	97d9                	.insn	2, 0x97d9
    54d6:	003a                	.insn	2, 0x003a
    54d8:	001fea93          	ori	s5,t6,1
    54dc:	ff5a                	.insn	2, 0xff5a
    54de:	58d40033          	.insn	4, 0x58d40033
    54e2:	41f80023          	sb	t6,1024(a6)
    54e6:	003a                	.insn	2, 0x003a
    54e8:	ff72                	.insn	2, 0xff72
    54ea:	ffcc                	.insn	2, 0xffcc
    54ec:	00223dfb          	.insn	4, 0x00223dfb
    54f0:	ab9f ffda a422      	.insn	6, 0xa422ffdaab9f
    54f6:	ffc9                	.insn	2, 0xffc9
    54f8:	12f5                	.insn	2, 0x12f5
    54fa:	0004                	.insn	2, 0x0004
    54fc:	00252587          	.insn	4, 0x00252587
    5500:	24f0                	.insn	2, 0x24f0
    5502:	ffed                	.insn	2, 0xffed
    5504:	9b5d                	.insn	2, 0x9b5d
    5506:	0035                	.insn	2, 0x0035
    5508:	48a0                	.insn	2, 0x48a0
    550a:	ffca                	.insn	2, 0xffca
    550c:	a2fc                	.insn	2, 0xa2fc
    550e:	ffc6                	.insn	2, 0xffc6
    5510:	bb56                	.insn	2, 0xbb56
    5512:	ffed                	.insn	2, 0xffed
    5514:	45de                	.insn	2, 0x45de
    5516:	be5effcf          	.insn	4, 0xbe5effcf
    551a:	000d                	.insn	2, 0x000d
    551c:	5e1a                	.insn	2, 0x5e1a
    551e:	001c                	.insn	2, 0x001c
    5520:	e0e6                	.insn	2, 0xe0e6
    5522:	000d                	.insn	2, 0x000d
    5524:	7f5a                	.insn	2, 0x7f5a
    5526:	000c                	.insn	2, 0x000c
    5528:	00078f83          	lb	t6,0(a5)
    552c:	628a                	.insn	2, 0x628a
    552e:	5704ffe7          	.insn	4, 0x5704ffe7
    5532:	ffff                	.insn	2, 0xffff
    5534:	06fc                	.insn	2, 0x06fc
    5536:	fff8                	.insn	2, 0xfff8
    5538:	0021                	.insn	2, 0x0021
    553a:	fff6                	.insn	2, 0xfff6
    553c:	5af6                	.insn	2, 0x5af6
    553e:	ffd0                	.insn	2, 0xffd0
    5540:	0084                	.insn	2, 0x0084
    5542:	001f ef86 0030      	.insn	6, 0x0030ef86001f
    5548:	b97d                	.insn	2, 0xb97d
    554a:	ffc9                	.insn	2, 0xffc9
    554c:	fcd6                	.insn	2, 0xfcd6
    554e:	4592fff7          	.insn	4, 0x4592fff7
    5552:	fff4                	.insn	2, 0xfff4
    5554:	21c2                	.insn	2, 0x21c2
    5556:	ffc9                	.insn	2, 0xffc9
    5558:	3919                	.insn	2, 0x3919
    555a:	0005                	.insn	2, 0x0005
    555c:	610c                	.insn	2, 0x610c
    555e:	0004                	.insn	2, 0x0004
    5560:	cd41                	.insn	2, 0xcd41
    5562:	ffda                	.insn	2, 0xffda
    5564:	003eb01b          	.insn	4, 0x003eb01b
    5568:	003472e7          	.insn	4, 0x003472e7
    556c:	ffcd003b          	.insn	4, 0xffcd003b
    5570:	001a7cc7          	.insn	4, 0x001a7cc7
    5574:	1924                	.insn	2, 0x1924
    5576:	5ee50003          	lb	zero,1518(a0)
    557a:	1199002b          	.insn	4, 0x1199002b
    557e:	0029                	.insn	2, 0x0029
    5580:	7a3a                	.insn	2, 0x7a3a
    5582:	ffd8                	.insn	2, 0xffd8
    5584:	4d71                	.insn	2, 0x4d71
    5586:	e11c0013          	addi	zero,s8,-495
    558a:	003d                	.insn	2, 0x003d
    558c:	0984                	.insn	2, 0x0984
    558e:	f0510013          	addi	zero,sp,-251
    5592:	0025                	.insn	2, 0x0025
    5594:	5a46                	.insn	2, 0x5a46
    5596:	0018                	.insn	2, 0x0018
    5598:	8518                	.insn	2, 0x8518
    559a:	ffc6                	.insn	2, 0xffc6
    559c:	14be                	.insn	2, 0x14be
    559e:	38910013          	addi	zero,sp,905
    55a2:	0028                	.insn	2, 0x0028
    55a4:	db90                	.insn	2, 0xdb90
    55a6:	ffc9                	.insn	2, 0xffc9
    55a8:	5089                	.insn	2, 0x5089
    55aa:	ffd2                	.insn	2, 0xffd2
    55ac:	001c853f 001d0b4b 	.insn	8, 0x001d0b4b001c853f
    55b4:	f6a6                	.insn	2, 0xf6a6
    55b6:	a8beffef          	jal	t6,ffff5040 <__stack_size+0xfffe5040>
    55ba:	e11bffeb          	.insn	4, 0xe11bffeb
    55be:	0012                	.insn	2, 0x0012
    55c0:	5e3e                	.insn	2, 0x5e3e
    55c2:	ffcd                	.insn	2, 0xffcd
    55c4:	ffea2d2f          	.insn	4, 0xffea2d2f
    55c8:	1de4                	.insn	2, 0x1de4
    55ca:	fff9                	.insn	2, 0xfff9
    55cc:	001406c7          	.insn	4, 0x001406c7
    55d0:	00327283          	.insn	4, 0x00327283
    55d4:	0d6e                	.insn	2, 0x0d6e
    55d6:	ffe2                	.insn	2, 0xffe2
    55d8:	ffec7953          	.insn	4, 0xffec7953
    55dc:	4099                	.insn	2, 0x4099
    55de:	001d                	.insn	2, 0x001d
    55e0:	2578                	.insn	2, 0x2578
    55e2:	ffd9                	.insn	2, 0xffd9
    55e4:	05ad                	.insn	2, 0x05ad
    55e6:	e405ffeb          	.insn	4, 0xe405ffeb
    55ea:	0016                	.insn	2, 0x0016
    55ec:	000bdbe7          	.insn	4, 0x000bdbe7
    55f0:	1de8                	.insn	2, 0x1de8
    55f2:	0022                	.insn	2, 0x0022
    55f4:	0033f8cf          	.insn	4, 0x0033f8cf
    55f8:	b934                	.insn	2, 0xb934
    55fa:	ca0cfff7          	.insn	4, 0xca0cfff7
    55fe:	ffd4                	.insn	2, 0xffd4
    5600:	7ff8                	.insn	2, 0x7ff8
    5602:	ffe6                	.insn	2, 0xffe6
    5604:	ffe3d157          	.insn	4, 0xffe3d157
    5608:	ffd8911b          	.insn	4, 0xffd8911b
    560c:	2c12                	.insn	2, 0x2c12
    560e:	10d8ffc7          	.insn	4, 0x10d8ffc7
    5612:	0009                	.insn	2, 0x0009
    5614:	5e1f ffc6 4658      	.insn	6, 0x4658ffc65e1f
    561a:	ffe1                	.insn	2, 0xffe1
    561c:	00251d8b          	.insn	4, 0x00251d8b
    5620:	002573b7          	lui	t2,0x257
    5624:	fffd7c8f          	.insn	4, 0xfffd7c8f
    5628:	dd98                	.insn	2, 0xdd98
    562a:	001d                	.insn	2, 0x001d
    562c:	6898                	.insn	2, 0x6898
    562e:	d4bb0033          	.insn	4, 0xd4bb0033
    5632:	0002                	.insn	2, 0x0002
    5634:	ffed93a7          	.insn	4, 0xffed93a7
    5638:	6cbe                	.insn	2, 0x6cbe
    563a:	7c1cffcf          	.insn	4, 0x7c1cffcf
    563e:	0002                	.insn	2, 0x0002
    5640:	aa08                	.insn	2, 0xaa08
    5642:	0018                	.insn	2, 0x0018
    5644:	fd71                	.insn	2, 0xfd71
    5646:	002d                	.insn	2, 0x002d
    5648:	5ca5                	.insn	2, 0x5ca5
    564a:	000c                	.insn	2, 0x000c
    564c:	379a                	.insn	2, 0x379a
    564e:	0019                	.insn	2, 0x0019
    5650:	ffc7a167          	.insn	4, 0xffc7a167
    5654:	8c3d                	.insn	2, 0x8c3d
    5656:	ffe4                	.insn	2, 0xffe4
    5658:	a13c                	.insn	2, 0xa13c
    565a:	ffd1                	.insn	2, 0xffd1
    565c:	c539                	.insn	2, 0xc539
    565e:	0035                	.insn	2, 0x0035
    5660:	0115                	.insn	2, 0x0115
    5662:	1dc0003b          	.insn	4, 0x1dc0003b
    5666:	0004                	.insn	2, 0x0004
    5668:	0021c4f7          	.insn	4, 0x0021c4f7
    566c:	1bf4                	.insn	2, 0x1bf4
    566e:	fff1                	.insn	2, 0xfff1
    5670:	001a35e7          	.insn	4, 0x001a35e7
    5674:	340e                	.insn	2, 0x340e
    5676:	7d450007          	.insn	4, 0x7d450007
    567a:	fff9                	.insn	2, 0xfff9
    567c:	4cd0                	.insn	2, 0x4cd0
    567e:	001a                	.insn	2, 0x001a
    5680:	7cae                	.insn	2, 0x7cae
    5682:	ffe4                	.insn	2, 0xffe4
    5684:	2668                	.insn	2, 0x2668
    5686:	001d                	.insn	2, 0x001d
    5688:	8e98                	.insn	2, 0x8e98
    568a:	ffe6                	.insn	2, 0xffe6
    568c:	ffef2633          	.insn	4, 0xffef2633
    5690:	05da                	.insn	2, 0x05da
    5692:	fffc                	.insn	2, 0xfffc
    5694:	ffc57fdb          	.insn	4, 0xffc57fdb
    5698:	2764                	.insn	2, 0x2764
    569a:	e1afffd3          	.insn	4, 0xe1afffd3
    569e:	ffdd                	.insn	2, 0xffdd
    56a0:	93dd                	.insn	2, 0x93dd
    56a2:	fff9                	.insn	2, 0xfff9
    56a4:	1d09                	.insn	2, 0x1d09
    56a6:	ffdd                	.insn	2, 0xffdd
    56a8:	0002cc93          	xori	s9,t0,0
    56ac:	1805                	.insn	2, 0x1805
    56ae:	fff1                	.insn	2, 0xfff1
    56b0:	9c2a                	.insn	2, 0x9c2a
    56b2:	0018                	.insn	2, 0x0018
    56b4:	e5a9                	.insn	2, 0xe5a9
    56b6:	ffc9                	.insn	2, 0xffc9
    56b8:	8a50                	.insn	2, 0x8a50
    56ba:	cf2cfff7          	.insn	4, 0xcf2cfff7
    56be:	434e003b          	.insn	4, 0x434e003b
    56c2:	ffff                	.insn	2, 0xffff
    56c4:	36df ffeb 15ca      	.insn	6, 0x15caffeb36df
    56ca:	003c                	.insn	2, 0x003c
    56cc:	5e68                	.insn	2, 0x5e68
    56ce:	0015                	.insn	2, 0x0015
    56d0:	16b6                	.insn	2, 0x16b6
    56d2:	29cefff3          	.insn	4, 0x29cefff3
    56d6:	001e                	.insn	2, 0x001e

000056d8 <KeccakF_RoundConstants>:
    56d8:	0001                	.insn	2, 0x0001
    56da:	0000                	.insn	2, 0x0000
    56dc:	0000                	.insn	2, 0x0000
    56de:	0000                	.insn	2, 0x0000
    56e0:	8082                	.insn	2, 0x8082
    56e2:	0000                	.insn	2, 0x0000
    56e4:	0000                	.insn	2, 0x0000
    56e6:	0000                	.insn	2, 0x0000
    56e8:	808a                	.insn	2, 0x808a
    56ea:	0000                	.insn	2, 0x0000
    56ec:	0000                	.insn	2, 0x0000
    56ee:	8000                	.insn	2, 0x8000
    56f0:	8000                	.insn	2, 0x8000
    56f2:	8000                	.insn	2, 0x8000
    56f4:	0000                	.insn	2, 0x0000
    56f6:	8000                	.insn	2, 0x8000
    56f8:	0000808b          	.insn	4, 0x808b
    56fc:	0000                	.insn	2, 0x0000
    56fe:	0000                	.insn	2, 0x0000
    5700:	0001                	.insn	2, 0x0001
    5702:	8000                	.insn	2, 0x8000
    5704:	0000                	.insn	2, 0x0000
    5706:	0000                	.insn	2, 0x0000
    5708:	8081                	.insn	2, 0x8081
    570a:	8000                	.insn	2, 0x8000
    570c:	0000                	.insn	2, 0x0000
    570e:	8000                	.insn	2, 0x8000
    5710:	8009                	.insn	2, 0x8009
    5712:	0000                	.insn	2, 0x0000
    5714:	0000                	.insn	2, 0x0000
    5716:	8000                	.insn	2, 0x8000
    5718:	008a                	.insn	2, 0x008a
    571a:	0000                	.insn	2, 0x0000
    571c:	0000                	.insn	2, 0x0000
    571e:	0000                	.insn	2, 0x0000
    5720:	0088                	.insn	2, 0x0088
    5722:	0000                	.insn	2, 0x0000
    5724:	0000                	.insn	2, 0x0000
    5726:	0000                	.insn	2, 0x0000
    5728:	8009                	.insn	2, 0x8009
    572a:	8000                	.insn	2, 0x8000
    572c:	0000                	.insn	2, 0x0000
    572e:	0000                	.insn	2, 0x0000
    5730:	000a                	.insn	2, 0x000a
    5732:	8000                	.insn	2, 0x8000
    5734:	0000                	.insn	2, 0x0000
    5736:	0000                	.insn	2, 0x0000
    5738:	8000808b          	.insn	4, 0x8000808b
    573c:	0000                	.insn	2, 0x0000
    573e:	0000                	.insn	2, 0x0000
    5740:	0000008b          	.insn	4, 0x008b
    5744:	0000                	.insn	2, 0x0000
    5746:	8000                	.insn	2, 0x8000
    5748:	8089                	.insn	2, 0x8089
    574a:	0000                	.insn	2, 0x0000
    574c:	0000                	.insn	2, 0x0000
    574e:	8000                	.insn	2, 0x8000
    5750:	00008003          	lb	zero,0(ra)
    5754:	0000                	.insn	2, 0x0000
    5756:	8000                	.insn	2, 0x8000
    5758:	8002                	.insn	2, 0x8002
    575a:	0000                	.insn	2, 0x0000
    575c:	0000                	.insn	2, 0x0000
    575e:	8000                	.insn	2, 0x8000
    5760:	0080                	.insn	2, 0x0080
    5762:	0000                	.insn	2, 0x0000
    5764:	0000                	.insn	2, 0x0000
    5766:	8000                	.insn	2, 0x8000
    5768:	800a                	.insn	2, 0x800a
    576a:	0000                	.insn	2, 0x0000
    576c:	0000                	.insn	2, 0x0000
    576e:	0000                	.insn	2, 0x0000
    5770:	000a                	.insn	2, 0x000a
    5772:	8000                	.insn	2, 0x8000
    5774:	0000                	.insn	2, 0x0000
    5776:	8000                	.insn	2, 0x8000
    5778:	8081                	.insn	2, 0x8081
    577a:	8000                	.insn	2, 0x8000
    577c:	0000                	.insn	2, 0x0000
    577e:	8000                	.insn	2, 0x8000
    5780:	8080                	.insn	2, 0x8080
    5782:	0000                	.insn	2, 0x0000
    5784:	0000                	.insn	2, 0x0000
    5786:	8000                	.insn	2, 0x8000
    5788:	0001                	.insn	2, 0x0001
    578a:	8000                	.insn	2, 0x8000
    578c:	0000                	.insn	2, 0x0000
    578e:	0000                	.insn	2, 0x0000
    5790:	8008                	.insn	2, 0x8008
    5792:	8000                	.insn	2, 0x8000
    5794:	0000                	.insn	2, 0x0000
    5796:	8000                	.insn	2, 0x8000

Disassembly of section .eh_frame:

00005798 <.eh_frame>:
    5798:	0010                	.insn	2, 0x0010
    579a:	0000                	.insn	2, 0x0000
    579c:	0000                	.insn	2, 0x0000
    579e:	0000                	.insn	2, 0x0000
    57a0:	00527a03          	.insn	4, 0x00527a03
    57a4:	7c01                	.insn	2, 0x7c01
    57a6:	0101                	.insn	2, 0x0101
    57a8:	00020c1b          	.insn	4, 0x00020c1b
    57ac:	0010                	.insn	2, 0x0010
    57ae:	0000                	.insn	2, 0x0000
    57b0:	0018                	.insn	2, 0x0018
    57b2:	0000                	.insn	2, 0x0000
    57b4:	a84c                	.insn	2, 0xa84c
    57b6:	ffff                	.insn	2, 0xffff
    57b8:	0010                	.insn	2, 0x0010
    57ba:	0000                	.insn	2, 0x0000
    57bc:	0000                	.insn	2, 0x0000
	...

Disassembly of section .data:

00006000 <sk>:
    6000:	0004                	.insn	2, 0x0004
	...

000069f0 <input_array>:
    69f0:	ff00                	.insn	2, 0xff00
    69f2:	f1697847          	.insn	4, 0xf1697847
    69f6:	54842dbb          	.insn	4, 0x54842dbb
    69fa:	30a4                	.insn	2, 0x30a4
    69fc:	d8a2                	.insn	2, 0xd8a2
    69fe:	b599                	.insn	2, 0xb599
    6a00:	8268                	.insn	2, 0x8268
    6a02:	5ff6                	.insn	2, 0x5ff6
    6a04:	3080                	.insn	2, 0x3080
    6a06:	5dd2d1cb          	.insn	4, 0x5dd2d1cb
    6a0a:	ff96                	.insn	2, 0xff96
    6a0c:	55a4                	.insn	2, 0x55a4
    6a0e:	2e56                	.insn	2, 0x2e56
    6a10:	55b4                	.insn	2, 0x55b4
    6a12:	792a                	.insn	2, 0x792a
    6a14:	8c92                	.insn	2, 0x8c92
    6a16:	1dca                	.insn	2, 0x1dca
    6a18:	2863f6ab          	.insn	4, 0x2863f6ab
    6a1c:	7406                	.insn	2, 0x7406
    6a1e:	ce02                	.insn	2, 0xce02
    6a20:	9cb8b45b          	.insn	4, 0x9cb8b45b
    6a24:	9be1                	.insn	2, 0x9be1
    6a26:	2786                	.insn	2, 0x2786
    6a28:	848e                	.insn	2, 0x848e
    6a2a:	6b                	.byte	0x6b

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
