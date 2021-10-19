---
title: Jest
description: Jest is a testing framework built by Facebook for Javascript applications.
---

Jest is a {{Javascript}} {{test|Testing (Programming)}} framework built by Facebook for for use with {{Node}}/{{Javascript}} applications.

<!--

## Quick Start

Install Jest using `npm i --save-dev jest`.

-->

## Mocking

You can mock functions like `fetch` or `axios` by using the `jest.fn(() => {})` syntax.

```javascript
const someBlackBox = jest.fn(number => 42 + number);
forEach([0, 1], someBlackBox);

// The mock function is called twice
expect(someBlackBox.mock.calls.length).toBe(2);

// The first argument of the first call to the function was 0
expect(someBlackBox.mock.calls[0][0]).toBe(0);

// The first argument of the second call to the function was 1
expect(someBlackBox.mock.calls[1][0]).toBe(1);

// The return value of the first call to the function was 42
expect(someBlackBox.mock.results[0].value).toBe(42);
```

You can force certain return values, as well.

```javascript
const someOtherBlackBox = jest.fn();
console.log(someOtherBlackBox()); // undefined

someOtherBlackBox.mockReturnValueOnce(10).mockReturnValueOnce('x').mockReturnValue(true);
console.log(
  someOtherBlackBox(), // 10
  someOtherBlackBox(), // 'x'
  someOtherBlackBox(), // true
  someOtherBlackBox()  // true
);

expect(someOtherBlackBox.mock.calls.length).toBe(4);
// etc. etc.
```

## References

1. https://jestjs.io/
2. https://jestjs.io/docs/mock-functions
3. https://www.leighhalliday.com/mock-fetch-jest
