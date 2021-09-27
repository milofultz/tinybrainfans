---
title: The Little Man Computer
description: The Little Man Computer is a simple pen-and-paper computer to help educate people on basic computing and assembly programming.
tags: activities
---

The [Little Man Computer][] is a simple {{pen-and-paper computer|paper computing}} that was developed by created by Dr. Stuart Madnick in 1965 to help educate people on basic computing and {{assembly}} programming.

It is recommended you complete {{the Know-how Computer}} and its exercises before doing this one.

## Setup

### Materials

- Piece of paper (grid paper is best, but anything works)
- Pen
- A calculator

### Preparation

*Note: If you don't want to make this yourself, download the PDF from Chris Staecker's [Paper Computers #2: The Little Man Computer](https://www.youtube.com/watch?v=t-mOfXhgfQY&lc=UgwXIu1pFzxIC7pJyLd4AaABAg.9Slg5diLl1j9Slgcj6WvW6) video, which you can find in the description.*

The Little Man Computer consists of an inbox, an outbox, and a set of 100 mailboxes.

Turn your paper landscape and create a grid of 10x10, taking up about two thirds of the width of the page. Each of these boxes should be numbered 00 to 99, from top bottom, left to right. Split the last third of the page in half vertically, with the top half as the inbox, and the bottom half as the outbox.

## Instructions

These instructions will take a little more work to learn, as they don't come with the ease of text to help with understanding.

| Code | Instruction | Meaning                                                      |
| ----------- | -------------------------------------------------------| - |
| `000`  | `END` | Stop the execution of code and end the program.              |
| `1XY` | `ADD` | Add the contents of mailbox `XY` to the current value of your calculator. This replaces the calculator's value with the result. |
| `2XY` | `SUB` | Subtract the contents of mailbox `XY` from the current value of your calculator. This replaces the calculator's value with the result. |
| `3XY` | `STA` | Store the value of your calculator in mailbox `XY`. This replaces the current value at mailbox `XY`. |
| `5XY` | `LDA` | Load the value of mailbox `XY` into the calculator. This replaces the current calculator value. |
| `6XY` | `BRA`: Branch | Set the next instruction to be the one contained in mailbox `XY`. |
| `7XY` | `BRZ`: Branch If Zero (see note) | If the calculator contains the value `0` (or `000` to be verbose), set the next instruction to be the one contained in mailbox `XY`. Else, continue. |
| `8XY` | `BRP`: Branch If Positive (see note) | If the calculator contains a positive value (between `0`/`000` and `999`), set the next instruction to be the one contained in mailbox `XY`. Else, continue. |
| `901` | `INP` | Move the next value found in the inbox in the calculator. This removes the value from the inbox. |
| `902` | `OUT` | Place the value found in the calculator in the outbox. |

### Inbox and Outbox

The inbox and outbox can hold multiple values in what is called a 'stack', where the last number that was placed in it will be the first one out. Think of it like a deck of cards, where the cards are pulled off of the top when removed, and when new cards are added, they will be added on top of the deck. 

### Calculator

The calculator cannot handle numbers below `0`/`000`, nor any numbers over `999`. When executing subtraction, if the result ends up being below 0 (underflow), then this will cause the calculator to throw a negative flag, which would cause `7XY` to succeed and `8XY` to fail, assuming it is the next instruction.

### Mailboxes

Each mailbox can contain a number between `0`/`000` and `999`. The mailboxes can contain both data upon which we are operating, as well as instructions we are looking to execute. Keep this in mind, as it's possible for our instructions to encroach on our data, and the Little Man will get confused and just stop working if he gets instructions he can't understand.

## Process

The Little Man executes this process repeatedly until he runs out of stuff to do ([taken from Wikipedia](https://en.wikipedia.org/wiki/Little_man_computer)):

1. Check the Program Counter (your pen, in this instance) for the mailbox number that contains a program instruction (i.e. zero at the start of the program).
2. Fetch the instruction from the mailbox with that number. Each instruction contains two fields: 
   - An opcode (indicating the operation to perform) and
   - the address field (indicating where to find the data to perform the operation on).
3. Increment the Program Counter (pen) so that it contains the mailbox number of the next instruction.
4. Decode the instruction. If the instruction utilises data stored in another mailbox, then use the address field to find the mailbox number for the data it will work on (e.g. 'get data from mailbox 42').
5. Fetch the data (from the input, accumulator, or mailbox with the address determined in step 4).
6. Execute the instruction based on the opcode given.
7. Branch or store the result (in the output, accumulator, or mailbox with the address determined in step 4).
8. Return to the Program Counter to repeat the cycle or halt.

## Usage

### Addition

Like in {{the Know-how Computer}}, we'll start with addition, but in this case it will be a little different. In this case, we just have an add command handy (`1XY`), so how hard can it be? :)

First, we will add two numbers to the inbox to eventually get added together. Our result will be in the output, of course. We know that to add two things together, one of our values will need to already be in the calculator, and the other value will need to be found in a mailbox. So before we get to adding, we will need to do that:

1. Move the next value from the inbox into the calculator.
2. Store that value in mailbox 50 (this is not a significant number, any mailbox above 30 or so will be fine).
3. Move the next value from the inbox into the calculator.

So now we have the two numbers in place, ready to be added. Once we have this sum, we can place it into the outbox.

4. Add the number in mailbox 50 to the calculator, replacing the calculator's old value with the sum.
5. Put the value in the calculator into the outbox.

Now we can convert this into instructions that the Little Man can understand. Assuming we have our two numbers we want to add in the inbox:

| Mailbox | Instruction |
| ------- | ----------- |
| 00      | `901`       |
| 01      | `350`       |
| 02      | `901`       |
| 03      | `150`       |
| 04      | `902`       |
| 05      | `000`       |

Try this out with a few different numbers as inputs. Remember, the calculator can't handle numbers above 999.

### Return The Largest Number

Again we'll start by putting two numbers into our inbox. The question is: how will we know which number to return? And how can we tell the Little Man to return one thing or another based on that condition? What if we reframed the question as: which of our branching tools could help us execute one sequence of code over another based on a condition?

We have two conditional branches: branch if (the value in the calculator is) zero, and branch if (the value in the calculator is) positive. If we know these are our only branching options, and that they are both dependent on mathematical operations in the calculator, this leaves us with only two instructions that could help us solve this problem: `1XY` and `2XY`; `ADD` and `SUB`.

If we try using `ADD`, you will see that adding two numbers in either order results in no discernable difference: `100` + `50` is the same as `50` + `100`. So if we know this, then we are only left with the `SUB` instruction. Playing with `SUB`, we can see that the order definitely *does* matter. `100` - `50` (`50`) does not equal the same as `50` - `100` (`-50`). 

So knowing that we will need to use `SUB` leaves us with which branch we want to use: `7XY` or `8XY`; branch if zero, and branch if positive. If we look at the last example of `100` and `50`, we can see that one of the differences is positive and the other negative. This would lead to us using the branch if positive instruction after we perform our subtraction method.

Now that we know our tools, lets put this in plain English:

1. Load one number from the inbox into the calculator.
2. Store the number in our calculator into mailbox 50.
3. Load the next number from the inbox into the calculator.
4. Store the number in our calculator into mailbox 51.
5. Subtract the number in mailbox 50 from the current value of the calculator (this number should be the same as is in mailbox 51).
6. If the result is positive, return the number in mailbox 51.
7. Else, return the number in mailbox 50.

Now we can translate this into code the Little Man can understand:

| Mailbox | Instruction |
| ------- | ----------- |
| 00      | `901`       |
| 01      | `350`       |
| 02      | `901`       |
| 03      | `351`       |
| 04      | `250`       |
| 05      | `809`       |
| 06      | `550`       |
| 07      | `902`       |
| 08      | `000`       |
| 09      | `551`       |
| 10      | `902`       |
| 11      | `000`       |

## Challenges

1. Create a program that takes four numbers from the inbox and outputs them in reverse order.
2. Create a program that adds all numbers in the inbox, ending with a zero, and outputs the final sum. For example, an inbox of `[13, 426, 301, 95, 0]` would result in `835`.
3. Create a program that squares a number and outputs the product. The inbox number must be 31 or below.
4. Create a program that divides the first number in the inbox by the second. The output will be the quotient followed by the remainder.
5. Create a program that takes in numbers followed by operators. These operators will be `401` to add, `402` to subtract, and `400` to finish the calculation and output the result. For example, an inbox of `[20, 402, 15, 401, 95, 400]` would output `100`.

### Solutions

1.

<spoiler tabindex="0">

Assuming we have four numbers in our inbox.

| Mailbox | Instruction |
| ------- | ----------- |
| 00      | `901`       |
| 01      | `350`       |
| 02      | `901`       |
| 03      | `351`       |
| 04      | `901`       |
| 05      | `352`       |
| 06      | `901`       |
| 07      | `902`       |
| 08      | `552`       |
| 09      | `902`       |
| 10      | `551`       |
| 11      | `902`       |
| 12      | `550`       |
| 13      | `902`       |
| 14      | `000`       |

</spoiler>

2.

<spoiler tabindex="0">

Assuming the last number in the inbox is a zero.

| Mailbox | Instruction |
| ------- | ----------- |
| 00      | `508`       |
| 01      | `350`       |
| 02      | `901`       |
| 03      | `707`       |
| 04      | `150`       |
| 05      | `350`       |
| 06      | `602`       |
| 07      | `550`       |
| 08      | `902`       |
| 09      | `000`       |

</spoiler>

## References

1. https://en.wikipedia.org/wiki/Little_man_computer
2. https://www.youtube.com/watch?v=t-mOfXhgfQY&lc=UgwXIu1pFzxIC7pJyLd4AaABAg.9Slg5diLl1j9Slgcj6WvW6

[Little Man Computer]: https://en.wikipedia.org/wiki/Little_man_computer
