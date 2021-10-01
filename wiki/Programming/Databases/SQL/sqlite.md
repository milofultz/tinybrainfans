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

## References

1. https://sqlite.org/pragma.html#pragma_table_info
2. https://www.sqlite.org/datatype3.html
3. https://www.sqlite.org/lang_datefunc.html