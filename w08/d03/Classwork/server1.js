// Create a server that just returns "Hello World" (for every route)

var http = require("http");


http.createServer(function(req, res){
	res.end("Hello World!")



}).listen(2000)