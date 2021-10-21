---
title: Rebase (git)
description: Rebasing in git is a way to clean up your commit history and change the history of one branch to be after the changes of another.
---

Rebasing in {{git}} is a way to clean up your commit history and change the history of one branch to be after the changes of another. Most commonly, you rebase a feature branch on the end of the master/main branch.

## Merge vs. Rebase

Merging and rebasing both achieve the same goals, but in different ways. Merging non-destructively maintains the history of the current branch when merging in other branches, with the cost of adding a new merge commit. Rebasing destructively changes the history of the current branch when rebasing on to other branches, but leaves no new commits.

## Golden Rule

If your branch is being worked on by anybody else but you, **do not rebase!** Because rebase is destructive, you will not be able to reconcile branches with git, leaving you to do the work manually. 💀⚰️

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

### Interactive Rebase Commands

I only have used these so far, and they do the job for what I need.

Command(s) | Effect
--- | ---
`p` / `pick`| Keep the commit as it currently is
`r` / `reword` | Keep the commit and edit the commit message
`s` / `squash` | Combine this commit with the previous commit, and edit commit message for newly squashed commit
`f` / `fixup` | Fold this commit into the previous commit, using the previous commit's message

## References

- https://www.youtube.com/watch?v=7Mh259hfxJg
- https://www.youtube.com/watch?v=u5ywa435MbI
- https://www.atlassian.com/git/tutorials/merging-vs-rebasing
- https://linuxhint.com/git-rebase-tutorial/
- https://git-scm.com/docs/git-rebase
- https://stackoverflow.com/questions/363908/how-do-i-use-git-rebase-i-to-rebase-all-changes-in-a-branch
- https://betterprogramming.pub/git-workflow-etiquette-f22d96b8b0b8#3336
