---
title: JSON (Python)
---

## Load {{JSON}} from file

```python
def load_json(fp):
    with open(fp, 'r') as f:
        output = json.load(f)
    return output
```

## Save to JSON file

```python
def save_json(fp):
    with open(fp, 'w') as f:
        # with pretty output kwargs
        json.dump(sample, f, indent=4, sort_keys=True)
```

## References:

1. https://docs.python.org/3/library/json.html
2. {{Python}}