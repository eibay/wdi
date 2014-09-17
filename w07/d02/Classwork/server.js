

// require in ruby attaches to the scope of the object

// in js you need to save it to variable to hold onto it

var http = require('http');
var fs = require('fs');

var server = http.createServer(function(request, response) {
	response.end('')
// debugger
	console.log("Connection from client has been made")



server.listen(2000);

