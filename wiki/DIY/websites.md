---
title: Websites
description: Websites should be simple to setup, easy to maintain, and fun.
---

Websites should be as simple as possible. For most people, they only need to be able to show text, images, and links to other things, all on a static site. These options are mostly going to be for those people.

## Github/Codeberg Pages[5-6]

If you upload raw HTML, CSS, and JS files to one of these {{git}} repos, it will render them as a static site at a specific URL. My personal website uses Jekyll as a way to render all of the pages (which is nice but a bit kludgy), but uses that same principle. This wiki uses my own software swiki[4], which renders everything out into raw HTML files.

The advantage this has is that you don't have to worry about a domain or hosting or anything. Disadvantage is you need to understand the basics of {{git}} to use it.

### Scripting

If you are technically inclined, then you can utilize {{shell scripting|shell}} to make building the pages simpler. I can't remember where I found this script, but someone I know online from [merveilles.town](https://merveilles.town) had this on their site and I thought it was genius:

```shell
#!/bin/sh

for p in posts/*; do
  echo "generating $(basename $p)..."
  cat blog/_header.html $p blog/_footer.html > blog/$(basename $p)
done
echo "done!"
```

By putting their files into a `posts` folder and rendering them out to a different place, they can simplify maintenance on their site by abstracting common parts like the header and footer. You can also use whatever converter for something like {{markdown}} or {{gemtext}}

## Lichen/WonderCMS[2-3]

These are both options that are "set it and forget it" once they've been installed on the hosting server. Obviously, that part is a bit tricky if you don't know how to do that, but if you have a technically inclined friend who can help, you should be off to the races.

SImplest explanation is that they are Wordpress or Squarespace if you were able to make them easier to use by stripping away the bloat.

Lichen uses {{gemtext}}, which is a format utilized by the gemini protocol. This is fairly constrained, but in a way that I find useful and nice. WonderCMS uses a WYSIWYG editor, so has more features, but I can only imagine runs into problems most WYSIWYG editors do.

## Server-Side Includes

This is definitely a situation for more tech-focused people. Server-side includes allows modularity in a website by modularizing parts of a webpage (the header, the footer, the navigation, etc.) and letting the server put them in your webpages when they are loaded. 

The user would need to log into the actual server that holds all these files to do any editing, so in this way it is very direct and simple, but is a real turn off for anyone who is daunted by this kind of workflow.

### How it works

For example, if you have a `head` page, you would make a file called something like `ssi-head.html`:

**ssi-head.html**

```html
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Webpage!</title>
</head>
```

And then include it in your pages like in this `example.shtml` (if you want to know why `shtml`, see [7]):

```html
<!--#include file="ssi-head.html" -->
<body>
  Some content
</body>
```

When a user pulls up `example.shtml` on your site, it will automatically populate your file with the contents of `ssi-head.html`.

## References

1. https://en.wikipedia.org/wiki/Server_Side_Includes
2. https://lichen.sensorstation.co/
3. https://www.wondercms.com/
4. https://codeberg.org/milofultz/swiki
5. https://pages.github.com/
6. https://codeberg.page/
7. https://www.andreas.com/faq-ssi.html
8. https://solar.lowtechmagazine.com//2018/09/how-to-build-a-lowtech-website/