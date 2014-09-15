var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response){

	console.log("Connection from client has been made")
		
	var path= request["url"];

	if (path == '/'){
		console.log("client attempting to reach" + path)
		var html = fs.readFileSync("./index.html")
		response.end(html);
	}else if (path=="/styles.css"){
		var css= fs.readFileSync("./styles.css")
		response.end(css);
	}else{
		console.log("client attempting to reach" + path)
		var html= fs.readFileSync("./error.html")
		response.end(html);
	};

	
	// debugger
	

});

server.listen(2000);