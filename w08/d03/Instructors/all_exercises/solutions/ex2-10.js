var http = require('http');

var server = http.createServer(handleRequest)
server.listen(2000);

function handleRequest(req, res) {
	var path = req.url

	if (path == "/names") {
		res.end(JSON.stringify(names()))
	} else if (path == "/people") {
		res.end(JSON.stringify(people()))
	}
}

function people() {
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

function names() {
	return ["sean", "todd"];
}
