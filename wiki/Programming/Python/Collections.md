---
title: Collections (Python)
description: These are some resources on how to use the collections Python package.
---

These are some resources on how to use the collections {{Python}} package.

## defaultdict(type)

```python
from collections import defaultdict

counter = defaultdict(int)
counter["sheep"] += 1
print(counter["sheep"])  # 1
print(counter["dog"])  # 0
```

Will allow builtin methods based on the default type. `defaultdict(int)` will allow a `+= 1` on any key and it will be defined immediately if doesn't exist; `(set)` will allow `.add(value)` to a set and will create it if none exists, etc.

## deque

```python
from collections import deque

cards = [1,2,3,4]
deck = deque(cards)

top_card = deck.popleft()
deck.append(top_card)

# cards == [2,3,4,1]
```

If you need a copy of the deque, you will need to import the `copy.deepcopy` method, as slices don't work. If you need to slice, you can use `itertools.islice`.

Note that if you are looking for a queue, you can use a standard list as a queue by using `list.pop(0)` and `list.append(item)`. It is much faster and requires no imports.

## References

1. https://docs.python.org/3/library/collections.html