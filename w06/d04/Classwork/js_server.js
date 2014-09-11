var http = require("http");
var fs = require("fs");

var server = http.createServer(function(request, response){

	// debugger;

	var page = fs.readFileSync("./views/index.html");
	var stylesheet = fs.readFileSync("./stylesheets/style.css");
	console.log("Client connected!");

	if (request["url"] == "/") {
		response.end(page);
	}

	else if (request["url"] == "/style.css") {
		response.end(stylesheet);
		console.log("Dispensed the stylesheet.")
	}
	else {
		response.end("No you suck.")
	}
});

server.listen(2000);