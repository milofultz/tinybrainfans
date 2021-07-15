---
title: Model View Controller
description: This design pattern is used to separate functionality, logic, and component management.
---

This design pattern is used to separate functionality, logic, and component management. MVC can feel or seem confusing because there is not one way to do it, and many different frameworks that utilize MVC do it differently from one another.

## Components

### Model

The model is the **brain** of the application, responsible for getting and manipulating the data. It is often interacting with some kind of {{database}} or data in a file.

The model is often communicating with the **controller**, which is requesting data and/or updating the **view**. Sometimes the updating of the view is delegated to the model, sometimes to the controller.

### View

This is what the user interacts with. In web development, this is usually made up of {{HTML}} and {{CSS}}.

The view is usually told what to show by the **controller** by being given dynamic values, usually with some kind of template engine, like {{Handlebars}}, ERV, HAML, {{Jinja2}}, etc.

### Controller

The controller takes in user input and decides what to do with it. Usually the user interaction with the browser will go through some kind of **router** which will then give the controller a specific method to execute.

The controller acts as a middleman between the **controller** and the **view**. It takes the user input, passes it to the **model** which will then return some data to the controller, who then tells the **view** what to display to the user.

### Example Frameworks Using MVC

- Ruby on Rails
- Sinatra
- Laravel
- Codeigniter
- Zend
- {{Express}}
- Backbone
- {{Angular}}
- Django
- Flask
- {{React}} (view)

---

### References:

1. https://www.youtube.com/watch?v=pCvZtjoRq1I
2. https://www.youtube.com/watch?v=DUg2SWWK18I