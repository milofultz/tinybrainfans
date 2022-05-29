---
title: Recursion
description: Recursion is the act of calling a function within the function itself.
---

A recursive function is recursive when it calls itself within the function. Many, if not most, recursive functions can be done with looping and things like queues as well.

## Why?

While you can use loops on many problem spaces where recursion is available, there are certain situations where recursion is necessary. The main situation is when a data structure can have a child of the same type. 

For instance, if your list can contain lists, you can't know how deep you will have to check for nested lists, since it could be infinite. What if your 100th nested array has an array as a child? etc.

Another example is in a binary tree[2]. Since every binary tree can have children which are binary trees themselves, to traverse them properly, one must use recursion of some kind.

*Note: Depending on your language space, some of these situations could be done using a queue structure as well.*

## What Makes It Recursive

Recursive functions are composed of two elements:

- A base case
- A recursive case

The **base case** is how the recursive function will exit. For instance, if we are using a recursive function to iterate through a list, the base case should be triggered when there are no more elements left in the list. There can be multiple base cases.

The **recursive case** is what will be invoked as long as the base case is not met.

## Examples

If you run through any of the examples below by hand, you will see that the iteration examples can be done in one invocation or call to the function. You can iterate through and return the result all at once. With the recursive examples, you will find yourself with multiple unfinished invocations at once that each eventually resolve into smaller results that make up the final result.

### Find Fibonacci number[4] at position n

Using iteration:

```pseudocode
FUNCTION getFibonacciNumber(n)
	IF (n == 0)
		RETURN 0
	END IF
	
	SET lastFibonacciNumber to 0
	SET fibonacciNumber to 1
	WHILE (n > 1)
		SET nextFibonacciNumber to (lastFibonacciNumber + fibonacciNumber)
		SET lastFibonacciNumber to fibonacciNumber
		SET fibonacciNumber to nextFibonacciNumber
		DECREMENT n by 1
	END WHILE
	
	RETURN fibonacciNumber
END FUNCTION
```

Using recursion:

```pseudocode
FUNCTION getFibonacciNumber(n)
	/* Base Case */
	IF (n <= 0)
		RETURN 0
	ELSE IF (n == 1)
		RETURN 1
	/* Recursive Case */
	ELSE
		RETURN getFibonacciNumber(n - 1) + getFibonacciNumber(n - 2)
END FUNCTION
```

### Get the length of a linked list

Assume a linked list is made up of nodes:

```javascript
node1 = {
	value: 1,
	nextNode: /* address to next node or null */,
};

exampleList = [node0, node1, node2, node3];
```

Using iteration:

```pseudocode
FUNCTION getListLength(list)
	SET length to 0
	
	WHILE (list[length].nextNode != null)
		length += 1
	END FOR
	
	RETURN length
END FUNCTION

/* Example call */
getListLength(exampleList)
```

Using recursion:

```pseudocode
FUNCTION getListLength(list, length)
	/* The base case */
	IF (list[length].nextNode == null)
		RETURN length
	/* The recursive case */
	ELSE
    RETURN CALL getListLength(list, length + 1)
  END IF
END FUNCTION

/* Example call */
getListLength(exampleList, 0)
```

### Flatten all values of nested lists

This will take all values from all levels of lists and put them into the top level of a new list.

An example list:

```
exampleList = [
	[ [ 0, 1 ] ],
	[ [ 2 ], 3 ],
	4,
	[ [ [ 5 ] ] ],
]
```

Using iteration:

```pseudocode
FUNCTION flatten(list)
	SET flattenedList to []
	SET stack to list
	/* The "top" of the stack is the end */
	
	WHILE (stack is not empty)
		SET currentItem to item on top of stack
		POP item off top of stack
		IF (currentItem is an array)
			FOR (value in currentItem)
				PUSH value to top of list
			END FOR
		ELSE
			ADD currentItem to flattenedList
		END IF
	END WHILE
	
	REVERSE flattenedList
  
  RETURN flattenedList
END FUNCTION
```

Using recursion:

```pseudocode
FUNCTION flatten(list)
	SET flattenedList to []
	FOR (item in list)
		/* Base case */
		IF (item is not an array)
			ADD item to flattenedList
		/* Recursive case */
		ELSE
			CONCATENATE flatten(item) to flattenedList
		END IF
	END FOR
	RETURN flattenedList
END FUNCTION
```


## References

1. https://wiki.c2.com/?TailRecursion
2. https://en.wikipedia.org/wiki/Binary_tree
3. https://en.wikipedia.org/wiki/Recursion
4. https://en.wikipedia.org/wiki/Fibonacci_sequence