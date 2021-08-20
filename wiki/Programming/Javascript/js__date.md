---
title: Date (Javascript)
description: Javascript Date objects have some weird intricacies that need attention.
---

{{Javascript}} Date objects have some weird intricacies that need attention.

## Time Zones

JavaScript's Date object tracks time in UTC internally, but typically accepts input and **produces output in the local time of the computer it's running on**. The way to mitigate this (IMO undesired) opinion is two options.

```javascript
// will change time based on computer's time zone
var myBirthday = ('January 1, 1990');
```

### UNIX Timestamp

If you use a website like [unixtimestamp.com](https://www.unixtimestamp.com/), you can convert your times beforehand and using these as input, will always produce the correct time regardless of timezone.

```javascript
var myBirthday = ('631180800');
```

### Specify `GMT+0:00` Time Zone

When inputting a more human-readable datetime stamp, follow it with `GMT+0:00` and this will force a normalized timezone, regardless of the computer's settings.

```javascript
var myBirthday = ('January 1, 1990 GMT+0:00');
```

## References

- https://stackoverflow.com/questions/15141762/how-to-initialize-a-javascript-date-to-a-particular-time-zone
