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

## References

1. https://stackoverflow.com/questions/201101/how-to-initialize-all-members-of-an-array-to-the-same-value
