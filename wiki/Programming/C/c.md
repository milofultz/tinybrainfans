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

#### Symbolic Constants / `#define`

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

These `#define` statements are also often used for macros[11,12], so functions or subfunctions can be added in place. For example:

```c
#include <stdio.h>

#define mu_assert(message, test) do { if (!(test)) return message; } while (0)
#define mu_run_test(test) do { char *message = test(); tests_run++; if (message) return message; } while (0)

int tests_run = 0;

int foo = 7;

static char * test_foo() {
  mu_assert("error, foo != 7", foo == 7);
  return 0;
}

static char * all_tests() {
  mu_run_test(test_foo);
  return 0;
}
```

Becomes effectively this after the macros are inserted:

```c
#include <stdio.h>

int tests_run = 0;

int foo = 7;

static char * test_foo() {
  // mu_assert("error, foo != 7", foo == 7);
  do {
    if (!(foo == 7)) {
      return "error, foo != 7";
    }
  } while (0);
  return 0;
}

static char * all_tests() {
  //# mu_assert("error, bar != 5", bar == 5);
  do {
    char *message = test_foo();
    tests_run++;
    if (message) {
      return message; 
    }
  } while (0);
  return 0;
}
```

If you want to know about the seemingly pointless loops, check it out here[11].

#### Enumeration Constants

An enumeration constant is a list of constant integer values. They will start at 0, incrementing on each new constant, unless otherwise defined.

```c
enum boolean { FALSE, TRUE }; // FALSE == 0, TRUE == 1
enum months { JAN = 1, FEB, MAR, ...}; // JAN == 1, FEB == 2...
enum fib { FIRST = 1, SECOND = 1, THIRD,  // THIRD == 2
           FOURTH, FIFTH = 5, SIXTH = 8 } // FOURTH == 3
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

### Pointers

Pointers are how the CPU knows where to find a given piece of memory. Pointers are represented as integers and can be passed to functions as arguments. Since they are just numbers, you can use them also to point at elements in an array or string.

To declare a pointer, you preface the variable with an **asterisk**. You can get the address to a variable by prefacing an existing variable with an **ampersand**.

```c
int n;  // a number
int *p; // a pointer

p = &n; // point p to the address of n
```

To best understand pointers, start from the middle and go outwards, and when writing out pointers, arrays, and functions, use `[]` or `()` over `*` whenever possible. For instance[15]:

```c
int *a[10];
int *a[10];      "a is"  
     ^  
int *a[10];      "a is an array"  
      ^^^^ 
int *a[10];      "a is an array of pointers"
    ^
int *a[10];      "a is an array of pointers to `int`".  
^^^
```

## Libraries

### stdio.h

#### printf(string, [format, ...])

If you use a format tag in the string, like `%d` or `%c`[14], you will need to add what will replace it in the list of `format` variables.

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

You can also use `%.*s` to consume two arguments: the number of chars, and the string pointer to target[12].

#### getchar(), putchar(x)

`getchar` will resolve to a character from stdin, and `putchar(x)` will put the value of `x` in stdout.

## Sandboxing

You can send text via stdin using `printf "123xyz" | ./program.out`, with program.out being the name of the compiled program.

You can also use an online REPL, like [replit.com](https://replit.com/languages/c).

## Testing

There are many different options to do {{test-driven development}} in C. One I have seen recommended is MinUnit[6], as it is essentially as small as possible. Others I have seen are Minctest[8,9,10], 

## References

1. https://hikage.freeshell.org/books/theCprogrammingLanguage.pdf
2. https://stackoverflow.com/questions/19379353/symbolic-constants-in-c-define-statement
3. https://github.com/agavrel/42_CheatSheet
4. https://www.cs.yale.edu/homes/aspnes/pinewiki/C(2f)Pointers.html
5. https://stackoverflow.com/questions/65820/unit-testing-c-code
6. https://jera.com/techinfo/jtns/jtn002
7. https://eradman.com/posts/tdd-in-c.html
8. https://github.com/codeplea/minctest
9. https://codeplea.com/minctest
10. https://github.com/codeplea/tinyexpr/blob/master/smoke.c
11. https://stackoverflow.com/questions/154136/why-use-apparently-meaningless-do-while-and-if-else-statements-in-macros
12. https://stackoverflow.com/questions/7899119/what-does-s-mean-in-printf
13. http://cslibrary.stanford.edu/101/EssentialC.pdf
14. https://www.ibm.com/docs/en/i/7.4?topic=functions-printf-print-formatted-characterse
15. https://www.codementor.io/@dankhan/how-to-easily-decipher-complex-pointer-declarations-cpp-so24b66me
