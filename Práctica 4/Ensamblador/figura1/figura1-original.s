	.file	"figura1-original.c"
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%edi, %edi
	movl	$s, %ebx
	subq	$160048, %rsp
	.cfi_def_cfa_offset 160064
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
	movl	%eax, (%rbx)
	addq	$8, %rbx
	call	rand
	movl	%eax, -4(%rbx)
	cmpq	$s+40000, %rbx
	jne	.L2
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime
	leaq	36(%rsp), %r8
	movl	$1, %ecx
	.p2align 4,,10
	.p2align 3
.L3:
	movl	$s, %eax
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L4:
	movl	(%rax), %edx
	addq	$8, %rax
	leal	(%rcx,%rdx,2), %edx
	addl	%edx, %esi
	cmpq	$s+40000, %rax
	jne	.L4
	movl	$s+4, %eax
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L5:
	movl	(%rax), %edx
	addq	$8, %rax
	leal	(%rdx,%rdx,2), %edx
	subl	%ecx, %edx
	addl	%edx, %edi
	cmpq	$s+40004, %rax
	jne	.L5
	cmpl	%edi, %esi
	jge	.L6
	movl	%esi, (%r8)
.L7:
	addl	$1, %ecx
	addq	$4, %r8
	cmpl	$40001, %ecx
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
	jne	.L15
	addq	$160048, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L6:
	.cfi_restore_state
	movl	%edi, (%r8)
	jmp	.L7
.L15:
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
