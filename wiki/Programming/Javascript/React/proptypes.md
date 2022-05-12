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

## Options

### Optional/Required

```javascript
Component.propTypes = {
  optional_name: PropTypes.string,
  required_name: PropTypes.string.isRequired,
};
```

### Object of Unique Keys (IDs, etc.)[3]

In this case the property `players` is an object with properties that are dynamic IDs. This can be done using the `objectOf` prop type.

```javascript
Component.propTypes = {
  players: PropTypes.objectOf(
    PropTypes.shape({
      name: PropTypes.string,
      age: PropTypes.number,
    }).isRequired
  ).isRequired,
};
```

## References

1. https://reactjs.org/docs/typechecking-with-proptypes.html
2. https://www.npmjs.com/package/prop-types
3. https://stackoverflow.com/questions/59643225/proptype-for-object-where-keys-are-ids
