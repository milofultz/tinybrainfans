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

## Outputting Dicts

You can output dicts instead of tuples by using the following from the docs:

```python
import sqlite3

def dict_factory(cursor, row):
    d = {}
    for idx, col in enumerate(cursor.description):
        d[col[0]] = row[idx]
    return d

con = sqlite3.connect(":memory:")
con.row_factory = dict_factory
cur = con.cursor()
cur.execute("select 1 as a")
print(cur.fetchone()["a"])

con.close()
```

## Pretty Printing

You can pretty print query resullts using the {{Pandas|Pandas (Python)}} module.

```python
import pandas as pd
import sqlite3

# set up the database

# Allow results to expand in width
pd.options.display.max_colwidth = 200

cursor.execute('''SELECT * FROM table''')
print(pd.DataFrame(cursor.fetchall()))
```

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
4. https://docs.python.org/3/library/sqlite3.html#sqlite3.Connection.row_factory