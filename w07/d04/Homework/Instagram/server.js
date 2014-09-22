var fs = require('fs');
var http = require('http');
var url = require('url');
var httpClient = require('request');


var server = http.createServer();
server.on('request', function(request, response){
	var parsedRequest = url.parse(request.url, true);
	console.log("Request received to: " + parsedRequest.pathname)


	if(parsedRequest.pathname == '/'){
		response.end(fs.readFileSync('./index.html'));
	} else if (parsedRequest.pathname == '/popular'){
		httpClient.get('https://api.instagram.com/v1/media/popular?client_id=f487e0636e6e44c396a32f49390219fe', function(err, res2, body){
			response.end(body);

		})
	}	console.log(body);
});
server.listen(2000);

