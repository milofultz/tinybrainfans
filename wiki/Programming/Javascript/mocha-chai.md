---
title: Mocha and Chai (Javascript)
description: Mocha is a Javascript test framework for use with Node, and Chai is an assertion library.
---

Mocha is a {{Javascript}} {{test|Testing (Programming)}} framework for use with {{Node}}, and Chai is an assertion library.

Another common library to use with Mocha is [nyc][], which allows you to get a code coverage readout. You can use this by `npm i nyc` and then adding it to your `package.json` as a script: `"coverage": "nyc npm run test"`.

## Quick Start

Install Mocha and Chai using `npm i --save-dev mocha chai`.

In your `package.json`, replace the value of the `"test"` property within `"scripts"` with `"mocha ./path/to/tests"`, inserting the path to your tests. 

Create a file called `example.js` within your test folder. Place this inside:

```javascript
const assert = require('chai').assert;

describe('Sum', () => {
  it('should add 2 and 2 to equal 4', () => {
    assert.equal(2 + 2, 4);
  });
});
```

Save this file and in your terminal, run `npm run test`. This should render a screen showing a test, "should add 2 and 2 to equal 4", passing within the "Sum" section.

## Assert

All are assumed to start with `assert`.

### Comparison

Invoked with `(actual, expected)`.

Chain | Effect
--- | ---
`.equal`, `.notEqual` | Non-strict equality (`==`)
`.deepEqual`, `.notDeepEqual` | Strict equality (`===`), also used for objects

### Simple

All are accompanied with a negative assertion, e.g. `.isX`/ `.isNotX`.

- `.exists(x)`
- `.include([x,y,z], x)` 
- `.deepInclude([obj1, obj2], obj1)`
- Every primitive (`.isNumber`, `.isBoolean`, `isTrue`, etc.)

## Asynchronous Tests



## References

1. https://mochajs.org/
2. https://www.chaijs.com/
3. https://www.chaijs.com/api/assert/
3. https://gist.github.com/yoavniran/1e3b0162e1545055429e#jest
4. https://www.testim.io/blog/testing-promises-using-mocha/

[nyc]: https://github.com/istanbuljs/nyc
