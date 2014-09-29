// Create a server that just returns "Hello World" (for every route)
// Route that returns Hello World wrapped in a marquee tag
// Route that returns Hello World in a marquee tag, but read from a file
// Change the hello world route to '/hello'
// Add a route '/yo' that says "yo world" (with no additional files)
// Add CSS to style the hello route, but no CSS in a file
// Every route returns an array of names, in json
// Every route returns json of names that was returned from a function
// Every route calls a function that returns a hash of 3 people with attributes
// Two routes - one for names, one for people
// Use the node-simple-router library to simplify the above



var http = require('http');
var fs = require ('fs');



var server = http.createServer(function(request, response){
var path = request["url"]

  if (path == "/"){
   response.end("<h1>Hello World</h1>");
  }
  else if (path == "/hello"){
    var file = fs.readFileSync("hello.txt")
    response.end(file);
  }
  else if (path == "/yo"){
    response.end("yo world")
  }
  else if (path == "/styles")
    response.end("h1 {color: blue;}");
});

server.listen(2000);