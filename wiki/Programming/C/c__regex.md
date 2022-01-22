---
title: Regular Expressions (C)
description: Regular Expressions in C use POSIX syntax and are a little weird.
---

Regular Expressions in {{C}} use {{POSIX|Regular Expressions (POSIX)}} syntax and are a little weird.

## How It Works

### Compile Pattern

To compile the regex pattern, use `int regcomp(regex_t *preg, const char *regex, int cflags)`.

- `preg` - Destination for your compiled regex pattern.
- `regex` - The string representing your regex pattern.
- `cflags` - Which flags you want to enable[3].
  - `REG_EXTENDED` - Treat the pattern as an extended regular expression, rather than as a basic regular expression.
  - `REG_ICASE` - Ignore case when matching letters.
  - `REG_NOSUB` - Don’t bother storing the contents of the matchptr array.
  - `REG_NEWLINE` - Treat a newline in string as dividing string into multiple lines, so that `$` can match before the newline and `^` can match after.  Also, don’t permit `.` to match a newline, and don’t permit `[^…]` to match a newline. Otherwise, newline acts like any other ordinary character.


### Match It To String

To match, use `int regexec(const regex_t *preg, const char *string, size_t nmatch, regmatch_t pmatch[], int eflags)`.

- `preg` - Compiled regex pattern
- `string` - String to match against
- `nmatch` - Maximum number of matches to save
- `pmatch` - The offsets of the subexpression starting at the *i*th open parenthesis. Each `regmatch_t` within `pmatch` has an `rm_so` and an `rm_eo` (regex match start/end offset from the start of the string).
- `eflags` - *eflags* may be the bitwise-**or** of one or both of
  - `REG_NOTBOL` - The match-beginning-of-line operator always fails to match. This flag may be used when different portions of a string are passed to `regexec` and the beginning of the string should not be interpreted as the beginning of the line.
  - `REG_NOTEOL` - The match-end-of-line operator always fails to match.

### Catch Any Errors

Use `size_t regerror(int errcode, const regex_t *preg, char *errbuf, size_t errbuf_size)`[4].

### Free Up Memory When Finished

Use `void regfree(regex_t *preg)`.

## Example

Check out the thorough example from Ben Bullock[1] using the link below, or if the page doesn't work, you can find it locally [here](regex_test.c). A more basic example can be found below, from Per-Olof Pettersson[5]:

```c
#include <sys/types.h>
#include <regex.h>
#include <stdio.h>

int main (int argc, char *argv[]) {
  regex_t regex;
  int reti;
  char msgbuf[100];

  /* Compile regular expression */
  reti = regcomp(&regex, "^a[[:alnum:]]", 0);
  if (reti) {
    fprintf(stderr, "Could not compile regex\n");
    exit(1); 
  }

  /* Execute regular expression */
  reti = regexec(&regex, "abc", 0, NULL, 0);
  if (!reti) {
    puts("Match");
  } else if (reti == REG_NOMATCH) {
    puts("No match");
  } else {
    regerror(reti, &regex, msgbuf, sizeof(msgbuf));
    fprintf(stderr, "Regex match failed: %s\n", msgbuf);
    exit(1);
  }

  /* Free compiled regular expression if you want to use the regex_t again */
  regfree(&regex);

  return 0;
}
```

## References

1. https://www.lemoda.net/c/unix-regex/
1. http://www.gnu.org/savannah-checkouts/gnu/libc/manual/html_node/Regular-Expressions.html
1. http://www.gnu.org/savannah-checkouts/gnu/libc/manual/html_node/Flags-for-POSIX-Regexps.html
1. https://linux.die.net/man/3/regexec
1. http://web.archive.org/web/20160308115653/http://peope.net/old/regex.html
