---
title: Functions (C)
description: 
---

## Basics

Here is the structure of a function definition in {{C}}.

```c
/*
return-type function-name(parameter declarations, if any)
{
  declarations
  statements
}
*/

// An example

int add(int m, int n)
{
  int sum;
  sum = m + n;
  return sum;
}
```

### Passing Arguments by Value and by Reference[2]

Basic rule of thumb, I think, is that if you pass in a value directly into a function, it will make a *copy* and use or modify the given value or variable; if you pass in a reference, it will use or modify the actual variable itself. For example:

```c
#include <stdio.h>

void swapByValue(int first, int second) {
  int temp;

  temp = first;
  first = second;
  second = temp;

  return;
}

void swapByReference(int *first, int *second) {
  int temp;

  temp = *first;
  *first = *second;
  *second = temp;

  return;
}

int main() {
  int firstNumber = 25;
  int secondNumber = 19;

  printf("Pre swapByValue:  First and second numbers are %d and %d.\n", firstNumber, secondNumber);
  swapByValue(firstNumber, secondNumber);
  printf("Post swapByValue: First and second numbers are %d and %d.\n", firstNumber, secondNumber);

  printf("Pre swapByReference:  First and second numbers are %d and %d.\n", firstNumber, secondNumber);
  swapByReference(&firstNumber, &secondNumber);
  printf("Post swapByReference: First and second numbers are %d and %d.\n", firstNumber, secondNumber);
}
```

Compiling and running this will give this result:

```
Pre swapByValue:  First and second numbers are 25 and 19.
Post swapByValue: First and second numbers are 25 and 19.
Pre swapByReference:  First and second numbers are 25 and 19.
Post swapByReference: First and second numbers are 19 and 25.
```

## `main()`

`main` is a special function that will begin executing when running your compiled file. This must be named `main`, but other functions can take on whatever other names you'd like.

When a function is invoked within the `main` function, a **function prototype** is required to ensure that all invocations and definitions match up.

```c
#include <stdio.h>

int add(int m, int n);
int hooray(void);       // if no params, void is used

int main()
{
  int i;

  for (i = 0; i < 10; ++i) {
      printf("%d %d %d\n", i, add(2,i), add(-3,i));
      hooray();
  }
  return 0;
}

int add(int m, int n)
{
  int sum;
  sum = m + n;
  return sum;
}

int hooray()
{
  printf("Hooray!");
}
```

### Command Line Arguments[1]

Command line args are brought in using two parameters within the `main` function declaration:

- `int argc` - Number of arguments provided, including the path to the program itself
- `char *argv[]` - Array of arguments provided as strings

```c
#include <stdio.h>

int hooray(void); // if no params, void is used

int main(int argc, char *argv[])
{
  int i;

  for (i = 1; i < argc; ++i) {
      printf("%s\n", argv[i]);
      hooray();
  }
  
  return 0;
}

int hooray()
{
  printf("Hooray!");
}
```

## References

1. https://www.delftstack.com/howto/c/argv-in-c/
1. https://dev.to/mikkel250/passing-by-value-passing-by-reference-in-c-1acg
