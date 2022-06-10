---
title: Higher Order Functions
description: A higher-order function either takes in a function as an argument, or returns a function.
---

A higher-order function either takes in a function as an argument, or returns a function.

## Callback Functions

When taking a function as a parameter, this is called a **callback function**. This is used in Javascript built-ins like `setTimeout`, `filter`, `map`, and `forEach`.

```javascript
var arr = [1,2,3,4];
var add2 = function (num) {
  return num + 2;
};
var newArr = arr.map(add2); // result: [3,4,5,6]
```

## Closures

Functions that return other functions can create **closures**, which means that the variables within which the function is defined will remain accessable by that function; the variables are **enclosed** within that function's own scope.

In the example below, a function called `counter` keeps track of how many times it is called. Even though the function runs and fully completes, the reference to this execution context remains with the function that is returned at the conclusion of that invocation. We cannot *directly* access `count` from outside of the scope of `counter`, but with the returned function, we can add to it and see what `count`'s value' is at that point.

```javascript
var counter = function () {
  var count = 0;
  console.log(count);
  var add1 = function () {
    count++;
    console.log(count);
  };
  return add1;
};

// newCounter will now reference the `add1` function within the closure of that invocation of counter
var newCounter = counter(); // 0
// This calls `add1` within that same closure, incrementing `count` by 1
newCounter(); // 1
```

## References

1. https://en.wikipedia.org/wiki/Higher-order_function