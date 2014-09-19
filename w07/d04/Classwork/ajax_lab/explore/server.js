var fs = require('fs'); // read and write
var http = require('http');  // needed for making and receiveing http requests
var httpClient = require('request'); // for api requests
var url = require('url'); // part of api request

// create a server
var server = http.createServer();

server.on('request', function(request, response) { //sets up server request response
  var parsedRequest = url.parse(request.url, true);
  console.log("Request received to: " + parsedRequest.pathname)

  if (parsedRequest.pathname == '/') {
    response.end(fs.readFileSync('./index.html'));
  } else if (parsedRequest.pathname == '/movies') {
    var movieTitle = parsedRequest.query.title;

    httpClient.get('http://localhost:4567/' + encodeURIComponent(movieTitle), function(err, res2, body) {
      response.end(body);
    });
  }
});

server.listen(2000);