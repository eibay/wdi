var http = require("http")
var fs = require("fs")

var server = http.createServer(function(request, response){
console.log("Connection with client has been made");

var path = request["url"];

console.log("client is attempting to reach" + path)

if (path == "/") {
	var html = fs.readFileSync('/Users/Trish/dev/wdi/rosencrantz/w06/d04/Classwork/node_http/index.html');
	response.end(html);} 
else {
	response.end("Error 404. Page does not exist");
} 
});
server.listen(2000);
