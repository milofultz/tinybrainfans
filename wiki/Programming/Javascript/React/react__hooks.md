---
title: React Hooks
description: Hooks are functions that let you “hook into” React state and lifecycle features from function components.
---

Hooks are functions that let you “hook into” {{React}} state and lifecycle features from function components. Hooks allow the simplicity of functional components with the complexity and flexibility of class components.

## Types

These examples are using Typescript for type annotations and clarity.

### [useState][]

useState lets you use state within a functional component.

```react
import React, { useState } from 'react';

interface Name {
  first: string,
  last: string,
}

const testComponent = () => {  
  // this will create a getter and setter for state variable `names`
	const [counter, setCounter] = useState<number>(0);
  const [names, setNames] = useState<Name[]>([]);
  
  // sets counter 
  setCounter(counter + 1);
  
  const newName = {
    first: 'John',
    last: 'Smith',
  };
	setNames([
    ...names,
    newName
  ]);
  
  ...
```

### [useEffect][]

useEffect lets you perform side effects on [useState][] changes, effectively replacing `componentDidMount` and `componentDidUpdate`.

```react
import React, { useEffect } from 'react';

const testComponent = () => {
  ...
  
  // this will run on every rerender (generally don't want this)
  useEffect(() => {
		// do stuff
  });
  
	// this will run the function once on mount
  useEffect(() => {
		// do stuff
  }, []);
  
  // this will run anytime that variable `names` is changed
  useEffect(() => {
    // do stuff
  }, [names]);

  ...
```

## References

[useEffect]: https://reactjs.org/docs/hooks-effect.html
[useState]: https://reactjs.org/docs/hooks-state.html

