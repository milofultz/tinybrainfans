---
title: Web Fonts (HTML)
---

To import a font from Google Fonts, you can copy the font(s) URL from the Google Fonts library and then paste it in your {{HTML}}. For this challenge, we'll import the Lobster font. To do this, copy the following code snippet and paste it into the top of your code editor (before the opening style element):

```html
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet" type="text/css">
```

Now you can use the Lobster font in your {{CSS}} by using Lobster as the `FAMILY_NAME` as in the following example:

```css
font-family: FAMILY_NAME, GENERIC_NAME;
```

The `GENERIC_NAME` is optional, and is a fallback font in case the other specified font is not available.

## References:

1. https://www.freecodecamp.org/learn/responsive-web-design/basic-css/import-a-google-font