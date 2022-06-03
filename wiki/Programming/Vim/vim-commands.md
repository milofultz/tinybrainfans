---
title: Vim Commands
description: Vim commands are notoriously arcane and weird, but quick once you learn them.
---

Vim commands are notoriously arcane and weird, but quick once you learn them.

All commands must be done in "Normal" mode, accessed by pressing `esc` if in write mode. Commands are case sensitive and must be confirmed with `Enter` unless otherwise noted. `<c-x>` means `Ctrl+x`.

Many of these commands derive from the original {{Unix}} text line editor `{{ed}}`. If you don't understand why things are the way they are here, pulling the thread of `ed` may benefit your understanding.

## Meta/File

Description | Command
--- | ---
Quit | `:q` 
Quit and do not save | `:cq` 
Save and quit | `ZZ` 
Save | `:w` 
Save and quit | `:wq` 
Save only if file changed and quit | `:x` 
Save As | `:w newFileName` 
Open for editing | `:e path/to/file`
Open for reading/viewing | `:v path/to/file`
Open file under cursor | `gf`
Go to next file in buffer | `:bn`
Go to previous file in buffer | `:bN`
See all files in buffer | `:ls` or `:buffers`

## Undo/Redo

Description | Command
--- | ---
Undo | `u`
Undo all changes to a line | `U` 
Redo | `<c-r>` 

### Find

Description | Command | Notes
--- | --- | ---
Find next or previous `pattern` | `/pattern` or `?pattern` | Go to next occurrence with `n` and previous with `N`
Find and replace from line `m` to line `n` | `:[m],[n]s/pattern/repl[/options]` | To replace all, add `g` option; for confirmation, use `c` option
Find and replace in whole file | `:%s/pattern/repl` | Same options apply as above

## Navigation

Description | Command
--- | ---
Move cursor (Left, Down, Up, Right) | `h`, `j`, `k`, `l` 
See current cursor location and information | `<c-g>` 
Go to start/end of next word | `w`/`e`
Go back a word | `b` 
Go to next instance of character `a` | `f[a]` 
Go to previous instance of character `a` | `F[a]` 
Go to character before next instance of character `a` | `t[a]` 
Go to character before previous instance of character `a` | `T[a]` 
Repeat last `f`/`F`/`t`/`T` in same direction | `;`
Repeat last `f`/`F`/`t`/`T` in opposite direction | `,`
Go to start/end of line | `0`/`$`
Go to line`n` | `[n]G` or `[n]gg` 
Go to beginning of file | `gg` 
Go to end of file | `G` 
Go to beginning of line | `0` 
Go to first non-space character of line |`^` 
Go to end of line | `$` 
Go to matching bracket under cursor; e.g. `(` goes to `)` and vice versa; includes `[]{}` | `%`
Go to next page | `<c-f>`
Go to next half page | `<c-d>`
Go to previous page | `<c-b>`
Go to previous half page | `<c-u>`


## Copy (Yank), Cut, and Paste

Copy is "yank" in Vim, so that's why they are "y".

Description | Command
--- | --- 
Copy entire line or `n` lines, including newline | `[n]Y`
Copy from cursor to end of line | `y$` 
Copy from cursor to first non-space character on the line | `y^`
Copy from cursor to start of line | `y0`
Cut entire line or `n` lines, including newline | `[n]dd`
Cut from cursor to end of line | `d$`
Cut from cursor to first non-space character on the line | `d^`
Cut from cursor to start of line | `d0`
Paste after the cursor | `p`
Paste before the cursor | `P`
Move line up one line | `ddkP`
Move line down one line | `ddp`

## Delete

Description | Command 
--- | ---
Delete entire line or `n` lines, including newline | `[n]dd`
Delete from current column to end of line | `D`
Delete whitespace from cursor until first non-whitespace character | `dw`
Delete contents from cursor to end of `n` words and enter Insert mode | `c[n]e` or `c[n]w`
Delete contents from cursor to end of `n` lines and enter Insert mode | `[n]C`
Delete character under cursor and enter Insert mode | `s`
Delete entire line and enter Insert mode | `S`
Delete contents of `n` lines and enter Insert mode | `c[n]c`
Replace letter under cursor with letter `l` | `r[l]`
Enter replace mode (like overwrite) | `R`

## Text Manipulation

Description | Command | Notes
--- | --- | ---
Insert mode | `i`|
Enter Insert mode at the beginning of the line | `I` |
Append after current character/at end of line | `a`/`A`|
Make a new line above/below current line and enter insert mode | `O`/`o` |
Insert (or retrieve) contents of `FILENAME` at cursor | `:r FILENAME`|
Insert (or retrieve) return of shell `command` at cursor | `:r !command`|
Insert on multiple lines[15] | `<c-v>`, select area, `I`, do edits, `esc` |
Append to multiple lines[14] | `V`, select lines, `:'<,'>s/$/text/` | `'<,'>` will get added to your command automatically after `:`
Join line below current line with current line[17] | `J`|
Flip capitalization | `~` |
Autocomplete whole line from file | `<c-x><c-l>` |
Autocomplete keyword from file | `<c-x><c-n>` |
Autocomplete definition from file | `<c-x><c-d>` |
Autocomplete filename from file | `<c-x><c-f>` |

## Modes

Mode | Command
--- | ---
Insert | `i`
Replace (overwrite) | `R`
Visual (selection using the cursor) | `v`
Visual line (selection of lines) | `V`
Visual block (selection of columns/lines) | `<c-v>`
Exit current mode | `ESC`

## Recording[18-19]

A register is any key (`[a-zA-Z0-9]`).

Description | Command
--- | ---
Start recording under register `n` | `qn` 
Stop recording | `q` |
Replay recorded keystrokes | `@n`
Replay last macro | `@@`

## Split Screen

Description | Command
--- | ---
Split current file horizontally | `<c-w> s`
Split current file vertically | `<c-w> v`
Navigate to different panes | `<c-w> {direction}`
Increase/decrease pane width | `<c-w> >`, `<c-w> <`
Increase/decrease pane height | `<c-w> +`, `<c-w> -`
Equalize pane height/width | `<c-w> =`
Close a pane | `<c-w> q`

## Misc

Description | Command
--- | ---
Toggle fold at next logical break | `za`
Execute shell command `x` | `:!x`
Execute last edit again at cursor | `.`
Suspend Vim and go to shell | `<c-z>`
Return to suspended Vim instance | `fg`

## References

1. https://www.vim.org/
1. https://www.cyberciti.biz/faq/how-to-save-existing-file-to-a-new-file-save-as-in-vi-vim/
1. https://evanhahn.com/vim-colon-x-command/
1. https://github.com/amix/vimrc
1. https://danielmiessler.com/study/vim/
1. https://elijahmanor.com/blog/neovim-tmux
1. https://linuxize.com/post/how-to-copy-cut-paste-in-vim/
1. https://www.maketecheasier.com/cheatsheet/vim-keyboard-shortcuts/
1. https://stackoverflow.com/questions/741814/move-entire-line-up-and-down-in-vim
1. https://vim.fandom.com/wiki/Accessing_the_system_clipboard
1. https://stackoverflow.com/questions/17561706/vim-yank-does-not-seem-to-work
1. https://thevaluable.dev/vim-search-find-replace/
1. https://howchoo.com/vim/vim-how-to-remove-trailing-whitespace-on-save
1. https://stackoverflow.com/questions/11303032/how-to-add-text-at-the-end-of-each-line-in-vim
1. https://stackoverflow.com/a/9549765/14857724
1. http://texteditors.org/cgi-bin/wiki.pl?VIM
1. http://texteditors.org/cgi-bin/wiki.pl?Vim_Cheat_Sheet
1. https://stackoverflow.com/questions/1527784/what-is-vim-recording-and-how-can-it-be-disabled
1. https://riptutorial.com/vim/example/4731/recording-a-macro
1. https://teddit.net/r/vim/comments/uiyul0/you_can_use_cxcl_in_insert_mode_to_complete_lines/