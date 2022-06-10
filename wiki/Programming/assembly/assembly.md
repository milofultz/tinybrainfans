---
title: Assembly
description: Assembly is an extremely low-level human-readable language that has a strong relation between the code and the corresponding machine code.
---

Assembly is an extremely low-level human-readable language that has a strong relation between the code and the corresponding {{machine code}}.

If you are just getting started with assembly, I highly recommend you get started by first checking out the {{paper computing}} page to get familiar with the foundations and fundamentals of assembly language.

## Compilation and Linking

For more specifics, visit the {{OSX|Assembly (Unix)}} and {{Windows|Assembly (Windows)}} assembly pages. 

You will first need a program to compile your assembly into machine code. Most common is the program [nasm][] for {{Unix}} systems and [masm][] for {{Windows}} systems.

After you have written your code, you will need to assemble your code, translating it from the human readable assembly language into a file object.

You will then need to [link](https://en.wikipedia.org/wiki/Linker_%28computing%29) your newly created output file. This will pull all the needed libraries into a single executable. 

## Syntax and Keywords

### Operators

| Command | Effect |
| -------------- | ------------------------------------------------------------ |
| `mov` *x*, *y* | *x* ← *y*                                                    |
| `and` *x*, *y* | *x* ← *x* & *y*                                           |
| `or` *x*, *y*  | *x* ← *x* \| *y*                                            |
| `xor` *x*, *y* | *x* ← *x* ^ *y*                                           |
| `add` *x*, *y* | *x* ← *x* + *y*                                              |
| `sub` *x*, *y* | *x* ← *x* – *y*                                              |
|  `mul` *x* | *EAX* ← *EAX* * *x* |
|  `div` *x* | *EAX* ← *EAX* ÷ *x* |
| `inc` *x*      | *x* ← *x* + 1                                                |
| `dec` *x*      | *x* ← *x* – 1                                                |

### Instructions

| Command                       | Effect                                                      |
| ----------------------------- | ----------------------------------------------------------- |
| `cmp` *x*, *y*                | Set the                                                     |
| `jmp` *label*                 | When this line is reached, jump to the line labeled *label* |
| `je` *label* / `jz` *label*   | When `ZF` is 0, jump to *label*                             |
| `jne` *label* / `jnz` *label* | When `ZF` is NOT 0, jump to *label*                         |

### [Pseudo-instructions](http://www.nasm.us/xdoc/2.11.02/html/nasmdoc3.html#section-3.2)

| Command   | Effect                                                       |
| --------- | ------------------------------------------------------------ |
| `syscall` | Invoke an operating system routine                           |
| `db`      | A pseudo-instruction that declares bytes that will be in memory when the program runs |

### `section`

A section is an assembler directive that tells the assembler what kind of code follows. Generally, you put code in a section called `.text` and your constant data in a section called `.data`.

## Registers

### 32-Bit General Purpose

Address | Name | Description
--- | --- | ---
EAX | Accumulator Register | calculations for operations and results data
EBX | Base Register | pointer to data in the DS segment 
ECX | Count Register | counter for string and loop operations 
EDX | Data Register | input/output pointer 
ESI | Source Index | source pointer for string operations 
EDI | Destination Index | destination pointer for string operations 
ESP | {{Stack}} Pointer | stack pointer, **should not be used** 
EBP | Base Pointer | pointer to data on the {{stack}} 

### 16-Bit Segment

| Address        | Name          | Description                                       |
| -------------- | ------------- | ------------------------------------------------- |
| CS             | Code Segment  | where instructions being executed are stored      |
| DS, ES, FS, GS | Data Segment  | data segment                                      |
| SS             | Stack Segment | where the stack for the current program is stored |

### 32-Bit Other

| Address | Name                | Description                                    |
| ------- | ------------------- | ---------------------------------------------- |
| EFLAGS  | Code Segment        | status, control, and system flags              |
| EIP     | Instruction Pointer | offset for the next instruction to be executed |

## Flags

### Carry Flag (`CF`)

The carry flag is set to 1 (true) when the second operand of an operation is smaller than the first. For example if you `cmp 2 1`, the result will be a `CF` of 1 (true), since 1 - 2 goes negative, meaning that the first operand is larger than the first.

### Overflow Flag (`OF`)

The overflow flag will be set to 1 (true) if the operation overflows beyond the bounds of the integers and their storage. This could happen if you are dealing with numbers that go beyond the boundaries involved (e.g. adding two numbers that go above 256 with an 8-bit unsigned integer, or adding two 8-bit unsigned integers that go beyond 128).

### Sign Flag (`SF`)

The sign flag will be set to 1 (true) after an arithmetic operation when the result is negative.  

### Zero Flag (`ZF`)

The zero flag is set after an arithmetic operation and will have a value of 1 (true) when the result is zero, and 0 (false) when the result is not zero.

## {{Stack}}

The {{stack}} is used to invoke a function or as temporary storage by pushing parameters in last in first out to be utilized by the function.

This will push the number 3 onto the stack and then write it to the EAX register.

```assembly
push 3
pop eax
ret
```

This will push three values to the stack **in reverse order of what the function expects, because LIFO**, and then invokes the function, which will use those values.

```assembly
push [var]   ; Push last parameter first
push 216     ; Push the second parameter
push eax     ; Push first parameter last

call _myFunc ; Call the function (assume C naming)

add esp, 12  ; Flush the three 4 byte values on the stack by 
             ; adding 12 to the stack pointer
```

## Games

There are lots of games that have recently come out to make assembly a little more accessible. Here are the references I have found and heard about from others:

- [Shenzhen IO](https://store.steampowered.com/app/504210/SHENZHEN_IO/)
- [TIS-100](https://store.steampowered.com/app/370360/TIS100/)
- [Human Resource Machine](https://store.steampowered.com/app/375820/Human_Resource_Machine/)
- [7 Billion Humans](https://store.steampowered.com/app/792100/7_Billion_Humans/)

## References

1. https://www.tutorialspoint.com/assembly_programming/assembly_basic_syntax.htm
2. https://www.youtube.com/watch?v=qhkEOyK1ek0
3. https://www.youtube.com/watch?v=wLXIWKUWpSs
4. https://doc.lagout.org/operating%20system%20/Windows/winasmtut.pdf
5. https://www.cs.uaf.edu/2015/fall/cs301/lecture/09_16_stack.html
6. https://www.cs.virginia.edu/~evans/cs216/guides/x86.html
7. https://www.hellboundhackers.org/articles/read-article.php?article_id=729
8. https://www.chibialiens.com/8086/8086CheatSheet.pdf
9. https://www.chibialiens.com/8086/
10. [IDE and debugger for many systems](https://8bitworkshop.com/v3.9.0/?platform=vcs&file=examples%2Fhello.a)

Game Boy:

1. https://github.com/pret/pokered
1. https://eldred.fr/gb-asm-tutorial/index.html

[masm]: https://www.masm32.com
[nasm]: https://nasm.us/
[homebrew]: https://brew.sh/

