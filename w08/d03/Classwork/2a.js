
//   * Create a server that just returns "Hello World" (for every route)

var http = require('http');
var server = http.createServer(function(request, response){
var path = request['url'];
response.end("HELLO WORLD")

});
server.listen(2000);

