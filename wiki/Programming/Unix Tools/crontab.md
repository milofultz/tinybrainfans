---
title: crontab
description: crontab is a way to schedule regular background tasks and shell commands.
---

crontab is a super useful tool used for regular background tasks like backups[6].

## Quick Start

Create or edit a crontab entry using `crontab -e` in the {{shell}}. **Don't edit them directly. Use `crontab -e` as the entry point.**

### Format

Here is an example of a crontab entry:

```cron
0 10 */2 6-9 * ./path/to/backup.sh
```

A crontab entry has two parts:

1. The scheduled recurring time to execute: `0 10 * * 1-5`
2. The {{command|shell}} to be executed: `./path/to/backup.sh`

#### Time

The time format is relative to the current time on your machine. From left to right:

1. Minutes after the hour (0 to 59)
2. Hour in 24 hour format (0 to 23)
3. Day of the month (1 to 31)
4. Month (1 to 12)
5. Day of the week (0 to 7 or name e.g. Sun; 0 and 7 determine Sunday)

There are multiple types of specifiers you can use in each slot:

| Specifier | Meaning                                                      |
| --------- | ------------------------------------------------------------ |
| a         | At a                                                         |
| a,b,c     | At a, b and c                                                |
| a-b       | From a to b                                                  |
| *         | first to last                                                |
| a-d/x     | From a to d with steps of x. `1-9/2` is the same as `1,3,5,7,9`. `*/15 * * * *` determines *every 15 minutes*; `0 */23 * * *` determines *every 23 hours*; etc. |

An example, where a script would run every other day at 10am from June through the end of September:

```
0               At the top of the hour
  10            At 10am
     */2        Every other day
         6-9    From June through the end of September
             *  Every day of the week
```

All five fields can also be replaced by a single `@` command:

| String      | Meaning                           |
| ----------- | --------------------------------- |
| `@reboot`   | Run once i.e. at startup          |
| `@yearly`   | Run once a year i.e. `0 0 1 1 *`  |
| `@annually` | same as `@yearly`                 |
| `@monthly`  | Run once a month i.e. `0 0 1 * *` |
| `@weekly`   | Run once a week i.e. `0 0 * * 0`  |
| `@daily`    | Run once a day i.e. `0 0 * * *`   |
| `@midnight` | same as `@daily`                  |
| `@hourly`   | Run once an hour i.e. `0 * * * *` |

#### Command

A command can be any command you would normally run in the {{shell}}. Everything must remain on one line, so I would recommend using `&&` and {{shell scripts|shell}}.

## Gotchas

- The crontab file MUST end with a newline[2].
- If using a script, ensure your script file you want to execute does **not** have an extension[3]. e.g. `./backup` will run but `./backup.sh` won't. Add a shebang to your script file, like `#!/bin/zsh` for {{shell}} or `#!/usr/bin/env python3` for {{Python 3|Python}}[4].

## References

1. https://www.markus-gattol.name/ws/time.html#cron
1. https://askubuntu.com/a/23337
1. https://askubuntu.com/a/111034
1. https://stackoverflow.com/questions/22222473/shebang-doesnt-work-with-python3
1. https://crontab.guru/
1. https://kb.levine.org/homelab/how-to/general/how-to-backup-dotfiles-to-github/