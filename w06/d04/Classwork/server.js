var http = require('http');
var fs = require('fs');


var server = http.createServer(function(request, response){
debugger
	console.log("Connection from client has been made")
	var html = fs.readFileSync("./file.html")
	var css = fs.readFileSync("./style.css")
	var path = request["url"] 

if (path == "/"){
	response.end(html)
} else if (path == "/style.css"){
	response.end(css)
} else 
	response.end("Errorrrrr")
});

server.listen(2000);

// if parenthesis condition then curly brackets execute logic