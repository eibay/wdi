var http = require('http');
var fs = require('fs');
var html = fs.readFileSync('./marquee.html');
var server = http.createServer(function(request, response){
	var path = request["url"]

	console.log("Connection from client has been made")
	if (path == "/") {
response.end(html)
} else {
	response.end("ERROR")
}
});

server.listen(2000);