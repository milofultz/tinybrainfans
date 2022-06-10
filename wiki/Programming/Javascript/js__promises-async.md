---
title: Promises and Async/Await (Javascript)
description: Promises and async/await are a way to handle asynchronous actions in Javascript.
---

Promises and async/await are a way to handle asynchronous actions in {{Javascript}}.

## Promises

### Single

```javascript
const getDataFromAPI = (url) => {
  // do stuff
  return fetch(url);
};

function main (url) {
  let apiData;
  getDataFromAPI()
    .then(data => apiData = data)
    .catch(error => console.error(error));
  
  // do stuff
}

main('www.fakeurl.com');
```

### Multiple with no specific order

```javascript
const getDataFromAPI = (url) => {
  // do stuff
  return fetch(url);
};

const mockUrls = ['url1', 'url2', 'url3'];

function main (urls) {
  let apiData; // ends up with an array of resolved values
  const apiCalls = urls.map(url => getDataFromAPI(url));
  Promise.all(apiCalls)
    .then(data => apiData = data)
    .catch(error => console.error(error));
}

main(mockUrls);
```

### Multiple with specific order[2]

```javascript
const getDataFromAPI = (url) => {
  // do stuff
  return fetch(url)
};

const mockOrderedUrls = ['url1', 'url2', 'url3'];

function main (orderedUrls) {  
  let apiData = []; // an array of ordered resolved values
  
  const promiseFactory = (previousResult, newUrl) => {
    // do check if it is the first invocation with no data
    if (previousResult !== undefined) {
      apiData.push(previousResult);
    }
    
    return getDataFromAPI(newUrl);
  };
  
  let result = Promise.resolve();
  urls.forEach((url, index) => {
    result = result
      .then((data) => {
        // do check if it is the first invocation, push no data
        if (index === 0) {
          promiseFactory(undefined, url);
        } else {
          promiseFactory(data, url);
        }
      })
      .catch(error => {
        // handle error
      });
  });
  
  // do stuff
}

main(mockOrderedUrls);
```

## Async/Await

### Single

```javascript
const getDataFromAPI = () => {
  // do stuff
  return fetch('url');
};

async function main () {
  let apiData;
  try {
    apiData = await getDataFromAPI();
  } catch (error) {
    // handle error
  }
  
  // do stuff
}
```

### Multiple with no specific order

```javascript
const getDataFromAPI = (url) => {
  // do stuff
  return fetch(url);
};

const mockUrls = ['url1', 'url2', 'url3'];

async function main (urls) {
  let apiData; // ends up with an array of resolved values
  try {
    const result = urls.map(url => getDataFromAPI(url));
    apiData = await Promise.all(result);
  } catch (error) {
    // handle error
  }
  
  // do stuff
}

main(mockUrls);
```

### Multiple with specific order[3]

```javascript
const getDataFromAPI = (url) => {
  // do stuff
  return fetch(url);
};

const mockOrderedUrls = ['url1', 'url2', 'url3'];

async function main (urls) {
  let apiData = []; // an array of ordered resolved values
  try {
    urls.forEach(async url => {
      const result = await getDataFromAPI(url);
      apiData.push(result);
    }
  } catch (error) {
    // handle error
  }
  
  // do stuff
}

main(mockOrderedUrls);
```

## References

- https://www.youtube.com/watch?v=V_Kr9OSfDeU
- https://pouchdb.com/2015/05/18/we-have-a-problem-with-promises.html
- https://stackoverflow.com/questions/70816638/learning-promises-async-await-to-control-execution-order