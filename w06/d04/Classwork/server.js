var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response) {
	debugger
	console.log("connection made")

	var path = request["url"];

	console.log("Client is attempting ")
	if (path == "/") {
		var html = fs.readFileSync("./jsserver.html");
		response.end(html);
	} else if (path == "/styles.css"){
		var css = fs.readFileSync("./style.css");
		response.end(css);
	} else {
		response.end("<h1>error</h1>");		
	};



});

server.listen(2000);