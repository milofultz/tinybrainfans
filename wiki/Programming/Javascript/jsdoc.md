---
title: JSDoc
description: JSDoc is a markup language used to annotate JavaScript source code files with comment blocks.
---

JSDoc is a markup language used to annotate {{JavaScript}} source code files with comment blocks.

## Syntax

JSDoc areas must start with a `/**`, end with ` */` (that is prefaced with one space, see below), and every line in between the two delimiters is a ` *` (again, prefaced by a space, see below).

Name | Arguments
--- | ---
`@param {type} argumentName Description` |
`@param {type[=]} argumentName Description` | `=` in type signifies optional argument
`@param {typeA|typeB} argumentName Description` | `|` separates the two possible types
`@returns {type} Description` |

```javascript
/**
 * Generates the change needed per frame to get from `start` to `end` in `length` seconds
 *
 * @param {Number} start Initial value
 * @param {Number} end Destination value
 * @param {Number} seconds Length of time to get from start to end
 * @param {Number=} fps FPS of the application (Pixi sets this to 60 by default)
 * @returns {Number}
 */

const get_animation_delta = (start, end, seconds, fps = 60) => {
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
 * @param {number=} fps FPS of the application (Pixi sets this to 60 by default)
 * @returns {Object.<string, number>}
 */

const get_all_animation_deltas = (start, end, seconds, fps = PIXI_FPS) => {
  // ...
};
```

You can also use this for object properties:

```javascript
/**
 * @param {Object} person
 * @param {String} person.name
 * @param {Number} person.age
 */

const personifier = (person) => {
  // ...
}
```

### Arrays[4]

```javascript
/**
 * @param {Object[]} people
 * @param {String} people[].name
 * @param {Number} people[].age
 */
```

### Types[5]

```javascript
/**
 * A person with a name and age.
 *
 * @typedef {Object} Person
 * @property {String} name
 * @property {Number} age
 */

/**
 * Creates a greeting to the person.
 *
 * @param {Person} person
 * @returns {String}
 */

export const greet = (person) => { 
  // ...
}
```

## References

1. https://en.wikipedia.org/wiki/JSDoc
1. https://stackoverflow.com/questions/6460604/how-to-describe-object-arguments-in-jsdoc
1. https://ricostacruz.com/til/typescript-jsdoc
1. https://stackoverflow.com/a/32747700/14857724
1. https://jsdoc.app/tags-typedef.html
