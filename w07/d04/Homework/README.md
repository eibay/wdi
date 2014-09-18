### Pic Me

**Goal**

A page where a user can enter a city and see pictures from that city displayed on the page.

**Break it down**

Guiding Questions:
  
  1. Where I get photo data by location?
    * recommendation: [Instagram API](http://instagram.com/developer/endpoints/media/)
  * Who should interact with the API? The client or the server? Why?

Development process:

  1. What should you get working first? (hint: whatever seems easiest.)
  * Jot down some big steps in the process. (ie, fetch some pictures by search term in San Francisco, render images dynamically in JS...)
  * Tackle one at a time.

**Bonus**

Instead of displaying all of the pictures in a list, render a google map with clickable markers for each picture.

  * Google maps - how does this work?
    * [documentation](https://developers.google.com/maps/documentation/javascript/tutorial)
    * Hint: no api keys needed - include this in your html:
    ```html
      <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
    ```
  * Also enter a search term (need Flickr API)
