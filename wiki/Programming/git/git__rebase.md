---
title: Rebase (git)
description: Rebasing in git is a way to clean up your commit history and change the history of one branch to be after the changes of another.
---

Rebasing in {{git}} is a way to clean up your commit history and change the history of one branch to be after the changes of another. Most commonly, you rebase a feature branch on the end of the master/main branch.

## Merge vs. Rebase

Merging and rebasing both achieve the same goals, but in different ways. Merging non-destructively maintains the history of the current branch when merging in other branches, with the cost of adding a new merge commit. Rebasing destructively changes the history of the current branch when rebasing on to other branches, but leaves no new commits.

### Squash and Rebase[11]

One use of rebasing is this method, which alters your branch's history by squashing all commits together, but simplifies many things for the future.

> before you merge a feature branch back into your main branch (often `master` or `develop`), your feature branch should be squashed down to a single buildable commit, and then rebased from the up-to-date main branch.

> If you follow this process it  guarantees that ALL commits in master build and pass tests. This simple  fact makes debugging an issue much easier. You can use **git** bisect when trying to find the source of a bug. Git bisect becomes almost  completely ineffective  if there are broken commits on the master  branch; if you jump to a commit that isn’t clean, it’s difficult or  impossible to tell if it introduced the bug. [...] [A] drawback is that we lose some granularity when we squash  our commits. If you really want to have multiple commits for a feature,  at least squash down so that each commit builds and passes tests.

## The Golden Rule

If your branch is being worked on by anybody else but you, **do not rebase!** Because rebase is destructive, you will not be able to reconcile branches with git, leaving you to do the work manually. 💀⚰️

From Linus Torvald[10]:

> People can (and probably should) rebase their _private_ trees (their own work). That's a _cleanup_. But never other peoples code. That's a "destroy history"

## Simple Rebase

To perform a simple rebase and put the commits of the current branch on to the tip of another branch, you can use the following command:

```shell
$ git rebase {other-branch}
```

For instance, if I were on a `feature` branch and I wanted to rebase on top of the `main` branch, I would use `git rebase main`. This will re-write the history destructively and prompt you if there are any conflicts to resolve before proceeding.

## Interactive Rebase

To rebase one branch onto the nearest common ancestor of another, use the following command:

```shell
$ git rebase -i `git merge-base {other-branch} HEAD`
```

For instance, if I was on a `feature` branch and wanted to interactively rebase over all commits that occurred since it branched off of `main`, it would be ```git rebase -i `git merge-base main HEAD` ```.

Note that when the commits are listed, they are listed oldest to newest, unlike the git log which is newest to oldest. This is very important!

### Alias

In your `~/.gitconfig` file, you can add this in the `[alias]` section to invoke the above command using `git rbm {other-branch}`:

```sh
rbm = "! f() { git rebase -i `git merge-base ${1} HEAD`; }; f"
```

### Interactive Rebase Commands

I only have used these so far, and they do the job for what I need.

Command(s) | Effect
--- | ---
`p` / `pick`| Keep the commit as it currently is
`r` / `reword` | Keep the commit and edit the commit message
`s` / `squash` | Combine this commit with the previous commit, and edit commit message for newly squashed commit
`f` / `fixup` | Fold this commit into the previous commit, using the previous commit's message
`e` / `edit` | Stop at this commit and give user control until `rebase --continue`[9] 

## References

1. https://www.youtube.com/watch?v=7Mh259hfxJg
1. https://www.youtube.com/watch?v=u5ywa435MbI
1. https://www.atlassian.com/git/tutorials/merging-vs-rebasing
1. https://linuxhint.com/git-rebase-tutorial/
1. https://git-scm.com/docs/git-rebase
1. https://stackoverflow.com/questions/363908/how-do-i-use-git-rebase-i-to-rebase-all-changes-in-a-branch
1. https://betterprogramming.pub/git-workflow-etiquette-f22d96b8b0b8#3336
1. https://demisx.github.io/git/rebase/2015/07/02/git-rebase-keep-my-branch-changes.html
1. https://stackoverflow.com/questions/6217156/break-a-previous-commit-into-multiple-commits
1. http://blog.nerdbank.net/2020/01/should-i-merge-or-rebase-in-git.html
1. https://blog.carbonfive.com/always-squash-and-rebase-your-git-commits/
