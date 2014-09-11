### HTTP Server in Node

1. Write an HTTP server that responds to the following paths.

  * `/` - returns an index page with links to 
  * `/cast` - returns a `ul` with the cast members of friends.
    * the `li`s in this `ul` should be generated dynamically from an array of cast member names
  * `/cast/random` - returns a random cast member of friends.
  * Add a stylesheet to your html files.

2. Parsing query params
  * `/hello?name=Jeff` - responds with `<h1>Jeff</h1>`
    * this should work for any name, ie `/hello?name=Neel` responds with `<h1>Neel</h1>`

BONUS:
  * `/cast/new` - returns a form for a user to enter a new cast member name. It hits...
  * POST `/cast` - adds the sent cast member to the array. When you GET `/cast` you should see the new cast member in the `<ul>` 

BONUS BONUS:
  * `/photos?tag=cat` - hit the instagram API and return html `<img>` tags for each returned photo from instagram.
