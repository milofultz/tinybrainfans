---
title: Command Line Arguments in C
description: Creating terminal applications in C often relies on command line arguments.
---

Creating terminal applications in {{C}} often relies on command line arguments.

## Arguments

The main function of a C program takes in two arguments to handle command line arguments:

```c
int main (int argc, char *argv[])
{
  ...
}
```

`argc` is the number (**c**ount) of arguments provided, including the executable name. `argv` is the array of arguments, with item 0 being the name of the executable.

## Example

This example uses {{ncurses|Curses}}. It should print out all arguments you provide beyond the executable and wait for user entry before exiting.

**showargs.c**

```c
#include <string.h>
#include <ncurses.h>

int main (int argc, char *argv[])
{
    char task[255];

    initscr();

    if (argc == 1)
    {
        addstr("No arguments provided.");
        getch();

        endwin();
        return 0;
    }
    else
    {
        strcpy(task, argv[1]);

        for (int i = 2; i < argc; i++)
        {
          strcat(task, " ");
          strcat(task, argv[i]);
        }
        printw("%s", task);
        getch();

        endwin();
        return 0;
    }
}
```

**Compilation**

```bash
$ gcc -lncurses showargs.c -o showargs
```

**Executing**

```bash
$ ./showargs You can print all of these out
# Will display "You can print all of these out"
```

## References

1. https://duckduckgo.com/?t=ffab&q=argc+argv+c&ia=web
1. https://stackoverflow.com/questions/7174216/how-can-i-concatenate-arguments-in-to-a-string-in-c
