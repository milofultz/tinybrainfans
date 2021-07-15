---
title: Inverted Triangle CSS
description: ITCSS is a way to structure your CSS projects to minimize specificty issues and organizational problems.
---

[ITCSS][] is a way to structure your {{CSS}} projects to minimize specificty issues and organizational problems. ITCSS is not a naming convention.

ITCSS is most effective when used with a preprocessor like {{Sass}}, {{Less}}, etc.

## Principles

The inverted triangle refers to how your {{CSS}} project should be put together. At the beginning, we have the most far-reaching, least specific, and most generic styles possible. This includes variables, sitewide styles like font-settings, and {{CSS resets|CSS reset}}. As we go farther in the file, we get more localized, more specific, and more explicit styles. This includes component-specific styles and rules.

## Layers

The inverted triangle has layers from top to bottom, representing the amount of reach each layer should have; the first layers have the most, decreasing their reach the farther down you go.

**The first two layers should not generate any CSS on their own if being used with a preprocessor.**

1. Settings - Variables
2. Tools - Any mixins or functions that need to be globally available. If they don''t need to be globally available, they should go somewhere else.
3. Generic - Includes Normalize, {{resets|CSS reset}}, box-sizing rules, etc.
4. Elements - These are the styles that refer to unclassed HTML elements. Changing the font-size of headings, the focus styles on inputs, or default anchor and link behavior.
5. Objects - Undecorated design patterns, like wrappers, containers, rows, grids, etc.
6. Components - Specific UI components. Most of our styling should go here, as most UI components should be composed of objects and components.
7. Utilities (Trumps) - Anything that should be able to override the previous styles.

## BEMIT

This framework can be combined with {{BEM}} to make the {{HTML}} more readable for the developer. Using the standard Block, Element (`__`), Modifier (`--`) syntax, we can also use prefixes and suffixes to make their functionality more clear.

### Prefixes

- `o-` - Object
- `c-` - Component
- `u-` - Utility/Trump
- `is-`/`has-` - State
- `js-` - Javascript hook
- `_` - Outright hacks

### Suffixes

- `@` - Responsive media or print queries (need to escape @ in CSS with `\@`)

## References

1. https://www.freecodecamp.org/news/managing-large-s-css-projects-using-the-inverted-triangle-architecture-3c03e4b1e6df/
3. https://csswizardry.com/2015/08/bemit-taking-the-bem-naming-convention-a-step-further/
4. http://www.jamesturneronline.net/blog/bemit-naming-convention.html

[ITCSS]: https://www.xfive.co/blog/itcss-scalable-maintainable-css-architecture/

