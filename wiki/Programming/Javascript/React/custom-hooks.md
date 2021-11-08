---
title: Custom React Hooks
description: Custom hooks allow you to create simple extensions of existing React hooks to better suit your needs.
---

Custom hooks allow you to create simple extensions of existing {{React}} hooks to better suit your needs.

It is highly recommended that you review what {{hooks|React Hooks}} are first before getting into this, as we are using `useEffect` and `useState`.

## Your First Hook

*This example is taken from [Web Dev Simplified](https://www.youtube.com/watch?v=6ThXsUwLWvc).*

This custom hook will log whenever your input value changes.

**useUpdateLogger.js**

```javascript
import { useEffect } from 'react';

const useUpdateLogger = (value) => {
	useEffect(() => console.log(value), [value]);
};

export default useUpdateLogger;
```

When we use this in our project, it will log to the console whenever there is a change to the variable that was given.

**ExampleComponent.jsx**

```react
import React, { useState } from 'react';
import useUpdateLogger from './useUpdateLogger';

const App = () => {
  const [counter, setCounter] = useState(0);
  
  useUpdateLogger(counter);
  
  return (
    <div>
      <button
        type="button"
        onClick={() => setCounter(counter + 1)}
      >Increment</button>
    </div>
  );
};

export default App;
```

## References

- https://www.youtube.com/watch?v=6ThXsUwLWvc
- https://blog.webdevsimplified.com/2019-11/how-to-write-custom-hooks/
