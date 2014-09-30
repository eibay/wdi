var http = require('http');

var server = http.createServer(handleRequest)
server.listen(2000);

function handleRequest(req, res) {
	res.end('hello world')
};
