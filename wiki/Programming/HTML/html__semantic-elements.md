---
title: Semantic HTML
description: HTML without any styling or functionality should be readable and the user should easily be able to discern context about the content.
---

{{HTML}} without any styling or functionality should be readable and the user should easily be able to discern context about the content.

## Headings

Headings should be used for semantics only, **not** for font sizing ({{HTML}} for structure, {{CSS}} for styling).

Heading information can be used by user agents to construct a table of contents for a document automatically. 

Use only one `<h1>` per page or view. It should concisely describe the overall purpose of the content. Using more than one `<h1>` will not result in an error, but is not considered a best practice. Using only one `<h1>` is beneficial for {{screenreader users|Accessibility}}, and SEO. Avoid skipping heading levels: always start from `<h1>`, followed by `<h2>` and so on.

## References

1. https://developer.mozilla.org/en-US/docs/Web/HTML/Element/Heading_Elements