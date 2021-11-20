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

## React-Pixi

[React-Pixi](https://reactpixi.org/) adds declarative styling for use with {{React}}. Using the above example:

**Normal PixiJS**

```javascript
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
```

**With React-Pixi**

```react
import React, { useState } from 'react';
import { Sprite, Stage, useTick } from '@inlet/react-pixi';

const Example = () => {
  const [x, setX] = useState(0);
  const [elapsed, setElapsed] = useState(0.0);
  
  useTick(delta => {
    setElapsed(elapsed + delta);
    // X start + (X offset) * X range
    setX(100.0 + Math.cos(elapsed/50.0) * 100.0);
  });
  
  return (
    {/* Create the application helper */}
    <Stage width={ 640 } height={ 360 }>
      {/* Create the sprite and add to stage */}
      <Sprite image={ 'sample.png' } x={ x } y={ y } />
    </Stage>
  );
};

export default Example;
```

### Application and [Stage](https://reactpixi.org/stage)

Options for the PixiJS `Application` can be passed in as `options={ {...} }`.

## References

1. https://www.pixijselementals.com/
2. https://pixijs.io/guides/basics/getting-started.html
3. https://www.npmjs.com/package/pixi.js
4. https://pixijs.download/release/docs/index.html
5. https://reactpixi.org/
6. https://codewithstein.com/how-to-handle-mouse-events-with-pixijs/
