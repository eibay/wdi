var fs = require('fs');
var http = require('http');

var server = http.createServer(function(req, res){

	var path = req["url"];

	if (path == '/') {
		var html = fs.readFileSync('./tree.html');
		res.end(html);
	}
});

server.listen(2000);