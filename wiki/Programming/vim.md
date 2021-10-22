---
title: Vim
description: Vim is a command-line editor that is included with most *nix machines and OSX.
---

Vim is a command-line editor that is included with most *nix machines and {{OSX|MacOS}}.

## Commands

All commands must be done in "Normal" mode, accessed by pressing `esc` if in write mode. Commands are case sensitive and must be confirmed with `Enter` unless otherwise noted.

### Meta/File

Description | Command | Notes
--- | --- | ---
Quit | `:q` |
Quit and do not save | `:cq` |
Save and quit | `ZZ` | No need to confirm or press enter.
Save | `:w` |
Save and quit | `:wq` |
Save only if file changed and quit | `:x` |
Save As | `:w newFileName` |

### Undo/Redo

Description | Command | Notes
--- | --- | ---
Undo | `u` | 
Redo | `Ctrl + R` | 

### Find

Description | Command | Notes
--- | --- | ---
Find | `/searchpattern` |Go to next occurrence with `n` and previous with `N`
Find and Replace | `:1,$s/searchpattern/replacepattern` | To replace all, add `/g` to the end of the command

### Navigation

Description | Command | Notes
--- | --- | ---
Go to beginning of file | `gg` |
Go to end of file | `G` |
Go to beginning of line | `0` / `^` |
Go to end of line | `$` |

### Copy (Yank), Cut, and Paste

Copy is "yank" in Vim, so that's why they are "y".

Description | Command | Notes
--- | --- | ---
Copy entire line or `n` lines, including newline | `nyy` |
Copy from cursor to end of line | `y$` |
Copy from cursor to start of line | `y^` |
Cut entire line or `n` lines, including newline | `ndd` |
Cut from cursor to end of line | `d$` |
Cut from cursor to start of line | `d^` |
Paste after the cursor | `p`|
Paste before the cursor | `P`|

### Delete

Description | Command | Notes
--- | --- | ---
Delete line | `dd` | 
Delete `3` lines | `3dd` | 
Delete from current column to end of line | `D` |

### Misc

Description | Command | Notes
--- | --- | ---
Toggle fold at next logical break | `za` | 

## Plugins and Packages

- [Ultimate vimrc](https://github.com/amix/vimrc) - This is a great starting point that includes a lot of fantastic plugins and settings
- [Emmet](https://github.com/mattn/emmet-vim)

## References

- https://www.vim.org/
- https://www.cyberciti.biz/faq/how-to-save-existing-file-to-a-new-file-save-as-in-vi-vim/
- https://evanhahn.com/vim-colon-x-command/
- https://github.com/amix/vimrc
- https://danielmiessler.com/study/vim/
- https://elijahmanor.com/blog/neovim-tmux
- https://linuxize.com/post/how-to-copy-cut-paste-in-vim/
- https://www.maketecheasier.com/cheatsheet/vim-keyboard-shortcuts/
