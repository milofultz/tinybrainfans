---
title: React from Scratch
description: Learn how React works by building it without the create-react-app framework.
---

Learn how {{React}} works by building it without the [create-react-app][] framework.

For React to work properly, you will need three things: 

- {{Babel}} - This is a transpiler that will allow you to use JSX within your components and make your site usable to clients that do not have ES6 functionality available.
- {{Webpack}} - This is a compiler that will take all of your modules, styles, etc. and put them together.
- {{React}} - This is the meat and potatoes that will render your page, let you use state, hooks, etc.

The easiest way to do this is with [create-react-app][]. But if you want to know how it works:

## Get all your parts

- Initialize a new {{npm}} project with `npm init`. You can skip all the questions with the `-y` flag.
- Install `babel` in your development dependencies:
  `npm install --save-dev @babel/core @babel/preset-env @babel/preset-react`. 
  - *@babel/core —* This contains the babel core configuration, 
  - *@babel/preset-env —* This contains different plugins, the most important of which transforms all  ES2015-ES2020 code to be ES5 compatible (the one JavaScript version where almost all browsers implement)
  - *@babel/preset-react —* This contains different plugins to enable React syntax parsing and transformation.
- Install `babel-loader` for webpack to use:
  `npm install --save-dev babel-loader`

  - To transform our code, we will use a package called `babel-loader`. `babel-loader` will allow us to transpile our JavaScript file using babel and webpack.
- Install `webpack` in your development dependencies:
  `npm install --save-dev webpack webpack-cli webpack-dev-server`
  - *webpack —* the core webpack functionality package. 
  - *webpack-cli —* this package is necessary to use the CLI.
  - *webpack-dev-server —* this is for the dev server that allows live reloading
- Install `react` in your project.
  `npm install react react-dom`
- Create the `public`-facing folder for the client, and an `app.js` within a sibling `src` folder

## Make your webpack config and babel config

In the root folder, create a `webpack.config.js` file that pulls in the node `path` module. This is where you will be putting your entry and output points in your webpack builders. (TA: Search 'webpack configuration' and you should be reminded of all the things you need.)

```javascript
const path = require('path');

module.exports = {
  entry: '.src/app.js',     // which file your app will be pulling the data from for it's dependency graph
  output: {
    filename: 'bundle.js',  // the name of the file it will output the bundle to
    path: path.join(__dirname, 'public'),  // the output folder fo your bundles
  },
  module: {  // determines which loader to use
    rules: [{
      loader: 'babel-loader',
      test: /\.jsx?$/,            // transform js files
      exclude: /node_modules/,  // but not node_modules
    }]
  },
  devServer: {
    contentBase: path.join(__dirname, 'public'), // where to serve from when running the webpack dev server
  }
}
```

In the root folder, create a file called `babel.config.json`. (TA: Search for 'babel config' and you should be able to find everything you need.)

```json
{
  "presets": [
    "@babel/preset-env",
    "@babel/preset-react"
  ]
}
```

`babel-loader` will try to find the babel configuration file —this `babel.config.json`. The code in this file instructs `babel-loader` to use `@babel/preset-env` and `@babel/preset-react` presets that we have installed earlier when transpiling our code.

Add scripts in package.json for running webpack

```json
"scripts": {
  "build": "webpack",
  "start": "webpack serve", 
  "watch": "webpack --watch"
}
```

## Create your documents

In `public`, make the html page you will inject into. This needs to have the injection point as well as the webpack bundle.

```html
<!doctype html>
<html>
  <head>
    <title>Test</title>
  </head>
  <body>
    <div id="root"></div>
    <script src="bundle.js"></script>
  </body>
</html>
```

In `src`, create the React JS page that will inject your app into the `root` div.

```react
import React from 'react';
import ReactDOM from 'react-dom';

const App = () => {
  return (
    <div>
      <h1>Wow! This is some stuff.</h1>
    </div>
  )
}

ReactDOM.render(
  <App />, 
  document.getElementById('root')
);
```

Test it out by running `npm run start` and checking it in a browser.

## References

1. https://medium.com/swlh/back-to-basics-how-to-set-up-a-react-app-from-scratch-2020-134908e17490

[create-react-app]: https://create-react-app.dev/
