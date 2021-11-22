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

## Syntax

Here are some examples of syntaxes made for homemade langs, from simple to less simple:

- [Kaku](https://github.com/Thomasorus/Kaku/blob/master/kaku.sublime-syntax)
- [Tablatal](Tablatal.sublime-syntax)

### How To Make Your Own!

Lets start with a basic example. {{FRACTRAN}} is an esoteric language with only a few types of symbols (and many of these are not necessary, but good for learning):

Group | Example | Significance
--- | --- | ---
Numbers | `123` | Comprises numerators and denominators
Comma | `,` | For between fractions OR numbers within a numerator or denominator
Parentheses | `(` and `)` | Surrounds a program
Operators | `+`, `-`, `*`, `/` | Separates primes
Double forward slashes | `//` | Begins an inline comment that lasts until the end of the line
Forward slash and an asterisk, and vice versa | `/* */` | Begins and ends a multi-line comment

We will start with only **numbers**, **commas**, and **parentheses**.

#### Making a New Syntax

First, we will want to create our `FRACTRAN.sublime-syntax` file.

- In the menubar, go to `Preferences > Browse Packages...`.
- If there is not a `User` folder, create it.
- Create a new empty file and save it within that new folder, calling it `FRACTRAN.sublime-syntax`.

This new file needs to be populated with some key fields for Sublime Text to recognize it properly. Note that this type of file uses [YAML syntax](https://yaml.org/spec/1.2.2/).

```yaml
%YAML 1.2
---
name: FRACTRAN
file_extensions:
  - fractran
scope: source.fractran
```

- The header `%YAML 1.2` and the following three hyphens define the type. 
-  `name` is how it will be displayed in the `User` subfolder of the syntaxes. 
- `file_extensions` defines what file extensions this syntax will apply to. 
- `scope` defines the scope of your syntax. Because we are creating a new one, we will call it `source.fractran`, but extensions to other languages may use something already established, like `source.c`, `source.python`, etc.

#### Contexts

Now we are in the meat and potatoes, where we start defining `contexts`. These `contexts` are how the syntax parser knows what to parse and when. In its simplest form, it does a basic {{regex|Regular Expressions}} on a set of characters and applies a specific formatting. As it gets more complex, it complements this behavior with a {{stack|Stack (Programming)}}, pushing and popping contexts as it encounters matches.

Lets make our first context. Append this to our `sublime-syntax` file:

```yaml
contexts:
	main:
		# The main context is the initial starting point of our syntax.
    # Include other contexts from here (or specify them directly).
    - match: '\d'
      scope: constant.numeric
```

We've now added a check for our "Numbers" group. If you open a new file and apply this syntax to it, you should be able to type something like `1/11` and see the numbers highlighted in a different color. Success!

We can now append this match group for our forward slash:

```yaml
    - match: '\/'
      scope: keyword.operator
```

You should now see some coloring on your forward slash as well!

<!-- Pushing and popping contexts in the context of a function -->

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
3. https://github.com/Thomasorus/Kaku/blob/master/kaku.sublime-syntax
3. https://www.sublimetext.com/docs/scope_naming.html#syntax_definitions