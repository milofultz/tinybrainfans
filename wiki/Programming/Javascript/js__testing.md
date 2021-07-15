---
title: Testing (Javascript)
description: Javascript provides many options to test your code via timing, assertions, and frameworks.
---

{{Javascript}} provides many options to test your code via timing, assertions, and frameworks.

## Time

### Simplest Timer

```javascript
console.time('process');
// do stuff
console.timeEnd('process'); // log time passed since console.time
```

### Basic Timer Polyfill

```javascript
var Timer = function(name) {
  var start = new Date();
  return {
    stop: function() {
      var end  = new Date();
      var time = end.getTime() - start.getTime();
      console.log('Timer:', name, 'finished in', time, 'ms');
    }
  }
};

var t = new Timer('Description');
// do stuff
t.stop();
```

