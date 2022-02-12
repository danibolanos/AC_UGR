	.file	"daxpy.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Falta tama\303\261o de vector"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC13:
	.string	"Tiempo(seg.):%11.9f / / y[0]=%f, y[%i]=%f\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB14:
	.section	.text.startup,"ax",@progbits
.LHOTB14:
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
	subq	$64, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L48
	xorl	%edi, %edi
	movq	%rsi, %rbx
	call	time
	movl	%eax, %edi
	call	srand
	movq	8(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	movq	%rax, %rbx
	movl	%ebx, %r12d
	salq	$3, %r12
	call	rand
	movq	%r12, %rdi
	movl	%eax, %r13d
	call	malloc
	movq	%r12, %rdi
	movq	%rax, %rbp
	call	malloc
	testl	%ebx, %ebx
	movq	%rax, %r14
	je	.L3
	salq	$60, %rax
	shrq	$63, %rax
	cmpl	%ebx, %eax
	cmova	%ebx, %eax
	cmpl	$5, %ebx
	ja	.L49
	movl	%ebx, %eax
.L4:
	movsd	.LC1(%rip), %xmm7
	cmpl	$1, %eax
	movsd	%xmm7, (%r14)
	movsd	.LC2(%rip), %xmm7
	movsd	%xmm7, 0(%rbp)
	je	.L26
	movsd	.LC3(%rip), %xmm3
	cmpl	$2, %eax
	movsd	.LC4(%rip), %xmm4
	movsd	%xmm3, 8(%r14)
	movsd	%xmm4, 8(%rbp)
	je	.L27
	movsd	%xmm7, 16(%r14)
	cmpl	$3, %eax
	movsd	.LC5(%rip), %xmm7
	movsd	%xmm7, 16(%rbp)
	je	.L28
	movsd	%xmm4, 24(%r14)
	cmpl	$5, %eax
	movsd	.LC6(%rip), %xmm4
	movsd	%xmm4, 24(%rbp)
	jne	.L29
	movsd	%xmm7, 32(%r14)
	movl	$5, %edx
	movsd	.LC7(%rip), %xmm7
	movsd	%xmm7, 32(%rbp)
.L6:
	cmpl	%eax, %ebx
	leal	-1(%rbx), %r12d
	je	.L7
.L5:
	movl	%ebx, %r8d
	leal	-1(%rbx), %r12d
	movl	%eax, %ecx
	subl	%eax, %r8d
	leal	-4(%r8), %esi
	movl	%r12d, %edi
	subl	%eax, %edi
	shrl	$2, %esi
	addl	$1, %esi
	cmpl	$2, %edi
	leal	0(,%rsi,4), %r9d
	jbe	.L8
	movl	%edx, 12(%rsp)
	leaq	0(,%rcx,8), %rax
	xorl	%edi, %edi
	movd	12(%rsp), %xmm3
	movdqa	.LC9(%rip), %xmm5
	leaq	(%r14,%rax), %rcx
	addq	%rbp, %rax
	pshufd	$0, %xmm3, %xmm0
	movdqa	.LC10(%rip), %xmm4
	movdqa	.LC11(%rip), %xmm3
	paddd	.LC8(%rip), %xmm0
.L9:
	movdqa	%xmm0, %xmm1
	movdqa	%xmm0, %xmm6
	paddd	%xmm3, %xmm0
	addl	$1, %edi
	addq	$32, %rcx
	addq	$32, %rax
	paddd	%xmm4, %xmm1
	cvtdq2pd	%xmm1, %xmm2
	pshufd	$238, %xmm1, %xmm1
	movaps	%xmm2, -32(%rcx)
	paddd	%xmm5, %xmm6
	cvtdq2pd	%xmm1, %xmm1
	movaps	%xmm1, -16(%rcx)
	cvtdq2pd	%xmm0, %xmm1
	pshufd	$238, %xmm0, %xmm0
	movups	%xmm1, -32(%rax)
	cvtdq2pd	%xmm0, %xmm0
	movups	%xmm0, -16(%rax)
	cmpl	%esi, %edi
	jnb	.L50
	movdqa	%xmm6, %xmm0
	jmp	.L9
.L50:
	addl	%r9d, %edx
	cmpl	%r9d, %r8d
	je	.L7
.L8:
	pxor	%xmm0, %xmm0
	leal	1(%rdx), %eax
	movslq	%edx, %rsi
	leal	3(%rdx), %ecx
	cmpl	%eax, %ebx
	cvtsi2sd	%eax, %xmm0
	movsd	%xmm0, (%r14,%rsi,8)
	pxor	%xmm0, %xmm0
	cvtsi2sd	%ecx, %xmm0
	movsd	%xmm0, 0(%rbp,%rsi,8)
	jbe	.L7
	pxor	%xmm1, %xmm1
	movslq	%eax, %rcx
	leal	2(%rdx), %eax
	leal	4(%rdx), %esi
	cmpl	%eax, %ebx
	cvtsi2sd	%eax, %xmm1
	movsd	%xmm1, (%r14,%rcx,8)
	pxor	%xmm1, %xmm1
	cvtsi2sd	%esi, %xmm1
	movsd	%xmm1, 0(%rbp,%rcx,8)
	jbe	.L7
	cltq
	addl	$5, %edx
	movsd	%xmm0, (%r14,%rax,8)
	pxor	%xmm0, %xmm0
	cvtsi2sd	%edx, %xmm0
	movsd	%xmm0, 0(%rbp,%rax,8)
.L7:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	%rbp, %rax
	pxor	%xmm1, %xmm1
	salq	$60, %rax
	movl	%ebx, %edx
	shrq	$63, %rax
	cmpl	%ebx, %eax
	cvtsi2sd	%r13d, %xmm1
	cmova	%ebx, %eax
	cmpl	$3, %ebx
	ja	.L51
.L20:
	movsd	(%r14), %xmm0
	cmpl	$1, %edx
	mulsd	%xmm1, %xmm0
	addsd	0(%rbp), %xmm0
	movsd	%xmm0, 0(%rbp)
	je	.L31
	movsd	8(%r14), %xmm0
	cmpl	$3, %edx
	mulsd	%xmm1, %xmm0
	addsd	8(%rbp), %xmm0
	movsd	%xmm0, 8(%rbp)
	jne	.L32
	movsd	16(%r14), %xmm0
	movl	$3, %ecx
	mulsd	%xmm1, %xmm0
	addsd	16(%rbp), %xmm0
	movsd	%xmm0, 16(%rbp)
.L14:
	cmpl	%edx, %ebx
	je	.L19
	subl	%edx, %ebx
	movl	%edx, %edi
	leal	-2(%rbx), %esi
	shrl	%esi
	addl	$1, %esi
	cmpl	$1, %ebx
	leal	(%rsi,%rsi), %r9d
	jne	.L22
.L16:
	movslq	%ecx, %rcx
	mulsd	(%r14,%rcx,8), %xmm1
	leaq	0(%rbp,%rcx,8), %rax
	addsd	(%rax), %xmm1
	movsd	%xmm1, (%rax)
.L19:
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	movl	%r12d, %edx
	pxor	%xmm0, %xmm0
	movl	$.LC13, %esi
	pxor	%xmm1, %xmm1
	movl	$1, %edi
	movsd	0(%rbp,%rdx,8), %xmm2
	movl	%r12d, %edx
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$3, %eax
	divsd	.LC12(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	0(%rbp), %xmm1
	call	__printf_chk
	movq	%r14, %rdi
	call	free
	movq	%rbp, %rdi
	call	free
	xorl	%eax, %eax
	movq	56(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L52
	addq	$64, %rsp
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
.L31:
	.cfi_restore_state
	movl	$1, %ecx
	jmp	.L14
.L32:
	movl	$2, %ecx
	jmp	.L14
.L51:
	testl	%eax, %eax
	jne	.L53
	leal	-2(%rbx), %esi
	xorl	%ecx, %ecx
	xorl	%edi, %edi
	shrl	%esi
	addl	$1, %esi
	leal	(%rsi,%rsi), %r9d
.L22:
	movapd	%xmm1, %xmm2
	salq	$3, %rdi
	xorl	%eax, %eax
	leaq	0(%rbp,%rdi), %r8
	xorl	%edx, %edx
	addq	%r14, %rdi
	unpcklpd	%xmm2, %xmm2
.L17:
	movupd	(%rdi,%rax), %xmm0
	addl	$1, %edx
	mulpd	%xmm2, %xmm0
	addpd	(%r8,%rax), %xmm0
	movaps	%xmm0, (%r8,%rax)
	addq	$16, %rax
	cmpl	%edx, %esi
	ja	.L17
	addl	%r9d, %ecx
	cmpl	%r9d, %ebx
	jne	.L16
	jmp	.L19
.L49:
	xorl	%edx, %edx
	testl	%eax, %eax
	je	.L5
	movl	$1, %eax
	jmp	.L4
.L29:
	movl	$4, %edx
	jmp	.L6
.L26:
	movl	$1, %edx
	jmp	.L6
.L27:
	movl	$2, %edx
	jmp	.L6
.L28:
	movl	$3, %edx
	jmp	.L6
.L3:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	orl	$-1, %r12d
	call	clock_gettime
	jmp	.L19
.L53:
	movl	$1, %edx
	jmp	.L20
.L48:
	movl	$.LC0, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L52:
	call	__stack_chk_fail
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE14:
	.section	.text.startup
.LHOTE14:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	1074266112
	.align 8
.LC3:
	.long	0
	.long	1073741824
	.align 8
.LC4:
	.long	0
	.long	1074790400
	.align 8
.LC5:
	.long	0
	.long	1075052544
	.align 8
.LC6:
	.long	0
	.long	1075314688
	.align 8
.LC7:
	.long	0
	.long	1075576832
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC8:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC9:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC10:
	.long	1
	.long	1
	.long	1
	.long	1
	.align 16
.LC11:
	.long	3
	.long	3
	.long	3
	.long	3
	.section	.rodata.cst8
	.align 8
.LC12:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
