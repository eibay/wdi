var http = require('http');
var server = http.createServer(function(request, response){
	var path = request["url"]
	var msg = "Hello world!"
	console.log("Connection from client has been made")
	if (path == "/hello") {
response.end(msg)
} else {
	response.end("ERROR")
}
});

server.listen(2000);