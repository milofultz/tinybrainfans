---
title: NPM
description: Node Package Manager is a hub from which you can install, manage, and maintain node/Javascript projects.
---

Node Package Manager is a hub from which you can install, manage, and maintain {{node}}/{{Javascript}} projects. NPM is bundled with node, so of you have installed node, you have npm.

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

## devDependencies

You can save packages as a devDependency by using `--save-dev` as an option in the CLI.

`devDependencies` are for the **developers** of the project. Things like test frameworks, documentation, etc. If someone downloads and uses your project, they won't have the dev dependencies installed. If someone wants to build on your project, they can download the dev dependencies.

## References

- https://docs.npmjs.com/downloading-and-installing-node-js-and-npm
