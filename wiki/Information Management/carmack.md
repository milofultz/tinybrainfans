---
title: The Carmack Plan
description: Game designer John Carmack took extensive notes during the development of the game Quake.
---

Game designer John Carmack took extensive notes during the development of the game Quake. He used `.plan` files with a fairly straightforward system.

## The System

Throughout the development of the game, he needed to manage the various different bugs, features, and tasks that came up throughout the days. Here's an example of a `.plan` file from August 12, 1997:

```
* qe4 project on command line
* qe4 rshcmd replacement
* qe4 select face
* qe4 avoid multiple autosaves
* qe4 region selected brushes
* bindlist command
* imagelist command in ref_soft

+ leaktest
+ load game.dll from gamedir

pendulum motion
no jump on lava floor?
-game
16 bit wall textures
```

He used a few basic symbols to do this:

Symbol | Meaning
--- | ---
`*` | Completed that day
`+` | Completed on a later day
`-` | Decided against on a later day
No symbol | Mentioned but not completed that day

This system is nice because it allows a clean slate every day as well as a log of what happened over previous days for careful review over time. I love how simple it is, yet that it allows for allocating todo's and thorough logging using {{UNIX}} CLI tools.

## References

1. https://garbagecollected.org/2017/10/24/the-carmack-plan/
1. https://github.com/floodyberry/carmack/tree/fc09ed3e7dde67b296a6840524a7c9ec8c36511a/plan_files
1. https://github.com/floodyberry/carmack/blob/fc09ed3e7dde67b296a6840524a7c9ec8c36511a/page_tools/template/plan.html#L26-L41
1. http://web.archive.org/web/20050309230054/http://doom-ed.com/blog/category/doom-ed/john-carmack/