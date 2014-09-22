var fs = require('fs');
var http = require('http');
var httpClient = require('request');
var url = require('url');

var server = http.createServer();
// we care creating a server 

server.on('request', function(request, response) {
  // the server is waiting for a request, once the request is made it fires a function
  var parsedRequest = url.parse(request.url, true);
  // this code parses the url which means it makes the string into an array of hashes
  console.log("Request received to: " + parsedRequest.pathname)
  // since parsedRequest is an object, we can call methods on it such as pathname

  if (parsedRequest.pathname == '/') {
    response.end(fs.readFileSync('./index.html'));
    // once the route in the browswer hits "/" then we read the index.html file which has html as well as javascript
  } else if (parsedRequest.pathname == '/movies') { 
    // if the pathname is movies then ...
    var movieTitle = parsedRequest.query.title;
    // the parsedRequest object has methods that can call the query params and we can obtain the movie title within this query params

    httpClient.get('http://localhost:4567/' + encodeURIComponent(movieTitle), function(err, res2, body) {
      response.end(body);
      // sending API request to local host
    });
  }
});

server.listen(2000);