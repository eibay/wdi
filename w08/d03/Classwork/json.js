//Part1


var http = require('http');
var names = [ "Tess", "Iris"];



var server = http.createServer(function(request, response){
var path = request["url"]

  names_in_json = JSON.stringify(names);


  if (path == "/"){
   response.end(names_in_json);
  }
  
});

server.listen(2000);