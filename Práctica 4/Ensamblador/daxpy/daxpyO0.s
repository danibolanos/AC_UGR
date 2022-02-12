	.file	"daxpy.c"
	.section	.rodata
.LC0:
	.string	"Falta tama\303\261o de vector"
	.align 8
.LC2:
	.string	"Tiempo(seg.):%11.9f / / y[0]=%f, y[%i]=%f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movl	%edi, -100(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$1, -100(%rbp)
	jg	.L2
	movl	$.LC0, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L2:
	movl	$0, %edi
	call	time
	movl	%eax, %edi
	call	srand
	movq	-112(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -80(%rbp)
	call	rand
	movl	%eax, -76(%rbp)
	movl	-80(%rbp), %eax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -72(%rbp)
	movl	-80(%rbp), %eax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -64(%rbp)
	movl	$0, -88(%rbp)
	jmp	.L3
.L4:
	movl	-88(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movl	-88(%rbp), %edx
	addl	$1, %edx
	pxor	%xmm0, %xmm0
	cvtsi2sd	%edx, %xmm0
	movsd	%xmm0, (%rax)
	movl	-88(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movl	-88(%rbp), %edx
	addl	$3, %edx
	pxor	%xmm0, %xmm0
	cvtsi2sd	%edx, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -88(%rbp)
.L3:
	movl	-88(%rbp), %eax
	cmpl	-80(%rbp), %eax
	jb	.L4
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movl	$0, -84(%rbp)
	jmp	.L5
.L6:
	movl	-84(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movl	-84(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-72(%rbp), %rdx
	addq	%rcx, %rdx
	movsd	(%rdx), %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sd	-76(%rbp), %xmm0
	movl	-84(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-64(%rbp), %rdx
	addq	%rcx, %rdx
	movsd	(%rdx), %xmm2
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -84(%rbp)
.L5:
	movl	-84(%rbp), %eax
	cmpl	-80(%rbp), %eax
	jb	.L6
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movq	-32(%rbp), %rdx
	movq	-48(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC1(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	movl	-80(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %eax
	leaq	0(,%rax,8), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movl	-80(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-72(%rbp), %rax
	movsd	(%rax), %xmm0
	movq	-56(%rbp), %rax
	movapd	%xmm1, %xmm2
	movl	%edx, %esi
	movapd	%xmm0, %xmm1
	movq	%rax, -120(%rbp)
	movsd	-120(%rbp), %xmm0
	movl	$.LC2, %edi
	movl	$3, %eax
	call	printf
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L8
	call	__stack_chk_fail
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
