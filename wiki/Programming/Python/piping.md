---
title: Python with Bash
description: This is how to utilize piping with Python programs in Bash.
---

This is how to utilize piping with {{Python}} programs in {{Bash}}.

## Example

See this simple `echo.py`:

```python
import sys

if __name__ == "__main__":
    for line in sys.stdin:
        sys.stderr.write("DEBUG: got line: " + line)
        sys.stdout.write(line)
```

running:

```bash
$ ls | python echo.py 2>debug_output.txt | sort
```

output:

```
echo.py
test.py
test.sh
```

debug_output.txt content:

```
DEBUG: got line: echo.py
DEBUG: got line: test.py
DEBUG: got line: test.sh
```

## References

1. https://stackoverflow.com/questions/4429966/how-to-make-a-python-script-pipeable-in-bash