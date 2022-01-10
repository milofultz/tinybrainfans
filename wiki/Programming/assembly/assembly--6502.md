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

## Memory Locations

### `$0000 - $00ff` - Zero Page

This stores commonly used game variables as they can be accessed with only two digit addresses (see [addressing modes](#addressing-modes)).

### `$0200 - $05ff` - Display

This stores values to be rendered on the display. Each row of the screen is represented by `$20` values stored inline, rendering left to right. e.g. the first row of the screen is held in `$0200` - `$021f`; the second row is held in `$0220` - `$023f`.

## Syntax

### Literals

| Type        | Syntax | Notes                                               |
| ----------- | ------ | --------------------------------------------------- |
| Binary | `%nnnnnnnn` | `n` is a binary digit. Trailing numbers can extend |
| Hexadecimal | `$xy`  | `xy` are hex digits. Trailing numbers can extend |
| Decimal | `xy` | `xy` are decimal digits. Trailing numbers can extend |

### Flags

| Flag | Name | Notes                                               |
| --- | --- | --- |
| C | Carry Flag | The carry flag is set if the last operation caused an overflow from bit 7 of the result or an underflow from bit 0. This condition is set during arithmetic, comparison and during logical shifts (or explicitly). |
| Z | Zero Flag | The zero flag is set if the result of the last operation as was zero. |
| I | Interrupt Disable | The interrupt disable flag is set if the program has executed a `SEI` instruction. While this flag is set the processor will not respond to interrupts from devices until it is cleared by a `CLI` instruction. |
| D | Decimal Mode Flag | While the decimal mode flag is set the processor will obey the rules of Binary Coded Decimal (BCD) arithmetic during addition and subtraction. The flag can be explicitly set using `SED` and cleared with `CLD`. |
| B | Break Command | The break command bit is set when a `BRK` instruction has been executed and an interrupt has been generated to process it. |
| V | Overflow Flag | The overflow flag is set during arithmetic operations if the result has yielded an invalid 2's complement result (e.g. adding to positive numbers and ending up with a negative result: 64 + 64 => -128). It is determined by looking at the carry between bits 6 and 7 and between bit 7 and the carry flag. |
| N | Negative Flag | The negative flag is set if the result of the last operation had bit 7 set to a one. |

### Addressing Modes

These will all use `STA` but can be used with any command that uses an address.

| Type         | Syntax      | Effect                                                       |
| ------------ | ----------- | ------------------------------------------------------------ |
| Absolute     | `LDA $c000` | Load the value at this full memory location            |
| Zero page    | `LDA $c0` | Load the value at `$00c0`, `c0` within the zero page   |
| Absolute, X | `LDA $c000,X` | Load the value at `$c000` + the value in register X (e.g. if X is `$01`, load value at memory location `$c001`) |
| Zero page, X | `LDA $c0,X` | Load the value at `$00c0` + the value in register X (e.g. if X is `$01`, load value at memory location `$c001`) |
| Immediate | `LDA #$c0` | Load value `$c0` |
| Relative | `$c0` or `label` | Go `$c0` bytes forward/backward (to get to label position). Used with branching and jump commands (see below) |
| Implicit | `INX` | Do what instruction implies (no args) |
| Indirect | `LDA ($c000)` | Load value at memory address `$c000` and the following byte, with the first address being the *least* significant byte, and the following address the *most* significant byte (e.g. in this example, if  `$00c0` holds `01` and `$00c1` holds `0f`, it would dereference to `$0f01`). |
| Indexed Indirect | `LDA ($c0,X)` | Load value at the address (`$00c0` + `X`), with the resulting first address being the *least* significant byte, and the following address the *most* significant byte (e.g. in this example, if `X` was `01`, we would look at the address `$00c1`. If `$00c1` holds `01` and `$00c2` holds `0f`, it would dereference to `$0f01`). *NOTE: Can only be used with X* |
| Indirect Indexed | `LDA ($c0),Y` | Load value at the address found at `$00c0` plus the *value* of `Y`, with the resulting first address being the *least* significant byte, and the following address the *most* significant byte (e.g. in this example, lets say `Y` was `01`. We would look at the address `$00c0`. If `$00c0` holds `01` and `$00c1` holds `0f`, it would dereference to `$0f01` *plus* the value of `Y`, resulting in `$0f02`). |

### Commands

A **value** refers to a number prefaced by a `#`, whereas an **address/location** refers to a hexadecimal address.

| Command       | Argument(s)                                               | Effect                              |
| ------------- | --------------------------------------------------------- | ----------------------------------- |
| `BRK`         |                                                           | Break out of the program            |
| `org $n` | `$n`: Number | Set program origin to `$n`|
| `LDA n`       | `n`: value or memory address/location where value is stored | Load `n` into register A            |
| `STA n`       | `n`: memory address/location                              | Store value in register A at `n`   |
| `TAX`         |                                                           | Transfer value in A to X            |
| `INX` / `DEX` |                                                           | Increment/Decrement value in X by 1 |
| `ADC n`       | `n`: value or memory address/location where value is stored | Add `n` with carry to the A register |

#### Flag Commands

These commands are used solely for the purpose of changing and setting flags.

| Command           | Argument(s)                                               | Effect                                                       |
| ----------------- | --------------------------------------------------------- | ------------------------------------------------------------ |
| `CMP n` / `CPX n` / `CPY n` | n: value or memory address/location where value is stored | Compare value at A/X/Y to n. If equal, set `Z` flag to 1; else, set `Z` flag to 0. *Note: behind the scenes, [these instructions are doing subtraction](http://www.6502.org/tutorials/compare_beyond.html#2.1)*. |
| `SEI` / `CLI` |  | Set/Clear Interrupt Disable |

#### Branching

**label**: A label that must be within 256 bytes of invocation

Any label can be substituted for a direct memory address.

| Command             | Name                                        | Effect                                                       |
| ------------------- | ------------------------------------------- | ------------------------------------------------------------ |
| `BEQ label`         | Branch on EQual                             | If `Z` flag is 1 (comparison was equal), go to label         |
| `BNE label`         | Branch on Not Equal                         | If `Z` flag is 0 (comparison was not equal), go to label     |
| `BCS label`         | Branch on Carry Set                         | If carry flag is 1 (set), go to label                        |
| `BCC label`         | Branch on Carry Clear                       | If carry flag is 0 (not set), go to label                    |
| `JMP label`         | Unconditional Jump                          | Jump directly to label                                       |
| `JSR label` / `RTS` | Jump to SubRoutine / ReTurn from Subroutine | Jump directly to label and push current address - 1 to the {{stack}}. This will be retrieved via the return statement. |
| `BVS label` | Branch on oVerflow Set | If `V` flag is set, or bit 6 is set when using `BIT`, go to label |
| `BVC label` | Branch on oVerflow Clear | If `V` flag is not set, or bit 6 is not set when using `BIT`, go to label |
| `BMI label` | Branch on MInus | If `N` flag is set, or bit 7 is set when using `BIT`, go to label |
| `BPL label` | Branch on PLus | If `N` flag is not set, or bit 7 is not set when using `BIT`, go to label |

#### {{Stack}}

| Command     | Name                  | Effect                                                   |
| ----------- | --------------------- | -------------------------------------------------------- |
| `PHA` | PusH Accumulator | Push the accumulator onto the top of the stack |
| `PLA` | PulL (Pop) Accumulator | Pop the accumulator off the top of the stack |

#### Bitwise Operators

| Command     | Parameters | Effect                                                   |
| ----------- | --- | -------------------------------------------------------- |
| `AND n` | `n`: Value or address | Bitwise AND of value of `n` or value at address `n` against the accumulator register |
| `LSR [n]` | `n`: Value or address (if omitted, default to accumulator) | Bitwise shift right |

## References

- http://skilldrick.github.io/easy6502/
- https://famicom.party/book/
- https://wiki.xxiivv.com/site/assembly.html
- https://git.sr.ht/~rabbits/famicom_cookbook/tree/master/item/README.md
- https://www.youtube.com/watch?v=lsvSZamCCBM
- https://en.m.wikibooks.org/wiki/6502_Assembly
- https://archive.org/details/6502_Assembly_Language_Subroutines/page/n15/mode/2up
- https://taywee.github.io/NerdyNights/nerdynights/asmfirstapp.html
- https://rosettacode.org/wiki/Category:6502_Assembly
- https://www.middle-engine.com/blog/posts/2020/06/23/programming-the-nes-the-6502-in-detail
- https://irkenkitties.com/blog/2015/03/29/creating-sound-on-the-nes/
- http://www.6502.org/tutorials/compare_beyond.html
- http://visual6502.org/JSSim/index.html

Instructions and Flags Reference:

- http://www.6502.org/tutorials/6502opcodes.html
- https://retroscience.net/writing-6502-assembler.html
- http://www.obelisk.me.uk/6502/registers.html#Z
- https://cyborgsystems.loadcode.co.uk/cpu/6502/
- https://masswerk.at/6502/6502_instruction_set.html
- https://wiki.cdot.senecacollege.ca/wiki/6502_Jumps,_Branches,_and_Procedures

Examples:

- https://github.com/milofultz/adventofcode2015/
- https://milofultz.com/2021/11/14/sorting-in-6502
- https://wiki.nesdev.org/w/index.php/Random_number_generator
