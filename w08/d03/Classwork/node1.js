var http = require('http');
var server = http.createServer(function(req, res){
	var path = req["url"]
	console.log("Connection has been made, path is " + req["url"])
	var msg = "Hello world!"
	
	res.end(msg)
});

server.listen(2000);