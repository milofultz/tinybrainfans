---
title: Rebase (git)
description: Rebasing in git is a way to clean up your commit history and change the history of one branch to be after the changes of another.
---

Rebasing in {{git}} is a way to clean up your commit history and change the history of one branch to be after the changes of another. Most commonly, you rebase a feature branch on the end of the master/main branch.

## The Golden Rule

If your branch is being worked on by anybody else but you, **do not rebase!** Because rebase is destructive, you will not be able to reconcile branches with git, leaving you to do the work manually. 💀⚰️

From Linus Torvald[10]:

> People can (and probably should) rebase their _private_ trees (their own work). That's a _cleanup_. But never other peoples code. That's a "destroy history"

## Another Good Rule

ALWAYS make a backup of the branch you are trying to rebase with. If you screw it up, **the commits are gone**. Make a copy (`git commit -b branch-name-bak`), run your test, ensure it did the thing you wanted it to do, then hold on to your backup in case you were wrong.

## Merge vs. Rebase

Merging and rebasing both achieve the same goals, but in different ways. Merging non-destructively maintains the history of the current branch when merging in other branches, with the cost of adding a new merge commit. Rebasing destructively changes the history of the current branch when rebasing on to other branches, but leaves no new commits.

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

| Command(s)     | Effect                                                       |
| -------------- | ------------------------------------------------------------ |
| `p` / `pick`   | Keep the commit as it currently is                           |
| `r` / `reword` | Keep the commit and edit the commit message                  |
| `s` / `squash` | Combine this commit with the previous commit, and edit commit message for newly squashed commit |
| `f` / `fixup`  | Fold this commit into the previous commit, using the previous commit's message |
| `e` / `edit`   | Stop at this commit and give user control until `rebase --continue`[9] |

## Rebasing Onto Squashed Commits[15-18]

First, **MAKE A BACKUP!**

Lets say that you had three branches: `main`, `feature`, and `ft-addition`. `ft-addition` built upon the work of `feature`.

```
ft-addition             G-H-I
                       /
feature           D-E-F
                 /
main        A-B-C
```

We finish with `feature` and squash it before merging it into main (squashed commit being `S`.

```
ft-addition       D-E-F-G-H-I
                 /
main        A-B-C-S
```

We now have conflicting commit histories. The content of `S` is all of the commits `D`, `E`, `F`. If we `git rebase main` while checked out in the `ft-addition` branch, we would have to deal with conflicts on every commit as it tried to replay `D`, `E`, and `F` on top of `S`. This would mean lots of unnecessary merge conflict resolution.

To fix this, we can use the `--onto` flag on `git rebase`. The syntax is as follows:

```shell
$ git checkout starting-branch
$ git rebase --onto target-branch-or-commit commit-to-replay-from
```

For instance, with our example, we would want to replay commits `G`, `H`, and `I` but not `D`, `E`, or `F`. So we would use:

```shell
$ git checkout ft-addition
$ git rebase --onto main F
```

This replays all commits that are children of commit `F` onto the commit found at `main`.

This would result in this structure:

```
ft-addition         G-H-I
                   /
main        A-B-C-S
```

We change the parent of commit `G` from `F` to `S`.

## Have I Rebased and Merged This Branch?[13]

One problem with a rebase and merge or squash and rebase before merge is that the standard `git branch -d branch-name` will reject as it is not recognized as merged in to the target branch. A couple ways to check:

1. Use `git log --oneline --cherry target-branch...starting-branch` to see which commits are present in both branches.
2. If commit messages are maybe not true to the original, or a squash and rebase has occurred, you can use `git checkout target-branch~0; git merge starting-branch`. This will put you on a detached head of the target branch and try to merge in the starting branch's content. If this commit is merged in already, it should say `Already up to date.`. 

You can put all of option 2 into a function in your shell as an {{alias|My git Aliases}}.

```shell
grbdiff () {
    local TARGET=$(git rev-parse --abbrev-ref HEAD)
    local STARTING="$1"

    git checkout "${TARGET}~0" 2>/dev/null
    git merge "${STARTING}" 2>/dev/null
    local DIFF=$(gd --stat)
    if [[ -z "$DIFF" ]]
    then
        echo -e "Branch '${TARGET}' contains contents of '${STARTING}'. Nothing to merge."
    else
        echo -e "Branch '${TARGET}' does not contain contents of '${STARTING}':\n${DIFF}"
    fi

    git checkout "${TARGET}" 2>/dev/null
}
```

It can be executed by checking out the target branch and typing `grbdiff starting-branch`. If there are changes, it will print the diff.

## Package Lock Conflicts[14]

If you end up with `package-lock.json` conflicts in a rebase, follow these instructions:

1. This is given that you are at a state in the rebase where all other previous or current conflicts have been managed and all that is left is the package lock.
2. Run `npm install --package-lock-only`.
3. Stage `package-lock.json` in the current commit.
4. Run `git rebase continue` and commit.

This should render you the up to date `package-lock.json` file without having to do all the merge conflicts manually.

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
1. Visual differences between merge, rebase, squash/merge: https://stackoverflow.com/a/43551395/14857724
1. https://stackoverflow.com/a/34337939/14857724
1. https://marcelofernandes.dev/blog/solving-package-lock-json-conflicts/
1. https://tech.bakkenbaeck.com/post/Rebasing_Onto_A_Squashed_Commit
1. https://scribe.rip/swiftblade/how-git-rebase-onto-works-71ff00e3f88c
1. https://womanonrails.com/git-rebase-onto
1. https://git-scm.com/book/en/v2/Git-Branching-Rebasing#rbdiag_e
