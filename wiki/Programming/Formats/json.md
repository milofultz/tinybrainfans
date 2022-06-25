---
title: JSON
description: JSON is the de facto standard for serializing data over the internet.
---

## Syntax

JSON is a recursive data format; at the top level a JSON object is a dictionary that holds key/value pairs, and it can hold more dictionaries within it, which themselves will hold key/value pairs.

JSON files can hold these data types:

* Number (both integers and floats are the same type)
* String
* Boolean
* Array
* Dictionary
* `null`

Note that it has no comments and no date type. All data must fall into one of these categories. On parse, however, it is common to parse specified values into a proper type[1], like an ISO 8601 date could be {{regexed|Regular Expressions}} into the proper Date format, etc.

Trailing commas are not allowed, and all strings must be quoted with double quotes, not single quotes.

## Example

```json
{
  "string": "hello, world!",
  "number": 1,
  "boolean": true,
  "array": [1,2,3],
  "dictionary": {
    "nested key": "nested value"
  },
  "null": null
}
```

## Parsing

Because JSON is a recursive data format without complex types, it is easy to parse from a programming standpoint. A {{pseudocode}} example:

```pseudocode
CREATE output AS an empty hash map or dictionary

FUNCTION parse_dict HAS PARAMETERS raw_dict, parsed_dict
  FOR key, value IN dict
    IF key IS NOT A hash map or dictionary
      # Here you could place a conditional to to parse special types, like dates
      SET parsed_dict[key] TO value
    ELSE
      SET parsed_dict[key] TO empty hash map or dictionary
      CALL parse_dict WITH key, value, parsed_dict[key]
    END IF
  END FOR
END FUNCTION

OPEN json file
SET json_contents TO contents of json file

CALL parse_dict WITH json_contents, output

RETURN output
```

## References

1. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/parse
1. https://en.wikipedia.org/wiki/JSON

