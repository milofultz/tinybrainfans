---
title: Arrays (C)
description: Arrays in C, like all things in C, require a lot more care than higher level languages.
---

Arrays in {{C}}, like all things in C, require a lot more care than higher level languages.

## Initialization

Arrays are intialized as normal, but followed by `n` items that should reside in the array: `int numbers[n]`. 

You can set the values of each of these items with curly braces. 

```c
int array[5] = { 1, 2, 3, 4, 5 };
int zeroArray[10] = { 0 };
```

In an array of integers, if the list of values within the curly braces is less than the amount needed to fill it completely, all remaining values will resort to zero. Meaning that you can instantiate an array of integers with 0 via `int array[n] = { 0 }`.

## Access/Modification

Arrays can be accessed or modified as normal via square brackets.

```c
int array[8] = { 0 };

array[0] = 100;
array[4] = 500;
```

## Information

### Size/Length

The size or length of an array needs some calculation. The built in `sizeof` function will return the size of an array *in bytes*, which is not particularly helpful unless you know the size of each cell. So you can use the `sizeof` function to get the size of the first cell and divide the total size by that value.

```c
#include <stdio.h>

int main() 
{
    int total, single, len;
    int array[10];
  
    total = sizeof(array);
    single = sizeof(array[0]);
    len = total / single;

    printf("total: %d, single: %d,len: %d", total, single, len);
    // total: 40, single: 4, len: 10

    return 0;
}
```

Integers that are passed in as arguments will not be able to utilize this technique. The length will need to be calculated ahead of time and passed in as another argument.

```c
#include <stdio.h>

void reverse(char str[], int len);

int main() 
{
    int total, single, len;
    char array[] = "hello";
  
    total = sizeof(array);
    single = sizeof(array[0]);
    len = total / single;
    printf("%d, %d, %d\n", total, single, len);
  
    reverse(array, len);

    return 0;
}

void reverse(char str[], int len)
{
  int i;
  
  for (i = len - 1; i >= 0; i--)
    printf("%c", str[i]);
}
```

## References

1. https://stackoverflow.com/questions/201101/how-to-initialize-all-members-of-an-array-to-the-same-value
