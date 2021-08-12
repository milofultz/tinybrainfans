---
title: MongoDB
description: MongoDB is a NoSQL database management system using documents similar to JSON.
---

MongoDB is a {{NoSQL}} {{database}} management system using documents similar to {{JSON}}.

## Getting Started

This will start a new project using your local server and {{mongoose}} via {{node}}.

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
  // Create schema for collection
  const kittySchema = new mongoose.Schema({
    name: String,
    color: {
      type: String,
      enum: ['brown', 'orange'],
    },
  });
  const Cat = mongoose.model('Cat', { name: String }); 
  
  const kitty = new Cat({ 
    name: 'Zildjian',
    color: 'orange'
  });         // Create a new document of Cat
  console.log(kitty.name);                             // 'Zildjian'
  kitty.save()
    .then(() => console.log('meow'));        					 // Save the new document in the Cat collection
});
```

In the terminal, run `node server.js`. This should log `'Zildjian'` along with `meow`.

## Indexes

If your collection does not have an index, your query could take a very long time, as it will have to scan every single document within your collection and analyze it to see if it matches your query.

```mongosh
// create an index in collectionName from highest score to lowest
db.collectionName.createIndex( { score: -1 } )
```

## Data Import

Use [`mongoimport`][] to bring in Extended {{JSON}}, {{CSV}}, or {{TSV}} files to your Mongo database. First, start up your database, and then use [`mongoimport`][] in the command line:

```bash
#             use the PetHotel db      use header line as field names
$ mongoimport --db=PetHotel --type=csv --headerline --file=pets.csv

# If no header line is availabe:       list them out after the --fields option
$ mongoimport --db=PetHotel --type=csv --fields=_id,name,type --file=pets.csv
```

### Types

You can specify the [types](https://docs.mongodb.com/database-tools/mongoimport/#std-option-mongoimport.--columnsHaveTypes) of the columns within the header line of your CSV.

```csv
id.int32(),summary.string(),recommend.boolean(),helpfulness.int32()
1,"This product was great!",true,8
```

```bash
$ mongoimport --db=PetHotel --type=csv --headerline --columnsHaveTypes --file=pets.csv
```

### Null Values

If you have null values in your CSV, you can remove these `null` values between two commas (or after one if at the end of a line) and tell mongoimport to `--ignoreBlanks`. This won't import null values, but when interacting with your database, you can use the [`$exists`](https://docs.mongodb.com/manual/reference/operator/query/exists/#mongodb-query-op.-exists) query operator to query for them and [`$ifNull` ](https://docs.mongodb.com/manual/reference/operator/aggregation/ifNull/#mongodb-expression-exp.-ifNull) to cast missing fields as `null` in an aggregation pipeline.

In the below example, the summary is null, but we still want it to accept strings.

```csv
id.int32(),summary.string(),recommend.boolean(),helpfulness.int32()
1,null,true,8
```

If we were to import this as is, we would end up with a summary field containing an empty string. After replacing the `,null,` with `,,` and using `--ignoreBlanks` on import, this field ends up missing, which is the desired behavior. 

To query for fields that have a missing of `null` field:

```mongosh
> db.collection_name.find({ summary: { $exists: false }})
```

And to get the field back with a `null` value in the place of that missing field:

```mongosh
> db.collection_name.aggregate([
... // match document with id of 1
... { $match: { id: 1 }},
... // show all fields and cast summary to null if missing
... { $project: {
... 	_id: 0,
... 	id: 1,
... 	summary: { $ifNull: [ '$summary', null ]},
... 	recommend: 1,
... 	helpfulness: 1
... }}
... ]);
```

## Data Modification

If you need to modify data that already exists in a document due to a bad import or whatever, you can run a command like this in the mongo shell to change the values in place.

Let's assume a collection of dogs:

```javascript
[
  {
    "_id": ...,
    "name": "Doggo",
    "goodBoy": "true", // should be a boolean
    "enemy": "null",   // or could be "mailman" or other string
  },
  ...
]
```

When completed, this will change all `goodboy` properties to a boolean and if `enemy` was imported with `null` as the string, it will convert it into an actual null value. The `bulkWrite` is done as it is **much** faster than sending individual requests.

```javascript
var requests = [];
var cursor = db.dogs.find({});

cursor.forEach(item => {
  requests.push({ 
    "updateOne": {
      "filter": { "_id": item._id },
      "update": { 
        "$set": { 
          "goodBoy": Boolean(item.goodboy),
          "enemy": item.enemy === 'null' ? null : item.enemy
        }
      }
    }
  });
  
  if (requests.length === 1000) {
    // Execute per 1000 operations and re-init
    db.dogs.bulkWrite(requests);
    requests = [];
  }
});

if (requests.length) {
  db.dogs.bulkWrite(requests);
  requests = [];
}
```

## Syntax

| Command                                                   | Effect                                                       |
| --------------------------------------------------------- | ------------------------------------------------------------ |
| `show dbs`                                                | List all databases on the given server                       |
| `use database_name`                                       | Enter into `database_name`, preparing to query.              |
| `db.dropDatabase()`                                       | Delete the selected database                                 |
| `show collections` / `show tables`                        | List all collections/tables in the selected database.        |
| `db.collection_name.find()`                               | Return all documents in collection `collection_name`.        |
| `db.collection_name.find({name: 'John'})`                 | Return all documents in `collection_name` whose name is John. |
| `db.collection_name.insert({name: 'John', age: 40})`      | Create a document in `collection_name` (note: if a new collection is selected via `use`, this will create the new collection) |
| `db.collection_name.renameCollection('newName', dropOld)` | Rename `collection_name` to `newName` and if drop old table if `dropOld` is true. |

## References

- https://www.mongodb.com/basics/examples
- https://www.mongodb.com/basics/create-database
- https://docs.mongodb.com/manual/core/databases-and-collections/
- https://docs.mongodb.com/manual/core/aggregation-pipeline/
- https://database.guide/import-a-csv-file-into-mongodb-with-mongoimport/
- https://docs.mongodb.com/manual/indexes/
- https://stackoverflow.com/questions/37718005/change-document-value-from-string-to-objectid-using-update-query
- https://www.mongodb.com/developer/how-to/SQL-to-Aggregation-Pipeline/
- https://docs.mongodb.com/database-tools/mongoimport/#std-label-example-csv-import-types

[`mongoimport`]: https://docs.mongodb.com/database-tools/mongoimport/
