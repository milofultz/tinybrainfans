---
title: SQLite3 (Python)
---

How to use {{SQLite}} with {{Python}}.

## Opening/Closing Connections and Command Execution

After importing the built-in `sqlite3` module, you need to establish a connection with your {{database}}. 

```python
import sqlite3

conn = sqlite3.connect("database.db") # if found at filepath
conn = sqlite3.connect(":memory:")    # to use RAM (flushed after use)
```

After creating the connection, create a cursor object and use it to run {{SQL}} commands via `execute`.

```python
c = conn.cursor()
c.execute("""--sql-goes-here""")
```

Once all commands have been run, be sure to commit your changes and close the connection.

```python
conn.commit()
conn.close()
```

## .fetchone() and .fetchall()

After you have executed a `SELECT` command, you can use the cursor as an iterator with `fetchone()`, which will recall each returned row one by one, or `fetchall()` to return all rows at once.

## Get table names from database

```sql
SELECT name 
FROM sqlite_master 
WHERE type = 'table';
```

## References

1. https://docs.python.org/3/library/sqlite3.html
2. https://sqlite.org/autoinc.html
3. https://sqlite.org/datatype3.html