---
title: Assembly (6502)
description: Assembly is an extremely low-level human-readable language that has a strong relation between the code and the corresponding machine code.
---

Assembly is an extremely low-level human-readable language that has a strong relation between the code and the corresponding {{machine code}}.

The Motorola 6502 is a microcontroller based on their 6800 series, but simplified, less expensive, and faster.

<!--

## Setup

Insert emulation/compilation instructions here

-->

## Syntax

### Types

| Type        | Syntax | Notes                                               |
| ----------- | ------ | --------------------------------------------------- |
| Hexadecimal | `$xy`  | `x` are hex digits. Trailing numbers can extend.    |
| Decimal     | `xy`   | `x` are decimal digits. Trailing numbers can extend |

### Addressing Modes

These will all use `STA` but can be used with any command that uses an address.

| Type         | Syntax      | Effect                                                       |
| ------------ | ----------- | ------------------------------------------------------------ |
| Absolute     | `STA $c000` | Look up the value at this full memory location               |
| Zero page    | `STA $c0`   | Look up the value at `$00c0`, `c0` within the zero page      |
| Absolute, X | `STA $c000,X` | Look up the value at `$c000` + the value in register X (also can be used with Y) |
| Zero page, X | `STA $c0,X` | Look up the value at `$00c0` + the value in register X (also can be used with Y) |
| Immediate | `#$c0` | Use value `$c0` |
| Relative | `$c0` or `label` | Go `$c0` bytes forward/backward (to get to label position) |
| Implicit | `INX` | Do what instruction implies (no args) |
| Indirect | `$c000` | Do instruction found at memory address `$c000` and the following byte |
| Indexed Indirect | `STA ($c0,X)` | Store in A the value at `$00c0` + `X` |

### Commands

A **value** refers to a number prefaced by a `#`, whereas an **address/location** refers to a hexadecimal address.

| Command | Argument(s)                                               | Effect                             |
| ------- | --------------------------------------------------------- | ---------------------------------- |
| `BRK`   |                                                           | Break out of the program           |
| `LDA n` | n: value or memory address/location where value is stored | Load n into register A             |
| `STA n` | n: memory address/location                                | Store value in register A at  n    |
| `TAX`   |                                                           | Transfer value in A to X           |
| `INX`   |                                                           | Increment value in X by 1          |
| `ADC n` | n: value or memory address/location where value is stored | Add n with carry to the A register |

#### Flag Commands

| Command | Argument(s)                                               | Effect                                                       |
| ------- | --------------------------------------------------------- | ------------------------------------------------------------ |
| `CPX n` | n: value or memory address/location where value is stored | Compare value at X to n. If equal, set `Z` flag to 1; else, set `Z` flag to 0. |

#### Branching

**label**: A label within 256 bytes of invocation

| Command     | Name                  | Effect                                                   |
| ----------- | --------------------- | -------------------------------------------------------- |
| `BEQ label` | Branch on EQual       | If `Z` flag is 1 (comparison was equal), go to label     |
| `BNE label` | Branch on Not Equal   | If `Z` flag is 0 (comparison was not equal), go to label |
| `BCC label` | Branch on Carry Clear |                                                          |
| `BCS label` | Branch on Carry Set   |                                                          |



## References

- http://skilldrick.github.io/easy6502/
- https://wiki.xxiivv.com/site/assembly.html
- https://git.sr.ht/~rabbits/famicom_cookbook/tree/master/item/README.md
- https://www.youtube.com/watch?v=lsvSZamCCBM
- https://en.m.wikibooks.org/wiki/6502_Assembly
- https://archive.org/details/6502_Assembly_Language_Subroutines/page/n15/mode/2up
