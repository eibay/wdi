var fs = require('fs');
// In ruby to file read we do File.read, read is a class method on class File, in node we gotta require it and then use it like we did with http so we set it to a variable then we do var fs and we require(‘fs’);
var http = require('http');
// Rubys requiring of socket is the that once u require it ruby gives it to the global scope of ur program and be used everywhere. JS on the other hand requires it, bring its in and then after its line is executed it is forgotten, so in order to preserve the value of it, we set it to a variable and then that gives u access to it. So after that we call createServer on http as a method.


var httpClient = require('request');
// Same concept as above except request is required.
var url = require('url');
// Same thing with url

var server = http.createServer();
// Here is what was referenced above, we call createServe on http as a method.

server.on('request', function(request, response) {
  // The on method is called on server and sets up the function to run each time a request is made.
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
// Calls the listen method on the server and tells it to listen on port 2000