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

#### `main()`

`main` is a special function that will begin executing when running your compiled file. This must be named `main`, but other functions can take on whatever other names you'd like.

When a function is invoked within the `main` function, a **function prototype** is required to ensure that all invocations and definitions match up.

```c
#include <stdio.h>

int add(int m, int n);
int hooray(void); 			// if no params, void is used

int main()
{
  int i;

  for (i = 0; i < 10; ++i)
      printf("%d %d %d\n", i, add(2,i), add(-3,i));
		  hooray()
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
