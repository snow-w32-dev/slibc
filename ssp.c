// SPDX-License-Identifier: GLWTPL

#include <unistd.h>

__attribute__((noreturn, weak)) void
__stack_chk_fail (void)
{
  _exit (1);
}

__attribute__((noreturn, weak)) void
__stack_chk_fail_local (void)
{
  __stack_chk_fail ();
}
