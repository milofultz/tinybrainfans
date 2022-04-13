---
title: Jest
description: Jest is a testing framework built by Facebook for Javascript applications.
---

Jest is a {{Javascript}} {{test|Testing (Programming)}} framework built by Facebook for for use with {{Node}}/{{Javascript}} applications.

## Getting Started

Install Jest using `npm i --save-dev jest`. Add to your `package.json`:

```json
{
  "scripts": {
    "test": "jest"
  }
}
```

Then create a function that we can test.

**`example.js`**

```javascript
function sum(a, b) {
  return a + b;
}

module.exports = sum;
```

Next we create a test.

**`example.test.js`**

```javascript
const sum = require('./sum');

test('adds 1 + 2 to equal 3', () => {
  expect(sum(1, 2)).toBe(3);
});
```

Now we can run the test in the terminal with `npm run test`.

## Mocking

You can mock functions like `fetch` or `axios` by using the `jest.fn(() => {})` syntax.

```javascript
const someBlackBox = jest.fn(number => 42 + number);
forEach([0, 1], someBlackBox);

// The mock function has been called
expect(someBlackBox).toHaveBeenCalled();

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

## Projects/Multiple Environments[4-5]

If you have elements in your application that need distinct or special test environments, use `projects`. This will allow you to use whatever configuration you want on whatever tests you want. Make sure you set up the correct `testMatch` values, or you will have a bad time.

## References

1. https://jestjs.io/
2. https://jestjs.io/docs/mock-functions
3. https://www.leighhalliday.com/mock-fetch-jest
4. https://stackoverflow.com/questions/41318115/testing-two-environments-with-jest
5. https://jestjs.io/docs/configuration#projects-arraystring--projectconfig
