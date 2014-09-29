var http = require('http');
var httpClient = require('request');
var fs = require('fs');
var url = require('url');

var server = http.createServer();

server.on('request', function(request, response) {

	var parsedRequest = url.parse(request.url, true);

	if (parsedRequest.pathname == '/') {

		response.end(fs.readFileSync('index.html'));

	} else if (parsedRequest.pathname.split('?')[0] == '/term') {

		var movie_title = parsedRequest.query.movie_title;

		var image = httpClient.get('http://www.omdbapi.com/?t=' + encodeURIComponent(movie_title), function(err, res2, body) {
      		console.log('HTTParty yahooo!');
      		response.end(body);
    });

	};











});

server.listen(2000);