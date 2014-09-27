// Node server - every route returns html (no files) that console.logs your name.

var http = require('http');

var server = http.createServer(function(request, response) {
	console.log("connection made")

// wait *** how does html console.log? All I can do is both?

	var path = request['url'];
	console.log("client is attempting to connect from");

	if (path == '/') {
		response.end("<html><p>Lisa's name</p></html>")
		console.log("<html><p>Lisa's name</p></html>");
	};





});
server.listen(2000);
