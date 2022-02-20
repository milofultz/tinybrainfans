---
title: Shell
description: The shell is the terminal of your operating system. This is the *nix shell.
---

The shell is the terminal of your operating system. This is the *nix shell.

## Basic Functions

- `cp [-r] ./source ./destination` - Copy file or directory `[-r]` from source to destination
- `mv [-r] ./source ./destination` - Move/rename file or directory `[-r]` from source to destination
- `rm [-r] ./file` - Remove file or directory `[-r]` **NOTE: THIS IS PERMANENT. There are no trash cans or recycle bins here.**

## [Background Tasks][]

You can run tasks in the background within a {{terminal}} window by placing an `&` at the end of the command you want running. You can see these background jobs with `jobs` and kill the job that you want with `kill %` followed by the index, or just `kill %` to kill all jobs.

## Variables

Variables are all defined by a non-spaced variable name followed by an equals sign. Variables are recalled/invoked using the dollar sign followed by the variable name.

```shell
var_name="Bob"
number_var=123

echo "$var_name"
echo "$number_var"
echo "There are $number_var cans in ${var_name}'s closet."
```

Single quotes will preserve the literal value of all characters within it, while double quotes will allow the expansion/interpolation of the variables.[10] **Always use double quotes when expanding your variables.** Using double quotes around a variable will ensure that it will not be split up like a series of arguments[11].

Variables that are within a string and directly next to another character that is not a space need to be enclosed within a dollar sign and curly braces, e.g. `${var_name}`.

Variables in the shell also have a variety of parameter expansions[12] that allow pattern matching, replacement, string slicing, and more.

## Iteration

To iterate over a series of files, you can use a `for` loop:

```shell
# Files in directory include: a.txt, b.jpg, c.exe, d.txt
# This will only iterate through a.txt and d.txt .

for file in *.txt
do
	echo -e "${file}:\n$(cat $file)"
done
```

## Event Designators

An event designator is a reference to a command line entry in the  history list.  Unless the reference is absolute, events are relative  to the current position in the history list.

- `$_` Repeat the last argument used, e.g. `mkdir folder-name && cd "$_"`
- `!!` Repeats the previous command
- `!10` Repeat the 10th command from the history
- `!-2` Repeat the 2nd command (from the last) from the history
- `!string` Repeat the command that starts with “string” from the history
- `!?string` Repeat the command that contains the word “string” from the history
- `^str1^str2^` Substitute str1 in the previous command with str2 and execute it
- `!!:$` Gets the last argument from the previous command.
- `!string:n` Gets the nth argument from the command that starts with “string” from the history.
- `!^` first argument of the previous command
- `!$` last argument of the previous command
- `!*` all arguments of the previous command
- `!:2` second argument of the previous command
- `!:2-3` second to third arguments of the previous command
- `!:2-$` second to last arguments of the previous command
- `!:2*` second to last arguments of the previous command
- `!:2-` second to next to last arguments of the previous command
- `!:0` the command itself

## Aliases

WIthin your `~/.bashrc` file, add this line and populate it how you need:

```bash
alias alias_name="command_to_run"

# e.g.
alias poo="say 'I have to poop really bad'"
```

When complete, run `source ~/.bashrc` or `source ~/.zshrc` and restart bash to have them take effect.

## Pipe

> To connect the STDOUT of one **command** to the STDIN of **another** use the | symbol, commonly known as a pipe.

```bash
# long way
$ thing1 > tempfile
$ thing2 < tempfile

# shorter
$ thing1 > tempfile && thing2 < tempfile

# shortest
$ thing1 | thing2
```

## Base64

`base64 path/to/file > output.txt` will encode whatever file into base64. 

`echo -n 'some string' | base64 > output.txt` will encode a string as input and not encode unusable chars, like line feeds.

The `--decode` flag may be added to reverse this process.

## Troubleshooting

### Errors from Windows

If you got a script that looks totally fine but is throwing errors that make very little to no sense, like failing `cd` and `cp`, it's probably containing `\r` from a Windows computer.

```bash
tr -d "\r" < oldname.sh > newname.sh
```

## References

1. https://www.serverlab.ca/tutorials/linux/administration-linux/how-to-base64-encode-and-decode-from-command-line/
3. https://linuxize.com/post/how-to-create-bash-aliases/
3. https://askubuntu.com/questions/172982/what-is-the-difference-between-redirection-and-pipe/172989#172989?newreg=cfc8024a2d4b40daa24578e47df2b7cf
4. https://stackoverflow.com/a/11428439
5. https://unix.stackexchange.com/questions/19654/how-do-i-change-the-extension-of-multiple-files
6. https://mywiki.wooledge.org/BashFAQ/030
7. https://devhints.io/bash
7. https://github.com/dylanaraps/pure-bash-bible
7. https://linoxide.com/make-bash-script-executable-using-chmod/
7. https://stackoverflow.com/a/6697781/14857724
7. https://guide.bash.academy/expansions/?=Command_Substitution#a1.3.0_2
7. https://guide.bash.academy/expansions/?=Command_Substitution#p2.2.2_5

[Background Tasks]: https://www.maketecheasier.com/run-bash-commands-background-linux/
