---
title: git
description: git is a version control system.
---

## Getting Started

I recommend doing tutorials before really diving in, as the way version control, and particularly git, works will be very confusing if you don't really grok it.

- Git Is Simpler Than You Think[12]
- Git Training from UnseenWizzard[21]
- No Fear Git[11]
- Git Immersion[23]
- git - the simple guide[24]

I would recommend not using the git docs unless you really need to as they, like most Unix tools, are not written for normal people and are therefore a bit obtuse and difficult to parse. Most people have tried to grok the concepts and put them in human terms and thus this site and other tutorials exist. The docs are good, but use them to complete your knowledge not as the basis.

## Commits

Add files you want to commit: `git add {file or folder name}`. You can also add all by using `git add .`, but this is not recommended, as you don't want to add all unless you are POSITIVE it doesn't contain cruft or unwanted changes, which is rarely the case. An easy way to check what has changed in your files since last commit is to use the `--patch` flag.

### `--intent-to-add`

Using this flag will let you track files without adding their contents to staging. This is useful especially with using the `--patch` flag below on new or currently untracked files. This flag can also be shortened to `-N`.

For example, if you were already tracking `file1` and refactoring part of `file1` into `file2`, you would normally not be able to commit only *part* of `file2`. By first using `git add --intent-to-add/-N file2`, the file would now be *tracked* but not yet *staged*. From here, you could use `--patch` and continue by adding portions at a time.[14]

### `--patch`

Add only portions of a file as 'hunks': `git add --patch/-p {file or folder name}` (file or folder is optional). This will prompt you with options:
* y - stage this hunk
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
* e - manually edit the current hunk[17] (particularly if your code is really close together but needs to be broken down)
* ? - print help

### Split Up Previous Commits Into Smaller Commits[15]

To split up your most recent commit, you can use `git reset HEAD~`. This will retain the changes you made in the last commit, but remove the actual commit of those changes from your history. From here you can use `--patch` and select which portions you want to commit.

To split up an older commit, you will want to use an {{interactive `rebase`|Rebase (git)}}. **Don't rebase if you don't know what you are doing.**

1. Start by specifying how many commits you want to go back within this command: `git rebase -i HEAD~N`, replacing N with the number of commits you want to go back.
1. In the interactive rebase screen, replace the word `pick` with `edit` to stop git at that commit before proceeding with the rebase. Once done, save and exit the editor. This will activate the git rebase process.
1. Git should have stopped at your specified hash, which you can see with a `git status`. It should say something like `You are currently editing a commit while rebasing branch 'branch_name' on 'f05d5ce'`.
1. From there, you can continue as if you were splitting your most recent commit: `git reset HEAD~`.
1. Commit each change as desired and when complete, use `git rebase --continue` to finish the rebasing process.

### Case Sensitivity

Git by default is not case sensitive when it comes to filenames and will ignore renaming of file structures that are only by case. To change this default behavior, use `git config core.ignorecase false`. **Note that setting this option to false on a case-insensitive file system is generally a bad idea. Doing so will lead to weird errors. For example, renaming a file in a way that only changes letter case will cause git to report spurious conflicts or create duplicate files.**

If it is a file or files, you can change their name as normal and then within git via this command: `git mv -f filename.txt Filename.txt`. This will make it show up in your commit. If it is a directory, you will need to do this with every file within the directory.

## Squash and Merge[19]

### Why

> before you merge a feature branch back into your main branch (often `master` or `develop`), your feature branch should be squashed down to a single buildable commit, and then rebased from the up-to-date main branch.

> If you follow this process it guarantees that ALL commits in master build and pass tests. This simple fact makes debugging an issue much easier. You can use **git** bisect when trying to find the source of a bug. Git bisect becomes almost completely ineffective if there are broken commits on the master  branch; if you jump to a commit that isn???t clean, it???s difficult or impossible to tell if it introduced the bug. [...] [A] drawback is that we lose some granularity when we squash our commits. If you really want to have multiple commits for a feature, at least squash down so that each commit builds and passes tests.

### How

Most simple is to use the `git merge --squash` option[20]. If you want to merge `starting-branch` into `target-branch`:

- Check out `target-branch`
- Use `git merge --squash starting-branch`
- Commit all changes using `git commit`

Another more intensive way to do it that gives you more control is to {{rebase|Rebase (git)}} the new branch off of the target branch you wish to merge into. Using {{interactive rebase|Rebase (git)}}, select every commit except the oldest one and set to `squash`. Select that first commit and set it to `reword`. Once the rebase starts on exit, you will be able to change the commit message that will hold all of the squashed commits. Once that is complete, merge it into the target branch.

## Branches

Action | Command
--- | ---
See all branches | `git branch`
See the remote branches your local repo knows | `git branch -a`
Checkout an existing branch | `git checkout {name}`
Create and name a new branch | `git branch {name}`
Create and checkout a new branch | `git checkout -b {name}`
Create an orphaned branch | `git checkout --orphan {branch_name}`
Push the current branch | `git push origin HEAD`
Rename a branch. Assuming you're currently on the branch you want to rename | `git branch -m {name}`
Delete a fully pushed and merged branch | `git branch -d {name}`
Force delete a local branch | `git branch -D {name}`
Merge another branch into currently checked-out branch | `git merge {other-branch}`

### Orphan Branches

Commits usually have one parent, their previous iteration. The root commit (very beginning) of your repo has none, and when you merge commit a fork with another branch or the master branch.

An orphan branch is a new root commit, where:

> The first commit made on this new branch will have no parents, and it will be the root of a new history, totally disconnected from all the other branches and commits. In other words, it creates a new root commit and uses it as a starting point for your new branch.

### Delete All Merged Branches

To delete all branches that have been merged, start out by pulling from remote to ensure you are using the most up to date info. Then check which branches are merged by running `git branch --merged`. We will be using `egrep` to grab these and put them into a macro that will delete each merged branch that doesn't fit within the regex. To ensure a branch that contains a certain keyword does not get deleted, add it to the `egrep -v "(^...)"` line, with each keyword separated by an OR `|`. This is all then passed into {{xargs}} where it sends each merged branch as an argument to `git branch -d`. Note that this uses `-d` so it will *only* delete branches that have been merged into the current branch. This most likely won't include {{rebased branches|Rebase (git)}}.

```bash
git branch --merged | egrep -v "(^\*|master|main|dev|staging)" | xargs git branch -d
```

## Cherry Pick[16]

> When should I use cherry-pick? **The short answer is: as rarely as possible.**

For this reason, I have not spent much time learning how to get this to work, as the only experience I have had was one of my colleagues using this and causing hours of work trying to fix the side effects.

I have only ever used this when I accidentally added a commit to the wrong branch. So anyway, proceed with caution.

If you have a commit from one branch you want to apply to another, this can be done by checking out your destination branch and calling `cherry-pick` with the hash of the desired commit you want to bring over.

```shell
git checkout target-branch
git cherry-pick d3db33f
```

Now commit `d3db33f` is on `target-branch`.

## Revert

A revert allows you to go back to a previous commit, reversing those previous between commit X (HEAD) and commit Y (the selected commit). This will create a reversal commit for each commit to be undone between X and Y. In the case of a single commit to be undone, it will make a single reversal commit.

To revert one or many commits, open your `git log` and find the commit you want to revert back to. Save this hash. Then enter the following:

```bash
$ git revert [-m 1] <commit-hash>
```

The `-m` flag is used to revert a merge; to set where the mainline is, which parent you are wanting to revert back to. Most of the time it is 1.

For example, lets say you accidentally committed to the main branch and pushed up. You can revert this with `git revert HEAD` or `git revert {hash}`, creating a commit dialog and fixing your mistake through *adding* to your commit history.

## Stashing[18]

Stashing allows you to temporarily save changes without committing anything.

To stash some changes, use `git stash save 'message about stash'`, or just `git stash` if you want to leave out the message.

To see what you have stashed, use `git stash list` to see all stashed code. Then see what is in each stash by using `git stash show {index}`, and you can see it diffed by using the `-p` flag.

Stashes can be listed recalled via the indexes shown: `git stash apply {index}` or `git stash pop {index}` if you want to remove it from the stashes after being applied.

You can `git stash drop {index}` individual stashes or `git stash clear` the entire stash.

## Resolving Merge Conflicts in Pull Requests

To resolve a merge conflict in a pull request, you can use `git merge {target-branch}`, where `{target-branch}` is the branch you are hoping to eventually merge your code into. This will create your merge conflicts locally, where you can create a new commit to handle them and {{rebase|Rebase (git)}} if you want to clean it up.

## Credentials

If you receive a message like this when trying to push up to your repo:

```
remote: HTTP Basic: Access denied
fatal: Authentication failed for 'https://gitlab.com/myusername/repo.git'
```

or

```
remote: Invalid username or password.
fatal: Authentication failed for 'https://gitlab.com/myusername/repo.git'
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

### Token

Github deprecated standard HTTPS for SSH, so if you continue to get this error, [generate a new token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) and use that token in place of your password.

## Errors

Handle Windows newlines (CRLF => LF): https://stackoverflow.com/questions/20168639/git-commit-get-fatal-error-fatal-crlf-would-be-replaced-by-lf-in/31144141#31144141

## Meta

### Simplify git Call

In your {{Bash}} or equivalent rc file, set an alias of `g` to `git`. Surprisingly has saved me quite a bit of mistypes and extra key typing.

### Use {{vim}} as Editor

- Install vim using homebrew
- Set vim to be the default editor with `git config --global core.editor "vim"`

### Good Commit and PR Hygiene

- https://chris.beams.io/posts/git-commit/
- https://dhwthompson.com/2019/my-favourite-git-commit
- https://mtlynch.io/code-review-love/
- https://sergeyzhuk.me/2018/12/29/code_review/
- https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html

> [C]ode review is significantly more effective if devs deliberately review the tests first, and most complex files next[.] -- mhoye[22]

## References

1. https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging
2. https://koukia.ca/delete-a-local-and-a-remote-git-branch-61df0b10d323
3. https://bugfactory.io/blog/orphaned-brachnes-in-git/
4. https://git-scm.com/docs/git-add
5. https://devconnected.com/how-to-cherry-pick-git-commits/
6. https://phoenixnap.com/kb/git-revert-last-commit
7. https://stackoverflow.com/questions/41842149/error-commit-is-a-merge-but-no-m-option-was-given
8. https://superuser.com/questions/1309196/how-to-update-authentication-token-for-a-git-remote
9. https://www.git-tower.com/learn/git/faq/cherry-pick/
10. https://stackoverflow.com/questions/17683458/how-do-i-commit-case-sensitive-only-filename-changes-in-git
11. https://github.com/delventhalz/no-fear-git
12. https://nfarina.com/post/9868516270/git-is-simpler
13. https://fix.code-error.com/git-merge-with-force-overwrite/
14. https://stackoverflow.com/questions/58273462/is-there-a-way-to-add-untracked-files-in-git-when-adding-via-patch
15. https://stackoverflow.com/questions/6217156/break-a-previous-commit-into-multiple-commits
16. https://stackoverflow.com/questions/9339429/what-does-cherry-picking-a-commit-with-git-mean
17. https://rietta.com/blog/git-patch-manual-split/
18. https://www.freecodecamp.org/news/git-stash-explained/
19. https://blog.carbonfive.com/always-squash-and-rebase-your-git-commits/
20. https://tech.bakkenbaeck.com/post/Rebasing_Onto_A_Squashed_Commit
21. https://github.com/UnseenWizzard/git_training
22. https://mastodon.social/@mhoye/108203495866171674
23. https://gitimmersion.com/lab_01.html
24. https://rogerdudler.github.io/git-guide/
