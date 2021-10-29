---
title: My git Aliases
description: This is a list of all of my current aliases I use with git.
---

*UPDATE: I use {{zsh}} now and they have built-in aliases which are much simpler. I highly recommend using {{zsh}} anyway, let alone for the aliases.*

This is a list of all of my current aliases I use with {{git}}. This is an output of my `git alias` command, which you will see below. Learn how to set these in the {{git}} page.

```
a = add
aa = add .
alias = ! git config --get-regexp ^alias\. | sed -e s/^alias\.// -e s/\ /\ =\ /
ap = add -p
b = branch
bd = branch -d
bD = branch -D
co = checkout
cb = checkout -b
ci = commit
cm = commit -m
ca = commit --amend
hist = log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short
pu = push origin HEAD
pl = pull origin HEAD
s = status
st = status
```

## References

- https://stackoverflow.com/questions/7066325/list-git-aliases
