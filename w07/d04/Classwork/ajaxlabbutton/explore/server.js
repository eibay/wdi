var fs = require('fs');
//require filesystem for files
var http = require('http');

var request = require('request')
//for making a server
var httpClient = require('request');
//like httparty but need request
var url = require('url');
//url to parse

var server = http.createServer();
//creating a server

server.on('request', function(request, response) {
  //creating a server
  var parsedRequest = url.parse(request.url, true);
  //getting the url that is parsed 
  console.log("Request received to: " + parsedRequest.pathname)
  //printing to console

  if (parsedRequest.pathname == '/') {
    //if path == "/" read this file and put it on the browser
    response.end(fs.readFileSync('./index.html'));
  } else if (parsedRequest.pathname == '/movies') {
    var movieTitle = parsedRequest.query.title;
    // if path is /movies and then the url has .query
    //get the tittle

    httpClient.get('http://localhost:4567/' + encodeURIComponent(movieTitle), function(err, res2, body) {
      response.end(body);

      //gets the api and prints the body in the console
    });
  }
});

server.listen(2000);