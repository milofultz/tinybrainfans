---
title: Arrays (Javascript)
description: Arrays in Javascript have many specific methods for modification and analysis. Some are cunfusiong or hard to recall.
---

{{Arrays|Array}} in {{Javascript}} have many specific methods for modification and analysis. Some are cunfusiong or hard to recall.

## Modification

### sort

The sort function can work with or without a sorting function that sorts **in place**. Without, it will simply convert every value into a string and compare via Unicode point value. With, it follows this formula: `.sort(compareFunction)`. 

From [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort):

> If `compareFunction(a, b)` returns a value > than 0, sort `b` before `a`. If `compareFunction(a, b)` returns a value ≤ 0, leave `a` and `b` in the same order.    

An example compare function:

```javascript
const array = [3,2,4,1];

const compareFunction = (a, b) => {
	if (a < b) {
    // leave a before b
    return -1;
  } else if (a > b) {
    // place b before a
    return 1;
  } else { // a === b
    // leave a before b
    return 0;
  }
};

array.sort(compareFunction); // array now equals [1,2,3,4]
```

### splice

Splice works for both removal and insertion of array elements. Splice operates in place and will return whatever elements were spliced from the array.

`splice(start, deleteCount, [item, ...])`

```javascript
let array = [1,2,3,4];
array.splice(1); // returns [2,3,4]; array now equals [1]

array = [1,2,3,4];
array.splice(1,1); // returns [2]; array now equals [1,3,4]

array = [1,2,3,4];
array.splice(1,1,17); // returns [2]; array now equals [1,17,3,4]
```

