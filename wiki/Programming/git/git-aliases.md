---
title: My git Aliases
description: This is a list of all of my current aliases I use with git.
---

*UPDATE: I use {{zsh}} now and they have built-in aliases which are much simpler. I highly recommend using {{zsh}} anyway, let alone for the aliases.*

This is a list of all of my current aliases I use with {{git}}. This is an output of my `git alias` command, which you will see below. Learn how to set these in the {{git}} page.

```
alias = ! git config --get-regexp ^alias\. | sed -e s/^alias\.// -e s/\ /\ =\ /
bdm = ! git branch --merged | egrep -v "(^\*|master|main|dev|staging)" | xargs git branch -d
gud = ! f() { echo "\nYOU DIED\n"; git reset --hard; }; f

a = add
aa = add .
ap = add -p
b = branch
bd = branch -D
ca = commit --amend
cb = checkout -b
ci = commit
cm = commit -m
co = checkout
hist = log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short
pl = pull origin HEAD
pu = push origin HEAD
rbm = ! f() { git rebase -i `git merge-base ${1} HEAD`; }; f
rh = reset --hard
s = status
st = status
rstst = restore --staged .
```

## {{Shell}}/{{zsh}} aliases

Find all the built-in aliases at the zsh repo[3].

The following aliases are ones that I have added to fill in the gaps that I feel like have been left in the zsh shortcuts. Add this to your {{shell}}'s rc file:

```shell
alias gpf='git push origin HEAD -f'
alias grsts='git restore --staged .'
alias gstapa='git stash push --patch'
```

## References

1. https://stackoverflow.com/questions/7066325/list-git-aliases
1. {{Rebase (git)}}
1. [zsh built-in aliases](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh)
