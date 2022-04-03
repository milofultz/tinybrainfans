---
title: Regular Expressions
description: Regular Expressions or "regex" is used to describe a series of characters. If it has a pattern in its formatting, regex can be used.
---

Regular Expressions or "regex" is used to describe a series of characters. If it has a pattern in its formatting, regex can be used.

## Regular Expression Syntax

This syntax is for {{Javascript}}, but it is mostly what I have used in everything so far.

### Metacharacters

- `^` at the beginning means that the match must start with what follows. 
- `$` at the end means that the match must end with what precedes it.
- `.` means any character that is in that place is allowed. e.g. `/h.llo/` will return a match on "hello", "hallo", "hullo", etc.
- `*` means match the preceding character or group 0 or more times.
- `+` means match the preceding character or group 1 or more times.
- `?` means the preceding character is optional in the match. (e.g. `/gre?a?y/` matches 'grey', 'gray', and 'gry')
- `+?` means match as few instances of the preceding character or group as possible.
- `x|y` means x or y.
- `\` is used to escape characters.
- `[abc]` means one of the characters within the brackets ('a' 'b' or 'c') must be present at that position. This can include one or more ranges of characters, which are notated with a hyphen (e.g. 'a-z', 'A-Z', '0-9'). Adding a `^` within the brackets means anything *but* what is inside. 
- `x{n}` returns a match if a `x` is found `n` number of times. `n` can be a range separated by a comma (e.g. `{2,4}`). A single comma and nothing succeeding it means at least `n` times (e.g. `{2,}` means at least 2 times).
- `()` indicate that whatever is within them should be grouped together, in instances of curly braces for instance.

### Shorthand Character Classes

- `\w` is any alphanumeric char or underscore.
- `\W` is anything *but* an alphanumeric char or underscore.
- `\d` is any digit.
- `\D` is anything *but* a digit.
- `\s` is any whitespace character.
- `\S` is any non-whitespace character.
- `\b` denotes a word boundary. Placed after a string of chars, it matches if the string is found and is succeeded by anything but an alphanum or underscore.

### Lookahead and Lookbehind

Lookahead and lookbehind allow search queries that will not be included in the final match. e.g. `x(?=y)` will return `x` *only if* succeeded by `y`.

#### Lookahead

- `x(?=y)` will match `x` only if it is followed by `y`.
- `x(?!y)` will match `x` only if it is *not* followed by `y`.

#### Lookbehind

- `(?<=y)x` will match `x` only if it is preceded by `y`.
- `(?<!y)x` will match `x` only if it is *not* preceded by `y`.

### Flags/Suffixes

- `i` means the preceding search is case insensitive. If `i` is absent, it is case sensitive.
- `g` means it will search for all instances, not just the first one it finds.
- `m` means multiline search

### Backreferences

`\1`, where `1` is any incremental number, is called a [backreference][]. The number is referring to the capture group of the current reg ex. When called, the regex will search for the *exact instance found* of that regex. 

For example, `/[A-Z][0-9]\1/` will search for any char between A-Z, 0-9, and whatever character was found in the first character group. If you were searching through 'A9A' it would be a success, while 'A9B' would fail. This is because capture group `1` found an 'A', and therefore the backreference (`\1`) must also find an 'A'.

## Common Regex Queries

### Character Sets

| Regex                                            | Matches                                                      |
| ------------------------------------------------ | ------------------------------------------------------------ |
| `[\s\S]`                                         | Anything                                                     |
| `[^\n\r]`                                        | Anything except for a newline                                |
| `[A-Za-z0-9]`                                    | Alphanumeric characters                                      |
| `[A-Za-z]`                                       | Alphabetic characters                                        |
| `[0-9]` or `\d`                                  | Numeric characters                                           |
| ```[\.,-\/#!$%\^&\*;:{}=\-_`~()@\+\?><\[\]\+]``` | All punctuation (non alphanum graphic characters)            |

### Queries

| Regex                     | Matches                                                      |
| ------------------------- | ------------------------------------------------------------ |
| `filename.svg|(filename)` | Match only if first query does not match (use match groups)[4] i.e. match `filename` only if it does not have extension of `svg` |

## References:

1. https://regular-expressions.mobi/backref.html?wlr=1
2. https://regexr.com/
3. https://regexcrossword.com/
3. http://www.rexegg.com/regex-best-trick.html

[backreference]: https://regular-expressions.mobi/backref.html?wlr=1