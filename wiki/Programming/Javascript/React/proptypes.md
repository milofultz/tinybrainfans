---
title: PropTypes
description: PropTypes are a way to add more strict typing, validation, and default values to props in React.
---

PropTypes are a way to add more strict typing, validation, and default values to props in {{React}}.

## Example

We have a Greeting component that takes in a prop called `name`:

**Greeting.jsx**

```react
import React from 'react';

const Greeting = (name = 'Bob') => {
  return (
    <h1>Hello, {this.props.name}</h1>
  );
}
```

With PropTypes, we can add typing and validation. Then during compilation, we will throw errors before moving any further.

```react
import React from 'react';
import PropTypes from 'prop-types';

const Greeting = (name = 'Bob') => {
  return (
    <h1>Hello, {this.props.name}</h1>
  );
}

Greeting.propTypes = {
  name: PropTypes.string
};
```

Multiple types can be specified for a prop also, using `oneOfType`:

```react
name: PropTypes.oneOfType([
  PropTypes.string,
  PropTypes.number
])
```

PropTypes still exist for functional components, but for `defaultProps`, one should use the [ES6 default parameters syntax](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters).

## Types

You can find the fully updated list [here on NPM](https://www.npmjs.com/package/prop-types).

```javascript
// Optional/Required
optionalString: PropTypes.string,
requiredString: PropTypes.string.required,

// Types
optionalArray: PropTypes.array,
optionalArrayOf: PropTypes.arrayOf(PropTypes.number),

optionalObject: PropTypes.object,
optionalObjectOf: PropTypes.objectOf(PropTypes.number),
optionalObjectWithShape: PropTypes.shape({
  property: PropTypes.string,
}),
optionalObjectWithStrictShape: PropTypes.exact({
  property: PropTypes.string,
}),

optionalBool: PropTypes.bool,
optionalFunc: PropTypes.func,
optionalNumber: PropTypes.number,
optionalString: PropTypes.string,
optionalSymbol: PropTypes.symbol,

optionalMessage: PropTypes.instanceOf(Message),
optionalEnum: PropTypes.oneOf(['News', 'Photos']),
optionalUnion: PropTypes.oneOfType([
  PropTypes.string,
  PropTypes.number,
  PropTypes.instanceOf(Message)
]),

// Anything that can be rendered: numbers, strings, elements or an array
// (or fragment) containing these types.
optionalNode: PropTypes.node,

// A React element (ie. <MyComponent />).
optionalElement: PropTypes.element,

// A React element type (ie. MyComponent).
optionalElementType: PropTypes.elementType,

// A value of any data type
optionalAny: PropTypes.any,

// You can also specify a custom validator. It should return an Error
// object if the validation fails. Don't `console.warn` or throw, as this
// won't work inside `oneOfType`.
customProp: function(props, propName, componentName) {
  if (!/matchme/.test(props[propName])) {
    return new Error(
      'Invalid prop `' + propName + '` supplied to' +
      ' `' + componentName + '`. Validation failed.'
    );
  }
},

// You can also supply a custom validator to `arrayOf` and `objectOf`.
// It should return an Error object if the validation fails. The validator
// will be called for each key in the array or object. The first two
// arguments of the validator are the array or object itself, and the
// current item's key.
customArrayProp: PropTypes.arrayOf(function(propValue, key, componentName, location, propFullName) {
  if (!/matchme/.test(propValue[key])) {
    return new Error(
      'Invalid prop `' + propFullName + '` supplied to' +
      ' `' + componentName + '`. Validation failed.'
    );
  }
})
```

## References

- https://reactjs.org/docs/typechecking-with-proptypes.html
- https://www.npmjs.com/package/prop-types
