.text
.global _start
.type _start, @function
_start:
	pushl %esp		/* orig_esp */
	call slibc_start
				/* never return */
