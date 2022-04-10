---
title: Vue
description: Vue is a front-end Javascript framework.
---

Vue is a front-end Javascript framework that operates similar to {{React}} but operates with a much leaner profile. Often is used with {{Express}} and/or {{Node}} and a database to create full-stack apps.

## Components

A Vue component is made up of three parts:

* HTML
* Javascript (or some other flavor, like {{Typescript}})
* CSS (or some other flavor, like {{Sass}})

Unlike {{React}}, these all occur in the same file and are not necessarily using {{JSX}} component.

An example file looks like this:

```vue
<template>
  <header>
    <h1 v-bind:title="title">{{% raw %}}{{title}}{{% endraw %}}</h1>
  </header>
</template>

<script>
export default {
  props: {
    title: String,
  },
}
</script>

<style scoped>
header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}
</style>
```

### State

The contents of your **app.js** may look like this, containing state within the `data()` function.

```javascript
const app = Vue.createApp({
	data() {
		return {
			firstName: 'Jane',
      lastName: 'Doe',
      imageURL: 'example.com',
		}
  }
});
```

State can be brought in to the templating engine using double curly braces.

As tag content, it can be brought in directly. In the `data` return object, we have a `title` property that is then addressed within the `template` tag. e.g. `<h1>{{% raw %}}{{title}}{{% endraw %}}</h1>`.

As properties *of* the tag itself, we need to use something called the `v-bind:` directive. To do this, preface whatever property name you want to use a prop in with `v-bind:`, and set the value in double quotes, as if it were a Javascript string. e.g. ```<img v-bind:src="imageURL" v-bind:alt="`A man whose name is ${firstName} ${lastName}`"/>```.

While `v-bind:` is the explicit prefix for bound properties, you can also just use `:` in it's place. e.g. ```<img :src="imageURL" :alt="`A man whose name is ${firstName} ${lastName}`"/>```.

### Methods

The contents of your **app.js** may look like this, containing methods within the `methods` object.

```javascript
const app = Vue.createApp({
	data() {
    return {
      firstName: 'Bob',
    };
  },
  methods: {
    getUser() {
      this.firstName = 'Jane'
    },
  },
});
```

Methods can be added to event listeners in the DOM by using `v-on:{event}`, where `{event}` is `click`, etc. e.g. `<button v-on:click="getUser()">Click Here</button>`.

While `v-on:` is the explicit prefix for bound handlers, you can also just use `@` in it's place. e.g. `<button @click="getUser()">Click Here</button>`[5].

### Props

Props can be sent in to existing components just like in {{React}}, using properties on a {{JSX}} component. e.g. `<HelloWorld msg="Hello world!" />`. These props can be accessed inside the component file like so:

```vue
<template>
<p>{{% raw %}}{{msg}}{{% endraw %}}</p>
</template>

<script>
export default {
  props: {
    msg: String,
  },
}
</script>

<style scoped>
p {
  text-align: center;
}
</style>
```

Notice that the props must be registered inside of the `export`. Props can be registered a few different ways. 

```javascript
// As an array of props
export default {
  props: ['id', 'msg', 'name'],
}

// As an object with typing
export default {
  props: {
    id: Number,
    msg: String,
    name: [ String, Number ],
    metadata: null, // can be `any` type
  },
}

// Using `default` and `required`
export default {
  props: {
    id: {
      type: Number,
      default: 0,
      required: true,
    },
  },
  // etc.
}
```

In general, if a prop is not required, it should have a default value.

#### Type Checking[4]

Using the `validator` property in your props object, you can validate your incoming data.

```javascript
const userInformationIsValid = ({
  name,
  age,
  catchPhrases,
  pocketContents
}) => {
  return (
    typeof name === 'string' &&
    typeof age === 'number' &&
    Array.isArray(catchPhrases) &&
    catchPhrases.length === 3 &&
    catchPhrases.every(item => typeof item === 'number') &&
    typeof pocketContents === 'object' &&
    !Array.isArray(pocketContents) &&
    pocketContents.wallet === true
  )
};

export default {
  props: {
    userInformation: {
      type: Object,
      default: 0,
      required: true,
      validator: userInformationIsValid,
    },
  },
}
```

### Lifecycle Methods

TODO

## Getting Started

Using the Vue CLI[3] is the easiest way to get started. Similar to Create React App, it handles a lot of the nitty gritty setup and puts it all together with whatever specifics you want to use in your project.

## References

1. https://vuejs.org/
2. https://www.youtube.com/watch?v=qZXt1Aom3Cs
3. https://cli.vuejs.org/
4. https://michaelnthiessen.com/unlock-full-potential-prop-types/
5. https://code.luasoftware.com/tutorials/vuejs/vuejs-v-bind-and-v-on-shorthand/
6. https://vuejs.org/guide/essentials/lifecycle.html
