---
title: Gemtext
description: Gemtext is a markup language used by the Gemini protocol.
---

All different types of markup should be separated by a blank line. e.g. there should be a line between a paragraph and links, links and headings, etc. Much of this is similar, but not the same, as {{markdown}}.

## Headings

A heading is preceded by either one, two, or three hashes, with one being the most prominent, and a space before the text.

```
# Heading 1

## Heading 2

### Heading 3
```

## Text

A paragraph is one or more lines with no blank lines between them.

```
This is a very long line that would turn into it's own paragraph, even if it went forever and was still all on one line.

This is NOT a very long line.
BUT
it would still turn into it's own paragraph,
even if it had a billion lines, since each
of these lines are not separated by a blank
line.
```

The last paragraph would render as a paragraph **including** the line breaks, e.g.

```html
<p>
  This is NOT a very long line.<br/>BUT<br/>it would still turn into it's own paragraph,<br/>even if it had a billion lines, since each<br/>of these lines are not separated by a blank<br/>line.
</p>
```

## Links

Links are comprised of the `=>` symbol, the link, and an optional human-friendly label.

```
=> http://example.com
=> http://www.zombo.com The best website in the world
```

## Lists

List items are preceded by asterisks.

```
* One axle
* Six wagon wheels
* Five rations
```

## Blockquotes

Blockquotes are preceded by `>` and must be on a single line.

```
> This is an example of a blockquote.
```

## Preformatted/Code Blocks

Three backticks precede and succeed a block of preformatted text. Anything within this block will not be rendered as gemtext, but as raw text.

    ```
    # This could be some code or something
    #!/bin/sh
    
    echo "hooray!"
    ```

## References

1. https://gemini.circumlunar.space/docs/gemtext.gmi
