var fs = require('fs');
var http = require('http');
var httpClient = require('request');
var url = require('url');

var server = http.createServer(); //creating a new server

server.on('request', function(request, response) { //server is making a request
  var parsedRequest = url.parse(request.url, true); //takes our url from the get request and parses it for us into an object with specific methods
  console.log("Request received to: " + parsedRequest.pathname)

  if (parsedRequest.pathname == '/') { // route to "127.0.0.1:2000/"
    response.end(fs.readFileSync('./index.html')); //sending through the html index file (not dynamic file/ nothing thing passed through)
  } else if (parsedRequest.pathname == '/movies') { //route to 127.0.0.1:2000/incpetion
    var movieTitle = parsedRequest.query.title;
// uses the method .title to query the parsedRequest/"path" object to grab 
    httpClient.get('http://localhost:4567/' + encodeURIComponent(movieTitle), function(err, res2, body) {
      response.end(body);

    });
    // sending API request to local sinatra host using the movietitle from url/path. function's parameters: err = what to do if there's an error, res2 = ?? , body = the response body
  }
});

server.listen(2000);