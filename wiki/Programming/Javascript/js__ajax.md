---
title: AJAX
description: AJAX stands for Asynchronous Javascript And XML. It is an asynchronous way to get and send data. Usually used with JSON. AJAX is built in to Javascript.
---

AJAX stands for Asynchronous {{Javascript}} And {{XML}}. It is an asynchronous way to get and send data. Usually used with {{JSON}}. AJAX is built in to Javascript.

When an AJAX call is made in your Javascript code, the AJAX engine takes your request and converts it into a proper XmlHttpRequest. The website that is being queried then responds (with JSON or XML) and the AJAX engine then converts it into an {{HTML}} response that can be parsed by Javascript.

Ajax is able to asynchronously handle {{HTTP}} requests and responses, interpreting the requests from JS to HTTP and responses from JSON to HTML responses. This allows a fluid application that doesn't need to refresh the browser to function.

A standard implementation of AJAX involves these steps:

1. Creating the XHR object
2. Defining the request parameters
3. Instructions on a successful and unsuccessful request
4. Sending/starting the request

## XMLHttpRequest (XHR Object)

**XMLHttpRequest** is an API that is in the form of an object, with methods and properties attached. When a request is made and when a response is received, all of that work goes on behind the scenes and this object is updated as things happen.

To use the XHR object, a new instance needs to be created and assigned to a variable.

```javascript
var xhr = new XMLHttpRequest();
```

### .open()

`.open()` is an XHR function that takes three parameters: type of request, URL or file name, and a boolean of whether it is asynchronous or not.

```javascript
xhr.open('GET', 'https://www.requestURL.com', true);
```

### .onreadystatechange

You define a function at that property, and it will run every time the `readyState` property of the XHR object changes. The readyState values are:

- 0 - Request not initialized
- 1 - server connection established
- 2 - request received
- 3 - processing request
- 4 - request finished and response is ready

```javascript
xhr.onreadystatechange = function () {
	// if the readyState property of the XHR object ('xhr') is 4
  // AND the status in the XHR object is 'OK'
  if (this.readystatechange == 4 && this.status === 200) {
    // get the responseText from the XHR object ('xhr')
    console.log(this.responseText)
  }
}
```

### .onprogress

`.onprogress` is a property that holds a function, defined by the developer, that will be called once the `readyState` is at 3, when the request is being processed.

```javascript
xhr.onprogres = function () {
	// Show the loading image or something that denotes waiting	
}
```

### .onload / .onerror

`.onload` and `.onerror` are properties that hold functions, defined by the developer, that will be called once the `readyState` is at 4, when the request is finished and response is ready, or when an error is detected.

```javascript
xhr.onload = function () {
	// if the status in the XHR object (xhr) is 'OK'
  if (this.status === 200) {
    // get the responseText from the XHR object ('xhr')
    console.log(this.responseText)
  }
};

xhr.onerror = function () {
  console.log('Request error');
};
```

### .setRequestHeader()

When making a `POST` request, you will need to set the request header. This function takes two parameters: the name of the header and the value it will have. This can be called multiple times in a row to set multiple parameters, and they will all be compiled together to one header. [Learn more about HTTP headers here](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers).

```javascript
xhr.setRequestHeader('Content-type', 'application/json');
```

### .send()

This will send the request that has already been created by `.open()`. The body of the request should be passed in as a parameter, but it is optional, like in a simple GET request.

```javascript
xhr.send();
```

## Response Data Types

All of the previous examples have been for if you are making a request for a **plaintext** file, by getting the `responseText` property from the XHR object. If your response ends up being a **{{JSON}}** file, you can parse this with `JSON.parse(this.responseText)`.

## Libraries

- {{jQuery}}
- Axios
- {{Fetch API}}
- {{Node}}

---

### References

1. https://www.youtube.com/watch?v=82hnvUYY6QA
2. https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest