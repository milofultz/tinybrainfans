---
title: Assembly (Windows)
description: Assembly on Windows utilizes masm, Microsoft's proprietary assembler and linker.
---

{{Assembly}} on {{Windows}} utilizes [masm][], Microsoft's proprietary assembler and linker.

## Compilation, Linking, and Execution

### Compiler

You will first need [masm][] to compile your assembly into machine code. masm can be installed via the [MASM32 SDK][].

### Your First Program

Create a file called `hello_world.asm`. Copy this into it's contents:

```assembly
.386									; Tell assembler to use the 386 instruction set
.model flat, stdcall  					; Specify the flat memory model and use stdcall to pass parameters RtoL
option casemap :none					; Force case sensitivity

include \masm32\include\windows.inc  	; Include Win32 API constants and defs
include \masm32\include\kernel32.inc 	; Include ExitProcess
include \masm32\include\masm32.inc 		; Include StdOut

includelib \masm32\lib\kernel32.lib 	; The libraries necessary for the above includes to function
includelib \masm32\lib\masm32.lib

.data   								; The section for all initialized data
	HelloWorld db "Hello World!", 0  	; definebyte HelloWorld to equal Hello World! plus a NUL char

.code  									; Starting point for program code
start:   								; All code must live between this and end start
	invoke StdOut, addr HelloWorld  	; Run function StdOut with address of HelloWorld as the param 
	invoke ExitProcess, 0 				; Invoke ExitProcess with 0 (success) as the parameter

end start 
```

### Assembling Your Code

Assembling your code will translate it from the human readable assembly language into a file object. The following command will run masm and create output `hello_world.obj`.

```shell
\masm32\bin\ml /c /Zd /coff hello_world.asm
```

### Linking Your File

[Linking](https://en.wikipedia.org/wiki/Linker_%28computing%29) your newly created output file will pull all the needed libraries into a single executable. The following command will run Link, the masmlinker, and finish the creation of your executable.

```shell
\masm32\bin\Link /SUBSYSTEM:CONSOLE hello_world.obj
```

### Executing Your File

```shell
hello_world.exe
Hello, World!
```

Running `hello_world.exe`  in the command line should result in the message being displayed.

## masm-specific Syntax

### `invoke`

`invoke` is a special function in [masm][] to call functions without having to push parameters beforehand.

```masm
invoke SendMessage, [hWnd], WM_CLOSE, 0, 0

; equivalent to

push 0
push 0
push WM_CLOSE
push [hWnd]
call [SendMessage]
```

## References

1. https://doc.lagout.org/operating%20system%20/Windows/winasmtut.pdf
2. https://masm32.com/ 

[MASM32 SDK]: https://www.masm32.com/install.htm
[masm]: https://masm32.com/
