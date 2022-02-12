	.file	"daxpy.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Falta tama\303\261o de vector"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Tiempo(seg.):%11.9f / / y[0]=%f, y[%i]=%f\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB3:
	.section	.text.startup,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L14
	xorl	%edi, %edi
	movq	%rsi, %rbx
	call	time
	movl	%eax, %edi
	call	srand
	movq	8(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	movq	%rax, %rbp
	movl	%eax, %r14d
	movl	%ebp, %r13d
	salq	$3, %r13
	call	rand
	movq	%r13, %rdi
	movl	%eax, %r12d
	call	malloc
	movq	%r13, %rdi
	movq	%rax, %rbx
	call	malloc
	testl	%ebp, %ebp
	movq	%rax, %r13
	je	.L3
	movl	%ebp, %edx
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L4:
	pxor	%xmm0, %xmm0
	addl	$1, %eax
	leal	2(%rax), %esi
	cvtsi2sd	%eax, %xmm0
	movsd	%xmm0, 0(%r13,%rcx)
	pxor	%xmm0, %xmm0
	cvtsi2sd	%esi, %xmm0
	movsd	%xmm0, (%rbx,%rcx)
	addq	$8, %rcx
	cmpl	%edx, %eax
	jne	.L4
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	pxor	%xmm1, %xmm1
	xorl	%eax, %eax
	cvtsi2sd	%r12d, %xmm1
	.p2align 4,,10
	.p2align 3
.L5:
	movsd	0(%r13,%rax,8), %xmm0
	mulsd	%xmm1, %xmm0
	addsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, (%rbx,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %r14d
	ja	.L5
.L6:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	leal	-1(%rbp), %ecx
	pxor	%xmm0, %xmm0
	movl	$.LC2, %esi
	pxor	%xmm1, %xmm1
	movq	%rcx, %rdx
	movsd	(%rbx,%rcx,8), %xmm2
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$3, %eax
	divsd	.LC1(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	(%rbx), %xmm1
	call	__printf_chk
	movq	%r13, %rdi
	call	free
	movq	%rbx, %rdi
	call	free
	xorl	%eax, %eax
	movq	40(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L15
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	jmp	.L6
.L15:
	call	__stack_chk_fail
.L14:
	movl	$.LC0, %edi
	call	puts
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE3:
	.section	.text.startup
.LHOTE3:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
