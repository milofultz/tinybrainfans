---
title: Arrays (Javascript)
description: Arrays in Javascript have many specific methods for modification and analysis. Some are cunfusiong or hard to recall.
---

{{Arrays|Array}} in {{Javascript}} have many specific methods for modification and analysis. Some are cunfusiong or hard to recall.

## Methods

### reduce

`reduce` will iterate through the items in the array and operate the callback function on each one, passing the previous value's result post-callback. Because of this, `reduce` can be used to build most array methods from scratch.

`reduce` takes up to two params: the callback function, and the initial value.

#### Callback

The callback function can take up to four params:

- `previousValue` or`accumulator`
- `currentValue`
- `currentIndex`
- `array`

The result of this callback function will go into the `previousValue`/`accumulator` and then the currentValue will become the next item in the array. At the end of the iteration, the `previousValue` is what is returned from the `reduce` function.

#### Initial Value

This value is going to be passed in to the callback function for the first item in the array, where no `previousValue`/`accumulator` would otherwise exist.

If no initial value is provided, the `previousValue`/`accumulator` will be set to the first item in the array, and the `currentValue` will be set to the second item in the array.

#### Examples

##### Check Condition on All Items

By setting the callback to require that both the accumulator be true and that the value is evenly divisible by 2, this will check that all values pass the condition. Without the accumulator check, it will only return whether the last item in the list is even.

```javascript
const evenArray = [2,4,6,8];
const mixedArray = [2,3,4,5,6];
evenArray.reduce((acc, val) => acc && val % 2 === 0, true); // returns true
mixedArray.reduce((acc, val) => acc && val % 2 === 0, true); // returns false
```

##### Sum All Items

This works by initially setting the sum to the first value in the array, and then adding that to each successive value.

```javascript
const numbers = [1,2,3,4,5];
numbers.reduce((sum, val) => sum + val); // returns 15
```

##### Filter Out Odd Numbers

```javascript
const numbers = [1,2,3,4,5];
numbers.reduce((resultArray, val) => {
  if (val % 2 === 0) {
		resultArray.push(val);
  }
  return resultArray;
}, []); // returns [2,4];
```

##### Conditional Map: Return All Values Over 2 Divided By 2

```javascript
const numbers = [1,2,3,4,5];
numbers.reduce((resultArray, val) => {
  if (val > 2) {
    const newNum = val / 2;
		resultArray.push(newNum);
  }
  return resultArray;
}, []); // returns [1.5, 2, 2.5];
```

## Destructive Methods

These methods affect the array the method is called upon.

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

