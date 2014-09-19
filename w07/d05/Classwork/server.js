var fs = require('fs');

var http = require('http');

var httpClient = require('request');

var url = require('url');

var server = http.createServer();


server.on('request', function(request, response) {

  var parsedRequest = url.parse(request.url, true);
  console.log(parsedRequest)
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
