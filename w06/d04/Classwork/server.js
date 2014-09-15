var http = require('http');
var fs = require('fs');

var server = http.createServer(function (request, response) {
	console.log("Connection from client has been made")
	debugger
	var path = request["url"]
	var html = fs.readFileSync("./file.html")
	var css = fs.readFileSync("./stylesheet.css")
		
	if (path == "/"){
		response.end(html);
	}else if (path == "/stylesheet.css"){
		response.end(css);
	}else{
		response.end("<h1>Error!</h1>");
	}
});

server.listen(2000);

console.log("Server running at http://127.0.0.1.2000/");
