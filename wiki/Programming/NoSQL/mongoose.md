---
title: Mongoose
description: Mongoose is a Javascript package for interacting with Mongo databases.
---

Mongoose is a {{Javascript}} package for interacting with {{Mongo}} databases.

## Schemas and Models

Basic schemas are written very simply using a standard JSON format.

The following schema is for a registration form. It has five fields, all with differing implementations. Most basic, you can just put the key followed by it's type. If you want extended functionality, you can utilize it by using object notation.

```javascript
const attendeeSchema = new mongoose.Schema({
  firstName: {
    type: String,
    required: true,
  },
  lastName: String,
  email: {
    type: String,
    required: true,
    match: /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/,
  },
  shirt: {
    type: String,
    enum: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
    required: true,
  },
  skillLevel: {
    type: String,
    enum: ['beginner', 'intermediate', 'expert'],
  }
});
```

Once your schema is created, you will then create a model that will be utilized within your code.

```javascript
// mongoose.model(collection, schema), where collection is the
// name of the collection in your database.
const Attendee = mongoose.model('attendee', attendeeSchema);
```

This makes it easy to encapsulate the whole thing inside of a file for export in a {{node}} project.

```javascript
const mongoose = require('mongoose');

const attendeeSchema = new mongoose.Schema({
	...
});

const Attendee = mongoose.model('Attendee', attendeeSchema);

module.exports = Attendee;
```

## References

1. https://mongoosejs.com/
2. https://www.npmjs.com/package/mongoose
3. https://mongoosejs.com/docs/validation.html
