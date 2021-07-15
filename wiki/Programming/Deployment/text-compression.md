---
title: Text Compression (Server)
description: Text compression minifies and zips files on build or on client side render of your web page.
---

Text compression minifies and zips files on build or on client side rendering of your web page. Using this on your deployed webpage can save significant time in page downloads and lead to better user retention.

## Implementation

To accomplish client-side rendering, you will need to implement the compression on the building of your pages (in this case, using {{Webpack}}) as well as on your server ({{Express}}). This example is for a {{React}} project using {{Webpack}} and {{Express}}.

### {{Webpack}}

First, install [`compression-webpack-plugin`][] and add it to your `webpack.config.js` file:

```json
module.exports = {
  ...
  plugins: [
    new CompressionPlugin({
      algorithm: 'gzip',
      test: /\.(js|css)$/i,
    }),
  ],
  ...
};
```

This will use [GZIP][] to compress all {{JS|Javascript}} and {{CSS}} files in your project.

### {{Express}}

Similar to Express's `app.use(express.static(...))`, this will allow Express to serve the GZIP files to the user. You need to install [`express-static-gzip`][] and then add this to your server JS file:

```javascript
var express = require("express");
var expressStaticGzip = require("express-static-gzip");
var app = express();

app.use("/", expressStaticGzip("/my/rootFolder/"));
```

### On Your Server

On your server, add/merge your new code, `npm i` all the new dependencies, restart any PM2 instances and NGINX, and away you go!

## References

1. https://developers.google.com/speed/pagespeed/insights/
2. https://stackoverflow.com/questions/57504666/enable-text-compression-using-react-webpack-and-apache
3. https://stackoverflow.com/questions/50442039/compression-webpack-plugin

[`compression-webpack-plugin`]: https://github.com/webpack-contrib/compression-webpack-plugin
[`express-static-gzip`]: https://github.com/tkoenig89/express-static-gzip
[GZIP]: http://www.gzip.org/

