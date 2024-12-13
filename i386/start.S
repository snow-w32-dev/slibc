.global _start
_start:
	pushl	%esp		/* orig_esp */
	call	slibc_start
				/* never return */
