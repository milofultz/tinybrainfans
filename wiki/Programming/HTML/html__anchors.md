---
title: Anchor Tags (HTML)
---

## In-page Navigation

Using an `#id` as your `href` and either setting the  `name` attribute of an anchor tag or the `id` of an element, you can navigate immediately within a document via a normal anchor link.

```html
<a href="#bob">Click here to go to bob!</a>

<!-- a bunch of other stuff -->

<a name="bob"></a>
<!-- or -->
<div id="bob">
  <img src="pic/of/bob" />
</div>
```

## Download

Using the `download` attribute will instruct the browser to download the file enclosed in the value of the download attr. The value is optional.

```html
<a href="file.pdf" download>Download Here</a>
<a href="file.pdf" download="new-filename.pdf">Download Here</a>
```

So far I have not seen the attribute force a download of a file, but I have seen it change the download name of the file re: things like PDFs.

## References

1. https://stackoverflow.com/questions/23825871/how-to-force-a-download-file-prompt-instead-of-displaying-it-in-browser-with-htm
2. https://www.w3schools.com/tags/att_a_download.asp