---
title: Switch Case (Javascript)
description: Switch cases allow if/else style branching but with different side effects.
---

Switch cases in {{Javascript}} act very similar to `if`/`else` statements, but have some very important differences.

## Good Differences

### Semantics

It is easier to understand what a switch case is checking for, as there is only one expression you are going to be checking. This obviously doesn't work with everything, but when it does work, it is cleaner.

```javascript
if (bob === 1) {
  // do thing
} else if (bob === 2) {
  // do thing
} else if (bob === 3) {
  // do thing
}

// or 

switch (bob) {
  case 1:
    // do thing
    break;
  case 2:
    // do thing
    break;
  case 3:
    // do thing
    break;
}
```

This is technically longer, but is much much easier to understand what is being checked for and what values become what result.

### Reduced Duplication/Execution

The above code is much more DRY and if you need to change the condition, it only needs to be done in one place.  Also, if the case you are testing in a function, you don't have to create a new variable where it can be executed, just for this one conditional.

### Forced Consolidation of Concerns

In switch cases, you are **always** checking if the case is equal to some set of values. `if`/`else` chains can be misleading as multiple unrelated things can be checked in a row, or a false sense of knowing what is going on can be in place and then subtle changes arise that make you confused.

## (Potentially) Bad Differences

### `break`

Switch cases will trip the condition that matches **and all that follow it unless a specific `break` is made.** Default is a special case that will only trip if no other conditions are met **or if `break` is not invoked.**

```javascript
const number = 1;

switch (number) {
  case -1:
    console.log('Definitely negative 1');
    break;
  case 1:
  	console.log('True');
    break;
  case 0:
    console.log('False');
    // Will fall through to default as no explicit `break` was made
  default:
    console.log('Definitely not -1');
}

// Logs 'True'
// number = 2: 'Definitely not -1'
// number = 0: 'False', 'Definitely not -1'
```

## References

1. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/switch
1. https://mortoray.com/2019/06/29/why-switch-is-better-than-if-else/