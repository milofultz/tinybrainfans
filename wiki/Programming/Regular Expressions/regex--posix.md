---
title: Regular Expressions (POSIX)
description: POSIX's Regular Expressions differ in implementation than the standard regex we know today.
---

POSIX's Regular Expressions differ in implementation than the {{standard regex we know today|Regular Expressions}}.

## POSIX Regular Expressions Syntax

From the Wikipedia page[1]:

### Basic Regular Syntax (BRE)

In the [POSIX](https://en.wikipedia.org/wiki/POSIX) standard, Basic Regular Syntax (**BRE**) requires that the [metacharacters](https://en.wikipedia.org/wiki/Metacharacter) `( )` and `{ }` be designated `\(\)` and `\{\}`, whereas Extended Regular Syntax (**ERE**) does not.

| Metacharacter | Description                                                  |
| ------------- | ------------------------------------------------------------ |
| `^`           | Matches the starting position within the string. In line-based tools, it matches the starting position of any line. |
| `.`           | Matches any single character (many applications exclude [newlines](https://en.wikipedia.org/wiki/Newline), and exactly which characters are considered newlines is flavor-,  character-encoding-, and platform-specific, but it is safe to assume  that the line feed character is included). Within POSIX bracket expressions, the dot character matches a literal dot. For example, `a.c` matches "abc", etc., but `[a.c]` matches only "a", ".", or "c". |
| `[ ]`         | A bracket expression. Matches a single character that is contained within the brackets. For example, `[abc]` matches "a", "b", or "c". `[a-z]` specifies a range which matches any lowercase letter from "a" to "z". These forms can be mixed: `[abcx-z]` matches "a", "b", "c", "x", "y", or "z", as does `[a-cx-z]`. The `-` character is treated as a literal character if it is the last or the first (after the `^`, if present) character within the brackets: `[abc-]`, `[-abc]`. Note that backslash escapes are not allowed. The `]` character can be included in a bracket expression if it is the first (after the `^`) character: `[]abc]`. |
| `[^ ]`        | Matches a single character that is not contained within the brackets. For example, `[^abc]` matches any character other than "a", "b", or "c". `[^a-z]` matches any single character that is not a lowercase letter from "a" to "z". Likewise, literal characters and ranges can be mixed. |
| `$`           | Matches the ending position of the string or the position just  before a string-ending newline. In line-based tools, it matches the  ending position of any line. |
| `( )`         | Defines a marked subexpression. The string matched within the parentheses can be recalled later (see the next entry, `\*n*`). A marked subexpression is also called a block or capturing group. **BRE mode requires `\( \)`**. |
| `\*n*`        | Matches what the *n*th marked subexpression matched, where *n* is a digit from 1 to 9. This construct is vaguely defined in the  POSIX.2 standard. Some tools allow referencing more than nine capturing  groups. Also known as a backreference. **backreferences are only supported in BRE mode** |
| `*`           | Matches the preceding element zero or more times. For example, `ab*c` matches "ac", "abc", "abbbc", etc. `[xyz]*` matches "", "x", "y", "z", "zx", "zyx", "xyzzy", and so on. `(ab)*` matches "", "ab", "abab", "ababab", and so on. |
| `{*m*,*n*}`   | Matches the preceding element at least *m* and not more than *n* times. For example, `a{3,5}` matches only "aaa", "aaaa", and "aaaaa". This is not found in a few older instances of regexes. **BRE mode requires `\{\*m\*,\*n\*\}`**. |

### Extended Regular Syntax (ERE)

The meaning of metacharacters [escaped](https://en.wikipedia.org/wiki/Escape_character) with a backslash is reversed for some characters in the POSIX Extended Regular Expression (**ERE**) syntax. With this syntax, a backslash causes the metacharacter to be treated as a literal character. So, for example, `\( \)` is now `( )` and `\{ \}` is now `{ }`. Additionally, support is removed for `\*n*` backreferences and the following metacharacters are added:

| Metacharacter | Description                                                  |
| ------------- | ------------------------------------------------------------ |
| `?`           | Matches the preceding element zero or one time. For example, `ab?c` matches only "ac" or "abc". |
| `+`           | Matches the preceding element one or more times. For example, `ab+c` matches "abc", "abbc", "abbbc", and so on, but not "ac". |
| `|`           | The choice (also known as alternation or set union) operator matches either the expression before or the expression after the operator. For  example, `abc|def` matches "abc" or "def". |

### Bracket Expressions/Character Classes

Pulled from regular-expressions.info[6]:

> Don’t confuse the POSIX term “character class” with what is normally called a [regular expression character class](https://www.regular-expressions.info/charclass.html). `[x-z0-9]` is an example of what this tutorial calls a “character class” and what POSIX calls a “bracket expression”. `[:digit:]` is a POSIX character class, used inside a bracket expression like `[x-z[:digit:]]`. The POSIX character class names must be written all lowercase.
>
> One key syntactic difference is that the backslash is NOT a  metacharacter in a POSIX bracket expression. So in POSIX, the regular  expression `[\d]` matches a `\` or a `d`. To match a `]`, put it as the first character after the opening `[` or the negating `^`. To match a `-`, put it right before the closing `]`. To match a `^`, put it before the final literal `-` or the closing `]`. Put together, `[]\d^-]` matches `]`, `\`, `d`, `^` or `-`.

| POSIX | Description | ASCII |
| --- | --- | --- |
| `[:alnum:]`  | Alphanumeric characters                                      | `[a-zA-Z0-9]` |
| `[:alpha:]`  | Alphabetic characters                                        | `[a-zA-Z]`     |
| `[:ascii:]`  | ASCII characters                                             | `[\x00-\x7F]` |
| `[:blank:]`  | Space and tab                                                | `[ \t]`       |
| `[:cntrl:]`  | Control characters                                           | `[\x00-\x1F\x7F]` |
| `[:digit:]`  | Digits                                                       | `[0-9]`      |
| `[:graph:]`  | Visible characters (anything except spaces and control characters) | `[\x21-\x7E]` |
| `[:lower:]`  | Lowercase letters                                            | `[a-z]`             |
| `[:print:]`  | Visible characters and spaces (anything except control characters) | `[\x20-\x7E]`  |
| `[:punct:]`  | Punctuation (and symbols).                                   | `[!"\#$%&'()*+, \-./:;<=>?@\[ \\\]^_‘{|}~]` |
| `[:space:]`  | All whitespace characters, including line breaks             | `[ \t\r\n\v\f]`                     |
| `[:upper:]`  | Uppercase letters                                            | `[A-Z]`                              |
| `[:word:]`   | Word characters (letters, numbers and underscores)           | `[A-Za-z0-9_]`  |
| `[:xdigit:]` | Hexadecimal digits                                           | `[A-Fa-f0-9]`        |



## References

1. https://en.wikipedia.org/wiki/Regular_expression#POSIX_basic_and_extended
1. http://web.archive.org/web/20160308115653/http://peope.net/old/regex.html
1. http://www.gnu.org/savannah-checkouts/gnu/libc/manual/html_node/Regular-Expressions.html
1. https://www.regular-expressions.info/posix.html
1. https://www.lemoda.net/c/unix-regex/
1. https://www.regular-expressions.info/posixbrackets.html