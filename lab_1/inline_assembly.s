	.file	"inline_assembly.c"
	.text
	.globl	x
	.bss
	.align 4
	.type	x, @object
	.size	x, 4
x:
	.zero	4
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"True"
.LC2:
	.string	"False"
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
	subq	$392, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$0, x(%rip)
#APP
# 6 "inline_assembly.c" 1
	movl $0, %eax
mark:      addl $10, %eax
movl %eax, x
# 0 "" 2
#NO_APP
	movl	x(%rip), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$10, -400(%rbp)
	movl	$20, -396(%rbp)
	movl	-400(%rbp), %edx
	movl	-396(%rbp), %ecx
#APP
# 17 "inline_assembly.c" 1
	movl %edx, %eax
addl %ecx, %eax
movl %eax, %edx

# 0 "" 2
#NO_APP
	movl	%edx, -392(%rbp)
	movl	-392(%rbp), %edx
#APP
# 26 "inline_assembly.c" 1
	cmp $15, %edx
jge greater_or_equal
movl $0, %edx
jmp end
greater_or_equal:
movl $1, %edx
end:
# 0 "" 2
#NO_APP
	movl	%edx, -392(%rbp)
	movl	-392(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$14, -388(%rbp)
	jle	.L2
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L3
.L2:
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L3:
#APP
# 51 "inline_assembly.c" 1
	;Comment
# 0 "" 2
#NO_APP
	movl	$95, -272(%rbp)
	movl	$96, -268(%rbp)
	movl	$97, -264(%rbp)
	movl	$401, -188(%rbp)
	movl	$402, -172(%rbp)
	movl	$501, -184(%rbp)
	movl	$502, -180(%rbp)
	movl	-180(%rbp), %eax
	movl	-264(%rbp), %edx
	subl	%edx, %eax
	movl	%eax, -224(%rbp)
	movl	$13, -384(%rbp)
	movl	$19, -380(%rbp)
	movl	-384(%rbp), %edx
	movl	-380(%rbp), %ecx
#APP
# 82 "inline_assembly.c" 1
	movl %edx, %eax
   cmpl %ecx, %eax
   jge greater_or_equal
   movl $0, %edx
   jmp end
   greater_or_equal
   movl $1, %edx
   end:
# 0 "" 2
#NO_APP
	movl	%edx, -376(%rbp)
	movl	$0, -372(%rbp)
#APP
# 104 "inline_assembly.c" 1
	movl $0, %ecx
movl $5, %ebx
movl $0, %eax
loop_start:
addl %ecx, %eax
incl %ecx
loop loop_start

# 0 "" 2
#NO_APP
	movl	%eax, -372(%rbp)
	movl	$0, -368(%rbp)
	movl	$0, -364(%rbp)
#APP
# 128 "inline_assembly.c" 1
	movl $0, %ecx
movl $7, %ebx
movl $0, %eax
while_start:
cmpl %ebx, %ecx
jge while_end
addl %ecx, %eax
incl %ecx
jmp while_start
while_end:

# 0 "" 2
#NO_APP
	movl	%eax, -364(%rbp)
	movl	$2, -360(%rbp)
	movl	$2048, -356(%rbp)
	movl	-360(%rbp), %edx
	movl	-356(%rbp), %ecx
#APP
# 152 "inline_assembly.c" 1
	movl %edx, %eax
cmpl %ecx, %eax
jge is_a_greater_or_equal
movl %ecx, %eax
jmp end
is_a_greater_or_equal
movl %edx, %eax
end:movl %eax, %edx

# 0 "" 2
#NO_APP
	movl	%edx, -352(%rbp)
	movl	-352(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$16, -336(%rbp)
	movl	$12, -332(%rbp)
	movl	$89, -328(%rbp)
	movl	$79, -324(%rbp)
	movl	$56, -320(%rbp)
	movl	$34, -316(%rbp)
	movl	$17, -312(%rbp)
	movl	$1920, -308(%rbp)
	movl	$11, -304(%rbp)
	movl	$13, -300(%rbp)
	leaq	-336(%rbp), %rdi
	movl	$10, %r8d
#APP
# 176 "inline_assembly.c" 1
	movl $0, %ecx
movl $0, %ebx
movl %rdi, %esi
movl %r8d, %edx
loop_start:cmpl %edx, %ecx
jge loop_end
movl (%esi, %ecx, 4), %eax
addl %eax, %ebx
incl %ecx
jmp loop_start
loop_end:movl %ebx, %edi

# 0 "" 2
#NO_APP
	movl	%edi, -348(%rbp)
	movl	-336(%rbp), %eax
	movl	%eax, -344(%rbp)
#APP
# 202 "inline_assembly.c" 1
	movl %1, %%esi
movl $0, %%ecx
movl %2, %%edx
movl (%%esi, %%ecx, 4), %%ebx
movl %%ebx, %0
loop_start:cmpl %%edx, %%ecx
jge loop_end
movl (%%esi, %%ecx, 4), %%eax
movl %%eax, %1

# 0 "" 2
#NO_APP
	movl	-340(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-336(%rbp), %rdi
	movl	$10, %r8d
#APP
# 220 "inline_assembly.c" 1
	cmpl %ebx, %eax
jle skip_update
movl %eax, %ebx
skip_update:incl %ecx
jmp loop_start
loop_end:movl %ebx, %r8d

# 0 "" 2
#NO_APP
	movl	%r8d, -344(%rbp)
	movl	%edi, -340(%rbp)
	movl	$0, %eax
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
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
