---
title: Sublime Text
description: Sublime Text is an application made for software development.
---

Sublime Text is an application made for software development.

## Command Line Shortcut

To create a symlink in {{bash}} that will allow you to open any folder in Sublime Text:

```bash
echo 'export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"' >> ~/.bash_profile
// or
echo 'export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"' >> ~/.zprofile
```

Now you can just type `subl .` in a given folder, a la `code .` in {{Visual Studio Code}}

## Key Bindings

### Multiple Commands

Sublime Text 4 provided the ability to `chain` multiple commands and args together, while Sublime Text 2 and 3 required the use of the [Chain Of Command plugin](https://github.com/jisaacks/ChainOfCommand). Both use the same syntax:

```json
{
    // Link Opener
    // This example uses https://github.com/NoxArt/SublimeText2-LinkOpener
    {
        "keys": ["super+shift+u"],
        "command": "chain",
        "args": {
            "commands": [
                ["expand_selection", {"to": "smart"}],
                ["link_opener_open_url"]
            ],
        }
    }
}
```

## Troubleshooting Errors

### Autocompletion/Snippets

1. Open the console (`View > Show Console` or ``` ctrl + ` ``` on {{OSX|MacOS}}).
2. In the console, enter in `sublime.log_commands(True)`.
3. Do what you need to recreate the issue. Immediately after triggering the unwanted behavior, document what you think is causing it that is in the console. In my case it was `command: insert_snippet {"contents": ":$0;"}`.
4. Depending on which syntax you are in, or which plugin is listed/suspected, use the command palette to `View Package File` and type in the syntax/plugin. This will show files that are hidden, as well, which makes diagnosing issues with default plugins/syntaxes much  easier. In my case this was in the `keymap` file.
5. Once you find a possible file, open it. `Save As` in the `Packages` directory under a new folder called the name of the plugin or syntax. e.g. for the {{Sass}} plugin/syntax, I created a folder in `Packages` called `Sass` and saved a copy of the `Default.sublime-keymap` file there, which included my additions. [You can find more on overriding packages here](https://www.sublimetext.com/docs/3/packages.html).
6. In my case, I copied the old rule over and changed the `{"contents": ":$0;"}` object to `{"contents": ":$0"}`, which allowed the colon to be typed without adding any additional characters.

### Syntax Highlighting

Packages in Sublime Text are interdependent on each other and many of the default packages are inferior to third-party (e.g. {{Babel}} over {{Javascript}}). When nested syntaxes are not cooperating, in this example {{Pug}}'s Javascript syntax, you can `Disable Package > Javascript` and install `Babel` and this will cause Pug to correctly highlight conditionals and the succeeding code.

## References

1. https://milofultz.com/2021/03/06/sublime-keymap
2. https://stackoverflow.com/questions/59635627/how-to-override-sublime-text-3-packages-css3-completion-syntax
3. https://www.sublimetext.com/docs/command_line.html#mac