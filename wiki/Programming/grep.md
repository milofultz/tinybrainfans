---
title: grep
description: grep finds string patterns within a given file or folder.
---

`grep` finds string patterns within a given file or folder.

```bash
$ grep PATTERN dir/file.name
$ grep 'THIS THAT' dir/file.name
```

## {{Regular Expressions}}

**Square brackets** do the same as normal, and also includes special {{POSIX|Regular Expressions (POSIX)}} groups, that do what you assume: `[:alnum:]`, `[:alpha:]`, `[:blank:]`, `[:cntrl:]`, `[:digit:]`, `[:graph:]`, `[:lower:]`, `[:print:]`, `[:punct:]`, `[:space:]`, `[:upper:]`, and `[:xdigit:]`.

### OR

```bash
$ grep 'PATTERN1\|PATTERN2' dir/file.name
```

### AND

```bash
$ grep PATTERN1 dir/file.name | grep PATTERN2
```

### NOT

```bash
$ grep -v 'NOTPATTERN' dir/file.name
```

### Chain a NOT with a regular search

```bash
$ grep 'THIS' dir/file.name | grep -v "NOT THIS'
```

## Options

Options with a single hyphen can be combined and placed after `grep`. Double hyphen options are separated.

```bash
$ grep -rin PATTERN file.diz
```

- `-r`: search recursively within a folder
- `-i`: ignore case of search pattern
- `-n`: print line number where pattern is found
- `-h`: suppress filename from output
- `--color`: color the output where pattern is found
- `--include=GLOB`: search only files whose base name matches GLOB using wildcard matching (e.g. `$ grep --include=*.md PATTERN`)
- `--exclude-dir=dir_name` or `--exclude-dir={multiple,dir_names}`

## Output Formatting

You can use `{{awk}}` to print out a formatted output. `-F` and the following char is where in the string `awk` will split. Each split section can be called using `$NF`, with `NF` being the number of the field we want. `$0` is everything.

```bash
grep IDEA | awk -F: '{print $1}'
```

## References

1. https://www.man7.org/linux/man-pages/man1/grep.1.html