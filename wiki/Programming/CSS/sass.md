---
title: Sass
description: Sass is a CSS preprocessor that allows a lot more ease in maintainability and gives much deeper modularity than CSS normally provides.
---

Sass is a {{CSS}} preprocessor that allows a lot more ease in maintainability and gives much deeper modularity than CSS normally provides. Sass is a language that compiles into CSS, most often used in it's `.scss` variant, as it is much more similar to normal CSS than its counterpart (`.sass`).

## Setup/Meta

### Install Sass

On {{Mac|MacOS}}, use `brew install sass/sass/sass` to install the newest version of Sass on your machine.

### Command Line Options

- `path/to/input.scss:path/to/output.css` - Compile the input file to output file
- `path/to/inputfiles/:path/to/outputfiles/` - Compile any SCSS files within input directory to output directory as CSS 
- `--watch path/to/input.scss:path/to/output.css` - Continuously watch the input file and compile it on change to output  file
- `--watch path/to/inputfiles/:path/to/outputfiles/` - Continuously watch the input directory and compile any SCSS files within to output directory as CSS on change
- `-v` - Output the current version that is being run
- `--sourcemap=none` / `--no-source-map` - Don't output a source map on compile (former for Ruby Sass, latter for Dart Sass

## Syntax

### Comments

Comments are done using the standard Javascript syntax: `//` and `/* */` for multiline.

### Variables

Variables, like `--variable` in CSS3, are done by prepending the variable name with a dollar sign

```scss
$variable-name: value;
```

When variables are used in a `calc` function, the variable needs to be surrounded by `#{ }`.

```scss
width: calc(100% - #{$variable});
```

### Nesting

Instead of writing many specific selectors, you can use nesting to enclose selectors that are children of other selectors. Using an ampersand before a nested selector will write out the selector that is in use at that point in its place when compiled.

Nesting is extremely useful in {{BEM}}, as the otherwise long and ugly class names become much more easy to read and navigate. In Sass, the `&` is shorthand for the entire selector at that point.

```scss
// bad
.block { ... }
.block--modifier { ... }
.block__element { ... }
.block__element:hover { ... }
.block__element--modifier { ... }

// good
.block {
  ...
  
  &--modifier {  // & === `.block`
    ...
  }
  
  &__element {
    ...
    
    &:hover {
      ...
    }
    
    &--modifier {
      ...
    }
  }
}
```

### Mixins

Mixins are a group of declarations or rules that can be reused throughout by copying their contents into a rule. They can also include parameters for dynamic value generation. The `mixin` is defined by using `@mixin` and then called with `@includes` and the name.

**NOTE: You have to `@import` (not `@use`) the mixin partial to every file that uses it.**

```scss
// with mixin using parameters
@mixin box-shadow($x, $y, $blur, $c){
 -webkit-box-shadow: $x $y $blur $c;
    -moz-box-shadow: $x $y $blur $c;
     -ms-box-shadow: $x $y $blur $c;
         box-shadow: $x $y $blur $c;
}
```

Another file:

```scss
@import 'path/to/mixin';

div {
 @include box-shadow(0px, 0px, 4px, #fff);
}

// compiled result
div {
 -webkit-box-shadow: 0px 0px 4px #fff;
    -moz-box-shadow: 0px 0px 4px #fff;
     -ms-box-shadow: 0px 0px 4px #fff;
         box-shadow: 0px 0px 4px #fff;
}
```

### Functions

Functions are created by using `@function` with a name and a parameter list. Inside the function, a `@return` is required. It is common when a raw number is returned to multiply it by `1 * unit`, with unit being px, em, etc.

```scss
@function divide($a, $b) {
  @return $a / $b;
}

// called
p {
  margin: divide(60, 2) * 1px;
}
```

### Conditionals

`@if`, `@else if`, and `@else` are what they sound like and are used within a `mixin`.

```scss
@mixin make-bold($bool) {
  @if $bool == true {
    font-weight: bold;
  }
}

@mixin text-effect($val) {
  @if $val == danger {
    color: red;
  }
  @else if $val == alert {
    color: yellow;
  }
  @else if $val == success {
    color: green;
  }
  @else {
    color: black;
  }
}
```

### Iteration

For loops *including* the last number, use `through`. For loops *excluding* the last number, use `to`.

```scss
@for $i from 1 through 12 {
  .col-#{$i} { width: 100%/12 * $i; }
}

@for $i from 1 to 13 {
  .col-#{$i} { width: 100%/12 * $i; }
}
```

For each loops are done with `@each`.

```scss
@each $color in blue, red, green {
  .#{$color}-text {color: $color;}
}

//alternative
$colors: (color1: blue, color2: red, color3: green);
@each $key, $color in $colors {
  .#{$color}-text {color: $color;}
}
```

While loops are done with `@while`.

```scss
$x: 1;  /* define variable `x` as 1 */
@while $x < 13 {
  .col-#{$x} { width: 100%/12 * $x;}
  $x: $x + 1;
}
```

### Imports/Partials

You can create separate stylesheets and import them in to your main sheet.

Partials are what will be **imported** into the main sheet. These filenames start with an underscore and end with `.scss`.

Depending on the version of Sass that is being used, they use `@import` or `@use` followed by the partial enclosed in single quotes *without* the underscore or the extension. (`@import` is being phased out, so if you can, use `@use`)

```scss
// partial file is at fp "./base/_base.scss"

// if using Dart Sass:
@use 'base/base';
// else
@import 'base/base';
```

https://www.freecodecamp.org/learn/front-end-libraries/sass/split-your-styles-into-smaller-chunks-with-partials

### Extending Rules

Rules can be extended from one element to another one through copying the rules and then further modification (`header` -> `small-header`). `@extend` followed by the original selector. Extend can also be used on a placeholder rule, defined by using a preceding `%`. 

[**Extensions should be used only when the elements it is extending are inherently and thematically related, but extend is generally not advised because you will be "distributing selectors across [your] codebase for purely circumstantial reasons", leading to bloated and difficult to maintain code.**](https://csswizardry.com/2014/11/when-to-use-extend-when-to-use-a-mixin/)

The difference between this and a mixin is instead of bringing *code into another rule*, we are bringing the *selectors that include the extend command to the rule*.

```scss
%panel {
  background-color: red;
  height: 70px;
  border: 2px solid green;
}

.big-panel {
  @extend %panel;
  width: 150px;
  font-size: 2em;
}

.long-panel {
  @extend %panel;
  width: 1000px;
}

// compiled result
.big-panel,
.long-panel {
  background-color: red;
  height: 70px;
  border: 2px solid green;
}

.big-panel {
  width: 150px;
  font-size: 2em;
}

.long-panel {
  width: 1000px;
}
```

## References

1. https://www.udemy.com/course/advanced-css-and-sass
2. [https://www.freecodecamp.org/learn/front-end-libraries/sass/](https://www.freecodecamp.org/learn/front-end-libraries/sass/use-if-and-else-to-add-logic-to-your-styles)
3. https://sass-lang.com/documentation/at-rules/import
4. https://sass-lang.com/documentation/at-rules/use
5. https://sass-lang.com/guide