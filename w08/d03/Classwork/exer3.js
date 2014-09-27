// Node server - every route returns html (no files) that console.logs your name.

var http = require('http');

var server = http.createServer(function(request, response) {
	console.log("connection made")

	var path = request['url'];
	console.log("client is attempting to connect from");

	if (path == '/') {
		console.log("Lisa's name");
	};





});
server.listen(2000);
