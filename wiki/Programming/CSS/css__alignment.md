---
title: Alignment (CSS)
---

## Block Elements

To horizontally center a block element with a width other than 100%, use `margin: auto;`. Setting the width of the element will prevent it from stretching out to the edges of its container. The element will then take up the specified width, and the remaining space will be split equally between the two margins.

## Inline and Inline-Block Elements

**Horizontal** alignment can be done using `text-align: center;`. 

To align text **vertically**, however, the `vertical-align` property is used. The vertical-align property works only with inline and table-cell elements — it won’t work for block, inline-block, or any other element levels. The vertical-align property accepts a handful of different values; the most popular values are **top, middle, and bottom**. These values vertically position text in relation to the table cell, for table-cell elements, or to the closest parent element, for inline-level elements.

## Image/Icon/Font Awesome Alignment

Although the text needs to be aligned with the image, it is actually the image that needs to be aligned and the text will move accordingly.

```html
<style>
  .icon {
    vertical-align: middle;
  }
</style>

<span>Some text <img class="icon" src="..."></span> <!-- or ... -->
<span>Some text <i class="icon fa ..."></i></span>
```

## Using 100vh/100vw

100vh and 100vw won't work as expectedunless you set the margin and padding of the selected element to 0.

## References

1. https://css-tricks.com/centering-css-complete-guide/
2. https://learn.shayhowe.com/html-css/organizing-data-with-tables/
3. https://stackoverflow.com/questions/17309928/how-to-center-text-vertically-with-a-large-font-awesome-icon