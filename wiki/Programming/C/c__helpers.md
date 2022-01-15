---
title: C Helper Functions
description: C has a large amount of helper libraries and functions.
---

C has a large amount of helper libraries and functions.

## `stdlib.h`

- `long strtol(char* str, char** endPtr, int base)` - Converts a string into a long integer

  -  `str` - String to be read
  - `endPtr` - On success, points to first char after number; on failure,  `NULL`
  - `base` - Base for number conversion

  - Returns converted number as  `long`

## References

1. https://linux.die.net/man/3/strtol
1. https://codeforwin.org/2018/01/convert-string-to-long-using-strtol-c.html