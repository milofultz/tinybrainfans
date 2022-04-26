---
title: ed
description: ed is a line editor that is included with most *nix machines.
---

ed is a line editor that is included with all {{\*nix|Unix}} machines. The language used in ed is the precursor to {{Vim}} and other \*nix tools, so it is useful in helping to understand the logic behind many of their commands.

```shell
$ ed path/to/file.txt
```

This will load the file into the buffer for you to work on. Don't worry, it's not broken.

## Basics

Command  | Description
--- | ---
`q` | Quit
`w` | Write buffer to current file
`u` | Undo (ed only saves one command, so be careful!)

If you receive `?` after typing a command, type `h` to see what error occurred. If you want the error messages to always print, you can type `H`.

## Traversing The File

Command  | Description
--- | ---
`n` | Set current line to `n` in buffer
`^n` | Set current line to `n` lines before current line
`n,m` | Range of lines from `n` to `m`
`.` | Current line in buffer
`$` | Set last line as current line
`-` | Previous line in buffer
`+` | Next line in buffer
`,` | From first to last line. Same as `1,$`
`;` | From current line to last line. Same as `.,$`

## File Editing

The following commands can all be preceded by an address, address symbol or range.

Command  | Description
--- | ---
`p` | Print line[s]
`n` | Print line[s] with line numbers
`d` | Delete line[s]
`m[y]` | Move line[s] to before line `y`
`j` | Joins the current line with the following line, or the range of lines together, replacing the first line with their joined text
`y` | Yanks (copies) the current line[s] into the 'cut' buffer
`x` | Pastes the 'cut' buffer after the current line

### Insert Mode

Each of these will enter insert mode. All of these can be preceded by `n`, which will be substituted for the current line in the buffer.

Command | Description
--- | ----
`[n]i` | Insert in line before current line
`[n]a` | Append to end of current line
`[n]c` | Replace the current line
`.` | Exit insert mode


## References

1. https://linux.die.net/man/1/ed
1. https://elly.town/d/blog/2015-10-03-ed-tutorial.txt
1. https://www.tiltedwindmillpress.com/product/ed/
1. https://www.gnu.org/software/ed/manual/ed_manual.html
1. https://www.gnu.org/fun/jokes/ed-msg.html
1. https://www.tuhs.org/cgi-bin/utree.pl?file=V7/usr/src/cmd/ed.c
