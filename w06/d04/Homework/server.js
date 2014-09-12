var http = require('http');
var fs = require ('fs');

var server = http.createServer(function(request, response){

console.log("Connection from client has been made.")

var path = request["url"];

console.log("Client is attempting to reach the " + path + " route")

	if (path == "/") {
		var html = fs.readFileSync("./index.html")
		response.end(html);
	} else if (path == "/styles.css"){
		var css = fs.readFileSync("./styles.css")
		response.end(css);
	} else if (path == "/friends.jpg"){
		var image = fs.readFileSync("./friends.jpg")
		response.end(image);
	} else if (path == "/cast"){
		var cast = fs.readFileSync("./cast.html")
		response.end(cast);
	} else if (path == "/cast/random"){
		var random = fs.readFileSync("./random.html")
		response.end(random);
	} else if (path == "/hello"){
		var hello = fs.readFileSync("./hello.html")
		response.end(hello);
	} else if (path.split("?").length > 1) { 
		var name = path.split("?")[1].split("=")[1]; response.end("<h1>Hello, " + name + "!</h1>");
	} else {
		response.end("<h1>ERROR!</h1>")
	};

});

server.listen(2000);