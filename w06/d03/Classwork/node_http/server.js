var http = require('http');
var fs = require('fs');
// file read sync

var server = http.createServer(function(request, response){

debugger

	console.log("Connection from client has been made")

	
	var path = request["url"];


	console.log("Client is attempting to reach " + path + " route.")

	if (path == '/'){
		var html = fs.readFileSync("./index.html")
		response.end(html);
	} else if (path == "/styles.css"){
		var css = fs.readFilesSync("./styles.css")
		response.end(css);
	} else {
		response.end("ERROR");
	};


});

server.listen(2000);