 // * Route that returns Hello World wrapped in a marquee tag
var http = require('http');
var server = http.createServer(function(request, response){
var path = request['url'];
response.end("<html><body><marquee> HELLO WORLD </marquee></body></html>")

});
server.listen(2000);
