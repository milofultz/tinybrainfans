---
title: Make
description: Make is a tool which controls the generation of executables and other non-source files of a program from the program's source files. 
---

Make is a tool which controls the generation of executables and other non-source files of a program from the program's source files.

When a file named `Makefile` exists in a directory, it can be invoked by running `make` in the command line.

## Makefile

> Makefiles are used to help decide which parts of a large program need to be recompiled.[2]

A makefile allows the running of multiple processes in a systematic way, establishing dependency structures and commands needed to complete specific tasks. The makefile is always named `Makefile`.

An example makefile could be as follows (from [2]):

```makefile
blah: blah.o
  cc blah.o -o blah # Runs third

blah.o: blah.c
  cc -c blah.c -o blah.o # Runs second

blah.c:
  echo "int main() { return 0; }" > blah.c # Runs first
```

> [This] Makefile has three separate *rules*. When you run `make blah` in the terminal, it will build a program called `blah` in a series of steps:
>
> - Make is given `blah` as the target, so it first searches for this target
> - `blah` requires `blah.o`, so make searches for the `blah.o` target
> - `blah.o` requires `blah.c`, so make searches for the `blah.c` target
> - `blah.c` has no dependencies, so the `echo` command is run
> - The `cc -c` command is then run, because all of the `blah.o` dependencies are finished
> - The top `cc` command is run, because all the `blah` dependencies are finished
> - That's it: `blah` is a compiled c program

## Rules

A rule is a **target** with an optional set of **dependencies**, and a set of **commands** to run. The first line of a Makefile is the "default goal"[3], but any specific rules can be specified as arguments following the `make` invocation.

The **target** is the destination file to be created or updated when the rule's commands finish running.

The **dependencies** are a list of files to be checked if they exist before running the rule.

The **commands** are the commands to be run if the rule is executed.

So from the above example's first rule, `blah` is the target, `blah.o` is the single dependency, and the `cc` line is the only command. 

### `all`

The `all` target will specify all the rules you want to run inplace of a single rule.

```makefile
all: one two three

one:
  # commands
two:
  # commands
three:
  # commands
```

### `clean`

The `clean` rule is a standard for cleaning up the directory of compiled executables or whatever[3]. Usually looks something like this:

```makefile
clean:
  rm blah.o
```

Assuming this rule is not the default rule and the word `clean` is not referenced as a dependency in any other rule, this can only be invoked by running `make clean`.

## Variables

Command line arguments can be brought in using a `key=value` structure, referring to the `key` within the Makefile as `$(key)`.

**Makefile**

```makefile
default:
  gcc -lncurses $(f).c
```

**Command line**

```bash
$ make f=pomodoro
# gcc -lncurses pomodoro.c
$ make f='timer'
# gcc -lncurses timer.c
```

## References

1. https://www.gnu.org/software/make/
1. https://makefiletutorial.com/
1. http://web.mit.edu/gnu/doc/html/make_2.html
