// SPDX-License-Identifier: GLWTPL

__attribute__((noreturn, weak)) void
__stack_chk_fail (void)
{
  for (; ; )
    ;
}

__attribute__((noreturn, weak)) void
__stack_chk_fail_local (void)
{
  __stack_chk_fail ();
}
