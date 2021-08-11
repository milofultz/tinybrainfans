---
title: Promises and Async Await (Javascript)
description: Promises and async/await are a way to handle asynchronous actions in Javascript.
---

Promises and async/await are a way to handle asynchronous actions in {{Javascript}}.

## Promises

```javascript
const getDataFromAPI = () => {
  // do stuff
  return fetch('url')
};

function main () {
  let apiData;
  getDataFromAPI()
    .then(data => apiData = data)
    .catch(error => console.error(error));

  if (apiData) {
    // do stuff
  }
}
```

## Async/Await

```javascript
const getDataFromAPI = () => {
  // do stuff
  return fetch('url')
    .then(data => apiData = data)
    .catch(error => console.error(error));
};

async function main () {
	let apiData;
  try {
    apiData = await getDataFromAPI();
  } catch (error) {
    console.error(error);
  }
  
  if (apiData) {
    // do stuff
  }
}
```

## References

- https://www.youtube.com/watch?v=V_Kr9OSfDeU