---
title: NVM
description: Node Version Manager allows you to use multiple diferent versions of node and switch between them easily.
---

Node Version Manager allows you to use multiple diferent versions of {{node}} and switch between them easily.

## Installation

### NVM

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

## References

1. https://techstacker.com/run-multiple-node-versions-node-nvm/
