---
title: COBOL
description: COBOL is a high-level language mainly used with mainframes on legacy and modern systems.
---

Most of this is in the IBM Z/OS variety, but I assume most of it is pretty agnostic to the exact implementation hardware. Plus the manuals are all over the internet, so shouldn't be too hard to grab what you need.

## Syntax

### Characters

'Characters' are lowest in the hierarchy and they cannot be divided further. The COBOL Character Set includes 78 characters which are shown below.

|Sr.No.|Character     | Example |
|------|----------------------------|---|
|1     |Alphabets (Upper Case) | `A` - `Z` |
|2     |Alphabets (Lower Case) | `a` - `z` |
|3     |Numeric | `0`-`9`           |
|4     |Space | ` ` |
|5     |Plus Sign | `+` |
|6     |Minus Sign or Hyphen | `-` |
|7     |Asterisk | `*` |
|8     |Forward Slash | `/` |
|9     |Currency Sign | `$`              |
|10    |Comma | `,`                      |
|11    |Semicolon | `;`                  |
|12    |Decimal Point or Period | `.`    |
|13    |Quotation Marks| `"`            |
|14    |Left Parenthesis|`(`          |
|15    |Right Parenthesis|`)`         |
|16    |Greater than|`>`              |
|17    |Less than|`<`                 |
|18    |Colon|`:`                      |
|19    |Apostrophe|`'`                 |
|20    |Equal Sign|`=`                 |

### Coding Sheet

The source program of COBOL must be written in a format acceptable to the compilers. COBOL programs are written on COBOL coding sheets. There are 80 character positions on each line of a coding sheet.

Character positions are grouped into the following five fields:

|Positions|Field|Description|
|---------|-------------------|--|
|1-6     |Column Numbers     |Reserved for line numbers.                                                                                                    |
|7        |Indicator          |It can have Asterisk (`*`) indicating comments, Hyphen (`-`) indicating continuation and Slash (`/`) indicating form feed.|
|8-11    |Area A             |All COBOL divisions, sections, paragraphs and some special entries must begin in Area A.                                      |
|12-72   |Area B             |All COBOL statements must begin in area B.                                                                                    |
|73-80   |Identification Area|It can be used as needed by the programmer.                                                                                   |

#### Example

The following example shows a COBOL coding sheet:

```cobol
000100 IDENTIFICATION DIVISION. 000100
000200 PROGRAM-ID. HELLO. 000101
000250* THIS IS A COMMENT LINE 000102
000300 PROCEDURE DIVISION. 000103
000350 A000-FIRST-PARA. 000104
000400 DISPLAY “Coding Sheet”. 000105
000500 STOP RUN. 000106
```

JCL to execute the above COBOL program:

```
//SAMPLE JOB(TESTJCL,XXXXXX),CLASS = A,MSGCLASS = C
//STEP1 EXEC PGM = HELLO
```

When you compile and execute the above program, it produces the following result:

```
Coding Sheet
```

### Character Strings

Character strings are formed by combining individual characters. A character string can be a

* Comment,
* Literal, or
* COBOL word

All character strings must be ended with separators. A separator is used to separate character strings.

Frequently used separators:

- Space
- Comma
- Period
- Apostrophe
- Left/Right Parenthesis
- Quotation mark

### Comment

A comment is a character string that does not affect the execution of a program. It can be any combination of characters.

There are two types of comments:

Type | Description | Example
--- | --- | ---
Comment Line | Any line with an asterisk (`*`) or slash (`/`) in the indicator area (column 7) of the line. | `000250* THIS IS A COMMENT LINE 000102` 
Comment Entry | Comment entries are those that are included in the optional paragraphs of an Identification Division. They are written in Area B and programmers use it for reference. | TODO

### Literal

Literal is a constant that is directly hard\-coded in a program. In the following example, "Hello World" is a literal.

```cobol
PROCEDURE DIVISION.
DISPLAY 'Hello World'.
```

There are two types of literals, alphanumeric and numeric.

#### Alphanumeric Literals

Alphanumeric Literals are enclosed in single or double quotes. Length can be up to 160 characters.

#### Numeric Literal

A Numeric Literal is a combination of digits from `0` to `9`, `+`, `–`, or decimal point. Length can be up to 18 characters. Sign cannot be the rightmost character. Decimal point should not appear at the end. Valid examples are `100`, `+10.9`, and `-1.9`; invalid examples are `1,00`, `10.`, and `10.9-`.

### COBOL Word

COBOL Word is a character string that can be a reserved word or a user-defined word. Length can be up to 30 characters.

#### User-Defined

User-defined words are used for naming files, data, records, paragraph names, and sections. Alphabets, digits, and hyphens are allowed while forming userdefined words. You cannot use COBOL reserved words.

#### Reserved Words[7, p. 12]

Reserved words are predefined words in COBOL. Different types of reserved words that we use frequently are as follows:

* Keywords
* Special characters
* Figurative constants

#### Figurative Constants

|Sr.No.|Figurative Constants |Description|
|---|---|---|
|1     |HIGH-VALUES|One or more characters which will be at the highest position in descending order.|
|2     |LOW-VALUES                       |One or more characters have zeros in binary representation. |
|3     |ZERO/ZEROES                           |One or more zero depending on the size of the variable.|
|4     |SPACES               |One or more spaces.|
|5     |QUOTES|Single or double quotes.|
|6     |ALL "literal"|Fills the data-item with "literal".|

### Variables (PICTURE Clause)[7]

These are only the common ones that I've found. There are LOTS.

Symbol | Meaning | Size
--- | --- | ---
A | A character position that can contain only a letter of the Latin alphabet or a space. | Each ’A’ is counted as one character position in the size of the data item.
S | An indicator of the presence (but not the representation, and not necessarily the position) of an operational sign. An operational sign indicates whether the value of an item involved in an operation is positive or negative. | Not counted in the size of the elementary item, unless an associated SIGN clause specifies the SEPARATE CHARACTER phrase (which would be counted as one character position). 
V | An indicator of the location of the assumed decimal point. Does not represent a character position.<br>When the assumed decimal point is to the right of the rightmost symbol in the string, the V is redundant. | Not counted in the size of the elementary item.
X | A character position that can contain any allowable character from the alphanumeric character set of the computer. | Each ’X’ is counted as one character position in the size of the data item.
Z | A leading numeric character position. When that position contains a zero, a space character replaces the zero. | Each ’Z’ is counted as one character position in the size of the data item.
9 | A character position that contains a numeral. | Each nine specifies one decimal digit in the value of the item. For usages DISPLAY and NATIONAL, each nine is counted as one character position in the size of the data item.
0 | A character position into which the numeral zero is inserted. | Each zero is counted as one character position in the size of the data item.

## Learning

### Courses

* Learning COBOL Programming with VSCode[8]
* IBM ZXplore[2]

### Books on COBOL[3]

* *Fundamentals of Structured COBOL* by Carl Feingold
* [*Mainframe COBOL* from Murach](https://www.murach.com/shop/murachs-mainframe-cobol-detail)
* *Advanced COBOL for Structured and Object-Oriented Programming* by Gary DeWard Brown
* Any IBM COBOL manual[7]


## References

1. https://community.ibm.com/community/user/ibmz-and-linuxone/blogs/misty-decker1/2020/04/10/cobol-education-quick-guide
2. https://ibmzxplore.influitive.com/
3. https://www.teddit.net/r/cobol/comments/i8wzzr/what_is_the_cobol_bible_if_there_is_one/
4. [Debugging COBOL](https://www.teddit.net/r/cobol/comments/id13dc/newbie_with_cobol_and_absolutely_lost/)
5. https://www.tutorialspoint.com/cobol/cobol_basic_syntax.htm
6. http://www.csis.ul.ie/cobol/exercises/default.htm
7. https://www.ibm.com/docs/en/SS6SG3_4.2.0/com.ibm.entcobol.doc_4.2/PGandLR/igy3lr50.pdf
8. https://www.ibm.com/blogs/ibm-training/free-course-announcing-learning-cobol-programming-with-vscode/
9. https://github.com/openmainframeproject/cobol-programming-course
