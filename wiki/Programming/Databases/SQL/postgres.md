---
title: Postgres
description: Postgres is a relational database management system.
---

Postgres is a relational {{database}} management system.

## Getting Started

This tutorial will be for getting started with Postgres using {{node}} on a {{Mac|MacOS}}.

### Local Machine

#### Installation

Install Postgres using {{homebrew}}: `brew install postgres`

In a new terminal window, start up the local database: `postgres -U username -d database_name`, filling in the blanks as needed. If this does not work, [ensure you have the local database installed at your username](https://stackoverflow.com/questions/17633422/psql-fatal-database-user-does-not-exist). The DB can be also started using `brew services start postgres` (Be sure to stop the server when completed with your work using `brew services stop postgres`).

To enter into interactive mode, in your terminal, enter `psql`. From here, you can enter in any queries you'd like. Ensure they all end with a semicolon, or else you will not get any return back and it will throw.

#### Initialization

Create a new table in your database: `CREATE TABLE numbers( age integer );`

Insert a value into the new table: `INSERT INTO numbers VALUES (732);`

### Javascript

Initialize a new {{npm}} project, and then install `pg`, `pg-format`, and {{`express`|Express}}.

Create a new file in your project called `server.js` and copy this into it's contents:

```javascript
const express = require('express'); // Server
var pg = require('pg');             // Postgres 
var format = require('pg-format');  // For dynamic SQL queries (a la MySQL ?)

const app = express();              // Start your server

var PGUSER = '<your username>';     // Definte the username and database
var PGDATABASE = '<your username>'; // previously set up in Postgres.

var age = 732;                      // Used so we can reference our earlier insertion.

var config = {
  user: PGUSER,
  database: PGDATABASE,
  max: 10,                          // max number of clients in the pool
  idleTimeoutMillis: 30000          // how long a client is allowed to remain idle before being closed
};

var pool = new pg.Pool(config);     // Create a new connection instance

pool.connect(function (err, client, done) { // Connect to the DB
  if (err) {
    console.log(err);
  }
  app.listen(3000, function () {     // Connect to the Express server
    console.log('listening on 3000')
  });
  // Build a dynamic query using `age`
  var ageQuery = format('SELECT * from numbers WHERE age = %L', age);
	// Query the DB for all rows from the numbers table where age is = 732
  client.query(ageQuery, function (err, result) {
    if (err) {
      console.log(err);
    }
    console.log(result.rows[0]);
  });
});
```

Now in your terminal, run `node server.js` and assuming the database is still running, if should return:

```
listening on 3000
{ age: 732 }
```

## Schemas

Schemas are within a database but are ways of organizing tables, objects, functions, etc. within the database. In a database with table1, table2, and table3, a schema could hold table1 and table2, with another schema holding table2 and table3.

To create a schema, use  `CREATE SCHEMA name`, followed by the other components.

```sql
CREATE SCHEMA schema_example
	CREATE TABLE people(
    id INT PRIMARY KEY,
    name TEXT NOT NULL,
    age INT,
    birthday DATE
  )
  CREATE VIEW john_club AS
  	SELECT 
  		*
  	FROM
  		people
  	WHERE
  		name = 'John';
```

## Querying JSONB Columns

The way to retrieve the values found at given columns in a JSONB column is by using the single or double arrow, `->` and `->>` respectively. The former will retrieve the value in its original type, while the latter will return the value as a string.

```postgres
SELECT
	column_name -> 'property_name' AS display_name
FROM
	table_name;
```

## Commands

| Command                                                | Description                         |
| ------------------------------------------------------ | ----------------------------------- |
| `\dt`                                                  | Display all tables in the database  |
| `TABLE x`                                              | Show the contents of table x.       |
| `SELECT schema_name FROM information_schema.schemata;` | Show all schema in a given database |

## References

1. https://hub.packtpub.com/how-setup-postgresql-nodejs/
2. https://www.postgresqltutorial.com/postgresql-show-tables/
3. https://www.postgresqltutorial.com/postgresql-create-schema/
4. https://www.guru99.com/postgresql-view.html
5. https://gist.github.com/Kartones/dd3ff5ec5ea238d4c546
6. https://www.postgresqltutorial.com/postgresql-cheat-sheet/
7. https://kb.objectrocket.com/postgresql/how-to-query-a-postgres-jsonb-column-1433
8. https://www.postgresql.org/docs/12/functions-json.html