
hello.elf:     file format elf32-littleriscv


Disassembly of section .init:

00010000 <_start>:
   10000:	0000f117          	auipc	sp,0xf
   10004:	ffc10113          	addi	sp,sp,-4 # 1effc <__stack_top>
   10008:	00010433          	add	s0,sp,zero
   1000c:	000022b7          	lui	t0,0x2
   10010:	3002a073          	csrs	mstatus,t0
   10014:	034000ef          	jal	10048 <main>
   10018:	00000513          	li	a0,0
   1001c:	0040006f          	j	10020 <tohost_exit>

00010020 <tohost_exit>:
   10020:	00151513          	slli	a0,a0,0x1
   10024:	00156513          	ori	a0,a0,1
   10028:	00008337          	lui	t1,0x8
   1002c:	01030313          	addi	t1,t1,16 # 8010 <_start-0x7ff0>
   10030:	09000593          	li	a1,144
   10034:	00005297          	auipc	t0,0x5
   10038:	fcc28293          	addi	t0,t0,-52 # 15000 <tohost>
   1003c:	00a2a023          	sw	a0,0(t0)
   10040:	00b32023          	sw	a1,0(t1)
   10044:	0000006f          	j	10044 <tohost_exit+0x24>

Disassembly of section .text:

00010048 <main>:
   10048:	ffff72b7          	lui	t0,0xffff7
   1004c:	82028293          	addi	t0,t0,-2016 # ffff6820 <__stack_top+0xfffd7824>
   10050:	81010113          	addi	sp,sp,-2032
   10054:	7e112623          	sw	ra,2028(sp)
   10058:	7e812423          	sw	s0,2024(sp)
   1005c:	7e912223          	sw	s1,2020(sp)
   10060:	7f212023          	sw	s2,2016(sp)
   10064:	00510133          	add	sp,sp,t0
   10068:	52000613          	li	a2,1312
   1006c:	00000593          	li	a1,0
   10070:	0a010513          	addi	a0,sp,160
   10074:	1e8040ef          	jal	1425c <memset>
   10078:	00001637          	lui	a2,0x1
   1007c:	a0060613          	addi	a2,a2,-1536 # a00 <_start-0xf600>
   10080:	00000593          	li	a1,0
   10084:	5c010513          	addi	a0,sp,1472
   10088:	1d4040ef          	jal	1425c <memset>
   1008c:	06000613          	li	a2,96
   10090:	00000593          	li	a1,0
   10094:	04010513          	addi	a0,sp,64
   10098:	1c4040ef          	jal	1425c <memset>
   1009c:	04010413          	addi	s0,sp,64
   100a0:	00040613          	mv	a2,s0
   100a4:	02000693          	li	a3,32
   100a8:	00040513          	mv	a0,s0
   100ac:	06000593          	li	a1,96
   100b0:	525030ef          	jal	13dd4 <pqcrystals_fips202_ref_shake256>
   100b4:	000067b7          	lui	a5,0x6
   100b8:	fc078793          	addi	a5,a5,-64 # 5fc0 <_start-0xa040>
   100bc:	00278533          	add	a0,a5,sp
   100c0:	00040593          	mv	a1,s0
   100c4:	7ff10413          	addi	s0,sp,2047
   100c8:	18c000ef          	jal	10254 <pqcrystals_dilithium2_ref_polyvec_matrix_expand>
   100cc:	7c140413          	addi	s0,s0,1985
   100d0:	06010593          	addi	a1,sp,96
   100d4:	00040513          	mv	a0,s0
   100d8:	00000613          	li	a2,0
   100dc:	00b12623          	sw	a1,12(sp)
   100e0:	218000ef          	jal	102f8 <pqcrystals_dilithium2_ref_polyvecl_uniform_eta>
   100e4:	00c12583          	lw	a1,12(sp)
   100e8:	000037b7          	lui	a5,0x3
   100ec:	fc078793          	addi	a5,a5,-64 # 2fc0 <_start-0xd040>
   100f0:	00278533          	add	a0,a5,sp
   100f4:	00400613          	li	a2,4
   100f8:	394000ef          	jal	1048c <pqcrystals_dilithium2_ref_polyveck_uniform_eta>
   100fc:	000027b7          	lui	a5,0x2
   10100:	fc078793          	addi	a5,a5,-64 # 1fc0 <_start-0xe040>
   10104:	002787b3          	add	a5,a5,sp
   10108:	00040513          	mv	a0,s0
   1010c:	00078713          	mv	a4,a5
   10110:	00852683          	lw	a3,8(a0)
   10114:	00052583          	lw	a1,0(a0)
   10118:	00452603          	lw	a2,4(a0)
   1011c:	00d7a423          	sw	a3,8(a5)
   10120:	00b7a023          	sw	a1,0(a5)
   10124:	00c7a223          	sw	a2,4(a5)
   10128:	00c52683          	lw	a3,12(a0)
   1012c:	01050513          	addi	a0,a0,16
   10130:	01078793          	addi	a5,a5,16
   10134:	fed7ae23          	sw	a3,-4(a5)
   10138:	fce51ce3          	bne	a0,a4,10110 <main+0xc8>
   1013c:	000027b7          	lui	a5,0x2
   10140:	fc078793          	addi	a5,a5,-64 # 1fc0 <_start-0xe040>
   10144:	00278533          	add	a0,a5,sp
   10148:	21c000ef          	jal	10364 <pqcrystals_dilithium2_ref_polyvecl_ntt>
   1014c:	000047b7          	lui	a5,0x4
   10150:	fc078793          	addi	a5,a5,-64 # 3fc0 <_start-0xc040>
   10154:	00002637          	lui	a2,0x2
   10158:	00278433          	add	s0,a5,sp
   1015c:	fb060613          	addi	a2,a2,-80 # 1fb0 <_start-0xe050>
   10160:	01010793          	addi	a5,sp,16
   10164:	00f60633          	add	a2,a2,a5
   10168:	000067b7          	lui	a5,0x6
   1016c:	fc078793          	addi	a5,a5,-64 # 5fc0 <_start-0xa040>
   10170:	002785b3          	add	a1,a5,sp
   10174:	00040513          	mv	a0,s0
   10178:	2a8000ef          	jal	10420 <pqcrystals_dilithium2_ref_polyvec_matrix_pointwise_montgomery>
   1017c:	00040513          	mv	a0,s0
   10180:	378000ef          	jal	104f8 <pqcrystals_dilithium2_ref_polyveck_reduce>
   10184:	00040513          	mv	a0,s0
   10188:	458000ef          	jal	105e0 <pqcrystals_dilithium2_ref_polyveck_invntt_tomont>
   1018c:	000037b7          	lui	a5,0x3
   10190:	fc078793          	addi	a5,a5,-64 # 2fc0 <_start-0xd040>
   10194:	00278633          	add	a2,a5,sp
   10198:	00040593          	mv	a1,s0
   1019c:	00040513          	mv	a0,s0
   101a0:	3d8000ef          	jal	10578 <pqcrystals_dilithium2_ref_polyveck_add>
   101a4:	00040513          	mv	a0,s0
   101a8:	390000ef          	jal	10538 <pqcrystals_dilithium2_ref_polyveck_caddq>
   101ac:	000057b7          	lui	a5,0x5
   101b0:	fc078793          	addi	a5,a5,-64 # 4fc0 <_start-0xb040>
   101b4:	002785b3          	add	a1,a5,sp
   101b8:	00040613          	mv	a2,s0
   101bc:	00040513          	mv	a0,s0
   101c0:	460000ef          	jal	10620 <pqcrystals_dilithium2_ref_polyveck_power2round>
   101c4:	0a010513          	addi	a0,sp,160
   101c8:	00040613          	mv	a2,s0
   101cc:	04010593          	addi	a1,sp,64
   101d0:	4ed030ef          	jal	13ebc <pqcrystals_dilithium2_ref_pack_pk>
   101d4:	01010413          	addi	s0,sp,16
   101d8:	0a010613          	addi	a2,sp,160
   101dc:	00040513          	mv	a0,s0
   101e0:	52000693          	li	a3,1312
   101e4:	03000593          	li	a1,48
   101e8:	3ed030ef          	jal	13dd4 <pqcrystals_fips202_ref_shake256>
   101ec:	00003837          	lui	a6,0x3
   101f0:	00005737          	lui	a4,0x5
   101f4:	7ff10793          	addi	a5,sp,2047
   101f8:	fb080813          	addi	a6,a6,-80 # 2fb0 <_start-0xd050>
   101fc:	fb070713          	addi	a4,a4,-80 # 4fb0 <_start-0xb050>
   10200:	00870733          	add	a4,a4,s0
   10204:	5c010513          	addi	a0,sp,1472
   10208:	00880833          	add	a6,a6,s0
   1020c:	00040613          	mv	a2,s0
   10210:	7c178793          	addi	a5,a5,1985
   10214:	08010693          	addi	a3,sp,128
   10218:	04010593          	addi	a1,sp,64
   1021c:	571030ef          	jal	13f8c <pqcrystals_dilithium2_ref_pack_sk>
   10220:	5c014703          	lbu	a4,1472(sp)
   10224:	000087b7          	lui	a5,0x8
   10228:	000092b7          	lui	t0,0x9
   1022c:	00e7a823          	sw	a4,16(a5) # 8010 <_start-0x7ff0>
   10230:	7e028293          	addi	t0,t0,2016 # 97e0 <_start-0x6820>
   10234:	00510133          	add	sp,sp,t0
   10238:	7ec12083          	lw	ra,2028(sp)
   1023c:	7e812403          	lw	s0,2024(sp)
   10240:	7e412483          	lw	s1,2020(sp)
   10244:	7e012903          	lw	s2,2016(sp)
   10248:	00000513          	li	a0,0
   1024c:	7f010113          	addi	sp,sp,2032
   10250:	00008067          	ret

00010254 <pqcrystals_dilithium2_ref_polyvec_matrix_expand>:
   10254:	fe010113          	addi	sp,sp,-32
   10258:	01512223          	sw	s5,4(sp)
   1025c:	00001ab7          	lui	s5,0x1
   10260:	01212823          	sw	s2,16(sp)
   10264:	01312623          	sw	s3,12(sp)
   10268:	01412423          	sw	s4,8(sp)
   1026c:	01612023          	sw	s6,0(sp)
   10270:	00112e23          	sw	ra,28(sp)
   10274:	00812c23          	sw	s0,24(sp)
   10278:	00912a23          	sw	s1,20(sp)
   1027c:	00058a13          	mv	s4,a1
   10280:	01550933          	add	s2,a0,s5
   10284:	00000993          	li	s3,0
   10288:	40000b13          	li	s6,1024
   1028c:	80090493          	addi	s1,s2,-2048
   10290:	80048493          	addi	s1,s1,-2048
   10294:	00098413          	mv	s0,s3
   10298:	00040613          	mv	a2,s0
   1029c:	00140413          	addi	s0,s0,1
   102a0:	00048513          	mv	a0,s1
   102a4:	000a0593          	mv	a1,s4
   102a8:	01041413          	slli	s0,s0,0x10
   102ac:	40048493          	addi	s1,s1,1024
   102b0:	57c000ef          	jal	1082c <pqcrystals_dilithium2_ref_poly_uniform>
   102b4:	01045413          	srli	s0,s0,0x10
   102b8:	ff2490e3          	bne	s1,s2,10298 <pqcrystals_dilithium2_ref_polyvec_matrix_expand+0x44>
   102bc:	10098993          	addi	s3,s3,256
   102c0:	01099993          	slli	s3,s3,0x10
   102c4:	0109d993          	srli	s3,s3,0x10
   102c8:	01548933          	add	s2,s1,s5
   102cc:	fd6990e3          	bne	s3,s6,1028c <pqcrystals_dilithium2_ref_polyvec_matrix_expand+0x38>
   102d0:	01c12083          	lw	ra,28(sp)
   102d4:	01812403          	lw	s0,24(sp)
   102d8:	01412483          	lw	s1,20(sp)
   102dc:	01012903          	lw	s2,16(sp)
   102e0:	00c12983          	lw	s3,12(sp)
   102e4:	00812a03          	lw	s4,8(sp)
   102e8:	00412a83          	lw	s5,4(sp)
   102ec:	00012b03          	lw	s6,0(sp)
   102f0:	02010113          	addi	sp,sp,32
   102f4:	00008067          	ret

000102f8 <pqcrystals_dilithium2_ref_polyvecl_uniform_eta>:
   102f8:	fe010113          	addi	sp,sp,-32
   102fc:	01212823          	sw	s2,16(sp)
   10300:	00001937          	lui	s2,0x1
   10304:	00812c23          	sw	s0,24(sp)
   10308:	00912a23          	sw	s1,20(sp)
   1030c:	01312623          	sw	s3,12(sp)
   10310:	00112e23          	sw	ra,28(sp)
   10314:	00050493          	mv	s1,a0
   10318:	00060413          	mv	s0,a2
   1031c:	00058993          	mv	s3,a1
   10320:	01250933          	add	s2,a0,s2
   10324:	00040613          	mv	a2,s0
   10328:	00140413          	addi	s0,s0,1
   1032c:	00048513          	mv	a0,s1
   10330:	00098593          	mv	a1,s3
   10334:	01041413          	slli	s0,s0,0x10
   10338:	40048493          	addi	s1,s1,1024
   1033c:	01045413          	srli	s0,s0,0x10
   10340:	694000ef          	jal	109d4 <pqcrystals_dilithium2_ref_poly_uniform_eta>
   10344:	ff2490e3          	bne	s1,s2,10324 <pqcrystals_dilithium2_ref_polyvecl_uniform_eta+0x2c>
   10348:	01c12083          	lw	ra,28(sp)
   1034c:	01812403          	lw	s0,24(sp)
   10350:	01412483          	lw	s1,20(sp)
   10354:	01012903          	lw	s2,16(sp)
   10358:	00c12983          	lw	s3,12(sp)
   1035c:	02010113          	addi	sp,sp,32
   10360:	00008067          	ret

00010364 <pqcrystals_dilithium2_ref_polyvecl_ntt>:
   10364:	ff010113          	addi	sp,sp,-16
   10368:	00912223          	sw	s1,4(sp)
   1036c:	000014b7          	lui	s1,0x1
   10370:	00812423          	sw	s0,8(sp)
   10374:	00112623          	sw	ra,12(sp)
   10378:	00050413          	mv	s0,a0
   1037c:	009504b3          	add	s1,a0,s1
   10380:	00040513          	mv	a0,s0
   10384:	40040413          	addi	s0,s0,1024
   10388:	3b0000ef          	jal	10738 <pqcrystals_dilithium2_ref_poly_ntt>
   1038c:	fe941ae3          	bne	s0,s1,10380 <pqcrystals_dilithium2_ref_polyvecl_ntt+0x1c>
   10390:	00c12083          	lw	ra,12(sp)
   10394:	00812403          	lw	s0,8(sp)
   10398:	00412483          	lw	s1,4(sp)
   1039c:	01010113          	addi	sp,sp,16
   103a0:	00008067          	ret

000103a4 <pqcrystals_dilithium2_ref_polyvecl_pointwise_acc_montgomery>:
   103a4:	be010113          	addi	sp,sp,-1056
   103a8:	40812c23          	sw	s0,1048(sp)
   103ac:	40912a23          	sw	s1,1044(sp)
   103b0:	41212823          	sw	s2,1040(sp)
   103b4:	41312623          	sw	s3,1036(sp)
   103b8:	00058913          	mv	s2,a1
   103bc:	40112e23          	sw	ra,1052(sp)
   103c0:	00050993          	mv	s3,a0
   103c4:	40060493          	addi	s1,a2,1024
   103c8:	378000ef          	jal	10740 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery>
   103cc:	000017b7          	lui	a5,0x1
   103d0:	40090413          	addi	s0,s2,1024 # 1400 <_start-0xec00>
   103d4:	00f90933          	add	s2,s2,a5
   103d8:	00048613          	mv	a2,s1
   103dc:	00040593          	mv	a1,s0
   103e0:	00010513          	mv	a0,sp
   103e4:	35c000ef          	jal	10740 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery>
   103e8:	00010613          	mv	a2,sp
   103ec:	00098593          	mv	a1,s3
   103f0:	00098513          	mv	a0,s3
   103f4:	40040413          	addi	s0,s0,1024
   103f8:	310000ef          	jal	10708 <pqcrystals_dilithium2_ref_poly_add>
   103fc:	40048493          	addi	s1,s1,1024 # 1400 <_start-0xec00>
   10400:	fd241ce3          	bne	s0,s2,103d8 <pqcrystals_dilithium2_ref_polyvecl_pointwise_acc_montgomery+0x34>
   10404:	41c12083          	lw	ra,1052(sp)
   10408:	41812403          	lw	s0,1048(sp)
   1040c:	41412483          	lw	s1,1044(sp)
   10410:	41012903          	lw	s2,1040(sp)
   10414:	40c12983          	lw	s3,1036(sp)
   10418:	42010113          	addi	sp,sp,1056
   1041c:	00008067          	ret

00010420 <pqcrystals_dilithium2_ref_polyvec_matrix_pointwise_montgomery>:
   10420:	fe010113          	addi	sp,sp,-32
   10424:	01212823          	sw	s2,16(sp)
   10428:	00001937          	lui	s2,0x1
   1042c:	00812c23          	sw	s0,24(sp)
   10430:	00912a23          	sw	s1,20(sp)
   10434:	01312623          	sw	s3,12(sp)
   10438:	01412423          	sw	s4,8(sp)
   1043c:	00112e23          	sw	ra,28(sp)
   10440:	00050413          	mv	s0,a0
   10444:	00058493          	mv	s1,a1
   10448:	00060a13          	mv	s4,a2
   1044c:	012509b3          	add	s3,a0,s2
   10450:	00048593          	mv	a1,s1
   10454:	00040513          	mv	a0,s0
   10458:	000a0613          	mv	a2,s4
   1045c:	40040413          	addi	s0,s0,1024
   10460:	f45ff0ef          	jal	103a4 <pqcrystals_dilithium2_ref_polyvecl_pointwise_acc_montgomery>
   10464:	012484b3          	add	s1,s1,s2
   10468:	ff3414e3          	bne	s0,s3,10450 <pqcrystals_dilithium2_ref_polyvec_matrix_pointwise_montgomery+0x30>
   1046c:	01c12083          	lw	ra,28(sp)
   10470:	01812403          	lw	s0,24(sp)
   10474:	01412483          	lw	s1,20(sp)
   10478:	01012903          	lw	s2,16(sp)
   1047c:	00c12983          	lw	s3,12(sp)
   10480:	00812a03          	lw	s4,8(sp)
   10484:	02010113          	addi	sp,sp,32
   10488:	00008067          	ret

0001048c <pqcrystals_dilithium2_ref_polyveck_uniform_eta>:
   1048c:	fe010113          	addi	sp,sp,-32
   10490:	01212823          	sw	s2,16(sp)
   10494:	00001937          	lui	s2,0x1
   10498:	00812c23          	sw	s0,24(sp)
   1049c:	00912a23          	sw	s1,20(sp)
   104a0:	01312623          	sw	s3,12(sp)
   104a4:	00112e23          	sw	ra,28(sp)
   104a8:	00050493          	mv	s1,a0
   104ac:	00060413          	mv	s0,a2
   104b0:	00058993          	mv	s3,a1
   104b4:	01250933          	add	s2,a0,s2
   104b8:	00040613          	mv	a2,s0
   104bc:	00140413          	addi	s0,s0,1
   104c0:	00048513          	mv	a0,s1
   104c4:	00098593          	mv	a1,s3
   104c8:	01041413          	slli	s0,s0,0x10
   104cc:	40048493          	addi	s1,s1,1024
   104d0:	01045413          	srli	s0,s0,0x10
   104d4:	500000ef          	jal	109d4 <pqcrystals_dilithium2_ref_poly_uniform_eta>
   104d8:	ff2490e3          	bne	s1,s2,104b8 <pqcrystals_dilithium2_ref_polyveck_uniform_eta+0x2c>
   104dc:	01c12083          	lw	ra,28(sp)
   104e0:	01812403          	lw	s0,24(sp)
   104e4:	01412483          	lw	s1,20(sp)
   104e8:	01012903          	lw	s2,16(sp)
   104ec:	00c12983          	lw	s3,12(sp)
   104f0:	02010113          	addi	sp,sp,32
   104f4:	00008067          	ret

000104f8 <pqcrystals_dilithium2_ref_polyveck_reduce>:
   104f8:	ff010113          	addi	sp,sp,-16
   104fc:	00912223          	sw	s1,4(sp)
   10500:	000014b7          	lui	s1,0x1
   10504:	00812423          	sw	s0,8(sp)
   10508:	00112623          	sw	ra,12(sp)
   1050c:	00050413          	mv	s0,a0
   10510:	009504b3          	add	s1,a0,s1
   10514:	00040513          	mv	a0,s0
   10518:	40040413          	addi	s0,s0,1024
   1051c:	16c000ef          	jal	10688 <pqcrystals_dilithium2_ref_poly_reduce>
   10520:	fe941ae3          	bne	s0,s1,10514 <pqcrystals_dilithium2_ref_polyveck_reduce+0x1c>
   10524:	00c12083          	lw	ra,12(sp)
   10528:	00812403          	lw	s0,8(sp)
   1052c:	00412483          	lw	s1,4(sp)
   10530:	01010113          	addi	sp,sp,16
   10534:	00008067          	ret

00010538 <pqcrystals_dilithium2_ref_polyveck_caddq>:
   10538:	ff010113          	addi	sp,sp,-16
   1053c:	00912223          	sw	s1,4(sp)
   10540:	000014b7          	lui	s1,0x1
   10544:	00812423          	sw	s0,8(sp)
   10548:	00112623          	sw	ra,12(sp)
   1054c:	00050413          	mv	s0,a0
   10550:	009504b3          	add	s1,a0,s1
   10554:	00040513          	mv	a0,s0
   10558:	40040413          	addi	s0,s0,1024
   1055c:	16c000ef          	jal	106c8 <pqcrystals_dilithium2_ref_poly_caddq>
   10560:	fe941ae3          	bne	s0,s1,10554 <pqcrystals_dilithium2_ref_polyveck_caddq+0x1c>
   10564:	00c12083          	lw	ra,12(sp)
   10568:	00812403          	lw	s0,8(sp)
   1056c:	00412483          	lw	s1,4(sp)
   10570:	01010113          	addi	sp,sp,16
   10574:	00008067          	ret

00010578 <pqcrystals_dilithium2_ref_polyveck_add>:
   10578:	fe010113          	addi	sp,sp,-32
   1057c:	00812c23          	sw	s0,24(sp)
   10580:	00912a23          	sw	s1,20(sp)
   10584:	01212823          	sw	s2,16(sp)
   10588:	01312623          	sw	s3,12(sp)
   1058c:	01412423          	sw	s4,8(sp)
   10590:	00112e23          	sw	ra,28(sp)
   10594:	00050a13          	mv	s4,a0
   10598:	00058993          	mv	s3,a1
   1059c:	00060913          	mv	s2,a2
   105a0:	00000413          	li	s0,0
   105a4:	000014b7          	lui	s1,0x1
   105a8:	00890633          	add	a2,s2,s0
   105ac:	008985b3          	add	a1,s3,s0
   105b0:	008a0533          	add	a0,s4,s0
   105b4:	40040413          	addi	s0,s0,1024
   105b8:	150000ef          	jal	10708 <pqcrystals_dilithium2_ref_poly_add>
   105bc:	fe9416e3          	bne	s0,s1,105a8 <pqcrystals_dilithium2_ref_polyveck_add+0x30>
   105c0:	01c12083          	lw	ra,28(sp)
   105c4:	01812403          	lw	s0,24(sp)
   105c8:	01412483          	lw	s1,20(sp)
   105cc:	01012903          	lw	s2,16(sp)
   105d0:	00c12983          	lw	s3,12(sp)
   105d4:	00812a03          	lw	s4,8(sp)
   105d8:	02010113          	addi	sp,sp,32
   105dc:	00008067          	ret

000105e0 <pqcrystals_dilithium2_ref_polyveck_invntt_tomont>:
   105e0:	ff010113          	addi	sp,sp,-16
   105e4:	00912223          	sw	s1,4(sp)
   105e8:	000014b7          	lui	s1,0x1
   105ec:	00812423          	sw	s0,8(sp)
   105f0:	00112623          	sw	ra,12(sp)
   105f4:	00050413          	mv	s0,a0
   105f8:	009504b3          	add	s1,a0,s1
   105fc:	00040513          	mv	a0,s0
   10600:	40040413          	addi	s0,s0,1024
   10604:	138000ef          	jal	1073c <pqcrystals_dilithium2_ref_poly_invntt_tomont>
   10608:	fe941ae3          	bne	s0,s1,105fc <pqcrystals_dilithium2_ref_polyveck_invntt_tomont+0x1c>
   1060c:	00c12083          	lw	ra,12(sp)
   10610:	00812403          	lw	s0,8(sp)
   10614:	00412483          	lw	s1,4(sp)
   10618:	01010113          	addi	sp,sp,16
   1061c:	00008067          	ret

00010620 <pqcrystals_dilithium2_ref_polyveck_power2round>:
   10620:	fe010113          	addi	sp,sp,-32
   10624:	00812c23          	sw	s0,24(sp)
   10628:	00912a23          	sw	s1,20(sp)
   1062c:	01212823          	sw	s2,16(sp)
   10630:	01312623          	sw	s3,12(sp)
   10634:	01412423          	sw	s4,8(sp)
   10638:	00112e23          	sw	ra,28(sp)
   1063c:	00050a13          	mv	s4,a0
   10640:	00058993          	mv	s3,a1
   10644:	00060913          	mv	s2,a2
   10648:	00000413          	li	s0,0
   1064c:	000014b7          	lui	s1,0x1
   10650:	00890633          	add	a2,s2,s0
   10654:	008985b3          	add	a1,s3,s0
   10658:	008a0533          	add	a0,s4,s0
   1065c:	40040413          	addi	s0,s0,1024
   10660:	15c000ef          	jal	107bc <pqcrystals_dilithium2_ref_poly_power2round>
   10664:	fe9416e3          	bne	s0,s1,10650 <pqcrystals_dilithium2_ref_polyveck_power2round+0x30>
   10668:	01c12083          	lw	ra,28(sp)
   1066c:	01812403          	lw	s0,24(sp)
   10670:	01412483          	lw	s1,20(sp)
   10674:	01012903          	lw	s2,16(sp)
   10678:	00c12983          	lw	s3,12(sp)
   1067c:	00812a03          	lw	s4,8(sp)
   10680:	02010113          	addi	sp,sp,32
   10684:	00008067          	ret

00010688 <pqcrystals_dilithium2_ref_poly_reduce>:
   10688:	ff010113          	addi	sp,sp,-16
   1068c:	00812423          	sw	s0,8(sp)
   10690:	00912223          	sw	s1,4(sp)
   10694:	00112623          	sw	ra,12(sp)
   10698:	00050413          	mv	s0,a0
   1069c:	40050493          	addi	s1,a0,1024
   106a0:	00042503          	lw	a0,0(s0)
   106a4:	00440413          	addi	s0,s0,4
   106a8:	2e5000ef          	jal	1118c <pqcrystals_dilithium2_ref_reduce32>
   106ac:	fea42e23          	sw	a0,-4(s0)
   106b0:	fe9418e3          	bne	s0,s1,106a0 <pqcrystals_dilithium2_ref_poly_reduce+0x18>
   106b4:	00c12083          	lw	ra,12(sp)
   106b8:	00812403          	lw	s0,8(sp)
   106bc:	00412483          	lw	s1,4(sp)
   106c0:	01010113          	addi	sp,sp,16
   106c4:	00008067          	ret

000106c8 <pqcrystals_dilithium2_ref_poly_caddq>:
   106c8:	ff010113          	addi	sp,sp,-16
   106cc:	00812423          	sw	s0,8(sp)
   106d0:	00912223          	sw	s1,4(sp)
   106d4:	00112623          	sw	ra,12(sp)
   106d8:	00050413          	mv	s0,a0
   106dc:	40050493          	addi	s1,a0,1024
   106e0:	00042503          	lw	a0,0(s0)
   106e4:	00440413          	addi	s0,s0,4
   106e8:	2c5000ef          	jal	111ac <pqcrystals_dilithium2_ref_caddq>
   106ec:	fea42e23          	sw	a0,-4(s0)
   106f0:	fe9418e3          	bne	s0,s1,106e0 <pqcrystals_dilithium2_ref_poly_caddq+0x18>
   106f4:	00c12083          	lw	ra,12(sp)
   106f8:	00812403          	lw	s0,8(sp)
   106fc:	00412483          	lw	s1,4(sp)
   10700:	01010113          	addi	sp,sp,16
   10704:	00008067          	ret

00010708 <pqcrystals_dilithium2_ref_poly_add>:
   10708:	00000793          	li	a5,0
   1070c:	40000893          	li	a7,1024
   10710:	00f606b3          	add	a3,a2,a5
   10714:	00f58733          	add	a4,a1,a5
   10718:	0006a803          	lw	a6,0(a3)
   1071c:	00072703          	lw	a4,0(a4)
   10720:	00f506b3          	add	a3,a0,a5
   10724:	00478793          	addi	a5,a5,4 # 1004 <_start-0xeffc>
   10728:	01070733          	add	a4,a4,a6
   1072c:	00e6a023          	sw	a4,0(a3)
   10730:	ff1790e3          	bne	a5,a7,10710 <pqcrystals_dilithium2_ref_poly_add+0x8>
   10734:	00008067          	ret

00010738 <pqcrystals_dilithium2_ref_poly_ntt>:
   10738:	7180006f          	j	10e50 <pqcrystals_dilithium2_ref_ntt>

0001073c <pqcrystals_dilithium2_ref_poly_invntt_tomont>:
   1073c:	08d0006f          	j	10fc8 <pqcrystals_dilithium2_ref_invntt_tomont>

00010740 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery>:
   10740:	fe010113          	addi	sp,sp,-32
   10744:	00812c23          	sw	s0,24(sp)
   10748:	00912a23          	sw	s1,20(sp)
   1074c:	01212823          	sw	s2,16(sp)
   10750:	01312623          	sw	s3,12(sp)
   10754:	01412423          	sw	s4,8(sp)
   10758:	00112e23          	sw	ra,28(sp)
   1075c:	00050a13          	mv	s4,a0
   10760:	00058993          	mv	s3,a1
   10764:	00060913          	mv	s2,a2
   10768:	00000413          	li	s0,0
   1076c:	40000493          	li	s1,1024
   10770:	00898733          	add	a4,s3,s0
   10774:	008907b3          	add	a5,s2,s0
   10778:	0007a783          	lw	a5,0(a5)
   1077c:	00072503          	lw	a0,0(a4)
   10780:	02f515b3          	mulh	a1,a0,a5
   10784:	02f50533          	mul	a0,a0,a5
   10788:	1a1000ef          	jal	11128 <pqcrystals_dilithium2_ref_montgomery_reduce>
   1078c:	008a07b3          	add	a5,s4,s0
   10790:	00a7a023          	sw	a0,0(a5)
   10794:	00440413          	addi	s0,s0,4
   10798:	fc941ce3          	bne	s0,s1,10770 <pqcrystals_dilithium2_ref_poly_pointwise_montgomery+0x30>
   1079c:	01c12083          	lw	ra,28(sp)
   107a0:	01812403          	lw	s0,24(sp)
   107a4:	01412483          	lw	s1,20(sp)
   107a8:	01012903          	lw	s2,16(sp)
   107ac:	00c12983          	lw	s3,12(sp)
   107b0:	00812a03          	lw	s4,8(sp)
   107b4:	02010113          	addi	sp,sp,32
   107b8:	00008067          	ret

000107bc <pqcrystals_dilithium2_ref_poly_power2round>:
   107bc:	fe010113          	addi	sp,sp,-32
   107c0:	00812c23          	sw	s0,24(sp)
   107c4:	00912a23          	sw	s1,20(sp)
   107c8:	01212823          	sw	s2,16(sp)
   107cc:	01312623          	sw	s3,12(sp)
   107d0:	01412423          	sw	s4,8(sp)
   107d4:	00112e23          	sw	ra,28(sp)
   107d8:	00050a13          	mv	s4,a0
   107dc:	00058993          	mv	s3,a1
   107e0:	00060913          	mv	s2,a2
   107e4:	00000413          	li	s0,0
   107e8:	40000493          	li	s1,1024
   107ec:	008907b3          	add	a5,s2,s0
   107f0:	0007a583          	lw	a1,0(a5)
   107f4:	00898533          	add	a0,s3,s0
   107f8:	1ed030ef          	jal	141e4 <pqcrystals_dilithium2_ref_power2round>
   107fc:	008a07b3          	add	a5,s4,s0
   10800:	00a7a023          	sw	a0,0(a5)
   10804:	00440413          	addi	s0,s0,4
   10808:	fe9412e3          	bne	s0,s1,107ec <pqcrystals_dilithium2_ref_poly_power2round+0x30>
   1080c:	01c12083          	lw	ra,28(sp)
   10810:	01812403          	lw	s0,24(sp)
   10814:	01412483          	lw	s1,20(sp)
   10818:	01012903          	lw	s2,16(sp)
   1081c:	00c12983          	lw	s3,12(sp)
   10820:	00812a03          	lw	s4,8(sp)
   10824:	02010113          	addi	sp,sp,32
   10828:	00008067          	ret

0001082c <pqcrystals_dilithium2_ref_poly_uniform>:
   1082c:	bb010113          	addi	sp,sp,-1104
   10830:	43312e23          	sw	s3,1084(sp)
   10834:	00050993          	mv	s3,a0
   10838:	00010513          	mv	a0,sp
   1083c:	44112623          	sw	ra,1100(sp)
   10840:	45212023          	sw	s2,1088(sp)
   10844:	43612823          	sw	s6,1072(sp)
   10848:	1c1030ef          	jal	14208 <pqcrystals_dilithium2_ref_dilithium_shake128_stream_init>
   1084c:	0d410b13          	addi	s6,sp,212
   10850:	000b0513          	mv	a0,s6
   10854:	00500593          	li	a1,5
   10858:	00010613          	mv	a2,sp
   1085c:	4ac030ef          	jal	13d08 <pqcrystals_fips202_ref_shake128_squeezeblocks>
   10860:	008005b7          	lui	a1,0x800
   10864:	41c10813          	addi	a6,sp,1052
   10868:	000b0713          	mv	a4,s6
   1086c:	fff58593          	addi	a1,a1,-1 # 7fffff <__stack_top+0x7e1003>
   10870:	00000913          	li	s2,0
   10874:	007fe537          	lui	a0,0x7fe
   10878:	10000893          	li	a7,256
   1087c:	00174783          	lbu	a5,1(a4)
   10880:	00274683          	lbu	a3,2(a4)
   10884:	00074603          	lbu	a2,0(a4)
   10888:	00879793          	slli	a5,a5,0x8
   1088c:	01069693          	slli	a3,a3,0x10
   10890:	00d7e7b3          	or	a5,a5,a3
   10894:	00c7e7b3          	or	a5,a5,a2
   10898:	00291693          	slli	a3,s2,0x2
   1089c:	00b7f7b3          	and	a5,a5,a1
   108a0:	00d986b3          	add	a3,s3,a3
   108a4:	00370713          	addi	a4,a4,3
   108a8:	00190613          	addi	a2,s2,1 # 1001 <_start-0xefff>
   108ac:	00f56863          	bltu	a0,a5,108bc <pqcrystals_dilithium2_ref_poly_uniform+0x90>
   108b0:	00f6a023          	sw	a5,0(a3)
   108b4:	11160463          	beq	a2,a7,109bc <pqcrystals_dilithium2_ref_poly_uniform+0x190>
   108b8:	00060913          	mv	s2,a2
   108bc:	fce810e3          	bne	a6,a4,1087c <pqcrystals_dilithium2_ref_poly_uniform+0x50>
   108c0:	44812423          	sw	s0,1096(sp)
   108c4:	43412c23          	sw	s4,1080(sp)
   108c8:	43512a23          	sw	s5,1076(sp)
   108cc:	aaaab437          	lui	s0,0xaaaab
   108d0:	00800ab7          	lui	s5,0x800
   108d4:	00300a13          	li	s4,3
   108d8:	44912223          	sw	s1,1092(sp)
   108dc:	43712623          	sw	s7,1068(sp)
   108e0:	aab40413          	addi	s0,s0,-1365 # aaaaaaab <__stack_top+0xaaa8baaf>
   108e4:	fffa8a93          	addi	s5,s5,-1 # 7fffff <__stack_top+0x7e1003>
   108e8:	416a0a33          	sub	s4,s4,s6
   108ec:	34800513          	li	a0,840
   108f0:	00200493          	li	s1,2
   108f4:	028537b3          	mulhu	a5,a0,s0
   108f8:	0017db93          	srli	s7,a5,0x1
   108fc:	ffe7f793          	andi	a5,a5,-2
   10900:	017787b3          	add	a5,a5,s7
   10904:	40f50bb3          	sub	s7,a0,a5
   10908:	02f50263          	beq	a0,a5,1092c <pqcrystals_dilithium2_ref_poly_uniform+0x100>
   1090c:	41750533          	sub	a0,a0,s7
   10910:	42050793          	addi	a5,a0,1056 # 7fe420 <__stack_top+0x7df424>
   10914:	00278533          	add	a0,a5,sp
   10918:	cb454783          	lbu	a5,-844(a0)
   1091c:	0cf10a23          	sb	a5,212(sp)
   10920:	009b9663          	bne	s7,s1,1092c <pqcrystals_dilithium2_ref_poly_uniform+0x100>
   10924:	cb554783          	lbu	a5,-843(a0)
   10928:	0cf10aa3          	sb	a5,213(sp)
   1092c:	00010613          	mv	a2,sp
   10930:	017b0533          	add	a0,s6,s7
   10934:	00100593          	li	a1,1
   10938:	3d0030ef          	jal	13d08 <pqcrystals_fips202_ref_shake128_squeezeblocks>
   1093c:	10000813          	li	a6,256
   10940:	0a8b8513          	addi	a0,s7,168
   10944:	41280833          	sub	a6,a6,s2
   10948:	000b0693          	mv	a3,s6
   1094c:	00000613          	li	a2,0
   10950:	007fe8b7          	lui	a7,0x7fe
   10954:	0016c783          	lbu	a5,1(a3)
   10958:	0026c703          	lbu	a4,2(a3)
   1095c:	0006c583          	lbu	a1,0(a3)
   10960:	00879793          	slli	a5,a5,0x8
   10964:	01071713          	slli	a4,a4,0x10
   10968:	00e7e7b3          	or	a5,a5,a4
   1096c:	00b7e7b3          	or	a5,a5,a1
   10970:	00c90733          	add	a4,s2,a2
   10974:	00368693          	addi	a3,a3,3
   10978:	00271713          	slli	a4,a4,0x2
   1097c:	0157f7b3          	and	a5,a5,s5
   10980:	00da05b3          	add	a1,s4,a3
   10984:	00e98733          	add	a4,s3,a4
   10988:	00f8e663          	bltu	a7,a5,10994 <pqcrystals_dilithium2_ref_poly_uniform+0x168>
   1098c:	00160613          	addi	a2,a2,1
   10990:	00f72023          	sw	a5,0(a4)
   10994:	01067463          	bgeu	a2,a6,1099c <pqcrystals_dilithium2_ref_poly_uniform+0x170>
   10998:	fab57ee3          	bgeu	a0,a1,10954 <pqcrystals_dilithium2_ref_poly_uniform+0x128>
   1099c:	00c90933          	add	s2,s2,a2
   109a0:	0ff00793          	li	a5,255
   109a4:	f527f8e3          	bgeu	a5,s2,108f4 <pqcrystals_dilithium2_ref_poly_uniform+0xc8>
   109a8:	44812403          	lw	s0,1096(sp)
   109ac:	44412483          	lw	s1,1092(sp)
   109b0:	43812a03          	lw	s4,1080(sp)
   109b4:	43412a83          	lw	s5,1076(sp)
   109b8:	42c12b83          	lw	s7,1068(sp)
   109bc:	44c12083          	lw	ra,1100(sp)
   109c0:	44012903          	lw	s2,1088(sp)
   109c4:	43c12983          	lw	s3,1084(sp)
   109c8:	43012b03          	lw	s6,1072(sp)
   109cc:	45010113          	addi	sp,sp,1104
   109d0:	00008067          	ret

000109d4 <pqcrystals_dilithium2_ref_poly_uniform_eta>:
   109d4:	e6010113          	addi	sp,sp,-416
   109d8:	19512223          	sw	s5,388(sp)
   109dc:	00050a93          	mv	s5,a0
   109e0:	0b010513          	addi	a0,sp,176
   109e4:	18112e23          	sw	ra,412(sp)
   109e8:	18812c23          	sw	s0,408(sp)
   109ec:	19312623          	sw	s3,396(sp)
   109f0:	00810413          	addi	s0,sp,8
   109f4:	015030ef          	jal	14208 <pqcrystals_dilithium2_ref_dilithium_shake128_stream_init>
   109f8:	00040513          	mv	a0,s0
   109fc:	0b010613          	addi	a2,sp,176
   10a00:	00100593          	li	a1,1
   10a04:	304030ef          	jal	13d08 <pqcrystals_fips202_ref_shake128_squeezeblocks>
   10a08:	00100893          	li	a7,1
   10a0c:	00040513          	mv	a0,s0
   10a10:	408888b3          	sub	a7,a7,s0
   10a14:	00000993          	li	s3,0
   10a18:	00f00e93          	li	t4,15
   10a1c:	0cd00e13          	li	t3,205
   10a20:	00200313          	li	t1,2
   10a24:	00054783          	lbu	a5,0(a0)
   10a28:	00a88633          	add	a2,a7,a0
   10a2c:	00299593          	slli	a1,s3,0x2
   10a30:	00f7f713          	andi	a4,a5,15
   10a34:	f5860613          	addi	a2,a2,-168
   10a38:	0047d793          	srli	a5,a5,0x4
   10a3c:	40e30fb3          	sub	t6,t1,a4
   10a40:	f0198813          	addi	a6,s3,-255
   10a44:	00ba85b3          	add	a1,s5,a1
   10a48:	00060693          	mv	a3,a2
   10a4c:	40f302b3          	sub	t0,t1,a5
   10a50:	ff178393          	addi	t2,a5,-15
   10a54:	00100f13          	li	t5,1
   10a58:	03d70263          	beq	a4,t4,10a7c <pqcrystals_dilithium2_ref_poly_uniform_eta+0xa8>
   10a5c:	03c70733          	mul	a4,a4,t3
   10a60:	01003f33          	snez	t5,a6
   10a64:	00198993          	addi	s3,s3,1
   10a68:	00a75713          	srli	a4,a4,0xa
   10a6c:	00271813          	slli	a6,a4,0x2
   10a70:	00e80733          	add	a4,a6,a4
   10a74:	01f70733          	add	a4,a4,t6
   10a78:	00e5a023          	sw	a4,0(a1)
   10a7c:	00299713          	slli	a4,s3,0x2
   10a80:	00ea8733          	add	a4,s5,a4
   10a84:	f0198593          	addi	a1,s3,-255
   10a88:	14038c63          	beqz	t2,10be0 <pqcrystals_dilithium2_ref_poly_uniform_eta+0x20c>
   10a8c:	140f0a63          	beqz	t5,10be0 <pqcrystals_dilithium2_ref_poly_uniform_eta+0x20c>
   10a90:	03c787b3          	mul	a5,a5,t3
   10a94:	00198813          	addi	a6,s3,1
   10a98:	00150513          	addi	a0,a0,1
   10a9c:	00080993          	mv	s3,a6
   10aa0:	00a7d793          	srli	a5,a5,0xa
   10aa4:	00279693          	slli	a3,a5,0x2
   10aa8:	00f687b3          	add	a5,a3,a5
   10aac:	005787b3          	add	a5,a5,t0
   10ab0:	00f72023          	sw	a5,0(a4)
   10ab4:	00060463          	beqz	a2,10abc <pqcrystals_dilithium2_ref_poly_uniform_eta+0xe8>
   10ab8:	f60596e3          	bnez	a1,10a24 <pqcrystals_dilithium2_ref_poly_uniform_eta+0x50>
   10abc:	00080993          	mv	s3,a6
   10ac0:	10000793          	li	a5,256
   10ac4:	0ef98a63          	beq	s3,a5,10bb8 <pqcrystals_dilithium2_ref_poly_uniform_eta+0x1e4>
   10ac8:	18912a23          	sw	s1,404(sp)
   10acc:	00100493          	li	s1,1
   10ad0:	19212823          	sw	s2,400(sp)
   10ad4:	19412423          	sw	s4,392(sp)
   10ad8:	408484b3          	sub	s1,s1,s0
   10adc:	0cd00a13          	li	s4,205
   10ae0:	00200913          	li	s2,2
   10ae4:	00040513          	mv	a0,s0
   10ae8:	0b010613          	addi	a2,sp,176
   10aec:	00100593          	li	a1,1
   10af0:	218030ef          	jal	13d08 <pqcrystals_fips202_ref_shake128_squeezeblocks>
   10af4:	00299893          	slli	a7,s3,0x2
   10af8:	10000313          	li	t1,256
   10afc:	011a88b3          	add	a7,s5,a7
   10b00:	41330333          	sub	t1,t1,s3
   10b04:	00040813          	mv	a6,s0
   10b08:	00000513          	li	a0,0
   10b0c:	00f00e13          	li	t3,15
   10b10:	00084783          	lbu	a5,0(a6)
   10b14:	01048633          	add	a2,s1,a6
   10b18:	00251593          	slli	a1,a0,0x2
   10b1c:	00f7f713          	andi	a4,a5,15
   10b20:	f5860613          	addi	a2,a2,-168
   10b24:	0047d793          	srli	a5,a5,0x4
   10b28:	40e90eb3          	sub	t4,s2,a4
   10b2c:	00b885b3          	add	a1,a7,a1
   10b30:	00060693          	mv	a3,a2
   10b34:	40f90fb3          	sub	t6,s2,a5
   10b38:	ff178293          	addi	t0,a5,-15
   10b3c:	03c70063          	beq	a4,t3,10b5c <pqcrystals_dilithium2_ref_poly_uniform_eta+0x188>
   10b40:	03470733          	mul	a4,a4,s4
   10b44:	00150513          	addi	a0,a0,1
   10b48:	00a75713          	srli	a4,a4,0xa
   10b4c:	00271f13          	slli	t5,a4,0x2
   10b50:	00ef0733          	add	a4,t5,a4
   10b54:	01d70733          	add	a4,a4,t4
   10b58:	00e5a023          	sw	a4,0(a1)
   10b5c:	00251713          	slli	a4,a0,0x2
   10b60:	00e88733          	add	a4,a7,a4
   10b64:	006535b3          	sltu	a1,a0,t1
   10b68:	06028463          	beqz	t0,10bd0 <pqcrystals_dilithium2_ref_poly_uniform_eta+0x1fc>
   10b6c:	06058263          	beqz	a1,10bd0 <pqcrystals_dilithium2_ref_poly_uniform_eta+0x1fc>
   10b70:	034787b3          	mul	a5,a5,s4
   10b74:	00150593          	addi	a1,a0,1
   10b78:	00180813          	addi	a6,a6,1
   10b7c:	00058513          	mv	a0,a1
   10b80:	00a7d793          	srli	a5,a5,0xa
   10b84:	00279693          	slli	a3,a5,0x2
   10b88:	00f687b3          	add	a5,a3,a5
   10b8c:	01f787b3          	add	a5,a5,t6
   10b90:	00f72023          	sw	a5,0(a4)
   10b94:	00060463          	beqz	a2,10b9c <pqcrystals_dilithium2_ref_poly_uniform_eta+0x1c8>
   10b98:	f665ece3          	bltu	a1,t1,10b10 <pqcrystals_dilithium2_ref_poly_uniform_eta+0x13c>
   10b9c:	00058513          	mv	a0,a1
   10ba0:	00a989b3          	add	s3,s3,a0
   10ba4:	0ff00793          	li	a5,255
   10ba8:	f337fee3          	bgeu	a5,s3,10ae4 <pqcrystals_dilithium2_ref_poly_uniform_eta+0x110>
   10bac:	19412483          	lw	s1,404(sp)
   10bb0:	19012903          	lw	s2,400(sp)
   10bb4:	18812a03          	lw	s4,392(sp)
   10bb8:	19c12083          	lw	ra,412(sp)
   10bbc:	19812403          	lw	s0,408(sp)
   10bc0:	18c12983          	lw	s3,396(sp)
   10bc4:	18412a83          	lw	s5,388(sp)
   10bc8:	1a010113          	addi	sp,sp,416
   10bcc:	00008067          	ret
   10bd0:	fc0688e3          	beqz	a3,10ba0 <pqcrystals_dilithium2_ref_poly_uniform_eta+0x1cc>
   10bd4:	fc0586e3          	beqz	a1,10ba0 <pqcrystals_dilithium2_ref_poly_uniform_eta+0x1cc>
   10bd8:	00180813          	addi	a6,a6,1
   10bdc:	f35ff06f          	j	10b10 <pqcrystals_dilithium2_ref_poly_uniform_eta+0x13c>
   10be0:	ee0680e3          	beqz	a3,10ac0 <pqcrystals_dilithium2_ref_poly_uniform_eta+0xec>
   10be4:	ec0f0ee3          	beqz	t5,10ac0 <pqcrystals_dilithium2_ref_poly_uniform_eta+0xec>
   10be8:	00150513          	addi	a0,a0,1
   10bec:	e39ff06f          	j	10a24 <pqcrystals_dilithium2_ref_poly_uniform_eta+0x50>

00010bf0 <pqcrystals_dilithium2_ref_polyeta_pack>:
   10bf0:	40058e13          	addi	t3,a1,1024
   10bf4:	00200613          	li	a2,2
   10bf8:	0085a683          	lw	a3,8(a1)
   10bfc:	00c5a883          	lw	a7,12(a1)
   10c00:	0145a703          	lw	a4,20(a1)
   10c04:	0105af03          	lw	t5,16(a1)
   10c08:	0185ae83          	lw	t4,24(a1)
   10c0c:	0045a783          	lw	a5,4(a1)
   10c10:	01c5a303          	lw	t1,28(a1)
   10c14:	40d606b3          	sub	a3,a2,a3
   10c18:	0005af83          	lw	t6,0(a1)
   10c1c:	0ff6f693          	zext.b	a3,a3
   10c20:	411608b3          	sub	a7,a2,a7
   10c24:	40e60733          	sub	a4,a2,a4
   10c28:	0026d813          	srli	a6,a3,0x2
   10c2c:	00189893          	slli	a7,a7,0x1
   10c30:	0ff77713          	zext.b	a4,a4
   10c34:	41e60f33          	sub	t5,a2,t5
   10c38:	41d60eb3          	sub	t4,a2,t4
   10c3c:	40f607b3          	sub	a5,a2,a5
   10c40:	00669693          	slli	a3,a3,0x6
   10c44:	01186833          	or	a6,a6,a7
   10c48:	004f1f13          	slli	t5,t5,0x4
   10c4c:	00175893          	srli	a7,a4,0x1
   10c50:	002e9e93          	slli	t4,t4,0x2
   10c54:	00379793          	slli	a5,a5,0x3
   10c58:	40660333          	sub	t1,a2,t1
   10c5c:	00d7e7b3          	or	a5,a5,a3
   10c60:	01e86833          	or	a6,a6,t5
   10c64:	00771713          	slli	a4,a4,0x7
   10c68:	01d8e8b3          	or	a7,a7,t4
   10c6c:	00531693          	slli	a3,t1,0x5
   10c70:	41f60fb3          	sub	t6,a2,t6
   10c74:	00e86733          	or	a4,a6,a4
   10c78:	00d8e6b3          	or	a3,a7,a3
   10c7c:	01f7e7b3          	or	a5,a5,t6
   10c80:	00e500a3          	sb	a4,1(a0)
   10c84:	00d50123          	sb	a3,2(a0)
   10c88:	00f50023          	sb	a5,0(a0)
   10c8c:	02058593          	addi	a1,a1,32
   10c90:	00350513          	addi	a0,a0,3
   10c94:	f6be12e3          	bne	t3,a1,10bf8 <pqcrystals_dilithium2_ref_polyeta_pack+0x8>
   10c98:	00008067          	ret

00010c9c <pqcrystals_dilithium2_ref_polyt1_pack>:
   10c9c:	40058693          	addi	a3,a1,1024
   10ca0:	0005a783          	lw	a5,0(a1)
   10ca4:	01058593          	addi	a1,a1,16
   10ca8:	00550513          	addi	a0,a0,5
   10cac:	fef50da3          	sb	a5,-5(a0)
   10cb0:	ff05a783          	lw	a5,-16(a1)
   10cb4:	ff45a703          	lw	a4,-12(a1)
   10cb8:	4087d793          	srai	a5,a5,0x8
   10cbc:	00271713          	slli	a4,a4,0x2
   10cc0:	00e7e7b3          	or	a5,a5,a4
   10cc4:	fef50e23          	sb	a5,-4(a0)
   10cc8:	ff45a783          	lw	a5,-12(a1)
   10ccc:	ff85a703          	lw	a4,-8(a1)
   10cd0:	4067d793          	srai	a5,a5,0x6
   10cd4:	00471713          	slli	a4,a4,0x4
   10cd8:	00e7e7b3          	or	a5,a5,a4
   10cdc:	fef50ea3          	sb	a5,-3(a0)
   10ce0:	ff85a783          	lw	a5,-8(a1)
   10ce4:	ffc5a703          	lw	a4,-4(a1)
   10ce8:	4047d793          	srai	a5,a5,0x4
   10cec:	00671713          	slli	a4,a4,0x6
   10cf0:	00e7e7b3          	or	a5,a5,a4
   10cf4:	fef50f23          	sb	a5,-2(a0)
   10cf8:	ffc5a783          	lw	a5,-4(a1)
   10cfc:	4027d793          	srai	a5,a5,0x2
   10d00:	fef50fa3          	sb	a5,-1(a0)
   10d04:	f8d59ee3          	bne	a1,a3,10ca0 <pqcrystals_dilithium2_ref_polyt1_pack+0x4>
   10d08:	00008067          	ret

00010d0c <pqcrystals_dilithium2_ref_polyt0_pack>:
   10d0c:	fd010113          	addi	sp,sp,-48
   10d10:	02812623          	sw	s0,44(sp)
   10d14:	02912423          	sw	s1,40(sp)
   10d18:	03212223          	sw	s2,36(sp)
   10d1c:	03312023          	sw	s3,32(sp)
   10d20:	01412e23          	sw	s4,28(sp)
   10d24:	01512c23          	sw	s5,24(sp)
   10d28:	01612a23          	sw	s6,20(sp)
   10d2c:	01712823          	sw	s7,16(sp)
   10d30:	01812623          	sw	s8,12(sp)
   10d34:	1a050293          	addi	t0,a0,416
   10d38:	00001eb7          	lui	t4,0x1
   10d3c:	0005af03          	lw	t5,0(a1)
   10d40:	0045a303          	lw	t1,4(a1)
   10d44:	0085a803          	lw	a6,8(a1)
   10d48:	00c5a883          	lw	a7,12(a1)
   10d4c:	0105a703          	lw	a4,16(a1)
   10d50:	0145a603          	lw	a2,20(a1)
   10d54:	0185a783          	lw	a5,24(a1)
   10d58:	01c5a683          	lw	a3,28(a1)
   10d5c:	406e8333          	sub	t1,t4,t1
   10d60:	411e88b3          	sub	a7,t4,a7
   10d64:	40ee8733          	sub	a4,t4,a4
   10d68:	40fe87b3          	sub	a5,t4,a5
   10d6c:	41ee8f33          	sub	t5,t4,t5
   10d70:	410e8833          	sub	a6,t4,a6
   10d74:	40ce8633          	sub	a2,t4,a2
   10d78:	40de86b3          	sub	a3,t4,a3
   10d7c:	00531493          	slli	s1,t1,0x5
   10d80:	00b35b93          	srli	s7,t1,0xb
   10d84:	00281413          	slli	s0,a6,0x2
   10d88:	00789b13          	slli	s6,a7,0x7
   10d8c:	0098d393          	srli	t2,a7,0x9
   10d90:	00471a93          	slli	s5,a4,0x4
   10d94:	00c75f93          	srli	t6,a4,0xc
   10d98:	00161a13          	slli	s4,a2,0x1
   10d9c:	00679993          	slli	s3,a5,0x6
   10da0:	00a7de13          	srli	t3,a5,0xa
   10da4:	00369913          	slli	s2,a3,0x3
   10da8:	008f5c13          	srli	s8,t5,0x8
   10dac:	00685813          	srli	a6,a6,0x6
   10db0:	00765613          	srli	a2,a2,0x7
   10db4:	009c64b3          	or	s1,s8,s1
   10db8:	00335313          	srli	t1,t1,0x3
   10dbc:	008be433          	or	s0,s7,s0
   10dc0:	01686833          	or	a6,a6,s6
   10dc4:	0018d893          	srli	a7,a7,0x1
   10dc8:	0153e3b3          	or	t2,t2,s5
   10dcc:	00475713          	srli	a4,a4,0x4
   10dd0:	014fefb3          	or	t6,t6,s4
   10dd4:	01366633          	or	a2,a2,s3
   10dd8:	0027d793          	srli	a5,a5,0x2
   10ddc:	012e6e33          	or	t3,t3,s2
   10de0:	0056d693          	srli	a3,a3,0x5
   10de4:	009500a3          	sb	s1,1(a0)
   10de8:	01e50023          	sb	t5,0(a0)
   10dec:	00650123          	sb	t1,2(a0)
   10df0:	008501a3          	sb	s0,3(a0)
   10df4:	01050223          	sb	a6,4(a0)
   10df8:	011502a3          	sb	a7,5(a0)
   10dfc:	00750323          	sb	t2,6(a0)
   10e00:	00e503a3          	sb	a4,7(a0)
   10e04:	01f50423          	sb	t6,8(a0)
   10e08:	00c504a3          	sb	a2,9(a0)
   10e0c:	00f50523          	sb	a5,10(a0)
   10e10:	01c505a3          	sb	t3,11(a0)
   10e14:	00d50623          	sb	a3,12(a0)
   10e18:	00d50513          	addi	a0,a0,13
   10e1c:	02058593          	addi	a1,a1,32
   10e20:	f0a29ee3          	bne	t0,a0,10d3c <pqcrystals_dilithium2_ref_polyt0_pack+0x30>
   10e24:	02c12403          	lw	s0,44(sp)
   10e28:	02812483          	lw	s1,40(sp)
   10e2c:	02412903          	lw	s2,36(sp)
   10e30:	02012983          	lw	s3,32(sp)
   10e34:	01c12a03          	lw	s4,28(sp)
   10e38:	01812a83          	lw	s5,24(sp)
   10e3c:	01412b03          	lw	s6,20(sp)
   10e40:	01012b83          	lw	s7,16(sp)
   10e44:	00c12c03          	lw	s8,12(sp)
   10e48:	03010113          	addi	sp,sp,48
   10e4c:	00008067          	ret

00010e50 <pqcrystals_dilithium2_ref_ntt>:
   10e50:	000147b7          	lui	a5,0x14
   10e54:	fb010113          	addi	sp,sp,-80
   10e58:	46078793          	addi	a5,a5,1120 # 14460 <zetas>
   10e5c:	00014737          	lui	a4,0x14
   10e60:	00f12623          	sw	a5,12(sp)
   10e64:	46870793          	addi	a5,a4,1128 # 14468 <zetas+0x8>
   10e68:	01b12e23          	sw	s11,28(sp)
   10e6c:	00f12423          	sw	a5,8(sp)
   10e70:	00006db7          	lui	s11,0x6
   10e74:	00800793          	li	a5,8
   10e78:	03312e23          	sw	s3,60(sp)
   10e7c:	03412c23          	sw	s4,56(sp)
   10e80:	03612823          	sw	s6,48(sp)
   10e84:	04112623          	sw	ra,76(sp)
   10e88:	04812423          	sw	s0,72(sp)
   10e8c:	04912223          	sw	s1,68(sp)
   10e90:	05212023          	sw	s2,64(sp)
   10e94:	03512a23          	sw	s5,52(sp)
   10e98:	03712623          	sw	s7,44(sp)
   10e9c:	03812423          	sw	s8,40(sp)
   10ea0:	03912223          	sw	s9,36(sp)
   10ea4:	03a12023          	sw	s10,32(sp)
   10ea8:	00050a13          	mv	s4,a0
   10eac:	4f7d8d93          	addi	s11,s11,1271 # 64f7 <_start-0x9b09>
   10eb0:	00f12223          	sw	a5,4(sp)
   10eb4:	00000993          	li	s3,0
   10eb8:	08000b13          	li	s6,128
   10ebc:	00812783          	lw	a5,8(sp)
   10ec0:	00299913          	slli	s2,s3,0x2
   10ec4:	00000493          	li	s1,0
   10ec8:	01278933          	add	s2,a5,s2
   10ecc:	fffb0793          	addi	a5,s6,-1
   10ed0:	001b0b93          	addi	s7,s6,1
   10ed4:	00f12023          	sw	a5,0(sp)
   10ed8:	009b0433          	add	s0,s6,s1
   10edc:	00241713          	slli	a4,s0,0x2
   10ee0:	00249793          	slli	a5,s1,0x2
   10ee4:	00ea0c33          	add	s8,s4,a4
   10ee8:	00fa0cb3          	add	s9,s4,a5
   10eec:	00198a93          	addi	s5,s3,1
   10ef0:	00048d13          	mv	s10,s1
   10ef4:	000c2503          	lw	a0,0(s8)
   10ef8:	001d0d13          	addi	s10,s10,1
   10efc:	004c0c13          	addi	s8,s8,4
   10f00:	02ad95b3          	mulh	a1,s11,a0
   10f04:	004c8c93          	addi	s9,s9,4
   10f08:	02ad8533          	mul	a0,s11,a0
   10f0c:	21c000ef          	jal	11128 <pqcrystals_dilithium2_ref_montgomery_reduce>
   10f10:	ffcca683          	lw	a3,-4(s9)
   10f14:	40a686b3          	sub	a3,a3,a0
   10f18:	fedc2e23          	sw	a3,-4(s8)
   10f1c:	ffcca683          	lw	a3,-4(s9)
   10f20:	00a686b3          	add	a3,a3,a0
   10f24:	fedcae23          	sw	a3,-4(s9)
   10f28:	fc8d66e3          	bltu	s10,s0,10ef4 <pqcrystals_dilithium2_ref_ntt+0xa4>
   10f2c:	00148793          	addi	a5,s1,1 # 1001 <_start-0xefff>
   10f30:	00000713          	li	a4,0
   10f34:	00f46463          	bltu	s0,a5,10f3c <pqcrystals_dilithium2_ref_ntt+0xec>
   10f38:	00012703          	lw	a4,0(sp)
   10f3c:	009b84b3          	add	s1,s7,s1
   10f40:	009704b3          	add	s1,a4,s1
   10f44:	0ff00793          	li	a5,255
   10f48:	0097ea63          	bltu	a5,s1,10f5c <pqcrystals_dilithium2_ref_ntt+0x10c>
   10f4c:	00092d83          	lw	s11,0(s2)
   10f50:	000a8993          	mv	s3,s5
   10f54:	00490913          	addi	s2,s2,4
   10f58:	f81ff06f          	j	10ed8 <pqcrystals_dilithium2_ref_ntt+0x88>
   10f5c:	00412783          	lw	a5,4(sp)
   10f60:	fff78793          	addi	a5,a5,-1
   10f64:	00f12223          	sw	a5,4(sp)
   10f68:	02078263          	beqz	a5,10f8c <pqcrystals_dilithium2_ref_ntt+0x13c>
   10f6c:	00c12703          	lw	a4,12(sp)
   10f70:	00298793          	addi	a5,s3,2
   10f74:	00279793          	slli	a5,a5,0x2
   10f78:	00f707b3          	add	a5,a4,a5
   10f7c:	0007ad83          	lw	s11,0(a5)
   10f80:	001b5b13          	srli	s6,s6,0x1
   10f84:	000a8993          	mv	s3,s5
   10f88:	f35ff06f          	j	10ebc <pqcrystals_dilithium2_ref_ntt+0x6c>
   10f8c:	04c12083          	lw	ra,76(sp)
   10f90:	04812403          	lw	s0,72(sp)
   10f94:	04412483          	lw	s1,68(sp)
   10f98:	04012903          	lw	s2,64(sp)
   10f9c:	03c12983          	lw	s3,60(sp)
   10fa0:	03812a03          	lw	s4,56(sp)
   10fa4:	03412a83          	lw	s5,52(sp)
   10fa8:	03012b03          	lw	s6,48(sp)
   10fac:	02c12b83          	lw	s7,44(sp)
   10fb0:	02812c03          	lw	s8,40(sp)
   10fb4:	02412c83          	lw	s9,36(sp)
   10fb8:	02012d03          	lw	s10,32(sp)
   10fbc:	01c12d83          	lw	s11,28(sp)
   10fc0:	05010113          	addi	sp,sp,80
   10fc4:	00008067          	ret

00010fc8 <pqcrystals_dilithium2_ref_invntt_tomont>:
   10fc8:	fb010113          	addi	sp,sp,-80
   10fcc:	03912223          	sw	s9,36(sp)
   10fd0:	00014cb7          	lui	s9,0x14
   10fd4:	45cc8793          	addi	a5,s9,1116 # 1445c <memcpy+0x124>
   10fd8:	05212023          	sw	s2,64(sp)
   10fdc:	03512a23          	sw	s5,52(sp)
   10fe0:	03612823          	sw	s6,48(sp)
   10fe4:	03712623          	sw	s7,44(sp)
   10fe8:	03812423          	sw	s8,40(sp)
   10fec:	04112623          	sw	ra,76(sp)
   10ff0:	04812423          	sw	s0,72(sp)
   10ff4:	04912223          	sw	s1,68(sp)
   10ff8:	03312e23          	sw	s3,60(sp)
   10ffc:	03412c23          	sw	s4,56(sp)
   11000:	03a12023          	sw	s10,32(sp)
   11004:	01b12e23          	sw	s11,28(sp)
   11008:	00050913          	mv	s2,a0
   1100c:	00f12623          	sw	a5,12(sp)
   11010:	00800c13          	li	s8,8
   11014:	10000b13          	li	s6,256
   11018:	00100a93          	li	s5,1
   1101c:	0ff00b93          	li	s7,255
   11020:	00c12783          	lw	a5,12(sp)
   11024:	002b1a13          	slli	s4,s6,0x2
   11028:	00000d93          	li	s11,0
   1102c:	01478a33          	add	s4,a5,s4
   11030:	015d89b3          	add	s3,s11,s5
   11034:	fffb0b13          	addi	s6,s6,-1
   11038:	073dfa63          	bgeu	s11,s3,110ac <pqcrystals_dilithium2_ref_invntt_tomont+0xe4>
   1103c:	000a2703          	lw	a4,0(s4)
   11040:	00299413          	slli	s0,s3,0x2
   11044:	002d9d93          	slli	s11,s11,0x2
   11048:	00890433          	add	s0,s2,s0
   1104c:	01b90db3          	add	s11,s2,s11
   11050:	00040d13          	mv	s10,s0
   11054:	40e00cb3          	neg	s9,a4
   11058:	00090493          	mv	s1,s2
   1105c:	000da503          	lw	a0,0(s11)
   11060:	000d2783          	lw	a5,0(s10)
   11064:	004d8d93          	addi	s11,s11,4
   11068:	004d0d13          	addi	s10,s10,4
   1106c:	00a787b3          	add	a5,a5,a0
   11070:	fefdae23          	sw	a5,-4(s11)
   11074:	ffcd2783          	lw	a5,-4(s10)
   11078:	40f50533          	sub	a0,a0,a5
   1107c:	fead2e23          	sw	a0,-4(s10)
   11080:	039515b3          	mulh	a1,a0,s9
   11084:	03950533          	mul	a0,a0,s9
   11088:	0a0000ef          	jal	11128 <pqcrystals_dilithium2_ref_montgomery_reduce>
   1108c:	fead2e23          	sw	a0,-4(s10)
   11090:	fdb416e3          	bne	s0,s11,1105c <pqcrystals_dilithium2_ref_invntt_tomont+0x94>
   11094:	01598db3          	add	s11,s3,s5
   11098:	03bbe063          	bltu	s7,s11,110b8 <pqcrystals_dilithium2_ref_invntt_tomont+0xf0>
   1109c:	015d89b3          	add	s3,s11,s5
   110a0:	ffca0a13          	addi	s4,s4,-4
   110a4:	fffb0b13          	addi	s6,s6,-1
   110a8:	f93deae3          	bltu	s11,s3,1103c <pqcrystals_dilithium2_ref_invntt_tomont+0x74>
   110ac:	ffca0a13          	addi	s4,s4,-4
   110b0:	00098d93          	mv	s11,s3
   110b4:	f7dff06f          	j	11030 <pqcrystals_dilithium2_ref_invntt_tomont+0x68>
   110b8:	fffc0c13          	addi	s8,s8,-1
   110bc:	001a9a93          	slli	s5,s5,0x1
   110c0:	f60c10e3          	bnez	s8,11020 <pqcrystals_dilithium2_ref_invntt_tomont+0x58>
   110c4:	0000a437          	lui	s0,0xa
   110c8:	40090913          	addi	s2,s2,1024
   110cc:	3fa40413          	addi	s0,s0,1018 # a3fa <_start-0x5c06>
   110d0:	0004a503          	lw	a0,0(s1)
   110d4:	00448493          	addi	s1,s1,4
   110d8:	028515b3          	mulh	a1,a0,s0
   110dc:	02850533          	mul	a0,a0,s0
   110e0:	048000ef          	jal	11128 <pqcrystals_dilithium2_ref_montgomery_reduce>
   110e4:	fea4ae23          	sw	a0,-4(s1)
   110e8:	ff2494e3          	bne	s1,s2,110d0 <pqcrystals_dilithium2_ref_invntt_tomont+0x108>
   110ec:	04c12083          	lw	ra,76(sp)
   110f0:	04812403          	lw	s0,72(sp)
   110f4:	04412483          	lw	s1,68(sp)
   110f8:	04012903          	lw	s2,64(sp)
   110fc:	03c12983          	lw	s3,60(sp)
   11100:	03812a03          	lw	s4,56(sp)
   11104:	03412a83          	lw	s5,52(sp)
   11108:	03012b03          	lw	s6,48(sp)
   1110c:	02c12b83          	lw	s7,44(sp)
   11110:	02812c03          	lw	s8,40(sp)
   11114:	02412c83          	lw	s9,36(sp)
   11118:	02012d03          	lw	s10,32(sp)
   1111c:	01c12d83          	lw	s11,28(sp)
   11120:	05010113          	addi	sp,sp,80
   11124:	00008067          	ret

00011128 <pqcrystals_dilithium2_ref_montgomery_reduce>:
   11128:	03802737          	lui	a4,0x3802
   1112c:	00170713          	addi	a4,a4,1 # 3802001 <__stack_top+0x37e3005>
   11130:	02e50733          	mul	a4,a0,a4
   11134:	41f75613          	srai	a2,a4,0x1f
   11138:	01675693          	srli	a3,a4,0x16
   1113c:	00a61793          	slli	a5,a2,0xa
   11140:	00f687b3          	add	a5,a3,a5
   11144:	00a71693          	slli	a3,a4,0xa
   11148:	40d706b3          	sub	a3,a4,a3
   1114c:	00d73833          	sltu	a6,a4,a3
   11150:	40f607b3          	sub	a5,a2,a5
   11154:	410787b3          	sub	a5,a5,a6
   11158:	00d79793          	slli	a5,a5,0xd
   1115c:	0136d813          	srli	a6,a3,0x13
   11160:	00d69693          	slli	a3,a3,0xd
   11164:	40e68733          	sub	a4,a3,a4
   11168:	00f807b3          	add	a5,a6,a5
   1116c:	40c787b3          	sub	a5,a5,a2
   11170:	00e6b6b3          	sltu	a3,a3,a4
   11174:	40d787b3          	sub	a5,a5,a3
   11178:	00a70533          	add	a0,a4,a0
   1117c:	00b787b3          	add	a5,a5,a1
   11180:	00e53533          	sltu	a0,a0,a4
   11184:	00f50533          	add	a0,a0,a5
   11188:	00008067          	ret

0001118c <pqcrystals_dilithium2_ref_reduce32>:
   1118c:	004007b7          	lui	a5,0x400
   11190:	00f507b3          	add	a5,a0,a5
   11194:	ff802737          	lui	a4,0xff802
   11198:	fff70713          	addi	a4,a4,-1 # ff801fff <__stack_top+0xff7e3003>
   1119c:	4177d793          	srai	a5,a5,0x17
   111a0:	02e787b3          	mul	a5,a5,a4
   111a4:	00a78533          	add	a0,a5,a0
   111a8:	00008067          	ret

000111ac <pqcrystals_dilithium2_ref_caddq>:
   111ac:	007fe737          	lui	a4,0x7fe
   111b0:	41f55793          	srai	a5,a0,0x1f
   111b4:	00170713          	addi	a4,a4,1 # 7fe001 <__stack_top+0x7df005>
   111b8:	00e7f7b3          	and	a5,a5,a4
   111bc:	00a78533          	add	a0,a5,a0
   111c0:	00008067          	ret

000111c4 <KeccakF1600_StatePermute>:
   111c4:	00052783          	lw	a5,0(a0)
   111c8:	eb010113          	addi	sp,sp,-336
   111cc:	15312023          	sw	s3,320(sp)
   111d0:	0cf12223          	sw	a5,196(sp)
   111d4:	00452783          	lw	a5,4(a0)
   111d8:	15212223          	sw	s2,324(sp)
   111dc:	13412e23          	sw	s4,316(sp)
   111e0:	0cf12423          	sw	a5,200(sp)
   111e4:	00852783          	lw	a5,8(a0)
   111e8:	13512c23          	sw	s5,312(sp)
   111ec:	13612a23          	sw	s6,308(sp)
   111f0:	00f12a23          	sw	a5,20(sp)
   111f4:	00c52783          	lw	a5,12(a0)
   111f8:	13712823          	sw	s7,304(sp)
   111fc:	13812623          	sw	s8,300(sp)
   11200:	00f12c23          	sw	a5,24(sp)
   11204:	01052783          	lw	a5,16(a0)
   11208:	13912423          	sw	s9,296(sp)
   1120c:	13a12223          	sw	s10,292(sp)
   11210:	0cf12623          	sw	a5,204(sp)
   11214:	01452783          	lw	a5,20(a0)
   11218:	13b12023          	sw	s11,288(sp)
   1121c:	14812623          	sw	s0,332(sp)
   11220:	0cf12823          	sw	a5,208(sp)
   11224:	01852783          	lw	a5,24(a0)
   11228:	14912423          	sw	s1,328(sp)
   1122c:	02f12023          	sw	a5,32(sp)
   11230:	01c52783          	lw	a5,28(a0)
   11234:	00078993          	mv	s3,a5
   11238:	02052783          	lw	a5,32(a0)
   1123c:	0cf12a23          	sw	a5,212(sp)
   11240:	02452783          	lw	a5,36(a0)
   11244:	0cf12c23          	sw	a5,216(sp)
   11248:	02852783          	lw	a5,40(a0)
   1124c:	06052c03          	lw	s8,96(a0)
   11250:	05052d03          	lw	s10,80(a0)
   11254:	0cf12e23          	sw	a5,220(sp)
   11258:	02c52783          	lw	a5,44(a0)
   1125c:	06852c83          	lw	s9,104(a0)
   11260:	05452b83          	lw	s7,84(a0)
   11264:	0ef12023          	sw	a5,224(sp)
   11268:	03052783          	lw	a5,48(a0)
   1126c:	00f12e23          	sw	a5,28(sp)
   11270:	03452783          	lw	a5,52(a0)
   11274:	02f12223          	sw	a5,36(sp)
   11278:	03852783          	lw	a5,56(a0)
   1127c:	02f12823          	sw	a5,48(sp)
   11280:	03c52783          	lw	a5,60(a0)
   11284:	02f12a23          	sw	a5,52(sp)
   11288:	04052783          	lw	a5,64(a0)
   1128c:	0ef12223          	sw	a5,228(sp)
   11290:	04452783          	lw	a5,68(a0)
   11294:	0ef12423          	sw	a5,232(sp)
   11298:	04852783          	lw	a5,72(a0)
   1129c:	02f12423          	sw	a5,40(sp)
   112a0:	04c52783          	lw	a5,76(a0)
   112a4:	00078613          	mv	a2,a5
   112a8:	05852783          	lw	a5,88(a0)
   112ac:	06f12023          	sw	a5,96(sp)
   112b0:	05c52783          	lw	a5,92(a0)
   112b4:	04f12e23          	sw	a5,92(sp)
   112b8:	06452783          	lw	a5,100(a0)
   112bc:	02f12623          	sw	a5,44(sp)
   112c0:	06c52783          	lw	a5,108(a0)
   112c4:	02f12c23          	sw	a5,56(sp)
   112c8:	07052783          	lw	a5,112(a0)
   112cc:	06f12c23          	sw	a5,120(sp)
   112d0:	08852703          	lw	a4,136(a0)
   112d4:	07452783          	lw	a5,116(a0)
   112d8:	0b052383          	lw	t2,176(a0)
   112dc:	06e12423          	sw	a4,104(sp)
   112e0:	08c52703          	lw	a4,140(a0)
   112e4:	06f12223          	sw	a5,100(sp)
   112e8:	07852783          	lw	a5,120(a0)
   112ec:	06e12623          	sw	a4,108(sp)
   112f0:	09852703          	lw	a4,152(a0)
   112f4:	06f12a23          	sw	a5,116(sp)
   112f8:	07c52783          	lw	a5,124(a0)
   112fc:	02e12e23          	sw	a4,60(sp)
   11300:	09c52703          	lw	a4,156(a0)
   11304:	06f12e23          	sw	a5,124(sp)
   11308:	08052b03          	lw	s6,128(a0)
   1130c:	04e12023          	sw	a4,64(sp)
   11310:	0a052703          	lw	a4,160(a0)
   11314:	08452903          	lw	s2,132(a0)
   11318:	09052a83          	lw	s5,144(a0)
   1131c:	04e12223          	sw	a4,68(sp)
   11320:	0a452703          	lw	a4,164(a0)
   11324:	09452283          	lw	t0,148(a0)
   11328:	0b452a03          	lw	s4,180(a0)
   1132c:	04e12423          	sw	a4,72(sp)
   11330:	0a852703          	lw	a4,168(a0)
   11334:	000157b7          	lui	a5,0x15
   11338:	86078793          	addi	a5,a5,-1952 # 14860 <KeccakF_RoundConstants>
   1133c:	06e12823          	sw	a4,112(sp)
   11340:	0ac52703          	lw	a4,172(a0)
   11344:	00038e93          	mv	t4,t2
   11348:	08e12023          	sw	a4,128(sp)
   1134c:	0b852703          	lw	a4,184(a0)
   11350:	08e12223          	sw	a4,132(sp)
   11354:	0bc52703          	lw	a4,188(a0)
   11358:	08e12423          	sw	a4,136(sp)
   1135c:	0c052703          	lw	a4,192(a0)
   11360:	0c452d83          	lw	s11,196(a0)
   11364:	00f12623          	sw	a5,12(sp)
   11368:	05812823          	sw	s8,80(sp)
   1136c:	05a12623          	sw	s10,76(sp)
   11370:	00060c13          	mv	s8,a2
   11374:	05912a23          	sw	s9,84(sp)
   11378:	00070793          	mv	a5,a4
   1137c:	10a12e23          	sw	a0,284(sp)
   11380:	0c412703          	lw	a4,196(sp)
   11384:	0dc12683          	lw	a3,220(sp)
   11388:	0e012603          	lw	a2,224(sp)
   1138c:	00d746b3          	xor	a3,a4,a3
   11390:	0c812703          	lw	a4,200(sp)
   11394:	00c748b3          	xor	a7,a4,a2
   11398:	02012703          	lw	a4,32(sp)
   1139c:	0e412603          	lw	a2,228(sp)
   113a0:	0178c8b3          	xor	a7,a7,s7
   113a4:	00c74f33          	xor	t5,a4,a2
   113a8:	0e812703          	lw	a4,232(sp)
   113ac:	03012603          	lw	a2,48(sp)
   113b0:	00e9c3b3          	xor	t2,s3,a4
   113b4:	0cc12703          	lw	a4,204(sp)
   113b8:	00c74833          	xor	a6,a4,a2
   113bc:	0d012703          	lw	a4,208(sp)
   113c0:	03412603          	lw	a2,52(sp)
   113c4:	00c74433          	xor	s0,a4,a2
   113c8:	0d412703          	lw	a4,212(sp)
   113cc:	02812603          	lw	a2,40(sp)
   113d0:	00c74533          	xor	a0,a4,a2
   113d4:	0d812703          	lw	a4,216(sp)
   113d8:	01c12603          	lw	a2,28(sp)
   113dc:	018745b3          	xor	a1,a4,s8
   113e0:	01412703          	lw	a4,20(sp)
   113e4:	00c74fb3          	xor	t6,a4,a2
   113e8:	02412603          	lw	a2,36(sp)
   113ec:	01812703          	lw	a4,24(sp)
   113f0:	00c74733          	xor	a4,a4,a2
   113f4:	04c12603          	lw	a2,76(sp)
   113f8:	00c6c6b3          	xor	a3,a3,a2
   113fc:	05412603          	lw	a2,84(sp)
   11400:	00cf4f33          	xor	t5,t5,a2
   11404:	03812603          	lw	a2,56(sp)
   11408:	015f4f33          	xor	t5,t5,s5
   1140c:	00c3c3b3          	xor	t2,t2,a2
   11410:	05012603          	lw	a2,80(sp)
   11414:	0053c3b3          	xor	t2,t2,t0
   11418:	00c84833          	xor	a6,a6,a2
   1141c:	02c12603          	lw	a2,44(sp)
   11420:	00c44433          	xor	s0,s0,a2
   11424:	07812603          	lw	a2,120(sp)
   11428:	00c54533          	xor	a0,a0,a2
   1142c:	06412603          	lw	a2,100(sp)
   11430:	00c5c5b3          	xor	a1,a1,a2
   11434:	06012603          	lw	a2,96(sp)
   11438:	00cfcfb3          	xor	t6,t6,a2
   1143c:	05c12603          	lw	a2,92(sp)
   11440:	016fcfb3          	xor	t6,t6,s6
   11444:	00c74733          	xor	a4,a4,a2
   11448:	07412603          	lw	a2,116(sp)
   1144c:	01274733          	xor	a4,a4,s2
   11450:	00c6c6b3          	xor	a3,a3,a2
   11454:	07c12603          	lw	a2,124(sp)
   11458:	00c8c8b3          	xor	a7,a7,a2
   1145c:	06812603          	lw	a2,104(sp)
   11460:	00c84833          	xor	a6,a6,a2
   11464:	06c12603          	lw	a2,108(sp)
   11468:	01d84833          	xor	a6,a6,t4
   1146c:	00181493          	slli	s1,a6,0x1
   11470:	00c44433          	xor	s0,s0,a2
   11474:	03c12603          	lw	a2,60(sp)
   11478:	01444433          	xor	s0,s0,s4
   1147c:	00c54533          	xor	a0,a0,a2
   11480:	04012603          	lw	a2,64(sp)
   11484:	00f54533          	xor	a0,a0,a5
   11488:	00c5c5b3          	xor	a1,a1,a2
   1148c:	04412603          	lw	a2,68(sp)
   11490:	01b5c5b3          	xor	a1,a1,s11
   11494:	00c6c6b3          	xor	a3,a3,a2
   11498:	04812603          	lw	a2,72(sp)
   1149c:	01f6d313          	srli	t1,a3,0x1f
   114a0:	00c8c8b3          	xor	a7,a7,a2
   114a4:	08412603          	lw	a2,132(sp)
   114a8:	01f8de13          	srli	t3,a7,0x1f
   114ac:	00cf4f33          	xor	t5,t5,a2
   114b0:	08812603          	lw	a2,136(sp)
   114b4:	00c3c3b3          	xor	t2,t2,a2
   114b8:	07012603          	lw	a2,112(sp)
   114bc:	00cfcfb3          	xor	t6,t6,a2
   114c0:	08012603          	lw	a2,128(sp)
   114c4:	00c74733          	xor	a4,a4,a2
   114c8:	00169613          	slli	a2,a3,0x1
   114cc:	00ce0e33          	add	t3,t3,a2
   114d0:	00189613          	slli	a2,a7,0x1
   114d4:	00c30333          	add	t1,t1,a2
   114d8:	01f45613          	srli	a2,s0,0x1f
   114dc:	00960633          	add	a2,a2,s1
   114e0:	00d64633          	xor	a2,a2,a3
   114e4:	00141493          	slli	s1,s0,0x1
   114e8:	01f85693          	srli	a3,a6,0x1f
   114ec:	009686b3          	add	a3,a3,s1
   114f0:	0116c6b3          	xor	a3,a3,a7
   114f4:	00151493          	slli	s1,a0,0x1
   114f8:	01f5d893          	srli	a7,a1,0x1f
   114fc:	009888b3          	add	a7,a7,s1
   11500:	0108c8b3          	xor	a7,a7,a6
   11504:	00159493          	slli	s1,a1,0x1
   11508:	01f55813          	srli	a6,a0,0x1f
   1150c:	00980833          	add	a6,a6,s1
   11510:	00884833          	xor	a6,a6,s0
   11514:	001f9493          	slli	s1,t6,0x1
   11518:	01f75413          	srli	s0,a4,0x1f
   1151c:	00940433          	add	s0,s0,s1
   11520:	00a44533          	xor	a0,s0,a0
   11524:	00a12823          	sw	a0,16(sp)
   11528:	00171413          	slli	s0,a4,0x1
   1152c:	01ffd513          	srli	a0,t6,0x1f
   11530:	00850533          	add	a0,a0,s0
   11534:	00b54cb3          	xor	s9,a0,a1
   11538:	001f1593          	slli	a1,t5,0x1
   1153c:	01f3d513          	srli	a0,t2,0x1f
   11540:	00139413          	slli	s0,t2,0x1
   11544:	00b50533          	add	a0,a0,a1
   11548:	01ff5593          	srli	a1,t5,0x1f
   1154c:	008585b3          	add	a1,a1,s0
   11550:	00e5c5b3          	xor	a1,a1,a4
   11554:	02812703          	lw	a4,40(sp)
   11558:	01ee4e33          	xor	t3,t3,t5
   1155c:	00734333          	xor	t1,t1,t2
   11560:	00ee4733          	xor	a4,t3,a4
   11564:	08e12623          	sw	a4,140(sp)
   11568:	02012703          	lw	a4,32(sp)
   1156c:	01f54533          	xor	a0,a0,t6
   11570:	01834fb3          	xor	t6,t1,s8
   11574:	00e8c733          	xor	a4,a7,a4
   11578:	04e12c23          	sw	a4,88(sp)
   1157c:	01c12703          	lw	a4,28(sp)
   11580:	01384c33          	xor	s8,a6,s3
   11584:	04c12f03          	lw	t5,76(sp)
   11588:	00e64433          	xor	s0,a2,a4
   1158c:	01412703          	lw	a4,20(sp)
   11590:	00fe47b3          	xor	a5,t3,a5
   11594:	01b34db3          	xor	s11,t1,s11
   11598:	00e649b3          	xor	s3,a2,a4
   1159c:	02412703          	lw	a4,36(sp)
   115a0:	00e79d13          	slli	s10,a5,0xe
   115a4:	0127d793          	srli	a5,a5,0x12
   115a8:	00e6c3b3          	xor	t2,a3,a4
   115ac:	01812703          	lw	a4,24(sp)
   115b0:	0158cab3          	xor	s5,a7,s5
   115b4:	005842b3          	xor	t0,a6,t0
   115b8:	00e6c4b3          	xor	s1,a3,a4
   115bc:	01012703          	lw	a4,16(sp)
   115c0:	01664b33          	xor	s6,a2,s6
   115c4:	0126c933          	xor	s2,a3,s2
   115c8:	01e74733          	xor	a4,a4,t5
   115cc:	08e12823          	sw	a4,144(sp)
   115d0:	017cc733          	xor	a4,s9,s7
   115d4:	08e12a23          	sw	a4,148(sp)
   115d8:	05012703          	lw	a4,80(sp)
   115dc:	01d54bb3          	xor	s7,a0,t4
   115e0:	0145ca33          	xor	s4,a1,s4
   115e4:	00e54f33          	xor	t5,a0,a4
   115e8:	02c12703          	lw	a4,44(sp)
   115ec:	00e5ceb3          	xor	t4,a1,a4
   115f0:	012dd713          	srli	a4,s11,0x12
   115f4:	00ed9d93          	slli	s11,s11,0xe
   115f8:	01b787b3          	add	a5,a5,s11
   115fc:	02f12623          	sw	a5,44(sp)
   11600:	03c12783          	lw	a5,60(sp)
   11604:	01a70733          	add	a4,a4,s10
   11608:	02e12423          	sw	a4,40(sp)
   1160c:	00fe47b3          	xor	a5,t3,a5
   11610:	0af12423          	sw	a5,168(sp)
   11614:	04012783          	lw	a5,64(sp)
   11618:	00f34d33          	xor	s10,t1,a5
   1161c:	05412783          	lw	a5,84(sp)
   11620:	00f8c7b3          	xor	a5,a7,a5
   11624:	0af12023          	sw	a5,160(sp)
   11628:	03812783          	lw	a5,56(sp)
   1162c:	00f847b3          	xor	a5,a6,a5
   11630:	0af12223          	sw	a5,164(sp)
   11634:	01012783          	lw	a5,16(sp)
   11638:	04412703          	lw	a4,68(sp)
   1163c:	00e7c7b3          	xor	a5,a5,a4
   11640:	0af12623          	sw	a5,172(sp)
   11644:	04812783          	lw	a5,72(sp)
   11648:	015a9713          	slli	a4,s5,0x15
   1164c:	00bada93          	srli	s5,s5,0xb
   11650:	00fccdb3          	xor	s11,s9,a5
   11654:	03012783          	lw	a5,48(sp)
   11658:	00f547b3          	xor	a5,a0,a5
   1165c:	08f12c23          	sw	a5,152(sp)
   11660:	03412783          	lw	a5,52(sp)
   11664:	00f5c7b3          	xor	a5,a1,a5
   11668:	08f12e23          	sw	a5,156(sp)
   1166c:	00b2d793          	srli	a5,t0,0xb
   11670:	00e787b3          	add	a5,a5,a4
   11674:	05812703          	lw	a4,88(sp)
   11678:	01529293          	slli	t0,t0,0x15
   1167c:	02f12023          	sw	a5,32(sp)
   11680:	005a87b3          	add	a5,s5,t0
   11684:	02f12223          	sw	a5,36(sp)
   11688:	01c71713          	slli	a4,a4,0x1c
   1168c:	004c5793          	srli	a5,s8,0x4
   11690:	00e787b3          	add	a5,a5,a4
   11694:	02f12823          	sw	a5,48(sp)
   11698:	05812783          	lw	a5,88(sp)
   1169c:	01cc1c13          	slli	s8,s8,0x1c
   116a0:	013b5713          	srli	a4,s6,0x13
   116a4:	0047d793          	srli	a5,a5,0x4
   116a8:	018787b3          	add	a5,a5,s8
   116ac:	02f12a23          	sw	a5,52(sp)
   116b0:	00db1b13          	slli	s6,s6,0xd
   116b4:	00d91793          	slli	a5,s2,0xd
   116b8:	01395913          	srli	s2,s2,0x13
   116bc:	00e78ab3          	add	s5,a5,a4
   116c0:	012b07b3          	add	a5,s6,s2
   116c4:	003bd713          	srli	a4,s7,0x3
   116c8:	04f12423          	sw	a5,72(sp)
   116cc:	01da1793          	slli	a5,s4,0x1d
   116d0:	00e787b3          	add	a5,a5,a4
   116d4:	003a5a13          	srli	s4,s4,0x3
   116d8:	01db9b93          	slli	s7,s7,0x1d
   116dc:	04f12623          	sw	a5,76(sp)
   116e0:	014b87b3          	add	a5,s7,s4
   116e4:	00199713          	slli	a4,s3,0x1
   116e8:	04f12823          	sw	a5,80(sp)
   116ec:	01f4d793          	srli	a5,s1,0x1f
   116f0:	00e787b3          	add	a5,a5,a4
   116f4:	00149493          	slli	s1,s1,0x1
   116f8:	01f9d993          	srli	s3,s3,0x1f
   116fc:	04f12a23          	sw	a5,84(sp)
   11700:	009987b3          	add	a5,s3,s1
   11704:	01445713          	srli	a4,s0,0x14
   11708:	04f12c23          	sw	a5,88(sp)
   1170c:	00c39793          	slli	a5,t2,0xc
   11710:	00e787b3          	add	a5,a5,a4
   11714:	08c12703          	lw	a4,140(sp)
   11718:	0143d393          	srli	t2,t2,0x14
   1171c:	00c41413          	slli	s0,s0,0xc
   11720:	00f12a23          	sw	a5,20(sp)
   11724:	007407b3          	add	a5,s0,t2
   11728:	00f12c23          	sw	a5,24(sp)
   1172c:	01471713          	slli	a4,a4,0x14
   11730:	00cfd793          	srli	a5,t6,0xc
   11734:	00e787b3          	add	a5,a5,a4
   11738:	02f12c23          	sw	a5,56(sp)
   1173c:	08c12783          	lw	a5,140(sp)
   11740:	014f9f93          	slli	t6,t6,0x14
   11744:	00be9713          	slli	a4,t4,0xb
   11748:	00c7d793          	srli	a5,a5,0xc
   1174c:	01f787b3          	add	a5,a5,t6
   11750:	02f12e23          	sw	a5,60(sp)
   11754:	015ede93          	srli	t4,t4,0x15
   11758:	015f5793          	srli	a5,t5,0x15
   1175c:	00bf1f13          	slli	t5,t5,0xb
   11760:	00f70733          	add	a4,a4,a5
   11764:	01df07b3          	add	a5,t5,t4
   11768:	00f12e23          	sw	a5,28(sp)
   1176c:	09012f03          	lw	t5,144(sp)
   11770:	09412783          	lw	a5,148(sp)
   11774:	018d5493          	srli	s1,s10,0x18
   11778:	003f1f13          	slli	t5,t5,0x3
   1177c:	01d7de93          	srli	t4,a5,0x1d
   11780:	01ee8eb3          	add	t4,t4,t5
   11784:	05d12023          	sw	t4,64(sp)
   11788:	09012e83          	lw	t4,144(sp)
   1178c:	00379793          	slli	a5,a5,0x3
   11790:	008d1d13          	slli	s10,s10,0x8
   11794:	01dede93          	srli	t4,t4,0x1d
   11798:	00fe87b3          	add	a5,t4,a5
   1179c:	04f12223          	sw	a5,68(sp)
   117a0:	0d412783          	lw	a5,212(sp)
   117a4:	00edd993          	srli	s3,s11,0xe
   117a8:	012d9d93          	slli	s11,s11,0x12
   117ac:	00fe4eb3          	xor	t4,t3,a5
   117b0:	07812783          	lw	a5,120(sp)
   117b4:	00fe47b3          	xor	a5,t3,a5
   117b8:	0af12c23          	sw	a5,184(sp)
   117bc:	0d812783          	lw	a5,216(sp)
   117c0:	0dc12f83          	lw	t6,220(sp)
   117c4:	09812b03          	lw	s6,152(sp)
   117c8:	00f34e33          	xor	t3,t1,a5
   117cc:	06412783          	lw	a5,100(sp)
   117d0:	006b1b13          	slli	s6,s6,0x6
   117d4:	00f347b3          	xor	a5,t1,a5
   117d8:	0af12e23          	sw	a5,188(sp)
   117dc:	08412783          	lw	a5,132(sp)
   117e0:	00f8c333          	xor	t1,a7,a5
   117e4:	0e412783          	lw	a5,228(sp)
   117e8:	00f8c7b3          	xor	a5,a7,a5
   117ec:	0af12a23          	sw	a5,180(sp)
   117f0:	08812783          	lw	a5,136(sp)
   117f4:	00f84f33          	xor	t5,a6,a5
   117f8:	0e812783          	lw	a5,232(sp)
   117fc:	00f84933          	xor	s2,a6,a5
   11800:	06012783          	lw	a5,96(sp)
   11804:	00f648b3          	xor	a7,a2,a5
   11808:	07012783          	lw	a5,112(sp)
   1180c:	00f64633          	xor	a2,a2,a5
   11810:	05c12783          	lw	a5,92(sp)
   11814:	00f6c833          	xor	a6,a3,a5
   11818:	08012783          	lw	a5,128(sp)
   1181c:	00f6c6b3          	xor	a3,a3,a5
   11820:	01012783          	lw	a5,16(sp)
   11824:	01f7c2b3          	xor	t0,a5,t6
   11828:	0e012783          	lw	a5,224(sp)
   1182c:	00fccfb3          	xor	t6,s9,a5
   11830:	06812783          	lw	a5,104(sp)
   11834:	00f543b3          	xor	t2,a0,a5
   11838:	0cc12783          	lw	a5,204(sp)
   1183c:	00f54533          	xor	a0,a0,a5
   11840:	06c12783          	lw	a5,108(sp)
   11844:	00f5c433          	xor	s0,a1,a5
   11848:	0d012783          	lw	a5,208(sp)
   1184c:	00f5c5b3          	xor	a1,a1,a5
   11850:	0a812783          	lw	a5,168(sp)
   11854:	00879793          	slli	a5,a5,0x8
   11858:	00f487b3          	add	a5,s1,a5
   1185c:	0a812483          	lw	s1,168(sp)
   11860:	0184d493          	srli	s1,s1,0x18
   11864:	01a484b3          	add	s1,s1,s10
   11868:	06912623          	sw	s1,108(sp)
   1186c:	0ac12483          	lw	s1,172(sp)
   11870:	005e5d13          	srli	s10,t3,0x5
   11874:	01be1e13          	slli	t3,t3,0x1b
   11878:	01249493          	slli	s1,s1,0x12
   1187c:	009984b3          	add	s1,s3,s1
   11880:	0ac12983          	lw	s3,172(sp)
   11884:	00e9d993          	srli	s3,s3,0xe
   11888:	01b989b3          	add	s3,s3,s11
   1188c:	07312823          	sw	s3,112(sp)
   11890:	09c12983          	lw	s3,156(sp)
   11894:	01be9d93          	slli	s11,t4,0x1b
   11898:	005ede93          	srli	t4,t4,0x5
   1189c:	01a9da13          	srli	s4,s3,0x1a
   118a0:	016a0a33          	add	s4,s4,s6
   118a4:	05412e23          	sw	s4,92(sp)
   118a8:	09812a03          	lw	s4,152(sp)
   118ac:	00699993          	slli	s3,s3,0x6
   118b0:	0a012b03          	lw	s6,160(sp)
   118b4:	01aa5a13          	srli	s4,s4,0x1a
   118b8:	013a09b3          	add	s3,s4,s3
   118bc:	07312023          	sw	s3,96(sp)
   118c0:	0a412983          	lw	s3,164(sp)
   118c4:	019b1b13          	slli	s6,s6,0x19
   118c8:	01ce8e33          	add	t3,t4,t3
   118cc:	0079da13          	srli	s4,s3,0x7
   118d0:	016a0a33          	add	s4,s4,s6
   118d4:	07412223          	sw	s4,100(sp)
   118d8:	00f39e93          	slli	t4,t2,0xf
   118dc:	07412b03          	lw	s6,116(sp)
   118e0:	07c12a23          	sw	t3,116(sp)
   118e4:	01145e13          	srli	t3,s0,0x11
   118e8:	01de0e33          	add	t3,t3,t4
   118ec:	00f41413          	slli	s0,s0,0xf
   118f0:	0113d393          	srli	t2,t2,0x11
   118f4:	09c12223          	sw	t3,132(sp)
   118f8:	00838e33          	add	t3,t2,s0
   118fc:	0a012a03          	lw	s4,160(sp)
   11900:	00835e93          	srli	t4,t1,0x8
   11904:	09c12423          	sw	t3,136(sp)
   11908:	01831313          	slli	t1,t1,0x18
   1190c:	018f1e13          	slli	t3,t5,0x18
   11910:	008f5f13          	srli	t5,t5,0x8
   11914:	01e30333          	add	t1,t1,t5
   11918:	08612823          	sw	t1,144(sp)
   1191c:	02c12303          	lw	t1,44(sp)
   11920:	007a5a13          	srli	s4,s4,0x7
   11924:	01999993          	slli	s3,s3,0x19
   11928:	013a09b3          	add	s3,s4,s3
   1192c:	01bd0d33          	add	s10,s10,s11
   11930:	07312423          	sw	s3,104(sp)
   11934:	01012983          	lw	s3,16(sp)
   11938:	01a12823          	sw	s10,16(sp)
   1193c:	fff34d13          	not	s10,t1
   11940:	05012303          	lw	t1,80(sp)
   11944:	0c412a03          	lw	s4,196(sp)
   11948:	0169cbb3          	xor	s7,s3,s6
   1194c:	fff34413          	not	s0,t1
   11950:	02012303          	lw	t1,32(sp)
   11954:	0149ca33          	xor	s4,s3,s4
   11958:	07c12b03          	lw	s6,124(sp)
   1195c:	fff34f13          	not	t5,t1
   11960:	04012303          	lw	t1,64(sp)
   11964:	02812c03          	lw	s8,40(sp)
   11968:	0c812983          	lw	s3,200(sp)
   1196c:	01de0e33          	add	t3,t3,t4
   11970:	01c2dd93          	srli	s11,t0,0x1c
   11974:	fff34e93          	not	t4,t1
   11978:	00429293          	slli	t0,t0,0x4
   1197c:	004f9313          	slli	t1,t6,0x4
   11980:	01cfdf93          	srli	t6,t6,0x1c
   11984:	01b30db3          	add	s11,t1,s11
   11988:	01f28333          	add	t1,t0,t6
   1198c:	013cc9b3          	xor	s3,s9,s3
   11990:	016ccb33          	xor	s6,s9,s6
   11994:	00a89f93          	slli	t6,a7,0xa
   11998:	fffc4c93          	not	s9,s8
   1199c:	06612c23          	sw	t1,120(sp)
   119a0:	04c12c03          	lw	s8,76(sp)
   119a4:	01685313          	srli	t1,a6,0x16
   119a8:	0168d893          	srli	a7,a7,0x16
   119ac:	00a81813          	slli	a6,a6,0xa
   119b0:	01088833          	add	a6,a7,a6
   119b4:	03012883          	lw	a7,48(sp)
   119b8:	01f30333          	add	t1,t1,t6
   119bc:	fffc4c13          	not	s8,s8
   119c0:	011c7c33          	and	s8,s8,a7
   119c4:	06612e23          	sw	t1,124(sp)
   119c8:	01e59893          	slli	a7,a1,0x1e
   119cc:	00255313          	srli	t1,a0,0x2
   119d0:	0025d593          	srli	a1,a1,0x2
   119d4:	01e51513          	slli	a0,a0,0x1e
   119d8:	00b505b3          	add	a1,a0,a1
   119dc:	006888b3          	add	a7,a7,t1
   119e0:	08b12c23          	sw	a1,152(sp)
   119e4:	009b1313          	slli	t1,s6,0x9
   119e8:	017bd593          	srli	a1,s7,0x17
   119ec:	00b30333          	add	t1,t1,a1
   119f0:	01e6d513          	srli	a0,a3,0x1e
   119f4:	00261593          	slli	a1,a2,0x2
   119f8:	00269693          	slli	a3,a3,0x2
   119fc:	01e65613          	srli	a2,a2,0x1e
   11a00:	00b505b3          	add	a1,a0,a1
   11a04:	00d606b3          	add	a3,a2,a3
   11a08:	009b9b93          	slli	s7,s7,0x9
   11a0c:	017b5b13          	srli	s6,s6,0x17
   11a10:	0ab12023          	sw	a1,160(sp)
   11a14:	0ad12223          	sw	a3,164(sp)
   11a18:	016b85b3          	add	a1,s7,s6
   11a1c:	02012683          	lw	a3,32(sp)
   11a20:	08b12e23          	sw	a1,156(sp)
   11a24:	03412583          	lw	a1,52(sp)
   11a28:	014cfcb3          	and	s9,s9,s4
   11a2c:	fff74393          	not	t2,a4
   11a30:	00d3f3b3          	and	t2,t2,a3
   11a34:	09c12623          	sw	t3,140(sp)
   11a38:	00dcc6b3          	xor	a3,s9,a3
   11a3c:	09012023          	sw	a6,128(sp)
   11a40:	09112a23          	sw	a7,148(sp)
   11a44:	01412803          	lw	a6,20(sp)
   11a48:	00b47433          	and	s0,s0,a1
   11a4c:	07012583          	lw	a1,112(sp)
   11a50:	0ad12823          	sw	a3,176(sp)
   11a54:	02812683          	lw	a3,40(sp)
   11a58:	fff84813          	not	a6,a6
   11a5c:	ffface13          	not	t3,s5
   11a60:	00df7f33          	and	t5,t5,a3
   11a64:	015efeb3          	and	t4,t4,s5
   11a68:	015c46b3          	xor	a3,s8,s5
   11a6c:	00e87ab3          	and	s5,a6,a4
   11a70:	05412803          	lw	a6,84(sp)
   11a74:	fff4cf93          	not	t6,s1
   11a78:	013d7d33          	and	s10,s10,s3
   11a7c:	010fffb3          	and	t6,t6,a6
   11a80:	08c12803          	lw	a6,140(sp)
   11a84:	0b412503          	lw	a0,180(sp)
   11a88:	00ef4733          	xor	a4,t5,a4
   11a8c:	fff84c93          	not	s9,a6
   11a90:	02412803          	lw	a6,36(sp)
   11a94:	fff5c293          	not	t0,a1
   11a98:	0ae12623          	sw	a4,172(sp)
   11a9c:	010d4833          	xor	a6,s10,a6
   11aa0:	0b012a23          	sw	a6,180(sp)
   11aa4:	04812803          	lw	a6,72(sp)
   11aa8:	00c12703          	lw	a4,12(sp)
   11aac:	0cd12023          	sw	a3,192(sp)
   11ab0:	01044833          	xor	a6,s0,a6
   11ab4:	0d012223          	sw	a6,196(sp)
   11ab8:	05812803          	lw	a6,88(sp)
   11abc:	04c12683          	lw	a3,76(sp)
   11ac0:	00072703          	lw	a4,0(a4)
   11ac4:	0102f2b3          	and	t0,t0,a6
   11ac8:	09012803          	lw	a6,144(sp)
   11acc:	03812403          	lw	s0,56(sp)
   11ad0:	00995593          	srli	a1,s2,0x9
   11ad4:	fff84b93          	not	s7,a6
   11ad8:	01791893          	slli	a7,s2,0x17
   11adc:	01412803          	lw	a6,20(sp)
   11ae0:	00955913          	srli	s2,a0,0x9
   11ae4:	01751513          	slli	a0,a0,0x17
   11ae8:	00b50533          	add	a0,a0,a1
   11aec:	0bc12583          	lw	a1,188(sp)
   11af0:	00de7e33          	and	t3,t3,a3
   11af4:	01474733          	xor	a4,a4,s4
   11af8:	06412683          	lw	a3,100(sp)
   11afc:	0103c833          	xor	a6,t2,a6
   11b00:	008eceb3          	xor	t4,t4,s0
   11b04:	01574733          	xor	a4,a4,s5
   11b08:	0b012423          	sw	a6,168(sp)
   11b0c:	02e12023          	sw	a4,32(sp)
   11b10:	00759813          	slli	a6,a1,0x7
   11b14:	00c12703          	lw	a4,12(sp)
   11b18:	0b812583          	lw	a1,184(sp)
   11b1c:	0bd12c23          	sw	t4,184(sp)
   11b20:	04012e83          	lw	t4,64(sp)
   11b24:	fff6c613          	not	a2,a3
   11b28:	00f67633          	and	a2,a2,a5
   11b2c:	fff7c693          	not	a3,a5
   11b30:	00ffc7b3          	xor	a5,t6,a5
   11b34:	01de4e33          	xor	t3,t3,t4
   11b38:	0cf12423          	sw	a5,200(sp)
   11b3c:	00472e83          	lw	t4,4(a4)
   11b40:	07c12783          	lw	a5,124(sp)
   11b44:	01412703          	lw	a4,20(sp)
   11b48:	fffa4a13          	not	s4,s4
   11b4c:	012888b3          	add	a7,a7,s2
   11b50:	0bc12f03          	lw	t5,188(sp)
   11b54:	00ea7a33          	and	s4,s4,a4
   11b58:	0bc12e23          	sw	t3,188(sp)
   11b5c:	fff7c913          	not	s2,a5
   11b60:	08412783          	lw	a5,132(sp)
   11b64:	04012703          	lw	a4,64(sp)
   11b68:	fff44e13          	not	t3,s0
   11b6c:	05412f83          	lw	t6,84(sp)
   11b70:	00ee7e33          	and	t3,t3,a4
   11b74:	03012703          	lw	a4,48(sp)
   11b78:	0096f6b3          	and	a3,a3,s1
   11b7c:	0195d393          	srli	t2,a1,0x19
   11b80:	fff74713          	not	a4,a4
   11b84:	00877733          	and	a4,a4,s0
   11b88:	ffffc413          	not	s0,t6
   11b8c:	05c12f83          	lw	t6,92(sp)
   11b90:	019f5f13          	srli	t5,t5,0x19
   11b94:	00759593          	slli	a1,a1,0x7
   11b98:	01f47433          	and	s0,s0,t6
   11b9c:	00944433          	xor	s0,s0,s1
   11ba0:	013ecfb3          	xor	t6,t4,s3
   11ba4:	03012e83          	lw	t4,48(sp)
   11ba8:	0c812623          	sw	s0,204(sp)
   11bac:	01812403          	lw	s0,24(sp)
   11bb0:	01c12483          	lw	s1,28(sp)
   11bb4:	01de4e33          	xor	t3,t3,t4
   11bb8:	01e585b3          	add	a1,a1,t5
   11bbc:	03c12823          	sw	t3,48(sp)
   11bc0:	03c12f03          	lw	t5,60(sp)
   11bc4:	01c12e03          	lw	t3,28(sp)
   11bc8:	fff44413          	not	s0,s0
   11bcc:	00947433          	and	s0,s0,s1
   11bd0:	04412483          	lw	s1,68(sp)
   11bd4:	fffe4e93          	not	t4,t3
   11bd8:	ffff4f13          	not	t5,t5
   11bdc:	02412e03          	lw	t3,36(sp)
   11be0:	00780833          	add	a6,a6,t2
   11be4:	009f7f33          	and	t5,t5,s1
   11be8:	02c12383          	lw	t2,44(sp)
   11bec:	01812483          	lw	s1,24(sp)
   11bf0:	01cefeb3          	and	t4,t4,t3
   11bf4:	fffe4e13          	not	t3,t3
   11bf8:	009eceb3          	xor	t4,t4,s1
   11bfc:	007e7e33          	and	t3,t3,t2
   11c00:	04c12383          	lw	t2,76(sp)
   11c04:	03d12223          	sw	t4,36(sp)
   11c08:	01c12e83          	lw	t4,28(sp)
   11c0c:	00774733          	xor	a4,a4,t2
   11c10:	04e12023          	sw	a4,64(sp)
   11c14:	01de4e33          	xor	t3,t3,t4
   11c18:	04412703          	lw	a4,68(sp)
   11c1c:	01c12e23          	sw	t3,28(sp)
   11c20:	03412e03          	lw	t3,52(sp)
   11c24:	fff74393          	not	t2,a4
   11c28:	04812703          	lw	a4,72(sp)
   11c2c:	fffe4e93          	not	t4,t3
   11c30:	03c12e03          	lw	t3,60(sp)
   11c34:	00e3f3b3          	and	t2,t2,a4
   11c38:	05012a83          	lw	s5,80(sp)
   11c3c:	01cefeb3          	and	t4,t4,t3
   11c40:	01c3ce33          	xor	t3,t2,t3
   11c44:	03c12c23          	sw	t3,56(sp)
   11c48:	05812e03          	lw	t3,88(sp)
   11c4c:	06012383          	lw	t2,96(sp)
   11c50:	fff74713          	not	a4,a4
   11c54:	fffe4e13          	not	t3,t3
   11c58:	007e7e33          	and	t3,t3,t2
   11c5c:	04412383          	lw	t2,68(sp)
   11c60:	01577733          	and	a4,a4,s5
   11c64:	008fcfb3          	xor	t6,t6,s0
   11c68:	00774733          	xor	a4,a4,t2
   11c6c:	02e12e23          	sw	a4,60(sp)
   11c70:	02812703          	lw	a4,40(sp)
   11c74:	015eceb3          	xor	t4,t4,s5
   11c78:	fff9c993          	not	s3,s3
   11c7c:	00ea4733          	xor	a4,s4,a4
   11c80:	02e12423          	sw	a4,40(sp)
   11c84:	05c12703          	lw	a4,92(sp)
   11c88:	06412483          	lw	s1,100(sp)
   11c8c:	01f12a23          	sw	t6,20(sp)
   11c90:	06012f83          	lw	t6,96(sp)
   11c94:	fff74393          	not	t2,a4
   11c98:	0093f3b3          	and	t2,t2,s1
   11c9c:	05d12223          	sw	t4,68(sp)
   11ca0:	06c12483          	lw	s1,108(sp)
   11ca4:	06812e83          	lw	t4,104(sp)
   11ca8:	ffffcb13          	not	s6,t6
   11cac:	01812f83          	lw	t6,24(sp)
   11cb0:	0092c2b3          	xor	t0,t0,s1
   11cb4:	01db7b33          	and	s6,s6,t4
   11cb8:	07012e83          	lw	t4,112(sp)
   11cbc:	00e64733          	xor	a4,a2,a4
   11cc0:	01f9f9b3          	and	s3,s3,t6
   11cc4:	06c12603          	lw	a2,108(sp)
   11cc8:	08812f83          	lw	t6,136(sp)
   11ccc:	06512623          	sw	t0,108(sp)
   11cd0:	06412283          	lw	t0,100(sp)
   11cd4:	01de4e33          	xor	t3,t3,t4
   11cd8:	07c12223          	sw	t3,100(sp)
   11cdc:	0056c6b3          	xor	a3,a3,t0
   11ce0:	07812e03          	lw	t3,120(sp)
   11ce4:	ffffc293          	not	t0,t6
   11ce8:	03412f83          	lw	t6,52(sp)
   11cec:	04d12e23          	sw	a3,92(sp)
   11cf0:	05412683          	lw	a3,84(sp)
   11cf4:	01ff4f33          	xor	t5,t5,t6
   11cf8:	fffe4f93          	not	t6,t3
   11cfc:	07412e03          	lw	t3,116(sp)
   11d00:	0c012e83          	lw	t4,192(sp)
   11d04:	03e12a23          	sw	t5,52(sp)
   11d08:	fffe4f13          	not	t5,t3
   11d0c:	0b012e03          	lw	t3,176(sp)
   11d10:	00d3c6b3          	xor	a3,t2,a3
   11d14:	04e12623          	sw	a4,76(sp)
   11d18:	06812703          	lw	a4,104(sp)
   11d1c:	01de4c33          	xor	s8,t3,t4
   11d20:	04d12423          	sw	a3,72(sp)
   11d24:	0a012e83          	lw	t4,160(sp)
   11d28:	01012683          	lw	a3,16(sp)
   11d2c:	fff74713          	not	a4,a4
   11d30:	00977733          	and	a4,a4,s1
   11d34:	fff6c393          	not	t2,a3
   11d38:	0c412483          	lw	s1,196(sp)
   11d3c:	07012683          	lw	a3,112(sp)
   11d40:	fffec413          	not	s0,t4
   11d44:	0b412e83          	lw	t4,180(sp)
   11d48:	fff64613          	not	a2,a2
   11d4c:	01012e03          	lw	t3,16(sp)
   11d50:	009ecab3          	xor	s5,t4,s1
   11d54:	00d67633          	and	a2,a2,a3
   11d58:	08012683          	lw	a3,128(sp)
   11d5c:	07412e83          	lw	t4,116(sp)
   11d60:	0a812483          	lw	s1,168(sp)
   11d64:	01ccfe33          	and	t3,s9,t3
   11d68:	01dbfeb3          	and	t4,s7,t4
   11d6c:	0b812b83          	lw	s7,184(sp)
   11d70:	fff7c793          	not	a5,a5
   11d74:	fffdca13          	not	s4,s11
   11d78:	0174cd33          	xor	s10,s1,s7
   11d7c:	08412483          	lw	s1,132(sp)
   11d80:	07d12823          	sw	t4,112(sp)
   11d84:	fff84b93          	not	s7,a6
   11d88:	009e4e33          	xor	t3,t3,s1
   11d8c:	00997933          	and	s2,s2,s1
   11d90:	09012483          	lw	s1,144(sp)
   11d94:	09c12223          	sw	t3,132(sp)
   11d98:	08c12e03          	lw	t3,140(sp)
   11d9c:	0092f2b3          	and	t0,t0,s1
   11da0:	02c12483          	lw	s1,44(sp)
   11da4:	01c7f7b3          	and	a5,a5,t3
   11da8:	07c12e03          	lw	t3,124(sp)
   11dac:	0099c4b3          	xor	s1,s3,s1
   11db0:	00912c23          	sw	s1,24(sp)
   11db4:	0bc12983          	lw	s3,188(sp)
   11db8:	0ac12483          	lw	s1,172(sp)
   11dbc:	01ca7a33          	and	s4,s4,t3
   11dc0:	06012e03          	lw	t3,96(sp)
   11dc4:	0134c4b3          	xor	s1,s1,s3
   11dc8:	05812983          	lw	s3,88(sp)
   11dcc:	01c74733          	xor	a4,a4,t3
   11dd0:	06812e03          	lw	t3,104(sp)
   11dd4:	013b49b3          	xor	s3,s6,s3
   11dd8:	03312623          	sw	s3,44(sp)
   11ddc:	03812b03          	lw	s6,56(sp)
   11de0:	02412983          	lw	s3,36(sp)
   11de4:	01c64633          	xor	a2,a2,t3
   11de8:	04c12a23          	sw	a2,84(sp)
   11dec:	0169ccb3          	xor	s9,s3,s6
   11df0:	08012983          	lw	s3,128(sp)
   11df4:	08812b03          	lw	s6,136(sp)
   11df8:	08812603          	lw	a2,136(sp)
   11dfc:	013fffb3          	and	t6,t6,s3
   11e00:	07812983          	lw	s3,120(sp)
   11e04:	04e12823          	sw	a4,80(sp)
   11e08:	006bfbb3          	and	s7,s7,t1
   11e0c:	013f7f33          	and	t5,t5,s3
   11e10:	0c812983          	lw	s3,200(sp)
   11e14:	fff34713          	not	a4,t1
   11e18:	fff6c693          	not	a3,a3
   11e1c:	013c4c33          	xor	s8,s8,s3
   11e20:	09412983          	lw	s3,148(sp)
   11e24:	0a412e83          	lw	t4,164(sp)
   11e28:	00c6f6b3          	and	a3,a3,a2
   11e2c:	01347433          	and	s0,s0,s3
   11e30:	06c12983          	lw	s3,108(sp)
   11e34:	00644333          	xor	t1,s0,t1
   11e38:	09412603          	lw	a2,148(sp)
   11e3c:	013acab3          	xor	s5,s5,s3
   11e40:	07012983          	lw	s3,112(sp)
   11e44:	fffece93          	not	t4,t4
   11e48:	01b3f3b3          	and	t2,t2,s11
   11e4c:	0169c9b3          	xor	s3,s3,s6
   11e50:	09312423          	sw	s3,136(sp)
   11e54:	09812983          	lw	s3,152(sp)
   11e58:	03c12403          	lw	s0,60(sp)
   11e5c:	0c612823          	sw	t1,208(sp)
   11e60:	01c12303          	lw	t1,28(sp)
   11e64:	013efeb3          	and	t4,t4,s3
   11e68:	04c12983          	lw	s3,76(sp)
   11e6c:	00834433          	xor	s0,t1,s0
   11e70:	0a012303          	lw	t1,160(sp)
   11e74:	013d4d33          	xor	s10,s10,s3
   11e78:	07c12983          	lw	s3,124(sp)
   11e7c:	00677733          	and	a4,a4,t1
   11e80:	01012303          	lw	t1,16(sp)
   11e84:	0137c7b3          	xor	a5,a5,s3
   11e88:	03412983          	lw	s3,52(sp)
   11e8c:	006a4333          	xor	t1,s4,t1
   11e90:	00612823          	sw	t1,16(sp)
   11e94:	01412303          	lw	t1,20(sp)
   11e98:	01b94933          	xor	s2,s2,s11
   11e9c:	07212023          	sw	s2,96(sp)
   11ea0:	013349b3          	xor	s3,t1,s3
   11ea4:	08c12303          	lw	t1,140(sp)
   11ea8:	fff5c913          	not	s2,a1
   11eac:	06f12823          	sw	a5,112(sp)
   11eb0:	0063c333          	xor	t1,t2,t1
   11eb4:	05c12383          	lw	t2,92(sp)
   11eb8:	09c12783          	lw	a5,156(sp)
   11ebc:	06612e23          	sw	t1,124(sp)
   11ec0:	0074c4b3          	xor	s1,s1,t2
   11ec4:	05012383          	lw	t2,80(sp)
   11ec8:	fff7c793          	not	a5,a5
   11ecc:	fff54313          	not	t1,a0
   11ed0:	007cccb3          	xor	s9,s9,t2
   11ed4:	07812383          	lw	t2,120(sp)
   11ed8:	00b37333          	and	t1,t1,a1
   11edc:	fff8ce13          	not	t3,a7
   11ee0:	0076c6b3          	xor	a3,a3,t2
   11ee4:	08012383          	lw	t2,128(sp)
   11ee8:	06d12423          	sw	a3,104(sp)
   11eec:	09812683          	lw	a3,152(sp)
   11ef0:	0072c2b3          	xor	t0,t0,t2
   11ef4:	06512c23          	sw	t0,120(sp)
   11ef8:	03012383          	lw	t2,48(sp)
   11efc:	02012283          	lw	t0,32(sp)
   11f00:	fff6c693          	not	a3,a3
   11f04:	00a6f6b3          	and	a3,a3,a0
   11f08:	0072ca33          	xor	s4,t0,t2
   11f0c:	09c12283          	lw	t0,156(sp)
   11f10:	0cc12383          	lw	t2,204(sp)
   11f14:	010e7e33          	and	t3,t3,a6
   11f18:	00597933          	and	s2,s2,t0
   11f1c:	04012283          	lw	t0,64(sp)
   11f20:	01074733          	xor	a4,a4,a6
   11f24:	fff64613          	not	a2,a2
   11f28:	0072c3b3          	xor	t2,t0,t2
   11f2c:	0a412283          	lw	t0,164(sp)
   11f30:	01167633          	and	a2,a2,a7
   11f34:	011bcbb3          	xor	s7,s7,a7
   11f38:	0057f7b3          	and	a5,a5,t0
   11f3c:	05412283          	lw	t0,84(sp)
   11f40:	00b7c7b3          	xor	a5,a5,a1
   11f44:	00a94933          	xor	s2,s2,a0
   11f48:	00544433          	xor	s0,s0,t0
   11f4c:	02c12283          	lw	t0,44(sp)
   11f50:	0059c9b3          	xor	s3,s3,t0
   11f54:	07412283          	lw	t0,116(sp)
   11f58:	005fcfb3          	xor	t6,t6,t0
   11f5c:	05f12c23          	sw	t6,88(sp)
   11f60:	04412f83          	lw	t6,68(sp)
   11f64:	06412283          	lw	t0,100(sp)
   11f68:	07812583          	lw	a1,120(sp)
   11f6c:	09412803          	lw	a6,148(sp)
   11f70:	005fc2b3          	xor	t0,t6,t0
   11f74:	09012f83          	lw	t6,144(sp)
   11f78:	00b44433          	xor	s0,s0,a1
   11f7c:	05812583          	lw	a1,88(sp)
   11f80:	01ff4f33          	xor	t5,t5,t6
   11f84:	07e12a23          	sw	t5,116(sp)
   11f88:	04812f03          	lw	t5,72(sp)
   11f8c:	00b9c9b3          	xor	s3,s3,a1
   11f90:	09812583          	lw	a1,152(sp)
   11f94:	01ea4a33          	xor	s4,s4,t5
   11f98:	02812f03          	lw	t5,40(sp)
   11f9c:	00b345b3          	xor	a1,t1,a1
   11fa0:	08b12623          	sw	a1,140(sp)
   11fa4:	0a412583          	lw	a1,164(sp)
   11fa8:	01e3c3b3          	xor	t2,t2,t5
   11fac:	01812f03          	lw	t5,24(sp)
   11fb0:	00b6c6b3          	xor	a3,a3,a1
   11fb4:	01012583          	lw	a1,16(sp)
   11fb8:	01e2c2b3          	xor	t0,t0,t5
   11fbc:	08412f03          	lw	t5,132(sp)
   11fc0:	00ba4a33          	xor	s4,s4,a1
   11fc4:	07c12583          	lw	a1,124(sp)
   11fc8:	01ec4c33          	xor	s8,s8,t5
   11fcc:	08812f03          	lw	t5,136(sp)
   11fd0:	00b3c3b3          	xor	t2,t2,a1
   11fd4:	07412583          	lw	a1,116(sp)
   11fd8:	01eacab3          	xor	s5,s5,t5
   11fdc:	09c12f03          	lw	t5,156(sp)
   11fe0:	00b2c2b3          	xor	t0,t0,a1
   11fe4:	0d012583          	lw	a1,208(sp)
   11fe8:	01eeceb3          	xor	t4,t4,t5
   11fec:	09d12823          	sw	t4,144(sp)
   11ff0:	00bc4c33          	xor	s8,s8,a1
   11ff4:	010e4833          	xor	a6,t3,a6
   11ff8:	09012583          	lw	a1,144(sp)
   11ffc:	09012023          	sw	a6,128(sp)
   12000:	0a012803          	lw	a6,160(sp)
   12004:	00bacab3          	xor	s5,s5,a1
   12008:	08c12583          	lw	a1,140(sp)
   1200c:	01064633          	xor	a2,a2,a6
   12010:	07012803          	lw	a6,112(sp)
   12014:	00b9c9b3          	xor	s3,s3,a1
   12018:	08012583          	lw	a1,128(sp)
   1201c:	06012e83          	lw	t4,96(sp)
   12020:	0104c4b3          	xor	s1,s1,a6
   12024:	06812803          	lw	a6,104(sp)
   12028:	00e4c4b3          	xor	s1,s1,a4
   1202c:	00f44433          	xor	s0,s0,a5
   12030:	00ba4a33          	xor	s4,s4,a1
   12034:	01fadf93          	srli	t6,s5,0x1f
   12038:	001c1593          	slli	a1,s8,0x1
   1203c:	00c3c3b3          	xor	t2,t2,a2
   12040:	00d2c2b3          	xor	t0,t0,a3
   12044:	001a1513          	slli	a0,s4,0x1
   12048:	00199893          	slli	a7,s3,0x1
   1204c:	00141b13          	slli	s6,s0,0x1
   12050:	01dd4d33          	xor	s10,s10,t4
   12054:	010cccb3          	xor	s9,s9,a6
   12058:	00bf8fb3          	add	t6,t6,a1
   1205c:	00149813          	slli	a6,s1,0x1
   12060:	01f9de13          	srli	t3,s3,0x1f
   12064:	01fa5313          	srli	t1,s4,0x1f
   12068:	01f45593          	srli	a1,s0,0x1f
   1206c:	01f4de93          	srli	t4,s1,0x1f
   12070:	017d4d33          	xor	s10,s10,s7
   12074:	012cccb3          	xor	s9,s9,s2
   12078:	00ae0e33          	add	t3,t3,a0
   1207c:	01130333          	add	t1,t1,a7
   12080:	00139513          	slli	a0,t2,0x1
   12084:	01f2d893          	srli	a7,t0,0x1f
   12088:	010585b3          	add	a1,a1,a6
   1208c:	016e8eb3          	add	t4,t4,s6
   12090:	01f3d813          	srli	a6,t2,0x1f
   12094:	00129b13          	slli	s6,t0,0x1
   12098:	001a9d93          	slli	s11,s5,0x1
   1209c:	01fc5f13          	srli	t5,s8,0x1f
   120a0:	00a888b3          	add	a7,a7,a0
   120a4:	01680833          	add	a6,a6,s6
   120a8:	01fcd513          	srli	a0,s9,0x1f
   120ac:	001d1b13          	slli	s6,s10,0x1
   120b0:	01bf0f33          	add	t5,t5,s11
   120b4:	01650533          	add	a0,a0,s6
   120b8:	001c9d93          	slli	s11,s9,0x1
   120bc:	01fd5b13          	srli	s6,s10,0x1f
   120c0:	01bb0b33          	add	s6,s6,s11
   120c4:	005b4b33          	xor	s6,s6,t0
   120c8:	05c12283          	lw	t0,92(sp)
   120cc:	01afcfb3          	xor	t6,t6,s10
   120d0:	01534333          	xor	t1,t1,s5
   120d4:	01f2cab3          	xor	s5,t0,t6
   120d8:	0bc12283          	lw	t0,188(sp)
   120dc:	019f4f33          	xor	t5,t5,s9
   120e0:	01f74733          	xor	a4,a4,t6
   120e4:	01f2cdb3          	xor	s11,t0,t6
   120e8:	0ac12283          	lw	t0,172(sp)
   120ec:	0145c5b3          	xor	a1,a1,s4
   120f0:	01e7c7b3          	xor	a5,a5,t5
   120f4:	01f2c2b3          	xor	t0,t0,t6
   120f8:	08512a23          	sw	t0,148(sp)
   120fc:	07012283          	lw	t0,112(sp)
   12100:	0098c8b3          	xor	a7,a7,s1
   12104:	00754533          	xor	a0,a0,t2
   12108:	01f2ccb3          	xor	s9,t0,t6
   1210c:	05412f83          	lw	t6,84(sp)
   12110:	013eceb3          	xor	t4,t4,s3
   12114:	018e4e33          	xor	t3,t3,s8
   12118:	01efca33          	xor	s4,t6,t5
   1211c:	03c12f83          	lw	t6,60(sp)
   12120:	00884833          	xor	a6,a6,s0
   12124:	01c64633          	xor	a2,a2,t3
   12128:	01efcfb3          	xor	t6,t6,t5
   1212c:	05f12a23          	sw	t6,84(sp)
   12130:	01c12f83          	lw	t6,28(sp)
   12134:	0066c6b3          	xor	a3,a3,t1
   12138:	01efcfb3          	xor	t6,t6,t5
   1213c:	09f12c23          	sw	t6,152(sp)
   12140:	07812f83          	lw	t6,120(sp)
   12144:	01efcfb3          	xor	t6,t6,t5
   12148:	0b812f03          	lw	t5,184(sp)
   1214c:	07f12823          	sw	t6,112(sp)
   12150:	00bf44b3          	xor	s1,t5,a1
   12154:	06012f03          	lw	t5,96(sp)
   12158:	00bf43b3          	xor	t2,t5,a1
   1215c:	0a812f03          	lw	t5,168(sp)
   12160:	00bf4f33          	xor	t5,t5,a1
   12164:	03e12e23          	sw	t5,60(sp)
   12168:	04c12f03          	lw	t5,76(sp)
   1216c:	00bf4f33          	xor	t5,t5,a1
   12170:	07e12023          	sw	t5,96(sp)
   12174:	02412f03          	lw	t5,36(sp)
   12178:	00bbc5b3          	xor	a1,s7,a1
   1217c:	0ab12223          	sw	a1,164(sp)
   12180:	01df42b3          	xor	t0,t5,t4
   12184:	05012f03          	lw	t5,80(sp)
   12188:	03812583          	lw	a1,56(sp)
   1218c:	01df4d33          	xor	s10,t5,t4
   12190:	07c12f03          	lw	t5,124(sp)
   12194:	01d5c433          	xor	s0,a1,t4
   12198:	06812583          	lw	a1,104(sp)
   1219c:	01cf4f33          	xor	t5,t5,t3
   121a0:	05e12623          	sw	t5,76(sp)
   121a4:	02812f03          	lw	t5,40(sp)
   121a8:	01d5c5b3          	xor	a1,a1,t4
   121ac:	01d94eb3          	xor	t4,s2,t4
   121b0:	01cf4c33          	xor	s8,t5,t3
   121b4:	0bd12423          	sw	t4,168(sp)
   121b8:	0cc12f03          	lw	t5,204(sp)
   121bc:	04012e83          	lw	t4,64(sp)
   121c0:	01ceceb3          	xor	t4,t4,t3
   121c4:	01cf4e33          	xor	t3,t5,t3
   121c8:	07412f03          	lw	t5,116(sp)
   121cc:	09c12e23          	sw	t3,156(sp)
   121d0:	04412e03          	lw	t3,68(sp)
   121d4:	006f4f33          	xor	t5,t5,t1
   121d8:	05e12223          	sw	t5,68(sp)
   121dc:	01812f03          	lw	t5,24(sp)
   121e0:	006e4e33          	xor	t3,t3,t1
   121e4:	006f4f33          	xor	t5,t5,t1
   121e8:	05e12823          	sw	t5,80(sp)
   121ec:	06412f03          	lw	t5,100(sp)
   121f0:	006f4333          	xor	t1,t5,t1
   121f4:	0a612023          	sw	t1,160(sp)
   121f8:	08412303          	lw	t1,132(sp)
   121fc:	03412b83          	lw	s7,52(sp)
   12200:	011349b3          	xor	s3,t1,a7
   12204:	0b012303          	lw	t1,176(sp)
   12208:	016bcbb3          	xor	s7,s7,s6
   1220c:	05712e23          	sw	s7,92(sp)
   12210:	01134fb3          	xor	t6,t1,a7
   12214:	0c812303          	lw	t1,200(sp)
   12218:	05812b83          	lw	s7,88(sp)
   1221c:	01134333          	xor	t1,t1,a7
   12220:	02612c23          	sw	t1,56(sp)
   12224:	0d012303          	lw	t1,208(sp)
   12228:	016bcbb3          	xor	s7,s7,s6
   1222c:	01134333          	xor	t1,t1,a7
   12230:	06612223          	sw	t1,100(sp)
   12234:	0c012303          	lw	t1,192(sp)
   12238:	011348b3          	xor	a7,t1,a7
   1223c:	07112a23          	sw	a7,116(sp)
   12240:	08812883          	lw	a7,136(sp)
   12244:	03012303          	lw	t1,48(sp)
   12248:	09712423          	sw	s7,136(sp)
   1224c:	0108c933          	xor	s2,a7,a6
   12250:	0b412883          	lw	a7,180(sp)
   12254:	00a34333          	xor	t1,t1,a0
   12258:	01412b83          	lw	s7,20(sp)
   1225c:	0108cf33          	xor	t5,a7,a6
   12260:	06c12883          	lw	a7,108(sp)
   12264:	0108c8b3          	xor	a7,a7,a6
   12268:	05112023          	sw	a7,64(sp)
   1226c:	09012883          	lw	a7,144(sp)
   12270:	0108c8b3          	xor	a7,a7,a6
   12274:	07112423          	sw	a7,104(sp)
   12278:	0c412883          	lw	a7,196(sp)
   1227c:	0108c833          	xor	a6,a7,a6
   12280:	07012623          	sw	a6,108(sp)
   12284:	04812803          	lw	a6,72(sp)
   12288:	04612423          	sw	t1,72(sp)
   1228c:	01012303          	lw	t1,16(sp)
   12290:	08012883          	lw	a7,128(sp)
   12294:	00a84833          	xor	a6,a6,a0
   12298:	00a34333          	xor	t1,t1,a0
   1229c:	08612823          	sw	t1,144(sp)
   122a0:	02012303          	lw	t1,32(sp)
   122a4:	00a8c8b3          	xor	a7,a7,a0
   122a8:	00a34533          	xor	a0,t1,a0
   122ac:	00a12823          	sw	a0,16(sp)
   122b0:	08c12303          	lw	t1,140(sp)
   122b4:	02c12503          	lw	a0,44(sp)
   122b8:	01634333          	xor	t1,t1,s6
   122bc:	01654533          	xor	a0,a0,s6
   122c0:	016bcb33          	xor	s6,s7,s6
   122c4:	01612a23          	sw	s6,20(sp)
   122c8:	00ba1b93          	slli	s7,s4,0xb
   122cc:	015adb13          	srli	s6,s5,0x15
   122d0:	015a5a13          	srli	s4,s4,0x15
   122d4:	00ba9a93          	slli	s5,s5,0xb
   122d8:	016b8b33          	add	s6,s7,s6
   122dc:	014a8a33          	add	s4,s5,s4
   122e0:	03612023          	sw	s6,32(sp)
   122e4:	01599a93          	slli	s5,s3,0x15
   122e8:	03412223          	sw	s4,36(sp)
   122ec:	00b95a13          	srli	s4,s2,0xb
   122f0:	015a0a33          	add	s4,s4,s5
   122f4:	00b9d993          	srli	s3,s3,0xb
   122f8:	01d79a93          	slli	s5,a5,0x1d
   122fc:	01591913          	slli	s2,s2,0x15
   12300:	0037d793          	srli	a5,a5,0x3
   12304:	01298933          	add	s2,s3,s2
   12308:	08f12023          	sw	a5,128(sp)
   1230c:	03c12783          	lw	a5,60(sp)
   12310:	0144d993          	srli	s3,s1,0x14
   12314:	03212623          	sw	s2,44(sp)
   12318:	00c49493          	slli	s1,s1,0xc
   1231c:	00c41913          	slli	s2,s0,0xc
   12320:	01445413          	srli	s0,s0,0x14
   12324:	00848433          	add	s0,s1,s0
   12328:	00812e23          	sw	s0,28(sp)
   1232c:	01f7d793          	srli	a5,a5,0x1f
   12330:	00c12403          	lw	s0,12(sp)
   12334:	08f12623          	sw	a5,140(sp)
   12338:	05412783          	lw	a5,84(sp)
   1233c:	00842403          	lw	s0,8(s0)
   12340:	01390933          	add	s2,s2,s3
   12344:	01a7d793          	srli	a5,a5,0x1a
   12348:	0af12623          	sw	a5,172(sp)
   1234c:	05412783          	lw	a5,84(sp)
   12350:	0c812223          	sw	s0,196(sp)
   12354:	0126d413          	srli	s0,a3,0x12
   12358:	02812823          	sw	s0,48(sp)
   1235c:	00e61413          	slli	s0,a2,0xe
   12360:	02812a23          	sw	s0,52(sp)
   12364:	00679793          	slli	a5,a5,0x6
   12368:	00c12403          	lw	s0,12(sp)
   1236c:	0af12c23          	sw	a5,184(sp)
   12370:	006d9793          	slli	a5,s11,0x6
   12374:	0af12823          	sw	a5,176(sp)
   12378:	01add793          	srli	a5,s11,0x1a
   1237c:	00c42403          	lw	s0,12(s0)
   12380:	0af12a23          	sw	a5,180(sp)
   12384:	00e35793          	srli	a5,t1,0xe
   12388:	03412d83          	lw	s11,52(sp)
   1238c:	0cf12e23          	sw	a5,220(sp)
   12390:	03012783          	lw	a5,48(sp)
   12394:	0c812423          	sw	s0,200(sp)
   12398:	004f5413          	srli	s0,t5,0x4
   1239c:	01b78db3          	add	s11,a5,s11
   123a0:	00e69693          	slli	a3,a3,0xe
   123a4:	01289793          	slli	a5,a7,0x12
   123a8:	01265613          	srli	a2,a2,0x12
   123ac:	04812c23          	sw	s0,88(sp)
   123b0:	01cf9413          	slli	s0,t6,0x1c
   123b4:	01f2db93          	srli	s7,t0,0x1f
   123b8:	06812c23          	sw	s0,120(sp)
   123bc:	0ef12023          	sw	a5,224(sp)
   123c0:	00ce5413          	srli	s0,t3,0xc
   123c4:	00d607b3          	add	a5,a2,a3
   123c8:	03412423          	sw	s4,40(sp)
   123cc:	01212c23          	sw	s2,24(sp)
   123d0:	06812e23          	sw	s0,124(sp)
   123d4:	09712223          	sw	s7,132(sp)
   123d8:	02f12823          	sw	a5,48(sp)
   123dc:	00129b93          	slli	s7,t0,0x1
   123e0:	03c12283          	lw	t0,60(sp)
   123e4:	04012783          	lw	a5,64(sp)
   123e8:	07812683          	lw	a3,120(sp)
   123ec:	01cf1f13          	slli	t5,t5,0x1c
   123f0:	0077d793          	srli	a5,a5,0x7
   123f4:	0af12e23          	sw	a5,188(sp)
   123f8:	04012783          	lw	a5,64(sp)
   123fc:	004fdf93          	srli	t6,t6,0x4
   12400:	014e9b13          	slli	s6,t4,0x14
   12404:	01979793          	slli	a5,a5,0x19
   12408:	0cf12623          	sw	a5,204(sp)
   1240c:	05812783          	lw	a5,88(sp)
   12410:	014e1e13          	slli	t3,t3,0x14
   12414:	00cede93          	srli	t4,t4,0xc
   12418:	00d787b3          	add	a5,a5,a3
   1241c:	02f12a23          	sw	a5,52(sp)
   12420:	03812783          	lw	a5,56(sp)
   12424:	00375a13          	srli	s4,a4,0x3
   12428:	01d71713          	slli	a4,a4,0x1d
   1242c:	01979693          	slli	a3,a5,0x19
   12430:	0077d793          	srli	a5,a5,0x7
   12434:	0cf12023          	sw	a5,192(sp)
   12438:	01ef87b3          	add	a5,t6,t5
   1243c:	02f12c23          	sw	a5,56(sp)
   12440:	04412783          	lw	a5,68(sp)
   12444:	01d55993          	srli	s3,a0,0x1d
   12448:	00381913          	slli	s2,a6,0x3
   1244c:	0187d793          	srli	a5,a5,0x18
   12450:	0cf12823          	sw	a5,208(sp)
   12454:	04412783          	lw	a5,68(sp)
   12458:	00351513          	slli	a0,a0,0x3
   1245c:	01d85813          	srli	a6,a6,0x1d
   12460:	00879793          	slli	a5,a5,0x8
   12464:	0cf12c23          	sw	a5,216(sp)
   12468:	07c12783          	lw	a5,124(sp)
   1246c:	00d59493          	slli	s1,a1,0xd
   12470:	0133d413          	srli	s0,t2,0x13
   12474:	016787b3          	add	a5,a5,s6
   12478:	02f12e23          	sw	a5,60(sp)
   1247c:	04c12783          	lw	a5,76(sp)
   12480:	0135d593          	srli	a1,a1,0x13
   12484:	00d39393          	slli	t2,t2,0xd
   12488:	00879613          	slli	a2,a5,0x8
   1248c:	0187d793          	srli	a5,a5,0x18
   12490:	0cf12a23          	sw	a5,212(sp)
   12494:	01ce87b3          	add	a5,t4,t3
   12498:	04f12023          	sw	a5,64(sp)
   1249c:	05012783          	lw	a5,80(sp)
   124a0:	00129293          	slli	t0,t0,0x1
   124a4:	011cdf93          	srli	t6,s9,0x11
   124a8:	0057d793          	srli	a5,a5,0x5
   124ac:	0ef12223          	sw	a5,228(sp)
   124b0:	05012783          	lw	a5,80(sp)
   124b4:	01231313          	slli	t1,t1,0x12
   124b8:	00e8d893          	srli	a7,a7,0xe
   124bc:	01b79793          	slli	a5,a5,0x1b
   124c0:	0ef12823          	sw	a5,240(sp)
   124c4:	014a87b3          	add	a5,s5,s4
   124c8:	04f12a23          	sw	a5,84(sp)
   124cc:	01bc1793          	slli	a5,s8,0x1b
   124d0:	0ef12423          	sw	a5,232(sp)
   124d4:	005c5793          	srli	a5,s8,0x5
   124d8:	0ef12623          	sw	a5,236(sp)
   124dc:	08012783          	lw	a5,128(sp)
   124e0:	00f70c33          	add	s8,a4,a5
   124e4:	05c12783          	lw	a5,92(sp)
   124e8:	00479793          	slli	a5,a5,0x4
   124ec:	0ef12a23          	sw	a5,244(sp)
   124f0:	05c12783          	lw	a5,92(sp)
   124f4:	01c7d793          	srli	a5,a5,0x1c
   124f8:	10f12023          	sw	a5,256(sp)
   124fc:	012987b3          	add	a5,s3,s2
   12500:	04f12223          	sw	a5,68(sp)
   12504:	04812783          	lw	a5,72(sp)
   12508:	0b012703          	lw	a4,176(sp)
   1250c:	01c7d793          	srli	a5,a5,0x1c
   12510:	0ef12c23          	sw	a5,248(sp)
   12514:	04812783          	lw	a5,72(sp)
   12518:	00479793          	slli	a5,a5,0x4
   1251c:	0ef12e23          	sw	a5,252(sp)
   12520:	00a807b3          	add	a5,a6,a0
   12524:	04f12423          	sw	a5,72(sp)
   12528:	06812783          	lw	a5,104(sp)
   1252c:	01879793          	slli	a5,a5,0x18
   12530:	10f12623          	sw	a5,268(sp)
   12534:	06812783          	lw	a5,104(sp)
   12538:	0087d793          	srli	a5,a5,0x8
   1253c:	10f12c23          	sw	a5,280(sp)
   12540:	008487b3          	add	a5,s1,s0
   12544:	04f12623          	sw	a5,76(sp)
   12548:	06412783          	lw	a5,100(sp)
   1254c:	0087d793          	srli	a5,a5,0x8
   12550:	10f12823          	sw	a5,272(sp)
   12554:	06412783          	lw	a5,100(sp)
   12558:	01879793          	slli	a5,a5,0x18
   1255c:	10f12a23          	sw	a5,276(sp)
   12560:	00b387b3          	add	a5,t2,a1
   12564:	04f12823          	sw	a5,80(sp)
   12568:	016d5793          	srli	a5,s10,0x16
   1256c:	10f12223          	sw	a5,260(sp)
   12570:	00ad1793          	slli	a5,s10,0xa
   12574:	10f12423          	sw	a5,264(sp)
   12578:	08412783          	lw	a5,132(sp)
   1257c:	0b812583          	lw	a1,184(sp)
   12580:	005787b3          	add	a5,a5,t0
   12584:	04f12c23          	sw	a5,88(sp)
   12588:	06012783          	lw	a5,96(sp)
   1258c:	0167d293          	srli	t0,a5,0x16
   12590:	00a79d13          	slli	s10,a5,0xa
   12594:	08c12783          	lw	a5,140(sp)
   12598:	017787b3          	add	a5,a5,s7
   1259c:	04f12e23          	sw	a5,92(sp)
   125a0:	07012783          	lw	a5,112(sp)
   125a4:	0117da93          	srli	s5,a5,0x11
   125a8:	00f79f13          	slli	t5,a5,0xf
   125ac:	0ac12783          	lw	a5,172(sp)
   125b0:	01ef8f33          	add	t5,t6,t5
   125b4:	00e787b3          	add	a5,a5,a4
   125b8:	0b412703          	lw	a4,180(sp)
   125bc:	06f12023          	sw	a5,96(sp)
   125c0:	00fc9793          	slli	a5,s9,0xf
   125c4:	00b70733          	add	a4,a4,a1
   125c8:	06e12223          	sw	a4,100(sp)
   125cc:	09812703          	lw	a4,152(sp)
   125d0:	0af12623          	sw	a5,172(sp)
   125d4:	01e71c93          	slli	s9,a4,0x1e
   125d8:	00275e13          	srli	t3,a4,0x2
   125dc:	0dc12703          	lw	a4,220(sp)
   125e0:	0e012583          	lw	a1,224(sp)
   125e4:	00b70733          	add	a4,a4,a1
   125e8:	06e12c23          	sw	a4,120(sp)
   125ec:	09412703          	lw	a4,148(sp)
   125f0:	00275713          	srli	a4,a4,0x2
   125f4:	0ae12823          	sw	a4,176(sp)
   125f8:	09412703          	lw	a4,148(sp)
   125fc:	01e71e93          	slli	t4,a4,0x1e
   12600:	00688733          	add	a4,a7,t1
   12604:	06e12e23          	sw	a4,124(sp)
   12608:	06c12703          	lw	a4,108(sp)
   1260c:	01ce8e33          	add	t3,t4,t3
   12610:	fffc4e93          	not	t4,s8
   12614:	01771713          	slli	a4,a4,0x17
   12618:	0ae12a23          	sw	a4,180(sp)
   1261c:	06c12703          	lw	a4,108(sp)
   12620:	00975893          	srli	a7,a4,0x9
   12624:	0bc12703          	lw	a4,188(sp)
   12628:	00d70733          	add	a4,a4,a3
   1262c:	06e12423          	sw	a4,104(sp)
   12630:	07412703          	lw	a4,116(sp)
   12634:	0cc12683          	lw	a3,204(sp)
   12638:	00975b13          	srli	s6,a4,0x9
   1263c:	01771313          	slli	t1,a4,0x17
   12640:	0c012703          	lw	a4,192(sp)
   12644:	011308b3          	add	a7,t1,a7
   12648:	00d70733          	add	a4,a4,a3
   1264c:	06e12623          	sw	a4,108(sp)
   12650:	0a812703          	lw	a4,168(sp)
   12654:	0d812683          	lw	a3,216(sp)
   12658:	01e75a13          	srli	s4,a4,0x1e
   1265c:	00271513          	slli	a0,a4,0x2
   12660:	0d012703          	lw	a4,208(sp)
   12664:	00c70733          	add	a4,a4,a2
   12668:	06e12823          	sw	a4,112(sp)
   1266c:	0a412703          	lw	a4,164(sp)
   12670:	00271993          	slli	s3,a4,0x2
   12674:	01e75813          	srli	a6,a4,0x1e
   12678:	0d412703          	lw	a4,212(sp)
   1267c:	00a80533          	add	a0,a6,a0
   12680:	00d70733          	add	a4,a4,a3
   12684:	06e12a23          	sw	a4,116(sp)
   12688:	0a012703          	lw	a4,160(sp)
   1268c:	0e812683          	lw	a3,232(sp)
   12690:	00771913          	slli	s2,a4,0x7
   12694:	01975613          	srli	a2,a4,0x19
   12698:	0e412703          	lw	a4,228(sp)
   1269c:	00d70733          	add	a4,a4,a3
   126a0:	08e12023          	sw	a4,128(sp)
   126a4:	09c12703          	lw	a4,156(sp)
   126a8:	0f012683          	lw	a3,240(sp)
   126ac:	01975493          	srli	s1,a4,0x19
   126b0:	00771593          	slli	a1,a4,0x7
   126b4:	0ec12703          	lw	a4,236(sp)
   126b8:	00c58633          	add	a2,a1,a2
   126bc:	fffdc593          	not	a1,s11
   126c0:	00d70733          	add	a4,a4,a3
   126c4:	08e12223          	sw	a4,132(sp)
   126c8:	0f412683          	lw	a3,244(sp)
   126cc:	08812703          	lw	a4,136(sp)
   126d0:	0f812383          	lw	t2,248(sp)
   126d4:	10012783          	lw	a5,256(sp)
   126d8:	0fc12b83          	lw	s7,252(sp)
   126dc:	007686b3          	add	a3,a3,t2
   126e0:	08d12423          	sw	a3,136(sp)
   126e4:	00fb8bb3          	add	s7,s7,a5
   126e8:	09712623          	sw	s7,140(sp)
   126ec:	10c12783          	lw	a5,268(sp)
   126f0:	11012b83          	lw	s7,272(sp)
   126f4:	09012683          	lw	a3,144(sp)
   126f8:	00971413          	slli	s0,a4,0x9
   126fc:	017787b3          	add	a5,a5,s7
   12700:	0176d393          	srli	t2,a3,0x17
   12704:	11812b83          	lw	s7,280(sp)
   12708:	00969693          	slli	a3,a3,0x9
   1270c:	08f12c23          	sw	a5,152(sp)
   12710:	01775713          	srli	a4,a4,0x17
   12714:	11412783          	lw	a5,276(sp)
   12718:	00e68733          	add	a4,a3,a4
   1271c:	0ae12c23          	sw	a4,184(sp)
   12720:	02012703          	lw	a4,32(sp)
   12724:	017787b3          	add	a5,a5,s7
   12728:	08f12e23          	sw	a5,156(sp)
   1272c:	10412783          	lw	a5,260(sp)
   12730:	fff74313          	not	t1,a4
   12734:	01812703          	lw	a4,24(sp)
   12738:	01a78d33          	add	s10,a5,s10
   1273c:	0b112423          	sw	a7,168(sp)
   12740:	10812783          	lw	a5,264(sp)
   12744:	013a08b3          	add	a7,s4,s3
   12748:	0b112e23          	sw	a7,188(sp)
   1274c:	fff74893          	not	a7,a4
   12750:	01012703          	lw	a4,16(sp)
   12754:	00f287b3          	add	a5,t0,a5
   12758:	0bc12023          	sw	t3,160(sp)
   1275c:	0ca12023          	sw	a0,192(sp)
   12760:	0b412e03          	lw	t3,180(sp)
   12764:	00990533          	add	a0,s2,s1
   12768:	08f12823          	sw	a5,144(sp)
   1276c:	0ac12783          	lw	a5,172(sp)
   12770:	0aa12623          	sw	a0,172(sp)
   12774:	fff74513          	not	a0,a4
   12778:	02812703          	lw	a4,40(sp)
   1277c:	016e0e33          	add	t3,t3,s6
   12780:	09e12a23          	sw	t5,148(sp)
   12784:	0b012f03          	lw	t5,176(sp)
   12788:	0ac12823          	sw	a2,176(sp)
   1278c:	00740633          	add	a2,s0,t2
   12790:	0bc12223          	sw	t3,164(sp)
   12794:	0ac12a23          	sw	a2,180(sp)
   12798:	fff74813          	not	a6,a4
   1279c:	01c12703          	lw	a4,28(sp)
   127a0:	00fa87b3          	add	a5,s5,a5
   127a4:	01ec8cb3          	add	s9,s9,t5
   127a8:	fff74a13          	not	s4,a4
   127ac:	02412703          	lw	a4,36(sp)
   127b0:	01012e03          	lw	t3,16(sp)
   127b4:	01412b83          	lw	s7,20(sp)
   127b8:	fff74613          	not	a2,a4
   127bc:	01412703          	lw	a4,20(sp)
   127c0:	01c5f5b3          	and	a1,a1,t3
   127c4:	01b87833          	and	a6,a6,s11
   127c8:	fff74693          	not	a3,a4
   127cc:	02c12703          	lw	a4,44(sp)
   127d0:	fff74993          	not	s3,a4
   127d4:	03012703          	lw	a4,48(sp)
   127d8:	fff74493          	not	s1,a4
   127dc:	03412703          	lw	a4,52(sp)
   127e0:	0174f4b3          	and	s1,s1,s7
   127e4:	fff74413          	not	s0,a4
   127e8:	03c12703          	lw	a4,60(sp)
   127ec:	fff74b13          	not	s6,a4
   127f0:	04412703          	lw	a4,68(sp)
   127f4:	fff74a93          	not	s5,a4
   127f8:	05412703          	lw	a4,84(sp)
   127fc:	fff74393          	not	t2,a4
   12800:	04c12703          	lw	a4,76(sp)
   12804:	fff74f93          	not	t6,a4
   12808:	04012703          	lw	a4,64(sp)
   1280c:	fff74913          	not	s2,a4
   12810:	04812703          	lw	a4,72(sp)
   12814:	fff74f13          	not	t5,a4
   12818:	03812703          	lw	a4,56(sp)
   1281c:	fff74293          	not	t0,a4
   12820:	02812703          	lw	a4,40(sp)
   12824:	00e37333          	and	t1,t1,a4
   12828:	02012703          	lw	a4,32(sp)
   1282c:	00e8f8b3          	and	a7,a7,a4
   12830:	0c412703          	lw	a4,196(sp)
   12834:	01c74733          	xor	a4,a4,t3
   12838:	02412e03          	lw	t3,36(sp)
   1283c:	0ce12223          	sw	a4,196(sp)
   12840:	01812703          	lw	a4,24(sp)
   12844:	01ca7a33          	and	s4,s4,t3
   12848:	0c812e03          	lw	t3,200(sp)
   1284c:	00e57533          	and	a0,a0,a4
   12850:	05012703          	lw	a4,80(sp)
   12854:	017e4e33          	xor	t3,t3,s7
   12858:	01c12823          	sw	t3,16(sp)
   1285c:	00c12e03          	lw	t3,12(sp)
   12860:	03c12b83          	lw	s7,60(sp)
   12864:	01b54533          	xor	a0,a0,s11
   12868:	010e0e13          	addi	t3,t3,16
   1286c:	01c12623          	sw	t3,12(sp)
   12870:	02c12e03          	lw	t3,44(sp)
   12874:	01747433          	and	s0,s0,s7
   12878:	04412b83          	lw	s7,68(sp)
   1287c:	01c67633          	and	a2,a2,t3
   12880:	01c12e03          	lw	t3,28(sp)
   12884:	017b7b33          	and	s6,s6,s7
   12888:	fff74713          	not	a4,a4
   1288c:	01c6f6b3          	and	a3,a3,t3
   12890:	03012e03          	lw	t3,48(sp)
   12894:	01877733          	and	a4,a4,s8
   12898:	01c9f9b3          	and	s3,s3,t3
   1289c:	05812e03          	lw	t3,88(sp)
   128a0:	04c12b83          	lw	s7,76(sp)
   128a4:	0ca12a23          	sw	a0,212(sp)
   128a8:	fffe4e13          	not	t3,t3
   128ac:	017afab3          	and	s5,s5,s7
   128b0:	03412b83          	lw	s7,52(sp)
   128b4:	07012503          	lw	a0,112(sp)
   128b8:	0173f3b3          	and	t2,t2,s7
   128bc:	05412b83          	lw	s7,84(sp)
   128c0:	fff54513          	not	a0,a0
   128c4:	017fffb3          	and	t6,t6,s7
   128c8:	04812b83          	lw	s7,72(sp)
   128cc:	01797933          	and	s2,s2,s7
   128d0:	05012b83          	lw	s7,80(sp)
   128d4:	017f7f33          	and	t5,t5,s7
   128d8:	04012b83          	lw	s7,64(sp)
   128dc:	0172f2b3          	and	t0,t0,s7
   128e0:	03812b83          	lw	s7,56(sp)
   128e4:	0182cc33          	xor	s8,t0,s8
   128e8:	017efeb3          	and	t4,t4,s7
   128ec:	06012b83          	lw	s7,96(sp)
   128f0:	017e7e33          	and	t3,t3,s7
   128f4:	01812b83          	lw	s7,24(sp)
   128f8:	01734333          	xor	t1,t1,s7
   128fc:	00612a23          	sw	t1,20(sp)
   12900:	06012303          	lw	t1,96(sp)
   12904:	06812b83          	lw	s7,104(sp)
   12908:	fff34313          	not	t1,t1
   1290c:	01737333          	and	t1,t1,s7
   12910:	0c412b83          	lw	s7,196(sp)
   12914:	011bc8b3          	xor	a7,s7,a7
   12918:	0d112223          	sw	a7,196(sp)
   1291c:	06812883          	lw	a7,104(sp)
   12920:	07012b83          	lw	s7,112(sp)
   12924:	fff8c893          	not	a7,a7
   12928:	0178f8b3          	and	a7,a7,s7
   1292c:	02012b83          	lw	s7,32(sp)
   12930:	01784833          	xor	a6,a6,s7
   12934:	0d012623          	sw	a6,204(sp)
   12938:	07812803          	lw	a6,120(sp)
   1293c:	05812b83          	lw	s7,88(sp)
   12940:	fff84813          	not	a6,a6
   12944:	01787833          	and	a6,a6,s7
   12948:	07812b83          	lw	s7,120(sp)
   1294c:	01757533          	and	a0,a0,s7
   12950:	02812b83          	lw	s7,40(sp)
   12954:	0175c5b3          	xor	a1,a1,s7
   12958:	02b12023          	sw	a1,32(sp)
   1295c:	06412583          	lw	a1,100(sp)
   12960:	06c12b83          	lw	s7,108(sp)
   12964:	fff5c593          	not	a1,a1
   12968:	0175f5b3          	and	a1,a1,s7
   1296c:	01012b83          	lw	s7,16(sp)
   12970:	014bca33          	xor	s4,s7,s4
   12974:	0d412423          	sw	s4,200(sp)
   12978:	06c12a03          	lw	s4,108(sp)
   1297c:	07412b83          	lw	s7,116(sp)
   12980:	fffa4a13          	not	s4,s4
   12984:	017a7a33          	and	s4,s4,s7
   12988:	01c12b83          	lw	s7,28(sp)
   1298c:	01764633          	xor	a2,a2,s7
   12990:	00c12c23          	sw	a2,24(sp)
   12994:	05c12603          	lw	a2,92(sp)
   12998:	06412b83          	lw	s7,100(sp)
   1299c:	fff64613          	not	a2,a2
   129a0:	01767633          	and	a2,a2,s7
   129a4:	03012b83          	lw	s7,48(sp)
   129a8:	0176c6b3          	xor	a3,a3,s7
   129ac:	0cd12c23          	sw	a3,216(sp)
   129b0:	07c12683          	lw	a3,124(sp)
   129b4:	05c12b83          	lw	s7,92(sp)
   129b8:	fff6c693          	not	a3,a3
   129bc:	0176f6b3          	and	a3,a3,s7
   129c0:	02412b83          	lw	s7,36(sp)
   129c4:	0179c9b3          	xor	s3,s3,s7
   129c8:	0d312823          	sw	s3,208(sp)
   129cc:	07412983          	lw	s3,116(sp)
   129d0:	07c12b83          	lw	s7,124(sp)
   129d4:	fff9c993          	not	s3,s3
   129d8:	0179f9b3          	and	s3,s3,s7
   129dc:	01312823          	sw	s3,16(sp)
   129e0:	02c12983          	lw	s3,44(sp)
   129e4:	08812b83          	lw	s7,136(sp)
   129e8:	0134c9b3          	xor	s3,s1,s3
   129ec:	08012483          	lw	s1,128(sp)
   129f0:	fff4c493          	not	s1,s1
   129f4:	0174f4b3          	and	s1,s1,s7
   129f8:	05412b83          	lw	s7,84(sp)
   129fc:	01744433          	xor	s0,s0,s7
   12a00:	03412b83          	lw	s7,52(sp)
   12a04:	02812423          	sw	s0,40(sp)
   12a08:	08812403          	lw	s0,136(sp)
   12a0c:	017b4b33          	xor	s6,s6,s7
   12a10:	03c12b83          	lw	s7,60(sp)
   12a14:	0d612e23          	sw	s6,220(sp)
   12a18:	fffd4b13          	not	s6,s10
   12a1c:	017acab3          	xor	s5,s5,s7
   12a20:	01512e23          	sw	s5,28(sp)
   12a24:	09812a83          	lw	s5,152(sp)
   12a28:	08012b83          	lw	s7,128(sp)
   12a2c:	00fb7b33          	and	s6,s6,a5
   12a30:	fffaca93          	not	s5,s5
   12a34:	017afab3          	and	s5,s5,s7
   12a38:	04c12b83          	lw	s7,76(sp)
   12a3c:	00facab3          	xor	s5,s5,a5
   12a40:	fff44413          	not	s0,s0
   12a44:	0173c3b3          	xor	t2,t2,s7
   12a48:	09812b83          	lw	s7,152(sp)
   12a4c:	0e712223          	sw	t2,228(sp)
   12a50:	fff7c393          	not	t2,a5
   12a54:	0173f3b3          	and	t2,t2,s7
   12a58:	04412b83          	lw	s7,68(sp)
   12a5c:	01a3c7b3          	xor	a5,t2,s10
   12a60:	01a47433          	and	s0,s0,s10
   12a64:	017fcfb3          	xor	t6,t6,s7
   12a68:	03f12823          	sw	t6,48(sp)
   12a6c:	08c12f83          	lw	t6,140(sp)
   12a70:	09012b83          	lw	s7,144(sp)
   12a74:	ffffcf93          	not	t6,t6
   12a78:	017fffb3          	and	t6,t6,s7
   12a7c:	03812b83          	lw	s7,56(sp)
   12a80:	01794933          	xor	s2,s2,s7
   12a84:	0f212023          	sw	s2,224(sp)
   12a88:	09012903          	lw	s2,144(sp)
   12a8c:	09412b83          	lw	s7,148(sp)
   12a90:	09c12283          	lw	t0,156(sp)
   12a94:	fff94913          	not	s2,s2
   12a98:	01797933          	and	s2,s2,s7
   12a9c:	04012b83          	lw	s7,64(sp)
   12aa0:	fff2c293          	not	t0,t0
   12aa4:	017f4f33          	xor	t5,t5,s7
   12aa8:	03e12223          	sw	t5,36(sp)
   12aac:	08412f03          	lw	t5,132(sp)
   12ab0:	08c12b83          	lw	s7,140(sp)
   12ab4:	ffff4f13          	not	t5,t5
   12ab8:	017f7f33          	and	t5,t5,s7
   12abc:	08412b83          	lw	s7,132(sp)
   12ac0:	0172f2b3          	and	t0,t0,s7
   12ac4:	05012b83          	lw	s7,80(sp)
   12ac8:	017eceb3          	xor	t4,t4,s7
   12acc:	0fd12423          	sw	t4,232(sp)
   12ad0:	09412e83          	lw	t4,148(sp)
   12ad4:	09c12b83          	lw	s7,156(sp)
   12ad8:	fffece93          	not	t4,t4
   12adc:	017efeb3          	and	t4,t4,s7
   12ae0:	04812b83          	lw	s7,72(sp)
   12ae4:	01774733          	xor	a4,a4,s7
   12ae8:	0a412b83          	lw	s7,164(sp)
   12aec:	02e12a23          	sw	a4,52(sp)
   12af0:	fffcc713          	not	a4,s9
   12af4:	01777733          	and	a4,a4,s7
   12af8:	07812b83          	lw	s7,120(sp)
   12afc:	04e12223          	sw	a4,68(sp)
   12b00:	017e4e33          	xor	t3,t3,s7
   12b04:	07c12c23          	sw	t3,120(sp)
   12b08:	0a412e03          	lw	t3,164(sp)
   12b0c:	0ac12b83          	lw	s7,172(sp)
   12b10:	fffe4e13          	not	t3,t3
   12b14:	017e7e33          	and	t3,t3,s7
   12b18:	05812b83          	lw	s7,88(sp)
   12b1c:	01734333          	xor	t1,t1,s7
   12b20:	04612623          	sw	t1,76(sp)
   12b24:	0ac12303          	lw	t1,172(sp)
   12b28:	0b412b83          	lw	s7,180(sp)
   12b2c:	fff34313          	not	t1,t1
   12b30:	01737333          	and	t1,t1,s7
   12b34:	06012b83          	lw	s7,96(sp)
   12b38:	0178c8b3          	xor	a7,a7,s7
   12b3c:	07012b83          	lw	s7,112(sp)
   12b40:	07112023          	sw	a7,96(sp)
   12b44:	0bc12883          	lw	a7,188(sp)
   12b48:	01784833          	xor	a6,a6,s7
   12b4c:	05012a23          	sw	a6,84(sp)
   12b50:	0b412803          	lw	a6,180(sp)
   12b54:	0bc12b83          	lw	s7,188(sp)
   12b58:	fff8c893          	not	a7,a7
   12b5c:	fff84813          	not	a6,a6
   12b60:	01787833          	and	a6,a6,s7
   12b64:	06812b83          	lw	s7,104(sp)
   12b68:	0198f8b3          	and	a7,a7,s9
   12b6c:	01754533          	xor	a0,a0,s7
   12b70:	04a12823          	sw	a0,80(sp)
   12b74:	0a812503          	lw	a0,168(sp)
   12b78:	05c12703          	lw	a4,92(sp)
   12b7c:	0b012b83          	lw	s7,176(sp)
   12b80:	fff54513          	not	a0,a0
   12b84:	0b812d83          	lw	s11,184(sp)
   12b88:	01757533          	and	a0,a0,s7
   12b8c:	00e5cbb3          	xor	s7,a1,a4
   12b90:	0b012583          	lw	a1,176(sp)
   12b94:	06f12423          	sw	a5,104(sp)
   12b98:	08412783          	lw	a5,132(sp)
   12b9c:	fff5c593          	not	a1,a1
   12ba0:	01b5f5b3          	and	a1,a1,s11
   12ba4:	06412d83          	lw	s11,100(sp)
   12ba8:	06c12703          	lw	a4,108(sp)
   12bac:	00ffc7b3          	xor	a5,t6,a5
   12bb0:	01ba4a33          	xor	s4,s4,s11
   12bb4:	05412e23          	sw	s4,92(sp)
   12bb8:	0a012a03          	lw	s4,160(sp)
   12bbc:	fffa4d93          	not	s11,s4
   12bc0:	0a812a03          	lw	s4,168(sp)
   12bc4:	014dfdb3          	and	s11,s11,s4
   12bc8:	07c12a03          	lw	s4,124(sp)
   12bcc:	06f12e23          	sw	a5,124(sp)
   12bd0:	08c12783          	lw	a5,140(sp)
   12bd4:	01464633          	xor	a2,a2,s4
   12bd8:	06c12223          	sw	a2,100(sp)
   12bdc:	0c012603          	lw	a2,192(sp)
   12be0:	0a012a03          	lw	s4,160(sp)
   12be4:	00f94933          	xor	s2,s2,a5
   12be8:	fff64613          	not	a2,a2
   12bec:	01467633          	and	a2,a2,s4
   12bf0:	07412a03          	lw	s4,116(sp)
   12bf4:	09c12783          	lw	a5,156(sp)
   12bf8:	0146c6b3          	xor	a3,a3,s4
   12bfc:	02d12c23          	sw	a3,56(sp)
   12c00:	0b812683          	lw	a3,184(sp)
   12c04:	0c012a03          	lw	s4,192(sp)
   12c08:	00ff47b3          	xor	a5,t5,a5
   12c0c:	fff6c693          	not	a3,a3
   12c10:	0146f6b3          	and	a3,a3,s4
   12c14:	01012a03          	lw	s4,16(sp)
   12c18:	04f12023          	sw	a5,64(sp)
   12c1c:	09412783          	lw	a5,148(sp)
   12c20:	00ea4a33          	xor	s4,s4,a4
   12c24:	09812703          	lw	a4,152(sp)
   12c28:	03412623          	sw	s4,44(sp)
   12c2c:	00f2c2b3          	xor	t0,t0,a5
   12c30:	00e4c733          	xor	a4,s1,a4
   12c34:	02e12e23          	sw	a4,60(sp)
   12c38:	08012703          	lw	a4,128(sp)
   12c3c:	00e44733          	xor	a4,s0,a4
   12c40:	06e12a23          	sw	a4,116(sp)
   12c44:	08812703          	lw	a4,136(sp)
   12c48:	09012783          	lw	a5,144(sp)
   12c4c:	00eb4b33          	xor	s6,s6,a4
   12c50:	00fec7b3          	xor	a5,t4,a5
   12c54:	04412703          	lw	a4,68(sp)
   12c58:	06f12623          	sw	a5,108(sp)
   12c5c:	0bc12783          	lw	a5,188(sp)
   12c60:	00f747b3          	xor	a5,a4,a5
   12c64:	019e4733          	xor	a4,t3,s9
   12c68:	04e12223          	sw	a4,68(sp)
   12c6c:	0a412703          	lw	a4,164(sp)
   12c70:	00e34733          	xor	a4,t1,a4
   12c74:	06e12823          	sw	a4,112(sp)
   12c78:	0b412703          	lw	a4,180(sp)
   12c7c:	00e8c733          	xor	a4,a7,a4
   12c80:	08e12223          	sw	a4,132(sp)
   12c84:	0ac12703          	lw	a4,172(sp)
   12c88:	00e84eb3          	xor	t4,a6,a4
   12c8c:	0a012703          	lw	a4,160(sp)
   12c90:	00e54733          	xor	a4,a0,a4
   12c94:	04e12423          	sw	a4,72(sp)
   12c98:	0a812703          	lw	a4,168(sp)
   12c9c:	00e5c733          	xor	a4,a1,a4
   12ca0:	08e12023          	sw	a4,128(sp)
   12ca4:	0c012703          	lw	a4,192(sp)
   12ca8:	00edcdb3          	xor	s11,s11,a4
   12cac:	0b812703          	lw	a4,184(sp)
   12cb0:	00e64733          	xor	a4,a2,a4
   12cb4:	08e12423          	sw	a4,136(sp)
   12cb8:	0b012703          	lw	a4,176(sp)
   12cbc:	00e6ca33          	xor	s4,a3,a4
   12cc0:	00c12683          	lw	a3,12(sp)
   12cc4:	00015737          	lui	a4,0x15
   12cc8:	92070713          	addi	a4,a4,-1760 # 14920 <KeccakF_RoundConstants+0xc0>
   12ccc:	00d70463          	beq	a4,a3,12cd4 <KeccakF1600_StatePermute+0x1b10>
   12cd0:	eb0fe06f          	j	11380 <KeccakF1600_StatePermute+0x1bc>
   12cd4:	11c12503          	lw	a0,284(sp)
   12cd8:	00078713          	mv	a4,a5
   12cdc:	0c412783          	lw	a5,196(sp)
   12ce0:	01352e23          	sw	s3,28(a0)
   12ce4:	04c12d03          	lw	s10,76(sp)
   12ce8:	00f52023          	sw	a5,0(a0)
   12cec:	0c812783          	lw	a5,200(sp)
   12cf0:	05412c83          	lw	s9,84(sp)
   12cf4:	000c0693          	mv	a3,s8
   12cf8:	00f52223          	sw	a5,4(a0)
   12cfc:	01412783          	lw	a5,20(sp)
   12d00:	05012c03          	lw	s8,80(sp)
   12d04:	00f52423          	sw	a5,8(a0)
   12d08:	01812783          	lw	a5,24(sp)
   12d0c:	00f52623          	sw	a5,12(a0)
   12d10:	0cc12783          	lw	a5,204(sp)
   12d14:	00f52823          	sw	a5,16(a0)
   12d18:	0d012783          	lw	a5,208(sp)
   12d1c:	00f52a23          	sw	a5,20(a0)
   12d20:	02012783          	lw	a5,32(sp)
   12d24:	00f52c23          	sw	a5,24(a0)
   12d28:	0d412783          	lw	a5,212(sp)
   12d2c:	02f52023          	sw	a5,32(a0)
   12d30:	0d812783          	lw	a5,216(sp)
   12d34:	02f52223          	sw	a5,36(a0)
   12d38:	0dc12783          	lw	a5,220(sp)
   12d3c:	02f52423          	sw	a5,40(a0)
   12d40:	0e012783          	lw	a5,224(sp)
   12d44:	02f52623          	sw	a5,44(a0)
   12d48:	01c12783          	lw	a5,28(sp)
   12d4c:	02f52823          	sw	a5,48(a0)
   12d50:	02412783          	lw	a5,36(sp)
   12d54:	02f52a23          	sw	a5,52(a0)
   12d58:	03012783          	lw	a5,48(sp)
   12d5c:	02f52c23          	sw	a5,56(a0)
   12d60:	03412783          	lw	a5,52(sp)
   12d64:	05a52823          	sw	s10,80(a0)
   12d68:	05752a23          	sw	s7,84(a0)
   12d6c:	02f52e23          	sw	a5,60(a0)
   12d70:	0e412783          	lw	a5,228(sp)
   12d74:	07852023          	sw	s8,96(a0)
   12d78:	07952423          	sw	s9,104(a0)
   12d7c:	04f52023          	sw	a5,64(a0)
   12d80:	0e812783          	lw	a5,232(sp)
   12d84:	09652023          	sw	s6,128(a0)
   12d88:	09252223          	sw	s2,132(a0)
   12d8c:	04f52223          	sw	a5,68(a0)
   12d90:	02812783          	lw	a5,40(sp)
   12d94:	04d52623          	sw	a3,76(a0)
   12d98:	04f52423          	sw	a5,72(a0)
   12d9c:	06012783          	lw	a5,96(sp)
   12da0:	04f52c23          	sw	a5,88(a0)
   12da4:	05c12783          	lw	a5,92(sp)
   12da8:	04f52e23          	sw	a5,92(a0)
   12dac:	02c12783          	lw	a5,44(sp)
   12db0:	06f52223          	sw	a5,100(a0)
   12db4:	03812783          	lw	a5,56(sp)
   12db8:	06f52623          	sw	a5,108(a0)
   12dbc:	07812783          	lw	a5,120(sp)
   12dc0:	06f52823          	sw	a5,112(a0)
   12dc4:	06412783          	lw	a5,100(sp)
   12dc8:	06f52a23          	sw	a5,116(a0)
   12dcc:	07412783          	lw	a5,116(sp)
   12dd0:	06f52c23          	sw	a5,120(a0)
   12dd4:	07c12783          	lw	a5,124(sp)
   12dd8:	06f52e23          	sw	a5,124(a0)
   12ddc:	06812783          	lw	a5,104(sp)
   12de0:	08f52423          	sw	a5,136(a0)
   12de4:	06c12783          	lw	a5,108(sp)
   12de8:	14c12403          	lw	s0,332(sp)
   12dec:	14812483          	lw	s1,328(sp)
   12df0:	08f52623          	sw	a5,140(a0)
   12df4:	03c12783          	lw	a5,60(sp)
   12df8:	14412903          	lw	s2,324(sp)
   12dfc:	14012983          	lw	s3,320(sp)
   12e00:	08f52c23          	sw	a5,152(a0)
   12e04:	04012783          	lw	a5,64(sp)
   12e08:	13412b03          	lw	s6,308(sp)
   12e0c:	13012b83          	lw	s7,304(sp)
   12e10:	08f52e23          	sw	a5,156(a0)
   12e14:	04412783          	lw	a5,68(sp)
   12e18:	09552823          	sw	s5,144(a0)
   12e1c:	0b452a23          	sw	s4,180(a0)
   12e20:	0af52023          	sw	a5,160(a0)
   12e24:	04812783          	lw	a5,72(sp)
   12e28:	13c12a03          	lw	s4,316(sp)
   12e2c:	13812a83          	lw	s5,312(sp)
   12e30:	0af52223          	sw	a5,164(a0)
   12e34:	07012783          	lw	a5,112(sp)
   12e38:	0db52223          	sw	s11,196(a0)
   12e3c:	08552a23          	sw	t0,148(a0)
   12e40:	0af52423          	sw	a5,168(a0)
   12e44:	08012783          	lw	a5,128(sp)
   12e48:	0bd52823          	sw	t4,176(a0)
   12e4c:	0ce52023          	sw	a4,192(a0)
   12e50:	0af52623          	sw	a5,172(a0)
   12e54:	08412783          	lw	a5,132(sp)
   12e58:	0af52c23          	sw	a5,184(a0)
   12e5c:	08812783          	lw	a5,136(sp)
   12e60:	0af52e23          	sw	a5,188(a0)
   12e64:	12c12c03          	lw	s8,300(sp)
   12e68:	12812c83          	lw	s9,296(sp)
   12e6c:	12412d03          	lw	s10,292(sp)
   12e70:	12012d83          	lw	s11,288(sp)
   12e74:	15010113          	addi	sp,sp,336
   12e78:	00008067          	ret

00012e7c <keccak_squeeze.constprop.1>:
   12e7c:	fd010113          	addi	sp,sp,-48
   12e80:	02812423          	sw	s0,40(sp)
   12e84:	01412c23          	sw	s4,24(sp)
   12e88:	01512a23          	sw	s5,20(sp)
   12e8c:	02112623          	sw	ra,44(sp)
   12e90:	02912223          	sw	s1,36(sp)
   12e94:	0076f713          	andi	a4,a3,7
   12e98:	00068a93          	mv	s5,a3
   12e9c:	00050413          	mv	s0,a0
   12ea0:	00058a13          	mv	s4,a1
   12ea4:	1a070063          	beqz	a4,13044 <keccak_squeeze.constprop.1+0x1c8>
   12ea8:	ff86f693          	andi	a3,a3,-8
   12eac:	00d606b3          	add	a3,a2,a3
   12eb0:	0046a783          	lw	a5,4(a3)
   12eb4:	0006a803          	lw	a6,0(a3)
   12eb8:	0087d513          	srli	a0,a5,0x8
   12ebc:	0107d593          	srli	a1,a5,0x10
   12ec0:	0187d693          	srli	a3,a5,0x18
   12ec4:	00f10623          	sb	a5,12(sp)
   12ec8:	01012423          	sw	a6,8(sp)
   12ecc:	00a106a3          	sb	a0,13(sp)
   12ed0:	00b10723          	sb	a1,14(sp)
   12ed4:	00d107a3          	sb	a3,15(sp)
   12ed8:	320a0e63          	beqz	s4,13214 <keccak_squeeze.constprop.1+0x398>
   12edc:	03212023          	sw	s2,32(sp)
   12ee0:	002707b3          	add	a5,a4,sp
   12ee4:	0087c503          	lbu	a0,8(a5)
   12ee8:	fffa0593          	addi	a1,s4,-1
   12eec:	00a40023          	sb	a0,0(s0)
   12ef0:	34058063          	beqz	a1,13230 <keccak_squeeze.constprop.1+0x3b4>
   12ef4:	ff970513          	addi	a0,a4,-7
   12ef8:	32050c63          	beqz	a0,13230 <keccak_squeeze.constprop.1+0x3b4>
   12efc:	002707b3          	add	a5,a4,sp
   12f00:	0097c503          	lbu	a0,9(a5)
   12f04:	ffea0593          	addi	a1,s4,-2
   12f08:	00a400a3          	sb	a0,1(s0)
   12f0c:	34058c63          	beqz	a1,13264 <keccak_squeeze.constprop.1+0x3e8>
   12f10:	ffa70513          	addi	a0,a4,-6
   12f14:	34050863          	beqz	a0,13264 <keccak_squeeze.constprop.1+0x3e8>
   12f18:	002707b3          	add	a5,a4,sp
   12f1c:	00a7c503          	lbu	a0,10(a5)
   12f20:	ffda0593          	addi	a1,s4,-3
   12f24:	00a40123          	sb	a0,2(s0)
   12f28:	34058663          	beqz	a1,13274 <keccak_squeeze.constprop.1+0x3f8>
   12f2c:	ffb70513          	addi	a0,a4,-5
   12f30:	34050263          	beqz	a0,13274 <keccak_squeeze.constprop.1+0x3f8>
   12f34:	002707b3          	add	a5,a4,sp
   12f38:	00b7c503          	lbu	a0,11(a5)
   12f3c:	ffca0593          	addi	a1,s4,-4
   12f40:	00a401a3          	sb	a0,3(s0)
   12f44:	34058063          	beqz	a1,13284 <keccak_squeeze.constprop.1+0x408>
   12f48:	ffc70513          	addi	a0,a4,-4
   12f4c:	32050c63          	beqz	a0,13284 <keccak_squeeze.constprop.1+0x408>
   12f50:	002707b3          	add	a5,a4,sp
   12f54:	00c7c503          	lbu	a0,12(a5)
   12f58:	ffba0593          	addi	a1,s4,-5
   12f5c:	00a40223          	sb	a0,4(s0)
   12f60:	2e058063          	beqz	a1,13240 <keccak_squeeze.constprop.1+0x3c4>
   12f64:	ffd70513          	addi	a0,a4,-3
   12f68:	2c050c63          	beqz	a0,13240 <keccak_squeeze.constprop.1+0x3c4>
   12f6c:	002707b3          	add	a5,a4,sp
   12f70:	00d7c583          	lbu	a1,13(a5)
   12f74:	ffaa0793          	addi	a5,s4,-6
   12f78:	00b402a3          	sb	a1,5(s0)
   12f7c:	30078c63          	beqz	a5,13294 <keccak_squeeze.constprop.1+0x418>
   12f80:	ffe70713          	addi	a4,a4,-2
   12f84:	30070863          	beqz	a4,13294 <keccak_squeeze.constprop.1+0x418>
   12f88:	00d40323          	sb	a3,6(s0)
   12f8c:	007a8a93          	addi	s5,s5,7
   12f90:	ff9a0a13          	addi	s4,s4,-7
   12f94:	00740413          	addi	s0,s0,7
   12f98:	00060913          	mv	s2,a2
   12f9c:	0a0a8a63          	beqz	s5,13050 <keccak_squeeze.constprop.1+0x1d4>
   12fa0:	08800513          	li	a0,136
   12fa4:	41550533          	sub	a0,a0,s5
   12fa8:	24aa6a63          	bltu	s4,a0,131fc <keccak_squeeze.constprop.1+0x380>
   12fac:	00355793          	srli	a5,a0,0x3
   12fb0:	06078263          	beqz	a5,13014 <keccak_squeeze.constprop.1+0x198>
   12fb4:	00379793          	slli	a5,a5,0x3
   12fb8:	ff8af713          	andi	a4,s5,-8
   12fbc:	008785b3          	add	a1,a5,s0
   12fc0:	00e60733          	add	a4,a2,a4
   12fc4:	00040793          	mv	a5,s0
   12fc8:	00072603          	lw	a2,0(a4)
   12fcc:	00472683          	lw	a3,4(a4)
   12fd0:	00878793          	addi	a5,a5,8
   12fd4:	00865f13          	srli	t5,a2,0x8
   12fd8:	01065e93          	srli	t4,a2,0x10
   12fdc:	01865e13          	srli	t3,a2,0x18
   12fe0:	0086d313          	srli	t1,a3,0x8
   12fe4:	0106d893          	srli	a7,a3,0x10
   12fe8:	0186d813          	srli	a6,a3,0x18
   12fec:	ffe78ca3          	sb	t5,-7(a5)
   12ff0:	fec78c23          	sb	a2,-8(a5)
   12ff4:	fed78e23          	sb	a3,-4(a5)
   12ff8:	ffd78d23          	sb	t4,-6(a5)
   12ffc:	ffc78da3          	sb	t3,-5(a5)
   13000:	fe678ea3          	sb	t1,-3(a5)
   13004:	ff178f23          	sb	a7,-2(a5)
   13008:	ff078fa3          	sb	a6,-1(a5)
   1300c:	00870713          	addi	a4,a4,8
   13010:	faf59ce3          	bne	a1,a5,12fc8 <keccak_squeeze.constprop.1+0x14c>
   13014:	014a8ab3          	add	s5,s5,s4
   13018:	f78a8a13          	addi	s4,s5,-136
   1301c:	08700793          	li	a5,135
   13020:	00a40433          	add	s0,s0,a0
   13024:	00000a93          	li	s5,0
   13028:	0347e863          	bltu	a5,s4,13058 <keccak_squeeze.constprop.1+0x1dc>
   1302c:	220a0663          	beqz	s4,13258 <keccak_squeeze.constprop.1+0x3dc>
   13030:	000a0493          	mv	s1,s4
   13034:	00090513          	mv	a0,s2
   13038:	98cfe0ef          	jal	111c4 <KeccakF1600_StatePermute>
   1303c:	00000a93          	li	s5,0
   13040:	0b80006f          	j	130f8 <keccak_squeeze.constprop.1+0x27c>
   13044:	03212023          	sw	s2,32(sp)
   13048:	00060913          	mv	s2,a2
   1304c:	f40a9ae3          	bnez	s5,12fa0 <keccak_squeeze.constprop.1+0x124>
   13050:	08700793          	li	a5,135
   13054:	1f47fe63          	bgeu	a5,s4,13250 <keccak_squeeze.constprop.1+0x3d4>
   13058:	01612823          	sw	s6,16(sp)
   1305c:	08840b13          	addi	s6,s0,136
   13060:	01312e23          	sw	s3,28(sp)
   13064:	08700493          	li	s1,135
   13068:	000b0993          	mv	s3,s6
   1306c:	00090513          	mv	a0,s2
   13070:	954fe0ef          	jal	111c4 <KeccakF1600_StatePermute>
   13074:	00040793          	mv	a5,s0
   13078:	00090613          	mv	a2,s2
   1307c:	00062683          	lw	a3,0(a2)
   13080:	00462703          	lw	a4,4(a2)
   13084:	00878793          	addi	a5,a5,8
   13088:	0086de93          	srli	t4,a3,0x8
   1308c:	0106de13          	srli	t3,a3,0x10
   13090:	0186d313          	srli	t1,a3,0x18
   13094:	00875893          	srli	a7,a4,0x8
   13098:	01075813          	srli	a6,a4,0x10
   1309c:	01875593          	srli	a1,a4,0x18
   130a0:	ffd78ca3          	sb	t4,-7(a5)
   130a4:	fed78c23          	sb	a3,-8(a5)
   130a8:	fee78e23          	sb	a4,-4(a5)
   130ac:	ffc78d23          	sb	t3,-6(a5)
   130b0:	fe678da3          	sb	t1,-5(a5)
   130b4:	ff178ea3          	sb	a7,-3(a5)
   130b8:	ff078f23          	sb	a6,-2(a5)
   130bc:	feb78fa3          	sb	a1,-1(a5)
   130c0:	00860613          	addi	a2,a2,8
   130c4:	faf99ce3          	bne	s3,a5,1307c <keccak_squeeze.constprop.1+0x200>
   130c8:	f78a0a13          	addi	s4,s4,-136
   130cc:	08898993          	addi	s3,s3,136
   130d0:	000b0413          	mv	s0,s6
   130d4:	0144f663          	bgeu	s1,s4,130e0 <keccak_squeeze.constprop.1+0x264>
   130d8:	088b0b13          	addi	s6,s6,136
   130dc:	f91ff06f          	j	1306c <keccak_squeeze.constprop.1+0x1f0>
   130e0:	000a8493          	mv	s1,s5
   130e4:	0e0a0663          	beqz	s4,131d0 <keccak_squeeze.constprop.1+0x354>
   130e8:	01c12983          	lw	s3,28(sp)
   130ec:	01012b03          	lw	s6,16(sp)
   130f0:	015a04b3          	add	s1,s4,s5
   130f4:	f40a80e3          	beqz	s5,13034 <keccak_squeeze.constprop.1+0x1b8>
   130f8:	003a5513          	srli	a0,s4,0x3
   130fc:	06050663          	beqz	a0,13168 <keccak_squeeze.constprop.1+0x2ec>
   13100:	00351513          	slli	a0,a0,0x3
   13104:	ff8af613          	andi	a2,s5,-8
   13108:	00a40f33          	add	t5,s0,a0
   1310c:	00c90633          	add	a2,s2,a2
   13110:	00040793          	mv	a5,s0
   13114:	00062683          	lw	a3,0(a2)
   13118:	00462703          	lw	a4,4(a2)
   1311c:	00878793          	addi	a5,a5,8
   13120:	0086de93          	srli	t4,a3,0x8
   13124:	0106de13          	srli	t3,a3,0x10
   13128:	0186d313          	srli	t1,a3,0x18
   1312c:	00875893          	srli	a7,a4,0x8
   13130:	01075813          	srli	a6,a4,0x10
   13134:	01875593          	srli	a1,a4,0x18
   13138:	ffd78ca3          	sb	t4,-7(a5)
   1313c:	fed78c23          	sb	a3,-8(a5)
   13140:	fee78e23          	sb	a4,-4(a5)
   13144:	ffc78d23          	sb	t3,-6(a5)
   13148:	fe678da3          	sb	t1,-5(a5)
   1314c:	ff178ea3          	sb	a7,-3(a5)
   13150:	ff078f23          	sb	a6,-2(a5)
   13154:	feb78fa3          	sb	a1,-1(a5)
   13158:	00860613          	addi	a2,a2,8
   1315c:	fbe79ce3          	bne	a5,t5,13114 <keccak_squeeze.constprop.1+0x298>
   13160:	40aa0a33          	sub	s4,s4,a0
   13164:	00aa8ab3          	add	s5,s5,a0
   13168:	ff8afa93          	andi	s5,s5,-8
   1316c:	01590933          	add	s2,s2,s5
   13170:	00492783          	lw	a5,4(s2)
   13174:	00092583          	lw	a1,0(s2)
   13178:	0087d613          	srli	a2,a5,0x8
   1317c:	0107d693          	srli	a3,a5,0x10
   13180:	0187d713          	srli	a4,a5,0x18
   13184:	00f10623          	sb	a5,12(sp)
   13188:	00b12423          	sw	a1,8(sp)
   1318c:	00c106a3          	sb	a2,13(sp)
   13190:	00d10723          	sb	a3,14(sp)
   13194:	00e107a3          	sb	a4,15(sp)
   13198:	080a0863          	beqz	s4,13228 <keccak_squeeze.constprop.1+0x3ac>
   1319c:	000a0613          	mv	a2,s4
   131a0:	00a40533          	add	a0,s0,a0
   131a4:	00810593          	addi	a1,sp,8
   131a8:	190010ef          	jal	14338 <memcpy>
   131ac:	02012903          	lw	s2,32(sp)
   131b0:	02c12083          	lw	ra,44(sp)
   131b4:	02812403          	lw	s0,40(sp)
   131b8:	01812a03          	lw	s4,24(sp)
   131bc:	01412a83          	lw	s5,20(sp)
   131c0:	00048513          	mv	a0,s1
   131c4:	02412483          	lw	s1,36(sp)
   131c8:	03010113          	addi	sp,sp,48
   131cc:	00008067          	ret
   131d0:	02c12083          	lw	ra,44(sp)
   131d4:	02812403          	lw	s0,40(sp)
   131d8:	02012903          	lw	s2,32(sp)
   131dc:	01c12983          	lw	s3,28(sp)
   131e0:	01012b03          	lw	s6,16(sp)
   131e4:	01812a03          	lw	s4,24(sp)
   131e8:	01412a83          	lw	s5,20(sp)
   131ec:	00048513          	mv	a0,s1
   131f0:	02412483          	lw	s1,36(sp)
   131f4:	03010113          	addi	sp,sp,48
   131f8:	00008067          	ret
   131fc:	08700793          	li	a5,135
   13200:	e547ece3          	bltu	a5,s4,13058 <keccak_squeeze.constprop.1+0x1dc>
   13204:	000a8493          	mv	s1,s5
   13208:	020a0063          	beqz	s4,13228 <keccak_squeeze.constprop.1+0x3ac>
   1320c:	014a84b3          	add	s1,s5,s4
   13210:	ee9ff06f          	j	130f8 <keccak_squeeze.constprop.1+0x27c>
   13214:	08800793          	li	a5,136
   13218:	000a8493          	mv	s1,s5
   1321c:	f8fa9ae3          	bne	s5,a5,131b0 <keccak_squeeze.constprop.1+0x334>
   13220:	00000493          	li	s1,0
   13224:	f8dff06f          	j	131b0 <keccak_squeeze.constprop.1+0x334>
   13228:	02012903          	lw	s2,32(sp)
   1322c:	f85ff06f          	j	131b0 <keccak_squeeze.constprop.1+0x334>
   13230:	00140413          	addi	s0,s0,1
   13234:	001a8a93          	addi	s5,s5,1
   13238:	00058a13          	mv	s4,a1
   1323c:	e0dff06f          	j	13048 <keccak_squeeze.constprop.1+0x1cc>
   13240:	00540413          	addi	s0,s0,5
   13244:	005a8a93          	addi	s5,s5,5
   13248:	00058a13          	mv	s4,a1
   1324c:	dfdff06f          	j	13048 <keccak_squeeze.constprop.1+0x1cc>
   13250:	000a0493          	mv	s1,s4
   13254:	de0a10e3          	bnez	s4,13034 <keccak_squeeze.constprop.1+0x1b8>
   13258:	02012903          	lw	s2,32(sp)
   1325c:	00000493          	li	s1,0
   13260:	f51ff06f          	j	131b0 <keccak_squeeze.constprop.1+0x334>
   13264:	00240413          	addi	s0,s0,2
   13268:	002a8a93          	addi	s5,s5,2
   1326c:	00058a13          	mv	s4,a1
   13270:	dd9ff06f          	j	13048 <keccak_squeeze.constprop.1+0x1cc>
   13274:	00340413          	addi	s0,s0,3
   13278:	003a8a93          	addi	s5,s5,3
   1327c:	00058a13          	mv	s4,a1
   13280:	dc9ff06f          	j	13048 <keccak_squeeze.constprop.1+0x1cc>
   13284:	00440413          	addi	s0,s0,4
   13288:	004a8a93          	addi	s5,s5,4
   1328c:	00058a13          	mv	s4,a1
   13290:	db9ff06f          	j	13048 <keccak_squeeze.constprop.1+0x1cc>
   13294:	00640413          	addi	s0,s0,6
   13298:	006a8a93          	addi	s5,s5,6
   1329c:	00078a13          	mv	s4,a5
   132a0:	da9ff06f          	j	13048 <keccak_squeeze.constprop.1+0x1cc>

000132a4 <keccak_absorb.constprop.1>:
   132a4:	fd010113          	addi	sp,sp,-48
   132a8:	02812423          	sw	s0,40(sp)
   132ac:	02912223          	sw	s1,36(sp)
   132b0:	01312e23          	sw	s3,28(sp)
   132b4:	01612823          	sw	s6,16(sp)
   132b8:	02112623          	sw	ra,44(sp)
   132bc:	03212023          	sw	s2,32(sp)
   132c0:	00012423          	sw	zero,8(sp)
   132c4:	00012623          	sw	zero,12(sp)
   132c8:	0075f713          	andi	a4,a1,7
   132cc:	00058493          	mv	s1,a1
   132d0:	00060b13          	mv	s6,a2
   132d4:	00068993          	mv	s3,a3
   132d8:	00050413          	mv	s0,a0
   132dc:	14070a63          	beqz	a4,13430 <keccak_absorb.constprop.1+0x18c>
   132e0:	0c068e63          	beqz	a3,133bc <keccak_absorb.constprop.1+0x118>
   132e4:	00064603          	lbu	a2,0(a2)
   132e8:	002707b3          	add	a5,a4,sp
   132ec:	fff68693          	addi	a3,a3,-1
   132f0:	00c78423          	sb	a2,8(a5)
   132f4:	00170793          	addi	a5,a4,1
   132f8:	40068263          	beqz	a3,136fc <keccak_absorb.constprop.1+0x458>
   132fc:	ff970613          	addi	a2,a4,-7
   13300:	3e060e63          	beqz	a2,136fc <keccak_absorb.constprop.1+0x458>
   13304:	001b4603          	lbu	a2,1(s6)
   13308:	002787b3          	add	a5,a5,sp
   1330c:	ffe98693          	addi	a3,s3,-2
   13310:	00c78423          	sb	a2,8(a5)
   13314:	00270793          	addi	a5,a4,2
   13318:	40068663          	beqz	a3,13724 <keccak_absorb.constprop.1+0x480>
   1331c:	ffa70613          	addi	a2,a4,-6
   13320:	40060263          	beqz	a2,13724 <keccak_absorb.constprop.1+0x480>
   13324:	002b4603          	lbu	a2,2(s6)
   13328:	002787b3          	add	a5,a5,sp
   1332c:	ffd98693          	addi	a3,s3,-3
   13330:	00c78423          	sb	a2,8(a5)
   13334:	00370793          	addi	a5,a4,3
   13338:	40068063          	beqz	a3,13738 <keccak_absorb.constprop.1+0x494>
   1333c:	ffb70613          	addi	a2,a4,-5
   13340:	3e060c63          	beqz	a2,13738 <keccak_absorb.constprop.1+0x494>
   13344:	003b4603          	lbu	a2,3(s6)
   13348:	002787b3          	add	a5,a5,sp
   1334c:	ffc98693          	addi	a3,s3,-4
   13350:	00c78423          	sb	a2,8(a5)
   13354:	00470793          	addi	a5,a4,4
   13358:	3e068a63          	beqz	a3,1374c <keccak_absorb.constprop.1+0x4a8>
   1335c:	ffc70613          	addi	a2,a4,-4
   13360:	3e060663          	beqz	a2,1374c <keccak_absorb.constprop.1+0x4a8>
   13364:	004b4603          	lbu	a2,4(s6)
   13368:	002787b3          	add	a5,a5,sp
   1336c:	ffb98693          	addi	a3,s3,-5
   13370:	00c78423          	sb	a2,8(a5)
   13374:	00570793          	addi	a5,a4,5
   13378:	38068c63          	beqz	a3,13710 <keccak_absorb.constprop.1+0x46c>
   1337c:	ffd70613          	addi	a2,a4,-3
   13380:	38060863          	beqz	a2,13710 <keccak_absorb.constprop.1+0x46c>
   13384:	005b4603          	lbu	a2,5(s6)
   13388:	002787b3          	add	a5,a5,sp
   1338c:	ffa98693          	addi	a3,s3,-6
   13390:	00c78423          	sb	a2,8(a5)
   13394:	00670713          	addi	a4,a4,6
   13398:	3c068463          	beqz	a3,13760 <keccak_absorb.constprop.1+0x4bc>
   1339c:	ff870793          	addi	a5,a4,-8
   133a0:	3c078063          	beqz	a5,13760 <keccak_absorb.constprop.1+0x4bc>
   133a4:	006b4783          	lbu	a5,6(s6)
   133a8:	ff998993          	addi	s3,s3,-7
   133ac:	00758493          	addi	s1,a1,7
   133b0:	00f107a3          	sb	a5,15(sp)
   133b4:	007b0b13          	addi	s6,s6,7
   133b8:	00800713          	li	a4,8
   133bc:	00a14683          	lbu	a3,10(sp)
   133c0:	00d14803          	lbu	a6,13(sp)
   133c4:	00914883          	lbu	a7,9(sp)
   133c8:	40e487b3          	sub	a5,s1,a4
   133cc:	00c14e03          	lbu	t3,12(sp)
   133d0:	00e14503          	lbu	a0,14(sp)
   133d4:	00f14603          	lbu	a2,15(sp)
   133d8:	00814303          	lbu	t1,8(sp)
   133dc:	00b14583          	lbu	a1,11(sp)
   133e0:	ff87f793          	andi	a5,a5,-8
   133e4:	00f407b3          	add	a5,s0,a5
   133e8:	01069713          	slli	a4,a3,0x10
   133ec:	00889893          	slli	a7,a7,0x8
   133f0:	00881693          	slli	a3,a6,0x8
   133f4:	01176733          	or	a4,a4,a7
   133f8:	0047a803          	lw	a6,4(a5)
   133fc:	0007a883          	lw	a7,0(a5)
   13400:	01c6e6b3          	or	a3,a3,t3
   13404:	01051513          	slli	a0,a0,0x10
   13408:	00676733          	or	a4,a4,t1
   1340c:	00d56533          	or	a0,a0,a3
   13410:	01859593          	slli	a1,a1,0x18
   13414:	01861693          	slli	a3,a2,0x18
   13418:	00e5e633          	or	a2,a1,a4
   1341c:	00a6e733          	or	a4,a3,a0
   13420:	00e84733          	xor	a4,a6,a4
   13424:	00c8c6b3          	xor	a3,a7,a2
   13428:	00d7a023          	sw	a3,0(a5)
   1342c:	00e7a223          	sw	a4,4(a5)
   13430:	00048863          	beqz	s1,13440 <keccak_absorb.constprop.1+0x19c>
   13434:	08800313          	li	t1,136
   13438:	40930333          	sub	t1,t1,s1
   1343c:	2069f463          	bgeu	s3,t1,13644 <keccak_absorb.constprop.1+0x3a0>
   13440:	08700913          	li	s2,135
   13444:	0b397c63          	bgeu	s2,s3,134fc <keccak_absorb.constprop.1+0x258>
   13448:	01512a23          	sw	s5,20(sp)
   1344c:	088b0a93          	addi	s5,s6,136
   13450:	01412c23          	sw	s4,24(sp)
   13454:	000a8a13          	mv	s4,s5
   13458:	000b0793          	mv	a5,s6
   1345c:	00040693          	mv	a3,s0
   13460:	0017c703          	lbu	a4,1(a5)
   13464:	0027c883          	lbu	a7,2(a5)
   13468:	0057c803          	lbu	a6,5(a5)
   1346c:	0047ce83          	lbu	t4,4(a5)
   13470:	0067c503          	lbu	a0,6(a5)
   13474:	0007ce03          	lbu	t3,0(a5)
   13478:	0037c583          	lbu	a1,3(a5)
   1347c:	0077c603          	lbu	a2,7(a5)
   13480:	01089893          	slli	a7,a7,0x10
   13484:	00871713          	slli	a4,a4,0x8
   13488:	00881813          	slli	a6,a6,0x8
   1348c:	0006a303          	lw	t1,0(a3)
   13490:	01176733          	or	a4,a4,a7
   13494:	01d86833          	or	a6,a6,t4
   13498:	0046a883          	lw	a7,4(a3)
   1349c:	01051513          	slli	a0,a0,0x10
   134a0:	01c76733          	or	a4,a4,t3
   134a4:	01861613          	slli	a2,a2,0x18
   134a8:	01859593          	slli	a1,a1,0x18
   134ac:	01056533          	or	a0,a0,a6
   134b0:	00e5e5b3          	or	a1,a1,a4
   134b4:	00a66733          	or	a4,a2,a0
   134b8:	00e8c733          	xor	a4,a7,a4
   134bc:	00b34633          	xor	a2,t1,a1
   134c0:	00c6a023          	sw	a2,0(a3)
   134c4:	00e6a223          	sw	a4,4(a3)
   134c8:	00878793          	addi	a5,a5,8
   134cc:	00868693          	addi	a3,a3,8
   134d0:	f94798e3          	bne	a5,s4,13460 <keccak_absorb.constprop.1+0x1bc>
   134d4:	00040513          	mv	a0,s0
   134d8:	f7898993          	addi	s3,s3,-136
   134dc:	000a8b13          	mv	s6,s5
   134e0:	ce5fd0ef          	jal	111c4 <KeccakF1600_StatePermute>
   134e4:	088a0a13          	addi	s4,s4,136
   134e8:	01397663          	bgeu	s2,s3,134f4 <keccak_absorb.constprop.1+0x250>
   134ec:	088a8a93          	addi	s5,s5,136
   134f0:	f69ff06f          	j	13458 <keccak_absorb.constprop.1+0x1b4>
   134f4:	01812a03          	lw	s4,24(sp)
   134f8:	01412a83          	lw	s5,20(sp)
   134fc:	0039d593          	srli	a1,s3,0x3
   13500:	1e058863          	beqz	a1,136f0 <keccak_absorb.constprop.1+0x44c>
   13504:	00359593          	slli	a1,a1,0x3
   13508:	ff84f613          	andi	a2,s1,-8
   1350c:	00bb0e33          	add	t3,s6,a1
   13510:	00c40633          	add	a2,s0,a2
   13514:	000b0713          	mv	a4,s6
   13518:	00174683          	lbu	a3,1(a4)
   1351c:	00274783          	lbu	a5,2(a4)
   13520:	00574303          	lbu	t1,5(a4)
   13524:	00474f83          	lbu	t6,4(a4)
   13528:	00674883          	lbu	a7,6(a4)
   1352c:	00074f03          	lbu	t5,0(a4)
   13530:	00374803          	lbu	a6,3(a4)
   13534:	00774503          	lbu	a0,7(a4)
   13538:	01079793          	slli	a5,a5,0x10
   1353c:	00869693          	slli	a3,a3,0x8
   13540:	00831313          	slli	t1,t1,0x8
   13544:	00062e83          	lw	t4,0(a2)
   13548:	00f6e6b3          	or	a3,a3,a5
   1354c:	01f36333          	or	t1,t1,t6
   13550:	00462783          	lw	a5,4(a2)
   13554:	01089893          	slli	a7,a7,0x10
   13558:	01e6e6b3          	or	a3,a3,t5
   1355c:	01851513          	slli	a0,a0,0x18
   13560:	01881813          	slli	a6,a6,0x18
   13564:	0068e8b3          	or	a7,a7,t1
   13568:	00d86833          	or	a6,a6,a3
   1356c:	011566b3          	or	a3,a0,a7
   13570:	00d7c7b3          	xor	a5,a5,a3
   13574:	010ec533          	xor	a0,t4,a6
   13578:	00a62023          	sw	a0,0(a2)
   1357c:	00f62223          	sw	a5,4(a2)
   13580:	00870713          	addi	a4,a4,8
   13584:	00860613          	addi	a2,a2,8
   13588:	f9c718e3          	bne	a4,t3,13518 <keccak_absorb.constprop.1+0x274>
   1358c:	40b98633          	sub	a2,s3,a1
   13590:	00b48933          	add	s2,s1,a1
   13594:	08060663          	beqz	a2,13620 <keccak_absorb.constprop.1+0x37c>
   13598:	00bb05b3          	add	a1,s6,a1
   1359c:	00810513          	addi	a0,sp,8
   135a0:	00012423          	sw	zero,8(sp)
   135a4:	00012623          	sw	zero,12(sp)
   135a8:	591000ef          	jal	14338 <memcpy>
   135ac:	00a14783          	lbu	a5,10(sp)
   135b0:	00914503          	lbu	a0,9(sp)
   135b4:	00d14583          	lbu	a1,13(sp)
   135b8:	00c14303          	lbu	t1,12(sp)
   135bc:	00e14603          	lbu	a2,14(sp)
   135c0:	ff897913          	andi	s2,s2,-8
   135c4:	00814883          	lbu	a7,8(sp)
   135c8:	00b14683          	lbu	a3,11(sp)
   135cc:	00f14703          	lbu	a4,15(sp)
   135d0:	01240433          	add	s0,s0,s2
   135d4:	00851513          	slli	a0,a0,0x8
   135d8:	01079793          	slli	a5,a5,0x10
   135dc:	00859593          	slli	a1,a1,0x8
   135e0:	00042803          	lw	a6,0(s0)
   135e4:	00a7e7b3          	or	a5,a5,a0
   135e8:	0065e5b3          	or	a1,a1,t1
   135ec:	00442503          	lw	a0,4(s0)
   135f0:	01061613          	slli	a2,a2,0x10
   135f4:	0117e7b3          	or	a5,a5,a7
   135f8:	01871713          	slli	a4,a4,0x18
   135fc:	01869693          	slli	a3,a3,0x18
   13600:	00b66633          	or	a2,a2,a1
   13604:	00f6e6b3          	or	a3,a3,a5
   13608:	00c767b3          	or	a5,a4,a2
   1360c:	00f547b3          	xor	a5,a0,a5
   13610:	00d84733          	xor	a4,a6,a3
   13614:	01348933          	add	s2,s1,s3
   13618:	00e42023          	sw	a4,0(s0)
   1361c:	00f42223          	sw	a5,4(s0)
   13620:	02c12083          	lw	ra,44(sp)
   13624:	02812403          	lw	s0,40(sp)
   13628:	02412483          	lw	s1,36(sp)
   1362c:	01c12983          	lw	s3,28(sp)
   13630:	01012b03          	lw	s6,16(sp)
   13634:	00090513          	mv	a0,s2
   13638:	02012903          	lw	s2,32(sp)
   1363c:	03010113          	addi	sp,sp,48
   13640:	00008067          	ret
   13644:	00335793          	srli	a5,t1,0x3
   13648:	08078663          	beqz	a5,136d4 <keccak_absorb.constprop.1+0x430>
   1364c:	00379793          	slli	a5,a5,0x3
   13650:	ff84f693          	andi	a3,s1,-8
   13654:	01678e33          	add	t3,a5,s6
   13658:	00d406b3          	add	a3,s0,a3
   1365c:	000b0793          	mv	a5,s6
   13660:	0017c703          	lbu	a4,1(a5)
   13664:	0027c883          	lbu	a7,2(a5)
   13668:	0057c803          	lbu	a6,5(a5)
   1366c:	0047cf83          	lbu	t6,4(a5)
   13670:	0067c503          	lbu	a0,6(a5)
   13674:	0007cf03          	lbu	t5,0(a5)
   13678:	0037c583          	lbu	a1,3(a5)
   1367c:	0077c603          	lbu	a2,7(a5)
   13680:	01089893          	slli	a7,a7,0x10
   13684:	00871713          	slli	a4,a4,0x8
   13688:	00881813          	slli	a6,a6,0x8
   1368c:	0006ae83          	lw	t4,0(a3)
   13690:	01176733          	or	a4,a4,a7
   13694:	01f86833          	or	a6,a6,t6
   13698:	0046a883          	lw	a7,4(a3)
   1369c:	01051513          	slli	a0,a0,0x10
   136a0:	01e76733          	or	a4,a4,t5
   136a4:	01861613          	slli	a2,a2,0x18
   136a8:	01859593          	slli	a1,a1,0x18
   136ac:	01056533          	or	a0,a0,a6
   136b0:	00e5e5b3          	or	a1,a1,a4
   136b4:	00a66733          	or	a4,a2,a0
   136b8:	00e8c733          	xor	a4,a7,a4
   136bc:	00bec633          	xor	a2,t4,a1
   136c0:	00c6a023          	sw	a2,0(a3)
   136c4:	00e6a223          	sw	a4,4(a3)
   136c8:	00878793          	addi	a5,a5,8
   136cc:	00868693          	addi	a3,a3,8
   136d0:	f9c798e3          	bne	a5,t3,13660 <keccak_absorb.constprop.1+0x3bc>
   136d4:	013489b3          	add	s3,s1,s3
   136d8:	00040513          	mv	a0,s0
   136dc:	006b0b33          	add	s6,s6,t1
   136e0:	f7898993          	addi	s3,s3,-136
   136e4:	ae1fd0ef          	jal	111c4 <KeccakF1600_StatePermute>
   136e8:	00000493          	li	s1,0
   136ec:	d55ff06f          	j	13440 <keccak_absorb.constprop.1+0x19c>
   136f0:	00048913          	mv	s2,s1
   136f4:	00098613          	mv	a2,s3
   136f8:	e9dff06f          	j	13594 <keccak_absorb.constprop.1+0x2f0>
   136fc:	001b0b13          	addi	s6,s6,1
   13700:	00148493          	addi	s1,s1,1
   13704:	00068993          	mv	s3,a3
   13708:	00078713          	mv	a4,a5
   1370c:	cb1ff06f          	j	133bc <keccak_absorb.constprop.1+0x118>
   13710:	005b0b13          	addi	s6,s6,5
   13714:	00548493          	addi	s1,s1,5
   13718:	00068993          	mv	s3,a3
   1371c:	00078713          	mv	a4,a5
   13720:	c9dff06f          	j	133bc <keccak_absorb.constprop.1+0x118>
   13724:	002b0b13          	addi	s6,s6,2
   13728:	00248493          	addi	s1,s1,2
   1372c:	00068993          	mv	s3,a3
   13730:	00078713          	mv	a4,a5
   13734:	c89ff06f          	j	133bc <keccak_absorb.constprop.1+0x118>
   13738:	003b0b13          	addi	s6,s6,3
   1373c:	00348493          	addi	s1,s1,3
   13740:	00068993          	mv	s3,a3
   13744:	00078713          	mv	a4,a5
   13748:	c75ff06f          	j	133bc <keccak_absorb.constprop.1+0x118>
   1374c:	004b0b13          	addi	s6,s6,4
   13750:	00448493          	addi	s1,s1,4
   13754:	00068993          	mv	s3,a3
   13758:	00078713          	mv	a4,a5
   1375c:	c61ff06f          	j	133bc <keccak_absorb.constprop.1+0x118>
   13760:	006b0b13          	addi	s6,s6,6
   13764:	00648493          	addi	s1,s1,6
   13768:	00068993          	mv	s3,a3
   1376c:	c51ff06f          	j	133bc <keccak_absorb.constprop.1+0x118>

00013770 <keccak_absorb.constprop.2>:
   13770:	fd010113          	addi	sp,sp,-48
   13774:	02812423          	sw	s0,40(sp)
   13778:	02912223          	sw	s1,36(sp)
   1377c:	01312e23          	sw	s3,28(sp)
   13780:	01612823          	sw	s6,16(sp)
   13784:	02112623          	sw	ra,44(sp)
   13788:	03212023          	sw	s2,32(sp)
   1378c:	00012423          	sw	zero,8(sp)
   13790:	00012623          	sw	zero,12(sp)
   13794:	0075f713          	andi	a4,a1,7
   13798:	00058493          	mv	s1,a1
   1379c:	00060b13          	mv	s6,a2
   137a0:	00068993          	mv	s3,a3
   137a4:	00050413          	mv	s0,a0
   137a8:	14070a63          	beqz	a4,138fc <keccak_absorb.constprop.2+0x18c>
   137ac:	0c068e63          	beqz	a3,13888 <keccak_absorb.constprop.2+0x118>
   137b0:	00064603          	lbu	a2,0(a2)
   137b4:	002707b3          	add	a5,a4,sp
   137b8:	fff68693          	addi	a3,a3,-1
   137bc:	00c78423          	sb	a2,8(a5)
   137c0:	00170793          	addi	a5,a4,1
   137c4:	40068263          	beqz	a3,13bc8 <keccak_absorb.constprop.2+0x458>
   137c8:	ff970613          	addi	a2,a4,-7
   137cc:	3e060e63          	beqz	a2,13bc8 <keccak_absorb.constprop.2+0x458>
   137d0:	001b4603          	lbu	a2,1(s6)
   137d4:	002787b3          	add	a5,a5,sp
   137d8:	ffe98693          	addi	a3,s3,-2
   137dc:	00c78423          	sb	a2,8(a5)
   137e0:	00270793          	addi	a5,a4,2
   137e4:	40068663          	beqz	a3,13bf0 <keccak_absorb.constprop.2+0x480>
   137e8:	ffa70613          	addi	a2,a4,-6
   137ec:	40060263          	beqz	a2,13bf0 <keccak_absorb.constprop.2+0x480>
   137f0:	002b4603          	lbu	a2,2(s6)
   137f4:	002787b3          	add	a5,a5,sp
   137f8:	ffd98693          	addi	a3,s3,-3
   137fc:	00c78423          	sb	a2,8(a5)
   13800:	00370793          	addi	a5,a4,3
   13804:	40068063          	beqz	a3,13c04 <keccak_absorb.constprop.2+0x494>
   13808:	ffb70613          	addi	a2,a4,-5
   1380c:	3e060c63          	beqz	a2,13c04 <keccak_absorb.constprop.2+0x494>
   13810:	003b4603          	lbu	a2,3(s6)
   13814:	002787b3          	add	a5,a5,sp
   13818:	ffc98693          	addi	a3,s3,-4
   1381c:	00c78423          	sb	a2,8(a5)
   13820:	00470793          	addi	a5,a4,4
   13824:	3e068a63          	beqz	a3,13c18 <keccak_absorb.constprop.2+0x4a8>
   13828:	ffc70613          	addi	a2,a4,-4
   1382c:	3e060663          	beqz	a2,13c18 <keccak_absorb.constprop.2+0x4a8>
   13830:	004b4603          	lbu	a2,4(s6)
   13834:	002787b3          	add	a5,a5,sp
   13838:	ffb98693          	addi	a3,s3,-5
   1383c:	00c78423          	sb	a2,8(a5)
   13840:	00570793          	addi	a5,a4,5
   13844:	38068c63          	beqz	a3,13bdc <keccak_absorb.constprop.2+0x46c>
   13848:	ffd70613          	addi	a2,a4,-3
   1384c:	38060863          	beqz	a2,13bdc <keccak_absorb.constprop.2+0x46c>
   13850:	005b4603          	lbu	a2,5(s6)
   13854:	002787b3          	add	a5,a5,sp
   13858:	ffa98693          	addi	a3,s3,-6
   1385c:	00c78423          	sb	a2,8(a5)
   13860:	00670713          	addi	a4,a4,6
   13864:	3c068463          	beqz	a3,13c2c <keccak_absorb.constprop.2+0x4bc>
   13868:	ff870793          	addi	a5,a4,-8
   1386c:	3c078063          	beqz	a5,13c2c <keccak_absorb.constprop.2+0x4bc>
   13870:	006b4783          	lbu	a5,6(s6)
   13874:	ff998993          	addi	s3,s3,-7
   13878:	00758493          	addi	s1,a1,7
   1387c:	00f107a3          	sb	a5,15(sp)
   13880:	007b0b13          	addi	s6,s6,7
   13884:	00800713          	li	a4,8
   13888:	00a14683          	lbu	a3,10(sp)
   1388c:	00d14803          	lbu	a6,13(sp)
   13890:	00914883          	lbu	a7,9(sp)
   13894:	40e487b3          	sub	a5,s1,a4
   13898:	00c14e03          	lbu	t3,12(sp)
   1389c:	00e14503          	lbu	a0,14(sp)
   138a0:	00f14603          	lbu	a2,15(sp)
   138a4:	00814303          	lbu	t1,8(sp)
   138a8:	00b14583          	lbu	a1,11(sp)
   138ac:	ff87f793          	andi	a5,a5,-8
   138b0:	00f407b3          	add	a5,s0,a5
   138b4:	01069713          	slli	a4,a3,0x10
   138b8:	00889893          	slli	a7,a7,0x8
   138bc:	00881693          	slli	a3,a6,0x8
   138c0:	01176733          	or	a4,a4,a7
   138c4:	0047a803          	lw	a6,4(a5)
   138c8:	0007a883          	lw	a7,0(a5)
   138cc:	01c6e6b3          	or	a3,a3,t3
   138d0:	01051513          	slli	a0,a0,0x10
   138d4:	00676733          	or	a4,a4,t1
   138d8:	00d56533          	or	a0,a0,a3
   138dc:	01859593          	slli	a1,a1,0x18
   138e0:	01861693          	slli	a3,a2,0x18
   138e4:	00e5e633          	or	a2,a1,a4
   138e8:	00a6e733          	or	a4,a3,a0
   138ec:	00e84733          	xor	a4,a6,a4
   138f0:	00c8c6b3          	xor	a3,a7,a2
   138f4:	00d7a023          	sw	a3,0(a5)
   138f8:	00e7a223          	sw	a4,4(a5)
   138fc:	00048863          	beqz	s1,1390c <keccak_absorb.constprop.2+0x19c>
   13900:	0a800313          	li	t1,168
   13904:	40930333          	sub	t1,t1,s1
   13908:	2069f463          	bgeu	s3,t1,13b10 <keccak_absorb.constprop.2+0x3a0>
   1390c:	0a700913          	li	s2,167
   13910:	0b397c63          	bgeu	s2,s3,139c8 <keccak_absorb.constprop.2+0x258>
   13914:	01512a23          	sw	s5,20(sp)
   13918:	0a8b0a93          	addi	s5,s6,168
   1391c:	01412c23          	sw	s4,24(sp)
   13920:	000a8a13          	mv	s4,s5
   13924:	000b0793          	mv	a5,s6
   13928:	00040693          	mv	a3,s0
   1392c:	0017c703          	lbu	a4,1(a5)
   13930:	0027c883          	lbu	a7,2(a5)
   13934:	0057c803          	lbu	a6,5(a5)
   13938:	0047ce83          	lbu	t4,4(a5)
   1393c:	0067c503          	lbu	a0,6(a5)
   13940:	0007ce03          	lbu	t3,0(a5)
   13944:	0037c583          	lbu	a1,3(a5)
   13948:	0077c603          	lbu	a2,7(a5)
   1394c:	01089893          	slli	a7,a7,0x10
   13950:	00871713          	slli	a4,a4,0x8
   13954:	00881813          	slli	a6,a6,0x8
   13958:	0006a303          	lw	t1,0(a3)
   1395c:	01176733          	or	a4,a4,a7
   13960:	01d86833          	or	a6,a6,t4
   13964:	0046a883          	lw	a7,4(a3)
   13968:	01051513          	slli	a0,a0,0x10
   1396c:	01c76733          	or	a4,a4,t3
   13970:	01861613          	slli	a2,a2,0x18
   13974:	01859593          	slli	a1,a1,0x18
   13978:	01056533          	or	a0,a0,a6
   1397c:	00e5e5b3          	or	a1,a1,a4
   13980:	00a66733          	or	a4,a2,a0
   13984:	00e8c733          	xor	a4,a7,a4
   13988:	00b34633          	xor	a2,t1,a1
   1398c:	00c6a023          	sw	a2,0(a3)
   13990:	00e6a223          	sw	a4,4(a3)
   13994:	00878793          	addi	a5,a5,8
   13998:	00868693          	addi	a3,a3,8
   1399c:	f94798e3          	bne	a5,s4,1392c <keccak_absorb.constprop.2+0x1bc>
   139a0:	00040513          	mv	a0,s0
   139a4:	f5898993          	addi	s3,s3,-168
   139a8:	000a8b13          	mv	s6,s5
   139ac:	819fd0ef          	jal	111c4 <KeccakF1600_StatePermute>
   139b0:	0a8a0a13          	addi	s4,s4,168
   139b4:	01397663          	bgeu	s2,s3,139c0 <keccak_absorb.constprop.2+0x250>
   139b8:	0a8a8a93          	addi	s5,s5,168
   139bc:	f69ff06f          	j	13924 <keccak_absorb.constprop.2+0x1b4>
   139c0:	01812a03          	lw	s4,24(sp)
   139c4:	01412a83          	lw	s5,20(sp)
   139c8:	0039d593          	srli	a1,s3,0x3
   139cc:	1e058863          	beqz	a1,13bbc <keccak_absorb.constprop.2+0x44c>
   139d0:	00359593          	slli	a1,a1,0x3
   139d4:	ff84f613          	andi	a2,s1,-8
   139d8:	00bb0e33          	add	t3,s6,a1
   139dc:	00c40633          	add	a2,s0,a2
   139e0:	000b0713          	mv	a4,s6
   139e4:	00174683          	lbu	a3,1(a4)
   139e8:	00274783          	lbu	a5,2(a4)
   139ec:	00574303          	lbu	t1,5(a4)
   139f0:	00474f83          	lbu	t6,4(a4)
   139f4:	00674883          	lbu	a7,6(a4)
   139f8:	00074f03          	lbu	t5,0(a4)
   139fc:	00374803          	lbu	a6,3(a4)
   13a00:	00774503          	lbu	a0,7(a4)
   13a04:	01079793          	slli	a5,a5,0x10
   13a08:	00869693          	slli	a3,a3,0x8
   13a0c:	00831313          	slli	t1,t1,0x8
   13a10:	00062e83          	lw	t4,0(a2)
   13a14:	00f6e6b3          	or	a3,a3,a5
   13a18:	01f36333          	or	t1,t1,t6
   13a1c:	00462783          	lw	a5,4(a2)
   13a20:	01089893          	slli	a7,a7,0x10
   13a24:	01e6e6b3          	or	a3,a3,t5
   13a28:	01851513          	slli	a0,a0,0x18
   13a2c:	01881813          	slli	a6,a6,0x18
   13a30:	0068e8b3          	or	a7,a7,t1
   13a34:	00d86833          	or	a6,a6,a3
   13a38:	011566b3          	or	a3,a0,a7
   13a3c:	00d7c7b3          	xor	a5,a5,a3
   13a40:	010ec533          	xor	a0,t4,a6
   13a44:	00a62023          	sw	a0,0(a2)
   13a48:	00f62223          	sw	a5,4(a2)
   13a4c:	00870713          	addi	a4,a4,8
   13a50:	00860613          	addi	a2,a2,8
   13a54:	f9c718e3          	bne	a4,t3,139e4 <keccak_absorb.constprop.2+0x274>
   13a58:	40b98633          	sub	a2,s3,a1
   13a5c:	00b48933          	add	s2,s1,a1
   13a60:	08060663          	beqz	a2,13aec <keccak_absorb.constprop.2+0x37c>
   13a64:	00bb05b3          	add	a1,s6,a1
   13a68:	00810513          	addi	a0,sp,8
   13a6c:	00012423          	sw	zero,8(sp)
   13a70:	00012623          	sw	zero,12(sp)
   13a74:	0c5000ef          	jal	14338 <memcpy>
   13a78:	00a14783          	lbu	a5,10(sp)
   13a7c:	00914503          	lbu	a0,9(sp)
   13a80:	00d14583          	lbu	a1,13(sp)
   13a84:	00c14303          	lbu	t1,12(sp)
   13a88:	00e14603          	lbu	a2,14(sp)
   13a8c:	ff897913          	andi	s2,s2,-8
   13a90:	00814883          	lbu	a7,8(sp)
   13a94:	00b14683          	lbu	a3,11(sp)
   13a98:	00f14703          	lbu	a4,15(sp)
   13a9c:	01240433          	add	s0,s0,s2
   13aa0:	00851513          	slli	a0,a0,0x8
   13aa4:	01079793          	slli	a5,a5,0x10
   13aa8:	00859593          	slli	a1,a1,0x8
   13aac:	00042803          	lw	a6,0(s0)
   13ab0:	00a7e7b3          	or	a5,a5,a0
   13ab4:	0065e5b3          	or	a1,a1,t1
   13ab8:	00442503          	lw	a0,4(s0)
   13abc:	01061613          	slli	a2,a2,0x10
   13ac0:	0117e7b3          	or	a5,a5,a7
   13ac4:	01871713          	slli	a4,a4,0x18
   13ac8:	01869693          	slli	a3,a3,0x18
   13acc:	00b66633          	or	a2,a2,a1
   13ad0:	00f6e6b3          	or	a3,a3,a5
   13ad4:	00c767b3          	or	a5,a4,a2
   13ad8:	00f547b3          	xor	a5,a0,a5
   13adc:	00d84733          	xor	a4,a6,a3
   13ae0:	01348933          	add	s2,s1,s3
   13ae4:	00e42023          	sw	a4,0(s0)
   13ae8:	00f42223          	sw	a5,4(s0)
   13aec:	02c12083          	lw	ra,44(sp)
   13af0:	02812403          	lw	s0,40(sp)
   13af4:	02412483          	lw	s1,36(sp)
   13af8:	01c12983          	lw	s3,28(sp)
   13afc:	01012b03          	lw	s6,16(sp)
   13b00:	00090513          	mv	a0,s2
   13b04:	02012903          	lw	s2,32(sp)
   13b08:	03010113          	addi	sp,sp,48
   13b0c:	00008067          	ret
   13b10:	00335793          	srli	a5,t1,0x3
   13b14:	08078663          	beqz	a5,13ba0 <keccak_absorb.constprop.2+0x430>
   13b18:	00379793          	slli	a5,a5,0x3
   13b1c:	ff84f693          	andi	a3,s1,-8
   13b20:	01678e33          	add	t3,a5,s6
   13b24:	00d406b3          	add	a3,s0,a3
   13b28:	000b0793          	mv	a5,s6
   13b2c:	0017c703          	lbu	a4,1(a5)
   13b30:	0027c883          	lbu	a7,2(a5)
   13b34:	0057c803          	lbu	a6,5(a5)
   13b38:	0047cf83          	lbu	t6,4(a5)
   13b3c:	0067c503          	lbu	a0,6(a5)
   13b40:	0007cf03          	lbu	t5,0(a5)
   13b44:	0037c583          	lbu	a1,3(a5)
   13b48:	0077c603          	lbu	a2,7(a5)
   13b4c:	01089893          	slli	a7,a7,0x10
   13b50:	00871713          	slli	a4,a4,0x8
   13b54:	00881813          	slli	a6,a6,0x8
   13b58:	0006ae83          	lw	t4,0(a3)
   13b5c:	01176733          	or	a4,a4,a7
   13b60:	01f86833          	or	a6,a6,t6
   13b64:	0046a883          	lw	a7,4(a3)
   13b68:	01051513          	slli	a0,a0,0x10
   13b6c:	01e76733          	or	a4,a4,t5
   13b70:	01861613          	slli	a2,a2,0x18
   13b74:	01859593          	slli	a1,a1,0x18
   13b78:	01056533          	or	a0,a0,a6
   13b7c:	00e5e5b3          	or	a1,a1,a4
   13b80:	00a66733          	or	a4,a2,a0
   13b84:	00e8c733          	xor	a4,a7,a4
   13b88:	00bec633          	xor	a2,t4,a1
   13b8c:	00c6a023          	sw	a2,0(a3)
   13b90:	00e6a223          	sw	a4,4(a3)
   13b94:	00878793          	addi	a5,a5,8
   13b98:	00868693          	addi	a3,a3,8
   13b9c:	f9c798e3          	bne	a5,t3,13b2c <keccak_absorb.constprop.2+0x3bc>
   13ba0:	013489b3          	add	s3,s1,s3
   13ba4:	00040513          	mv	a0,s0
   13ba8:	006b0b33          	add	s6,s6,t1
   13bac:	f5898993          	addi	s3,s3,-168
   13bb0:	e14fd0ef          	jal	111c4 <KeccakF1600_StatePermute>
   13bb4:	00000493          	li	s1,0
   13bb8:	d55ff06f          	j	1390c <keccak_absorb.constprop.2+0x19c>
   13bbc:	00048913          	mv	s2,s1
   13bc0:	00098613          	mv	a2,s3
   13bc4:	e9dff06f          	j	13a60 <keccak_absorb.constprop.2+0x2f0>
   13bc8:	001b0b13          	addi	s6,s6,1
   13bcc:	00148493          	addi	s1,s1,1
   13bd0:	00068993          	mv	s3,a3
   13bd4:	00078713          	mv	a4,a5
   13bd8:	cb1ff06f          	j	13888 <keccak_absorb.constprop.2+0x118>
   13bdc:	005b0b13          	addi	s6,s6,5
   13be0:	00548493          	addi	s1,s1,5
   13be4:	00068993          	mv	s3,a3
   13be8:	00078713          	mv	a4,a5
   13bec:	c9dff06f          	j	13888 <keccak_absorb.constprop.2+0x118>
   13bf0:	002b0b13          	addi	s6,s6,2
   13bf4:	00248493          	addi	s1,s1,2
   13bf8:	00068993          	mv	s3,a3
   13bfc:	00078713          	mv	a4,a5
   13c00:	c89ff06f          	j	13888 <keccak_absorb.constprop.2+0x118>
   13c04:	003b0b13          	addi	s6,s6,3
   13c08:	00348493          	addi	s1,s1,3
   13c0c:	00068993          	mv	s3,a3
   13c10:	00078713          	mv	a4,a5
   13c14:	c75ff06f          	j	13888 <keccak_absorb.constprop.2+0x118>
   13c18:	004b0b13          	addi	s6,s6,4
   13c1c:	00448493          	addi	s1,s1,4
   13c20:	00068993          	mv	s3,a3
   13c24:	00078713          	mv	a4,a5
   13c28:	c61ff06f          	j	13888 <keccak_absorb.constprop.2+0x118>
   13c2c:	006b0b13          	addi	s6,s6,6
   13c30:	00648493          	addi	s1,s1,6
   13c34:	00068993          	mv	s3,a3
   13c38:	c51ff06f          	j	13888 <keccak_absorb.constprop.2+0x118>

00013c3c <pqcrystals_fips202_ref_shake128_init>:
   13c3c:	ff010113          	addi	sp,sp,-16
   13c40:	0c800613          	li	a2,200
   13c44:	00000593          	li	a1,0
   13c48:	00112623          	sw	ra,12(sp)
   13c4c:	610000ef          	jal	1425c <memset>
   13c50:	00c12083          	lw	ra,12(sp)
   13c54:	0c052423          	sw	zero,200(a0)
   13c58:	01010113          	addi	sp,sp,16
   13c5c:	00008067          	ret

00013c60 <pqcrystals_fips202_ref_shake128_absorb>:
   13c60:	00058793          	mv	a5,a1
   13c64:	0c852583          	lw	a1,200(a0)
   13c68:	ff010113          	addi	sp,sp,-16
   13c6c:	00060693          	mv	a3,a2
   13c70:	00078613          	mv	a2,a5
   13c74:	00812423          	sw	s0,8(sp)
   13c78:	00112623          	sw	ra,12(sp)
   13c7c:	00050413          	mv	s0,a0
   13c80:	af1ff0ef          	jal	13770 <keccak_absorb.constprop.2>
   13c84:	00c12083          	lw	ra,12(sp)
   13c88:	0ca42423          	sw	a0,200(s0)
   13c8c:	00812403          	lw	s0,8(sp)
   13c90:	01010113          	addi	sp,sp,16
   13c94:	00008067          	ret

00013c98 <pqcrystals_fips202_ref_shake128_finalize>:
   13c98:	0c852783          	lw	a5,200(a0)
   13c9c:	0077f713          	andi	a4,a5,7
   13ca0:	00371713          	slli	a4,a4,0x3
   13ca4:	ff87f793          	andi	a5,a5,-8
   13ca8:	fe070693          	addi	a3,a4,-32
   13cac:	00f507b3          	add	a5,a0,a5
   13cb0:	0406c063          	bltz	a3,13cf0 <pqcrystals_fips202_ref_shake128_finalize+0x58>
   13cb4:	01f00613          	li	a2,31
   13cb8:	00d61633          	sll	a2,a2,a3
   13cbc:	00000593          	li	a1,0
   13cc0:	0007a683          	lw	a3,0(a5)
   13cc4:	0047a703          	lw	a4,4(a5)
   13cc8:	80000837          	lui	a6,0x80000
   13ccc:	00b6c6b3          	xor	a3,a3,a1
   13cd0:	00c74733          	xor	a4,a4,a2
   13cd4:	00d7a023          	sw	a3,0(a5)
   13cd8:	00e7a223          	sw	a4,4(a5)
   13cdc:	0a452783          	lw	a5,164(a0)
   13ce0:	0c052423          	sw	zero,200(a0)
   13ce4:	0107c7b3          	xor	a5,a5,a6
   13ce8:	0af52223          	sw	a5,164(a0)
   13cec:	00008067          	ret
   13cf0:	01f00593          	li	a1,31
   13cf4:	40e586b3          	sub	a3,a1,a4
   13cf8:	00f00613          	li	a2,15
   13cfc:	00e595b3          	sll	a1,a1,a4
   13d00:	00d65633          	srl	a2,a2,a3
   13d04:	fbdff06f          	j	13cc0 <pqcrystals_fips202_ref_shake128_finalize+0x28>

00013d08 <pqcrystals_fips202_ref_shake128_squeezeblocks>:
   13d08:	0c058463          	beqz	a1,13dd0 <pqcrystals_fips202_ref_shake128_squeezeblocks+0xc8>
   13d0c:	fe010113          	addi	sp,sp,-32
   13d10:	01412423          	sw	s4,8(sp)
   13d14:	0a850a13          	addi	s4,a0,168
   13d18:	00812c23          	sw	s0,24(sp)
   13d1c:	00912a23          	sw	s1,20(sp)
   13d20:	01212823          	sw	s2,16(sp)
   13d24:	01312623          	sw	s3,12(sp)
   13d28:	00112e23          	sw	ra,28(sp)
   13d2c:	00058993          	mv	s3,a1
   13d30:	00050413          	mv	s0,a0
   13d34:	00060913          	mv	s2,a2
   13d38:	000a0493          	mv	s1,s4
   13d3c:	00090513          	mv	a0,s2
   13d40:	c84fd0ef          	jal	111c4 <KeccakF1600_StatePermute>
   13d44:	00040793          	mv	a5,s0
   13d48:	00090613          	mv	a2,s2
   13d4c:	00062683          	lw	a3,0(a2)
   13d50:	00462703          	lw	a4,4(a2)
   13d54:	00878793          	addi	a5,a5,8
   13d58:	0086de93          	srli	t4,a3,0x8
   13d5c:	0106de13          	srli	t3,a3,0x10
   13d60:	0186d313          	srli	t1,a3,0x18
   13d64:	00875893          	srli	a7,a4,0x8
   13d68:	01075813          	srli	a6,a4,0x10
   13d6c:	01875593          	srli	a1,a4,0x18
   13d70:	ffd78ca3          	sb	t4,-7(a5)
   13d74:	fed78c23          	sb	a3,-8(a5)
   13d78:	fee78e23          	sb	a4,-4(a5)
   13d7c:	ffc78d23          	sb	t3,-6(a5)
   13d80:	fe678da3          	sb	t1,-5(a5)
   13d84:	ff178ea3          	sb	a7,-3(a5)
   13d88:	ff078f23          	sb	a6,-2(a5)
   13d8c:	feb78fa3          	sb	a1,-1(a5)
   13d90:	00860613          	addi	a2,a2,8
   13d94:	faf49ce3          	bne	s1,a5,13d4c <pqcrystals_fips202_ref_shake128_squeezeblocks+0x44>
   13d98:	fff98993          	addi	s3,s3,-1
   13d9c:	0a848493          	addi	s1,s1,168
   13da0:	000a0413          	mv	s0,s4
   13da4:	00098663          	beqz	s3,13db0 <pqcrystals_fips202_ref_shake128_squeezeblocks+0xa8>
   13da8:	0a8a0a13          	addi	s4,s4,168
   13dac:	f91ff06f          	j	13d3c <pqcrystals_fips202_ref_shake128_squeezeblocks+0x34>
   13db0:	01c12083          	lw	ra,28(sp)
   13db4:	01812403          	lw	s0,24(sp)
   13db8:	01412483          	lw	s1,20(sp)
   13dbc:	01012903          	lw	s2,16(sp)
   13dc0:	00c12983          	lw	s3,12(sp)
   13dc4:	00812a03          	lw	s4,8(sp)
   13dc8:	02010113          	addi	sp,sp,32
   13dcc:	00008067          	ret
   13dd0:	00008067          	ret

00013dd4 <pqcrystals_fips202_ref_shake256>:
   13dd4:	f0010113          	addi	sp,sp,-256
   13dd8:	0e812c23          	sw	s0,248(sp)
   13ddc:	01010413          	addi	s0,sp,16
   13de0:	0e912a23          	sw	s1,244(sp)
   13de4:	0f212823          	sw	s2,240(sp)
   13de8:	0f312623          	sw	s3,236(sp)
   13dec:	00060493          	mv	s1,a2
   13df0:	00050913          	mv	s2,a0
   13df4:	0c800613          	li	a2,200
   13df8:	00058993          	mv	s3,a1
   13dfc:	00040513          	mv	a0,s0
   13e00:	00000593          	li	a1,0
   13e04:	0e112e23          	sw	ra,252(sp)
   13e08:	00d12623          	sw	a3,12(sp)
   13e0c:	450000ef          	jal	1425c <memset>
   13e10:	00c12683          	lw	a3,12(sp)
   13e14:	00048613          	mv	a2,s1
   13e18:	00040513          	mv	a0,s0
   13e1c:	00000593          	li	a1,0
   13e20:	0c012c23          	sw	zero,216(sp)
   13e24:	c80ff0ef          	jal	132a4 <keccak_absorb.constprop.1>
   13e28:	00757713          	andi	a4,a0,7
   13e2c:	00371713          	slli	a4,a4,0x3
   13e30:	ff857793          	andi	a5,a0,-8
   13e34:	fe070693          	addi	a3,a4,-32
   13e38:	00f407b3          	add	a5,s0,a5
   13e3c:	0606c463          	bltz	a3,13ea4 <pqcrystals_fips202_ref_shake256+0xd0>
   13e40:	01f00613          	li	a2,31
   13e44:	00d61633          	sll	a2,a2,a3
   13e48:	00000593          	li	a1,0
   13e4c:	0007a683          	lw	a3,0(a5)
   13e50:	0047a703          	lw	a4,4(a5)
   13e54:	80000837          	lui	a6,0x80000
   13e58:	00b6c6b3          	xor	a3,a3,a1
   13e5c:	00c74733          	xor	a4,a4,a2
   13e60:	00d7a023          	sw	a3,0(a5)
   13e64:	00e7a223          	sw	a4,4(a5)
   13e68:	09412783          	lw	a5,148(sp)
   13e6c:	00040613          	mv	a2,s0
   13e70:	00098593          	mv	a1,s3
   13e74:	00090513          	mv	a0,s2
   13e78:	0107c7b3          	xor	a5,a5,a6
   13e7c:	00000693          	li	a3,0
   13e80:	08f12a23          	sw	a5,148(sp)
   13e84:	ff9fe0ef          	jal	12e7c <keccak_squeeze.constprop.1>
   13e88:	0fc12083          	lw	ra,252(sp)
   13e8c:	0f812403          	lw	s0,248(sp)
   13e90:	0f412483          	lw	s1,244(sp)
   13e94:	0f012903          	lw	s2,240(sp)
   13e98:	0ec12983          	lw	s3,236(sp)
   13e9c:	10010113          	addi	sp,sp,256
   13ea0:	00008067          	ret
   13ea4:	01f00593          	li	a1,31
   13ea8:	40e586b3          	sub	a3,a1,a4
   13eac:	00f00613          	li	a2,15
   13eb0:	00e595b3          	sll	a1,a1,a4
   13eb4:	00d65633          	srl	a2,a2,a3
   13eb8:	f95ff06f          	j	13e4c <pqcrystals_fips202_ref_shake256+0x78>

00013ebc <pqcrystals_dilithium2_ref_pack_pk>:
   13ebc:	ff010113          	addi	sp,sp,-16
   13ec0:	00a5e733          	or	a4,a1,a0
   13ec4:	00112623          	sw	ra,12(sp)
   13ec8:	00812423          	sw	s0,8(sp)
   13ecc:	00912223          	sw	s1,4(sp)
   13ed0:	01212023          	sw	s2,0(sp)
   13ed4:	00377713          	andi	a4,a4,3
   13ed8:	00058793          	mv	a5,a1
   13edc:	08071863          	bnez	a4,13f6c <pqcrystals_dilithium2_ref_pack_pk+0xb0>
   13ee0:	40b50733          	sub	a4,a0,a1
   13ee4:	fff70713          	addi	a4,a4,-1
   13ee8:	00373713          	sltiu	a4,a4,3
   13eec:	08071063          	bnez	a4,13f6c <pqcrystals_dilithium2_ref_pack_pk+0xb0>
   13ef0:	0005a783          	lw	a5,0(a1)
   13ef4:	00f52023          	sw	a5,0(a0)
   13ef8:	0045a783          	lw	a5,4(a1)
   13efc:	00f52223          	sw	a5,4(a0)
   13f00:	0085a783          	lw	a5,8(a1)
   13f04:	00f52423          	sw	a5,8(a0)
   13f08:	00c5a783          	lw	a5,12(a1)
   13f0c:	00f52623          	sw	a5,12(a0)
   13f10:	0105a783          	lw	a5,16(a1)
   13f14:	00f52823          	sw	a5,16(a0)
   13f18:	0145a783          	lw	a5,20(a1)
   13f1c:	00f52a23          	sw	a5,20(a0)
   13f20:	0185a783          	lw	a5,24(a1)
   13f24:	00f52c23          	sw	a5,24(a0)
   13f28:	01c5a783          	lw	a5,28(a1)
   13f2c:	00f52e23          	sw	a5,28(a0)
   13f30:	00060913          	mv	s2,a2
   13f34:	02050413          	addi	s0,a0,32
   13f38:	52050493          	addi	s1,a0,1312
   13f3c:	00090593          	mv	a1,s2
   13f40:	00040513          	mv	a0,s0
   13f44:	14040413          	addi	s0,s0,320
   13f48:	d55fc0ef          	jal	10c9c <pqcrystals_dilithium2_ref_polyt1_pack>
   13f4c:	40090913          	addi	s2,s2,1024
   13f50:	fe9416e3          	bne	s0,s1,13f3c <pqcrystals_dilithium2_ref_pack_pk+0x80>
   13f54:	00c12083          	lw	ra,12(sp)
   13f58:	00812403          	lw	s0,8(sp)
   13f5c:	00412483          	lw	s1,4(sp)
   13f60:	00012903          	lw	s2,0(sp)
   13f64:	01010113          	addi	sp,sp,16
   13f68:	00008067          	ret
   13f6c:	02058693          	addi	a3,a1,32
   13f70:	00050713          	mv	a4,a0
   13f74:	0007c583          	lbu	a1,0(a5)
   13f78:	00178793          	addi	a5,a5,1
   13f7c:	00170713          	addi	a4,a4,1
   13f80:	feb70fa3          	sb	a1,-1(a4)
   13f84:	fed798e3          	bne	a5,a3,13f74 <pqcrystals_dilithium2_ref_pack_pk+0xb8>
   13f88:	fa9ff06f          	j	13f30 <pqcrystals_dilithium2_ref_pack_pk+0x74>

00013f8c <pqcrystals_dilithium2_ref_pack_sk>:
   13f8c:	fe010113          	addi	sp,sp,-32
   13f90:	00b568b3          	or	a7,a0,a1
   13f94:	00812c23          	sw	s0,24(sp)
   13f98:	00912a23          	sw	s1,20(sp)
   13f9c:	01512223          	sw	s5,4(sp)
   13fa0:	00112e23          	sw	ra,28(sp)
   13fa4:	01212823          	sw	s2,16(sp)
   13fa8:	01312623          	sw	s3,12(sp)
   13fac:	01412423          	sw	s4,8(sp)
   13fb0:	0038f893          	andi	a7,a7,3
   13fb4:	00050413          	mv	s0,a0
   13fb8:	00070a93          	mv	s5,a4
   13fbc:	00080493          	mv	s1,a6
   13fc0:	00058513          	mv	a0,a1
   13fc4:	1c089463          	bnez	a7,1418c <pqcrystals_dilithium2_ref_pack_sk+0x200>
   13fc8:	40b40733          	sub	a4,s0,a1
   13fcc:	fff70713          	addi	a4,a4,-1
   13fd0:	00373713          	sltiu	a4,a4,3
   13fd4:	1a071c63          	bnez	a4,1418c <pqcrystals_dilithium2_ref_pack_sk+0x200>
   13fd8:	0005a703          	lw	a4,0(a1)
   13fdc:	00e42023          	sw	a4,0(s0)
   13fe0:	0045a703          	lw	a4,4(a1)
   13fe4:	00e42223          	sw	a4,4(s0)
   13fe8:	0085a703          	lw	a4,8(a1)
   13fec:	00e42423          	sw	a4,8(s0)
   13ff0:	00c5a703          	lw	a4,12(a1)
   13ff4:	00e42623          	sw	a4,12(s0)
   13ff8:	0105a703          	lw	a4,16(a1)
   13ffc:	00e42823          	sw	a4,16(s0)
   14000:	0145a703          	lw	a4,20(a1)
   14004:	00e42a23          	sw	a4,20(s0)
   14008:	0185a703          	lw	a4,24(a1)
   1400c:	00e42c23          	sw	a4,24(s0)
   14010:	01c5a703          	lw	a4,28(a1)
   14014:	00e42e23          	sw	a4,28(s0)
   14018:	02040893          	addi	a7,s0,32
   1401c:	0116e733          	or	a4,a3,a7
   14020:	00377713          	andi	a4,a4,3
   14024:	00068513          	mv	a0,a3
   14028:	1a071063          	bnez	a4,141c8 <pqcrystals_dilithium2_ref_pack_sk+0x23c>
   1402c:	40d40733          	sub	a4,s0,a3
   14030:	01f70713          	addi	a4,a4,31
   14034:	00373713          	sltiu	a4,a4,3
   14038:	18071863          	bnez	a4,141c8 <pqcrystals_dilithium2_ref_pack_sk+0x23c>
   1403c:	0006a703          	lw	a4,0(a3)
   14040:	02e42023          	sw	a4,32(s0)
   14044:	0046a703          	lw	a4,4(a3)
   14048:	02e42223          	sw	a4,36(s0)
   1404c:	0086a703          	lw	a4,8(a3)
   14050:	02e42423          	sw	a4,40(s0)
   14054:	00c6a703          	lw	a4,12(a3)
   14058:	02e42623          	sw	a4,44(s0)
   1405c:	0106a703          	lw	a4,16(a3)
   14060:	02e42823          	sw	a4,48(s0)
   14064:	0146a703          	lw	a4,20(a3)
   14068:	02e42a23          	sw	a4,52(s0)
   1406c:	0186a703          	lw	a4,24(a3)
   14070:	02e42c23          	sw	a4,56(s0)
   14074:	01c6a703          	lw	a4,28(a3)
   14078:	02e42e23          	sw	a4,60(s0)
   1407c:	04040513          	addi	a0,s0,64
   14080:	00a66733          	or	a4,a2,a0
   14084:	00377713          	andi	a4,a4,3
   14088:	00060693          	mv	a3,a2
   1408c:	12071063          	bnez	a4,141ac <pqcrystals_dilithium2_ref_pack_sk+0x220>
   14090:	40c40733          	sub	a4,s0,a2
   14094:	03f70713          	addi	a4,a4,63
   14098:	00373713          	sltiu	a4,a4,3
   1409c:	10071863          	bnez	a4,141ac <pqcrystals_dilithium2_ref_pack_sk+0x220>
   140a0:	00062703          	lw	a4,0(a2)
   140a4:	04e42023          	sw	a4,64(s0)
   140a8:	00462703          	lw	a4,4(a2)
   140ac:	04e42223          	sw	a4,68(s0)
   140b0:	00862703          	lw	a4,8(a2)
   140b4:	04e42423          	sw	a4,72(s0)
   140b8:	00c62703          	lw	a4,12(a2)
   140bc:	04e42623          	sw	a4,76(s0)
   140c0:	01062703          	lw	a4,16(a2)
   140c4:	04e42823          	sw	a4,80(s0)
   140c8:	01462703          	lw	a4,20(a2)
   140cc:	04e42a23          	sw	a4,84(s0)
   140d0:	01862703          	lw	a4,24(a2)
   140d4:	04e42c23          	sw	a4,88(s0)
   140d8:	01c62703          	lw	a4,28(a2)
   140dc:	04e42e23          	sw	a4,92(s0)
   140e0:	02062703          	lw	a4,32(a2)
   140e4:	06e42023          	sw	a4,96(s0)
   140e8:	02462703          	lw	a4,36(a2)
   140ec:	06e42223          	sw	a4,100(s0)
   140f0:	02862703          	lw	a4,40(a2)
   140f4:	06e42423          	sw	a4,104(s0)
   140f8:	02c62703          	lw	a4,44(a2)
   140fc:	06e42623          	sw	a4,108(s0)
   14100:	00078a13          	mv	s4,a5
   14104:	07040993          	addi	s3,s0,112
   14108:	1f040913          	addi	s2,s0,496
   1410c:	000a0593          	mv	a1,s4
   14110:	00098513          	mv	a0,s3
   14114:	06098993          	addi	s3,s3,96
   14118:	ad9fc0ef          	jal	10bf0 <pqcrystals_dilithium2_ref_polyeta_pack>
   1411c:	400a0a13          	addi	s4,s4,1024
   14120:	ff3916e3          	bne	s2,s3,1410c <pqcrystals_dilithium2_ref_pack_sk+0x180>
   14124:	00048993          	mv	s3,s1
   14128:	37040493          	addi	s1,s0,880
   1412c:	00098593          	mv	a1,s3
   14130:	00090513          	mv	a0,s2
   14134:	06090913          	addi	s2,s2,96
   14138:	ab9fc0ef          	jal	10bf0 <pqcrystals_dilithium2_ref_polyeta_pack>
   1413c:	40098993          	addi	s3,s3,1024
   14140:	ff2496e3          	bne	s1,s2,1412c <pqcrystals_dilithium2_ref_pack_sk+0x1a0>
   14144:	7ff40413          	addi	s0,s0,2047
   14148:	1f140413          	addi	s0,s0,497
   1414c:	000a8913          	mv	s2,s5
   14150:	00090593          	mv	a1,s2
   14154:	00048513          	mv	a0,s1
   14158:	1a048493          	addi	s1,s1,416
   1415c:	bb1fc0ef          	jal	10d0c <pqcrystals_dilithium2_ref_polyt0_pack>
   14160:	40090913          	addi	s2,s2,1024
   14164:	fe8496e3          	bne	s1,s0,14150 <pqcrystals_dilithium2_ref_pack_sk+0x1c4>
   14168:	01c12083          	lw	ra,28(sp)
   1416c:	01812403          	lw	s0,24(sp)
   14170:	01412483          	lw	s1,20(sp)
   14174:	01012903          	lw	s2,16(sp)
   14178:	00c12983          	lw	s3,12(sp)
   1417c:	00812a03          	lw	s4,8(sp)
   14180:	00412a83          	lw	s5,4(sp)
   14184:	02010113          	addi	sp,sp,32
   14188:	00008067          	ret
   1418c:	02058813          	addi	a6,a1,32
   14190:	00040713          	mv	a4,s0
   14194:	00054583          	lbu	a1,0(a0)
   14198:	00150513          	addi	a0,a0,1
   1419c:	00170713          	addi	a4,a4,1
   141a0:	feb70fa3          	sb	a1,-1(a4)
   141a4:	fea818e3          	bne	a6,a0,14194 <pqcrystals_dilithium2_ref_pack_sk+0x208>
   141a8:	e71ff06f          	j	14018 <pqcrystals_dilithium2_ref_pack_sk+0x8c>
   141ac:	03060613          	addi	a2,a2,48
   141b0:	0006c703          	lbu	a4,0(a3)
   141b4:	00168693          	addi	a3,a3,1
   141b8:	00150513          	addi	a0,a0,1
   141bc:	fee50fa3          	sb	a4,-1(a0)
   141c0:	fec698e3          	bne	a3,a2,141b0 <pqcrystals_dilithium2_ref_pack_sk+0x224>
   141c4:	f3dff06f          	j	14100 <pqcrystals_dilithium2_ref_pack_sk+0x174>
   141c8:	02068693          	addi	a3,a3,32
   141cc:	00054703          	lbu	a4,0(a0)
   141d0:	00150513          	addi	a0,a0,1
   141d4:	00188893          	addi	a7,a7,1 # 7fe001 <__stack_top+0x7df005>
   141d8:	fee88fa3          	sb	a4,-1(a7)
   141dc:	fed518e3          	bne	a0,a3,141cc <pqcrystals_dilithium2_ref_pack_sk+0x240>
   141e0:	e9dff06f          	j	1407c <pqcrystals_dilithium2_ref_pack_sk+0xf0>

000141e4 <pqcrystals_dilithium2_ref_power2round>:
   141e4:	000017b7          	lui	a5,0x1
   141e8:	fff78793          	addi	a5,a5,-1 # fff <_start-0xf001>
   141ec:	00f587b3          	add	a5,a1,a5
   141f0:	ffffe737          	lui	a4,0xffffe
   141f4:	00e7f733          	and	a4,a5,a4
   141f8:	40e585b3          	sub	a1,a1,a4
   141fc:	00b52023          	sw	a1,0(a0)
   14200:	40d7d513          	srai	a0,a5,0xd
   14204:	00008067          	ret

00014208 <pqcrystals_dilithium2_ref_dilithium_shake128_stream_init>:
   14208:	fd010113          	addi	sp,sp,-48
   1420c:	02112623          	sw	ra,44(sp)
   14210:	02812423          	sw	s0,40(sp)
   14214:	00c11e23          	sh	a2,28(sp)
   14218:	00050413          	mv	s0,a0
   1421c:	00b12623          	sw	a1,12(sp)
   14220:	a1dff0ef          	jal	13c3c <pqcrystals_fips202_ref_shake128_init>
   14224:	00c12583          	lw	a1,12(sp)
   14228:	00040513          	mv	a0,s0
   1422c:	02000613          	li	a2,32
   14230:	a31ff0ef          	jal	13c60 <pqcrystals_fips202_ref_shake128_absorb>
   14234:	01c10593          	addi	a1,sp,28
   14238:	00040513          	mv	a0,s0
   1423c:	00200613          	li	a2,2
   14240:	a21ff0ef          	jal	13c60 <pqcrystals_fips202_ref_shake128_absorb>
   14244:	00040513          	mv	a0,s0
   14248:	a51ff0ef          	jal	13c98 <pqcrystals_fips202_ref_shake128_finalize>
   1424c:	02c12083          	lw	ra,44(sp)
   14250:	02812403          	lw	s0,40(sp)
   14254:	03010113          	addi	sp,sp,48
   14258:	00008067          	ret

0001425c <memset>:
   1425c:	00f00313          	li	t1,15
   14260:	00050713          	mv	a4,a0
   14264:	02c37e63          	bgeu	t1,a2,142a0 <memset+0x44>
   14268:	00f77793          	andi	a5,a4,15
   1426c:	0a079063          	bnez	a5,1430c <memset+0xb0>
   14270:	08059263          	bnez	a1,142f4 <memset+0x98>
   14274:	ff067693          	andi	a3,a2,-16
   14278:	00f67613          	andi	a2,a2,15
   1427c:	00e686b3          	add	a3,a3,a4
   14280:	00b72023          	sw	a1,0(a4) # ffffe000 <__stack_top+0xfffdf004>
   14284:	00b72223          	sw	a1,4(a4)
   14288:	00b72423          	sw	a1,8(a4)
   1428c:	00b72623          	sw	a1,12(a4)
   14290:	01070713          	addi	a4,a4,16
   14294:	fed766e3          	bltu	a4,a3,14280 <memset+0x24>
   14298:	00061463          	bnez	a2,142a0 <memset+0x44>
   1429c:	00008067          	ret
   142a0:	40c306b3          	sub	a3,t1,a2
   142a4:	00269693          	slli	a3,a3,0x2
   142a8:	00000297          	auipc	t0,0x0
   142ac:	005686b3          	add	a3,a3,t0
   142b0:	00c68067          	jr	12(a3)
   142b4:	00b70723          	sb	a1,14(a4)
   142b8:	00b706a3          	sb	a1,13(a4)
   142bc:	00b70623          	sb	a1,12(a4)
   142c0:	00b705a3          	sb	a1,11(a4)
   142c4:	00b70523          	sb	a1,10(a4)
   142c8:	00b704a3          	sb	a1,9(a4)
   142cc:	00b70423          	sb	a1,8(a4)
   142d0:	00b703a3          	sb	a1,7(a4)
   142d4:	00b70323          	sb	a1,6(a4)
   142d8:	00b702a3          	sb	a1,5(a4)
   142dc:	00b70223          	sb	a1,4(a4)
   142e0:	00b701a3          	sb	a1,3(a4)
   142e4:	00b70123          	sb	a1,2(a4)
   142e8:	00b700a3          	sb	a1,1(a4)
   142ec:	00b70023          	sb	a1,0(a4)
   142f0:	00008067          	ret
   142f4:	0ff5f593          	zext.b	a1,a1
   142f8:	00859693          	slli	a3,a1,0x8
   142fc:	00d5e5b3          	or	a1,a1,a3
   14300:	01059693          	slli	a3,a1,0x10
   14304:	00d5e5b3          	or	a1,a1,a3
   14308:	f6dff06f          	j	14274 <memset+0x18>
   1430c:	00279693          	slli	a3,a5,0x2
   14310:	00000297          	auipc	t0,0x0
   14314:	005686b3          	add	a3,a3,t0
   14318:	00008293          	mv	t0,ra
   1431c:	fa0680e7          	jalr	-96(a3)
   14320:	00028093          	mv	ra,t0
   14324:	ff078793          	addi	a5,a5,-16
   14328:	40f70733          	sub	a4,a4,a5
   1432c:	00f60633          	add	a2,a2,a5
   14330:	f6c378e3          	bgeu	t1,a2,142a0 <memset+0x44>
   14334:	f3dff06f          	j	14270 <memset+0x14>

00014338 <memcpy>:
   14338:	00a5c7b3          	xor	a5,a1,a0
   1433c:	0037f793          	andi	a5,a5,3
   14340:	00c508b3          	add	a7,a0,a2
   14344:	06079663          	bnez	a5,143b0 <memcpy+0x78>
   14348:	00463613          	sltiu	a2,a2,4
   1434c:	06061263          	bnez	a2,143b0 <memcpy+0x78>
   14350:	00357793          	andi	a5,a0,3
   14354:	00050713          	mv	a4,a0
   14358:	0c079a63          	bnez	a5,1442c <memcpy+0xf4>
   1435c:	ffc8f613          	andi	a2,a7,-4
   14360:	40e606b3          	sub	a3,a2,a4
   14364:	02000793          	li	a5,32
   14368:	06d7c463          	blt	a5,a3,143d0 <memcpy+0x98>
   1436c:	00058693          	mv	a3,a1
   14370:	00070793          	mv	a5,a4
   14374:	02c77a63          	bgeu	a4,a2,143a8 <memcpy+0x70>
   14378:	0006a803          	lw	a6,0(a3)
   1437c:	00478793          	addi	a5,a5,4
   14380:	00468693          	addi	a3,a3,4
   14384:	ff07ae23          	sw	a6,-4(a5)
   14388:	fec7e8e3          	bltu	a5,a2,14378 <memcpy+0x40>
   1438c:	fff60613          	addi	a2,a2,-1
   14390:	40e60633          	sub	a2,a2,a4
   14394:	ffc67613          	andi	a2,a2,-4
   14398:	00458593          	addi	a1,a1,4
   1439c:	00470713          	addi	a4,a4,4
   143a0:	00c585b3          	add	a1,a1,a2
   143a4:	00c70733          	add	a4,a4,a2
   143a8:	01176863          	bltu	a4,a7,143b8 <memcpy+0x80>
   143ac:	00008067          	ret
   143b0:	00050713          	mv	a4,a0
   143b4:	ff157ce3          	bgeu	a0,a7,143ac <memcpy+0x74>
   143b8:	0005c783          	lbu	a5,0(a1)
   143bc:	00170713          	addi	a4,a4,1
   143c0:	00158593          	addi	a1,a1,1
   143c4:	fef70fa3          	sb	a5,-1(a4)
   143c8:	fee898e3          	bne	a7,a4,143b8 <memcpy+0x80>
   143cc:	00008067          	ret
   143d0:	0005a683          	lw	a3,0(a1)
   143d4:	0045a283          	lw	t0,4(a1)
   143d8:	0085af83          	lw	t6,8(a1)
   143dc:	00c5af03          	lw	t5,12(a1)
   143e0:	0105ae83          	lw	t4,16(a1)
   143e4:	0145ae03          	lw	t3,20(a1)
   143e8:	0185a303          	lw	t1,24(a1)
   143ec:	01c5a803          	lw	a6,28(a1)
   143f0:	00d72023          	sw	a3,0(a4)
   143f4:	0205a683          	lw	a3,32(a1)
   143f8:	02470713          	addi	a4,a4,36
   143fc:	fe572023          	sw	t0,-32(a4)
   14400:	fed72e23          	sw	a3,-4(a4)
   14404:	fff72223          	sw	t6,-28(a4)
   14408:	40e606b3          	sub	a3,a2,a4
   1440c:	ffe72423          	sw	t5,-24(a4)
   14410:	ffd72623          	sw	t4,-20(a4)
   14414:	ffc72823          	sw	t3,-16(a4)
   14418:	fe672a23          	sw	t1,-12(a4)
   1441c:	ff072c23          	sw	a6,-8(a4)
   14420:	02458593          	addi	a1,a1,36
   14424:	fad7c6e3          	blt	a5,a3,143d0 <memcpy+0x98>
   14428:	f45ff06f          	j	1436c <memcpy+0x34>
   1442c:	0005c683          	lbu	a3,0(a1)
   14430:	00170713          	addi	a4,a4,1
   14434:	00377793          	andi	a5,a4,3
   14438:	fed70fa3          	sb	a3,-1(a4)
   1443c:	00158593          	addi	a1,a1,1
   14440:	f0078ee3          	beqz	a5,1435c <memcpy+0x24>
   14444:	0005c683          	lbu	a3,0(a1)
   14448:	00170713          	addi	a4,a4,1
   1444c:	00377793          	andi	a5,a4,3
   14450:	fed70fa3          	sb	a3,-1(a4)
   14454:	00158593          	addi	a1,a1,1
   14458:	fc079ae3          	bnez	a5,1442c <memcpy+0xf4>
   1445c:	f01ff06f          	j	1435c <memcpy+0x24>

Disassembly of section .rodata:

00014460 <zetas>:
   14460:	0000                	.insn	2, 0x0000
   14462:	0000                	.insn	2, 0x0000
   14464:	000064f7          	.insn	4, 0x64f7
   14468:	3102                	.insn	2, 0x3102
   1446a:	ffd8                	.insn	2, 0xffd8
   1446c:	fff81503          	lh	a0,-1(a6) # 7fffffff <__stack_top+0x7ffe1003>
   14470:	9e44                	.insn	2, 0x9e44
   14472:	21180003          	lb	zero,529(a6)
   14476:	fff4                	.insn	2, 0xfff4
   14478:	a128                	.insn	2, 0xa128
   1447a:	fff2                	.insn	2, 0xfff2
   1447c:	1e24                	.insn	2, 0x1e24
   1447e:	de2b0007          	.insn	4, 0xde2b0007
   14482:	e92b001b          	.insn	4, 0xe92b001b
   14486:	84ad0023          	sb	a0,-1984(s10)
   1448a:	fffa                	.insn	2, 0xfffa
   1448c:	ffe0147f 002f9a75 	.insn	12, 0xffd3fb09002f9a75ffe0147f
   14494:	ffd3fb09 
   14498:	7a49                	.insn	2, 0x7a49
   1449a:	e527002f          	.insn	4, 0xe527002f
   1449e:	0028                	.insn	2, 0x0028
   144a0:	9658                	.insn	2, 0x9658
   144a2:	0029                	.insn	2, 0x0029
   144a4:	a070                	.insn	2, 0xa070
   144a6:	85a4000f          	.insn	4, 0x85a4000f
   144aa:	b788ffef          	jal	t6,fffa3822 <__stack_top+0xfff84826>
   144ae:	0036                	.insn	2, 0x0036
   144b0:	9d90                	.insn	2, 0x9d90
   144b2:	eaa0fff7          	.insn	4, 0xeaa0fff7
   144b6:	ffee                	.insn	2, 0xffee
   144b8:	f968                	.insn	2, 0xf968
   144ba:	d37b0027          	.insn	4, 0xd37b0027
   144be:	ffdf add6 ffdf      	.insn	6, 0xffdfadd6ffdf
   144c4:	ffc51ae7          	.insn	4, 0xffc51ae7
   144c8:	ffeaa4f7          	.insn	4, 0xffeaa4f7
   144cc:	fc98                	.insn	2, 0xfc98
   144ce:	ffcd                	.insn	2, 0xffcd
   144d0:	d035                	.insn	2, 0xd035
   144d2:	001a                	.insn	2, 0x001a
   144d4:	b422                	.insn	2, 0xb422
   144d6:	ffff                	.insn	2, 0xffff
   144d8:	3201                	.insn	2, 0x3201
   144da:	003d                	.insn	2, 0x003d
   144dc:	45c5                	.insn	2, 0x45c5
   144de:	0004                	.insn	2, 0x0004
   144e0:	00294a67          	.insn	4, 0x00294a67
   144e4:	7620                	.insn	2, 0x7620
   144e6:	0001                	.insn	2, 0x0001
   144e8:	f4cd                	.insn	2, 0xf4cd
   144ea:	002e                	.insn	2, 0x002e
   144ec:	dec5                	.insn	2, 0xdec5
   144ee:	0035                	.insn	2, 0x0035
   144f0:	ffe6a503          	lw	a0,-2(a3)
   144f4:	302c                	.insn	2, 0x302c
   144f6:	ffc9                	.insn	2, 0xffc9
   144f8:	47d4                	.insn	2, 0x47d4
   144fa:	ffd9                	.insn	2, 0xffd9
   144fc:	003bbeaf          	.insn	4, 0x003bbeaf
   14500:	1585                	.insn	2, 0x1585
   14502:	ffc5                	.insn	2, 0xffc5
   14504:	8e7c                	.insn	2, 0x8e7c
   14506:	ffd1                	.insn	2, 0xffd1
   14508:	8a96                	.insn	2, 0x8a96
   1450a:	0036                	.insn	2, 0x0036
   1450c:	3e41                	.insn	2, 0x3e41
   1450e:	ffd4                	.insn	2, 0xffd4
   14510:	0400                	.insn	2, 0x0400
   14512:	0036                	.insn	2, 0x0036
   14514:	6a4d                	.insn	2, 0x6a4d
   14516:	d69cfffb          	.insn	4, 0xd69cfffb
   1451a:	c55d0023          	sb	s5,-960(s10)
   1451e:	123dfff7          	.insn	4, 0x123dfff7
   14522:	ffe6                	.insn	2, 0xffe6
   14524:	ead6                	.insn	2, 0xead6
   14526:	ffe6                	.insn	2, 0xffe6
   14528:	7e1e                	.insn	2, 0x7e1e
   1452a:	0035                	.insn	2, 0x0035
   1452c:	af59                	.insn	2, 0xaf59
   1452e:	ffc5                	.insn	2, 0xffc5
   14530:	0035843f ffdf5617 	.insn	8, 0xffdf56170035843f
   14538:	945c                	.insn	2, 0x945c
   1453a:	738cffe7          	.insn	4, 0x738cffe7
   1453e:	0038                	.insn	2, 0x0038
   14540:	63a8                	.insn	2, 0x63a8
   14542:	000c                	.insn	2, 0x000c
   14544:	1b9a                	.insn	2, 0x1b9a
   14546:	0008                	.insn	2, 0x0008
   14548:	8f76                	.insn	2, 0x8f76
   1454a:	000e                	.insn	2, 0x000e
   1454c:	003b3853          	.insn	4, 0x003b3853
   14550:	8534                	.insn	2, 0x8534
   14552:	fc30003b          	.insn	4, 0xfc30003b
   14556:	ffd8                	.insn	2, 0xffd8
   14558:	9d54                	.insn	2, 0x9d54
   1455a:	001f 4f2d ffd5      	.insn	6, 0xffd54f2d001f
   14560:	06e5                	.insn	2, 0x06e5
   14562:	ffc4                	.insn	2, 0xffc4
   14564:	ac81                	.insn	2, 0xac81
   14566:	ffe8                	.insn	2, 0xffe8
   14568:	ffc7e1cf          	.insn	4, 0xffc7e1cf
   1456c:	9819                	.insn	2, 0x9819
   1456e:	ffd1                	.insn	2, 0xffd1
   14570:	d65d                	.insn	2, 0xd65d
   14572:	ffe9                	.insn	2, 0xffe9
   14574:	09ee                	.insn	2, 0x09ee
   14576:	0035                	.insn	2, 0x0035
   14578:	002135c7          	.insn	4, 0x002135c7
   1457c:	ffe7cfbb          	.insn	4, 0xffe7cfbb
   14580:	cf75                	.insn	2, 0xcf75
   14582:	ffec                	.insn	2, 0xffec
   14584:	9772                	.insn	2, 0x9772
   14586:	001d                	.insn	2, 0x001d
   14588:	b072                	.insn	2, 0xb072
   1458a:	ffc1                	.insn	2, 0xffc1
   1458c:	bcf6                	.insn	2, 0xbcf6
   1458e:	fff0                	.insn	2, 0xfff0
   14590:	5280                	.insn	2, 0x5280
   14592:	d2aeffcf          	.insn	4, 0xd2aeffcf
   14596:	90e0ffcf          	.insn	4, 0x90e0ffcf
   1459a:	ffc8                	.insn	2, 0xffc8
   1459c:	efca                	.insn	2, 0xefca
   1459e:	0001                	.insn	2, 0x0001
   145a0:	10f2                	.insn	2, 0x10f2
   145a2:	0034                	.insn	2, 0x0034
   145a4:	fe85                	.insn	2, 0xfe85
   145a6:	fff0                	.insn	2, 0xfff0
   145a8:	c638                	.insn	2, 0xc638
   145aa:	0020                	.insn	2, 0x0020
   145ac:	6e9f 0029 b7a3      	.insn	6, 0xb7a300296e9f
   145b2:	ffd2                	.insn	2, 0xffd2
   145b4:	ffc7a44b          	.insn	4, 0xffc7a44b
   145b8:	ba6d                	.insn	2, 0xba6d
   145ba:	fff9                	.insn	2, 0xfff9
   145bc:	3409                	.insn	2, 0x3409
   145be:	ffda                	.insn	2, 0xffda
   145c0:	c282                	.insn	2, 0xc282
   145c2:	fff5                	.insn	2, 0xfff5
   145c4:	ffed4113          	xori	sp,s10,-2
   145c8:	ffffa63b          	.insn	4, 0xffffa63b
   145cc:	ffec09f7          	.insn	4, 0xffec09f7
   145d0:	2bdd                	.insn	2, 0x2bdd
   145d2:	fffa                	.insn	2, 0xfffa
   145d4:	95d4                	.insn	2, 0x95d4
   145d6:	0014                	.insn	2, 0x0014
   145d8:	001c4563          	blt	s8,ra,145e2 <zetas+0x182>
   145dc:	2c62                	.insn	2, 0x2c62
   145de:	ffea                	.insn	2, 0xffea
   145e0:	fbe9                	.insn	2, 0xfbe9
   145e2:	ffcc                	.insn	2, 0xffcc
   145e4:	0af0                	.insn	2, 0x0af0
   145e6:	0004                	.insn	2, 0x0004
   145e8:	0007c417          	auipc	s0,0x7c
   145ec:	4588                	.insn	2, 0x4588
   145ee:	ad00002f          	.insn	4, 0xad00002f
   145f2:	0000                	.insn	2, 0x0000
   145f4:	36be                	.insn	2, 0x36be
   145f6:	cd44ffef          	jal	t6,fff63aca <__stack_top+0xfff44ace>
   145fa:	000d                	.insn	2, 0x000d
   145fc:	675a                	.insn	2, 0x675a
   145fe:	003c                	.insn	2, 0x003c
   14600:	2bca                	.insn	2, 0x2bca
   14602:	de7effc7          	.insn	4, 0xde7effc7
   14606:	ffff                	.insn	2, 0xffff
   14608:	3948                	.insn	2, 0x3948
   1460a:	0019                	.insn	2, 0x0019
   1460c:	69c0                	.insn	2, 0x69c0
   1460e:	ffce                	.insn	2, 0xffce
   14610:	756c                	.insn	2, 0x756c
   14612:	0024                	.insn	2, 0x0024
   14614:	c7df fffc 98a1      	.insn	6, 0x98a1fffcc7df
   1461a:	e808000b          	.insn	4, 0xe808000b
   1461e:	e46cffeb          	.insn	4, 0xe46cffeb
   14622:	0002                	.insn	2, 0x0002
   14624:	c808                	.insn	2, 0xc808
   14626:	ffc9                	.insn	2, 0xffc9
   14628:	36c2                	.insn	2, 0x36c2
   1462a:	0030                	.insn	2, 0x0030
   1462c:	bff6                	.insn	2, 0xbff6
   1462e:	3c93ffe3          	bgeu	t2,s1,1520c <fromhost+0x1fc>
   14632:	4ae0ffdb          	.insn	4, 0x4ae0ffdb
   14636:	fffd                	.insn	2, 0xfffd
   14638:	1305                	.insn	2, 0x1305
   1463a:	0014                	.insn	2, 0x0014
   1463c:	7792                	.insn	2, 0x7792
   1463e:	0014                	.insn	2, 0x0014
   14640:	9e25                	.insn	2, 0x9e25
   14642:	d0e00013          	li	zero,-754
   14646:	9944ffe7          	.insn	4, 0x9944ffe7
   1464a:	0802fff3          	.insn	4, 0x0802fff3
   1464e:	ffea                	.insn	2, 0xffea
   14650:	eea2                	.insn	2, 0xeea2
   14652:	ffd1                	.insn	2, 0xffd1
   14654:	c79c                	.insn	2, 0xc79c
   14656:	ffc4                	.insn	2, 0xffc4
   14658:	ffc8a057          	.insn	4, 0xffc8a057
   1465c:	97d9                	.insn	2, 0x97d9
   1465e:	003a                	.insn	2, 0x003a
   14660:	001fea93          	ori	s5,t6,1
   14664:	ff5a                	.insn	2, 0xff5a
   14666:	58d40033          	.insn	4, 0x58d40033
   1466a:	41f80023          	sb	t6,1024(a6)
   1466e:	003a                	.insn	2, 0x003a
   14670:	ff72                	.insn	2, 0xff72
   14672:	ffcc                	.insn	2, 0xffcc
   14674:	00223dfb          	.insn	4, 0x00223dfb
   14678:	ab9f ffda a422      	.insn	6, 0xa422ffdaab9f
   1467e:	ffc9                	.insn	2, 0xffc9
   14680:	12f5                	.insn	2, 0x12f5
   14682:	0004                	.insn	2, 0x0004
   14684:	00252587          	.insn	4, 0x00252587
   14688:	24f0                	.insn	2, 0x24f0
   1468a:	ffed                	.insn	2, 0xffed
   1468c:	9b5d                	.insn	2, 0x9b5d
   1468e:	0035                	.insn	2, 0x0035
   14690:	48a0                	.insn	2, 0x48a0
   14692:	ffca                	.insn	2, 0xffca
   14694:	a2fc                	.insn	2, 0xa2fc
   14696:	ffc6                	.insn	2, 0xffc6
   14698:	bb56                	.insn	2, 0xbb56
   1469a:	ffed                	.insn	2, 0xffed
   1469c:	45de                	.insn	2, 0x45de
   1469e:	be5effcf          	.insn	4, 0xbe5effcf
   146a2:	000d                	.insn	2, 0x000d
   146a4:	5e1a                	.insn	2, 0x5e1a
   146a6:	001c                	.insn	2, 0x001c
   146a8:	e0e6                	.insn	2, 0xe0e6
   146aa:	000d                	.insn	2, 0x000d
   146ac:	7f5a                	.insn	2, 0x7f5a
   146ae:	000c                	.insn	2, 0x000c
   146b0:	00078f83          	lb	t6,0(a5)
   146b4:	628a                	.insn	2, 0x628a
   146b6:	5704ffe7          	.insn	4, 0x5704ffe7
   146ba:	ffff                	.insn	2, 0xffff
   146bc:	06fc                	.insn	2, 0x06fc
   146be:	fff8                	.insn	2, 0xfff8
   146c0:	0021                	.insn	2, 0x0021
   146c2:	fff6                	.insn	2, 0xfff6
   146c4:	5af6                	.insn	2, 0x5af6
   146c6:	ffd0                	.insn	2, 0xffd0
   146c8:	0084                	.insn	2, 0x0084
   146ca:	001f ef86 0030      	.insn	6, 0x0030ef86001f
   146d0:	b97d                	.insn	2, 0xb97d
   146d2:	ffc9                	.insn	2, 0xffc9
   146d4:	fcd6                	.insn	2, 0xfcd6
   146d6:	4592fff7          	.insn	4, 0x4592fff7
   146da:	fff4                	.insn	2, 0xfff4
   146dc:	21c2                	.insn	2, 0x21c2
   146de:	ffc9                	.insn	2, 0xffc9
   146e0:	3919                	.insn	2, 0x3919
   146e2:	0005                	.insn	2, 0x0005
   146e4:	610c                	.insn	2, 0x610c
   146e6:	0004                	.insn	2, 0x0004
   146e8:	cd41                	.insn	2, 0xcd41
   146ea:	ffda                	.insn	2, 0xffda
   146ec:	003eb01b          	.insn	4, 0x003eb01b
   146f0:	003472e7          	.insn	4, 0x003472e7
   146f4:	ffcd003b          	.insn	4, 0xffcd003b
   146f8:	001a7cc7          	.insn	4, 0x001a7cc7
   146fc:	1924                	.insn	2, 0x1924
   146fe:	5ee50003          	lb	zero,1518(a0)
   14702:	1199002b          	.insn	4, 0x1199002b
   14706:	0029                	.insn	2, 0x0029
   14708:	7a3a                	.insn	2, 0x7a3a
   1470a:	ffd8                	.insn	2, 0xffd8
   1470c:	4d71                	.insn	2, 0x4d71
   1470e:	e11c0013          	addi	zero,s8,-495
   14712:	003d                	.insn	2, 0x003d
   14714:	0984                	.insn	2, 0x0984
   14716:	f0510013          	addi	zero,sp,-251
   1471a:	0025                	.insn	2, 0x0025
   1471c:	5a46                	.insn	2, 0x5a46
   1471e:	0018                	.insn	2, 0x0018
   14720:	8518                	.insn	2, 0x8518
   14722:	ffc6                	.insn	2, 0xffc6
   14724:	14be                	.insn	2, 0x14be
   14726:	38910013          	addi	zero,sp,905
   1472a:	0028                	.insn	2, 0x0028
   1472c:	db90                	.insn	2, 0xdb90
   1472e:	ffc9                	.insn	2, 0xffc9
   14730:	5089                	.insn	2, 0x5089
   14732:	ffd2                	.insn	2, 0xffd2
   14734:	001c853f 001d0b4b 	.insn	8, 0x001d0b4b001c853f
   1473c:	f6a6                	.insn	2, 0xf6a6
   1473e:	a8beffef          	jal	t6,41c8 <_start-0xbe38>
   14742:	e11bffeb          	.insn	4, 0xe11bffeb
   14746:	0012                	.insn	2, 0x0012
   14748:	5e3e                	.insn	2, 0x5e3e
   1474a:	ffcd                	.insn	2, 0xffcd
   1474c:	ffea2d2f          	.insn	4, 0xffea2d2f
   14750:	1de4                	.insn	2, 0x1de4
   14752:	fff9                	.insn	2, 0xfff9
   14754:	001406c7          	.insn	4, 0x001406c7
   14758:	00327283          	.insn	4, 0x00327283
   1475c:	0d6e                	.insn	2, 0x0d6e
   1475e:	ffe2                	.insn	2, 0xffe2
   14760:	ffec7953          	.insn	4, 0xffec7953
   14764:	4099                	.insn	2, 0x4099
   14766:	001d                	.insn	2, 0x001d
   14768:	2578                	.insn	2, 0x2578
   1476a:	ffd9                	.insn	2, 0xffd9
   1476c:	05ad                	.insn	2, 0x05ad
   1476e:	e405ffeb          	.insn	4, 0xe405ffeb
   14772:	0016                	.insn	2, 0x0016
   14774:	000bdbe7          	.insn	4, 0x000bdbe7
   14778:	1de8                	.insn	2, 0x1de8
   1477a:	0022                	.insn	2, 0x0022
   1477c:	0033f8cf          	.insn	4, 0x0033f8cf
   14780:	b934                	.insn	2, 0xb934
   14782:	ca0cfff7          	.insn	4, 0xca0cfff7
   14786:	ffd4                	.insn	2, 0xffd4
   14788:	7ff8                	.insn	2, 0x7ff8
   1478a:	ffe6                	.insn	2, 0xffe6
   1478c:	ffe3d157          	.insn	4, 0xffe3d157
   14790:	ffd8911b          	.insn	4, 0xffd8911b
   14794:	2c12                	.insn	2, 0x2c12
   14796:	10d8ffc7          	.insn	4, 0x10d8ffc7
   1479a:	0009                	.insn	2, 0x0009
   1479c:	5e1f ffc6 4658      	.insn	6, 0x4658ffc65e1f
   147a2:	ffe1                	.insn	2, 0xffe1
   147a4:	00251d8b          	.insn	4, 0x00251d8b
   147a8:	002573b7          	lui	t2,0x257
   147ac:	fffd7c8f          	.insn	4, 0xfffd7c8f
   147b0:	dd98                	.insn	2, 0xdd98
   147b2:	001d                	.insn	2, 0x001d
   147b4:	6898                	.insn	2, 0x6898
   147b6:	d4bb0033          	.insn	4, 0xd4bb0033
   147ba:	0002                	.insn	2, 0x0002
   147bc:	ffed93a7          	.insn	4, 0xffed93a7
   147c0:	6cbe                	.insn	2, 0x6cbe
   147c2:	7c1cffcf          	.insn	4, 0x7c1cffcf
   147c6:	0002                	.insn	2, 0x0002
   147c8:	aa08                	.insn	2, 0xaa08
   147ca:	0018                	.insn	2, 0x0018
   147cc:	fd71                	.insn	2, 0xfd71
   147ce:	002d                	.insn	2, 0x002d
   147d0:	5ca5                	.insn	2, 0x5ca5
   147d2:	000c                	.insn	2, 0x000c
   147d4:	379a                	.insn	2, 0x379a
   147d6:	0019                	.insn	2, 0x0019
   147d8:	ffc7a167          	.insn	4, 0xffc7a167
   147dc:	8c3d                	.insn	2, 0x8c3d
   147de:	ffe4                	.insn	2, 0xffe4
   147e0:	a13c                	.insn	2, 0xa13c
   147e2:	ffd1                	.insn	2, 0xffd1
   147e4:	c539                	.insn	2, 0xc539
   147e6:	0035                	.insn	2, 0x0035
   147e8:	0115                	.insn	2, 0x0115
   147ea:	1dc0003b          	.insn	4, 0x1dc0003b
   147ee:	0004                	.insn	2, 0x0004
   147f0:	0021c4f7          	.insn	4, 0x0021c4f7
   147f4:	1bf4                	.insn	2, 0x1bf4
   147f6:	fff1                	.insn	2, 0xfff1
   147f8:	001a35e7          	.insn	4, 0x001a35e7
   147fc:	340e                	.insn	2, 0x340e
   147fe:	7d450007          	.insn	4, 0x7d450007
   14802:	fff9                	.insn	2, 0xfff9
   14804:	4cd0                	.insn	2, 0x4cd0
   14806:	001a                	.insn	2, 0x001a
   14808:	7cae                	.insn	2, 0x7cae
   1480a:	ffe4                	.insn	2, 0xffe4
   1480c:	2668                	.insn	2, 0x2668
   1480e:	001d                	.insn	2, 0x001d
   14810:	8e98                	.insn	2, 0x8e98
   14812:	ffe6                	.insn	2, 0xffe6
   14814:	ffef2633          	.insn	4, 0xffef2633
   14818:	05da                	.insn	2, 0x05da
   1481a:	fffc                	.insn	2, 0xfffc
   1481c:	ffc57fdb          	.insn	4, 0xffc57fdb
   14820:	2764                	.insn	2, 0x2764
   14822:	e1afffd3          	.insn	4, 0xe1afffd3
   14826:	ffdd                	.insn	2, 0xffdd
   14828:	93dd                	.insn	2, 0x93dd
   1482a:	fff9                	.insn	2, 0xfff9
   1482c:	1d09                	.insn	2, 0x1d09
   1482e:	ffdd                	.insn	2, 0xffdd
   14830:	0002cc93          	xori	s9,t0,0
   14834:	1805                	.insn	2, 0x1805
   14836:	fff1                	.insn	2, 0xfff1
   14838:	9c2a                	.insn	2, 0x9c2a
   1483a:	0018                	.insn	2, 0x0018
   1483c:	e5a9                	.insn	2, 0xe5a9
   1483e:	ffc9                	.insn	2, 0xffc9
   14840:	8a50                	.insn	2, 0x8a50
   14842:	cf2cfff7          	.insn	4, 0xcf2cfff7
   14846:	434e003b          	.insn	4, 0x434e003b
   1484a:	ffff                	.insn	2, 0xffff
   1484c:	36df ffeb 15ca      	.insn	6, 0x15caffeb36df
   14852:	003c                	.insn	2, 0x003c
   14854:	5e68                	.insn	2, 0x5e68
   14856:	0015                	.insn	2, 0x0015
   14858:	16b6                	.insn	2, 0x16b6
   1485a:	29cefff3          	.insn	4, 0x29cefff3
   1485e:	001e                	.insn	2, 0x001e

00014860 <KeccakF_RoundConstants>:
   14860:	0001                	.insn	2, 0x0001
   14862:	0000                	.insn	2, 0x0000
   14864:	0000                	.insn	2, 0x0000
   14866:	0000                	.insn	2, 0x0000
   14868:	8082                	.insn	2, 0x8082
   1486a:	0000                	.insn	2, 0x0000
   1486c:	0000                	.insn	2, 0x0000
   1486e:	0000                	.insn	2, 0x0000
   14870:	808a                	.insn	2, 0x808a
   14872:	0000                	.insn	2, 0x0000
   14874:	0000                	.insn	2, 0x0000
   14876:	8000                	.insn	2, 0x8000
   14878:	8000                	.insn	2, 0x8000
   1487a:	8000                	.insn	2, 0x8000
   1487c:	0000                	.insn	2, 0x0000
   1487e:	8000                	.insn	2, 0x8000
   14880:	0000808b          	.insn	4, 0x808b
   14884:	0000                	.insn	2, 0x0000
   14886:	0000                	.insn	2, 0x0000
   14888:	0001                	.insn	2, 0x0001
   1488a:	8000                	.insn	2, 0x8000
   1488c:	0000                	.insn	2, 0x0000
   1488e:	0000                	.insn	2, 0x0000
   14890:	8081                	.insn	2, 0x8081
   14892:	8000                	.insn	2, 0x8000
   14894:	0000                	.insn	2, 0x0000
   14896:	8000                	.insn	2, 0x8000
   14898:	8009                	.insn	2, 0x8009
   1489a:	0000                	.insn	2, 0x0000
   1489c:	0000                	.insn	2, 0x0000
   1489e:	8000                	.insn	2, 0x8000
   148a0:	008a                	.insn	2, 0x008a
   148a2:	0000                	.insn	2, 0x0000
   148a4:	0000                	.insn	2, 0x0000
   148a6:	0000                	.insn	2, 0x0000
   148a8:	0088                	.insn	2, 0x0088
   148aa:	0000                	.insn	2, 0x0000
   148ac:	0000                	.insn	2, 0x0000
   148ae:	0000                	.insn	2, 0x0000
   148b0:	8009                	.insn	2, 0x8009
   148b2:	8000                	.insn	2, 0x8000
   148b4:	0000                	.insn	2, 0x0000
   148b6:	0000                	.insn	2, 0x0000
   148b8:	000a                	.insn	2, 0x000a
   148ba:	8000                	.insn	2, 0x8000
   148bc:	0000                	.insn	2, 0x0000
   148be:	0000                	.insn	2, 0x0000
   148c0:	8000808b          	.insn	4, 0x8000808b
   148c4:	0000                	.insn	2, 0x0000
   148c6:	0000                	.insn	2, 0x0000
   148c8:	0000008b          	.insn	4, 0x008b
   148cc:	0000                	.insn	2, 0x0000
   148ce:	8000                	.insn	2, 0x8000
   148d0:	8089                	.insn	2, 0x8089
   148d2:	0000                	.insn	2, 0x0000
   148d4:	0000                	.insn	2, 0x0000
   148d6:	8000                	.insn	2, 0x8000
   148d8:	00008003          	lb	zero,0(ra)
   148dc:	0000                	.insn	2, 0x0000
   148de:	8000                	.insn	2, 0x8000
   148e0:	8002                	.insn	2, 0x8002
   148e2:	0000                	.insn	2, 0x0000
   148e4:	0000                	.insn	2, 0x0000
   148e6:	8000                	.insn	2, 0x8000
   148e8:	0080                	.insn	2, 0x0080
   148ea:	0000                	.insn	2, 0x0000
   148ec:	0000                	.insn	2, 0x0000
   148ee:	8000                	.insn	2, 0x8000
   148f0:	800a                	.insn	2, 0x800a
   148f2:	0000                	.insn	2, 0x0000
   148f4:	0000                	.insn	2, 0x0000
   148f6:	0000                	.insn	2, 0x0000
   148f8:	000a                	.insn	2, 0x000a
   148fa:	8000                	.insn	2, 0x8000
   148fc:	0000                	.insn	2, 0x0000
   148fe:	8000                	.insn	2, 0x8000
   14900:	8081                	.insn	2, 0x8081
   14902:	8000                	.insn	2, 0x8000
   14904:	0000                	.insn	2, 0x0000
   14906:	8000                	.insn	2, 0x8000
   14908:	8080                	.insn	2, 0x8080
   1490a:	0000                	.insn	2, 0x0000
   1490c:	0000                	.insn	2, 0x0000
   1490e:	8000                	.insn	2, 0x8000
   14910:	0001                	.insn	2, 0x0001
   14912:	8000                	.insn	2, 0x8000
   14914:	0000                	.insn	2, 0x0000
   14916:	0000                	.insn	2, 0x0000
   14918:	8008                	.insn	2, 0x8008
   1491a:	8000                	.insn	2, 0x8000
   1491c:	0000                	.insn	2, 0x0000
   1491e:	8000                	.insn	2, 0x8000

Disassembly of section .eh_frame:

00014920 <.eh_frame>:
   14920:	0010                	.insn	2, 0x0010
   14922:	0000                	.insn	2, 0x0000
   14924:	0000                	.insn	2, 0x0000
   14926:	0000                	.insn	2, 0x0000
   14928:	00527a03          	.insn	4, 0x00527a03
   1492c:	7c01                	.insn	2, 0x7c01
   1492e:	0101                	.insn	2, 0x0101
   14930:	00020c1b          	.insn	4, 0x00020c1b
   14934:	0010                	.insn	2, 0x0010
   14936:	0000                	.insn	2, 0x0000
   14938:	0018                	.insn	2, 0x0018
   1493a:	0000                	.insn	2, 0x0000
   1493c:	b6c4                	.insn	2, 0xb6c4
   1493e:	ffff                	.insn	2, 0xffff
   14940:	0020                	.insn	2, 0x0020
   14942:	0000                	.insn	2, 0x0000
   14944:	0000                	.insn	2, 0x0000
	...

Disassembly of section .tohost:

00015000 <tohost>:
	...

00015010 <fromhost>:
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
   8:	01007663          	bgeu	zero,a6,14 <_start-0xffec>
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
