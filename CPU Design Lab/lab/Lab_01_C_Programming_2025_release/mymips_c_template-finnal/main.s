	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	oddspreg
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.globl	delay
.LFB1 = .
	.file 1 "main.c"
	.loc 1 33 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	delay
	.type	delay, @function
delay:
	.frame	$sp,8,$31		# vars= 8, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	.cfi_def_cfa_offset 8
	.loc 1 35 0
	sw	$0,0($sp)
	lw	$3,0($sp)
	li	$2,983040			# 0xf0000
	addiu	$2,$2,16960
	sltu	$2,$3,$2
	beq	$2,$0,.L1
	nop

	.loc 1 35 0 is_stmt 0 discriminator 3
	li	$3,983040			# 0xf0000
	addiu	$3,$3,16960
.L4:
	lw	$2,0($sp)
	addiu	$2,$2,1
	sw	$2,0($sp)
	lw	$2,0($sp)
	sltu	$2,$2,$3
	bne	$2,$0,.L4
	nop

.L1:
	.loc 1 36 0 is_stmt 1
	jr	$31
	addiu	$sp,$sp,8

	.cfi_def_cfa_offset 0
	.set	macro
	.set	reorder
	.end	delay
	.cfi_endproc
.LFE1:
	.size	delay, .-delay
	.align	2
	.globl	main
.LFB0 = .
	.loc 1 6 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,1064,$31		# vars= 1032, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-1064
	.cfi_def_cfa_offset 1064
	sw	$31,1060($sp)
	sw	$17,1056($sp)
	sw	$16,1052($sp)
	.cfi_offset 31, -4
	.cfi_offset 17, -8
	.cfi_offset 16, -12
	.loc 1 9 0
	sw	$0,20($sp)
	.loc 1 10 0
	li	$2,1			# 0x1
	sw	$2,24($sp)
.LBB2 = .
	.loc 1 14 0
	li	$16,-1082130432			# 0xffffffffbf800000
	.loc 1 16 0
	li	$17,2			# 0x2
.L12:
	.loc 1 14 0
	lw	$2,4($16)
	andi	$2,$2,0x00ff
	sb	$2,16($sp)
	.loc 1 15 0
	lbu	$2,16($sp)
	andi	$2,$2,0x00ff
	sw	$2,16($16)
	.loc 1 16 0
	sw	$17,1044($sp)
	.loc 1 17 0
	lbu	$2,16($sp)
	andi	$2,$2,0x00ff
	sltu	$2,$2,2
	bne	$2,$0,.L8
	nop

	.loc 1 18 0
	sw	$17,1044($sp)
	lbu	$2,16($sp)
	andi	$2,$2,0x00ff
	lw	$3,1044($sp)
	slt	$2,$2,$3
	bne	$2,$0,.L8
	nop

.L14:
	.loc 1 19 0 discriminator 3
	lw	$3,1044($sp)
	lw	$2,1044($sp)
	addiu	$2,$2,-1
	sll	$2,$2,2
	addiu	$4,$sp,16
	addu	$2,$4,$2
	lw	$4,4($2)
	lw	$2,1044($sp)
	addiu	$2,$2,-2
	sll	$2,$2,2
	addiu	$5,$sp,16
	addu	$2,$5,$2
	lw	$2,4($2)
	addu	$4,$2,$4
	sll	$2,$3,2
	addu	$2,$5,$2
	sw	$4,4($2)
	.loc 1 18 0 discriminator 3
	lw	$2,1044($sp)
	addiu	$2,$2,1
	sw	$2,1044($sp)
	lbu	$2,16($sp)
	andi	$2,$2,0x00ff
	lw	$3,1044($sp)
	slt	$2,$2,$3
	beq	$2,$0,.L14
	nop

.L8:
	.loc 1 22 0
	sw	$0,1044($sp)
	.loc 1 24 0
	sw	$0,1044($sp)
	lbu	$2,16($sp)
	andi	$2,$2,0x00ff
	lw	$3,1044($sp)
	slt	$2,$2,$3
	bne	$2,$0,.L12
	nop

.L13:
	.loc 1 25 0 discriminator 3
	lw	$2,1044($sp)
	sll	$2,$2,2
	addiu	$3,$sp,16
	addu	$2,$3,$2
	lw	$2,4($2)
	sw	$2,0($16)
	.loc 1 26 0 discriminator 3
	jal	delay
	nop

.LVL0 = .
	.loc 1 24 0 discriminator 3
	lw	$2,1044($sp)
	addiu	$2,$2,1
	sw	$2,1044($sp)
	lbu	$2,16($sp)
	andi	$2,$2,0x00ff
	lw	$3,1044($sp)
	slt	$2,$2,$3
	beq	$2,$0,.L13
	nop

	b	.L12
	nop

.LBE2 = .
	.set	macro
	.set	reorder
	.end	main
	.cfi_endproc
.LFE0:
	.size	main, .-main
.Letext0:
	.file 2 "c:\\progra~1\\imagination technologies\\toolchains\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\machine\\_default_types.h"
	.file 3 "c:\\progra~1\\imagination technologies\\toolchains\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x136
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF14
	.byte	0x1
	.4byte	.LASF15
	.4byte	.LASF16
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x1c
	.4byte	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x38
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x3
	.4byte	.LASF10
	.byte	0x3
	.byte	0x2a
	.4byte	0x2c
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x3
	.byte	0x42
	.4byte	0x53
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x5
	.4byte	.LASF17
	.byte	0x1
	.byte	0x21
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb9
	.uleb128 0x6
	.ascii	"j\000"
	.byte	0x1
	.byte	0x22
	.4byte	0xb9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x7
	.4byte	0x90
	.uleb128 0x8
	.4byte	.LASF18
	.byte	0x1
	.byte	0x6
	.4byte	0x89
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x113
	.uleb128 0x6
	.ascii	"n\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x113
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1048
	.uleb128 0x6
	.ascii	"fib\000"
	.byte	0x1
	.byte	0x8
	.4byte	0x12f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -1044
	.uleb128 0x9
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x6
	.ascii	"i\000"
	.byte	0x1
	.byte	0x10
	.4byte	0x134
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xa
	.4byte	.LVL0
	.4byte	0x97
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	0x73
	.uleb128 0xb
	.4byte	0x7e
	.4byte	0x128
	.uleb128 0xc
	.4byte	0x128
	.byte	0xff
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x7
	.4byte	0x118
	.uleb128 0x7
	.4byte	0x89
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF5:
	.ascii	"__uint8_t\000"
.LASF17:
	.ascii	"delay\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF6:
	.ascii	"__uint32_t\000"
.LASF16:
	.ascii	"C:\\Users\\Lenovo\\Desktop\\mymips_c_template\000"
.LASF18:
	.ascii	"main\000"
.LASF14:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF12:
	.ascii	"unsigned int\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF10:
	.ascii	"uint8_t\000"
.LASF13:
	.ascii	"sizetype\000"
.LASF8:
	.ascii	"long long int\000"
.LASF15:
	.ascii	"main.c\000"
.LASF2:
	.ascii	"short int\000"
.LASF11:
	.ascii	"uint32_t\000"
.LASF4:
	.ascii	"long int\000"
.LASF0:
	.ascii	"signed char\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
