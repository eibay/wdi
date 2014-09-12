var http = require('http');
var fs = require('fs');

<<<<<<< HEAD
var server = http.createServer(function(request, response) {

	debugger
	console.log("Connection from client has been made")

	var path = request["url"]

	if (path == '/') {
		var file = fs.readFileSync("index.html")
		response.end(file);
	} else if (path == '/style.css') {
		var css = fs.readFileSync("style.css")
		response.end(css);
	} else {
		response.end("<h1>Error!</h1>")
	};
=======
var server = http.createServer(function(request, response){

	// debugger
	console.log("Connection from client has been made")

	var path = request["url"];

	console.log("Client is attempting to reach the " + path + " route");
	
	if(path == '/'){
		var html = fs.readFileSync("./index.html")
		response.end(html);
	} else if (path == "/styles.css"){
		var css = fs.readFileSync("./styles.css")
		response.end(css);
	} else {
		response.end("<h1>ERROR</h1>");
	};

>>>>>>> ba428e28dc3c35fcd8a08553a5be35a765033603
});

server.listen(2000);