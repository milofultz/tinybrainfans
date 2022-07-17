---
title: NPM
description: Node Package Manager is a hub from which you can install, manage, and maintain node/Javascript projects.
---

Node Package Manager is a hub from which you can install, manage, and maintain {{node}}/{{Javascript}} projects. NPM is bundled with node, so of you have installed node, you have npm.

## Delete old `node_modules`!

`node_modules` folders take up stupid amounts of space on your computer. Luckily, if you regularly delete all of them on your computer, you can just reinstall the ones you need for projects you use/work on right now. (The following examples are all for OSX, but you can find Windows examples at the source[2]).

Show all `node_modules` folders within and their respective size:

```shell
find . -name "node_modules" -type d -prune -print0 | xargs -0 du -chs
```

Delete the `node_modules` folders found recursively within the current directory:

```shell
find . -name 'node_modules' -type d -prune -print0 -exec rm -rf '{}' \;
```

*Note: using a package like `trash-cli`[3] can help if you don't want your mistakes to be irreversible.*

Delete the global `node_modules` folder:

```shell
npm ls -gp --depth=0 | awk -F/ '/node_modules/ && !/\/npm$/ {print $NF}' | xargs npm -g rm
```

## Troubleshooting

### Global Packages Not Found

If you have installed a package globally (`npm i -g {package}`) and you can't use because it is "not found", try the below steps.

1. `npm list -g --depth=0` - This should show your package.
2. `npm bin -g` - Take note of this directory.
3. `npm config set prefix` - Take note of this directory as well.
4. Create a place for your npm global packages to reside and set your path to point to them:

```bash
mkdir ~/.npm-global  # this could already exist. If so, skip.
npm config set prefix ~/.npm-global  # If your prefix is already set to here, you can skip.
export PATH=~/.npm-global/bin:$PATH
source ~/.profile
```

5. Try installing your package once again globally.

### Package Lock Conflicts During Rebase

See {{Rebase (git)}}.

## devDependencies

You can save packages as a devDependency by using `--save-dev` as an option in the CLI.

`devDependencies` are for the **developers** of the project. Things like test frameworks, documentation, etc. If someone downloads and uses your project, they won't have the dev dependencies installed. If someone wants to build on your project, they can download the dev dependencies.

## References

1. https://docs.npmjs.com/downloading-and-installing-node-js-and-npm
2. https://trilon.io/blog/how-to-delete-all-nodemodules-recursively
3. https://github.com/andreafrancia/trash-cli

