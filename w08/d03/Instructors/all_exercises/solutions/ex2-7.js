var http = require('http');

var server = http.createServer(handleRequest)
server.listen(2000);

function handleRequest(req, res) {
	var arr = [1,2,3,4,5]

	res.end(JSON.stringify(arr))
};
