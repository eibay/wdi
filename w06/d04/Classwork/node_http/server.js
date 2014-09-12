var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response){

	debugger
	console.log("Connection from client has been made")

	var path = request["url"];

	console.log("Client is attempting to reach the " + path + "route");

	if(path == "/") {
		var html = fs.readFileSync("./index.html");
	response.end(html);
	} else if(path == "/style.css") {
		var css = fs.readFileSync("./style.css");
	response.end(css);
	} else {
		var html = fs.readFileSync("./error.html");
	response.end(html);
	}
});

server.listen(2000);