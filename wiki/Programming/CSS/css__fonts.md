---
title: Fonts (CSS)
description: Importing and using external fonts properly in CSS.
---

Importing and using external fonts properly in {{CSS}}.

## System Defaults/Safe Font Stacks[2]

This stack is a sans-serif font that will work on most browsers. Github and Wordpress currently implement this.

```css
body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
}
```

A new feature that has pretty good coverage allows the use of `system-ui` in place of the `-apple-system` and `BlinkMacSystemFont`.[3]

## Using `@font-face`

```css
@font-face {
  font-family: 'Verlag Condensed Bold';
  src: url('https://brandlive-upload.s3-us-west-2.amazonaws.com/933/documents/1wp6lcexy4/verlagcondensedbold.otf');
  [ unicode-range: <unicode-range>; ]
  [ font-variant: <font-variant>; ]
  [ font-feature-settings: <font-feature-settings>; ]
  [ font-variation-settings: <font-variation-settings>; ]
  [ font-stretch: <font-stretch>; ]
  font-weight: bold;
  [ font-style: <font-style>; ]
}
```

You can include multiple `src` values via a call to the user's fonts via `local("Font Name")`, `url("...")`, as well as specifying formats after the url (`url("...") format("truetype"),`), all separated by commas and ending with a semicolon.

## `@import` vs. `<link>`

To bring in another stylesheet with a font attached, [Google Fonts](https://fonts.google.com/) and others offer an `@import` option. [This unfortunately is blocking][use link over import] and and will delay all other loading until that import is complete. Instead, include the url in a `<link>` and it will load all elements at the same time.

```html
<link href='http://fonts.googleapis.com/css?family=Judson:400,400italic,700' rel='stylesheet' type='text/css'>
```

## References

1. https://developer.mozilla.org/en-US/docs/Web/CSS/@font-face
2. https://css-tricks.com/snippets/css/system-font-stack/
3. https://caniuse.com/?search=system-ui

[use link over import]: https://stackoverflow.com/questions/12316501/including-google-web-fonts-link-or-import/12380004#12380004
