---
title: Canvas
description: The Canvas API provides a means for drawing graphics via JavaScript and the HTML `<canvas>` element.
---

The Canvas API provides a means for drawing graphics via {{JavaScript}} and the {{HTML}} `<canvas>` element.

## Initialization

To start using the canvas, put the canvas element in your webpage HTML, along with a width or height in pixels. Fallback content goes in between the opening and closing tag.

```html
<canvas id="canvas-name" width="150" height="150"></canvas>
```

The canvas is initially blank and then needs to be accessed, with the new context assigned to a variable. This variable will become the way to draw on the canvas.

```javascript
var canvas = document.getElementById('canvas-name');
var ctx = canvas.getContext('2d');
```

## Drawing

Canvas only supports rectangles and paths.

### Rectangles

```javascript
ctx.fillRect(x, y, width, height)   // Draws a filled rectangle.
ctx.strokeRect(x, y, width, height) // Draws a rectangular outline.
ctx.clearRect(x, y, width, height)  // Clears the specified rectangular area, making it fully transparent. 
```

### Paths

[From MDN](https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D#paths):

A path is a list of points, connected by segments of lines that can be of different shapes, curved or not, of different width and of different color. A path, or even a subpath, can be closed. To make shapes using paths, we take some extra steps:

1. First, you create the path with `beginPath()`
2. Then you use drawing commands to draw into the path
3. Once the path has been created, you can stroke or fill the path to render it with `closePath()`

```javascript
ctx.beginPath() // Creates a new path. Once created, future drawing commands are directed into the path and used to build the path up.
ctx.closePath() // Adds a straight line to the path, going to the start of the current sub-path.
ctx.stroke()    // Draws the shape by stroking its outline.
ctx.fill()      // Draws a solid shape by filling the path's content area. 
```

#### Path Methods

`moveTo(x,y)` **moves the pen without recording it as a path** to be drawn or filled.

`lineTo(x,y)` should be used to draw **straight lines**.

`arc(x, y, radius, startAngle, anticlockwise)` will draw an **arc centered at x, y**.

`arcTo()` is often used to make rounded corners https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/arcTo

`quadraticCurveTo(cp1x, cp1y, x, y)` and `bezierCurveTo(cp1x, cp1y, cp2x, cp2y, x, y)` are also good for [rounded shapes](https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D#paths. 

## References

- https://webglfundamentals.org/webgl/lessons/webgl-anti-patterns.html

