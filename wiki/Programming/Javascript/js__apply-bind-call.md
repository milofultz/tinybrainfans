---
title: Apply, Call and Bind in Javascript
description: Apply, bind, and call are higher order functions that help with `this`.
---

Apply, bind, and call are {{higher order functions}} that help with `this`.They allow you to invoke a function, which would normally be called from and on the same object, and change which object to which it will be applied.

## Apply and Call

```javascript
// functionName.apply(newThis, [arguments, moreArguments]);
// functionName.call(newThis, arguments, moreArguments);

const numbers = [5, 6, 2, 3, 7];
const max = Math.max.apply(null, numbers);
console.log(max); // expected output: 7

const min = Math.min.apply(null, numbers);
console.log(min); // expected output: 2
```

While the syntax of apply and call are almost identical, the fundamental difference is that **apply** accepts an **array** of arguments, and **call** accepts a **comma**-separated argument list.

## Bind

The `bind()` method **returns a new function** that, when called, has its `this` keyword set to the provided value, with a given sequence of arguments preceding any provided when the new function is called.

```javascript
var num = 2;
var x = { num: 6 };

var addTwo = function () {
  return this.num + 2;
};

var addTwoToX = addTwo.bind(x);

addTwo();    // returns 4 since this.num = 2
addTwoToX(); // returns 8 since this.num = 6
```



## References:

1. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply
2. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind