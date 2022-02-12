	.file	"figura1-modificado-a.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Tiempo(seg.):%11.9f / / R[0]=%i, R[39999]=%i\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB2:
	.section	.text.startup,"ax",@progbits
.LHOTB2:
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
	xorl	%edi, %edi
	movl	$s+40000, %ebx
	movl	$s, %ebp
	subq	$160056, %rsp
	.cfi_def_cfa_offset 160080
	movq	%fs:40, %rax
	movq	%rax, 160040(%rsp)
	xorl	%eax, %eax
	call	time
	movl	%eax, %edi
	call	srand
	.p2align 4,,10
	.p2align 3
.L2:
	call	rand
	movl	%eax, 0(%rbp)
	addq	$8, %rbp
	call	rand
	movl	%eax, -4(%rbp)
	cmpq	%rbp, %rbx
	jne	.L2
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	leaq	36(%rsp), %r8
	movl	$1, %esi
	.p2align 4,,10
	.p2align 3
.L3:
	movl	$s, %eax
	xorl	%edi, %edi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L4:
	movl	(%rax), %edx
	addq	$8, %rax
	leal	(%rsi,%rdx,2), %edx
	addl	%edx, %ecx
	movl	-4(%rax), %edx
	leal	(%rdx,%rdx,2), %edx
	subl	%esi, %edx
	addl	%edx, %edi
	cmpq	%rax, %rbx
	jne	.L4
	cmpl	%edi, %ecx
	cmovg	%edi, %ecx
	addl	$1, %esi
	addq	$4, %r8
	movl	%ecx, -4(%r8)
	cmpl	$40001, %esi
	jne	.L3
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	movl	$.LC1, %esi
	pxor	%xmm0, %xmm0
	movl	160028(%rsp), %ecx
	movl	32(%rsp), %edx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	divsd	.LC0(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	addsd	%xmm1, %xmm0
	call	__printf_chk
	xorl	%eax, %eax
	movq	160040(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L11
	addq	$160056, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L11:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE2:
	.section	.text.startup
.LHOTE2:
	.comm	s,40000,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
