---
title: ed
description: ed is a line editor that is included with most *nix machines.
---

ed is a line editor that is included with all {{\*nix|Unix}} machines. The language used in ed is the precursor to {{Vim}} and other \*nix tools, so it is useful in helping to understand the logic behind many of their commands.

```shell
$ ed -p ">" path/to/file.txt
```

This will load the file into the buffer for you to work on. Don't worry, it's not broken.

The optional `-p ">"` argument says to make the default command prompt for ed `>` instead of a blank line. This can be any string.

## Basics

Command  | Description
--- | ---
`q` | Quit
`w` | Write buffer to current file
`e filename` | Open `filename` for editing
`u` | Undo (ed only saves one command, so be careful!)

If you receive `?` after typing a command, type `h` to see what error occurred. If you want the error messages to always print, you can type `H`.

## Traversing The File

Command  | Description
--- | ---
`n` | Set current line to `n` in buffer
`^n` | Set current line to `n` lines before current line
`n,m` | Range of lines from `n` to `m`
`.` | Current line in buffer
`-` | Previous line in buffer
`+` | Next line in buffer
`$` | Set last line as current line
`,` | From first to last line. Same as `1,$`
`;` | From current line to last line. Same as `.,$`

## File Editing

The following commands can all be preceded by an address, address symbol or range. If not preceded by an address, symbol, or range, current line is used.

Command | Description
--- | ---
`p` | Print line[s]
`n` | Print line[s] with line numbers
`t[y]` | Copy line[s] to line after `y` or after current line if not specified.
`m[y]` | Move line[s] to before line `y`
`d` | Delete line[s]
`j` | Joins the specified line with the following line, or the range of lines together, replacing the first line with their joined text

Each of the following will enter insert mode.

Command | Description
--- | ----
`i` | Insert in line before specified line
`a` | Append to end of specified line
`c` | Replace ("change") the specified line
`.` | Exit insert mode

## Regular Expressions

This is a deep well I won't cover fully here, but basic searches can be done by using `/pattern/`. It will set the current line to the first match.

## References

1. https://linux.die.net/man/1/ed
1. https://elly.town/d/blog/2015-10-03-ed-tutorial.txt
1. https://www.tiltedwindmillpress.com/product/ed/
1. https://www.gnu.org/software/ed/manual/ed_manual.html
1. https://www.gnu.org/fun/jokes/ed-msg.html
1. https://www.tuhs.org/cgi-bin/utree.pl?file=V7/usr/src/cmd/ed.c
