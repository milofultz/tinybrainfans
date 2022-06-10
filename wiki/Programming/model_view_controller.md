---
title: Model View Controller
description: This design pattern is used to separate functionality, logic, and component management.
---

This design pattern is used to separate functionality, logic, and component management. MVC can feel or seem confusing because there is not one way to do it, and many different frameworks that utilize MVC do it differently from one another.

## Flow

Let's say you want to look at the new cats on cats.com. What usually happens is:

- you, a user/client, goes to this webpage. 
- This webpage sends a request to the cats.com server, and that request is managed by a **controller**. 
- This **controller** asks the **model** for all the newest cat pictures. 
- The **model** queries the database for all the newest cat pictures and gives them to the **controller**. 
- The **controller** then turns to the **view** and tells it to turn these pictures into a nice viewable webpage. 
- The **view** gives this nicely formatted webpage back to the **controller**.
- The **controller** then sends it back to you, the user or client.

```sequence
User->Controller  : Makes request for webpage
Controller->Model : Requests data for page
Model->Model      : Queries data from database
Model->Controller : Returns queried data
Controller->View  : Requests data as a webpage
View->View        : Formats data to webpage
View->Controller  : Returns webpage
Controller->User  : Returns user's webpage
```

## Components

### Model

The model is the **brain** of the application, responsible for getting and manipulating the data. It is often interacting with some kind of {{database}} or data in a file.

The model is often communicating with the **controller**, which is requesting data and/or updating the **view**. Sometimes the updating of the view is delegated to the model, sometimes to the controller.

### View

This is what the user interacts with. In web development, this is usually made up of {{HTML}} and {{CSS}}.

The view is usually told what to show by the **controller** by being given dynamic values, usually with some kind of template engine, like {{Handlebars}}, ERV, HAML, {{Jinja2}}, {{Pug}}, etc.

### Controller

The controller takes in user input and decides what to do with it. Usually the user interaction with the browser will go through some kind of **router** which will then give the controller a specific method to execute.

The controller acts as a middleman between the **controller** and the **view**. It takes the user input, passes it to the **model** which will then return some data to the controller, who then tells the **view** what to display to the user.

### Example Frameworks Using MVC

- {{Ruby}} on Rails
- Sinatra ({{Ruby}})
- Laravel
- Codeigniter
- Zend
- {{Express}}
- Backbone
- {{Angular}}
- Django
- Flask ({{Python}})
- {{React}} (view)

## References:

1. https://www.youtube.com/watch?v=pCvZtjoRq1I
2. https://www.youtube.com/watch?v=DUg2SWWK18I
3. https://www.learnenough.com/ruby-on-rails-7th-edition-tutorial#sec-mvc
4. https://en.wikipedia.org/wiki/Model-view-controller