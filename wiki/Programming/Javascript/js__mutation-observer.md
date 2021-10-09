---
title: MutationObserver (Javascript)
description: The MutationObserver interface provides the ability to watch for changes being made to the DOM tree.
---

The MutationObserver interface in {{Javascript}} provides the ability to watch for changes being made to the DOM tree.

This is an example that will watch an element (`targetElement`) on a webpage that has dynamic elements generated via React, and update another element whenever it sees the `targetElement` change.

```java
// Select the node that will be observed for mutations
const videoPlayer = document.querySelector('.video-main');

// Options for the observer (which mutations to observe)
const config = {
  attributes: false,
  childList: true,
  subtree: true,
  characterData: true
};

// Callback function to execute when mutations are observed
const copyVideo = (mutationsList, observer) => {
  document.querySelector('.iframe__inner-container').innerHTML = videoPlayer.innerHTML;
  if (!videoPlayer.innerHTML.includes('video-placeholder')) {
    observer.disconnect();
    blPlayer.querySelector('iframe').src = '';
  }
};

// Create an observer instance linked to the callback function
const wrapperObserver = new MutationObserver(copyVideo);

// Start observing the target node for configured mutations
wrapperObserver.observe(videoPlayer, config);
```

## References

1. https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver
2. https://hacks.mozilla.org/2012/05/dom-mutationobserver-reacting-to-dom-changes-without-killing-browser-performance/