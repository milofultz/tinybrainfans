---
title: Operators (Javascript)
---

## Logical Operators

In {{Javascript}}, all of these operators on [truthy](https://developer.mozilla.org/en-US/docs/Glossary/Truthy) and [falsy](https://developer.mozilla.org/en-US/docs/Glossary/Falsy) values, meaning that all values will be converted to boolean before comparison.

### Used with Non-Boolean Types

When using non-boolean values, the return value will not be a boolean, but one of the values compared. 

#### AND (`&&`)

If all are truthy, it will return the last compared value. However, if any of the values are falsy, if will return the first falsy value.

```javascript
const a = 1 && 2 && 3; // returns 3
const b = 4 && 0 && 'yes' && false // returns 0
```

#### AND Assignment (`&&=`)

If `x` is truthy, define `x` with what follows. This is fairly new, so only use this if you know if will be safe to use in production.

```javascript
let x = 4;
let y = false;
x &&= 10; // x === 10
y &&= true; // y === false
```

#### OR (`||`)

OR will return the first truthy value found. If all are falsy, will return the last value.

```javascript
const a = 1 || 2 || 3; // returns 1
const b = null || 0 || false; // returns false
```

#### OR Assignment (`||=`)

If `x` is falsy, define `x` with what follows. This is fairly new, so only use this if you know if will be safe to use in production.

```javascript
let x = 4;
let y = false;
x ||= 10; // x === 4
y ||= true; // y === true
```

#### NOT (`!`)

Using a double NOT will convert a regular value into a boolean.

```javascript
const a = !!'hello'; // returns true
const b = !!0; // returns false
const c = !!undefined; // returns false
```

#### Nullish Operator (`??`)

Will return the right hand side operand if the left side is `null` or `undefined`.

```javascript
const a = 0 ?? 2; // returns 0
const b = null ?? 2; // returns 2
```

#### Nullish Assignment (`??=`)

If `x` is nullish (`null` or `undefined`), define `x` with what follows. This is fairly new, so only use this if you know if will be safe to use in production.

```javascript
let x = 4;
let y = undefined;
x ??= 10; // x === 4
y ??= true; // y === true
```

## References

1. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators
