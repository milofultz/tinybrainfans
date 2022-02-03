---
title: Big-O Notation
description: Big-O notation shows the speed of an algorithm at a large scale in the worst-case scenario using fuzzy estimates.
---

Big-O notation shows the speed of an algorithm at a large scale in the worst-case scenario using fuzzy estimates. If you are looking for an item in a list and the item is the last element in the list, then the Big-O notation will be how long it takes to find that.

## Common Notations

Big-O notation is usually represented as O(n), with mathematical formulas affecting the n inside. O represents the algorithm, n represents the number of elements.

Time | Notation | Description
--- | --- | ---
Constant | `O(1)` | This always takes the same length of time, regardless of size. The code does not depend on the size of the problem.
Logarithmic | `O(log(n))` | log(n) being the inverse of exponentiation. Reduces the problem in half each time through process 
Linear  | `O(n)` | This takes the same amount of time as there are elements in the list. Simple iterative or recursive programs.
Log-linear | `O(n\*log(n))` |
Quadric | `O(n^2)` | Time goes up exponentially with the amount of elements.
Cubic | `O(n^3)` | Time goes up even more exponentially.
Exponential | `O(b^n)` | Time goes up an exponent per element. Nested loops or recursive calls.
Factorial | `O(n!)` | Time goes up by factorial.

## Rules of Thumb

### Constants can always be removed from a Big-O notation

Since Big-O only cares about the really biggest cases, as the numbers of elements in a list go up, even if there is a constant that is being added or multiplied, it won't affect the speed enough to matter. Exception being if the constant is of a very very large size, but even then, if the number of elements grows large enough.

### Use the largest exponent

If there is a formula that determines the length of time an algorithm will take, like `log(n)^3 + 15n^2 + 2n^3`, then Big-O will see the largest possible number or exponent (`n^3`) and use that: `O(n^3)`.

Big-O is 'rounding' to the nearest and simplest notation that is closest to the real outcome.

### Discerning the time taken per loop

In a program, if you have a loop over your list that will operate n times, you would write this as `f(n) = n = O(n)` If within that loop, you find another loop that will operate n*2 times: `f(n) = n * 2n = 2n^2 = O(n^2)`.

## References:

1. https://www.youtube.com/watch?v=zUUkiEllHG0&list=PLDV1Zeh2NRsB6SWUrDFW2RmDotAfPbeHu&index=3
2. [https://en.wikipedia.org/wiki/Logarithm](https://en.wikipedia.org/wiki/Logarithm)
3. [https://en.wikipedia.org/wiki/Natural_logarithm](https://en.wikipedia.org/wiki/Natural_logarithm)
10. Intro to Programming and Computation: Chapters 9.1–9.3.1, 9.3.3, and 9.3.5
12. https://www.youtube.com/watch?v=7lQXYl_L28w&list=PLUl4u3cNGP63WbdFxL8giv4yhgdMGaZNA&index=38&t=0s
12. https://eli.li/2022/01/26/notes-on-big-o-notation
