// SPDX-License-Identifier: GLWTPL

#pragma once

// reuse kernel header

#include <linux/unistd.h>

// see i386/syscall.S

long
slibc_syscall1 (long nr, long arg0);

long
slibc_syscall3 (long nr, long arg0, long arg1, long arg2);

#define syscall1(nr, arg0)              slibc_syscall1 (nr, (long)arg0)
#define syscall3(nr, arg0, arg1, arg2)  slibc_syscall3 (nr, (long)arg0, (long)arg1, (long)arg2)
