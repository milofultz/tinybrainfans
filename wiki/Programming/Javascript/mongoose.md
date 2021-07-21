---
title: Mongoose (Javascript)
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

## Troubleshooting

### Return Object

The return of a query is not a plain Javascript object and will show weird behavior when trying to add to/remove from/modify it. If you want a plain Javascript object in return, you can use `.lean()` within your chain to cast it. 

## References

1. https://mongoosejs.com/
