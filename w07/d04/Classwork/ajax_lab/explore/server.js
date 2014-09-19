var fs = require('fs');
var http = require('http');
var httpClient = require('request');
var url = require('url');

var server = http.createServer(); //creates server

server.on('request', function(request, response) { //calls 'on' method on server object. starts it? 
  // 
  var parsedRequest = url.parse(request.url, true); //new variable by parsing url 
  console.log("Request received to: " + parsedRequest.pathname) //logs it

  if (parsedRequest.pathname == '/') {
    response.end(fs.readFileSync('./index.html')); //connects to index
    
  } else if (parsedRequest.pathname == '/movies') {
    var movieTitle = parsedRequest.query.title;

    httpClient.get('http://localhost:4567/' + encodeURIComponent(movieTitle), function(err, res2, body) {
      response.end(body);
      //gets data from the ruby server about the movie, then runs a function, and sends to the browser the third argument
    });
  }
});

server.listen(2000); //starts server listening