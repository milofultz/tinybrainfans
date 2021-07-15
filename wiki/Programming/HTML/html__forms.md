---
title: HTML Forms
description: The basics of HTML forms, semantic HTML forms, and validation.
---

The basics of {{HTML}} forms, {{semantic HTML|Semantic HTML}} forms, and validation.

## Form Element

The `action` attribute that defines the action to be done upon submission as an address or href. The `method` is the {{HTTP method|HTTP Methods}} to use in completing the action.

## Input Types 

### Input

- Pre-HTML5 input types:
  - `button`
  - `checkbox`
  - `file`
  - `hidden`
  - `image`
  - `password`
  - `radio`
  - `reset`
  - `submit`
  - `text`
- HTML5 input types:
  - `color`
  - `date`
  - `datetime`
  - `email`
  - `month`
  - `number`
  - `range`
  - `search`
  - `tel`
  - `time`
  - `url`
  - `week`

These values were added to **provide clearer semantic meaning** for inputs as well as to provide better controls for users. Should a browser not understand one of these HTML5 type attribute values, it will automatically **fall back to the** **text** **attribute** value.

### Label

The `label` element provides a label for an input element, with its `for=""` attribute referencing the `id` attribute of the element it is to label.

```html
<input type="text" id="thing">
<label for="thing">Thing!</label>
```

### Select

The `size` attribute chooses how many choices are visible at a time. The boolean attribute `multiple`, when added to the `<select>` element for a standard drop-down list, allows a user to choose more than one option from the list at a time. 

```html
<label for="things">Things!</label>
<select id="things" name="things" multiple>
	<option value="thing1">Thing 1</option>
	<option value="thing2" selected>Thing 2</option>
</select>
```

### Textarea

A `textarea` has `rows` and `columns` attributes to determine the size, but can be done more efficiently with CSS styling.

### Button

Always include `type="button"` for compatability across browsers.

```html
<button type="button">Click Here</button>
```

### Radio Buttons and Checkboxes

A radio button and checkbox `input` element can be checked by default by adding the `checked` boolean attribute to the `input` field. This requires them being within a `form` element; otherwise they will not select correctly in all browsers.

### Fieldsets and Legends

**Fieldsets group form controls and labels into organized sections**. Much like a `<section>` or other structural element, the `<fieldset>` is a block-level element that wraps related elements, specifically within a `<form>` element, for better organization. The **`<legend>` element wraps text describing the form controls that fall within the fieldset**. The markup should include the `<legend>` element directly after the opening `<fieldset>` tag.

```html
<form action="">
  <fieldset>
    <legend>Thing Description:</legend>
    <label for="things">Things!</label>
    <select id="things" name="things" multiple>
      <option value="thing1">Thing 1</option>
      <option value="thing2" selected>Thing 2</option>
    </select>
  </fieldset>
</form>
```

## Field Validation

### Input

Use the correct input type (text, email, password, etc.)

The `pattern` attribute is used to specify a **{{regular expression|Regular Expressions}}** and the field value must match this pattern. This attribute can be used with input types like text, password, email, url, tel and search. Validation occurs upon submission.

```html
<!-- Should match if five numbers from 1 to 4 appear in a row -->
<input type="text" pattern="[1-4]{5}"> 
```

A `required` attribute indicates that a value must be specified for the input element.

```html
<input type="text" required>
```

`maxlength` is an integer value that specifies the maximum number of characters allowed for a particular input field.

```html
<input type="text" maxlength="20">
```

`min` & `max` attributes specify the lower and upper limit respectively for an input element.

```html
<input type="number" min="1" max="5">
```

## References

1. https://www.w3schools.com/html/html_form_elements.asp
2. https://stackoverflow.com/questions/3606657/radio-buttons-checked-attribute-not-working