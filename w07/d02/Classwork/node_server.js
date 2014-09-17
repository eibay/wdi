// Write a simple node server to serve the file we worked with above through localhost rather than just the file system which also acts a server on our computer.

var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response){
  response.end(fs.readFileSync('./tree.html'));
});

server.listen(2000);