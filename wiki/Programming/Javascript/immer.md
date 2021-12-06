---
title: Immer
description: Immer is a package that allows modification of complex objects and maintains immutability with your application.
---

Immer is an {{NPM}} package that allows modification of complex {{Javascript}} objects and maintains immutability with your application.

## Why?

When dealing with objects in Javascript, you are often dealing with references to points in memory. 

When you need to make a copy of that object, it's easy enough to use `const copy = JSON.stringify(JSON.parse(obj))`, which makes a **deep** copy. But it kind of sucks and doesn't handle anything outside of strings, numbers, and booleans and will null everything else aside from Date objects, or have weird behavior like serializing keys of Maps or Sets.

Another alternative is using the spread operator: `const copy = { ...obj };`. Unfortunately, this only performs a **shallow** copy, meaning it's still pointing to the same memory references and modifying something in `copy` may modify the values in `obj`.

Immer gives the best of both. It allows you to manage this by using a `produce` function that lets you modify a `draft` and will return a new object that:

- Only allows further modifications using Immer
- Maintains references to the same memory if values didn't change
- Leaves old references alone when modifying values by creating new values on modification

This behavior is particularly useful with {{React}}, where modifying state without using the proper {{hooks|React Hooks}} or `setState` call can result in missed updates or faulty recording of the data you want to modify.

## Example[1]

### Bad

```javascript
const nextState = baseState.slice() // shallow clone the array
nextState[1] = {
    // replace element 1...
    ...nextState[1], // with a shallow clone of element 1
    done: true // ...combined with the desired update
}
// since nextState was freshly cloned, using push is safe here,
// but doing the same thing at any arbitrary time in the future would
// violate the immutability principles and introduce a bug!
nextState.push({title: "Tweet about it"})
```

### Good

```javascript
import produce from "immer"

const nextState = produce(baseState, draft => {
    draft[1].done = true
    draft.push({title: "Tweet about it"})
})
```

## Troubleshooting

If you want to log something to the console, it is recommended to use the `current` method from the `immer` package. Without this, you may end up with a `Proxy` object, which is not helpful.

```javascript
import { current, produce } from 'immer';

const updated_ds = produce(ds, working_ds => {
  working_ds.property = 'new value';
  console.log(working_ds); // returns a `Proxy` object, which gives no useful info
  console.log(current(working_ds)); // returns the actual data
};
```

## References

1. https://immerjs.github.io/immer/
