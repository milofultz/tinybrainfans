---
title: Lexical Scoping (Javascript)
description: Lexical scoping defines how variable names are resolved in nested functions or blocks.
---

**Lexical Scoping** defines how variable names are resolved in nested functions: inner functions contain the scope of parent functions even if the parent function has returned.

With {{Javascript}}, a new scope is created **only** through function definitions. Every time a new function scope is created, it will contain the scope of the parent functions, along with its own. This does not go both ways, however: the outer scope does not have access to those in the inner scope.

```javascript
var content = "I'm outside";
var outermost = " and I'm still here."

var middle = function () {
  var content = "I'm in the middle";
  var inner = function () {
    var content = "I'm inside"; 
    console.log(content + outermost); // "I'm inside and I'm still here."
  };
  inner();
  console.log(content + outermost);   // "I'm in the middle and I'm still here."
};

middle();
console.log(content + outermost);     // "I'm outside and I'm still here."
```

## `this`

**`this`, within a function, is bound to the object within which the function is being called**. Look to the left of the calltime dot to find the binding of `this`. The Javascript interpreter binds `this` to a **likely-focal object**, which means it isn't always what you think it is. Assume its binding will run into trouble, so you may need to at times manually set `this` to the desired object.

- If you have defined your function in the global scope, then `this` is implicitly bound to the global context, which in a browser is `window`. You can call this function `funcName` also by calling `window.funcName`
- If you have defined your function as part of an object, like `var obj = { funcName: function (a) { ... } }`, then `this` is bound to `obj`.

```javascript
var obj = {
	greeting: function () { console.log(this.message ) },
	message: "Hello world"
}
obj.greeting(); // `this` is bound to `obj`; logs "Hello world"
var g = obj.greeting;
g() // `this` is bound to the *global object*
    // logs "undefined" because there is no variable "message" in the global scope
```

## References:

1. https://stackoverflow.com/questions/1047454/what-is-lexical-scope
2. http://howtonode.org/what-is-this
3. https://medium.com/better-programming/how-javascript-works-1706b9b66c4d