var http = require('http');
var fs = require('fs');

var arrayNames = ["Timoor", "Lebron", "Wayne", "Derek", "Tiger", "Eli"]

  var server = http.createServer(function(request, response) {

      var path = request["url"];

      if (path == '/hello'){
       arrayNames_in_json = JSON.stringify(arrayNames);
       response.end(arrayNames_in_json);

      } else if(path == "/yo") {
        arrayNames_in_json = JSON.stringify(arrayNames);
        response.end(arrayNames_in_json);

      } else {
        response.end("<h1>ERROR</h1>")
    };
  });

server.listen(2000);
