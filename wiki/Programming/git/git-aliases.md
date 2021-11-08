---
title: My git Aliases
description: This is a list of all of my current aliases I use with git.
---

*UPDATE: I use {{zsh}} now and they have built-in aliases which are much simpler. I highly recommend using {{zsh}} anyway, let alone for the aliases.*

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
rbm = ! f() { git rebase -i `git merge-base ${1} HEAD`; }; f
rh = reset --hard HEAD
```

## References

- https://stackoverflow.com/questions/7066325/list-git-aliases
- {{Rebase (git)}}
