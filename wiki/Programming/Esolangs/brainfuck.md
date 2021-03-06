---
title: Brainfuck
description: Brainfuck is a Turing-complete esolang created in 1993 by Urban Müller.
---

Brainfuck is an esoteric Turing-complete programming language that is comprised of only 8 instructions.

## Instructions

Brainfuck is read token by token, left to right. It utilizes an array of data and an input stream.

Data bytes are assumed to store any value between 0 and 255 inclusive. Some implementations use wrapping (255 + 1 = 0, 0 - 1 = 255), while others do not (255 + 1 = 256, 0 - 1 = -1).

Token | Effect
--- | ---
`>` | Increment the data pointer
`<` | Decrement the data pointer
`+` | Increment the byte at the data pointer
`-` | Decrement the byte at the data pointer
`.` | Output the byte at the data pointer
`,` | Accept one byte of input and store at data pointer
`[` | If byte at data pointer is zero, jump to command after matching `]` 
`]` | If byte at data pointer is not zero, jump to command after matching `[` 

## Examples

### Addition

A simple program that adds 2 + 2 could be written like so:

```brainfuck
++>++[<+>-]
```

In brainfuck, as the interpreter/compiler will ignore any characters that are not the ones found above, we can add comments, notes, and newlines for clarity. So the example can be rewritten:

```brainfuck
Registers:

First addend/Sum
Second addend

++  // Set the value of the first addend to 2
>++ // Set the value of the second addend to 2
[   // While the second addend is not zero
  <+  // Increment the sum
  >-  // Decrement the second addend
]   // If the second addend isn't zero; continue
```

The process can be visualized like when using {{paper computers|paper computing}}, with multiple registers that are being incremented and decremented.

### Multiplication

This program will multiply two numbers (between 1 and 3) together and print out the result.

```
+++>+++[-<[->>+>+<<<]>>>[-<<<+>>>]<<]
>++++++++++++++++++++++++++++++++++++++++++++++++.
```

Expanded, it looks like this:

```brainfuck
Registers:

Multiplicand // First num
Multiplier   // Second num
Product
Temp         // Used for refilling multiplier

+++  // set multiplicand
>+++ // set multiplier
[    // while multiplier is not zero
    -   // decrement multiplier
    <   // add multiplicand to product
    [   // while multiplicand is not zero
        -   // decrement multiplicand
        >>+ // increment product
        >+  // increment temp
        <<<
    ]       // if multiplicand is not zero; continue
    >>> // add temp back to multiplicand
    [   // while temp is not zero
        -    // decrement temp
        <<<+ // increment multiplicand
        >>>
    ]        // if temp is not zero; continue
    <<
]
>    // add 0x30 to product for printing
++++++++++++++++
++++++++++++++++
++++++++++++++++
.

```

### Fibonacci[10]

This program will print the ASCII character found at each fibonacci number (`0x01`, `0x01`, `0x02`, `0x03`, `0x05`, etc.)

```brainfuck
+[.[->+>+<<]>]
```

Expanded:

```
+          // set 0th fib number to 1
[          // while next fib number is not 0
    .      // print current fib number
    [      // while previous fub number is not 0
        -  // decrement previous fib number
        >  // increment next fib number
        +  
        >  // increment 2nd next fix number
        +
        << // go back to previous fib number
    ]      // (if previous fib number is zero,)
    >      // set current fib number to next fib number
]
```

## References

1. https://en.wikipedia.org/wiki/Brainfuck
1. https://www.nayuki.io/page/brainfuck-interpreter-javascript
1. https://sange.fi/esoteric/brainfuck/
1. https://codeberg.org/milofultz/brainfuck
1. https://esolangs.org/wiki/Brainfuck
1. https://codeberg.org/milofultz/decrypting-the-original-brainfuck-interpreter
1. https://github.com/stedolan/bf.sed/blob/master/bf.sed
1. http://calmerthanyouare.org/2015/01/07/optimizing-brainfuck.html
1. https://git.sr.ht/~rabbits/uxn/tree/85a6d348ba93186eaa328f67c625fea1bacae1f4/item/projects/examples/exercises/brainfuck.tal
1. https://codegolf.stackexchange.com/a/42443/98237
1. http://brainfuck.org/
