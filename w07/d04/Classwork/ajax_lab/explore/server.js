var fs = require('fs');
var http = require('http');
var httpClient = require('request');
var url = require('url');

// js gets the movie from ruby

// createServer
var server = http.createServer();

// never heard of server.on
// somehow it's *** i don't know
server.on('request', function(request, response) {
  // *** don't know, something about the request we're making
  var parsedRequest = url.parse(request.url, true);
  // letting us know a request has been made to... ***
  console.log("Request received to: " + parsedRequest.pathname)
  // if client put in root, read in index page
  if (parsedRequest.pathname == '/') {
    response.end(fs.readFileSync('./index.html'));
    // if client put in movies, 
  } else if (parsedRequest.pathname == '/movies') {
    // 
    var movieTitle = parsedRequest.query.title;
    // requests from ruby sinatra url  
    httpClient.get('http://localhost:4567/' + 

      encodeURIComponent(movieTitle), function(err, res2, body) {
      response.end(body);
    });
  }
});

server.listen(2000);