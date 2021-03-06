---
title: Debugging
description: Debugging is efficiently determining the problem and devising a solution for your program.
---

Debugging is efficiently determining the problem and devising a solution for your {{program|programming}}.

## Two sides of a bug

1. The **cause**: some line or lines where your code is written in a way that leads to problems
2. The **symptoms**: program state, output - An undesired program state or output that you expected to be different than what you see the computer producing. Could be a function manipulating data wrong or a variable holding unexpected values.

## Different kinds of bugs

- **Syntactic error**: Whether or not your plan was good, a typo makes code unreadable to your interpreter.
  - Symptom: Syntax error, program won't start
  - Solution: go to line mentioned and fix typo
- **Semantic error**: what you wrote did not do what you think it did. The interpreter used what you put, but  what you gave was not what you, or maybe what the interpreter, expected.
  - Symptom: usually an error thrown later in the program, usually not where you wrote the error
  - Solution: Find the misstatement in your code
- **Logical error**: The step by step plan you developed for solving the problem is somewhat misconceptualized or vague.
  - Symptom: the program throws an exception or produces undeired output
  - Solution: find the misconception in your plan

## Goalposting

This is a variant on Divide and Conquer. When experiencing a bug, the first step is to set goal posts around the code that could possibly be a problem. From whichever direction you believe is most beneficial, test if an area is acting as expected using logging or a debugger or whatever. If it is, the goal post may be moved to that area, as we know it is doing what we expect. You should not move the goal post past anything you have not yet tested.

## References

1. https://www.hackreactor.com/prep-programs