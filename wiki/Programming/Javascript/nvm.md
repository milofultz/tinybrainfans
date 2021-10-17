---
title: NVM
description: Node Version Manager allows you to use multiple diferent versions of node and switch between them easily.
---

Node Version Manager allows you to use multiple diferent versions of {{node}} and switch between them easily.

## Installation

### NVM

Install the newest version of NVM ([get the current version number here](https://github.com/nvm-sh/nvm#installing-and-updating))

```bash
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
```

Be sure to completely restart your terminal before proceeding.

### Node

```bash
$ nvm install --lts # most recent version with long term support
$ nvm install node  # most recent version without LTS
```

## Usage

```bash
$ nvm use --lts
$ nvm use node
```

### Specific Versions

```bash
$ nvm ls                # show all installed versions
$ nvm install xx.xx.x   # x's meaning the version numbers
$ nvm use xx.xx.x
$ nvm uninstall xx.xx.x
```

### Set Default Node Version

```bash
$ nvm alias default xx.xx
```

### Within a Project

Create a file in the root of your project called `.nvmrc` and place the version number inside, e.g.

```
14.17.6
```

To use nvm within the project, set your current directory to the root of the project where the `.nvmrc` file is and follow these steps:

- `nvm use` to use the specified version
- `nvm install` the version, if needed

## References

1. https://techstacker.com/run-multiple-node-versions-node-nvm/
2. https://github.com/nvm-sh/nvm#installing-and-updating
3. https://stackoverflow.com/questions/57110542/how-to-write-a-nvmrc-file-which-automatically-change-node-version
