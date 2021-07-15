---
title: Transitions (CSS)
description: Transitions allow you to transform a CSS rule from one set of values to another, and can be triggered either by a pseudoclass selector, on a regular cycle, or just once when loaded.
---

Transitions allow you to transform a {{CSS}} rule from one set of values to another, and can be triggered either by a pseudoclass {{selector|Selectors (CSS)}}, on a regular cycle, or just once when loaded.

This example I modified from [MDN](http://mdn.io) shows how you would transform the background color of a button on hover:

```css
#button {
  background-color: rgba(0, 2, 143, 1);
  transition-property: background-color;
  transition-duration: 4s;
  transition-timing-function: ease;
  transition-delay: 2s;
}

#button:hover {
  background-color: rgba(0, 2, 143, 0.5);
}
```

### References:

1. https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Transitions/Using_CSS_transitions