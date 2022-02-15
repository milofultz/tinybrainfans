---
title: FRACTRAN
description: FRACTRAN is an esoteric programming language developed by John Conway that is based solely on fractions and prime numbers.
---

FRACTRAN is an {{esoteric programming language|esolang}} developed by John Conway that is based solely on fractions and prime numbers.

Each program consists of a starting number as input (*n*), acting as an accumulator does in low-level {{assembly}} languages, as it persists and changes throughout the program. The instructions consist of a series of fractions (each fraction being represented as *f*) that are cycled through using the following rules[1,4]:

1. for the first fraction *f* in the list [of fractions] for which [the result of] *nf* is an integer, replace *n* by *nf*
2. repeat this rule until no fraction *f* in the list produces an integer when multiplied by *n*, then halt.

## Example

We will take the most simple example, an adding machine, to go through the rules. Don't worry if it doesn't make sense yet, this is one of those things that is really hard to understand without going through the whole thing first.

The instruction set for the adding machine is a single instruction:

```
2/3
```

Following rule 1, with an input (*n*) of `18` aka `2^1 * 3^2` and the list of fractions (*f*) being a single fraction of `2/3`: 

- We go through each fraction left-to-right, determining whether *nf* would be an integer. Looking at the first fraction, the result would be an integer: `18 * 2 / 3`, or `12` aka `2^2 * 3^1`. Having found "the first fraction *f* in the list [of fractions] for which [the result of] *nf* is an integer", we "replace *n* by *nf*" and repeat again.
- We repeat rule 1 with the new *n* of `12` aka `2^2 * 3^1`, going through each fraction *f* left-to-right, determining whether *nf* would be an integer. We look at the first fraction *f* and see the result would again resolve into an integer: `12 * 2 / 3 `, or `8`, aka `2^3`. Again we "replace *n* by *nf*" and repeat.
- Repeating rule 1 with the new *n* of `8` aka `2^3`, we look at the first fraction *f* and see the result would not resolve into an integer: `2 * 8 / 3` or `16 / 3`. If we had another fraction *f* in our list of fractions, we would continue to the next one and test, repeating the above process. But because we have "[repeated] this rule until no fraction *f* in the list produces an integer when multiplied by *n*", we halt the program.
- Our resulting *n* is `8`, or `2^3`.

## How It Works

Going through this section, I *highly* recommend going over the above example between each section, integrating the new ideas to better understand what is happening. Going through the {{paper computing}} examples on this site will also prepare you for this, if you aren't too familiar with low-level programming.

### Memory and Registers

Similar to low-level languages like {{assembly}}, we maintain and operate on numbers in discrete places in memory (or registers). However, these pieces of memory or registers are all contained within our number *n* by way of being a [composite number](https://en.wikipedia.org/wiki/Composite_number) composed of prime numbers. Therefore, our memory or registers are represented as powers of prime numbers.

Lets use our starting number above, `18`. This can be reduced down to `2 * 3 * 3`, or `2^1 * 3^2`. The number `18` is viewed in FRACTRAN as representing the "2 register" having a value of `1`, and the "3 register" having a value of `2`. Similarly, the number `120` can be reduced to `2^3 * 3^1 * 5^1`, which would have register values as follows:

Register | Value
--- | ---
r2 | 3 
r3 | 1
r5 | 1
r7 | 0
... | ...

So instead of having named variables like `X`, `Y`, or `counter` and altering them directly, we store our mutable data in these registers and operate on them using instructions.

### Instructions

There are only two types of instructions: incrementing or decrementing a register.

In our list of fractions, we can view each numerator/denominator pair as follows:

```
                         if condition in denominator is met, 
  numerator       then increment {numerator primes at their powers} 
------------- = -----------------------------------------------------
 denominator     if n contains {denominator primes at their powers},
                 then decrement {denominator primes at their powers}
```

So again, lets use our simple adding machine as the example, particularly the fraction `2/3`. First, we need to reduce the numerator and denominator to its composite parts:

```
 2     2^1
--- = -----
 3     3^1
```

Then we can write out the step in plain English:

```
If the composition of n contains {at least 1 in register 3}, then
	decrement {1 in register 3} AND
  increment {1 in register 2}.
```

Or in a more discrete and program-ish way:

```
if (r3 >= 1) {
	r3 -= 1;
	r2 += 1;
}
```

Using a more extreme example, we could use a fraction like `365,625 / 242`, or `3^2 * 5^5 * 13^1 / 2^1 * 11^2`. This could be written as:

```
if (r2 >= 1 && r11 >= 2) {
  r2  -= 1;
	r11 -= 2;
	r3  += 2;
	r5  += 5;
	r13 += 1;
}
```

## Axioms

These are some things I've deduced after messing with this and seeing some programs.

- Numerators increment the primes that are present there.

- Denominators act as an if/elseif statement and decrement the primes that are present there.

- Functions can be thought of as a giant while loop with a single if/elseif chain inside. e.g. the pointless program `(2/3, 5/4)` would look like:

  ```pseudocode
  while true {
  	if (r3 >= 1) {
  		r3 -= 1;
  		r2 += 1;
  	} else if (r2 >= 2) {
  		r2 -= 2;
  		r5 += 1;
  	} else {
  		break;
  	}
  }
  ```

- A fraction with a denominator of 1 means the program will not ever go beyond it, as it will always be true. For example, the final fraction in PRIMEGAME[6] is `55/1`, as it should repeatedly put out prime numbers forever.

- A fraction with a numerator of 1 means that the number in the denominator's register(s) will need to be zero before it ever reaches a fraction beyond it. For instance, in the multiplication program[7], the fraction `1/11` defines the end of a certain state; to get past that fraction and to the other state, the `11` register needs to be depleted to `11^0`.

- It is not possible for a FRACTRAN denominator to directly test if a variable is 0 (However, an indirect test can be implemented by creating a default fraction that is placed after other fractions that test a particular variable.).[1]

## Examples[10]

You can find a lot more details on each of these in the references below.

### Comparators

```
Greater Than

INPUT (n): 2^a * 3^b * 5^isGreater
OUTPUT:    5^isGreater

r2: a // first number
r3: b // second number
r5: isGreater // boolean; starts off at 1

(
    1 / 6,
    1 / 15,
    1 / 2,
    1 / 3
)
```

```
Less Than

INPUT (n): 2^a * 3^b * 5^isLess
OUTPUT:    5^isLess

r2: a // first number
r3: b // second number
r5: isLess // boolean; starts off at 1

(
    1 / 6,
    1 / 10,
    1 / 2,
    1 / 3
)
```

```
Equal To

INPUT (n): 2^a * 3^b + 5^isEqual
OUTPUT:    5^isEqual

r2: a // first number
r3: b // second number
r5: isEqual // boolean; starts off at 1

(
    1 / 2 * 3,
    1 / 2 * 5,
    1 / 3 * 5,
    1 / 2,
    1 / 3
)
```

### Subtraction

```
INPUT (n): 2^a * 3^b
OUTPUT:    2^a - b (or) 3^b - a

r2: a // first number
r3: b // second number

(
    1 / 2 * 3
)
```

### Multiplication

```
INPUT (n): 2^a * 3^b
OUTPUT:    5^a * b

r2: a // first number
r3: b // second number
r5: Product // resulting product
r7: Temp // aids in the repeated addition
r11,r13: State Beta One and Two // changes to restart addition process

(
    5 * 7 * 13 / 3 * 11,
    11 / 13,
    1 / 11,
    3 / 7,
    11 / 2,
    1 / 3,
)
```

### Division

```
INPUT (n): 2^a * 3^b
OUTPUT:    5^a / b, 7^a % b

r2: Dividend
r3: Divisor
r5: Quotient
r7: Remainder
r11-r13: State Alpha One and Two // starts with Alpha One at 1
r17-r19: State Beta One and Two

(
    7 * 13 / 2 * 3 * 11,
    11 / 13,
    1 / 3 * 11,
    5 * 17 / 11,
    3 * 19 / 7 * 17,
    17 / 19,
    11 / 17,
    1 / 3
)
```

### [Euler Problem 001](https://projecteuler.net/problem=1)

*Honestly, this is terrible, but it does work. The answer comes out to 7^233,168, which is about 10^(10^5.29)*

```
INPUT (n): 13^State Alpha One
OUTPUT:    7^sum

r2:          total
r3:          three
r5:          five
r7:          sum
r11:         temp
r13,r17:     State Alpha One and Two
r19,r23,r29: State Beta Three, Five, and ThreeAndFive
r31,r37:     State Gamma One and Two
r41,r43:     State Delta One and Two
r47:         end

(
    47 / 2^1000 * 13,
    17 / 3 * 5 * 13,
    13 / 17,
    19 / 3 * 13,
    23 / 5 * 13,
    29 / 13,
    3 * 5^5 * 31 / 19,
    3^3 * 5 * 31 / 23,
    3^3 * 5^5 * 31 / 29,
    7 * 11 * 37 / 2 * 31,
    31 / 37,
    41 / 31,
    2 * 43 / 11 * 41,
    41 / 43,
    13 / 41
)
```

## References

1. https://en.wikipedia.org/wiki/FRACTRAN
2. https://wiki.xxiivv.com/site/fractran.html
3. https://www.youtube.com/watch?v=548BH-YFT1E
4. [John Conway's original paper](https://www.gwern.net/docs/cs/1987-conway.pdf)
5. https://esolangs.org/wiki/Fractran
6. https://link.springer.com/chapter/10.1007%2F978-1-4612-4808-8_2
7. https://en.wikipedia.org/wiki/FRACTRAN#Multiplication
8. http://raganwald.com/2020/05/03/fractran.html
9. https://github.com/raganwald/FRACTRAN
10. Example Programs
    - [Comparators](./Comparators.fractran.txt)
    - [Subtraction](./Subtraction.fractran.txt)
    - [Multiplication](./Multiplication.fractran.txt)
    - [Division](./Division.fractran.txt)
    - [Euler Problem 001](./Euler001.fractran.txt)
