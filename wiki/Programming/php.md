---
title: PHP
description: PHP is a language mainly used in web development and with Wordpress.
---

PHP is a language that is embedded within an HTML file. It doesn't have to be within an HTML document, though.

## Syntax

PHP code must be enclosed within special tags: `<?php` and `?>`

```php
<?php
  echo "Hello, world!";
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
function example($arg1, $arg2) {
  echo "Yay";
  return 1;
}
```



## References

1. https://www.learn-php.org/en/Hello%2C_World%21
