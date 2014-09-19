///require filesystem stuff
var fs = require('fs');
///require http stuff
var http = require('http');
///requiring the node module request
var httpClient = require('request');
///lets you parse url bullshit
var url = require('url');
///initiate http server
var server = http.createServer();

///starting up the server, request is what we get form client, response what we send back
server.on('request', function(request, response) {
  //parse url
  var parsedRequest = url.parse(request.url, true);
  //server log of the requested path from the cllient
  console.log("Request received to: " + parsedRequest.pathname)
  //check if they requested /
  if (parsedRequest.pathname == '/') {
    //send index.html back to the client
    response.end(fs.readFileSync('./index.html'));
    //check if path requested is /movies
  } else if (parsedRequest.pathname == '/movies') {
    //get the movie title from the query string
    var movieTitle = parsedRequest.query.title;
    //send an http get request to your sinatra server 
    httpClient.get('http://localhost:4567/' + encodeURIComponent(movieTitle), function(err, res2, body) {
      //send the client the body response from ruby server
      response.end(body);
    });
  }
});
//listen for incoming connections on port 2000
server.listen(2000);