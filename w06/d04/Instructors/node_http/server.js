var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response) {

	debugger
	console.log("Connection from client has been made")

	var path = request["url"]

	if (path == '/') {
		var file = fs.readFileSync("index.html")
		response.end(file);
	} else if (path == '/style.css') {
		var css = fs.readFileSync("style.css")
		response.end(css);
	} else {
		response.end("<h1>Error!</h1>")
	};
});

server.listen(2000);