---
title: Header Files (C)
description: Header files are where you place shared functions, function prototypes, #define's, and anything else you want shared.
---

Header files are where you place shared functions, function prototypes, #define's, and anything else you want shared. Definitions go in a `.h` file, whereas the code, the action, goes in the `.c` file. Everything *could* go in one C file, but organizing with multiple files is better for humans.[1]

Short answer is it separates the interface from the implementation.

## Example

I'm pulling this wholesale from this SO answer[3] because it's great.

Take this example. `foo` does not know what `bar` is when it is invoked because `bar` is declared after `foo`. We could solve this by moving `bar` above `foo`, but then we would have the same problem within `bar`.

**baz.c**

```c
void foo() {
  //bar? what is this function???
  bar();
}

void bar() {
  //I know foo() because it appears before. 
  foo();
}
```

- `foo` can call `bar` only if it is defined before. 
- `bar` can only call `foo` if it is defined before

Since we must define one of them first, the solution to this problem are function prototypes.

**baz.c**

```c
//prototype of foo()
void foo();
//prototype of bar()
void bar();

void foo() {
  // I can call bar() because I know it exists
  bar();
}

void bar() {
  // I can call foo() because I know it exists
  foo();
}
```

With a large project, you can end up amassing a large amount of prototypes, along with `#define`'s, `#ifdef`'s, etc. To clean things up, we can put all of these things into an `.h` file, and `#include` that instead.

**baz.h**

```c
//prototype of foo()
void foo();
//prototype of bar()
void bar();
```

**baz.c**

```c
#include 'baz.h'

void foo() {
  // I can call bar() because I know it exists
  bar();
}

void bar() {
  // I can call foo() because I know it exists
  foo();
}
```

It then became a good practice as it separates the interface from the implementation.

## References

1. https://stackoverflow.com/questions/1695224/what-do-c-and-h-file-extensions-mean-to-c
2. https://stackoverflow.com/questions/1945846/what-should-go-into-an-h-file
3. https://stackoverflow.com/a/19089822/14857724