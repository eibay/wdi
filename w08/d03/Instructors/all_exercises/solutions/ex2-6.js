var http = require('http');
var fs = require('fs');

var server = http.createServer(handleRequest)
server.listen(2000);

function handleRequest(req, res) {
	var path = req.url

	if (path == "/hello") {
		res.end(fs.readFileSync(__dirname + '/ex2-6.html'))
	} else if (path == "/mystyles.css") {
		res.end("body { background-color: #b0c4de; }")
	}

};
