var http = require('http');
var fs = require('fs');



var server = http.createServer(function(request, response) {
  response.end(fs.readFileSync('./index.html'));
});

console.log("The server is running");

server.listen(2000);