var http = require('http');
var fs = require('fs');

var responseFunction = function(request, response) {
  response.end(fs.readFileSync('./tree.html'));
}

var server = http.createServer(responseFunction);

server.listen(2000);