---
title: SQLite
---

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
	id INTEGER PRIMARY KEY,
	dog_name VARCHAR(10),
	good_boy INTEGER DEFAULT 1  -- Boolean, default is TRUE
);
```

## PRAGMA

PRAGMA commands are SQLite specific and are meta commands regarding operation or non-table data.

### Get column information of a given table

```sqlite
PRAGMA table_info(table_name)
```

## References

1. https://sqlite.org/pragma.html#pragma_table_info