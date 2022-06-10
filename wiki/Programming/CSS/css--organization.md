---
title: Organization and Structure (CSS)
description: Miscellaneous notes and best practices on organization and structure in CSS.
---

Miscellaneous notes and best practices on organization and structure in {{CSS}}.

## Best Practices

### Keep it consistent

If you get to set the rules for the project or are working alone, then the most important thing to do is to keep things consistent. Consistency can be applied in all sorts of ways, such as using the same naming conventions for classes, choosing one method of describing color, or maintaining consistent formatting (for example will you use tabs or spaces to indent your code? If spaces, how many spaces?)

If you are working with a team on an existing project, the first thing to check is whether the project has an existing style guide for CSS. **The team style guide should always win over your own personal preferences**. There often isn't a right or wrong way to do things, but consistency is important.

### Organize Code with Comments

Adding comments to your CSS will help any future developer work with your CSS file, but will also help you when you come back to the project after a break. A good tip is to **add a block of comments between logical sections in your stylesheet** too, to help locate different sections quickly when scanning through, or even give you something to search for to jump right into that part of the CSS. **If you use a string which won't appear in the code you can jump from section to section** by searching for it.

```css
/* || General Styles */
...
/* || Utilities */
```

### Build Proficient Selectors

Don't use IDs in your {{selectors|Selectors (CSS)}}. This messes with the specificity and often breaks cascades. In general, in seems like it's best practice to stick with classes as your selectors.

Keep selectors short, since the longer they get, the more apt they are to break. If you create very specific selectors you will often find that you need to duplicate chunks of your {{CSS}} to apply the same rules to another element. Try to reduce nesting to two or three levels deep and remove as many location-based selectors as possible. Usually, these longer selectors are overkill and unnecessary. If you do find that you need to use a really specific selector, refactor it into a new manageable class.

### Use Shorthand Properties & Values

Do this to increase readability. If your shorthand `font:` property is not more readable, then it is not better. Shorthand properties can also introduce undesired resetting of properties (sometimes unrelated) back to their initial value.

```css
/* bulky, but clear */
p {
  font-family: sans-serif;
  font-size: 1.6rem;
  font-style: italic;
  font-weight: 400;
  line-height: 1.5;
}

/* cleaner, but not necessarily clearer */
p {
  font: sans-serif 1.6rem italic 400 1.5;
}
```

### Drop Units from Zero Values

```css
/* BAD */
margin: 0px 10px 0px 0px;
/* GOOD */
margin: 0 10px 0 0;
```

### Use The Right Measurement For The Right Job

I have read many different pieces of advice on this. Use `rem` for everything, use `em` for everything, don't use `px` ever, use `60ch` as the width of a page, etc. I do believe that using `rem` for everything may cause blowout of a page when zooming in a lot for accessibility, due to enormous borders, margin, etc. This is some advice I found online that seems to make sense:

- `px` for border widths, box shadows, etc. (decoration)
- `rem` or `em` for font sizes (`rem` for modular component-based layouts)
- `vw`/`vh`/`%` for layout and display specific rules, since they change with the browser size
- `rem` for font sizes and for margins and padding
- `ch` for things like paragraph text widths or sizing containers that will hold monospace fonts (50-70 chars wide is a common human-readable width, so aim for `60ch` in this case)
- `em` for media queries (e.g. `max-width: 40em` is equal to 640px with a font-size of 16px, but will scale if user has it set differently)
- `in`/`cm`/`mm` for print queries

### Group & Align {{Vendor Prefixes|Vendor Prefixes (CSS)}}

Keep them together and add whitespace to make the values aligned. 

When using vendor prefixes we need to make sure to place an unprefixed version of our property and value last, after any prefixed versions, to ensure the most desired setting loads last if possible.

```css
div {
  background: -webkit-linear-gradient(#a1d3b0, #f6f1d3);
  background:    -moz-linear-gradient(#a1d3b0, #f6f1d3);
  background:         linear-gradient(#a1d3b0, #f6f1d3);
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
}
```

### Modularize Styles for Reuse

Refactor names to fit their purpose and reduce hacky "fixes" to shoehorn stuff in to other class rules. Keep your code {{DRY|Don't Repeat Yourself}}!

### Break large stylesheets into multiple smaller ones

In particular in cases where you have very different styles for distinct parts of the site, you might want to have a stylesheet that includes all the global rules and then smaller ones that include the specific rules needed for those sections. You can link to multiple stylesheets from one page, and the normal rules of the cascade apply, with rules in stylesheets linked later coming after rules in stylesheets linked earlier.

## Structure / Formatting

### Create logical sections in your stylesheet

Using the ideas from 7-1 {{Sass}} architecture, we can create an organization that will allow us to organize our styles in a way that allows for a logical hierarchical cascade and easy management. The 7 sections are abstracts, vendors, base, layout, components, pages, and themes.

#### Media Queries

Note: media queries don't have an exact space so far as I have found, but there are a couple approaches:

-  for maintenance and modularity's sake, keeping them with the rest of the relevant rules feels logical.
- for the cascade, putting them at the end of their respective file before the utilities allows them to take priority over rules with similar specificity.

```css
.grid { 
  ...
}

@media (screen) and (max-width: 800px) {
  .grid {
    ...
  }
}
```

#### Abstracts

Abstracts are code that does not output {{CSS}} (variables, and in {{Sass}}, functions and mixins).

```css
/* || VARIABLES */

:root {
  --bg-color: #FFF;
  --text-color-primary: #000;
  --text-color-secondary: #888;
  --link-color: #F00;
  
  --font-sans: Helvetica, sans-serif;
  --font-serif: Times, sans-serif;
  
  --text-spacing-wide: .5px;
}
```

#### Vendors

This includes any third party stylesheets, like Bootstrap, or font imports like Google Fonts.

```css
/* || VENDORS */

@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap');
```

#### Base

Basic definitions like animations, default styles, typography, resets/normalizers and utilities like classes for center text, margin bottom, etc. It is a good idea to have all of the common styling early in the stylesheet so that all of these styles will generally apply unless you do something special with that element.

```css
/* || BASE STYLES */

/* | RESETS */

html {
  box-sizing: border-box;
}

*,
*::before,
*::after {
  box-sizing: inherit;
  margin: 0;
  padding: 0;
}

/* | ANIMATIONS */

@keyframes animationName {
  ...
}

/* | TYPOGRAPHY */

html {
  color: var(--text-color-primary);
  font-family: Helvetica, sans-serif;
}

h1, h2, h3, h4 { 
  ... 
}

a {
  ...
}

/* | UTILITIES */

.nobullets {
  list-style: none;
  margin: 0;
  padding: 0;
}
```

#### Layout

This could have styles for the main parts of the site (header, footer, navigation, sidebar, etc.), the grid system, or even {{CSS}} styles for all the forms. These are the "macro" components.

```css
/* || LAYOUT */

/* | HEADER */

.header {
  ...
}

/* | FOOTER */

.footer {
  ...
}

/* | GRID */

.grid {
  ...
}
```

#### Components

Modules that will be reused often throughout the project (buttons, forms, media boxes, etc.). These are the "micro" components in comparison to the layout.

```css
/* || COMPONENTS */

/* | BUTTON */

.button {
  ...
}

  .button--white {
    ...
  }

  .button--magenta {
    ...
  }
```

#### Page

These are styles specific only to the specific page you are on. Many times a home page will have different layouts than the blog or the about page. This is where you would put the styles for that specific page.

For a single stylesheet, this will likely be just another section as opposed to another file.

#### Theme

For large projects, this allows a plug-and-play way to change the theme of your site. Usually this is not used on smaller applications.

## Example CSS Skeleton / Template

```css
/* || ABSTRACTS */

/* || VENDORS */

/* || BASE */

/* || LAYOUT */

/* || COMPONENTS */

/* || PAGES */

/* || THEMES */
```

## References

1. https://learn.shayhowe.com/html-css/writing-your-best-code/
2. https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Organizing
3. https://www.reddit.com/r/css/comments/kzkthl/what_units_do_you_use_px_vw_and_vh_em_rem/
4. https://meyerweb.com/eric/thoughts/2018/06/28/what-is-the-css-ch-unit/
5. https://github.com/HugoGiraudel/sass-boilerplate/tree/master/stylesheets
6. https://www.learnhowtoprogram.com/user-interfaces/building-layouts-preprocessors/7-1-sass-architecture
7. https://www.freecodecamp.org/news/css-media-queries-breakpoints-media-types-standard-resolutions-and-more/