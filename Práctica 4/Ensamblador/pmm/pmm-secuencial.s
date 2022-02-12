	.file	"pmm-secuencial.c"
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
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L19
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$8192, %ebp
	call	strtol
	cmpl	$8192, %eax
	cmovbe	%eax, %ebp
	testl	%ebp, %ebp
	je	.L3
	pxor	%xmm3, %xmm3
	leal	-1(%rbp), %r13d
	xorl	%esi, %esi
	movsd	.LC1(%rip), %xmm1
	xorl	%edx, %edx
	leaq	1(%r13), %rbx
	movq	%r13, %r12
	cvtsi2sd	%ebp, %xmm3
	mulsd	%xmm1, %xmm3
.L4:
	pxor	%xmm0, %xmm0
	movapd	%xmm3, %xmm2
	xorl	%eax, %eax
	cvtsi2sd	%edx, %xmm0
	mulsd	%xmm1, %xmm0
	subsd	%xmm0, %xmm2
	.p2align 4,,10
	.p2align 3
.L5:
	pxor	%xmm0, %xmm0
	movapd	%xmm2, %xmm4
	movq	$0, M3(%rsi,%rax,8)
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm1, %xmm0
	subsd	%xmm0, %xmm4
	movsd	%xmm4, M1(%rsi,%rax,8)
	movsd	%xmm4, M2(%rsi,%rax,8)
	addq	$1, %rax
	cmpq	%rax, %rbx
	jne	.L5
	addl	$1, %edx
	addq	$65536, %rsi
	cmpl	%ebp, %edx
	jne	.L4
	movq	%rsp, %rsi
	xorl	%edi, %edi
	negq	%r13
	call	clock_gettime
	leaq	0(,%rbx,8), %rax
	salq	$16, %rbx
	leaq	-8(,%r13,8), %r10
	movl	$M1, %r8d
	leaq	M3(%rax,%rbx), %r11
	leaq	M3(%rax), %rcx
	movq	%r13, %rax
	salq	$16, %rax
	addq	$M2, %rbx
	leaq	-65536(%rax), %r9
.L7:
	leaq	(%r10,%rcx), %rdx
	movq	%rbx, %rdi
	.p2align 4,,10
	.p2align 3
.L11:
	movsd	(%rdx), %xmm1
	leaq	(%r9,%rdi), %rax
	movq	%r8, %rsi
	.p2align 4,,10
	.p2align 3
.L8:
	movsd	(%rsi), %xmm0
	addq	$65536, %rax
	addq	$8, %rsi
	mulsd	-65536(%rax), %xmm0
	cmpq	%rax, %rdi
	addsd	%xmm0, %xmm1
	jne	.L8
	movsd	%xmm1, (%rdx)
	addq	$8, %rdx
	addq	$8, %rdi
	cmpq	%rcx, %rdx
	jne	.L11
	addq	$65536, %rcx
	addq	$65536, %r8
	cmpq	%r11, %rcx
	jne	.L7
.L10:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	movl	%r12d, %edx
	pxor	%xmm0, %xmm0
	movq	%rdx, %rcx
	salq	$16, %rcx
	movl	%r12d, %r8d
	movl	$.LC4, %esi
	movsd	M3(%rcx,%rdx,8), %xmm2
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	movl	%r12d, %ecx
	movl	%ebp, %edx
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	divsd	.LC3(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm0
	movl	$3, %eax
	addsd	%xmm1, %xmm0
	movsd	M3(%rip), %xmm1
	call	__printf_chk
	xorl	%eax, %eax
	movq	40(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L20
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	movq	%rsp, %rsi
	xorl	%edi, %edi
	movl	$-1, %r12d
	call	clock_gettime
	jmp	.L10
.L19:
	movl	$.LC0, %edi
	call	puts
	movl	$-1, %edi
	call	exit
.L20:
	call	__stack_chk_fail
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE5:
	.section	.text.startup
.LHOTE5:
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
