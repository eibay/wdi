// Part 2

var http = require('http');
var array = [ "Tess", "Iris"];



var server = http.createServer(function(request, response){
var path = request["url"]

  if (path == "/"){
   response.end(jsonNames(array));
  }
  
});

server.listen(2000);

var jsonNames = function(array){
	return names_in_json = JSON.stringify(array);
};