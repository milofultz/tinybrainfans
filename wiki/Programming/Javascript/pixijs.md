---
title: PixiJS
description: PixiJS is an HTML5 graphical engine built in Javascript.
---

PixiJS is an {{HTML5|HTML}} graphical engine built in {{Javascript}}. 

## Getting Started

Create an `index.html` file and populate it with the following:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <!-- Import the most recent PixiJS -->
  <script src="https://pixijs.download/release/pixi.js"></script>
  <script>
		// Create the application helper
    let app = new PIXI.Application({ width: 640, height: 360 });
    // Add the Application's `view` to the body
    document.body.appendChild(app.view);

    // Create the sprite
    let sprite = PIXI.Sprite.from('sample.png');
    // Add the sprite instance to the `stage` (a Container instance)
    app.stage.addChild(sprite);

    // Add a ticker callback to move the sprite back and forth
    let elapsed = 0.0;
    app.ticker.add((delta) => {
      elapsed += delta;
      // X start + (X offset) * X range
      sprite.x = 100.0 + Math.cos(elapsed/50.0) * 100.0;
    });
  </script>
</body>
</html>
```

Substitute `sample.png` with whatever image you want. Know that if the intrinsic size is larger than the canvas, you may not see it.

## Syntax

The major components can be found and explained [here](https://pixijs.io/guides/basics/architecture-overview.html) and in the [API docs](https://pixijs.download/release/docs/index.html)

### `Application` Instance

> The Application is a simple helper that wraps a Loader, Ticker and Renderer into a single, convenient easy-to-use object.

#### `stage`

[`stage` is an instance of the `Container`.](https://pixijs.download/release/docs/PIXI.Application.html#stage)

Property | Args | Description
--- | --- | ---
[`.view`](https://pixijs.download/release/docs/PIXI.Application.html#view) | | References the renderer's canvas element

#### `ticker`

> A ticker is a PixiJS object that runs one or more callbacks each frame.

Property | Args | Description
--- | --- | ---
`.add(cb: (deltaTime: number) => any)` | `cb`: Callback function | Run the callback function on every frame. The [`deltaTime`](https://pixijs.download/release/docs/PIXI.Ticker.html#deltaTime) is the "scalar time value from last frame to this frame".

### `Container` Instance

> Almost every type of display object is also derived from Container.

Property | Args | Description
--- | --- | ---
`.addChild(x)` | `x`: Pixi element | Add the element as a child to the stage

### `Graphics` Instance

> The Graphics class is primarily used to render primitive shapes such as lines, circles and rectangles to the display, and to color and fill them.

It seems like this is generally used in the same way as {{SVG}}: as if you had a pen and paper and deciding fill values before drawing. [It is a geometry building tool, not a drawing tool.](https://pixijs.io/guides/basics/graphics.html)

Property | Args | Description
--- | --- | ---
`.addChild(x)` | `x`: Pixi element | Add the element as a child to the stage

### `Sprite` Instance

Property | Args | Description
--- | --- | ---
`.anchor.set(x[, y])` | `x`, `y`: Position in pixels | Set the anchor of the sprite to the point. Only one arg sets both to the same value.

## References

- https://www.pixijselementals.com/
- https://pixijs.io/guides/basics/getting-started.html
- https://www.npmjs.com/package/pixi.js
- https://pixijs.download/release/docs/index.html
