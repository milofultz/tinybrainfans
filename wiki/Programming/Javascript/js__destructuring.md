---
title: Object Destructuring (Javascript)
description: Object destructuring in Javascript allows you to create constants from items within an object.
---

Object destructuring in {{Javascript}} allows you to create constants from items within an object.

## Example

```javascript
const initialObject = {
  first: 123,
  second: ['yeah', 'no'],
  third: {
    thing: 1,
    another: 2
  }
};

console.log(initialObject.first) // 123
console.log(initialObject.second[0]) // 'yeah
```

### Basic

```javascript
const { first, second, third } = initialObject;

console.log(first) // 123
console.log(second[0]) // 'yeah'
```

### Custom Names

```javascript
const { first: tom, second: cruise, third: hello } = initialObject;

console.log(tom) // 123
console.log(cruise[0]) // 'yeah'
```

## References

- https://flaviocopes.com/how-to-rename-object-destructuring/
- https://wesbos.com/destructuring-renaming
