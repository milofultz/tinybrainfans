---
title: Software Maintenance
description: Tools should empower others to live a better life. We should care about maintaining those tools.
---

"Go fast and break things" is a common cry of startups and the tech world in general, since hitting the market early will earn you an advantage. Unfortunately what this means about the *software* is that it's buggy, inaccessible to the differently abled, and difficult or impossible to maintain.

It's our responsibility as developers to stop this kind of behavior as early as possible. This is a disservice to everyone who uses or wants to use a product, and the market at large that will then have to race to the bottom at the expense of those who can't speak up.

> **Do you see designers as complicit in the conduct of the companies they operate within?**
>
> **Mike Monteiro**: Very, very complicit. All the stuff that Facebook does, all the stuff that Twitter does has to go through a designer at some point. About half of the designers I’ve talked to argue that they’re just a pair of hands doing what they were told to do. With that kind of attitude, I’m not surprised that we’re where we are today.[2]

Another angle to this is to vie for simplicity and orthogonality in the software you create:

- The scope is intentionally reduced, so unexpected behavior and edge cases and reduce exponentially.
- Others can use your software as it is made to do one thing well, not many things just okay.
- When (not if) something goes wrong, it can be easily fixed[3].

## CADT Model

A close relative to this is what Jamie Zawinski calls the "Cascade of Attention-Deficit Teenagers" model[1]. The order is usually the following:

1. Bugs are found and added to the bug tracker
2. Many weeks/months/years pass
3. Bug tickets from step 1 are closed because a new version is being developed
4. A new version is released without addressing the bugs from step 1
5. Repeat

> Fixing bugs isn't fun; going through the bug list isn't fun; but rewriting everything from scratch *is* fun (because "this time it will be *done right*", ha ha) and so that's what happens, over and over again.[1]

## References

1. https://www.jwz.org/doc/cadt.html
2. https://www.commarts.com/columns/move-slow-and-fix-things
3. http://stanleylieber.com/2022/04/03/0/
