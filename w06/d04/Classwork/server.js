

// require in ruby attaches to the scope of the object

// in js you need to save it to variable to hold onto it

var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response) {
// debugger
	console.log("Connection from client has been made")

	var path = request["url"];

	if (path == "/") {
		var html = fs.readFileSync("./index.html")
		response.end(html);
	}	
	else if (path == "/styles.css") {
		var css = fs.readFileSync("./styles.css")
	}
	else {
		response.end("sorry dude");
	}
		
});

server.listen(2000);

