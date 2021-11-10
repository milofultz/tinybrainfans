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
bd = branch -D
bdm = ! git branch --merged | egrep -v "(^\*|master|main|dev|staging)" | xargs git branch -d
ca = commit --amend
cb = checkout -b
ci = commit
cm = commit -m
co = checkout
gud = ! f() { echo "\nYOU DIED\n"; git reset --hard; }; f
hist = log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short
pl = pull origin HEAD
pu = push origin HEAD
rbm = ! f() { git rebase -i `git merge-base ${1} HEAD`; }; f
rh = reset --hard
s = status
st = status
```

## References

- https://stackoverflow.com/questions/7066325/list-git-aliases
- {{Rebase (git)}}
