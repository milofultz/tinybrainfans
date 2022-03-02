---
title: Strings (C)
description: Strings in C are arrays of characters.
---

Strings in {{C}} are {{arrays|Arrays (C)}} of characters.

## Basics

Both of these strings are arrays of 6 characters in length. These two are the same:

```c
char str1[] = "Hello";
char str2[] = {'H', 'e', 'l', 'l', 'o', '\0'};
```

### Length

The length of a C string is determined by searching for the null termination character, `\0`.

## Syntax

`\0` - This is the null termination character, signifying the end of the string within the string array. 

A string of multiple characters is signified by double quotes `"like this"`.

A single character is signified by single quotes, like `'\0'`, `'a'`, or `'\a'`.

## References

1. https://stackoverflow.com/questions/14461695/what-does-0-stand-for
2. https://en.wikipedia.org/wiki/C_string_handling
