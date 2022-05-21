---
title: Flask
description: Flask helps build web applications and handle HTTP requests in Python.
---

Flask helps build web applications and handle HTTP requests in {{Python}}.

## Quick Start[1]

Create a new {{virtual environment|Virtual Environments (Python)}} in your project folder and `pip3 install flask`.

In your project, make a new file called `app.py` and add this:

```python
from flask import Flask

# Instantiate the application based on this file
app = Flask(__name__)

# Decorator used to handle HTTP requests (GET by default)
# When a user goes to the root of the web page,
@app.route("/")
# Execute the following function
def hello_world():
  	# Return the following webpage to the user
    return "<p>Hello, World!</p>"
```

In the project folder, you should now be able to `flask run`, which will create a development server at localhost. Go to the listed address and check if your Hellow World app is up.

## References

1. https://flask.palletsprojects.com/en/2.1.x/quickstart/