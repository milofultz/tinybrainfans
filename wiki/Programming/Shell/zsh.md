---
title: zsh
description: zsh is a Unix shell based on the Bourne shell.
---

Zsh is a Unix shell based on the Bourne shell, like {{bash}}.

## Installation

Use {{homebrew}} to install Zsh:

```shell
$ brew install zsh
```

To set it as your default shell:

```shell
$ sudo sh -c "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)
```

## Oh My Zsh

> Oh My Zsh is a delightful, open source, community-driven framework for managing your Zsh configuration.

### Installation

To install, use this:

```shell
$ curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```

## Plugins

Plugins are installed using Oh My Zsh and the `~/.zshrc` file.

- [`z`](https://github.com/agkozak/zsh-z): "Zsh-z is a command line tool that allows you to jump quickly to  directories that you have visited frequently in the past, or recently -- but most often a combination of the two (a concept known as ["frecency"](https://en.wikipedia.org/wiki/Frecency)). It works by keeping track of when you go to directories and how much time you spend in them."

### Preinstalled

- Git shortcuts: `{{git}}` is aliased to `g` and many of the most used commands are aliased as well, like `gaa` is `git add .` and `gcmsg` is `git commit -m `, etc. You can find a list of the shortcuts in the oh-my-zsh repo[2].

## Profile

Your profile, which includes your different environment variables, can be found at `.zprofile`.

## References

1. https://gist.github.com/derhuerst/12a1558a4b408b3b2b6e#file-mac-md
1. https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh
