var http = require('http')
var fs = require('fs')
var html = fs.readFileSync('./tree.html')
var server = http.createServer(function(req, res){
	console.log("server!")
var path = req["url"]
	if (path == "/") {
	var msg = html
	}
res.end(msg)
});

server.listen(2000);