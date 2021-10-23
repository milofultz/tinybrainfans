---
title: Socket.IO
description: Socket.IO is a node package that enables real-time, bidirectional and event-based communication between the client and the server.
---

Socket.IO is a {{node}}/{{Javascript}} package that enables real-time, bidirectional and event-based communication between the client and the server.

## Getting Started

Create a new {{node}} project and install Socket.IO using {{npm}} or {{yarn}} (the package name is `socket.io`), and install `{{express}}` for your server.

We're going to make the simplest possible implementation, that will allow a user to send a message via console to all other users who are on the same site.

To run and test this, install the above dependencies and create these three files. Once they are created and populated, you can run `nodemon server.js` and open multiple tabs/windows at `http://locathost:3000` on your machine. With the console open, you should see messages coming in from the other tabs when sending messages on any of them.

**index.html**

```html
<html>
  <body>
    <form id="chat-form">
      <input id="msg" type="text" required/>
      <button>Send</button>
    </form>
    <script src="/socket.io/socket.io.js"></script>
    <script src="index.js"></script>
  </body>
</html>
```

**index.js**

```javascript
const form = document.getElementById('chat-form');

// Connect to the server socket
const socket = io();

// When a `message` event is received
socket.on('message', (id, message) => {
  console.log(`${id}: ${message}`);
});

form.addEventListener('submit', (e) => {
  e.preventDefault();

  // Emit a `message` event to the server
  socket.emit('message', socket.id, e.target.children.msg.value);
});
```

**server.js**

```javascript
const express = require('express');
const http = require('http');
const path = require('path');
const socketio = require('socket.io');

// Set up Express
const app = express();
const port = 3000;
app.use(express.static(path.join(__dirname, '/')));

// Set up Socket.IO
const server = http.createServer(app);
const io = socketio(server);

// When user connects, run the callback
io.on('connection', (socket) => {
  // When a `message` event is received
  socket.on('message', (id, message) => {
    console.log(`${id}: ${message}`);

    // Emit a `message` event to everyone
    io.emit('message', id, message);
  });
});

server.listen(port, () => {
  console.log('Listening at http://localhost:3000');
});
```

## Syntax

### Emitters

Each of these takes an `eventName` followed by an arbitrary number of `args` to send along with the emission.

#### Client

`socket.emit(eventName, [...args])` will emit a message to the server.

#### Server

Assuming these emits are wrapped in an `io.on('connection', ...` event listener. This will give the server access to the current user.

Command | Effect
--- | ---
`socket.emit(eventName, [...args])` |  Emits a message to the current user.
`socket.broadcast.emit(eventName, [...args])` | Emits to every user BUT the current user.
`io.emit(eventName, [...args])` | Emits to ALL users.

### Listeners

Callback takes in an `eventName` and `[...args]`

Command | Args | Effect
--- | --- | ---
`socket.on(eventName, callback)` | | Runs the listener on event.
`socket.once(eventName, callback)` | | Runs the listener only once on event.
`socket.off(eventName, callback)` | Same callback as was instantiated in `socket.on` | Removes a listener by function.
`socket.onAny(callback)` | | Fires on any event.
`socket.offAny([callback])` | Same callback as was instantiated in `onAny` | Removes a listener by function. If no callback, removes all listeners.
`socket.removeAllListeners([eventName])` | | Removes all listeners for a given event name. If no `eventName` given, removes ALL listeners.

### Rooms

A user joins a room using `socket.join('some room')`. A user leaves a room using `socket.leave('some room')`.

Using `.to('some room')` prior to `.emit(...)` will emit the events to only those who are in that room.

## References

- https://www.youtube.com/watch?v=jD7FnbI76Hg
- https://socket.io/docs/v4/
- https://socket.io/docs/v4/listening-to-events/
- https://socket.io/docs/v4/client-initialization/
- https://www.youtube.com/watch?v=cS6Zzj8BSHM
