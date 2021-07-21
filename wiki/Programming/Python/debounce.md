---
title: Debounce (Python)
description: How to create and use a debouncer in Python.
---

How to create and use a {{debouncer|Debounce}} in {{Python}}.

In both of these examples, the inner function won't run until at least DEBOUNCE_TIME seconds has passed.

## Standalone

```python
from threading import Timer
import time

DEBOUNCE_TIME = 1  # 1 second
debounced_action = None


def debounce_action(message: str) -> None:
    """ Print the last message to be invoked within a certain amount of time """
    global debounced_action

    def print_message():
        print(message)
    
    if debounced_action:
        debounced_action.cancel()
    debounced_action = Timer(DEBOUNCE_TIME, print_message)
    debounced_action.start()


if __name__ == "__main__":
    debounce_action("Won't print this one")
    time.sleep(.5)
    debounce_action("Or this one")
    time.sleep(.99)
    debounce_action("This one will though!")
```

The benefit of using this standalone is that you can have multiple items debouncing with the same inner function and different parameters by using a dict to store the different `debounced_action`s instead of using a singular global.

## Decorator

```python
from threading import Timer
import time

DEBOUNCE_TIME = 1


def debounce(wait):
    """ Decorator that will postpone a functions
        execution until after wait seconds
        have elapsed since the last time it was invoked. """
    def decorator(fn):
        def debounced(*args, **kwargs):
            def call_it():
                fn(*args, **kwargs)
            try:
                debounced.t.cancel()
            except(AttributeError):
                pass
            debounced.t = Timer(wait, call_it)
            debounced.t.start()
        return debounced
    return decorator

  
@debounce(DEBOUNCE_TIME)
def print_message(message: str):
    print(message)

    
if __name__ == "__main__":
    print_message("Won't print this one")
    time.sleep(.5)
    print_message("Or this one")
    time.sleep(.99)
    print_message("This one will though!")
```

The benefit of using a decorator is you can throw it on any function that needs debouncing at it saves you the reuse of the debouncing code in multiple places.

## References:

1. https://gist.github.com/walkermatt/2871026