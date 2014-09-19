//TO READ DOCUMENT STRINGS, LIKE AN HTML FILE
var fs = require('fs');
//TO CREATE A SERVER
var http = require('http');
//TO MAKE API CALL
var httpClient = require('request');
//??
var url = require('url');


//CREATING A SERVER
var server = http.createServer();

//WHEN A CLIENT ATTEMPTS TO REACH OUR SERVER
server.on('request', function(request, response) {
  
  //PARSING THROUGH OUR REQUEST AND RETURN A PARSED URL
  var parsedRequest = url.parse(request.url, true);
  //LOGGING WHAT ROUTE OUR CLIENT IS ATTEMPTING TO REACH
  console.log("Request received to: " + parsedRequest.pathname)

//WHEN CLIENT ATTEMTPS TO REACH THIS ROUTE '/'
  if (parsedRequest.pathname == '/') {
   
   //READ INDEX FILE
    response.end(fs.readFileSync('./index.html'));
 
  //WHEN CLIENT ATTEMTS TP REACH /MOVIES
  } else if (parsedRequest.pathname == '/movies') {
 
  //FIRST DEFINE MOVIE TITLE FROM QUERY PARAMS
    var movieTitle = parsedRequest.query.title;

    //THEN MAKE THE API CALL WITH DYNAMIC MOVIE TITLE
    httpClient.get('http://localhost:4567/' + encodeURIComponent(movieTitle), function(err, res2, body) {
      //RETURN THE API CALL
      response.end(body);
    });
  }
});
//OUR SERVER IS LISTENING ON THIS PORT
server.listen(2000);



