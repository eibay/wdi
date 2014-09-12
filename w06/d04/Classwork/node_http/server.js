var http = require('http');
var fs = require('fs')

// creating the server
var server = http.createServer(function(request, response){
// logic goes here
	
	// debugger
	console.log("Connection from client has been made");
	// response.end("<H1> Hello World! </H1>");
	
	var path = request["url"];
	
	if (path=="/") {
		response.end(fs.readFileSync("./index.html"));
	} else if (path == "/style.css") {
		response.end(fs.readFileSync("./style.css"));
	} else { 
		response.end("<h1>ERROR!</h1>");
	};



// the logic of the server doesn't loop, where ever it receives the request, it sends the response.//


// logic goes here
});

// logic then listens at port 2000
server.listen(2000)