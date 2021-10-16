---
title: gitignore
description: gitignore is way to clean up what will or won't be searched for when committing to a git repo.
---

Creating a `.gitignore` file in the root folder of your project will ensure every file that matches a line within the file will be ignored by git.

- Using a `*` will work as a wildcard for every file within that level of the given directory, or as a wildcard within a filename.
- Using two `**` in the filepath will look within every level recursively from that point forward. e.g. `**/.DS_Store` will find a file called `.DS_Store` in the root directory as well as any others in any folders within that root directory. `lib/**/__pycache__` will match any files or folders named `__pycache__` that are within the `lib` directory at any depth.

## Global gitignore

You can ignore files globally by adding them to `~/.gitignore_global`. 

## Delete previous files in gitignore

If you add a file to `.gitignore` after previously committing that file, you may see untracked changes on those files. You have to remove the old files from the git repository to remove that error.

- Remove the existing files: `find . -name {filename} -print0 | xargs -0 git rm -f --ignore-unmatch`
- Add the file to the gitignore: `{filename}`

## References

1. https://stackoverflow.com/questions/107701/how-can-i-remove-ds-store-files-from-a-git-repository
2. https://git-scm.com/docs/gitignore
