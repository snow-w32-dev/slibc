// SPDX-License-Identifier: GLWTPL

#include <unistd.h>

#include "linux_syscall.h"

ssize_t
write (int fd, const void *buff, size_t count)
{
  return (ssize_t)syscall3(__NR_write, fd, buff, count);
}

__attribute__((noreturn)) void
_exit (int status)
{
  syscall1(__NR_exit, status);

  // unreachable
  for (; ; )
    ;
}
