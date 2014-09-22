var fs = require('fs');
var http = require('http');
var httpClient = require('request');
var url = require('url');

/*Returns a new web server object.
This method includes requestListener which 
is a function which is 
automatically added to the 'request' event.*/
var server = http.createServer();

/*Server.on Activates the server */
server.on('request', function(request, response) {
// Parses the JSON request
var parsedRequest = url.parse(request.url, true);
/*Displays the message that the server has received 
the name of the path we need information from*/
console.log("Request received to: " + parsedRequest.pathname)

  /*if the pathname from the parsed request leads to
  this route, display the response at the index*/
  if (parsedRequest.pathname == '/') {
    response.end(fs.readFileSync('./index.html'));
/*  Otherwise if the request goes to the route movies, 
  the page convert the JSON to a string and display.*/
  } else if (parsedRequest.pathname == '/movies') {
    var movieTitle = parsedRequest.query.title;

    httpClient.get('http://localhost:4567/' + encodeURIComponent(movieTitle), function(err, res2, body) {
      response.end(body);
    });
  }
});

server.listen(2000);