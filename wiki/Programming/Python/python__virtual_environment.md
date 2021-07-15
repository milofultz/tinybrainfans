---
title: Virtual Environments (Python)
description: Virtual environments allow you to develop in a clean slate, leaving nothing to global packages and allowing easy installation by others.
---

Virtual environments allow you to develop in a clean slate, leaving nothing to global packages and allowing easy installation by others.

You are in a virtual environment for your {{Python}} project when you see the env name (in this case, literally `env`) to the left of the bash prompt.

## Create

`cd` to project folder and then type:

```bash
python3 -m venv env
```

## Activate

`cd` to project folder and then type:

```bash
source env/bin/activate
```

## Deactivate

```bash
deactivate
```
