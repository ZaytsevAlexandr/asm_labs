	.file	"debug.c"
	.text
	.section	.rodata
.LC0:
	.string	"Current value: %d\n"
.LC1:
	.string	"Maximum value: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$1, -64(%rbp)
	movl	$23, -60(%rbp)
	movl	$45, -56(%rbp)
	movl	$67, -52(%rbp)
	movl	$89, -48(%rbp)
	movl	$12, -44(%rbp)
	movl	$34, -40(%rbp)
	movl	$56, -36(%rbp)
	movl	$78, -32(%rbp)
	movl	$90, -28(%rbp)
	movl	-64(%rbp), %eax
	movl	%eax, -76(%rbp)
	movl	$1, -72(%rbp)
	leaq	-64(%rbp), %rsi
	movl	-76(%rbp), %eax
	movl	%eax, %edx
#APP
# 11 "debug.c" 1
	movl %edx, %edi
movl %esi, %ecx
movl %rsi, %eax
.startCycle1:
movl (%edi, %ecx, 4), %ebx
movl %ebx, %r8d
cmpl %eax, %ebx
jle .endMax1
movl %ebx, %edx
.endMax1:
movl %ecx, %esi

# 0 "" 2
#NO_APP
	movl	%r8d, -68(%rbp)
	movl	%edx, -76(%rbp)
	movl	%esi, -72(%rbp)
	movl	-68(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-64(%rbp), %rax
#APP
# 32 "debug.c" 1
	movl %eax, %ecx
movl %rax, %edi
incl %ecx
addl $4, %edi
cmpl $10, %ecx
jle .startCycle1

# 0 "" 2
#NO_APP
	movl	%eax, -72(%rbp)
	movl	-76(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
