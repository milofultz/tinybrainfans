---
title: Pseudocode
description: Pseudocode is a way to devise and organize solutions to problems without worrying about implementation details.
---

Pseudocode is a way to devise and organize {{solutions to problems|Problem Solving}} without worrying about implementation details. The goal of using pseudocode to solve a problem is to create a code- or language-agnostic solution that can be understood within the problem domain. From John Dalbey[1]:

> In general the vocabulary used in the pseudocode should be the vocabulary of the problem domain, not of the implementation domain. The pseudocode is a narrative for someone who knows the requirements (problem domain) and is trying to learn how the solution is organized.

Eventually, you will be able to put this pseudocode into a project and essentially paint by numbers, filling in each line slowly and deliberately, {{testing your code|Test-Driven Development}} along the way.

## Types

There are only a few basic types of instructions or structures that need to be known or used to make effective pseudocode. These types are meant to be composed together and nested within each other when and if necessary.

Many of these types have explicit end statements for easier understanding at a glance where an instance of one type starts and ends. Notice also the use of indentation to aid in this understanding.

### Sequence

The sequence is the most basic building block of your pseudocode, made up of a series of instructions to be executed in order. These include most of your basic self-contained or self-descriptive functionality: `input`, `output`, `compute`, `initialize`, and `increment`/`decrement`. For example, the start of some pseudocode for making bread at a restaurant could be:

```pseudocode
GET next order from customer  # an 'input' instruction
CALCULATE materials needed    # a `compute` instruction
CREATE dough from ingredients # an `initialize` instruction
SET oven to 500 degrees       # another `initialize` instruction
```

### If/Then/Else

A series of discrete paths that can be taken based on whether each condition is true or not. Once a path matches, you skip to the end of the if block. If none match, you take the else path.

```pseudocode
IF the yeast is bubbling THEN
	Add the yeast to the dough mixture
ELSE IF the yeast is not bubbling AND you don't have time to go to the store THEN
	Make flatbread instead
ELSE 
	Go to the store and get more yeast
END IF
```

### Case

The case is akin to if/then/else. The difference between the two is that a case evaluates a single expression and executes the matching sequence.

```pseudocode
CASE yeast type OF
	instant   : SET yeast amount to 1.5 tsp
	active dry: SET yeast amount to 2 tsp
	sourdough : SET yeast amount to 0 tsp
END CASE	
```

### While

If the condition is met, do the enclosed instructions and return to the beginning when finished to check the condition again. Repeat this process until the condition is no longer met.

```pseudocode
WHILE dough is sticky to the touch
	Knead and fold dough three times
	Rotate 90 degrees
END WHILE
```

### Repeat Until

This is akin to while, except the condition, which is placed at the bottom, is tested *after* going through the instructions a single time. If you are doing any {{paper computing}} or {{assembly}}, this is conceptually more akin to what you will use in place of a while or a for loop. This is also known as a "do while" loop.

```pseudocode
REPEAT
	Knead and fold dough three times
	Rotate 90 degrees
UNTIL dough is not sticky to the touch
```

### For

A for loop will execute a set of instructions for each item within a group.

```pseudocode
SET number of loaves to 0
FOR each loaf of bread
	Slice each one inch segment from one end to the other
	Put sliced bread into paper bags
	Place on shelf for sale
	INCREMENT number of loaves by 1
END FOR
```

### Call

This is shorthand for calling another algorithm, subroutine, or set of instructions within the current set. In this example, we took the contents of the above for loop and placed them into another subroutine called `PackageBreadLoaf`.

```pseudocode
SET number of loaves to 0
FOR each loaf of bread
	CALL PackageBreadLoaf with this loaf of bread
	INCREMENT number of loaves by 1
END FOR
```

### Begin/Exception

If you want to handle something not going as expected, you can put those instructions inside of an exception block. If an exception (or error) occurs, you can add a set of instructions that will then execute. You want to use this if necessary items don't exist, or implicit expectations are not met.

If no exceptions are found, the exception block will be skipped. If an exception is found, we go **immediately** to that set of instructions, skipping all in between, and then halting the program.

```pseudocode
BEGIN
	IF the yeast is bubbling THEN
    Add the yeast to the dough mixture
  ELSE IF the yeast is not bubbling AND you don't have time to go to the store THEN
    Make flatbread instead
  ELSE 
    Go to the store and get more yeast
  END IF
EXCEPTION
	WHEN there is no yeast
		Go to the store and buy yeast
	WHEN there is no dough mixture
		Make the dough mixture first
	WHEN there is no store
		Make sourdough starter
END EXCEPTION
```

## Best Practices

Assume you are always writing instructions for an alien who knows very little to nothing about computers, your profession, the domain your work resides in, etc. (my personal go-to is imagining how to explain it to my mom). You want to be precise but not overly verbose. One good example is this guy trying to get his kids to give him instructions about how to make a sandwich[2]. As expected, the instructions aren't very precise and he does things "wrong", but he playing the role of the computer, a very dumb but very capable being, will have no intuition and needs extreme precision to produce desired results.

Avoid mathematical operators, equal signs, literal methods, data types, etc. Make it in plain language! We usually think we know what we're talking about, but we don't. Leaving us the wiggle room of implementation allows our brain to postpone these hard details until the end, which is 100% what we want to do. This also gives the added bonus of making our pseudocode available for non-tech people on the team, as their input and thoughts are still valuable and shouldn't be blocked out by something unnecessary.

## References

1. http://users.csc.calpoly.edu/~jdalbey/SWE/pdl_std.html
1. https://www.youtube.com/watch?v=Ct-lOOUqmyY