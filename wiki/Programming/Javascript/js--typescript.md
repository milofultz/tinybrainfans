---
title: Typescript
description: Typescript is a superset of Javascript that is strongly typed and values specificity.
---

Typescript is a superset of {{Javascript}} that is strongly typed and values specificity.

## Type Annotations

Type annotations are done at the declaration of a variable with a colon followed by the type or interface.

```typescript
const greeting: string = "Hello there!";
const numbers: number[] = [1, 2, 3, 4];
const uniqueCharacters: Set<string> = new Set(['a', 'b', 'c']);
interface Person {
  name: string,
  age: number,
  sayHi: () => string,
}
const johnSmith: Person = {
  name: "John Smith",
  age: 40,
  sayHi: () => return greeting;
}
```

### Annotations with Object Destructuring

```typescript
// without annotation
const getNameAndAge = ({ person, job }) => {
  const {
    name,
    age,
  } = person;
  return `${name}: ${age}, ${job}`;
};

// with annotation
const getNameAndAge = 
      ({ person, job }: { person: { name: string, age: number }, job: string }) => {
  const {
    name: string,
    age: number,
  } = person;
  return `${name}: ${age}, ${job}`;
};

// with type or interface
type Person = {
	name: string,
  age: number
};

const getNameAndAge = ({ person: Person, job: string }) => {
  const {
    name: string,
    age: number,
  } = person;
  return `${name}: ${age}, ${job}`;
};
```

### Unique Typing Troubleshooting

#### `Property '***' does not exist on type 'never'`

This means that the target variable has not ben typed correctly and often will show up when something has not been given a type at all. 

```typescript
// incorrect
const thing = 'Oh yeah!';
const things = [1,2,3,4];
const specificThing = { name: 'John', age: 9 };
// correct
const thing: string = 'Oh yeah!';
const things: number[] = [1,2,3,4];
const specificThing: InterfaceName = { name: 'John', age: 9 };
```

#### useState

With `useState` in {{React}} hooks, you will need to use a special syntax in creation of the hooks themselves. Since useState is a [generic function][], the typing happens within the `<>` characters.

```typescript
const [editedHashtagListeners, setEditedHashtagListeners] = useState<HashtagListener[]>([]);
```

## Interface and Type

Interfaces and types are two ways to define a type of object, declaring the types of the contained properties.

### Type

```typescript
type Person = {
  name: string,
  age: number,
  pets: string[]
};

const john: Person = {
  name: 'John',
  age: 40,
  pets: ['Mary', 'Doug']
};

const household: Person[] = [john];
```

### Interface

```typescript
interface Person {
  name: string,
  age: number,
  pets: string[]
};

const john: Person = {
  name: 'John',
  age: 40,
  pets: ['Mary', 'Doug']
};

const household: Person[] = [john];
```

## References:

1. https://stackoverflow.com/questions/52423842/what-is-not-assignable-to-parameter-of-type-never-error-in-typescript
2. https://stackoverflow.com/questions/53598449/react-hooks-and-typescript-property-does-not-exist-on-type-never
3. https://stackoverflow.com/questions/41443242/how-to-correct-flow-warning-destructuring-missing-annotation
4. https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#differences-between-type-aliases-and-interfaces

[generic function]: https://www.typescriptlang.org/docs/handbook/2/generics.html
