var fs = require('fs');
var http = require('http');
var httpClient = require('request');
var url = require('url');

var server = http.createServer();

server.on('request', function(request, response) {

	var parsedRequest = url.parse(request.url, true);

  	console.log("Request received to: " + parsedRequest.pathname);

	if (parsedRequest.pathname == '/') {
  	console.log('index.html has been loaded');
  	response.end('Sho!!');
  } else if (parsedRequest.pathname == '/js') {
  	httpClient.get('http://randomword.setgetgo.com/get.php', function(err, res2, body) {
      response.end(body);
    });
  } else if (parsedRequest.pathname == '/names') {
  	response.end(fs.readFileSync('../style.css'));
  };

});

server.listen(2000);

