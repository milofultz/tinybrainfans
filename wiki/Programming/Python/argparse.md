---
title: argparse (Python)
description: argparse is a way to handle command line arguments in Python applications.
---

`argparse` is a way to handle command line arguments in {{Python}} applications.

## Getting Started

A simple application using `argparse`:

```python
import argparse

if __name__ == "__main__":
    # What will show up using the built-in help
    argparser = argparse.ArgumentParser(description='Create wiki at output dir from input dir.')
    # Positional arguments
    # In `args` dict, var found at `input_dir`
    argparser.add_argument('input_dir', metavar='input', type=str, help='the path to the input directory')
    argparser.add_argument('output_dir', metavar='output', type=str, help='the path to the output directory')
    # Optional arguments with multiple flags
    # `action` defines what occurs if flag is set
    argparser.add_argument('--delete-current-html', '-d', action='store_true', help='delete all HTML in output directory before building')
    # `default` is the default value if not set
    # `dest` is the variable name set in `args` dict
    argparser.add_argument('--no-fatfile', '-nf', action='store_false', default=True, dest="build_fatfile", help='do not create fatfile on build')
    args = argparser.parse_args()
    
    # Use the args like so
    print(args.input_dir, args.output_dir)
```

`argparse` should not be used in the setup (i.e. not before the `if __name__ == "__main__"`), as this makes importing and testing impossible to do without a *lot* of extra work.

## References

- https://docs.python.org/3.9/library/argparse.html