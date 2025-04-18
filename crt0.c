// SPDX-License-Identifier: GLWTPL

#include <unistd.h>

int
slibc_user_main (int argc, char *argv[]);

// first function in C
// called from _start
__attribute__((noreturn)) void
slibc_start (void *orig_esp)
{
  long argc;
  char **argv;

  argc = *((long *)orig_esp);
  argv = (void *)(((char *)orig_esp) + sizeof (argc));

  _exit (slibc_user_main (argc, argv));

  // unreachable
}

// _start is in i386/start.S
