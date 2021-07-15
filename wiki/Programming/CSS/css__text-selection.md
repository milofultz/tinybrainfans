---
title: Text Selections (CSS)
descriptions: How to use CSS to give or take away the user's ability to select text on a page.
---

How to use {{CSS}} to give or take away the user's ability to select text on a page.

## Disable

Particularly with `span` or `div` style buttons that can be clicked a bunch and end up with their text selected.

```css
.disable-select{
  -webkit-touch-callout: none; /* iOS Safari */
    -webkit-user-select: none; /* Safari */
     -khtml-user-select: none; /* Konqueror HTML */
       -moz-user-select: none; /* Firefox */
        -ms-user-select: none; /* Internet Explorer/Edge */
            user-select: none; /* Non-prefixed version, currently
                                  supported by Chrome and Opera */
}
```

## Select All

This allows all the inner text to be copied when clicking inside the selected element.

```css
.copy-all-text{  
  -webkit-user-select: all;  /* Chrome all / Safari all */
     -moz-user-select: all;  /* Firefox all */
      -ms-user-select: all;  /* IE 10+ */
          user-select: all;  /* Likely future */   
}
```

## References

1. https://www.freakyjolly.com/how-to-disable-text-selection-highlighting/