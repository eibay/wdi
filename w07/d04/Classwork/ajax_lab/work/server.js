// First, we get a file reader
var fs = require('fs');
// Then we get an object that can create a server
var http = require('http');
// We'll use this as a client
var httpClient = require('request');
// I think this is for parsing urls
var url = require('url');

// Yeah, we created a server
var server = http.createServer();

// We're telling Node to take in the request and give us an object for the response
server.on('request', function(request, response) {
  // I guess our request will have part or all of a url and we're parsing it
  var parsedRequest = url.parse(request.url, true);
  // Generate a log item
  console.log("Request received to: " + parsedRequest.pathname)

  // Our route for a request for the root page- oh, we were getting our path, before
  if (parsedRequest.pathname == '/') {
    // Which we serve
    response.end(fs.readFileSync('./index.html'));
    // but if the path asks for /movies
  } else if (parsedRequest.pathname == '/movies') {
    // I guess there's a param for movies.
    var movieTitle = parsedRequest.query.title;

    // Then we compose and send a request to sinatra
    httpClient.get('http://localhost:4567/' + encodeURIComponent(movieTitle), function(err, res2, body) {
      // and serve what we get to the client.
      response.end(body);
    });
  }
});
// pay attention to port 2000
server.listen(2000);