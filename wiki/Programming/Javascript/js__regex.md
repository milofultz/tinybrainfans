---
title: Regular Expressions (Javascript)
---

In {{Javascript}}, {{regular expressions}} are enclosed within two forward slashes and flags are placed oustide.

```javascript
let re = /hello/m;  // or
let re = new RegExp('hello', 'm');
```

## Methods

### .exec() / .match()

`re.exec(item)` and `item.match(re)` will search for the regex (`re`) inside of `item`. If found, this returns the expression, the index of beginning of match, and the input item. if not found, this returns `null`. 

### .replace()

`item.replace(re, replacement)` will replace instances of regex (`re`) with `replacement` and return the modified `item`.

### .search()

`item.search(re)` returns index of first found instance of reg ex in item. if not found, returns `-1`.

### .source()

`re.source` returns the reg expression without the slashes, `re` being a variable holding a regular expression.

```javascript
let re = /hello/m;
console.log(re.source); // "hello"
```

### .split()

`item.split(re)` returns an array of the string split by the regex.

```javascript
var myString = 'Hello 1 word. Sentence number 2.';
var splits = myString.split(/(\d)/);
// returns [ "Hello ", "1", " word. Sentence number ", "2", "." ]
```

### .test()

`re.test(item)` returns boolean of if regex is found in `item`.

```javascript
let re = /hello/m;
re.test('hello world!') // returns true
re.test('me first') // returns false
```

## References

1. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split