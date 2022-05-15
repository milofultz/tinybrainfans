---
title: React (Testing)
description: How to best test your React software, including components, API calls, etc.
---

## Testing Software

### Suites

The suite of choice is definitely Jest[4], as Jest was built almost 100% specifically for the purpose of testing {{React}} by Facebook who developed it). 

Next best would be Mocha[3]/Chai[2], as these play nicer with {{Mongoose}} servers, as Mongoose doesn't play nice with the concurrency of Jest.

### Helper Libraries

I've found React Testing Library[5] to handle most of my use cases, as it gives you a way to handle front-end testing like a user would, with mouse clicks, input entry, and searching for elements in the DOM. 

React Test Renderer[8] was useful for me when testing {{PixiJS}} applications, since it allowed use with canvas. May work with RTL also, but the examples I saw used this.

Enzyme is another alternative, but I have yet to try it out in a project.

## Unit/Component Tests

### Rendering With No Props

To test components, an easy test to put in place before even getting started, in the spirit of {{Test-Driven Development}}, is a "default" rendering. This is a rendering of the component passing in no props whatsoever, which will give you a good idea of what will happen in the non-happy paths. 

This example is largely based off of [this article](https://rangle.io/blog/component-test-coverage/).

`Component.jsx`

```react
import React from 'react';

export default function Component({ content, list }) {
  return (
    <div>
      <h1>Test</h1>
      <p>{content}</p>
      <ul>
        {list.map(item => <li>{item}</li>)}
      </ul>
    </div>
  )
}
```

First we start off with our component, which without adding defaults would throw explicitly, as you can't map over `list` when `list` is `undefined`. There would also be an empty `<p>` element as an  `undefined` variable will render empty.

So when we write our test, we should check for that unwanted text and ensure it won't show up in our output, as well as bypass that list error by using defaults. So when we write our test, lets write it as if those things are in place.

`Component.test.jsx`

```react
import React from 'react';
import '@testing-library/jest-dom';
import {render, screen} from '@testing-library/react';
import Component from '../Component.jsx';

describe('Testing Component', () => {
  it('should render without any props passed in', () => {
    // Render component with nothing passed in.
    // This will throw if any outright JS errors crop up.
    render(<Component />);
    // Check for elements rendering empty from no content
    // (Must use `queryBy` or else it will throw)
    const undefinedContent = screen.queryByTestId('content');
    expect(undefinedContent).toBeNull();
    // Check that the list is empty
    const emptyList = screen.getByRole('list');
    expect(emptyList).toBeInTheDocument();
    expect(emptyList.children.length).toBe(0);
  });
});

```

With these tests in place, the tests will error out until the defaults are put in place. So with these additions, we can make our component a little more robust right off of the bat:

`Component.jsx`

```react
import React from 'react';

export default function Component({ content, list }) {
  return (
    <div>
      <h1>Test</h1>
      {content && <p data-testid="content">{content}</p>}
      <ul>
        {list.map((item, index) => <li key={index}>{item}</li>)}
      </ul>
    </div>
  )
}

Component.defaultProps = {
  list: [],
};
```

## References

1. https://rangle.io/blog/component-test-coverage/
2. https://www.chaijs.com/
3. https://mochajs.org/
4. https://jestjs.io/
5. https://testing-library.com/docs/react-testing-library/intro/
6. https://enzymejs.github.io/enzyme/ 
7. https://stackoverflow.com/questions/52783144/how-do-you-test-for-the-non-existence-of-an-element-using-jest-and-react-testing
8. https://reactjs.org/docs/test-renderer.html
