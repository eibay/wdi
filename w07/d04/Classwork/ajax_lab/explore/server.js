var fs = require('fs');
var http = require('http');
var httpClient = require('request');
var url = require('url');

var server = http.createServer();
//creates a new server
server.on('request', function(request, response) {
  // like an event listener.  Makes the server execute a function when it receives a request
  var parsedRequest = url.parse(request.url, true);
  //parses the URL into a hash
  console.log("Request received to: " + parsedRequest.pathname)
  //logs the path from the request onto the console
  if (parsedRequest.pathname == '/') {
    // starts a conditional that iniates functions based on what the path is 
    response.end(fs.readFileSync('./index.html'));
    // sends the index page to the browser
  } else if (parsedRequest.pathname == '/movies') {
    var movieTitle = parsedRequest.query.title;
    //parses the query string following movies/ to get the movie title
    httpClient.get('http://localhost:4567/' + encodeURIComponent(movieTitle), function(err, res2, body) {
      response.end(body);
      // sends an HTTP request to our Ruby server looking for the movie title.  Responds to the browser with the content of the request body
    });
  }
});

server.listen(2000);