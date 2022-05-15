---
title: Test-Driven Development
description: In programming, test-driven development is when tests are developed first before the code is written.
---

In {{programming}}, test-driven development is when tests are developed first before the code is written. 

> In test-driven development the mantra has always been, red, green, refactor. Write a failing test and run it (red), make the test pass (green), then refactor it (that is look at the code and see if you can make it any better).[1]

- You can’t write any production code until you have first written a failing unit test.
- You can’t write more of a unit test than is sufficient to fail, and not compiling is failing.
- You can’t write more production code than is sufficient to pass the currently failing unit test.

These last two points are *very* important to fully understand, and may feel insane at first. If you were making an `add` function and you created your first test that `add(2, 2) === 4`, then your first step would be to create the `add` function and then **have it return 4**. 

```javascript
const add = (first, second) => {
  return 4;
}

// tests

if (add(2, 2) !== 4) {
  console.error('FAILURE: 2 + 2 !== 4');
}
```

It is important to note that of *course* this is incorrect as an adding function, but 

> You can’t write more production code than is **sufficient** to pass the currently failing unit test

Once you have this, you would want to create more tests. And sometimes that will result in more stupid-feeling tests:

```javascript
const add = (first, second) => {
  if (first === 2) {
 	  return 4; 
  } else {
    return 6;
  }
}

// tests

if (add(2, 2) !== 4) {
  console.error('FAILURE: 2 + 2 !== 4');
}
if (add(5, 1) !== 6) {
  console.error('FAILURE: 5 + 1 !== 6');
}
```

But as we write more and more, we will triangulate into what is accurate and necessary **with nothing more**. You will get to a point where refactoring the code will make you write less code than you currently have, and that is the end goal, but you don't want to get there until it is **necessary**.

Remember, that you should at this point be trying really hard to find ways to BREAK your code. What are the edge cases? What is something user X or Y or Z would do, and how would my code be affected?

```javascript
const add = (first, second) => {
  // Instead of continuing to add more if blocks, we refactored
  if (first === undefined) {
    return null;
  } else if (second === undefined) {
    return first;
  }
	return first + second;
}

// tests

if (add(2, 2) !== 4) {
  console.error('FAILURE: 2 + 2 !== 4');
}
if (add(5, 1) !== 6) {
  console.error('FAILURE: 5 + 1 !== 6');
}
if (add(2, 0) !== 2) {
  console.error('FAILURE: 2 + 0 !== 2');
}
if (add(2) !== 2) {
  console.error('FAILURE: 2 !== 2');
}
if (add() !== null) {
  console.error('FAILURE: Run add without args');
}
```

## Best Practices

> Write the test that forces you to write the code you already know you want to write. -- "Uncle" Bob Martin

Avoid the central behaviors as long as possible. Don't go for the gold right away. 

Decouple the production code from the test code by ensuring your tests are not 1:1 for the class methods or functions. Create and refactor as you go in production, but allow the tests to remain.

### Dependency Injection

Use [dependency injection](https://en.wikipedia.org/wiki/Dependency_injection) to make testing simpler. If you have an API call, inject `axios` or `fetch` as an argument so when it comes to testing, your testing framework won't be brittle in its imports. e.g. In this example, we make a call to an external API to get the tax rate of a given country using the {{Javascript}} native {{fetch API}}, with tests using {{Jest}}.

**getTaxRate.js**

```javascript
// works, but brittle
const getTaxRates = (country) => {
  return fetch(`external.api/example/${country}`)
  	.then(response => response.json())
  	.then(taxRateInfo => taxRateInfo.rate)
}

// best, robust
const getTaxRates = (fetch, country) => {
  return fetch(`external.api/example/${country}`)
  	.then(response => response.json())
  	.then(taxRateInfo => taxRateInfo.rate)
}
```

Using the brittle implementation, our tests are coupled with the implementation of the code we are testing, which will lead to problems if these global imports or functions like {{fetch|Fetch API}} ever change.

This example uses {{Jest}} and their mock functions, but any mock function that allows introspeection and testing will do.

**getTaxRate.test.js**

```javascript
// assuming all imports

// This will properly mock the return value of the external API
const mockFetchImplementation = () => {
	return Promise.resolve({
  	json: () => Promise.resolve({
  		rate: 10
		});
	});
};

// brittle implementation
// Fetch gets used invisibly, non-explicitly, and is more difficult to see what is happening.
// Fetch as a global is also being overwritten, which may not be desired, nor possible, for future tests or all test suites.

global.fetch = jest.fn(mockFetchImplementation);

describe('getTaxRates', () => {
  it('gets a tax rate for a given country (brittle)', () => {
    return getTaxRates('DE')
    	.then(taxRate => {
      	expect(taxRate).toBe(10);
      	expect(fetch).toHaveBeenCalledTimes(1);
      });
  });
});
  
// robust implementation
// Fetch obviously gets used, easy to see high-level view
// Uses a local mock and doesn't overwrite global fetch.

const fakeFetch = jest.fn(mockFetchImplementation);

describe('getTaxRates', () => {
  it('gets a tax rate for a given country (brittle)', () => {
    return getTaxRates(fakeFetch, 'DE')
    	.then(taxRate => {
      	expect(taxRate).toBe(10);
      	expect(fetch).toHaveBeenCalledTimes(1);
      });
  });
});
```

### Resist Integration Tests[10]

> Put simply, the money premise says that we do TDD because we want more  value faster. Integration tests in most complex apps do not provide more value faster. As a direct result, in TDD we write very few integration  tests, and suggest them very rarely.

## Why Use TDD

- Your code will ALWAYS be working just a second ago when you last tested.
- It is [double-entry bookkeeping](https://en.wikipedia.org/wiki/Double-entry_bookkeeping) for development.
- A test suite that you don't trust is worthless. A test suite that does not allow you to make a decision when it passes is useless. There can be NO HOLES.

> TDD is currently our best known answer to the challenge of changing layered branching logic, and all of those values depend ultimately on exactly that: changing layered branching logic.
>
> "Making software" *is* "changing layered branching logic". TDD is the fastest way to do it that we currently have. That’s all it is.  It’s not mystical, or ideal, it’s not a slogan we can put over a poster with eagles on mountains. It’s a style of changing layered branching  logic.
>
> You want more money? You get more money by changing layered branching logic faster. -- Geepaw Hill[11]

### But TDD is just writing more code!

It is correct that TDD means more code, but it is *extremely useful* code that pays huge dividends from the time you create them and as long as the code exists. Your tests are a working documentation of what the code does, how it works, when it should or shouldn't work, and why it works the way it does.

When you inevitably work on somebody else's code or god forbid your own, without tests you essentially have to start from square one, learning what it does along with what each piece of code it touches does; when you make changes, you either just cross your fingers and hope it worked or laboriously run the software and click around. With tests, you can get a broad overview of expected and desired behavior along with a reliable scaffolding to make changes and experiment with confidence.

So while *initially* you write more code, in the long run, you save time and a lot of headache for you and your team.

If you are still not convinced, Geepaw Hill[8] believes that our days are largely not even spent writing code, with the bulk of our time being trying to understand the problem space and "gakking around".

> [Without TDD, p]rogramming the computer, the best part of the day, is often the very smallest part. The GAK [Geek At Keyboard] activity, much of which is just waiting around for things to run, or clicking through screens and typing in data in order to get to the part where you wanted to see something, that is the largest part of the day by quite a bit. And studying, the scanning and the reading, well, it’s somewhere in the middle. So those are your basic proportions.
>
> [...]
>
> [A]utomated tests are more code that has to be written. Somewhere between  half again as much and twice as much as you write now. Let’s say that part of our day doubles.
>
> [But] study time will go down after TDD. It’s not that we have to study any less code in the after picture than in the before. Rather, it’s that studying the same amount of code gets faster. Why? Because those twin files we talked about, one with shipping code and one with testing code, it’s almost like the test code forms a kind of Cliff’s Notes for the shipping code. A scaffolding that makes it easier for us to study, and this makes it far easier to tell what’s going on. This will cut our code study time in about half.
>
> Finally, we come to the GAK time, and this is the big payoff. TDD reduces the amount of time you spend in GAK by 80% or 90%. Because TDD tests run in that special tool kit. They’re fast. They don’t fire up  your application. They don’t depend on things like logins, or database  permissions, or waiting around for the web to load. They are built to be fast, small, and grouped into convenient suites. Nothing completely  eliminates the need for GAK work, but TDD slashes the amount of time you spend GAK-ing during the course of the workday.

## TDD Without A Test Suite

*From [Jack Herrington's video on stress-free coding](https://www.youtube.com/watch?v=eAfUfKYcvBo)*

Though orthodox TDD requires testing and a test framework, you can utilize these ideas without them (albeit on a smaller scale, as greater complexity will make this work, but not be as powerful or reliable). 

When we are coding, we are usually operating within a few different risk levels that may appear or disappear based on our confidence, emotional state, etc.: 

* **Safe**: Everything is running and works as expected
* **OK**: Trivial changes have been added that you expect to work
* **Should Test**: A lot of complex changes have been added, should probably test now
* **Must Test**: You absolutely should be testing your code

So similar to TDD, where "red, green, refactor" is the rule, you code operating from "Should Test or Must Test, Safe, Refactor". Combining this with committing often and {{rebasing those extra commits|Rebase (git)}} before pushing gives us great scaffolding to work with more confidence and assurance in the state of our code.

## References

1. https://github.com/gregmalcolm/python_koans
2. [Clean Code](https://openlibrary.org/works/OL3526663W/Clean_code)
3. https://qualitycoding.org/3-laws-tdd/
4. [Examples of TDD in action](https://www.youtube.com/watch?v=58jGpV2Cg50)
5. https://www.youtube.com/watch?v=XsFQEUP1MxI&list=PL0zVEGEvSaeF_zoW9o66wa_UCNE3a7BEr&index=2
6. https://wallabyjs.com/?referrer=funfunfunction
7. https://www.youtube.com/watch?v=eAfUfKYcvBo
8. https://www.geepawhill.org/2018/04/14/tdd-the-lump-of-coding-fallacy/
9. https://online-training.jbrains.ca/courses/wbitdd-01/lectures/34779823
10. https://www.geepawhill.org/2018/04/04/tdd-resist-integration-tests/
11. https://www.geepawhill.org/2018/08/26/were-in-tdd-for-the-money/
12. http://wiki.c2.com/?TestDrivenDevelopment