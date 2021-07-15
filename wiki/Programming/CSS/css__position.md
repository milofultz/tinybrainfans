---
title: Position (CSS)
description: The `position` property in CSS gives the developer control over the x-, y-, and z-axis in aligning elements.
---

The `position` property in {{CSS}} gives the developer control over the x-, y-, and z-axis in aligning elements.

- `static` - This is the default position that a property will have if left unset. The equivalent of being unpositioned. This element will be in the standard flow of the document. This value is the only value that will not create a new stacking context (z-axis).
- `relative` - A relatively positioned element will be in the standard flow of the document, but can be positioned *relative to* its current position (e.g. `top`, `left`, `bottom`, `right`). This offset doesn't affect other elements in flow. Space will still exist in flow for this element in it's original position, even if it is moved. `relative` can create a new stacking context if the `z-index` is not set to `auto`.
- `absolute` - An absolutely positioned element will be out of the regular flow of the document and can be positioned according to the closest positioned (not static) parent element. No space will be made for it in the document. This can create a new stacking context if the `z-index` is not set to `auto`.
- `fixed` - Like `absolute`, a fixed element will be removed from the standard flow and no space will be made. This will be positioned according to the box created by the browser's viewport. This will **always** create a new stacking context and will print on every document when printed.
- `sticky` - This is positioned in a normal flow of a document, like `relative`, and then offset to it's nearest scrolling relative (i.e. has an `overflow` property set to a scrolling value). This will also always create a new stacking context.

## References

1. https://developer.mozilla.org/en-US/docs/Web/CSS/position