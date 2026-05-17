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
	.loc 1 34 0
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
	.loc 1 37 0
	sw	$0,0($sp)
	lw	$3,0($sp)
	li	$2,851968			# 0xd0000
	ori	$2,$2,0xbba0
	sltu	$2,$3,$2
	beq	$2,$0,.L1
	nop

	.loc 1 37 0 is_stmt 0 discriminator 3
	li	$3,851968			# 0xd0000
	ori	$3,$3,0xbba0
.L4:
	lw	$2,0($sp)
	addiu	$2,$2,1
	sw	$2,0($sp)
	lw	$2,0($sp)
	sltu	$2,$2,$3
	bne	$2,$0,.L4
	nop

.L1:
	.loc 1 38 0 is_stmt 1
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
	.loc 1 13 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,48,$31		# vars= 16, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	.cfi_def_cfa_offset 48
	sw	$31,44($sp)
	sw	$17,40($sp)
	sw	$16,36($sp)
	.cfi_offset 31, -4
	.cfi_offset 17, -8
	.cfi_offset 16, -12
	.loc 1 18 0
	li	$17,1			# 0x1
	.loc 1 25 0
	li	$16,-1082130432			# 0xffffffffbf800000
.L10:
	.loc 1 18 0
	sw	$17,16($sp)
	sw	$0,20($sp)
	sw	$17,28($sp)
	.loc 1 19 0
	lw	$2,28($sp)
	slt	$2,$2,20
	beq	$2,$0,.L10
	nop

.L11:
	.loc 1 20 0
	lw	$2,28($sp)
	addiu	$2,$2,1
	sw	$2,28($sp)
	.loc 1 21 0
	lw	$2,16($sp)
	lw	$3,20($sp)
	addu	$2,$2,$3
	sw	$2,24($sp)
	.loc 1 22 0
	lw	$2,20($sp)
	sw	$2,16($sp)
	.loc 1 23 0
	lw	$2,24($sp)
	sw	$2,20($sp)
	.loc 1 25 0
	lw	$2,20($sp)
	sw	$2,0($16)
	.loc 1 26 0
	lw	$2,20($sp)
	sw	$2,16($16)
	.loc 1 28 0
	jal	delay
	nop

.LVL0 = .
	.loc 1 19 0
	lw	$2,28($sp)
	slt	$2,$2,20
	bne	$2,$0,.L11
	nop

	b	.L10
	nop

	.set	macro
	.set	reorder
	.end	main
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.globl	_mips_handle_exception
.LFB2 = .
	.loc 1 40 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	_mips_handle_exception
	.type	_mips_handle_exception, @function
_mips_handle_exception:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL1 = .
	.loc 1 41 0
	li	$3,32769			# 0x8001
	li	$2,-1082130432			# 0xffffffffbf800000
	sw	$3,0($2)
.L15:
	.loc 1 42 0 discriminator 1
	b	.L15
	nop

	.set	macro
	.set	reorder
	.end	_mips_handle_exception
	.cfi_endproc
.LFE2:
	.size	_mips_handle_exception, .-_mips_handle_exception
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xe7
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF5
	.byte	0x1
	.4byte	.LASF6
	.4byte	.LASF7
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF8
	.byte	0x1
	.byte	0x22
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x47
	.uleb128 0x3
	.ascii	"j\000"
	.byte	0x1
	.byte	0x23
	.4byte	0x47
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x4
	.4byte	0x4c
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0xd
	.4byte	0xac
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xac
	.uleb128 0x3
	.ascii	"old\000"
	.byte	0x1
	.byte	0xe
	.4byte	0xb3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.ascii	"cur\000"
	.byte	0x1
	.byte	0xe
	.4byte	0xb3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x7
	.4byte	.LASF0
	.byte	0x1
	.byte	0xe
	.4byte	0xb3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x3
	.ascii	"n\000"
	.byte	0x1
	.byte	0xe
	.4byte	0xb3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x8
	.4byte	.LVL0
	.4byte	0x25
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x4
	.4byte	0xac
	.uleb128 0xa
	.4byte	.LASF3
	.byte	0x1
	.byte	0x28
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe8
	.uleb128 0xb
	.ascii	"ctx\000"
	.byte	0x1
	.byte	0x28
	.4byte	0xe8
	.uleb128 0x1
	.byte	0x54
	.uleb128 0xc
	.4byte	.LASF4
	.byte	0x1
	.byte	0x28
	.4byte	0xac
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0xd
	.byte	0x4
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
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x8
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0x27
	.uleb128 0x19
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
	.uleb128 0xb
	.uleb128 0x5
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
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
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
.LASF1:
	.ascii	"unsigned int\000"
.LASF5:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF8:
	.ascii	"delay\000"
.LASF3:
	.ascii	"_mips_handle_exception\000"
.LASF4:
	.ascii	"reason\000"
.LASF6:
	.ascii	"main.c\000"
.LASF2:
	.ascii	"main\000"
.LASF0:
	.ascii	"temp\000"
.LASF7:
	.ascii	"D:\\2024-2025-2\\Computer_System_Design_and_Implementati"
	.ascii	"on\\Labs\\Lab_01_C_Programming_2025\\Fibonacci\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
