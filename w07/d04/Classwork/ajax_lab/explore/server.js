var fs = require('fs');
var http = require('http');
var httpClient = require('request');
var url = require('url');

// Creates the server
var server = http.createServer();

// Activates server? Is on a method called on the server variable?
server.on('request', function(request, response) {
// Parses url from API. True makes the request asynchronous.  
  var parsedRequest = url.parse(request.url, true);
  console.log("Request received to: " + parsedRequest.pathname)
// Conditional handles the routes. Sends user to index or specific movie page depending on the route.
  if (parsedRequest.pathname == '/') {
    response.end(fs.readFileSync('./index.html'));
  } else if (parsedRequest.pathname == '/movies') {
    var movieTitle = parsedRequest.query.title;
// Treats ruby server as an API?
    httpClient.get('http://localhost:4567/' + encodeURIComponent(movieTitle), function(err, res2, body) {
      response.end(body);
    });
  }
});
// Tells the server to listen
server.listen(2000);