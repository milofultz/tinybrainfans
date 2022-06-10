---
title: ESLint
description: Enforce rules and raise warnings to keep your Javascript, Typescript, and React code clean and bug free.
---

Enforce rules and raise warnings to keep your {{Javascript}}, {{Typescript}}, and {{React}} code clean and bug free.

## Getting Started

Install ESLint in your {{node}} project with {{npm}} or {{yarn}}:

```shell
$ npm install eslint --save-dev
```

Create your config file in the root directory of your {{node}} project at `eslintrc.js`. Add any specific rules to the new file. An example ESLint config looks like this:

```json
{
  "extends": "eslint:recommended",
  "rules": {
    "semi": ["error", "always"],
    "quotes": ["error", "double"]
  }
}
```

The `"extends": "eslint:recommended"` will make a good basic ruleset for your linting. You can see the rules it adds and others you can add on their [rules page](https://eslint.org/docs/rules/). Regarding the rules,

> The names `"semi"` and `"quotes"` are the names of [rules](https://eslint.org/docs/rules) in ESLint. The first value is the error level of the rule and can be one of these values:
>
> - `"off"` or `0` - turn the rule off
> - `"warn"` or `1` - turn the rule on as a warning (doesn't affect exit code)
> - `"error"` or `2` - turn the rule on as an error (exit code will be 1)

### React

When using ESLint with frameworks like {{React}}, you may end up with errors like `'document' is not defined.` or `Parsing error: The keyword 'import' is reserved`. These can be handled as follows:

- `'document' is not defined.`

  - Config:

    ```json
    "env": {
      "browser": true,
      "node": true
    }
    ```

- `Parsing error: The keyword 'import' is reserved`

  - Install: `npm add eslint-plugin-react --save-dev`

  - Config:

    ```json
    ...
    "extends": [..., "plugin:react/recommended"],
    "parserOptions": {
      ...
      "ecmaFeatures": {"jsx": true},
      "ecmaVersion": 7,
      "sourceType": "module"
    },
    "plugins": [..., "react"],
    ...
    ```

## Specific Naming Conventions

Using the [`id-match`](https://eslint.org/docs/rules/id-match) rule, you can specify non-standard naming conventions for variables and classes. For example, if you wanted to use something like {{snake case|Case Styles}}, you would add this rule:

```json
{
  "id-match": ["error", "^(_{1,2})?[a-zA-Z0-9]+(_[a-zA-Z0-9]+)*$"]
}
```

## Ignore rule in a file

By placing this at the top of the file, it will ignore this rule throughout the entire file. `/* eslint-disable {rule} */`

To disable a rule for only one line, place this after the code on the offending line. `// eslint-disable-line {rule}`

## References

- https://github.com/eslint/eslint#installation-and-usage
- https://eslint.org/docs/user-guide/getting-started
- https://eslint.org/docs/rules/
- https://eslint.org/docs/user-guide/configuring/language-options#specifying-environments
