---
title: Yarn
description: Yarn is a hub from which you can install, manage, and maintain node/Javascript projects
---

Yarn is a hub from which you can install, manage, and maintain {{node}}/{{Javascript}} projects. 

## Installation

Yarn needs to be installed globally via {{NPM}}.

```shell
$ npm i --global yarn
```

## Basic Commands

Command | Args | Effect
--- | --- | ---
`add n [--dev]` | `n`: Package name(s);<br />`--dev`: Add to dev dependencies | Adds package(s) to project
`install` | | Install all packages found in project
`run n` | `n`: Name of script | Run the script `n` found under `scripts` in package JSON
`start` | | Run the script found under `scripts`/`start` in package JSON
`test` | | Run the script found under `scripts`/`test` in package JSON

## References

- https://classic.yarnpkg.com/en/
