1. Mechanics
  * Create a function that returns a string with a joke.
  * Create a function that takes a name and returns "hello [name]"
  * Create a function that takes an array of names and console.logs "hello name" for each name
  * Create a function that takes an array of names and returns a new array with "hello [name]" for each name
  * Create a function `double` that takes a number as an argument and returns it doubled
  * Create a function `quadruple` that uses `double` - ie `quadruple(4) === 16`
  * Create a hash that has peoples names as keys and their favorite colors as values (no functions!)
    * Create a function that takes a hash of favorite colors and uses [`Object.keys`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys) to print out "[name] favorite color is [color]" for each name
  * Create a function that takes two hashes and combines the elements

2. Node Server
  * Create a server that just returns "Hello World" (for every route)
  * Route that returns Hello World wrapped in a marquee tag
  * Route that returns Hello World in a marquee tag, but read from a file
  * Change the hello world route to '/hello'
  * Add a route '/yo' that says "yo world" (with no additional files)
  * Add CSS to style the hello route, but no CSS in a file
  * Every route returns an array of names, in json
  * Every route returns json of names that was returned from a function
  * Every route calls a function that returns a hash of 3 people with attributes
  * Two routes - one for names, one for people
  * Use the `node-simple-router` library to simplify the above

3. JS in the Browser
  * Node server - every route returns html (no files) that console.logs your name.
  * Make some JS run in the browser that makes an ajax call to the `names` route from the previous section - console.logs the whole result
    * Now, make a `<ul>` in memory that contains all of the names
    * Append this to the DOM
    * Create a function that reverses the list.

4. Sweet Libs
  * Using [Pup](https://github.com/EricChiang/pup) from the command line filter and print out the [top 5 offensive leaders](http://espn.go.com/nfl/statistics) in passing yards. 
    * `pipe` this output to a file (player yards)
  * Program minecraft-like worlds with [Voxel.js](http://voxeljs.com/)
  * Create music with [code](https://github.com/substack/code-music-studio)