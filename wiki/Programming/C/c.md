---
title: C
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

### Constants

#### Symbolic Constants

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

#### Enumeration Constants

An enumeration constant is a list of constant integer values. They will start at 0, incrementing on each new constant, unless otherwise defined.

```c
enum boolean { FALSE, TRUE }; // FALSE == 0, TRUE == 1
enum months { JAN = 1, FEB, MAR, ...}; // JAN == 1, FEB == 2...
enum fib { FIRST = 1, SECOND = 1, THIRD,
           FOURTH, FIFTH = 5, SIXTH = 8 } // THIRD == 2, FOURTH == 3...
```

These constants can be used the same as symbolic constants.

### Variables

Variables must be declared before they are used, usually at the beginning before executing your program. They are declared by type and then by name.

```c
int num, step;
char letter;
```

Variables that exist in and only within a given function are called **automatic** variables. They come into existence only when the function begins and disappear when the function is finished.

The `const` keyword may be added to any variable declaration. This means that the variable declared will not change throughout its usage.

#### External Variables

External variables are defined exactly once outside of any function. This is so that the computer can set aside storage. Within each function that will use that, you will need to declare that variable, and preface that declaration with `extern`. For instance if `max` is an external variable, you would declare it within the function as `extern int max`.

If multiple source files are used, for instance defining X in one file and wanting to use it in another file, the `extern` declaration is required. If it is all in one file, they can be omitted. 

Common practice is to define all external variables in a header file with a `.h` extension and then `#include` it in your source files.

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

## Sandboxing

You can send text via stdin using `printf "123xyz" | ./program.out`, with program.out being the name of the compiled program.

You can also use an online REPL, like [replit.com](https://replit.com/languages/c).

## References

1. https://hikage.freeshell.org/books/theCprogrammingLanguage.pdf
2. https://stackoverflow.com/questions/19379353/symbolic-constants-in-c-define-statement
2. https://github.com/agavrel/42_CheatSheet
