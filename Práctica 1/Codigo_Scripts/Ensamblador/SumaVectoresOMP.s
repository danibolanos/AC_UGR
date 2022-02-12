	.file	"SumaVectoresC.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Faltan no componentes del vector"
	.align 8
.LC3:
	.string	"Tiempo(seg.):%11.9f\t / Tama\303\261o Vectores:%u\t/ V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) / / V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB4:
	.section	.text.startup,"ax",@progbits
.LHOTB4:
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
	jle	.L17
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$33554432, %ebx
	call	strtol
	cmpl	$33554432, %eax
	cmovbe	%eax, %ebx
	testl	%ebx, %ebx
	je	.L3
	pxor	%xmm1, %xmm1
	leal	-1(%rbx), %esi
	xorl	%eax, %eax
	movsd	.LC1(%rip), %xmm3
	movq	%rsi, %rbp
	addq	$1, %rsi
	cvtsi2sd	%ebx, %xmm1
	mulsd	%xmm3, %xmm1
	.p2align 4,,10
	.p2align 3
.L4:
	pxor	%xmm0, %xmm0
	movapd	%xmm1, %xmm7
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm3, %xmm0
	movapd	%xmm0, %xmm2
	subsd	%xmm0, %xmm7
	addsd	%xmm1, %xmm2
	movsd	%xmm7, v2(,%rax,8)
	movsd	%xmm2, v1(,%rax,8)
	addq	$1, %rax
	cmpq	%rsi, %rax
	jne	.L4
	xorl	%edi, %edi
	movq	%rsp, %rsi
	call	clock_gettime
	leal	-2(%rbx), %edx
	shrl	%edx
	addl	$1, %edx
	cmpl	$1, %ebx
	leal	(%rdx,%rdx), %eax
	je	.L10
	xorl	%ecx, %ecx
	xorl	%esi, %esi
.L6:
	movapd	v1(%rcx), %xmm0
	addl	$1, %esi
	addq	$16, %rcx
	addpd	v2-16(%rcx), %xmm0
	movaps	%xmm0, v3-16(%rcx)
	cmpl	%esi, %edx
	ja	.L6
	cmpl	%ebx, %eax
	je	.L8
.L5:
	cltq
	movsd	v2(,%rax,8), %xmm0
	addsd	v1(,%rax,8), %xmm0
	movsd	%xmm0, v3(,%rax,8)
.L8:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	movl	%ebp, %edx
	pxor	%xmm0, %xmm0
	movl	%ebp, %ecx
	movsd	v3(,%rdx,8), %xmm6
	movl	%ebp, %r9d
	movsd	v2(,%rdx,8), %xmm5
	movl	%ebp, %r8d
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	movsd	v1(,%rdx,8), %xmm4
	movsd	v3(%rip), %xmm3
	movl	%ebx, %edx
	movsd	v2(%rip), %xmm2
	movl	$.LC3, %esi
	movl	$1, %edi
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	divsd	.LC2(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm0
	movl	$7, %eax
	addsd	%xmm1, %xmm0
	movsd	v1(%rip), %xmm1
	call	__printf_chk
	xorl	%eax, %eax
	movq	40(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L18
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L10:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L5
.L3:
	movq	%rsp, %rsi
	xorl	%edi, %edi
	orl	$-1, %ebp
	call	clock_gettime
	jmp	.L8
.L17:
	movl	$.LC0, %edi
	call	puts
	orl	$-1, %edi
	call	exit
.L18:
	call	__stack_chk_fail
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE4:
	.section	.text.startup
.LHOTE4:
	.comm	v3,268435456,32
	.comm	v2,268435456,32
	.comm	v1,268435456,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	2576980378
	.long	1069128089
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
