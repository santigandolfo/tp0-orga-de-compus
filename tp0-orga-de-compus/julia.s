	.file	1 "julia.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	multiplicarComplejos
	.ent	multiplicarComplejos
multiplicarComplejos:
	.frame	$fp,32,$31		# vars= 16, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,32
	.cprestore 0
	sw	$fp,28($sp)
	sw	$28,24($sp)
	move	$fp,$sp
	move	$3,$4
	sw	$6,40($fp)
	sw	$7,44($fp)
	l.d	$f2,40($fp)
	l.d	$f0,56($fp)
	mul.d	$f4,$f2,$f0
	l.d	$f2,48($fp)
	l.d	$f0,64($fp)
	mul.d	$f0,$f2,$f0
	sub.d	$f0,$f4,$f0
	s.d	$f0,8($fp)
	l.d	$f2,40($fp)
	l.d	$f0,64($fp)
	mul.d	$f4,$f2,$f0
	l.d	$f2,48($fp)
	l.d	$f0,56($fp)
	mul.d	$f0,$f2,$f0
	add.d	$f0,$f4,$f0
	s.d	$f0,16($fp)
	lw	$2,8($fp)
	sw	$2,0($3)
	lw	$2,12($fp)
	sw	$2,4($3)
	lw	$2,16($fp)
	sw	$2,8($3)
	lw	$2,20($fp)
	sw	$2,12($3)
	move	$2,$3
	move	$sp,$fp
	lw	$fp,28($sp)
	addu	$sp,$sp,32
	j	$31
	.end	multiplicarComplejos
	.size	multiplicarComplejos, .-multiplicarComplejos
	.align	2
	.globl	sumarComplejos
	.ent	sumarComplejos
sumarComplejos:
	.frame	$fp,32,$31		# vars= 16, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,32
	.cprestore 0
	sw	$fp,28($sp)
	sw	$28,24($sp)
	move	$fp,$sp
	move	$3,$4
	sw	$6,40($fp)
	sw	$7,44($fp)
	l.d	$f2,40($fp)
	l.d	$f0,56($fp)
	add.d	$f0,$f2,$f0
	s.d	$f0,8($fp)
	l.d	$f2,48($fp)
	l.d	$f0,64($fp)
	add.d	$f0,$f2,$f0
	s.d	$f0,16($fp)
	lw	$2,8($fp)
	sw	$2,0($3)
	lw	$2,12($fp)
	sw	$2,4($3)
	lw	$2,16($fp)
	sw	$2,8($3)
	lw	$2,20($fp)
	sw	$2,12($3)
	move	$2,$3
	move	$sp,$fp
	lw	$fp,28($sp)
	addu	$sp,$sp,32
	j	$31
	.end	sumarComplejos
	.size	sumarComplejos, .-sumarComplejos
	.rdata
	.align	3
$LC0:
	.word	0
	.word	1106247680
	.align	3
$LC1:
	.word	0
	.word	1073741824
	.align	3
$LC2:
	.word	0
	.word	1071644672
	.text
	.align	2
	.globl	encontrarComplejo
	.ent	encontrarComplejo
encontrarComplejo:
	.frame	$fp,96,$31		# vars= 80, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,96
	.cprestore 0
	sw	$fp,92($sp)
	sw	$28,88($sp)
	move	$fp,$sp
	sw	$4,96($fp)
	sw	$5,100($fp)
	sw	$6,104($fp)
	l.s	$f0,100($fp)
	cvt.d.w	$f2,$f0
	s.d	$f2,56($fp)
	lw	$2,100($fp)
	bgez	$2,$L20
	l.d	$f0,$LC0
	l.d	$f4,56($fp)
	add.d	$f4,$f4,$f0
	s.d	$f4,56($fp)
$L20:
	l.d	$f0,112($fp)
	l.d	$f2,56($fp)
	div.d	$f0,$f0,$f2
	s.d	$f0,40($fp)
	l.s	$f0,104($fp)
	cvt.d.w	$f4,$f0
	s.d	$f4,64($fp)
	lw	$2,104($fp)
	bgez	$2,$L21
	l.d	$f0,$LC0
	l.d	$f2,64($fp)
	add.d	$f2,$f2,$f0
	s.d	$f2,64($fp)
$L21:
	l.d	$f0,120($fp)
	l.d	$f4,64($fp)
	div.d	$f0,$f0,$f4
	s.d	$f0,48($fp)
	l.d	$f2,112($fp)
	l.d	$f0,$LC1
	div.d	$f2,$f2,$f0
	l.d	$f0,136($fp)
	sub.d	$f0,$f0,$f2
	s.d	$f0,8($fp)
	l.d	$f2,120($fp)
	l.d	$f0,$LC1
	div.d	$f2,$f2,$f0
	l.d	$f0,144($fp)
	add.d	$f0,$f0,$f2
	s.d	$f0,16($fp)
	l.s	$f0,132($fp)
	cvt.d.w	$f2,$f0
	s.d	$f2,72($fp)
	lw	$2,132($fp)
	bgez	$2,$L22
	l.d	$f0,$LC0
	l.d	$f4,72($fp)
	add.d	$f4,$f4,$f0
	s.d	$f4,72($fp)
$L22:
	l.d	$f0,$LC2
	l.d	$f4,72($fp)
	add.d	$f2,$f4,$f0
	l.d	$f0,48($fp)
	mul.d	$f2,$f2,$f0
	l.d	$f0,16($fp)
	sub.d	$f0,$f0,$f2
	s.d	$f0,32($fp)
	l.s	$f0,128($fp)
	cvt.d.w	$f2,$f0
	s.d	$f2,80($fp)
	lw	$2,128($fp)
	bgez	$2,$L23
	l.d	$f0,$LC0
	l.d	$f4,80($fp)
	add.d	$f4,$f4,$f0
	s.d	$f4,80($fp)
$L23:
	l.d	$f0,$LC2
	l.d	$f4,80($fp)
	add.d	$f2,$f4,$f0
	l.d	$f0,40($fp)
	mul.d	$f2,$f2,$f0
	l.d	$f0,8($fp)
	add.d	$f0,$f0,$f2
	s.d	$f0,24($fp)
	lw	$2,24($fp)
	lw	$3,96($fp)
	sw	$2,0($3)
	lw	$2,28($fp)
	lw	$3,96($fp)
	sw	$2,4($3)
	lw	$2,32($fp)
	lw	$3,96($fp)
	sw	$2,8($3)
	lw	$2,36($fp)
	lw	$3,96($fp)
	sw	$2,12($3)
	lw	$2,96($fp)
	move	$sp,$fp
	lw	$fp,92($sp)
	addu	$sp,$sp,96
	j	$31
	.end	encontrarComplejo
	.size	encontrarComplejo, .-encontrarComplejo
	.rdata
	.align	2
$LC3:
	.ascii	"manual.txt\000"
	.align	2
$LC4:
	.ascii	"r\000"
	.align	2
$LC5:
	.ascii	"Error al abrir el fichero\n\000"
	.align	2
$LC6:
	.ascii	"%c\000"
	.text
	.align	2
	.globl	imprimirManual
	.ent	imprimirManual
imprimirManual:
	.frame	$fp,56,$31		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$31,48($sp)
	sw	$fp,44($sp)
	sw	$28,40($sp)
	move	$fp,$sp
	la	$4,$LC3
	la	$5,$LC4
	la	$25,fopen
	jal	$31,$25
	sw	$2,24($fp)
	la	$4,$LC3
	la	$5,$LC4
	la	$25,fopen
	jal	$31,$25
	sw	$2,32($fp)
	lw	$2,32($fp)
	bne	$2,$0,$L27
	la	$4,$LC5
	la	$25,printf
	jal	$31,$25
	b	$L24
$L27:
	lw	$2,32($fp)
	lhu	$2,12($2)
	srl	$2,$2,5
	andi	$2,$2,0x1
	beq	$2,$0,$L29
	b	$L24
$L29:
	lw	$3,32($fp)
	lw	$2,32($fp)
	lw	$2,4($2)
	addu	$2,$2,-1
	sw	$2,4($3)
	bgez	$2,$L30
	lw	$4,32($fp)
	la	$25,__srget
	jal	$31,$25
	sw	$2,36($fp)
	b	$L31
$L30:
	lw	$2,32($fp)
	lw	$3,0($2)
	move	$4,$3
	lbu	$4,0($4)
	sw	$4,36($fp)
	addu	$3,$3,1
	sw	$3,0($2)
$L31:
	la	$4,$LC6
	lw	$5,36($fp)
	la	$25,printf
	jal	$31,$25
	b	$L27
$L24:
	move	$sp,$fp
	lw	$31,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$31
	.end	imprimirManual
	.size	imprimirManual, .-imprimirManual
	.align	2
	.globl	esValida
	.ent	esValida
esValida:
	.frame	$fp,24,$31		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$28,16($sp)
	move	$fp,$sp
	sw	$4,24($fp)
	sw	$5,28($fp)
	sw	$0,8($fp)
	lw	$2,28($fp)
	beq	$2,$0,$L33
	lw	$2,24($fp)
	beq	$2,$0,$L33
	li	$2,1			# 0x1
	sw	$2,8($fp)
$L33:
	lw	$2,8($fp)
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$31
	.end	esValida
	.size	esValida, .-esValida
	.align	2
	.globl	modulo
	.ent	modulo
modulo:
	.frame	$fp,40,$31		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$31,32($sp)
	sw	$fp,28($sp)
	sw	$28,24($sp)
	move	$fp,$sp
	sw	$4,40($fp)
	sw	$5,44($fp)
	sw	$6,48($fp)
	sw	$7,52($fp)
	l.d	$f2,40($fp)
	l.d	$f0,40($fp)
	mul.d	$f4,$f2,$f0
	l.d	$f2,48($fp)
	l.d	$f0,48($fp)
	mul.d	$f0,$f2,$f0
	add.d	$f0,$f4,$f0
	mov.d	$f12,$f0
	la	$25,sqrt
	jal	$31,$25
	move	$sp,$fp
	lw	$31,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$31
	.end	modulo
	.size	modulo, .-modulo
	.rdata
	.align	2
$LC7:
	.ascii	",\000"
	.text
	.align	2
	.globl	comma_to_dot
	.ent	comma_to_dot
comma_to_dot:
	.frame	$fp,48,$31		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$31,40($sp)
	sw	$fp,36($sp)
	sw	$28,32($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	sw	$0,24($fp)
$L36:
	lw	$4,48($fp)
	la	$5,$LC7
	la	$25,strpbrk
	jal	$31,$25
	sw	$2,24($fp)
	lw	$2,24($fp)
	bne	$2,$0,$L38
	b	$L35
$L38:
	lw	$3,24($fp)
	li	$2,46			# 0x2e
	sb	$2,0($3)
	b	$L36
$L35:
	move	$sp,$fp
	lw	$31,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$31
	.end	comma_to_dot
	.size	comma_to_dot, .-comma_to_dot
	.rdata
	.align	2
$LC8:
	.ascii	"640x480\000"
	.align	2
$LC9:
	.ascii	"0+0i\000"
	.align	2
$LC10:
	.ascii	"0,285+0,01i\000"
	.align	2
$LC11:
	.ascii	"4\000"
	.align	2
$LC12:
	.ascii	"-\000"
	.data
	.align	2
$LC13:
	.word	$LC8
	.word	$LC9
	.word	$LC10
	.word	$LC11
	.word	$LC11
	.word	$LC12
	.rdata
	.align	2
$LC14:
	.ascii	"-r\000"
	.align	2
$LC15:
	.ascii	"-c\000"
	.align	2
$LC16:
	.ascii	"-C\000"
	.align	2
$LC17:
	.ascii	"-w\000"
	.align	2
$LC18:
	.ascii	"-H\000"
	.align	2
$LC19:
	.ascii	"-o\000"
	.align	2
$LC20:
	.ascii	"No se reconoce el comando %s, el manual de uso sera impr"
	.ascii	"eso a continuacion\000"
	.align	2
$LC21:
	.ascii	"Ancho invalido\000"
	.align	2
$LC22:
	.ascii	"\n\000"
	.align	2
$LC23:
	.ascii	"Alto invalido\000"
	.align	2
$LC24:
	.ascii	"x\000"
	.align	2
$LC25:
	.ascii	"Resolucion invalida\000"
	.align	2
$LC26:
	.ascii	"No se puede interpretar este centro\000"
	.align	2
$LC27:
	.ascii	"+\000"
	.align	2
$LC28:
	.ascii	"No se puede interpretar este paramentro c\000"
	.align	2
$LC29:
	.ascii	"w\000"
	.align	2
$LC30:
	.ascii	"Resolucion: %u x %u \n\000"
	.align	2
$LC31:
	.ascii	"Centro: (%f,%f) \n\000"
	.align	2
$LC32:
	.ascii	"Zc: (%f,%f) \n\000"
	.align	2
$LC34:
	.ascii	"%u \000"
	.align	3
$LC33:
	.word	0
	.word	1073741824
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,256,$31		# vars= 176, regs= 3/0, args= 56, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,256
	.cprestore 56
	sw	$31,248($sp)
	sw	$fp,244($sp)
	sw	$28,240($sp)
	move	$fp,$sp
	sw	$4,256($fp)
	sw	$5,260($fp)
	lw	$2,$LC13
	sw	$2,64($fp)
	lw	$2,$LC13+4
	sw	$2,68($fp)
	lw	$2,$LC13+8
	sw	$2,72($fp)
	lw	$2,$LC13+12
	sw	$2,76($fp)
	lw	$2,$LC13+16
	sw	$2,80($fp)
	lw	$2,$LC13+20
	sw	$2,84($fp)
	li	$2,1			# 0x1
	sw	$2,88($fp)
$L40:
	lw	$2,88($fp)
	lw	$3,256($fp)
	sltu	$2,$2,$3
	bne	$2,$0,$L42
	b	$L41
$L42:
	sw	$0,100($fp)
	lw	$2,88($fp)
	sll	$3,$2,2
	lw	$2,260($fp)
	addu	$2,$3,$2
	lw	$4,0($2)
	la	$5,$LC14
	la	$25,strcmp
	jal	$31,$25
	bne	$2,$0,$L43
	lw	$2,88($fp)
	sll	$3,$2,2
	lw	$2,260($fp)
	addu	$2,$3,$2
	addu	$2,$2,4
	lw	$2,0($2)
	sw	$2,64($fp)
	li	$2,1			# 0x1
	sw	$2,100($fp)
	lw	$2,88($fp)
	addu	$2,$2,1
	sw	$2,88($fp)
$L43:
	lw	$2,88($fp)
	sll	$3,$2,2
	lw	$2,260($fp)
	addu	$2,$3,$2
	lw	$4,0($2)
	la	$5,$LC15
	la	$25,strcmp
	jal	$31,$25
	bne	$2,$0,$L44
	lw	$2,88($fp)
	sll	$3,$2,2
	lw	$2,260($fp)
	addu	$2,$3,$2
	addu	$2,$2,4
	lw	$2,0($2)
	sw	$2,68($fp)
	li	$2,1			# 0x1
	sw	$2,100($fp)
	lw	$2,88($fp)
	addu	$2,$2,1
	sw	$2,88($fp)
$L44:
	lw	$2,88($fp)
	sll	$3,$2,2
	lw	$2,260($fp)
	addu	$2,$3,$2
	lw	$4,0($2)
	la	$5,$LC16
	la	$25,strcmp
	jal	$31,$25
	bne	$2,$0,$L45
	lw	$2,88($fp)
	sll	$3,$2,2
	lw	$2,260($fp)
	addu	$2,$3,$2
	addu	$2,$2,4
	lw	$2,0($2)
	sw	$2,72($fp)
	li	$2,1			# 0x1
	sw	$2,100($fp)
	lw	$2,88($fp)
	addu	$2,$2,1
	sw	$2,88($fp)
$L45:
	lw	$2,88($fp)
	sll	$3,$2,2
	lw	$2,260($fp)
	addu	$2,$3,$2
	lw	$4,0($2)
	la	$5,$LC17
	la	$25,strcmp
	jal	$31,$25
	bne	$2,$0,$L46
	lw	$2,88($fp)
	sll	$3,$2,2
	lw	$2,260($fp)
	addu	$2,$3,$2
	addu	$2,$2,4
	lw	$2,0($2)
	sw	$2,76($fp)
	li	$2,1			# 0x1
	sw	$2,100($fp)
	lw	$2,88($fp)
	addu	$2,$2,1
	sw	$2,88($fp)
$L46:
	lw	$2,88($fp)
	sll	$3,$2,2
	lw	$2,260($fp)
	addu	$2,$3,$2
	lw	$4,0($2)
	la	$5,$LC18
	la	$25,strcmp
	jal	$31,$25
	bne	$2,$0,$L47
	lw	$2,88($fp)
	sll	$3,$2,2
	lw	$2,260($fp)
	addu	$2,$3,$2
	addu	$2,$2,4
	lw	$2,0($2)
	sw	$2,80($fp)
	li	$2,1			# 0x1
	sw	$2,100($fp)
	lw	$2,88($fp)
	addu	$2,$2,1
	sw	$2,88($fp)
$L47:
	lw	$2,88($fp)
	sll	$3,$2,2
	lw	$2,260($fp)
	addu	$2,$3,$2
	lw	$4,0($2)
	la	$5,$LC19
	la	$25,strcmp
	jal	$31,$25
	bne	$2,$0,$L48
	lw	$2,88($fp)
	sll	$3,$2,2
	lw	$2,260($fp)
	addu	$2,$3,$2
	addu	$2,$2,4
	lw	$2,0($2)
	sw	$2,84($fp)
	li	$2,1			# 0x1
	sw	$2,100($fp)
	lw	$2,88($fp)
	addu	$2,$2,1
	sw	$2,88($fp)
$L48:
	lw	$2,100($fp)
	bne	$2,$0,$L49
	lw	$2,88($fp)
	sll	$3,$2,2
	lw	$2,260($fp)
	addu	$2,$3,$2
	la	$4,$LC20
	lw	$5,0($2)
	la	$25,printf
	jal	$31,$25
	la	$25,imprimirManual
	jal	$31,$25
	li	$4,-1			# 0xffffffffffffffff
	la	$25,exit
	jal	$31,$25
$L49:
	lw	$2,88($fp)
	addu	$2,$2,1
	sw	$2,88($fp)
	b	$L40
$L41:
	lw	$4,76($fp)
	la	$25,atof
	jal	$31,$25
	s.d	$f0,112($fp)
	l.d	$f2,112($fp)
	mtc1	$0,$f0
	mtc1	$0,$f1
	c.lt.d	$f0,$f2
	bc1t	$L50
	la	$4,$LC21
	la	$25,printf
	jal	$31,$25
	la	$4,$LC22
	la	$25,printf
	jal	$31,$25
	li	$4,-1			# 0xffffffffffffffff
	la	$25,exit
	jal	$31,$25
$L50:
	lw	$4,80($fp)
	la	$25,atof
	jal	$31,$25
	s.d	$f0,120($fp)
	l.d	$f2,120($fp)
	mtc1	$0,$f0
	mtc1	$0,$f1
	c.lt.d	$f0,$f2
	bc1t	$L51
	la	$4,$LC23
	la	$25,printf
	jal	$31,$25
	la	$4,$LC22
	la	$25,printf
	jal	$31,$25
	li	$4,-1			# 0xffffffffffffffff
	la	$25,exit
	jal	$31,$25
$L51:
	li	$4,30			# 0x1e
	la	$25,malloc
	jal	$31,$25
	sw	$2,196($fp)
	lw	$4,196($fp)
	lw	$5,64($fp)
	la	$25,strcpy
	jal	$31,$25
	la	$2,$LC24
	sw	$2,200($fp)
	lw	$4,196($fp)
	lw	$5,200($fp)
	la	$25,strtok
	jal	$31,$25
	sw	$2,184($fp)
	move	$4,$0
	lw	$5,200($fp)
	la	$25,strtok
	jal	$31,$25
	sw	$2,188($fp)
	lw	$4,196($fp)
	la	$25,free
	jal	$31,$25
	lw	$4,184($fp)
	la	$25,atoi
	jal	$31,$25
	sw	$2,176($fp)
	lw	$4,188($fp)
	la	$25,atoi
	jal	$31,$25
	sw	$2,180($fp)
	lw	$4,176($fp)
	lw	$5,180($fp)
	la	$25,esValida
	jal	$31,$25
	bne	$2,$0,$L52
	la	$4,$LC25
	la	$25,printf
	jal	$31,$25
	la	$4,$LC22
	la	$25,printf
	jal	$31,$25
	li	$4,-1			# 0xffffffffffffffff
	la	$25,exit
	jal	$31,$25
$L52:
	li	$4,30			# 0x1e
	la	$25,malloc
	jal	$31,$25
	sw	$2,212($fp)
	lw	$4,212($fp)
	lw	$5,68($fp)
	la	$25,strcpy
	jal	$31,$25
	lw	$4,68($fp)
	la	$25,strlen
	jal	$31,$25
	move	$3,$2
	lw	$2,68($fp)
	addu	$2,$3,$2
	addu	$2,$2,-1
	lb	$3,0($2)
	li	$2,105			# 0x69
	bne	$3,$2,$L54
	lw	$4,68($fp)
	la	$25,strlen
	jal	$31,$25
	sltu	$2,$2,4
	bne	$2,$0,$L54
	b	$L53
$L54:
	la	$4,$LC26
	la	$25,printf
	jal	$31,$25
	la	$4,$LC22
	la	$25,printf
	jal	$31,$25
	li	$4,-1			# 0xffffffffffffffff
	la	$25,exit
	jal	$31,$25
$L53:
	lw	$4,212($fp)
	la	$5,$LC27
	la	$25,strtok
	jal	$31,$25
	sw	$2,204($fp)
	move	$4,$0
	la	$5,$LC27
	la	$25,strtok
	jal	$31,$25
	sw	$2,208($fp)
	lw	$2,208($fp)
	beq	$2,$0,$L55
	lw	$4,208($fp)
	la	$25,strlen
	jal	$31,$25
	move	$3,$2
	lw	$2,208($fp)
	addu	$2,$3,$2
	addu	$2,$2,-1
	sb	$0,0($2)
$L55:
	lw	$2,208($fp)
	bne	$2,$0,$L56
	lw	$4,212($fp)
	la	$5,$LC12
	la	$25,strtok
	jal	$31,$25
	sw	$2,204($fp)
	move	$4,$0
	la	$5,$LC12
	la	$25,strtok
	jal	$31,$25
	sw	$2,208($fp)
	lw	$4,208($fp)
	la	$25,strlen
	jal	$31,$25
	addu	$3,$2,-1
	lw	$2,208($fp)
	addu	$2,$2,1
	move	$4,$2
	lw	$5,208($fp)
	move	$6,$3
	la	$25,memmove
	jal	$31,$25
	lw	$4,208($fp)
	la	$5,$LC12
	li	$6,1			# 0x1
	la	$25,memmove
	jal	$31,$25
	lw	$2,68($fp)
	lb	$3,0($2)
	li	$2,45			# 0x2d
	bne	$3,$2,$L56
	lw	$4,204($fp)
	la	$25,strlen
	jal	$31,$25
	lw	$3,204($fp)
	addu	$3,$3,1
	move	$4,$3
	lw	$5,204($fp)
	move	$6,$2
	la	$25,memmove
	jal	$31,$25
	lw	$4,204($fp)
	la	$5,$LC12
	li	$6,1			# 0x1
	la	$25,memmove
	jal	$31,$25
$L56:
	lw	$4,204($fp)
	la	$25,comma_to_dot
	jal	$31,$25
	lw	$4,208($fp)
	la	$25,comma_to_dot
	jal	$31,$25
	lw	$4,212($fp)
	la	$25,free
	jal	$31,$25
	lw	$4,204($fp)
	la	$25,atof
	jal	$31,$25
	s.d	$f0,160($fp)
	lw	$4,208($fp)
	la	$25,atof
	jal	$31,$25
	s.d	$f0,168($fp)
	lw	$4,72($fp)
	la	$25,strlen
	jal	$31,$25
	move	$3,$2
	lw	$2,72($fp)
	addu	$2,$3,$2
	addu	$2,$2,-1
	lb	$3,0($2)
	li	$2,105			# 0x69
	bne	$3,$2,$L59
	lw	$4,72($fp)
	la	$25,strlen
	jal	$31,$25
	sltu	$2,$2,4
	bne	$2,$0,$L59
	b	$L58
$L59:
	la	$4,$LC28
	la	$25,printf
	jal	$31,$25
	la	$4,$LC22
	la	$25,printf
	jal	$31,$25
	li	$4,-1			# 0xffffffffffffffff
	la	$25,exit
	jal	$31,$25
$L58:
	li	$4,30			# 0x1e
	la	$25,malloc
	jal	$31,$25
	sw	$2,224($fp)
	lw	$4,224($fp)
	lw	$5,72($fp)
	la	$25,strcpy
	jal	$31,$25
	lw	$4,224($fp)
	la	$5,$LC27
	la	$25,strtok
	jal	$31,$25
	sw	$2,216($fp)
	move	$4,$0
	la	$5,$LC27
	la	$25,strtok
	jal	$31,$25
	sw	$2,220($fp)
	lw	$2,220($fp)
	beq	$2,$0,$L60
	lw	$4,220($fp)
	la	$25,strlen
	jal	$31,$25
	move	$3,$2
	lw	$2,220($fp)
	addu	$2,$3,$2
	addu	$2,$2,-1
	sb	$0,0($2)
$L60:
	lw	$2,220($fp)
	bne	$2,$0,$L61
	lw	$4,224($fp)
	la	$5,$LC12
	la	$25,strtok
	jal	$31,$25
	sw	$2,216($fp)
	move	$4,$0
	la	$5,$LC12
	la	$25,strtok
	jal	$31,$25
	sw	$2,220($fp)
	lw	$4,220($fp)
	la	$25,strlen
	jal	$31,$25
	addu	$3,$2,-1
	lw	$2,220($fp)
	addu	$2,$2,1
	move	$4,$2
	lw	$5,220($fp)
	move	$6,$3
	la	$25,memmove
	jal	$31,$25
	lw	$4,220($fp)
	la	$5,$LC12
	li	$6,1			# 0x1
	la	$25,memmove
	jal	$31,$25
	lw	$2,72($fp)
	lb	$3,0($2)
	li	$2,45			# 0x2d
	bne	$3,$2,$L61
	lw	$4,216($fp)
	la	$25,strlen
	jal	$31,$25
	lw	$3,216($fp)
	addu	$3,$3,1
	move	$4,$3
	lw	$5,216($fp)
	move	$6,$2
	la	$25,memmove
	jal	$31,$25
	lw	$4,216($fp)
	la	$5,$LC12
	li	$6,1			# 0x1
	la	$25,memmove
	jal	$31,$25
$L61:
	lw	$4,216($fp)
	la	$25,comma_to_dot
	jal	$31,$25
	lw	$4,220($fp)
	la	$25,comma_to_dot
	jal	$31,$25
	lw	$4,224($fp)
	la	$25,free
	jal	$31,$25
	lw	$4,216($fp)
	la	$25,atof
	jal	$31,$25
	s.d	$f0,144($fp)
	lw	$4,220($fp)
	la	$25,atof
	jal	$31,$25
	s.d	$f0,152($fp)
	lw	$4,84($fp)
	la	$5,$LC12
	la	$25,strcmp
	jal	$31,$25
	beq	$2,$0,$L63
	lw	$4,84($fp)
	la	$5,$LC29
	la	$25,fopen
	jal	$31,$25
	sw	$2,104($fp)
	b	$L64
$L63:
	la	$2,__sF+88
	sw	$2,104($fp)
$L64:
	la	$4,$LC30
	lw	$5,176($fp)
	lw	$6,180($fp)
	la	$25,printf
	jal	$31,$25
	l.d	$f0,168($fp)
	s.d	$f0,16($sp)
	la	$4,$LC31
	lw	$6,160($fp)
	lw	$7,164($fp)
	la	$25,printf
	jal	$31,$25
	l.d	$f0,152($fp)
	s.d	$f0,16($sp)
	la	$4,$LC32
	lw	$6,144($fp)
	lw	$7,148($fp)
	la	$25,printf
	jal	$31,$25
	lw	$4,104($fp)
	lw	$5,176($fp)
	lw	$6,180($fp)
	la	$25,escribirPrologo
	jal	$31,$25
	sw	$0,88($fp)
$L65:
	lw	$2,88($fp)
	lw	$3,180($fp)
	sltu	$2,$2,$3
	bne	$2,$0,$L68
	b	$L66
$L68:
	sw	$0,92($fp)
$L69:
	lw	$2,92($fp)
	lw	$3,176($fp)
	sltu	$2,$2,$3
	bne	$2,$0,$L72
	b	$L70
$L72:
	lw	$2,92($fp)
	sw	$2,232($fp)
	lw	$2,88($fp)
	sw	$2,236($fp)
	addu	$3,$fp,128
	l.d	$f0,112($fp)
	s.d	$f0,16($sp)
	l.d	$f0,120($fp)
	s.d	$f0,24($sp)
	lw	$2,232($fp)
	sw	$2,32($sp)
	lw	$2,236($fp)
	sw	$2,36($sp)
	lw	$2,160($fp)
	sw	$2,40($sp)
	lw	$2,164($fp)
	sw	$2,44($sp)
	lw	$2,168($fp)
	sw	$2,48($sp)
	lw	$2,172($fp)
	sw	$2,52($sp)
	move	$4,$3
	lw	$5,176($fp)
	lw	$6,180($fp)
	la	$25,encontrarComplejo
	jal	$31,$25
	sw	$0,96($fp)
$L73:
	lw	$2,96($fp)
	sltu	$2,$2,255
	beq	$2,$0,$L74
	lw	$4,128($fp)
	lw	$5,132($fp)
	lw	$6,136($fp)
	lw	$7,140($fp)
	la	$25,modulo
	jal	$31,$25
	mov.d	$f2,$f0
	l.d	$f0,$LC33
	c.le.d	$f2,$f0
	bc1t	$L75
	b	$L74
$L75:
	addu	$3,$fp,128
	lw	$2,128($fp)
	sw	$2,24($sp)
	lw	$2,132($fp)
	sw	$2,28($sp)
	lw	$2,136($fp)
	sw	$2,32($sp)
	lw	$2,140($fp)
	sw	$2,36($sp)
	lw	$2,136($fp)
	sw	$2,16($sp)
	lw	$2,140($fp)
	sw	$2,20($sp)
	lw	$6,128($fp)
	lw	$7,132($fp)
	move	$4,$3
	la	$25,multiplicarComplejos
	jal	$31,$25
	addu	$3,$fp,128
	lw	$2,144($fp)
	sw	$2,24($sp)
	lw	$2,148($fp)
	sw	$2,28($sp)
	lw	$2,152($fp)
	sw	$2,32($sp)
	lw	$2,156($fp)
	sw	$2,36($sp)
	lw	$2,136($fp)
	sw	$2,16($sp)
	lw	$2,140($fp)
	sw	$2,20($sp)
	lw	$6,128($fp)
	lw	$7,132($fp)
	move	$4,$3
	la	$25,sumarComplejos
	jal	$31,$25
	lw	$2,96($fp)
	addu	$2,$2,1
	sw	$2,96($fp)
	b	$L73
$L74:
	lw	$4,104($fp)
	la	$5,$LC34
	lw	$6,96($fp)
	la	$25,fprintf
	jal	$31,$25
	lw	$2,92($fp)
	addu	$2,$2,1
	sw	$2,92($fp)
	b	$L69
$L70:
	la	$4,$LC22
	lw	$5,104($fp)
	la	$25,fputs
	jal	$31,$25
	lw	$2,88($fp)
	addu	$2,$2,1
	sw	$2,88($fp)
	b	$L65
$L66:
	lw	$4,104($fp)
	la	$25,fclose
	jal	$31,$25
	move	$sp,$fp
	lw	$31,248($sp)
	lw	$fp,244($sp)
	addu	$sp,$sp,256
	j	$31
	.end	main
	.size	main, .-main
	.rdata
	.align	2
$LC35:
	.ascii	"P2\n\000"
	.align	2
$LC36:
	.ascii	"%u %u\n\000"
	.align	2
$LC37:
	.ascii	"%i\n\000"
	.text
	.align	2
	.globl	escribirPrologo
	.ent	escribirPrologo
escribirPrologo:
	.frame	$fp,40,$31		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$31,32($sp)
	sw	$fp,28($sp)
	sw	$28,24($sp)
	move	$fp,$sp
	sw	$4,40($fp)
	sw	$5,44($fp)
	sw	$6,48($fp)
	la	$4,$LC35
	lw	$5,40($fp)
	la	$25,fputs
	jal	$31,$25
	lw	$4,40($fp)
	la	$5,$LC36
	lw	$6,44($fp)
	lw	$7,48($fp)
	la	$25,fprintf
	jal	$31,$25
	lw	$4,40($fp)
	la	$5,$LC37
	li	$6,255			# 0xff
	la	$25,fprintf
	jal	$31,$25
	move	$sp,$fp
	lw	$31,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$31
	.end	escribirPrologo
	.size	escribirPrologo, .-escribirPrologo
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
