
// require the fs, http, request & url modules 
// these modules are all core node libraries  
var fs = require('fs'); 
var http = require('http');
var httpClient = require('request'); 
// supply more semantic name to the request module 
// by storing it inside a variable httpClient 
var url = require('url');

// create a web Server obj & store it inside a variable called server 
// http://nodejs.org/api/http.html#http_http_createserver_requestlistener 
var server = http.createServer();

// add an event listener for 'request' events to this web Server obj 
// http://nodejs.org/api/http.html#http_event_request 
// pass this event listener an anonymous callback function, 
// this callback function has two parameters, a request & response  
server.on('request', function(request, response) {
                    // use url module's parse method to transform 
                    // the request url into an obj 
                    // representing different components of the url
                    // this serves the function of seperating a path str  
                    // from query params obj   
  var parsedRequest = url.parse(request.url, true);
  // use the console to create a server log 
  // documenting requests made to it
  // identify these requests w/ the path requested   
  console.log("Request received to: " + parsedRequest.pathname)
          // NOTE: This is not a route as this line does not emit 
          // an associated HTTP method, such as 'GET'

  // if the request is made for the root path 
  if (parsedRequest.pathname == '/') {
    // then send them the index.html document 
    response.end(fs.readFileSync('./index.html'));
    // if the request is made for the /movies path 
  } else if (parsedRequest.pathname == '/movies') {
    // extract from the request obj the query obj & get the value 
    // of the title property of this obj 
    var movieTitle = parsedRequest.query.title;

    // send a 'GET' request to the ruby server 
    // at the route the movie's title represents 
    // ensure encoding of uri is correct 
    httpClient.get('http://localhost:4567/' + encodeURIComponent(movieTitle), 
      function(err, res2, body) {
        // send out the body of the reponse from the ruby server 
        // to the client  
        response.end(body);
    });
  }
});

server.listen(2000);