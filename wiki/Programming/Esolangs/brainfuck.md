---
title: Brainfuck
description: Brainfuck is a Turing-complete esolang created in 1993 by Urban Müller.
---

Brainfuck is an esoteric Turing-complete programming language that is comprised of only 8 instructions.

## Instructions

Brainfuck is read token by token, left to right. It utilizes an array of data and an input stream.

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

## References

1. https://en.wikipedia.org/wiki/Brainfuck
1. https://www.nayuki.io/page/brainfuck-interpreter-javascript
1. https://sange.fi/esoteric/brainfuck/
1. https://codeberg.org/milofultz/brainfuck
1. https://esolangs.org/wiki/Brainfuck
