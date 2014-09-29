//sets the variable fs so when called the 'fs' library is used
var fs = require('fs');
//sets the variable http so when clled the 'http' library is used
var http = require('http');
//sets the variable httpClient so when called the 'request' library is used
var httpClient = require('request');
//sets the variable url so when called the 'url' library is used
var url = require('url');

//sets the variable server so when called the createServer function is called on http
var server = http.createServer();

//runs the 'on' function on the server and takes two arguments - one being the request library and the other being a function that takes two arguments called request and response
server.on('request', function(request, response) {
  //sets a variable parsedRequest that represents the variable url having function parse called on it, parse has two arguments - one calling the function url on request, the other is the boolean value of true
  var parsedRequest = url.parse(request.url, true);
  //calls the function log on console, which prints the arguments to the console.  in this case the arguments are a string concatenated with the pathname of parsedRequest
  console.log("Request received to: " + parsedRequest.pathname)

  //sets a conditional argument; if the parsedRequest path is '/' the code follwoing the opening curly bracket will execute
  if (parsedRequest.pathname == '/') {
    //sends the file 'index.html' to the browser
    response.end(fs.readFileSync('./index.html'));
    //ends the code if the above conditional is true, and if the above conditional evaluates to false the code following the opening curly bracket will execute
  } else if (parsedRequest.pathname == '/movies') {
    //sets the variable movieTitle that represents the value of the key title in the query of the parsedRequest
    var movieTitle = parsedRequest.query.title;
    //calls the get function on httpClient which takes two arguments - the first is a concatenated string that includes the url of hte local host and the results of the function encodeURICompnonent when supplied with the argument movieTitle; the second is a function that takes three arguments
    httpClient.get('http://localhost:4567/' + encodeURIComponent(movieTitle), function(err, res2, body) {
      //calls the end function on response which takes the argument body; this sneds body to the client
      response.end(body);
    //ends the function on line 29  
    });
  // ends the else if conditional from line 25  
  }
//ends the function from line 14  
});
//calls the function listen on server; the function takes an argument that is the port on which the server should be listening
server.listen(2000);