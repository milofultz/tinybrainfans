---
title: Proquints
description: Proquints are a way to encode numbers in pronounceable consonant/vowel combinations.
---

Proquints are a way to encode numbers in pronounceable consonant/vowel combinations.

## The Letters

The consonants and vowels have their own significance, represented as a 4-bit and 2-bit number, respectively.

### Consonants

Number | Hex | Binary | Character
--- | --- | --- | ---
0 | `0` | `0000` | b
1 | `1` | `0001` | d
2 | `2` | `0010` | f
3 | `3` | `0011` | g
4 | `4` | `0100` | h
5 | `5` | `0101` | j
6 | `6` | `0110` | k
7 | `7` | `0111` | l
8 | `8` | `1000` | m
9 | `9` | `1001` | n
10 | `a` | `1010` | p
11 | `b` | `1011` | r
12 | `c` | `1100` | s
13 | `d` | `1101` | t
14 | `e` | `1110` | v
15 | `f` | `1111` | z

### Vowels

Number | Hex | Binary | Character
--- | --- | --- | ---
0 | `0` | `00` | a
1 | `1` | `01` | i
2 | `2` | `10` | o
3 | `3` | `11` | u

## Using Proquints

A 16-bit chunk of data can be represented as a proquint. To do this, we first have to change the number into its binary representation and then calculate the corresponding consonant (`con`) or vowel (`vo`):

```
  0 1 2 3 4 5 6 7 8 9 A B C D E F
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 |con    |vo |con    |vo |con    |
 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

We then go bit by bit through the binary number, creating these 4-bit consonants and 2-bit vowels as we traverse the whole 16-bit number, putting them together into a single word.

To decode this, we just reverse this process, going letter by letter and putting those bits into their proper slots.

If your number is above 16-bits, this process can be extended, with the proquints combined with a hyphen, e.g. `boron-mapin`.

### Number to Proquint

Let's start with a 16-bit number (0-65,535), like `50,416`.

First step is to convert it into binary: `1100010011110000`, with every four bits broken up for readability. 

Now we will break up the binary number into meaningful chunks for the proquint conversion: `1100`, `01`, `0011`, `11`, `0000`. If we go through the above table, we end up with the proquint `cigub`.

### Proquint to Number

Let's start with a five letter combination from the tables above: `potus`. 

We go through each character in the table and place their binary representations into a new number: `1010`, `10`, `1101`, `11`, `1100`. Putting it all together, it makes the binary number: `1010101101111100`.

Decoding this into decimal, we end up with `43,900`.

## References

1. https://arxiv.org/html/0901.4016
1. https://codeberg.org/milofultz/proquabet
