---
title: Numpy
description: Numpy is a math library that brings in lots of higher-level math functionality to Python.
---

This is the standard way to import Numpy into your {{Python}} project, and it's good practice.

```python
import numpy as np
```

## Arrays

If modifying the array, ensure you make a copy of the array through `copy.deepcopy`

```python
import numpy as np
import copy
arr = np.array([1,2,3])
a = copy.deepcopy(arr)
```

### Make a multidimensional array

```python
# 3D
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
result = np.array(arr)
# 2D
arr = [ [1,2,3,4], [5,6,7,8], [9,10,11,12] ]
result = np.array(arr)
# 3D
arr = [ [ [1,2], [3,4] ], [ [5,6], [7,8] ], [ [9,10], [11,12] ] ]
result = np.array(arr)
```

### Make a multidimensional array filled with something

```python
# returns a 3x5 2D array filled with '.'s
arr = np.full((3, 5), '.')
```

### Get length of each side 

```python
np.size(array_name, axis_number)
print('Axis 0 size : ', np.size(arr3D, 0))
print('Axis 1 size : ', np.size(arr3D, 1))
print('Axis 2 size : ', np.size(arr3D, 2))
```

### Accessing elements

1D Arrays can be accessed via indexing just like an array. 2D and higher use a slightly different syntax. 

Axes are represented as (Y, X) in 2 dimensional arrays, as in (row, column).

```python
# 2D
arr = [ [1,2,3,4], [5,6,7,8], [9,10,11,12] ]
element = arr[0,0] # 1
element = arr[1,2] # 7
```

### Iteration

To iterate through every element within the array, going through all dimensions:

```python
import numpy as np
arr = np.array([[[1, 2], [3, 4]], [[5, 6], [7, 8]]])
for x in np.nditer(arr):
    print(x)
```

If you want indexes enumerated over also, as a tuple:

```python
for index, x in np.ndenumerate(arr):
    print(index, x)
```

## References:

1. https://numpy.org/doc/stable/reference/generated/numpy.full.html
2. https://stackoverflow.com/questions/5891410/numpy-array-initialization-fill-with-identical-values
3. https://thispointer.com/how-to-get-numpy-array-dimensions-using-numpy-ndarray-shape-numpy-ndarray-size-in-python/
4. https://www.w3schools.com/python/numpy_array_indexing.asp
5. https://www.sharpsightlabs.com/blog/numpy-axes-explained/
6. https://stackoverflow.com/questions/17079279/how-is-axis-indexed-in-numpys-array
7. https://stackoverflow.com/questions/37593013/deep-copy-of-a-np-array-of-np-array