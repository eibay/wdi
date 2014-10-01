var http = require('http');
var fs = require('fs');

var server = http.createServer(handleRequest)
server.listen(2000);

function handleRequest(req, res) {
	var path = req.url

	if (path == "/") {
		res.end("<html><head><script src='my.js'></script></head></html>")
	} else if (path == "/names") {
		res.end(JSON.stringify(names()))
	} else if (path == "/my.js") {
		res.end(fs.readFileSync(__dirname + '/ex3-2-scripts.js'));
	}
}

function names() {
	return ["sean", "todd"];
}
