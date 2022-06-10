---
title: Fetch API
description: Fetch API is a part of vanilla JS that does HTTP requests.
---

Fetch API is a part of vanilla {{Javascript}} that does {{HTTP requests}}. 

## Usage

The syntax for `fetch` is `fetch('URL')`. `fetch()` ALWAYS returns {{promises}}. These promises will be fulfilled when the data is finished loading, and can be accessed with `.then(function (response) { ... })`. Within `.then`, you can resolve this promise with `.json()`, `.text()`, or `.blob()`, which all return their *own* promise. Errors are handled through a `.catch(function (response) { ... })`.

```javascript
fetch('http://web.site')
  .then(function (response) {
    // response is a Promise, so it will be resolved within this function
    return response.json();
    // response.json is *also* a Promise
  }).then(function (json) {
    // do thing with JSON response
  }).catch(function (error) {
    console.log(error);
  });
```

### With async/await

If you encapsulate the fetch call within a function, you can declare that function as an `async` function and make the calls inside the function `await`. Because it's an `async` function, it will also return a promise, which can be handled by `.then` and `.catch`.

```javascript
var getJSON = async function () {
  var response = await fetch('http://web.site');
  var json = await response.json();
  // do thing with JSON response
};

getJSON().catch(function (error) {
  console.log(error);
});
```

## References

1. https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API
2. https://www.youtube.com/watch?v=tc8DU14qX6I
3. https://www.youtube.com/watch?v=RfMkdvN-23o