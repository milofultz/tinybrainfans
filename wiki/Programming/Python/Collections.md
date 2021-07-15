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

## References

1. https://docs.python.org/3/library/collections.html#collections.defaultdict