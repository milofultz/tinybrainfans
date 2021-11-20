---
title: Applescript
description: Applescript is a programming language used to create scripts in Mac computers.
---

Applescript is a programming language used to create scripts in {{Mac|MacOS}} computers.

## Generic Syntax

Command | Effect
--- | ---
`-- This is a single line comment`<br>`# This is another single line comment` | Single line comment
`(* This is a multi line comment *)` | Multi-line comment
`open location "http://www.zombo.com"` | Open URL with the appropriate program[5,6] 
`do shell script "say \"we did it\""` | Run arbitrary shell script[3]
`set variableName to value` | Set a variable
`tell application "iTerm" to ...` | Tell application to do something (see below)

### Destructure a list to new variables

```applescript
set newList to {100, 200, 300}
set { x, y, z } to newList # x=100, y=200, z=300
set a to item 2 of newList # a=200
```

## Tell Application To Do Something

```applescript
tell application "iTerm" to # put actions here

tell application "iTerm"
  # put actions here
end tell
```

### Actions

- `activate` - Run program
- `open "Macintosh HD:Users:username:..."` - Open file at filepath[3]
  - To open files using standard notation (`/Users/username/...`), preface the filename with `POSIX file`: `open POSIX File "/Users/username/..."`

- `close window 1` - Close window
- `set size of front window to {640, 400}` - Set window size {x, y}
- `set position of front window to {0, 0}` - Set window position {x, y}
- `set bounds of front window to {300, 30, 1200, 900}` - Set window size and position {X-start, Y-start, X-end, Y-end}; corresponds directly to pixels of display resolution

## References

1. http://downloads.techbarrack.com/books/programming/AppleScript/website/files_&_folders/opening_files.html
1. [Error Messages](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/reference/ASLR_error_codes.html)
1. https://stackoverflow.com/questions/10126661/applescript-how-to-open-a-file-with-the-default-program
1. https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/introduction/ASLR_intro.html
2. https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/reference/ASLR_cmds.html#//apple_ref/doc/uid/TP40000983-CH216-SW54
2. https://apple.stackexchange.com/questions/293777/how-do-i-open-a-generic-url-from-applescript
