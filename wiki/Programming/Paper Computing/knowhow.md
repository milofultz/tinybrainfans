---
title: The Know-how Computer
description: The Know-how Computer is a simple pen-and-paper computer to help educate people on basic computing and assembly programming.
tags: activities
---

The [Know-how Computer][] is a simple {{pen-and-paper computer|paper computing}} that was developed by Wolfgang Back and Ulrich Rohdein in the early 80's to help educate people on basic computing and {{assembly}} programming.

## Setup

### Materials

- Piece of paper (ruled is best, but anything works)
- Pen
- Coins, matches, or some kind of enumerable item

### Preparation

- Fold your paper in half.
- On the left half of the paper, number each line from 0 to 15. This is where your **code** will reside.
- On the right half of the paper, create four boxes labeled `R0` through `R3`. These are your **registers** and they will hold some number represented by your enumerables (e.g. 3 coins in `R0` would mean that `R0` has a value of 3).

You should now have something that looks something like this:

Line | Code | Register | Value 
--- | --- | --- | ---
0 | | R0 |
1 | | R1 |
2 | | R2 |
3 | | R3 |
4 |
5 |
6 |
7 |
... |

## Instructions

Before we get started, we need to learn some instructions. These are some of the most basic instructions in machine code and assembly and with these, you *technically* could compute anything as it's [Turing complete][] (as long as you have a LOT of paper and a LOT of time).

Instruction | Meaning
--- | ---
`JMP n` | Jump to line `n`
`INC Rn` | Increment the value in register `n` 
`DEC Rn` | Decrement the value in register `n` 
`ISZ Rn` | If the number in register `n` is zero, execute the next instruction. Else, skip the next instruction. 
`END` | Stop the execution of code and end the program.

## Usage

### First Program

For the most basic example, lets write a program that will decrement a register (`DEC`) until it reaches zero (`ISZ`), where we will end the program (`END`). We will assume that `R0` has 3 in it, represented by 3 of whatever you are using. Lets start by writing it in plain English:

- If `R0` has a value of zero, end the program. Else, continue to the next instruction.
- Decrease the value in `R0` by 1.
- Jump back to the beginning.

Now that we have this and have run through this in our head to ensure it works, we can put this into our instructions for our paper computer:

Line | Instruction
--- | ---
0 | `ISZ R0`
1 | `END`
2 | `DEC R0`
3 | `JMP 0`

Start with a number of enumerables in `R0` and go from line 0, using your pen as a pointer to which line you are currently on. Starting this program with any number will result in a constant decrementing until `R0` reaches zero, where the program will end. Try it!

### Addition

This is where things will get a little trickier to conceptualize. We will start with two values in different registers (`R0` and `R1`) and add them together into a single register. This will take a little more breaking down before we can turn it into code. 

Instead of being able to just move all of our enumerables from one register to another, we actually need to convert this into multiple instructions, since we don't have an instruction like `ADD` to make things easy. What is another way we can think of taking one thing from one register and putting it into another?

- Remove one item from first register
- Add one item to the second register
- Repeat until first register is empty

So now that we've translated addition into language that our code can adapt to, lets finish by putting our whole program in plain English again, assuming that we are adding `R0` and `R1` together, with the result of our addition residing in `R1`:

- If `R0` is zero, end the program. Else, do nothing and continue.
- Decrease the value in  `R0` by 1.
- Increase the value in `R1` by 1.
- Jump back to the beginning.

These are now all much simpler to translate back into our instruction set:

Line | Instruction
--- | ---
0 | `ISZ R0`
1 | `END`
2 | `DEC R0`
3 | `INC R1`
4 | `JMP 0`

Now go ahead and try this with your paper computer, again putting any number of enumerables in `R0` and `R1` and using your pen as a pointer for the current line.

## Challenges

With these challenges, you may need to extend the amount of lines and registers you have available. Don't be afraid to use as much as you need and streamline it later!

1. Make a program that subtracts one number from another and completes with the difference in one register.
2. Make a program that multiplies two numbers together and completes with the product in one register.
3. Make a program that divides two numbers and completes with the quotient in one register and the remainder in another.

### Solutions

1.

<spoiler tabindex="0">

This subtracts `R0` from `R1`, so `R1` must be larger than `R0`.

| Line | Instruction |
| ---- | ----------- |
| 0    | `ISZ R1`    |
| 1    | `END`       |
| 2    | `DEC R0`    |
| 3    | `DEC R1`    |
| 4    | `JMP 0`     |

</spoiler>

2.

<spoiler tabindex="0">

This multiplies the numbers in `R0` and `R1` together, placing the resulting product in `R2`.

| Line | Instruction |
| ---- | ----------- |
| 0  | `ISZ R1`|
| 1   | `END`|
| 2   | `DEC R1`|
| 3  | `ISZ R3`|
| 4   | `JMP 8` |
| 5   | `DEC R3`|
| 6   | `INC R0`|
| 7   | `JMP 3` |
| 8  | `ISZ R0` |
| 9   | `JMP 0` |
| 10  | `DEC R0`|
| 11  | `INC R2`|
| 12  | `INC R3`|
| 13  | `JMP 8` |

</spoiler>

3.

<spoiler tabindex="0">

This divides the number in `R0` by the number in `R1`, placing the quotient in `R2` and the remainder in `R3`.

| Line | Instruction |
| ---- | ----------- | 
| 0    | `ISZ R1` | 
| 1    | `END`       |
| 2    | `ISZ R0`    |
| 3    | `END`    |
| 4    | `ISZ R1`     |
| 5    | `JMP 10`    |
| 6    | `DEC R0`    |
| 7    | `DEC R1`     |
| 8    | `INC R3`    |
| 9    | `JMP 2`     |
| 10   | `INC R2`    |
| 11   | `ISZ R3`    |
| 12   | `JMP 2`    |
| 13   | `DEC R3`     |
| 14   | `INC R1`     |
| 13   | `JMP 11`     |

</spoiler>

## References

4. https://en.wikipedia.org/wiki/WDR_paper_computer
2. https://www.youtube.com/watch?v=Z27KQiBnkJI
3. https://wiki.xxiivv.com/site/papier.html

[Turing complete]: https://www.youtube.com/watch?v=RPQD7-AOjMI
[Know-how Computer]: https://en.wikipedia.org/wiki/WDR_paper_computer
