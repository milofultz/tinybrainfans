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

Going through this section, I *highly* recommend going over the above example between each section, integrating the new ideas to better understand what is happening.

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

## References

1. https://en.wikipedia.org/wiki/FRACTRAN
2. https://wiki.xxiivv.com/site/fractran.html
3. https://www.youtube.com/watch?v=548BH-YFT1E
4. [John Conway's original paper](https://www.gwern.net/docs/cs/1987-conway.pdf)
5. https://esolangs.org/wiki/Fractran
