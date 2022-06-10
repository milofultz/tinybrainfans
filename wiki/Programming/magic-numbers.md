---
title: Magic Numbers (Programming)
description: Magic numbers are numbers that have no semantic meaning. These are problematic for maintenance and bug fixing.
---

Magic numbers are numbers that have no semantic meaning within the program. These are problematic for maintenance and bug fixing since somebody reading the code later could have no idea what exactly the numbers represent.

**example.js**

```javascript
// BAD: Magic Numbers
function calculateTotal(price) {
  return price + price * 0.09 + 2;
}

// GOOD: Semantic Meaning!
function calculateTotal(price, taxRate = 9, serviceCharge = 2) {
  const calculatedTax = priceDollars * (taxRatePercent / 100);
  
  return priceDollars + calculatedTax + serviceChargeDollars;
}

// BETTER: Typing!

/**
 * @param {number} priceDollars
 * @param {number=} taxRatePercent
 * @param {number=} serviceChargeDollars
 */
function calculateTotal(priceDollars, taxRatePercent = 9, serviceChargeDollars = 2) {
  const calculatedTax = priceDollars * (taxRatePercent / 100);
  
  return priceDollars + calculatedTax + serviceChargeDollars;
}
```

An even better solution, if your language supports it, is to use strong typing or at least a type that forces a specific paradigm to be used. For instance, in Ruud van Asseldonk's article[1], he ensures that the correct time value is used in a sleep function by forcing the use of Python's `timedelta`. This value isn't just a number, which could be seconds, milliseconds, minutes, days, or whatever, it is a `timedelta` value and it will always be the same no matter what.

## References

1. https://ruudvanasseldonk.com/2022/03/20/please-put-units-in-names
1. {{JSDoc}}
