### 1. Mechanics
  1. Create a function that returns a string with a joke.
  2. Create a function that takes a name and returns "hello [name]"
  3. Create a function that takes an array of names and console.logs "hello name" for each name
  4. Create a function that takes an array of names and returns a new array with "hello [name]" for each name
  5. Create a function `double` that takes a number as an argument and returns it doubled
  6. Create a function `quadruple` that uses `double` - ie `quadruple(4) === 16`
  7. Create a hash that has peoples names as keys and their favorite colors as values (no functions!)
    * Create a function that takes a hash of favorite colors and uses [`Object.keys`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys) to print out "[name] favorite color is [color]" for each name
  8. Create a function that takes two hashes and combines the elements

### 2. Node Server
  1. Create a server that just returns "Hello World" (for every route)
  2. Route that returns Hello World wrapped in a marquee tag
  3. Route that returns Hello World in a marquee tag, but read from a file
  4. Change the hello world route to '/hello'
  5. Add a route '/yo' that says "yo world" (with no additional files)
  6. Add CSS to style the hello route, but no CSS in a file
  7. Every route returns an array of names, in json
  8. Every route returns json of names that was returned from a function
  9. Every route calls a function that returns an array of 3 people, where each person is represented by a hash of attributes (e.g. name, age, etc)
  10. Two routes - one for names, one for people
  11. Use the `node-simple-router` library to simplify the above

### 3. JS in the Browser
  1. Node server - every route returns html (no files) that console.logs your name.
  2. Modify this server to have two routes, one that serves html with just a body and script tag, and another route that serves a javascript file
    * Your javascript make an ajax call to the `names` route from the previous section - console.logs the whole result
    * Now, have your javascript make a `<ul>` in memory that contains all of the names
    * Append this to the DOM
    * Create a function that reverses the list.

### 4. Sweet Libs
  1. Using [Pup](https://github.com/EricChiang/pup) from the command line filter and print out the [top 5 offensive leaders](http://espn.go.com/nfl/statistics) in passing yards.
    * `pipe` this output to a file (player yards)
  2. Program minecraft-like worlds with [Voxel.js](http://voxeljs.com/)
    * NodePDX conference talk with Max Ogden presenting Voxel.js: [minecraft.js](http://www.youtube.com/watch?v=8gM3xMObEz4)
  3. Create music with [code](https://github.com/substack/code-music-studio)
    * LXJS conference talk with substack presenting this tool: [beep boop](http://www.youtube.com/watch?v=2oz_SwhBixs)
  4. Watch the NodePDX talk by substack on node, modularity, and anarchy (20 min): [Modularidade para todos](http://www.youtube.com/watch?v=DCQNm6yiZh0)
