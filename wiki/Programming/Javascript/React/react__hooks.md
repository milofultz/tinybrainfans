---
title: React Hooks
description: Hooks are functions that let you “hook into” React state and lifecycle features from function components.
---

Hooks are functions that let you “hook into” {{React}} state and lifecycle features from function components. Hooks allow the simplicity of functional components with the complexity and flexibility of class components.

If these hooks are not exactly what you need, you can create your own {{custom hooks|Custom React Hooks}} using the existing ones to achieve your goals.

These examples are using Typescript for type annotations and clarity.

## useContext[4]

useContext is a way to pass global state values around to different components by wrapping components within a provider and then invoking the consumer in the necessary components.

In its most basic form (taken from Dave Ceddia[2]):

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

**contexts/ExampleContext.jsx** (same thing for **contexts/AnotherContext.jsx**)

```react
import { createContext } from 'react';
import { Channel } from '../types/types';


export interface ExampleContextInformation {
  name: string;
  age: number;
  setName: Function;
  setAge: Function;
}

// Fill this in with the default values. We will redefine the setters
// once in the component where this is used.
export const ExampleContext = createContext<ExampleContextInformation>({ 
  name: '',
  age: null,
  setName: () => {},
  setAge: () => {},
});
```

**contexts/GlobalContext.jsx**

```react
import React from 'react';

import { ExampleContext, ExampleContextInformation } from './ExampleContext';
import { AnotherContext, AnotherContextInformation } from './AnotherContext';

interface GlobalProps { 
  exampleContextObject: ExampleContextInformation, 
  anotherContextObject: AnotherContextInformation,
}

export function GlobalContext(props: any) {
  const {
    exampleContextObject,
    anotherContextObject
  }: GlobalProps = props;

  return (
    <ExampleContext.Provider value={exampleContextObject}>
      <AnotherContext.Provider value={anotherContextObject}>
        {props.children}
      </AnotherContext.Provider>
    </ExampleContext.Provider>
  );
}
```

**App.jsx**

```react
import React, { useState } from 'react';

import { GlobalContext } from './contexts/GlobalContext';
import { ExampleContextInformation } from './ExampleContext';
import { AnotherContextInformation } from './AnotherContext';

export default function App() {
  const [name, setName] = useState<string>('');
  const [age, setAge] = useState<number | null>('');
  const [anotherVar, setAnotherVar] = useState<number>(0);
  
  const exampleContextObject: ExampleContextInformation = {
    name,
    age,
    setName: (name: string) => setName(name),
    setAge: (age: number) => setAge(age),
  };
  
  const anotherContextObject: AnotherContextInformation = {
    anotherVar,
    setAnotherVar: (anotherVar: number) => setAnotherVar(anotherVar),
  }
  
  return (
    <GlobalContext
      exampleContextObject={exampleContextObject}
      anotherContextObject={anotherContextObject}
     >
      {/* Components in here have access to contexts via useContext */}
      <ChildComponent />
    </GlobalContext>
  )
}
```

**ChildComponent.jsx**

```react
import React, { useContext } from 'react';
import { ExampleContext } from './ExampleContext';
import { AnotherContext } from './AnotherContext';

export default function ChildComponent() {
  const { age, setAge } = useContext(ExampleContext);
  const { anotherVar } = useContext(AnotherContext);
  
  return (
    <div>
      <p>Your age is {age} and this is {anotherVar}!</p>
      <button type="button" onClick={() => setAge(Date.now())}></button>
    </div>
  )
}
```

## useEffect[5]

useEffect lets you perform side effects on [useState][] changes, effectively replacing `componentDidMount` and `componentDidUpdate`. `componentDidUnmount` is effectively replaced by returning a "cleanup" function in the useEffect callback.

```react
import React, { useEffect } from 'react';

const testComponent = () => {
  ...
  
  // this will run on every rerender (generally don't want this)
  useEffect(() => {
    // do stuff
  });
  
  // this will run the function only once on mount (still not ideal)
  useEffect(() => {
    // do stuff
  }, []);
  
  // this will run anytime that variables `names` or `obj.age` are changed
  useEffect(() => {
    // do stuff
  }, [names, obj.age]);
  
    // this will run anytime that variable `names` is changed and will 
    // run the returned "cleanup" function when the component is unmounted
  useEffect(() => {
    // do stuff
    return function cleanup() {
      // cleanup stuff
    }
  }, [names]);
  
  ...
```

In general, you should not try and overload a useEffect call. If you have different concerns or different async tasks, spread them out among different instances of useEffect. This example is trivial, but demonstrates how both of these *could* live in the same useEffect but shouldn't because of the scope of dependencies.[3]

```react
useEffect(() => {
  getUserData(usernameInput)
    .then(data => setUserData(data));
}, [usernameInput]);

useEffect(() => {
  useValidation(usernameInput, passwordInput);
}, [usernameInput, passwordInput]);
```

## useReducer[9-10]

`useReducer` is used when the new state value requires the old state to be produced correctly, or when there is a complex amount of changes on the state. Usually when the state is an object with many properties. This abstraction allows you to dispatch an action that could alter the state in multiple specific ways without having to specify those changes every time.

This concept and behavior is a core concept brought in from {{Redux}}. It is most useful when you have a central store for all your state values.

```
                 Call dispatch
                with action obj
        ┌───────────┐     ┌──────────┐
        │ Component │  →  │ Dispatch │
        └───────────┘     └──────────┘
Rerender                             dispatch
component    ↑                  ↓    action obj
                                     to reducer
        ┌───────────┐     ┌─────────┐
        │   State   │  ←  │ Reducer │
        └───────────┘     └─────────┘
                  Update the
                    State
```

A call to `useReducer` consists of a reducer function and the initial state, which will return a dispatch function, that accepts an action object, and the state object.

### Reducer function

This reducer takes in an action object from the dispatch function and depending on the `type` value, will do different things. This example is for a stopwatch component from Dmitri Pavlutin[10].

```react
function reducer(state, action) {
  switch (action.type) {
    case 'start':
      return { ...state, isRunning: true };
    case 'stop':
      return { ...state, isRunning: false };
    case 'reset':
      return { isRunning: false, time: 0 };
    case 'tick':
      return { ...state, time: state.time + 1 };
    default:
      throw new Error();
  }
}
```

You can use any logic here, but this is the standard way to do it: an object that contains a `type` as a string, and maybe a `payload`, containing data.

## useRef[7]

`useRef` is a way to maintain mutable values without rerendering. It's most often used on DOM nodes, like input fields. This example from the React docs shows how you can access the element that the ref is applied to.

```react
function TextInputWithFocusButton() {
  const inputEl = useRef(null);
  const onButtonClick = () => {
    // `current` points to the mounted text input element
    inputEl.current.focus();
  };
  return (
    <>
      <input ref={inputEl} type="text" />
      <button onClick={onButtonClick}>Focus the input</button>
    </>
  );
}
```

You can't use this as is to directly set a state value. For instance, the following won't render the value correctly because refs do not send out update notifications to React.

```react
function TextInputWithFocusButton() {
  const inputEl = useRef(null);

  return (
    <>
      <input ref={inputEl} type="text" />
      <p>Input value is {inputEl.current.value}</p>
      {/* The value will be `null` until a rerender occurs */}
    </>
  );
}
```

However, you *can* use a callback ref[8] to run code whenever the element the ref is applied to is updated. The following code shows how a callback can be applied to a ref to be run on each update.

```react
function TextInputWithFocusButton() {
  const inputRef = useRef(null);
  const [inputValue, setInputValue] = useState('');
  
  const inputChangeHandler = () => {
    if (inputRef?.current?.value) {
      setInputValue(inputRef.current.value);
    }
  };

  return (
    <>
      <input
        ref={ inputRef }
        onChange={ inputChangeHandler }
        type="text"
      />
      <p>Input value is { inputValue }</p>
    </>
  );
}
```

## useState[6]

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
2. https://daveceddia.com/usecontext-hook/
3. https://blog.logrocket.com/guide-to-react-useeffect-hook/
4. https://reactjs.org/docs/hooks-reference.html#usecontext
5. https://reactjs.org/docs/hooks-effect.html
6. https://reactjs.org/docs/hooks-state.html
7. https://reactjs.org/docs/hooks-reference.html#useref
8. https://reactjs.org/docs/hooks-faq.html#how-can-i-measure-a-dom-node
9. https://reactjs.org/docs/hooks-reference.html#usereducer
10. https://dmitripavlutin.com/react-usereducer/
