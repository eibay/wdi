// require filesync to read files
var fs = require('fs');

// require http to connect with client
var http = require('http');

// require request to make http calls
var httpClient = require('request');

// require url
var url = require('url');

// creating server
var server = http.createServer();

// initating/starting the server upon request
server.on('request', function(request, response) {

// parsed.request takes a URL string, and returns an object. true == async
  var parsedRequest = url.parse(request.url, true);
  console.log("Request received to: " + parsedRequest.pathname)

// if parsed.request == '/', read index.html 
  if (parsedRequest.pathname == '/') {
    response.end(fs.readFileSync('./index.html'));

// if parsed.request == '/movies' 
  } else if (parsedRequest.pathname == '/movies') {
    var movieTitle = parsedRequest.query.title;

// HTTP.CLIENT Provides a base class for sending HTTP requests and receiving HTTP responses from a resource identified by a URI. Sends a request to Sinatra in this scase
    httpClient.get('http://localhost:4567/' + encodeURIComponent(movieTitle), function(err, res2, body) {
      response.end(body);
    });
  }
});

server.listen(2000);