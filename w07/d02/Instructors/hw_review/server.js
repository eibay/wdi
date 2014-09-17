var http = require('http');
var fs = require('fs');

<<<<<<< HEAD
var server = http.createServer(function(request, response) {
  response.end(fs.readFileSync('./index.html'));
});
=======
var responseFunction = function(request, response) {
  response.end(fs.readFileSync('./index.html'));
}

var server = http.createServer();

server.on('request', responseFunction);
>>>>>>> f86af1814d76e2546f721c98e4b70acaa5be3d97

server.listen(2000);