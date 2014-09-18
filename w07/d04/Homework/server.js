var fs = require('fs');
var http = require('http');
var httpClient = require('request');
var url = require ('url');

var server = http.createServer();

server.on('request', function(request, response) {
	var parsedRequest = url.parse(request.url, true);
	console.log("Request received to: " + parsedRequest.pathname)

	if (parsedRequest.pathname == '/') {
		response.end(fs.readFileSync('./index.html'));
	
	} else if (parsedRequest.pathname == '/images') {
		var imageUrl = parsedRequest.query.image;
	}
 

})



//