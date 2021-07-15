---
title: Event Listeners (Javascript)
description: Event listeners run a function on the emitting of an event, including 'click', 'keyup', resize', and more.
---

Event listeners in {{Javascript}} run a function on the emitting of an event, including `click`, `keyup`, `resize`, and more.

```javascript
element.addEventListener('eventType', function(e) {
	// do something
});
```

This adds a listener to whatever element it is attached to. It waits for the 'event' to occur, and once it does, it calls the callback function. The `e` (short for `event`)is the callback object, which can give you information on the event and its related elements.

One can also pass in a named function instead of use an anonymous one. This can lead to cleaner code, as it is more declarative than imperative

```javascript
element.addEventListener('event', onClick);

function onClick(e){
  // do something
};
```

There is a third Boolean parameter of addEventListener that specifies if you want the handler to fire on capture or bubble. It defaults to false, which is bubble. But if you set it to true, it will fire on capture.

## The Event Object

The `e` that is in the functions pertaining to `eventListener`'s in {{Javascript}} is the object that is returned by a specific event with many parameters like the coordinates of the click, the element clicked, etc. If you have an `eventListener` attached to a certain element that will trigger on a `click`, then when the user clicks, it will return an event object. This event object is what gets passed as `e` into the function.

`e.target` is used to specify the element on which you clicked.

## Event Bubbling and Delegation

Event bubbling is where an event listener attached to a certain element will be triggered by a child element. This is because of the elements being nested within each other. If `div2` is nested within `div1`, a trigger on `div2`, will also trigger `div1`, since `div2` is nested within `div1`.

Event delegation is a pattern where an event listener attached to an element is not triggered unless a specified child element is the trigger. This is useful if there are many elements that have the same class name or ID and you want an action done to a specific one. It is done through if statements on the callback specifying attributes like class name or id.

```html
<div id="outer">
  <div id="inner-1">
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
  </div>
  <div id="inner-2">No</div>
</div>
```

```javascript
// This will fire on any click that happens on it or any of its child elements (bubbling to the top component)
document.getElementById('outer').addEvenetListener('click', () => console.log('bubbled'));

// This will fire only when a specific child or any of its children are clicked (delegated to specific children)
document.getElementById('outer').addEvenetListener('click', () => {
	const innerOne = event.target.closest('#inner-1');
  if (innerOne) {
    console.log('delegated');
  }
});
```

## Most Common Event Types

- blur - The event occurs when an element loses focus
- change - The event occurs when the content of a form element, the selection, or the checked state have changed (for `<input>`, `<select>`, and `<textarea>`)
- click
- DOMContentLoaded - The event occurs when the {{HTML}} has been fully parsed and loaded.
- focus
- keydown/keyup
- keypress
- mousedown/mouseup
- mouseenter/mouseleave/mousemove/mouseover/mouseout/mouseup
- submit - The event occurs when a form is submitted

## References:

1. https://www.udemy.com/course/modern-javascript-from-the-beginning/learn/lecture/8757278#content
2. https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener
3. https://stackoverflow.com/questions/35936365/what-exactly-is-the-parameter-e-event-and-why-pass-it-to-javascript-functions
4. https://www.udemy.com/course/modern-javascript-from-the-beginning/learn/lecture/8762202#content
5. https://www.udemy.com/course/modern-javascript-from-the-beginning/learn/lecture/8757286#content
6. https://www.w3schools.com/jsref/dom_obj_event.asp