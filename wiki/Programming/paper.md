---
title: Paper Computing
description: Paper computing is a way to learn about the most basic operation of Turing complete systems and programming in general.
---

Paper computing is a way to learn about the most basic operation of Turing complete systems and {{programming}} in general. This is also a great way to get familiar with the basics of machine code and {{assembly}}.

## Setup

### Materials

- Piece of paper (ruled is best, but anything works)
- Pen
- Coins, matches, or some kind of enumerable item

### Preparation

- On the left half of the paper, number each line from 0 to 15. This is where your **code** will reside.
- On the right half of the paper, create four boxes labeled `R0` through `R3`. These are your **registers** and they will hold some number represented by your enumerables (e.g. 3 coins in `R0` would mean that `R0` has a value of 3).

You should now have something that looks something like this:

Line | Code | Register | Value 
--- | --- | --- | ---
0 | | R0 |
1 | | R1 |
2 | | R2 |
3 | | R3 |
4 | | |
5 | | |
6 | | |
7 | | |
... | | |

## Instructions

Before we get started, we need to learn some instructions. These are some of the most basic instructions in machine code and assembly and with these, you *technically* could compute anything.

Instruction | Meaning
--- | ---
`JMP n` | Jump to line `n`
`INC Rn` | Increment the value in the `n` register 
`DEC Rn` | Decrement the value in the `n` register 
`ISZ Rn` | If the number in the `n` register is zero, skip the next instruction. Else, do nothing and continue as normal.
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

## References

1. https://en.wikipedia.org/wiki/Turing_completeness
2. https://www.youtube.com/watch?v=RPQD7-AOjMI
3. https://www.youtube.com/watch?v=Z27KQiBnkJI
4. https://wiki.xxiivv.com/site/papier.html
