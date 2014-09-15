var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response){
	// core of server logic goes inside here
	
	console.log("Connection from client has been made")

	var path = request["url"];
	debugger
	if(path == "/") {
		var html = fs.readFileSync('./main.html')
		response.end(html);
	}
	else if(path == "/style") {
		var css = fs.readFileSync('./style.css')
		response.end(css)
	}
	else {
		response.end("<h1>Error</h1>");
	};

	


	//doesnt loop, it just stays there, whenever it receives request, it sends response


});

server.listen(2000) 
// event loop, not a normal loop
// this line lets the server listen by giving it a port. must be explicit in js




