---
title: C Data Types
description: The different data types in C all have their own characteristics.
---

The different data types in {{C}} all have their own characteristics.

Since C is strongly typed, certain actions that are intuitive in {{Javascript}} or {{Python}} may not yield the results you wanted. For instance, if you have variable `int x` and you try and initialize it with a fractional number, the fractional part will be discarded since `x` stores an `int`.

{{Arrays|Arrays (C)}} are intialized as normal, but followed by `n` items that should reside in the array: `int numbers[n]`.

*The following list is only what I've used most and by no means a complete list. [Look at the Wikipedia page for more info](https://en.wikipedia.org/wiki/C_data_types).*

| Type     | Bits | Limits           | Format    | Description                                         |
| -------- | ---- | ---------------- | --------- | --------------------------------------------------- |
| `char`   | 8    | -127, +127       | `%c`      | Used for characters within strings (array of chars) |
| signed short `int`    | 16   | -32,767, +32,767 | `%i` | Used for numbers and traversing data from stdin     |
| unsigned short `int` | 16   | 0, +65,535 | `%u` | |
| signed `int` | 16   | -2,147,483,648, +2,147,483,647 | `%i` | |
| unsigned `int` | 32   | 0, +4,294,967,295 | `%i` | |
| signed long `int` | 64   | -9,223,372,036,854,775,808, +9,223,372,036,854,775,807 | `%li` | |
| unsigned long `int` | 64   | 0, +18,446,744,073,709,551,615 | `%lu` | |
| `float`  | 32   | n/a              | `%f`      | Use for floating point numbers                      |
| `double` | 64   | n/a              | `%lf`     | Use for really long floating point numbers          |

## Signed/Unsigned

Unsigned numbers are always zero or higher and will have a range of 0 to (2^n) - 1. Signed numbers are negative or positive and have a range of -(2^n-1) to (2^n-1) - 1.

## Int

`int`'s can be `short` or `long`. Each processor has their own limitations they will choose, but `short` is always smaller than `long`, `short` must be at least 16 bits, and `long` must be at least 32 bits. It is usually the case that `short` is 16 bits and `long` is 32 bits, but the real value on your processor can be found as symbolic constants within the `<limits.h>` header.

`int` values can be represented as standard decimal (`123`), octal (`0173`), or as hexadecimal (`0x7B`).

## Float

The type `long double` represents extended-precision floating point. The processor decides the final size of floats and the real values can be found as symbolic constants within the `<float.h>` header.

## References

- https://en.wikipedia.org/wiki/C_data_types
