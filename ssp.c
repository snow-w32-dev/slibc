// SPDX-License-Identifier: GLWTPL

#include <stddef.h>
#include <unistd.h>

__attribute__((weak)) size_t __stack_chk_guard = 0xdeadbeef;

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
