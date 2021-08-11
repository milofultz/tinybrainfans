---
title: Test-Driven Development
description: In programming, test-driven development is when tests are developed first before the code is written.
---

In {{programming}}, test-driven development is when tests are developed first before the code is written. 

> In test-driven development the mantra has always been, red, green, refactor. Write a failing test and run it (red), make the test pass (green), then refactor it (that is look at the code and see if you can make it any better).[1]

- You can’t write any production code until you have first written a failing unit test.
- You can’t write more of a unit test than is sufficient to fail, and not compiling is failing.
- You can’t write more production code than is sufficient to pass the currently failing unit test.

## Best Practices

Write the test that forces you to write the code you already know you want to write. 

Avoid the central behaviors as long as possible. Don't go for the gold right away. 

Decouple the production code from the test code by ensuring your tests are not 1:1 for the class methods or functions. Create and refactor as you go in production, but allow the tests to remain.

## Why Use TDD

- Your code will ALWAYS be working just a second ago when you last tested.
- It is [double-entry bookkeeping](https://en.wikipedia.org/wiki/Double-entry_bookkeeping) for development.
- A test suite that you don't trust is worthless. A test suite that does not allow you to make a decision when it passes is useless. There can be NO HOLES.

## References

1. https://github.com/gregmalcolm/python_koans
2. [Clean Code](https://openlibrary.org/works/OL3526663W/Clean_code)
3. https://qualitycoding.org/3-laws-tdd/
4. [Examples of TDD in action](https://www.youtube.com/watch?v=58jGpV2Cg50)