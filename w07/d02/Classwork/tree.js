var http = require('http');
var fs = require('fs');

var server = http.createServer(function(req, res){
	var path = req["url"];
	if (path=="/") {
		var file = fs.readFileSync("tree.html")
		res.end(file);
	};
});

server.listen(2000);