---
title: Express
description: Express is a Javascript-based server application that will help route requests from the client.
---

Express is a {{Javascript}}-based {{server}} application that will help route requests from the client.

## Getting Started

First, start your project with `npm init` in the project folder. Then `npm i express`. Now you can start implementing the barebones in your project.

```javascript
// app.js
const express = require('express');
const app = express();
const port = 3000;

app.listen(port, () => console.log(`Listening on port ${port}`));
```

To get it running, set up your `package.json` with a script to run. You can also use [nodemon][nodemon] to run and restart upon file changes.

```json
"scripts": {
  "start": "node app.js",
  "dev": "nodemon app.js"
}
```

Upon running one of these scripts (`npm run start/dev`), you should see a message in your terminal that your app is listening on port 3000.

## Routes

```javascript
// Parameters: `route`, and `callback` when request and response objects are received and created 
app.get('/', (req, res) => {
  const data = 'We did it!';
  res.send(data);
});
```

Upon completing this and restarting your server, you should be able to go to `localhost:3000` and see "We did it!" in your browser window.

### Query Parameters

You can access the query parameters via the `req.query` object.

```javascript
// .../products?example=1?another=five
app.get('/products', (req, res) => {
  const example = req.query.example;
  const another = req.query.another;
  res.send(JSON.stringify([example, another]));
});
```

## References

1. http://expressjs.com/en/starter/installing.html
2. https://stackoverflow.com/questions/17007997/how-to-access-the-get-parameters-after-in-express
3. https://expressjs.com/en/starter/static-files.html

[nodemon]: https://www.npmjs.com/package/nodemon "Nodemon is essential for developing your own apps"

