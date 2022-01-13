---
title: Issues
description: Issues on open source projects should be clear and concise.
---

Issues on open source projects should be clear and concise.

## How To Ask a Good Question[2]

### Search, and research

...and keep track of what you find. Even if you don't find a useful answer elsewhere on the site, including links to related questions that *haven't* helped can help others in understanding how your question is different from the rest.

### Write a title that summarizes the specific problem

The title is the first thing potential answerers will see, and if your title isn't interesting, they won't read the rest. So *make it count:*

- **Pretend you're talking to a busy colleague** and have to sum up your entire question in one sentence: what details can you include that will help someone identify and solve your problem? Include any error messages, key APIs, or unusual circumstances that make your question different from similar questions already on the site.
- **Spelling, grammar and punctuation are important!** Remember, this is the first part of your question others will see - you want to make a good impression. If you're not comfortable writing in English, ask a friend to proof-read it for you.
- If you're having trouble summarizing the problem, **write the title \*last\*** - sometimes writing the rest of the question first can make it easier to describe the problem.

**Examples**:

- **Bad:** C# Math Confusion
- **Good:** Why does using float instead of int give me different results when all of my inputs are integers?
- **Bad:** [php] session doubt
- **Good:** How can I redirect users to different pages based on session data in PHP?
- **Bad:** android if else problems
- **Good:** Why does str == "value" evaluate to false when str is set to "value"?

### Introduce the problem before you post any code

In the body of your question, start by expanding on the summary you put in the title. Explain how you encountered the problem you're trying to solve, and any difficulties that have prevented you from solving it yourself. The first paragraph in your question is the second thing most readers will see, so make it as engaging and informative as possible.

### Help others reproduce the problem

Not all questions benefit from including code, but if your problem is *with* code you've written, you should include some. But **don't just copy in your entire program!** Not only is this likely to get you in trouble if you're posting your employer's code, it likely includes a lot of irrelevant details that readers will need to ignore when trying to reproduce the problem. Here are some guidelines:

- Include just enough code to allow others to reproduce the problem. For help with this, read [How to create a Minimal, Complete, and Verifiable example](https://stackoverflow.com/help/mcve).
- If it is possible to create a live example of the problem that you can *link* to (for example, on http://sqlfiddle.com/ or http://jsbin.com/) then do so - but **also copy the code into the question itself.** Not everyone can access external sites, and the links may break over time. Use [Stack Snippets](https://meta.stackoverflow.com/questions/358992/ive-been-told-to-create-a-runnable-example-with-stack-snippets-how-do-i-do) to make a live demo of inline JavaScript / HTML / CSS.
- **DO NOT post images of code, data, error messages, etc.** - copy or type the text into the question. Please reserve the use of images for diagrams or demonstrating rendering bugs, things that are impossible to describe accurately via text. For more information please see the Meta FAQ entry [Why not upload images of code/errors when asking a question?](https://meta.stackoverflow.com/a/285557)

### Include all relevant tags

Try to include a tag for the language, library, and specific API your question relates to. If you start typing in the tags field, the system will suggest tags that match what you've typed - be sure and read the descriptions given for them to make sure they're relevant to the question you're asking! See also: [What are tags, and how should I use them?](https://stackoverflow.com/help/tagging)

### Proof-read before posting!

Now that you're ready to ask your question, take a deep breath and read through it from start to finish. Pretend you're seeing it for the first time: *does it make sense?* Try reproducing the problem yourself, in a fresh environment and make sure you can do so using only the information included in your question. Add any details you missed and read through it again. Now is a good time to make sure that your title still describes the problem!

### Post the question and respond to feedback

After you post, leave the question open in your browser for a bit, and see if anyone comments. If you missed an obvious piece of information, be ready to respond by editing your question to include it. If someone posts an answer, be ready to try it out and provide feedback!

### Look for help asking for help

In spite of all your efforts, you may find your questions poorly-received. Don't despair! Learning to ask a good question is a worthy pursuit, and not one you'll master overnight. Here are some additional resources that you may find useful:

## Example Issue Format[1]

### Describe the bug

Include a clear and concise description of what the problem is, including what you expected to happen, and what actually happened.

### Steps to reproduce the bug

It's important that we are able to reproduce the problem that you are experiencing. Please provide all code and relevant steps to reproduce the problem, including your `BUILD`/`CMakeLists.txt` file and build commands. Links to a GitHub branch or [godbolt.org](https://godbolt.org/) that demonstrate the problem are also helpful.

### Does the bug persist in the most recent commit?

We recommend using the latest commit in the master branch in your projects.

### What operating system and version are you using?

If you are using a Linux distribution please include the name and version of the distribution as well.

### What compiler and version are you using?

Please include the output of `gcc -v` or `clang -v`, or the equivalent for your compiler.

### What build system are you using?

Please include the output of `bazel --version` or `cmake --version`, or the equivalent for your build system.

### Additional context

Add any other context about the problem here.

## References

1. https://github.com/google/googletest/issues/new?assignees=&labels=bug&template=00-bug_report.md&title=
1. https://stackoverflow.com/help/how-to-ask