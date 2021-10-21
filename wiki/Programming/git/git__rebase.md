---
title: Rebase (git)
description: Rebasing in git is a way to clean up your commit history and change the history of one branch to be after the changes of another.
---

Rebasing in {{git}} is a way to clean up your commit history and change the history of one branch to be after the changes of another. Most commonly, you rebase a feature branch on the end of the master/main branch.

## Golden Rule

If your branch is being worked on by anybody else but you, **do not rebase!** Because rebase is destructive, you will not be able to reconcile branches with git, leaving you to do the work manually. 💀⚰️

## Merge vs. Rebase

Merging and rebasing both achieve the same goals, but in different ways. Merging non-destructively maintains the history of the current branch when merging in other branches, with the cost of adding a new merge commit. Rebasing destructively changes the history of the current branch when rebasing on to other branches, but leaves no new commits.

## Interactive Rebase

To rebase one branch onto the nearest common ancestor of another, use the following command, replacing the bracketed words with the correct branch names:

```shell
$ git rebase -i `git merge-base {other-branch} HEAD`
```

For instance, if I was on a `feature` branch and wanted to interactively rebase over all commits that occurred since it branched off of `main`, it would be ```git rebase -i `git merge-base main HEAD` ```.

## References

- https://www.youtube.com/watch?v=7Mh259hfxJg
- https://www.youtube.com/watch?v=u5ywa435MbI
- https://www.atlassian.com/git/tutorials/merging-vs-rebasing
- https://linuxhint.com/git-rebase-tutorial/
- https://git-scm.com/docs/git-rebase
- https://stackoverflow.com/questions/363908/how-do-i-use-git-rebase-i-to-rebase-all-changes-in-a-branch
