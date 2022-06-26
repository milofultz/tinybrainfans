---
title: PHP
description: PHP is a language mainly used in web development and with Wordpress.
---

PHP is a language that is embedded within an HTML file. It doesn't have to be within an HTML document, though.

## Syntax

PHP code must be enclosed within special tags: `<?php` and `?>`

```php
<?php
  $hello = "Hello"
  $world = "world"
  // Say hello
  echo "${hello}, " . "${world}!";
?>
```

### Variables

Variables are prefaced by a `$`.

```php
$x = 4;
$y = "Yeah";
$z = True;
```

String formatting can be performed as it is in {{shell}} scripts, by using double quotes.

```php
$name = "John";
$greeting = "Hello, $name";
```

### Function

Functions are defined similar to {{Javascript}}:

```php
function example($arg1, $arg2 = "Yeah") {
  echo "Yay";
  return 1;
}

example("1");
example("1", "2");

// Anonymous function;

$add = function($num1, $num2) {
  return $num1 + $num2;
}

$add(5, 5);

$sub = fn($num1, $num2) => $num1 - $num2;

$sub(5, 5);
```

### Scope

Functions create a scope where variables defined within are only accessible within, but also that variables defined outside of the scope are not readily accessible. To access a globally scoped variable, the variable must be introduced with a `global` call.

```php
$outside = "test";

function example() {
  // echo $outside;  This will error out
  global $outside;
  echo $outside;

  $inside = "We are no longer " . $outside;

  return 1;
}

// echo $inside;  This will error out
```

### Super Globals[3]

Super globals are variables that are available at all levels. These include syste information, request information, cookies, etc.

| Name | Description |
|---|---|
| $GLOBALS | A superglobal variable that holds information about any variables in global scope. |
| $_GET | Contains information about variables passed through a URL or a form. |
| $_POST |  Contains information about variables passed through a form. |
| $_COOKIE | Contains information about variables passed through a cookie. |
| $_SESSION | Contains information about variables passed through a session. |
| $_SERVER | Contains information about the server environment. |
| $_ENV | Contains information about the environment variables. |
| $_FILES |  Contains information about files uploaded to the script. |
| $_REQUEST | Contains information about variables passed through the form or URL. |

## Data Types

* String: single or double quotes
* Integer
* Float
* Boolean
* Array
* Objects
* `null`
* Resource

### String Methods

Strings can be concatenated using `.`.

```php
$str = "Hello, " . "World!";
$str .= " Good afternoon, good evening, and goodnight.";
```

`htmlspecialchars(str)` will escape all HTML characters in a string, making you safer from script injections.

Alternatively, if the input string is a cookie, `GET` value, etc., you can use `filter_input`[4], which has special rules and helper variables.

### Arrays

```php
$numbers = [1,2,3,4];
// or
$numbers = array(1,2,3,4);

$first_item = $numbers[0];
```

Associative arrays are like {{Javascript}} objects or {{Python}} dictionaries.

```php
$people = {
  "john" => 55,
  "jane" => 19,
  "bob" => 11,
  "jill" => 92
};

$john_age = $people["john"];
```

#### Methods

| Method | Args | Effect |
|--------|------|--------|
| `array_push(arr, val1[, val2...])` | | Add elements to end of array |
| `array_pop(arr)` | | Pop element off end of array |
| `array_shift(arr)` | | Pop element off beginning of array |
| `array_unset(arr[n])` | `n`: Index of element | Delete element from array **while maintaining order** |
| `array_chunk(arr, n)` | `n`: Max number of elements per "chunk" | Break up array into an array of regular sized subarrays |
| `array_merge(arr1, arr2)` | | Concatenate `arr2` to the end of `arr1` and return concatenated array |
| `[...arr1, ...arr2]` | | Same as above |
| `array_combine(arr1, arr2)` | | Create associative array using `arr1` as keys and `arr2` as values. Like {{Python's}} `zip`. |
| `array_keys(assArr1)` | | Make array of keys from an associative array |
| `array_flip(assArr1)` | | Flip keys and values in an associative array |
| `range(start, end)` | | Create array of values from start to end, inclusive |
| `array_map(fn(n) => any, arr)` | | For each item in array, run callback and add return to resulting array |
| `array_filter(arr, fn(n) => bool)` | For each item in array, if result of callback is true, add value to return array. |
| `array_reduce(arr, fn(lastResult, n) => result)` | | For each item in array, run callback and use previous result of array as `lastResult` of next iteration, ending with the final result as return. For instance, if you had an array of numbers you can sum all the values.

### Conditionals

Conditionals are written the same way as {{Javascript}}, in terms of `if` blocks, except `elseif` is together instead of separated. Ternary statements and {{switch cases|Switch Case (Javascript)}} are the same as well.

Like {{Javascript}}, PHP has double- and triple-equals for testing equality; double is for testing equal in value, triple is for testing identical in value and type.

#### Conditional HTML

PHP can render HTML conditionally without resorting to running `echo` everywhere.

```php
<?php if ($loggedIn) { ?>
  <h1>You are logged in!</h1>
  <p>Any valid HTML will be conditionally rendered</p>
<?php } else if ($var === 1) { ?>
  <p>Something else</p>
<?php } else { ?>
  <p>Last thing</p>
<?php } ?>
```

### Loops

For loops, while loops, and do while loops are the same as {{Javascript}}.

The `foreach` loop is unique to PHP in that it is similar to {{Javascript's}} `.forEach` method on iterables, but is a statement that takes in an array or associative array as an expression:

```php
$posts = ["title1", "title2", "title3"];

foreach ($posts as $post) {
  echo $post;
}

$posts = {
  "title1" => "Content1",
  "title2" => "Content2",
  "title3" => "Content3"
};

foreach ($posts as $key => $value) {
  echo $key . " - " . $value;
}
```

## Common Functions

`echo` (multiple values), `print` (single value), `print_r` (for arrays).

When debugging, use `var_dump` for more info or `var_export` for type representation.

## Requests

To set a cookie, use `setcookie(name, value, exp)`.

## References

1. https://www.learn-php.org/en/Hello%2C_World%21
1. https://piped.kavin.rocks/watch?v=BUCiSSyIGGU
1. https://www.php.net/manual/en/language.variables.superglobals.php
1. https://www.php.net/manual/en/function.filter-input.php
1. https://stackoverflow.com/questions/3812526/conditional-statements-in-php-code-between-html-code
