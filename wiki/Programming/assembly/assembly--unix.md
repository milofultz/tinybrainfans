---
title: Assembly (Unix)
description: Assembly on Unix is largely the same between Mac and Linux computers.
---

{{Assembly}} on {{Unix}} is largely the same between {{MacOS}} and {{Linux}} computers.

## Compilation, Linking, and Execution

### Compiler

You will first need a program to compile your assembly into machine code. Most common is the program [nasm][], which can be installed on {{OSX|MacOS}} using [homebrew][] with `brew install nasm`.

### Your First Program

Create a file called `hello_world.asm`. Copy this into it's contents:

```assembly
; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit macOS only.
; ----------------------------------------------------------------------------------------
 
        global    start                   ; nasm-specific way to define a location for the linker
 
        section   .text                   ; The .text section holds all the instructions for the 
                                          ; assembler to execute.
start:                                ; The label that is referenced in the above global call
        mov       rax, 0x02000004         ; system call for write (copy param Y into param X)
        mov       rdi, 1                  ; file handle 1 is stdout
        mov       rsi, message            ; address of string to output
        mov       rdx, 13                 ; number of bytes (message is 13 chars long)
        syscall                           ; invoke operating system to do the write
        mov       rax, 0x02000001         ; system call for exit
        xor       rdi, rdi                ; exit code 0
        syscall                           ; invoke operating system to exit
 
        section   .data                   ; The .data section contains constants
message:                              ; The label referenced above
        db        "Hello, World", 10      ; note the newline at the end
```

### Assembling Your Code

Assembling your code will translate it from the human readable assembly language into a file object. The following bash command will run `nasm` using the Mach-O 64bit object `-f`ile notation format used by the 64-bit version of {{MacOS}} and create `-o`utput `hello_world.o`.

```bash
$ nasm -f macho64 hello_world.asm -o hello_world.o
```

### Linking Your File

[Linking](https://en.wikipedia.org/wiki/Linker_%28computing%29) your newly created output file will pull all the needed libraries into a single executable. The following {{bash}} command will run `ld`, the GNU linker, and finish the creation of your executable.

```bash
$ ld -macosx_version_min 10.7.0 hello_world.o -o hello_world
```

The `-macosx_version_min` flag is added to remove the warning that is present without it. I read that it still builds fine without it, but that has not been true in my experience.

### Executing Your File

```bash
$ ./hello_world
Hello, World
```

Running `./hello_world` in {{bash}} should result in the message being displayed.

## References

1. https://medium.com/@thisura1998/hello-world-assembly-program-on-macos-mojave-d5d65f0ce7c6
2. https://cs.lmu.edu/~ray/notes/nasmtutorial/
3. https://stackoverflow.com/questions/52830484/nasm-cant-link-object-file-with-ld-on-macos-mojave
4. https://www.nasm.us/doc/
6. https://www.youtube.com/watch?v=qhkEOyK1ek0
7. https://www.youtube.com/watch?v=wLXIWKUWpSs
8. https://github.com/camsaul/hello_world_x86_64_asm_os_x
9. http://zathras.de/angelweb/blog-learn-nasm-on-os-x.htm
10. http://caswenson.com/2009_09_26_assembly_language_programming_under_os_x_with_nasm
11. https://lord.io/assembly-on-osx/
12. https://orangejuiceliberationfront.com/intel-assembler-on-mac-os-x/

[nasm]: https://nasm.us/
[homebrew]: https://brew.sh/
