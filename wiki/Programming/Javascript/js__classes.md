---
title: Classes (Javascript)
description: Classes in Javascript allow a more object-oriented approach, creating instances with methods and properties.
---

Classes in {{Javascript}} generally are created with two different sections:

1. The `prototypes` or `methods` will be how all the instances of the class should be **similar** (things like `addYear` for a person class). This is commonly done in the `prototype` object.
2. The constructor will define how the instances are **different** (the `name` property of a person class). This is commonly done through the invocation of the constructor, like `function (name) { this.name = name }`.

## Class Types

### Decorators

A decorator is a function that accepts an object and **adds more properties or functionality** to it. It's common to use **adjectives** as the names of these decorators. Decorators allow for more DRY code and help keep all elements together that should be, allowing little ambiguity in execution.

```javascript
// this decorator makes obj more 'carlike'
var carlike = function (obj, loc) {
	obj.loc = loc;
  obj.move = function () {
    obj.loc++;
  };
};

var newObj = {};
var newCar = carlike(newObj, 0);
```

### Functional Classes

A functional class is a construct that is **capable of making a fleet of objects** that conform to the same interface. They are commonly capitalized in name. The functions that produce these functional classes are called **constructors**. The object that is returned is called an **instance** of that class. 

The difference between a decorator and a functional class is that a decorator accepts their target object as input, whereas the class builds and returns the object it's augmenting.

```javascript
var Car = function (loc) {
  var obj = {loc: loc};
  obj.move = function () {
    obj.loc++;
  }
  return obj;
}

var newCar = Car(0);
```

### Functional Classes with Shared Methods

Using shared methods allows you to save space in memory, as only one instance of a method needs to exist, as opposed to one for every single instance.

```javascript
var Car = function (loc) {
	var obj = {loc: loc};
	// using UnderscoreJS (see polyfill)
  return _.extend(obj, carMethods);
}

var carMethods = {
  move: function () {
	  this.loc++;
  }
}

var newCar = Car(0);
```

`_.extend` polyfill:

```javascript
var extend = function (destination, source) {
  for (var key in source) {
    destination[key] = source[key];
  }
  return destination;
}
```

### Prototypal Classes

Using `Object.create()`, we can create an object that inherits all properties of the enclosed object into its `prototype`. This will mean that on a failed lookup, it will search within this object for a reference, inheriting the old objects as they were at the time of inheritance.

```javascript
var Car = function (loc) {
	var obj = Object.create(Car.prototype);
  obj.loc = loc;
  return obj;
}

Car.prototype.move = function () {
  this.loc++;
};

var newCar = Car(0);
```

### Pseudoclassical Classes

The pseudoclassical class is a {{Javascript}} syntactic sugar that allows a more conventional style of object oriented programming to be implemented.

By running a function with the `new` keyword before it, the interpreter runs the program in a special "construction" mode. Since you will always want to be creating an object and returning it when you are finished, the `new` keyword adds these two lines at the beginning and end, respectively, to your function. The object created will be automatically bound to `this` and will use the `prototype` property found inside that function.

The two different parts of a pseudoclassical class are doing two distinct roles:

1. the constructor is defining what is different about each instance. In this example, what `loc` is.
2. the methods are defining what is similar about each instance. In this example, what `move` does.

```javascript
var Car = function (loc) {
  this.loc = loc;
};

Car.prototype.move = function () {
  this.loc++;
};

var newCar = new Car(0);
```

### ES6 Classes (`class`)

The ES6 implementation is extremely similar to the pseudoclassical implementation, but uses more syntactic sugar to make it more readable and more similar to other object-oriented languages.

```javascript
class Car {
	constructor(loc) {
		this.loc = loc;
	}
	
	move() {
		this.loc++;
	}
}

var newCar = new Car(0);
```

## Polymorphism

Polymorphism is the design of objects to be able to share behaviors and override certain shared behaviors to work more specifically on the new object. There is a super class and a sub class. The sub class inherits the properties and methods from the super class. In the following examples, the super is `Shape` and the sub is `Square` or `Triangle`. 

### Functional Classes

```javascript
var Shape = function (name, sides, sideLength) {
	var obj = {
    name: name,
    sides: sides,
    sideLength: sideLength
  };
  var calcPerimeter = function () {
    return obj.sides * obj.sideLength;
  };
  return obj;
};

var Square = function (name, sideLength) {
  var obj = shape(name, 4, sideLength);
  var calcArea = function () {
    return Math.pow(obj.sideLength, 2);
  };
  return obj;
}

var newSquare = Square('square', 5);
```

### Functional with Shared Methods

Using `_.extend` to update the object.

```javascript
var Shape = function (name, sides, sideLength) {
	var obj = {
    name: name,
    sides: sides,
    sideLength: sideLength
  };
	// using UnderscoreJS (see polyfill)
  return _.extend(obj, shapeMethods);
};

var shapeMethods = {
  calcPerimeter: function () {
	  return this.sides * this.sideLength;
  }
};

var Square = function (name, sideLength) {
  var obj = Shape(name, 4, sideLength);
  return _.extend(obj, squareMethods);
}

var squareMethods = {
  calcArea: function () {
	  return Math.pow(this.sideLength, 2);
  }
};

var newSquare = Square('square', 5);
```

### Prototypal Classes

Using `Object.create()`.

```javascript
var Shape = function (name, sides, sideLength) {
  var obj = Object.create(Shape.prototype);
  obj.name = name;
  obj.sides = sides;
  obj.sideLength = sideLength;
  return obj;
};

Shape.prototype.calcPerimeter = function () {
  return this.sides * this.sideLength;
};

var Square = function (name, sideLength) {
  var obj = Object.create(Square.prototype);
	obj.name = name;
  obj.sides = 4;
  obj.sideLength = sideLength;
  return obj;
}

Square.prototype = Object.create(Shape.prototype);
Square.prototype.constructor = Square; // otherwise is `Shape`
Square.prototype.calcArea = function () {
  return Math.pow(this.sideLength, 2);
};

var newSquare = Square('square', 5);
```

### Pseudoclassical Classes

Using the `new` keyword.

```javascript
var Shape = function (name, sides, sideLength) {
	// this = Object.create(Shape.prototype);
  this.name = name;
  this.sides = sides;
  this.sideLength = sideLength;
  // return this;
};

Shape.prototype.calcPerimeter = function () {
  return this.sides * this.sideLength;
};

var Square = function (name, sideLength) {
  this.name = name;
  this.sides = 4;
  this.sideLength = sideLength;
};

Square.prototype = new Shape();
Square.prototype.constructor = Square; // otherwise is `Shape`
Square.prototype.calcArea = function () {
  return Math.pow(this.sideLength, 2);
};

var newSquare = new Square('square', 5);
```

### ES6 Classes

To create a class that inherits all the properties of another class, use `extends` after defining the `class` name.

```javascript
class Shape {
  constructor (name, sides, sideLength) {
    this.name = name;
    this.sides = sides;
    this.sideLength = sideLength;
  }

  calcPerimeter () {
    return this.sides * this.sideLength;
  }
};

class Square extends Shape {
  constructor (name, sideLength) {
    super(name, 4, sideLength);
  }

  calcArea () {
    return Math.pow(this.sideLength, 2);
  }
}

var newSquare = new Square('square', 5);
```

## Property Lookup/Prototype Chains

If you are looking for a given property of an object, the interpreter will first look at the object itself, and if it fails on that lookup, will look at any other objects that are associated via prototype chain.

To have an ongoing prototype chain, where one object will always default on a failed lookup to searching within another object, you can use `var newObj = Object.create(oldObj)`. `newObj` will now default to looking up any failed lookups in `oldObj`. The values will be calculated during the lookup time, as the values are not stored or copied into the new object. The new object has a link to the old object and will perform on a lookup on the old object in its current state.

## References

2. http://underscorejs.org/#extend
3. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create
4. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes
5. https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Test_your_skills:_Object-oriented_JavaScript
6. https://stackoverflow.com/questions/44391149/es6-classes-ability-to-perform-polymorphism
7. https://radialglo.github.io/blog/2014/11/24/understanding-pseudoclassical-inheritance-in-javascript/