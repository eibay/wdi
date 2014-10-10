var http = require('http')

var server = http.createServer(function(request, response){

var path = request["url"];

if(path == "/") {
  response.end("<html><script>console.log('Timoor Kurdi')</script></html>")
}

});

server.listen(2000);