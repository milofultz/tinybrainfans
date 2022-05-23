---
title: SQL
description: SQL is a Structured Query Language that uses a relational database. A relational database represents a collection of related 2D tables, like spreadsheet.
---

SQL is a Structured Query Language that uses a relational {{database}}. A relational database represents a collection of related 2D tables, like spreadsheet. **Tables** of information about a certain thing hold **rows** that are specific instances of that thing with **columns** that show shared characteristics of those instances.

**Database schemas** describe the structure of each table and the datatypes that each column can contain.

## Basic Syntax Rules

NOTE: Most of this document pertains to {{MySQL}}.

The end of a query is denoted with a **semicolon**. 

**Comments** are made with `--`. 

**Whitespace** and line returns are optional but often added for readability.

SQL queries are **case insensitive**, but by convention, the SQL commands and keywords are place in all capital letters to be easier to read by humans.

Tables and columns can be escaped by using **backticks** to avoid overlaps with reserved words.[9]

## Creating/Using Databases

First, you want to see what databases exist using the **SHOW DATABASES** keyword.

```mysql
SHOW DATABASES;
```

We will use the **CREATE DATABASE** keyword to initialize a database. TO enter into the database

```sql
CREATE DATABASE name;
USE name;
```

## Creating/Altering Tables

```mysql
SHOW TABLES;
```

### CREATE TABLE / IF NOT EXISTS

What it sounds like, will make a new table. Use `IF NOT EXISTS` to skip if table exists. The structure of the table is defined by its table schema, which is a series of columns in the following parentheses. 

```sql
CREATE TABLE friends (
	column DataType TableConstraint DEFAULT dafault_value,
	...
);
```

```sql
CREATE TABLE IF NOT EXISTS dogs (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	dog_name VARCHAR(10),
	good_boy INTEGER DEFAULT 1  -- Boolean, default is TRUE
);
```

### ALTER TABLE

Choose the table you want to modify with **ALTER TABLE** followed by the table name. Columns can be added by using the **ADD COLUMN** statement[6], removed by using the **DROP** statement, and renamed with **RENAME TO**.

```mysql
ALTER TABLE dogs
RENAME TO dog_types
ADD COLUMN breed VARCHAR(20) AFTER col_name  -- can also use FIRST
DROP dog_name;
```

### DROP TABLE / IF EXISTS

[(Necessary XKCD)](https://xkcd.com/327/): "Little Bobby Tables"

**DROP TABLE** will remove an entire table and all of the data from the database. **IF EXISTS** will make sure no error is thrown if the table doesn't exist.

```sql
DROP TABLE IF EXISTS problems;
```

## Table Data Types

| Data type                                      | Description                                                  |
| ---------------------------------------------- | ------------------------------------------------------------ |
| INTEGER, BOOLEAN                               | The integer datatypes can store whole integer values like the count of a number or an age. In some implementations, the boolean value is just represented as an integer value of just 0 or 1. |
| FLOAT, DOUBLE, REAL                            | The floating point datatypes can store more precise numerical data like measurements or fractional values. Different types can be used depending on the floating point precision required for that value. |
| CHARACTER(num_chars), VARCHAR(num_chars), TEXT | The text based datatypes can store strings and text in all sorts of locales. The distinction between the various types generally amount to underlaying efficiency of the database when working with these columns. Both the CHARACTER and VARCHAR (variable character) types are specified with the max number of characters that they can store (longer values may be truncated), so can be more efficient to store and query with big tables. |
| DATE, DATETIME                                 | SQL can also store date and time stamps to keep track of time series and event data. They can be tricky to work with especially when manipulating data across timezones. |
| BLOB                                           | Finally, SQL can store binary data in blobs right in the database. These values are often opaque to the database, so you usually have to store them with the right metadata to requery them. |

## Table Constraints

Constraints are a special expression in the table's initialization that directs the table to operate in a specific way.

```sql
CREATE TABLE IF NOT EXISTS products (
  product_id INT AUTOINCREMENT,
  name TEXT,
  PRIMARY KEY(product_id)
);

CREATE TABLE IF NOT EXISTS reviews (
  review_id INT AUTOINCREMENT,
  product_id INT,
  FOREIGN KEY(product_id)
    REFERENCES products(product_id)
);
```

| Constraint         | Description                                                  |
| ------------------ | ------------------------------------------------------------ |
| PRIMARY KEY        | This means that the values in this column are unique, and each value can be used to identify a single row in this table. |
| AUTOINCREMENT      | For integer values, this means that the value is automatically filled in and incremented with each row insertion. Not supported in all databases. |
| UNIQUE             | This means that the values in this column have to be unique, so you can't insert another row with the same value in this column as another row in the table. Differs from the `PRIMARY KEY` in that it doesn't have to be a key for a row in the table. |
| NOT NULL           | This means that the inserted value can not be `NULL`.        |
| CHECK (expression) | This allows you to run a more complex expression to test whether the values inserted are valid. For example, you can check that values are positive, or greater than a specific size, or start with a certain prefix, etc. |
| FOREIGN KEY        | This is a consistency check which ensures that each value in this column corresponds to another value in a column in another table. For example, if there are two tables, one listing all Employees by ID, and another listing their payroll information, the `FOREIGN KEY` can ensure that every row in the payroll table corresponds to a valid employee in the master Employee list. |

## Queries/Retrieving Data

**SELECT...FROM** statements are queries of `column FROM table`. **DISTINCT** will remove results that are the same, meaning that they have matching sets of columns in the return. Certain columns could have duplicate values, but ALL of the columns need to match up to another result for it to be considered a duplicate.

```sql
SELECT columnName, anotherColumn 
FROM tableName;

SELECT DISTINCT columnName, anotherColumn 
FROM tableName;
```

### WHERE

The **WHERE** clause helps filter out results via a condition. **AND** or **OR** can be used to chain these.

```sql
SELECT columnName, anotherColumn 
FROM tableName
WHERE a = b
	AND a = c
	OR c = b
```

Results of a query can be sorted via the **ORDER BY** keywords, followed by **ASC** or **DESC** (**ASC** is the default).

```sql
SELECT columnName, anotherColumn 
FROM tableName
WHERE a = b
ORDER BY columnName ASC;
```

Results can also be tested against whether a column's value is within a list of values.

```mysql
SELECT columnName, anotherColumn 
FROM tableName
WHERE a IN ('list', 'of', 'values');
```

### LIMIT/OFFSET

Results can be limited via the **LIMIT** and the **OFFSET** keywords. "The LIMIT will reduce the number of rows to return, and the optional OFFSET will specify where to begin counting the number rows from."

```sql
...
LIMIT num_limit OFFSET num_offset
```

### CONCAT

**CONCAT** allows you to group the values of multiple fields together and call it a new 'field' upon return. **CONCAT** can take multiple arguments and strings to affix together. 

```mysql
SELECT * 
FROM clients c
WHERE c.client = 17
	AND c.client IN (
		# The following line combines the values of `active_client` and `alt_clients`, separated by a comma 
		# and effectively creates a new field called 'all_clients'.
		SELECT CONCAT(active_client, ',', alt_clients) AS all_clients 
		FROM users
		WHERE userId = 7070
	);
```

### JOIN

We can join the data within two or more tables with the **JOIN** clause. The two tables can be linked by a certain column with **ON** followed by an expression. (note: **OUTER** is added in as a legacy keyword for SQL-92)

* **INNER**: Using something that is constant among both tables, usually a key like ascending numbers like IDs or a common string, this will create rows containing both table's data. This will exclude any data that is not found in both tables at that common key.
* **FULL** (OUTER): This will keep all rows from both tables within the query, even if a matching row does not exist within one of the tables.
* **LEFT** (OUTER): This keeps anything from the table found after FROM (Left), even if no matching row is found in the table found after JOIN (Right).
* **RIGHT** (OUTER): This keeps anything from the table found after JOIN (Right), even if no matching row is found in the table found after FROM (Left).

#### Inclusive/Exclusive

**Inclusive** JOINs will use the `ON table1.key = table2.key`, matching one column to another. **Exclusive** JOINs follow this with a filter on the focused table set to `WHERE table.key IS NULL`.

Where `n` is the two table's intersection, `u` is the union of the two tables, and `-` is exclusion.

- **INNER**: AnB
- **LEFT (Including RIGHT)**: Au(AnB)
- **LEFT (Excluding RIGHT)**: A-B
- **RIGHT**: (AnB)uB
- **RIGHT (Excluding LEFT)**: B-A
- **FULL/OUTER**: AuBu(AnB)
- **OUTER (Excluding INNER)**: (A-B)u(B-A)

```sql
-- This is a venn diagram with both circles fully selected
SELECT * 
FROM table1
FULL JOIN table2 -- or INNER or LEFT, etc.
	ON table1.id = table2.id
-- This can be altered to exclude what overlaps
WHERE table1.id IS NULL 
	OR table2.id IS NULL
```

### AS

Expressions, columns, and tables can all be given aliases using the **AS** keyword.

```sql
SELECT col_name AS foo -- 'col_name' has been aliased to 'foo'
FROM table_name AS bar; -- 'table_name' has been aliased to 'bar'
```

### Aggregate Functions

Aggregate functions run on the entire column. They include operations like `COUNT`, `MIN`, `MAX`, `AVG`, and `SUM`, with the desired columns surrounded by parentheses.

```sql
-- returns a single entry with number of entries in col_name
SELECT COUNT(col_name) 
FROM table_name;

-- returns a single entry with lowest ERA of all pitcher data
SELECT MIN(era) 
FROM pitcher_stats;
```

These functions can also be run on subsections of these columns using **GROUP BY**, followed by which segments should be calculated together.

```sql
-- returns an entry for the player with lowest ERA on each team
SELECT player_name, 
	MIN(era) FROM pitcher_stats
GROUP BY team_name;
```

Further filtering of what should be included in each GROUP can be done with **HAVING**, which operates like WHERE on the GROUP BY element.

```sql
-- returns an entry for the player with lowest ERA above 2 on each team
SELECT player_name, 
	MIN(era) FROM pitcher_stats
GROUP BY team_name
HAVING era > 2;
```

### EXISTS - Boolean Check[5]

You can use **SELECT EXISTS (...)** with an enclosed query to return either a 0 (false) or 1 (true) on if any rows were returned.

```mysql
-- will return 1 if any rows are found where the name field contains 'John'
SELECT EXISTS (
	SELECT * 
  FROM example_table
	WHERE name = 'John'
);
```

### Order of Query Execution

1. FROM and JOIN (loading in data)
2. WHERE (filtering data)
3. GROUP BY (creating groups)
4. HAVING (filtering data for each group)
5. SELECT (selecting the columns)
6. DISTINCT (removing duplicates)
7. ORDER BY (organizing results)
8. LIMIT and OFFSET (limiting results)

## Adding/Changing Rows

### INSERT INTO / VALUES

The **INSERT INTO** statement describes which table will have data inserted, and the **VALUES** statement includes all the values of the given row that will go into each column enclosed by parentheses and separated by commas within it. VALUES can correspond to multiple rows by separating the sets of values by commas.

With incomplete data or default values, you can choose which exact columns you want to add data to by following **INSERT INTO table_name** with a set of columns within parentheses and separated by commas. Inserting data this way *ensures* forward compatibility, as any new columns that are hardcoded into later versions of the table will not be affected.

```sql
INSERT INTO mytable (column_name, another_column_name)
VALUES (value_or_expr, another_value_or_expr),
	(value_or_expr_2, another_value_or_expr_2);
```

### UPDATE / SET

**UPDATE** is followed by the name of the table, with **SET** followed by `column_name = value_or_expr` pairs. These can be used in conjunction with **WHERE** to filter which rows you want updated.

It is recommended to query the items you are going to update before updating them, to ensure you are correctly select what you want.

```sql
-- Update all costs of candy in food I like by raising them 3%
UPDATE food_i_like
SET cost = cost * 1.03,
	updated = "2021-01-01"
WHERE 
	type = "candy";
```

### DELETE FROM 

The **DELETE** statement describes the table to focus on, with **WHERE** describing which rows to delete (*leaving out WHERE will delete the entire table!*). If you only are trying to get rid of one thing, use **LIMIT 1** to redundantly ensure you *do*.

It is recommended to query the items you are going to delete before updating them, to ensure you are correctly selecting what you want.

```sql
DELETE FROM food_i_like
WHERE name = "Good & Plenty"  -- always have WHERE to limit deletion
LIMIT 1;  -- always include this to limit deletion to ONLY one row
```

## Variables

A SQL variable is defined by calling **DECLARE** followed by the variable name preceded by the `@` symbol, after which you declare the type. To set the value, use the **SET** keyword followed by the assignment. In MySQL, you only use the **SET** keyword followed by either an equals or a colon-equals.

```mysql
DECLARE @NewVariable AS VARCHAR(50);
SET @NewVariable = "Cool!";
```

## Meta Operators

Name | Function
--- | ---
(boolean expression) AND (boolean expression) | WIll return true if both are true 
(boolean expression) OR (boolean expression) | Will return if either is true 


## Conditional Operators

Operator | Condition | SQL Example
--- | --- | ---
=, !=, < <=, >, >= | Standard numerical operators | col_name != 4
BETWEEN … AND … | Number is within range of two values (inclusive) | col_name BETWEEN 1.5 AND 10.5
NOT BETWEEN … AND … | Number is not within range of two values (inclusive) | col_name NOT BETWEEN 1 AND 10
IN (…) | Number exists in a list | col_name IN (2, 4, 6)
NOT IN (…) | Number does not exist in a list | col_name NOT IN (1, 3, 5)
IS NULL/IS NOT NULL | Value is or is not NULL | col_name IS/IS NOT NULL

## Expressions

Many different types of expressions can be used with: **WHERE** to better filter results; and **SELECT** to create new columns of results (column expressions). While there are a few different types of expressions, the examples below are both numeric type expressions. Expressions can also utilize aggregate functions.

```sql
-- Used in WHERE; filters above 0° Celsius
SELECT Temperature FROM 2000_Temp_Data
WHERE ((Temperature - 32) * 5) / 9 > 0;

-- Used in a column expression, displays another column named 'Celsius'
SELECT Fahrenheit, ((Temperature - 32) * 5) / 9 AS Celsius
FROM 2000_Temp_Data;
```

## Formatting

There are many different opinions about how to format correctly (see below), but the one that I believe to be the most readable is formatted as such, with the capitalized `INSTRUCTION` on one line and lowercase `args` on the following line with indentation. Indentation is also used to define subqueries and bracketed blocks, with terminating brackets on their own line. `AND` and `OR` should start their lines and should not reside at the end.

```sql
SELECT
	r.last_name,
  (
    SELECT
      MAX(YEAR(championship_date))
    FROM
      champions AS c
    WHERE
      c.last_name = r.last_name
      AND c.confirmed = 'Y'
  ) AS last_championship_year
FROM 
	riders AS r
WHERE 
	r.last_name IN (
    SELECT
    	c.last_name
    FROM 
    	champions AS c
    WHERE 
    	YEAR(championship_date) > '2008'
    	AND c.confirmed = 'Y'
  );
```

## References

1. {{Common SQL Queries}}
2. https://sqlbolt.com/
3. https://www.mysqltutorial.org/mysql-primary-key/
4. https://www.educba.com/mysql-constraints/
5. https://www.tutorialspoint.com/best-way-to-test-if-a-row-exists-in-a-mysql-table
6. https://www.mysqltutorial.org/mysql-add-column/ 
7. Schema Design: https://ondras.zarovi.cz/sql/demo/
8. Formatting:
   1. https://www.sqlstyle.guide/
   1. https://docs.telemetry.mozilla.org/concepts/sql_style.html
   1. https://learnsql.com/blog/24-rules-sql-code-formatting-standard/
   1. https://stackoverflow.com/questions/519876/sql-formatting-standards
9. https://devtut.github.io/mysql/backticks.html

