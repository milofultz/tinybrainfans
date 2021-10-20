---
title: Unittest
description: Unittest is a built-in testing framework for Python.
---

`unittest` is a built-in {{testing framework|Testing}} for {{Python}}.

## Getting Started

Create a new file in the same folder as your program called `filename.test.py`. Import `unittest` as well as the main program in the test file.

```python
import unittest
import my_program
```

Once you have these, you can create test cases and unit tests within them. The test cases are subclasses of `unittest.TestCase`, and the unit tests need to be named `test_` followed by whatever naming you want to use. Any method that does not start with `test_` will not be run.

`setUp` and `tearDown` run at the beginning and end of each unit test. `setUpClass` and `tearDownClass` run at the beginning and end of each test case.

```python
class WidgetTestCase(unittest.TestCase):
  	def setUpClass()
  
    def setUp(self):
        self.widget = Widget('The widget')
        
    def tearDown(self):
				pass

    def test_default_widget_size(self):
        self.assertEqual(self.widget.size(), (50,50),
                         'incorrect default size')

    # You can disable tests by using this decorator
    @unittest.skip("reason for skipping") # reason is not necessary
    def test_widget_resize(self):
        self.widget.resize(100,150)
        self.assertEqual(self.widget.size(), (100,150),
                         'wrong size after resize')
```

You can run your test suite by running `python3 -m unittest` in the root directory of the program. This will search for files using `unittest` within the current directory.

## References

- https://docs.python.org/3/library/unittest.html
- https://docs.python.org/3/library/unittest.html#skipping-tests-and-expected-failures
- https://stackoverflow.com/questions/2066508/disable-individual-python-unit-tests-temporarily