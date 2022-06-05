---
title: Vimrc
description: Vimrc is the config file for Vim.
---

Vimrc is the config file for Vim. Customizations in the config file to make using Vim a little nicer. The vimrc file can be found at `~/.vimrc`.

## Starting Fresh[4]

If things aren't working how you like, don't be afraid to start over with a fresh install by renaming your original `.vimrc` file and your `.vim` directory to `.vimrc-bak` and `.vim-bak` respectively, and creating a new blank file and empty directory in their place.

## Basics

Command | Effect
--- | ---
`syntax on` | Turn on syntax highlighting
`set number` | Use line numbers
`set number relativenumber` | Use current line number and relative numbers for others

## Remapping[12]

Remapping is where you can expand one keystroke into another keystroke or set of keystrokes. There are multiple types of remapping:

- `map` (recursive)
- `noremap` (non-recursive)

An example that would be in a `vimrc` file:

```vimrc
map j gg           (moves cursor to first line)
map Q j            (moves cursor to first line)
noremap W j        (moves cursor down one line)
```

The effect of this would be that:

- `j` would expand to `gg`
- `Q` would *also* expand to `gg`, since the first `map` of `j` is recursive
- `W` would be expand to `j` but will *not* expand to `gg` since it is non-recursive

### Modes

`map` and `noremap` have different modes they can apply to:

- `n`: normal only
- `v`: visual and select
- `o`: operator-pending
- `x`: visual only
- `s`: select only
- `i`: insert
- `c`: command-line
- `l`: insert, command-line, regexp-search (and others. Collectively called "Lang-Arg" pseudo-mode)

An example being `nnoremap` will make a non-recursive mapping that only applied to normal mode.

## Custom Commands[5]

A command is used in the command mode, which is accessed through `:`. A custom command is made using this format:

```vim
command[!] [CapitalizedCustomCommand] [vim command that will be run]
```

- The `!` following `command` is only used if overwriting a default Vim command
- `CapitalizedCustomCommand` MUST be capitalized or you will get an error.

For example, if I wanted to create a custom command that would edit my global todo file, I could write `command TODO e ~/.tod`. This will execute `e ~/.tod` when I write `:TODO` while in command mode in Vim.

## Clipboard

Vim will use it's own unnamed register unless specified to use the system clipboard. You can tell it to use the system clipboard on yank and paste by prefacing either with `"+`.[1]

To make Vim always use the system clipboard, you can add this to your `~/.vimrc` file[1,2]:

```
# Non-Mac
set clipboard=unnamedplus
# Mac
set clipboard=unnamed
```

## Language Specific Options[7,8]

You can set language specific options within the `~/.vim/ftplugin/` folder. For instance, a Python options file would be the file `~/.vim/ftplugin/python.vim`. If the filetype is not initially recognized by Vim, you can add it to the `ftdetect` folder[11].

## Trim Trailing Whitespace on Save[3]

Before writing the buffer to file on any file (`*`), search and replace all whitespace characters (`\s`) at the end of a given line with nothing. Do not show any error messages if no matches exist (`e` flag).

```
" Trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
```

## Other Plugins and Packages

- Ultimate vimrc[6] - This is a great starting point that includes a lot of fantastic plugins and settings. That being said, there is a *lot* of bloat, so don't be afraid to blow it all up and start over[4].
- Anything by tpope[13]

## References

1. https://vim.fandom.com/wiki/Accessing_the_system_clipboard
1. https://stackoverflow.com/questions/17561706/vim-yank-does-not-seem-to-work
1. https://howchoo.com/vim/vim-how-to-remove-trailing-whitespace-on-save
1. https://stackoverflow.com/questions/8824942/how-can-i-reset-vim-back-to-a-plain-vanilla-install
1. https://yewtu.be/watch?v=Jm0IjtDAWcs
1. https://github.com/amix/vimrc
1. https://stackoverflow.com/questions/11023194/automatically-wrap-long-git-commit-messages-in-vim
1. https://www.gilesorr.com/blog/vim-ftplugin.html
1. https://thoughtbot.com/blog/writing-vim-syntax-plugins
1. https://vim.fandom.com/wiki/Keep_your_vimrc_file_clean
1. http://vimdoc.sourceforge.net/htmldoc/filetype.html#ftdetect
1. https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
1. https://github.com/tpope
