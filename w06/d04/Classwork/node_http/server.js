// require 'socket'
var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response) {

// debugger
	console.log("Connection with client has been made.")

	var path = request['url'];

	if (path == "/") {
		var html = fs.readFileSync('./main.html');
		response.end(html);
	} else if (path == "/style.css") {
		var css = fs.readFileSync("./style.css")
		response.end(css);
	} else {
		response.end("<h1>Error</h1>")
	};


});

server.listen(2000)













// node debug server.js

// cont 

// repl

// request

// request['url']