var http = require('http');

var server = http.createServer(handleRequest)
server.listen(2000);

function handleRequest(req, res) {
	res.end(JSON.stringify(arr()))
};

function arr() {
	return [
		{
			name: "sean",
			age: 28
		},
		{
			name: "todd",
			age: 93
		}
	]
}
