---
title: Itertools (Python)
description: Resources on how to use the itertools Python package.
---

Resources on how to use the itertools {{Python}} package.

## itertools.product()

Avoid using nested for loops to iterate through multiple different lists or numbers

```python
for var1 in xrange(min1,max1,step1):
  for var2 in xrange(min2,max2,step2):
    ...
      ...
        ...
          for var6 in xrange(min6,max6,step6):
            '''
            Do something and be icky in the process due
            to being in the middle of six nested for loops
            '''
x1 = xrange(min1,max1,step1)
x2 = xrange(min2,max2,step2)
x3 = xrange(min3,max3,step3)
...
for v1, v2, v3, v4, v5, v6 in itertools.product(x1, x2, x3, x4, x5, x6):
  icky_thing(....)
```

## References:

1. https://stackoverflow.com/questions/11174745/avoiding-nested-for-loops