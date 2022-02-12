	.file	"pmm-secuencial-modificado_b2.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Faltan no componentes del vector/matriz"
	.align 8
.LC4:
	.string	"Tiempo(seg.):%11.9f\t / Tama\303\261o Matriz:%u\t/ M3[0][0]=%8.6f / / M3[%d][%d]=%8.6f /\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB5:
	.section	.text.startup,"ax",@progbits
.LHOTB5:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$56, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L27
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$8192, %ebx
	movl	$-1, %ebp
	call	strtol
	cmpl	$8192, %eax
	cmovbe	%eax, %ebx
	testl	%ebx, %ebx
	je	.L3
	pxor	%xmm3, %xmm3
	leal	-1(%rbx), %ecx
	xorl	%edx, %edx
	movsd	.LC1(%rip), %xmm1
	xorl	%esi, %esi
	movq	%rcx, %rbp
	addq	$1, %rcx
	cvtsi2sd	%ebx, %xmm3
	mulsd	%xmm1, %xmm3
.L4:
	pxor	%xmm0, %xmm0
	movapd	%xmm3, %xmm2
	xorl	%eax, %eax
	cvtsi2sd	%esi, %xmm0
	mulsd	%xmm1, %xmm0
	subsd	%xmm0, %xmm2
	.p2align 4,,10
	.p2align 3
.L5:
	pxor	%xmm0, %xmm0
	movapd	%xmm2, %xmm4
	movq	$0, M3(%rdx,%rax,8)
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm1, %xmm0
	subsd	%xmm0, %xmm4
	movsd	%xmm4, M1(%rdx,%rax,8)
	movsd	%xmm4, M2(%rdx,%rax,8)
	addq	$1, %rax
	cmpq	%rax, %rcx
	jne	.L5
	addl	$1, %esi
	addq	$65536, %rdx
	cmpl	%ebx, %esi
	jne	.L4
.L3:
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	xorl	%esi, %esi
	cmpl	%ebx, %esi
	je	.L28
.L10:
	leal	1(%rsi), %r8d
	cmpl	%r8d, %ebx
	jbe	.L9
	movq	%rsi, %rdi
	movl	%r8d, %edx
	salq	$13, %rdi
	.p2align 4,,10
	.p2align 3
.L8:
	movslq	%edx, %rax
	addl	$1, %edx
	leaq	(%rdi,%rax), %rcx
	salq	$13, %rax
	addq	%rsi, %rax
	cmpl	%edx, %ebx
	movsd	M2(,%rcx,8), %xmm0
	movsd	%xmm0, M2(,%rax,8)
	ja	.L8
.L9:
	movslq	%r8d, %rsi
	cmpl	%ebx, %esi
	jne	.L10
.L28:
	testl	%ebx, %ebx
	je	.L12
	movl	%ebp, %eax
	xorl	%esi, %esi
	leaq	1(%rax), %r8
	leaq	8(,%rax,8), %r9
	movq	%r8, %r10
	salq	$3, %r8
	salq	$16, %r10
.L15:
	leaq	M1(%rsi), %rdx
	leaq	M1(%rsi,%r9), %rcx
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L16:
	movsd	(%rdx), %xmm1
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L13:
	movsd	M2(%rdi,%rax), %xmm0
	mulsd	%xmm1, %xmm0
	addsd	M3(%rsi,%rax), %xmm0
	movsd	%xmm0, M3(%rsi,%rax)
	addq	$8, %rax
	cmpq	%rax, %r8
	jne	.L13
	addq	$8, %rdx
	addq	$65536, %rdi
	cmpq	%rcx, %rdx
	jne	.L16
	addq	$65536, %rsi
	cmpq	%rsi, %r10
	jne	.L15
.L12:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	movl	%ebp, %edx
	pxor	%xmm0, %xmm0
	movq	%rdx, %rcx
	salq	$16, %rcx
	movl	%ebp, %r8d
	movl	$.LC4, %esi
	movsd	M3(%rcx,%rdx,8), %xmm2
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	movl	%ebx, %edx
	movl	%ebp, %ecx
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	divsd	.LC3(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm0
	movl	$3, %eax
	addsd	%xmm1, %xmm0
	movsd	M3(%rip), %xmm1
	call	__printf_chk
	xorl	%eax, %eax
	movq	40(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L29
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L27:
	.cfi_restore_state
	movl	$.LC0, %edi
	call	puts
	movl	$-1, %edi
	call	exit
.L29:
	call	__stack_chk_fail
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE5:
	.section	.text.startup
.LHOTE5:
	.comm	M2T,536870912,32
	.comm	M3,536870912,32
	.comm	M2,536870912,32
	.comm	M1,536870912,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	2576980378
	.long	1069128089
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
