---
title: Object Oriented CSS
---

Another {{CSS}} framework

## Main Principles

1. Separate structure and skin - Structure and position declarations should be in the base object (along with default visual declarations if necessary), while any visual declarations should go into extender classes.
2. Separate container and content - Break the dependency between the container module and the content objects in contains

## More Best Practices

1. Create a component library - Make components (legos) with which you can build your site. These components could include headers, lists, media components, etc. Build these before building your site.
2. Extend objects by applying multiple classes to an element - Don't make one class do everything. Utilities, modifiers, and base classes can combine to make a much easier to maintain style.
3. Minimize selectors - Low specificity means less cascade problems and runaway specificity races.
4. Use consistent semantic styles
5. Design modules to be transparent on the inside
6. Be flexible - Height and width should be able to adapt themselves and should not rely on constant babysitting by the designer/developer.
7. Learn to love grids

## 9 Pitfalls

1. Avoid location dependent styles - You want your code to be modular. If it only works if it is in a certain context or position, it is not modular and prone to breakage.
2. Avoid specifying what tag a class applies - A 'heading' should do something predictable from page to page.
3. Avoid IDs - They add unnecessary specificity errors and can only be used once, so are needlessly specific.
4. Avoid drop shadows and rounded corners over irregular backgrounds - This may cause undesired results
5. Avoid height alignment - Height should be defined by the content of the element. Instead of this, ensure you are separating the container from the content.
6. Don't use images as text - Screen readers and users on older software often rely on text only and this will make pages needlessly difficult to use.
7. Avoid redundancy - If two components look too similar to be used on the same page, they are too similar to use on the same site. Choose one!
8. Avoid premature optimization - If you are unsure what is the best choice, do the naive solution first, and then refactor afterwards.
9. ~~Don't sprite every image together, unless you have very few pages~~ (seems like dated advice at this point)

Grids control **width**, content controls **height**

## References

1. https://www.slideshare.net/stubbornella/object-oriented-css/37-Avoid_redundancy
2. https://www.benmarshall.me/oocss-object-oriented-css/
3. https://www.slideshare.net/stubbornella/our-best-practices-are-killing-us