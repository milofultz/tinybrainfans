---
title: SVG
description: SVG's are scalable vector graphics. They consist of instructions for the computer to follow to create the drawing.
---

SVG's are scalable vector graphics. They consist of instructions for the computer to follow to create the drawing.

An SVG file is an {{XML}} markup file and thus is super simple to create yourself. All SVG's start out with an outer `svg` element.

```xml
<svg version="1.1" width="300" height="200" viewBox="x1 y1 x2 y2" xmlns="http://www.w3.org/2000/svg">
	<!-- Version is not necessary -->
  <!-- W/H set during render, can be overwritten via CSS -->
  <!-- Viewbox is the part of grid to be shown  -->
  <!-- xmlns is required only for SVG files, not inline HTML -->
</svg>
```

## Drawing Shapes and Paths

SVG's use a grid system, where positive X is **right** and positive Y is **down**. The top left of the document is then `0, 0`.

By default, renderings that come first, are placed below renderings that come later.

```xml
<svg ...>
  <rect ...></rect>      // Behind the circle
  <circle ...></circle>  // On top of the rect
</svg>
```

You can group SVG elements in a `<g>` container, and all transformations made on the container will occur to their children.

### Path

The `path` element is how you "pick up" and "put down" your "pen", as well as draw the lines which can make up a filled shape or just a stroked line. The directions go within the `d` attribute.

`M x y` is when you place your pen a given position without a stroke. `L x y`is when you draw a line to (x,y) from your starting point.

```xml
<!-- This will move the pen to (0, 10) and draw a line to (10, 0) in the given box -->
<path d="M 0 10 L 10 0"></path> 
```

### Shapes

Rectangles are drawn with the `rect` element.

Circles are drawn with the `circle` element, with a center X/Y and a radius.

```xml
<circle cx="50" cy="50" r="50"/>
```

Other polygons are drawn with the `polygon` element and a series of `X,Y` points separated by spaces.

```xml
<polygon points="0,100 50,25 50,75 100,0" />
```

## External file or inline {{HTML}}?

External files allow the computer to only have to load the data once and then reuse it throughout the page. If you have it written out multiple times, that is a lot of extra work.

## References

1. https://stackoverflow.com/questions/18467982/are-svg-parameters-such-as-xmlns-and-version-needed
2. https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Positions
3. https://developer.mozilla.org/en-US/docs/Web/SVG/Element
4. https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Paths
5. https://developer.mozilla.org/en-US/docs/Web/SVG/Element/circle
6. https://developer.mozilla.org/en-US/docs/Web/SVG/Element/polygon