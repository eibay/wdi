var http = require('http');
var fs = require('fs');

var responseFunction = function(request, response) {
  response.end(fs.readFileSync('./index.html'));
}

var server = http.createServer();

server.on('request', responseFunction);

server.listen(2000);