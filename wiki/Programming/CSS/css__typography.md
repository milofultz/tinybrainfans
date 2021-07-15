---
title: Typography (CSS)
description: How to properly define and apply typography rules in CSS.
---

How to properly define and apply typography rules in {{CSS}}.

## Line Height

The `normal` value on a `line-height` property in {{CSS}} is calculated as 1.2x the font size; e.g. a font size of 16px will have a `normal` line height of (1.2 * 16)px = 19.2px.

When setting a defined line-height, use the `em` unit to set it relative to the current `font-size`. 

### [Best Practices](http://smad.jmu.edu/shen/webtype/lineheight.html)

1.5em is the most common line height for copy.

- The longer the line length, the taller the Line-height should be.
- The shorter the line length, the shorter the Line-height should be.
- Use a taller line-height with continuous copy.
- Use taller line-heights with large x-height fonts.
- The ascenders and descenders of the lines of text should not touch.
- Place the lines close enough together that the reader requires no effort to find the next line, then balance the height based on the line length.

## References

1. http://smad.jmu.edu/shen/webtype/lineheight.html
2. https://www.madebymike.com.au/writing/precise-control-responsive-typography/
3. https://blog.typekit.com/2016/08/17/flexible-typography-with-css-locks/