---
title: HTML Tables
description: The basics of HTML5 tables and semantic HTML tables.
---

The basics of {{HTML5|HTML}} tables and {{semantic HTML}} tables.

## Summary of All Elements

```html
<table summary="Extended summary for accessibility and screen readers">
	<!-- caption or title -->
  <caption>Caption</caption>
  <thead>
		<!-- row -->
    <tr> 
			<!-- col header -->
      <th abbr="Shortened heading for accessibility/screen readers" scope="col">Header 1</th>
      <th abbr="Shortened heading for accessibility/screen readers" scope="col">Header 2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <!-- row header -->
      <th abbr="Shortened heading for accessibility/screen readers" scope="row">Row Header</th>
			<!-- table data -->
      <td>Some data</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td>Footer data 1</td>
      <td>Footer data 2</td>
    </tr>
  </tfoot>
</table>
```

More complex tables with empty cells/row headers have added accessibility needs, like **scope="col/row"** depending on what the header organizing.

## Merging Cells

The colspan attribute is used to **span a single cell across multiple columns** within a table, while the rowspan attribute is used to **span a single cell across multiple rows**. Each attribute accepts an integer value that indicates the number of cells to span across, with 1 being the default value.

```html
<tr rowspan="2">
   <td colspan="3">...</td>
</tr>
```

**This can't be done using {{CSS}}. It must be done using inline styles.** 

## Borders

The **border-collapse** property determines a table’s border model. There are three values for the border-collapse property: **collapse, separate, and inherit**. By default, the border-collapse property value is separate, meaning that all of the different borders will stack up next to one another, as described above. The collapse value, on the other hand, condenses the borders into one, choosing the table cell as the primary border.

The **border-spacing** property may accept two length values: the first value for horizontal spacing and the second value for vertical spacing.

## References

1. https://learn.shayhowe.com/html-css/organizing-data-with-tables/
2. https://www.456bereastreet.com/archive/200410/bring_on_the_tables/