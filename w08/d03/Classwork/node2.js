var http = require('http');
var server = http.createServer(function(req, res){
	var path = req["url"]
	console.log("Connection has been made, path is " + req["url"])
	var msg = "Hello world!"
	if (path == "/marquee"){
		msg = "<!DOCTYPE html><html><body><marquee>Hello World!</marquee></body></html>"
	}
	res.end(msg)
});

server.listen(2000);