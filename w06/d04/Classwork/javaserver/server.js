var http = require('http');
var fs = require('fs');
var html = fs.readFileSync('./index.html');
var css = fs.readFileSync('./styles.css')
var server = http.createServer(function(request, response){
	var path = request["url"]

	debugger
	console.log("Connection from client has been made")
	if (path == "/") {
response.end(html)
} else {
	response.end("ERROR")
}
});

server.listen(2000);