---
title: Typing
description: There are a few kinds of "typing", as it pertains to programming languages.
---

## Static vs. Dynamic

This refers to how the programming language manages variables. **Static** typing is when types are checked at **compilation** and **dynamic** is when types are checked at **runtime**. 

For instance, in {{C}}, you must instantiate your variables with a type, so the compiler knows what to do with it. This is **static**. But in {{Python}} or {{Javascript}}, since you don't have to initialize variables with a type, you can put a string into a variable that once held a number. If it works at runtime, it works. This is **dynamic**.

## Strong vs. Weak

This refers to how types can be converted. In **strongly typed** systems, only **explicit conversions** are allowed. In **weakly typed** systems, **implicit conversions** are okay. Or another way, in a strongly typed system, "you cannot work around or subvert the type system"[2].

For instance, in {{Ruby}} or {{TypeScript}}, if you try and run `"1" + 1`, it will throw a TypeError. But in {{vanilla Javascript|Javascript}}, you can do `"1" + 1`, or even `"1" + []`, and it will implicitly figure out "what you wanted".

## Duck Typing

Duck typing is where instead of determining what types are allowed or disallowed to be input in a given class or function, "the set of methods and properties determine the valid semantics"[1]. 

For instance, in {{Python}} or {{Ruby}}, if you wanted to handle either a single name or a list of names in a duck typing system, you could use conditionals for "if input is a string" and "else if input is a list", and then manage the types that way. In a non-duck typing system, if the function expected a string and you passed in a list, the function would throw an error because it would be expecting a certain type for the input.

## References

1. https://www.koffeinfrei.org/2012/03/19/static-vs-dynamic-vs-strong-vs-weak-vs-duck-typing/
2. https://stackoverflow.com/questions/430182/is-c-strongly-typed
