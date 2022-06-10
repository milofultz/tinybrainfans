---
title: Gradients (CSS)
description: How to create and use linear gradients in CSS.
---

How to create and use linear gradients in {{CSS}}.

## Background or Image

```css
/*
linear-gradient(
  {direction},                      `to left top`, `45deg`, `0.25turn`
  {starting color}
    {full color starting position}  `0`, `33%`
    {full color ending position},   `33%`, `50%`
  ...more colors
) 
*/

.gradient {
  background-image: linear-gradient(to right, $color-primary-light, $color-primary-dark);
}
```

You can make an immediate switch between colors by setting starting and ending positions at the same value. This example goes to the bottom right from 0%-50% with white and then from 50% to 100% with orange.

```css
.selector {
  background-image: linear-gradient(to right bottom, white 50%, orange 50%);
}
```

## Text

```css
h1.gradient-text {
  /* Create the bg gradient */
  background-image: linear-gradient(to right, $color-primary-light, $color-primary-dark);
  /* Confine gradient area to width of content */
  display: inline-block;
  /* Clip the bg gradient to the text area */
  -webkit-background-clip: text;
          background-clip: text;
  /* Allow gradient to show through text area */
  color: transparent;
}
```

## References

1. https://developer.mozilla.org/en-US/docs/Web/CSS/linear-gradient()