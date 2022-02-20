---
title: C Helper Functions
description: C has a large amount of helper libraries and functions.
---

C has a large amount of helper libraries and functions.

## `stdlib.h`

- `char *getenv(const char *name)` - Get environment variable
  - `name` - Name of the environment variable[4]
- `long int strtol(const char *nptr, char **endptr, int base)` - Converts a string into a long integer
  - `nptr` - String to be read
  - `endPtr` - On success, points to first char after number; on failure,  `NULL`
  - `base` - Base for number conversion
  - Returns converted number as  `long`

## `stdio.h`

- `FILE fopen(const char *path, const char *mode)` - Open the file and return a stream of it.
  - `path` - To the file to be opened
  - `mode` - How the file should be opened
    - `r` / `r+` - Open the file for reading / reading and writing, positioning the stream at the beginning of the file
    - `w` / `w+` - Open file for writing / reading and writing, truncating file if it exists, creating file if it doesn't, positioning stream at beginning of the file
    - `a` / `a+` - Open file for appending / reading and appending, creating file if it doesn't exist, positioning stream at the end of the file

## References

1. https://linux.die.net/man/3/strtol
1. https://codeforwin.org/2018/01/convert-string-to-long-using-strtol-c.html
1. https://linux.die.net/man/3/fopen
1. https://www.tutorialspoint.com/c_standard_library/c_function_getenv.htm