---
title: Switch Case (Javascript)
description: Switch cases allow if/else style branching but with different side effects.
---

Switch cases in {{Javascript}} act very similar to if/else statements with one very important caveat, being that they will trip the condition that matches **and all that follow it unless a specific `break` is made.** Default is a special case that will only trip if no other conditions are met **or if `break` is not invoked.**

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