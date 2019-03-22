	.file	"figura1-modificado-b.c"
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
	leaq	36(%rsp), %r11
	movl	$1, %r8d
	.p2align 4,,10
	.p2align 3
.L3:
	movl	$s, %eax
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L4:
	movl	(%rax), %ecx
	addq	$40, %rax
	leal	(%r8,%rcx,2), %r10d
	movl	-32(%rax), %ecx
	addl	%r10d, %r9d
	leal	(%r8,%rcx,2), %ecx
	addl	%ecx, %r9d
	movl	-24(%rax), %ecx
	leal	(%r8,%rcx,2), %ecx
	addl	%ecx, %r9d
	movl	-16(%rax), %ecx
	leal	(%r8,%rcx,2), %ecx
	addl	%ecx, %r9d
	movl	-8(%rax), %ecx
	leal	(%r8,%rcx,2), %ecx
	addl	%ecx, %r9d
	movl	-36(%rax), %ecx
	leal	(%rcx,%rcx,2), %esi
	subl	%r8d, %esi
	leal	(%rsi,%rdx), %edi
	movl	-28(%rax), %edx
	leal	(%rdx,%rdx,2), %ecx
	movl	-20(%rax), %edx
	subl	%r8d, %ecx
	leal	(%rdx,%rdx,2), %edx
	leal	(%rcx,%rdi), %esi
	subl	%r8d, %edx
	leal	(%rdx,%rsi), %ecx
	movl	-12(%rax), %edx
	leal	(%rdx,%rdx,2), %edx
	subl	%r8d, %edx
	addl	%ecx, %edx
	movl	-4(%rax), %ecx
	leal	(%rcx,%rcx,2), %edi
	subl	%r8d, %edi
	addl	%edi, %edx
	cmpq	%rax, %rbx
	jne	.L4
	cmpl	%edx, %r9d
	cmovg	%edx, %r9d
	addl	$1, %r8d
	addq	$4, %r11
	movl	%r9d, -4(%r11)
	cmpl	$40001, %r8d
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
