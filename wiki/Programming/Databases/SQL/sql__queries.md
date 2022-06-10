---
title: Common SQL Queries
description: These are some common SQL queries that come up.
---

These are some common {{SQL}} queries that come up. All `?` symbols represent a place where you would dynamically insert info, like with Node's {{MySQL}} module.

## Retrieval

Get the info from all rows with a given email

```mysql
SELECT * FROM example_table
  WHERE email = ?;
```

[See if more than one entry exists with a given email][duplicates]

```mysql
SELECT email, COUNT(email) 
  FROM example_table
  GROUP BY email
  HAVING COUNT(email) > 1;
```

## References

[duplicates]: https://learnsql.com/blog/how-to-find-duplicate-values-in-sql/  "Finding duplicate values in SQL"

