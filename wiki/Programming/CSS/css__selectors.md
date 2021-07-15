---
title: Selectors (CSS)
description: Selectors are the backbone of CSS, allowing the developer to create stylesheets that apply and cascade to many elements at a time.
---

Selectors are the backbone of {{CSS}}, allowing the developer to create stylesheets that apply and cascade to many elements at a time.

## Selectors

- `type`
- `#id`
- `.class`
- `[attribute]` - Select all elements with attribute
  - `[attribute="X"]` - Select elements with attribute of value 'X' (e.g. `attribute="X"`)
  - `[attribute~="X"]` - Select elements with an attribute that contains value 'X' (e.g. `attribute="W X Y Z"`)
  - `[attribute*="X"]` - Select elements with an attribute that contains substring 'X' (e.g. `attribute="WXYZ"`)
  - `[attribute^="X"]` - Select elements with attribute that starts with 'X' (e.g. `attribute="XYZ ABC"` but not `"ABC XYZ"`)
  - `[attribute|="X"]` - Select elements with attribute that has value 'X' or begins with 'X-' (e.g. `attribute="X-YZ"`)
  - `[attribute$="X"]` - Select elements with attribute that ends with 'X' (e.g. `attribute="VWX"`)
  - `[... i]` - Make selection of the quoted value case insensitive
- `A B` - Select all elements B that are inside of A
- `A + B` - Select all elements B that are adjacent to and come **directly** after A
- `A ~ B` - Select all elements B that are adjacent to and come after A **at some pont**
- `A > B` - Select all elements B that are direct children of A

## Pseudoclasses

Pseudoclasses are prefaced by a single colon.

### Parent

- `A:empty` - Select element A if they have no child elements

### Child

- `A:first-child`
- `A:last-child`
- `A:nth-child(n)`
- `A:nth-last-child(n)` - Select every nth element of A counting from the last element to the first
- `A:only-child` - Select element A if they are the only child element of their parent element
- `B A:only-child` - Select element A if they are the only child element of parent element B

### Type

- `A:first-of-type` - Select the first element of type A
- `A:nth-of-type(n/even/odd)` - Select the nth element of type A or every even or odd numbered instance of element of type A
- `A:nth-of-type(Nn+X)` - Select every Nth element of A starting on and including offset X (e.g. A:nth-of-type(2n+3) will select every odd element starting on element 3)
- `A:only-of-type` - Select A if it is the only child of that type
- `A:last-of-type` - Select the last of element type A

### State

#### Links

- `A:link` - Select A if it is an anchor element
- `A:visited`
- `A:hover`
- `A:active` - Select A if it has been selected

`a:hover` MUST come after `a:link` and `a:visited` in the CSS definition in order to be effective. `a:active` MUST come after `a:hover` in the CSS definition in order to be effective. **"LoVe, HAte"**

If you want to select an element when hovering over an element:

```css
.parent-selector:hover .child-selector { ... } /* Child */
.parent-selector:hover + .sibling-selector { ... } /* Sibling */
/* etc. */
```

#### Forms and Inputs

- `A:focus` - Select A if it currently has focus (e.g. text input when selected)
- `A:invalid` - Select A if it currently has an invalid entry (e.g. not matching the pattern)
- `A:focus:invalid` - Select A if it has focus and has an invalid entry
- `A:placeholder-shown` - Select A if the placeholder is being shown

#### Anchor/URL Hash

- `A:target` - Select A if the `#id` of A is the suffix of the URL.

```css
/* <div id="cool-thing" class="thing"></div> */
/* if URL is index.html#cool-thing, put border around the div with id "cool-thing" */

.thing:target {
  border: 10px solid red;
}
```

### Meta

- `A:not('X')` - Select all A elements if they do not match selector or pseudoclass X (e.g. `#id`, `.class`, `:last-child`, etc.)

## Pseudoelements

Pseudoelements are prefaced by two colons.

- `A::placeholder` - Select the placeholder within element A (e.g. placeholder text of a text input box)
- `A::first-line` - Select the first line of a block element.
- `A::first-letter` - Select the first letter of an element.

### Content

The `::before` and `::after` pseudoclasses allow you to place content before or after the selection. They require a `content` property and a `display` property. These pseudoclasses are treated like children of the selected element. e.g. 100% width is 100% width of the selected element.

```css
.selector::after {
  content: "";
  display: inline-block;
  height: 100%;          /* same width/height as parent */
  width: 100%;
  border-radius: 100px;
  position: absolute;
  top: 0;                /* same position as parent */
  left: 0;
  z-index: -1;
}
```

## References

1. https://www.w3schools.com/cssref/css_selectors.asp
2. https://developer.mozilla.org/en-US/docs/Web/CSS/Attribute_selectors