---
title: git
description: git is a version control system.
---

## Commits

- Add files you want to commit: `git add {file or folder name}` or `git add .`
- Add only portions of a file as 'hunks': `git add --patch/-p {file or folder name}`. This will prompt you with options:
  - y - stage this hunk
  * n - do not stage this hunk
  * q - quit; do not stage this hunk or any of the remaining ones
  * a - stage this hunk and all later hunks in the file
  * d - do not stage this hunk or any of the later hunks in the file
  * g - select a hunk to go to
  * / - search for a hunk matching the given regex
  * j - leave this hunk undecided, see next undecided hunk
  * J - leave this hunk undecided, see next hunk
  * k - leave this hunk undecided, see previous undecided hunk
  * K - leave this hunk undecided, see previous hunk
  * s - split the current hunk into smaller hunks
  * e - [manually edit the current hunk][manually edit hunk] (particularly if your code is really close together but needs to be broken down)
  * ? - print help

## Branches

- See all branches: `git branch`
- See the remote branches your local repo knows: `git branch -a`
- Checkout an existing branch: `git checkout {name}`
- Create and name a new branch: `git branch {name}`
- Create and checkout a new branch: `git checkout -b {name}`
- Create an orphaned branch: `git checkout --orphan {branch_name}`
- Push the current branch: `git push origin HEAD`
- Rename a branch. Assuming you're currently on the branch you want to rename: `git branch -m {name}`
- Merge a branch (source) into another branch (destination):
  - Commit all changes in source branch
  - Checkout destination branch
  -  `git merge {source-branch}`
- Delete a fully pushed and merged branch: `git branch -d {name}`
- Force delete a local branch: `git branch -D {name}`

### Orphan Branches

Commits usually have one parent, their previous iteration. The root commit (very beginning) of your repo has none, and when you merge commit a fork with another branch or the master branch.

An orphan branch is a new root commit, where:

> The first commit made on this new branch will have no parents, and it will be the root of a new history, totally disconnected from all the other branches and commits. In other words, it creates a new root commit and uses it as a starting point for your new branch.

### Delete All Merged Branches

To delete all branches that have been merged, start out by pulling from remote to ensure you are using the most up to date info. Then check which branches are merged by running `git branch --merged`. We will be using `egrep` to grab these and put them into a macro that will delete each merged branch that doesn't fit within the regex. To ensure a branch that contains a certain keyword does not get deleted, add it to the `egrep -v "(^...)"` line, with each keyword separated by an OR `|`.

```bash
git branch --merged | egrep -v "(^\*|master|main|dev|staging)" | xargs git branch -d
```

## Cherry Pick

> When should I use cherry-pick? **The short answer is: as rarely as possible.**

Cherry picking

## Revert

A revert allows you to go back to a previous commit, reversing those previous between commit X (HEAD) and commit Y(the selected commit). This will create a reversal commit for each commit to be undone between X and Y. In the case of a single commit to be undone, it will make a single reversal commit.

To revert one or many commits, open your `git log` and find the commit you want to revert back to. Save this hash.

The `-m` flag is used to revert a merge; to set where the mainline is, which parent you are wanting to revert back to. Most of the time it is 1. 

```bash
$ git revert [-m 1] <commit-hash>
```

## Stashing

[Stashing][stashing] allows you to temporarily save changes without committing anything. 

To stash some changes, use `git stash save 'message about stash'`, or just `git stash` if you want to leave out the message.

To see what you have stashed, use `git stash list` to see all stashed code. Then see what is in each stash by using `git stash show {index}`, and you can see it diffed by using the `-p` flag.

Stashes can be listed recalled via the indexes shown: `git stash apply {index}` or `git stash pop {index}` if you want to remove it from the stashes after being applied.

You can `git stash drop {index}` individual stashes or `git stash clear` the entire stash.

## Git Aliases

### Flags

- `--global` will set the alias across your whole machine
- `--unset` will unset the following alias
- `--unset-all` will unset all of the aliases found at the following alias

```bash
shell> git config --global alias.co checkout # now 'git co' is aliased to 'git checkout'
shell> git config alias.p 'push origin HEAD'  # now 'git p' is aliased to 'git push origin HEAD' ONLY for current project
shell> git config --global --unset alias.p # now 'git p' is no longer aliased
```

## [Gitignore][]

Creating a `.gitignore` file in the root folder of your project will ensure every file that matches a line within the file will be ignored by git.

- Using a `*` will work as a wildcard for every file within that level of the given directory, or as a wildcard within a filename.
- Using two `**` in the filepath will look within every level recursively from that point forward. e.g. `**/.DS_Store` will find a file called `.DS_Store` in the root directory as well as any others in any folders within that root directory. `lib/**/__pycache__` will match any files or folders named `__pycache__` that are within the `lib` directory at any depth.

### Global gitignore

You can ignore files globally by adding them to `~/.gitignore_global`. 

### [Delete previous files in gitignore][]

If you add a file to `.gitignore` after previously committing that file, you may see untracked changes on those files. You have to remove the old files from the git repository to remove that error.

- Remove the existing files: `find . -name {filename} -print0 | xargs -0 git rm -f --ignore-unmatch`
- Add the file to the gitignore: `{filename}`

## Credentials

If you receive a message like this when trying to push up to your repo:

```
remote: HTTP Basic: Access denied
fatal: Authentication failed for 'https://gitlab.com/myusername/repo.git'
```

or

```
remote: Invalid username or password.
fatal: Authentication failed for 'https://github.com/milofultz/tod.git/'
```

Then you may have revoked or renewed your token and need to reset it. To do so, type this in the terminal:

```bash
$ git credential reject
```

And when you receive a new line, enter in `url=` followed by the url that showed up previously in the error message. Then use ctrl-c or ctrl-d to quit.

```
url=https://github.com/milofultz/tod.git/
```

On trying to push again, you will get prompted for authentication and it will work.

## Errors

CRLF => LF: https://stackoverflow.com/questions/20168639/git-commit-get-fatal-error-fatal-crlf-would-be-replaced-by-lf-in/31144141#31144141

## Meta

### Use {{VIM}} as Editor

- Install Vim using homebrew
- Set vim to be the default editor with `git config --global core.editor "vim"`

### Good Commit Hygiene

- https://chris.beams.io/posts/git-commit/
- https://dhwthompson.com/2019/my-favourite-git-commit
- https://mtlynch.io/code-review-love/

## References

1. https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging
2. https://koukia.ca/delete-a-local-and-a-remote-git-branch-61df0b10d323
5. https://bugfactory.io/blog/orphaned-brachnes-in-git/
4. https://git-scm.com/docs/git-add
5. https://devconnected.com/how-to-cherry-pick-git-commits/
6. https://phoenixnap.com/kb/git-revert-last-commit
7. https://stackoverflow.com/questions/41842149/error-commit-is-a-merge-but-no-m-option-was-given
8. https://superuser.com/questions/1309196/how-to-update-authentication-token-for-a-git-remote
9. https://www.git-tower.com/learn/git/faq/cherry-pick/

[manually edit hunk]: https://rietta.com/blog/git-patch-manual-split/
[stashing]: https://www.freecodecamp.org/news/git-stash-explained/
[Gitignore]: https://git-scm.com/docs/gitignore

[Delete previous files in gitignore]: https://stackoverflow.com/questions/107701/how-can-i-remove-ds-store-files-from-a-git-repository

