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

class Greeting extends React.Component {
  render() {
    return (
      <h1>Hello, {this.props.name}</h1>
    );
  }
}
```

With PropTypes, we can add typing, validation, and default values. Then during compilation, we will throw errors before moving any further.

```react
import React from 'react';
import PropTypes from 'prop-types';

class Greeting extends React.Component {
  render() {
    return (
      <h1>Hello, {this.props.name}</h1>
    );
  }
}

Greeting.propTypes = {
  name: PropTypes.string
};

Greeting.defaultProps = {
  name: 'Bob'
};
```

PropTypes still exist for functional components, but for `defaultProps`, one should use the [ES6 default parameters syntax](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters).

## References

- https://reactjs.org/docs/typechecking-with-proptypes.html
