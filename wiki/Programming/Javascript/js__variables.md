---
title: Variables (Javascript)
description: var, let, const are variables in Javascript.
---

All variables in {{Javascript}} are `undefined` by default after declaration.

## Difference Between Var, Let, and Const

Use `const` over `let` and `let` over `var` unless:

* The value may change
* The var needs to be initialized
* It is used in an iterator or a loop

**{{Block scoped|Lexical Scoping}}** means within a block or indentation level (starting with `{` and ending with `}`) or outside of a function. This means that one can use `let` outside of a function and declare a new variable with `let` again within a function.

### const

`const` is block scoped. Short for "constant", meaning that it is a variable that once defined, cannot be redefined, changed through reassignment, redeclared, or updated. This also means one can cannot initialize a variable through `const` without a value. `const` can only be accessed within the scope they were created.

```javascript
const greeting = "Hello there!";
// This can never be changed, as it is a constant.
greeting = "Hi."; // This throws an error
```

Reference types created with `const` can have their _attributes_ updated, but cannot be updated itself.

```javascript
 const greeting = {
    "brothers" = 3;
}

// Not accepted, since `greeting` is has already been declared and assigned a value
const greeting = {
    "sisters" = 2;
}

const brothers = 1; // Accepted
const brothers; // Unaccepted
```

### let

`let` is also block scoped; `let` variables can be updated, but not redeclared.

```javascript
let greeting = "Hello there!";
greeting = "Hi.";
// This throws an error and won't work
let greeting = "Hey hey hey";
```

### var


`var` variables are function scoped and not a constant. Even when defined within a function, they can affect the global scope. These variables can also be redeclared and updated at any point.

As of ES2015, `const` and `let` are fully supported in modern browsers, so `var` is not advised.

```javascript
var greeting = "Hello there!";
var greeting = "Hey bayBEE!";
//These are all acceptable
```

Define Multiple Variables At Once

One can use commas to const many different variables at once.

```javascript
const yes = 'yes',
      no = 'no',
      hi = 'hi';
```

### Global Declaration

Global variable declarations are made by using no keyword before the definition:

```javascript
greeting = "Hi.";
```

## Assignment as an Expression (a la Walrus Operator)

[You can define a variable while running a condition][assignment as expression] on an `if` or a `while` loop. This can help remove extra lines of code or going through variables over and over. Since the innermost parentheses get resolved first, it will function normally after assignment.

```javascript
let i = 0;
while (i !== 3) {
  console.log(i);
  i++;
}

// Logs (0, 1, 2)

// Written using assignment as an expression

let i = -1;
while ((i = i + 1) < 3) { // === (i = i + 1) < 3 === i < 3
  console.log(i);
}

// Logs (0, 1, 2)
```

## Hoisting

> The JS code interpretation performed in two passes. During the first pass, the interpreter processes variable and function declarations. The second pass is the actual code execution step. The interpreter processes function expressions and undeclared variables.[7]

### Hoisting Variables

The term "hoisting" is meant to represent a literal hoisting of variable and function declarations to the top of a Javascript file, where they will be declared before the file is interpreted (while this is not technically what happens, it's certainly more memorable).

Consider the following example:

```javascript
var a = 1;
console.log(a + ' ' + d);
var d = 3;
```

In this example, because interpreters normally run from top to bottom, executing each line as they go, one would expect an error thrown at the `console.log` because it would not be aware of any variable named `d`. Because of hoisting, however, `d` is *declared* by the interpreter but not *initialized with a value*, so it actually logs `undefined` instead.

Another weird case:

```javascript
var a = 1;
d = 3;
console.log(a + ' ' + d);
var d;
```

Since the declaration of `d` (`var d;`) is "hoisted" above the assignment (`d = 3;`), this actually does not throw any errors and logs `3`.

### Hoisting Functions

The hoisting of functions is similar to variable hoisting, in that the declaration of any named functions will be "hoisted". However, what makes functions different in this is that **their definition will be hoisted as well as their declaration**.

In general, you do not want to hoist any functions within the browser unless you have a good reason, since it costs a lot of extra memory for the browser. This can be avoided by using anonymous functions as opposed to named functions like below:

```javascript
// Outputs: "Definition hoisted!"
definitionHoisted();

// TypeError: undefined is not a function
definitionNotHoisted();

// named function
function definitionHoisted() {
    console.log("Definition hoisted!");
}

// anonymous function
var definitionNotHoisted = function () {
    console.log("Definition not hoisted!");
};
```

## References:

1. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/const
2. https://www.udemy.com/course/modern-javascript-from-the-beginning/learn/lecture/8757146#overview
3. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/let
4. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/var
5. http://www.ecma-international.org/ecma-262/6.0/index.html
6. https://www.youtube.com/watch?v=ppMlvGMT2qE
7. https://stackoverflow.com/questions/15005098/why-does-javascript-hoist-variables
8. http://adripofjavascript.com/blog/drips/variable-and-function-hoisting.html

[assignment as expression]: https://stackoverflow.com/questions/63121979/is-there-a-walrus-operator-in-node-js/63122014#63122014

