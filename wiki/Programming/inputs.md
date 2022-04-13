---
title: Input Hygiene
description: Ensuring the inputs of your user-facing forms (and others) work as expected for everyone is crucial.
---

A few people who always get screwed by badly validated forms:

- Christopher Null[1] - Since `null` is a reserved word in most languages, Christopher would often be unable to register for things because his last name was assumed to mean the *absence* of a last name.
- Shannon O'Neill - If you're using {{React}} and {{Javascript}} (and you are a brginner programmer who isn't good at making forms 🙋‍♀️), not escaping your quotes will make it so that she won't be able to register for an account at your office. Apparently this happens with Alaska Airlines, too, so maybe not just beginner programmers.
- S. Qiouyi Lu[2] - Last names can be two letters long, and validating for too short of a name can cause these kinds of issues. What cultures exist that we aren't aware that maybe have one character? Not to mention that a first name can be multiple space-delimited strings, and have a period in it.[3-4]
- Any name from this article[4]
- Bobby Tables[5]

## References

1. https://www.wired.com/2015/11/null/
1. https://nitter.net/sqiouyilu/status/1495971335578832898
1. https://shinesolutions.com/2018/01/08/falsehoods-programmers-believe-about-names-with-examples/
1. https://uxmovement.com/forms/why-your-form-only-needs-one-name-field/
1. https://xkcd.com/327/