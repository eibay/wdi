var http = require('http');
var server = http.createServer(function(request, response){
	var path = request["url"]
	var names = ["Tom", "Dick", "Harry"]
	var msg = JSON.stringify(names)
	console.log("Connection from client has been made")

	response.end(msg)
});

server.listen(2000);