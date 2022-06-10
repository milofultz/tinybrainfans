---
title: Visual Studio Code
description: Visual Studio Code/Codium is an open-source application developed by Microsoft for software and code development.
---

Visual Studio Code/Codium is an {{open-source}} application developed by Microsoft for software and code development.

## Snippets

Creating snippets is a simple way to make your life easier. To create your own, go to Preferences > User Snippets and create a new one. Here is an example of a {{React}} snippet for arrow function components:

```json
{
  "Arrow Function Component": {
    "scope": "javascript,javascriptreact,typescript,typescriptreact",
    "prefix": "afc",
    "body": [
      "const $1 = () => {",
      "",
      "};",
      "",
      "export default $1;",
      ""
    ],
    "description": "Create arrow function React component"
  }
}
```

The **prefix** is the shortcut you will type in.

The **body** is what it will expand to. Note that each newline needs to be in its own set of quotes. You can use `$1`, `$2`, etc. to note each successive input to be carried out by the user after expansion.

## Extensions Missing

If an extension is found on VS Code but not on VS Codium, it can still be installed by sideloading it as a VSIX.  "You'll have to sideload that extension since the marketplace that VS Codium uses is OpenVSX which hosts only open source extensions"[1]. 

You can download it on the website and in the "Extensions" pane of VS Codium, click the dots up top and choose "Install VSIX".

## References:

1. https://www.reddit.com/r/vscode/comments/lt8y62/live_share_missing_from_extension_marketplace/
2. [Live Share](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare)

