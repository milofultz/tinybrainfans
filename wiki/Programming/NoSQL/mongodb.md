---
title: MongoDB
description: MongoDB is a NoSQL database management system using documents similar to JSON.
---

MongoDB is a {{NoSQL}} {{database}} management system using documents similar to {{JSON}}.

## Getting Started

This will start a new project using your local server and mongoose via {{node}}.

### Local Machine

Install MongoDB using `brew services install mongodb-community`. Once installed, you can start your local server using `brew services start mongodb-community` (Be sure to stop the server when completed with your work using `brew services stop mongodb-community`).

In the terminal, start the mongo shell: `mongo`.

### Database

Creating a new database is done when a query is made.

### Node

Create a new folder and initialize a new node project using {{npm}}: `npm init -y`. Then install `npm i mongoose`.

Create a new file called `server.js` and copy this into the contents:

```javascript
const mongoose = require('mongoose');                // import Mongoose
mongoose.connect('mongodb://localhost:27017/test', { // create connection to localhost
  useNewUrlParser: true, 
  useUnifiedTopology: true
});

const db = mongoose.connection;
db.on('error', console.error.bind(console, 'connection error:'));
db.once('open', function() { 													 // Inside here is where the action happens
  const kittySchema = new mongoose.Schema({
    name: String
  });
  const Cat = mongoose.model('Cat', { name: String }); // Create schema for collection
  
  const kitty = new Cat({ name: 'Zildjian' });         // Create a new document of Cat
  console.log(kitty.name);                             // 'Zildjian'
  kitty.save()
    .then(() => console.log('meow'));        					 // Save the new document in the Cat collection
});
```

In the terminal, run `node server.js`. This should log `'Zildjian'` along with `meow`.

## Data Import

Use [`mongoimport`][] to bring in Extended {{JSON}}, {{CSV}}, or {{TSV}} files to your Mongo database. First, start up your database, and then use [`mongoimport`][] in the command line:

```bash
$ mongoimport --db=PetHotel --type=csv --headerline --file=pets.csv
#             use the PetHotel db      use header line as field names

# If no header line is availabe:       list them out after the --fields option
$ mongoimport --db=PetHotel --type=csv --fields=_id,name,type --file=pets.csv
```

## Syntax

| Command                                     | Effect                                                       |
| ------------------------------------------- | ------------------------------------------------------------ |
| `show dbs`                                  | List all databases on the given server                       |
| `use database_name`                         | Enter into `database_name`, preparing to query.              |
| `db.dropDatabase()`                         | Delete the selected database                                 |
| `show collections` / `show tables`          | List all collections/tables in the selected database.        |
| `db.collection_name.find()`                 | Return all documents in collection `collection_name`.        |
| `db.people.find({name: 'John'})`            | Return all documents in `people` whose name is John.         |
| `db.people.insert({name: 'John', age: 40})` | Create a document in `people` (note: if a new collection is selected via `use`, this will create the new collection) |

## References

1. https://www.mongodb.com/basics/examples
2. https://www.mongodb.com/basics/create-database
3. https://docs.mongodb.com/manual/core/databases-and-collections/
4. https://mongoosejs.com/
5. https://www.npmjs.com/package/mongoose
6. https://docs.mongodb.com/manual/core/aggregation-pipeline/
7. https://database.guide/import-a-csv-file-into-mongodb-with-mongoimport/

[`mongoimport`]: https://docs.mongodb.com/database-tools/mongoimport/
