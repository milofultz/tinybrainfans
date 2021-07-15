---
title: Applescript
description: Applescript is a programming language used to create scripts in Mac computers.
---

Applescript is a programming language used to create scripts in {{Mac|MacOS}} computers.

## Variables

```applescript
set variableName to value
```

### Destructure a list to new variables

```applescript
set newList to {100, 200, 300}
set { x, y, z } to newList # x=100, y=200, z=300
set a to item 2 of newList # a=200
```

## Have Application Do Something

```applescript
tell application "iTerm" to \# put actions here

tell application "iTerm"
  \# put actions here
end tell
```

### Actions

- `activate` - Run program
- `open "Macintosh HD:Users:username:..."` - Open file at filepath
- `close window 1` - Close window
- `set size of front window to {640, 400}` - Set window size (x, y)
- `set position of front window to {0, 0}` - Set window position (x, y)
- `set bounds of front window to {300, 30, 1200, 900}` - Set window size and position {X-start, Y-start, X-end, Y-end}; corresponds directly to pixels of display resolution

## Comments

```applescript
-- This is a single line comment
\# This is another single line comment
(* This is
   a multi
   line comment *)
```

## References

1. http://downloads.techbarrack.com/books/programming/AppleScript/website/files_&_folders/opening_files.html
2. [Error Messages](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/reference/ASLR_error_codes.html)

