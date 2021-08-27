---
title: My git Aliases
description: This is a list of all of my current aliases I use with git.
---

This is a list of all of my current aliases I use with {{git}}. This is an output of my `git alias` command, which you will see below. Learn how to set these in the {{git}} page.

```
hist = log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short
co = checkout
ci = commit
cm = commit -m
s = status
ap = add -p
pu = push origin HEAD
pl = pull origin HEAD
b = branch
cb = checkout -b
aa = add .
ca = commit --amend
st = status
a = add
bd = branch -D
alias = ! git config --get-regexp ^alias\. | sed -e s/^alias\.// -e s/\ /\ =\ /
```

## References

- https://stackoverflow.com/questions/7066325/list-git-aliases
