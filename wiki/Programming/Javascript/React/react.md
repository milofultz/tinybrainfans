---
title: React
description: React is a Javascript framework for implementing dynamic single page applications into your site.
---

React is a {{Javascript}} framework for implementing dynamic single page applications into your site.

## Setting Up

Use [create-react-app][] with {{npm}} or {{build it from scratch|React from Scratch}}.

## Components

Components are reusable pieces of {{JSX}} that can be used to dynamically render HTML. The JSX is written as is, outside of any quotes. When components are referenced, they are written with the closing `/`. Components are named in PascalCase. 

**Note the parentheses used in the arrow function instead of curly braces.** This is because the implicit return will enclose everything within the parentheses and allow it to be placed on multiple lines.

```react
const FoodItem = () => (
  <li>Get some of this food!</li>
);

const GroceryList = () => (
  <ul>
    <FoodItem />
    <FoodItem />
  </ul>
);
```

These are rendered via the render method of the `ReactDOM`, which takes the component followed by the destination it will be appended to. Most common is that you will have a single div that your whole website will be injected into, i.e. `<div class="app"></div>`.

```react
ReactDOM.render(<GroceryList />, document.getElementById('main'));
```

```html
<!-- output in associated HTML file -->

<div id="main">
  <ul>
    <li>Get some of this food!</li>
    <li>Get some of this food!</li>
  </ul>
</div>
```

#### Component Properties, or Props

Properties are attributes that can be passed into and used to populate parts of that component. Props are always passed in as an object of keys that correspond to the attributes given on the JSX element. e.g. `<Component name={"John"} age={6} />` will pass `{ name: "John", age: 6 }` into the `Component`. Props are surrounded by curly braces when they are assigned and when they are recalled. Inside the curly braces, valid {{Javascript}} may be called.

```react
const GroceryListItem = (props) => (
  <li>{props.item.toUpperCase()}</li>
);

const GroceryList = (props) => (
  <ul>
    {props.groceryItems.map(propItem => <GroceryListItem item={propItem} />)}
  </ul>
);

ReactDOM.render(
  <GroceryList groceryItems={['candy', 'cookies', 'ice cream']} />, 
  document.getElementById('app')
);
```

```html
<!-- output in associated HTML file -->

<div id="app">
  <ul>
    <li>CANDY</li>
    <li>COOKIES</li>
    <li>ICE CREAM</li>
  </ul>
</div>
```

#### Default Props

```react
const GroceryListItem = (props) => (
  <li>{props.item.toUpperCase()}</li>
);

GroceryListItem.defaultProps = {
  item: 'Milk',
};

const GroceryList = (props) => (
  <ul>
    <GroceryListItem />
  </ul>
);

ReactDOM.render(<GroceryList />, document.getElementById('app'));
```

```html
<!-- output in associated HTML -->

<div id="app">
  <ul>
    <li>MILK</li>
  </ul>
</div>
```

#### {{PropTypes}}

You can add type checking to your props to make your code a bit more robust. If the types you entered don't match the element's type, then it will only give a warning in the console and will still render (as long as it is able). {{Learn more here|PropTypes}}.

#### Exporting Components

You can put the component into another file and import it in by using the `export default componentName` syntax.

```react
// GroceryListItem.js
const GroceryListItem = (props) => (
  <li>{props.item.toUpperCase()}</li>
);

export default GroceryListItem;
```

```react
// app.js
import ...
import GroceryListItem from './GroceryListItem.js';

ReactDOM.render(
  <GroceryListItem item="candy" />, 
  document.getElementById('app')
);
```

#### [Higher Order Components][]

Higher order components are just {{higher order functions}} in React, in that they are functions that spit out another function based on what is input. One example is a React HOC that takes in a component and adds logging capabilities to it. 

**TrackingWrapper.jsx**

```react
import ...

const TrackingWrapper = ({ WrappedComponent, props }) => {
  const logInteraction = (event) => {
    const logObject = {
      timstamp: Date.now(), 
      element: event.target,
    };
    console.log(logObject);
    // POST to server
  }
  
  return (
    <div className="tracking-wrapper" onClick={this.logInteraction}>
      {/* This will pass in all props passed to the WrappedComponent in their given namespace */}
      <WrappedComponent {...props} />
    </div>
  );
};

export default TrackingWrapper;
```

**App.jsx**

```react
import ...
import TrackingWrapper from './TrackingWrapper';
import { ClickMe } from './Buttons';

const App = () => {
  return (
    <TrackingWrapper
      WrappedComponent={ClickMe}
      {/* The following props will get passed to the ClickMe component */}
      message="Click here!"
      link="http://www.zombo.com"
    />
  );
};

export default App;
```

Another common use of higher order components is a wrapper that will enclose multiple child components, called `children`[9]. You could do this with the above example like so:

**TrackingWrapper.jsx**

```react
import ...

const TrackingWrapper = ({ children }) => {
  const logInteraction = (event) => {
    const logObject = {
      timstamp: Date.now(), 
      element: event.target,
    };
    console.log(logObject);
    // POST to server
  }

  return (
    <div className="tracking-wrapper" onClick={this.logInteraction}>
      {/* This will pass in all children components that this component encloses */}
      { children }
    </div>
  )
};

export default TrackingWrapper;
```

**App.jsx**

```react
import ...
import TrackingWrapper from './TrackingWrapper';
import { ClickMe } from './Buttons';

const App = () => {
  return (
    <TrackingWrapper>
      <ClickMe
        message="Click here!"
        link="http://www.zombo.com"
      />
    </TrackingWrapper>
  );
};

export default App;
```


### User Interaction/Event Listeners

Components can have local event listeners assigned directly to themselves.

```react
const GroceryListItem = (props) => {
  const onListItemClick = function (e) {
    console.log("Yum!");
  };
  
  return (
    <li onClick={onListItemClick}>{props.item}</li>
  )
};
```

If you want to use an event listener on a class component that will be used within another `this` context, you need to be sure you maintain the correct `this`, either through `{{bind|Apply, Call and Bind in Javascript}}`, or the more sexy use of an anonymous arrow function.

```react
// Good
return (
  <li onClick={this.onListItemClick.bind(this)}>{props.item}</li>
)

// Better
return (
  <li onClick={() => this.onListItemClick()}>{props.item}</li>
)
```

### Stateless Functional vs. Class

All of the previous examples have used stateless functional components, which are declared at runtime and essentially become a static web page (unless you are using {{hooks|React Hooks}}, which make them no longer stateless). If you want to have user interaction and a dynamic webpage, you will want to include **state**. State is just a dynamic memory for a given component, e.g. whether it has been clicked or has a given property. State is only included on class components and is initialized in the constructor.

First you will want to convert your stateless functional component into a class component.

```react
class GroceryListItem extends React.Component {
  constructor (props) {
    super(props);
  }

  render () {
    return (
      <li>{this.props.item}</li>
    )
  }
};
```

Then you can add your **state** to the element via the class. When `this.setState` is called, the element rerenders in the {{DOM}}, applying whatever changes you have made to the state and control flow of the rendering of the element.

```react
class GroceryListItem extends React.Component {
  constructor (props) {
    super(props);

    this.state = {
      hover: false,
    };
  };

  onClick () {
    this.setState({
      hover: !this.state.hover,
    });
  };

  render () {
    const style = {
      fontWeight: this.state.hover ? "bold" : "normal"
    };

    return (
      <li style={style} onClick={this.onClick.bind(this)}>{this.props.item}</li>
    );
  };
};
```

For the element to properly rerender, you must update the state by using the `setState` method. This will cause what React calls "reconciliation", which will update what needs to be updated in the {{DOM}}.

### setState

The `setState` call takes in two arguments: `setState(updated, [callback])`:

- `updated`: this is an object containing the state's properties as keys and the values that will be set within the state at those keys.
- `[callback]`: an optional argument; this function will execute once only after the state has been set. Uesful for handling API calls and other asynchronous patterns with updating.

## Handling Application-wide Constants[8]

If you have a lot of constants that need to be accessed in multiple files or components, create a constants file and bring in the file as an import (this also helps with {{magic numbers|Magic Numbers (Programming)}}).

### Before

**components/ExampleComponent.js** 

```react
import React from 'react';

const STATE = 'CA';
const TAXRATE = .095;

const ExampleComponent = (bill) => (
  <div>
    <h1>Total Tax in {STATE}: {bill + bill * TAXRATE}</h1>
  </div>
);
```

### After

**components/ExampleComponent.js** 

```react
import React from 'react';

import * from '../data/constants';

const ExampleComponent = (bill) => (
  <div>
    <h1>Total Tax in {STATE}: {bill + bill * TAXRATE}</h1>
  </div>
);
```

**data/constants.js**

```javascript
export const STATE = 'CA';
export const TAXRATE = .095;
```

## References

1. https://reactjs.org/docs/introducing-jsx.html
2. http://jamesknelson.com/javascript-return-parenthesis/
3. https://stackfan.com/loop-through-an-array-of-objects-in-react/
4. https://css-tricks.com/understanding-react-setstate/
5. https://reactjs.org/docs/react-component.html#setstate
6. https://reactjs.org/docs/typechecking-with-proptypes.html
7. https://www.npmjs.com/package/prop-types
7. https://medium.com/@austinpaley32/how-to-add-a-constants-file-to-your-react-project-6ce31c015774
7. https://dev.to/franca/react-children-2k4e

[create-react-app]: https://create-react-app.dev/
[Higher Order Components]: https://reactjs.org/docs/higher-order-components.html

