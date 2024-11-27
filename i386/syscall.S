.text
.global slibc_syscall1
.type slibc_syscall1, @function
slibc_syscall1:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax		/* nr */
	pushl	%ebx			/* callee-saved */
	movl	12(%ebp), %ebx		/* arg0 */
#ifdef NO_SNOW
	int	$0x80			/* result saved into eax */
#else
	calll	*%fs:0xc0		/* result saved into eax */
#endif
	popl	%ebx			/* callee-saved */
	popl	%ebp
	ret

.global slibc_syscall3
.type slibc_syscall3, @function
slibc_syscall3:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax		/* nr */
	pushl	%ebx			/* callee-saved */
	movl	12(%ebp), %ebx		/* arg0 */
	movl	16(%ebp), %ecx		/* arg1 */
	movl	20(%ebp), %edx		/* arg2 */
#ifdef NO_SNOW
	int	$0x80			/* result saved into eax */
#else
	calll	*%fs:0xc0		/* result saved into eax */
#endif
	popl	%ebx			/* callee-saved */
	popl	%ebp
	ret
