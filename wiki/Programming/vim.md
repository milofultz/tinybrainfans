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
Go to beginning of line | `0` |
Go to end of line | `$` |

### Delete

Description | Command | Notes
--- | --- | ---
Delete line | `dd` | 
Delete `3` lines | `3dd` | 
Delete from current column to end of line | `D` |

## References

- https://www.vim.org/
- https://www.cyberciti.biz/faq/how-to-save-existing-file-to-a-new-file-save-as-in-vi-vim/
- https://evanhahn.com/vim-colon-x-command/
