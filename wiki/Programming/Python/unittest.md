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

## Mocking Input

To mock a call to `input`, you can utilize `mock` in the `unittest` library. The `patch` decorator allows you to specify a default return.[4]

```python
import unittest
from unittest.mock import patch


def answer(input=input):
    ans = input('enter yes or no')
    if ans == 'yes':
        return 'you entered yes'
    if ans == 'no':
        return 'you entered no'


class Test(unittest.TestCase):
    # get_input will return 'yes' during this test
    @patch('builtins.input', return_value='yes')
    def test_answer_yes(self, input):
        self.assertEqual(answer(input=input), 'you entered yes')

    @patch('builtins.input', return_value='no')
    def test_answer_no(self, input):
        self.assertEqual(answer(input=input), 'you entered no')
```

## References

1. https://docs.python.org/3/library/unittest.html
1. https://docs.python.org/3/library/unittest.html#skipping-tests-and-expected-failures
1. https://stackoverflow.com/questions/2066508/disable-individual-python-unit-tests-temporarily
1. https://stackoverflow.com/questions/21046717/python-mocking-raw-input-in-unittests