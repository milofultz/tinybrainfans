---
title: SQLite
description: SQLite is an open-source, zero-configuration, self-contained, stand-alone, transaction relational database.
---

SQLite is an open-source, zero-configuration, self-contained, stand-alone, transaction relational {{database}} engine designed to be embedded into an application.

## Data Types (version 3)

- NULL
- INTEGER
- REAL (floating)
- TEXT
- BLOB (blob of data, stored exactly as it was input)

## Primary Key

A column with type `INTEGER PRIMARY KEY` is an alias for the `ROWID`, which is always a 64-bit signed integer.

```sqlite
CREATE TABLE IF NOT EXISTS dogs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  dog_name TEXT,
  good_boy INTEGER DEFAULT 1  -- Boolean, default is TRUE
);
```

## Foreign Keys

At the end of your schema, add the line `FOREIGN KEY(col_name) REFERENCES foreign_table_name(foreign_col_name)`.

```sqlite
-- Referencing the above table `dogs`
CREATE TABLE IF NOT EXISTS owners (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  dog_id INTEGER,
  FOREIGN KEY(dog_id) REFERENCES dogs(id)
);
```

## Date and Time

Dates and times can be stored three different ways:

- **TEXT** as ISO8601 strings (`"YYYY-MM-DD HH:MM:SS.SSS"`).
- **REAL** as Julian day numbers, the number of days since noon in Greenwich on November 24, 4714 B.C. according to the proleptic Gregorian calendar.
- **INTEGER** as Unix Time, the number of seconds since 1970-01-01 00:00:00 UTC.

### Date

Dates can be input as a string (formatted like `"YYYY-MM-DD"`) via the `date()` function.

```sqlite
CREATE TABLE IF NOT EXISTS datetimes (
  date TEXT
);

INSERT INTO
  dates
VALUES
  (date("2021-10-01")),
  (date("2000-01-01"));
  
-- results in two rows being added as 
-- [("2021-10-01"), ("2000-01-01")] 
```

## PRAGMA

PRAGMA commands are SQLite specific and are meta commands regarding operation or non-table data.

### Get column information of a given table

```sqlite
PRAGMA table_info(table_name)
```

## Use with shell

Open a SQLite3 database using the CLI. Install this shell using `brew install sqlite3`.

```shell
$ sqlite3 path/to/file.db
```

In this shell, you can make any query as normal.

### Pretty Printing

You can output a ton of different types for display/output purposes using the `.mode` command:

-  ascii
-  box
-  csv
-  column
-  html
-  insert
-  json
-  line
-  list
-  markdown
-  quote
-  table
-  tabs
-  tcl

### Output To File

```shell
# Choose the output mode
sqlite> .mode csv
# Set the output file
sqlite> .output output-file.csv
# Do your query
sqlite> SELECT * FROM table;
```

## Use with {{Node}}

First, install `sqlite3` with {{yarn}} or {{npm}}. Bring in the package in your new file and instantiate an in-memory database:

**server.js**

```javascript
const sqlite3 = require('sqlite3').verbose();

const db = new sqlite3.Database(':memory:', (err) => {
  if (err) {
    return console.error(err.message);
  }
  console.log('Connected to the in-memory SQlite database.');
});
```

Instead of `:memory:`, you can also use the path to a SQLite database file.

### Queries

`db.run` takes multiple arguments. First is the query itself, followed by an optional array of data to be escaped and injected, and lastly the callback which has a single `error` parameter.

```javascript
// With escaped arguments

const sql = `
  SELECT
    *
  FROM
    table
`;

db.run(sql, function(err) {
  if (err) {
    return console.error(err.message);
  }
  console.log(`Row(s) updated: ${this.changes}`);
});
```

With escaped arguments:

```javascript
const sql = `
  UPDATE
    table
  SET
    name = ?
  WHERE
    name = ?
`;
const data = ['Ansi C', 'C'];

db.run(sql, data, function(err) {
  if (err) {
    return console.error(err.message);
  }
  console.log(`Row(s) updated: ${this.changes}`);
});
```

### Serialize and Parallelize

Using the `db.serialize(() => {...})` wrapper will guarantee that the queries inside of it will complete before returning. For instance, running a table creation query and then trying to insert directly after won't work outside of a `serialize` wrapper because the `db.run` invocation returns immediately, thus not waiting for it to finish. The entire *wrapper* also waits for the inner queries to finish before returning anything, so is useful in database instantiation.

`parallelize` will not block and as far as I can tell, runs the same as if you put them all outside of the wrapper.

## References

1. https://sqlite.org/pragma.html#pragma_table_info
2. https://www.sqlite.org/datatype3.html
3. https://www.sqlite.org/lang_datefunc.html
4. https://www.sqlitetutorial.net/sqlite-nodejs/connect/
5. https://stackoverflow.com/questions/41949724/how-does-db-serialize-work-in-node-sqlite3
6. https://formulae.brew.sh/formula/sqlite
7. https://sqlite.org/cli.html