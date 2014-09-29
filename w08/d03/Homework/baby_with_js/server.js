var fs = require('fs');
var http = require('http');
var httpClient = require('request');
var url = require('url');

var server = http.createServer();

server.on('request', function(request, response) {

	var parsedRequest = url.parse(request.url, true);

	if (parsedRequest.pathname == "/") {
		console.log('index has been loaded');
		response.end(fs.readFileSync('./views/index.html'));
	} else if (parsedRequest.pathname == "/baby") {
		console.log('baby has been loaded');
		response.end(fs.readFileSync('./public/ny-baby-names.json'));
	} else if (parsedRequest.pathname == "/2007") {
		console.log('2007 has been loaded');
		response.end(fs.readFileSync('./views/seven.html'));
	} else if (parsedRequest.pathname == "/2008") {
		console.log('2008 has been loaded');
		response.end(fs.readFileSync('./views/eight.html'));
	}  else if (parsedRequest.pathname == "/2009") {
		console.log('2009 has been loaded');
		response.end(fs.readFileSync('./views/nine.html'));
	} else if (parsedRequest.pathname == "/2010") {
		console.log('2010 has been loaded');
		response.end(fs.readFileSync('./views/ten.html'));		
	} else if (parsedRequest.pathname == "/2011") {
		console.log('2011 has been loaded');
		response.end(fs.readFileSync('./views/eleven.html'));
	} else if (parsedRequest.pathname == "/2012") {
		console.log('2012 has been loaded');
		response.end(fs.readFileSync('./views/twelve.html'));
	}
});

server.listen(2000);
