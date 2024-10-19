#pragma once

#include <stddef.h>
#include <sys/types.h>

ssize_t
write (int fd, const void *buff, size_t count);

__attribute__((__noreturn__)) void
_exit (int status);
