var fs = require('fs');
var http = require('http');
var httpClient = require('request');
var url = require('url');
// requiring libraries
var server = http.createServer();
// creates server
server.on('request', function(request, response) {
  var parsedRequest = url.parse(request.url, true);
  console.log("Request received to: " + parsedRequest.pathname)
// when server is on, server initiates on 'request'
// 'parsedRequest' parses the url
  if (parsedRequest.pathname == '/') {
    response.end(fs.readFileSync('./index.html'));
  } else if (parsedRequest.pathname == '/movies') {
    var movieTitle = parsedRequest.query.title;
// if the route is equal to '/', end the response and read inden.html
// if the route is equal to 'movies', movieTitle equals 
// the title of the request
    httpClient.get('http://localhost:4567/' + encodeURIComponent(movieTitle), function(err, res2, body) {
      response.end(body);
    });
    // Sends a get request to the specified url
    // The response ends and the body of the request is returned
  }
});

server.listen(2000);