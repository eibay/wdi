var http = require('http');
var fs = require('fs');

var server = http.createServer(handleRequest)
server.listen(2000);

function handleRequest(req, res) {
	var path = req.url

	if (path == "/") {
		res.end(fs.readFileSync(__dirname + '/ex2-3.html'))
	}

};
