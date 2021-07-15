---
title: C (Programming)
description: C is a programming language that is very low-level, compiling down to assembly language.
---

C is a programming language that is very low-level, compiling down to {{assembly}} language.

## Hello, World

### Code

Create a new file called `helloworld.c` and add this to the contents:

```c
#include <stdio.h>  /* Imports the standard library for IO */

main()  /* defines the function main containing no parameters */
{
    printf("hello, world\n"); /* prints "hello, world" in stdio */
    /* note that the newline must be placed deliberately. C does */
    /* not add a newline with print like Python does. */
}
```

### Compile

Then you want to compile it. The basic compiler found on UNIX computers is `cc`. Compile it by typing `cc helloworld.c`. This will create a file called `a.out`, which is the compiled version of your `helloworld.c`. 

### Run It

Run this by typing `./a.out` in your shell. You should see `hello, world` in your terminal.

## Basics

### Comments

```c
// Single line comment
/* Multiline
   comment */
```

### Functions

`main` is a special function that will begin executing when running your compiled file. This must be named `main`, but other functions can take on whatever other names you'd like.

### Symbolic Constants

Symbolic constants allow the developer to avoid {{magic numbers|Magic Numbers (Programming)}} and add semantically useful labels to values. This is done using he syntax `#define NAME value`.

```c
#include <stdio.h>
#define TAXRATE 0.09
#define SERVICECHARGE 2

main()
{
  printf("The tax rate is %1.2f and the service charge is %d", TAXRATE, SERVICECHARGE);
}

/* prints "The tax rate is 0.09 and the service charge is 2"
```

These statements don't actually *do* anything in the code. They are handled by the preprocessor and the references to the `NAME` are simply replaced by the corrseponding `value` when found. So the above `printf` line, when eventually seen by the compiler, will be:

```c
printf("The tax rate is %1.2f and the service charge is %d", 0.09, 2);
```

### Types

Since C is strongly typed, certain actions that are intuitive in Javascript or Python may not yield the results you wanted. For instance, if you have variable `int x` and you try and initialize it with a fractional number, the fractional part will be discarded since `x` stores an `int`.

### Variables

Variables must be declared before they are used, usually at the beginning before executing your program. They are declared by type and then by name.

```c
int num, step;
char letter;
```

## Libraries

### stdio.h

#### printf(string, [format, ...])

If you use a format tag in the string, like `%d` or `%c`, you will need to add what will replace it in the list of `format` variables.

```c
int fahr, celsius;
fahr = 100;
celsius = 37;
printf("%d F = %d C", fahr, celsius);
/* prints "100 F = 37 C" */
```

The format tags can also be accompanied by the minimum width of characters printed.

```c
printf("%3d F = %3d C", fahr, celsius); /* prints "100 F = 37  C" */
printf("%2d F = %2d C", fahr, celsius); /* prints "100 F = 37 C" */
```

#### getchar(), putchar(x)

`getchar` will resolve to a character from stdin, and `putchar(x)` will put the value of `x` in stdout.

## References

1. https://hikage.freeshell.org/books/theCprogrammingLanguage.pdf
2. https://stackoverflow.com/questions/19379353/symbolic-constants-in-c-define-statement
