// SPDX-License-Identifier: GLWTPL

#pragma once

#include <stddef.h>
#include <sys/types.h>

#define STDOUT_FILENO   1

ssize_t
write (int fd, const void *buff, size_t count);

__attribute__((noreturn)) void
_exit (int status);
