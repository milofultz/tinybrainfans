---
title: Problem Solving
description: Solving big problems is just solving problems.
---

Solving big problems is just solving problems.

## Solving Larger Problems

Solving problems is the **ability to break problems into smaller problems**. Even if you don't instantly know how to solve it, and say "well, I'm probably going to need to do X and then Y", and can **repeat that process for those sub-problems until you either know how to solve it, look it up, or ask someone**.


## Aptitude != Knowledge

**The common thing to confuse "aptitude" with is "knowledge"**.  I also talk about this when discussing interviewing with colleagues: many interviews check for "knowledge" (what does this function do? what is a hash? what does "{{CSS}}" stand for?) because it's easy to do and (presumably) because people mistakenly consider it a good heuristic for whatever makes someone a good developer.  However, in general, **"knowledge" is easy to get** - go read wikipedia or a book or some documentation and memorize it.  **It's also not very useful** - if you don't know something, go look it up!  It helps because it makes you faster (not having to look everything up is why CPUs have instruction caches), and it might more quickly lead you toward a better solution (if you know several approaches already, you can more quickly consider which would be best), but much more important is "aptitude".  **It's much harder to teach someone how to think**.

## Boring is Best[2,3]

>  Boring and predictable are *expected qualities of the essential*.

Boring means simple. Simple means maintainable. Maintainable gives longevity and reliability to your solution. No need to reinvent the wheel if you have a long lasting and reliable solution. Keep it boring.

## Incident Reviews

Sort of a reverse problem solving; when presented with a problem that has already gone wrong in an organization, there is a need to figure out what can be done to ensure that it won't happen again. However, this path is **rife** with bias and  problematic thought processes and behaviors. 

From Fred Hebert's great article[4], this is a small and incomplete summary of things one can be aware of to avoid these pitfalls:

- [Hindsight Bias](https://en.wikipedia.org/wiki/Hindsight_bias)
- [Counterfactual Thinking](https://en.wikipedia.org/wiki/Counterfactual_thinking) - Whenever we say *"oh, if we had done this at this point in time instead of that, then the incident would have been prevented."*, [we're] talking about a fictional universe that never happened, and they're not productive.[4]
- [Normative Statements](https://en.wikipedia.org/wiki/Normative_statement) - *"The engineer should have checked the output more carefully, and  they shouldn't have run the command without checking with someone else,  as stated in the procedure."* Well they did because it arguably looked reasonable at the time!

> [T]he focus should be on understanding the mess:
>
> - go for a deeper understanding of specific incidents where you feel  something intriguing or interesting happened. Aggregates of all  incidents tend to hide messy details, so if you have a bunch of reviews  to do, it's probably better to be thorough on one interesting one than  being shallow on many of them
> - Mental models are how problem solving tends to be done; we  understand and predict things based on them. Incidents are amazing  opportunities to correct and compare and contrast mental models to make  them more accurate or more easy to contextualize
> - seek an understanding of how people do their work. There is always a gap between the work as we imagine it to be and what it actually is.  The narrower that gap, the more effective our changes are going to be,  so focusing on understanding all the nitty gritty details of work and  their pressures is going to prove more useful than having super solid  numbers
> - psychological safety is always essential; the thing that lets us  narrow the gap between work as done and work as imagined is going to be  whether people feel safe in reporting and describing what they go  through. Without psychological safety and good blame awareness, you're  going to have a hard time getting good results.
>
> Overall, the idea is that looking for understanding more than causes opens up a lot of doors and makes incidents more valuable.

## References

1. https://www.reddit.com/r/adventofcode/comments/7kd8jt/what_would_you_say_are_the_minimal_skills_for/dre0uu3/
1. https://jlwagner.net/blog/make-it-boring/
1. https://amivora.substack.com/p/to-make-something-simple-make-it?s=r
1. https://ferd.ca/errors-are-constructed-not-discovered.html