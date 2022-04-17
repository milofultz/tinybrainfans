---
title: zip
description: This is an archiving and compression tool that allows encryption.
---

## Zipping a file or folder

```shell
$ zip [options] archive.zip inpath[ inpath ...]
```

Option | Arguments | Description
--- | --- | ---
`-r` | | Travel the directory structure recursively. For use if input is a folder
`-@` | none but really `stdin` | Each line of `stdin` is a file to be added to the archive. e.g. `find . -name "*.[ch]" -print`[1] 
`-e` | | Encrypts the archive and prompts the user for the password securely
`-P password` | `password`: The password for the archive | Encrypts the archive with the given password

## Unzipping a file

```shell
$ unzip [options] archive.zip
```

Option | Arguments | Description
--- | --- | ---
`-d dir` | `dir`: folder for extracted contents | Extract contents of archive to `dir`

## References

1. https://linux.die.net/man/1/zip
2. https://linux.die.net/man/1/unzip
