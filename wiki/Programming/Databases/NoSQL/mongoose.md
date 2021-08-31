---
title: Mongoose
description: Mongoose is an NPM package that allows a simple and schema'd Javascript entrypoint to your Mongo database.
---

Mongoose is an {{NPM}} package that allows a simple and schema'd {{Javascript}} entrypoint to your {{Mongo database|MongoDB}}.

## Basics

### Setup

Install mongoose: `npm i mongoose` and ensure your {{database}} is running.

### Project

Create a new file called `server.js` and put this within.

```javascript
// Initilize database

const mongoose = require("mongoose");
const dbName = "test";
mongoose.connect(`mongodb://localhost:27017/${dbName}`, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

// Create test schema

const testSchema = new mongoose.Schema({
  name: String,
  age: Number,
  friends: [String],
});

// Create a model from your schema

// this first param is the name of your collection in your test database
const Test = mongoose.model("test", testSchema);

// Connect to database

const db = mongoose.connection;
db.on("error", console.error.bind(console, "connection error:"));
db.once("open", () => {
  console.log(`Mongoose DB "${dbName}" initialized\n`)
});
```

This will have created your basics. You can now start creating queries, inserting items into your database, etc.

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

## Remote Database

```
mongoose.connect('mongodb://username:password@host:port', {useNewUrlParser: true});
```

## Troubleshooting

### Return Object

The return of a query is not a plain Javascript object and will show weird behavior when trying to add to/remove from/modify it. If you want a plain Javascript object in return, you can use `.lean()` within your chain to cast it. 

## References

1. https://mongoosejs.com/
2. https://stackoverflow.com/questions/33614229/how-to-use-mongo-mongoose-to-connect-to-a-remote-database
3. https://mongoosejs.com/docs/connections.html
