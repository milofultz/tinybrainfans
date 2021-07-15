---
title: DOM Manipulation (Javascript)
description: How to manipulate the HTML DOM using Javascript.
---

How to manipulate the {{HTML}} {{DOM}} using {{Javascript}}.

## Elements

* `X = document.createTextNode('text')`
* `X = document.createElement('li')`

### Alteration

* `X.className = 'class'`
* `X.id = 'id'`
* `X.setAttribute('name', 'value')`
* `X.innerHTML = '<i>italics</i>`
* `X.insertAdjacentHTML(position, Y)` will insert {{HTML}} string Y at position of element X. [(This method is much better than an `innerHTML +=`)](https://hacks.mozilla.org/2011/11/insertadjacenthtml-enables-faster-html-snippet-injection/) The positions are as follows:

```html
<!-- beforebegin -->
<p>
  <!-- afterbegin -->
  foo
  <!-- beforeend -->
</p>
<!-- afterend -->
```

* `X.textContent = 'text'`
* `X.innerText = 'text'`
* `X.childNodes[n].nodeValue = '...'` will allow you to change the inner text of an element, even when it includes another element (e.g. changing `some more text` in `<span><em>yeah</em>some more text</span>`)

### Insertion

- `X.appendChild(Y)` will append element Y as the last child of element X

- `X.prepend(Y)` will prepend element Y as the first child of element X
- `X.parentNode.insertBefore(Y, X);` will insert element Y directly before element X
- `X.parentNode.insertBefore(Y, X.nextSibling);` will insert element Y directly after element X

### Duplication

- `X.cloneNode(true)` will return a copy of the selected element.

### Search

- `X.querySelector(Y)` will find the first element based on CSS element search Y within the tree of elements found at X.
- `X.querySelector(Y)` will find all elements based on CSS element search Y within the tree of elements found at X.
- `X.closest(Y)` will find an element based on CSS element search Y from element X up through all of the parents to the top of the DOM

## DOMParser

The `DOMParser` allows you to parse {{HTML}} in as a string, returning an `HTMLDocument` object. This allows you to interact with the DOM elements and alter them much more simply and easily than using regex or find/replace in a text-editor.

The DOMParser operates very similarly to {{jQuery}}'s ability to parse HTML in as a string within `$('<input>')`. The difference is that DOMParser returns an HTMLDocument instead of a {{jQuery}} object.

### Importing Plain Text

```javascript
const parser = new DOMParser();
const htmlDoc = parser.parseFromString(input, 'text/html');
```

### Exporting Plain Text

You can return each of the top level elements (`head`, `body`) as plain text using `innerHTML`.  

```javascript
return htmlDoc.body.innerHTML;
```

## References

1. <https://developer.mozilla.org/en-US/docs/Web/API/DOMParser>
2. <https://api.jquery.com/jQuery/>
3. <https://www.udemy.com/course/modern-javascript-from-the-beginning/learn/lecture/8757274>
4. <https://gomakethings.com/how-to-copy-or-clone-an-element-with-vanilla-js/>
5. <https://stackoverflow.com/questions/4106809/how-can-i-change-an-elements-text-without-changing-its-child-elements>
6. <https://developer.mozilla.org/en-US/docs/Web/API/Element/insertAdjacentHTML>