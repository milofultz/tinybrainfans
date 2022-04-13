---
title: xargs
description: You can use xargs to build and execute command lines from standard input.
---

`xargs` lets you chain together and patch up results from piped commands into other commands or applications.

```shell
$ find "start/path" -name "filename.txt" -print0 | xargs -0 -o vim
$ git branch --merged | egrep -v "(^\*|master|main|dev|staging)" | xargs git branch -d
```

It is invoked like xargs `[option...] [command [initial-arguments]]`. For instance, the end result of that first example would be `vim {result of find command}`, and the end result of the second would be `git branch -d {result of egrep on results of git command}`.

## Options

```shell
$ xargs -0 --max-args=2
```

- `-0`: Use `\0` as the delimiter, which is useful for filenames with spaces. Ensure piped command delimits using `\0` and not spaces.
- `-d delim`: Use `delim` as your delimiter between arguments
- `-E eof-str`: Use `eof-str` as the signifier of end of file. When found, all following text is ignored.
- `-n max-args`: Use at most `max-args` arguments per command line.
- `-o`: Allow interactive programs to access pipe output. e.g. `find "start/path" -name "filename.txt" -print0 | xargs -0 -o vim`. This will send the filename found with `find` as the argument to `{{vim}}`.

## Simple Version

You can do simple `xargs` recipes in {{shell}} using command substitution:

```shell
$ # xargs version
$ find "start/path" -name "filename.txt" -print0 | xargs -0 -o vim
$ # shell versions
$ vim `find "start/path" -name "filename.txt"`
$ vim $(find "start/path" -name "filename.txt")
```

## References

1. https://www.man7.org/linux/man-pages/man1/xargs.1.html
2. https://askubuntu.com/a/1158337
3. https://unix.stackexchange.com/a/5865

