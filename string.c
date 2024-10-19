#include <string.h>

size_t
strlen (const char *s)
{
  const char *old_s;

  for (old_s = s; *s; s++);

  return s - old_s;
}
