---
title: Curses
description: Curses is a way to manipulate terminals mainly for text user interfaces in applications.
---

Curses is a way to manipulate terminals mainly for text user interfaces in applications.

## `ncurses.h`

The `ncurses.h` helper file in {{C}} includes a lot of other libraries, as well, which means you don't need to include them, as they may bloat your final compiled program[2]:

- `stdio.h`
- `unctrl.h`
- `stdarg.h`
- `stddef.h`

## Example

This is an example of ncurses, the most common curses library, from Dan Gookin's book[2] in {{C}}.

**goodbye.c**

```c
#include <ncurses.h> // Use the ncurses library

int main(void)
{
  initscr(); // allocates memory for present window which is called stdscr[4]
  addstr("Goodbye, cruel C programming!"); // add string to window
  refresh(); // flushes current window to the screen
  getch();   // waits for user input to exit

  endwin();  // call to end or exit our curses program[5]
  return 0;  // ended program without errors
}

```

**Compiling**

```bash
$ gcc -lncurses goodbye.c -o goodbye
# gcc        # the compiler
# -lncurses  # the curses linker
# goodbye.c  # our input file
# -o goodbye # our output compiled program
```

**Running**

```bash
$ ./goodbye
```

## Functions

### Cursor

- `move(row, column)` - Move the cursor to the Y,X point.

### Printing Text

- `printw(str[, arg1, arg2, ...])` - `printw` is `printf` for ncurses. Uses standard string formatting.
- `addstr(str)` - Print the string at the cursor.
- `addch(char)` - Print the current character at the cursor.

### Text Formatting

#### Styles

- `attron(attr[ | attr | ...])`/`attroff(attr[ | attr | ...])` - Set attributes on/off for the following text.
- `attrset(attr[ | attr | ...])` - Set attributes for the following text, resetting all previous attributes.

Attribute | Effect
--- | ---
`A_BOLD` | Bright text, bold text, thick text (depending on terminal type)
`A_DIM` | Dimmed text (not as bright as regular text)
`A_NORMAL` | Normal text
`A_REVERSE` | Inverse text
`A_STANDOUT` | Same as `standout()`
`A_UNDERLINE` | Underline text

#### Colors

- `int has_colors()` - Returns `TRUE` if terminal can render colors, and `FALSE` otherwise, using builtin defs for `TRUE` and `FALSE`.
- `int start_color()` - Allows colors to be used. Returns `OK` if allowed. Usually used right after `initscr`.

### User Input

- `int getch()` - Waits for user input and returns the inputted character.
- `getnstr(str, int n)` - Get user input up to `n` characters. On newline, stores input character buffer in `str`.

### Display

- `clrtoeol()` - Clears everything that is on the current line under the cursor[7].

## References

1. https://en.wikipedia.org/wiki/Curses_%28programming_library%29
1. https://www.goodreads.com/book/show/4460597-programmer-s-guide-to-ncurses
1. https://www.linuxhowtos.org/manpages/3x/ncurses.htm
1. https://www.sbarjatiya.com/notes_wiki/index.php/Using_ncurses_library_with_C
1. https://linux.die.net/man/3/endwin
1. https://manpages.debian.org/testing/ncurses-doc/start_color.3ncurses.en.html
1. https://stackoverflow.com/questions/5072881/how-to-clear-a-specific-line-with-ncurses
