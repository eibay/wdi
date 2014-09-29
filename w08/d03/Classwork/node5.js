var http = require('http');
var server = http.createServer(function(request, response){
	var path = request["url"]
	var msg = "Error"
	console.log("Connection from client has been made")
	if (path == "/hello") {
		msg = "hello world"
	} else if (path == "/yo"){
		msg = "yo world"
	}
	response.end(msg)
});

server.listen(2000);