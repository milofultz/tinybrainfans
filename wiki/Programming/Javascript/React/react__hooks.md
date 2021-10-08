---
title: React Hooks
description: Hooks are functions that let you “hook into” React state and lifecycle features from function components.
---

Hooks are functions that let you “hook into” {{React}} state and lifecycle features from function components. Hooks allow the simplicity of functional components with the complexity and flexibility of class components.

These examples are using Typescript for type annotations and clarity.

## [useContext][]

useContext is a way to pass global state values around to different components by wrapping components within a provider and then invoking the consumer in the necessary components.

In its most basic form ([taken from Dave Ceddia](https://daveceddia.com/usecontext-hook/)):

```react
import React, { createContext } from 'react';

// Create a Context
const NumberContext = createContext();
// It returns an object with 2 values:
// { Provider, Consumer }

const App = () => {
  // Use the Provider to make a value available to all
  // children and grandchildren
  return (
    <NumberContext.Provider value={42}>
      <div>
        <Display />
      </div>
    </NumberContext.Provider>
  );
};

const Display = () => {
  // Use the Consumer to grab the value from context
  // Notice this component didn't get any props!
  return (
    <NumberContext.Consumer>
      {value => <div>The answer is {value}.</div>}
    </NumberContext.Consumer>
  );
};
```

However, instead of using the `Consumer` wrapper, you can use `useContext` and destructure the variables held within:

```react
import React, { createContext, useContext } from 'react';

const NumberContext = createContext();

const App = () => {
  return (
    <NumberContext.Provider value={42}>
      <div>
        <Display />
      </div>
    </NumberContext.Provider>
  );
};

const Display = () => {
  const { value } => useContext(NumberContext);
  return <div>The answer is {value}.</div>;
};
```

This becomes more and more useful when multiple contexts are used and you can end up with wrappers over wrappers over wrappers and it gets real unwieldy really quick.

### Simplifying a Global Context

If one is using many different contexts over all components, these different contexts can be placed into individual files and imported into a 'main' context file that exports a higher order function which wraps any children in these different contexts.

// TODO: Add example

## [useEffect][]

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

## [useState][]

useState lets you use state within a functional component.

**NOTE:** useState does not have a callback as second argument, like the normal `setState` invocation does. Use useEffect to handle side effects and changes on state updates.

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
  const onClick = () => {
    setCounter(counter + 1);
  };
  
	const onSubmit = (firstName, lastName) => {
    setNames([
    	...names,
  	  {
        first: firstName,
        last: lastName
      }
	  ]);
  }  
  
  ...
```

## References

1. https://reactjs.org/docs/context.html#dynamic-context

[useContext]: https://reactjs.org/docs/hooks-reference.html#usecontext
[useEffect]: https://reactjs.org/docs/hooks-effect.html
[useState]: https://reactjs.org/docs/hooks-state.html

