---
title: Magic Numbers (Programming)
description: Magic numbers are numbers that have no semantic meaning. These are problematic for maintenance and bug fixing.
---

Magic numbers are numbers that have no semantic meaning within the program. These are problematic for maintenance and bug fixing since somebody reading the code later could have no idea what exactly the numbers represent.

```javascript
/* BAD: Magic Numbers */
function calculateTotal(price) {
	return price + price * 0.09 + 2;
}

/* GOOD: Semantic Meaning! */
function calculateTotal(price) {
	const taxRate = 0.09;
  const serviceCharge = 2;
  const calculatedTax = price * 0.09;
  
  return price + calculatedTax + serviceCharge;
}
```
