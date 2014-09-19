var fs = require('fs');
var http = require('http');
var httpClient = require('request');
var url = require('url');

// set this node file as a server
var server = http.createServer();

// when node server runs 
server.on('request', function(request, response) {
// parse json file which comes from omdb api hit by ruby server
  var parsedRequest = url.parse(request.url, true);
// make sure node server got info
  console.log("Request received to: " + parsedRequest.pathname)
// if the path got from ombd = '/'
  if (parsedRequest.pathname == '/') {
// read html file and render in browse
    response.end(fs.readFileSync('./index.html'));
// if the path got from ombd = '/movies'
  } else if (parsedRequest.pathname == '/movies') {
// set a valiable movieTitle
    var movieTitle = parsedRequest.query.title;
// render movie titles encoded in browse
    httpClient.get('http://localhost:4567/' + encodeURIComponent(movieTitle), function(err, res2, body) {
      response.end(body);
    });
  }
});

server.listen(2000);