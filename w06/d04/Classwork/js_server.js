var http = require("http");
var fs = require("fs");

var server = http.createServer(function(request, response){

	// debugger;

	var page = fs.readFileSync("./views/index.html");
	console.log("Client connected!");
	if (request["url"] == "/") {
		response.end(page);
	}
	else {
		response.end("No you suck.")
	}
});

server.listen(2000);