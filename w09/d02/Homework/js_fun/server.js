var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response){
	 var path = request["url"];
	 if path == "/" {
	 	response.end(fs.readFileSync(__dirname + 'index.html'));
	 } else if (path == "/another.js") {
	 	response.end(fs.readFileSync(__dirname + 'scripts.js'));
	 }
})

server.listen(2000);