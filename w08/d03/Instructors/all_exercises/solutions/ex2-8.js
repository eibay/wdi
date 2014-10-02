var http = require('http');

var server = http.createServer(handleRequest)
server.listen(2000);

function handleRequest(req, res) {
	res.end(JSON.stringify(arr()))
};

function arr() {
	return [1,2,3,4,5];
}
