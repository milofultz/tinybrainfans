---
title: git alias
description: Aliases in git are a way to minimize keystrokes and mistakes when using complex commands.
---

You can check out {{my personal list of git aliases here|My git Aliases}}.

Command | Action
--- | ---
`--global alias.{name}` | Set the alias `name` across your whole machine
`--unset alias.{name}` | Unset the following alias
`--unset-all alias.{name}` | Unset all of the aliases found at the following alias (useful if you accidentally set two aliases on the same name)

```bash
shell> git config --global alias.co checkout # now 'git co' is aliased to 'git checkout'
shell> git config alias.p 'push origin HEAD'  # now 'git p' is aliased to 'git push origin HEAD' ONLY for current project
shell> git config --global --unset alias.p # now 'git p' is no longer aliased
```

## List All Aliases

Running this will give you the `git alias` command, which will list all of your current git aliases.

```bash
$ git config --global alias.alias "! git config --get-regexp ^alias\. | sed -e s/^alias\.// -e s/\ /\ =\ /"
```

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
10. https://stackoverflow.com/questions/17683458/how-do-i-commit-case-sensitive-only-filename-changes-in-git
11. https://github.com/delventhalz/no-fear-git

[manually edit hunk]: https://rietta.com/blog/git-patch-manual-split/
[stashing]: https://www.freecodecamp.org/news/git-stash-explained/
