var http = require('http');

var server = http.createServer(handleRequest)
server.listen(2000);

function handleRequest(req, res) {
	var path = req.url

	if (path == "/") {
		res.end('<html><body><marquee>hello world</marquee></body></html>')
	}

};
