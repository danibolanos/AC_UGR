	.file	"pmm-secuencial-modificado_a1.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Faltan no componentes del vector/matriz"
	.align 8
.LC1:
	.string	"La matriz no es m\303\272ltiplo del desenrollado de los bucles. Pruebe con un m\303\272ltiplo de 8."
	.align 8
.LC5:
	.string	"Tiempo(seg.):%11.9f\t / Tama\303\261o Matriz:%u\t/ M3[0][0]=%8.6f / / M3[%d][%d]=%8.6f /\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB6:
	.section	.text.startup,"ax",@progbits
.LHOTB6:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L20
	movq	8(%rsi), %rdi
	movq	%rsi, %rbx
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	testb	$7, %al
	jne	.L21
	movq	8(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movl	$8192, %edx
	cmpl	$8192, %eax
	cmovbe	%eax, %edx
	testl	%edx, %edx
	movl	%edx, 24(%rsp)
	je	.L4
	pxor	%xmm3, %xmm3
	leal	-1(%rdx), %ebp
	xorl	%eax, %eax
	movsd	.LC2(%rip), %xmm1
	xorl	%ecx, %ecx
	movl	%ebp, 28(%rsp)
	cvtsi2sd	%edx, %xmm3
	leaq	1(%rbp), %rdx
	mulsd	%xmm1, %xmm3
.L5:
	pxor	%xmm0, %xmm0
	movapd	%xmm3, %xmm2
	xorl	%ebx, %ebx
	cvtsi2sd	%ecx, %xmm0
	mulsd	%xmm1, %xmm0
	subsd	%xmm0, %xmm2
	.p2align 4,,10
	.p2align 3
.L6:
	pxor	%xmm0, %xmm0
	movapd	%xmm2, %xmm4
	movq	$0, M3(%rax,%rbx,8)
	cvtsi2sd	%ebx, %xmm0
	mulsd	%xmm1, %xmm0
	subsd	%xmm0, %xmm4
	movsd	%xmm4, M1(%rax,%rbx,8)
	movsd	%xmm4, M2(%rax,%rbx,8)
	addq	$1, %rbx
	cmpq	%rdx, %rbx
	jne	.L6
	addl	$1, %ecx
	addq	$65536, %rax
	cmpl	24(%rsp), %ecx
	jne	.L5
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	salq	$16, %rbx
	call	clock_gettime
	leaq	M1(%rbx), %rax
	movq	$M1, 8(%rsp)
	movq	$M3, 16(%rsp)
	movq	%rax, 32(%rsp)
	leaq	8(,%rbp,8), %rax
	movq	%rax, 40(%rsp)
.L8:
	movq	40(%rsp), %r12
	addq	8(%rsp), %r12
	movl	$M2, %r15d
	movq	16(%rsp), %r13
	movq	$-131072, %rdi
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L12:
	movq	8(%rsp), %rdx
	movl	$M2, %ecx
	movq	$-65536, %rbp
	movl	$65536, %ebx
	movl	$131072, %r11d
	movl	$196608, %r10d
	movl	$262144, %r9d
	movl	$327680, %r8d
	subq	%rdi, %rcx
	movsd	0(%r13), %xmm8
	movq	%r15, %rsi
	movsd	8(%r13), %xmm7
	subq	%rdi, %rbp
	movsd	16(%r13), %xmm6
	subq	%rdi, %rbx
	movsd	24(%r13), %xmm5
	subq	%rdi, %r11
	movsd	32(%r13), %xmm4
	subq	%rdi, %r10
	movsd	40(%r13), %xmm3
	subq	%rdi, %r9
	movsd	48(%r13), %xmm2
	subq	%rdi, %r8
	movsd	56(%r13), %xmm1
	.p2align 4,,10
	.p2align 3
.L9:
	movsd	(%rdx), %xmm0
	leaq	(%rdi,%rcx), %rax
	addq	$8, %rdx
	movsd	(%rsi), %xmm9
	addq	$8, %rcx
	addq	$65536, %rsi
	mulsd	%xmm0, %xmm9
	addsd	%xmm9, %xmm8
	movsd	(%rax,%rbp), %xmm9
	mulsd	%xmm0, %xmm9
	addsd	%xmm9, %xmm7
	movsd	-8(%rcx), %xmm9
	cmpq	%r12, %rdx
	mulsd	%xmm0, %xmm9
	addsd	%xmm9, %xmm6
	movsd	(%rax,%rbx), %xmm9
	mulsd	%xmm0, %xmm9
	addsd	%xmm9, %xmm5
	movsd	(%rax,%r11), %xmm9
	mulsd	%xmm0, %xmm9
	addsd	%xmm9, %xmm4
	movsd	(%rax,%r10), %xmm9
	mulsd	%xmm0, %xmm9
	addsd	%xmm9, %xmm3
	movsd	(%rax,%r9), %xmm9
	mulsd	%xmm0, %xmm9
	mulsd	(%rax,%r8), %xmm0
	addsd	%xmm9, %xmm2
	addsd	%xmm0, %xmm1
	jne	.L9
	movsd	%xmm8, 0(%r13)
	addl	$8, %r14d
	addq	$64, %r13
	movsd	%xmm7, -56(%r13)
	addq	$64, %r15
	subq	$524288, %rdi
	movsd	%xmm6, -48(%r13)
	movsd	%xmm5, -40(%r13)
	movsd	%xmm4, -32(%r13)
	movsd	%xmm3, -24(%r13)
	movsd	%xmm2, -16(%r13)
	movsd	%xmm1, -8(%r13)
	cmpl	%r14d, 24(%rsp)
	ja	.L12
	addq	$65536, 8(%rsp)
	addq	$65536, 16(%rsp)
	movq	8(%rsp), %rax
	cmpq	%rax, 32(%rsp)
	jne	.L8
.L11:
	leaq	64(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	72(%rsp), %rax
	subq	56(%rsp), %rax
	movl	$.LC5, %esi
	pxor	%xmm0, %xmm0
	movl	28(%rsp), %edi
	cvtsi2sdq	%rax, %xmm0
	movq	64(%rsp), %rax
	subq	48(%rsp), %rax
	movl	%edi, %edx
	movl	%edi, %r8d
	movq	%rdx, %rcx
	salq	$16, %rcx
	movsd	M3(%rcx,%rdx,8), %xmm2
	movl	24(%rsp), %edx
	movl	%edi, %ecx
	movl	$1, %edi
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	divsd	.LC4(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm0
	movl	$3, %eax
	addsd	%xmm1, %xmm0
	movsd	M3(%rip), %xmm1
	call	__printf_chk
	xorl	%eax, %eax
	movq	88(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L22
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L4:
	.cfi_restore_state
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movl	$-1, 28(%rsp)
	jmp	.L11
.L22:
	call	__stack_chk_fail
.L21:
	movl	$.LC1, %edi
	call	puts
	movl	$-1, %edi
	call	exit
.L20:
	movl	$.LC0, %edi
	call	puts
	movl	$-1, %edi
	call	exit
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE6:
	.section	.text.startup
.LHOTE6:
	.comm	M3,536870912,32
	.comm	M2,536870912,32
	.comm	M1,536870912,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	2576980378
	.long	1069128089
	.align 8
.LC4:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
