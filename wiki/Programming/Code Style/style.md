---
title: Code Style Best Practices
description: 
---

Having ruthless consistency across a project makes it easy to hunt down problems and allows people to read the code faster[2]. Using tools like linters ({{ESLint}}, StyleLint, etc.) and preprocessors ({{Sass}}, {{Pug}}, etc.) can aid with this.

There are different areas of code style, but anything handled via a linter or preprocessor should be to reduce cognitive load.

## Common Practices

- Utilize vertical over horizontal space to aid readability
- Prefer being explicit over implicit (don't be clever)
- Constants use all caps in snake case: `FRAMES_PER_SECOND`
- Classes have first letter capitalized: `User`
- Avoid global variables

Whatever you do, just make it consistent.

## Naming

Naming things is said to be one of the hardest things in computer science[6], and there's a reason that idea persists:

> When 334 developers were asked to choose 47 variable names, the median  probability that two would choose the same name was just 6.9%.[7]

This means given the same context and workspace, programmers ended up having a more or less 1 in 15 chance of naming things the same way. Add this to the already notoriously bike-shed-y space of code style and you can have some wildly different code between people, which will make understanding very difficult across different developers.

### Naming Molds

> [D]evelopers chose much better names if they consciously first decided what concepts they’d wanted to include, and then selected the words best representing those concepts. (And in addition, “Respondents who were  coached with the model tended to use longer names with more concepts.”)
>
> “As a team, you can talk about ‘name molds’. You can say, ‘Okay, what do we do? Do we always do the quantifier in the beginning, or at the end? What is our plan here?’ Hermans summarized.[7]

Settling on this as part of your extended code style or project planning minimizes the cognitive overhead a developer must have to understand a given concept and make people feel a little more at home in somebody else's space. When it comes to mission critical situations, this can mean real time and money saved, as well as long-term bugs averted.

> We are really trying to balance two competing goals:
>
> 1. Brevity -- Don't explain what I already know.  You mention this in  relation to a tight loop variable: "I bet you didn’t need me to explain  dL stood for Drivers License. It might have even annoyed you if I had  spelled it out."
>
> 2. Clarity -- Don't confuse me.  Don't make me look something up to figure it out.
>
> Maximize brevity while retaining clarity.[5]

> It's all about managing entropy. Less surprising means you can use fewer letters. More surprising means more letters.[5]

## References

1. https://web.archive.org/web/20060221013853/https://thc.org/root/phun/unmaintain.html
1. https://www.youtube.com/watch?app=desktop&v=a0glBQXOcl4
1. https://stackoverflow.com/questions/1722112/what-are-the-most-common-naming-conventions-in-c
1. https://www.joelonsoftware.com/2005/05/11/making-wrong-code-look-wrong/
1. https://news.ycombinator.com/item?id=31436814
1. https://nitter.net/timbray/status/817025379109990402?cn=cmVwbHk%3D
1. https://thenewstack.io/best-practices-for-naming-variables-what-the-research-shows/
