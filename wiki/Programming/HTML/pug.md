---
title: Pug
description: Pug is a templating engine for HTML.
---

Pug is a templating engine for {{HTML}} that allows you to write a simpler more condense webpage, as well as integrating {{Javascript}} to dynamically generate pages.

## Getting Started

Install it using {{NPM}}: `npm i -g pug-cli`. You can compile a Pug file directly, or by watching the file and it's dependencies for changes.

```bash
# compile the single file
pug filename.pug -o ./outputfolder
# watch the file and its dependencies for changes and compile on change
pug -w filename.pug -o ./outputfolder
```

## Syntax

Writing {{HTML}} in Pug is very similar to {{Emmet}} shorthand/selectors in {{CSS}}.

`element#id.class(attr="value" foo="bar") innerText`

```
header#header.header.header__wrapper
  .header__logo
    span
      img.header__logo-img(src="..." alt="Logo")
      |  Some text!
  h1 Company Name

//- outputs

//- <header id="header" class="header header__wrapper">
//-   <div class="header__logo">
//-     <span><img src="..." alt="Logo" /> Some text!</span>
//-   </div>
//-   <h1>Company Name</h1>
//- </header>
```

### Comments

```
// This comment will appear in the HTML

//- This is a silent comment

//-
  Nesting inside a comment creates
  a comment block
```

### {{Javascript}}

Any line that starts with a hyphen or anything that follows an equals sign in an attribute list can be valid Javascript.

```
- var num = 6;
- var name = "John Smith";

h1(data-name= name.replace(/\s/, '.').toLowerCase() )= `This guy is probably ${num} feet tall!`

//- outputs
//- <h1 data-name="john.smith">This guy is probably 6 feet tall!</h1>
```

#### Inserting HTML via Javascript

```
- var num = 6;
- var name = "John Smith";

- const john = `This guy is <i>probably</i> ${num} feet tall!`;
h1(data-name= name.replace(/\s/, '.').toLowerCase() )= !{john}

//- outputs
//- <h1 data-name="john.smith">This guy is <i>probably</i> 6 feet tall!</h1>
```

### Inline

```
h1: span.header Yeah!

//- Outputs
//- <h1><span class="header">Yeah!</span></h1>
```

### Multiline

```
p.
  This text can be broken 
  up on multiple lines
  
//- outputs
//- <p>This text can be broken
//-     up on multiple lines</p>
  
script.
  console.log('or here');
  // This works too.
```

### Self-Closing Tags

```
hr 
//- outputs <hr/>

foo/
//- outputs <foo/>
```

### Imports / Include

Pug allows import of HTML directly as well as Pug files.

```
include filename.pug
include another.html
```

### Variables

Variables in Pug are defined as they are in Javascript and should be preceded by a hyphen. Multiline variable definitions are done by starting a line with a hyphen, **leaving no whitespace**, and continuing indented on the next line. As long as the indentation remains, you will be in "Javascript land".

```
- var location = 'russia';
-
  var obj = {
    thing: "one",
    otherThing: "two",
  }

p= location
span(class= obj.thing) OK

//- outputs 

//- <p>russia</p>
//- <span class="one">OK</span>
```

### Conditionals

```
- var location = 'russia';
- var cold = true;

if location === 'los-angeles'
  p Party!
else if location === 'mexico'
  p MORE Party!
else if cold
  p cold party
else
  p no party
  
span= cold ? "Brr!" : "*panting*"
  
//- outputs 
//- <p>cold party</p>
//- <span>Brr!</span>
```

### Iteration

#### Arrays

```
- var items = ['candy', 'cake', 'ice cream'];

each item in items
  p.item(id= item.replace(' ', '-'))= item.toUpperCase()
  
//- outputs
//- <p id="candy" class="item">CANDY</p>
//- <p id="cake" class="item">CAKE</p>
//- <p id="ice-cream" class="item">ICE CREAM</p>
```

#### Objects

```
- 
	var people = {
		'John': 'Johnson',
		'Ashley': 'Ashtown',
	};

each last, first in people
  p= first + ' ' + last
  
//- outputs
//- <p>John Johnson</p>
//- <p>Ashley Ashtown</p>
```

## Sublime Text Syntax

Packages in {{Sublime Text}} are interdependent on each other and many of the default packages are inferior to third-party (e.g. Babel over Javascript). When Pug's Javascript syntax is not cooperating or popping to allow Pug's syntax to take over again, you can `Disable Package > Javascript` and install `Babel` and this will cause Pug to correctly highlight conditionals and the succeeding code.

## References

1. https://www.sitepoint.com/a-beginners-guide-to-pug/
2. https://pughtml.com/
3. https://devhints.io/pug
4. https://pugjs.org/language/conditionals.html
5. https://pugjs.org/language/includes.html
6. https://cssdeck.com/labs/learning-the-jade-templating-engine-syntax
7. https://stackoverflow.com/questions/27107451/how-to-insert-raw-html-in-pug-file-not-include-external-html-file