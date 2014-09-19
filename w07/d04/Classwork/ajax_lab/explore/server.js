var fs = require('fs');
var http = require('http');
var httpClient = require('request');
var url = require('url');
// above code declares variables needed for program, we can see that we will be requesting information from external servers based on the request package saved as httpClient

// create our Node server
var server = http.createServer();

// when our server gets a request, execute our server function
server.on('request', function(request, response) {
  // we are parsing the URL of the request asynchronously and saving it to a variable called parsedRequest
  var parsedRequest = url.parse(request.url, true);
  // console logging the request path
  console.log("Request received to: " + parsedRequest.pathname)

  if (parsedRequest.pathname == '/') {
    // if the path of the request is root, serve them the index page
    response.end(fs.readFileSync('./index.html'));
    // else, if that path is /movies....
  } else if (parsedRequest.pathname == '/movies') {
    // make a variable with the request query's title
    var movieTitle = parsedRequest.query.title;
    // request.get our sinatra server and include in our GET request the parameter movie title the user typed into the address bar

    httpClient.get('http://localhost:4567/' + encodeURIComponent(movieTitle), function(err, res2, body) {
      response.end(body);
    });
  }
});

server.listen(2000);
