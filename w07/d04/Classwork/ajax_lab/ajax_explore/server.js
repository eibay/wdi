// requires file system module to open and write files
var fs = require('fs');
// gets http module so we can set up a server
var http = require('http');
// gets request module so we can hit up an API
var httpClient = require('request');
// gets url module to parse urls
var url = require('url');
// creates a new server and sets it to variable 'server'
var server = http.createServer();
// tells server to listen for a request, then trigger the callback function to deal with it
server.on('request', function(request, response) {
  // uses url module to parse request and set it to variable parsedRequest
  var parsedRequest = url.parse(request.url, true);
  // prints the parsed url request to the console
  console.log("Request received to: " + parsedRequest.pathname)
  // looks for '/' route
  if (parsedRequest.pathname == '/') {
    // sends index.html
    response.end(fs.readFileSync('./index.html'));
    // otherwise, if the url is '/movies'
  } else if (parsedRequest.pathname == '/movies') {
    // sets the query of the requeest to variable movieTitle
    var movieTitle = parsedRequest.query.title;
    // makes call to ruby server with the movie title
    httpClient.get('http://localhost:4567/' + encodeURIComponent(movieTitle), function(err, res2, body) {
      // sends the body of the response back to the page 
      response.end(body);
    });
  }
});
// tells server to listen on port 2000
server.listen(2000);