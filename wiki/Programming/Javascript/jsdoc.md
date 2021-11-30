---
title: JSDoc
description: JSDoc is a markup language used to annotate JavaScript source code files with comment blocks.
---

JSDoc is a markup language used to annotate {{JavaScript}} source code files with comment blocks.

## Syntax

```javascript
/**
 * Generates the change needed per frame to get from `start` to `end` in `length` seconds
 *
 * @param {number} start Initial value
 * @param {number} end Destination value
 * @param {number} seconds Length of time to get from start to end
 * @param {number} fps FPS of the application (Pixi sets this to 60 by default)
 * @returns number
 */

const get_animation_delta = (start, end, seconds, fps) => {
  return (end - start) / (fps * seconds);
};
```

### Objects[2]

```javascript
/**
 * Takes objects of start and end values and gets animation delta for each.
 *
 * @param {Object.<string, number>} start Initial values
 * @param {Object.<string, number>} end Destination value
 * @param {number} seconds Length of time to get from start to end
 * @param {number} fps FPS of the application (Pixi sets this to 60 by default)
 * @returns {Object.<string, number>}
 */

export const get_all_animation_deltas = (start, end, seconds, fps = PIXI_FPS) => {
  const output = {};
  for (const key in start) {
    output[key] = get_animation_delta(start[key], end[key], seconds, fps);
  }
  return output;
};
```

## References

1. https://en.wikipedia.org/wiki/JSDoc
1. https://stackoverflow.com/questions/6460604/how-to-describe-object-arguments-in-jsdoc
