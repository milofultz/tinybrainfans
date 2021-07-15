---
title: Vendor Prefixes (CSS)
description: Vendor prefixes are used to ensure that older or unsupported browsers have every possibility of implementing the desired rule.
---

Vendor prefixes are used to ensure that older or unsupported browsers have every possibility of implementing the desired rule. Vendor prefixes are before the declarations and denote which tech/browser/setup it is intended for.

```css
div {
  -webkit-box-shadow: 0px 0px 4px #fff;
     -moz-box-shadow: 0px 0px 4px #fff;
      -ms-box-shadow: 0px 0px 4px #fff;
          box-shadow: 0px 0px 4px #fff;
}
```

## Using {{Sass}}

{{Sass}} mixins allow browser prefixes to be done easily.

## Using [Autoprefixer][]

You can run [Autoprefixer][] on your {{CSS}} to add the prefixes needed on your completed CSS.

## Do I have to?

Find out if you do here: 

- http://shouldiprefix.com/ 
- https://caniuse.com/

## References

1. https://css-tricks.com/snippets/sass/mixin-prefix-properties/

[Autoprefixer]: https://github.com/postcss/autoprefixer#preprocessors

