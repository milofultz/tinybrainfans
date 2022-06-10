---
title: PI AT PC Framework
description: The PI AT PC framework is my extrapolation of what I learned from Anthony Pecchillo at Hack Reactor.
---

The PI AT PC framework is my extrapolation of what I learned from [Anthony Pecchillo](https://github.com/anthonypecchillo) at [Hack Reactor](https://www.hackreactor.com/). 

## What is PI AT PC

PI AT PC is a mnemonic I have settled on that is slightly easier to remember than SJEVAVI or whatever they do at HR. I can imagine a a picture of a little pi symbol sitting at a computer in like 1994.

Don't be surprised if you end up having to go back multiple times to past steps to refine your idea. In fact, that is the very point of this exercise, to discover the things we didn't know about the problem we were trying to solve.

## The Steps

### P - understand the Problem

Ensure you fully understand and grasp the problem. Try and replace any and all gooshy elements (e.g. pronouns, not-specific-enough words, anything vague) with a more clear revision. Can you express your problem clearly to somebody else? Can you write down the problem that is *precise*? Can you state your problem in a way that removes all unnecessary work when you are searching for a solution?

### I - IOCE the problem

IOCE is big thing at Hack Reactor, standing for Inputs, Outputs, Constraints, and Edge cases. This is simpler for coding problems, but is still useful outside of it in bounding the problem and reducing the complexity of your desired solution.

- Inputs - identify what dynamic elements will exist at the start of a problem.
- Outputs - what is expected (finished, completed, output) when the problem is solved.
- Constraints - what constraints and boundaries exist within the problem space, or what can't be done/must be done.
- Edge Cases - if there is a happy path where all inputs and dynamic elements are as expected, then the edge cases encompass the unhappy paths. If you are making an adding machine, getting an input that is not a number would be an edge case, and you might handle it by sending an error to the user. If you are making pizzas, getting an order for a sub sandwich would be an edge case, and you might handle it by saying "we don't do that". I find it's most useful to just brainstorm every possible idea, even if it ends up not being true later.

### A - figure out the Assumptions within the problem

What can be assumed as true about this problem or within the problem space? About the input, output, constraints, or edge cases? This is where you can further probe for the bounds of the problem so you don't have to solve more problems or cases than necessary, similar to the edge cases above.

### T - create Tests

How can you test that you have a solution and that it works? How can you test that the cases you know *won't* work *didn't* work? How can you test the edge cases? Be thorough, as {{a test that is not definitive is useless|Test-Driven Development}}.

### P - create {{Pseudocode}}/use Plain language

How would you describe a possible solution to someone without using jargon? Without knowing any technical knowledge, how would you describe how to solve this problem to another person?

This is also the step where you are brainstorming possible ways to solve the problem. But the big picture is that you **must** be able to speak about your problem simply. If you can't, there is a chance that you don't actually understand how the thing you are proposing would work, and knowing how your solution works is paramount in actually being able to implement it later.

An example of this would be creating an adding machine. The pseudocode for something like this should be written that someone without almost any prior knowledge of how it would be implemented could still do it.

```
Get first number from user
Get second number from user
While the second number is greater than zero
  Subtract one from the second number
  Add one to the first number
Return the first number to the user as the final sum
```

The above pseudocode could be implemented in {{assembly}}, {{Javascript}}, a {{paper computer|Paper Computing}}, an abacus, or paper and pencil or just two hands.

### C - Code/Create your solution

This is when you use your {{pseudocode}} or plain language solution you created above. Go step by step, solving each step as simply and easily as you can. If you discover you can't make something work, you may need to do the PI AT PC process all over again for one of these sub steps.